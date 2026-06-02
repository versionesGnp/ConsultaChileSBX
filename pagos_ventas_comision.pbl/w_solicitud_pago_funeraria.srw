forward
global type w_solicitud_pago_funeraria from window
end type
type cb_resp_wf_cal from commandbutton within w_solicitud_pago_funeraria
end type
type cb_revisión_valida from commandbutton within w_solicitud_pago_funeraria
end type
type em_fecha_actual from statictext within w_solicitud_pago_funeraria
end type
type cb_gestion from commandbutton within w_solicitud_pago_funeraria
end type
type cb_imprimir from commandbutton within w_solicitud_pago_funeraria
end type
type cb_grabar from commandbutton within w_solicitud_pago_funeraria
end type
type cb_dato_mes from commandbutton within w_solicitud_pago_funeraria
end type
type cb_limpiar from commandbutton within w_solicitud_pago_funeraria
end type
type cb_cerrar from commandbutton within w_solicitud_pago_funeraria
end type
type fecha_t from statictext within w_solicitud_pago_funeraria
end type
type cb_buscar_ficha from commandbutton within w_solicitud_pago_funeraria
end type
type dw_promesa from datawindow within w_solicitud_pago_funeraria
end type
type pb_aceptar from picturebutton within w_solicitud_pago_funeraria
end type
type dw_comision from datawindow within w_solicitud_pago_funeraria
end type
type gb_1 from groupbox within w_solicitud_pago_funeraria
end type
end forward

global type w_solicitud_pago_funeraria from window
integer width = 3314
integer height = 2828
boolean titlebar = true
string title = "Solicitud Comisión Funeraria"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_resp_wf_cal cb_resp_wf_cal
cb_revisión_valida cb_revisión_valida
em_fecha_actual em_fecha_actual
cb_gestion cb_gestion
cb_imprimir cb_imprimir
cb_grabar cb_grabar
cb_dato_mes cb_dato_mes
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
fecha_t fecha_t
cb_buscar_ficha cb_buscar_ficha
dw_promesa dw_promesa
pb_aceptar pb_aceptar
dw_comision dw_comision
gb_1 gb_1
end type
global w_solicitud_pago_funeraria w_solicitud_pago_funeraria

type variables
long	il_row
datawindowchild			idw_detalle5
end variables

forward prototypes
public function long wf_folio_funer (long al_folio)
public function long wf_dato_funer (long al_cod_parque, long al_cod_funeraria, long al_mes_comi, long al_ano_comi)
public subroutine wf_calculo (long al_cod_parque, long al_cod_funeraria, long al_dato_mas, double adb_precio_ctto, double adb_valor_uf, long al_adicional, double adb_porce_reten, string as_moneda, long al_capac)
public function string wf_valida_datos (string as_base, string as_serie, double adb_contrato)
public function long wf_grabar (string as_base, string as_serie, double adb_contrato, string as_modif_reg, datetime adt_fec_actual, long al_cod_estado, string as_glosa, string as_cod_age, string as_cod_sup, long al_cod_parque, string as_estado_modif, long al_mes, long al_ano)
end prototypes

public function long wf_folio_funer (long al_folio);long	ll_folio,ll_folio_mas

SELECT	"FOLIO"  
INTO 		:ll_folio  
FROM 	"FUNERARIA_PAGO_COMISION"
WHERE	"FUNERARIA_PAGO_COMISION"."FOLIO" = :al_folio
USING	sqlca;
if sqlca.sqlcode = 100 then
	SELECT	MAX("FUNERARIA_PAGO_COMISION"."FOLIO")  
	INTO 		:ll_folio  
	FROM 	"FUNERARIA_PAGO_COMISION"
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		ll_folio_mas								= ll_folio+1
	end if
else
	ll_folio_mas									= ll_folio
end if

if isnull(ll_folio_mas) then ll_folio_mas=0
Return ll_folio_mas
end function

public function long wf_dato_funer (long al_cod_parque, long al_cod_funeraria, long al_mes_comi, long al_ano_comi);long	ll_dato_funeraria,ll_dato_mas

if al_cod_parque <> 102 then
	SELECT MAX("FUNERARIA_PAGO_COMISION"."NUMERO_DATO")
	INTO 	:ll_dato_funeraria  
	FROM 	"FUNERARIA_PAGO_COMISION"  
	WHERE ( "FUNERARIA_PAGO_COMISION"."COD_FUNERARIA" = :al_cod_funeraria ) AND  
			( "FUNERARIA_PAGO_COMISION"."COD_PARQUE" = :al_cod_parque ) AND  
			( "FUNERARIA_PAGO_COMISION"."MES_CIERRE" = :al_mes_comi ) AND  
			( "FUNERARIA_PAGO_COMISION"."ANO_CIERRE" = :al_ano_comi )
	USING		sqlca;
	if isnull(ll_dato_funeraria) then
		ll_dato_mas						= 1
	else
		ll_dato_mas						= ll_dato_funeraria+1
	end if
else
	SELECT MAX("FUNERARIA_PAGO_COMISION"."NUMERO_DATO")
	INTO 	:ll_dato_funeraria  
	FROM 	"FUNERARIA_PAGO_COMISION"  
	WHERE ( "FUNERARIA_PAGO_COMISION"."COD_FUNERARIA" = :al_cod_funeraria ) AND  
			( "FUNERARIA_PAGO_COMISION"."MES_CIERRE" = :al_mes_comi ) AND  
			( "FUNERARIA_PAGO_COMISION"."ANO_CIERRE" = :al_ano_comi )
	USING		sqlca;
	if isnull(ll_dato_funeraria) then
		ll_dato_mas						= 1
	else
		ll_dato_mas						= ll_dato_funeraria+1
	end if
end if
if isnull(ll_dato_mas) then ll_dato_mas=0
Return ll_dato_mas
end function

public subroutine wf_calculo (long al_cod_parque, long al_cod_funeraria, long al_dato_mas, double adb_precio_ctto, double adb_valor_uf, long al_adicional, double adb_porce_reten, string as_moneda, long al_capac);long		ll_monto,ll_monto_retencion,ll_neto
double	ldb_porcentaje,ldb_porce_comi

ldb_porcentaje											= 0
SELECT	MAX("FUNERARIA_PORCENTAJE"."MONTO")  
INTO		:ll_monto  
FROM		"FUNERARIA_PORCENTAJE"  
WHERE	"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :al_cod_parque
USING	sqlca;
if sqlca.sqlcode=0 then
	if al_capac = 1 then
		ll_monto											= 111111
	end if
	dw_comision.setitem(1,'porce_comision',ldb_porcentaje)
	dw_comision.setitem(1,'neto_comision',ll_monto)
	ll_monto_retencion 								= ll_monto * adb_porce_reten / 100
	dw_comision.setitem(1,'retencion',ll_monto_retencion)
	ll_total_pago										= ll_monto - ll_monto_retencion
	dw_comision.setitem(1,'total_pago',ll_total_pago)
end if
end subroutine

public function string wf_valida_datos (string as_base, string as_serie, double adb_contrato);string		ls_cod_age,ls_base,ls_serie,ls_area,ls_moneda,ls_nom_repr,ls_pater_repr,ls_mater_repr,ls_dv_repr,ls_direcc_repr,ls_num_repr,ls_block_repr,ls_depto_repr,ls_comuna_repr,ls_ciudad_repr,ls_fono_repr,&
			ls_nom_contac,ls_pater_contac,ls_mater_contac,ls_fono_contac,ls_cod_sup,ls_uso,ls_tipo_cons,ls_tipo_sepul,&
			ls_nom_titular,ls_pater_titular,ls_mater_titular,ls_dv_titular,ls_direcc_titular,ls_numero_titular,ls_block_titular,ls_depto_titular,ls_comuna_titular,ls_ciudad_titular,ls_fono_titular,&
			ls_nom_fallec,ls_pater_fallec,ls_mater_fallec,ls_dv_fallec,ls_sector,ls_sepul,ls_estado,ls_modif
long		ll_graba,ll_cod_funer,ll_folio,ll_num_dato,ll_rut_repr,ll_pago,ll_cod_parque,ll_neto_comi,ll_retencion,ll_rut_titular,ll_rut_fallec,ll_cod_estado,ll_mes,ll_ano,ll_hora,ll_min,ll_capac,&
			ll_num_boleta,ll_num_cheque,ll_cta_funer
datetime	ldt_fec_cierre,ldt_fec_ctto,ldt_fec_estado,ldt_fec_crea
double	ldb_numero,ldb_precio_ctto,ldb_uf,ldb_porc_comi,ldb_precio_lista,ldb_porce_descto

string		ls_base2,ls_serie2,ls_cod_age2,ls_area2,ls_moneda2,ls_nom_repr2,ls_pater_repr2,ls_mater_repr2,ls_dv_repr2,ls_direcc_repr2,ls_num_repr2,ls_block_repr2,ls_depto_repr2,ls_comuna_repr2,&
			ls_ciudad_repr2,ls_nom_contac2,ls_pater_contac2,ls_mater_contac2,ls_fono_contac2,ls_nom_titular2,ls_pater_titular2,ls_mater_titular2,ls_dv_titular2,ls_direcc_titular2,ls_num_titular2,ls_block_titular2,&
			ls_depto_titular2,ls_nom_fallec2,ls_pater_fallec2,ls_mater_fallec2,ls_dv_fallec2,ls_comuna_titular2,ls_ciudad_titular2,ls_sector2,ls_sepul2,ls_fono_titular2,ls_fono_repr2,ls_cod_sup2,ls_uso2,ls_tipo_cons2,&
			ls_tipo_sepul2,ls_estado2
long		ll_cod_fun2,ll_folio2,ll_num_dato2,ll_rut_repr2,ll_pago2,ll_cod_parque2,ll_neto_comi2,ll_retencion2,ll_rut_titular2,ll_rut_fallec2,ll_mes2,ll_ano2,ll_cod_estado2,ll_hora2,ll_min2,ll_capac2,ll_boleta2,ll_cheque2
double	ldb_contrato2,ldb_precio_ctto2,ldb_uf_dia2,ldb_porce_comi2,ldb_precio_lista2,ldb_porce_descto2
datetime	ldt_fec_crea2,ldt_fec_cierre2,ldt_fec_ctto2,ldt_fec_estado2


//wf_valida_datos(as_base,as_serie,adb_contrato)

SELECT	"FECHA_CREA",	"COD_FUNERARIA",	"FOLIO",	"NUMERO_DATO",	"COD_AGENTE",	"FECHA_CIERRE",	"FECHA_CTTO",	"AREA",	"PRECIO_CTTO",	"MONEDA",	"UF_DIA",	"NOMBRE_REPRESENTANTE",	"A_PATERNO_REPRESENTANTE",	"A_MATERNO_REPRESENTANTE",	"RUT_REPRESENTANTE",	"DV_REPRESENTENTE",	"PORCE_COMISION",	"TOTAL_PAGO",	"DIRECCION_REPRESENTANTE",	"NUMERO_REPRESENTANTE",	"BLOCK_REPRESENTANTE",	"DEPTO_REPRESENTANTE",   "COMUNA_REPRESENTANTE",	"CIUDAD_REPRESENTANTE",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"FONO_CONTACTO",	"COD_PARQUE",	"NETO_COMISION",	"RETENCION",	"NOMBRE_TITULAR",   "A_PATERNO_TITULAR",	"A_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"DIRECCION_NUMERO_TITULAR",	"DIRECCION_BLOCK_TITULAR",		"DIRECCION_DEPTO_TITULAR",	"NOMBRE_FALLECIDO",	"A_PATERNO_FALLECIDO",	"A_MATERNO_FALLECIDO",	"RUT_FALLECIDO",	"DV_FALLECIDO",	"COMUNA_TITULAR",	"CIUDAD_TITULAR",	"COD_ESTADO",	"PLANI_SECTOR",	"PLANI_SEPULTURA",	"MES_CIERRE",	"ANO_CIERRE",	"HORA_CIERRE",	"MINUTO_CIERRE",	"FONO_TITULAR",	"FONO_REPRESENT",	"FECHA_ESTADO",	"COD_SUPERVISOR",	"CAPACIDAD",	"USO",	"T_CONST",		"T_SEPULT",	"PRECIO_LISTA",	"PORCE_DESCTO",	"ESTADO",	"NUM_BOLETA",	"NUM_CHEQUE"  
INTO 		:ldt_fec_crea,		:ll_cod_funer,			:ll_folio,	:ll_num_dato,		:ls_cod_age,		:ldt_fec_cierre,		:ldt_fec_ctto,		:ls_area,	:ldb_precio_ctto,	:ls_moneda,	:ldb_uf,		:ls_nom_repr,						:ls_pater_repr,							:ls_mater_repr,							:ll_rut_repr,						:ls_dv_repr,					:ldb_porc_comi,		:ll_pago,				:ls_direcc_repr,						:ls_num_repr,						:ls_block_repr,					:ls_depto_repr,						:ls_comuna_repr,					:ls_ciudad_repr	,					:ls_nom_contac,			:ls_pater_contac,				:ls_mater_contac,			:ls_fono_contac,		:ll_cod_parque,		:ll_neto_comi,			:ll_retencion,	:ls_nom_titular,		:ls_pater_titular,				:ls_mater_titular,				:ll_rut_titular,		:ls_dv_titular,	:ls_direcc_titular,			:ls_numero_titular,					:ls_block_titular,						:ls_depto_titular,						:ls_nom_fallec,				:ls_pater_fallec,				:ls_mater_fallec,				:ll_rut_fallec,			:ls_dv_fallec,		:ls_comuna_titular,	:ls_ciudad_titular,		:ll_cod_estado,		:ls_sector,			:ls_sepul,				:ll_mes,			:ll_ano,			:ll_hora,				:ll_min,					:ls_fono_titular,	:ls_fono_repr,		:ldt_fec_estado,	:ls_cod_sup,			:ll_capac,		:ls_uso,	:ls_tipo_cons,	:ls_tipo_sepul,	:ldb_precio_lista,	:ldb_porce_descto,		:ls_estado,	:ll_num_boleta,		:ll_num_cheque
FROM 	"FUNERARIA_PAGO_COMISION"
WHERE	( "FUNERARIA_PAGO_COMISION"."BASE" = :as_base ) AND  
			( "FUNERARIA_PAGO_COMISION"."SERIE" = :as_serie ) AND  
			( "FUNERARIA_PAGO_COMISION"."NUMERO" = :adb_contrato )
USING	sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ls_cod_age) and ls_cod_age<>'' and ll_cod_funer>0 and not isnull(ldt_fec_cierre) and ll_mes>0 and ll_ano>0 and not isnull(ll_hora) and not isnull(ll_min) & 
		and not isnull(ls_nom_contac) and ls_nom_contac<>'' and not isnull(ls_pater_contac) and ls_pater_contac<>'' and not isnull(ls_mater_contac) and ls_mater_contac<>''& 
		and not isnull(ls_fono_contac) and ls_fono_contac<>'' and ll_cod_parque>0 and not isnull(ldt_fec_ctto) and not isnull(ls_area) and ls_area<>''& 
		and not isnull(ls_sector) and ls_sector<>'' and not isnull(ls_sepul) and ls_sepul<>'' and not isnull(ls_tipo_cons) and  ls_tipo_cons <> '' & 
		and not isnull(ls_tipo_sepul) and ls_tipo_sepul<>'' and ll_capac >0 and not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) and ls_moneda<>'' and ldb_precio_lista>0 &
		and ldb_precio_ctto>0  and ll_rut_titular>0 and not isnull(ls_dv_titular) and ls_dv_titular<>'' and not isnull(ls_nom_titular) and ls_nom_titular<>'' and not isnull(ls_pater_titular) and ls_pater_titular<>''& 
		and not isnull(ls_mater_titular) and ls_mater_titular<>'' and not isnull(ls_direcc_titular) and ls_direcc_titular<>'' and not isnull(ls_numero_titular) and ls_numero_titular<>'' & 
		and not isnull(ls_block_titular) and ls_block_titular<>'' and not isnull(ls_depto_titular) and ls_depto_titular<>'' and not isnull(ls_fono_titular) and ls_fono_titular<>'' & 
		and not isnull(ls_ciudad_titular) and ls_ciudad_titular<>'' and not isnull(ls_comuna_titular) and ls_comuna_titular<>'' and ll_rut_repr>0 and not isnull(ls_dv_repr) and ls_dv_repr<>'' & 
		and not isnull(ls_nom_repr) and ls_nom_repr<>'' and not isnull(ls_pater_repr) and ls_pater_repr<>'' and not isnull(ls_mater_repr) and ls_mater_repr<>'' & 
		and not isnull(ls_direcc_repr) and ls_direcc_repr<>'' and not isnull(ls_num_repr) and ls_num_repr<>'' and not isnull(ls_block_repr) and ls_block_repr<>'' & 
		and not isnull(ls_depto_repr) and ls_depto_repr<>'' and not isnull(ls_fono_repr) and ls_fono_repr<>'' and not isnull(ls_ciudad_repr) and ls_ciudad_repr<>'' & 
		and not isnull(ls_comuna_repr) and ls_comuna_repr<>'' and ll_folio>0 and ll_num_dato>0 and ldb_uf>0 and ll_neto_comi>0 and ll_retencion>0 and ll_pago>0 & 
		and not isnull(ls_nom_fallec) and ls_nom_fallec<>'' and not isnull(ls_pater_fallec) and ls_pater_fallec<>'' and not isnull(ls_mater_fallec) and ls_mater_fallec<>'' and ll_rut_fallec>0 and not isnull(ls_dv_fallec) and ls_dv_fallec<>'' then

		ls_base2							= dw_promesa.getitemstring(1,'base')
		ls_serie2							= dw_promesa.getitemstring(1,'serie')
		ldb_contrato2					= dw_promesa.getitemnumber(1,'numero')
		ldt_fec_crea2					= dw_comision.getitemdatetime(1,'fecha_crea')
		ll_cod_fun2						= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_folio2							= dw_comision.getitemnumber(1,'folio')
		ll_num_dato2					= dw_comision.getitemnumber(1,'numero_dato')
		ls_cod_age2						= dw_comision.getitemstring(1,'cod_agente')
		ldt_fec_cierre2					= dw_comision.getitemdatetime(1,'fecha_cierre')
		ldt_fec_ctto2					= dw_comision.getitemdatetime(1,'fecha_ctto')
		ls_area2							= dw_comision.getitemstring(1,'area')
		ldb_precio_ctto2				= dw_comision.getitemnumber(1,'precio_ctto')
		ls_moneda2						= dw_comision.getitemstring(1,'moneda')
		ldb_uf_dia2						= dw_comision.getitemnumber(1,'uf_dia')
		ls_nom_repr2					= dw_comision.getitemstring(1,'nombre_representante')
		ls_pater_repr2					= dw_comision.getitemstring(1,'a_paterno_representante')
		ls_mater_repr2					= dw_comision.getitemstring(1,'a_materno_representante')
		ll_rut_repr2						= dw_comision.getitemnumber(1,'rut_representante')
		ls_dv_repr2						= dw_comision.getitemstring(1,'dv_representente')
		ldb_porce_comi2				= dw_comision.getitemnumber(1,'porce_comision')
		ll_pago2							= dw_comision.getitemnumber(1,'total_pago')
		
		ls_direcc_repr2					= dw_comision.getitemstring(1,'direccion_representante')
		ls_num_repr2					= dw_comision.getitemstring(1,'numero_representante')
		ls_block_repr2					= dw_comision.getitemstring(1,'block_representante')
		ls_depto_repr2					= dw_comision.getitemstring(1,'depto_representante')
		ls_comuna_repr2				= dw_comision.getitemstring(1,'comuna_representante')
		ls_ciudad_repr2				= dw_comision.getitemstring(1,'ciudad_representante')
		ls_nom_contac2				= dw_comision.getitemstring(1,'nombre_contacto')
		ls_pater_contac2				= dw_comision.getitemstring(1,'a_paterno_contacto')
		ls_mater_contac2				= dw_comision.getitemstring(1,'a_materno_contacto')
		ls_fono_contac2				= dw_comision.getitemstring(1,'fono_contacto')
		ll_cod_parque2					= dw_comision.getitemnumber(1,'cod_parque')
		ll_neto_comi2					= dw_comision.getitemnumber(1,'neto_comision')
		ll_retencion2					= dw_comision.getitemnumber(1,'retencion')
		ls_nom_titular2					= dw_comision.getitemstring(1,'nombre_titular')
		ls_pater_titular2				= dw_comision.getitemstring(1,'a_paterno_titular')
		ls_mater_titular2				= dw_comision.getitemstring(1,'a_materno_titular')
		ll_rut_titular2					= dw_comision.getitemnumber(1,'rut_titular')
		ls_dv_titular2					= dw_comision.getitemstring(1,'dv_titular')
		ls_direcc_titular2				= dw_comision.getitemstring(1,'direccion_titular')
		ls_num_titular2					= dw_comision.getitemstring(1,'direccion_numero_titular')
		ls_block_titular2				= dw_comision.getitemstring(1,'direccion_block_titular')
		ls_depto_titular2				= dw_comision.getitemstring(1,'direccion_depto_titular')
		ls_nom_fallec2					= dw_comision.getitemstring(1,'nombre_fallecido')
		ls_pater_fallec2				= dw_comision.getitemstring(1,'a_paterno_fallecido')
		ls_mater_fallec2				= dw_comision.getitemstring(1,'a_materno_fallecido')
		ll_rut_fallec2					= dw_comision.getitemnumber(1,'rut_fallecido')
		ls_dv_fallec2					= dw_comision.getitemstring(1,'dv_fallecido')
		ls_comuna_titular2			= dw_comision.getitemstring(1,'comuna_titular')
		ls_ciudad_titular2				= dw_comision.getitemstring(1,'ciudad_titular')
		ll_cod_estado2					= dw_comision.getitemnumber(1,'cod_estado') //estado//
		ls_sector2						= dw_comision.getitemstring(1,'plani_sector')
		ls_sepul2							= dw_comision.getitemstring(1,'plani_sepultura')
		ll_mes2							= dw_comision.getitemnumber(1,'mes_cierre')  
		ll_ano2							= dw_comision.getitemnumber(1,'ano_cierre')  
		ll_hora2							= dw_comision.getitemnumber(1,'hora_cierre')
		ll_min2							= dw_comision.getitemnumber(1,'minuto_cierre')
		ls_fono_titular2					= dw_comision.getitemstring(1,'fono_titular')
		ls_fono_repr2					= dw_comision.getitemstring(1,'fono_represent')
		ldt_fec_estado2				= dw_comision.getitemdatetime(1,'fecha_estado')
		ls_cod_sup2						= dw_comision.getitemstring(1,'cod_supervisor')
		ll_capac2							= dw_comision.getitemnumber(1,'capacidad')
		ls_uso2							= dw_comision.getitemstring(1,'uso')
		ls_tipo_cons2					= dw_comision.getitemstring(1,'t_const')
		ls_tipo_sepul2					= dw_comision.getitemstring(1,'t_sepult')
		ldb_precio_lista2				= dw_comision.getitemnumber(1,'precio_lista')
		ldb_porce_descto2				= dw_comision.getitemnumber(1,'porce_descto')
		ls_estado2						= 'N'
		ll_boleta2						= dw_comision.getitemnumber(1,'funeraria_pago_comision_num_boleta')
		ll_cheque2						= dw_comision.getitemnumber(1,'funeraria_pago_comision_num_cheque')
		
		if as_base <> ls_base2 and as_serie <> ls_serie2 and adb_contrato <> ldb_contrato2 and ldt_fec_crea <> ldt_fec_crea2 and ll_cod_funer <> ll_cod_fun2 and ll_folio <> ll_folio2 and ll_num_dato <> ll_num_dato2 and ls_cod_age <> ls_cod_age2 and &
			ldt_fec_cierre <> ldt_fec_cierre2 and ldt_fec_ctto <> ldt_fec_ctto2 and ls_area <> ls_area2 and ldb_precio_ctto <> ldb_precio_ctto2 and ls_moneda <> ls_moneda2 and ldb_uf <> ldb_uf_dia2 and ls_nom_repr <> ls_nom_repr and &
			ls_pater_repr <> ls_pater_repr2 and ls_mater_repr <> ls_mater_repr2 and ll_rut_repr <> ll_rut_repr2 and ls_dv_repr <> ls_dv_repr2 and ldb_porc_comi <> ldb_porce_comi2 and ll_pago <> ll_pago2 and ls_direcc_repr <> ls_direcc_repr2 and &
			ls_num_repr <> ls_num_repr2 and ls_block_repr <> ls_block_repr2 and ls_depto_repr <> ls_depto_repr2 and ls_comuna_repr <> ls_comuna_repr2 and ls_ciudad_repr <> ls_ciudad_repr2 and ls_nom_contac <> ls_nom_contac2 and &
			ls_pater_contac <> ls_pater_contac2 and ls_mater_contac <> ls_mater_contac2 and ls_fono_contac <> ls_fono_contac2 and ll_cod_parque <> ll_cod_parque2 and ll_neto_comi <> ll_neto_comi2 and ll_retencion <> ll_retencion2 and &
			ls_nom_titular <> ls_nom_titular2 and ls_pater_titular <> ls_pater_titular2 and ls_mater_titular <> ls_mater_titular2 and ll_rut_titular <> ll_rut_titular2 and ls_dv_titular <> ls_dv_titular2 and ls_direcc_titular <> ls_direcc_titular2 and &
			ls_numero_titular <> ls_num_titular2 and ls_block_titular <> ls_block_titular2 and ls_depto_titular <> ls_depto_titular2 and ls_nom_fallec <> ls_nom_fallec2 and ls_pater_fallec <> ls_pater_fallec2 and ls_mater_fallec <> ls_mater_fallec2 and &
			ll_rut_fallec <> ll_rut_fallec2 and ls_dv_fallec <> ls_dv_fallec2 and ls_comuna_titular <> ls_comuna_titular2 and ls_ciudad_titular <> ls_ciudad_titular2 and ll_cod_estado <> ll_cod_estado2 and ls_sector <> ls_sector2 and &
			ls_sepul <> ls_sepul2 and ll_mes <> ll_mes2 and ll_ano <> ll_ano2 and ll_hora <> ll_hora2 and ll_min <> ll_min2 and ls_fono_titular <> ls_fono_titular2 and ls_fono_repr <> ls_fono_repr2 and ldt_fec_estado <> ldt_fec_estado2 and &
			ls_cod_sup <> ls_cod_sup2 and ll_capac <> ll_capac2 and ls_uso <> ls_uso2 and ls_tipo_cons <> ls_tipo_cons2 and ls_tipo_sepul <> ls_tipo_sepul2 and ldb_precio_lista <> ldb_precio_lista2 and ldb_porce_descto <> ldb_porce_descto2 and &
			/*ls_estado <> ls_estado2 and*/ ll_num_boleta <> ll_boleta2 and ll_num_cheque <> ll_cheque2 then
			
			ls_modif						= 'S'
		else
			ls_modif						= 'N'
		end if
	end if
end if

return ls_modif
end function

public function long wf_grabar (string as_base, string as_serie, double adb_contrato, string as_modif_reg, datetime adt_fec_actual, long al_cod_estado, string as_glosa, string as_cod_age, string as_cod_sup, long al_cod_parque, string as_estado_modif, long al_mes, long al_ano);string		ls_cod_age,ls_base,ls_serie,ls_area,ls_moneda,ls_nom_repr,ls_pater_repr,ls_mater_rep,ls_dv_repr,ls_direcc_repr,ls_num_repr,ls_block_repr,ls_depto_repr,ls_comuna_repr,ls_ciudad_repr,ls_fono_repres,&
			ls_nom_contac,ls_pater_contac,ls_mater_contac,ls_fono_contac,ls_cod_sup,ls_uso,ls_tipo_const,ls_tipo_sepult,&
			ls_nom_titular,ls_pater_titular,ls_mater_titular,ls_dv_titular,ls_direcc_titular,ls_numero_titular,ls_block_titular,ls_depto_titular,ls_comuna_titular,ls_ciudad_titular,ls_fono_titular,&
			ls_nom_fallec,ls_pater_fallec,ls_mater_fallec,ls_dv_fallec,ls_plani_sector,ls_plani_sepul
long		ll_graba,ll_cod_funer,ll_folio,ll_nun_dato,ll_rut_repr,ll_pago,ll_cod_parque,ll_neto_comi,ll_retecion,ll_rut_titular,ll_rut_fallec,ll_cod_estado,ll_mes,ll_ano,ll_hora,ll_min,ll_capac,ll_estado,ll_num_boleta,ll_num_cheque,ll_cta_funer
datetime	ldt_fec_cierre,ldt_fec_ctto,ldt_fec_estado
double	ldb_numero,ldb_precio_ctto,ldb_uf,ldb_porc_comi,ldb_precio_lista,ldb_porce_descto

//wf_grabar(as_base,as_serie,adb_contrato,adt_fec_actual,al_cod_estado,as_glosa,as_cod_age,as_cod_sup,al_cod_parque,as_estado_modif,al_mes,al_ano)

if al_cod_estado=4 then
	if dw_comision.update() = 1 then
		commit using sqlca;
		INSERT INTO	"FUNERARIA_FOLIO_DETALLE"  
					( "BASE",		"SERIE",		"NUMERO",		"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",		"GLOSA",		"COD_AGENTE",	"COD_SUPERVISOR",	"COD_PARQUE",	"ESTADO_MODIFICACION",	"MES_CIERRE",	"ANO_CIERRE",	"USUARIO_GESTOR" )  
		VALUES	( :as_base,	:as_serie,	:adb_contrato,	:adt_fec_actual,	:gs_user,			:al_cod_estado,	:adt_fec_actual,		:as_glosa,	:as_cod_age,		:as_cod_sup,			:al_cod_parque,	:as_estado_modif,				:al_mes,			:al_ano,			:gs_user    )
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			ll_graba						= 1
		else
			rollback using sqlca;
			ll_graba						= 0
		end if
		dw_comision.reset()
		dw_comision.insertrow(0)
		dw_promesa.setfocus()
		if isvalid(w_solicitud_pago_funeraria) then
			pb_aceptar.TriggerEvent(Clicked!)
			w_solicitud_pago_funeraria.setfocus()
		end if
	else
		rollback using sqlca;
		ll_graba						= 0
	end if
else
	if as_modif_reg='S' then
		SELECT	"COD_FUNERARIA",	"FOLIO",	"NUMERO_DATO",	"COD_AGENTE",	"FECHA_CIERRE",	"BASE",	"SERIE",	"NUMERO",		"FECHA_CTTO",	"AREA",	"PRECIO_CTTO",	"MONEDA",		"UF_DIA",	"NOMBRE_REPRESENTANTE",	"A_PATERNO_REPRESENTANTE",	"A_MATERNO_REPRESENTANTE",	"RUT_REPRESENTANTE",	"DV_REPRESENTENTE",	"PORCE_COMISION",	"TOTAL_PAGO",	"DIRECCION_REPRESENTANTE",	"NUMERO_REPRESENTANTE",	"BLOCK_REPRESENTANTE",	"DEPTO_REPRESENTANTE",	"COMUNA_REPRESENTANTE",	"CIUDAD_REPRESENTANTE",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"FONO_CONTACTO",	"COD_PARQUE",	"NETO_COMISION",	"RETENCION",	"NOMBRE_TITULAR",	"A_PATERNO_TITULAR",	"A_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"DIRECCION_NUMERO_TITULAR",	"DIRECCION_BLOCK_TITULAR",		"DIRECCION_DEPTO_TITULAR",	"NOMBRE_FALLECIDO",	"A_PATERNO_FALLECIDO",	"A_MATERNO_FALLECIDO",	"RUT_FALLECIDO",	"DV_FALLECIDO",	"COMUNA_TITULAR",	"CIUDAD_TITULAR",	"COD_ESTADO",	"PLANI_SECTOR",	"PLANI_SEPULTURA",	"MES_CIERRE",	"ANO_CIERRE",	"HORA_CIERRE",	"MINUTO_CIERRE",	"FONO_TITULAR",	"FONO_REPRESENT",	"FECHA_ESTADO",	"COD_SUPERVISOR",	"CAPACIDAD",	"USO",	"T_CONST",		"T_SEPULT",	"PRECIO_LISTA",	"PORCE_DESCTO",	"ESTADO",	"NUM_BOLETA",	"NUM_CHEQUE"  
		INTO 		:ll_cod_funer,			:ll_folio,	:ll_nun_dato,		:ls_cod_age,		:ldt_fec_cierre,		:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fec_ctto,		:ls_area,	:ldb_precio_ctto,	:ls_moneda,		:ldb_uf,		:ls_nom_repr,						:ls_pater_repr,							:ls_mater_rep,							:ll_rut_repr,						:ls_dv_repr,					:ldb_porc_comi,		:ll_pago,				:ls_direcc_repr,						:ls_num_repr,						:ls_block_repr,					:ls_depto_repr,					:ls_comuna_repr,					:ls_ciudad_repr,					:ls_nom_contac,			:ls_pater_contac,				:ls_mater_contac,				:ls_fono_contac,		:ll_cod_parque,		:ll_neto_comi,			:ll_retecion,		:ls_nom_titular,		:ls_pater_titular,			:ls_mater_titular,				:ll_rut_titular,		:ls_dv_titular,	:ls_direcc_titular,			:ls_numero_titular,					:ls_block_titular,						:ls_depto_titular,						:ls_nom_fallec,				:ls_pater_fallec,				:ls_mater_fallec,				:ll_rut_fallec,			:ls_dv_fallec,		:ls_comuna_titular,	:ls_ciudad_titular,		:ll_cod_estado,		:ls_plani_sector,	:ls_plani_sepul,			:ll_mes,			:ll_ano,			:ll_hora,				:ll_min,					:ls_fono_titular,	:ls_fono_repres,		:ldt_fec_estado,	:ls_cod_sup,			:ll_capac,		:ls_uso,	:ls_tipo_const,	:ls_tipo_sepult,	:ldb_precio_lista,	:ldb_porce_descto,	:ll_estado,	:ll_num_boleta,		:ll_num_cheque  
		FROM 	"FUNERARIA_PAGO_COMISION"
		WHERE	( "FUNERARIA_PAGO_COMISION"."BASE" = :as_base ) AND  
					( "FUNERARIA_PAGO_COMISION"."SERIE" = :as_serie ) AND  
					( "FUNERARIA_PAGO_COMISION"."NUMERO" = :adb_contrato )
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			INSERT INTO	"LOG_FUNERARIA_PAGO_COMISION"
							(	"COD_FUNERARIA",	"FOLIO",	"NUMERO_DATO",	"COD_AGENTE",	"FECHA_CIERRE",	"BASE",	"SERIE",	"NUMERO",		"FECHA_CTTO",	"AREA",	"PRECIO_CTTO",	"MONEDA",		"UF_DIA",	"NOMBRE_REPRESENTANTE",	"A_PATERNO_REPRESENTANTE",	"A_MATERNO_REPRESENTANTE",	"RUT_REPRESENTANTE",	"DV_REPRESENTENTE",	"PORCE_COMISION",	"TOTAL_PAGO",	"DIRECCION_REPRESENTANTE",	"NUMERO_REPRESENTANTE",	"BLOCK_REPRESENTANTE",	"DEPTO_REPRESENTANTE",	"COMUNA_REPRESENTANTE",	"CIUDAD_REPRESENTANTE",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"FONO_CONTACTO",	"COD_PARQUE",	"NETO_COMISION",	"RETENCION",	"NOMBRE_TITULAR",	"A_PATERNO_TITULAR",	"A_MATERNO_TITULAR",	"RUT_TITULAR",	"DV_TITULAR",	"DIRECCION_TITULAR",	"DIRECCION_NUMERO_TITULAR",	"DIRECCION_BLOCK_TITULAR",	"DIRECCION_DEPTO_TITULAR",	"NOMBRE_FALLECIDO",	"A_PATERNO_FALLECIDO",	"A_MATERNO_FALLECIDO",	"RUT_FALLECIDO",	"DV_FALLECIDO",	"COMUNA_TITULAR",	"CIUDAD_TITULAR",	"COD_ESTADO",	"PLANI_SECTOR",	"PLANI_SEPULTURA",	"MES_CIERRE",	"ANO_CIERRE",	"HORA_CIERRE",	"MINUTO_CIERRE",	"FONO_TITULAR",	"FONO_REPRESENT",	"FECHA_ESTADO",	"COD_SUPERVISOR",	"CAPACIDAD",	"USO",	"T_CONST",		"T_SEPULT",	"PRECIO_LISTA",	"PORCE_DESCTO",	"USUARIO_MODIFICA",	"ESTADO",	"NUM_BOLETA",	"NUM_CHEQUE")
			VALUES 		(	:ll_cod_funer,			:ll_folio,	:ll_nun_dato,		:ls_cod_age,		:ldt_fec_cierre,		:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fec_ctto,		:ls_area,	:ldb_precio_ctto,	:ls_moneda,		:ldb_uf,		:ls_nom_repr,						:ls_pater_repr,							:ls_mater_rep,							:ll_rut_repr,						:ls_dv_repr,					:ldb_porc_comi,		:ll_total_pago,		:ls_direcc_repr,						:ls_num_repr,						:ls_block_repr,					:ls_depto_repr,					:ls_comuna_repr,					:ls_ciudad_repr,					:ls_nom_contac,			:ls_pater_contac,				:ls_mater_contac,				:ls_fono_contac,		:ll_cod_parque,		:ll_neto_comi,			:ll_retecion,		:ls_nom_titular,		:ls_pater_titular,			:ls_mater_titular,				:ll_rut_titular,		:ls_dv_titular,	:ls_direcc_titular,			:ls_numero_titular,					:ls_block_titular,					:ls_depto_titular,						:ls_nom_fallec,				:ls_pater_fallec,				:ls_mater_fallec,				:ll_rut_fallec,			:ls_dv_fallec,		:ls_comuna_titular,	:ls_ciudad_titular,		:ll_cod_estado,		:ls_plani_sector,	:ls_plani_sepul,			:ll_mes,			:ll_ano,			:ll_hora,				:ll_min,					:ls_fono_titular,	:ls_fono_repres,		:ldt_fec_estado,	:ls_cod_sup,			:ll_capac,		:ls_uso,	:ls_tipo_const,	:ls_tipo_sepult,	:ldb_precio_lista,	:ldb_porce_descto,	:gs_user,					:ll_estado,	:ll_num_boleta,		:ll_num_cheque  )
			USING			sqlca;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				if dw_comision.update() = 1 then
					commit using sqlca;
					messagebox("Grabar","Grabación Exitosa")
					dw_promesa.reset()
					dw_promesa.dataobject	= 'dwe_promesa'
					dw_promesa.settransobject(sqlca)
					dw_promesa.insertrow(0)
					dw_comision.reset()
					dw_comision.insertrow(0)
					dw_promesa.setfocus()
					ll_graba						= 1
				else
					rollback using sqlca;
					messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+sqlca.sqlerrtext)
					ll_graba						= 0
				end if
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+sqlca.sqlerrtext)
				ll_graba							= 0
			end if	
		end if
	else
		if dw_comision.update() = 1 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa")
			dw_promesa.reset()
			dw_promesa.dataobject	= 'dwe_promesa'
			dw_promesa.settransobject(sqlca)
			dw_promesa.insertrow(0)
			dw_comision.reset()
			dw_comision.insertrow(0)
			dw_promesa.setfocus()
			ll_graba						= 1
		else
			rollback using sqlca;
			messagebox("Error Grabar","Error Grabar Comisiones Funeraria SQL: "+sqlca.sqlerrtext)
			ll_graba						= 0
		end if
	end if
end if
if isnull(ll_graba) then ll_graba = 0
return		ll_graba
end function

on w_solicitud_pago_funeraria.create
this.cb_resp_wf_cal=create cb_resp_wf_cal
this.cb_revisión_valida=create cb_revisión_valida
this.em_fecha_actual=create em_fecha_actual
this.cb_gestion=create cb_gestion
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.cb_dato_mes=create cb_dato_mes
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.fecha_t=create fecha_t
this.cb_buscar_ficha=create cb_buscar_ficha
this.dw_promesa=create dw_promesa
this.pb_aceptar=create pb_aceptar
this.dw_comision=create dw_comision
this.gb_1=create gb_1
this.Control[]={this.cb_resp_wf_cal,&
this.cb_revisión_valida,&
this.em_fecha_actual,&
this.cb_gestion,&
this.cb_imprimir,&
this.cb_grabar,&
this.cb_dato_mes,&
this.cb_limpiar,&
this.cb_cerrar,&
this.fecha_t,&
this.cb_buscar_ficha,&
this.dw_promesa,&
this.pb_aceptar,&
this.dw_comision,&
this.gb_1}
end on

on w_solicitud_pago_funeraria.destroy
destroy(this.cb_resp_wf_cal)
destroy(this.cb_revisión_valida)
destroy(this.em_fecha_actual)
destroy(this.cb_gestion)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.cb_dato_mes)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.fecha_t)
destroy(this.cb_buscar_ficha)
destroy(this.dw_promesa)
destroy(this.pb_aceptar)
destroy(this.dw_comision)
destroy(this.gb_1)
end on

event open;string	ls_base,ls_serie
long		ll_new,ll_parque
datetime	ldt_fecha_actual
double	ldb_numero

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
gf_centrar(w_solicitud_pago_funeraria)
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM		"TASA"  
WHERE		"TASA"."LOOK" = 1   
USING		sqlca ;
em_fecha_actual.text			= string(gdt_fec_sistema,'dd/mm/yyyy')
ldt_fecha_actual				= datetime(date(em_fecha_actual.text),time('00:00:00'))
dw_promesa.setfocus()
if gs_depto = 'P' or gs_depto = 'I' then
	cb_buscar_ficha.visible	= true
	ls_base						= substr(1,1,Message.StringParm)
	ls_serie						= substr(1,2,Message.StringParm)
	ldb_numero					= double(substr(1,3,Message.StringParm))
	dw_promesa.reset()
	dw_promesa.dataobject	= 'dwe_promesa'
	dw_promesa.settransobject(sqlca)
	ll_new						= dw_promesa.insertrow(0)
	dw_promesa.setitem(ll_new,'base',ls_base)
	dw_promesa.setitem(ll_new,'serie',ls_serie)
	dw_promesa.setitem(ll_new,'numero',ldb_numero)
	if gs_conexion	= "Parque El Prado" then
		ll_parque				= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque				= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque				= 801
	end if
	dw_comision.getchild('area',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_comision.getchild('plani_sector',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.reset()
	idw_detalle2.insertrow(0)
	dw_comision.getchild('plani_sepultura',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.reset()
	idw_detalle3.insertrow(0)
	dw_comision.getchild('comuna_titular',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.reset()
	idw_detalle4.insertrow(0)
	dw_comision.getchild('comuna_representante',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	idw_detalle5.reset()
	idw_detalle5.insertrow(0)
	dw_comision.settransobject(sqlca)
	dw_comision.reset()
	dw_comision.insertrow(0)	
elseif gs_depto = 'X' or gs_depto = 'V' or gs_depto = 'O' or gs_depto = 'C' or gs_depto = 'T' or gs_depto = 'I' or gs_depto = 'G' then
	cb_buscar_ficha.visible	= false
	if gs_depto = 'X' then
		cb_buscar_ficha.visible	= true
	end if
	ls_base						= substr(1,1,Message.StringParm)
	ls_serie						= substr(1,2,Message.StringParm)
	ldb_numero					= double(substr(1,3,Message.StringParm))
	dw_promesa.reset()
	dw_promesa.dataobject	= 'dwe_promesa'
	dw_promesa.settransobject(sqlca)
	ll_new						= dw_promesa.insertrow(0)
	dw_promesa.setitem(ll_new,'base',ls_base)
	dw_promesa.setitem(ll_new,'serie',ls_serie)
	dw_promesa.setitem(ll_new,'numero',ldb_numero)
	if gs_conexion	= "Parque El Prado" then
		ll_parque					= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque					= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque					= 801
	end if
	dw_comision.getchild('area',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_comision.getchild('plani_sector',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.reset()
	idw_detalle2.insertrow(0)
	dw_comision.getchild('plani_sepultura',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.reset()
	idw_detalle3.insertrow(0)
	dw_comision.getchild('comuna_titular',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.reset()
	idw_detalle4.insertrow(0)
	dw_comision.getchild('comuna_representante',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.reset()
	idw_detalle4.insertrow(0)
	dw_comision.settransobject(sqlca)
	dw_comision.reset()
	dw_comision.insertrow(0)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_resp_wf_cal from commandbutton within w_solicitud_pago_funeraria
integer x = 3698
integer y = 2244
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//long		ll_monto,ll_monto_retencion,ll_neto
//double	ldb_porcentaje,ldb_porce_comi
//
//
//if al_cod_parque = 102 or al_cod_parque = 103 then
//	ldb_porcentaje									= 0
//	SELECT	MAX("FUNERARIA_PORCENTAJE"."MONTO")  
//	INTO		:ll_monto  
//	FROM		"FUNERARIA_PORCENTAJE"  
//	WHERE		"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :al_cod_parque
//	USING		sqlca;
//	if sqlca.sqlcode=0 then
//		if al_capac = 1 then
//			ll_monto									= 111111
//		end if
//		dw_comision.setitem(1,'porce_comision',ldb_porcentaje)
//		dw_comision.setitem(1,'neto_comision',ll_monto)
//		ll_monto_retencion 						= ll_monto * adb_porce_reten / 100
//		dw_comision.setitem(1,'retencion',ll_monto_retencion)
//		ll_total_pago								= ll_monto - ll_monto_retencion
//		dw_comision.setitem(1,'total_pago',ll_total_pago)
//	end if
//else
//	SELECT	"FUNERARIA"."MONTO_COMI"  
//	INTO		:ll_monto  
//	FROM		"FUNERARIA"  
//	WHERE		"FUNERARIA"."RUT" = :al_cod_funeraria
//	USING		sqlca;
//	if sqlca.sqlcode = 0 then
//		if isnull (ll_monto) or ll_monto = 0 then
//			if al_capac = 1 then
//				ll_monto								= 111111
//			end if
//			SELECT 	"FUNERARIA_PORCENTAJE"."PORCE_PAGO"  
//			INTO		:ldb_porce_comi  
//			FROM		"FUNERARIA_PORCENTAJE"  
//			WHERE		( "FUNERARIA_PORCENTAJE"."COD_COMI" = :al_dato_mas ) AND  
//						( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :al_cod_parque )
//			USING		sqlca;
//			if sqlca.sqlcode = 100 then
//				SELECT	MAX("FUNERARIA_PORCENTAJE"."PORCE_PAGO")  
//				INTO		:ldb_porce_comi  
//				FROM		"FUNERARIA_PORCENTAJE"  
//				WHERE		"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :al_cod_parque
//				USING		sqlca;
//				if sqlca.sqlcode = 0 then
//					ldb_porcentaje					= ldb_porce_comi
//				end if
//			else
//				ldb_porcentaje						= ldb_porce_comi
//			end if
//			dw_comision.setitem(1,'porce_comision',ldb_porcentaje)
//			if as_moneda = '2' then
//				ll_neto   							= (((adb_precio_ctto * adb_valor_uf) * ldb_porcentaje) / 100) + al_adicional
//			else
//				ll_neto     						= ((adb_precio_ctto * ldb_porcentaje) / 100) + al_adicional
//			end if
//			dw_comision.setitem(1,'neto_comision',ll_neto)
//			ll_monto_retencion 					= ll_neto * adb_porce_reten /100
//			dw_comision.setitem(1,'retencion',ll_monto_retencion)
//			ll_total_pago							= ll_neto - ll_monto_retencion
//			dw_comision.setitem(1,'total_pago',ll_total_pago)
//		else
//			ldb_porcentaje							= 0
//			dw_comision.setitem(1,'porce_comision',ldb_porcentaje)
//			dw_comision.setitem(1,'neto_comision',ll_monto)
//			ll_monto_retencion					= ll_monto * adb_porce_reten /100
//			dw_comision.setitem(1,'retencion',ll_monto_retencion)
//			ll_total_pago							= ll_monto - ll_monto_retencion
//			dw_comision.setitem(1,'total_pago',ll_total_pago)
//		end if
//	end if
//end if
end event

type cb_revisión_valida from commandbutton within w_solicitud_pago_funeraria
integer x = 1422
integer y = 2560
integer width = 453
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Revisión Validador"
end type

event clicked;String	ls_base,ls_serie,ls_dv
Long		ll_rut,ll_row,ll_new
double	ldb_numero

if dw_comision.getrow()>0 then
	ll_row																		= dw_comision.getrow()
	ls_base																		= dw_promesa.getitemstring(1,'base')
	ls_serie																		= dw_promesa.getitemstring(1,'serie')
	ldb_numero																	= dw_promesa.getitemnumber(1,'numero')
	ll_rut																		= dw_comision.getitemnumber(ll_row,'rut_titular')
	ls_dv																			= dw_comision.getitemstring(ll_row,'dv_titular')
	if not isnull(ls_base) and ls_base <>'' and not isnull(ls_serie) and ls_serie <>'' and not isnull(ldb_numero) and ldb_numero > 0 and not isnull(ll_rut) and ll_rut > 0 and not isnull(ls_dv) and ls_dv <>'' then
		if isvalid(w_validar_promesa_operaciones) then close(w_validar_promesa_operaciones)
		open(w_validar_promesa_operaciones)
		if ls_base='O' then
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_promesa'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			ll_new																= w_validar_promesa_operaciones.dw_revision.insertrow(0)
			w_validar_promesa_operaciones.dw_revision.setitem(ll_new,'pie',0)
		end if
		w_validar_promesa_operaciones.em_rut.text						= string(ll_rut,"###,###,###,###,###")
		w_validar_promesa_operaciones.em_dv.text						= trim(ls_dv)
		w_validar_promesa_operaciones.dw_base.setitem(1,'base',ls_base)
		w_validar_promesa_operaciones.ddlb_serie.text					= trim(ls_serie)
		w_validar_promesa_operaciones.em_numero.text					= string(ldb_numero,"###,###,###,###,###")
		w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
		w_validar_promesa_operaciones.dw_revision.enabled			= true
		w_validar_promesa_operaciones.dw_base.enabled				= false
		w_validar_promesa_operaciones.ddlb_serie.enabled				= false
		w_validar_promesa_operaciones.em_numero.enabled				= false
		w_validar_promesa_operaciones.em_rut.enabled					= true
		w_validar_promesa_operaciones.em_dv.enabled					= true
		w_validar_promesa_operaciones.dw_revision.setfocus()
		cb_cerrar.triggerevent(clicked!)
	else
		if isnull(ls_base) or ls_base='' then
			messagebox("Advertencia", "Debe Ingresar Base Promesa")
			dw_promesa.setfocus()
			dw_promesa.setcolumn('base')
		elseif isnull(ls_serie) or ls_serie='' then
			messagebox("Advertencia", "Debe Ingresar Serie Promesa")
			dw_promesa.setfocus()
			dw_promesa.setcolumn('serie')
		elseif isnull(ldb_numero) or ldb_numero=0 then
			messagebox("Advertencia", "Debe Ingresar Numero de Promesa")
			dw_promesa.setfocus()
			dw_promesa.setcolumn('numero')
		elseif isnull(ll_rut) or ll_rut = 0 then
			messagebox("Advertencia", "Debe Ingresar Numero de Rut")
			dw_comision.setfocus()
			dw_comision.setcolumn('rut_titular')
		elseif isnull(ls_dv) or ls_dv='' then
			messagebox("Advertencia", "Debe Ingresar Digito Verificador Rut")
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_titular')	
		end if
	end if
end if








end event

type em_fecha_actual from statictext within w_solicitud_pago_funeraria
integer x = 2843
integer y = 28
integer width = 398
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_gestion from commandbutton within w_solicitud_pago_funeraria
integer x = 640
integer y = 2560
integer width = 416
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Gestión"
end type

event clicked;string	ls_base,ls_serie,ls_string
double		ldb_numero

close(w_solicitud_control_funeraria)
dw_comision.accepttext()
if dw_comision.rowcount()>0 then
	ls_base				= dw_comision.getitemstring(1,'base')
	ls_serie				= dw_comision.getitemstring(1,'serie')
	ldb_numero			= dw_comision.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 and dw_comision.dataobject='dw_pago_comision_funeraria' then
		ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
		if isvalid(w_solicitud_control_funeraria) then close(w_solicitud_control_funeraria)
		OpenWithParm (w_solicitud_control_funeraria,ls_string)
	end if
end if
end event

type cb_imprimir from commandbutton within w_solicitud_pago_funeraria
integer x = 2226
integer y = 2560
integer width = 238
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;string	ls_base_consul,ls_serie_consul,ls_base,ls_serie,ls_string
double	ldb_num_consul,ldb_numero

dw_promesa.accepttext()

ls_base_consul		= dw_promesa.getitemstring(1,'base')
ls_serie_consul	= dw_promesa.getitemstring(1,'serie')
ldb_num_consul	= dw_promesa.getitemnumber(1,'numero')

SELECT	"FUNERARIA_PAGO_COMISION"."BASE",	"FUNERARIA_PAGO_COMISION"."SERIE",	"FUNERARIA_PAGO_COMISION"."NUMERO"  
INTO		:ls_base,									:ls_serie,									:ldb_numero  
FROM		"FUNERARIA_PAGO_COMISION"  
WHERE		( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base_consul ) AND  
         ( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie_consul ) AND  
         ( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_num_consul ) AND
			( "FUNERARIA_PAGO_COMISION"."FOLIO" > 0)
USING sqlca;
if sqlca.sqlcode = 0 then
	ls_string			= ls_base_consul+'~t'+ls_serie_consul+'~t'+string(ldb_num_consul)
	if isvalid(w_solicitud_funeraria_impresion) then close(w_solicitud_funeraria_impresion)
	OpenWithParm(w_solicitud_funeraria_impresion, ls_string)
else
	messagebox("Advertencia","Debe Grabar El Registros Para su Impresión")
end if
end event

type cb_grabar from commandbutton within w_solicitud_pago_funeraria
integer x = 41
integer y = 2560
integer width = 279
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_cod_age,ls_nombre_contac,ls_a_paterno_contac,ls_a_materno_contac,ls_fono_contac,ls_estado_modif,&
			ls_cod_sup,ls_glosa,ls_glosa_detalle,ls_area,ls_sector,ls_sepultura,ls_moneda,ls_nombre_titular,&
			ls_a_paterno_titular,ls_a_materno_titular,ls_dv_titular,ls_fono_titular,ls_direcc_titular,ls_direcc_num_titular,&
			ls_direcc_block_titular,ls_direcc_depto_titular,ls_comuna_titular,ls_ciudad_titular,ls_nombre_repres,ls_a_paterno_repres,&
			ls_a_materno_repres,ls_dv_repres,ls_fono_repres,ls_direcc_repres,ls_direcc_num_repres,ls_direcc_block_repres,&
			ls_direcc_depto_repres,ls_comuna_repres,ls_ciudad_repres,ls_nombre_fallec,ls_a_paterno_fallec,ls_a_materno_fallec,&
			ls_dv_fallec,ls_tipo_construcc,ls_tipo_sepultura,ls_uso,ls_base_gestion,ls_serie_gestion,ls_modif_reg
long		ll_cod_funeraria,ll_hora,ll_minuto,ll_res,ll_mes,ll_ano,ll_cod_parque,ll_cod_estado,ll_graba,&
			ll_new,ll_numero,ll_rut_titular,ll_rut_repres,ll_folio,ll_numero_dato,ll_neto_comi,ll_retencion,ll_total_pago_comi,&
			ll_rut_fallec,ll_capacidad,ll_fila,ll_numero_gestion
datetime	ldt_fecha_cierre,ldt_fecha_actual,ldt_fecha_ctto
double	ldb_contrato,ldb_num_consul,ldb_precio_lista,ldb_precio_ctto,ldb_porce_descto,ldb_porce_comi,ldb_uf_dia

dw_promesa.accepttext()
dw_comision.accepttext()
if dw_comision.rowcount()>0 then
	SetPointer(HourGlass!)
	ls_base								= dw_promesa.getitemstring(1,'base')
	ls_serie								= dw_promesa.getitemstring(1,'serie')
	ldb_contrato							= dw_promesa.getitemnumber(1,'numero')
	ls_cod_age							= dw_comision.getitemstring(1,'cod_agente')
	ll_cod_funeraria					= dw_comision.getitemnumber(1,'cod_funeraria')
	ldt_fecha_cierre					= dw_comision.getitemdatetime(1,'fecha_cierre')
	ll_mes								= month(date(ldt_fecha_cierre))
	ll_ano									= year(date(ldt_fecha_cierre))
	ll_hora								= dw_comision.getitemnumber(1,'hora_cierre')
	ll_minuto								= dw_comision.getitemnumber(1,'minuto_cierre')
	ll_cod_estado						= dw_comision.getitemnumber(1,'cod_estado') //estado//
	ls_nombre_contac					= dw_comision.getitemstring(1,'nombre_contacto')
	ls_a_paterno_contac				= dw_comision.getitemstring(1,'a_paterno_contacto')
	ls_a_materno_contac				= dw_comision.getitemstring(1,'a_materno_contacto')
	ls_fono_contac						= dw_comision.getitemstring(1,'fono_contacto')
	ll_cod_parque						= dw_comision.getitemnumber(1,'cod_parque')
	ldt_fecha_ctto						= dw_comision.getitemdatetime(1,'fecha_ctto')
	ls_area								= dw_comision.getitemstring(1,'area')
	ls_sector								= dw_comision.getitemstring(1,'plani_sector')
	ls_sepultura							= dw_comision.getitemstring(1,'plani_sepultura')
	ls_tipo_construcc					= dw_comision.getitemstring(1,'t_const')
	ls_tipo_sepultura					= dw_comision.getitemstring(1,'t_sepult')
	ll_capacidad							= dw_comision.getitemnumber(1,'capacidad')
	ls_uso								= dw_comision.getitemstring(1,'uso')
	ls_moneda							= dw_comision.getitemstring(1,'moneda')
	ldb_precio_lista						= dw_comision.getitemnumber(1,'precio_lista')
	ldb_precio_ctto						= dw_comision.getitemnumber(1,'precio_ctto')
	ldb_porce_descto					= dw_comision.getitemnumber(1,'porce_descto')
	ll_rut_titular							= dw_comision.getitemnumber(1,'rut_titular')
	ls_dv_titular							= dw_comision.getitemstring(1,'dv_titular')
	ls_nombre_titular					= dw_comision.getitemstring(1,'nombre_titular')
	ls_a_paterno_titular				= dw_comision.getitemstring(1,'a_paterno_titular')
	ls_a_materno_titular				= dw_comision.getitemstring(1,'a_materno_titular')
	ls_direcc_titular					= dw_comision.getitemstring(1,'direccion_titular')
	ls_direcc_num_titular				= dw_comision.getitemstring(1,'direccion_numero_titular')
	ls_direcc_block_titular			= dw_comision.getitemstring(1,'direccion_block_titular')
	ls_direcc_depto_titular			= dw_comision.getitemstring(1,'direccion_depto_titular')
	ls_fono_titular						= dw_comision.getitemstring(1,'fono_titular')
	ls_ciudad_titular					= dw_comision.getitemstring(1,'ciudad_titular')
	ls_comuna_titular					= dw_comision.getitemstring(1,'comuna_titular')
	ll_rut_repres						= dw_comision.getitemnumber(1,'rut_representante')
	ls_dv_repres						= dw_comision.getitemstring(1,'dv_representente')
	ls_nombre_repres					= dw_comision.getitemstring(1,'nombre_representante')
	ls_a_paterno_repres				= dw_comision.getitemstring(1,'a_paterno_representante')
	ls_a_materno_repres				= dw_comision.getitemstring(1,'a_materno_representante')
	ls_direcc_repres					= dw_comision.getitemstring(1,'direccion_representante')
	ls_direcc_num_repres			= dw_comision.getitemstring(1,'numero_representante')
	ls_direcc_block_repres			= dw_comision.getitemstring(1,'block_representante')
	ls_direcc_depto_repres			= dw_comision.getitemstring(1,'depto_representante')
	ls_fono_repres						= dw_comision.getitemstring(1,'fono_represent')
	ls_ciudad_repres					= dw_comision.getitemstring(1,'ciudad_representante')
	ls_comuna_repres					= dw_comision.getitemstring(1,'comuna_representante')
	ll_folio								= dw_comision.getitemnumber(1,'folio')
	ll_numero_dato						= dw_comision.getitemnumber(1,'numero_dato')
	ldb_uf_dia							= dw_comision.getitemnumber(1,'uf_dia')
	ldb_porce_comi					= dw_comision.getitemnumber(1,'porce_comision')
	ll_neto_comi						= dw_comision.getitemnumber(1,'neto_comision')
	ll_retencion							= dw_comision.getitemnumber(1,'retencion')
	ll_total_pago_comi					= dw_comision.getitemnumber(1,'total_pago')
	ll_rut_fallec							= dw_comision.getitemnumber(1,'rut_fallecido')
	ls_dv_fallec							= dw_comision.getitemstring(1,'dv_fallecido')
	ls_nombre_fallec					= dw_comision.getitemstring(1,'nombre_fallecido')
	ls_a_paterno_fallec				= dw_comision.getitemstring(1,'a_paterno_fallecido')
	ls_a_materno_fallec				= dw_comision.getitemstring(1,'a_materno_fallecido')
	ldt_fecha_actual					= gdt_fec_sistema
	ls_estado_modif					= 'V'
	
	SELECT	"AGENTES"."COD_SUP"  
	INTO		:ls_cod_sup  
	FROM		"AGENTES"  
	WHERE	"AGENTES"."COD_AGE" = :ls_cod_age
	USING	sqlca;
	if isnull(ls_cod_sup) or ls_cod_sup='' then ls_cod_sup 	= ''
	if ls_cod_sup = '' then
		messagebox("Advertencia","Revisar Estructura Ventas Canal NI")
	else
		if isnull(ll_cod_estado) or ll_cod_estado = 0 then
			ll_cod_estado					= 1
		else
			ll_cod_estado					= ll_cod_estado
		end if
		if ll_cod_estado = 1 and (gs_depto ='X' or gs_depto ='O' or gs_depto = 'I') then
			dw_comision.setitem(1,'cod_supervisor',ls_cod_sup)
			dw_comision.accepttext()
			
			SELECT	"FUNERARIA_ESTADO"."GLOSA"
			INTO		:ls_glosa
			FROM		"FUNERARIA_ESTADO"  
			WHERE	"FUNERARIA_ESTADO"."CODIGO" = :ll_cod_estado
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				ls_glosa_detalle		= 'SE CREA SOLICITUD USUARIO: '+ gs_user +', CON FECHA: '+string(ldt_fecha_actual,'dd/mm/yyyy')+', GLOSA: '+ls_glosa
			end if
			SELECT	COUNT("FUNERARIA_PAGO_COMISION"."NUMERO")
			INTO		:ldb_num_consul					
			FROM		"FUNERARIA_PAGO_COMISION"  
			WHERE	( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base ) AND  
						( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie ) AND  
						( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_contrato )
			USING sqlca;
			if sqlca.sqlcode = 0 then
				if not isnull(ldb_num_consul) or ldb_num_consul>1 then
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_contrato>0 and not isnull(ls_cod_age) and ls_cod_age<>''& 
						and ll_cod_funeraria>0 and not isnull(ldt_fecha_cierre) and ll_mes>0 and ll_ano>0 and not isnull(ll_hora) and not isnull(ll_minuto) & 
						and not isnull(ls_nombre_contac) and ls_nombre_contac<>'' and not isnull(ls_a_paterno_contac) and ls_a_paterno_contac<>'' and not isnull(ls_a_materno_contac) and ls_a_materno_contac<>''& 
						and not isnull(ls_fono_contac) and ls_fono_contac<>'' and ll_cod_parque>0 and not isnull(ldt_fecha_ctto) and not isnull(ls_area) and ls_area<>''& 
						and not isnull(ls_sector) and ls_sector<>'' and not isnull(ls_sepultura) and ls_sepultura<>'' and not isnull(ls_tipo_construcc) and  ls_tipo_construcc <> '' & 
						and not isnull(ls_tipo_sepultura) and ls_tipo_sepultura<>'' and ll_capacidad >0 and not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) and ls_moneda<>'' and ldb_precio_lista>0 &
						and ldb_precio_ctto>0  and ll_rut_titular>0 and not isnull(ls_dv_titular) and ls_dv_titular<>'' and not isnull(ls_nombre_titular) and ls_nombre_titular<>'' and not isnull(ls_a_paterno_titular) and ls_a_paterno_titular<>''& 
						and not isnull(ls_a_materno_titular) and ls_a_materno_titular<>'' and not isnull(ls_direcc_titular) and ls_direcc_titular<>'' and not isnull(ls_direcc_num_titular) and ls_direcc_num_titular<>'' & 
						and not isnull(ls_direcc_block_titular) and ls_direcc_block_titular<>'' and not isnull(ls_direcc_depto_titular) and ls_direcc_depto_titular<>'' and not isnull(ls_fono_titular) and ls_fono_titular<>'' & 
						and not isnull(ls_ciudad_titular) and ls_ciudad_titular<>'' and not isnull(ls_comuna_titular) and ls_comuna_titular<>'' and ll_rut_repres>0 and not isnull(ls_dv_repres) and ls_dv_repres<>'' & 
						and not isnull(ls_nombre_repres) and ls_nombre_repres<>'' and not isnull(ls_a_paterno_repres) and ls_a_paterno_repres<>'' and not isnull(ls_a_materno_repres) and ls_a_materno_repres<>'' & 
						and not isnull(ls_direcc_repres) and ls_direcc_repres<>'' and not isnull(ls_direcc_num_repres) and ls_direcc_num_repres<>'' and not isnull(ls_direcc_block_repres) and ls_direcc_block_repres<>'' & 
						and not isnull(ls_direcc_depto_repres) and ls_direcc_depto_repres<>'' and not isnull(ls_fono_repres) and ls_fono_repres<>'' and not isnull(ls_ciudad_repres) and ls_ciudad_repres<>'' & 
						and not isnull(ls_comuna_repres) and ls_comuna_repres<>'' and ll_folio>0 and ll_numero_dato>0 and ldb_uf_dia>0 and ll_neto_comi>0 and ll_retencion>0 and ll_total_pago_comi>0 & 
						and not isnull(ls_nombre_fallec) and ls_nombre_fallec<>'' and not isnull(ls_a_paterno_fallec) and ls_a_paterno_fallec<>'' and not isnull(ls_a_materno_fallec) and ls_a_materno_fallec<>'' and ll_rut_fallec>0 and not isnull(ls_dv_fallec) and ls_dv_fallec<>'' then
						
						ll_res									= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
						ll_cod_estado 						= 4
						dw_comision.setitem(1,'fecha_crea',ldt_fecha_actual)
						dw_comision.setitem(1,'cod_estado',ll_cod_estado)
						dw_comision.setitem(1,'fecha_estado',ldt_fecha_actual)
						dw_comision.accepttext()
						if ll_res = 1 then
							ll_graba							= wf_grabar(ls_base,ls_serie,ldb_contrato,'N',ldt_fecha_actual,ll_cod_estado,'',ls_cod_age,ls_cod_sup,ll_cod_parque,ls_estado_modif,ll_mes,ll_ano)
							if ll_graba=1 then
								messagebox("Grabar","Grabación Exitosa")
							else
								messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+sqlca.sqlerrtext)
							end if
						end if
					else
						if isnull(ls_base) or ls_base='' then
							messagebox("Advertencia", "Debe Ingresar Base Promesa")
							dw_promesa.setfocus()
							dw_promesa.setcolumn('base')
						elseif isnull(ls_serie) or ls_serie='' then
							messagebox("Advertencia", "Debe Ingresar Serie Promesa")
							dw_promesa.setfocus()
							dw_promesa.setcolumn('serie')
						elseif isnull(ldb_contrato) or ldb_contrato=0 then
							messagebox("Advertencia", "Debe Ingresar Numero de Promesa")
							dw_promesa.setfocus()
							dw_promesa.setcolumn('numero')
						elseif isnull(ls_cod_age) or ls_cod_age='' then
							messagebox("Advertencia", "Debe Ingresar Agentes de Ventas")
							dw_comision.setfocus()
							dw_comision.setcolumn('cod_agente')
						elseif isnull(ll_cod_funeraria) or ll_cod_funeraria=0 then
							messagebox("Advertencia", "Debe Ingresar Funeraria")
							dw_comision.setfocus()
							dw_comision.setcolumn('cod_funeraria')
						elseif isnull(ldt_fecha_cierre) then
							messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
							dw_comision.setfocus()
							dw_comision.setcolumn('fecha_cierre')
						elseif isnull(ll_hora) then
							messagebox("Advertencia", "Debe Ingresar Hora de Cierre")
							dw_comision.setfocus()
							dw_comision.setcolumn('hora_cierre')
						elseif isnull(ll_minuto) then
							messagebox("Advertencia", "Ingresar Minuto de Cierre")
							dw_comision.setfocus()
							dw_comision.setcolumn('minuto_cierre')
						elseif isnull(ls_nombre_contac) or ls_nombre_contac='' then
							messagebox("Advertencia", "Debe Ingresar Nombre del Contacto")
							dw_comision.setfocus()
							dw_comision.setcolumn('nombre_contacto')
						elseif isnull(ls_a_paterno_contac) or ls_a_paterno_contac='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Paterno")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_paterno_contacto')
						elseif isnull(ls_a_materno_contac) or ls_a_materno_contac='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Materno")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_materno_contacto')
						elseif isnull(ls_fono_contac) or ls_fono_contac='' then
							messagebox("Advertencia", "Debe Ingresar Telefono Contacto")
							dw_comision.setfocus()
							dw_comision.setcolumn('fono_contacto')
						elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
							messagebox("Advertencia", "Debe Ingresar Parque")
							dw_comision.setfocus()
							dw_comision.setcolumn('cod_parque')
						elseif isnull(ldt_fecha_ctto) then
							messagebox("Advertencia", "Debe Ingresar Fecha Contrato")
							dw_comision.setfocus()
							dw_comision.setcolumn('fecha_ctto')
						elseif isnull(ls_area) or ls_area='' then
							messagebox("Advertencia", "Debe Ingresar Area Sepultura")
							dw_comision.setfocus()
							dw_comision.setcolumn('area')
						elseif isnull(ls_sector) or ls_sector='' then
							messagebox("Advertencia", "Debe Ingresar Sector Sepultura")
							dw_comision.setfocus()
							dw_comision.setcolumn('plani_sector')
						elseif isnull(ls_sepultura) or ls_sepultura='' then
							messagebox("Advertencia", "Debe Ingresar Número Sepultura")
							dw_comision.setfocus()
							dw_comision.setcolumn('plani_sepultura')
						elseif isnull(ls_tipo_construcc) or ls_tipo_construcc='' then
							messagebox("Advertencia", "Debe Ingresar Tipo Construcción")
							dw_comision.setfocus()
							dw_comision.setcolumn('t_const')
						elseif isnull(ls_tipo_sepultura) or ls_tipo_sepultura='' then
							messagebox("Advertencia", "Debe Ingresar Tipo Sepultura")
							dw_comision.setfocus()
							dw_comision.setcolumn('t_sepult')
						elseif isnull(ll_capacidad) or ll_capacidad=0 then
							messagebox("Advertencia", "Debe Ingresar Capacidad")
							dw_comision.setfocus()
							dw_comision.setcolumn('capacidad')
						elseif isnull(ls_uso) or ls_uso='' then
							messagebox("Advertencia", "Debe Ingresar Uso Sepultura")
							dw_comision.setfocus()
							dw_comision.setcolumn('uso')
						elseif isnull(ls_moneda) or ls_moneda='' then
							messagebox("Advertencia", "Debe Ingresar Tipo Moneda")
							dw_comision.setfocus()
							dw_comision.setcolumn('moneda')
						elseif isnull(ldb_precio_lista) or ldb_precio_lista=0 then
							messagebox("Advertencia", "Debe Ingresar Precio de Lista")
							dw_comision.setfocus()
							dw_comision.setcolumn('precio_lista')
						elseif isnull(ldb_precio_ctto) or ldb_precio_ctto=0 then
							messagebox("Advertencia", "Debe Ingresar Precio de Venta")
							dw_comision.setfocus()
							dw_comision.setcolumn('precio_ctto')
						elseif isnull(ll_rut_titular) or ll_rut_titular=0 then
							messagebox("Advertencia", "Debe Ingresar Rut Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('rut_titular')
						elseif isnull(ls_dv_titular) or ls_dv_titular='' then
							messagebox("Advertencia", "Debe Ingresar Digito Rut Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('dv_titular')
						elseif isnull(ls_nombre_titular) or ls_nombre_titular='' then
							messagebox("Advertencia", "Debe Ingresar Nombre Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('nombre_titular')
						elseif isnull(ls_a_paterno_titular) or ls_a_paterno_titular='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Paterno Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_paterno_titular')
						elseif isnull(ls_a_materno_titular) or ls_a_materno_titular='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Materno Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_materno_titular')
						elseif isnull(ls_direcc_titular) or ls_direcc_titular='' then
							messagebox("Advertencia", "Debe Ingresar Dirección Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('direccion_titular')
						elseif isnull(ls_direcc_num_titular) or ls_direcc_num_titular='' then
							messagebox("Advertencia", "Debe Ingresar Dirección Número Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('direccion_numero_titular')
						elseif isnull(ls_direcc_block_titular) or ls_direcc_block_titular='' then
							messagebox("Advertencia", "Debe Ingresar Block Dirección Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('direccion_block_titular')
						elseif isnull(ls_direcc_depto_titular) or ls_direcc_depto_titular='' then
							messagebox("Advertencia", "Debe Ingresar Block Dirección Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('direccion_depto_titular')
						elseif isnull(ls_fono_titular) or ls_fono_titular='' then
							messagebox("Advertencia", "Debe Ingresar Fono Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('fono_titular')
						elseif isnull(ls_ciudad_titular) or ls_ciudad_titular='' then
							messagebox("Advertencia", "Debe Ingresar Ciudad Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('ciudad_titular')
						elseif isnull(ls_comuna_titular) or ls_comuna_titular='' then
							messagebox("Advertencia", "Debe Ingresar Comuna Titular")
							dw_comision.setfocus()
							dw_comision.setcolumn('comuna_titular')
						elseif isnull(ll_rut_repres) or ll_rut_repres=0 then
							messagebox("Advertencia", "Debe Ingresar Rut Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('rut_representante')
						elseif isnull(ls_dv_repres) or ls_dv_repres='' then
							messagebox("Advertencia", "Debe Ingresar Digito Rut Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('dv_representente')
						elseif isnull(ls_nombre_repres) or ls_nombre_repres='' then
							messagebox("Advertencia", "Debe Ingresar Nombre Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('nombre_representante')
						elseif isnull(ls_a_paterno_repres) or ls_a_paterno_repres='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Paterno Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_paterno_representante')
						elseif isnull(ls_a_materno_repres) or ls_a_materno_repres='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Materno Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_materno_representante')
						elseif isnull(ls_direcc_repres) or ls_direcc_repres='' then
							messagebox("Advertencia", "Debe Ingresar Dirección Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('direccion_representante')
						elseif isnull(ls_direcc_num_repres) or ls_direcc_num_repres='' then
							messagebox("Advertencia", "Debe Ingresar Número Dirección Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('numero_representante')
						elseif isnull(ls_direcc_block_repres) or ls_direcc_block_repres='' then
							messagebox("Advertencia", "Debe Ingresar Block Dirección Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('block_representante')
						elseif isnull(ls_direcc_depto_repres) or ls_direcc_depto_repres='' then
							messagebox("Advertencia", "Debe Ingresar Depto. Dirección Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('depto_representante')
						elseif isnull(ls_fono_repres) or ls_fono_repres='' then
							messagebox("Advertencia", "Debe Ingresar Fono Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('fono_represent')
						elseif isnull(ls_ciudad_repres) or ls_ciudad_repres='' then
							messagebox("Advertencia", "Debe Ingresar Ciudad Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('ciudad_representante')
						elseif isnull(ls_comuna_repres) or ls_comuna_repres='' then
							messagebox("Advertencia", "Debe Ingresar Comuna Representante")
							dw_comision.setfocus()
							dw_comision.setcolumn('comuna_representante')
						elseif isnull(ll_folio) or ll_folio=0 then
							messagebox("Advertencia", "Debe Ingresar Número Folio")
							dw_comision.setfocus()
							dw_comision.setcolumn('folio')
						elseif isnull(ll_numero_dato) or ll_numero_dato=0 then
							messagebox("Advertencia", "Debe Ingresar Número Dato")
							dw_comision.setfocus()
							dw_comision.setcolumn('numero_dato')
						elseif isnull(ldb_uf_dia) or ldb_uf_dia=0 then
							messagebox("Advertencia", "Debe Ingresar Valor UF Día")
							dw_comision.setfocus()
							dw_comision.setcolumn('uf_dia')
						elseif isnull(ldb_porce_comi) or ldb_porce_comi=0 then
							messagebox("Advertencia", "Debe Ingresar Porcentaje Comisión")
							dw_comision.setfocus()
							dw_comision.setcolumn('porce_comision')
						elseif isnull(ll_neto_comi) or ll_neto_comi=0 then
							messagebox("Advertencia", "Debe Ingresar Valor Neto Comisión a Pago")
							dw_comision.setfocus()
							dw_comision.setcolumn('neto_comision')
						elseif isnull(ll_retencion) or ll_retencion=0 then
							messagebox("Advertencia", "Debe Ingresar Valor Retención Comisión a Pago")
							dw_comision.setfocus()
							dw_comision.setcolumn('retencion')
						elseif isnull(ll_total_pago_comi) or ll_total_pago_comi=0 then
							messagebox("Advertencia", "Debe Ingresar Valor Total Comisión a Pago")
							dw_comision.setfocus()
							dw_comision.setcolumn('total_pago')
						elseif isnull(ll_rut_fallec) or ll_rut_fallec=0 then
							messagebox("Advertencia", "Debe Ingresar Rut Fallecido")
							dw_comision.setfocus()
							dw_comision.setcolumn('rut_fallecido')
						elseif isnull(ls_dv_fallec) or ls_dv_fallec='' then
							messagebox("Advertencia", "Debe Ingresar Digito Rut Fallecido")
							dw_comision.setfocus()
							dw_comision.setcolumn('dv_fallecido')
						elseif isnull(ls_nombre_fallec) or ls_nombre_fallec='' then
							messagebox("Advertencia", "Debe Ingresar Nombre Fallecido")
							dw_comision.setfocus()
							dw_comision.setcolumn('nombre_fallecido')
						elseif isnull(ls_a_paterno_fallec) or ls_a_paterno_fallec='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Paterno Fallecido")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_paterno_fallecido')
						elseif isnull(ls_a_materno_fallec) or ls_a_materno_fallec='' then
							messagebox("Advertencia", "Debe Ingresar Apellido Materno Fallecido")
							dw_comision.setfocus()
							dw_comision.setcolumn('a_materno_fallecido')
						end if
					end if
				else
					messagebox("Advertencia","No Puede Grabar El Registro La Solicitud Ya Fue Creada ")
				end if
			end if
		elseif ll_cod_estado > 1 and (gs_depto ='P' or gs_depto ='X' or gs_depto ='V' or gs_depto ='O' or gs_depto ='C' or gs_depto ='T' or gs_depto ='I') then
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_contrato>0 and not isnull(ls_cod_age) and ls_cod_age<>''& 
				and ll_cod_funeraria>0 and not isnull(ldt_fecha_cierre) and ll_mes>0 and ll_ano>0 and not isnull(ll_hora) and not isnull(ll_minuto) & 
				and not isnull(ls_nombre_contac) and ls_nombre_contac<>'' and not isnull(ls_a_paterno_contac) and ls_a_paterno_contac<>'' and not isnull(ls_a_materno_contac) and ls_a_materno_contac<>''& 
				and not isnull(ls_fono_contac) and ls_fono_contac<>'' and ll_cod_parque>0 and not isnull(ldt_fecha_ctto) and not isnull(ls_area) and ls_area<>''& 
				and not isnull(ls_sector) and ls_sector<>'' and not isnull(ls_sepultura) and ls_sepultura<>'' and not isnull(ls_tipo_construcc) and  ls_tipo_construcc <> '' & 
				and not isnull(ls_tipo_sepultura) and ls_tipo_sepultura<>'' and ll_capacidad >0 and not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) and ls_moneda<>'' and ldb_precio_lista>0 &
				and ldb_precio_ctto>0  and ll_rut_titular>0 and not isnull(ls_dv_titular) and ls_dv_titular<>'' and not isnull(ls_nombre_titular) and ls_nombre_titular<>'' and not isnull(ls_a_paterno_titular) and ls_a_paterno_titular<>''& 
				and not isnull(ls_a_materno_titular) and ls_a_materno_titular<>'' and not isnull(ls_direcc_titular) and ls_direcc_titular<>'' and not isnull(ls_direcc_num_titular) and ls_direcc_num_titular<>'' & 
				and not isnull(ls_direcc_block_titular) and ls_direcc_block_titular<>'' and not isnull(ls_direcc_depto_titular) and ls_direcc_depto_titular<>'' and not isnull(ls_fono_titular) and ls_fono_titular<>'' & 
				and not isnull(ls_ciudad_titular) and ls_ciudad_titular<>'' and not isnull(ls_comuna_titular) and ls_comuna_titular<>'' and ll_rut_repres>0 and not isnull(ls_dv_repres) and ls_dv_repres<>'' & 
				and not isnull(ls_nombre_repres) and ls_nombre_repres<>'' and not isnull(ls_a_paterno_repres) and ls_a_paterno_repres<>'' and not isnull(ls_a_materno_repres) and ls_a_materno_repres<>'' & 
				and not isnull(ls_direcc_repres) and ls_direcc_repres<>'' and not isnull(ls_direcc_num_repres) and ls_direcc_num_repres<>'' and not isnull(ls_direcc_block_repres) and ls_direcc_block_repres<>'' & 
				and not isnull(ls_direcc_depto_repres) and ls_direcc_depto_repres<>'' and not isnull(ls_fono_repres) and ls_fono_repres<>'' and not isnull(ls_ciudad_repres) and ls_ciudad_repres<>'' & 
				and not isnull(ls_comuna_repres) and ls_comuna_repres<>'' and ll_folio>0 and ll_numero_dato>0 and ldb_uf_dia>0 and ll_neto_comi>0 and ll_retencion>0 and ll_total_pago_comi>0 & 
				and not isnull(ls_nombre_fallec) and ls_nombre_fallec<>'' and not isnull(ls_a_paterno_fallec) and ls_a_paterno_fallec<>'' and not isnull(ls_a_materno_fallec) and ls_a_materno_fallec<>'' and ll_rut_fallec>0 and not isnull(ls_dv_fallec) and ls_dv_fallec<>'' then
				
				ll_res											= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
				if ll_res = 1 then
					ls_modif_reg							= wf_valida_datos(ls_base,ls_serie,ldb_contrato)
					ll_graba									= wf_grabar(ls_base,ls_serie,ldb_contrato,ls_modif_reg,ldt_fecha_actual,ll_cod_estado,ls_glosa,ls_cod_age,ls_cod_sup,ll_cod_parque,ls_estado_modif,ll_mes,ll_ano)
					if ll_graba=1 then
						messagebox("Grabar","Grabación Exitosa")
					else
						messagebox("Error Grabar","Error Grabar Funeraria Detalle SQL: "+sqlca.sqlerrtext)
					end if
				end if
			else
				if isnull(ls_base) or ls_base='' then
					messagebox("Advertencia", "Debe Ingresar Base Promesa")
					dw_promesa.setfocus()
					dw_promesa.setcolumn('base')
				elseif isnull(ls_serie) or ls_serie='' then
					messagebox("Advertencia", "Debe Ingresar Serie Promesa")
					dw_promesa.setfocus()
					dw_promesa.setcolumn('serie')
				elseif isnull(ldb_contrato) or ldb_contrato=0 then
					messagebox("Advertencia", "Debe Ingresar Numero de Promesa")
					dw_promesa.setfocus()
					dw_promesa.setcolumn('numero')
				elseif isnull(ls_cod_age) or ls_cod_age='' then
					messagebox("Advertencia", "Debe Ingresar Agentes de Ventas")
					dw_comision.setfocus()
					dw_comision.setcolumn('cod_agente')
				elseif isnull(ll_cod_funeraria) or ll_cod_funeraria=0 then
					messagebox("Advertencia", "Debe Ingresar Funeraria")
					dw_comision.setfocus()
					dw_comision.setcolumn('cod_funeraria')
				elseif isnull(ldt_fecha_cierre) then
					messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
					dw_comision.setfocus()
					dw_comision.setcolumn('fecha_cierre')
				elseif isnull(ll_hora) then
					messagebox("Advertencia", "Debe Ingresar Hora de Cierre")
					dw_comision.setfocus()
					dw_comision.setcolumn('hora_cierre')
				elseif isnull(ll_minuto) then
					messagebox("Advertencia", "Ingresar Minuto de Cierre")
					dw_comision.setfocus()
					dw_comision.setcolumn('minuto_cierre')
				elseif isnull(ls_nombre_contac) or ls_nombre_contac='' then
					messagebox("Advertencia", "Debe Ingresar Nombre del Contacto")
					dw_comision.setfocus()
					dw_comision.setcolumn('nombre_contacto')
				elseif isnull(ls_a_paterno_contac) or ls_a_paterno_contac='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Paterno")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_paterno_contacto')
				elseif isnull(ls_a_materno_contac) or ls_a_materno_contac='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Materno")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_materno_contacto')
				elseif isnull(ls_fono_contac) or ls_fono_contac='' then
					messagebox("Advertencia", "Debe Ingresar Telefono Contacto")
					dw_comision.setfocus()
					dw_comision.setcolumn('fono_contacto')
				elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
					messagebox("Advertencia", "Debe Ingresar Parque")
					dw_comision.setfocus()
					dw_comision.setcolumn('cod_parque')
				elseif isnull(ldt_fecha_ctto) then
					messagebox("Advertencia", "Debe Ingresar Fecha Contrato")
					dw_comision.setfocus()
					dw_comision.setcolumn('fecha_ctto')
				elseif isnull(ls_area) or ls_area='' then
					messagebox("Advertencia", "Debe Ingresar Area Sepultura")
					dw_comision.setfocus()
					dw_comision.setcolumn('area')
				elseif isnull(ls_sector) or ls_sector='' then
					messagebox("Advertencia", "Debe Ingresar Sector Sepultura")
					dw_comision.setfocus()
					dw_comision.setcolumn('plani_sector')
				elseif isnull(ls_sepultura) or ls_sepultura='' then
					messagebox("Advertencia", "Debe Ingresar Número Sepultura")
					dw_comision.setfocus()
					dw_comision.setcolumn('plani_sepultura')
				elseif isnull(ls_tipo_construcc) or ls_tipo_construcc='' then
					messagebox("Advertencia", "Debe Ingresar Tipo Construcción")
					dw_comision.setfocus()
					dw_comision.setcolumn('t_const')
				elseif isnull(ls_tipo_sepultura) or ls_tipo_sepultura='' then
					messagebox("Advertencia", "Debe Ingresar Tipo Sepultura")
					dw_comision.setfocus()
					dw_comision.setcolumn('t_sepult')
				elseif isnull(ll_capacidad) or ll_capacidad=0 then
					messagebox("Advertencia", "Debe Ingresar Capacidad")
					dw_comision.setfocus()
					dw_comision.setcolumn('capacidad')
				elseif isnull(ls_uso) or ls_uso='' then
					messagebox("Advertencia", "Debe Ingresar Uso Sepultura")
					dw_comision.setfocus()
					dw_comision.setcolumn('uso')
				elseif isnull(ls_moneda) or ls_moneda='' then
					messagebox("Advertencia", "Debe Ingresar Tipo Moneda")
					dw_comision.setfocus()
					dw_comision.setcolumn('moneda')
				elseif isnull(ldb_precio_lista) or ldb_precio_lista=0 then
					messagebox("Advertencia", "Debe Ingresar Precio de Lista")
					dw_comision.setfocus()
					dw_comision.setcolumn('precio_lista')
				elseif isnull(ldb_precio_ctto) or ldb_precio_ctto=0 then
					messagebox("Advertencia", "Debe Ingresar Precio de Venta")
					dw_comision.setfocus()
					dw_comision.setcolumn('precio_ctto')
				elseif isnull(ll_rut_titular) or ll_rut_titular=0 then
					messagebox("Advertencia", "Debe Ingresar Rut Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('rut_titular')
				elseif isnull(ls_dv_titular) or ls_dv_titular='' then
					messagebox("Advertencia", "Debe Ingresar Digito Rut Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('dv_titular')
				elseif isnull(ls_nombre_titular) or ls_nombre_titular='' then
					messagebox("Advertencia", "Debe Ingresar Nombre Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('nombre_titular')
				elseif isnull(ls_a_paterno_titular) or ls_a_paterno_titular='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Paterno Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_paterno_titular')
				elseif isnull(ls_a_materno_titular) or ls_a_materno_titular='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Materno Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_materno_titular')
				elseif isnull(ls_direcc_titular) or ls_direcc_titular='' then
					messagebox("Advertencia", "Debe Ingresar Dirección Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('direccion_titular')
				elseif isnull(ls_direcc_num_titular) or ls_direcc_num_titular='' then
					messagebox("Advertencia", "Debe Ingresar Dirección Número Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('direccion_numero_titular')
				elseif isnull(ls_direcc_block_titular) or ls_direcc_block_titular='' then
					messagebox("Advertencia", "Debe Ingresar Block Dirección Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('direccion_block_titular')
				elseif isnull(ls_direcc_depto_titular) or ls_direcc_depto_titular='' then
					messagebox("Advertencia", "Debe Ingresar Block Dirección Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('direccion_depto_titular')
				elseif isnull(ls_fono_titular) or ls_fono_titular='' then
					messagebox("Advertencia", "Debe Ingresar Fono Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('fono_titular')
				elseif isnull(ls_ciudad_titular) or ls_ciudad_titular='' then
					messagebox("Advertencia", "Debe Ingresar Ciudad Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('ciudad_titular')
				elseif isnull(ls_comuna_titular) or ls_comuna_titular='' then
					messagebox("Advertencia", "Debe Ingresar Comuna Titular")
					dw_comision.setfocus()
					dw_comision.setcolumn('comuna_titular')
				elseif isnull(ll_rut_repres) or ll_rut_repres=0 then
					messagebox("Advertencia", "Debe Ingresar Rut Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('rut_representante')
				elseif isnull(ls_dv_repres) or ls_dv_repres='' then
					messagebox("Advertencia", "Debe Ingresar Digito Rut Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('dv_representente')
				elseif isnull(ls_nombre_repres) or ls_nombre_repres='' then
					messagebox("Advertencia", "Debe Ingresar Nombre Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('nombre_representante')
				elseif isnull(ls_a_paterno_repres) or ls_a_paterno_repres='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Paterno Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_paterno_representante')
				elseif isnull(ls_a_materno_repres) or ls_a_materno_repres='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Materno Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_materno_representante')
				elseif isnull(ls_direcc_repres) or ls_direcc_repres='' then
					messagebox("Advertencia", "Debe Ingresar Dirección Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('direccion_representante')
				elseif isnull(ls_direcc_num_repres) or ls_direcc_num_repres='' then
					messagebox("Advertencia", "Debe Ingresar Número Dirección Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('numero_representante')
				elseif isnull(ls_direcc_block_repres) or ls_direcc_block_repres='' then
					messagebox("Advertencia", "Debe Ingresar Block Dirección Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('block_representante')
				elseif isnull(ls_direcc_depto_repres) or ls_direcc_depto_repres='' then
					messagebox("Advertencia", "Debe Ingresar Depto. Dirección Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('depto_representante')
				elseif isnull(ls_fono_repres) or ls_fono_repres='' then
					messagebox("Advertencia", "Debe Ingresar Fono Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('fono_represent')
				elseif isnull(ls_ciudad_repres) or ls_ciudad_repres='' then
					messagebox("Advertencia", "Debe Ingresar Ciudad Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('ciudad_representante')
				elseif isnull(ls_comuna_repres) or ls_comuna_repres='' then
					messagebox("Advertencia", "Debe Ingresar Comuna Representante")
					dw_comision.setfocus()
					dw_comision.setcolumn('comuna_representante')
				elseif isnull(ll_folio) or ll_folio=0 then
					messagebox("Advertencia", "Debe Ingresar Número Folio")
					dw_comision.setfocus()
					dw_comision.setcolumn('folio')
				elseif isnull(ll_numero_dato) or ll_numero_dato=0 then
					messagebox("Advertencia", "Debe Ingresar Número Dato")
					dw_comision.setfocus()
					dw_comision.setcolumn('numero_dato')
				elseif isnull(ldb_uf_dia) or ldb_uf_dia=0 then
					messagebox("Advertencia", "Debe Ingresar Valor UF Día")
					dw_comision.setfocus()
					dw_comision.setcolumn('uf_dia')
				elseif isnull(ldb_porce_comi) or ldb_porce_comi=0 then
					messagebox("Advertencia", "Debe Ingresar Porcentaje Comisión")
					dw_comision.setfocus()
					dw_comision.setcolumn('porce_comision')
				elseif isnull(ll_neto_comi) or ll_neto_comi=0 then
					messagebox("Advertencia", "Debe Ingresar Valor Neto Comisión a Pago")
					dw_comision.setfocus()
					dw_comision.setcolumn('neto_comision')
				elseif isnull(ll_retencion) or ll_retencion=0 then
					messagebox("Advertencia", "Debe Ingresar Valor Retención Comisión a Pago")
					dw_comision.setfocus()
					dw_comision.setcolumn('retencion')
				elseif isnull(ll_total_pago_comi) or ll_total_pago_comi=0 then
					messagebox("Advertencia", "Debe Ingresar Valor Total Comisión a Pago")
					dw_comision.setfocus()
					dw_comision.setcolumn('total_pago')
				elseif isnull(ll_rut_fallec) or ll_rut_fallec=0 then
					messagebox("Advertencia", "Debe Ingresar Rut Fallecido")
					dw_comision.setfocus()
					dw_comision.setcolumn('rut_fallecido')
				elseif isnull(ls_dv_fallec) or ls_dv_fallec='' then
					messagebox("Advertencia", "Debe Ingresar Digito Rut Fallecido")
					dw_comision.setfocus()
					dw_comision.setcolumn('dv_fallecido')
				elseif isnull(ls_nombre_fallec) or ls_nombre_fallec='' then
					messagebox("Advertencia", "Debe Ingresar Nombre Fallecido")
					dw_comision.setfocus()
					dw_comision.setcolumn('nombre_fallecido')
				elseif isnull(ls_a_paterno_fallec) or ls_a_paterno_fallec='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Paterno Fallecido")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_paterno_fallecido')
				elseif isnull(ls_a_materno_fallec) or ls_a_materno_fallec='' then
					messagebox("Advertencia", "Debe Ingresar Apellido Materno Fallecido")
					dw_comision.setfocus()
					dw_comision.setcolumn('a_materno_fallecido')
				end if
			end if
		end if
		if isvalid(w_solicitud_gestion_funeraria) then
			ll_fila	= w_solicitud_gestion_funeraria.dw_lista_solicitud.getrow()
			w_solicitud_gestion_funeraria.dw_lista_solicitud.retrieve()
			if ll_fila>0 then
				w_solicitud_gestion_funeraria.dw_lista_solicitud.scrolltorow(ll_fila)
			end if
		end if
		if isvalid(w_solicitud_control_funeraria) then
			w_solicitud_control_funeraria.setfocus()
		end if
		SetPointer(Arrow!)
	end if
end if
end event

type cb_dato_mes from commandbutton within w_solicitud_pago_funeraria
integer x = 1874
integer y = 2560
integer width = 347
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Datos de mes"
end type

event clicked;string	ls_string
long		ll_cod_funeraria,ll_cod_parque,ll_mes,ll_ano
datetime	ldt_fecha_cierre
double	ldb_contrato

dw_comision.accepttext()
if dw_comision.rowcount()>0 then
	ldb_contrato			= dw_promesa.getitemnumber(1,'numero')
	ll_cod_funeraria	= dw_comision.getitemnumber(1,'cod_funeraria')
	ll_cod_parque		= dw_comision.getitemnumber(1,'cod_parque')
	ldt_fecha_cierre	= dw_comision.getitemdatetime(1,'fecha_cierre')
	ll_mes				= month(date(ldt_fecha_cierre))
	ll_ano				= year(date(ldt_fecha_cierre))
	
	if ll_cod_funeraria>0 and ll_cod_parque>0 and ll_mes>0 and ll_ano>0 and dw_comision.dataobject='dw_pago_comision_funeraria' then
		ls_string			= string(ll_cod_funeraria)+'~t'+string(ll_cod_parque)+'~t'+string(ll_mes)+'~t'+string(ll_ano)
		if isvalid(w_revision_dato_funeraria) then close(w_revision_dato_funeraria)
		OpenWithParm(w_revision_dato_funeraria, ls_string)
	else
		if isnull(ldb_contrato) or ldb_contrato=0 then
			messagebox("Advertencia", "Debe Ingresar Numero de Promesa")
			dw_promesa.setfocus()
			dw_promesa.setcolumn('numero')
		elseif isnull(ll_cod_funeraria) or ll_cod_funeraria=0 then
			messagebox("Advertencia", "Debe Selecionar Funeraria")
			dw_comision.setfocus()
			dw_comision.setcolumn('cod_funeraria')
		elseif isnull(ll_mes) or ll_mes=0 or ll_ano=0 or isnull(ll_ano) then
			messagebox("Advertencia", "Debe Selecionar Fecha")
			dw_comision.setfocus()
			dw_comision.setcolumn('fecha_cierre')
		end if
	end if
end if
end event

type cb_limpiar from commandbutton within w_solicitud_pago_funeraria
integer x = 2464
integer y = 2560
integer width = 238
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long	ll_new

dw_promesa.reset()
dw_promesa.dataobject	= 'dwe_promesa'
dw_promesa.settransobject(sqlca)
ll_new						= dw_promesa.insertrow(0)
dw_comision.reset()
dw_comision.insertrow(0)
dw_promesa.setfocus()
end event

type cb_cerrar from commandbutton within w_solicitud_pago_funeraria
integer x = 2930
integer y = 2560
integer width = 297
integer height = 88
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_solicitud_pago_funeraria)
end event

type fecha_t from statictext within w_solicitud_pago_funeraria
integer x = 2587
integer y = 24
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_buscar_ficha from commandbutton within w_solicitud_pago_funeraria
integer x = 1061
integer y = 2560
integer width = 357
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Ficha"
end type

event clicked;if isvalid(w_listado_ficha_sepultacion) then close(w_listado_ficha_sepultacion)
open(w_listado_ficha_sepultacion)
end event

type dw_promesa from datawindow within w_solicitud_pago_funeraria
integer x = 142
integer y = 52
integer width = 896
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_promesa"
boolean border = false
end type

event itemchanged;string	ls_base,ls_serie,ls_columna
long		ll_count
double	ldb_numero

dw_promesa.accepttext()
ls_base		= dw_promesa.getitemstring(1,'base')
ls_serie		= dw_promesa.getitemstring(1,'serie')
ldb_numero	= dw_promesa.getitemnumber(1,'numero')

if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
	pb_aceptar.TriggerEvent(Clicked!)
end if
end event

type pb_aceptar from picturebutton within w_solicitud_pago_funeraria
boolean visible = false
integer x = 1038
integer y = 36
integer width = 123
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_base,ls_serie,ls_nombre_titular,ls_a_paterno_titular,ls_a_materno_titular,ls_direccion_titutar,&
			ls_numero_titular,ls_depto_titular,ls_block_titular,ls_comuna_titular,ls_ciudad_titular,ls_dv_titular,&
			ls_nombre_fallecido,ls_a_paterno_fallecido,ls_a_materno_fallecido,ls_dv_fallecido,& 
			ls_direccion_represent,ls_comuna_reprensent,ls_ciudad_represent,ls_contacto,ls_fono,ls_fax,ls_email,ls_dv,&
			ls_plani_sector,ls_plani_sepultura,ls_area,ls_momeda,ls_mes_ano,ls_fono_titular,ls_uso,ls_tipo_sepult,&
			ls_sector,ls_ciudad_tit,ls_ciudad_repr,ls_tipo_const,ls_usuario,ls_depto,ls_base_aux,ls_serie_aux
long		ll_cod_parque,ll_rut_titular,ll_cod_funeraria,ll_rut_fallecido,ll_new,ll_codigo_funeraria,& 
			ll_rut_funeraria,ll_folio,ll_folio_mas,ll_mes_comi,ll_ano_comi,ll_numero_dato,ll_numero_dato_mas,ll_res,ll_tot_reg,&
			ll_capacidad,ll_cod_estado,ll_count
datetime	ldt_fecha_ctto,ldt_fecha_cierre,ldt_fecha_actual,ldt_fecha_contrato
double	ldb_numero,ldb_num_aux,ldb_precio,ldb_precio_lista,ldb_porce_descto

dw_promesa.accepttext()
SetPointer(HourGlass!)
ls_base													= dw_promesa.getitemstring(1,'base')
ls_serie													= dw_promesa.getitemstring(1,'serie')
ldb_numero												= dw_promesa.getitemnumber(1,'numero')
SELECT "CD_FOLIO"."BASE"  
INTO	:ll_count  
FROM	"CD_FOLIO"  
WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
  	   ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
  	   ( "CD_FOLIO"."NUMERO" = :ldb_numero )
USING	sqlca;
if sqlca.sqlcode = 100 then
	if isnull(ll_count) or ll_count = 0 then
		messagebox("Advertencia","Promesa No Existe en Control Documentario")
		dw_promesa.reset()
		dw_promesa.insertrow(0)
	end if
else
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
		dw_comision.dataobject	= 'dw_pago_comision_funeraria'
		dw_comision.settransobject(sqlca)
		dw_comision.getchild('area',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle.insertrow(0)
		dw_comision.getchild('plani_sector',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		idw_detalle2.insertrow(0)
		dw_comision.getchild('plani_sepultura',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		idw_detalle3.reset()
		idw_detalle3.insertrow(0)
		dw_comision.getchild('comuna_titular',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		idw_detalle4.reset()
		idw_detalle4.insertrow(0)
		dw_comision.getchild('comuna_representante',idw_detalle5)
		idw_detalle5.settransobject(sqlca)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)
		ll_tot_reg										= dw_comision.retrieve(ls_base,ls_serie,ldb_numero)
		if ll_tot_reg=0 then
			dw_comision.insertrow(0)
			ll_res										= MessageBox("Advertencia", 'No Existe Pago de Comisión Funeraria Para Esta Promesa ¿Desea Crear el Registro?', Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
					SELECT	"BASE",				"SERIE",				"NUMERO",			"FECHA_CONTRATO",				"COD_PARQUE",				"NOMBRE_TITULAR",					"AP_PATERNO_TITULAR",				"AP_MATERNO_TITULAR",				"DIRECCION_TITULAR",					"NUM_DIRECCION_TITULAR",		"DEPTO_DIRECCION_TITULAR",			"BLOCK_DIRECCION_TITULAR",			"CODIGO_CIUDAD_TITULAR",		"CODIGO_COMUNA_TITULAR",		"RUT_TITULAR",				"DV_TITULAR",				"CODIGO_FUNERARIA",	"NOMBRE_FALLECIDO",		"AP_PATERNO_FALL",			"AP_MATERNO_FALL",			"RUT_FALLECIDO",		"DV_FALLECIDO",	"SECTOR",			"SEPULTURA",			"FONO_TITULAR"   	  
					INTO		:ls_base_aux,		:ls_serie_aux,		:ldb_num_aux,	:ldt_fecha_ctto,				:ll_cod_parque,			:ls_nombre_titular,				:ls_a_paterno_titular,				:ls_a_materno_titular,				:ls_direccion_titutar,				:ls_numero_titular,				:ls_depto_titular,					:ls_block_titular,					:ls_ciudad_titular,				:ls_comuna_titular,				:ll_rut_titular,			:ls_dv_titular,			:ll_cod_funeraria,	:ls_nombre_fallecido,	:ls_a_paterno_fallecido,	:ls_a_materno_fallecido,	:ll_rut_fallecido,	:ls_dv_fallecido,	:ls_plani_sector,	:ls_plani_sepultura,	:ls_fono_titular
					FROM		"FICHA_SEPULTACION"
					WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base  ) AND
								( "FICHA_SEPULTACION"."SERIE" = :ls_serie ) AND
								( "FICHA_SEPULTACION"."NUMERO" = :ldb_numero ) AND
								( "FICHA_SEPULTACION"."SW_DATO_FUNERARIA" = 0 ) AND
								( "FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR "FICHA_SEPULTACION"."ESTADO_REG" = 'G') AND
								  "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = (	SELECT	MIN("FICHA_SEPULTACION"."CORRELATIVO_INTERNO")
																								FROM		"FICHA_SEPULTACION"
																								WHERE		( "FICHA_SEPULTACION"."BASE" = :ls_base ) AND
																											( "FICHA_SEPULTACION"."SERIE" = :ls_serie ) AND
																											( "FICHA_SEPULTACION"."NUMERO" = :ldb_numero ) AND
																											( "FICHA_SEPULTACION"."SW_DATO_FUNERARIA" = 0 ) AND
																											( "FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR "FICHA_SEPULTACION"."ESTADO_REG" = 'G'))
					UNION
					SELECT	"BASE_DESTINO",	"SERIE_DESTINO",	"NUMERO_DESTINO",	"FECHA_CONTRATO_DESTINO",	"COD_PARQUE_DESTINO",	"NOMBRE_TITULAR_DESTINO",		"APELLIDO_PAT_TITULAR_DESTINO",	"APELLIDO_MAT_TITULAR_DESTINO",	"DIRECCION_TITULAR_DESTINO",		"NRO_DIREC_TITULAR_DESTINO",	"DEPTO_DIREC_TITULAR_DESTINO",	"BLOCK_DIREC_TITULAR_DESTINO",	"COD_CIUDAD_TITULAR_DESTINO",	"COD_COMUNA_TITULAR_DESTINO",	"RUT_TITULAR_DESTINO",	"DV_TITULAR_DESTINO",	"CODIGO_FUNERARIA",	"NOMBRE_FALLECIDO",		"APELLIDO_PATERNO_FALL",	"APELLIDO_MATERNO_FALL",	"RUT_FALLECIDO",		"DV_FALLECIDO",	"SECTOR_DESTINO",	"SEPULTURA_DESTINO",	"FONO_TITULAR_DESTINO"   	  
					FROM		"FICHA_TRASLADO"
					WHERE 	( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base  ) AND
								( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie ) AND
								( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ldb_numero ) AND
								( "FICHA_TRASLADO"."SW_DATO_FUNERARIA" = 0 ) AND
								( "FICHA_TRASLADO"."TIPO_TRASLADO" = 'E') AND
								( "FICHA_TRASLADO"."DESTINO_PARQUE" = 'E') AND
								( "FICHA_TRASLADO"."ESTADO_REG" = 'P' OR "FICHA_TRASLADO"."ESTADO_REG" = 'G') AND
								  "FICHA_TRASLADO"."FOLIO" = (	SELECT	MIN("FICHA_TRASLADO"."FOLIO")
																								FROM		"FICHA_TRASLADO"
																								WHERE		( "FICHA_TRASLADO"."BASE_DESTINO" = :ls_base ) AND
																											( "FICHA_TRASLADO"."SERIE_DESTINO" = :ls_serie ) AND
																											( "FICHA_TRASLADO"."NUMERO_DESTINO" = :ldb_numero ) AND
																											( "FICHA_TRASLADO"."SW_DATO_FUNERARIA" = 0 ) AND
																											( "FICHA_TRASLADO"."TIPO_TRASLADO" = 'E') AND
																											( "FICHA_TRASLADO"."DESTINO_PARQUE" = 'E') AND
																											( "FICHA_TRASLADO"."ESTADO_REG" = 'P' OR "FICHA_TRASLADO"."ESTADO_REG" = 'G'))
					USING sqlca;
					if sqlca.sqlcode = 0 then 
						dw_comision.reset()
						ll_new							= dw_comision.insertrow(0)
						dw_comision.setitem(ll_new,"base",ls_base)
						dw_comision.setitem(ll_new,"serie",ls_serie)
						dw_comision.setitem(ll_new,"numero",ldb_numero)
						dw_comision.setitem(ll_new,"fecha_ctto",ldt_fecha_ctto)
						dw_comision.setitem(ll_new,"cod_parque",ll_cod_parque)   
						idw_detalle.retrieve(ll_cod_parque)
						dw_comision.setitem(ll_new,"nombre_titular",ls_nombre_titular)   
						dw_comision.setitem(ll_new,"a_paterno_titular",ls_a_paterno_titular)   
						dw_comision.setitem(ll_new,"a_materno_titular",ls_a_materno_titular)   
						dw_comision.setitem(ll_new,"direccion_titular",ls_direccion_titutar)   
						dw_comision.setitem(ll_new,"direccion_numero_titular",ls_numero_titular)   
						dw_comision.setitem(ll_new,"direccion_depto_titular",ls_depto_titular)   
						dw_comision.setitem(ll_new,"direccion_block_titular",ls_block_titular)   
						dw_comision.setitem(ll_new,"ciudad_titular",ls_ciudad_titular)
						idw_detalle4.retrieve(ls_ciudad_titular)
						dw_comision.setitem(ll_new,"comuna_titular",ls_comuna_titular)   
						dw_comision.setitem(ll_new,"rut_titular",ll_rut_titular)   
						dw_comision.setitem(ll_new,"dv_titular",ls_dv_titular)   
						dw_comision.setitem(ll_new,"cod_funeraria",ll_cod_funeraria)   
						dw_comision.setitem(ll_new,"nombre_fallecido",ls_nombre_fallecido)   
						dw_comision.setitem(ll_new,"a_paterno_fallecido",ls_a_paterno_fallecido)   
						dw_comision.setitem(ll_new,"a_materno_fallecido",ls_a_materno_fallecido)   
						dw_comision.setitem(ll_new,"rut_fallecido",ll_rut_fallecido)   
						dw_comision.setitem(ll_new,"dv_fallecido",ls_dv_fallecido)
						dw_comision.setitem(ll_new,"plani_sector",ls_plani_sector)
						dw_comision.setitem(ll_new,"plani_sepultura",ls_plani_sepultura)
						idw_detalle3.retrieve(ll_cod_parque,ls_plani_sector)
						dw_comision.setitem(ll_new,"fono_titular",ls_fono_titular)
						dw_comision.setitem(ll_new,"c_marcar",0)
						dw_comision.accepttext()
						ls_uso = 'NI'
						SELECT	"INVENTARIO_PLANI"."CAPACIDAD"
						INTO 		:ll_capacidad
						FROM		"INVENTARIO_PLANI"  
						WHERE 	( "INVENTARIO_PLANI"."SECTOR" = :ls_plani_sector ) AND  
									( "INVENTARIO_PLANI"."SEPULTURA" = :ls_plani_sepultura ) AND  
									( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque )   
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							dw_comision.setitem(1,'capacidad',ll_capacidad)
						end if
						SELECT	"BASE_PLANI"."AREA",	"BASE_PLANI"."TIPO_SEP"  
						INTO 		:ls_area,				:ls_tipo_sepult
						FROM 		"BASE_PLANI"  
						WHERE  ( "BASE_PLANI"."SECTOR" = :ls_plani_sector ) AND  
								 ( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque ) 
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							dw_comision.setitem(1,'area',ls_area)
							idw_detalle2.retrieve(ll_cod_parque,ls_area)
							dw_comision.setitem(1,'uso',ls_uso)
							dw_comision.setitem(1,'t_sepult',ls_tipo_sepult)
							dw_comision.accepttext()
							SELECT	"LISTA_PRECIO"."T_CONST"  
							INTO		:ls_tipo_const  
							FROM		"LISTA_PRECIO"  
							WHERE 	( "LISTA_PRECIO"."SECTOR" = :ls_area ) AND  
										( "LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad ) AND  
										( "LISTA_PRECIO"."CANAL" = :ls_uso ) AND  
										( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepult ) AND
										( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque)
							USING		Trans_1;
							if Trans_1.sqlcode = 0 then
								dw_comision.setitem(1,'t_const',ls_tipo_const)
								dw_comision.accepttext()
							end if
						end if
						SELECT	"MONEDA",	"PRECIO_CONTRATO",	"PRECIO",				"FECHA_CTTO"    
						INTO		:ls_momeda,	:ldb_precio,			:ldb_precio_lista,	:ldt_fecha_contrato  
						FROM		"REVISION_CONTRATOS"  
						WHERE		( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
									( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
									( "REVISION_CONTRATOS"."NUMERO" = :ldb_numero )
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							ldb_porce_descto   		= 100 - (ldb_precio / ldb_precio_lista * 100)
							dw_comision.setitem(1,'moneda',ls_momeda)
							dw_comision.setitem(1,'precio_ctto',ldb_precio)
							dw_comision.setitem(1,'precio_lista',ldb_precio_lista)
							dw_comision.setitem(1,'porce_descto',ldb_porce_descto)
						end if
						
						if isnull(ldt_fecha_ctto) then
							ldt_fecha_ctto							= ldt_fecha_contrato
						else
							ldt_fecha_ctto							= ldt_fecha_ctto
						end if
						dw_comision.setitem(1,"fecha_ctto",ldt_fecha_ctto)
						
						SELECT	MAX("FUNERARIA_PAGO_COMISION"."FOLIO")  
						INTO 		:ll_folio  
						FROM 		"FUNERARIA_PAGO_COMISION"
						USING		sqlca;
						if sqlca.sqlcode = 0 then
							ll_folio_mas				= ll_folio+1
							dw_comision.setitem(1,'folio',ll_folio_mas)
						end if
						ll_codigo_funeraria			= dw_comision.getitemnumber(1,'cod_funeraria')
						if ll_codigo_funeraria > 0 then
							SELECT 	"FUNERARIA"."DIRECCION",   "FUNERARIA"."COMUNA",   "FUNERARIA"."CIUDAD",	"FUNERARIA"."CONTACTO",   	"FUNERARIA"."FONO",  "FUNERARIA"."FAX",   "FUNERARIA"."EMAIL",   	"FUNERARIA"."DV",   	"FUNERARIA"."RUT"  
							INTO 		:ls_direccion_represent,   :ls_comuna_reprensent, 	:ls_ciudad_represent,	:ls_contacto,   				:ls_fono,   			:ls_fax,   				:ls_email,   				:ls_dv,   				:ll_rut_funeraria  
							FROM 		"FUNERARIA"  
							WHERE 	"FUNERARIA"."RUT" = :ll_codigo_funeraria   
							USING		sqlca;
							if sqlca.sqlcode = 0 then
								dw_comision.setitem(1,'direccion_representante',ls_direccion_represent)
								dw_comision.setitem(1,'ciudad_representante',ls_ciudad_represent)
								idw_detalle5.retrieve(ls_ciudad_represent)
								dw_comision.setitem(1,'comuna_representante',ls_comuna_reprensent)
								dw_comision.setitem(1,'nombre_representante',ls_contacto)
								dw_comision.setitem(1,'dv_representente',ls_dv)
								dw_comision.setitem(1,'rut_representante',ll_rut_funeraria)
							else
								messagebox("Advertencia","No Existe Funeraria Actualizar Mantenedor de Funerarias")
							end if
						end if
					else
						dw_comision.reset()
						ll_new							= dw_comision.insertrow(0)
						dw_comision.setitem(ll_new,"base",ls_base)
						dw_comision.setitem(ll_new,"serie",ls_serie)
						dw_comision.setitem(ll_new,"numero",ldb_numero)
						dw_comision.setitem(ll_new,"c_marcar",1)
					end if
					dw_comision.setfocus()
					dw_comision.setcolumn('cod_agente')
				else
					if ll_tot_reg = 0 then
						messagebox("Advertencia","No Registra Dato")
						if isnull(ls_base) or ls_base='' then
							messagebox("Advertencia", "Debe Ingresar Base")
							dw_promesa.setfocus()
							dw_promesa.setcolumn('base')
						elseif isnull(ls_serie) or ls_serie='' then
							messagebox("Advertencia", "Debe Ingresar Serie")
							dw_promesa.setfocus()
							dw_promesa.setcolumn('serie')
						elseif isnull(ldb_numero) or ldb_numero=0 then
							messagebox("Advertencia", "Debe Ingresar Número")
							dw_promesa.setfocus()
							dw_promesa.setcolumn('numero')
						end if
					end if
				end if
			end if
		else
			ll_cod_parque								= dw_comision.getitemnumber(1,'cod_parque')
			ls_area										= dw_comision.getitemstring(1,'area')
			ls_sector									= dw_comision.getitemstring(1,'plani_sector')
			ls_ciudad_tit								= dw_comision.getitemstring(1,'ciudad_titular')
			ls_ciudad_repr								= dw_comision.getitemstring(1,'ciudad_representante')
			idw_detalle.retrieve(ll_cod_parque)
			idw_detalle2.retrieve(ll_cod_parque,ls_area)
			idw_detalle3.retrieve(ll_cod_parque,ls_sector)
			idw_detalle4.retrieve(ls_ciudad_tit)
			idw_detalle5.retrieve(ls_ciudad_repr)
		end if
	end if
	ls_usuario																				= gs_user
	ll_cod_estado																			= dw_comision.getitemnumber(1,'cod_estado')
	if gs_depto = 'P' and (ll_cod_estado <> 2 and ll_cod_estado <> 3 and ll_cod_estado <> 6) then
		cb_grabar.enabled																	= false
		cb_gestion.enabled																= false
		dw_comision.enabled																= false
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
	elseif gs_depto = 'X' and (ll_cod_estado <> 1 and ll_cod_estado <> 3 and ll_cod_estado <> 4 and ll_cod_estado <> 5 and ll_cod_estado <> 6 and ll_cod_estado <> 7 and ll_cod_estado <> 9 and ll_cod_estado <> 16 and ll_cod_estado <> 17 and ll_cod_estado <> 18 and ll_cod_estado <> 19 and ll_cod_estado <> 20) then
		cb_grabar.enabled																	= false
		cb_gestion.enabled																= false
		dw_comision.enabled																= false
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
	elseif gs_depto = 'O' and (ll_cod_estado <> 7 and ll_cod_estado <> 8 and ll_cod_estado <> 9 and ll_cod_estado <> 10 and ll_cod_estado <> 12) then
		cb_grabar.enabled																	= false
		cb_gestion.enabled																= false
		dw_comision.enabled																= false
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
	elseif gs_depto = 'C' and (ll_cod_estado <> 10 and ll_cod_estado <> 11 and ll_cod_estado <> 12 and ll_cod_estado <> 13 and ll_cod_estado <> 15) then
		cb_grabar.enabled																	= false
		cb_gestion.enabled																= false
		dw_comision.enabled																= false
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
	elseif gs_depto = 'T' and (ll_cod_estado <> 13 and ll_cod_estado <> 14 and ll_cod_estado <> 15 and ll_cod_estado <> 16 and ll_cod_estado <> 17 and ll_cod_estado <> 19) then
		cb_grabar.enabled																	= false
		cb_gestion.enabled																= false
		dw_comision.enabled																= false
		messagebox("Advertencia","No Pude Realizar Gestión, Solicitud Asignada a Otro Departamento")
	else
		cb_grabar.enabled																	= true
		cb_gestion.enabled																= true
		dw_comision.enabled																= true
	end if
	SetPointer(Arrow!)
end if
end event

type dw_comision from datawindow within w_solicitud_pago_funeraria
integer x = 14
integer y = 132
integer width = 3223
integer height = 2392
integer taborder = 30
string title = "none"
string dataobject = "dw_pago_comision_funeraria"
boolean minbox = true
boolean border = false
end type

event clicked;string	ls_columna,ls_fecha,ls_moneda,ls_fecha_ctto,ls_area,ls_sector,ls_ciudad_tit,ls_ciudad_repr,ls_sector_consul,ls_uso,&
			ls_tipo_const,ls_zona,ls_uso_pr,ls_tp_constr,ls_tp_sepul,ls_nulo,ls_fec
long		ll_cod_funeraria,ll_cod_parque,ll_mes_comi,ll_ano_comi,ll_dato_funeraria,ll_dato_mas,ll_neto,ll_monto_retencion,&
			ll_capacidad,ls_tipo_sepult,ll_parque_consul,ll_capac,ll_nulo,ll_monto,ll_valor_uf_0,ll_adicional
datetime	ldt_fecha,ldt_fecha_cierre,ldt_fecha_ctto,ldt_fecha_max_uf,ldt_nulo
double	ldb_precio_ctto,ldb_valor_uf,ldb_retencion,ldb_porce_reten,ldb_porce_comi,ldb_porcentaje,ldb_valor_sepul,ldb_valor_uf_ctto

Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
ls_columna = dwo.name
if ls_columna = 'p_fecha_cierre' then
	ldt_fecha											= dw_comision.getitemdatetime(1,'fecha_cierre')
	if f_valida_fecha(string(ldt_fecha,'dd/mm/yyyy'))=-1 then 
		dw_comision.setitem(1,'fecha_cierre',today())
		dw_comision.setfocus()
		dw_comision.setcolumn('fecha_cierre')
		return
	end if	
	if not isnull(ldt_fecha) then
		ls_fecha 										= string(ldt_fecha,'dd/mm/yyyy')
	else
		ls_fecha 										= string(today(),gs_formato_fecha)
	end if	
	OpenWithParm(w_calendar,ls_fecha)
	IF Message.StringParm <> ls_fecha THEN
		ls_fecha 										= Message.StringParm
		ldt_fecha										= datetime(date(ls_fecha))
		dw_comision.setitem(1,'fecha_cierre',ldt_fecha)
		dw_comision.accepttext()
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ls_moneda										= dw_comision.getitemstring(1,'moneda')
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" 	= :ldt_fecha_cierre
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"fecha_cierre",ldt_nulo)
				dw_comision.setitem(1,"uf_dia",ll_nulo)
				dw_comision.setitem(1,"mes_cierre",ll_nulo)
				dw_comision.setitem(1,"ano_cierre",ll_nulo)
				dw_comision.accepttext()
			end if
		else
			dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
			dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
			dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
			dw_comision.accepttext()
		end if
		SELECT	MAX("PORCE_RETENCION"),	MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional
		FROM		"FUNERARIA_PORCENTAJE"
		WHERE		"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ldb_porce_reten							= ldb_retencion
			ll_adicional								= ll_adicional
		end if
		ll_dato_mas										= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	end if
end if
if ls_columna = 'p_fecha_ctto' then
	ldt_fecha_ctto										= dw_comision.getitemdatetime(1,'fecha_ctto')
	if f_valida_fecha(string(ldt_fecha_ctto,'dd/mm/yyyy'))=-1 then 
		dw_comision.setitem(1,'fecha_ctto',today())
		dw_comision.setfocus()
		dw_comision.setcolumn('fecha_ctto')
		return
	end if	
	if not isnull(ldt_fecha_ctto) then
		ls_fecha_ctto 									= string(ldt_fecha_ctto,'dd/mm/yyyy')
	else
		ls_fecha_ctto 									= string(today(),gs_formato_fecha)
	end if	
	OpenWithParm(w_calendar,ls_fecha_ctto)
	IF Message.StringParm <> ls_fecha_ctto THEN
		ls_fecha_ctto 									= Message.StringParm
		ldt_fecha_ctto									= datetime(date(ls_fecha_ctto))
		dw_comision.setitem(1,'fecha_ctto',ldt_fecha_ctto)
		dw_comision.accepttext()
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ldt_fecha_ctto									= dw_comision.getitemdatetime(1,'fecha_ctto')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ls_moneda										= dw_comision.getitemstring(1,'moneda')
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_ctto
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"fecha_ctto",ldt_nulo)
				dw_comision.accepttext()
			end if
		end if
		SELECT	MAX("PORCE_RETENCION"),	MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional
		FROM		"FUNERARIA_PORCENTAJE"
		WHERE		"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ldb_porce_reten							= ldb_retencion
		end if
		ll_dato_mas										= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	end if
end if
end event

event itemchanged;string	ls_columna,ls_direccion_represent,ls_comuna_reprensent,ls_ciudad_represent,ls_contacto,ls_fono,ls_fax,ls_email,ls_dv,&
			ls_moneda,ls_area,ls_sector,ls_sepultura,ls_ciudad_tit,ls_ciudad_repr,ls_sector_consul,ls_uso,ls_tipo_sepult,ls_tipo_const,&
			ls_zona,ls_uso_pr,ls_tp_constr,ls_tp_sepul,ls_nulo,ls_nombre_titular,ls_a_paterno_titular,ls_a_materno_titular,&
			ls_dv_valida_repres,ls_dv_valida_tit,ls_dv_valida_fall,ls_sepult_consul,ls_nombre_usuario,ls_email_de,ls_descripcion_email,&
			ls_email_para,ls_nombre_funeraria,ls_base,ls_serie,ls_glosa_email,ls_res,ls_glosa
long		ll_cod_funeraria,ll_rut_funeraria,ll_cod_parque,ll_mes_comi,ll_ano_comi,ll_dato_funeraria,ll_dato_mas,ll_neto,&
			ll_monto_retencion,ll_parque_consul,ll_capacidad,ll_capac,ll_nulo,ll_monto,ll_hora_cierre,ll_minuto_cierre,ll_valor_uf_0,&
			ll_marcar,ll_res,ll_rut_valida_repres,ll_folio,ll_folio_mas,ll_rut_valida_tit,ll_rut_valida_fall,ll_adicional,ll_num_cheque,&
			ll_estado_email,ll_num_boleta
datetime	ldt_fecha_cierre,ldt_fecha_ctto,ldt_fecha_max_uf,ldt_nulo
double	ldb_numero,ldb_precio_ctto,ldb_valor_uf,ldb_retencion,ldb_porce_reten,ldb_porce_comi,ldb_porcentaje,ldb_valor_sepul,ldb_uf_dia,ldb_valor_uf_ctto,& 
			ldb_valor_uf_dia,ldb_precio_lista,ldb_porce_descto


Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
SetPointer(HourGlass!)
this.accepttext()
ls_columna	= dwo.name
if ls_columna = 'cod_parque' then
	ll_cod_parque											= dw_comision.getitemnumber(1,'cod_parque')
	if ll_cod_parque > 0 then
		idw_detalle.retrieve(ll_cod_parque)
		dw_comision.setitem(1,'plani_sector',ls_nulo)
		dw_comision.setitem(1,'plani_sepultura',ls_nulo)
		dw_comision.setitem(1,'capacidad',ll_nulo)
		dw_comision.setitem(1,'uso',ls_nulo)
		dw_comision.setitem(1,'t_const',ls_nulo)
		dw_comision.setitem(1,'t_sepult',ls_nulo)
		dw_comision.setitem(1,'moneda',ls_nulo)
		dw_comision.setitem(1,'precio_ctto',ll_nulo)
		dw_comision.setitem(1,'precio_lista',ll_nulo)
		dw_comision.setitem(1,'numero_dato',ll_nulo)
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		dw_comision.accepttext()
	end if
elseif ls_columna = 'area' then
	ls_area													= dw_comision.getitemstring(1,'area')
	if not isnull(ls_area) and ls_area <>'' then
		dw_comision.setitem(1,'plani_sector',ls_nulo)
		idw_detalle2.retrieve(ll_cod_parque,ls_area)
		dw_comision.setitem(1,'plani_sepultura',ls_nulo)
		dw_comision.setitem(1,'capacidad',ll_nulo)
		dw_comision.setitem(1,'uso',ls_nulo)
		dw_comision.setitem(1,'t_const',ls_nulo)
		dw_comision.setitem(1,'t_sepult',ls_nulo)
		dw_comision.setitem(1,'moneda',ls_nulo)
		dw_comision.setitem(1,'precio_ctto',ll_nulo)
		dw_comision.setitem(1,'precio_lista',ll_nulo)
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		dw_comision.accepttext()
	end if
elseif ls_columna = 'plani_sector' then
	ls_sector												= dw_comision.getitemstring(1,'plani_sector')
	if not isnull(ls_sector) and ls_sector <>'' then
		dw_comision.setitem(1,'plani_sepultura',ls_nulo)
		idw_detalle3.retrieve(ll_cod_parque,ls_sector)
		dw_comision.setitem(1,'capacidad',ll_nulo)
		dw_comision.setitem(1,'uso',ls_nulo)
		dw_comision.setitem(1,'t_const',ls_nulo)
		dw_comision.setitem(1,'t_sepult',ls_nulo)
		dw_comision.setitem(1,'moneda',ls_nulo)
		dw_comision.setitem(1,'precio_ctto',ll_nulo)
		dw_comision.setitem(1,'precio_lista',ll_nulo)
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		dw_comision.accepttext()
	end if
//funeraria
elseif ls_columna = 'cod_funeraria' then
	ll_cod_funeraria										= this.getitemnumber(1,'cod_funeraria')
	ll_folio													= dw_comision.getitemnumber(1,'folio')
	ll_folio_mas											= wf_folio_funer(ll_folio)
	if ll_cod_funeraria > 0 then
		SELECT 	"FUNERARIA"."DIRECCION",   "FUNERARIA"."COMUNA",   "FUNERARIA"."CIUDAD",	"FUNERARIA"."CONTACTO",   	"FUNERARIA"."FONO",  "FUNERARIA"."FAX",   "FUNERARIA"."EMAIL",   	"FUNERARIA"."DV",   	"FUNERARIA"."RUT"    
		INTO 		:ls_direccion_represent,   :ls_comuna_reprensent, 	:ls_ciudad_represent,	:ls_contacto,   				:ls_fono,   			:ls_fax,   				:ls_email,   				:ls_dv,   				:ll_rut_funeraria  
		FROM 		"FUNERARIA"  
		WHERE 	"FUNERARIA"."RUT" = :ll_cod_funeraria   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_comision.setitem(1,'direccion_representante',ls_direccion_represent)
			dw_comision.setitem(1,'ciudad_representante',ls_ciudad_represent)
			idw_detalle5.retrieve(ls_ciudad_represent)
			dw_comision.setitem(1,'comuna_representante',ls_comuna_reprensent)
			dw_comision.setitem(1,'nombre_representante',ls_contacto)
			dw_comision.setitem(1,'dv_representente',ls_dv)
			dw_comision.setitem(1,'rut_representante',ll_rut_funeraria)
			dw_comision.setitem(1,'fono_represent',ls_fono)
			dw_comision.accepttext()
			dw_comision.setitem(1,'neto_comision',ll_nulo)
			dw_comision.setitem(1,'retencion',ll_nulo)
			dw_comision.setitem(1,'total_pago',ll_nulo)
			ll_cod_parque								= dw_comision.getitemnumber(1,'cod_parque')
			ldt_fecha_cierre							= dw_comision.getitemdatetime(1,'fecha_cierre')
			ll_mes_comi									= month(date(ldt_fecha_cierre))
			ll_ano_comi									= year(date(ldt_fecha_cierre))
			ls_moneda									= dw_comision.getitemstring(1,'moneda')
			ldb_precio_ctto							= dw_comision.getitemnumber(1,'precio_ctto')
			SELECT	"TAB_UF"."VALOR_UF"  
			INTO 		:ldb_valor_uf  
			FROM 		"TAB_UF"  
			WHERE 	"TAB_UF"."FECHA_UF" 	= :ldt_fecha_cierre
			USING		sqlca;
			if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
				SELECT	MAX("TAB_UF"."FECHA_UF")  
				INTO 		:ldt_fecha_max_uf  
				FROM 		"TAB_UF"  
				USING		Trans_1;
				if Trans_1.sqlcode = 0 then
					dw_comision.setitem(1,"uf_dia",ll_nulo)
					dw_comision.setitem(1,"mes_cierre",ll_nulo)
					dw_comision.setitem(1,"ano_cierre",ll_nulo)
					dw_comision.accepttext()
				end if
			else
				dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
				dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
				dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
				dw_comision.accepttext()
			end if
			SELECT	MAX("PORCE_RETENCION"),MAX("ADICIONAL")
			INTO 		:ldb_retencion, :ll_adicional
			FROM		"FUNERARIA_PORCENTAJE"
			WHERE		( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				ldb_porce_reten						= ldb_retencion
				ll_adicional							= ll_adicional
			end if
			ll_dato_mas									= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
			dw_comision.setitem(1,'numero_dato',ll_dato_mas)
			dw_comision.accepttext()
			wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
		end if
	else
		messagebox("Advertencia","No Existe Funeraria")
	end if
//Checked
elseif ls_columna = 'c_marcar' then
	ll_marcar											= long(data)
	if ll_marcar = 1 then
		ll_res											= messagebox("Advertencia","Desea Copiar Antecedentes del Titular a Datos del Contacto",Exclamation!,YesNo!,2)
		if ll_res = 1 then
			ls_nombre_titular 						= dw_comision.getitemstring(1,'nombre_titular')
			ls_a_paterno_titular 					= dw_comision.getitemstring(1,'a_paterno_titular')
			ls_a_materno_titular 					= dw_comision.getitemstring(1,'a_materno_titular')
			dw_comision.setitem(1,'nombre_contacto',ls_nombre_titular)   
			dw_comision.setitem(1,'a_paterno_contacto',ls_a_paterno_titular)   
			dw_comision.setitem(1,'a_materno_contacto',ls_a_materno_titular) 
			dw_comision.accepttext()
		end if
	else
		ll_res											= messagebox("Advertencia","Desea Limpiar Datos del Contacto",Exclamation!,YesNo!,2)
		if ll_res = 1 then
			dw_comision.setitem(1,'nombre_contacto',ls_nulo)   
			dw_comision.setitem(1,'a_paterno_contacto',ls_nulo)   
			dw_comision.setitem(1,'a_materno_contacto',ls_nulo) 
			dw_comision.accepttext()
		end if
	end if
//fecha_cierre	
elseif ls_columna = 'fecha_cierre' then
	ll_folio												= dw_comision.getitemnumber(1,'folio')
	ll_folio_mas										= wf_folio_funer(ll_folio)
	dw_comision.setitem(1,'folio',ll_folio_mas)
	dw_comision.setitem(1,'neto_comision',ll_nulo)
	dw_comision.setitem(1,'retencion',ll_nulo)
	dw_comision.setitem(1,'total_pago',ll_nulo)
	ll_cod_funeraria									= dw_comision.getitemnumber(1,'cod_funeraria')
	ll_cod_parque										= dw_comision.getitemnumber(1,'cod_parque')
	ldt_fecha_cierre									= dw_comision.getitemdatetime(1,'fecha_cierre')
	ll_mes_comi											= month(date(ldt_fecha_cierre))
	ll_ano_comi											= year(date(ldt_fecha_cierre))
	ls_moneda											= dw_comision.getitemstring(1,'moneda')
	ldb_precio_ctto									= dw_comision.getitemnumber(1,'precio_ctto')
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_cierre
	USING		sqlca;
	if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ldt_fecha_max_uf  
		FROM 		"TAB_UF"  
		USING		Trans_1;
		if Trans_1.sqlcode = 0 then
			messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
			dw_comision.setitem(1,"fecha_cierre",ldt_nulo)
			dw_comision.setitem(1,"uf_dia",ll_nulo)
			dw_comision.setitem(1,"mes_cierre",ll_nulo)
			dw_comision.setitem(1,"ano_cierre",ll_nulo)
			dw_comision.accepttext()
		end if
	else
		dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
		dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
		dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
		dw_comision.accepttext()
	end if
	SELECT	MAX("PORCE_RETENCION"),	MAX("ADICIONAL")
	INTO 		:ldb_retencion,			:ll_adicional
	FROM		"FUNERARIA_PORCENTAJE"
	WHERE		( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque )
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		ldb_porce_reten								= ldb_retencion
		ll_adicional									= ll_adicional
	end if
	ll_dato_mas											= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
	dw_comision.setitem(1,'numero_dato',ll_dato_mas)
	dw_comision.accepttext()
	wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
//fecha_ctto	
elseif ls_columna = 'fecha_ctto' then
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ldt_fecha_ctto									= dw_comision.getitemdatetime(1,'fecha_ctto')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ls_moneda										= dw_comision.getitemstring(1,'moneda')
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_ctto
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"fecha_ctto",ldt_nulo)
				dw_comision.accepttext()
			end if
		end if
		SELECT	MAX("PORCE_RETENCION"), MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional
		FROM		"FUNERARIA_PORCENTAJE"
		WHERE		( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque )
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			ldb_porce_reten							= ldb_retencion
			ll_adicional								= ll_adicional
		end if
		ll_dato_mas										= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
//uso
elseif ls_columna = 'uso' then
	dw_comision.setitem(1,'neto_comision',ll_nulo)
	dw_comision.setitem(1,'retencion',ll_nulo)
	dw_comision.setitem(1,'total_pago',ll_nulo)
	dw_comision.accepttext()
	ls_uso_pr 											= data
	ll_cod_parque										= dw_comision.getitemnumber(1,'cod_parque')
	ls_zona												= dw_comision.getitemstring(1,'area')
	ll_capac												= dw_comision.getitemnumber(1,'capacidad')
	ls_moneda											= dw_comision.getitemstring(1,'moneda')
	ls_tp_constr										= dw_comision.getitemstring(1,'t_const')
	ls_tp_sepul											= dw_comision.getitemstring(1,'t_sepult')
	ldt_fecha_ctto										= dw_comision.getitemdatetime(1,'fecha_ctto')
	ll_mes_comi											= month(date(ldt_fecha_cierre))
	ll_ano_comi											= year(date(ldt_fecha_cierre))
	if isnull (ldt_fecha_ctto) or ldt_fecha_ctto = datetime('00/00/0000') then
		messagebox("Advertencia","Debe Ingresar Fecha de Contrato")
		dw_comision.setfocus()
		dw_comision.setcolumn('fecha_ctto')
		dw_comision.setitem(1,'moneda',ls_nulo)
		dw_comision.setitem(1,'precio_ctto',ll_nulo)
		dw_comision.setitem(1,'precio_lista',ll_nulo)
		dw_comision.setitem(1,'porce_descto',ll_nulo)
		dw_comision.accepttext()
	else
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_uf_dia  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_ctto
		USING		sqlca;
		if isnull(ldb_uf_dia) or ldb_uf_dia = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_ctto,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.accepttext()
			end if
		else
			SELECT	"LISTA_PRECIO"."VALOR"   
			INTO		:ldb_valor_sepul  
			FROM		"LISTA_PRECIO"  
			WHERE 	( "LISTA_PRECIO"."SECTOR" = :ls_zona ) AND  
						( "LISTA_PRECIO"."CAPACIDAD" = :ll_capac ) AND  
						( "LISTA_PRECIO"."CANAL" = :ls_uso_pr ) AND  
						( "LISTA_PRECIO"."T_CONST" = :ls_tp_constr ) AND  
						( "LISTA_PRECIO"."T_SEPULT" = :ls_tp_sepul ) AND
						( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque)
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				if ls_moneda = '1' then
					ldb_precio_lista					= ldb_valor_sepul * ldb_uf_dia
				else
					ldb_precio_lista					= ldb_valor_sepul 
				end if
				dw_comision.setitem(1,'precio_lista',ldb_precio_lista)
				dw_comision.setitem(1,'precio_ctto',ldb_precio_lista)
				dw_comision.accepttext()
				ldb_precio_lista						= dw_comision.getitemnumber(1,'precio_lista')
				ldb_precio_ctto						= dw_comision.getitemnumber(1,'precio_ctto')
				ldb_porce_descto						= 100 - (ldb_precio_ctto/ldb_precio_lista*100)
				dw_comision.setitem(1,'porce_descto',ldb_porce_descto)
			end if
		end if
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" 	= :ldt_fecha_cierre
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"uf_dia",ll_nulo)
				dw_comision.setitem(1,"mes_cierre",ll_nulo)
				dw_comision.setitem(1,"ano_cierre",ll_nulo)
				dw_comision.accepttext()
			end if
		else
			dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
			dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
			dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
			dw_comision.accepttext()
		end if
		SELECT	MAX("PORCE_RETENCION"),	MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional
		FROM		"FUNERARIA_PORCENTAJE"
		WHERE		( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque )
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ldb_porce_reten							= ldb_retencion
			ll_adicional								= ll_adicional
		end if
		ll_dato_mas	= dw_comision.getitemnumber(1,'numero_dato')
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	end if
//moneda
elseif ls_columna = 'moneda' then
	dw_comision.setitem(1,'neto_comision',ll_nulo)
	dw_comision.setitem(1,'retencion',ll_nulo)
	dw_comision.setitem(1,'total_pago',ll_nulo)
	dw_comision.accepttext()
	ls_moneda 											= data
	ll_cod_parque										= dw_comision.getitemnumber(1,'cod_parque')
	ls_zona												= dw_comision.getitemstring(1,'area')
	ll_capac												= dw_comision.getitemnumber(1,'capacidad')
	ls_uso_pr											= dw_comision.getitemstring(1,'uso')
	ls_tp_constr										= dw_comision.getitemstring(1,'t_const')
	ls_tp_sepul											= dw_comision.getitemstring(1,'t_sepult')
	ldt_fecha_ctto										= dw_comision.getitemdatetime(1,'fecha_ctto')
	ll_mes_comi											= month(date(ldt_fecha_cierre))
	ll_ano_comi											= year(date(ldt_fecha_cierre))
	if isnull (ldt_fecha_ctto) or ldt_fecha_ctto = datetime('00/00/0000') then
		messagebox("Advertencia","Debe Ingresar Fecha de Contrato")
		dw_comision.setfocus()
		dw_comision.setcolumn('fecha_ctto')
		dw_comision.setitem(1,'moneda',ls_nulo)
		dw_comision.setitem(1,'precio_ctto',ll_nulo)
		dw_comision.setitem(1,'precio_lista',ll_nulo)
		dw_comision.setitem(1,'porce_descto',ll_nulo)
		dw_comision.accepttext()
	else
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_uf_dia  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_ctto
		USING		sqlca;
		if isnull(ldb_uf_dia) or ldb_uf_dia = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_ctto,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.accepttext()
			end if
		else
			SELECT	"LISTA_PRECIO"."VALOR"   
			INTO		:ldb_valor_sepul  
			FROM		"LISTA_PRECIO"  
			WHERE 	( "LISTA_PRECIO"."SECTOR" = :ls_zona ) AND  
						( "LISTA_PRECIO"."CAPACIDAD" = :ll_capac ) AND  
						( "LISTA_PRECIO"."CANAL" = :ls_uso_pr ) AND  
						( "LISTA_PRECIO"."T_CONST" = :ls_tp_constr ) AND  
						( "LISTA_PRECIO"."T_SEPULT" = :ls_tp_sepul ) AND
						( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque)
			USING		sqlca;
			if sqlca.sqlcode = 0 then
				if ls_moneda = '1' then
					ldb_precio_lista					= ldb_valor_sepul * ldb_uf_dia
				else
					ldb_precio_lista					= ldb_valor_sepul 
				end if
				dw_comision.setitem(1,'precio_lista',ldb_precio_lista)
				dw_comision.setitem(1,'precio_ctto',ldb_precio_lista)
				dw_comision.accepttext()
				ldb_precio_lista						= dw_comision.getitemnumber(1,'precio_lista')
				ldb_precio_ctto						= dw_comision.getitemnumber(1,'precio_ctto')
				ldb_porce_descto						= 100 - (ldb_precio_ctto/ldb_precio_lista*100)
				dw_comision.setitem(1,'porce_descto',ldb_porce_descto)
			end if
		end if
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_cierre
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"uf_dia",ll_nulo)
				dw_comision.setitem(1,"mes_cierre",ll_nulo)
				dw_comision.setitem(1,"ano_cierre",ll_nulo)
				dw_comision.accepttext()
			end if
		else
			dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
			dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
			dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
			dw_comision.accepttext()
		end if
		SELECT	MAX("PORCE_RETENCION"),	MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional			
		FROM		"FUNERARIA_PORCENTAJE"
		WHERE		( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque )
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			ldb_porce_reten							= ldb_retencion
			ll_adicional								= ll_adicional
		end if
		ll_dato_mas										= dw_comision.getitemnumber(1,'numero_dato')
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	end if
//dv_titular
elseif ls_columna = 'rut_titular' or ls_columna = 'dv_titular' then
	ll_rut_valida_tit									= dw_comision.getitemnumber(1,'rut_titular')
	ls_dv_valida_tit									= dw_comision.getitemstring(1,'dv_titular')
	if ll_rut_valida_tit>0 and ls_dv_valida_tit<>'' and not isnull(ls_dv_valida_tit) then
		if String(ls_dv_valida_tit) <> String(gf_obtener_dv(ll_rut_valida_tit)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			dw_comision.setitem(1,'rut_titular',ll_rut_valida_tit)
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_titular')
			dw_comision.setitem(1,'dv_titular',ls_nulo)
		end if 
	end if
//dv_representente
elseif ls_columna = 'rut_representante' or ls_columna = 'dv_representente' then
	ll_rut_valida_repres								= dw_comision.getitemnumber(1,'rut_representante')
	ls_dv_valida_repres								= dw_comision.getitemstring(1,'dv_representente')
	if ll_rut_valida_repres>0 and ls_dv_valida_repres<>'' and not isnull(ls_dv_valida_repres) then
		if String(ls_dv_valida_repres) <> String(gf_obtener_dv(ll_rut_valida_repres)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			dw_comision.setitem(1,'rut_representante',ll_rut_valida_repres)
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_representente')
			dw_comision.setitem(1,'dv_representente',ls_nulo)
		end if 
	end if
//dv_fallecido
elseif ls_columna = 'rut_fallecido' or ls_columna = 'dv_fallecido' then
	ll_rut_valida_fall								= dw_comision.getitemnumber(1,'rut_fallecido')
	ls_dv_valida_fall									= dw_comision.getitemstring(1,'dv_fallecido')
	if ll_rut_valida_fall>0 and ls_dv_valida_fall<>'' and not isnull(ls_dv_valida_fall) then
	//if ll_rut_valida_fall>1 and ls_dv_valida_fall<>'' and ls_dv_valida_fall<> '0' and not isnull(ls_dv_valida_fall) then
		if String(ls_dv_valida_fall) <> String(gf_obtener_dv(ll_rut_valida_fall)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			dw_comision.setitem(1,'rut_fallecido',ll_rut_valida_fall)
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_fallecido')
			dw_comision.setitem(1,'dv_fallecido',ls_nulo)
		end if
	end if
//ciudad_titular
elseif ls_columna ='ciudad_titular' then
	dw_comision.setitem(1,'comuna_titular',ls_nulo)
	dw_comision.accepttext()
	idw_detalle4.retrieve(ls_ciudad_tit)
//ciudad_representante
elseif ls_columna ='ciudad_representante' then
	dw_comision.setitem(1,'comuna_representante',ls_nulo)
	dw_comision.accepttext()
	idw_detalle5.retrieve(ls_ciudad_repr)
//hora_cierre
elseif ls_columna = 'hora_cierre' then
	ll_hora_cierre 									= long(data)
	if ll_hora_cierre >= 24 then
		dw_comision.setitem(1,'hora_cierre',00)
	else
		dw_comision.setitem(1,'hora_cierre',ll_hora_cierre)
	end if
	dw_comision.accepttext()
//minuto_cierre
elseif ls_columna = 'minuto_cierre' then
	ll_minuto_cierre									= long(data)
	if ll_minuto_cierre >= 60 then
		dw_comision.setitem(1,'minuto_cierre',00)
	else
		dw_comision.setitem(1,'minuto_cierre',ll_minuto_cierre)
	end if
	dw_comision.accepttext()
//capacidad
elseif ls_columna = 'capacidad' then
	ll_capac										= long(data)
	ll_cod_parque								= dw_comision.getitemnumber(1,'cod_parque')
	ll_cod_funeraria							= dw_comision.getitemnumber(1,'cod_funeraria')
	ldt_fecha_cierre							= dw_comision.getitemdatetime(1,'fecha_cierre')
	ll_mes_comi									= month(date(ldt_fecha_cierre))
	ll_ano_comi									= year(date(ldt_fecha_cierre))
	ls_moneda									= dw_comision.getitemstring(1,'moneda')
	ldb_precio_ctto							= dw_comision.getitemnumber(1,'precio_ctto')
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" 	= :ldt_fecha_cierre
	USING		sqlca;
	if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ldt_fecha_max_uf  
		FROM 		"TAB_UF"  
		USING		Trans_1;
		if Trans_1.sqlcode = 0 then
			dw_comision.setitem(1,"uf_dia",ll_nulo)
			dw_comision.setitem(1,"mes_cierre",ll_nulo)
			dw_comision.setitem(1,"ano_cierre",ll_nulo)
			dw_comision.accepttext()
		end if
	else
		dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
		dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
		dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
		dw_comision.accepttext()
	end if
	SELECT	MAX("PORCE_RETENCION"),MAX("ADICIONAL")
	INTO 		:ldb_retencion, :ll_adicional
	FROM		"FUNERARIA_PORCENTAJE"
	WHERE		( "FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque )
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		ldb_porce_reten						= ldb_retencion
		ll_adicional							= ll_adicional
	end if
	ll_dato_mas									= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
	dw_comision.setitem(1,'numero_dato',ll_dato_mas)
	wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	dw_comision.accepttext()
//minuto_cierre
elseif ls_columna = 'minuto_cierre' then
	ll_minuto_cierre									= long(data)
	if ll_minuto_cierre >= 60 then
		dw_comision.setitem(1,'minuto_cierre',00)
	else
		dw_comision.setitem(1,'minuto_cierre',ll_minuto_cierre)
	end if
	dw_comision.accepttext()	
	
	
	
//num_cheque	
elseif ls_columna = 'funeraria_pago_comision_num_cheque' then
	ll_num_cheque									= long(data)
	ls_base											= dw_comision.getitemstring(1,'base')
	ls_serie											= dw_comision.getitemstring(1,'serie')
	ldb_numero										= dw_comision.getitemnumber(1,'numero')
	if ll_num_cheque > 0 then
		ll_res										= MessageBox("Advertencia", 'Desea Enviar EMail Informando Cheque Firma de Gerencia', Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			cb_grabar.triggerevent(clicked!)
			SELECT	"NOMBRE",				"EMAIL" 
			INTO		:ls_nombre_usuario,	:ls_email_de 
			FROM		"ENCARGADOS"  
			WHERE		( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) 
			USING		sqlca;			
			if isnull(ls_email_de) or ls_email_de='-' or ls_email_de='' then
				ls_email_de				= 'consulta@nuestrosparques.cl'
			end if
			ll_estado_email							= 97
			SELECT	"FUNERARIA_ESTADO"."DESCRIPCION"  
			INTO		:ls_descripcion_email  
			FROM		"FUNERARIA_ESTADO"  
			WHERE		"FUNERARIA_ESTADO"."CODIGO" = :ll_estado_email   
			USING		sqlca;
			if sqlca.sqlcode=0 then
			end if
			SELECT	"FUNERARIA_EMAIL"."USUARIO"  
			INTO 		:ls_email_para  
			FROM 		"FUNERARIA_EMAIL"  
			WHERE 	"FUNERARIA_EMAIL"."COD_ESTADO" = 99
			USING		sqlca;
			if sqlca.sqlcode=0 then
			end if
			SELECT	"FUNERARIA"."NOMBRE",	"FUNERARIA_PAGO_COMISION"."NUM_BOLETA"	
			INTO 		:ls_nombre_funeraria,	:ll_num_boleta									
			FROM		"FUNERARIA_PAGO_COMISION",	"FUNERARIA",	"FUNERARIA_ESTADO"  
			WHERE ( "FUNERARIA_PAGO_COMISION"."COD_FUNERARIA" = "FUNERARIA"."RUT" ) and  
					( "FUNERARIA_PAGO_COMISION"."COD_ESTADO" = "FUNERARIA_ESTADO"."CODIGO" ) and  
					( ( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base ) AND  
					( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie ) AND  
					( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_numero ))
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_glosa									= 'CHEQUE COMISIÓN FUNERARIA'
				ls_glosa_email 						= ls_descripcion_email+' INFORMANDO CHEQUE COMISIÓN FUNERARIA, FIRMA GERENCIA ADMIN. FINANZAS, CON FECHA: '+string(gdt_fec_sistema,'dd/mm/yyyy')+': PROMESA : '+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+' FUNERARIA '+ls_nombre_funeraria+' NUMERO BOLETA: '+string(ll_num_boleta)+' NUMERO CHEQUE: '+string(ll_num_cheque)
				select	EnviarMail(:ls_email_de,:ls_email_para,:ls_glosa,:ls_glosa_email) 
				INTO 		:ls_res
				from 		DUAL;
				if ls_res='OK' then
					messagebox("Envio Email","Envio Email Exitoso")
				else
					messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
				end if
			end if
		end if
	end if
	
//precio_ctto
elseif ls_columna ='precio_ctto' then
	dw_comision.setitem(1,'porce_descto',ll_nulo)
	dw_comision.setitem(1,'neto_comision',ll_nulo)
	dw_comision.setitem(1,'retencion',ll_nulo)
	dw_comision.setitem(1,'total_pago',ll_nulo)
	ldb_precio_lista									= dw_comision.getitemnumber(1,'precio_lista')
	ldb_precio_ctto									= dw_comision.getitemnumber(1,'precio_ctto')
	if isnull(ldb_precio_lista) or  ldb_precio_lista = 0 then
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_ctto									= dw_comision.getitemdatetime(1,'fecha_ctto')
		ls_zona											= dw_comision.getitemstring(1,'area')
		ls_sector										= dw_comision.getitemstring(1,'plani_sector')
		ls_sepultura									= dw_comision.getitemstring(1,'plani_sepultura')
		ls_tp_constr									= dw_comision.getitemstring(1,'t_const')
		ls_tp_sepul										= dw_comision.getitemstring(1,'t_sepult')
		ll_capac											= dw_comision.getitemnumber(1,'capacidad')
		ls_uso											= dw_comision.getitemstring(1,'uso')
		ls_moneda										= dw_comision.getitemstring(1,'moneda')
		if isnull (ll_cod_parque) or ll_cod_parque = 0 then
			messagebox("Advertencia","Debe Ingresar Parque")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('cod_parque')
		elseif isnull (ldt_fecha_ctto) or ldt_fecha_ctto = datetime('00/00/0000') then
			messagebox("Advertencia","Debe Ingresar Fecha de Contrato")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('fecha_ctto')
		elseif isnull (ls_zona) or ls_zona = '' then
			messagebox("Advertencia","Debe Ingresar El Area")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('area')
		elseif isnull (ls_sector) or ls_sector = '' then
			messagebox("Advertencia","Debe Ingresar Sector")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('plani_sector')
		elseif isnull (ls_sepultura) or ls_sepultura = '' then
			messagebox("Advertencia","Debe Ingresar Sepultura")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('plani_sepultura')
		elseif isnull (ls_tp_constr) or ls_tp_constr = '' then
			messagebox("Advertencia","Debe Ingresar Tipo Construcción")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('t_const')
		elseif isnull (ls_tp_sepul) or ls_tp_sepul = '' then
			messagebox("Advertencia","Debe Ingresar Tipo Sepultura")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('t_sepult')
		elseif isnull (ll_capac) or ll_capac = 0 then
			messagebox("Advertencia","Debe Ingresar Capacidad Sepultura")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('capacidad')
		elseif isnull (ls_uso) or ls_uso = '' then
			messagebox("Advertencia","Debe Ingresar Uso Sepultura")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('uso')
		elseif isnull (ls_moneda) or ls_moneda = '' then
			messagebox("Advertencia","Debe Ingresar Tipo Moneda")
			dw_comision.setitem(1,'precio_ctto',ll_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('moneda')
		end if
		dw_comision.accepttext()
	else
		ldb_porce_descto   							= (100 - ((ldb_precio_ctto / ldb_precio_lista) * 100 ))
		dw_comision.setitem(1,'porce_descto',ldb_porce_descto)
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ls_moneda										= dw_comision.getitemstring(1,'moneda')
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_cierre
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"uf_dia",ll_nulo)
				dw_comision.setitem(1,"mes_cierre",ll_nulo)
				dw_comision.setitem(1,"ano_cierre",ll_nulo)
				dw_comision.accepttext()
			end if
		else
			dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
			dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
			dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
			dw_comision.accepttext()
		end if
		SELECT	MAX("PORCE_RETENCION"), MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional
		FROM		"FUNERARIA_PORCENTAJE"
		WHERE		"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ldb_porce_reten							= ldb_retencion
			ll_adicional								= ll_adicional
		end if
		ll_dato_mas										= dw_comision.getitemnumber(1,'numero_dato')
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	end if
//folio
elseif ls_columna = 'folio' then
		dw_comision.setitem(1,'neto_comision',ll_nulo)
		dw_comision.setitem(1,'retencion',ll_nulo)
		dw_comision.setitem(1,'total_pago',ll_nulo)
		ll_cod_funeraria								= dw_comision.getitemnumber(1,'cod_funeraria')
		ll_cod_parque									= dw_comision.getitemnumber(1,'cod_parque')
		ldt_fecha_cierre								= dw_comision.getitemdatetime(1,'fecha_cierre')
		ldt_fecha_ctto									= dw_comision.getitemdatetime(1,'fecha_ctto')
		ll_mes_comi										= month(date(ldt_fecha_cierre))
		ll_ano_comi										= year(date(ldt_fecha_cierre))
		ls_moneda										= dw_comision.getitemstring(1,'moneda')
		ldb_precio_ctto								= dw_comision.getitemnumber(1,'precio_ctto')
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_ctto
		USING		sqlca;
		if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
			SELECT	MAX("TAB_UF"."FECHA_UF")  
			INTO 		:ldt_fecha_max_uf  
			FROM 		"TAB_UF"  
			USING		Trans_1;
			if Trans_1.sqlcode = 0 then
				messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
				dw_comision.setitem(1,"fecha_ctto",ldt_nulo)
				dw_comision.accepttext()
			end if
		end if
		SELECT	MAX("PORCE_RETENCION"), MAX("ADICIONAL")
		INTO 		:ldb_retencion,			:ll_adicional
		FROM		"FUNERARIA_PORCENTAJE"
		USING		sqlca;
		if sqlca.sqlcode = 0 then
			ldb_porce_reten							= ldb_retencion
			ll_adicional								= ll_adicional
		end if
		ll_dato_mas										= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
		dw_comision.setitem(1,'numero_dato',ll_dato_mas)
		dw_comision.accepttext()
		wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
end if
//parque;area
if ls_columna='cod_parque' or ls_columna='area' or ls_columna='plani_sector' or ls_columna='ciudad_titular' or ls_columna='ciudad_representante' then
	ll_cod_parque										= dw_comision.getitemnumber(1,'cod_parque')
	ls_area												= dw_comision.getitemstring(1,'area')
	ls_sector											= dw_comision.getitemstring(1,'plani_sector')
	ls_ciudad_tit										= dw_comision.getitemstring(1,'ciudad_titular')
	ls_ciudad_repr										= dw_comision.getitemstring(1,'ciudad_representante')
	if ll_cod_parque>0 and not isnull(ls_area) then
		idw_detalle2.retrieve(ll_cod_parque,ls_area)
	end if
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) then
		idw_detalle3.retrieve(ll_cod_parque,ls_sector)
	end if
	if not isnull(ls_ciudad_tit) then
		idw_detalle4.retrieve(ls_ciudad_tit)
	end if
	if not isnull(ls_ciudad_repr) then
		idw_detalle5.retrieve(ls_ciudad_repr)
	end if
	dw_comision.accepttext()
	
	ll_parque_consul									= dw_comision.getitemnumber(1,'cod_parque')
	ls_sector_consul									= dw_comision.getitemstring(1,'plani_sector')
	ls_sepult_consul									= dw_comision.getitemstring(1,'plani_sector')
	
	SELECT	"INVENTARIO_PLANI"."CAPACIDAD"
	INTO 		:ll_capacidad
	FROM		"INVENTARIO_PLANI"  
	WHERE 	( "INVENTARIO_PLANI"."SECTOR" = :ls_sector_consul ) AND  
				( "INVENTARIO_PLANI"."SEPULTURA" = :ls_sepult_consul ) AND  
				( "INVENTARIO_PLANI"."COD_PARQUE" = :ll_parque_consul )   
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		dw_comision.setitem(1,'capacidad',ll_capacidad)
	end if
		
	SELECT	"BASE_PLANI"."TIPO_SEP"  
	INTO 		:ls_tipo_sepult
	FROM 		"BASE_PLANI"  
	WHERE  ( "BASE_PLANI"."SECTOR" = :ls_sector_consul ) AND  
			 ( "BASE_PLANI"."COD_PARQUE" = :ll_parque_consul ) 
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_comision.setitem(1,'t_sepult',ls_tipo_sepult)
		ls_uso											= 'NI'
		dw_comision.setitem(1,'uso',ls_uso)
		dw_comision.accepttext()
	end if
	SELECT	"LISTA_PRECIO"."T_CONST"  
   INTO		:ls_tipo_const  
   FROM		"LISTA_PRECIO"  
   WHERE 	( "LISTA_PRECIO"."SECTOR" = :ls_area ) AND  
         	( "LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad ) AND  
         	( "LISTA_PRECIO"."CANAL" = :ls_uso ) AND  
         	( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepult ) AND
				( "LISTA_PRECIO"."COD_PARQUE" = :ll_parque_consul)
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_comision.setitem(1,'t_const',ls_tipo_const)
		dw_comision.accepttext()
	end if
	ll_cod_funeraria									= dw_comision.getitemnumber(1,'cod_funeraria')
	ll_cod_parque										= dw_comision.getitemnumber(1,'cod_parque')
	ldt_fecha_cierre									= dw_comision.getitemdatetime(1,'fecha_cierre')
	ll_mes_comi											= month(date(ldt_fecha_cierre))
	ll_ano_comi											= year(date(ldt_fecha_cierre))
	ls_moneda											= dw_comision.getitemstring(1,'moneda')
	ldb_precio_ctto									= dw_comision.getitemnumber(1,'precio_ctto')
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" 	= :ldt_fecha_cierre
	USING		sqlca;
	if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ldt_fecha_max_uf  
		FROM 		"TAB_UF"  
		USING		Trans_1;
		if Trans_1.sqlcode = 0 then
			messagebox('Advertencia','No Existe Valor U.F. Con Fecha: '+string(ldt_fecha_cierre,'dd/mm/yyyy')+',  Último Valor U.F Registrado '+string(ldt_fecha_max_uf,'dd/mm/yyyy'))
			dw_comision.setitem(1,"uf_dia",ll_nulo)
			dw_comision.setitem(1,"mes_cierre",ll_nulo)
			dw_comision.setitem(1,"ano_cierre",ll_nulo)
			dw_comision.accepttext()
		end if
	else
		dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
		dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
		dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
		dw_comision.accepttext()
	end if
	SELECT	MAX("PORCE_RETENCION"),	MAX("ADICIONAL")
	INTO 		:ldb_retencion,			:ll_adicional
	FROM		"FUNERARIA_PORCENTAJE"
	WHERE		"FUNERARIA_PORCENTAJE"."COD_PARQUE" = :ll_cod_parque
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		ldb_porce_reten								= ldb_retencion
		ll_adicional									= ll_adicional
	end if
	ll_dato_mas											= wf_dato_funer(ll_cod_parque,ll_cod_funeraria,ll_mes_comi,ll_ano_comi)
	dw_comision.setitem(1,'numero_dato',ll_dato_mas)
	dw_comision.accepttext()
	wf_calculo(ll_cod_parque,ll_cod_funeraria,ll_dato_mas,ldb_precio_ctto,ldb_valor_uf,ll_adicional,ldb_porce_reten,ls_moneda,ll_capac)
	dw_comision.accepttext()
end if
dw_comision.accepttext()
ll_valor_uf_0											= dw_comision.getitemnumber(1,'uf_dia')
if isnull(ll_valor_uf_0) or ll_valor_uf_0 = 0 then
	dw_comision.setitem(1,'neto_comision',ll_nulo)
	dw_comision.setitem(1,'retencion',ll_nulo)
	dw_comision.setitem(1,'total_pago',ll_nulo)
end if
SetPointer(Arrow!)
end event

event itemfocuschanged;string	ls_dv_valida_repres,ls_nulo,ls_dv_valida_tit,ls_dv_valida_fall,ls_columna
long		ll_hora_cierre,ll_minuto_cierre,ll_uf_dia,ll_nulo,ll_mes_comi,ll_ano_comi,ll_rut_valida_repres,ll_rut_valida_tit,&
			ll_rut_valida_fall
datetime	ldt_fecha_cierre,ldt_fecha_max_uf,ldt_nulo,ldt_fecha_ctto
double	ldb_valor_uf,ldb_valor_uf_ctto

this.accepttext()
ls_columna						= dwo.name
setnull(ll_nulo);setnull(ldt_nulo);setnull(ls_nulo)
ll_hora_cierre 				= dw_comision.getitemnumber(1,'hora_cierre')
if ll_hora_cierre >= 24 then
	dw_comision.setitem(1,'hora_cierre',00)
else
	dw_comision.setitem(1,'hora_cierre',ll_hora_cierre)
end if
dw_comision.accepttext()
ll_minuto_cierre 				= dw_comision.getitemnumber(1,'minuto_cierre')
if ll_minuto_cierre >= 60 then
	dw_comision.setitem(1,'minuto_cierre',00)
else
	dw_comision.setitem(1,'minuto_cierre',ll_minuto_cierre)
end if
dw_comision.accepttext()
ldt_fecha_cierre				= dw_comision.getitemdatetime(1,'fecha_cierre')
ll_mes_comi						= month(date(ldt_fecha_cierre))
ll_ano_comi						= year(date(ldt_fecha_cierre))
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_cierre
USING		sqlca;
if isnull(ldb_valor_uf) or ldb_valor_uf = 0 then
	SELECT	MAX("TAB_UF"."FECHA_UF")  
	INTO 		:ldt_fecha_max_uf  
	FROM 		"TAB_UF"  
	USING		Trans_1;
	if Trans_1.sqlcode = 0 then
		dw_comision.setitem(1,"fecha_cierre",ldt_nulo)
		dw_comision.setitem(1,"uf_dia",ll_nulo)
		dw_comision.setitem(1,"mes_cierre",ll_nulo)
		dw_comision.setitem(1,"ano_cierre",ll_nulo)
		dw_comision.accepttext()
	end if
else
	dw_comision.setitem(1,"uf_dia",ldb_valor_uf)
	dw_comision.setitem(1,"mes_cierre",ll_mes_comi)
	dw_comision.setitem(1,"ano_cierre",ll_ano_comi)
	dw_comision.accepttext()
end if
ldt_fecha_ctto					= dw_comision.getitemdatetime(1,'fecha_ctto')
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf_ctto  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_ctto
USING		sqlca;
if isnull(ldb_valor_uf_ctto) or ldb_valor_uf_ctto = 0 then
	SELECT	MAX("TAB_UF"."FECHA_UF")  
	INTO 		:ldt_fecha_max_uf  
	FROM 		"TAB_UF"  
	USING		Trans_1;
	if Trans_1.sqlcode = 0 then
		dw_comision.setitem(1,"fecha_ctto",ldt_nulo)
		dw_comision.accepttext()
	end if
end if
if ls_columna = 'rut_titular' or ls_columna = 'dv_titular' or ls_columna = 'nombre_titular' then
	ll_rut_valida_tit			= dw_comision.getitemnumber(1,'rut_titular')
	ls_dv_valida_tit			= dw_comision.getitemstring(1,'dv_titular')
	if ll_rut_valida_tit>0 and ls_dv_valida_tit<>'' and not isnull(ls_dv_valida_tit) then
		if String(ls_dv_valida_tit) <> String(gf_obtener_dv(ll_rut_valida_tit)) then
			dw_comision.setitem(1,'rut_titular',ll_rut_valida_tit)
			dw_comision.setitem(1,'dv_titular',ls_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_titular')
		end if 
	end if
end if
if ls_columna = 'rut_representante' or ls_columna = 'dv_representente' or ls_columna = 'nombre_representante' then
	ll_rut_valida_repres		= dw_comision.getitemnumber(1,'rut_representante')
	ls_dv_valida_repres		= dw_comision.getitemstring(1,'dv_representente')
	if ll_rut_valida_repres>0 and ls_dv_valida_repres<>'' and not isnull(ls_dv_valida_repres) then
		if String(ls_dv_valida_repres) <> String(gf_obtener_dv(ll_rut_valida_repres)) then
			dw_comision.setitem(1,'rut_representante',ll_rut_valida_repres)
			dw_comision.setitem(1,'dv_representente',ls_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_representente')
		end if 
	end if
end if
if ls_columna = 'rut_fallecido' or ls_columna = 'dv_fallecido' or ls_columna = 'nombre_fallecido' then
	ll_rut_valida_fall		= dw_comision.getitemnumber(1,'rut_fallecido')
	ls_dv_valida_fall			= dw_comision.getitemstring(1,'dv_fallecido')
	if ll_rut_valida_fall>0 and ls_dv_valida_fall<>'' and not isnull(ls_dv_valida_fall) then
		if String(ls_dv_valida_fall) <> String(gf_obtener_dv(ll_rut_valida_fall)) then
			dw_comision.setitem(1,'rut_fallecido',ll_rut_valida_fall)
			dw_comision.setitem(1,'dv_fallecido',ls_nulo)
			dw_comision.setfocus()
			dw_comision.setcolumn('dv_fallecido')
		end if 
	end if
end if
end event

type gb_1 from groupbox within w_solicitud_pago_funeraria
integer x = 617
integer y = 2512
integer width = 2117
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

