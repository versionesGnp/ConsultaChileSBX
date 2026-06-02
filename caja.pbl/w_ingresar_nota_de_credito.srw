forward
global type w_ingresar_nota_de_credito from window
end type
type dw_detalle_factura from datawindow within w_ingresar_nota_de_credito
end type
type sle_1 from uo_convierte_numero within w_ingresar_nota_de_credito
end type
type dw_factura from datawindow within w_ingresar_nota_de_credito
end type
type cb_ctacte from commandbutton within w_ingresar_nota_de_credito
end type
type cb_limpiar from commandbutton within w_ingresar_nota_de_credito
end type
type cb_grabar from commandbutton within w_ingresar_nota_de_credito
end type
type st_6 from statictext within w_ingresar_nota_de_credito
end type
type dw_nota_credito from datawindow within w_ingresar_nota_de_credito
end type
type cb_generar from commandbutton within w_ingresar_nota_de_credito
end type
type pb_eliminar from picturebutton within w_ingresar_nota_de_credito
end type
type pb_insertar from picturebutton within w_ingresar_nota_de_credito
end type
type dw_destino from datawindow within w_ingresar_nota_de_credito
end type
type rb_comprobante from radiobutton within w_ingresar_nota_de_credito
end type
type rb_contrato from radiobutton within w_ingresar_nota_de_credito
end type
type st_5 from statictext within w_ingresar_nota_de_credito
end type
type st_1 from statictext within w_ingresar_nota_de_credito
end type
type em_folio from editmask within w_ingresar_nota_de_credito
end type
type ddlb_tipo_cob from dropdownlistbox within w_ingresar_nota_de_credito
end type
type cb_cerrar from commandbutton within w_ingresar_nota_de_credito
end type
type dw_lista from datawindow within w_ingresar_nota_de_credito
end type
type pb_procesar from picturebutton within w_ingresar_nota_de_credito
end type
type em_numero from editmask within w_ingresar_nota_de_credito
end type
type st_4 from statictext within w_ingresar_nota_de_credito
end type
type st_3 from statictext within w_ingresar_nota_de_credito
end type
type st_2 from statictext within w_ingresar_nota_de_credito
end type
type ddlb_base from dropdownlistbox within w_ingresar_nota_de_credito
end type
type gb_1 from groupbox within w_ingresar_nota_de_credito
end type
type ddlb_serie from dropdownlistbox within w_ingresar_nota_de_credito
end type
type gb_2 from groupbox within w_ingresar_nota_de_credito
end type
type gb_3 from groupbox within w_ingresar_nota_de_credito
end type
end forward

global type w_ingresar_nota_de_credito from window
integer width = 2798
integer height = 1912
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
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
global w_ingresar_nota_de_credito w_ingresar_nota_de_credito

type variables
string		is_opcion,is_nota_credito
Long		il_row,il_row_destino
Real		idb_iva
end variables

forward prototypes
public subroutine wf_cargar_nota_credito ()
end prototypes

public subroutine wf_cargar_nota_credito ();Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_total_neto,ll_total_iva,&
			ll_suma_total,ll_corre,ll_sub_total,ll_total_exento,ll_folio_original,ll_folio_nc,ll_mora,ll_gasto_cob
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_tipo_codigo,ls_rut_empresa,ls_monto_desc,&
			ls_anula_doc,ls_tipo_doc,ls_tipo_mov,ls_tipo_cob_ori
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fecha_pago,ldt_fec_pago_original
SaveAsType TipoArchivo

dw_factura.reset()
ll_folio_nc				= dw_nota_credito.getitemnumber(1,'folio')

if ll_folio_nc > 0 then
	ls_indica_serv		= '3'
	ldt_fecha_pago		= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ls_tipo_cob_ori		= dw_detalle_factura.getitemstring(1,'tipo_cob')
	SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT"
	INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant
	FROM 	"CADENA",	"CADENA_MORA"  
	WHERE ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			  (("CADENA"."CODIGO" = :gs_base ) AND  
			  ( "CADENA"."SERIE" = :gs_serie ) AND  
			  ( "CADENA"."NUMERO" = :gi_numero ) )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		SELECT	"CLIENTE_REZAGO"."COD_PAGO"  
		INTO		:ll_cod_parque  
		FROM		"CLIENTE_REZAGO"  
		WHERE ( "CLIENTE_REZAGO"."BASE" = :gs_base ) AND  
				  ( "CLIENTE_REZAGO"."SERIE" = :gs_serie ) AND  
				  ( "CLIENTE_REZAGO"."NUMERO" = :gi_numero ) AND  
				  ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob_ori ) AND  
				  ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio_nc ) AND  
				  ( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago )   ;
	end if
	//SELECT		"TCP_IP_PARQUE"."COD_PARQUE"  
	//INTO 			:ll_cod_parque  
	//FROM 		"TCP_IP_PARQUE"  
	//WHERE 		"TCP_IP_PARQUE"."TCP_IP" = :gs_tcp_ip   ;
	//
	//if mid(gs_tcp_ip,1,5)='50.50' then ll_cod_parque = 1
	SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT"
	INTO 		:ls_direc_origen,								:ls_comuna_origen,						:ls_ciudad_origen,							:ls_rut_empresa
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
	ls_direc_origen			= UPPER(trim(ls_direc_origen))
	if len(ls_direc_origen) > 70 then
		ls_direc_origen		= mid(ls_direc_origen,1,70)
	end if
	ls_comuna_origen		= UPPER(ls_comuna_origen)
	ls_ciudad_origen		= UPPER(ls_ciudad_origen)
	
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
		if isnull(ls_fono_part) or ls_fono_part='-' or ls_fono_part='*' or len(ls_fono_part)=0 then
			ls_fono_part	= ''
		end if
		if ls_celular <> '' and ls_fono_part <> '' then
			ls_contacto	= 'CELULAR: '+ls_celular+' - FONO PARTICULAR: '+ls_fono_part
		elseif ls_celular <> '' and ls_fono_part = '' then
			ls_contacto	= 'CELULAR: '+ls_celular
		elseif ls_celular = '' and ls_fono_part <> '' then
			ls_contacto	= 'FONO PARTICULAR: '+ls_fono_part
		elseif ls_fono_part = '' and ls_celular = '' then
			ls_contacto	= ''
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
	ls_tipo_dte			= '061'
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
	
	if ls_tipo_cob_ori='BL' or ls_tipo_cob_ori='FE' then
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
	
	ll_new_reg						= dw_factura.insertrow(0)
	ls_string_boleta				= '<DETALLE>'
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg						= dw_factura.insertrow(0)
	ls_string_boleta				= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Cantidad | Precio Unitario Item | Monto Item'
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_tot_reg						= dw_detalle_factura.rowcount()
	if ll_tot_reg>0 then
		ll_corre						= 0
		for ll_indi=1 to ll_tot_reg
			ll_corre ++
			ls_tipo_mov				= dw_detalle_factura.getitemstring(ll_indi,'tipo_mov')
			if ls_tipo_mov <> 'S' then//
				ls_tipo_cob_otro	= dw_detalle_factura.getitemstring(ll_indi,'codigo_otro')
				ll_cantidad			= dw_detalle_factura.getitemnumber(ll_indi,'cuotas_pag')
				ll_monto				= round(dw_detalle_factura.getitemnumber(ll_indi,'c_monto_neto'),2)
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
				WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
				USING		sqlca;
		
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
				if ls_tipo_cob = 'L' then
					ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)
				else
					ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)
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
			ll_monto				= round(dw_detalle_factura.getitemnumber(ll_reg,'monto'),2)
			ll_total				= round(dw_detalle_factura.getitemnumber(ll_reg,'c_total_linea'),2)
			ll_mora				= ll_monto
			if ll_mora > 0 then
				ll_corre ++
				ls_tipo_mov				= 'G'
				ls_descrip_cobro		= 'MORA'
				ll_cantidad				= 1
				ls_monto_desc			= '0'
				ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_monto)
				ll_new_reg				= dw_factura.insertrow(0)
				dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			end if
		end if
		ll_reg						= dw_detalle_factura.Find("tipo_mov = 'J' ", 1, ll_tot_reg)	//
		if ll_reg > 0 then
			ll_cantidad			= dw_detalle_factura.getitemnumber(ll_reg,'cuotas_pag')
			ll_monto				= round(dw_detalle_factura.getitemnumber(ll_reg,'monto'),2)
			ll_total				= round(dw_detalle_factura.getitemnumber(ll_reg,'c_total_linea'),2)
			ll_gasto_cob			= ll_monto
			if ll_gasto_cob > 0 then
				ll_corre ++
				ls_tipo_mov				= 'J'
				ls_descrip_cobro		= 'GASTO COBRANZA'
				ll_cantidad				= 1
				ls_monto_desc			= '0'
				ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_mov+' | '+ls_descrip_cobro+' | '+ls_descrip_otro+' | '+string(ll_cantidad)+' | '+string(ll_gasto_cob)+' | '+string(ll_gasto_cob)
				ll_new_reg				= dw_factura.insertrow(0)
				dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			end if
		end if
		ll_reg								= dw_detalle_factura.Find("tipo_mov = 'L' or tipo_mov = 'S'", 1, ll_tot_reg)	//
		if ll_reg > 0 then
			Setnull(ll_corre)
			ll_corre						= 0
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= '<DESCUENTOS O RECARGOS>'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			ll_new_reg					= dw_factura.insertrow(0)
			ls_string_boleta			= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo'
			dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
			for ll_indi=1 to ll_tot_reg
				ls_tipo_mov				= dw_detalle_factura.getitemstring(ll_indi,'tipo_mov')
				if ls_tipo_mov = 'S' then
					ll_corre ++
					ls_tipo_cob_otro	= dw_detalle_factura.getitemstring(ll_indi,'codigo_otro')
					ll_cantidad			= dw_detalle_factura.getitemnumber(ll_indi,'cuotas_pag')
					ll_monto				= round(dw_detalle_factura.getitemnumber(ll_indi,'c_monto_neto'),2)
					ll_total				= round(dw_detalle_factura.getitemnumber(ll_indi,'c_monto_neto'),2)
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
					ls_string_boleta		= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_total)
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
		if ls_tipo_cob='CI' or ls_tipo_cob='CU' then
			ls_tipo_doc				= '38'
		elseif ls_tipo_cob='BE' then
			ls_tipo_doc				= '41'
		elseif ls_tipo_cob='BL' then
			ls_tipo_doc				= '30'
		elseif ls_tipo_cob='FE' then
			ls_tipo_doc				= '33'
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
		ls_nombre_archivo		= '\\50.50.50.235\InFud-la florida\'+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
//		ls_nombre_archivo		= 'C:\'+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
		TipoArchivo 					= Text!
		ll_res							= dw_factura.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
		If ll_res < 0  Then
			MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
		End If	
		UPDATE		"ELECTRONICA_FB_DETALLE"  
		SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
						"RUT" = :gi_rut,   
						"ESTADO_REG" = 'G',   
						"DV" = :ls_dv,   
						"NOMBRE" = :ls_nom,   
						"AP_PATERNO" = :ls_ap_pat,   
						"AP_MATERNO" = :ls_ap_mat,   
						"NETO_AFECTO" = 0,   
						"NETO_EXENTO" = :gd_total,   
						"IVA" = 0,   
						"TOTAL" = :gd_total,   
						"USUARIO_CREA" = :gs_user,   
						"BASE" = :gs_base,   
						"SERIE" = :gs_serie,   
						"NUMERO" = :gi_numero,
						"COD_CAJA" = :gs_caja
		WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = (	SELECT 	  "ELECTRONICA_FB"."GRUPO"
																				FROM 	  "ELECTRONICA_FB" 
																				WHERE 	( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND 
																							( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) ) ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
					  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio ) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if 
	end if
end if
end subroutine

on w_ingresar_nota_de_credito.create
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
this.Control[]={this.dw_detalle_factura,&
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

on w_ingresar_nota_de_credito.destroy
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

event open;String	ls_base,ls_tipo_cob
gf_centrar(w_ingresar_nota_de_credito)
is_opcion					= Message.StringParm
SELECT	"TASA"."IVA"  INTO :idb_iva  FROM 	"TASA"  WHERE "TASA"."LOOK" = 1;
if is_opcion='A' then
	is_nota_credito		= 'NB'
	this.title				= 'Nota de Crédito Administradora (N.B.)'
	gs_tipo_cobro		= 'NB'
else
	is_nota_credito		= 'NC'
	this.title				= 'Nota de Crédito Inmobiliaria (N.C.)'
	gs_tipo_cobro		= 'NC'
end if
dw_factura.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_destino.settransobject(sqlca)
dw_nota_credito.settransobject(sqlca)
dw_detalle_factura.settransobject(sqlca)
ddlb_base.enabled			= false
ddlb_serie.enabled		= false
em_numero.enabled		= false
ddlb_tipo_cob.enabled	= false
em_folio.enabled			= false
dw_nota_credito.visible	= false
st_6.visible					= false
cb_grabar.visible			= false
dw_lista.height				= 1172
dw_destino.height			= 1172
ddlb_base.reset()
ddlb_tipo_cob.reset()
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
rb_contrato.checked		= true
rb_contrato.triggerevent(clicked!)
end event

type dw_detalle_factura from datawindow within w_ingresar_nota_de_credito
boolean visible = false
integer x = 2853
integer y = 464
integer width = 1015
integer height = 1028
integer taborder = 80
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

event dragdrop;String		ls_tipo_cob,ls_tipo_mov,ls_tipo_cob_aux,ls_tipo_mov_aux,ls_base,ls_serie,&
			ls_tipo_cob_nc,ls_cod_otro
Long		ll_folio,ll_monto,ll_cuotas_pag,ll_tot_reg,ll_indi,ll_folio_aux,ll_monto_aux,&
			ll_cuotas_pag_aux,ll_new,ll_sw=0,ll_folio_nc
Datetime	ldt_fecha_pago,ldt_fecha_pago_aux
Double	ll_numero
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

type sle_1 from uo_convierte_numero within w_ingresar_nota_de_credito
boolean visible = false
integer x = 1778
integer y = 1924
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type dw_factura from datawindow within w_ingresar_nota_de_credito
boolean visible = false
integer x = 992
integer y = 1904
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_factura_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ctacte from commandbutton within w_ingresar_nota_de_credito
integer x = 1353
integer y = 1684
integer width = 430
integer height = 96
integer taborder = 120
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

type cb_limpiar from commandbutton within w_ingresar_nota_de_credito
integer x = 1874
integer y = 1684
integer width = 270
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_base,ls_tipo_cob

dw_lista.reset()
dw_destino.reset()
dw_detalle_factura.reset()
dw_nota_credito.reset()
ddlb_base.reset()
ddlb_tipo_cob.reset()
dw_lista.height			= 1172
dw_destino.height			= 1172
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
DECLARE	x2 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
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
	em_folio.text			= ''
end if
close x2;
ddlb_base.enabled			= false
ddlb_serie.enabled		= false
em_numero.enabled			= false
ddlb_tipo_cob.enabled	= false
em_folio.enabled			= false
dw_nota_credito.visible	= false
st_6.visible				= false
cb_grabar.visible			= false
rb_contrato.checked		= false
rb_comprobante.checked	= false
end event

type cb_grabar from commandbutton within w_ingresar_nota_de_credito
integer x = 818
integer y = 1684
integer width = 443
integer height = 96
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar N.C."
end type

event clicked;Long		ll_folio,ll_monto,ll_ctas_pag,ll_sum,ll_graba1=0,ll_graba2=0,ll_graba3=0,ll_graba4=0,&
			ll_suma_total,ll_tot_reg,ll_indi,ll_folio_mod,ll_monto_mod,ll_cuotas_pag,&
			ll_sw=0,ll_sumar_cuotas_mant=0,ll_sumar_cuotas_cred=0,ll_total_pagado,ll_ctas_pag_s,&
			ll_ctas_pag_m,ll_ctas_cred,ll_ctas_mant,ll_resta_monto,ll_folio_nc,ll_sumar_monto_mant,&
			ll_sumar_monto_cred,ll_total_pagado_m,ll_monto_cred,ll_monto_mant
Datetime	ldt_fecha_pago,ldt_fecha_pago_mod
String		ls_tipo_cob,ls_tipo_mov,ls_base,ls_serie,ls_tipo_nc
Double	ll_numero

if dw_nota_credito.rowcount()>0 then
	ll_folio			= dw_nota_credito.getitemnumber(1,'folio')
	ll_monto			= dw_nota_credito.getitemnumber(1,'monto')
	ldt_fecha_pago	= dw_nota_credito.getitemdatetime(1,'fecha_pago')
	ll_ctas_pag		= dw_nota_credito.getitemnumber(1,'cuotas_pag')
	ll_suma_total	= dw_destino.getitemnumber(1,'suma_total')
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
	else
		if isnull(dw_nota_credito.getitemstring(1,'codigo_otro')) then
			dw_nota_credito.setitem(1,'codigo_otro','0')
		end if
		dw_nota_credito.accepttext()
		ll_graba1							= dw_nota_credito.update()
		ll_tot_reg						= dw_destino.rowcount()
		if ll_tot_reg>0 then
			ls_tipo_nc					= dw_nota_credito.getitemstring(1,'tipo_cob')
			ll_folio_nc					= dw_nota_credito.getitemnumber(1,'folio')
			for ll_indi=1 to ll_tot_reg
				dw_destino.Setitem(ll_indi,'tipo_cob_original',ls_tipo_nc)
				dw_destino.Setitem(ll_indi,'folio_original',ll_folio_nc)
				ls_tipo_cob				= dw_destino.getitemstring(ll_indi,'tipo_cob')
				ll_folio_mod				= dw_destino.getitemnumber(ll_indi,'folio')
				ldt_fecha_pago_mod	= dw_destino.getitemdatetime(ll_indi,'fecha_pago')
				ls_tipo_mov				= dw_destino.getitemstring(ll_indi,'tipo_mov')
				ll_monto_mod			= dw_destino.getitemnumber(ll_indi,'monto')
				ll_cuotas_pag			= dw_destino.getitemnumber(ll_indi,'cuotas_pag')
				ll_numero				= dw_destino.getitemnumber(ll_indi,'numero')
//				if ls_tipo_mov='E' then
//					ll_sum				= ll_sum + ll_ctas_pag
//				end if
				UPDATE	"INGRESO"  
				SET 		"PAGO_HIST" = 'N'  ,
							"CTAS_PAG_CTTO" = 0
				WHERE  ( "INGRESO"."FOLIO" = :ll_folio_mod ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
						 ( "INGRESO"."TIPO_MOV" = :ls_tipo_mov ) AND  
						 ( "INGRESO"."MONTO" = :ll_monto_mod ) AND  
						 ( "INGRESO"."CUOTAS_PAG" = :ll_cuotas_pag ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					UPDATE	"INGRE"  
					SET 		"PAGO_HIST" = 'N'  
					WHERE  ( "INGRE"."FOLIO" = :ll_folio_mod ) AND  
							 ( "INGRE"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRE"."FECHA_PAGO" = :ldt_fecha_pago_mod ) AND  
							 ( "INGRE"."TIPO_MOV" = :ls_tipo_mov ) AND  
							 ( "INGRE"."MONTO" = :ll_monto_mod ) AND  
							 ( "INGRE"."CUOTAS_PAG" = :ll_cuotas_pag ) AND  
							 ( "INGRE"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then	ll_sw ++
				end if
			next
			if ll_sw=ll_tot_reg then ll_graba2=1
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
					if (is_nota_credito='NC' and ls_tipo_mov='E') or (is_nota_credito='NC' and ls_tipo_mov='A') or &
						(is_nota_credito='NC' and ls_tipo_mov='K') or (is_nota_credito='NB' and ls_tipo_mov='E' and ls_base='R') then
						ll_sumar_cuotas_cred 	= ll_sumar_cuotas_cred + ll_cuotas_pag
						ll_sumar_monto_cred		= ll_sumar_monto_cred + ll_monto_mod
					end if
					if (is_nota_credito='NB' and ls_tipo_mov='F') then
						ll_sumar_cuotas_mant 	= ll_sumar_cuotas_mant + ll_cuotas_pag
						ll_sumar_monto_mant	= ll_sumar_monto_mant + ll_monto_mod
					end if
					if (is_nota_credito='NC' and ls_tipo_mov='F') then
						ll_sumar_cuotas_mant 	= ll_sumar_cuotas_mant + ll_cuotas_pag
						ll_sumar_monto_mant	= ll_sumar_monto_mant + ll_monto_mod
					end if
				end if
			next
			if isnull(ll_sumar_cuotas_cred) then ll_sumar_cuotas_cred=0
			if isnull(ll_sumar_cuotas_mant) then ll_sumar_cuotas_mant=0
			if isnull(ll_sumar_monto_cred) then ll_sumar_monto_cred=0
			if isnull(ll_sumar_monto_mant) then ll_sumar_monto_mant=0
			if (ll_sumar_monto_mant + ll_sumar_monto_cred) = 0 then ll_suma_total=0
			dw_nota_credito.setitem(1,'cuotas_pag',(ll_sumar_cuotas_cred + ll_sumar_cuotas_mant))
			dw_nota_credito.accepttext()
			if rb_contrato.checked=true then
				ls_base		= trim(ddlb_base.text)
				ls_serie		= trim(ddlb_serie.text)
				ll_numero	= Double(em_numero.text)
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
						FROM 		"OFERTA_V",   
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
									if ll_sumar_cuotas_cred >= 0 then 
										ll_ctas_cred 	= ll_ctas_pag_s - ll_sumar_cuotas_cred
										ll_monto_cred	= ll_total_pagado - ll_sumar_monto_cred
										if ll_ctas_cred<=0 then ll_ctas_cred=0
										if ll_monto_cred<=0 then ll_monto_cred=0
									else
										ll_ctas_cred 	= ll_ctas_pag_s
										ll_monto_cred	= ll_total_pagado
									end if
									if ll_sumar_cuotas_mant >= 0 then 
										ll_ctas_mant 	= ll_ctas_pag_m - ll_sumar_cuotas_mant
										ll_monto_mant	= ll_total_pagado_m - ll_sumar_monto_mant
										if ll_ctas_mant<=0 then ll_ctas_mant=0
										if ll_monto_mant<=0 then ll_monto_mant=0
									else
										ll_ctas_mant 	= ll_ctas_pag_m
										ll_monto_mant	= ll_total_pagado_m
									end if
									if ll_ctas_cred>0 and ll_ctas_mant>0 then
										UPDATE	"OFERTA_V"  
										SET		"TOT_PAGADO" = :ll_monto_cred,   
													"TOT_PAGADO_M" = :ll_monto_mant,
													"CTA_PAG_S" = :ll_ctas_cred,   
													"CTA_PAG_M" = :ll_ctas_mant  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
									elseif ll_ctas_cred>0 and ll_ctas_mant=0 then
										UPDATE	"OFERTA_V"  
										SET		"TOT_PAGADO" = :ll_monto_cred,   
													"CTA_PAG_S" = :ll_ctas_cred   
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
									elseif ll_ctas_cred=0 and ll_ctas_mant>0 then
										UPDATE	"OFERTA_V"  
										SET		"TOT_PAGADO_M" = :ll_monto_mant,   
													"CTA_PAG_M" = :ll_ctas_mant  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
									elseif ll_ctas_cred=0 and ll_ctas_mant=0 then
										UPDATE	"OFERTA_V"  
										SET		"TOT_PAGADO" = :ll_monto_cred,   
													"TOT_PAGADO_M" = :ll_monto_mant,
													"CTA_PAG_S" = :ll_ctas_cred,   
													"CTA_PAG_M" = :ll_ctas_mant  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
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
										if ll_ctas_mant <= 0 then ll_ctas_mant = 0
									else
										ll_ctas_mant = ll_ctas_pag_m
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
				ll_folio		= long(trim(em_folio.text))
				UPDATE	"INGRESO"  
				SET 		"REZAGO" = ' '  
				WHERE  ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob )   
				USING		SQLCA;
				if sqlca.sqlcode=0 then ll_graba3=1
			end if
		end if
		dw_destino.accepttext()
		ll_graba4	= dw_destino.update()
		if ll_graba1=1 and ll_graba2=1 and ll_graba3=1 and ll_graba4=1 then
			commit using sqlca;
//			wf_cargar_nota_credito()
			DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:ls_serie,:ll_numero,'M');
			EXECUTE sp_nuevo_cadena_mora;
			
			messagebox("Grabar","Grabación Exitosa")
			cb_limpiar.triggerevent(clicked!)
		else
			rollback using sqlca;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type st_6 from statictext within w_ingresar_nota_de_credito
integer x = 41
integer y = 1168
integer width = 850
integer height = 60
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

type dw_nota_credito from datawindow within w_ingresar_nota_de_credito
integer x = 32
integer y = 1248
integer width = 2702
integer height = 408
integer taborder = 90
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
		if is_opcion='A' then
			dw_nota_credito.setitem(ll_new,'tipo_cob','NB')
		else
			dw_nota_credito.setitem(ll_new,'tipo_cob','NC')
		end if
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

type cb_generar from commandbutton within w_ingresar_nota_de_credito
integer x = 32
integer y = 1684
integer width = 695
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generar Nota de Crédito"
end type

event clicked;Long		ll_new,ll_total,ll_suma_cuotas,ll_min_boleta,ll_grupo
Date		ld_fecha
if dw_destino.rowcount()>0 then
	ld_fecha							= date(fechasys)
	if cb_generar.text='Generar Nota de Crédito' then
		cb_generar.text			= 'No Mostrar Nota de Crédito'
		dw_nota_credito.visible	= true
		st_6.visible					= true
		cb_grabar.visible			= true
		ll_total						= dw_destino.getitemnumber(1,'suma_total')
		ll_suma_cuotas				= dw_destino.getitemnumber(1,'suma_cuotas')
		dw_nota_credito.reset()
		ll_new	= dw_nota_credito.insertrow(0)
		if is_opcion='A' then
			dw_nota_credito.setitem(ll_new,'tipo_cob','NB')
		else
			dw_nota_credito.setitem(ll_new,'tipo_cob','NC')
		end if
//		gs_tipo_cobro				= "NE"
//		dw_nota_credito.setitem(ll_new,'tipo_cob',gs_tipo_cobro)
		dw_nota_credito.setitem(ll_new,'cuotas_pag',ll_suma_cuotas)
		dw_nota_credito.setitem(ll_new,'fecha_pago',ld_fecha)
		dw_nota_credito.setitem(ll_new,'pago_hist','A')
		dw_nota_credito.setitem(ll_new,'cod_caja',gs_caja)
		dw_nota_credito.setitem(ll_new,'rezago',' ')
		dw_nota_credito.setitem(ll_new,'usuario',gs_user)
		dw_nota_credito.setitem(ll_new,'monto',ll_total)
		dw_nota_credito.setitem(ll_new,'tipo_mov','Z')
		if isnull(gs_base) or gs_base='' then gs_base='O'
		dw_nota_credito.setitem(ll_new,'base',gs_base)
		dw_nota_credito.setitem(ll_new,'rut',gi_rut)
		dw_nota_credito.setitem(ll_new,'serie',gs_serie)
		dw_nota_credito.setitem(ll_new,'contrato',gi_numero)
		dw_nota_credito.setitem(ll_new,'codigo_otro','0')
		dw_lista.height				= 668
		dw_destino.height			= 668
		dw_nota_credito.accepttext()
		dw_nota_credito.setfocus()
	else
		cb_generar.text			= 'Generar Nota de Crédito'
		dw_nota_credito.visible	= false
		st_6.visible					= false
		cb_grabar.visible			= false
		dw_nota_credito.reset()
		dw_lista.height				= 1172
		dw_destino.height			= 1172
	end if
//	gs_tipo_cobro					= "NE"
//	SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
//	INTO 		:ll_min_boleta
//	FROM 	"ELECTRONICA_FB",   
//				"ELECTRONICA_FB_DETALLE"  
//	WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
//			  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
//			  (("ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
//			  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND 
//			  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' ) )  
//	USING	sqlca;
//	if sqlca.sqlcode=0 then
//		gl_folio						= ll_min_boleta
//		SELECT	"ELECTRONICA_FB"."GRUPO"  
//		INTO 		:ll_grupo  
//		FROM 	"ELECTRONICA_FB"  
//		WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
//				  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
//		dw_nota_credito.setitem(1,'folio',ll_min_boleta)
//		dw_nota_credito.accepttext()
//	end if
end if
end event

type pb_eliminar from picturebutton within w_ingresar_nota_de_credito
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
Long		ll_folio,ll_folio_aux,ll_indi,ll_tot_reg

ll_tot_reg					= dw_destino.rowcount()
if il_row_destino>0 and ll_tot_reg>0 then
	ll_folio					= dw_destino.getitemnumber(il_row_destino,'folio')
	ls_tipo_cob				= dw_destino.getitemstring(il_row_destino,'tipo_cob')
	for ll_indi=1 to ll_tot_reg
		ll_folio_aux		= dw_destino.getitemnumber(ll_indi,'folio')
		ls_tipo_cob_aux	= dw_destino.getitemstring(ll_indi,'tipo_cob')
		if ll_folio=ll_folio_aux and ls_tipo_cob=ls_tipo_cob_aux then
			dw_destino.deleterow(ll_indi)
			ll_tot_reg		= ll_tot_reg - 1
			ll_indi			= ll_indi - 1
		end if
	next
	setnull(il_row_destino)
	dw_destino.accepttext()
end if
end event

type pb_insertar from picturebutton within w_ingresar_nota_de_credito
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

event clicked;String		ls_tipo_cob,ls_tipo_mov,ls_tipo_cob_aux,ls_tipo_mov_aux,ls_base,ls_serie,ls_tipo_cob_nc,ls_cod_otro
Long		ll_folio,ll_monto,ll_cuotas_pag,ll_tot_reg,ll_indi,ll_folio_aux,ll_monto_aux,&
			ll_cuotas_pag_aux,ll_new,ll_sw=0,ll_folio_nc
Datetime	ldt_fecha_pago,ldt_fecha_pago_aux
Double	ll_numero

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
				ll_tot_reg		= dw_lista.rowcount()
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
						dw_destino.accepttext()
					end if
				next
			end if
		else
			ll_tot_reg					= dw_lista.rowcount()
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
					dw_destino.accepttext()
				end if
			next
		end if
	end if
	setnull(il_row)
end if
end event

type dw_destino from datawindow within w_ingresar_nota_de_credito
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

event dragdrop;String		ls_tipo_cob,ls_tipo_mov,ls_tipo_cob_aux,ls_tipo_mov_aux,ls_base,ls_serie,&
			ls_tipo_cob_nc,ls_cod_otro
Long		ll_folio,ll_monto,ll_cuotas_pag,ll_tot_reg,ll_indi,ll_folio_aux,ll_monto_aux,&
			ll_cuotas_pag_aux,ll_new,ll_sw=0,ll_folio_nc,ll_new_det
Datetime	ldt_fecha_pago,ldt_fecha_pago_aux
Double	ll_numero
Datawindow control_dw

dw_destino.reset()
dw_detalle_factura.reset()
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
				for ll_indi=1 to ll_tot_reg
					ls_tipo_cob_aux		= dw_lista.getitemstring(ll_indi,'tipo_cob')
					ll_folio_aux				= dw_lista.getitemnumber(ll_indi,'folio')
					if ls_tipo_cob_aux		=ls_tipo_cob and ll_folio_aux=ll_folio then
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
			end if
		else
			ll_tot_reg					= dw_lista.rowcount()
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
		end if
	end if
	setnull(il_row)
end if
end event

type rb_comprobante from radiobutton within w_ingresar_nota_de_credito
integer x = 1065
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
	messagebox("Advertencia","Recuerda esta Opción es solo Pagos en REZAGO")
	dw_destino.reset()
	ddlb_base.reset()
	ddlb_serie.reset()
	ddlb_tipo_cob.reset()
	em_numero.text				= ''
	ddlb_base.enabled			= false
	ddlb_serie.enabled		= false
	em_numero.enabled			= false
	ddlb_tipo_cob.enabled	= true
	em_folio.enabled			= true
	dw_lista.dataobject		= 'dw_lista_para_asignar_nota_credito_folio'
	dw_lista.settransobject(sqlca)
	ddlb_tipo_cob.reset()
	DECLARE	x2 CURSOR FOR  
	SELECT 	"COD_PAGO"."TIPO_COB"  
	FROM 		"COD_PAGO"  
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

type rb_contrato from radiobutton within w_ingresar_nota_de_credito
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
	ddlb_base.enabled			= true
	ddlb_serie.enabled		= true
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

type st_5 from statictext within w_ingresar_nota_de_credito
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

type st_1 from statictext within w_ingresar_nota_de_credito
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

type em_folio from editmask within w_ingresar_nota_de_credito
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

type ddlb_tipo_cob from dropdownlistbox within w_ingresar_nota_de_credito
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

type cb_cerrar from commandbutton within w_ingresar_nota_de_credito
integer x = 2418
integer y = 1684
integer width = 311
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingresar_nota_de_credito)
end event

type dw_lista from datawindow within w_ingresar_nota_de_credito
integer x = 32
integer y = 480
integer width = 1458
integer height = 668
integer taborder = 70
string dragicon = "Query5!"
string title = "none"
string dataobject = "dw_lista_para_asignar_nota_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gi_rut		= this.getitemnumber(il_row,'rut')
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
Long		ll_folio,ll_folio_aux,ll_indi,ll_tot_reg
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
			ll_tot_reg		= ll_tot_reg - 1
			ll_indi				= ll_indi - 1
		end if
	next
	setnull(il_row_destino)
	dw_destino.accepttext()
end if
end event

type pb_procesar from picturebutton within w_ingresar_nota_de_credito
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

type em_numero from editmask within w_ingresar_nota_de_credito
integer x = 1042
integer y = 296
integer width = 347
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
string mask = "###,###,###,###,###"
end type

event modified;String	ls_base,ls_serie
Double		ll_numero
ls_base		= trim(ddlb_base.text)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
	ls_serie<>'' and ll_numero>0 then
	dw_lista.reset()
	dw_destino.reset()
	pb_procesar.triggerevent(clicked!)
end if

end event

type st_4 from statictext within w_ingresar_nota_de_credito
integer x = 832
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

type st_3 from statictext within w_ingresar_nota_de_credito
integer x = 439
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

type st_2 from statictext within w_ingresar_nota_de_credito
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

type ddlb_base from dropdownlistbox within w_ingresar_nota_de_credito
integer x = 197
integer y = 296
integer width = 229
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

type gb_1 from groupbox within w_ingresar_nota_de_credito
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

type ddlb_serie from dropdownlistbox within w_ingresar_nota_de_credito
integer x = 585
integer y = 296
integer width = 229
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

type gb_2 from groupbox within w_ingresar_nota_de_credito
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

type gb_3 from groupbox within w_ingresar_nota_de_credito
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

