forward
global type cons_comp_ing_w from window
end type
type dw_print_nc from datawindow within cons_comp_ing_w
end type
type cb_print_nc from commandbutton within cons_comp_ing_w
end type
type dw_impresion from datawindow within cons_comp_ing_w
end type
type cb_impresion from commandbutton within cons_comp_ing_w
end type
type dw_detalle_factura from datawindow within cons_comp_ing_w
end type
type dw_factura from datawindow within cons_comp_ing_w
end type
type sle_1 from uo_convierte_numero within cons_comp_ing_w
end type
type dw_boleta from datawindow within cons_comp_ing_w
end type
type cb_boleta from commandbutton within cons_comp_ing_w
end type
type cb_det_cup from commandbutton within cons_comp_ing_w
end type
type pb_proceso from picturebutton within cons_comp_ing_w
end type
type cb_ctacte from commandbutton within cons_comp_ing_w
end type
type dw_print from datawindow within cons_comp_ing_w
end type
type cb_1 from commandbutton within cons_comp_ing_w
end type
type cb_imprimir from commandbutton within cons_comp_ing_w
end type
type st_4 from statictext within cons_comp_ing_w
end type
type ddlb_1 from dropdownlistbox within cons_comp_ing_w
end type
type dw_2 from datawindow within cons_comp_ing_w
end type
type st_3 from statictext within cons_comp_ing_w
end type
type st_2 from statictext within cons_comp_ing_w
end type
type em_folio from editmask within cons_comp_ing_w
end type
type st_1 from statictext within cons_comp_ing_w
end type
type cb_2 from commandbutton within cons_comp_ing_w
end type
type dw_cliente_rezago from datawindow within cons_comp_ing_w
end type
type dw_cliente from datawindow within cons_comp_ing_w
end type
type dw_1 from datawindow within cons_comp_ing_w
end type
type st_5 from statictext within cons_comp_ing_w
end type
end forward

global type cons_comp_ing_w from window
integer x = 50
integer y = 92
integer width = 2825
integer height = 2296
boolean titlebar = true
string title = "Consulta Comprobante"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_print_nc dw_print_nc
cb_print_nc cb_print_nc
dw_impresion dw_impresion
cb_impresion cb_impresion
dw_detalle_factura dw_detalle_factura
dw_factura dw_factura
sle_1 sle_1
dw_boleta dw_boleta
cb_boleta cb_boleta
cb_det_cup cb_det_cup
pb_proceso pb_proceso
cb_ctacte cb_ctacte
dw_print dw_print
cb_1 cb_1
cb_imprimir cb_imprimir
st_4 st_4
ddlb_1 ddlb_1
dw_2 dw_2
st_3 st_3
st_2 st_2
em_folio em_folio
st_1 st_1
cb_2 cb_2
dw_cliente_rezago dw_cliente_rezago
dw_cliente dw_cliente
dw_1 dw_1
st_5 st_5
end type
global cons_comp_ing_w cons_comp_ing_w

forward prototypes
public subroutine wf_rehacer_boleta_electronica (double abd_uf, string as_caja)
public subroutine wf_rehacer_nota_credito (double abd_uf, string as_caja)
end prototypes

public subroutine wf_rehacer_boleta_electronica (double abd_uf, string as_caja);Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_mora,ll_gasto_cob,ll_corre,&
			ls_sum_monto,ll_count_reg,ll_min_boleta,ll_grupo,ll_otros,ll_cod_seguro,ll_total_neto,ll_pos,ll_cero=0,ll_sumar_todo,ll_sum_dscto,&
			ll_total_iva,ll_suma_total,ll_sub_total,ll_rut_rez,ll_cupon,ll_con_paga,ll_vuelto,ll_efectivo,ll_mora_mant,ll_gasto_mant,ll_rut,ll_plazo,ll_can_cta_pag,ll_cta_pag_cred,&
			ll_count_cred,ll_count_mant,ll_linea
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_rut_empresa,ls_monto_desc,ls_tipo_codigo,ls_cod_pago,&
			ls_cuota,ls_moneda_ctto,ls_base_rezago,ls_serie_rezago,ls_nombre_rez,ls_ap_pat_rez,ls_ap_mat_rez,ls_ciudad_rez,ls_comuna_rez,ls_direc_rez,&
			ls_nom_comp_rez,ls_nom_rez,ls_ruta_elect,ls_dv_rez,ls_tip_cob,ls_moneda,ls_con_paga,ls_vuelto,ls_efectivo,ls_tcom1,ls_base,ls_serie,ls_cuota_mant,ls_paga_con
Double	ldb_prima,ldb_iva_factura,ll_monto_uf,ldb_prima_uf,ll_numero_rezago,ll_monto_total
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant, ldt_fecha_pago
date		ld_fecha_venc
long		ll_numero,ll_folio
SaveAsType TipoArchivo

SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
dw_boleta.reset()
ls_indica_serv		= '3'
//ldt_fecha_pago		= datetime(date(st_fecha_pago.text),time('00:00:00'))
ldt_fecha_pago		= datetime(dw_1.getitemdatetime(1,'ingreso_fecha_pago'))
ls_base				= dw_1.getitemstring(1,'ingreso_base')
ls_serie				= dw_1.getitemstring(1,'ingreso_serie')
ll_numero			= dw_1.getitemnumber(1,'ingreso_contrato')
gl_folio				= Long(em_folio.text)
gs_base				= ls_base
gs_serie				= ls_serie
gi_numero			= ll_numero
abd_uf				= dw_1.getitemnumber(1,'ingreso_valor_uf')
ls_tcom1				= mid(trim(ddlb_1.text),1,2)
gs_tipo_cobro		= ls_tcom1
ll_monto_total		= dw_1.getitemnumber(1,'c_total_monto')
gs_caja				= dw_1.getitemstring(1,'ingreso_cod_caja')

if dw_1.getitemstring(1,'ingreso_rezago')='S' then
	ls_base				= dw_cliente_rezago.getitemstring(1,'base')
	ls_serie				= dw_cliente_rezago.getitemstring(1,'serie')
	ll_numero			= dw_cliente_rezago.getitemnumber(1,'numero')
	gs_base				= ls_base
	gs_serie				= ls_serie
	gi_numero			= ll_numero
end if
SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT","CADENA"."RUT"
INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant,						:ll_rut				
FROM 	"CADENA",	"CADENA_MORA"  
WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
		  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
		  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
		  (("CADENA"."CODIGO" = :gs_base ) AND  
		  ( "CADENA"."SERIE" = :gs_serie ) AND  
		  ( "CADENA"."NUMERO" = :gi_numero ) )  
USING	sqlca;
if sqlca.sqlcode = 100 then
	ll_rut_rez				= dw_cliente_rezago.getitemnumber(1,'rut')
	ls_dv_rez				= dw_cliente_rezago.getitemstring(1,'dv')
	ll_cod_parque			= dw_cliente_rezago.getitemnumber(1,'cod_parque')
	ls_nombre_rez			= dw_cliente_rezago.getitemstring(1,'nombre')
	ls_ap_pat_rez			= dw_cliente_rezago.getitemstring(1,'ap_paterno')
	ls_ap_mat_rez			= dw_cliente_rezago.getitemstring(1,'ap_materno')
	ls_ciudad_rez			= dw_cliente_rezago.getitemstring(1,'ciudad_part')
	ls_comuna_rez			= dw_cliente_rezago.getitemstring(1,'comuna_part')
	ls_direc_rez				= dw_cliente_rezago.getitemstring(1,'direccion_part')
	
	ls_nom_comp_rez		= trim(ls_nombre_rez+' '+ls_ap_pat_rez+' '+ls_ap_mat_rez)
	if len(ls_nom_comp_rez) > 40 then
		ls_nom_comp_rez	= mid(ls_nom_comp_rez,1,40)
	end if
	if len(ls_direc_rez) > 70 then
		ls_direc_rez			= mid(ls_direc_rez,1,70)
	end if
	if len(ls_contacto) > 20 then
		ls_contacto	= mid(ls_contacto,1,20)
	end if
	ldt_fec_venc_cred		= datetime(date(gdt_fec_sistema),time('00:00:00'))
end if

gi_rut		= ll_rut

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
	if gs_rezago ='S' then
		ls_nom_comp	= ls_nom_comp_rez
	else
		ls_nom_comp	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
	end if
	ls_nom			= ls_nom_comp
	ls_nom_comp	= ls_nom_comp
	if len(ls_nom_comp) > 40 then
		ls_nom		= mid(ls_nom_comp,1,40)
	end if
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
	ll_pos					= Pos(gs_nombre_completo, 'Telé')
	if ll_pos > 0 then
		ls_nom			= trim(mid(gs_nombre_completo,1, (ll_pos - 1) ))
	else
		ls_nom			= trim(gs_nombre_completo)
	end if
	ls_dv					= gf_obtener_dv(gi_rut)
	ls_nom_comp	= ls_nom_comp_rez
	ls_nom			= ls_nom_comp
	ls_nom_comp	= ls_nom_comp
	if len(ls_nom_comp) > 40 then
		ls_nom_comp	= mid(ls_nom_comp,1,40)
	end if
	if len(ls_nom_comp) > 40 then
		ls_nom		= mid(ls_nom_comp,1,40)
	end if
	ls_direc_comp	= ls_direc_rez
	if len(ls_direc_comp) > 70 then
		ls_direc_comp	= mid(ls_direc_comp,1,70)
	end if
	if isnull(ls_ciudad_rez) then ls_ciudad_rez=''
	if isnull(ls_comuna_rez) then ls_comuna_rez=''
	ls_comuna			= ls_comuna_rez
	ls_ciudad				= ls_ciudad_rez
	ls_rut					= string(ll_rut_rez)+'-'+ls_dv_rez
end if
ls_tcom1			= mid(trim(ddlb_1.text),1,2)

SELECT 	"ELECTRONICA_FB_TIPO"."TIPO_DTE"  
INTO 		:ls_tipo_dte
FROM 	"ELECTRONICA_FB_TIPO"  
WHERE 	"ELECTRONICA_FB_TIPO"."TIPO_DOCUMENTO" = :ls_tcom1   ;

ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= '<ENCABEZADO>'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_tipo_dte) then ls_tipo_dte=''
ls_string_boleta	= 'Tipo DTE'+Space(22)+' | '+ls_tipo_dte
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Folio'+Space(25)+' | '+string(gl_folio)
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
//ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(st_fecha_pago.text),'dd-mm-yyyy')
ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(ldt_fecha_pago),'dd-mm-yyyy')
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_indica_serv) then ls_indica_serv=''
ls_string_boleta	= 'Indicador Servicio'+Space(12)+' | '+ls_indica_serv
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Fecha Vencimiento'+Space(13)+' | '+string(ldt_fec_venc_cred,'dd-mm-yyyy')
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_direc_origen) then ls_direc_origen=''
ls_string_boleta	= 'Direccion Origen'+Space(14)+' | '+ls_direc_origen
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_comuna_origen) then ls_comuna_origen=''
ls_string_boleta	= 'Comuna Origen'+Space(17)+' | '+ls_comuna_origen
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_ciudad_origen) then ls_ciudad_origen=''
ls_string_boleta	= 'Ciudad Origen'+Space(17)+' | '+ls_ciudad_origen
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Id. Adicional Receptor'+Space(8)+' | '+string(gi_rut)
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_rut) then ls_rut=''
ls_string_boleta	= 'Rut Receptor'+Space(18)+' | '+ls_rut
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
ls_string_boleta	= 'Codigo Interno Receptor'+Space(7)+' | '+string(gi_rut)
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_nom_comp) then ls_nom_comp=''
ls_string_boleta	= 'Razon Social Receptor'+Space(9)+' | '+ls_nom_comp
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_contacto) then ls_contacto='S/T'
ls_string_boleta	= 'Contacto Receptor'+Space(13)+' | '+ls_contacto
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg			= dw_boleta.insertrow(0)
if isnull(ls_direc_comp) then ls_direc_comp=''
	ls_string_boleta	= 'Direccion Receptor'+Space(12)+' | '+ls_direc_comp
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	if isnull(ls_comuna) then ls_comuna=''
	ls_string_boleta	= 'Comuna Receptor'+Space(15)+' | '+ls_comuna
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	if isnull(ls_ciudad) then ls_ciudad=''
	ls_string_boleta	= 'Ciudad Receptor'+Space(15)+' | '+ls_ciudad
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Neto'+Space(20)+' | '
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Exento'+Space(18)+' | '+string(ll_monto_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'IVA'+Space(27)+' | '
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Total'+Space(19)+' | '+string(ll_monto_total,'###########0')
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ls_tot_pag_pal		= sle_1.uo_convertir_numero(string(ll_monto_total))
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'Monto Escrito'+Space(16)+'  | '+ls_tot_pag_pal
	dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_new_reg			= dw_boleta.insertrow(0)
	CHOOSE CASE gs_base
		CASE 'O'	//Promesa
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1		= ''
			end if
		CASE 'R'	//Reprog.Mant
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1							= ''
			end if
		CASE 'L'	//Liberador
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1							= ''
			end if
		CASE 'F'	//Funeraria
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1							= ''
			end if
		CASE 'P'	//Pagare
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1							= ''
			end if
		CASE 'D'	// Derecho
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1							= ''
			end if
			
		CASE 'A'	// Aumento
			if dw_1.rowcount() > 0 then
				ls_obs_1		= '-' // parche hasta que todo lo demas ete ok
			else
				ls_obs_1							= ''
			end if
	END CHOOSE
if len(ls_obs_1) > 70 then
	ls_obs_1				= mid(ls_obs_1,1,70)
end if
ls_string_boleta		= 'Observaciones 1'+Space(14)+'  | '+ls_obs_1
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
SELECT "ELECTRONICA_FB_DETALLE"."IP_EQUIPO"
INTO 		:gs_tcp_ip
FROM 	"ELECTRONICA_FB_DETALLE"  
WHERE 	"ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro AND  
			"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio
USING 	Trans_1;

ls_string_boleta		= 'IP Equipo'+Space(20)+'  | '+gs_tcp_ip 
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'Direccion Emisor'+Space(13)+'  | '+'Estado 360 Piso 2'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'Comuna Emisor'+Space(16)+'  | '+'Santiago'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'Ciudad Emisor'+Space(16)+'  | '+'Santiago'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x Cuota Credito'+Space(14)+'  | '+ls_cuota
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x Cuota Mantencion'+Space(11)+'  | '+ls_cuota_mant
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
if gs_rezago='S' then
	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+ls_base_rezago+ls_serie_rezago+string(ll_numero_rezago)
else
	ls_string_boleta	= 'x Nro. Contrato'+Space(14)+'  | '+gs_base+gs_serie+string(gi_numero)
end if
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
if ll_efectivo=0 or isnull(ll_efectivo) then
	ll_efectivo			= 0
	ls_efectivo			= string(ll_efectivo,'###,###,###,##0')
else
	ls_efectivo			= string(ll_efectivo,'###,###,###,##0')
end if

if ll_con_paga=0 or isnull(ll_con_paga) then
	ll_con_paga			= 0
	ls_con_paga			= string(ll_con_paga,'###,###,###,##0')
else
	ls_con_paga			= string(ll_con_paga,'###,###,###,##0')
end if

if ll_vuelto=0 or isnull(ll_vuelto) then
	ll_vuelto				= 0
	ls_vuelto				= string(ll_vuelto,'###,###,###,##0')
else
	ls_vuelto				= string(ll_vuelto,'###,###,###,##0')
end if
if ll_efectivo > 0 then
	ls_paga_con			= ls_efectivo+' Paga con '+ls_con_paga+' Vuelto '+ls_vuelto
else
	ls_paga_con			= ''
end if
ls_string_boleta		= 'x Paga en Efectivo'+Space(11)+'  | '+ ls_paga_con
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x U.F. dia'+Space(19)+'  | '+string(abd_uf,'###,###,###,##0.0###')
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg				= dw_boleta.insertrow(0)
ls_string_boleta		= 'x Caja'+Space(23)+'  | '+gs_caja
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
if gs_tipo_cobro='CU' then
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'x Imprimir'+Space(19)+'  | '+'N'
else
	ll_new_reg			= dw_boleta.insertrow(0)
	ls_string_boleta	= 'x Imprimir'+Space(19)+'  | '+'S'
end if
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
if gs_tipo_cobro='CU' then
	ls_tip_cob	= 'BE'
else
	ls_tip_cob	= gs_tipo_cobro
end if
DECLARE 	x1 CURSOR FOR  
SELECT "DOCUMENTOS"."COD_PAGO",     sum("DOCUMENTOS"."MONTO"),     count("DOCUMENTOS"."COD_PAGO")  
FROM "DOCUMENTOS"  
WHERE ( "DOCUMENTOS"."FOLIO" = :gl_folio ) AND  
         ( "DOCUMENTOS"."TIPO_COB" = :ls_tip_cob ) AND  
         ( "DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha_pago )   
GROUP BY "DOCUMENTOS"."COD_PAGO"  
ORDER BY "DOCUMENTOS"."COD_PAGO" ASC   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	do while sqlca.sqlcode=0
		fetch x1 into :ls_cod_pago, :ls_sum_monto,	 :ll_count_reg;
		if not isnull(ls_cod_pago) then
			choose case ls_cod_pago
				case 'EF'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Efectivo'+Space(13)+'  | '+string(ls_sum_monto,'###,###,###,##0')	
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
				case 'CH'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Cheque'+Space(15)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					
				case 'TC'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Tarjeta Credito'+Space(6)+'  | '+string(ls_sum_monto,'###,###,###,##0')+' ('+string(ll_count_reg)+')'
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					
				case 'TD'
					ll_new_reg			= dw_boleta.insertrow(0)
					ls_string_boleta	= 'x Total Tarjeta Debito'+Space(7)+'  | '+string(ls_sum_monto,'###,###,###,##0')	
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			end choose
		end if
		Setnull(ls_cod_pago);Setnull(ls_sum_monto)
		dw_boleta.accepttext()
	loop
end if
close x1;
ll_new_reg						= dw_boleta.insertrow(0)
ls_string_boleta				= '<DETALLE>'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
ll_new_reg						= dw_boleta.insertrow(0)
ls_string_boleta				= 'Nro.Linea | Tipo codigo | Codigo del Item | Nombre del Item | Descripcion Adicional al Item | Cantidad | Precio Unitario Item | Monto Item | x Monto UF'
dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
	ll_tot_reg			= dw_1.rowcount()
	ll_corre				= 0
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg			
			ls_tipo_cob			= dw_1.getitemstring(ll_indi,'ingreso_tipo_mov')
			if ls_tipo_cob <> 'S' then 
				if ls_tipo_cob = 'L' then
					ls_tipo_cob_otro	= dw_1.getitemstring(ll_indi,'ingreso_codigo_otro')
				else
					ls_tipo_cob_otro	= dw_1.getitemstring(ll_indi,'cod_movi_des_ing')
				end if	
				ll_cantidad				= dw_1.getitemnumber(ll_indi,'ingreso_cuotas_pag')
				ll_monto				= dw_1.getitemnumber(ll_indi,'ingreso_monto')
				if ll_cantidad > 1 then
					ll_total		= ll_monto 
					ll_monto 		= round(ll_monto / ll_cantidad,0)
				elseif ll_cantidad = 1 then
					ll_total		= ll_monto
				else
					if ls_tipo_cob = '4' or  ls_tipo_cob = '6' then
						ll_linea = dw_1.Find("ingreso_tipo_mov = 'E'", 1, ll_tot_reg)
						if ll_linea > 0 then
							ll_cantidad	= dw_1.getitemnumber(ll_linea,'ingreso_cuotas_pag')
							ll_total		= ll_monto 
							ll_monto 		= round(ll_monto / ll_cantidad,0)
						end if
						setnull(ll_linea);
					else
						ll_total		= ll_monto
						ll_cantidad	= 1 // revisar
					end if	
				end if	
				if isnull(ll_total) then ll_total	= ll_monto
				ll_corre				= dw_1.getitemnumber(ll_indi,'item')
				SELECT		"TIPO_COBRO"."DESCRIPCION"  
				INTO 			:ls_descrip_cobro  
				FROM 		"TIPO_COBRO"  
				WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
							  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
				USING		sqlca;
		
				SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
				INTO 			:ls_descrip_otro  
				FROM 		"CUENTA_CONTABLE_OTROS"  
				WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
				USING		sqlca;

				ls_descrip_cobro		= UPPER(ls_descrip_cobro)
				ls_descrip_otro			= UPPER(ls_descrip_otro)
				if isnull(ls_tipo_cob) then ls_tipo_cob=''
				if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
				if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
				ll_monto_uf				= round(ll_monto / abd_uf,4)
				if ls_tipo_cob <> 'G' and ls_tipo_cob <> 'P' and ls_tipo_cob <> 'J' and ls_tipo_cob <> 'R' then
					if ls_tipo_cob = 'L' then
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_otro+' | '+ls_descrip_cobro+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					else
						ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					end if
					if not isnull(ls_string_boleta) then
						ll_new_reg			= dw_boleta.insertrow(0)
						dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					end if
				end if	
				if ls_tipo_cob = 'G' then
					ls_tipo_cob				= 'G'
					ls_descrip_cobro		= 'MORA CREDITO'
					ls_descrip_otro			= ''
					ll_cantidad				= 1
					ls_monto_desc			= '0'
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					ll_new_reg			= dw_boleta.insertrow(0)
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
				end if
				if ls_tipo_cob = 'P' then
					ls_tipo_cob				= 'P'
					ls_descrip_cobro		= 'MORA MANT.'
					ls_descrip_otro			= ''
					ll_cantidad				= 1
					ls_monto_desc			= '0'
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					ll_new_reg			= dw_boleta.insertrow(0)
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
				end if
		
				if ls_tipo_cob = 'J' then
					ls_tipo_cob				= 'J'
					ls_descrip_cobro		= 'GASTO COBRANZA'
					ls_descrip_otro			= ''
					ll_cantidad				= 1
					ls_monto_desc			= '0'
					ls_string_boleta	= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					ll_new_reg				= dw_boleta.insertrow(0)
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
				end if
				if ls_tipo_cob = 'R' then
					ll_corre ++
					ls_tipo_cob				= 'R'
					ls_descrip_cobro		= 'GASTO COB. MANT.'
					ls_descrip_otro			= ''
					ll_cantidad				= 1
					ls_monto_desc			= '0'
					ls_string_boleta		= string(ll_corre)+' | '+gs_tipo_cobro+' | '+ls_tipo_cob+' | '+ls_descrip_cobro+' | '+''+' | '+string(ll_cantidad)+' | '+string(ll_monto)+' | '+string(ll_total)+' | '+string(ll_monto_uf,'###,###,##0.0###')
					ll_new_reg				= dw_boleta.insertrow(0)
					dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
				end if
			end if
		next
		ll_reg								= dw_1.Find("ingreso_tipo_mov = 'S'", 1, ll_tot_reg)
		if ll_reg > 0 then // revisar
			Setnull(ll_corre)
			ll_corre						= 0
			ll_new_reg					= dw_boleta.insertrow(0)
			ls_string_boleta			= '<DESCUENTOS O RECARGOS>'
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			ll_new_reg					= dw_boleta.insertrow(0)
			ls_string_boleta			= 'Nro Desc. Recargo | Tipo Movimiento | Glosa Desc. Recargo | Tipo Valor | Valor Desc. Recargo'
			dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
			for ll_indi=1 to ll_tot_reg
				ls_tipo_cob				=dw_1.getitemstring(ll_indi,'ingreso_tipo_mov')
				if ls_tipo_cob = 'S' then
					ll_corre ++
					ls_tipo_cob_otro	= dw_1.getitemstring(ll_indi,'ingreso_codigo_otro')
					ll_monto				= dw_1.getitemnumber(ll_indi,'ingreso_monto')
					SELECT		"TIPO_COBRO"."DESCRIPCION"  
					INTO 			:ls_descrip_cobro  
					FROM 		"TIPO_COBRO"  
					WHERE 	  ( "TIPO_COBRO"."CODIGO" = :ls_tipo_cob ) AND  
								  ( "TIPO_COBRO"."TIPO_MOV" = :gs_tipo_cobro )  
					USING		sqlca;
			
					SELECT		"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 			:ls_descrip_otro  
					FROM 		"CUENTA_CONTABLE_OTROS"  
					WHERE 		"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_tipo_cob_otro   
					USING		sqlca;
			
					ls_descrip_cobro		= UPPER(ls_descrip_cobro)
					if isnull(ls_tipo_cob) then ls_tipo_cob=''
					if isnull(ls_tipo_cob_otro) then ls_tipo_cob_otro=''
					if isnull(ls_descrip_cobro) then ls_descrip_cobro=''
					if ls_tipo_cob = 'S' then
						ls_tipo_codigo		= 'D'
						ll_monto				= ll_monto * -1
					end if
					if ls_tipo_cob_otro <> '0' then
						ls_descrip_cobro	= UPPER(ls_descrip_otro)
					end if
					ls_string_boleta		= string(ll_corre)+' | '+ls_tipo_codigo+' | '+ls_descrip_cobro+' | '+'$'+' | '+string(ll_monto)
					if not isnull(ls_string_boleta) then
						ll_new_reg			= dw_boleta.insertrow(0)
						dw_boleta.setitem(ll_new_reg,'linea_boleta',ls_string_boleta)
					end if
				end if
			next
		end if
	end if
 ls_nombre_archivo		= 'C:\mod_cp\consulta\Boletas_Electronicas\'+ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
TipoArchivo 					= Text!
ll_res							= dw_boleta.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
If ll_res < 0  Then
	MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
else
	MessageBox("Advertencia", "Generación BE Exitosa", Exclamation!)
End If	
ldb_iva_factura				= 0
//messagebox("rut+tipo_cob+folio",ls_rut_empresa+'+'+ls_tip_cob+'+'+string(gl_folio))
end subroutine

public subroutine wf_rehacer_nota_credito (double abd_uf, string as_caja);Long		ll_new_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_cantidad,ll_monto,ll_total,ll_res,ll_can_cta_cred,ll_tot_filas,ll_reg,ll_ctas_pag,ll_total_neto,ll_total_iva,&
			ll_suma_total,ll_corre,ll_sub_total,ll_total_exento,ll_folio_original,ll_folio_nc,ll_mora,ll_gasto_cob,ll_grupo_p,ll_folio_ori,ll_boleta_elect,ll_rut,ll_rut_rez,ll_pos
String		ls_string_boleta,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,ls_tipo_dte,ls_nom_comp,&
			ls_direc_comp,ls_indica_serv,ls_direc_origen,ls_comuna_origen,ls_ciudad_origen,ls_rut,ls_celular,ls_fono_part,ls_email,ls_contacto,ls_tot_pag_pal,&
			ls_tipo_cob,ls_tipo_cob_otro,ls_descrip_cobro,ls_descrip_otro,ls_nombre_archivo,ls_obs_1,ls_tipo_codigo,ls_rut_empresa,ls_monto_desc,&
			ls_anula_doc,ls_tipo_doc,ls_tipo_mov,ls_tipo_cob_ori,ls_contrato,ls_ruta_elec,ls_estado_doc='A',ls_tcom1,ls_dv_rez,ls_nombre_rez,ls_ap_pat_rez,&
			ls_ap_mat_rez,ls_ciudad_rez,ls_comuna_rez,ls_direc_rez,ls_nom_comp_rez
Datetime	ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fecha_pago,ldt_fec_pago_original
double	ll_monto_total
SaveAsType TipoArchivo

//dw_nota_credito.accepttext()
dw_factura.reset()

ls_indica_serv			= '3'
ldt_fecha_pago		= datetime(dw_1.getitemdatetime(1,'ingreso_fecha_pago'))
gs_base				= dw_1.getitemstring(1,'ingreso_base')
gs_serie				= dw_1.getitemstring(1,'ingreso_serie')
gi_numero			= dw_1.getitemnumber(1,'ingreso_contrato')
gl_folio				= Long(em_folio.text)
//gl_folio				= dw_1.getitemnumber(1,'ingreso_folio')
abd_uf				= dw_1.getitemnumber(1,'ingreso_valor_uf')
ls_tcom1				= mid(trim(ddlb_1.text),1,2)
gs_tipo_cobro		= ls_tcom1
ll_monto_total		= dw_1.getitemnumber(1,'c_total_monto')
gs_caja				= dw_1.getitemstring(1,'ingreso_cod_caja')
ls_contrato				= gs_base+gs_serie+string(gi_numero,'############')
if dw_detalle_factura.retrieve(gs_tipo_cobro,gl_folio) > 0 then
//	ldt_fecha_pago			= datetime(date(gdt_fec_sistema),time('00:00:00'))
//	ldt_fecha_pago			= dw_destino.getitemdatetime(1,'fecha_pago')
	ls_tipo_cob_ori			= dw_detalle_factura.getitemstring(1,'tipo_cob')
	ll_folio_ori				= dw_detalle_factura.getitemnumber(1,'folio')
	
	if dw_1.getitemstring(1,'ingreso_rezago')='S' then
		gs_base				= dw_cliente_rezago.getitemstring(1,'base')
		gs_serie				= dw_cliente_rezago.getitemstring(1,'serie')
		gi_numero			= dw_cliente_rezago.getitemnumber(1,'numero')
	end if
	SELECT	"CADENA"."COD_PARQUE",	"CADENA_MORA"."FECHA_VENC_CRED",		"CADENA_MORA"."FECHA_VENC_MANT","CADENA"."RUT"
	INTO 		:ll_cod_parque,					:ldt_fec_venc_cred,								:ldt_fec_venc_mant,						:ll_rut				
	FROM 	"CADENA",	"CADENA_MORA"  
	WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
			  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
			  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
			  (("CADENA"."CODIGO" = :gs_base ) AND  
			  ( "CADENA"."SERIE" = :gs_serie ) AND  
			  ( "CADENA"."NUMERO" = :gi_numero ) )  
	USING	sqlca;
//	if sqlca.sqlcode = 100 then
//		ll_rut_rez				= dw_cliente_rezago.getitemnumber(1,'rut')
//		ls_dv_rez				= dw_cliente_rezago.getitemstring(1,'dv')
//		ll_cod_parque			= dw_cliente_rezago.getitemnumber(1,'cod_parque')
//		ls_nombre_rez			= dw_cliente_rezago.getitemstring(1,'nombre')
//		ls_ap_pat_rez			= dw_cliente_rezago.getitemstring(1,'ap_paterno')
//		ls_ap_mat_rez			= dw_cliente_rezago.getitemstring(1,'ap_materno')
//		ls_ciudad_rez			= dw_cliente_rezago.getitemstring(1,'ciudad_part')
//		ls_comuna_rez			= dw_cliente_rezago.getitemstring(1,'comuna_part')
//		ls_direc_rez				= dw_cliente_rezago.getitemstring(1,'direccion_part')
//		
//		ls_nom_comp_rez		= trim(ls_nombre_rez+' '+ls_ap_pat_rez+' '+ls_ap_mat_rez)
//		if len(ls_nom_comp_rez) > 40 then
//			ls_nom_comp_rez	= mid(ls_nom_comp_rez,1,40)
//		end if
//		if len(ls_nom_comp) > 40 then
//			ls_nom_comp	= mid(ls_nom_comp,1,40)
//		end if
//		if len(ls_direc_rez) > 70 then
//			ls_direc_rez			= mid(ls_direc_rez,1,70)
//		end if
//		if len(ls_contacto) > 20 then
//			ls_contacto	= mid(ls_contacto,1,20)
//		end if
//		ldt_fec_venc_cred		= datetime(date(gdt_fec_sistema),time('00:00:00'))
//	end if
	
	gi_rut		= ll_rut	
	
	SELECT	"MEMBRETE_EMPRESA"."DIRECCION",	"MEMBRETE_EMPRESA"."COMUNA",	"MEMBRETE_EMPRESA"."CIUDAD",	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."RUTA_ELECT"
	INTO 		:ls_direc_origen,								:ls_comuna_origen,						:ls_ciudad_origen,							:ls_rut_empresa,								:ls_ruta_elec
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
	
	ls_direc_origen			= UPPER(trim(ls_direc_origen))
	if len(ls_direc_origen) > 70 then
		ls_direc_origen		= mid(ls_direc_origen,1,70)
	end if
	ls_comuna_origen		= UPPER(ls_comuna_origen)
	ls_ciudad_origen		= UPPER(ls_ciudad_origen)
	ls_ciudad					= UPPER(ls_ciudad)

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
	if sqlca.sqlcode=0 then
		if isnull(ls_celular) or ls_celular='-' or len(ls_celular)=0 or ls_celular='*' then
		ls_celular			= ''
	end if
	if isnull(ls_fono_part) or ls_fono_part='-' or ls_fono_part='*' or len(ls_fono_part)=0 then
		ls_fono_part			= ''
	end if
	if ls_celular <> '' and ls_fono_part <> '' then
		ls_contacto		= 'CELULAR: '+ls_celular+' - FONO PARTICULAR: '+ls_fono_part
	elseif ls_celular <> '' and ls_fono_part = '' then
		ls_contacto		= 'CELULAR: '+ls_celular
	elseif ls_celular = '' and ls_fono_part <> '' then
		ls_contacto 		= 'FONO PARTICULAR: '+ls_fono_part
	elseif ls_fono_part = '' and ls_celular = '' then
		ls_contacto		= ''
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
		ll_pos					= Pos(gs_nombre_completo, 'Telé')
		if ll_pos > 0 then
			ls_nom			= trim(mid(gs_nombre_completo,1, (ll_pos - 1) ))
		else
			ls_nom			= trim(gs_nombre_completo)
		end if
		ls_dv					= gf_obtener_dv(gi_rut)
		ls_nom_comp	= ls_nom_comp_rez
		ls_nom			= ls_nom_comp
		ls_nom_comp	= ls_nom_comp
		if len(ls_nom_comp) > 40 then
			ls_nom_comp	= mid(ls_nom_comp,1,40)
		end if
		if len(ls_nom_comp) > 40 then
			ls_nom		= mid(ls_nom_comp,1,40)
		end if
		ls_direc_comp	= ls_direc_rez
		if len(ls_direc_comp) > 70 then
			ls_direc_comp	= mid(ls_direc_comp,1,70)
		end if
		if isnull(ls_ciudad_rez) then ls_ciudad_rez=''
		if isnull(ls_comuna_rez) then ls_comuna_rez=''
		ls_comuna			= ls_comuna_rez
		ls_ciudad				= ls_ciudad_rez
		ls_rut					= string(ll_rut_rez)+'-'+ls_dv_rez
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
	ls_string_boleta	= 'Folio'+Space(25)+' | '+string(gl_folio)
	dw_factura.setitem(ll_new_reg,'linea_factura',ls_string_boleta)
	ll_new_reg			= dw_factura.insertrow(0)
//	ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(gdt_fec_sistema,'dd-mm-yyyy')
	ls_string_boleta	= 'Fecha de Emision'+Space(14)+' | '+string(date(ldt_fecha_pago),'dd-mm-yyyy')
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
	
	SELECT "ELECTRONICA_FB_DETALLE"."IP_EQUIPO"
	INTO 		:gs_tcp_ip
	FROM 	"ELECTRONICA_FB_DETALLE"  
	WHERE 	"ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro AND  
				"ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :gl_folio
	USING 	Trans_1;
	
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
			ll_monto						= dw_detalle_factura.getitemnumber(1,'monto')
			ll_folio_original				= dw_detalle_factura.getitemnumber(1,'folio')
			ls_tipo_cob					= dw_detalle_factura.getitemstring(1,'tipo_cob')
			ldt_fec_pago_original		= dw_detalle_factura.getitemdatetime(1,'fecha_pago')
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
	//		ls_nombre_archivo		= '\\Boleta_elect\LA-FLORIDA-PROD\InFUD\'+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
	//		ls_nombre_archivo		= ls_ruta_elec+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
	//		ls_nombre_archivo		= 'C:\prueba_be\'+ ls_tipo_dte+'_'+string(ll_folio_nc)+'_'+ls_rut_empresa+'.txt'
			ls_nombre_archivo		= 'C:\mod_cp\consulta\Boletas_Electronicas\'+ ls_tipo_dte+'_'+string(gl_folio)+'_'+ls_rut_empresa+'.txt'
			TipoArchivo 					= Text!
			ll_res							= dw_factura.SaveAs( ls_nombre_archivo,TipoArchivo,False, EncodingANSI!)  //EncodingANSI!) //EncodingUTF8!)
			If ll_res < 0  Then
				MessageBox("Advertencia", "No fue posible Exportar Datos Boleta Electrónica", Exclamation!)
			else
				MessageBox("Advertencia", "Generación NE Exitosa", Exclamation!)
				
			End If	
		end if
end if
end subroutine

on cons_comp_ing_w.create
this.dw_print_nc=create dw_print_nc
this.cb_print_nc=create cb_print_nc
this.dw_impresion=create dw_impresion
this.cb_impresion=create cb_impresion
this.dw_detalle_factura=create dw_detalle_factura
this.dw_factura=create dw_factura
this.sle_1=create sle_1
this.dw_boleta=create dw_boleta
this.cb_boleta=create cb_boleta
this.cb_det_cup=create cb_det_cup
this.pb_proceso=create pb_proceso
this.cb_ctacte=create cb_ctacte
this.dw_print=create dw_print
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.st_4=create st_4
this.ddlb_1=create ddlb_1
this.dw_2=create dw_2
this.st_3=create st_3
this.st_2=create st_2
this.em_folio=create em_folio
this.st_1=create st_1
this.cb_2=create cb_2
this.dw_cliente_rezago=create dw_cliente_rezago
this.dw_cliente=create dw_cliente
this.dw_1=create dw_1
this.st_5=create st_5
this.Control[]={this.dw_print_nc,&
this.cb_print_nc,&
this.dw_impresion,&
this.cb_impresion,&
this.dw_detalle_factura,&
this.dw_factura,&
this.sle_1,&
this.dw_boleta,&
this.cb_boleta,&
this.cb_det_cup,&
this.pb_proceso,&
this.cb_ctacte,&
this.dw_print,&
this.cb_1,&
this.cb_imprimir,&
this.st_4,&
this.ddlb_1,&
this.dw_2,&
this.st_3,&
this.st_2,&
this.em_folio,&
this.st_1,&
this.cb_2,&
this.dw_cliente_rezago,&
this.dw_cliente,&
this.dw_1,&
this.st_5}
end on

on cons_comp_ing_w.destroy
destroy(this.dw_print_nc)
destroy(this.cb_print_nc)
destroy(this.dw_impresion)
destroy(this.cb_impresion)
destroy(this.dw_detalle_factura)
destroy(this.dw_factura)
destroy(this.sle_1)
destroy(this.dw_boleta)
destroy(this.cb_boleta)
destroy(this.cb_det_cup)
destroy(this.pb_proceso)
destroy(this.cb_ctacte)
destroy(this.dw_print)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.st_4)
destroy(this.ddlb_1)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_folio)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.dw_cliente_rezago)
destroy(this.dw_cliente)
destroy(this.dw_1)
destroy(this.st_5)
end on

event open;String	ls_tipo_cob,ls_descrip,ls_string

gf_centrar(cons_comp_ing_w)
dw_print.settransobject(sqlca)
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_impresion.settransobject(sqlca)
dw_cliente_rezago.settransobject(sqlca)
dw_cliente.settransobject(sqlca)
dw_detalle_factura.settransobject(sqlca)
dw_print_nc.settransobject(sqlca)
connect using Trans_1;
st_5.visible			= false
cb_det_cup.enabled	= false
if gs_depto = 'I' or gs_depto = 'G' then
	cb_boleta.enabled = true
end if	
ddlb_1.reset()
DECLARE x1 CURSOR FOR  
SELECT	"COD_PAGO"."TIPO_COB",   
			"COD_PAGO"."DESCRIPCION"  
FROM 		"COD_PAGO"  
ORDER BY "COD_PAGO"."TIPO_COB" ASC  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob, :ls_descrip;
		if not isnull(ls_tipo_cob) then
			ls_string	= trim(ls_tipo_cob)+' - '+trim(ls_descrip)
			ddlb_1.AddItem(ls_string)
		end if
		Setnull(ls_string);Setnull(ls_tipo_cob)
	LOOP
end if
close x1;


end event

event close;Disconnect using Trans_1;
cb_2.triggerevent(clicked!)
end event

type dw_print_nc from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 2117
integer y = 2464
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_impresion_nota_credito_ci"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print_nc from commandbutton within cons_comp_ing_w
integer x = 2002
integer y = 2052
integer width = 411
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir NC de CI"
end type

event clicked;Long		ll_suma_total,ll_folio_ci,ll_folio_nc,ll_cod_parque,ll_count_reg
String		ls_cob_ci,ls_cob_nc,ls_rezago,ls_monto_palabra
Double	ll_numero_ori
Datetime	ldt_fecha_pago

ls_cob_nc						= mid(trim(ddlb_1.text),1,2)
ll_folio_nc						= Long(em_folio.text)
SELECT	DISTINCT	"NOTA_DE_CREDITO"."TIPO_COB",	"NOTA_DE_CREDITO"."FOLIO",		"NOTA_DE_CREDITO"."NUMERO"
INTO						:ls_cob_ci,									:ll_folio_ci,								:ll_numero_ori							
FROM 		"NOTA_DE_CREDITO"
WHERE 	  	( "NOTA_DE_CREDITO"."TIPO_COB_ORIGINAL" = :ls_cob_nc ) AND
				( "NOTA_DE_CREDITO"."FOLIO_ORIGINAL" = :ll_folio_nc ) 
USING	sqlca;
if sqlca.sqlcode=0 then
	if ll_numero_ori=0 or isnull(ll_numero_ori) then 
		ls_rezago	= 'S'
	else
		ls_rezago	= ' '
	end if
	
	SELECT DISTINCT "INGRESO"."COD_PARQUE",		"INGRESO"."RUT",		"INGRESO"."MONTO",		"INGRESO"."FECHA_PAGO",		"INGRESO"."COD_PARQUE"
	INTO 		:ll_cod_parque ,								:gi_rut,					:ll_suma_total,				:ldt_fecha_pago,					:ll_cod_parque
	FROM 	"INGRESO"  
	WHERE ( "INGRESO"."FOLIO" = :ll_folio_nc ) AND  
				( "INGRESO"."TIPO_COB" = :ls_cob_nc )   ;
	
	gl_cod_parque_cta	= ll_cod_parque
	ls_monto_palabra		= sle_1.uo_convertir_numero(string(ll_suma_total))
	
	ll_count_reg				= dw_print_nc.retrieve(ls_cob_nc,ll_folio_nc,date(ldt_fecha_pago),ls_rezago,gi_rut,ll_cod_parque,ls_monto_palabra)
	if ll_count_reg > 0 then
		f_Print( dw_print_nc )
//		f_printdlg(dw_print_nc,gstr_print,cons_comp_ing_w)
	else
		messagebox("Advertencia","No registra Datos a Imprimir Nota de Crédito, No se imprimirá Documento")
	end if
else
	messagebox("Advertencia","No Existe Docuemento Anulación de CI "+string(ll_folio_nc))
end if
end event

type dw_impresion from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 306
integer y = 2232
integer width = 837
integer height = 584
boolean titlebar = true
string dataobject = "d_rep_ci_form_nuevo"
boolean controlmenu = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
boolean righttoleft = true
end type

type cb_impresion from commandbutton within cons_comp_ing_w
integer x = 1710
integer y = 2052
integer width = 288
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir CI"
end type

event clicked;String		ls_tcom1,ls_dv,ls_monto_us,ls_codigo_control,ls_nom_comp,ls_fono_p,ls_rut,ls_fecha_pago,ls_nro_autoriza,ls_decimal,ls_tot_pag_pal,ls_string_monto,ls_nom,ls_ap_pat,ls_ap_mat,&
			ls_base,ls_serie,ls_nom_fall_ficha,ls_monto_bol,ls_tipo_mov,ls_empresa,ls_direccion,ls_telefonos,ls_ciudad,ls_nombre,ls_ap_paterno,ls_ap_materno,ls_doc,ls_user,&
			ls_rut_empresa,ls_razon_social,ls_base_rez,ls_serie_rez,ls_nom_caj,ls_usuario_pago
Long		ll_folio,ll_valor_bol_ent,ll_max_qr,ll_estatus,ll_rut_empresa,ll_tot_filas,ll_reg,ll_reg_cred,ll_can_cta_cred,ll_cuota_pag_s,ll_fecha_pago,ll_ctas_pag,ll_cod_parque
Datetime	ldt_fecha_pago,ldt_fecha_limite,ld_fecha_pago,ldt_fecha_prim
Double	ldb_monto,ldb_uf,ldb_valor_bol,ll_rut,ll_numero,ll_tot_ch,ll_tot_ef,ll_monto_ef,ll_paga_con,ll_vuelto,ldb_uf_dia,ldb_monto_ef,ll_numero_rez
DataWindowChild dwch_detalle_ci,dwch_doc_cob

ls_tcom1							= mid(trim(ddlb_1.text),1,2)
ll_folio							= Long(em_folio.text)
ll_rut								= dw_1.getitemnumber(1,'ingreso_rut')
ls_rut								= string(ll_rut)
ls_user							= dw_1.getitemstring(1,'ingreso_usuario')
ldt_fecha_pago					= dw_1.getitemdatetime(1,'ingreso_fecha_pago')
gs_rezago						= dw_1.getitemstring(1,'ingreso_rezago')
SELECT		"TAB_UF"."VALOR_UF"  
INTO 			:ldb_uf_dia  
FROM 		"TAB_UF"  
WHERE 		"TAB_UF"."FECHA_UF" = :ldt_fecha_pago   ;

ls_fecha_pago					= string(ldt_fecha_pago,'yyyymmdd')
ldb_uf								= dw_1.getitemnumber(1,'ingreso_valor_uf')
ls_tipo_mov						= dw_1.getitemstring(1,'ingreso_tipo_mov')
//ll_estatus						= dw_empresa.getitemnumber(1,'estatus')
ld_fecha_pago					= dw_1.getitemdatetime(1,'ingreso_fecha_pago')
ll_monto_ef						= ll_tot_ef+ll_tot_ch
ll_paga_con						= ll_monto_ef
ll_vuelto							= 0

dw_impresion.DataObject	= 'd_rep_ci_form_nuevo' //'d_rep_ci'
dw_impresion.GetChild('d_rep_detalle_ci', dwch_detalle_ci)
dwch_detalle_ci.SetTransObject(SQLCA)
dwch_detalle_ci.Retrieve(ll_folio)
dw_impresion.GetChild('d_rep_ci_docu', dwch_doc_cob)
dwch_doc_cob.SetTransObject(SQLCA)
dwch_doc_cob.Retrieve(ll_folio)
dw_impresion.SetTransObject(SQLCA)

ls_base					= dw_1.GetItemstring(1, "ingreso_base")
ls_serie					= dw_1.GetItemstring(1, "ingreso_serie")
ll_numero				= dw_1.GetItemNumber(1, "ingreso_contrato")
ll_cod_parque			= dw_1.GetItemNumber(1,'ingreso_cod_parque')

ll_tot_filas									= dw_1.rowcount()
ll_reg											= dw_1.Find("ingreso_tipo_mov = 'E' or ingreso_tipo_mov = 'A' or ingreso_tipo_mov = 'K' or ingreso_tipo_mov = 'U'", 1, ll_tot_filas)
if ll_reg>0 and gs_rezago <> "S" then 
	if dw_1.rowcount() > 0 then
		ll_reg_cred				= dw_1.Find("ingreso_tipo_mov = 'E' or ingreso_tipo_mov = 'A' or ingreso_tipo_mov = 'K' or ingreso_tipo_mov = 'U'", 1, ll_tot_filas)
		ll_can_cta_cred			= dw_1.GetItemNumber(ll_reg_cred, "ingreso_cuotas_pag")
		
		ls_nombre				= dw_cliente.getitemstring(1,'nombre')
		ls_ap_paterno			= dw_cliente.getitemstring(1,'a_paterno')
		ls_ap_materno			= dw_cliente.getitemstring(1,'a_materno')
		ll_tot_ch					= dw_2.getitemnumber(1,'total_monto_ch')
		ll_tot_ef					= dw_2.getitemnumber(1,'compute_1')
	
		if isnull(ls_nombre) then ls_nombre = '-'
		if isnull(ls_ap_paterno) then ls_ap_paterno = '-'
		if isnull(ls_ap_materno) then ls_ap_materno = '-'
		
		gs_nombre_completo	= ls_nombre+' '+ls_ap_paterno+ ' '+ ls_ap_materno
		
	end if
end if
IF gs_rezago = "S" THEN 
	setnull(gs_nombre_completo);setnull(gs_contrato_rezago);setnull(gs_string_cli_rezago)
	
	ls_nombre				= dw_cliente_rezago.getitemstring(1,'nombre')
	ls_ap_paterno			= dw_cliente_rezago.getitemstring(1,'ap_paterno')
	ls_ap_materno			= dw_cliente_rezago.getitemstring(1,'ap_materno')
	ls_base_rez				= dw_cliente_rezago.getitemstring(1,'base')
	ls_serie_rez				= dw_cliente_rezago.getitemstring(1,'serie')
	ll_numero_rez			= dw_cliente_rezago.getitemnumber(1,'numero')
	if isnull(ls_nombre) then ls_nombre = '-'
	if isnull(ls_ap_paterno) then ls_ap_paterno = '-'
	if isnull(ls_ap_materno) then ls_ap_materno = '-'
	gs_nombre_completo	= ls_nombre+' '+ls_ap_paterno+ ' '+ ls_ap_materno
	ls_doc					= ls_base_rez+ls_serie_rez+string(ll_numero_rez)
ELSE
	ls_doc					= (ls_base+ls_serie+String(ll_numero))
END IF
ls_rut							= string(ll_rut)
SELECT 	Sum("DOCUMENTOS"."MONTO")
INTO 		:ldb_monto  
FROM 	"DOCUMENTOS"  
WHERE ( "DOCUMENTOS"."FOLIO" = :ll_folio ) AND  
			( "DOCUMENTOS"."TIPO_COB" = :ls_tcom1 ) AND  
			( "DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha_pago ) ;
			
SELECT 	Sum("DOCUMENTOS"."MONTO")
INTO 		:ldb_monto_ef 
FROM 	"DOCUMENTOS"  
WHERE ( "DOCUMENTOS"."FOLIO" = :ll_folio ) AND  
			( "DOCUMENTOS"."TIPO_COB" = :ls_tcom1 ) AND  
			( "DOCUMENTOS"."COD_PAGO" = 'EF' ) AND  
			( "DOCUMENTOS"."FECHA_PAGO" = :ldt_fecha_pago ) ;

ldb_valor_bol			= round(ldb_monto * round(( 1 / ldb_uf),2),2)
ll_valor_bol_ent		= long(ldb_valor_bol)
ls_decimal				= mid(string(round(ldb_valor_bol - ll_valor_bol_ent,2)),3)
//	Monto en Palabras					
ls_tot_pag_pal			= sle_1.uo_convertir_numero(string(long(ldb_monto)))
ls_string_monto		= ls_tot_pag_pal+' '+ls_decimal+'/100.-'

ll_monto_ef				= ldb_monto_ef	//ll_valor_bol_ent //ll_tot_ef+ll_tot_ch
ll_paga_con				= ldb_monto_ef	//ll_monto_ef
		
if not isnull(gs_nombre_completo) and gs_nombre_completo<>"" then
	ls_usuario_pago	= dw_1.getitemstring(1,'ingreso_usuario')
	SELECT 	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nom_caj  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_pago   ;
	if isnull(ls_nom_caj) or ls_nom_caj='' then ls_nom_caj = ls_usuario_pago
	if dw_impresion.Retrieve(ll_folio,ls_doc,ll_rut,gf_obtener_dv(ll_rut),gs_nombre_completo,Date(ldt_fecha_pago),ldb_uf_dia,ll_monto_ef,ll_paga_con,0,ls_tcom1,ls_nom_caj) > 0 then	//,ls_tot_pag_pal)
		SELECT	"CADENA"."COD_PARQUE"
		INTO 		:ll_cod_parque
		FROM 	"CADENA",	"CADENA_MORA"  
		WHERE ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
				  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
				  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
				  (("CADENA"."CODIGO" = :ls_base ) AND  
				  ( "CADENA"."SERIE" = :ls_serie ) AND  
				  ( "CADENA"."NUMERO" = :ll_numero ) )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			SELECT	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."EMPRESA"
			INTO 		:ls_rut_empresa,								:ls_razon_social
			FROM 	"MEMBRETE_EMPRESA"  
			WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
			USING	sqlca;
			if sqlca.sqlcode=0 then
				dw_impresion.object.t_razon_social.text		= ls_razon_social
				dw_impresion.object.t_rut.text					= 'RUT : '+ls_rut_empresa
			end if
		else
			SELECT	"CD_FOLIO"."COD_PARQUE"  
			INTO 		:ll_cod_parque  
			FROM 	"CD_FOLIO"  
			WHERE	( "CD_FOLIO"."BASE" = :ls_base_rez ) AND  
						( "CD_FOLIO"."SERIE" = :ls_serie_rez ) AND  
						( "CD_FOLIO"."NUMERO" = :ll_numero_rez )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				SELECT	"MEMBRETE_EMPRESA"."STRING_RUT",	"MEMBRETE_EMPRESA"."EMPRESA"
				INTO 		:ls_rut_empresa,								:ls_razon_social
				FROM 	"MEMBRETE_EMPRESA"  
				WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque
				USING	sqlca;
				if sqlca.sqlcode=0 then
					dw_impresion.object.t_razon_social.text		= ls_razon_social
					dw_impresion.object.t_rut.text					= 'RUT : '+ls_rut_empresa
				end if
			end if
		end if
	//	dw_impresion.object.t_hora.text			= string(gdt_fec_sistema,'hh : mm')
	//	dw_impresion.object.t_cajero.text			= ls_user
		f_Print( dw_impresion )
//		f_printdlg(dw_impresion,gstr_print,cons_comp_ing_w)
	else
		messagebox("Advertencia","No Registra Documento a Imprimir")
	end if
end if
end event

type dw_detalle_factura from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 2747
integer y = 1164
integer width = 1221
integer height = 1028
string dragicon = "Hand!"
string title = "none"
string dataobject = "dw_rehacer_nota_de_credito_factura"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_factura from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 2898
integer y = 656
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_factura_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from uo_convierte_numero within cons_comp_ing_w
boolean visible = false
integer x = 2181
integer y = 2308
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type dw_boleta from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 2894
integer y = 164
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_boleta_electronica_envio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_boleta from commandbutton within cons_comp_ing_w
integer x = 727
integer y = 2052
integer width = 430
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Regenerar Boleta"
end type

event clicked;string		ls_caja,ls_tcom1
long 		ll_tot_reg,ll_indi
double	ldb_uf_dia_pago	

ls_caja				= dw_1.getitemstring(1,'ingreso_cod_caja')
ldb_uf_dia_pago	= dw_1.getitemnumber(1,'ingreso_valor_uf')
ls_tcom1				= mid(trim(ddlb_1.text),1,2)
ll_tot_reg			= dw_1.rowcount()
if ll_tot_reg > 0 and (ls_tcom1 = 'NE' or ls_tcom1 = 'BE') then
	if ls_tcom1 = 'NE' then
		wf_rehacer_nota_credito(ldb_uf_dia_pago,ls_caja)
	elseif ls_tcom1 = 'BE' then
		wf_rehacer_boleta_electronica(ldb_uf_dia_pago,ls_caja)
	else	
		
	end if
	dw_1.reset()
	dw_2.reset()
	dw_cliente_rezago.reset()
	dw_cliente.reset()
	dw_boleta.reset()
	dw_factura.reset()
end if
end event

type cb_det_cup from commandbutton within cons_comp_ing_w
integer x = 1161
integer y = 2052
integer width = 544
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cupon &Reemplazo * CI"
end type

event clicked;String	ls_tcom1,ls_string
Long		ll_folio

ls_tcom1			= mid(trim(ddlb_1.text),1,2)
ll_folio			= Long(em_folio.text)
ls_string		= ls_tcom1+'~t'+string(ll_folio)
if isvalid(w_lista_detalle_cupones_asignado_ci) then close(w_lista_detalle_cupones_asignado_ci)
if not isnull(ls_tcom1) and ll_folio>0 then openwithparm(w_lista_detalle_cupones_asignado_ci,ls_string)
end event

type pb_proceso from picturebutton within cons_comp_ing_w
integer x = 2491
integer y = 24
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;em_folio.triggerevent(modified!)
end event

type cb_ctacte from commandbutton within cons_comp_ing_w
integer x = 274
integer y = 2052
integer width = 233
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta Cte"
end type

event clicked;if dw_1.rowcount() > 0 then
	gs_base		= dw_1.getitemstring(dw_1.getrow(),'ingreso_base')
	gs_serie		= dw_1.getitemstring(dw_1.getrow(),'ingreso_serie')
	gi_numero	= dw_1.getitemnumber(dw_1.getrow(),'ingreso_contrato')
	gi_rut			= dw_1.getitemnumber(dw_1.getrow(),'ingreso_rut')
	if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	else
		messagebox("Advertencia","No Registra Contrato Asociado")
	end if
end if
end event

type dw_print from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 1435
integer y = 2200
integer width = 571
integer height = 432
string title = "none"
string dataobject = "dw_con_ing_pago_print"
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within cons_comp_ing_w
integer x = 512
integer y = 2052
integer width = 210
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_tipo_cob,ls_descrip,ls_string
dw_1.reset()
dw_2.reset()
dw_cliente_rezago.reset()
dw_cliente.reset()
em_folio.text	= ''
ddlb_1.reset()
DECLARE x1 CURSOR FOR  
SELECT	"COD_PAGO"."TIPO_COB",   
			"COD_PAGO"."DESCRIPCION"  
FROM 		"COD_PAGO"  
ORDER BY "COD_PAGO"."TIPO_COB" ASC  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob, :ls_descrip;
		if not isnull(ls_tipo_cob) then
			ls_string	= trim(ls_tipo_cob)+' - '+trim(ls_descrip)
			ddlb_1.AddItem(ls_string)
		end if
		Setnull(ls_string);Setnull(ls_tipo_cob)
	LOOP
end if
close x1;
ddlb_1.setfocus()
end event

type cb_imprimir from commandbutton within cons_comp_ing_w
integer x = 37
integer y = 2052
integer width = 233
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

event clicked;Long		ll_folio
string 	ls_tcom
ls_tcom		= trim(mid(ddlb_1.text,1,2))
ll_folio		= long(em_folio.text)
if dw_print.retrieve(ll_folio,ls_tcom) > 0 then 
	dw_print.object.t_titulo.text		= gs_conexion
	dw_print.object.t_usuario.text	= gs_user
	f_Print( dw_print )
//	f_printdlg(dw_print,gstr_print,cons_comp_ing_w)
end if
end event

type st_4 from statictext within cons_comp_ing_w
integer x = 50
integer y = 52
integer width = 567
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
boolean enabled = false
string text = "Tipo Comprobante"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within cons_comp_ing_w
integer x = 622
integer y = 40
integer width = 1010
integer height = 744
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.reset()
dw_2.reset()
dw_cliente_rezago.reset()
dw_cliente.reset()
dw_boleta.reset()
dw_factura.reset()
st_5.visible				= false
em_folio.text				= ''
if mid(trim(ddlb_1.text),1,2)='CI' or mid(trim(ddlb_1.text),1,2)='C0' or mid(trim(ddlb_1.text),1,2)='C1' then
	cb_det_cup.enabled	= true
else
	cb_det_cup.enabled	= false
end if

end event

type dw_2 from datawindow within cons_comp_ing_w
integer x = 50
integer y = 1580
integer width = 2697
integer height = 440
string dataobject = "cons_docu_w_caja"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type st_3 from statictext within cons_comp_ing_w
integer x = 50
integer y = 1508
integer width = 590
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean enabled = false
string text = "Detalle"
boolean focusrectangle = false
end type

type st_2 from statictext within cons_comp_ing_w
integer x = 50
integer y = 160
integer width = 590
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean enabled = false
string text = "Datos pago"
boolean focusrectangle = false
end type

type em_folio from editmask within cons_comp_ing_w
integer x = 1879
integer y = 44
integer width = 521
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "############"
end type

event modified;long		ll_folio,ll_rut
string 	ls_tcom1
st_5.visible	= false
ls_tcom1			= mid(trim(ddlb_1.text),1,2)
ll_folio			= Long(em_folio.text)
if not isnull(ls_tcom1) and ls_tcom1<>'' and ll_folio>0 then
	if dw_1.retrieve(ll_folio,ls_tcom1)=0 then
		dw_1.reset()
		dw_2.reset()
		dw_cliente_rezago.reset()
		dw_cliente.reset()
		messagebox("Información","Comprobante "+ls_tcom1+" - "+string(ll_folio)+"   No Existe",information!)
		em_folio.setfocus()
	else
		ll_rut	= dw_1.getitemnumber(1,'ingreso_rut')
		dw_cliente_rezago.reset()
		dw_cliente.reset()
		if dw_1.getitemstring(1,'ingreso_rezago')='S' then
			dw_cliente_rezago.retrieve(ll_rut,ls_tcom1,ll_folio)
			dw_cliente_rezago.visible	= true
			dw_cliente.visible			= false
			if dw_cliente_rezago.rowcount()=0 then
				st_5.visible				= true
			else
				st_5.visible				= false
			end if
		else
			dw_cliente.retrieve(ll_rut)
			dw_cliente_rezago.visible	= false
			st_5.visible					= false
			dw_cliente.visible			= true
		end if
		dw_2.retrieve(ll_folio,ls_tcom1)
	end if
end if
end event

type st_1 from statictext within cons_comp_ing_w
integer x = 1673
integer y = 56
integer width = 183
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
boolean enabled = false
string text = "Folio"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within cons_comp_ing_w
integer x = 2450
integer y = 2052
integer width = 297
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

on clicked;close(cons_comp_ing_w)
end on

type dw_cliente_rezago from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 55
integer y = 484
integer width = 2619
integer height = 504
string dataobject = "dw_datos_cliente_rezago"
boolean border = false
boolean livescroll = true
end type

type dw_cliente from datawindow within cons_comp_ing_w
boolean visible = false
integer x = 64
integer y = 480
integer width = 2615
integer height = 532
string dataobject = "dw_datos_cliente"
boolean border = false
boolean livescroll = true
end type

type dw_1 from datawindow within cons_comp_ing_w
integer x = 41
integer y = 248
integer width = 2720
integer height = 1252
string dataobject = "con_ing_pago_dw"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;if row>0 then cb_ctacte.triggerevent(clicked!)
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type st_5 from statictext within cons_comp_ing_w
integer x = 78
integer y = 532
integer width = 2592
integer height = 424
integer textsize = -33
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "No Registra Cliente Rezago"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

