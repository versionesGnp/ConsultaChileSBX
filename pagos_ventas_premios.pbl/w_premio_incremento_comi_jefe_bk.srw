forward
global type w_premio_incremento_comi_jefe_bk from window
end type
type cb_respal from commandbutton within w_premio_incremento_comi_jefe_bk
end type
type dw_fecha_cierre from datawindow within w_premio_incremento_comi_jefe_bk
end type
type dw_parque from datawindow within w_premio_incremento_comi_jefe_bk
end type
type cb_premio_pago from commandbutton within w_premio_incremento_comi_jefe_bk
end type
type cb_grabar from commandbutton within w_premio_incremento_comi_jefe_bk
end type
type cb_imprimir from commandbutton within w_premio_incremento_comi_jefe_bk
end type
type cb_cerrar from commandbutton within w_premio_incremento_comi_jefe_bk
end type
type pb_aceptar from picturebutton within w_premio_incremento_comi_jefe_bk
end type
type dw_premio_jefe from datawindow within w_premio_incremento_comi_jefe_bk
end type
end forward

global type w_premio_incremento_comi_jefe_bk from window
integer width = 3369
integer height = 1904
boolean titlebar = true
string title = "Premio Incremento Comisión"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 80269524
cb_respal cb_respal
dw_fecha_cierre dw_fecha_cierre
dw_parque dw_parque
cb_premio_pago cb_premio_pago
cb_grabar cb_grabar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
dw_premio_jefe dw_premio_jefe
end type
global w_premio_incremento_comi_jefe_bk w_premio_incremento_comi_jefe_bk

type variables
long			il_row, il_row_origen
end variables

forward prototypes
public function long wf_cta_vtas (string as_canal, datetime adt_fecha_cierre, string as_cod_jefe, double adb_porce_ing, long al_cod_parque, long al_unidad)
public function long wf_monto_comi (string as_canal, string as_cod_jefe, datetime adt_fec_comi, long al_cod_parque, long al_unidad)
public function long wf_calcula_premio (string as_canal, double adb_factor, long al_cod_parque, datetime adt_fech_comi, string as_cod_jef, long al_unidad)
public subroutine wf_lista_premiados (datetime adt_fecha_cierre, long al_cod_parque)
end prototypes

public function long wf_cta_vtas (string as_canal, datetime adt_fecha_cierre, string as_cod_jefe, double adb_porce_ing, long al_cod_parque, long al_unidad);string	ls_tipo_vta
long		ll_cta_vtas
//wf_cta_vtas(as_canal,adt_fecha_cierre,as_cod_jefe,adb_porce_ing,al_cod_parque,al_unidad)
if as_canal = 'NI' then
	SELECT	COUNT("OFERTA_V"."NRO_OFERTA") 
	INTO		:ll_cta_vtas
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA"  
	WHERE 	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and 
				"CADENA"."CODIGO" = 'O' and 
				"OFERTA_V"."CIERRE_VENTA" = :adt_fecha_cierre AND  
				"OFERTA_V"."COD_JEF" = :as_cod_jefe AND  
				"OFERTA_V"."PORCE_ING_CIERRE" >= :adb_porce_ing AND  
				"CADENA"."COD_PARQUE" = :al_cod_parque 
	USING		sqlca;
elseif as_canal = 'NF' then
	SELECT	COUNT("OFERTA_V"."NRO_OFERTA") 
	INTO		:ll_cta_vtas
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA"  
	WHERE 	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and 
				"CADENA"."CODIGO" = 'O' and 
				"OFERTA_V"."CIERRE_VENTA" = :adt_fecha_cierre AND  
				"OFERTA_V"."COD_JEF" = :as_cod_jefe AND  
				"OFERTA_V"."PORCE_ING_CIERRE" >= :adb_porce_ing  
	USING		sqlca;
elseif as_canal = 'UG' then
	if al_unidad = 0 then
		ls_tipo_vta = 'U'
	elseif al_unidad = 1 then
		ls_tipo_vta = 'C'
	elseif al_unidad = 2 then
		ls_tipo_vta = '3'
	end if
	SELECT	COUNT("OFERTA_V"."NRO_OFERTA") 
	INTO		:ll_cta_vtas
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA" 
	WHERE 	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and 
				"CADENA"."CODIGO" = 'O' and 
				"OFERTA_V"."CIERRE_VENTA" = :adt_fecha_cierre AND  
				"OFERTA_V"."PORCE_ING_CIERRE" >= :adb_porce_ing AND
				"OFERTA_V"."TIPO_VENTA" = :ls_tipo_vta  
	USING		sqlca;
end if
if sqlca.sqlcode=0 then
	if not isnull(ll_cta_vtas)  and ll_cta_vtas>0 then
		ll_cta_vtas						= ll_cta_vtas
	else
		ll_cta_vtas						= 0
	end if
else
	ll_cta_vtas							= 0
end if
if isnull(ll_cta_vtas) then ll_cta_vtas=0
Return ll_cta_vtas
	
end function

public function long wf_monto_comi (string as_canal, string as_cod_jefe, datetime adt_fec_comi, long al_cod_parque, long al_unidad);string	ls_tipo_vta
long		ll_total_comi
//wf_monto_comi(as_canal,as_cod_jefe,adt_fec_comi,al_cod_parque)
if as_canal='NI' then
	SELECT	sum("RES_COMI"."TOTAL_PAGO")
	INTO		:ll_total_comi  
	FROM		"RES_COMI", "CADENA", "OFERTA_V"
	WHERE		"RES_COMI"."SERIE" = "CADENA"."SERIE" AND
				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" AND
				"CADENA"."CODIGO" = 'O' AND
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') and
				"CADENA"."COD_PARQUE" = :al_cod_parque AND
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jefe  AND  
				"RES_COMI"."FECHA" = :adt_fec_comi 
	USING		sqlca;
elseif as_canal='NF' then
	SELECT	sum("RES_COMI"."TOTAL_PAGO")
	INTO		:ll_total_comi  
	FROM		"RES_COMI", "CADENA", "OFERTA_V"
	WHERE		"RES_COMI"."SERIE" = "CADENA"."SERIE" AND
				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" AND
				"CADENA"."CODIGO" = 'O' AND
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') and
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jefe  AND  
				"RES_COMI"."FECHA" = :adt_fec_comi 
	USING		sqlca;
elseif as_canal='UG' then
	if al_unidad = 0 then
		ls_tipo_vta = 'U'
	elseif al_unidad = 1 then
		ls_tipo_vta = 'C'
	elseif al_unidad = 2 then
		ls_tipo_vta = '3'
	end if
	SELECT	sum("RES_COMI"."TOTAL_PAGO")
	INTO		:ll_total_comi  
	FROM		"RES_COMI", "CADENA", "OFERTA_V"
	WHERE		"RES_COMI"."SERIE" = "CADENA"."SERIE" AND
				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" AND
				"CADENA"."CODIGO" = 'O' AND
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') and
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jefe  AND  
				"RES_COMI"."FECHA" = :adt_fec_comi AND
				"OFERTA_V"."TIPO_VENTA" = :ls_tipo_vta
	USING		sqlca;
end if
if sqlca.sqlcode=0 then
	if not isnull(ll_total_comi) and ll_total_comi>0 then
	end if
end if
if isnull(ll_total_comi) then ll_total_comi=0
Return ll_total_comi
	
end function

public function long wf_calcula_premio (string as_canal, double adb_factor, long al_cod_parque, datetime adt_fech_comi, string as_cod_jef, long al_unidad);string	ls_tipo_vta
double	ldb_sum_precio

//wf_calcula_premio(as_canal,adb_factor,al_cod_parque,adt_fech_comi,as_cod_jef)
if as_canal = 'NI' then
	SELECT	SUM(CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO" * (	SELECT	"FACTOR"  
																												   					FROM		"PREMIO_INCREM_COMI_JEFE"  
																												  					WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
																																				"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) / 100
							WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF" * (	SELECT	"FACTOR"  
																																									FROM 	"PREMIO_INCREM_COMI_JEFE"  
																																									WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
																																												"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) / 100 END)
	INTO		:ldb_sum_precio			
	FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
	WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
				"CADENA"."CODIGO" = 'O' AND
				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') AND  
				"CADENA"."COD_PARQUE" = :al_cod_parque and
				"RES_COMI"."FECHA" = :adt_fech_comi AND  
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jef
	USING		sqlca;
elseif as_canal = 'NF' then
	SELECT	SUM(CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO" * (	SELECT	"FACTOR"  
																												   FROM 		"PREMIO_INCREM_COMI_JEFE"  
																												  	WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
																																"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) / 100
							WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF" * (	SELECT	"FACTOR"  
																																					FROM 		"PREMIO_INCREM_COMI_JEFE"  
																																					WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
																																								"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) / 100 END)
	INTO		:ldb_sum_precio			
	FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
	WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
				"CADENA"."CODIGO" = 'O' AND
				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') AND   
				"RES_COMI"."FECHA" = :adt_fech_comi AND  
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jef
	USING		sqlca;
elseif as_canal = 'UG' then
	if al_unidad = 0 then
		ls_tipo_vta = 'U'
	elseif al_unidad = 1 then
		ls_tipo_vta = 'C'
	elseif al_unidad = 2 then
		ls_tipo_vta = '3'
	end if
	SELECT	SUM(CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO" * (	SELECT	"FACTOR"  
																												   FROM 		"PREMIO_INCREM_COMI_JEFE"  
																												  	WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
																																"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) / 100
							WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF" * (	SELECT	"FACTOR"  
																																					FROM 		"PREMIO_INCREM_COMI_JEFE"  
																																					WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
																																								"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) /100 END)
	INTO		:ldb_sum_precio			
	FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
	WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
				"CADENA"."CODIGO" = 'O' AND
				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') AND   
				"RES_COMI"."FECHA" = :adt_fech_comi AND  
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jef AND
				"OFERTA_V"."TIPO_VENTA" = :ls_tipo_vta
	USING		sqlca;	
end if
if sqlca.sqlcode=0 then
	if not isnull(ldb_sum_precio) and ldb_sum_precio>0 then
	end if
end if

if isnull(ldb_sum_precio) then ldb_sum_precio=0
Return ldb_sum_precio
end function

public subroutine wf_lista_premiados (datetime adt_fecha_cierre, long al_cod_parque);string	ls_cod_jefe,ls_nombre,ls_a_pater,ls_a_mater,ls_canal,ls_descrip,ls_cod_jefe_ugn
long		ll_cta_vtas_ugn,ll_mes,ll_ano,ll_val_fec_comi,ll_rut,ll_unidad,ll_vtas_presup,ll_cta_vtas,&
			ll_total_comi,ll_new,ll_total_comi_ugn,ll_vtas_presup_ugn,ll_tot_reg,ll_mes_comi,ll_ano_comi
datetime	ldt_fec_comi
double	ldb_porce_ing,ldb_porce,ldb_factor,ldb_premio,ldb_porce_ugn

//wf_lista_premiados(adt_fecha_cierre,al_cod_parque)
ll_cta_vtas_ugn										= 0
ll_mes													= month(date(adt_fecha_cierre))
ll_ano													= year(date(adt_fecha_cierre))
if ll_mes >= 12 then
	ll_mes_comi											= ll_mes - 11
	ll_ano_comi											= ll_ano + 1
else
	ll_mes_comi											= ll_mes + 1
	ll_ano_comi											= ll_ano
end if
ldt_fec_comi											= datetime(date(string(15,'00')+'/'+string(ll_mes_comi,'00')+'/'+string(ll_ano_comi,'0000')),time('00:00:00'))
SELECT	count("RES_COMI"."FECHA")
INTO		:ll_val_fec_comi
FROM 		"RES_COMI"  
WHERE 	"RES_COMI"."FECHA" = :ldt_fec_comi and
			("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037') 
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_val_fec_comi) then
		dw_premio_jefe.object.usuario.text		= gs_user
		DECLARE x1 CURSOR FOR  
		SELECT	"JEFE_VENTAS"."JEFE_VENTAS","JEFE_VENTAS"."NOMBRE","JEFE_VENTAS"."A_PATERNO","JEFE_VENTAS"."A_MATERNO","JEFE_VENTAS"."RUT","PRESUPUESTO_UNIDAD_VENTAS"."CANAL","PRESUPUESTO"."UNIDAD_VENTAS","PRESUPUESTO_UNIDAD_VENTAS"."PORCE_ING_CIERRE","PRESUPUESTO"."CANTIDAD_VENTAS","PRESUPUESTO_UNIDAD_VENTAS"."DESCRIPCION" 
		FROM		"JEFE_VENTAS","PRESUPUESTO","PRESUPUESTO_UNIDAD_VENTAS" 
		WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = "PRESUPUESTO"."COD_JEFE" and
					"PRESUPUESTO"."COD_JEFE" = "PRESUPUESTO_UNIDAD_VENTAS"."COD_JEFE" and
					"PRESUPUESTO"."COD_PARQUE" = "PRESUPUESTO_UNIDAD_VENTAS"."COD_PARQUE" and
					"PRESUPUESTO"."UNIDAD_VENTAS" = "PRESUPUESTO_UNIDAD_VENTAS"."UNIDAD_VENTA" and	
					"JEFE_VENTAS"."JEFE_VENTAS" <> 'CJ' AND  
					"PRESUPUESTO"."ESTADO" = 'V' AND
					"PRESUPUESTO"."MES" = :ll_mes AND  
					"PRESUPUESTO"."ANNO" = :ll_ano AND
					"PRESUPUESTO"."COD_PARQUE" = :al_cod_parque
		ORDER BY	"PRESUPUESTO_UNIDAD_VENTAS"."CANAL" ASC   
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
			fetch x1 INTO :ls_cod_jefe,:ls_nombre,:ls_a_pater,:ls_a_mater,:ll_rut,:ls_canal, :ll_unidad, :ldb_porce_ing,:ll_vtas_presup,:ls_descrip;
				if not isnull(ls_cod_jefe) then
					ll_cta_vtas								= wf_cta_vtas(ls_canal,adt_fecha_cierre,ls_cod_jefe,ldb_porce_ing,al_cod_parque,ll_unidad)
					ll_total_comi							= wf_monto_comi(ls_canal,ls_cod_jefe,ldt_fec_comi,al_cod_parque,ll_unidad)
					if ll_cta_vtas>0 then
						ldb_porce							= round(ll_cta_vtas / ll_vtas_presup * 100,2)
					else
						ldb_porce							= 0
					end if
					SELECT	"FACTOR"  
					INTO		:ldb_factor  
					FROM 		"PREMIO_INCREM_COMI_JEFE"  
					WHERE  	( "PREMIO_INCREM_COMI_JEFE"."TRAMO_INICIO" <= :ldb_porce ) AND  
								( "PREMIO_INCREM_COMI_JEFE"."TRAMO_FIN" > :ldb_porce ) AND
								( "PREMIO_INCREM_COMI_JEFE"."CANAL" = :ls_canal )
					USING		Trans_1 ;
					if Trans_1.sqlcode=0 then
						if not isnull(ldb_factor) and ldb_factor>0 then
							ldb_factor						= ldb_factor
						else
							ldb_factor						= ldb_factor
						end if
					else
						ldb_factor							= ldb_factor
					end if
					ldb_premio								= round(wf_calcula_premio(ls_canal,ldb_factor,al_cod_parque,ldt_fec_comi,ls_cod_jefe,ll_unidad),0)
					ll_new									= dw_premio_jefe.insertrow(0)
					dw_premio_jefe.scrolltorow(ll_new)
					dw_premio_jefe.setitem(ll_new,'cod_jefe',ls_cod_jefe)
					dw_premio_jefe.setitem(ll_new,'nombre',ls_nombre)
					dw_premio_jefe.setitem(ll_new,'a_paterno',ls_a_pater)
					dw_premio_jefe.setitem(ll_new,'a_materno',ls_a_mater)
					dw_premio_jefe.setitem(ll_new,'rut',ll_rut)
					dw_premio_jefe.setitem(ll_new,'canal',ls_canal)
					dw_premio_jefe.setitem(ll_new,'cod_parque',al_cod_parque)
					dw_premio_jefe.setitem(ll_new,'uni_descripcion',ls_descrip)
					dw_premio_jefe.setitem(ll_new,'porce_ing_cierre',ldb_porce_ing)
					dw_premio_jefe.setitem(ll_new,'vtas_presupuesto',ll_vtas_presup)
					dw_premio_jefe.setitem(ll_new,'vtas_producc',ll_cta_vtas)
					dw_premio_jefe.setitem(ll_new,'porce_pago',ldb_porce)
					dw_premio_jefe.setitem(ll_new,'factor',ldb_factor)
					dw_premio_jefe.setitem(ll_new,'total_comision',ll_total_comi)
					dw_premio_jefe.setitem(ll_new,'premio',ldb_premio)
					dw_premio_jefe.setitem(ll_new,'fecha_cierre',adt_fecha_cierre)
					dw_premio_jefe.setitem(ll_new,'fecha_comi',ldt_fec_comi)
					dw_premio_jefe.accepttext()
					if al_cod_parque=1 then
						if ls_canal='UG' then
							dw_premio_jefe.setitem(ll_new,'factor',0)
							dw_premio_jefe.setitem(ll_new,'premio',0)
							ls_cod_jefe_ugn					= ls_cod_jefe
							ll_total_comi_ugn					= ll_total_comi_ugn + ll_total_comi
							ll_cta_vtas_ugn					= ll_cta_vtas_ugn + ll_cta_vtas
							ll_vtas_presup_ugn				= ll_vtas_presup_ugn + ll_vtas_presup
							if ll_cta_vtas_ugn>0 then
								ldb_porce_ugn					= round(ll_cta_vtas_ugn / ll_vtas_presup_ugn * 100,2)
							else
								ldb_porce_ugn					= 0
							end if
						end if
					end if
				end if
				setnull(ls_cod_jefe)
			LOOP
		end if
		close x1;
		if al_cod_parque=1 then
			ll_new												= dw_premio_jefe.insertrow(0)
			dw_premio_jefe.scrolltorow(ll_new)
			dw_premio_jefe.setitem(ll_new,'cod_jefe',ls_cod_jefe_ugn)
			dw_premio_jefe.setitem(ll_new,'nombre',ls_nombre)
			dw_premio_jefe.setitem(ll_new,'a_paterno',ls_a_pater)
			dw_premio_jefe.setitem(ll_new,'a_materno',ls_a_mater)
			dw_premio_jefe.setitem(ll_new,'rut',ll_rut)
			ls_canal								= 'T'	
			dw_premio_jefe.setitem(ll_new,'canal',ls_canal)
			if ls_canal= 'T' then
				SELECT	"FACTOR"  
				INTO		:ldb_premio  
				FROM 		"PREMIO_INCREM_COMI_JEFE"  
				WHERE  	( "PREMIO_INCREM_COMI_JEFE"."TRAMO_INICIO" <= :ldb_porce_ugn ) AND  
							( "PREMIO_INCREM_COMI_JEFE"."TRAMO_FIN" > :ldb_porce_ugn ) AND
							( "PREMIO_INCREM_COMI_JEFE"."CANAL" = 'UG' )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ldb_premio) and ldb_premio>0 then
						ldb_premio						= ldb_premio
					else
						ldb_premio						= 0
					end if
				else
					ldb_premio							= 0
				end if
			end if
			dw_premio_jefe.setitem(ll_new,'cod_parque',al_cod_parque)
			dw_premio_jefe.setitem(ll_new,'uni_descripcion','TOTAL UGN')
			dw_premio_jefe.setitem(ll_new,'porce_ing_cierre',ldb_porce_ing)
			dw_premio_jefe.setitem(ll_new,'vtas_presupuesto',ll_vtas_presup_ugn)
			dw_premio_jefe.setitem(ll_new,'vtas_producc',ll_cta_vtas_ugn)
			dw_premio_jefe.setitem(ll_new,'porce_pago',ldb_porce_ugn)
			dw_premio_jefe.setitem(ll_new,'factor',0)
			dw_premio_jefe.setitem(ll_new,'total_comision',ll_total_comi_ugn)
			dw_premio_jefe.setitem(ll_new,'premio',ldb_premio)
			dw_premio_jefe.setitem(ll_new,'fecha_cierre',adt_fecha_cierre)
			dw_premio_jefe.setitem(ll_new,'fecha_comi',ldt_fec_comi)
			dw_premio_jefe.accepttext()
		end if
		ll_tot_reg											= dw_premio_jefe.rowcount()
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Presupuesto")
		end if
	else
		messagebox("Advertencia","Proceso Comisiones "+string(ldt_fec_comi,'dd/mm/yyyy')+"No Ha Sido Creado")
	end if
else
	messagebox("Advertencia","Proceso Comisiones "+string(ldt_fec_comi,'dd/mm/yyyy')+"No Ha Sido Creado")
end if
end subroutine

event open;long		ll_parque,ll_porce_ing_cierre
connect using Trans_1;
connect using Trans_2;
gf_centrar(w_premio_incremento_comi_jefe)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(datetime(date(string('01/01/2012'))))=0 then
	idw_detalle4.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gs_conexion	= "Parque El Prado" then
	ll_parque						= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque						= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_parque						= 801
end if
if gl_proceso=3 or gl_proceso=2 then
	cb_grabar.visible				= false
	cb_premio_pago.visible		= false
end if
dw_parque.dataobject				= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

dw_premio_jefe.dataobject		= 'dw_bono_jefe_presupuesto'
dw_premio_jefe.settransobject(sqlca)
dw_premio_jefe.Object.usuario.text = gs_user
end event

on w_premio_incremento_comi_jefe_bk.create
this.cb_respal=create cb_respal
this.dw_fecha_cierre=create dw_fecha_cierre
this.dw_parque=create dw_parque
this.cb_premio_pago=create cb_premio_pago
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.dw_premio_jefe=create dw_premio_jefe
this.Control[]={this.cb_respal,&
this.dw_fecha_cierre,&
this.dw_parque,&
this.cb_premio_pago,&
this.cb_grabar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.pb_aceptar,&
this.dw_premio_jefe}
end on

on w_premio_incremento_comi_jefe_bk.destroy
destroy(this.cb_respal)
destroy(this.dw_fecha_cierre)
destroy(this.dw_parque)
destroy(this.cb_premio_pago)
destroy(this.cb_grabar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.dw_premio_jefe)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_respal from commandbutton within w_premio_incremento_comi_jefe_bk
integer x = 3547
integer y = 668
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type dw_fecha_cierre from datawindow within w_premio_incremento_comi_jefe_bk
integer x = 923
integer y = 28
integer width = 841
integer height = 100
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type dw_parque from datawindow within w_premio_incremento_comi_jefe_bk
integer x = 32
integer y = 32
integer width = 901
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_premio_jefe.reset()
end event

type cb_premio_pago from commandbutton within w_premio_incremento_comi_jefe_bk
integer x = 1408
integer y = 1632
integer width = 475
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Premios"
end type

event clicked;string	ls_cod_jef,ls_string,ls_canal
long		ll_cod_parque
datetime	ldt_fecha_cierre
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
if dw_premio_jefe.rowcount() > 0 then
	ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	ll_cod_parque				= dw_parque.getitemnumber(1,'parque')
	ls_cod_jef					= dw_premio_jefe.getitemstring(il_row,'cod_jefe')
	ls_canal						= dw_premio_jefe.getitemstring(il_row,'canal')
	if not isnull(ldt_fecha_cierre) and not isnull(ll_cod_parque)  and ll_cod_parque>0 and not isnull(ls_cod_jef) and ls_cod_jef<>'' then
		ls_string				= string(ldt_fecha_cierre,'dd/mm/yyyy')+'~t'+ls_cod_jef+'~t'+string(ll_cod_parque)+'~t'+ls_canal
		if isvalid(w_premio_incremento_comi_detalle) then close(w_premio_incremento_comi_detalle)
		OpenWithParm (w_premio_incremento_comi_detalle,ls_string)
	end if
end if
	
end event

type cb_grabar from commandbutton within w_premio_incremento_comi_jefe_bk
integer x = 41
integer y = 1632
integer width = 274
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string	ls_cod_jef,ls_canal,ls_cod_cont,ls_serie,ls_haber,ls_moneda,ls_codigo_com,ls_estado,ls_cod_age_sup
long		ll_tot_reg,ll_cod_parque,ll_res,ll_indi,ll_rut,ll_monto_ing,ll_contr,ll_premio,ll_count,ll_mes,ll_monto_prem
datetime	ldt_fecha_cierre,ldt_fec_comi
double	ldb_factor,ldb_porc_ing,ldb_precio,ldb_valor_uf

SetPointer(HourGlass!)
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
dw_premio_jefe.accepttext()
ll_tot_reg 						= dw_premio_jefe.rowcount() 
ldt_fecha_cierre				= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato Para Grabar")
else
	ll_res						= MessageBox("Advertencia", '¿ Desea Actualizar en Tabla Res_comi ?', Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		for ll_indi=1 to ll_tot_reg
			ls_cod_jef			= dw_premio_jefe.getitemstring(ll_indi,'cod_jefe')
			ldb_factor			= dw_premio_jefe.getitemnumber(ll_indi,'factor')
			ls_canal				= dw_premio_jefe.getitemstring(ll_indi,'canal')
			ldt_fec_comi		= dw_premio_jefe.getitemdatetime(ll_indi,'fecha_comi')
			ll_mes				= month(date(ldt_fec_comi))
			ls_cod_cont			= '021'
			ll_monto_prem		= dw_premio_jefe.getitemnumber(ll_indi,'premio')
			SELECT	  COUNT("RES_COMI"."COD_AGE_SUP")
			INTO		  :ll_count
			FROM		  "RES_COMI","JEFE_VENTAS" 
			WHERE		( "RES_COMI"."COD_AGE_SUP" = "JEFE_VENTAS"."JEFE_VENTAS") AND
						( "JEFE_VENTAS"."COD_PARQUE" = :ll_cod_parque ) AND
						( "RES_COMI"."COD_AGE_SUP" = :ls_cod_jef ) AND
						( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
						( "RES_COMI"."FECHA" = :ldt_fecha_cierre )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_count) and ll_count>0 then
				else
					if (ls_canal='NI' or ls_canal= 'NF' or ls_canal='T') and ll_monto_prem>0 then
						if not isnull(ls_cod_jef) and ls_cod_jef<>'' and not isnull(ls_canal) and ls_canal<>'' and not isnull(ldt_fecha_cierre) then
							if ls_canal='NF' then
								DECLARE x1 CURSOR FOR  
								SELECT	"RES_COMI"."COD_AGE_SUP","RES_COMI"."RUT","RES_COMI"."MONT_AGE_SUP","RES_COMI"."CONTRATO","RES_COMI"."SERIE","RES_COMI"."PORC_ING_CAJA","PAGO_OFERTA"."PRECIO","RES_COMI"."VALOR_UF","RES_COMI"."HABER","PAGO_OFERTA"."MONEDA","RES_COMI"."CODIGO_COM","RES_COMI"."ESTADO_AGE_SUP"
								FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
								WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND  
											"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
											"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" AND  
											"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" AND  
											"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
											"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
											"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
											( "RES_COMI"."COD_CONTABLE" = '023' OR  "RES_COMI"."COD_CONTABLE" = '037' OR  "RES_COMI"."COD_CONTABLE" = '089' ) AND  
											"RES_COMI"."FECHA" = :ldt_fec_comi AND  
											"RES_COMI"."COD_AGE_SUP" = :ls_cod_jef AND
											"CADENA"."CODIGO" = 'O'
								USING		Trans_1;
							elseif ls_canal='NI' then
								DECLARE x2 CURSOR FOR  
								SELECT	"RES_COMI"."COD_AGE_SUP","RES_COMI"."RUT","RES_COMI"."MONT_AGE_SUP","RES_COMI"."CONTRATO","RES_COMI"."SERIE","RES_COMI"."PORC_ING_CAJA","PAGO_OFERTA"."PRECIO","RES_COMI"."VALOR_UF","RES_COMI"."HABER","PAGO_OFERTA"."MONEDA","RES_COMI"."CODIGO_COM","RES_COMI"."ESTADO_AGE_SUP"
								FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
								WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND  
											"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
											"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" AND  
											"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" AND  
											"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
											"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
											"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
											( "RES_COMI"."COD_CONTABLE" = '023' OR  "RES_COMI"."COD_CONTABLE" = '037' OR  "RES_COMI"."COD_CONTABLE" = '089' ) AND  
											"RES_COMI"."FECHA" = :ldt_fec_comi AND  
											"RES_COMI"."COD_AGE_SUP" = :ls_cod_jef AND 
											"CADENA"."CODIGO" = 'O' AND 
											"CADENA"."COD_PARQUE" = :ll_cod_parque
								USING		Trans_1;
							elseif ls_canal='T' then
								DECLARE x3 CURSOR FOR
								SELECT	"RES_COMI"."COD_AGE_SUP",
											"RES_COMI"."RUT",
											SUM(CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO"
														WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF" END), 
											"RES_COMI"."VALOR_UF",
											"RES_COMI"."HABER",
											"RES_COMI"."CODIGO_COM",
											"RES_COMI"."ESTADO_AGE_SUP"
								FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
								WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND  
											"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
											"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" AND  
											"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" AND  
											"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
											"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
											"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
											( "RES_COMI"."COD_CONTABLE" = '023' OR  "RES_COMI"."COD_CONTABLE" = '037' OR  "RES_COMI"."COD_CONTABLE" = '089' ) AND  
											"RES_COMI"."FECHA" = :ldt_fec_comi AND  
											"RES_COMI"."COD_AGE_SUP" = :ls_cod_jef  AND
											"CADENA"."CODIGO" = 'O'
								GROUP BY	"RES_COMI"."COD_AGE_SUP",
											"RES_COMI"."RUT",
											"RES_COMI"."VALOR_UF",
											"RES_COMI"."HABER",
											"RES_COMI"."CODIGO_COM",
											"RES_COMI"."ESTADO_AGE_SUP"
								USING		Trans_1;			
							end if
							if ls_canal='NF' then
								open x1;
							elseif ls_canal='NI' then
								open x2;
							elseif ls_canal='T' then
								open x3;
							end if
							if Trans_1.sqlcode=0 then
								DO WHILE Trans_1.sqlcode=0
																		
									if ls_canal='NF' then
										fetch x1 INTO	:ls_cod_age_sup,:ll_rut,:ll_monto_ing,:ll_contr,:ls_serie,:ldb_porc_ing,:ldb_precio,:ldb_valor_uf,:ls_haber,:ls_moneda, :ls_codigo_com,:ls_estado;
									elseif ls_canal='NI' then
										fetch x2 INTO	:ls_cod_age_sup,:ll_rut,:ll_monto_ing,:ll_contr,:ls_serie,:ldb_porc_ing,:ldb_precio,:ldb_valor_uf,:ls_haber,:ls_moneda, :ls_codigo_com,:ls_estado;
									elseif ls_canal='T' then
										fetch x3 INTO	:ls_cod_age_sup,:ll_rut,:ldb_precio,:ldb_valor_uf,:ls_haber,:ls_codigo_com,:ls_estado;
									end if
									if not isnull(ls_cod_age_sup) and ls_cod_age_sup<>'' then
										if ls_canal= 'T' then
											ll_premio					= dw_premio_jefe.getitemnumber(ll_indi,'premio')
											f_graba_res_comi(ls_cod_age_sup,ll_rut,0,ls_cod_cont,string(ll_mes),ldt_fecha_cierre,0,' ',0,0,ldb_precio,ll_premio,ldb_valor_uf,ls_haber,'',ls_codigo_com,ls_estado,'O',ll_cod_parque,0,0)
										elseif ls_canal= 'NF' or ls_canal= 'NI' then
											if ls_moneda = '1' then //peso
												ll_premio 			= round(round(ldb_precio * ldb_factor,0) / 100,0)
											elseif ls_moneda = '2' then //uf
												ll_premio			= round(round(round(ldb_precio * ldb_valor_uf,0) * ldb_factor,0) / 100,0)
											end if
											SELECT	  COUNT("RES_COMI"."COD_AGE_SUP")
											INTO		  :ll_count
											FROM		  "RES_COMI"  
											WHERE		( "RES_COMI"."COD_AGE_SUP" = :ls_cod_age_sup ) AND  
														( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
														( "RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND
														( "RES_COMI"."SERIE" = :ls_serie ) AND
														( "RES_COMI"."CONTRATO" = :ll_contr)
											USING		Trans_2;
											if Trans_2.sqlcode=0 then
												if isnull(ll_count) or ll_count=0 then
													f_graba_res_comi(ls_cod_age_sup,ll_rut,ll_monto_ing,ls_cod_cont,string(ll_mes),ldt_fecha_cierre,ll_contr,ls_serie,ldb_porc_ing,ldb_factor,ldb_precio,ll_premio,ldb_valor_uf,ls_haber,ls_moneda,ls_codigo_com,ls_estado,'O',ll_cod_parque,0,0)
												end if
											end if
										end if
									end if
									setnull(ls_cod_age_sup)
								LOOP
							end if
							if ls_canal='NF' then
								close x1;
							elseif ls_canal='NI'then
								close x2;
							elseif ls_canal='T'then
								close x3;	
							end if
							setnull(ls_cod_jef);setnull(ls_canal);setnull(ldt_fec_comi);setnull(ldb_factor)
						end if
					end if
				end if
			end if
		next
		messagebox('Grabar', 'Proceso de Grabación Exitoso')
	end if
end if
SetPointer(Arrow!)
end event

type cb_imprimir from commandbutton within w_premio_incremento_comi_jefe_bk
integer x = 2720
integer y = 1632
integer width = 274
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_premio_jefe.rowcount() >0 then 
	f_Print( dw_premio_jefe )
end if
end event

type cb_cerrar from commandbutton within w_premio_incremento_comi_jefe_bk
integer x = 2994
integer y = 1632
integer width = 274
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premio_incremento_comi_jefe)
end event

type pb_aceptar from picturebutton within w_premio_incremento_comi_jefe_bk
integer x = 1783
integer y = 16
integer width = 123
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1"
string picturename = "ok.bmp"
end type

event clicked;long		ll_cod_parque,ll_count,ll_tot_reg
datetime	ldt_fecha_cierre
dw_premio_jefe.reset()
SetPointer(HourGlass!)
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
ldt_fecha_cierre													= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_cod_parque														= dw_parque.getitemnumber(1,'parque')
if not isnull(ldt_fecha_cierre) and not isnull(ll_cod_parque) and ll_cod_parque>0 then
	SELECT	 COUNT("RES_COMI"."COD_AGE_SUP")
	INTO		 :ll_count
	FROM		 "RES_COMI"
	WHERE	( "RES_COMI"."COD_PARQUE" = :ll_cod_parque ) AND
				( "RES_COMI"."COD_CONTABLE" = '021' ) AND  
				( "RES_COMI"."FECHA" = :ldt_fecha_cierre )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ll_count) and ll_count>0 then
			cb_grabar.visible										= false
			if (gl_proceso=3 or gl_proceso=2) and (gs_depto='B' or gs_depto='R') then
				cb_premio_pago.visible							= false
				dw_premio_jefe.dataobject						= 'dw_bono_jefe_presupuesto_detalle'
				dw_premio_jefe.settransobject(sqlca)
				ll_tot_reg											= dw_premio_jefe.retrieve(ldt_fecha_cierre,gs_user,ll_cod_parque)
				dw_premio_jefe.object.usuario.text			= gs_user
				if ll_tot_reg=0 then
					messagebox("Advertencia","No Registra Datos")
				end if
			elseif gs_depto='X' and gl_proceso=3 then
				cb_premio_pago.visible							= false
				dw_premio_jefe.dataobject						= 'dw_bono_jefe_presupuesto_detalle_ug'
				dw_premio_jefe.settransobject(sqlca)
				ll_tot_reg											= dw_premio_jefe.retrieve(ldt_fecha_cierre,gs_user,ll_cod_parque)
				dw_premio_jefe.object.usuario.text			= gs_user	
				if ll_tot_reg=0 then
					messagebox("Advertencia","No Registra Datos")
				end if
			elseif (gs_depto='D' or gs_depto='I' and gl_proceso>=4 )then
				dw_premio_jefe.dataobject						= 'dw_bono_jefe_presupuesto'
				dw_premio_jefe.settransobject(sqlca)
				wf_lista_premiados(ldt_fecha_cierre,ll_cod_parque)
			end if
		else
			cb_grabar.visible										= true
			if (gs_depto='D' or gs_depto='I' and gl_proceso>=4 )then
				dw_premio_jefe.dataobject						= 'dw_bono_jefe_presupuesto'
				dw_premio_jefe.settransobject(sqlca)
				wf_lista_premiados(ldt_fecha_cierre,ll_cod_parque)
			else
				messagebox("Advertencia","No Registra Datos")
			end if
		end if
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_parque.setfocus()
		dw_parque.setcolumn('parque')
	end if
end if
SetPointer(Arrow!)
end event

type dw_premio_jefe from datawindow within w_premio_incremento_comi_jefe_bk
integer x = 41
integer y = 140
integer width = 3227
integer height = 1464
integer taborder = 40
string title = "none"
string dataobject = "dw_bono_jefe_presupuesto"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;string	ls_cod_jefe,ls_string
datetime	ldt_fecha_comi
double	ldb_factor

ldt_fecha_comi	= dw_premio_jefe.getitemdatetime(1,'fecha_comi')
ls_cod_jefe		= dw_premio_jefe.getitemstring(row,'cod_jefe')
ldb_factor		= dw_premio_jefe.getitemnumber(row,'factor')

if not isnull(ls_cod_jefe) and ls_cod_jefe <> '' and not isnull(ldt_fecha_comi) and string(ldt_fecha_comi,'dd/mm/yyyy')<>'00/00/0000' and string(ldt_fecha_comi,'dd/mm/yyyy')<>'01/01/1900' and this.dataobject = 'dw_bono_jefe_presupuesto' then
	ls_string		= string(string(ldt_fecha_comi,'dd/mm/yyyy'))+'~t'+ls_cod_jefe+'~t'+string(ldb_factor,'###,##0.00')
	OpenWithParm(w_premio_incremento_comi_detalle, ls_string)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

