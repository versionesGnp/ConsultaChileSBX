forward
global type w_comision_proceso from window
end type
type st_3 from statictext within w_comision_proceso
end type
type cb_6 from commandbutton within w_comision_proceso
end type
type cb_5 from commandbutton within w_comision_proceso
end type
type cb_3 from commandbutton within w_comision_proceso
end type
type cbx_modif_cierre from checkbox within w_comision_proceso
end type
type cb_1 from commandbutton within w_comision_proceso
end type
type cb_imprimir from commandbutton within w_comision_proceso
end type
type cb_comi_ugn from commandbutton within w_comision_proceso
end type
type cb_resumen_comi from commandbutton within w_comision_proceso
end type
type cb_limpiar from commandbutton within w_comision_proceso
end type
type dw_modif_datos from datawindow within w_comision_proceso
end type
type cb_graba_modif from commandbutton within w_comision_proceso
end type
type cbx_porc_ing from checkbox within w_comision_proceso
end type
type cbx_persist from checkbox within w_comision_proceso
end type
type cbx_comis from checkbox within w_comision_proceso
end type
type cbx_deveng from checkbox within w_comision_proceso
end type
type cbx_clasif from checkbox within w_comision_proceso
end type
type st_2 from statictext within w_comision_proceso
end type
type cb_detalle from commandbutton within w_comision_proceso
end type
type cb_modif_datos from commandbutton within w_comision_proceso
end type
type st_valor_uf from statictext within w_comision_proceso
end type
type st_1 from statictext within w_comision_proceso
end type
type cb_4 from commandbutton within w_comision_proceso
end type
type cb_crea_deveng_reprog from commandbutton within w_comision_proceso
end type
type cb_2 from commandbutton within w_comision_proceso
end type
type cb_asocia_rut from commandbutton within w_comision_proceso
end type
type cb_actualiz_036 from commandbutton within w_comision_proceso
end type
type cb_actualiz_037 from commandbutton within w_comision_proceso
end type
type cb_comi_036 from commandbutton within w_comision_proceso
end type
type cb_comi_037 from commandbutton within w_comision_proceso
end type
type cb_actualiz_089 from commandbutton within w_comision_proceso
end type
type cb_pagos from commandbutton within w_comision_proceso
end type
type cb_actualiz_090 from commandbutton within w_comision_proceso
end type
type cb_grabar from commandbutton within w_comision_proceso
end type
type cb_exportar from commandbutton within w_comision_proceso
end type
type cb_premio_090 from commandbutton within w_comision_proceso
end type
type cb_filtrar from commandbutton within w_comision_proceso
end type
type cb_ordenar from commandbutton within w_comision_proceso
end type
type cb_cta_cte from commandbutton within w_comision_proceso
end type
type cb_comi_089 from commandbutton within w_comision_proceso
end type
type dw_proceso from datawindow within w_comision_proceso
end type
type cb_crea_deveng from commandbutton within w_comision_proceso
end type
type st_cuenta from statictext within w_comision_proceso
end type
type hpb_1 from hprogressbar within w_comision_proceso
end type
type st_porc from statictext within w_comision_proceso
end type
type st_hasta from statictext within w_comision_proceso
end type
type em_termino from editmask within w_comision_proceso
end type
type p_termino from picture within w_comision_proceso
end type
type cb_cerrar from commandbutton within w_comision_proceso
end type
type gb_periodo from groupbox within w_comision_proceso
end type
type gb_6 from groupbox within w_comision_proceso
end type
type gb_2 from groupbox within w_comision_proceso
end type
type gb_5 from groupbox within w_comision_proceso
end type
type gb_1 from groupbox within w_comision_proceso
end type
type st_fondo from statictext within w_comision_proceso
end type
type st_det_proceso from statictext within w_comision_proceso
end type
end forward

global type w_comision_proceso from window
integer width = 4059
integer height = 1532
boolean titlebar = true
string title = "Proceso Calculo Comisión ~"Area Ventas~""
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
event ue_calcular ( )
st_3 st_3
cb_6 cb_6
cb_5 cb_5
cb_3 cb_3
cbx_modif_cierre cbx_modif_cierre
cb_1 cb_1
cb_imprimir cb_imprimir
cb_comi_ugn cb_comi_ugn
cb_resumen_comi cb_resumen_comi
cb_limpiar cb_limpiar
dw_modif_datos dw_modif_datos
cb_graba_modif cb_graba_modif
cbx_porc_ing cbx_porc_ing
cbx_persist cbx_persist
cbx_comis cbx_comis
cbx_deveng cbx_deveng
cbx_clasif cbx_clasif
st_2 st_2
cb_detalle cb_detalle
cb_modif_datos cb_modif_datos
st_valor_uf st_valor_uf
st_1 st_1
cb_4 cb_4
cb_crea_deveng_reprog cb_crea_deveng_reprog
cb_2 cb_2
cb_asocia_rut cb_asocia_rut
cb_actualiz_036 cb_actualiz_036
cb_actualiz_037 cb_actualiz_037
cb_comi_036 cb_comi_036
cb_comi_037 cb_comi_037
cb_actualiz_089 cb_actualiz_089
cb_pagos cb_pagos
cb_actualiz_090 cb_actualiz_090
cb_grabar cb_grabar
cb_exportar cb_exportar
cb_premio_090 cb_premio_090
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cta_cte cb_cta_cte
cb_comi_089 cb_comi_089
dw_proceso dw_proceso
cb_crea_deveng cb_crea_deveng
st_cuenta st_cuenta
hpb_1 hpb_1
st_porc st_porc
st_hasta st_hasta
em_termino em_termino
p_termino p_termino
cb_cerrar cb_cerrar
gb_periodo gb_periodo
gb_6 gb_6
gb_2 gb_2
gb_5 gb_5
gb_1 gb_1
st_fondo st_fondo
st_det_proceso st_det_proceso
end type
global w_comision_proceso w_comision_proceso

type variables
string		is_grabar,is_mes,is_estado,is_opcion='V',is_clas_act,is_base,is_serie,is_tipo='P'
string		is_graba_clas='N',is_graba_ingr='N',is_graba_deveng='N',is_graba_comi='N',is_graba_persist='N',is_graba_cierre='N'
Long		il_mes,il_ano,il_row,il_tot_reg,il_indi
double	idb_numero,idb_porcentaje=6.9,idb_porce_age=9.9,idb_porce_ing
datetime	idt_cierre_vta
end variables

forward prototypes
public function double wf_tot_pag_comi (string as_base, string as_serie, long al_numero, datetime adt_fecha)
public function double wf_porce_comi (string as_origen, long al_tipo, string as_cargo, string as_regist, long al_age)
public function long wf_cta_pag_s (string as_base, string as_serie, long al_numero, datetime adt_fecha)
public function double wf_total_pie (string as_base, string as_serie, long al_numero, datetime adt_fecha)
public function long wf_valida_comi (string as_serie, long al_numero, string as_mes, string as_codigo, string as_cod_cont)
public function string wf_mes_pagado (string as_serie, long al_numero, string as_codigo, string as_cargo, string as_cod_cont)
public function double wf_porce_pago (string as_tipo_dev, string as_mes, string as_clasif, double adb_prem_02, double adb_prem_04, double adb_prem_06, double adb_prem_07, long al_ctas_pag)
public function string wf_tipo_dev (string as_cargo, double adb_porc_pie, double adb_tot_pie, double adb_porc_cta)
public function integer wf_funcion_mora (datetime primer, integer pag, integer cuotas, datetime fecha)
public function string wf_estado_contrato (string as_base, string as_serie, long al_numero)
public subroutine wf_actualiz_fact_oferta (string as_base, string as_serie, long al_numero, string as_cargo, string as_estado, double adb_porce_comi, datetime adt_fec_factura)
public subroutine wf_actualiz_est_comi (string as_cargo, string as_serie, long al_numero, string as_est_comi, string as_est_persist, string as_tipo_pago, string as_base)
public subroutine wf_actualiz_porc_oferta_v (string as_serie, long al_numero, double adb_porc_comi, string as_cargo, string as_base)
public function double wf_porc_comi_pagado (string as_tipo_dev, string as_serie, long al_numero, string as_codigo, string as_base)
public subroutine wf_valida_fec_proceso ()
public subroutine wf_itemchanged (string as_columna)
end prototypes

event ue_calcular();wf_valida_fec_proceso()
end event

public function double wf_tot_pag_comi (string as_base, string as_serie, long al_numero, datetime adt_fecha);double	ldb_tot_pag

//wf_tot_pag_comi(as_base,as_serie,al_numero,adt_fecha)
SELECT	sum("INGRESO"."MONTO")  
INTO 		:ldb_tot_pag 
FROM		"INGRESO"  
WHERE	( "INGRESO"."BASE" = :as_base ) AND  
			( "INGRESO"."SERIE" = :as_serie ) AND  
			( "INGRESO"."CONTRATO" = :al_numero ) AND  
			( "INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E' OR "INGRESO"."TIPO_MOV" = 'K'  OR "INGRESO"."TIPO_MOV" = 'Q') AND
			( "INGRESO"."FECHA_PAGO" <= :adt_fecha ) 
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_tot_pag) and ldb_tot_pag>0 then
		ldb_tot_pag						= ldb_tot_pag
	else
		ldb_tot_pag						= 0
	end if
else
	ldb_tot_pag							= 0
end if
if isnull(ldb_tot_pag) or ldb_tot_pag=0 then ldb_tot_pag = 0
Return ldb_tot_pag
end function

public function double wf_porce_comi (string as_origen, long al_tipo, string as_cargo, string as_regist, long al_age);double	ldb_porce_comi

//wf_porce_comi(as_origen,al_tipo,as_cargo,as_regist,al_age)
if as_cargo='A' then
	if as_regist='O' then
		if al_age=1 then
			SELECT	"PORCE_AGE_1"
			INTO		:ldb_porce_comi
			FROM		"COMISION_COMPARTIDA_PORCE"  
			WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
						( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
			USING	sqlca;
		end if
	elseif as_regist='N' then
		if al_age=2 then
			SELECT	"PORCE_AGE_2"
			INTO		:ldb_porce_comi
			FROM		"COMISION_COMPARTIDA_PORCE"  
			WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
						( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
			USING	sqlca;
		elseif al_age=3 then
			SELECT	"PORCE_AGE_3"
			INTO		:ldb_porce_comi
			FROM		"COMISION_COMPARTIDA_PORCE"  
			WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
						( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
			USING	sqlca;
		end if
	end if
elseif as_cargo='S' then
	if as_regist='O' then
		SELECT	"PORCE_SUP_1"
		INTO		:ldb_porce_comi
		FROM		"COMISION_COMPARTIDA_PORCE"  
		WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
					( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
		USING	sqlca;
	elseif as_regist='N' then
		SELECT	"PORCE_SUP_2"
		INTO		:ldb_porce_comi
		FROM		"COMISION_COMPARTIDA_PORCE"  
		WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
					( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
		USING	sqlca;
	end if
elseif as_cargo='J' then
	if as_regist='O' then
		SELECT	"PORCE_JEFE_1"
		INTO		:ldb_porce_comi
		FROM		"COMISION_COMPARTIDA_PORCE"  
		WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
					( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
		USING	sqlca;
	elseif as_regist='N' then
		SELECT	"PORCE_JEFE_2"
		INTO		:ldb_porce_comi
		FROM		"COMISION_COMPARTIDA_PORCE"  
		WHERE 	( "COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :as_origen ) AND  
					( "COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :al_tipo )
		USING	sqlca;
	end if
end if
if isnull(ldb_porce_comi) or ldb_porce_comi=0 then ldb_porce_comi = 0
Return ldb_porce_comi
end function

public function long wf_cta_pag_s (string as_base, string as_serie, long al_numero, datetime adt_fecha);long	ll_cta_pag_s

//wf_cta_pag_s(as_base,as_serie,al_numero,adt_fecha)
SELECT	sum("INGRESO"."CUOTAS_PAG")
INTO 		:ll_cta_pag_s
FROM		"INGRESO"  
WHERE	( "INGRESO"."BASE" = :as_base ) AND  
			( "INGRESO"."SERIE" = :as_serie ) AND  
			( "INGRESO"."CONTRATO" = :al_numero ) AND  
			( "INGRESO"."TIPO_MOV" = 'E' ) AND
			( "INGRESO"."FECHA_PAGO" <= :adt_fecha ) 
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_cta_pag_s) and ll_cta_pag_s>0 then
		ll_cta_pag_s					= ll_cta_pag_s
	else
		ll_cta_pag_s					= 0
	end if
else
	ll_cta_pag_s						= 0
end if
if isnull(ll_cta_pag_s) or ll_cta_pag_s=0 then ll_cta_pag_s = 0
Return ll_cta_pag_s
end function

public function double wf_total_pie (string as_base, string as_serie, long al_numero, datetime adt_fecha);double	ldb_tot_pie

//wf_total_pie(as_base,as_serie,al_numero,adt_fecha)
if as_serie='R' then
	SELECT	sum("INGRESO"."MONTO")  
	INTO 		:ldb_tot_pie 
	FROM		"INGRESO"  
	WHERE	( "INGRESO"."BASE" = :as_base ) AND  
				( "INGRESO"."SERIE" = :as_serie ) AND  
				( "INGRESO"."CONTRATO" = :al_numero ) AND  
				( "INGRESO"."TIPO_MOV" = 'A' or "INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'Q' or "INGRESO"."TIPO_MOV" = 'K' ) AND
				( "INGRESO"."FECHA_PAGO" <= :adt_fecha ) 
	USING	sqlca;
else
	SELECT	sum("INGRESO"."MONTO")  
	INTO 		:ldb_tot_pie 
	FROM		"INGRESO"  
	WHERE	( "INGRESO"."BASE" = :as_base ) AND  
				( "INGRESO"."SERIE" = :as_serie ) AND  
				( "INGRESO"."CONTRATO" = :al_numero ) AND  
				( "INGRESO"."TIPO_MOV" = 'A' or "INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'K') AND
				( "INGRESO"."FECHA_PAGO" <= :adt_fecha ) 
	USING	sqlca;
end if
if sqlca.sqlcode=0 then
	if not isnull(ldb_tot_pie) and ldb_tot_pie>0 then
		ldb_tot_pie						= ldb_tot_pie
	else
		ldb_tot_pie						= 0
	end if
else
	ldb_tot_pie							= 0
end if
if isnull(ldb_tot_pie) or ldb_tot_pie=0 then ldb_tot_pie = 0
Return ldb_tot_pie
end function

public function long wf_valida_comi (string as_serie, long al_numero, string as_mes, string as_codigo, string as_cod_cont);long	ll_cta

//wf_valida_comi(as_serie,al_numero,as_mes,as_codigo,as_cod_cont)
SELECT	count("RES_COMI"."MES")
INTO 		:ll_cta
FROM		"RES_COMI"
WHERE 	"RES_COMI"."SERIE" = :as_serie AND  
			"RES_COMI"."CONTRATO" = :al_numero AND  
			"RES_COMI"."MES" = :as_mes AND  
			"RES_COMI"."COD_AGE_SUP" = :as_codigo AND  
			"RES_COMI"."COD_CONTABLE" = :as_cod_cont
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_cta) and ll_cta>0 then
		ll_cta							= ll_cta
	else
		ll_cta							= 0
	end if
else
	ll_cta								= 0
end if
if isnull(ll_cta) or ll_cta=0 then ll_cta = 0
Return ll_cta	
end function

public function string wf_mes_pagado (string as_serie, long al_numero, string as_codigo, string as_cargo, string as_cod_cont);string	ls_mes

//wf_mes_pagado(as_serie,al_numero,as_codigo,as_cargo,as_cod_cont)
if as_cargo='A' then
	SELECT	max("RES_COMI"."MES")
	INTO 		:ls_mes
	FROM		"RES_COMI","AGENTES"  
	WHERE 	"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and  
				"RES_COMI"."SERIE" = :as_serie AND  
				"RES_COMI"."CONTRATO" = :al_numero AND  
				"RES_COMI"."COD_AGE_SUP" = :as_codigo AND  
				"AGENTES"."CARGO" = :as_cargo AND  
				"RES_COMI"."COD_CONTABLE" = :as_cod_cont
	USING	sqlca;
elseif as_cargo='S' then
	SELECT	max("RES_COMI"."MES")
	INTO 		:ls_mes
	FROM		"RES_COMI","SUPERVISOR"  
	WHERE 	"RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" and  
				"RES_COMI"."SERIE" = :as_serie AND  
				"RES_COMI"."CONTRATO" = :al_numero AND  
				"RES_COMI"."COD_AGE_SUP" = :as_codigo AND  
				"SUPERVISOR"."CARGO" = :as_cargo AND  
				"RES_COMI"."COD_CONTABLE" = :as_cod_cont
	USING	sqlca;
elseif as_cargo='J' then
	SELECT	max("RES_COMI"."MES")
	INTO 		:ls_mes
	FROM		"RES_COMI","JEFE_VENTAS"  
	WHERE 	"RES_COMI"."COD_AGE_SUP" = "JEFE_VENTAS"."JEFE_VENTAS" and  
				"RES_COMI"."SERIE" = :as_serie AND  
				"RES_COMI"."CONTRATO" = :al_numero AND  
				"RES_COMI"."COD_AGE_SUP" = :as_codigo AND  
				"JEFE_VENTAS"."CARGO" = :as_cargo AND  
				"RES_COMI"."COD_CONTABLE" = :as_cod_cont
	USING	sqlca;	
end if
if isnull(ls_mes) or ls_mes='' then ls_mes = '0'
Return ls_mes
end function

public function double wf_porce_pago (string as_tipo_dev, string as_mes, string as_clasif, double adb_prem_02, double adb_prem_04, double adb_prem_06, double adb_prem_07, long al_ctas_pag);double	ldb_porce

//wf_porce_pago(as_tipo_dev,as_mes,as_clasif,adb_prem_02,adb_prem_04,adb_prem_06,adb_prem_07,al_ctas_pag)
is_mes											= '0'	
is_estado										= 'N'
//ldb_porc_prem									= 0
if as_tipo_dev='S' then
	if as_mes='0' then
		if as_clasif='A' then
			ldb_porce							= adb_prem_02
			is_mes								= '2'
		elseif as_clasif='B' then
			ldb_porce							= adb_prem_02 + adb_prem_04 + adb_prem_06
			is_mes								= '6'
		elseif as_clasif='C' then
			ldb_porce							= adb_prem_02 + adb_prem_04 + adb_prem_06 + adb_prem_07
			is_mes								= '7'
		end if
	elseif as_mes='2' then	
		if as_clasif='B' then
			ldb_porce							= adb_prem_04 + adb_prem_06
			is_mes								= '6'
		elseif as_clasif='C' then
			ldb_porce							= adb_prem_04 + adb_prem_06 + adb_prem_07
			is_mes								= '7'
		end if
	elseif as_mes='4' then	
		if as_clasif='B' then
			ldb_porce							= adb_prem_06
			is_mes								= '6'
		elseif as_clasif='C' then
			ldb_porce							= adb_prem_06 + adb_prem_07
			is_mes								= '7'
		end if
	elseif as_mes='6' then	
		if as_clasif='C' then
			ldb_porce							= adb_prem_07
			is_mes								= '7'
		end if
	end if
	is_estado									= 'P'
else
	if al_ctas_pag>=2 then
		if as_mes='0' then
			if al_ctas_pag>=2 and al_ctas_pag<=3 then
				ldb_porce						= adb_prem_02
				is_mes							= '2'
				if as_clasif='A' then
					is_estado					= 'P'
				elseif as_clasif='B' or as_clasif='C' then
					is_estado					= 'S'
				end if
			elseif al_ctas_pag>=4 and al_ctas_pag<=5 then
				ldb_porce						= adb_prem_02 + adb_prem_04
				is_mes							= '4'
				if as_clasif='A' then
					is_estado					= 'P'
				elseif as_clasif='B' or as_clasif='C' then
					is_estado					= 'S'
				end if
			elseif al_ctas_pag=6 then
				ldb_porce						= adb_prem_02 + adb_prem_04 + adb_prem_06
				is_mes							= '6'
				if as_clasif='A' or as_clasif='B' then
					is_estado					= 'P'
				elseif as_clasif='C' then
					is_estado					= 'S'
				end if
			elseif al_ctas_pag=7 then
				ldb_porce						= adb_prem_02 + adb_prem_04 + adb_prem_06 + adb_prem_07	
				is_mes							= '7'
				is_estado						= 'P'
			end if
		elseif as_mes='2' then
			if al_ctas_pag>=4 and al_ctas_pag<=5 then
				ldb_porce						= adb_prem_04
				is_mes							= '4'
				if as_clasif='A' then
					is_estado					= 'P'
				elseif as_clasif='B' or as_clasif='C' then
					is_estado					= 'S'
				end if
			elseif al_ctas_pag=6 then
				ldb_porce						= adb_prem_04	 + adb_prem_06
				is_mes							= '6'
				if as_clasif='A' or as_clasif='B' then
					is_estado					= 'P'
				elseif as_clasif='C' then
					is_estado					= 'S'
				end if
			elseif al_ctas_pag=7 then
				ldb_porce						= adb_prem_04 + adb_prem_06 + adb_prem_07
				is_mes							= '7'
				is_estado						= 'P'
			end if
		elseif as_mes='4' then
			if al_ctas_pag=6 then
				ldb_porce						= adb_prem_06
				is_mes							= '6'
				if as_clasif='A' or as_clasif='B' then
					is_estado					= 'P'
				elseif as_clasif='C' then
					is_estado					= 'S'
				end if
			elseif al_ctas_pag=7 then
				ldb_porce						= adb_prem_06 + adb_prem_07
				is_mes							= '7'
				is_estado						= 'P'
			end if
		elseif as_mes='6' then
			if al_ctas_pag>=7 then
				ldb_porce						= adb_prem_07
				is_mes							= '7'
				is_estado						= 'P'
			end if
		else
			ldb_porce							= 0
			is_mes								= ''
		end if
	end if
end if
if isnull(ldb_porce) or ldb_porce=0 then ldb_porce = 0
Return ldb_porce
end function

public function string wf_tipo_dev (string as_cargo, double adb_porc_pie, double adb_tot_pie, double adb_porc_cta);string		ls_tipo_dev

//wf_tipo_dev(as_cargo,adb_porc_pie,adb_tot_pie,adb_porc_cta)
if as_cargo='A' then
	if adb_porc_pie>=idb_porce_age  or (adb_tot_pie=0 and adb_porc_cta>=idb_porce_age) then
		ls_tipo_dev				= 'S'
	else
		ls_tipo_dev				= 'N'
	end if
else
	if adb_porc_pie>=idb_porcentaje  or (adb_tot_pie=0 and adb_porc_cta>=idb_porcentaje) then
		ls_tipo_dev				= 'S'
	else
		ls_tipo_dev				= 'N'
	end if
end if
if isnull(ls_tipo_dev) or ls_tipo_dev='' then ls_tipo_dev = 'N'
Return ls_tipo_dev

//idb_porcentaje=6.98,idb_porce_age=9.98

end function

public function integer wf_funcion_mora (datetime primer, integer pag, integer cuotas, datetime fecha);double vmes,vano,vcuo_venc,vmora, ll_valor
vano=year(date(fecha))-year(DATE(primer))
vano=vano*12	 
vmes=month(date(fecha))-month(DATE(primer))
vcuo_venc= vano+vmes
if (day(date(fecha))> day(DATE(Primer))) then
	vcuo_venc=vcuo_venc+1
end if
if vcuo_venc <0 then
	vcuo_venc=0
end if
if vcuo_venc> cuotas then
	vcuo_venc=cuotas
end if
vmora=  vcuo_venc - pag

IF vmora <= 0 then 
	vmora=0
end if

return(vmora)
end function

public function string wf_estado_contrato (string as_base, string as_serie, long al_numero);string ls_estado

SELECT	"CADENA"."ESTADO" 
INTO		:ls_estado 
FROM  	"CADENA" 
WHERE 	( "CADENA"."CODIGO" = :as_base ) AND 
      		( "CADENA"."SERIE" = :as_serie ) AND 
			( "CADENA"."NUMERO" = :al_numero ) ;
return ls_estado
end function

public subroutine wf_actualiz_fact_oferta (string as_base, string as_serie, long al_numero, string as_cargo, string as_estado, double adb_porce_comi, datetime adt_fec_factura);//wf_actualiz_fact_oferta(as_base,as_serie,al_numero,as_cargo,as_estado,adb_porce_comi,adt_fec_factura)

if as_cargo='A' then
	UPDATE	"FACTURA_OFERTA"  
	SET		"ESTADO_AGE" = :as_estado,   
				"PORCE_VENTA" = :adb_porce_comi
	WHERE	"FACTURA_OFERTA"."BASE" = :as_base AND  
				"FACTURA_OFERTA"."SERIE" = :as_serie AND  
				"FACTURA_OFERTA"."NUMERO" = :al_numero AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fec_factura AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S')
	USING	sqlca;
elseif as_cargo='S' then
	UPDATE	"FACTURA_OFERTA"  
	SET 		"ESTADO_SUP" = :as_estado,   
				"PORCE_SUP" = :adb_porce_comi   
	WHERE	"FACTURA_OFERTA"."BASE" = :as_base AND  
				"FACTURA_OFERTA"."SERIE" = :as_serie AND  
				"FACTURA_OFERTA"."NUMERO" = :al_numero AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fec_factura AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S')
	USING	sqlca;
elseif as_cargo='J' then
	UPDATE	"FACTURA_OFERTA"  
	SET		"ESTADO_JEFE" = :as_estado,   
				"PORCE_JEF" = :adb_porce_comi  
	WHERE	"FACTURA_OFERTA"."BASE" = :as_base AND  
				"FACTURA_OFERTA"."SERIE" = :as_serie AND  
				"FACTURA_OFERTA"."NUMERO" = :al_numero AND
				"FACTURA_OFERTA"."FECHA_CIERRE" = :adt_fec_factura AND
				("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S')
	USING	sqlca;
end if
if sqlca.sqlcode = 0 then
	commit using sqlca;
else
	rollback using sqlca;
end if
end subroutine

public subroutine wf_actualiz_est_comi (string as_cargo, string as_serie, long al_numero, string as_est_comi, string as_est_persist, string as_tipo_pago, string as_base);//wf_actualiz_est_comi(as_cargo,as_serie,al_numero,as_est_comi,as_est_persist,as_tipo_pago,as_base)

if as_base='O' then
	if as_tipo_pago='C' then
		if as_cargo='A' then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_COMI" = :as_est_comi
			WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :al_numero )
			USING	sqlca;
		elseif as_cargo='S' then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_COMI_SUP" = :as_est_comi
			WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :al_numero )
			USING	sqlca;
		elseif as_cargo='J' then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_COMI_JV" = :as_est_comi
			WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :al_numero )
			USING	sqlca;	
		end if
	elseif as_tipo_pago='P' then
		if as_cargo='A' then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_PERSIST_AGE" = :as_est_persist
			WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :al_numero )
			USING	sqlca;
		elseif as_cargo='S' then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_PERSIST_SUP" = :as_est_persist
			WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :al_numero )
			USING	sqlca;
		elseif as_cargo='J' then
			UPDATE	"OFERTA_V"  
			SET		"ESTADO_PERSIST_JEF" = :as_est_persist
			WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
						( "OFERTA_V"."NRO_OFERTA" = :al_numero )
			USING	sqlca;	
		end if
	end if
elseif as_base='A' then
	if as_tipo_pago='C' then
		if as_cargo='A' then
			UPDATE	"ANEXO_AUMENTO"  
			SET		"ESTADO_COMI" = :as_est_comi
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
			USING	sqlca;
		elseif as_cargo='S' then
			UPDATE	"ANEXO_AUMENTO"  
			SET		"ESTADO_COMI_SUP" = :as_est_comi
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
			USING	sqlca;
		elseif as_cargo='J' then
			UPDATE	"ANEXO_AUMENTO"  
			SET		"ESTADO_COMI_JV" = :as_est_comi
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
			USING	sqlca;	
		end if
	elseif as_tipo_pago='P' then
		if as_cargo='A' then
			UPDATE	"ANEXO_AUMENTO"  
			SET		"ESTADO_PERSIST_AGE" = :as_est_persist
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
			USING	sqlca;
		elseif as_cargo='S' then
			UPDATE	"ANEXO_AUMENTO"  
			SET		"ESTADO_PERSIST_SUP" = :as_est_persist
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
			USING	sqlca;
		elseif as_cargo='J' then
			UPDATE	"ANEXO_AUMENTO"  
			SET		"ESTADO_PERSIST_JEF" = :as_est_persist
			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
			USING	sqlca;	
		end if
	end if

elseif as_base='L' then
	if as_tipo_pago='C' then
		if as_cargo='A' then
			UPDATE	"ANEXO_LIBERADOR"  
			SET		"ESTADO_COMI" = :as_est_comi
			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
			USING	sqlca;
		elseif as_cargo='S' then
			UPDATE	"ANEXO_LIBERADOR"  
			SET		"ESTADO_COMI_SUP" = :as_est_comi
			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
			USING	sqlca;
		elseif as_cargo='J' then
			UPDATE	"ANEXO_LIBERADOR"  
			SET		"ESTADO_COMI_JV" = :as_est_comi
			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
			USING	sqlca;	
		end if
	elseif as_tipo_pago='P' then
		if as_cargo='A' then
			UPDATE	"ANEXO_LIBERADOR"  
			SET		"ESTADO_PERSIST_AGE" = :as_est_persist
			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
			USING	sqlca;
		elseif as_cargo='S' then
			UPDATE	"ANEXO_LIBERADOR"  
			SET		"ESTADO_PERSIST_SUP" = :as_est_persist
			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
			USING	sqlca;
		elseif as_cargo='J' then
			UPDATE	"ANEXO_LIBERADOR"  
			SET		"ESTADO_PERSIST_JEF" = :as_est_persist
			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
			USING	sqlca;	
		end if
	end if	
end if
if sqlca.sqlcode = 0 then
	commit using sqlca;
else
	rollback using sqlca;
end if	
end subroutine

public subroutine wf_actualiz_porc_oferta_v (string as_serie, long al_numero, double adb_porc_comi, string as_cargo, string as_base);//wf_actualiz_porc_oferta_v(as_serie,al_numero,adb_porc_comi,as_cargo,as_base)
if as_base='O' then
	if as_cargo='A' then
		UPDATE	"OFERTA_V"  
		SET		"PORCE_VENTA" = :adb_porc_comi
		WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :al_numero )
		USING	sqlca;
	elseif as_cargo='S' then
		UPDATE	"OFERTA_V"  
		SET		"PORCE_SUP" = :adb_porc_comi
		WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :al_numero )
		USING	sqlca;
	elseif as_cargo='J' then
		UPDATE	"OFERTA_V"  
		SET		"PORCE_JEFE" = :adb_porc_comi
		WHERE	( "OFERTA_V"."SERIE" = :as_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :al_numero )
		USING	sqlca;	
	end if
elseif as_base='A' then
	if as_cargo='A' then
		UPDATE	"ANEXO_AUMENTO"  
		SET		"PORCE_AGE" = :adb_porc_comi
		WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
					( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
		USING	sqlca;
	elseif as_cargo='S' then
		UPDATE	"ANEXO_AUMENTO"  
		SET		"PORCE_SUP" = :adb_porc_comi
		WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
					( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
		USING	sqlca;
	elseif as_cargo='J' then
		UPDATE	"ANEXO_AUMENTO"  
		SET		"PORCE_JEFE" = :adb_porc_comi
		WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :as_serie ) AND  
					( "ANEXO_AUMENTO"."NRO_AUMENTO" = :al_numero )
		USING	sqlca;	
	end if
elseif as_base='L' then
	if as_cargo='A' then
		UPDATE	"ANEXO_LIBERADOR"  
		SET		"PORCE_AGE" = :adb_porc_comi
		WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
					( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
		USING	sqlca;
	elseif as_cargo='S' then
		UPDATE	"ANEXO_LIBERADOR"  
		SET		"PORCE_SUP" = :adb_porc_comi
		WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
					( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
		USING	sqlca;
	elseif as_cargo='J' then
		UPDATE	"ANEXO_LIBERADOR"  
		SET		"PORCE_JEFE" = :adb_porc_comi
		WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :as_serie ) AND  
					( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :al_numero )
		USING	sqlca;	
	end if	
end if
if sqlca.sqlcode = 0 then
	commit using sqlca;
else
	rollback using sqlca;
end if
end subroutine

public function double wf_porc_comi_pagado (string as_tipo_dev, string as_serie, long al_numero, string as_codigo, string as_base);double	ldb_porce	
//wf_porc_comi_pagado(as_tipo_dev,as_serie,al_numero,as_codigo,as_base)

if as_base='O' then
	if as_tipo_dev='AA' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '037' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;
	elseif as_tipo_dev='AN' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '089' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='SA' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '023' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='SN' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '089' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='JA' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '023' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='JN' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '089' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	end if
elseif as_base='A' then
	if as_tipo_dev='AA' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = '037' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;
	elseif as_tipo_dev='AN' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = '089' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='SA' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = '023' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='SN' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = '089' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='JA' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = '023' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	elseif as_tipo_dev='JN' then
		SELECT	sum("RES_COMI"."PORC_VENTA")
		INTO		:ldb_porce
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"RES_COMI"."SERIE" = "CADENA"."SERIE" and  
					"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = '089' AND 
					"RES_COMI"."COD_AGE_SUP" = :as_codigo and  
					"RES_COMI"."SERIE" = :as_serie and  
					"RES_COMI"."CONTRATO" = :al_numero
		USING	sqlca;	
	end if
end if
if isnull(ldb_porce) or ldb_porce=0 then ldb_porce=0
return ldb_porce
	
end function

public subroutine wf_valida_fec_proceso ();long		ll_mes,ll_ano,ll_cta
datetime	ldt_fec_proc,ldt_fecha_ini,ldt_prueba
double	ldb_valor_uf

//wf_valida_fec_proceso()

//gdt_fec_sistema							=  datetime(date(string('01/07/2014')),time('00:00:00')) 
//ldt_prueba									= gdt_fec_sistema

ldt_fec_proc									= datetime(date(string('17/'+ string(month(date(gdt_fec_sistema)),'00')+ '/' +string(year(date(gdt_fec_sistema)),'0000'))),time('00:00:00')) 
if gdt_fec_sistema<ldt_fec_proc then
	messagebox("Advertencia","Fecha de Proceso Cálculo de Comisiones No Puede Ser Menor al "+string(ldt_fec_proc,'dd/mm/yyyy'))
	SELECT	MAX("RES_COMI"."FECHA") 
	INTO		:ldt_fecha_ini  
	FROM 	"RES_COMI"  
	WHERE	(	"RES_COMI"."COD_CONTABLE" = '022' OR "RES_COMI"."COD_CONTABLE" = '023' OR "RES_COMI"."COD_CONTABLE" = '036' OR "RES_COMI"."COD_CONTABLE" = '037' OR "RES_COMI"."COD_CONTABLE" = '089') 
	USING	sqlca;
	ldt_fec_proc								= ldt_fecha_ini
else
	SELECT	MAX("RES_COMI"."FECHA") 
	INTO		:ldt_fecha_ini  
	FROM 	"RES_COMI"  
	WHERE	(	"RES_COMI"."COD_CONTABLE" = '022' OR "RES_COMI"."COD_CONTABLE" = '023' OR "RES_COMI"."COD_CONTABLE" = '036' OR "RES_COMI"."COD_CONTABLE" = '037' OR "RES_COMI"."COD_CONTABLE" = '089') 
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(ldt_fecha_ini) then
			ll_mes							= month(date(ldt_fecha_ini))
			ll_ano								= year(date(ldt_fecha_ini))
			if ll_mes = 12 then
				ll_mes			 			= ll_mes - 11
				ll_ano				 			= ll_ano + 1
			else
				ll_mes			 			= ll_mes + 1
				ll_ano				 			= ll_ano
			end if
			ldt_fec_proc						= datetime(date( string('15/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
			SELECT count("FECHA_UF")  
			INTO 		:ll_cta  
			FROM		"TAB_UF"  
			WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_proc
			USING	Trans_1;
			if Trans_1.sqlcode=0 then
				if isnull(ll_cta) then ll_cta=0
				if ll_cta>0 then
					ldt_fec_proc				= ldt_fec_proc
				else
					ldt_fec_proc				= ldt_fecha_ini
				end if
			else
				ldt_fec_proc					= ldt_fecha_ini
			end if
		end if
	end if
end if	
em_termino.text							= string(ldt_fec_proc,'dd/mm/yyyy') 		
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_proc
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
		ldb_valor_uf							= ldb_valor_uf
	else
		ldb_valor_uf							= 0
	end if
else
	ldb_valor_uf								= 0
end if
st_valor_uf.text 							= string(ldb_valor_uf,'###,###,##0.00')
end subroutine

public subroutine wf_itemchanged (string as_columna);string		ls_base,ls_serie,ls_clasif,ls_new_clas
double	ldb_numero,ldb_porc_age,ldb_porc_sup,ldb_porc_jef,ldb_porc_ing
datetime	ldt_cierre_vta,ldt_nulo

//wf_itemchanged(as_columna)
setnull(ldt_nulo)
dw_modif_datos.accepttext()
if as_columna='base' then
	ls_base														= dw_modif_datos.getitemstring(1,'base')
	dw_modif_datos.getchild('serie',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ls_base)=0 then
		idw_detalle2.insertrow(0)
	end if
elseif as_columna='serie' then
	dw_modif_datos.setitem(1,'numero',0)
	dw_modif_datos.accepttext()
elseif as_columna = 'numero' then
	ls_base														= dw_modif_datos.getitemstring(1,'base')
	ls_serie														= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero													= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if ls_base='O' then
			SELECT	"PORCE_VENTA",	"PORCE_SUP",	"PORCE_JEFE",	"CLASIFICA_VENTA",	"PORCE_ING_CIERRE",	"RUT",	"CIERRE_VENTA"
    			INTO		:ldb_porc_age,		:ldb_porc_sup,	:ldb_porc_jef,	:ls_clasif,				:ldb_porc_ing,				:gi_rut,	:ldt_cierre_vta
    			FROM		"OFERTA_V"  
   			WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
         				( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
			USING	sqlca;
		elseif ls_base='L' then
			SELECT	"PORCE_AGE",	"PORCE_SUP",	"PORCE_JEFE",	"CLASIFICA_VENTA",	"PORCE_ING_CIERRE",	"RUT",	"CIERRE_VENTA"
    			INTO		:ldb_porc_age,	:ldb_porc_sup,	:ldb_porc_jef,	:ls_clasif,				:ldb_porc_ing,				:gi_rut,	:ldt_cierre_vta  
    			FROM		"ANEXO_LIBERADOR"  
   			WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
         				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
			USING	sqlca;
		elseif ls_base='A' then
			SELECT	"PORCE_AGE",	"PORCE_SUP",	"PORCE_JEFE",	"CLASIFICA_VENTA",	"PORCE_ING_CIERRE",	"RUT",	"CIERRE_VENTA"
    			INTO		:ldb_porc_age,	:ldb_porc_sup,	:ldb_porc_jef,	:ls_clasif,				:ldb_porc_ing,				:gi_rut,	:ldt_cierre_vta
    			FROM		"ANEXO_AUMENTO"  
   			WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
         				( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
			USING	sqlca;	
		end if
		if sqlca.sqlcode=0 then
			cbx_modif_cierre.enabled						= true
			cbx_porc_ing.enabled								= true
			cbx_clasif.enabled									= true
			cbx_deveng.enabled								= true
			cbx_comis.enabled								= true
			cbx_persist.enabled								= true
			dw_modif_datos.setitem(1,'porc_age',ldb_porc_age)
			dw_modif_datos.setitem(1,'porc_sup',ldb_porc_sup)	
			dw_modif_datos.setitem(1,'porc_jef',ldb_porc_jef)	
			dw_modif_datos.setitem(1,'clasif',ls_clasif)
			dw_modif_datos.setitem(1,'porc_ing',ldb_porc_ing)
			dw_modif_datos.setitem(1,'cierre_vta',ldt_cierre_vta)
			ls_new_clas											= f_clas_promesa(ls_base,ls_serie,ldb_numero)
			dw_modif_datos.setitem(1,'new_clas',ls_new_clas)
			dw_modif_datos.object.porc_ing.protect		= 1
			dw_modif_datos.object.cierre_vta.protect	= 1
		else
			messagebox("Advertencia","Contrato No Se Encuentra Digitado")
			dw_modif_datos.setitem(1,'numero',0)
			dw_modif_datos.setitem(1,'porc_age',0)
			dw_modif_datos.setitem(1,'porc_sup',0)	
			dw_modif_datos.setitem(1,'porc_jef',0)	
			dw_modif_datos.setitem(1,'clasif','')
			dw_modif_datos.setitem(1,'porc_ing',0)
			dw_modif_datos.setitem(1,'new_clas','')
			dw_modif_datos.setitem(1,'cierre_vta',ldt_nulo)	
		end if
		dw_modif_datos.accepttext()
	end if
end if
end subroutine

on w_comision_proceso.create
this.st_3=create st_3
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cbx_modif_cierre=create cbx_modif_cierre
this.cb_1=create cb_1
this.cb_imprimir=create cb_imprimir
this.cb_comi_ugn=create cb_comi_ugn
this.cb_resumen_comi=create cb_resumen_comi
this.cb_limpiar=create cb_limpiar
this.dw_modif_datos=create dw_modif_datos
this.cb_graba_modif=create cb_graba_modif
this.cbx_porc_ing=create cbx_porc_ing
this.cbx_persist=create cbx_persist
this.cbx_comis=create cbx_comis
this.cbx_deveng=create cbx_deveng
this.cbx_clasif=create cbx_clasif
this.st_2=create st_2
this.cb_detalle=create cb_detalle
this.cb_modif_datos=create cb_modif_datos
this.st_valor_uf=create st_valor_uf
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_crea_deveng_reprog=create cb_crea_deveng_reprog
this.cb_2=create cb_2
this.cb_asocia_rut=create cb_asocia_rut
this.cb_actualiz_036=create cb_actualiz_036
this.cb_actualiz_037=create cb_actualiz_037
this.cb_comi_036=create cb_comi_036
this.cb_comi_037=create cb_comi_037
this.cb_actualiz_089=create cb_actualiz_089
this.cb_pagos=create cb_pagos
this.cb_actualiz_090=create cb_actualiz_090
this.cb_grabar=create cb_grabar
this.cb_exportar=create cb_exportar
this.cb_premio_090=create cb_premio_090
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cta_cte=create cb_cta_cte
this.cb_comi_089=create cb_comi_089
this.dw_proceso=create dw_proceso
this.cb_crea_deveng=create cb_crea_deveng
this.st_cuenta=create st_cuenta
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_hasta=create st_hasta
this.em_termino=create em_termino
this.p_termino=create p_termino
this.cb_cerrar=create cb_cerrar
this.gb_periodo=create gb_periodo
this.gb_6=create gb_6
this.gb_2=create gb_2
this.gb_5=create gb_5
this.gb_1=create gb_1
this.st_fondo=create st_fondo
this.st_det_proceso=create st_det_proceso
this.Control[]={this.st_3,&
this.cb_6,&
this.cb_5,&
this.cb_3,&
this.cbx_modif_cierre,&
this.cb_1,&
this.cb_imprimir,&
this.cb_comi_ugn,&
this.cb_resumen_comi,&
this.cb_limpiar,&
this.dw_modif_datos,&
this.cb_graba_modif,&
this.cbx_porc_ing,&
this.cbx_persist,&
this.cbx_comis,&
this.cbx_deveng,&
this.cbx_clasif,&
this.st_2,&
this.cb_detalle,&
this.cb_modif_datos,&
this.st_valor_uf,&
this.st_1,&
this.cb_4,&
this.cb_crea_deveng_reprog,&
this.cb_2,&
this.cb_asocia_rut,&
this.cb_actualiz_036,&
this.cb_actualiz_037,&
this.cb_comi_036,&
this.cb_comi_037,&
this.cb_actualiz_089,&
this.cb_pagos,&
this.cb_actualiz_090,&
this.cb_grabar,&
this.cb_exportar,&
this.cb_premio_090,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cta_cte,&
this.cb_comi_089,&
this.dw_proceso,&
this.cb_crea_deveng,&
this.st_cuenta,&
this.hpb_1,&
this.st_porc,&
this.st_hasta,&
this.em_termino,&
this.p_termino,&
this.cb_cerrar,&
this.gb_periodo,&
this.gb_6,&
this.gb_2,&
this.gb_5,&
this.gb_1,&
this.st_fondo,&
this.st_det_proceso}
end on

on w_comision_proceso.destroy
destroy(this.st_3)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cbx_modif_cierre)
destroy(this.cb_1)
destroy(this.cb_imprimir)
destroy(this.cb_comi_ugn)
destroy(this.cb_resumen_comi)
destroy(this.cb_limpiar)
destroy(this.dw_modif_datos)
destroy(this.cb_graba_modif)
destroy(this.cbx_porc_ing)
destroy(this.cbx_persist)
destroy(this.cbx_comis)
destroy(this.cbx_deveng)
destroy(this.cbx_clasif)
destroy(this.st_2)
destroy(this.cb_detalle)
destroy(this.cb_modif_datos)
destroy(this.st_valor_uf)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_crea_deveng_reprog)
destroy(this.cb_2)
destroy(this.cb_asocia_rut)
destroy(this.cb_actualiz_036)
destroy(this.cb_actualiz_037)
destroy(this.cb_comi_036)
destroy(this.cb_comi_037)
destroy(this.cb_actualiz_089)
destroy(this.cb_pagos)
destroy(this.cb_actualiz_090)
destroy(this.cb_grabar)
destroy(this.cb_exportar)
destroy(this.cb_premio_090)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cta_cte)
destroy(this.cb_comi_089)
destroy(this.dw_proceso)
destroy(this.cb_crea_deveng)
destroy(this.st_cuenta)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_hasta)
destroy(this.em_termino)
destroy(this.p_termino)
destroy(this.cb_cerrar)
destroy(this.gb_periodo)
destroy(this.gb_6)
destroy(this.gb_2)
destroy(this.gb_5)
destroy(this.gb_1)
destroy(this.st_fondo)
destroy(this.st_det_proceso)
end on

event open;long		ll_mes,ll_ano
datetime	ldt_fecha_ini,ldt_fec_proc
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_valor_uf

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
w_comision_proceso.height						= 1500
w_comision_proceso.width						= 3067
gf_centrar(w_comision_proceso)
cb_detalle.text										= 'Ver &Detalle'
hpb_1.Position										= ldb_tot_porc
st_det_proceso.text								= 'Proceso Cálculo Comisiones'
st_porc.text											= string(0,'#0.00')+" %"
st_cuenta.text 										= 'Total Reg. '+string(0,'###,###,##0')+'    Reg. Cálculados '+string(0,'###,###,##0')+' ( '+string(0,'#0.00')+'% )'
dw_proceso.settransobject(sqlca)
if gl_proceso<4 then
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_comision_proceso)
else
	PostEvent('ue_calcular')
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type st_3 from statictext within w_comision_proceso
integer x = 1541
integer y = 504
integer width = 768
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Contrato Trabajo Nuevos"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_comision_proceso
integer x = 1550
integer y = 856
integer width = 690
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Comisión Compartida"
end type

event clicked;string		ls_base,ls_serie,ls_origen_vta,ls_cod_age2,ls_cod_sup2,ls_cod_jef2,ls_cod_age3,ls_age_ofe, ls_age_con
long		ll_tot_reg,ll_tipo_compar,ll_res,ll_graba=0
datetime	ldt_fecha
double	ldb_numero,ldb_factor_age1,ldb_factor_age2,ldb_factor_age3,ldb_factor_sup1,ldb_factor_sup2,ldb_factor_jef1,ldb_factor_jef2,&
			ldb_porce_age,ldb_porce_sup,ldb_porce_jef,ldb_porce_age1,ldb_porce_age2,ldb_porce_age3,ldb_porce_sup1,ldb_porce_sup2,&
			ldb_porce_jef1,ldb_porce_jef2


ll_res											= MessageBox("Advertencia", 'Esta seguro de Grabar Proceso Comisión Comparida', Exclamation!, YesNo!, 2)
if ll_res=1 then
	SELECT	count("CADENA"."CODIGO")
	INTO		:ll_tot_reg
	FROM		"OFERTA_V","CADENA","ESTADO","JEFE_VENTAS","CONVENIO_RETIRO" 
	WHERE	"CADENA"."CODIGO" = 'O' AND 
				"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
				"CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" AND
				"OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" AND
				"ESTADO"."ESTADO_FACTURACION" = 'V' AND
				"OFERTA_V"."FECHA" >=  to_date('30/04/2015','dd/mm/yyyy') AND   
				"OFERTA_V"."BENEFICIO_COMPLEMENTARIO" = '6' AND
				"OFERTA_V"."COD_CONVENIO" = "CONVENIO_RETIRO"."COD_CONVENIO" AND  		
				"JEFE_VENTAS"."CANAL" <> 'UG' AND
				"OFERTA_V"."COD_AGE" <>  "CONVENIO_RETIRO"."COD_AGENTE" AND
				(	SELECT DISTINCT	"COMISION_COMPARTIDA"."TIPO_CONDOLENCIA"  
					FROM		"COMISION_COMPARTIDA"  
					WHERE	"COMISION_COMPARTIDA"."BASE" = "CADENA"."CODIGO" AND  
								"COMISION_COMPARTIDA"."SERIE" = "CADENA"."SERIE" AND  
								"COMISION_COMPARTIDA"."NUMERO" = "CADENA"."NUMERO" AND  
								"COMISION_COMPARTIDA"."ESTADO" = 'V' ) IS NULL
	USING	sqlca;
	if isnull(ll_tot_reg) then ll_tot_reg=0
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Comisiones Compartidas ")
	else
		DECLARE x1 CURSOR FOR
		SELECT	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",		"OFERTA_V"."FECHA",	"OFERTA_V"."PORCE_VENTA",	"OFERTA_V"."PORCE_SUP",	"OFERTA_V"."PORCE_JEFE",	"OFERTA_V"."TIPO_VENTA",	2,	"OFERTA_V"."COD_AGE",  "CONVENIO_RETIRO"."COD_AGENTE" 
		FROM		"OFERTA_V","CADENA","ESTADO","JEFE_VENTAS","CONVENIO_RETIRO" 
		WHERE	"CADENA"."CODIGO" = 'O' AND 
					"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
					"CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" AND
					"OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" AND
					"ESTADO"."ESTADO_FACTURACION" = 'V' AND
					"OFERTA_V"."FECHA" >=  to_date('30/04/2015','dd/mm/yyyy') AND   
					"OFERTA_V"."BENEFICIO_COMPLEMENTARIO" = '6' AND
					"OFERTA_V"."COD_CONVENIO" = "CONVENIO_RETIRO"."COD_CONVENIO" AND  		
					"JEFE_VENTAS"."CANAL" <> 'UG' AND
					(	SELECT DISTINCT	"COMISION_COMPARTIDA"."TIPO_CONDOLENCIA"  
						FROM		"COMISION_COMPARTIDA"  
						WHERE	"COMISION_COMPARTIDA"."BASE" = "CADENA"."CODIGO" AND  
									"COMISION_COMPARTIDA"."SERIE" = "CADENA"."SERIE" AND  
									"COMISION_COMPARTIDA"."NUMERO" = "CADENA"."NUMERO" AND  
									"COMISION_COMPARTIDA"."ESTADO" = 'V' ) IS NULL
		ORDER BY "OFERTA_V"."FECHA"
		USING		Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			DO WHILE Trans_1.sqlcode=0
			fetch x1 INTO :ls_base,:ls_serie,:ldb_numero,:ldt_fecha,:ldb_porce_age,:ldb_porce_sup,:ldb_porce_jef,:ls_origen_vta,:ll_tipo_compar, :ls_age_ofe, :ls_age_con;
				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero>0 then
					ls_origen_vta								= '3'
					
					SELECT	"PORCE_AGE_1",	"PORCE_AGE_2",	"PORCE_AGE_3",	"PORCE_SUP_1",	"PORCE_SUP_2",	"PORCE_JEFE_1",	"PORCE_JEFE_2"
					INTO		:ldb_factor_age1,	:ldb_factor_age2,	:ldb_factor_age3,	:ldb_factor_sup1,	:ldb_factor_sup2,	:ldb_factor_jef1,	:ldb_factor_jef2
					FROM 	"COMISION_COMPARTIDA_PORCE"  
					WHERE	"COMISION_COMPARTIDA_PORCE"."CODIGO_COMIS" = :ls_origen_vta AND  
								"COMISION_COMPARTIDA_PORCE"."TIPO_CONDOL_CODIGO" = :ll_tipo_compar
					USING	sqlca;
					
					ldb_porce_age1							= ldb_porce_age * ldb_factor_age1
					ldb_porce_age2							= ldb_porce_age * ldb_factor_age2
					ldb_porce_age3							= ldb_porce_age * ldb_factor_age3
					
					ldb_porce_sup1							= ldb_porce_sup * ldb_factor_sup1
					ldb_porce_sup2							= ldb_porce_sup * ldb_factor_sup2
					ldb_porce_jef1								= ldb_porce_jef * ldb_factor_jef1
					ldb_porce_jef2								= ldb_porce_jef * ldb_factor_jef2
					
					SELECT	"AGENTES"."COD_AGE",	"SUPERVISOR"."COD_SUP",	"JEFE_VENTAS"."JEFE_VENTAS"
					INTO		:ls_cod_age2,				:ls_cod_sup2,					:ls_cod_jef2
    					FROM		"AGENTES","JEFE_VENTAS","SUPERVISOR"  
   					WHERE 	"SUPERVISOR"."COD_SUP" = "AGENTES"."COD_SUP" and  
         						"SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" and  
         						"AGENTES"."COD_AGE" = 'NC'
					USING	sqlca;
					
					INSERT INTO "COMISION_COMPARTIDA"  
								( "FECHA_CREA",		"USUARIO_CREA",	"BASE",	"SERIE",	"NUMERO",		"CODIGO_TIPO_VTA",	"PORCE_AGE_ORIG",	"PORCE_SUP_ORIG",	"PORCE_JEFE_ORIG",	"PORCE_AGE_1",	"PORCE_SUP_1",	"PORCE_JEFE_1",	"COD_AGE_2",	"PORCE_AGE_2",	"COD_SUP_2",	"PORCE_SUP_2",	"COD_JEFE_2",	"PORCE_JEFE_2",	"COD_AGE_3",	"PORCE_AGE_3",	"ESTADO",	"FECHA_MODIFICA",	"TIPO_CONDOLENCIA",	"TIPO_COMPARTIDA" )	  
					VALUES	( :gdt_fec_sistema,	:gs_user,			:ls_base,	:ls_serie,	:ldb_numero,	:ls_origen_vta,				:ldb_porce_age,		:ldb_porce_sup,		:ldb_porce_jef,			:ldb_porce_age1,	:ldb_porce_sup1,	:ldb_porce_jef1,	:ls_cod_age2,	:ldb_porce_age2,	:ls_cod_sup2,	:ldb_porce_sup2,	:ls_cod_jef2,	:ldb_porce_jef2,	:ls_cod_age3,	:ldb_porce_age3,	'V',			null,						:ll_tipo_compar,			'N' )
					USING	sqlca;
					if sqlca.sqlcode = 0 then
						commit using sqlca;
						ll_graba++
					else
						rollback using sqlca;
					end if
				end if
				setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);setnull(ldt_fecha);setnull(ldb_porce_age);setnull(ldb_porce_sup);setnull(ldb_porce_jef);setnull(ls_origen_vta);setnull(ll_tipo_compar)
			LOOP
		end if
		close x1;
		if ll_graba=ll_tot_reg then
			messagebox("Grabar","Grabación Exitosa")
		end if
	end if
end if
end event

type cb_5 from commandbutton within w_comision_proceso
boolean visible = false
integer x = 3186
integer y = 1716
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//string		ls_cod_age,ls_nombre,ls_a_pater,ls_a_mater,ls_cod_jef,ls_cod_sup2		
//long		ll_new,ll_rut,ll_meta_llam,ll_meta_vtas,ll_prod_llam,ll_prod_vtas,ll_cta_vtas
//datetime	ldt_fec_fin,ldt_fec_cierre,ldt_fec_ing,ldt_fec_ini
//double	ldb_tot_porc,ldb_valor_uf,ldb_pond_llam,ldb_pond_vtas,ldb_porc_llam,ldb_porc_vtas,ldb_comi_sup,ldb_prod_ugn,ldb_porc_tot,ldb_tot_comi
//
//cb_grabar.visible								= true
//st_det_proceso.text							= 'Cálculo Comisiones UGN'
//dw_proceso.reset()
//SetPointer(HourGlass!)
//is_grabar										= 'U'
//dw_proceso.dataobject						= 'dwe_ugn_pagos'
//dw_proceso.settransobject(sqlca)
//ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
//hpb_1.Position									= ldb_tot_porc
//SELECT	max("CIERRE_VENTA"."CIERRE_VENTA"),max("CIERRE_VENTA"."CIERRE_VENTA_INI")
//INTO		:ldt_fec_cierre,	:ldt_fec_ini
//FROM 	"CIERRE_VENTA"  
//WHERE	"CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin
//USING	sqlca;
//
//SELECT	"TAB_UF"."VALOR_UF"
//INTO		:ldb_valor_uf
//FROM		"TAB_UF"
////WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
//WHERE	"TAB_UF"."FECHA_UF" = to_date('31/08/2014','dd/mm/yyyy')
//USING	sqlca;
//if sqlca.sqlcode=0 then
//	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
//		ldb_valor_uf								= ldb_valor_uf
//	else
//		messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
//	end if
//else
//	messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
//end if
//if ldb_valor_uf>0 then
//	SELECT	"META",	"PONDERACION"
//	INTO		:ll_meta_llam,	:ldb_pond_llam
//   	FROM 	"UGN_TELEMARKET_META"  
//   	WHERE 	( "UGN_TELEMARKET_META"."CODIGO" = 1 ) AND  
//         		( "UGN_TELEMARKET_META"."ESTADO" = 'V' )
//	USING	sqlca;
//	if isnull(ll_meta_llam) then ll_meta_llam=0
//	if isnull(ldb_pond_llam) then ldb_pond_llam=0
//	SELECT	"META",	"PONDERACION"
//	INTO		:ll_meta_vtas,	:ldb_pond_vtas
//   	FROM 	"UGN_TELEMARKET_META"  
//   	WHERE 	( "UGN_TELEMARKET_META"."CODIGO" = 2 ) AND  
//         		( "UGN_TELEMARKET_META"."ESTADO" = 'V' )
//	USING	sqlca;
//	if isnull(ll_meta_vtas) then ll_meta_vtas=0
//	if isnull(ldb_pond_vtas) then ldb_pond_vtas=0
//	DECLARE x1 CURSOR FOR
//	SELECT		"AGENTES"."COD_AGE",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."RUT",	"SUPERVISOR"."COD_JEFE",		"SUPERVISOR"."PORC_SUPERVISOR","AGENTES"."FECHA_INI"
//	FROM 		"AGENTES","UGN_TELEMARKET_EJECTUTIVO","SUPERVISOR"  
//	WHERE		"AGENTES"."COD_AGE" = "UGN_TELEMARKET_EJECTUTIVO"."COD_AGE" and
//					"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
//       				"AGENTES"."ESTADO" = 'A' AND  
//        				"AGENTES"."DEPTO" = 'X'
//	ORDER BY	"AGENTES"."FECHA_INI"
//	USING	sqlca;
//	open x1;
//	if sqlca.sqlcode=0 then
//		DO WHILE sqlca.sqlcode=0
//		fetch x1 INTO	:ls_cod_age, :ls_nombre, :ls_a_pater, :ls_a_mater, :ll_rut, :ls_cod_jef,	:ldb_comi_sup, :ldt_fec_ing;
//			if not isnull(ls_cod_age) and ls_cod_age <> '' and not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_a_pater) and ls_a_pater<>'' and not isnull(ls_a_mater) and ls_a_mater<>'' then
//				ls_nombre								= ls_nombre+' '+ls_a_pater+' '+ls_a_mater
//				SELECT	count("VISTA_PRODUCC_MENSUAL"."BASE"),	round(sum("VISTA_PRODUCC_MENSUAL"."PRECIO_UF"),2)  
//				INTO		:ll_cta_vtas,												:ldb_prod_ugn
//   				FROM		"VISTA_PRODUCC_MENSUAL"  
//   				WHERE	"VISTA_PRODUCC_MENSUAL"."COD_JEF" = :ls_cod_jef AND
//							("VISTA_PRODUCC_MENSUAL"."COD_SUP" = 'SU4' OR "VISTA_PRODUCC_MENSUAL"."COD_SUP" = '0195' )AND  	
//         					"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :ldt_fec_cierre
//				USING	Trans_1;
//				if Trans_1.sqlcode=0 then
//					if not isnull(ll_cta_vtas) and ll_cta_vtas>0 and not isnull(ldb_prod_ugn) and ldb_prod_ugn>0 then
//						ll_cta_vtas						= ll_cta_vtas		
//						ldb_prod_ugn					= ldb_prod_ugn
//					else
//						ll_cta_vtas						= 0		
//						ldb_prod_ugn					= 0
//					end if
//				else
//					ll_cta_vtas							= 0		
//					ldb_prod_ugn						= 0
//				end if
//				ll_prod_llam								= f_cta_llamados(ls_cod_age,ldt_fec_ini,ldt_fec_cierre,ls_cod_sup)
//				ll_prod_vtas								= f_cta_vtas_ugn(ls_cod_age,ldt_fec_ini,ldt_fec_cierre,ls_cod_sup)
//				
//				ldb_porc_llam							= round(ll_prod_llam/ll_meta_llam * ldb_pond_llam,2)
//				ldb_porc_vtas							= round(ll_prod_vtas/ll_meta_vtas * ldb_pond_vtas,2)
//				
//				ldb_porc_tot								= ldb_porc_llam + ldb_porc_vtas
//				ldb_tot_comi							= round(((ldb_prod_ugn * ldb_valor_uf * ldb_comi_sup /100) / 2),2)
//				ldb_tot_comi							= ldb_tot_comi * ldb_porc_tot 
//				
//				ll_new									= dw_proceso.insertrow(0)
//				dw_proceso.scrolltorow(ll_new)
//				dw_proceso.setitem(ll_new,'cierre_vtas',ldt_fec_cierre)
//				dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
//				dw_proceso.setitem(ll_new,'n_vtas',ll_cta_vtas)
//				dw_proceso.setitem(ll_new,'producc',ldb_prod_ugn)
//				dw_proceso.setitem(ll_new,'cod_age',ls_cod_age)
//				dw_proceso.setitem(ll_new,'nombre',ls_nombre)
//				dw_proceso.setitem(ll_new,'rut',ll_rut)
//				
//				dw_proceso.setitem(ll_new,'meta_llamado',ll_meta_llam)
//				dw_proceso.setitem(ll_new,'prod_llamado',ll_prod_llam)
//				dw_proceso.setitem(ll_new,'porc_llamado',ldb_porc_llam)
//				dw_proceso.setitem(ll_new,'ponde_llamado',ldb_pond_llam)
//				
//				dw_proceso.setitem(ll_new,'meta_ventas',ll_meta_vtas)
//				dw_proceso.setitem(ll_new,'prod_ventas',ll_prod_vtas)
//				dw_proceso.setitem(ll_new,'porc_ventas',ldb_porc_vtas)
//				dw_proceso.setitem(ll_new,'ponde_ventas',ldb_pond_vtas)
//				
//				dw_proceso.setitem(ll_new,'porce_calc',ldb_porc_tot)
//				dw_proceso.setitem(ll_new,'porce_comi_s',ldb_comi_sup)
//				dw_proceso.setitem(ll_new,'total_comi',ldb_tot_comi)
//				dw_proceso.accepttext()
//			end if	
//			setnull(ls_cod_age);setnull(ls_nombre);setnull(ls_a_pater);setnull(ls_a_mater);setnull(ll_rut);setnull(ls_cod_jef);setnull(ldb_comi_sup);setnull(ldt_fec_ing)
//		LOOP
//	end if
//	close x1;
//end if
end event

type cb_3 from commandbutton within w_comision_proceso
boolean visible = false
integer x = 3168
integer y = 1580
integer width = 695
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "RESPALDO_PROCESO_UGN"
end type

event clicked;//string		ls_cod_age,ls_nombre_age,ls_cod_jef,ls_cod_sup,ls_nombre_sup		
//long		ll_new,ll_rut,ll_meta_llam,ll_meta_vtas,ll_prod_llam,ll_prod_vtas,ll_cta_vtas,ll_tot_age,ll_cta_vtas_tot,ll_meta_llam_tot,ll_meta_vtas_tot
//datetime	ldt_fec_fin,ldt_fec_cierre,ldt_fec_ing,ldt_fec_ini
//double	ldb_tot_porc,ldb_valor_uf,ldb_pond_llam,ldb_pond_vtas,ldb_porc_llam,ldb_porc_vtas,ldb_comi_sup,ldb_prod_ugn,ldb_porc_tot,ldb_tot_comi,ldb_prod_ugn_tot,ldb_porc_aport
//
//cb_grabar.visible								= true
//st_det_proceso.text							= 'Cálculo Comisiones UGN'
//dw_proceso.reset()
//SetPointer(HourGlass!)
//is_grabar										= 'U'
//dw_proceso.dataobject						= 'dwe_ugn_pagos'
//dw_proceso.settransobject(sqlca)
//ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
//hpb_1.Position									= ldb_tot_porc
//SELECT	max("CIERRE_VENTA"."CIERRE_VENTA"),max("CIERRE_VENTA"."CIERRE_VENTA_INI")
//INTO		:ldt_fec_cierre,	:ldt_fec_ini
//FROM 	"CIERRE_VENTA"  
//WHERE	"CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin
//USING	sqlca;
//
//SELECT	"TAB_UF"."VALOR_UF"
//INTO		:ldb_valor_uf
//FROM		"TAB_UF"
//WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
//USING	sqlca;
//if isnull(ldb_valor_uf) then ldb_valor_uf=0
//if ldb_valor_uf=0 then
//	messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
//else
//	dw_proceso.object.usuario.text						= gs_user
//	SELECT	"META",	"PONDERACION"
//	INTO		:ll_meta_llam_tot,	:ldb_pond_llam
//   	FROM 	"UGN_TELEMARKET_META"  
//   	WHERE 	( "UGN_TELEMARKET_META"."CODIGO" = 1 ) AND  
//         		( "UGN_TELEMARKET_META"."ESTADO" = 'V' )
//	USING	sqlca;
//	if isnull(ll_meta_llam_tot) then ll_meta_llam_tot=0
//	if isnull(ldb_pond_llam) then ldb_pond_llam=0
//	
//	SELECT	"META",	"PONDERACION"
//	INTO		:ll_meta_vtas_tot,	:ldb_pond_vtas
//   	FROM 	"UGN_TELEMARKET_META"  
//   	WHERE 	( "UGN_TELEMARKET_META"."CODIGO" = 2 ) AND  
//         		( "UGN_TELEMARKET_META"."ESTADO" = 'V' )
//	USING	sqlca;
//	if isnull(ll_meta_vtas_tot) then ll_meta_vtas_tot=0
//	if isnull(ldb_pond_vtas) then ldb_pond_vtas=0
//	
//	SELECT	count("VISTA_PRODUCC_MENSUAL"."BASE"),
//				round(sum("VISTA_PRODUCC_MENSUAL"."PRECIO_UF"),2)  
//	INTO		:ll_cta_vtas_tot,
//				:ldb_prod_ugn_tot
//	FROM		"VISTA_PRODUCC_MENSUAL"    
//	WHERE	("VISTA_PRODUCC_MENSUAL"."COD_SUP" = 'SU4' OR "VISTA_PRODUCC_MENSUAL"."COD_SUP" = '0195') AND
//				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :ldt_fec_cierre
//	USING	sqlca;
//	if isnull(ll_cta_vtas_tot)  then ll_cta_vtas_tot=0
//	if isnull(ldb_prod_ugn_tot) then ldb_prod_ugn_tot=0
//				
//	ls_cod_jef										= 'JU3'
//	
//	DECLARE x1 CURSOR FOR
//	SELECT	DISTINCT	"COD_SUP",	("NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"),	"PORC_SUPERVISOR"  
//	FROM			"SUPERVISOR"  
//	WHERE		"SUPERVISOR"."COD_JEFE" = :ls_cod_jef AND
//					"SUPERVISOR"."ESTADO" = 'A' AND  
//					( "SUPERVISOR"."COD_SUP" = 'SU4' OR "SUPERVISOR"."COD_SUP" = '0195')
//	ORDER BY	"COD_SUP"
//	USING	Trans_4;
//	open x1;
//	if Trans_4.sqlcode=0 then
//		DO WHILE Trans_4.sqlcode=0
//		fetch x1 INTO	:ls_cod_sup,:ls_nombre_sup,:ldb_comi_sup;
//			if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ls_nombre_sup) and ls_nombre_sup<>'' and not isnull( ldb_comi_sup) and  ldb_comi_sup>0 then
//				
//				SELECT	count("VISTA_PRODUCC_MENSUAL"."BASE"),
//							round(sum("VISTA_PRODUCC_MENSUAL"."PRECIO_UF"),2)  
//				INTO		:ll_cta_vtas,
//							:ldb_prod_ugn
//				FROM		"VISTA_PRODUCC_MENSUAL"  
//				WHERE	"VISTA_PRODUCC_MENSUAL"."COD_SUP" = :ls_cod_sup AND
//							"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :ldt_fec_cierre
//				USING	sqlca;
//				if isnull(ll_cta_vtas)  then ll_cta_vtas=0
//				if isnull(ldb_prod_ugn) then ldb_prod_ugn=0
//				
//				ldb_porc_aport										= round(ldb_prod_ugn / ldb_prod_ugn_tot,2)
//				ll_meta_llam										= ll_meta_llam_tot * ldb_porc_aport 
//				ll_meta_vtas										= ll_meta_vtas_tot * ldb_porc_aport 
//				
//				
//				DECLARE x2 CURSOR FOR
//				SELECT		"COD_AGE",	("NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"),	"RUT","FECHA_INI"
//				FROM 		"AGENTES"
//				WHERE		"AGENTES"."ESTADO" = 'A' AND  
//								"AGENTES"."COD_AGE" LIKE 'U%' AND	 
//								"AGENTES"."DEPTO" = 'X'
//				ORDER BY	"AGENTES"."FECHA_INI"
//				USING		Trans_1;
//				open x2;
//				if Trans_1.sqlcode=0 then
//					DO WHILE Trans_1.sqlcode=0
//					fetch x2 INTO	:ls_cod_age, :ls_nombre_age, :ll_rut, :ldt_fec_ing;
//						if not isnull(ls_cod_age) and ls_cod_age <> '' and not isnull(ls_nombre_age) and ls_nombre_age<>''  and not isnull(ll_rut) and ll_rut>0 and not isnull(ldt_fec_ing)  then
//							
//							ll_prod_llam								= f_cta_llamados(ls_cod_age,ldt_fec_ini,ldt_fec_cierre,ls_cod_sup)
//							ll_prod_vtas								= f_cta_vtas_ugn(ls_cod_age,ldt_fec_ini,ldt_fec_cierre,ls_cod_sup)
//							
//							ldb_porc_llam							= round(ll_prod_llam/ll_meta_llam * ldb_pond_llam,2)
//							ldb_porc_vtas							= round(ll_prod_vtas/ll_meta_vtas * ldb_pond_vtas,2)
//							
//							ll_tot_age								= 4
//							ldb_comi_sup  							= ldb_comi_sup * 0.50
//							
//							ldb_porc_tot								= ldb_porc_llam + ldb_porc_vtas
//							ldb_tot_comi							= round(((ldb_prod_ugn * ldb_valor_uf * ldb_comi_sup /100) / ll_tot_age),2)
//							ldb_tot_comi							= ldb_tot_comi * ldb_porc_tot 
//							
//							ll_new									= dw_proceso.insertrow(0)
//							dw_proceso.scrolltorow(ll_new)
//							
//							dw_proceso.setitem(ll_new,'n_vtas_tot',ll_cta_vtas_tot)
//							dw_proceso.setitem(ll_new,'producc_tot',ldb_prod_ugn_tot)
//							
//							dw_proceso.setitem(ll_new,'cod_sup',ls_cod_sup)
//							dw_proceso.setitem(ll_new,'nombre_sup',ls_nombre_sup)
//							dw_proceso.setitem(ll_new,'rut',ll_rut)
//							dw_proceso.setitem(ll_new,'n_vtas',ll_cta_vtas)
//							dw_proceso.setitem(ll_new,'producc',ldb_prod_ugn)
//							dw_proceso.setitem(ll_new,'porce_comi_s',ldb_comi_sup)
//							dw_proceso.setitem(ll_new,'cierre_vtas',ldt_fec_cierre)
//							dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
//							dw_proceso.setitem(ll_new,'porce_aporte',ldb_porc_aport)
//							
//							dw_proceso.setitem(ll_new,'cod_age',ls_cod_age)
//							dw_proceso.setitem(ll_new,'nombre',ls_nombre_age)
//														
//							dw_proceso.setitem(ll_new,'prod_llamado',ll_prod_llam)
//							dw_proceso.setitem(ll_new,'meta_llamado',ll_meta_llam)
//							dw_proceso.setitem(ll_new,'porc_llamado',ldb_porc_llam)
//							dw_proceso.setitem(ll_new,'ponde_llamado',ldb_pond_llam)
//							
//							dw_proceso.setitem(ll_new,'prod_ventas',ll_prod_vtas)
//							dw_proceso.setitem(ll_new,'meta_ventas',ll_meta_vtas)
//							dw_proceso.setitem(ll_new,'porc_ventas',ldb_porc_vtas)
//							dw_proceso.setitem(ll_new,'ponde_ventas',ldb_pond_vtas)
//							
//							dw_proceso.setitem(ll_new,'porce_calc',ldb_porc_tot)
//							dw_proceso.setitem(ll_new,'total_comi',ldb_tot_comi)
//							dw_proceso.accepttext()
//						end if	
//						setnull(ls_cod_age);setnull(ls_nombre_age);setnull(ll_rut);setnull(ldt_fec_ing)
//					LOOP
//				end if
//				close x2;
//				
//			end if
//			setnull(ls_cod_sup);setnull(ls_nombre_sup);setnull( ldb_comi_sup)
//		LOOP
//	end if
//	close x1;	
//end if
end event

type cbx_modif_cierre from checkbox within w_comision_proceso
integer x = 3168
integer y = 820
integer width = 626
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Cierre Ventas"
end type

event clicked;string		ls_clas_new,ls_base,ls_serie
long		ll_tot_reg,ll_res
double	ldb_numero
datetime	ldt_ult_fec_cierre

ll_tot_reg															= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base															= dw_modif_datos.getitemstring(1,'base')
	ls_serie															= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero														= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if cbx_modif_cierre.checked=true then
			ll_res														= MessageBox("Modificar","¿Desea Modificar Cierre Ventas?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				SELECT	max("CIERRE_VENTA")  
    				INTO 		:ldt_ult_fec_cierre  
    				FROM		"CIERRE_VENTA"
				USING	sqlca;
				idt_cierre_vta										= dw_modif_datos.getitemdatetime(1,'cierre_vta')
				dw_modif_datos.object.cierre_vta.protect	= 0
				dw_modif_datos.object.p_fecha.enabled		= true
				dw_modif_datos.setitem(1,'cierre_vta',ldt_ult_fec_cierre)
				dw_modif_datos.accepttext()
				is_graba_cierre										= 'S'
			else
				cbx_modif_cierre.checked						=false
			end if
		elseif cbx_modif_cierre.checked=false then
			ll_res														= MessageBox("Modificar","¿Desea Volver a Cierre ventas Guardado?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				dw_modif_datos.setitem(1,'cierre_vta',idt_cierre_vta)
				dw_modif_datos.object.cierre_vta.protect	= 1
				dw_modif_datos.object.p_fecha.enabled		= false
				dw_modif_datos.accepttext()
				is_graba_cierre										= 'N'
			else
				cbx_modif_cierre.checked=true
			end if
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_comision_proceso
integer x = 530
integer y = 1036
integer width = 453
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Archivo Remune."
end type

event clicked;if isvalid(w_traspaso_comi_vtas) then close(w_traspaso_comi_vtas)
Open(w_traspaso_comi_vtas)

end event

type cb_imprimir from commandbutton within w_comision_proceso
event ue_mousemove pbm_mousemove
integer x = 2784
integer y = 2064
integer width = 224
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_proceso.rowcount()>0 then
	f_Print( dw_proceso )
end if
end event

type cb_comi_ugn from commandbutton within w_comision_proceso
boolean visible = false
integer x = 3150
integer y = 1432
integer width = 690
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cálculo Comisiones UGN"
end type

event clicked;string		ls_cod_age,ls_nombre,ls_a_pater,ls_a_mater,ls_cod_jef,ls_cod_sup2		
long		ll_new,ll_rut,ll_meta_llam,ll_meta_vtas,ll_prod_llam,ll_prod_vtas,ll_cta_vtas,ll_dota
datetime	ldt_fec_fin,ldt_fec_cierre,ldt_fec_ing,ldt_fec_ini
double	ldb_tot_porc,ldb_valor_uf,ldb_pond_llam,ldb_pond_vtas,ldb_porc_llam,ldb_porc_vtas,ldb_comi_sup,ldb_prod_ugn,ldb_porc_tot,ldb_tot_comi

cb_grabar.visible								= true
st_det_proceso.text							= 'Cálculo Comisiones UGN'
dw_proceso.reset()
SetPointer(HourGlass!)
is_grabar										= 'U'
dw_proceso.dataobject						= 'dwe_ugn_pagos'
dw_proceso.settransobject(sqlca)
ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
hpb_1.Position									= ldb_tot_porc
SELECT	max("CIERRE_VENTA"."CIERRE_VENTA"),max("CIERRE_VENTA"."CIERRE_VENTA_INI")
INTO		:ldt_fec_cierre,	:ldt_fec_ini
FROM 	"CIERRE_VENTA"  
WHERE	"CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin
USING	sqlca;

SELECT	"TAB_UF"."VALOR_UF"
INTO		:ldb_valor_uf
FROM		"TAB_UF"
WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
//WHERE	"TAB_UF"."FECHA_UF" = to_date('31/08/2014','dd/mm/yyyy')
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
		ldb_valor_uf								= ldb_valor_uf
	else
		messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
	end if
else
	messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
end if
if ldb_valor_uf>0 then
	SELECT	"META",	"PONDERACION"
	INTO		:ll_meta_llam,	:ldb_pond_llam
   	FROM 	"UGN_TELEMARKET_META"  
   	WHERE 	( "UGN_TELEMARKET_META"."CODIGO" = 1 ) AND  
         		( "UGN_TELEMARKET_META"."ESTADO" = 'V' )
	USING	sqlca;
	if isnull(ll_meta_llam) then ll_meta_llam=0
	if isnull(ldb_pond_llam) then ldb_pond_llam=0
	SELECT	"META",	"PONDERACION"
	INTO		:ll_meta_vtas,	:ldb_pond_vtas
   	FROM 	"UGN_TELEMARKET_META"  
   	WHERE 	( "UGN_TELEMARKET_META"."CODIGO" = 2 ) AND  
         		( "UGN_TELEMARKET_META"."ESTADO" = 'V' )
	USING	sqlca;
	if isnull(ll_meta_vtas) then ll_meta_vtas=0
	if isnull(ldb_pond_vtas) then ldb_pond_vtas=0
	DECLARE x1 CURSOR FOR
	SELECT		"AGENTES"."COD_AGE",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."RUT",	"SUPERVISOR"."COD_JEFE",		"SUPERVISOR"."PORC_SUPERVISOR","AGENTES"."FECHA_INI"
	FROM 		"AGENTES","UGN_TELEMARKET_EJECTUTIVO","SUPERVISOR"  
	WHERE		"AGENTES"."COD_AGE" = "UGN_TELEMARKET_EJECTUTIVO"."COD_AGE" and
					"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
       				"AGENTES"."ESTADO" = 'A' AND  
        				"AGENTES"."DEPTO" = 'X'
	ORDER BY	"AGENTES"."FECHA_INI"
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_cod_age, :ls_nombre, :ls_a_pater, :ls_a_mater, :ll_rut, :ls_cod_jef,	:ldb_comi_sup, :ldt_fec_ing;
			if not isnull(ls_cod_age) and ls_cod_age <> '' and not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_a_pater) and ls_a_pater<>'' and not isnull(ls_a_mater) and ls_a_mater<>'' then
				ls_nombre								= ls_nombre+' '+ls_a_pater+' '+ls_a_mater
				SELECT	count("VISTA_PRODUCC_MENSUAL"."BASE"),	round(sum("VISTA_PRODUCC_MENSUAL"."PRECIO_UF"),2)  
				INTO		:ll_cta_vtas,												:ldb_prod_ugn
   				FROM		"VISTA_PRODUCC_MENSUAL"  
   				WHERE	"VISTA_PRODUCC_MENSUAL"."COD_JEF" = :ls_cod_jef AND
							"VISTA_PRODUCC_MENSUAL"."COD_AGE"  not like 'U%'   AND
							"VISTA_PRODUCC_MENSUAL"."CANAL_AGE" <> 'NI' AND
         					"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :ldt_fec_cierre
				USING	Trans_1;
				if Trans_1.sqlcode=0 then
					if not isnull(ll_cta_vtas) and ll_cta_vtas>0 and not isnull(ldb_prod_ugn) and ldb_prod_ugn>0 then
						ll_cta_vtas						= ll_cta_vtas		
						ldb_prod_ugn					= ldb_prod_ugn
					else
						ll_cta_vtas						= 0		
						ldb_prod_ugn					= 0
					end if
				else
					ll_cta_vtas							= 0		
					ldb_prod_ugn						= 0
				end if
				ll_prod_llam								= f_cta_llamados(ls_cod_age,ldt_fec_ini,ldt_fec_cierre)
				ll_prod_vtas								= f_cta_vtas_ugn(ls_cod_age,ldt_fec_ini,ldt_fec_cierre)
				
				ldb_porc_llam							= round(ll_prod_llam/ll_meta_llam * ldb_pond_llam,2)
				ldb_porc_vtas							= round(ll_prod_vtas/ll_meta_vtas * ldb_pond_vtas,2)
				
				ldb_porc_tot								= ldb_porc_llam + ldb_porc_vtas
				ll_dota									= 3
				
				ldb_tot_comi							= round(((ldb_prod_ugn * ldb_valor_uf * ldb_comi_sup /100) / ll_dota),2)
				ldb_tot_comi							= ldb_tot_comi * ldb_porc_tot 
				
				ll_new									= dw_proceso.insertrow(0)
				dw_proceso.scrolltorow(ll_new)
				dw_proceso.setitem(ll_new,'cierre_vtas',ldt_fec_cierre)
				dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
				dw_proceso.setitem(ll_new,'n_vtas',ll_cta_vtas)
				dw_proceso.setitem(ll_new,'producc',ldb_prod_ugn)
				dw_proceso.setitem(ll_new,'cod_age',ls_cod_age)
				dw_proceso.setitem(ll_new,'nombre',ls_nombre)
				dw_proceso.setitem(ll_new,'rut',ll_rut)
				
				dw_proceso.setitem(ll_new,'meta_llamado',ll_meta_llam)
				dw_proceso.setitem(ll_new,'prod_llamado',ll_prod_llam)
				dw_proceso.setitem(ll_new,'porc_llamado',ldb_porc_llam)
				dw_proceso.setitem(ll_new,'ponde_llamado',ldb_pond_llam)
				
				dw_proceso.setitem(ll_new,'meta_ventas',ll_meta_vtas)
				dw_proceso.setitem(ll_new,'prod_ventas',ll_prod_vtas)
				dw_proceso.setitem(ll_new,'porc_ventas',ldb_porc_vtas)
				dw_proceso.setitem(ll_new,'ponde_ventas',ldb_pond_vtas)
				
				dw_proceso.setitem(ll_new,'porce_calc',ldb_porc_tot)
				dw_proceso.setitem(ll_new,'porce_comi_s',ldb_comi_sup)
				dw_proceso.setitem(ll_new,'total_comi',ldb_tot_comi)
				dw_proceso.accepttext()
			end if	
			setnull(ls_cod_age);setnull(ls_nombre);setnull(ls_a_pater);setnull(ls_a_mater);setnull(ll_rut);setnull(ls_cod_jef);setnull(ldb_comi_sup);setnull(ldt_fec_ing)
		LOOP
	end if
	close x1;
end if
end event

type cb_resumen_comi from commandbutton within w_comision_proceso
integer x = 78
integer y = 1036
integer width = 453
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Resumen Comisión"
end type

event clicked;string	ls_string,ls_cod_contable
datetime	ldt_fecha_term,ldt_fecha_comi

ldt_fecha_term								= datetime(date(em_termino.text),time('00:00:00'))
SELECT	MAX("RES_COMI"."FECHA") 
INTO		:ldt_fecha_comi  
FROM 		"RES_COMI"  
WHERE		"RES_COMI"."FECHA" = :ldt_fecha_term AND
			(	"RES_COMI"."COD_CONTABLE" = '022' OR
				"RES_COMI"."COD_CONTABLE" = '023' OR
				"RES_COMI"."COD_CONTABLE" = '036' OR
				"RES_COMI"."COD_CONTABLE" = '037' OR
				"RES_COMI"."COD_CONTABLE" = '066' OR
				"RES_COMI"."COD_CONTABLE" = '067' OR
				"RES_COMI"."COD_CONTABLE" = '068' OR
				"RES_COMI"."COD_CONTABLE" = '089' OR
				"RES_COMI"."COD_CONTABLE" = '090')
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha_comi) then
		ls_string		= string(ldt_fecha_comi,'dd/mm/yyyy')
		OpenWithParm(w_comision_resumen_ventas, ls_string)
	else
		messagebox('Advertencia','No Existe Proceso de Comisiones Con Fecha : '+string(ldt_fecha_term,'dd/mm/yyyy'))
	end if
end if
end event

type cb_limpiar from commandbutton within w_comision_proceso
integer x = 3675
integer y = 1244
integer width = 279
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_modif_datos.reset()
dw_modif_datos.dataobject		= 'dwe_contrato_comis'
dw_modif_datos.getchild('base',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve()=0 then
	idw_detalle.insertrow(0)
end if
dw_modif_datos.getchild('serie',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve('O')=0 then
	idw_detalle2.insertrow(0)
end if
dw_modif_datos.insertrow(0)

cbx_modif_cierre.checked						= false
cbx_clasif.checked									= false
cbx_porc_ing.checked								= false
cbx_deveng.checked								= false
cbx_comis.checked								= false
cbx_persist.checked								= false
end event

type dw_modif_datos from datawindow within w_comision_proceso
integer x = 3136
integer y = 28
integer width = 855
integer height = 784
integer taborder = 70
string title = "none"
string dataobject = "dwe_contrato_comis"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string		ls_columna

dw_modif_datos.accepttext()
ls_columna 					= dwo.name
is_tipo						= 'I'
if ls_columna='base' then
	wf_itemchanged(ls_columna)
elseif ls_columna = 'numero' then
	wf_itemchanged(ls_columna)
end if
end event

event clicked;string	ls_columna,ls_fecha
datetime	ldt_fecha

if row>0 then
	is_tipo			= 'I'	
	il_row				= row
end if

ls_columna = dwo.name
if ls_columna = 'p_fecha' then
	ldt_fecha											= dw_modif_datos.getitemdatetime(1,'cierre_vta')
	if f_valida_fecha(string(ldt_fecha,'dd/mm/yyyy'))=-1 then 
		dw_modif_datos.setitem(1,'cierre_vta',today())
		dw_modif_datos.setfocus()
		dw_modif_datos.setcolumn('cierre_vta')
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
		dw_modif_datos.setitem(1,'cierre_vta',ldt_fecha)
		dw_modif_datos.accepttext()
	END IF
end if
end event

type cb_graba_modif from commandbutton within w_comision_proceso
integer x = 3118
integer y = 1244
integer width = 553
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar Modificación"
end type

event clicked;string		ls_base,ls_serie,ls_clasif,ls_ctto,ls_graba,ls_cod_cont,ls_cod_age,ls_mes_c,ls_moneda,ls_cod_com,ls_est_age
long		ll_res,ll_tot_reg,ll_rut,ll_monto,ll_cod_parque
datetime	ldt_fec_fin,ldt_cierre_vta
double	ldb_numero,ldb_porce_ing,ldb_p_ing_caj,ldb_porc_vta,ldb_precio,ldb_total_pag,ldb_valor_uf

dw_modif_datos.accepttext()
ll_tot_reg									= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base									= dw_modif_datos.getitemstring(1,'base')
	ls_serie									= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero								= dw_modif_datos.getitemnumber(1,'numero')
	if ls_base='O' then
		ls_ctto								= 'Promesa'
	elseif ls_base='A' then
		ls_ctto								= 'Aumento Capacidad'
	elseif ls_base='L' then
		ls_ctto								= 'Anexo Liberador'
	end if
	if is_graba_clas = 'S' then
		ll_res									= MessageBox("Grabar","¿Desea Grabar Modificación de Clasificación Ventas?", Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			ls_clasif							= dw_modif_datos.getitemstring(1,'clasif')
			if ls_base='O' then
				UPDATE	"OFERTA_V"  
				SET		"CLASIFICA_VENTA" = :ls_clasif
				WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
							( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
				USING	sqlca;
			elseif ls_base='A' then
				UPDATE	"ANEXO_AUMENTO"  
				SET		"CLASIFICA_VENTA" = :ls_clasif
				WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
				USING	sqlca;
			elseif ls_base='L' then
				UPDATE	"ANEXO_LIBERADOR"  
				SET		"CLASIFICA_VENTA" = :ls_clasif
				WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
				USING	sqlca;	
			end if
			if sqlca.sqlcode=0 then
				commit using sqlca;
				messagebox("Grabar",'Grabación Exitosa "Clasificación Venta" '+ls_ctto+' '+ls_serie+'-'+string(ldb_numero))
				ls_graba						= 'S'	
			else
				rollback using sqlca;
				messagebox("Error Grabar",'Error Grabar "Clasificación Venta" '+ls_ctto+' '+ls_serie+'-'+string(ldb_numero))
			end if
		end if
	elseif is_graba_ingr='S' then
		ll_res									= MessageBox("Grabar","¿Desea Grabar Modificación Porcentaje Ingreso Ventas?", Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			ldb_porce_ing					= dw_modif_datos.getitemnumber(1,'porc_ing')
			if ls_base='O' then
				UPDATE	"OFERTA_V"  
				SET		"PORCE_ING_CIERRE" = :ldb_porce_ing
				WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
							( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
				USING	sqlca;
			elseif ls_base='A' then
				UPDATE	"ANEXO_AUMENTO"  
				SET		"PORCE_ING_CIERRE" = :ldb_porce_ing
				WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
				USING	sqlca;
			elseif ls_base='L' then
				UPDATE	"ANEXO_LIBERADOR"  
				SET		"PORCE_ING_CIERRE" = :ldb_porce_ing
				WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
				USING	sqlca;	
			end if
			if sqlca.sqlcode=0 then
				commit using sqlca;
				messagebox("Grabar",'Grabación Exitosa "Porcentaje Ingreso" '+ls_ctto+' '+ls_serie+'-'+string(ldb_numero))
				ls_graba						= 'S'	
			else
				rollback using sqlca;
				messagebox("Error Grabar",'Error Grabar "Porcentaje Ingreso" '+ls_ctto+' '+ls_serie+'-'+string(ldb_numero))
			end if
		end if
	elseif is_graba_cierre='S' then
		ll_res									= MessageBox("Grabar","¿Desea Grabar Modificación Cierre Ventas?", Exclamation!, YesNo!, 2)
		if ll_res = 1 then
			ldt_cierre_vta					= dw_modif_datos.getitemdatetime(1,'cierre_vta')
			if ls_base='O' then
				UPDATE	"OFERTA_V"  
				SET		"CIERRE_VENTA" = :ldt_cierre_vta
				WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
							( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
				USING	sqlca;
			elseif ls_base='A' then
				UPDATE	"ANEXO_AUMENTO"  
				SET		"CIERRE_VENTA" = :ldt_cierre_vta
				WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
				USING	sqlca;
			elseif ls_base='L' then
				UPDATE	"ANEXO_LIBERADOR"  
				SET		"CIERRE_VENTA" = :ldt_cierre_vta
				WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
							( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
				USING	sqlca;	
			end if
			if sqlca.sqlcode=0 then
				commit using sqlca;
				messagebox("Grabar",'Grabación Exitosa "Cierre Ventas" '+ls_ctto+' '+ls_serie+'-'+string(ldb_numero))
				ls_graba						= 'S'	
			else
				rollback using sqlca;
				messagebox("Error Grabar",'Error Grabar "Cierre Ventas" '+ls_ctto+' '+ls_serie+'-'+string(ldb_numero))
			end if
		end if	
		
	elseif is_graba_deveng='S' then
		if ls_serie<>'R' then
			DELETE FROM	"COMISION_PERSISTENCIA"  
				WHERE	( "COMISION_PERSISTENCIA"."BASE" = :ls_base ) AND  
							( "COMISION_PERSISTENCIA"."SERIE" = :ls_serie ) AND  
							( "COMISION_PERSISTENCIA"."NUMERO" = :ldb_numero )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit using sqlca;
			else
				rollback using sqlca;
			end if
		end if
		cb_grabar.triggerevent(clicked!)
		if il_tot_reg>0 then
			if il_indi=il_tot_reg then
				ls_graba						= 'S'	
				messagebox("Grabar","Grabación Exitosa")
			end if
		end if
	elseif is_graba_comi='S' then
		ldt_fec_fin							= datetime(date(em_termino.text),time('00:00:00'))
		ls_cod_cont							= '089'
		DECLARE x1 CURSOR FOR
		SELECT	"COD_AGE_SUP",	"RUT",	"MONT_AGE_SUP",	"COD_CONTABLE",	"MES",		"PORC_ING_CAJA",	"PORC_VENTA",	"PRECIO",	"TOTAL_PAGO",	"VALOR_UF",	"MONEDA",	"CODIGO_COM",	"ESTADO_AGE_SUP",	"COD_PARQUE"  
   		FROM		"RES_COMI"  
   		WHERE	( "RES_COMI"."SERIE" = :ls_serie ) AND  
         			( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
         			( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
         			( "RES_COMI"."FECHA" = :ldt_fec_fin )
		USING	Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			DO WHILE Trans_1.sqlcode=0
			fetch x1 INTO	:ls_cod_age,:ll_rut,:ll_monto,:ls_cod_cont,:ls_mes_c,:ldb_p_ing_caj,:ldb_porc_vta,:ldb_precio,:ldb_total_pag,:ldb_valor_uf,:ls_moneda,:ls_cod_com,:ls_est_age,:ll_cod_parque;
				if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ldb_total_pag) and ldb_total_pag>0 then		
					f_log_graba_res_comi(ls_cod_age,ll_rut,ll_monto,ls_cod_cont,ls_mes_c,ldt_fec_fin,ldb_numero,ls_serie,ldb_p_ing_caj,ldb_porc_vta,ldb_precio,ldb_total_pag,ldb_valor_uf,'H',ls_moneda,ls_cod_com,ls_est_age,ls_base,ll_cod_parque)
				end if
				setnull(ls_cod_age);setnull(ll_rut);setnull(ll_monto);setnull(ls_mes_c);setnull(ldb_p_ing_caj);setnull(ldb_porc_vta);&
				setnull(ldb_precio);setnull(ldb_total_pag);setnull(ldb_valor_uf);setnull(ls_moneda);setnull(ls_cod_com);setnull(ls_est_age);setnull(ll_cod_parque)
			LOOP
		end if
		close x1;
		DELETE FROM	"RES_COMI"  
   		WHERE	( "RES_COMI"."SERIE" = :ls_serie ) AND  
         			( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
         			( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
         			( "RES_COMI"."FECHA" = :ldt_fec_fin )
		USING	Trans_2;
		if Trans_2.sqlcode=0 then
			commit using Trans_2;
		else
			rollback using Trans_2;
		end if
		cb_grabar.triggerevent(clicked!)
		if il_tot_reg>0 then
			if il_indi=il_tot_reg then
				messagebox("Grabar","Grabación Exitosa")
				ls_graba						= 'S'	
			end if
		end if
	elseif is_graba_persist='S' then
		cb_grabar.triggerevent(clicked!)
		if il_tot_reg>0 then
			if il_indi=il_tot_reg then
				messagebox("Grabar","Grabación Exitosa")
				ls_graba						= 'S'	
			end if
		end if		
	end if
	if ls_graba='S' then
		wf_itemchanged('numero')
		is_graba_cierre						= 'N'
		is_graba_clas						= 'N'
		is_graba_ingr						= 'N'
		is_graba_deveng					= 'N'
		is_graba_comi						= 'N'
		is_graba_persist					= 'N'
	end if
end if
end event

type cbx_porc_ing from checkbox within w_comision_proceso
integer x = 3168
integer y = 884
integer width = 626
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Porcentaje Ingreso"
end type

event clicked;string	ls_clas_new,ls_base,ls_serie
long	ll_tot_reg,ll_res,ll_res2
double	ldb_numero,ldb_precio,ldb_monto,ldb_porce_cierre
datetime	ldt_fec_cierre

ll_tot_reg																		= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base																		= dw_modif_datos.getitemstring(1,'base')
	ls_serie																		= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero																	= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if cbx_porc_ing.checked=true then
			ll_res																	= MessageBox("Modificar","¿Desea Modificar Porcentaje Ingreso de la Venta?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				ll_res2															=  MessageBox("Modificar","¿Desea Calcular Porcentaje Ingreso?", Exclamation!, YesNo!, 2)	
				if ll_res2=1 then
					SELECT	"PRECIO_PESO",	"CIERRE_VENTA"
					INTO		:ldb_precio,			:ldt_fec_cierre
					FROM 	"VISTA_PRODUCC_MENSUAL"  
					WHERE	( "VISTA_PRODUCC_MENSUAL"."BASE" = :ls_base ) AND  
								( "VISTA_PRODUCC_MENSUAL"."SERIE" = :ls_serie ) AND  
								( "VISTA_PRODUCC_MENSUAL"."NUMERO" = :ldb_numero  )
					USING	sqlca;
					if isnull(ldb_precio) then ldb_precio=0
					
					ldb_monto													= f_monto_ingr_cierre(ls_base,ls_serie,ldb_numero,ldt_fec_cierre)
					ldb_porce_cierre											= round((ldb_monto / ldb_precio) * 100,2)
					dw_modif_datos.setitem(1,"porc_ing",ldb_porce_cierre)
					dw_modif_datos.accepttext()
					is_graba_ingr												= 'S'
					
				else
					ll_res2														=   MessageBox("Modificar","¿Desea Digitar Porcentaje Ingreso?", Exclamation!, YesNo!, 2)	
					if ll_res2=1 then
						idb_porce_ing											= dw_modif_datos.getitemnumber(1,'porc_ing')
						dw_modif_datos.object.porc_ing.protect			= 0
						dw_modif_datos.setitem(1,'porc_ing',0)
						dw_modif_datos.accepttext()
						is_graba_ingr											= 'S'
					end if
				end if
			else
				cbx_porc_ing.checked											= false
			end if
		elseif cbx_porc_ing.checked=false then
			ll_res																	= MessageBox("Modificar","¿Desea Volver a Porcentaje Ingreso Guardado?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				dw_modif_datos.setitem(1,'porc_ing',idb_porce_ing)
				dw_modif_datos.object.porc_ing.protect					= 1
				dw_modif_datos.accepttext()
				is_graba_ingr													= 'N'
			else
				cbx_porc_ing.checked											= true
			end if
		end if
	end if
end if
end event

type cbx_persist from checkbox within w_comision_proceso
integer x = 3163
integer y = 1160
integer width = 626
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Monto Persistencia"
end type

event clicked;string		ls_clas_new,ls_base,ls_serie,ls_cod_cont,ls_cod_age,ls_mes_c,ls_moneda,ls_cod_com,ls_est_age
long		ll_tot_reg,ll_res,ll_tot_ctto,ll_rut,ll_monto,ll_cod_parque
datetime	ldt_fec_fin
double	ldb_numero,ldb_p_ing_caj,ldb_porc_vta,ldb_precio,ldb_total_pag,ldb_valor_uf

ll_tot_reg															= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base															= dw_modif_datos.getitemstring(1,'base')
	ls_serie															= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero														= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if cbx_persist.checked=true then
			ll_res														= MessageBox("Modificar","¿Desea Modificar Montos Persistencia por Venta?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_base												= ls_base
				is_serie												= ls_serie
				idb_numero											= ldb_numero
				is_graba_persist									= 'S'
				ldt_fec_fin											= datetime(date(em_termino.text),time('00:00:00'))
				ls_cod_cont											= '090'
				DECLARE x1 CURSOR FOR
				SELECT	"COD_AGE_SUP",	"RUT",	"MONT_AGE_SUP",	"COD_CONTABLE",	"MES",		"PORC_ING_CAJA",	"PORC_VENTA",	"PRECIO",	"TOTAL_PAGO",	"VALOR_UF",	"MONEDA",	"CODIGO_COM",	"ESTADO_AGE_SUP",	"COD_PARQUE"  
				FROM		"RES_COMI"  
				WHERE	( "RES_COMI"."SERIE" = :ls_serie ) AND  
							( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
							( "RES_COMI"."FECHA" = :ldt_fec_fin )
				USING	Trans_1;
				open x1;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
					fetch x1 INTO	:ls_cod_age,:ll_rut,:ll_monto,:ls_cod_cont,:ls_mes_c,:ldb_p_ing_caj,:ldb_porc_vta,:ldb_precio,:ldb_total_pag,:ldb_valor_uf,:ls_moneda,:ls_cod_com,:ls_est_age,:ll_cod_parque;
						if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ldb_total_pag) and ldb_total_pag>0 then		
							f_log_graba_res_comi(ls_cod_age,ll_rut,ll_monto,ls_cod_cont,ls_mes_c,ldt_fec_fin,ldb_numero,ls_serie,ldb_p_ing_caj,ldb_porc_vta,ldb_precio,ldb_total_pag,ldb_valor_uf,'H',ls_moneda,ls_cod_com,ls_est_age,ls_base,ll_cod_parque)
						end if
						setnull(ls_cod_age);setnull(ll_rut);setnull(ll_monto);setnull(ls_mes_c);setnull(ldb_p_ing_caj);setnull(ldb_porc_vta);&
						setnull(ldb_precio);setnull(ldb_total_pag);setnull(ldb_valor_uf);setnull(ls_moneda);setnull(ls_cod_com);setnull(ls_est_age);setnull(ll_cod_parque)
					LOOP
				end if
				close x1;
				DELETE FROM	"RES_COMI"  
				WHERE	( "RES_COMI"."SERIE" = :ls_serie ) AND  
							( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
							( "RES_COMI"."FECHA" = :ldt_fec_fin )
				USING	Trans_2;
				if Trans_2.sqlcode=0 then
					commit using Trans_2;
				else
					rollback using Trans_2;
				end if
				w_comision_proceso.height						= 2352
				gf_centrar(w_comision_proceso)
				dw_proceso.visible								= true
				cb_premio_090.triggerevent(clicked!)
			else
				cbx_persist.checked=false
			end if
		elseif cbx_persist.checked=false then
			ll_res														= MessageBox("Modificar","¿Desea Volver a Montos Pagados Anteriormente?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_graba_persist									= 'N'
			else
				cbx_persist.checked								= true
			end if
		end if
	end if
end if
end event

type cbx_comis from checkbox within w_comision_proceso
integer x = 3168
integer y = 1092
integer width = 626
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Monto Comisiones"
end type

event clicked;string		ls_clas_new,ls_base,ls_serie,ls_cod_cont,ls_cod_age,ls_mes_c,ls_moneda,ls_cod_com,ls_est_age
long		ll_tot_reg,ll_res,ll_tot_ctto,ll_rut,ll_monto,ll_cod_parque
datetime	ldt_fec_fin
double	ldb_numero,ldb_p_ing_caj,ldb_porc_vta,ldb_precio,ldb_total_pag,ldb_valor_uf

ll_tot_reg															= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base															= dw_modif_datos.getitemstring(1,'base')
	ls_serie															= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero														= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if cbx_comis.checked=true then
			ll_res														= MessageBox("Modificar","¿Desea Modificar Montos Comisión por Venta?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_base												= ls_base
				is_serie												= ls_serie
				idb_numero											= ldb_numero
				is_graba_comi										= 'S'
				ldt_fec_fin											= datetime(date(em_termino.text),time('00:00:00'))
				ls_cod_cont											= '089'
				DECLARE x1 CURSOR FOR
				SELECT	"COD_AGE_SUP",	"RUT",	"MONT_AGE_SUP",	"COD_CONTABLE",	"MES",		"PORC_ING_CAJA",	"PORC_VENTA",	"PRECIO",	"TOTAL_PAGO",	"VALOR_UF",	"MONEDA",	"CODIGO_COM",	"ESTADO_AGE_SUP",	"COD_PARQUE"  
				FROM		"RES_COMI"  
				WHERE	( "RES_COMI"."SERIE" = :ls_serie ) AND  
							( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
							( "RES_COMI"."FECHA" = :ldt_fec_fin )
				USING	Trans_1;
				open x1;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
					fetch x1 INTO	:ls_cod_age,:ll_rut,:ll_monto,:ls_cod_cont,:ls_mes_c,:ldb_p_ing_caj,:ldb_porc_vta,:ldb_precio,:ldb_total_pag,:ldb_valor_uf,:ls_moneda,:ls_cod_com,:ls_est_age,:ll_cod_parque;
						if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ldb_total_pag) and ldb_total_pag>0 then		
							f_log_graba_res_comi(ls_cod_age,ll_rut,ll_monto,ls_cod_cont,ls_mes_c,ldt_fec_fin,ldb_numero,ls_serie,ldb_p_ing_caj,ldb_porc_vta,ldb_precio,ldb_total_pag,ldb_valor_uf,'H',ls_moneda,ls_cod_com,ls_est_age,ls_base,ll_cod_parque)
						end if
						setnull(ls_cod_age);setnull(ll_rut);setnull(ll_monto);setnull(ls_mes_c);setnull(ldb_p_ing_caj);setnull(ldb_porc_vta);&
						setnull(ldb_precio);setnull(ldb_total_pag);setnull(ldb_valor_uf);setnull(ls_moneda);setnull(ls_cod_com);setnull(ls_est_age);setnull(ll_cod_parque)
					LOOP
				end if
				close x1;
				DELETE FROM	"RES_COMI"  
				WHERE	( "RES_COMI"."SERIE" = :ls_serie ) AND  
							( "RES_COMI"."CONTRATO" = :ldb_numero ) AND  
							( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
							( "RES_COMI"."FECHA" = :ldt_fec_fin )
				USING	Trans_2;
				if Trans_2.sqlcode=0 then
					commit using Trans_2;
				else
					rollback using Trans_2;
				end if
				w_comision_proceso.height						= 2352
				gf_centrar(w_comision_proceso)
				dw_proceso.visible								= true
				cb_comi_089.triggerevent(clicked!)
			else
				cbx_comis.checked=false
			end if
		elseif cbx_comis.checked=false then
			ll_res														= MessageBox("Modificar","¿Desea Volver a Montos Pagados Anteriormente?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_graba_comi										= 'N'
			else
				cbx_comis.checked								= true
			end if
		end if
	end if
end if
end event

type cbx_deveng from checkbox within w_comision_proceso
integer x = 3168
integer y = 1024
integer width = 626
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Porcentajes Comis."
end type

event clicked;string	ls_clas_new,ls_base,ls_serie
long	ll_tot_reg,ll_res,ll_tot_ctto
double	ldb_numero

ll_tot_reg															= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base															= dw_modif_datos.getitemstring(1,'base')
	ls_serie															= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero														= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if cbx_deveng.checked=true then
			ll_res														= MessageBox("Modificar","¿Desea Modificar Devengamiento Comisión por Venta?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_base												= ls_base
				is_serie												= ls_serie
				idb_numero											= ldb_numero
				is_graba_deveng									= 'S'
				w_comision_proceso.height						= 2352
				gf_centrar(w_comision_proceso)
				dw_proceso.visible								= true
				if ls_serie='R' then
					cb_crea_deveng_reprog.triggerevent(clicked!)
				else
					cb_crea_deveng.triggerevent(clicked!)
				end if
			else
				cbx_deveng.checked=false
			end if
		elseif cbx_deveng.checked=false then
			ll_res														= MessageBox("Modificar","¿Desea Volver a Porcentaje Ingreso Guardado?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_graba_deveng									= 'N'
			else
				cbx_deveng.checked								=true
			end if
		end if
	end if
end if
end event

type cbx_clasif from checkbox within w_comision_proceso
integer x = 3168
integer y = 952
integer width = 626
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Clasificación"
end type

event clicked;string	ls_clas_new,ls_base,ls_serie
long	ll_tot_reg,ll_res
double	ldb_numero

ll_tot_reg					= dw_modif_datos.rowcount()
if ll_tot_reg>0 then
	ls_base					= dw_modif_datos.getitemstring(1,'base')
	ls_serie					= dw_modif_datos.getitemstring(1,'serie')
	ldb_numero				= dw_modif_datos.getitemnumber(1,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		if cbx_clasif.checked=true then
			ll_res						= MessageBox("Modificar","¿Desea Modificar Clasificación Ventas?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				is_clas_act			= dw_modif_datos.getitemstring(1,'clasif')
				ls_clas_new			= dw_modif_datos.getitemstring(1,'new_clas')
				dw_modif_datos.setitem(1,'clasif',ls_clas_new)
				dw_modif_datos.accepttext()
				is_graba_clas		= 'S'
			else
				cbx_clasif.checked=false
			end if
		elseif cbx_clasif.checked=false then
			ll_res						= MessageBox("Modificar","¿Desea Volver a Clasificación Guardada?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				dw_modif_datos.setitem(1,'clasif',is_clas_act)
				dw_modif_datos.accepttext()
				is_graba_clas		= 'N'
			else
				cbx_clasif.checked=true
			end if
		end if
	end if
end if
end event

type st_2 from statictext within w_comision_proceso
integer x = 110
integer y = 316
integer width = 1307
integer height = 132
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 81324524
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_detalle from commandbutton within w_comision_proceso
integer x = 78
integer y = 904
integer width = 453
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar &Detalle"
end type

event clicked;string	ls_nom

ls_nom									= string(cb_detalle.text)
if ls_nom = 'Ver &Detalle' then
	cb_cta_cte.enabled				= true
	cb_asocia_rut.enabled			= true
	cb_pagos.enabled					= true
	cb_exportar.enabled				= true
	cb_filtrar.enabled					= true
	cb_ordenar.enabled				= true
	cb_cta_cte.enabled				= true
	dw_proceso.enabled				= true
	dw_modif_datos.enabled			= false
	cbx_clasif.enabled					= false
	cbx_deveng.enabled				= false
	cbx_comis.enabled				= false
	cbx_persist.enabled				= false
	cbx_porc_ing.enabled				= false
	w_comision_proceso.height		= 2352
	w_comision_proceso.width		= 3067
	gf_centrar(w_comision_proceso)
	cb_detalle.text						= 'Cerrar &Detalle'
elseif ls_nom = 'Cerrar &Detalle' then
	cb_cta_cte.enabled				= true
	cb_asocia_rut.enabled			= true
	cb_pagos.enabled					= false
	cb_exportar.enabled				= false
	cb_filtrar.enabled					= false
	cb_ordenar.enabled				= false
	cb_cta_cte.enabled				= false
	dw_modif_datos.enabled			= false
	dw_proceso.enabled				= false
	cbx_clasif.enabled					= false
	cbx_deveng.enabled				= false
	cbx_comis.enabled				= false
	cbx_persist.enabled				= false
	cbx_porc_ing.enabled				= false
	w_comision_proceso.height		= 1450
	w_comision_proceso.width		= 3067
	gf_centrar(w_comision_proceso)
	cb_detalle.text						= 'Ver &Detalle'
end if
end event

type cb_modif_datos from commandbutton within w_comision_proceso
integer x = 530
integer y = 904
integer width = 549
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modif.Pag.Comi."
end type

event clicked;string	ls_nom

ls_nom									= string(cb_modif_datos.text)
if ls_nom='Modif.Pag.Comi.' then
	cb_cta_cte.enabled				= true
	cb_asocia_rut.enabled			= true
	cb_pagos.enabled					= true
	cb_exportar.enabled				= true
	cb_filtrar.enabled					= true
	cb_ordenar.enabled				= true
	cb_cta_cte.enabled				= true
	dw_modif_datos.enabled			= true
	dw_proceso.enabled				= false
	cbx_clasif.enabled					= true
	cbx_deveng.enabled					= true
	cbx_comis.enabled					= true
	cbx_persist.enabled					= true
	cbx_porc_ing.enabled				= true
	cb_grabar.enabled					= TRUE
	w_comision_proceso.width		= 4009
	w_comision_proceso.height		= 1500
	gf_centrar(w_comision_proceso)
	cb_limpiar.triggerevent(clicked!)
	cb_modif_datos.text				= 'Cerrar &Datos Modif.'
elseif ls_nom = 'Cerrar &Datos Modif.' then
	cb_cta_cte.enabled				= false
	cb_asocia_rut.enabled			= false
	cb_pagos.enabled					= false
	cb_exportar.enabled				= false
	cb_filtrar.enabled					= false
	cb_ordenar.enabled				= false
	cb_cta_cte.enabled				= false
	dw_modif_datos.enabled			= false
	dw_proceso.enabled				= false
	cbx_clasif.visible					= false
	cbx_deveng.visible					= false
	cbx_comis.visible					= false
	cbx_persist.visible					= false
	cbx_porc_ing.visible				= false
	cbx_clasif.checked					= false
	cbx_deveng.checked				= false
	cbx_comis.checked				= false
	cbx_persist.checked				= false
	cbx_porc_ing.checked				= false
	cb_grabar.enabled					= true
	w_comision_proceso.height		= 1500
	w_comision_proceso.width		= 3067
	gf_centrar(w_comision_proceso)
	dw_modif_datos.reset()
	cb_modif_datos.text				= 'Modif.Pag.Comi.'
	is_graba_deveng					='N'
end if
end event

type st_valor_uf from statictext within w_comision_proceso
integer x = 727
integer y = 212
integer width = 535
integer height = 88
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_comision_proceso
integer x = 242
integer y = 224
integer width = 471
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Valor U.F.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_comision_proceso
integer x = 1550
integer y = 1172
integer width = 690
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Descuento Comisión"
end type

type cb_crea_deveng_reprog from commandbutton within w_comision_proceso
integer x = 1550
integer y = 752
integer width = 690
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Deveng. Contrato Reprog."
end type

event clicked;string		ls_base_o,ls_serie_o,ls_base_r,ls_serie_r,ls_cargo,ls_status_comi,ls_codigo,ls_canal,ls_depto,ls_clas_vta,ls_tipo_dev,&
			ls_est_pers,ls_mes,ls_est_com,ls_pasa='S'
long		ll_tot_reg,ll_indi,ll_malos=0,ll_cont=0,ll_rut
datetime	ldt_fec_fin,ldt_cierre_vta
double	ldb_numero_o,ldb_numero_r,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_porc_caja,ldb_porc_orig,ldb_comi_dif,ldb_porc_orig_pag,ldb_porc_base,&
			ldb_porce_comi,ldb_cpie,ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07,ldb_sum_porc

st_det_proceso.text								= 'Cálculo Devengamiento Reprograciones de Crédito'
dw_proceso.reset()
SetPointer(HourGlass!)
is_grabar											= 'R'
ldt_fec_fin											= datetime(date(em_termino.text),time('00:00:00'))
if isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Proceso")
else
	if is_graba_deveng='N' then
		dw_proceso.dataobject					= 'dw_comision_vtas_equi_deveng_reprog'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg									= dw_proceso.retrieve(ldt_fec_fin)
		is_tipo										= 'P'	
	elseif is_graba_deveng='S' then
		dw_proceso.dataobject					= 'dw_comision_vtas_equi_deveng_reprog_ind'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg									= dw_proceso.retrieve(ldt_fec_fin,is_base,is_serie,idb_numero)
		is_tipo										= 'I'	
	end if
	hpb_1.Position									= ldb_tot_porc
	if ll_tot_reg >0 then
		for ll_indi=1 to ll_tot_reg
			ls_base_o								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_base_original')
			ls_serie_o								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_serie_original')
			ldb_numero_o								= dw_proceso.getitemnumber(ll_indi,'vista_comis_reprog_numero_original')
			ll_rut										= dw_proceso.getitemnumber(ll_indi,'vista_comis_reprog_rut')
			ls_base_r								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_base')
			ls_serie_r								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_serie')
			ldb_numero_r								= dw_proceso.getitemnumber(ll_indi,'vista_comis_reprog_numero')
			ls_cargo									= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_cargo')
			ldt_cierre_vta							= dw_proceso.getitemdatetime(ll_indi,'vista_comis_reprog_cierre_venta')
			ls_status_comi							= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_estatus_comision')
			ls_codigo									= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_cod_age')
			ls_canal									= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_canal')
			ldb_porc_caja							= dw_proceso.getitemnumber(ll_indi,'porce_pago')
			ls_depto									= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_depto')
			ls_clas_vta								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_clasifica_venta')
			ldb_porc_orig							= dw_proceso.getitemnumber(ll_indi,'vista_comis_reprog_porce_venta')
			ls_est_com								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_estado_comi')
			ls_est_pers								= dw_proceso.getitemstring(ll_indi,'vista_comis_reprog_estado_persist_age')
			if isnull(ls_clas_vta) or ls_clas_vta='' then
				ls_clas_vta							= f_clas_promesa(ls_base_o,ls_serie_o,ldb_numero_o)
				if isnull(ls_clas_vta) or ls_clas_vta='' then
					messagebox("Advertencia",'Promesa '+ls_base_o+'-'+ls_serie_o+'-'+string(ldb_numero_o)+' No Registra Clasificación')
				end if
			end if
			if ls_cargo='A' then 
				if ldt_cierre_vta>=datetime(date(string('28/02/2013')),time('00:00:00')) then
					if ls_status_comi='3' then
						ls_tipo_dev					= 'AA' //comision_antigua
						ldb_porc_base				= idb_porcentaje
					else
						ls_tipo_dev					= 'AN' //comision_nueva
						ldb_porc_base				= idb_porce_age
					end if
				else
					ls_tipo_dev						= 'AA' //comision_antigua
					ldb_porc_base					= idb_porcentaje
				end if
			elseif ls_cargo='S' then
				ldb_porc_base						= idb_porcentaje
				if ldt_cierre_vta>=datetime(date(string('28/02/2013')),time('00:00:00')) then
					ls_tipo_dev						= 'SN' //comision_nueva
				else
					ls_tipo_dev						= 'SA' //comision_antigua
				end if
			elseif ls_cargo='J' then
				ldb_porc_base						= idb_porcentaje
				if ldt_cierre_vta>=datetime(date(string('28/02/2013')),time('00:00:00')) then
					ls_tipo_dev						= 'JN' //comision_nueva
				else
					ls_tipo_dev						= 'JA' //comision_antigua
				end if	
			end if
					
			if (ls_tipo_dev='AA' or ls_tipo_dev='SA' or ls_tipo_dev='JA') and ldb_porc_caja>=ldb_porc_base then
				ldb_porc_orig_pag					= wf_porc_comi_pagado(ls_tipo_dev,ls_serie_o,ldb_numero_o,ls_codigo,ls_base_o)
				ldb_comi_dif						= ldb_porc_orig - ldb_porc_orig_pag
				//wf_actualiz_est_comi(ls_cargo,ls_serie_o,ll_numero_o,'P','P','C') //actualiza_contrato_original
				if ldb_comi_dif>0 then
					ldb_cta_01=0;
					ldb_cta_02=0;
					ldb_cta_03=0;
					ldb_cta_04=0;
					ldb_cta_05=0;
					ldb_cta_06=0;
					ldb_cta_07=0
					if f_graba_dev_persist(ls_base_r,ls_serie_r,ldb_numero_r,ls_cargo,ls_canal,ldb_comi_dif,ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07,'A')= -1 then
						ll_malos++
					else
						ll_cont++
					end if
				end if
			elseif (ls_tipo_dev='AN' or ls_tipo_dev='SN' or ls_tipo_dev='JN') then
				//wf_actualiz_est_comi(ls_cargo,ls_serie_o,ll_numero_o,'P','P','P') //actualiza_contrato_original
				SELECT	"PORCE_COMI",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA"
				INTO		:ldb_cpie,				:ldb_cta_01,		:ldb_cta_02,		:ldb_cta_03,		:ldb_cta_04,		:ldb_cta_05,		:ldb_cta_06,	:ldb_cta_07
				FROM		"COMISION_PERSISTENCIA"  
				WHERE	( "COMISION_PERSISTENCIA"."BASE" = :ls_base_o  ) AND  
							( "COMISION_PERSISTENCIA"."SERIE" = :ls_serie_o ) AND  
							( "COMISION_PERSISTENCIA"."NUMERO" = :ldb_numero_o ) AND  
							( "COMISION_PERSISTENCIA"."CARGO" = :ls_cargo )
				USING	sqlca;
				if sqlca.sqlcode<>0 then
					ls_pasa									= 'N'
					SELECT	"CE"."PORCE_VTA",	"PP"."C_PRIMERA",	"PP"."C_SEGUNDA",	"PP"."C_TERCERA",	"PP"."C_CUARTA",	"PP"."C_QUINTA",	"PP"."C_SEXTA",	"PP"."C_SEPTIMA"
					INTO		:ldb_cpie,					:ldb_cta_01,				:ldb_cta_02,				:ldb_cta_03,				:ldb_cta_04,			:ldb_cta_05,		:	ldb_cta_06,			:ldb_cta_07
					FROM		"COMISIONES_VTA_EQUIVAL" "CE",
								"PORCENTAJE_PREMIO_PERSISTENCIA" "PP"    
					WHERE	( "CE"."CARGO" = "PP"."CARGO" ) and  
								( "CE"."CANAL" = "PP"."CANAL" ) and  
								( "CE"."CLASIF_VTA" = "PP"."CLASIF" ) and  
								( "CE"."BASE" = "PP"."BASE" ) and  
								( "CE"."ESTADO" = "PP"."ESTADO" ) and  
								( ( "CE"."BASE" = :ls_base_o ) AND  
								( "CE"."CARGO" = :ls_cargo ) AND  
								( "CE"."CANAL" = :ls_canal ) AND  
								( "CE"."CLASIF_VTA" = :ls_clas_vta ) )
					USING	sqlca;
					if sqlca.sqlcode<>0 then
						if isnull(ldb_cpie) then 	ldb_cpie=0
						if isnull(ldb_cta_01) then ldb_cta_01=0
						if isnull(ldb_cta_02) then ldb_cta_02=0
						if isnull(ldb_cta_03) then ldb_cta_03=0
						if isnull(ldb_cta_04) then ldb_cta_04=0
						if isnull(ldb_cta_05) then ldb_cta_05=0
						if isnull(ldb_cta_06) then ldb_cta_06=0
						if isnull(ldb_cta_07) then ldb_cta_07=0
					end if
				end if
				ldb_sum_porc							= ldb_cpie+ldb_cta_01+ldb_cta_02+ldb_cta_03+ldb_cta_04+ldb_cta_05+ldb_cta_06+ldb_cta_07
				if ldb_sum_porc>0 then
					if ls_pasa='S' then
						ls_mes							= wf_mes_pagado(ls_serie_o,ldb_numero_o,ls_codigo,ls_cargo,'090')
					else
						ls_mes							= '0'
					end if
					if ls_mes='0' or ls_mes='2' or ls_mes='4' or ls_mes='6' then
						if ls_mes='0' then
							if ls_est_com='P' then
								ldb_cpie					= 0
							end if
							ldb_cpie						= ldb_cpie	
							ldb_cta_01					= ldb_cta_01
							ldb_cta_02					= ldb_cta_02
							ldb_cta_03					= ldb_cta_03
							ldb_cta_04					= ldb_cta_04
							ldb_cta_05					= ldb_cta_05
							ldb_cta_06					= ldb_cta_06
							ldb_cta_07					= ldb_cta_07
						elseif ls_mes='2' then
							ldb_cpie						= 0	
							ldb_cta_01					= 0
							ldb_cta_02					= 0
							ldb_cta_03					= 0
							ldb_cta_04					= ldb_cta_04
							ldb_cta_05					= ldb_cta_05
							ldb_cta_06					= ldb_cta_06
							ldb_cta_07					= ldb_cta_07
						elseif ls_mes='4' then
							ldb_cpie						= 0	
							ldb_cta_01					= 0
							ldb_cta_02					= 0
							ldb_cta_03					= 0
							ldb_cta_04					= 0
							ldb_cta_05					= ldb_cta_05
							ldb_cta_06					= ldb_cta_06
							ldb_cta_07					= ldb_cta_07
						elseif ls_mes='6' then
							ldb_cpie						= 0	
							ldb_cta_01					= 0
							ldb_cta_02					= 0
							ldb_cta_03					= 0
							ldb_cta_04					= 0
							ldb_cta_05					= 0
							ldb_cta_06					= 0
							ldb_cta_07					= ldb_cta_07
						end if 
						if f_graba_dev_persist(ls_base_r,ls_serie_r,ldb_numero_r,ls_cargo,ls_canal,ldb_cpie,ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07,'N')= -1 then
							ll_malos++
						else
							ll_cont++
						end if
					end if
				end if
			end if
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				ldb_tot_porc_aux					= ldb_tot_porc
			end if
			ldb_tot_porc								= (ll_indi * 100) / ll_tot_reg
			hpb_1.Position 							= ldb_tot_porc
			st_porc.text								= string(ldb_tot_porc,'#0.00')+" %"
			st_cuenta.text 							= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
			dw_proceso.accepttext()
		next
		SetPointer(Arrow!)
		messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
										'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
	else
		messagebox("Advertencia","No Registra Datos")
	end if
end if
end event

type cb_2 from commandbutton within w_comision_proceso
boolean visible = false
integer x = 3323
integer y = 2032
integer width = 402
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reprog"
end type

event clicked;//string	ls_cod_age,ls_base,ls_serie,ls_est_ctto,ls_base_orig,ls_serie_orig,ll_numero_orig,&
//			ls_clas_vta
//long		ll_resp,ll_antig,ll_numero,ll_mora,ll_cod_parque,ll_plazo,ll_cta_pag_s,ll_exis,ll_vta_a,ll_vta_b,&
//			ll_tot_vtas,ll_new
//datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_res,ldt_fec_cierre,ldt_cie_vtas_ini,ldt_cie_vtas_fin,ldt_fec_ing,&
//			ldt_fec_ctto,ldt_cie_vtas_orig
//double	ldb_precio,ldb_porce_vta,ldb_porc_com,ldb_porc_adi,ldb_porc_tot,ldb_tot_pag,ldb_pie_pag,ldb_pag_mes,&
//			ldb_porc_pag,ldb_porc_pie,ldb_pie,ldb_cta1,ldb_cta2,ldb_cta3,ldb_cta4,ldb_cta5,ldb_cta6,ldb_new_porc,&
//			ldb_pie_mes
//
//dw_lista.reset()
//ldt_fec_ini																= datetime(date(em_fec_ini.text))
//ldt_fec_fin																= datetime(date(em_fec_fin.text))
//ldt_fec_res																= wf_valida_proceso(ldt_fec_ini,ldt_fec_fin,'DR')
//if not isnull(ldt_fec_res) then
//	messagebox("Advertencia","Proceso Comisión por Reprogramación Se Encuentra Actualizado Con Fecha "+string(ldt_fec_res,'dd/mm/yyyy'))
//else
//	ll_resp																= MessageBox("Advertencia", 'Desea Grabar Proceso Comisión Por Reprogramación', Exclamation!, YesNo!, 2)
//	if ll_resp = 1 then
//		SetPointer(HourGlass!)
//		SELECT	MAX("CIERRE_VENTA")  
//		INTO 		:ldt_fec_cierre
//		FROM		"CIERRE_VENTA"  
//		WHERE		"CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//			if not isnull(ldt_fec_cierre) then
//				SELECT	MAX("CIERRE_VENTA_INI"),MAX("CIERRE_VENTA")  
//				INTO 		:ldt_cie_vtas_ini,:ldt_cie_vtas_fin
//				FROM		"CIERRE_VENTA"  
//				WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fec_cierre
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ldt_cie_vtas_ini) and not isnull(ldt_cie_vtas_fin) then
//						dw_lista.object.titulo02.text				= 'Período de Ventas desde el '+string(ldt_cie_vtas_ini,'dd/mm/yyyy')+' hasta el '+string(ldt_cie_vtas_fin,'dd/mm/yyyy')
//						dw_lista.object.usuario.text				= gs_user
//					end if
//				end if
//			end if
//		end if
//		DECLARE x1 CURSOR FOR
//		SELECT DISTINCT "OFERTA_V_B"."COD_AGE"
//		FROM		"CADENA" "CADENA_A","REPACTA_CREDITO","OFERTA_V" "OFERTA_V_A","CADENA" "CADENA_B","OFERTA_V" "OFERTA_V_B","PAGO_OFERTA","CADENA_MORA"  
//		WHERE 	"CADENA_A"."CODIGO" = "REPACTA_CREDITO"."BASE_ORIGINAL" and  
//					"CADENA_A"."SERIE" = "REPACTA_CREDITO"."SERIE_ORIGINAL" and  
//					"CADENA_A"."NUMERO" = "REPACTA_CREDITO"."NUMERO_ORIGINAL" and  
//					"REPACTA_CREDITO"."SERIE_ORIGINAL" = "OFERTA_V_A"."SERIE" and  
//					"REPACTA_CREDITO"."NUMERO_ORIGINAL" = "OFERTA_V_A"."NRO_OFERTA" and  
//					"REPACTA_CREDITO"."BASE" = "CADENA_B"."CODIGO" and  
//					"REPACTA_CREDITO"."SERIE" = "CADENA_B"."SERIE" and  
//					"REPACTA_CREDITO"."NUMERO" = "CADENA_B"."NUMERO" and  
//					"CADENA_B"."SERIE" = "OFERTA_V_B"."SERIE" and  
//					"CADENA_B"."NUMERO" = "OFERTA_V_B"."NRO_OFERTA" and  
//					"OFERTA_V_B"."SERIE" = "PAGO_OFERTA"."SERIE" and  
//					"OFERTA_V_B"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
//					"CADENA_B"."CODIGO" = "CADENA_MORA"."BASE" and  
//					"CADENA_B"."SERIE" = "CADENA_MORA"."SERIE" and  
//					"CADENA_B"."NUMERO" = "CADENA_MORA"."NUMERO" and  
//					"CADENA_A"."ESTADO" = 'P' AND  
//					"REPACTA_CREDITO"."ESTADO" = 'V' AND  
//					"OFERTA_V_A"."ESTADO_COMI" <> 'P' AND  
//					"CADENA_B"."SERIE" = 'R' AND  
//					("CADENA_B"."ESTADO" = 'V' OR "CADENA_B"."ESTADO" = 'C') AND
//					//"OFERTA_V_B"."COD_AGE" = 'V303' AND //PRUEBA
//					"OFERTA_V_B"."ESTADO_COMI" <> 'P'   
//		ORDER BY	"OFERTA_V_B"."COD_AGE" ASC
//		USING		Trans_1;
//		open x1;
//		if Trans_1.sqlcode=0 then
//			DO WHILE Trans_1.sqlcode=0
//			fetch x1 INTO	:ls_cod_age;
//				if not isnull(ls_cod_age) and ls_cod_age <> '' then
//					SELECT	"AGENTES"."FECHA_INI"  
//					INTO 		:ldt_fec_ing  
//					FROM		"AGENTES"  
//					WHERE		"AGENTES"."COD_AGE" = :ls_cod_age
//					USING		Trans_2;
//					if Trans_2.sqlcode= 0 then
//						if not isnull(ldt_fec_ing)	then
//							ll_antig										= daysafter(date(ldt_fec_ing), date(ldt_fec_fin))
//						else
//							ll_antig										= 0
//						end if
//					else
//						ll_antig											= 0
//					end if
//					DECLARE x2 CURSOR FOR
//					SELECT	"CADENA_B"."CODIGO","CADENA_B"."SERIE","CADENA_B"."NUMERO","CADENA_B"."ESTADO","OFERTA_V_B"."FECHA","PAGO_OFERTA"."PRECIO","CADENA_MORA"."MORA_CRED","CADENA_B"."COD_PARQUE","PAGO_OFERTA"."NRO_CUOTAS","OFERTA_V_A"."PORCE_VENTA","OFERTA_V_A"."CIERRE_VENTA","REPACTA_CREDITO"."BASE_ORIGINAL","REPACTA_CREDITO"."SERIE_ORIGINAL","REPACTA_CREDITO"."NUMERO_ORIGINAL","OFERTA_V_B"."CTA_PAG_S"  
//					FROM		"CADENA" "CADENA_A","REPACTA_CREDITO","OFERTA_V" "OFERTA_V_A","CADENA" "CADENA_B","OFERTA_V" "OFERTA_V_B","PAGO_OFERTA","CADENA_MORA"  
//					WHERE 	"CADENA_A"."CODIGO" = "REPACTA_CREDITO"."BASE_ORIGINAL" and  
//								"CADENA_A"."SERIE" = "REPACTA_CREDITO"."SERIE_ORIGINAL" and  
//								"CADENA_A"."NUMERO" = "REPACTA_CREDITO"."NUMERO_ORIGINAL" and  
//								"REPACTA_CREDITO"."SERIE_ORIGINAL" = "OFERTA_V_A"."SERIE" and  
//								"REPACTA_CREDITO"."NUMERO_ORIGINAL" = "OFERTA_V_A"."NRO_OFERTA" and  
//								"REPACTA_CREDITO"."BASE" = "CADENA_B"."CODIGO" and  
//								"REPACTA_CREDITO"."SERIE" = "CADENA_B"."SERIE" and  
//								"REPACTA_CREDITO"."NUMERO" = "CADENA_B"."NUMERO" and  
//								"CADENA_B"."SERIE" = "OFERTA_V_B"."SERIE" and  
//								"CADENA_B"."NUMERO" = "OFERTA_V_B"."NRO_OFERTA" and  
//								"OFERTA_V_B"."SERIE" = "PAGO_OFERTA"."SERIE" and  
//								"OFERTA_V_B"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
//								"CADENA_B"."CODIGO" = "CADENA_MORA"."BASE" and  
//								"CADENA_B"."SERIE" = "CADENA_MORA"."SERIE" and  
//								"CADENA_B"."NUMERO" = "CADENA_MORA"."NUMERO" and  
//								"CADENA_A"."ESTADO" = 'P' AND  
//								"REPACTA_CREDITO"."ESTADO" = 'V' AND  
//								"OFERTA_V_A"."ESTADO_COMI" <> 'P' AND  
//								"CADENA_B"."SERIE" = 'R' AND  
//								("CADENA_B"."ESTADO" = 'V' OR "CADENA_B"."ESTADO" = 'C') AND  
//								"OFERTA_V_B"."ESTADO_COMI" <> 'P' and 
//								//"CADENA_B"."NUMERO" = 26183 AND //PRUEBA
//								"OFERTA_V_B"."COD_AGE" = :ls_cod_age
//					ORDER BY "OFERTA_V_B"."FECHA"
//					USING		Trans_4;
//					open x2;
//					if Trans_4.sqlcode=0 then
//						DO WHILE Trans_4.sqlcode=0
//						fetch x2 INTO	:ls_base,:ls_serie,:ll_numero,:ls_est_ctto,:ldt_fec_ctto,:ldb_precio,:ll_mora,:ll_cod_parque,:ll_plazo,:ldb_porce_vta,:ldt_cie_vtas_orig,:ls_base_orig,:ls_serie_orig,:ll_numero_orig,:ll_cta_pag_s;
//							if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 then
//								SELECT	count("COMISION_PROMESA"."BASE")  
//								INTO		:ll_exis  
//								FROM		"COMISION_PROMESA"  
//								WHERE 	( "COMISION_PROMESA"."BASE" = :ls_base ) AND  
//											( "COMISION_PROMESA"."SERIE" = :ls_serie ) AND  
//											( "COMISION_PROMESA"."NUMERO" = :ll_numero )
//								USING		Trans_4;
//								if Trans_4.sqlcode=0 then
//									if not isnull(ll_exis) and ll_exis>0 then
//									else
//										ll_vta_a							= f_cta_new_clasif(ls_cod_age,ldt_cie_vtas_orig,ldt_fec_fin,'A') 
//										ll_vta_b							= f_cta_new_clasif(ls_cod_age,ldt_cie_vtas_orig,ldt_fec_fin,'B')
//										ll_tot_vtas						= ll_vta_a + ll_vta_b
//										ldb_porc_com					= 5
//										ldb_porc_adi					= 5
//										ldb_porc_tot					= ldb_porc_adi + ldb_porc_com
//										SELECT	sum("INGRESO"."MONTO")
//										INTO		:ldb_tot_pag
//										FROM		"INGRESO"  
//										WHERE 	( 	"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
//													(	"INGRESO"."BASE" =:ls_base) AND
//													(	"INGRESO"."SERIE" = :ls_serie) AND
//													(	"INGRESO"."CONTRATO" = :ll_numero ) AND
//													( 	"INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'A' or "INGRESO"."TIPO_MOV" = 'I' or "INGRESO"."TIPO_MOV" = 'Q')   
//										USING		Trans_4;
//										if Trans_4.sqlcode=0 then
//											if not isnull(ldb_tot_pag) and ldb_tot_pag>0  then
//												ldb_tot_pag				= ldb_tot_pag
//											else
//												ldb_tot_pag				= 0
//											end if
//										else
//											ldb_tot_pag					= 0
//										end if
//										SELECT	SUM("INGRESO"."MONTO")
//										INTO		:ldb_pie_pag
//										FROM		"INGRESO"  
//										WHERE 	( 	"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
//													(	"INGRESO"."BASE" =:ls_base) AND
//													(	"INGRESO"."SERIE" = :ls_serie) AND
//													(	"INGRESO"."CONTRATO" = :ll_numero ) AND
//													( 	"INGRESO"."TIPO_MOV" = 'A' or "INGRESO"."TIPO_MOV" = 'Q' )   
//										USING		Trans_4;
//										if Trans_4.sqlcode=0 then
//											if not isnull(ldb_pie_pag) and ldb_pie_pag>0 then
//												ldb_pie_pag				= ldb_pie_pag
//											else
//												ldb_pie_pag				= 0
//											end if
//										else
//											ldb_pie_pag					= 0
//										end if
//										ls_clas_vta						= f_new_clasif_prom(ldb_precio,ldb_tot_pag)
//										
//										SELECT	sum("INGRESO"."MONTO")
//										INTO		:ldb_pag_mes
//										FROM		"INGRESO"  
//										WHERE 	(	"INGRESO"."BASE" =:ls_base) AND
//													(	"INGRESO"."SERIE" = :ls_serie) AND
//													(	"INGRESO"."CONTRATO" = :ll_numero ) AND
//													( 	"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini ) AND
//													( 	"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
//													( 	"INGRESO"."TIPO_MOV" = 'E' or "INGRESO"."TIPO_MOV" = 'A' or "INGRESO"."TIPO_MOV" = 'I' or "INGRESO"."TIPO_MOV" = 'Q')   
//										USING		Trans_4;
//										if Trans_4.sqlcode=0 then
//											if not isnull(ldb_pag_mes) and ldb_pag_mes>0  then
//												ldb_pag_mes				= ldb_pag_mes
//											else
//												ldb_pag_mes				= 0
//											end if
//										else
//											ldb_pag_mes					= 0
//										end if
//										SELECT	SUM("RES_COMI"."PORC_VENTA")
//										INTO		:ldb_porc_pag
//										FROM		"RES_COMI"  
//										WHERE	"RES_COMI"."SERIE" = :ls_serie_orig AND 
//													"RES_COMI"."CONTRATO" = :ll_numero_orig and
//													"RES_COMI"."COD_AGE_SUP" = :ls_cod_age and
//													"RES_COMI"."COD_CONTABLE" = '037' and
//													"RES_COMI"."FECHA" < :ldt_fec_fin
//										USING		Trans_4;
//										if Trans_4.sqlcode=0 then
//											if not isnull(ldb_porc_pag) and ldb_porc_pag>0 then
//												ldb_porc_pag			= ldb_porc_pag
//											else
//												ldb_porc_pag			= 0
//											end if
//										else
//											ldb_porc_pag				= 0
//										end if			
//										if ldb_pag_mes>0 then
//											ldb_porc_pie				= round(ldb_pie_pag / ldb_precio * 100,1) //MOFIFICA
//											if ldb_porc_pie < 10 and ldb_pie_pag>=100 then
//												ls_clas_vta				= 'A'
//											end if
//											SELECT	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA"
//											INTO		:ldb_pie,	:ldb_cta1,		:ldb_cta2,		:ldb_cta3,		:ldb_cta4,	:ldb_cta5,	:ldb_cta6
//											FROM 		"PORCENTAJE_COMISIONES"  
//											WHERE		"PORCENTAJE_COMISIONES"."PIE_MIN" <= :ldb_porc_pie AND  
//														"PORCENTAJE_COMISIONES"."PIE_MAX" > :ldb_porc_pie AND
//														"PORCENTAJE_COMISIONES"."CREDITO_MIN" <= :ll_plazo AND
//														"PORCENTAJE_COMISIONES"."CREDITO" > :ll_plazo AND
//														"PORCENTAJE_COMISIONES"."COD_PARQUE" = :ll_cod_parque AND
//														"PORCENTAJE_COMISIONES"."AREA" = :ls_clas_vta AND
//														"PORCENTAJE_COMISIONES"."TOTAL_PORCE" = :ldb_porc_tot
//											USING		Trans_2;
//											if Trans_2.sqlcode=0 then
//												if not isnull(ldb_pie) and not isnull(ldb_cta1) and not isnull(ldb_cta2) and not isnull(ldb_cta3) and &
//													not isnull(ldb_cta4) and not isnull(ldb_cta5) and not isnull(ldb_cta6) then
//													if isnull(ldb_pie) and ldb_pie=0 then ldb_pie=0
//													if isnull(ldb_cta1) and ldb_cta1=0 then ldb_cta1=0
//													if isnull(ldb_cta2) and ldb_cta2=0 then ldb_cta2=0
//													if isnull(ldb_cta3) and ldb_cta3=0 then ldb_cta3=0
//													if isnull(ldb_cta4) and ldb_cta4=0 then ldb_cta4=0
//													if isnull(ldb_cta5) and ldb_cta5=0 then ldb_cta5=0
//													if isnull(ldb_cta6) and ldb_cta6=0 then ldb_cta6=0
//													ldb_new_porc							= round(ldb_pie+ldb_cta1+ldb_cta2+ldb_cta3+ldb_cta4+ldb_cta5+ldb_cta6,1)
//													if ldb_porc_pag>0 then
//														if ldb_pie>0 then
//															if ldb_porc_pag<=ldb_pie then
//																ldb_pie						= ldb_pie - ldb_porc_pag
//															else
//																if ldb_porc_pag<=(ldb_pie + ldb_cta1) then
//																	ldb_cta1					= (ldb_pie + ldb_cta1) - ldb_porc_pag
//																	ldb_pie					= 0
//																else
//																	if ldb_porc_pag<=(ldb_pie + ldb_cta1 + ldb_cta2) then
//																		ldb_cta2				= (ldb_pie + ldb_cta1 + ldb_cta2) - ldb_porc_pag
//																		ldb_pie				= 0
//																		ldb_cta1				= 0
//																	else
//																		if ldb_porc_pag<=(ldb_pie + ldb_cta1 + ldb_cta2 + ldb_cta3) then
//																			ldb_cta3			= (ldb_pie + ldb_cta1 + ldb_cta2 + ldb_cta3) - ldb_porc_pag
//																			ldb_pie			= 0
//																			ldb_cta1			= 0
//																			ldb_cta2			= 0
//																		else
//																			if ldb_porc_pag<=(ldb_pie + ldb_cta1 + ldb_cta2 + ldb_cta3 + ldb_cta4) then
//																				ldb_cta4		= (ldb_pie + ldb_cta1 + ldb_cta2 + ldb_cta3 + ldb_cta4) - ldb_porc_pag
//																				ldb_pie		= 0
//																				ldb_cta1		= 0
//																				ldb_cta2		= 0
//																				ldb_cta3		= 0
//																			else
//																				if ldb_porc_pag<=(ldb_pie + ldb_cta1 + ldb_cta2 + ldb_cta3 + ldb_cta4 + ldb_cta5) then
//																					ldb_cta5	= (ldb_pie + ldb_cta1 + ldb_cta2 + ldb_cta3 + ldb_cta4 + ldb_cta5) - ldb_porc_pag
//																					ldb_pie	= 0
//																					ldb_cta1	= 0
//																					ldb_cta2	= 0
//																					ldb_cta3	= 0
//																					ldb_cta4	= 0
//																				end if
//																			end if
//																		end if
//																	end if
//																end if
//															end if
//														end if
//													end if
//													SELECT	sum("INGRESO"."MONTO")
//													INTO		:ldb_pie_mes
//													FROM		"INGRESO"  
//													WHERE 	(	"INGRESO"."BASE" =:ls_base) AND
//																(	"INGRESO"."SERIE" = :ls_serie) AND
//																(	"INGRESO"."CONTRATO" = :ll_numero ) AND
//																( 	"INGRESO"."FECHA_PAGO" >= :ldt_fec_ini ) AND
//																( 	"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
//																( 	"INGRESO"."TIPO_MOV" = 'A')   
//													USING		Trans_4;
//													if Trans_4.sqlcode=0 then
//														if not isnull(ldb_pie_mes) and ldb_pie_mes>0 then
//															if ldb_pie=0 then
//																ldb_pie						= ldb_cta1
//																ldb_cta1						= ldb_cta2
//																ldb_cta2						= ldb_cta3
//																ldb_cta3						= ldb_cta4
//																ldb_cta4						= ldb_cta5
//																ldb_cta5						= ldb_cta6
//																ldb_cta6						= 0
//																if ldb_cta1=0 then
//																	ldb_cta1					= ldb_cta2
//																	ldb_cta2					= ldb_cta3
//																	ldb_cta3					= ldb_cta4
//																	ldb_cta4					= ldb_cta5
//																	ldb_cta5					= ldb_cta6
//																	ldb_cta6					= 0
//																end if
//															end if
//														else
//															if ldb_cta1=0 then
//																ldb_cta1					= ldb_cta2
//																ldb_cta2					= ldb_cta3
//																ldb_cta3					= ldb_cta4
//																ldb_cta4					= ldb_cta5
//																ldb_cta5					= ldb_cta6
//																ldb_cta6					= 0
//															end if
//														end if
//													end if
//												end if
//											end if
//											ldb_new_porc									= round(ldb_pie+ldb_cta1+ldb_cta2+ldb_cta3+ldb_cta4+ldb_cta5+ldb_cta6,1)
//											ll_new											= dw_lista.insertrow(0)
//											dw_lista.scrolltorow(ll_new)
//											dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
//											dw_lista.setitem(ll_new,"cod_age",ls_cod_age)
//											dw_lista.setitem(ll_new,"nro_cesion",ll_vta_a)
//											dw_lista.setitem(ll_new,"nro_promesa",ll_vta_b)
//											dw_lista.setitem(ll_new,"total_vtas",ll_tot_vtas)
////											dw_lista.setitem(ll_new,"vtas_a_mayor_100",ll_vta_pie_mayor)
////											dw_lista.setitem(ll_new,"sem_vtas",ls_tabla)
//											dw_lista.setitem(ll_new,"tipo_contrato",ls_clas_vta)
//											dw_lista.setitem(ll_new,"fecha_contrato",ldt_fec_ctto)
//											dw_lista.setitem(ll_new,"precio",ldb_precio)
//											dw_lista.setitem(ll_new,"tot_pagado",ldb_tot_pag)
//											dw_lista.setitem(ll_new,"plazo",ll_plazo)
//											dw_lista.setitem(ll_new,"pie_pagado",ldb_pie_pag)
//											dw_lista.setitem(ll_new,"porce_pie",ldb_porc_pie)
//											dw_lista.setitem(ll_new,"porce_comi",ldb_porc_com)
//											dw_lista.setitem(ll_new,"adicional_comi",ldb_porc_adi)
//											dw_lista.setitem(ll_new,"total_comi",ldb_porc_tot)
//											dw_lista.setitem(ll_new,"base",ls_base)
//											dw_lista.setitem(ll_new,"serie",ls_serie)
//											dw_lista.setitem(ll_new,"numero",ll_numero)
//											dw_lista.setitem(ll_new,"pag_mes",ldb_pag_mes)
//											dw_lista.setitem(ll_new,"nro_ctas",ll_cta_pag_s)
//											dw_lista.setitem(ll_new,"monto_comi",ldb_porc_pag) //PORCE
//											dw_lista.setitem(ll_new,"mora_cred",ll_mora)
////											dw_lista.setitem(ll_new,"monto_tot_comi",ldb_monto_tot_comi)
//											dw_lista.setitem(ll_new,"pago_mes_comi",ldb_porc_pag)
//											dw_lista.setitem(ll_new,"c_pie",Round(ldb_pie,2))
//											dw_lista.setitem(ll_new,"c_primera",Round(ldb_cta1,2))
//											dw_lista.setitem(ll_new,"c_segunda",Round(ldb_cta2,2))
//											dw_lista.setitem(ll_new,"c_tercera",Round(ldb_cta3,2))
//											dw_lista.setitem(ll_new,"c_cuarta",Round(ldb_cta4,2))
//											dw_lista.setitem(ll_new,"c_quinta",Round(ldb_cta5,2))
//											dw_lista.setitem(ll_new,"c_sexta",Round(ldb_cta6,2))
//											dw_lista.setitem(ll_new,"total_porce",Round(ldb_new_porc,2))
//											dw_lista.accepttext()
//				/*graba_dev*/			f_graba_deveng(ls_base,ls_serie,ll_numero,ldb_pie,ldb_cta1,ldb_cta2,ldb_cta3,ldb_cta4,ldb_cta5,ldb_cta6,0,0,0,ldt_fec_fin)
//										end if
//									end if
//								end if
//							end if
//							setnull(ls_base);setnull(ls_serie);setnull(ll_numero);setnull(ldb_new_porc);&
//							setnull(ldb_pie);setnull(ldb_cta1);setnull(ldb_cta2);setnull(ldb_cta3);setnull(ldb_cta4);setnull(ldb_cta5);setnull(ldb_cta6)
//						LOOP
//					end if
//					close x2;
//				end if
//				setnull(ls_cod_age)
//			LOOP
//		end if
//		close x1;
//		SetPointer(Arrow!)
//		cb_respaldo.TriggerEvent(Clicked!)
//	end if
//end if
end event

type cb_asocia_rut from commandbutton within w_comision_proceso
integer x = 530
integer y = 784
integer width = 453
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación. * Rut"
end type

event clicked;if is_tipo='P' then
	if dw_proceso.getrow() > 0 then
		if dw_proceso.dataobject='dw_comision_vtas_equi_deveng_reprog' and dw_proceso.rowcount() > 0 then
			gi_rut = dw_proceso.getitemnumber(dw_proceso.getrow(),'vista_comis_reprog_rut')
		else
			gi_rut = dw_proceso.getitemnumber(dw_proceso.getrow(),'rut')
		end if
	end if
elseif is_tipo='I' then
	gi_rut 		= gi_rut
end if
gi_tipo_busqueda = 1
open(w_listado_contratos)
end event

type cb_actualiz_036 from commandbutton within w_comision_proceso
integer x = 2318
integer y = 192
integer width = 617
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Estado Liberadores"
end type

event clicked;string		ls_graba='N',ls_codigo,ls_serie,ls_est_comi,ls_cargo
long		ll_tot_reg,ll_res,ll_graba=0,ll_error=0,ll_tot_age,ll_tot_sup,ll_tot_jef
datetime	ldt_fecha
double	ldb_numero,ldb_tot_porc,ldb_tot_porc_aux

st_det_proceso.text							= 'Actualización Estado Liberadores Contratos Antiguos'
ldt_fecha											= datetime(date(em_termino.text),time('00:00:00'))
if not isnull(ldt_fecha) then
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar Comisión Anexo Liberador Código Contable "036" ?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age
		FROM		"RES_COMI", "ANEXO_LIBERADOR"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					("RES_COMI"."COD_CONTABLE" = '022' or "RES_COMI"."COD_CONTABLE" = '036')  AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"RES_COMI"."SERIE" = 'L' AND
					"ANEXO_LIBERADOR"."ESTADO_COMI"<>'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup
		FROM		"RES_COMI", "ANEXO_LIBERADOR"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					("RES_COMI"."COD_CONTABLE" = '022' or "RES_COMI"."COD_CONTABLE" = '036')  AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND 
					"RES_COMI"."SERIE" = 'L' AND
					"ANEXO_LIBERADOR"."ESTADO_COMI_SUP"<>'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef
		FROM		"RES_COMI", "ANEXO_LIBERADOR"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					("RES_COMI"."COD_CONTABLE" = '022' or "RES_COMI"."COD_CONTABLE" = '036')  AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"RES_COMI"."SERIE" = 'L' AND
					"ANEXO_LIBERADOR"."ESTADO_COMI_JV"<>'P'
		USING	sqlca;
		ll_tot_reg									= ll_tot_age+ll_tot_sup+ll_tot_jef
		if ll_tot_reg>0 then
			ls_graba									= 'S'
		else
			ls_graba									= 'N'
		end if
		if ls_graba='N' then
			messagebox("Advertencia","No Registra Comisión Anexo Liberador Sin Actualizar")
		else
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0			
			hpb_1.Position							= ldb_tot_porc
			DECLARE x1 CURSOR FOR
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A'
			FROM		"RES_COMI", "ANEXO_LIBERADOR"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_AGENTE" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						("RES_COMI"."COD_CONTABLE" = '022' or "RES_COMI"."COD_CONTABLE" = '036')  AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"RES_COMI"."SERIE" = 'L' AND
						"ANEXO_LIBERADOR"."ESTADO_COMI"<>'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S'
			FROM		"RES_COMI", "ANEXO_LIBERADOR"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_SUPER" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						("RES_COMI"."COD_CONTABLE" = '022' or "RES_COMI"."COD_CONTABLE" = '036')  AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"RES_COMI"."SERIE" = 'L' AND
						"ANEXO_LIBERADOR"."ESTADO_COMI_SUP"<>'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J'
			FROM		"RES_COMI", "ANEXO_LIBERADOR"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_JEF" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						("RES_COMI"."COD_CONTABLE" = '022' or "RES_COMI"."COD_CONTABLE" = '036')  AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"RES_COMI"."SERIE" = 'L' AND
						"ANEXO_LIBERADOR"."ESTADO_COMI_JV"<>'P'
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_codigo,	:ls_serie,	:ldb_numero,	:ls_est_comi, :ls_cargo;
					if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						if ls_cargo='A' then
							UPDATE	"ANEXO_LIBERADOR"  
							SET		"ESTADO_COMI" = :ls_est_comi,
										"FECHA_COM" = :ldt_fecha
							WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
										( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
							USING	Trans_1;
						elseif ls_cargo='S' then
							UPDATE	"ANEXO_LIBERADOR"  
							SET		"ESTADO_COMI_SUP" = :ls_est_comi,
										"FECHA_COM" = :ldt_fecha
							WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
										( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
							USING	Trans_1;
						elseif ls_cargo='J' then
							UPDATE	"ANEXO_LIBERADOR"  
							SET		"ESTADO_COMI_JV" = :ls_est_comi,
										"FECHA_COM" = :ldt_fecha
							WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
										( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
							USING	Trans_1;	
						end if
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++	
						else
							rollback using Trans_1;
							ll_error++
							messagebox("Error Grabar","Error Grabar Anexo Liberador "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ls_codigo);setnull(ls_serie);setnull(ldb_numero);setnull(ls_est_comi)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.00')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
					st_cuenta.text 					= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_graba,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				LOOP
			end if
			close x1;
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_tot_reg,'###,###,##0')+' registros grabados con exito~r~n'+&
								'y '+string(ll_error,'###,###,##0')+' registros con problemas.',information!)
			SetPointer(Arrow!)
		end if
	end if
end if
end event

type cb_actualiz_037 from commandbutton within w_comision_proceso
integer x = 2318
integer y = 296
integer width = 617
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Estado Promesas"
end type

event clicked;string		ls_graba='N',ls_codigo,ls_serie,ls_est_comi,ls_cargo
long		ll_tot_reg,ll_res,ll_graba=0,ll_error=0,ll_tot_age,ll_tot_sup,ll_tot_jef
datetime	ldt_fecha
double	ldb_numero,ldb_tot_porc,ldb_tot_porc_aux

st_det_proceso.text							= 'Actualización Estado Promesas Contratos Antiguos'
ldt_fecha											= datetime(date(em_termino.text),time('00:00:00'))
if not isnull(ldt_fecha) then
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar Comisión Promesa Código Contable "037" ?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age
		FROM		"RES_COMI", "OFERTA_V"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037')  AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"RES_COMI"."SERIE" <> 'L' AND
					"OFERTA_V"."ESTADO_COMI"<>'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup
		FROM		"RES_COMI", "OFERTA_V"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037')  AND
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"RES_COMI"."SERIE" <> 'L' AND
					"OFERTA_V"."ESTADO_COMI_SUP"<>'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef
		FROM		"RES_COMI", "OFERTA_V"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037')  AND
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"RES_COMI"."SERIE" <> 'L' AND
					"OFERTA_V"."ESTADO_COMI_JV"<>'P'
		USING	sqlca;
		ll_tot_reg									= ll_tot_age+ll_tot_sup+ll_tot_jef
		if ll_tot_reg>0 then
			ls_graba									= 'S'
		else
			ls_graba									= 'N'
		end if
		if ls_graba='N' then
			messagebox("Advertencia","No Registra Comisión Promesa Sin Actualizar")
		else
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0			
			hpb_1.Position							= ldb_tot_porc
			DECLARE x1 CURSOR FOR
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A'
			FROM		"RES_COMI", "OFERTA_V"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037')  AND
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"RES_COMI"."SERIE" <> 'L' AND
						"OFERTA_V"."ESTADO_COMI"<>'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S'
			FROM		"RES_COMI", "OFERTA_V"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037')  AND
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"RES_COMI"."SERIE" <> 'L' AND
						"OFERTA_V"."ESTADO_COMI_SUP"<>'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J'
			FROM		"RES_COMI", "OFERTA_V"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037')  AND
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"RES_COMI"."SERIE" <> 'L' AND
						"OFERTA_V"."ESTADO_COMI_JV"<>'P'
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_codigo,	:ls_serie,	:ldb_numero,	:ls_est_comi, :ls_cargo;
					if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						if ls_cargo='A' then
							UPDATE	"OFERTA_V"  
							SET		"ESTADO_COMI" = :ls_est_comi,
										"FECHA_COM" = :ldt_fecha
							WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
										( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
							USING	Trans_1;
						elseif ls_cargo='S' then
							UPDATE	"OFERTA_V"  
							SET		"ESTADO_COMI_SUP" = :ls_est_comi,
										"FECHA_COM" = :ldt_fecha
							WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
										( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
							USING	Trans_1;
						elseif ls_cargo='J' then
							UPDATE	"OFERTA_V"  
							SET		"ESTADO_COMI_JV" = :ls_est_comi,
										"FECHA_COM" = :ldt_fecha
							WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
										( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
							USING	Trans_1;	
						end if
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++	
						else
							rollback using Trans_1;
							ll_error++
							messagebox("Error Grabar","Error Grabar Promesa "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ls_codigo);setnull(ls_serie);setnull(ldb_numero);setnull(ls_est_comi)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.00')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
					st_cuenta.text 					= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'  Reg. Cálculados '+string(ll_graba,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				LOOP
			end if
			close x1;
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_tot_reg,'###,###,##0')+' registros grabados con exito~r~n'+&
								'y '+string(ll_error,'###,###,##0')+' registros con problemas.',information!)
			SetPointer(Arrow!)
		end if
	end if
end if
end event

type cb_comi_036 from commandbutton within w_comision_proceso
integer x = 1541
integer y = 192
integer width = 690
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Comisión Liberadores"
end type

event clicked;string		ls_base,ls_haber,ls_cod_cont_age,ls_cod_cont_sup,ls_moneda,ls_cod_age,ls_cod_jef,ls_cod_sup,ls_est_com_age,ls_est_com_sup,&
			ls_serie,ls_est_age,ls_est_sup,ls_est_jef,ls_tipo_cont
long		ll_cod_parque,ll_res,ll_tot_reg,ll_indi,ll_rut_age,ll_rut_sup,ll_rut_jef,ll_plazo,ll_cta_pag_s1,ll_cta_pag_s,ll_mora,&
			ll_cont=0,ll_malos=0,ll_indi2,ll_delta_cta_comi,ll_cta_comi
datetime	ldt_fec_fin,ldb_fec_prim,ldb_fec_ult,ldt_fec_cierre,ldt_fec_vto
double	ldb_contrato,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_valor_uf,ldb_precio,ldb_porc_sup,ldb_porc_jef,ldb_pie_pag,ldb_tot_pag,ldb_val_cta,ldb_pie,ldb_porc_acum,ldb_com_age,&
			ldb_monto,ldb_porc_ing,ldb_com_sup,ldb_com_jef,ldb_c_pie,ldb_cta1,ldb_cta2,ldb_cta3,ldb_cta4,ldb_cta5,ldb_cta6,ldb_porc_age,ldb_porc


cb_grabar.visible												= true	
st_det_proceso.text											= 'Cálculo Liberadores Contratos Antiguos'
dw_proceso.dataobject										= 'dw_premios_cont_33_lib'
dw_proceso.settransobject(sqlca)
dw_proceso.reset()
ldt_fec_fin														= datetime(date(em_termino.text),time('00:00:00'))
hpb_1.Position													= ldb_tot_porc
ls_haber            												= 'H'
ls_cod_cont_age							    					= '036'
ls_cod_cont_sup												= '022'
SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
		ldb_valor_uf												= ldb_valor_uf
	else
		messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
	end if
else
	messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
end if
if ldb_valor_uf>0 then
	ll_res															= messagebox(gs_app_name,'El proceso de calculo de comisiones, se tardara algunos minutos.~n~r¿ Desea continuar ?',information!,yesno!,1)		
	if  ll_res = 1 then
		setpointer(HourGlass!)
		ll_tot_reg												= dw_proceso.retrieve(ldt_fec_fin)
		if ll_tot_reg >0 then
			for ll_indi=1 to dw_proceso.rowcount() step 1
				ls_base											= 'L'
				ls_moneda										= dw_proceso.getitemstring(ll_indi,'pago_liberador_moneda')
				ls_cod_age										= dw_proceso.getitemstring(ll_indi,'anexo_liberador_cod_agente')
				ls_cod_jef										= dw_proceso.getitemstring(ll_indi,'anexo_liberador_cod_jef')
				ls_cod_sup										= dw_proceso.getitemstring(ll_indi,'anexo_liberador_cod_super')	
				ls_est_com_age								= dw_proceso.getitemstring(ll_indi,'anexo_liberador_estado_comi')	
				ls_est_com_sup								= dw_proceso.getitemstring(ll_indi,'anexo_liberador_estado_comi_sup')
				ls_serie											= dw_proceso.getitemstring(ll_indi,'comision_promesa_serie')	
				ls_est_age										= dw_proceso.getitemstring(ll_indi,'agentes_estado')
				ls_est_sup										= dw_proceso.getitemstring(ll_indi,'supervisor_estado')
				ls_est_jef										= dw_proceso.getitemstring(ll_indi,'jefe_ventas_estado')
				ls_tipo_cont										= dw_proceso.getitemstring(ll_indi,'agentes_tipo_cont')
				ldb_precio										= dw_proceso.getitemnumber(ll_indi,'pago_liberador_precio')
				ldb_contrato										= dw_proceso.getitemnumber(ll_indi,'comision_promesa_numero')	
				ldb_porc_sup									= dw_proceso.getitemnumber(ll_indi,'supervisor_porc_supervisor')//anexo_liberador_porce_sup')
				ldb_porc_jef										= dw_proceso.getitemnumber(ll_indi,'jefe_ventas_porc_jefe_vta')
				ll_rut_age										= dw_proceso.getitemnumber(ll_indi,'agentes_rut')
				ll_rut_sup										= dw_proceso.getitemnumber(ll_indi,'supervisor_rut')
				ll_rut_jef											= dw_proceso.getitemnumber(ll_indi,'jefe_ventas_rut')
				ll_plazo											= dw_proceso.getitemnumber(ll_indi,'pago_liberador_nro_cuotas')
				ll_cta_pag_s1									= dw_proceso.getitemnumber(ll_indi,'anexo_liberador_cta_pag_m')	
				ldb_pie_pag										= dw_proceso.getitemnumber(ll_indi,'pago_liberador_pie_pagado')	
				ldb_tot_pag										= dw_proceso.getitemnumber(ll_indi,'anexo_liberador_tot_pagado')
				ldb_fec_prim									= dw_proceso.getitemdatetime(ll_indi,'pago_liberador_fecha_prim')
				ldb_fec_ult										= dw_proceso.getitemdatetime(ll_indi,'pago_liberador_fecha_ult')
				ldb_val_cta										= dw_proceso.getitemnumber(ll_indi,'pago_liberador_valor_cuota')	
				ldb_pie											= dw_proceso.getitemnumber(ll_indi,'pago_liberador_pie')
				ldt_fec_cierre									= dw_proceso.getitemdatetime(ll_indi,'anexo_liberador_cierre_venta')
				ll_cod_parque									= dw_proceso.getitemnumber(ll_indi,'cadena_cod_parque')
				if not isnull(ldt_fec_cierre) then
					ldb_porc_acum		 						= 0
					ldb_com_age								= 0
					SELECT	SUM("CUOTAS_PAG")
					INTO 		:ll_cta_pag_s
					FROM		"INGRESO"  
					WHERE	( "INGRESO"."SERIE" = :ls_serie ) AND
								( "INGRESO"."CONTRATO" = :ldb_contrato ) AND 
								( "INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
								( "INGRESO"."TIPO_MOV" = 'E' )
					USING	sqlca;
					if isnull(ll_cta_pag_s) then ll_cta_pag_s = 0
					ll_cta_pag_s1								= ll_cta_pag_s
					SELECT	SUM("MONTO")
					INTO		:ldb_pie_pag
					FROM		"INGRESO" 
					WHERE 	( "INGRESO"."SERIE" = :ls_serie ) AND
								( "INGRESO"."CONTRATO" = :ldb_contrato ) AND 
								( "INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
								( "INGRESO"."TIPO_MOV" = 'A' )
					USING	sqlca;
					ll_mora 										= wf_funcion_mora (ldb_fec_prim,ll_cta_pag_s1,ll_plazo,ldt_fec_fin)
					if ll_plazo <=  ll_cta_pag_s then
						ldt_fec_vto  								= datetime(ldb_fec_ult)
					else
						ldt_fec_vto  								= datetime(funcion_venc( ldb_fec_prim , ll_cta_pag_s ))
					end if
					if wf_estado_contrato(ls_base,ls_serie,ldb_contrato) = 'S' then ll_mora = 0
					if - daysafter (date(ldt_fec_fin),date(ldt_fec_vto)) <= 5 then ll_mora = 0
						SELECT	SUM( "MONTO")
						INTO		:ldb_monto 
						FROM		"INGRESO"
						WHERE	( "TIPO_MOV" = 'A' OR "TIPO_MOV" = 'E' OR "TIPO_MOV" = 'I' OR "TIPO_MOV" = 'S' OR "TIPO_MOV" = 'K' ) AND 
									"INGRESO"."FECHA_PAGO" <= :ldt_fec_fin AND
									"INGRESO"."BASE" = 'L' AND
									"INGRESO"."SERIE" = :ls_serie AND
									"INGRESO"."CONTRATO" = :ldb_contrato
						USING	sqlca;
						if ls_moneda   = '1' then
							ldb_porc_ing						= (double(ldb_monto)*100)/double(ldb_precio)
							ldb_com_sup						= round(((ldb_precio*ldb_porc_sup)/100) ,0)
							ldb_com_jef							= round(((ldb_precio*ldb_porc_jef)/100),0)
						else
							ldb_porc_ing						= (double(ldb_monto)*100)/((double(ldb_precio)*double(ldb_valor_uf)))
							ldb_com_sup						= round((((ldb_precio*double(ldb_valor_uf))*ldb_porc_sup)/100)  ,0)
							ldb_com_jef							= round((((ldb_precio*double(ldb_valor_uf))*ldb_porc_jef)/100) ,0)
						end if
						ldb_tot_pag								= ldb_monto
						if ldb_porc_ing >= idb_porcentaje and ( ls_est_com_sup = 'N') then
						//----------------Supervisores----------------
							if f_graba_res_comi(ls_cod_sup,ll_rut_sup,ldb_monto,ls_cod_cont_sup,'0',ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_sup,ldb_precio,ldb_com_sup,ldb_valor_uf,ls_haber,ls_moneda,'P',ls_est_sup,ls_base,ll_cod_parque,0,0)= -1 then
								ll_malos++
							else
								ll_cont++
							end if			
						//----------------Jefes----------------
							if f_graba_res_comi(ls_cod_jef,ll_rut_jef,ldb_monto,ls_cod_cont_sup,'0',ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_jef,ldb_precio,ldb_com_jef,ldb_valor_uf,ls_haber,ls_moneda,'P',ls_est_jef,ls_base,ll_cod_parque,0,0)= -1 then
								ll_malos++
							else
								ll_cont++
							end if		
						end if
						SELECT	"AGENTES"."COD_AGE"  
						INTO 		:ls_cod_age  
						FROM 	"AGENTES"  
						WHERE 	"AGENTES"."FECHA_INI" >= TO_DATE('8-May-2000 00:00:00','DD-MON-YYYY HH24:MI:SS') AND  
									"AGENTES"."ESTADO" = 'I' and
									"AGENTES"."COD_AGE" = :ls_cod_age  ;
						if sqlca.sqlcode <> 0 then
						//----------------Agentes----------------
							SELECT DISTINCT	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA"  
							INTO					:ldb_c_pie,	:ldb_cta1,		:ldb_cta2,		:ldb_cta3,		:ldb_cta4,		:ldb_cta5,		:ldb_cta6  
							FROM		"COMISION_PROMESA" 
							WHERE 	"COMISION_PROMESA"."BASE" = :ls_base AND
										"COMISION_PROMESA"."SERIE" = :ls_serie AND
										"COMISION_PROMESA"."NUMERO" = :ldb_contrato
							USING	sqlca;
							if sqlca.sqlcode = 0 then
								if  ll_mora > 1 and ls_tipo_cont = '3' then
									if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,string(ll_cta_comi),ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,0,ldb_precio,0,ldb_valor_uf,ls_haber,ls_moneda,'C',ls_est_age,ls_base,ll_cod_parque,0,0) = -1 then
										ll_malos++
									else
										ll_cont++
									end if
								else
									if ll_plazo = 1 then//<----------------------------nro_cuotas = 1----------------------------
										ldb_porc					=  ( ( ldb_pie + ldb_val_cta ) * 100 ) / ldb_precio
									else
										ldb_porc					= ( ldb_pie  * 100 ) / ldb_precio
									end if
									if ls_est_com_age = 'N' and ldb_pie_pag > 0 and ll_cta_pag_s = 0 and ldb_porc >= ldb_c_pie then
										if ls_moneda  = '1' then
											ldb_com_age								= round((ldb_precio*(ldb_c_pie)/100),0)
										else
											ldb_com_age								= round(((((ldb_precio*ldb_valor_uf)*ldb_c_pie)/100)),0)
										end if
										if ldb_cta1 > 0 then ls_est_com_age = 'S'
										if ldb_cta1 = 0 then ls_est_com_age = 'P'
										if ldb_c_pie > 0 then
											if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,'0',ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_c_pie,ldb_precio,ldb_com_age,ldb_valor_uf,ls_haber,ls_moneda,ls_est_com_age,ls_est_age,ls_base,ll_cod_parque,0,0)= -1 then
												ll_malos++
											else
												ll_cont++
											end if
										end if
									elseif ls_est_com_age = 'N' and ( ldb_pie_pag > 0 or ll_cta_pag_s >= 1 ) then
										SELECT	MAX(to_number("MES"))
										INTO		:ll_cta_comi
										FROM		"RES_COMI"
										WHERE	"SERIE" = :ls_serie AND
													"CONTRATO" = :ldb_contrato and 
													"COD_AGE_SUP" = :ls_cod_age
										USING	sqlca;
										if isnull(ll_cta_comi) then ll_cta_comi = 0
										ll_delta_cta_comi						= ll_cta_pag_s - ll_cta_comi 
										if ll_delta_cta_comi <= 0 OR ISNULL(ll_delta_cta_comi) then ll_delta_cta_comi = 0
										ll_cta_comi ++
										for ll_indi2 = 1 to ll_delta_cta_comi
											CHOOSE CASE ll_cta_comi
												CASE 1
													ldb_porc_age 				= ldb_cta1
													ll_cta_comi ++
													if ldb_cta2 > 0 then ls_est_com_age = 'S'
													if ldb_cta2 = 0 then ls_est_com_age = 'P'
												CASE 2
													ldb_porc_age 				= ldb_cta2
													ll_cta_comi ++
													if ldb_cta3 > 0 then ls_est_com_age = 'S'
													if ldb_cta3 = 0 then ls_est_com_age = 'P'
												CASE 3
													ldb_porc_age 				= ldb_cta3
													ll_cta_comi ++
													if ldb_cta4 > 0 then ls_est_com_age = 'S'
													if ldb_cta4 = 0 then ls_est_com_age = 'P'
												CASE 4
													ldb_porc_age 				= ldb_cta4
													ll_cta_comi ++
													if ldb_cta5 > 0 then	ls_est_com_age = 'S'
													if ldb_cta5 = 0 then	ls_est_com_age = 'P'
												CASE 5
													ldb_porc_age 				= ldb_cta5
													ll_cta_comi ++
													if ldb_cta6 > 0 then ls_est_com_age	= 'S'
													if ldb_cta6 = 0 then ls_est_com_age	= 'P'
												CASE 6
													ldb_porc_age 				= ldb_cta6
													ll_cta_comi ++
													ls_est_com_age = 'P'
											END CHOOSE
											if ls_moneda  = '1' then
												ldb_com_age   					= ldb_com_age + round((ldb_precio*(ldb_porc_age)/100),0)
											else
												ldb_com_age   					= ldb_com_age + round(((((ldb_precio*ldb_valor_uf)*ldb_porc_age)/100)),0)
											end if
											ldb_porc_acum 					= ldb_porc_acum + ldb_porc_age
										next
										if ll_plazo = 1 then//<----------------------------nro_cuotas = 1----------------------------
											ldb_porc								= ( ( ldb_pie + ldb_val_cta ) * 100 ) / ldb_precio
										else
											ldb_porc								= ( ( ldb_pie ) * 100 ) / ldb_precio
										end if
										if ldb_c_pie > 0 and ldb_porc >= ldb_c_pie then
											if isnull(ldb_com_age) then ldb_com_age = 0
											if isnull(ldb_porc_acum) then ldb_porc_acum = 0
											if ls_moneda  = '1' then
												ldb_com_age   					= ldb_com_age + round((ldb_precio*(ldb_c_pie)/100),0)
											else
												ldb_com_age   					= ldb_com_age +  round(((((ldb_precio*ldb_valor_uf)*ldb_c_pie)/100)),0)
											end if
											if ldb_cta1 = 0 then	
												ls_est_com_age				= 'P'
											elseif ldb_cta1 > 0 then	
												ls_est_com_age				= 'S'
											end if
											ldb_porc_acum 					= ldb_porc_acum + ldb_c_pie
										end if
										ll_cta_comi --
										if ldb_porc_acum > 0 then
											if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,string(ll_cta_comi),ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_acum,ldb_precio,ldb_com_age,ldb_valor_uf,ls_haber,ls_moneda,ls_est_com_age,ls_est_age,ls_base,ll_cod_parque,0,0) = -1 then
												ll_malos++
											else
												ll_cont++
											end if
										end if
										ldb_porc_acum 						= 0
									elseif ls_est_com_age = 'S' and ll_cta_pag_s >= 1 then
										SELECT	max(to_number("MES"))
										INTO		:ll_cta_comi
										FROM		"RES_COMI"
										WHERE	"SERIE" = :ls_serie AND
													"CONTRATO" = :ldb_contrato
										USING	sqlca;
										if isnull(ll_cta_comi) then ll_cta_comi = 0
										ll_delta_cta_comi						= ll_cta_pag_s - ll_cta_comi 
										if ll_delta_cta_comi <= 0 then ll_delta_cta_comi = 0
										ll_cta_comi ++
										for ll_indi2 = 1 to ll_delta_cta_comi
											CHOOSE CASE ll_cta_comi
												CASE 1
													ldb_porc_age 				= ldb_cta1
													ll_cta_comi ++
													if ldb_cta2 > 0 then ls_est_com_age = 'S'
													if ldb_cta2 = 0 then ls_est_com_age = 'P'
												CASE 2
													ldb_porc_age 				= ldb_cta2
													ll_cta_comi ++
													if ldb_cta3 > 0 then ls_est_com_age = 'S'
													if ldb_cta3 = 0 then ls_est_com_age = 'P'
												CASE 3
													ldb_porc_age 				= ldb_cta3
													ll_cta_comi ++
													if ldb_cta4 > 0 then ls_est_com_age = 'S'
													if ldb_cta4 = 0 then ls_est_com_age = 'P'
												CASE 4
													ldb_porc_age 				= ldb_cta4
													ll_cta_comi ++
													if ldb_cta5 > 0 then ls_est_com_age = 'S'
													if ldb_cta5 = 0 then ls_est_com_age = 'P'
												CASE 5
													ldb_porc_age 				= ldb_cta5
													ll_cta_comi ++
													if ldb_cta6 > 0 then ls_est_com_age = 'S'
													if ldb_cta6 = 0 then ls_est_com_age = 'P'
												CASE 6
													ldb_porc_age 				= ldb_cta6
													ll_cta_comi ++
													ls_est_com_age			= 'P'
											END CHOOSE
											if ls_moneda  = '1' then
												ldb_com_age   					= ldb_com_age + round((ldb_precio*(ldb_porc_age)/100),0)
											else
												ldb_com_age   					= ldb_com_age + round(((((ldb_precio*double(ldb_valor_uf))*ldb_porc_age)/100)),0)
											end if
											ldb_porc_acum 					= ldb_porc_acum + ldb_porc_age
										next
										if ldb_porc_acum > 0 then
											if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,string(ll_cta_comi),ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_acum,ldb_precio,ldb_com_age,ldb_valor_uf,ls_haber,ls_moneda,ls_est_com_age,ls_est_age,ls_base,ll_cod_parque,0,0) = -1 then
												ll_malos++
											else
												ll_cont++
											end if
										end if
								end if
							end if
						end if
					end if
				end if
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					ldb_tot_porc_aux											= ldb_tot_porc
				end if
				ldb_tot_porc														= (ll_indi * 100) / ll_tot_reg
				hpb_1.Position 													= ldb_tot_porc
				st_porc.text														= string(ldb_tot_porc,'#0.00')+" %"
				st_cuenta.text 													= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				dw_proceso.accepttext()
			next
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
									'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
		end if
	end if			
end if
end event

type cb_comi_037 from commandbutton within w_comision_proceso
integer x = 1541
integer y = 296
integer width = 690
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Comisión Promesas"
end type

event clicked;string		ls_base,ls_haber,ls_cod_cont_age,ls_cod_cont_sup,ls_moneda,ls_cod_age,ls_cod_jef,ls_cod_sup,ls_est_com_age,&
			ls_serie,ls_est_age,ls_est_sup,ls_est_jef	,ls_tipo_cont,ls_est_com_sup
long		ll_res,ll_cod_parque,ll_indi,ll_tot_reg,ll_rut_age,ll_rut_sup,ll_rut_jef,ll_plazo,ll_cta_pag_s1,ll_cta_pag_s,&
			ll_mora,ll_malos=0,ll_cont=0,ll_cta_comi,ll_delta_cta_comi,ll_indi2
datetime	ldt_fec_fin,ldt_fec_prim,ldt_fec_ult,ldt_fec_cierre,ldt_fec_vto
double	ldb_contrato,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_valor_uf,ldb_precio,ldb_porc_sup,ldb_porc_jef,ldb_pie_pag,ldb_tot_pag,ldb_val_cta,ldb_pie,&
			ldb_porc_acum,ldb_monto,ldb_porc_ing,ldb_com_age,ldb_com_sup,ldb_com_jef,ldb_porc_age,&
			ldb_c_pie,ldb_cta1,ldb_cta2,ldb_cta3,ldb_cta4,ldb_cta5,ldb_cta6,ldb_cta7,ldb_cta8,ldb_cta9,ldb_porc

cb_grabar.visible												= true
st_det_proceso.text											= 'Cálculo Promesas Contratos Antiguos'
dw_proceso.dataobject										= 'dw_premios_cont_333'
dw_proceso.settransobject(sqlca)
dw_proceso.reset()
ldt_fec_fin														= datetime(date(em_termino.text),time('00:00:00'))
hpb_1.Position													= ldb_tot_porc
ls_haber            												= 'H'
ls_cod_cont_age							    					= '037'
ls_cod_cont_sup												= '023'
SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
		ldb_valor_uf												= ldb_valor_uf
	else
		messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
	end if
else
	messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
end if
if ldb_valor_uf>0 then
	ll_res															= messagebox(gs_app_name,'El proceso de calculo de comisiones, se tardara algunos minutos.~n~r¿ Desea continuar ?',information!,yesno!,1)
	if  ll_res = 1 then
		setpointer(HourGlass!)
		ll_tot_reg												= dw_proceso.retrieve(ldt_fec_fin)
		if dw_proceso.rowcount() >0 then
			for ll_indi=1 to dw_proceso.rowcount() step 1
				ls_base											= 'O'
				ls_moneda										= dw_proceso.getitemstring(ll_indi,'pago_oferta_moneda')
				ls_cod_age										= dw_proceso.getitemstring(ll_indi,'oferta_v_cod_age')
				ls_cod_sup										= dw_proceso.getitemstring(ll_indi,'oferta_v_cod_sup')	
				ls_cod_jef										= dw_proceso.getitemstring(ll_indi,'oferta_v_cod_jef')
				ls_serie											= dw_proceso.getitemstring(ll_indi,'comision_promesa_serie')	
				ls_est_age										= dw_proceso.getitemstring(ll_indi,'agentes_estado')
				ls_est_sup										= dw_proceso.getitemstring(ll_indi,'supervisor_estado')
				ls_est_jef										= dw_proceso.getitemstring(ll_indi,'jefe_ventas_estado')
				ls_tipo_cont										= dw_proceso.getitemstring(ll_indi,'agentes_tipo_cont')
				ls_est_com_age								= dw_proceso.getitemstring(ll_indi,'oferta_v_estado_comi')	
				ls_est_com_sup								= dw_proceso.getitemstring(ll_indi,'oferta_v_estado_comi_sup')
				ldb_precio										= dw_proceso.getitemnumber(ll_indi,'pago_oferta_precio')
				ldb_contrato										= dw_proceso.getitemnumber(ll_indi,'comision_promesa_numero')	
				ldb_porc_sup									= dw_proceso.getitemnumber(ll_indi,'supervisor_porc_supervisor')
				ldb_porc_jef										= dw_proceso.getitemnumber(ll_indi,'jefe_ventas_porc_jefe_vta')
				ll_rut_age										= dw_proceso.getitemnumber(ll_indi,'agentes_rut')
				ll_rut_sup										= dw_proceso.getitemnumber(ll_indi,'supervisor_rut')
				ll_rut_jef											= dw_proceso.getitemnumber(ll_indi,'jefe_ventas_rut')
				ll_plazo											= dw_proceso.getitemnumber(ll_indi,'pago_oferta_nro_cuotas')
				ll_cta_pag_s1									= dw_proceso.getitemnumber(ll_indi,'oferta_v_cta_pag_s')	
				ldb_pie_pag										= dw_proceso.getitemnumber(ll_indi,'pago_oferta_pie_pagado')	
				ldb_tot_pag										= dw_proceso.getitemnumber(ll_indi,'oferta_v_tot_pagado')
				ldt_fec_prim										= dw_proceso.getitemdatetime(ll_indi,'pago_oferta_fecha_prim')
				ldt_fec_ult										= dw_proceso.getitemdatetime(ll_indi,'pago_oferta_fecha_ult')
				ldb_val_cta										= dw_proceso.getitemnumber(ll_indi,'pago_oferta_valor_cuota')	
				ldb_pie											= dw_proceso.getitemnumber(ll_indi,'pago_oferta_pie')	
				ldt_fec_cierre									= dw_proceso.getitemdatetime(ll_indi,'oferta_v_cierre_venta')
				ll_cod_parque      								= dw_proceso.getitemnumber(ll_indi,'cadena_cod_parque')
				if not isnull(ldt_fec_cierre) then
					ldb_porc_acum								= 0
					ldb_com_age								= 0
					SELECT	SUM("CUOTAS_PAG")
					INTO 		:ll_cta_pag_s
					FROM		"INGRESO"  
					WHERE	( "INGRESO"."BASE" = :ls_base ) AND
								( "INGRESO"."SERIE" = :ls_serie ) AND
								( "INGRESO"."CONTRATO" = :ldb_contrato ) AND 
								( "INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
								( "INGRESO"."TIPO_MOV" = 'E' )
					USING	sqlca;
					if isnull(ll_cta_pag_s) then ll_cta_pag_s = 0
					ll_cta_pag_s1 								= ll_cta_pag_s
					
					SELECT	SUM("MONTO")
					INTO 		:ldb_pie_pag
					FROM		"INGRESO" 
					WHERE	( "INGRESO"."BASE" = :ls_base ) AND
								( "INGRESO"."SERIE" = :ls_serie ) AND
								( "INGRESO"."CONTRATO" = :ldb_contrato ) AND 
								( "INGRESO"."FECHA_PAGO" <= :ldt_fec_fin ) AND
								( "INGRESO"."TIPO_MOV" = 'A' )
					USING	sqlca;
	//----------aqui funcion mora-------------------------------------------------------------------------
					ll_mora 										= wf_funcion_mora (ldt_fec_prim,ll_cta_pag_s1,ll_plazo,ldt_fec_fin)
					if ll_plazo <= ll_cta_pag_s then
						ldt_fec_vto  								= datetime(ldt_fec_ult)
					else
						ldt_fec_vto  								= datetime(funcion_venc( ldt_fec_prim , ll_cta_pag_s ))
					end if
					if wf_estado_contrato(ls_base,ls_serie,ldb_contrato) = 'S' then ll_mora = 0
					if - daysafter (date(ldt_fec_fin),date(ldt_fec_vto)) <= 5 then ll_mora = 0
	//----------------Monto total de tabla ingreso----------------
					
					ldb_monto									= wf_tot_pag_comi(ls_base,ls_serie,ldb_contrato,ldt_fec_fin)
					if ls_moneda = '1' then
						ldb_porc_ing								= (double(ldb_monto)*100)/double(ldb_precio)
						ldb_com_sup								= round(  ((ldb_precio*ldb_porc_sup)/100) ,0)
						ldb_com_jef									= round(  ((ldb_precio*ldb_porc_jef)/100),0)
					else
						ldb_porc_ing								= (double(ldb_monto)*100)/((double(ldb_precio)*ldb_valor_uf))
						ldb_com_sup								= round(  (((ldb_precio*ldb_valor_uf)*ldb_porc_sup)/100)  ,0)
						ldb_com_jef									= round(  (((ldb_precio*ldb_valor_uf)*ldb_porc_jef)/100) ,0)
					end if
					ldb_tot_pag    									= ldb_monto
					if ldb_porc_ing >= idb_porcentaje and ( ls_est_com_sup = 'N') then
	//----------------Supervisores----------------
						if f_graba_res_comi(ls_cod_sup,ll_rut_sup,ldb_monto,ls_cod_cont_sup,'0',ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_sup,ldb_precio,ldb_com_sup,ldb_valor_uf,ls_haber,ls_moneda,'P',ls_est_sup,ls_base,ll_cod_parque,0,0)= -1 then
							ll_malos++
						else
							ll_cont++
						end if			
	//----------------Jefes----------------
						if f_graba_res_comi(ls_cod_jef,ll_rut_jef,ldb_monto,ls_cod_cont_sup,'0',ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_jef,ldb_precio,ldb_com_jef,ldb_valor_uf,ls_haber,ls_moneda,'P',ls_est_jef,ls_base,ll_cod_parque,0,0)= -1 then
							ll_malos++
						else
							ll_cont++
						end if
					end if
					SELECT	"AGENTES"."COD_AGE"  
					INTO 		:ls_cod_age  
					FROM		"AGENTES"  
					WHERE 	"AGENTES"."FECHA_INI" >= TO_DATE('8-May-2000 00:00:00','DD-MON-YYYY HH24:MI:SS') AND  
								"AGENTES"."ESTADO" = 'I' and
								"AGENTES"."COD_AGE" = :ls_cod_age
					USING	sqlca;
					if sqlca.sqlcode <> 0 then
	//------------------------------------------------Agentes------------------------------------------------
						SELECT DISTINCT	"C_PIE",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA"   
						INTO					:ldb_c_pie,	:ldb_cta1,		:ldb_cta2,		:ldb_cta3,		:ldb_cta4,		:ldb_cta5,		:ldb_cta6,	:ldb_cta7,		:ldb_cta8,		:ldb_cta9  
						FROM		"COMISION_PROMESA" 
						WHERE 	"COMISION_PROMESA"."BASE" = :ls_base AND
									"COMISION_PROMESA"."SERIE" = :ls_serie AND
									"COMISION_PROMESA"."NUMERO" = :ldb_contrato;
						if sqlca.sqlcode = 0 then
							if ll_mora > 1 and ls_tipo_cont = '3' then		//and fecha_ingreso <= date('29/02/2008') then//<---------mayor o igual a 2 moras, estado_comi = 'C'<---------------
								if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,string(ll_cta_comi),ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,0,ldb_precio,0,ldb_valor_uf,ls_haber,ls_moneda,'C',ls_est_age,ls_base,ll_cod_parque,0,0) = -1 then
									ll_malos++
								else
									ll_cont++
								end if
							else//estado_comi = 'S' or estado_comi = 'N'<---------------
								if ll_plazo = 1 then
									ldb_porc							= ((ldb_pie + ldb_val_cta) * 100) / ldb_precio
								else
									ldb_porc							= ((ldb_pie) * 100) / ldb_precio
								end if
								if ls_est_com_age = 'N' and ldb_pie_pag > 0 and ll_cta_pag_s = 0 and ldb_porc >= ldb_c_pie then
									if ls_moneda  = '1' then
										ldb_com_age				= round((ldb_precio * ( ldb_c_pie ) / 100),0)
									else
										ldb_com_age				= round(((((ldb_precio * ldb_valor_uf) * ldb_c_pie) / 100)), 0)
									end if
									if ldb_cta1 > 0 then ls_est_com_age = 'S'
									if ldb_cta1 = 0 then ls_est_com_age = 'P'
									if ldb_c_pie > 0 and ldb_com_age > 0 then
										if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,'0',ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_c_pie,ldb_precio,ldb_com_age,ldb_valor_uf,ls_haber,ls_moneda,ls_est_com_age,ls_est_age,ls_base,ll_cod_parque,0,0)= -1 then
											ll_malos++
										else
											ll_cont++
										end if
									end if
								elseif ls_est_com_age = 'N' and ( ldb_pie_pag > 0 or ll_cta_pag_s >= 1 ) then
									SELECT	MAX(to_number("MES"))
									INTO		:ll_cta_comi
									FROM		"RES_COMI"
									WHERE 	"RES_COMI"."SERIE" = :ls_serie AND
												"RES_COMI"."CONTRATO" = :ldb_contrato  and 
												"RES_COMI"."COD_AGE_SUP" = :ls_cod_age AND
												"RES_COMI"."COD_CONTABLE" = :ls_cod_cont_age
									USING	sqlca;
									if isnull(ll_cta_comi) then ll_cta_comi = 0
									ll_delta_cta_comi 					= ll_cta_pag_s1 - ll_cta_comi 
									if ll_delta_cta_comi <= 0 then ll_delta_cta_comi = 0
									ll_cta_comi ++
									for ll_indi2 = 1 to ll_delta_cta_comi
										CHOOSE CASE ll_cta_comi
											CASE 1
												ldb_porc_age			= ldb_cta1
												ll_cta_comi ++
												if ldb_cta2 > 0 then ls_est_com_age = 'S'
												if ldb_cta2 = 0 then ls_est_com_age = 'P'
											CASE 2
												ldb_porc_age			= ldb_cta2
												ll_cta_comi ++
												if ldb_cta3 > 0 then ls_est_com_age = 'S'
												if ldb_cta3 = 0 then ls_est_com_age = 'P'
											CASE 3
												ldb_porc_age			= ldb_cta3
												ll_cta_comi ++
												if ldb_cta4 > 0 then ls_est_com_age = 'S'
												if ldb_cta4 = 0 then ls_est_com_age = 'P'
											CASE 4
												ldb_porc_age			= ldb_cta4
												ll_cta_comi ++
												if ldb_cta5 > 0 then	ls_est_com_age = 'S'
												if ldb_cta5 = 0 then	ls_est_com_age = 'P'
											CASE 5
												ldb_porc_age			= ldb_cta5
												ll_cta_comi ++
												if ldb_cta6 > 0 then ls_est_com_age = 'S'
												if ldb_cta6 = 0 then ls_est_com_age = 'P'
											CASE 6
												ldb_porc_age			= ldb_cta6
												ll_cta_comi ++
												if ldb_cta7 > 0 then ls_est_com_age = 'S'
												if ldb_cta7 = 0 then ls_est_com_age = 'P'
											CASE 7
												ldb_porc_age			= ldb_cta7
												ll_cta_comi ++
												if ldb_cta8 > 0 then ls_est_com_age = 'S'
												if ldb_cta8 = 0 then ls_est_com_age = 'P'
											CASE 8
												ldb_porc_age			= ldb_cta8
												ll_cta_comi ++
												if ldb_cta9 > 0 then ls_est_com_age = 'S'
												if ldb_cta9 = 0 then ls_est_com_age = 'P'
											CASE 9
												ldb_porc_age			= ldb_cta9
												ll_cta_comi ++
												ls_est_com_age		= 'P'
										END CHOOSE
										if ls_moneda  = '1' then
											ldb_com_age   				= ldb_com_age + round((ldb_precio*(ldb_porc_age)/100),0)
										else
											ldb_com_age   				= ldb_com_age + round(((((ldb_precio*ldb_valor_uf)*ldb_porc_age)/100)),0)
										end if
										ldb_porc_acum 				= ldb_porc_acum + ldb_porc_age
									next
									
									if ll_plazo = 1 then//<----------------------------nro_cuotas = 1----------------------------
										ldb_porc							= ( ( ldb_pie + ldb_val_cta ) * 100 ) / ldb_precio
									else
										ldb_porc						 	= ( ( ldb_pie ) * 100 ) / ldb_precio
									end if
									if ldb_c_pie > 0 and ldb_porc >= ldb_c_pie then
										if isnull(ldb_com_age) then ldb_com_age = 0
										if isnull(ldb_porc_acum) then ldb_porc_acum = 0
										if ls_moneda  = '1' then
											ldb_com_age   				= ldb_com_age + round((ldb_precio*(ldb_c_pie)/100),0)
										else
											ldb_com_age   				= ldb_com_age +  round(((((ldb_precio*ldb_valor_uf)*ldb_c_pie)/100)),0)
										end if
										if ldb_cta1 = 0 then
											ls_est_com_age			= 'P'
										elseif ldb_cta1 > 0 then
											ls_est_com_age			= 'S'
										end if
										ldb_porc_acum 				= ldb_porc_acum + ldb_c_pie
									end if
									ll_cta_comi --
									if ldb_porc_acum > 0  AND ldb_com_age > 0  then
										if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,string(ll_cta_comi),ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_acum,ldb_precio,ldb_com_age,ldb_valor_uf,ls_haber,ls_moneda,ls_est_com_age,ls_est_age,ls_base,ll_cod_parque,0,0) = -1 then
											ll_malos++
										else
											ll_cont++
										end if
									end if
									ldb_porc_acum 					= 0
								elseif ls_est_com_age = 'S' and ll_cta_pag_s >= 1 then
									SELECT	MAX(to_number("MES"))
									INTO 		:ll_cta_comi 
									FROM		"RES_COMI"
									WHERE	"RES_COMI"."SERIE" = :ls_serie AND
												"RES_COMI"."CONTRATO" = :ldb_contrato and 
												"RES_COMI"."COD_AGE_SUP" = :ls_cod_age AND
												"RES_COMI"."COD_CONTABLE" = :ls_cod_cont_age
									USING	sqlca;
									if isnull(ll_cta_comi) then ll_cta_comi = 0
									ll_delta_cta_comi 					= ll_cta_pag_s1 - ll_cta_comi
									if ll_delta_cta_comi <= 0 then ll_delta_cta_comi = 0
									ll_cta_comi ++
									for ll_indi2 = 1 to ll_delta_cta_comi
										CHOOSE CASE ll_cta_comi
											CASE 1
												ldb_porc_age			= ldb_cta1
												ll_cta_comi ++
												if ldb_cta2 > 0 then ls_est_com_age = 'S'
												if ldb_cta2 = 0 then ls_est_com_age = 'P'
											CASE 2
												ldb_porc_age			= ldb_cta2
												ll_cta_comi ++
												if ldb_cta3 > 0 then ls_est_com_age = 'S'
												if ldb_cta3 = 0 then ls_est_com_age = 'P'
											CASE 3
												ldb_porc_age			= ldb_cta3
												ll_cta_comi ++
												if ldb_cta4 > 0 then ls_est_com_age = 'S'
												if ldb_cta4 = 0 then ls_est_com_age = 'P'
											CASE 4
												ldb_porc_age			= ldb_cta4
												ll_cta_comi ++
												if ldb_cta5 > 0 then	ls_est_com_age = 'S'
												if ldb_cta5 = 0 then	ls_est_com_age = 'P'
											CASE 5
												ldb_porc_age			= ldb_cta5
												ll_cta_comi ++
												if ldb_cta6 > 0 then ls_est_com_age = 'S'
												if ldb_cta6 = 0 then ls_est_com_age = 'P'
											CASE 6
												ldb_porc_age			= ldb_cta6
												ll_cta_comi ++
												if ldb_cta7 > 0 then ls_est_com_age = 'S'
												if ldb_cta7 = 0 then ls_est_com_age = 'P'
											CASE 7
												ldb_porc_age			= ldb_cta7
												ll_cta_comi ++
												if ldb_cta8 > 0 then ls_est_com_age = 'S'
												if ldb_cta8 = 0 then ls_est_com_age = 'P'												
											CASE 8
												ldb_porc_age			= ldb_cta8
												ll_cta_comi ++
												if ldb_cta9 > 0 then ls_est_com_age = 'S'
												if ldb_cta9 = 0 then ls_est_com_age = 'P'
											CASE 9
												ldb_porc_age			= ldb_cta9
												ll_cta_comi ++
												ls_est_com_age		= 'P'
										END CHOOSE
										if ls_moneda  = '1' then
											ldb_com_age   				= ldb_com_age + round((ldb_precio*(ldb_porc_age)/100),0)
										else
											ldb_com_age   				= ldb_com_age + round(((((ldb_precio*ldb_valor_uf)*ldb_porc_age)/100)),0)
										end if
										ldb_porc_acum 				= ldb_porc_acum + ldb_porc_age
									next
									ll_cta_comi --
									if ldb_porc_acum > 0  AND ldb_com_age > 0 then
										if f_graba_res_comi(ls_cod_age,ll_rut_age,ldb_monto,ls_cod_cont_age,string(ll_cta_comi),ldt_fec_fin,ldb_contrato,ls_serie,ldb_porc_ing,ldb_porc_acum,ldb_precio,ldb_com_age,ldb_valor_uf,ls_haber,ls_moneda,ls_est_com_age,ls_est_age,ls_base,ll_cod_parque,0,0) = -1 then
											ll_malos++
										else
											ll_cont++
										end if
									end if
									ldb_porc_acum 					= 0
								end if
							end if
						else
							messagebox('BASE - SERIE - NUMERO ',+ls_base+' - '+ls_serie+' - '+ STRING(ldb_contrato,'###,###,###,###'),INFORMATION!)
						end if
					end if
				end if
				if ldb_tot_porc <> ldb_tot_porc_aux then 
				ldb_tot_porc_aux											= ldb_tot_porc
			end if
			ldb_tot_porc														= (ll_indi * 100) / ll_tot_reg
			hpb_1.Position 													= ldb_tot_porc
			st_porc.text														= string(ldb_tot_porc,'#0.00')+" %"
			st_cuenta.text 													= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
			dw_proceso.accepttext()
			next
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
									'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
		end if
	end if
end if
end event

type cb_actualiz_089 from commandbutton within w_comision_proceso
integer x = 2377
integer y = 964
integer width = 599
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Comisión"
end type

event clicked;string		ls_graba='N',ls_codigo,ls_serie,ls_est_comi,ls_cargo,ls_base,ls_cod_ofe,ls_cod_lib,ls_cod_aum
long		ll_tot_reg,ll_res,ll_graba=0,ll_error=0,ll_tot_age,ll_tot_sup,ll_tot_jef,&
			ll_tot_age_au,ll_tot_sup_au,ll_tot_jef_au,ll_tot_age_lib,ll_tot_sup_lib,ll_tot_jef_lib
datetime	ldt_fecha
double	ldb_numero,ldb_tot_porc,ldb_tot_porc_aux

ls_cod_ofe										= '089'
ls_cod_lib										= '036'
ls_cod_aum										= '050'
st_det_proceso.text							= 'Actualización Estado Promesas Contratos Nuevos'
ldt_fecha											= datetime(date(em_termino.text),time('00:00:00'))
if not isnull(ldt_fecha) then
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar Comisión Promesa Código Contable "089" ?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
					"CADENA"."CODIGO" = 'O' and    
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_ofe AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"OFERTA_V"."ESTADO_COMI" <> 'P' 
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_ofe AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"OFERTA_V"."ESTADO_COMI_SUP" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_ofe AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"OFERTA_V"."ESTADO_COMI_JV" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age_au
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"CADENA"."CODIGO" = 'A' and    
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_aum AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"ANEXO_AUMENTO"."ESTADO_COMI" <> 'P' 
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup_au
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_aum AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"ANEXO_AUMENTO"."ESTADO_COMI_SUP" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef_au
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_aum AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"ANEXO_AUMENTO"."ESTADO_COMI_JV" <> 'P'
		USING	sqlca;
		
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age_lib
		FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"CADENA"."CODIGO" = 'L' and    
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_lib AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"ANEXO_LIBERADOR"."ESTADO_COMI" <> 'P' 
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup_lib
		FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"CADENA"."CODIGO" = 'L' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_lib AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"ANEXO_LIBERADOR"."ESTADO_COMI_SUP" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef_lib
		FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"CADENA"."CODIGO" = 'L' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"RES_COMI"."COD_CONTABLE" = :ls_cod_lib AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
					"ANEXO_LIBERADOR"."ESTADO_COMI_JV" <> 'P'
		USING	sqlca;
		ll_tot_reg									= ll_tot_age+ll_tot_sup+ll_tot_jef+ll_tot_age_au+ll_tot_sup_au+ll_tot_jef_au+ll_tot_age_lib+ll_tot_sup_lib+ll_tot_jef_lib
		if ll_tot_reg>0 then
			ls_graba									= 'S'
		else
			ls_graba									= 'N'
		end if
		if ls_graba='N' then
			messagebox("Advertencia","No Registra Comisión Promesa Sin Actualizar")
		else
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0			
			hpb_1.Position							= ldb_tot_porc
			DECLARE x1 CURSOR FOR
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A',"CADENA"."CODIGO"
			FROM		"RES_COMI", "OFERTA_V","CADENA"  
			WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
						"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
						"CADENA"."CODIGO" = 'O' and
						"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_ofe AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"OFERTA_V"."ESTADO_COMI" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S',"CADENA"."CODIGO"
			FROM		"RES_COMI", "OFERTA_V","CADENA"  
			WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
						"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
						"CADENA"."CODIGO" = 'O' and  
						"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_ofe AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"OFERTA_V"."ESTADO_COMI_SUP" <> 'P' 
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J',"CADENA"."CODIGO"
			FROM		"RES_COMI", "OFERTA_V","CADENA"  
			WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
						"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
						"CADENA"."CODIGO" = 'O' and  
						"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_ofe AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"OFERTA_V"."ESTADO_COMI_JV" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"CADENA"."CODIGO" = 'A' and    
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_AGENTE" and  
						"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_aum AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"ANEXO_AUMENTO"."ESTADO_COMI" <> 'P' 
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"CADENA"."CODIGO" = 'A' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_SUPER" and  
						"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_aum AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"ANEXO_AUMENTO"."ESTADO_COMI_SUP" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"CADENA"."CODIGO" = 'A' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_JEF" and  
						"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_aum AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"ANEXO_AUMENTO"."ESTADO_COMI_JV" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"CADENA"."CODIGO" = 'L' and    
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_AGENTE" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_lib AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"ANEXO_LIBERADOR"."ESTADO_COMI" <> 'P' 
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"CADENA"."CODIGO" = 'L' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_SUPER" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_lib AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"ANEXO_LIBERADOR"."ESTADO_COMI_SUP" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"CADENA"."CODIGO" = 'L' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_JEF" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"RES_COMI"."COD_CONTABLE" = :ls_cod_lib AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
						"ANEXO_LIBERADOR"."ESTADO_COMI_JV" <> 'P'
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_codigo,	:ls_serie,	:ldb_numero,	:ls_est_comi, :ls_cargo,	:ls_base;
					if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						if ls_base='O' then
							if ls_cargo='A' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_COMI" = :ls_est_comi,
											"FECHA_COM" = :ldt_fecha
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='S' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_COMI_SUP" = :ls_est_comi  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='J' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_COMI_JV" = :ls_est_comi  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;	
							end if
						elseif ls_base='A' then
							if ls_cargo='A' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_COMI" = :ls_est_comi,
											"FECHA_COM" = :ldt_fecha
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='S' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_COMI_SUP" = :ls_est_comi  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='J' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_COMI_JV" = :ls_est_comi  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;	
							end if
						elseif ls_base='L' then
							if ls_cargo='A' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_COMI" = :ls_est_comi,
											"FECHA_COM" = :ldt_fecha
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='S' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_COMI_SUP" = :ls_est_comi  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='J' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_COMI_JV" = :ls_est_comi  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
								USING	Trans_1;	
							end if	
						end if
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++	
						else
							rollback using Trans_1;
							ll_error++
							messagebox("Error Grabar","Error Grabar Promesa "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ls_codigo);setnull(ls_serie);setnull(ldb_numero);setnull(ls_est_comi)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.00')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
					st_cuenta.text 					= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'   Reg. Cálculados '+string(ll_graba,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				LOOP
			end if
			close x1;
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_tot_reg,'###,###,##0')+' registros grabados con exito~r~n'+&
								'y '+string(ll_error,'###,###,##0')+' registros con problemas.',information!)
			SetPointer(Arrow!)
		end if
	end if
end if
end event

type cb_pagos from commandbutton within w_comision_proceso
integer x = 987
integer y = 784
integer width = 453
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Pagos por Venta"
end type

event clicked;string	ls_base,ls_serie,ls_string
double		ldb_numero

dw_proceso.accepttext()
if il_row>0 then
	if  dw_proceso.rowcount() > 0 or dw_modif_datos.rowcount() >0 then
		if is_tipo='P' then
			if dw_proceso.dataobject='dw_comision_vtas_equi_deveng_reprog' and dw_proceso.rowcount() > 0 then
				gs_base						= dw_proceso.getitemstring(il_row,'vista_comis_reprog_base_original')
				gs_serie						= dw_proceso.getitemstring(il_row,'vista_comis_reprog_serie_original')
				gi_numero 					= dw_proceso.getitemnumber(il_row,'vista_comis_reprog_numero_original')
				gi_rut							= dw_proceso.getitemnumber(il_row,'vista_comis_reprog_rut')
			else
				ls_base				= dw_proceso.getitemstring(il_row,'codigo')
				ls_serie				= dw_proceso.getitemstring(il_row,'serie')
				ldb_numero			= dw_proceso.getitemnumber(il_row,'numero')
			end if
		elseif is_tipo='I' then
			ls_base					= dw_modif_datos.getitemstring(il_row,'base')
			ls_serie					= dw_modif_datos.getitemstring(il_row,'serie')
			ldb_numero				= dw_modif_datos.getitemnumber(il_row,'numero')
		end if
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
			ls_string					= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
			if isvalid(w_rescomi_ventas) then close(w_rescomi_ventas)
			OpenWithParm (w_rescomi_ventas,ls_string)
		end if
	end if
end if
end event

type cb_actualiz_090 from commandbutton within w_comision_proceso
integer x = 2377
integer y = 1068
integer width = 599
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Persistencia"
end type

event clicked;string		ls_graba='N',ls_codigo,ls_serie,ls_est_premio,ls_cargo,ls_base,ls_per_ofe,ls_per_lib,ls_per_aum
long		ll_tot_reg,ll_res,ll_graba=0,ll_error=0,ll_tot_age,ll_tot_sup,ll_tot_jef,&
			ll_tot_age_au,ll_tot_sup_au,ll_tot_jef_au,ll_tot_age_lib,ll_tot_sup_lib,ll_tot_jef_lib
//long		ll_prueba
datetime	ldt_fecha
double	ldb_numero,ldb_tot_porc,ldb_tot_porc_aux

ldt_fecha											= datetime(date(em_termino.text),time('00:00:00'))
st_det_proceso.text							= 'Actualización Estado Persistencia Contratos Nuevos'
ls_per_ofe										= '090'
ls_per_lib										= '053'
ls_per_aum										= '028'

//ll_prueba 										= 176665 
if not isnull(ldt_fecha) then
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar Premio Persistencia Promesa Código Contable "090" ?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_ofe AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
	//				"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"OFERTA_V"."ESTADO_PERSIST_AGE" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_ofe AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"OFERTA_V"."ESTADO_PERSIST_SUP" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef
		FROM		"RES_COMI", "OFERTA_V","CADENA"  
		WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
					"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
					"CADENA"."CODIGO" = 'O' and  
					"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_ofe AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"OFERTA_V"."ESTADO_PERSIST_JEF" <> 'P'
		USING	sqlca;
		
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age_au
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_aum AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
	//				"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"ANEXO_AUMENTO"."ESTADO_PERSIST_AGE" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup_au
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_aum AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"ANEXO_AUMENTO"."ESTADO_PERSIST_SUP" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef_au
		FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"CADENA"."CODIGO" = 'A' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_aum AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"ANEXO_AUMENTO"."ESTADO_PERSIST_JEF" <> 'P'
		USING	sqlca;
		
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_age_lib
		FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"CADENA"."CODIGO" = 'L' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_AGENTE" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_lib AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
	//				"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"ANEXO_LIBERADOR"."ESTADO_PERSIST_AGE" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_sup_lib
		FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"CADENA"."CODIGO" = 'L' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_SUPER" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_lib AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"ANEXO_LIBERADOR"."ESTADO_PERSIST_SUP" <> 'P'
		USING	sqlca;
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_jef_lib
		FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
		WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"CADENA"."CODIGO" = 'L' and  
					"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_JEF" and  
					"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
					"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
					"RES_COMI"."COD_CONTABLE" = :ls_per_lib AND  
					"RES_COMI"."FECHA" = :ldt_fecha AND
//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
					"ANEXO_LIBERADOR"."ESTADO_PERSIST_JEF" <> 'P'
		USING	sqlca;
		ll_tot_reg									= ll_tot_age+ll_tot_sup+ll_tot_jef+ll_tot_age_au+ll_tot_sup_au+ll_tot_jef_au+ll_tot_age_lib+ll_tot_sup_lib+ll_tot_jef_lib
		if ll_tot_reg>0 then
			ls_graba									= 'S'
		else
			ls_graba									= 'N'
		end if
		if ls_graba='N' then
			messagebox("Advertencia","No Registra Premio Persistencia Sin Actualizar")
		else
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0			
			hpb_1.Position							= ldb_tot_porc
			DECLARE x1 CURSOR FOR
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A',"CADENA"."CODIGO"
			FROM		"RES_COMI", "OFERTA_V","CADENA"  
			WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
						"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
						"CADENA"."CODIGO" = 'O' and  
						"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_AGE" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_ofe AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"OFERTA_V"."ESTADO_PERSIST_AGE" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S',"CADENA"."CODIGO"
			FROM		"RES_COMI", "OFERTA_V","CADENA"  
			WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
						"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
						"CADENA"."CODIGO" = 'O' and  
						"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_SUP" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_ofe AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"OFERTA_V"."ESTADO_PERSIST_SUP" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J',"CADENA"."CODIGO"
			FROM		"RES_COMI", "OFERTA_V","CADENA"  
			WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
						"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
						"CADENA"."CODIGO" = 'O' and  
						"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
						"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
						"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_ofe AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"OFERTA_V"."ESTADO_PERSIST_JEF" <> 'P'
			UNION			
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"CADENA"."CODIGO" = 'A' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_AGENTE" and  
						"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_aum AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
	//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"ANEXO_AUMENTO"."ESTADO_PERSIST_AGE" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"CADENA"."CODIGO" = 'A' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_SUPER" and  
						"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_aum AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"ANEXO_AUMENTO"."ESTADO_PERSIST_SUP" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_AUMENTO","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"CADENA"."CODIGO" = 'A' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_AUMENTO"."COD_JEF" and  
						"RES_COMI"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_aum AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"ANEXO_AUMENTO"."ESTADO_PERSIST_JEF" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'A',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"CADENA"."CODIGO" = 'L' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_AGENTE" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_lib AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
	//					"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"ANEXO_LIBERADOR"."ESTADO_PERSIST_AGE" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'S',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"CADENA"."CODIGO" = 'L' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_SUPER" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_lib AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"ANEXO_LIBERADOR"."ESTADO_PERSIST_SUP" <> 'P'
			UNION
			SELECT DISTINCT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM",'J',"CADENA"."CODIGO"
			FROM		"RES_COMI", "ANEXO_LIBERADOR","CADENA"  
			WHERE	"CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"CADENA"."CODIGO" = 'L' and  
						"RES_COMI"."COD_AGE_SUP" = "ANEXO_LIBERADOR"."COD_JEF" and  
						"RES_COMI"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
						"RES_COMI"."CONTRATO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
						"RES_COMI"."COD_CONTABLE" = :ls_per_lib AND  
						"RES_COMI"."FECHA" = :ldt_fecha AND
//						"RES_COMI"."CONTRATO" = :ll_prueba AND 
						"ANEXO_LIBERADOR"."ESTADO_PERSIST_JEF" <> 'P'
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_codigo,	:ls_serie,	:ldb_numero,	:ls_est_premio, :ls_cargo, :ls_base;
					if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						if ls_base='O' then
							if ls_cargo='A' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_PERSIST_AGE" = :ls_est_premio  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='S' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_PERSIST_SUP" = :ls_est_premio  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='J' then
								UPDATE	"OFERTA_V"  
								SET		"ESTADO_PERSIST_JEF" = :ls_est_premio  
								WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ldb_numero )
								USING	Trans_1;	
							end if
						elseif ls_base='A' then
							if ls_cargo='A' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_PERSIST_AGE" = :ls_est_premio  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='S' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_PERSIST_SUP" = :ls_est_premio  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='J' then
								UPDATE	"ANEXO_AUMENTO"  
								SET		"ESTADO_PERSIST_JEF" = :ls_est_premio  
								WHERE	( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ldb_numero )
								USING	Trans_1;	
							end if
						elseif ls_base='L' then
							if ls_cargo='A' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_PERSIST_AGE" = :ls_est_premio  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='S' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_PERSIST_SUP" = :ls_est_premio  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
								USING	Trans_1;
							elseif ls_cargo='J' then
								UPDATE	"ANEXO_LIBERADOR"  
								SET		"ESTADO_PERSIST_JEF" = :ls_est_premio  
								WHERE	( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ldb_numero )
								USING	Trans_1;	
							end if	
						end if
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++	
						else
							rollback using Trans_1;
							ll_error++
							messagebox("Error Grabar","Error Grabar Promesa "+ls_serie+'-'+string(ldb_numero))
						end if
					end if
					setnull(ls_codigo);setnull(ls_serie);setnull(ldb_numero);setnull(ls_est_premio);setnull(ls_cargo)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.00')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
					st_cuenta.text 					= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'   Reg. Cálculados '+string(ll_graba,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				LOOP
			end if
			close x1;
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_tot_reg,'###,###,##0')+' registros grabados con exito~r~n'+&
								'y '+string(ll_error,'###,###,##0')+' registros con problemas.',information!)
			SetPointer(Arrow!)
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_comision_proceso
integer x = 2377
integer y = 752
integer width = 599
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string		ls_codigo,ls_cod_contad,ls_serie,ls_moneda,ls_estado_age,ls_estado_comi,ls_mes,ls_haber,ls_base,ls_cargo,ls_canal
long		ll_res,ll_tot_reg,ll_indi,ll_tot_pagado,ll_rut,ll_cod_parque,ll_malos,ll_cont,ll_valida_comi
datetime	ldt_fec_fin
double	ldb_numero,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_porce_pago,ldb_porce_vta,ldb_precio,ldb_monto_pago,ldb_valor_uf,&
			ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07

ldt_fec_fin							= datetime(date(em_termino.text),time('00:00:00'))
SetPointer(HourGlass!)
hpb_1.Position						= ldb_tot_porc
ll_tot_reg							= dw_proceso.rowcount()

if is_grabar = 'C' then
	ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso Comisiones?", Exclamation!, YesNo!, 2)
	ls_haber							= 'H'
elseif is_grabar = 'P' then
	ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso Premio persistencia?", Exclamation!, YesNo!, 2)
	ls_haber							= 'H'
elseif is_grabar = 'D' then
	ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso Devengamiento Comisiones?", Exclamation!, YesNo!, 2)
elseif is_grabar = 'U' then
	ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso Comisiones U.G.N.?", Exclamation!, YesNo!, 2)
elseif is_grabar = 'R' then
	ll_res	= MessageBox("Grabar","¿Desea Grabar Proceso  Devengamiento Reprogramaciones?", Exclamation!, YesNo!, 2)		
end if
if ll_res = 1 then
	for ll_indi = 1 to ll_tot_reg
		if is_grabar = 'C' or is_grabar = 'P' then
			ls_base						= dw_proceso.getitemstring(ll_indi,'codigo')
			ls_codigo						= dw_proceso.getitemstring(ll_indi,'cod_age')
			ll_rut							= dw_proceso.getitemnumber(ll_indi,'rut_age')
			ll_tot_pagado				= dw_proceso.getitemnumber(ll_indi,'tot_pagado')
			ls_cod_contad				= dw_proceso.getitemstring(ll_indi,'cod_contab')
			ldb_numero					= dw_proceso.getitemnumber(ll_indi,'numero')
			ls_serie						= dw_proceso.getitemstring(ll_indi,'serie')
			if is_grabar = 'C' then
				ls_mes					= '0'
				ldb_porce_pago		= dw_proceso.getitemnumber(ll_indi,'porce_pago')
			elseif is_grabar = 'P' then
				ls_mes					= dw_proceso.getitemstring(ll_indi,'mes')
				ldb_porce_pago		= dw_proceso.getitemnumber(ll_indi,'porce_ing_cierre')
			end if
			ldb_porce_vta				= dw_proceso.getitemnumber(ll_indi,'porce_vta')
			ldb_precio					= dw_proceso.getitemnumber(ll_indi,'precio')
			ldb_monto_pago			= dw_proceso.getitemnumber(ll_indi,'monto_pag')
			ls_moneda					= dw_proceso.getitemstring(ll_indi,'moneda')
			ls_estado_age				= dw_proceso.getitemstring(ll_indi,'estado')
			ldb_valor_uf					= dw_proceso.getitemnumber(ll_indi,'valor_uf')
			ls_estado_comi				= dw_proceso.getitemstring(ll_indi,'estado_comi')
			ll_cod_parque				= dw_proceso.getitemnumber(ll_indi,'cod_parque')
			ll_valida_comi				= wf_valida_comi(ls_serie,ldb_numero,ls_mes,ls_codigo,ls_cod_contad)
		elseif is_grabar = 'D' then
			ls_base						= dw_proceso.getitemstring(ll_indi,'codigo')
			ls_serie						= dw_proceso.getitemstring(ll_indi,'serie')
			ldb_numero					= dw_proceso.getitemnumber(ll_indi,'numero')
			ls_cargo						= dw_proceso.getitemstring(ll_indi,'cargo')
			ls_canal						= dw_proceso.getitemstring(ll_indi,'canal')
			ldb_porce_vta				= dw_proceso.getitemnumber(ll_indi,'porce_vta')
			ldb_cta_01					= dw_proceso.getitemnumber(ll_indi,'c_primera')
			ldb_cta_02					= dw_proceso.getitemnumber(ll_indi,'c_segunda')
			ldb_cta_03					= dw_proceso.getitemnumber(ll_indi,'c_tercera')
			ldb_cta_04					= dw_proceso.getitemnumber(ll_indi,'c_cuarta')
			ldb_cta_05					= dw_proceso.getitemnumber(ll_indi,'c_quinta')
			ldb_cta_06					= dw_proceso.getitemnumber(ll_indi,'c_sexta')
			ldb_cta_07					= dw_proceso.getitemnumber(ll_indi,'c_septima')
		elseif is_grabar = 'U' then
			ls_base						= 'O'
			ls_codigo						= dw_proceso.getitemstring(ll_indi,'cod_age')
			ll_rut							= dw_proceso.getitemnumber(ll_indi,'rut')
			ll_tot_pagado				= 0
			ls_cod_contad				= '089'
			ldb_numero					= 0
			ls_serie						= 'I'
			ls_mes						= '0'
			ldb_porce_pago			= 0
			ldb_porce_vta				= dw_proceso.getitemnumber(ll_indi,'porce_calc')
			ldb_precio					= dw_proceso.getitemnumber(ll_indi,'producc')
			ldb_monto_pago			= dw_proceso.getitemnumber(ll_indi,'total_comi')
			ls_moneda					= '2'
			ls_estado_age				= 'A'
			ldb_valor_uf					= dw_proceso.getitemnumber(ll_indi,'valor_uf')
			ls_estado_comi				= 'P'
			ll_cod_parque				= 1
			ll_valida_comi				= 0
		elseif is_grabar = 'R' then
			ls_base						= 'O'
			ls_codigo						= dw_proceso.getitemstring(ll_indi,'cod_age')
			ll_rut							= dw_proceso.getitemnumber(ll_indi,'rut')
			ll_tot_pagado				= 0
			ls_cod_contad				= '089'
			ldb_numero					= 0
			ls_serie						= 'I'
			ls_mes						= '0'
			ldb_porce_pago			= 0
			ldb_porce_vta				= dw_proceso.getitemnumber(ll_indi,'porce_calc')
			ldb_precio					= dw_proceso.getitemnumber(ll_indi,'producc')
			ldb_monto_pago			= dw_proceso.getitemnumber(ll_indi,'total_comi')
			ls_moneda					= '2'
			ls_estado_age				= 'A'
			ldb_valor_uf					= dw_proceso.getitemnumber(ll_indi,'valor_uf')
			ls_estado_comi				= 'P'
			ll_cod_parque				= 1
			ll_valida_comi				= 0	
		end if
		if is_grabar = 'C' or is_grabar = 'P' or is_grabar = 'U' then
			if ll_valida_comi=0 then
				if f_graba_res_comi(ls_codigo,ll_rut,ll_tot_pagado,ls_cod_contad,ls_mes,ldt_fec_fin,ldb_numero,ls_serie,ldb_porce_pago,ldb_porce_vta,ldb_precio,ldb_monto_pago,ldb_valor_uf,ls_haber,ls_moneda,ls_estado_comi,ls_estado_age,ls_base,ll_cod_parque,0,0)= -1 then
					ll_malos++
				else
					ll_cont++
				end if
			end if
		elseif is_grabar = 'D' then
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
				wf_actualiz_porc_oferta_v(ls_serie,ldb_numero,ldb_porce_vta,ls_cargo,ls_base)
				if f_graba_dev_persist(ls_base,ls_serie,ldb_numero,ls_cargo,ls_canal,ldb_porce_vta,ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07,'N')= -1 then
					ll_malos++
				else
					ll_cont++
				end if
			end if
		elseif is_grabar = 'R' then
		end if
		if ldb_tot_porc <> ldb_tot_porc_aux then 
			ldb_tot_porc_aux		= ldb_tot_porc
		end if
		ldb_tot_porc					= (ll_indi * 100) / ll_tot_reg
		hpb_1.Position 				= ldb_tot_porc
		st_porc.text					= string(ldb_tot_porc,'#0.0#')+" %"
		st_cuenta.text 				= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg,'#0.##')+'% )'
		il_tot_reg					= ll_tot_reg
		il_indi							= ll_indi
	next
	SetPointer(Arrow!)
	messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
								'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
end if
end event

type cb_exportar from commandbutton within w_comision_proceso
integer x = 2784
integer y = 1748
integer width = 224
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_proceso
if dw_proceso.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_premio_090 from commandbutton within w_comision_proceso
integer x = 1550
integer y = 1064
integer width = 690
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cálculo Persistencia"
end type

event clicked;string		ls_cod_cont,ls_base,ls_serie,ls_base_o,ls_serie_o,ls_cargo,ls_canal,ls_codigo,ls_clasif,ls_moneda,ls_mes,ls_tipo_dev,ls_orig_vta,&
			ls_pasa,ls_est_age,ls_depto_jv,ls_cod_age_2,ls_cod_age_3,ls_cod_sup_2,ls_cod_jef_2,ls_depto,ls_insertrow,ls_tipo_comi,&
			ls_moneda_o,ls_clasif_o
long		ll_tot_reg,ll_indi,ll_ctas_pag_s,ll_valida_comi,ll_tipo_comp,ll_rut_cli,ll_cod_parque,ll_rut_cargo,&
			ll_malos=0,ll_cont,ll_new,ll_new3
datetime	ldt_fec_fin,ldt_fec_finiq
double	ldb_numero,ldb_numero_o,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_valor_uf,ldb_precio,ldb_valor_cta,ldb_tot_pag,ldb_porc_pie,ldb_porc_cta,&
			ldb_pre_2,ldb_pre_4,ldb_pre_6,ldb_pre_7,ldb_tot_pie,ldb_precio_peso,ldb_comi,ldb_monto_pag,&
			ldb_porce_vta,ldb_porce_comp,ldb_precio_o

cb_grabar.visible															= true
st_det_proceso.text														= 'Cálculo Persistencia Contratos Nuevos: Promesas, Aumento Capac.'
dw_proceso.reset()
is_grabar																	= 'P'
ldt_fec_fin																	= datetime(date(em_termino.text),time('00:00:00'))
if isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Proceso")
else
	SetPointer(HourGlass!)
	if is_graba_persist='N' then
		dw_proceso.dataobject												= 'dw_premio_vtas_equivalente'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg																= dw_proceso.retrieve(ldt_fec_fin)
		is_tipo																	= 'P'	
	elseif is_graba_persist='S' then
		dw_proceso.dataobject												= 'dw_premio_vtas_equivalente_ind'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg																= dw_proceso.retrieve(is_base,is_serie,idb_numero)
		is_tipo																	= 'I'	
	end if
	hpb_1.Position																= ldb_tot_porc
	ls_insertrow																	= 'N'
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO		:ldb_valor_uf  
	FROM		"TAB_UF"  
	WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
			ldb_valor_uf															= ldb_valor_uf
		else
			messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
		end if
	else
		messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
	end if
	if ldb_valor_uf>0 then
		if ll_tot_reg >0 then
			for ll_indi=1 to ll_tot_reg
				ls_base															= dw_proceso.getitemstring(ll_indi,'codigo')
				ls_serie															= dw_proceso.getitemstring(ll_indi,'serie')
				ldb_numero														= dw_proceso.getitemnumber(ll_indi,'numero')
				ll_rut_cli															= dw_proceso.getitemnumber(ll_indi,'rut')
				ls_cargo															= dw_proceso.getitemstring(ll_indi,'cargo')
				ls_canal															= dw_proceso.getitemstring(ll_indi,'canal')
				ls_clasif															= dw_proceso.getitemstring(ll_indi,'clasifica_venta')
				ls_moneda														= dw_proceso.getitemstring(ll_indi,'moneda')
				ldb_precio														= dw_proceso.getitemnumber(ll_indi,'precio')
				ldt_fec_finiq														= dw_proceso.getitemdatetime(ll_indi,'fecha_fin')
				if ls_base='O' then
					ls_cod_cont													= '090'
				elseif ls_base='A' then
					ls_cod_cont													= '028'
				elseif ls_base='L' then
					ls_cod_cont													= '053'
				end if
				if ls_serie='R' then
					SELECT DISTINCT "CADENA_A"."CODIGO","CADENA_A"."SERIE","CADENA_A"."NUMERO","PAGO_OFERTA"."MONEDA","PAGO_OFERTA"."PRECIO","OFERTA_V_A"."CLASIFICA_VENTA"
					INTO		:ls_base_o,:ls_serie_o,:ldb_numero_o,:ls_moneda_o,:ldb_precio_o,:ls_clasif_o
					FROM		"CADENA" "CADENA_A","REPACTA_CREDITO","OFERTA_V" "OFERTA_V_A",	"CADENA" "CADENA_B","OFERTA_V" "OFERTA_V_B",	"PAGO_OFERTA"
					WHERE 	"CADENA_A"."CODIGO" = "REPACTA_CREDITO"."BASE_ORIGINAL" and  
								"CADENA_A"."SERIE" = "REPACTA_CREDITO"."SERIE_ORIGINAL" and  
								"CADENA_A"."NUMERO" = "REPACTA_CREDITO"."NUMERO_ORIGINAL" and  
								"REPACTA_CREDITO"."SERIE_ORIGINAL" = "OFERTA_V_A"."SERIE" and  
								"REPACTA_CREDITO"."NUMERO_ORIGINAL" = "OFERTA_V_A"."NRO_OFERTA" and  
								"REPACTA_CREDITO"."BASE" = "CADENA_B"."CODIGO" and  
								"REPACTA_CREDITO"."SERIE" = "CADENA_B"."SERIE" and  
								"REPACTA_CREDITO"."NUMERO" = "CADENA_B"."NUMERO" and  
								"CADENA_B"."SERIE" = "OFERTA_V_B"."SERIE" and  
								"CADENA_B"."NUMERO" = "OFERTA_V_B"."NRO_OFERTA" and  
								"OFERTA_V_A"."SERIE" = "PAGO_OFERTA"."SERIE" and  
								"OFERTA_V_A"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and
								"OFERTA_V_A"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and    
								"CADENA_A"."ESTADO" = 'P' AND  
								"REPACTA_CREDITO"."ESTADO" = 'V' AND  
								"CADENA_B"."CODIGO" = :ls_base AND
								"CADENA_B"."SERIE" = :ls_serie AND
								"CADENA_B"."NUMERO" = :ldb_numero
					USING	sqlca;
					if sqlca.sqlcode<>0 then
						if isnull(ls_moneda_o)  or ls_moneda_o=''  then ls_moneda_o=ls_moneda
						if isnull(ldb_precio_o) or ldb_precio_o=0 then ldb_precio_o=ldb_precio
						if isnull(ls_clasif_o) or ls_clasif_o='' then ls_clasif_o=ls_clasif
					else
						ls_moneda						= ls_moneda_o
						ldb_precio						= ldb_precio_o
						ls_clasif							= ls_clasif_o
					end if
					
					dw_proceso.setitem(ll_indi,'moneda',ls_moneda)
					dw_proceso.setitem(ll_indi,'precio',ldb_precio)
					dw_proceso.setitem(ll_indi,'clasifica_venta',ls_clasif)
					dw_proceso.accepttext()
				end if
				ldb_valor_cta													= dw_proceso.getitemnumber(ll_indi,'valor_cuota')
				ldb_pre_2														= dw_proceso.getitemnumber(ll_indi,'c_segunda')
				ldb_pre_4														= dw_proceso.getitemnumber(ll_indi,'c_cuarta')
				ldb_pre_6														= dw_proceso.getitemnumber(ll_indi,'c_sexta')
				ldb_pre_7														= dw_proceso.getitemnumber(ll_indi,'c_septima')
				ls_tipo_comi														= dw_proceso.getitemstring(ll_indi,'tipo_deveng')
				ll_cod_parque													= dw_proceso.getitemnumber(ll_indi,'cod_parque')
				ls_codigo															= dw_proceso.getitemstring(ll_indi,'cod_age')
				ll_rut_cargo														= dw_proceso.getitemnumber(ll_indi,'rut_age')
				ls_est_age														= dw_proceso.getitemstring(ll_indi,'estado')
				ls_depto_jv														= dw_proceso.getitemstring(ll_indi,'depto')
				if ldt_fec_finiq<ldt_fec_fin then
					ldb_tot_pag													= wf_tot_pag_comi(ls_base,ls_serie,ldb_numero,ldt_fec_finiq)
					ldb_tot_pie													= wf_total_pie(ls_base,ls_serie,ldb_numero,ldt_fec_finiq)
					ll_ctas_pag_s												= wf_cta_pag_s(ls_base,ls_serie,ldb_numero,ldt_fec_finiq)
				else
					ldb_tot_pag													= wf_tot_pag_comi(ls_base,ls_serie,ldb_numero,ldt_fec_fin)
					ldb_tot_pie													= wf_total_pie(ls_base,ls_serie,ldb_numero,ldt_fec_fin)
					ll_ctas_pag_s												= wf_cta_pag_s(ls_base,ls_serie,ldb_numero,ldt_fec_fin)
				end if
				if ls_moneda='1' then
					ldb_precio_peso											= ldb_precio
				else
					ldb_precio_peso											= ldb_precio * ldb_valor_uf
				end if
				if ls_moneda='1' then
					ldb_valor_cta												= ldb_valor_cta
				else
					ldb_valor_cta												= ldb_valor_cta * ldb_valor_uf
				end if
				ldb_porc_pie													= round(ldb_tot_pie/ldb_precio_peso*100,2)
				ldb_porc_cta													= round(ldb_valor_cta/ldb_precio_peso*100,2)
				dw_proceso.setitem(ll_indi,"tot_pagado",ldb_tot_pag)
				dw_proceso.setitem(ll_indi,"cta_pag_s",ll_ctas_pag_s)
				dw_proceso.setitem(ll_indi,"porce_ing_cierre",ldb_porc_pie)
				dw_proceso.setitem(ll_indi,"cod_contab",ls_cod_cont)
				dw_proceso.setitem(ll_indi,"valor_uf",ldb_valor_uf)
				dw_proceso.accepttext()
				ls_mes															= wf_mes_pagado(ls_serie,ldb_numero,ls_codigo,ls_cargo,ls_cod_cont)
				ls_tipo_dev														= wf_tipo_dev(ls_cargo,ldb_porc_pie,ldb_tot_pie,ldb_porc_cta)
				ldb_porce_vta													= wf_porce_pago(ls_tipo_dev,ls_mes,ls_clasif,ldb_pre_2,ldb_pre_4,ldb_pre_6,ldb_pre_7,ll_ctas_pag_s)
				ll_valida_comi													= wf_valida_comi(ls_serie,ldb_numero,is_mes,ls_codigo,ls_cod_cont)
				if ll_valida_comi>0 then
					ldb_porce_vta												= 0
				else
					ldb_porce_vta												= ldb_porce_vta
				end if
				if ls_serie= 'R' then
					SELECT DISTINCT	"TIPO_CONDOLENCIA", "CODIGO_TIPO_VTA"
					INTO 		:ll_tipo_comp,	:ls_orig_vta
					FROM		"COMISION_COMPARTIDA"  
					WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base_o ) AND  
								( "COMISION_COMPARTIDA"."SERIE" = :ls_serie_o ) AND  
								( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero_o ) AND
								( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
					USING	sqlca;
				else
					SELECT DISTINCT	"TIPO_CONDOLENCIA", "CODIGO_TIPO_VTA"
					INTO 		:ll_tipo_comp,	:ls_orig_vta
					FROM		"COMISION_COMPARTIDA"  
					WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
								( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
								( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND
								( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_tipo_comp) then
						ls_pasa													= 'S'
					else
						ls_pasa													= 'N'
					end if
				else
					ls_pasa														= 'N'
				end if
				if ls_pasa='N' then
					ldb_comi														= ldb_porce_vta
					ldb_monto_pag												= round(ldb_precio_peso * ldb_comi / 100,0)
					dw_proceso.setitem(ll_indi,"porce_vta",ldb_comi)
					dw_proceso.setitem(ll_indi,"monto_pag",ldb_monto_pag)
					dw_proceso.setitem(ll_indi,"estado_comi",is_estado)
					dw_proceso.setitem(ll_indi,"mes",is_mes)
					dw_proceso.accepttext()
	//				if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_cont,is_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porc_pie,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,is_estado,ls_est_age,'O',ll_cod_parque)= -1 then
	//					ll_malos++
	//				else
	//					ll_cont++
	//				end if
				else
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						if ls_serie= 'R' then
							SELECT DISTINCT	"TIPO_CONDOLENCIA",	"CODIGO_TIPO_VTA",	"COD_AGE_2",	"COD_AGE_3",	"COD_SUP_2",	"COD_JEFE_2"
							INTO 		:ll_tipo_comp,	:ls_orig_vta,		:ls_cod_age_2,	:ls_cod_age_3,	:ls_cod_sup_2,	:ls_cod_jef_2
							FROM		"COMISION_COMPARTIDA"  
							WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base_o ) AND  
										( "COMISION_COMPARTIDA"."SERIE" = :ls_serie_o ) AND  
										( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero_o ) AND
										( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
							USING	sqlca;
						else
							SELECT DISTINCT	"TIPO_CONDOLENCIA",	"CODIGO_TIPO_VTA",	"COD_AGE_2",	"COD_AGE_3",	"COD_SUP_2",	"COD_JEFE_2"
							INTO 		:ll_tipo_comp,	:ls_orig_vta,		:ls_cod_age_2,	:ls_cod_age_3,	:ls_cod_sup_2,	:ls_cod_jef_2
							FROM		"COMISION_COMPARTIDA"  
							WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
										( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
										( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND
										( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
							USING	sqlca;
						end if
						if sqlca.sqlcode=0 then
							if not isnull(ll_tipo_comp) and ls_orig_vta<>'' then
								if ls_cargo='S' or ls_cargo='J' then
									if ls_codigo=ls_cod_sup_2 then
										ls_insertrow				= 'N'
									elseif ls_codigo=ls_cod_jef_2 then
										ls_insertrow				= 'N'
									else
										ls_insertrow				= 'S'
									end if
								else
									ls_insertrow					= 'S'
								end if
								if ls_orig_vta = '3' or ls_orig_vta = 'C' or ls_orig_vta = 'U' or ls_orig_vta = 'E' then
									ls_orig_vta									= ls_orig_vta
								else
									ls_orig_vta									= '5'
								end if
								if ls_insertrow='S' then
									ldb_porce_comp							= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'O',1)
								else
									ldb_porce_comp							= 1
								end if
								ldb_comi											= ldb_porce_vta *	ldb_porce_comp	
								ldb_monto_pag									= round(ldb_precio_peso * ldb_comi / 100,0)
								dw_proceso.setitem(ll_indi,"porce_vta",ldb_comi)
								dw_proceso.setitem(ll_indi,"monto_pag",ldb_monto_pag)
								dw_proceso.setitem(ll_indi,"estado_comi",is_estado)
								dw_proceso.setitem(ll_indi,"mes",is_mes)
								dw_proceso.accepttext()
	//							if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_cont,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porc_pie,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,is_estado,ls_est_age,'O',ll_cod_parque)= -1 then
	//								ll_malos++
	//							else
	//								ll_cont++
	//							end if
								if ls_insertrow='S' then
									if ls_orig_vta = '3' or ls_orig_vta = 'C' or ls_orig_vta = 'U' or ls_orig_vta = 'E' then
										if ls_cargo='A' or ls_cargo='S' or ls_cargo='J' and (ll_tipo_comp=1 or ll_tipo_comp=2 or ll_tipo_comp=3 or ll_tipo_comp=4)  then
											if ls_cargo='A' then
												SELECT	"COD_AGE",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"AGENTES"  
												WHERE	"AGENTES"."COD_AGE" = :ls_cod_age_2
												USING	sqlca;
											elseif ls_cargo='S' then
												SELECT	"COD_SUP",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"SUPERVISOR"  
												WHERE	"SUPERVISOR"."COD_SUP" = :ls_cod_sup_2
												USING	sqlca;
											elseif ls_cargo='J' then
												SELECT	"JEFE_VENTAS",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"JEFE_VENTAS"  
												WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef_2
												USING	sqlca;	
											end if
											if sqlca.sqlcode=0 then
												if not isnull(ll_rut_cargo) and not isnull(ls_est_age) and not isnull(ls_canal) and not isnull(ls_depto) and not isnull(ls_cargo) then
													if ls_cargo='A' and ll_tipo_comp=1 then
														ls_insertrow					= 'N'
													else
														ls_insertrow					= 'S'
													end if
													if ls_insertrow='S' then		
														ll_new						= dw_proceso.insertrow(0)
														dw_proceso.scrolltorow(ll_new)
														dw_proceso.setitem(ll_new,'codigo',ls_base)
														dw_proceso.setitem(ll_new,'serie',ls_serie)
														dw_proceso.setitem(ll_new,'numero',ldb_numero)
														dw_proceso.setitem(ll_new,'rut',ll_rut_cli)
														dw_proceso.setitem(ll_new,'clasifica_venta',ls_clasif)
														dw_proceso.setitem(ll_new,'cod_contab',ls_cod_cont)
														dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
														dw_proceso.setitem(ll_new,'cod_parque',ll_cod_parque)
														dw_proceso.setitem(ll_new,'moneda',ls_moneda)
														dw_proceso.setitem(ll_new,'precio',ldb_precio)
														dw_proceso.setitem(ll_new,'valor_cuota',ldb_valor_cta)
														dw_proceso.setitem(ll_new,'c_segunda',ldb_pre_2)
														dw_proceso.setitem(ll_new,'c_cuarta',ldb_pre_4)
														dw_proceso.setitem(ll_new,'c_sexta',ldb_pre_6)
														dw_proceso.setitem(ll_new,'c_septima',ldb_pre_7)
														dw_proceso.setitem(ll_new,"tot_pagado",ldb_tot_pag)
														dw_proceso.setitem(ll_new,"cta_pag_s",ll_ctas_pag_s)
														dw_proceso.setitem(ll_new,"porce_ing_cierre",ldb_porc_pie)
														dw_proceso.accepttext()
														dw_proceso.setitem(ll_new,'cod_age',ls_codigo)
														dw_proceso.setitem(ll_new,'rut_age',ll_rut_cargo)
														dw_proceso.setitem(ll_new,'estado',ls_est_age)
														dw_proceso.setitem(ll_new,'canal',ls_canal)
														dw_proceso.setitem(ll_new,'depto',ls_depto)
														dw_proceso.setitem(ll_new,'cargo',ls_cargo)
														ldb_porce_comp			= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'N',2)
														ldb_comi						= ldb_porce_vta *	ldb_porce_comp	
														ldb_monto_pag				= round(ldb_precio_peso * ldb_comi / 100,0)
														dw_proceso.setitem(ll_new,"porce_vta",ldb_comi)
														dw_proceso.setitem(ll_new,"monto_pag",ldb_monto_pag)
														dw_proceso.setitem(ll_new,"estado_comi",is_estado)
														dw_proceso.setitem(ll_new,"mes",is_mes)
														dw_proceso.accepttext()
		//												if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_cont,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porc_pie,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,is_estado,ls_est_age,'O',ll_cod_parque)= -1 then
		//													ll_malos++
		//												else
		//													ll_cont++
		//												end if
													end if
												end if
											end if
											if ls_cargo='A' and (ll_tipo_comp=3 or ll_tipo_comp=4)  then
												SELECT	"COD_AGE",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"AGENTES"  
												WHERE	"AGENTES"."COD_AGE" = :ls_cod_age_3
												USING	sqlca;
												if sqlca.sqlcode=0 then
													if not isnull(ll_rut_cargo) and not isnull(ls_est_age) and not isnull(ls_canal) and not isnull(ls_depto) and not isnull(ls_cargo) then
														ll_new3						= dw_proceso.insertrow(0)
														dw_proceso.scrolltorow(ll_new3)
														dw_proceso.setitem(ll_new3,'codigo',ls_base)
														dw_proceso.setitem(ll_new3,'serie',ls_serie)
														dw_proceso.setitem(ll_new3,'numero',ldb_numero)
														dw_proceso.setitem(ll_new3,'rut',ll_rut_cli)
														dw_proceso.setitem(ll_new3,'clasifica_venta',ls_clasif)
														dw_proceso.setitem(ll_new3,'cod_contab',ls_cod_cont)
														dw_proceso.setitem(ll_new3,'valor_uf',ldb_valor_uf)
														dw_proceso.setitem(ll_new3,'cod_parque',ll_cod_parque)
														dw_proceso.setitem(ll_new3,'moneda',ls_moneda)
														dw_proceso.setitem(ll_new3,'precio',ldb_precio)
														dw_proceso.setitem(ll_new3,'valor_cuota',ldb_valor_cta)
														dw_proceso.setitem(ll_new3,'c_segunda',ldb_pre_2)
														dw_proceso.setitem(ll_new3,'c_cuarta',ldb_pre_4)
														dw_proceso.setitem(ll_new3,'c_sexta',ldb_pre_6)
														dw_proceso.setitem(ll_new3,'c_septima',ldb_pre_7)
														dw_proceso.setitem(ll_new3,"tot_pagado",ldb_tot_pag)
														dw_proceso.setitem(ll_new3,"cta_pag_s",ll_ctas_pag_s)
														dw_proceso.setitem(ll_new3,"porce_ing_cierre",ldb_porc_pie)
														dw_proceso.accepttext()
														dw_proceso.setitem(ll_new3,'cod_age',ls_codigo)
														dw_proceso.setitem(ll_new3,'rut_age',ll_rut_cargo)
														dw_proceso.setitem(ll_new3,'estado',ls_est_age)
														dw_proceso.setitem(ll_new3,'canal',ls_canal)
														dw_proceso.setitem(ll_new3,'depto',ls_depto)
														dw_proceso.setitem(ll_new3,'cargo',ls_cargo)
														ldb_porce_comp			= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'N',3)
														ldb_comi						= ldb_porce_vta *	ldb_porce_comp	
														ldb_monto_pag				= round(ldb_precio_peso * ldb_comi / 100,0)
														dw_proceso.setitem(ll_new3,"porce_vta",ldb_comi)
														dw_proceso.setitem(ll_new3,"monto_pag",ldb_monto_pag)
														dw_proceso.setitem(ll_new3,"estado_comi",is_estado)
														dw_proceso.setitem(ll_new3,"mes",is_mes)
														dw_proceso.accepttext()
		//												if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_cont,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porc_pie,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,is_estado,ls_est_age,'O',ll_cod_parque)= -1 then
		//													ll_malos++
		//												else
		//													ll_cont++
		//												end if
													end if
												end if
											end if
										end if
									elseif ls_orig_vta='5' then
										if ll_tipo_comp=2 and (ls_cargo='A' or ls_cargo= 'S' or ls_cargo= 'J') then
											if ls_cargo='A' then
												SELECT	"COD_AGE",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"AGENTES"  
												WHERE	"AGENTES"."COD_AGE" = :ls_cod_age_2
												USING	sqlca;
											elseif ls_cargo='S' then
												if ls_cod_sup_2= '0126K' then
													ls_cod_sup_2					= 'CS'
												else
													ls_cod_sup_2					= ls_cod_sup_2
												end if
												SELECT	"COD_SUP",	"RUT",			"ESTADO",	"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"SUPERVISOR"  
												WHERE	"SUPERVISOR"."COD_SUP" = :ls_cod_sup_2
												USING	sqlca;
											elseif ls_cargo='J' then
												SELECT	"JEFE_VENTAS",	"RUT",			"ESTADO",	"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,			:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"JEFE_VENTAS"  
												WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef_2
												USING	sqlca;	
											end if
											if sqlca.sqlcode=0 then
												if not isnull(ll_rut_cargo) and not isnull(ls_est_age) and not isnull(ls_canal) and not isnull(ls_depto) and not isnull(ls_cargo) then
													if ls_canal='NF' then
														ls_orig_vta					= 'X'
													else
														ls_orig_vta					= ls_orig_vta
													end if
													if ll_cod_parque=11 then
														if ls_cargo='S' or ls_cargo='J' then
															ls_insertrow				= 'N'
														else
															ls_insertrow				= 'S'
														end if
													else
														if ls_cargo='J' and ls_canal='NI' then
															ls_insertrow				= 'S'
														elseif ls_cargo='S' and ls_canal='NI' then
															ls_insertrow				= 'N' //modificación JU3		
														else
															ls_insertrow				= 'S'
														end if
													end if
													if ls_insertrow='S' then		
														ll_new						= dw_proceso.insertrow(0)
														dw_proceso.scrolltorow(ll_new)
														dw_proceso.setitem(ll_new,'codigo',ls_base)
														dw_proceso.setitem(ll_new,'serie',ls_serie)
														dw_proceso.setitem(ll_new,'numero',ldb_numero)
														dw_proceso.setitem(ll_new,'rut',ll_rut_cli)
														dw_proceso.setitem(ll_new,'clasifica_venta',ls_clasif)
														dw_proceso.setitem(ll_new,'cod_contab',ls_cod_cont)
														dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
														dw_proceso.setitem(ll_new,'cod_parque',ll_cod_parque)
														dw_proceso.setitem(ll_new,'moneda',ls_moneda)
														dw_proceso.setitem(ll_new,'precio',ldb_precio)
														dw_proceso.setitem(ll_new,'valor_cuota',ldb_valor_cta)
														dw_proceso.setitem(ll_new,'c_segunda',ldb_pre_2)
														dw_proceso.setitem(ll_new,'c_cuarta',ldb_pre_4)
														dw_proceso.setitem(ll_new,'c_sexta',ldb_pre_6)
														dw_proceso.setitem(ll_new,'c_septima',ldb_pre_7)
														dw_proceso.setitem(ll_new,"tot_pagado",ldb_tot_pag)
														dw_proceso.setitem(ll_new,"cta_pag_s",ll_ctas_pag_s)
														dw_proceso.setitem(ll_new,"porce_ing_cierre",ldb_porc_pie)
														dw_proceso.setitem(ll_new,'cod_age',ls_codigo)
														dw_proceso.setitem(ll_new,'rut_age',ll_rut_cargo)
														dw_proceso.setitem(ll_new,'estado',ls_est_age)
														dw_proceso.setitem(ll_new,'canal',ls_canal)
														dw_proceso.setitem(ll_new,'depto',ls_depto)
														dw_proceso.setitem(ll_new,'cargo',ls_cargo)
														ldb_porce_comp			= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'N',2)
														if ls_cargo='S' and ls_canal='NI' and gs_conexion = "Parque El Prado" then //sup NI
															ldb_porce_vta			= 0
														else
															ldb_porce_vta			= ldb_porce_vta
														end if
														ldb_comi						= ldb_porce_vta *	ldb_porce_comp	
														ldb_monto_pag				= round(ldb_precio_peso * ldb_comi / 100,0)
														dw_proceso.setitem(ll_new,"porce_vta",ldb_comi)
														dw_proceso.setitem(ll_new,"monto_pag",ldb_monto_pag)
														dw_proceso.setitem(ll_new,"estado_comi",is_estado)
														dw_proceso.setitem(ll_new,"mes",is_mes)
														dw_proceso.accepttext()
		//												if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_cont,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porc_pie,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,is_estado,ls_est_age,'O',ll_cod_parque)= -1 then
		//													ll_malos++
		//												else
		//													ll_cont++
		//												end if
													end if
												end if
											end if
										end if
									end if
								end if
							end if
						end if
					end if
				end if
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					ldb_tot_porc_aux											= ldb_tot_porc
				end if
				ldb_tot_porc														= (ll_indi * 100) / ll_tot_reg
				hpb_1.Position 													= ldb_tot_porc
				st_porc.text														= string(ldb_tot_porc,'#0.00')+" %"
				st_cuenta.text 													= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				dw_proceso.accepttext()
			next
			dw_proceso.setFilter("porce_vta > 0")
			dw_proceso.filter()
			SetPointer(Arrow!)
		else
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
end if
end event

type cb_filtrar from commandbutton within w_comision_proceso
integer x = 2784
integer y = 1852
integer width = 224
integer height = 92
integer taborder = 20
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
dw_proceso.SETfilter(NULO)
dw_proceso.filter()
end event

type cb_ordenar from commandbutton within w_comision_proceso
integer x = 2784
integer y = 1956
integer width = 224
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_proceso.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_proceso.SETSORT(NULO)
	dw_proceso.SORT()
end if
end event

type cb_cta_cte from commandbutton within w_comision_proceso
integer x = 78
integer y = 784
integer width = 453
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

if is_tipo='P' then
	if dw_proceso.dataobject='dw_comision_vtas_equi_deveng_reprog' and dw_proceso.rowcount() > 0 then
		gs_base						= dw_proceso.getitemstring(il_row,'vista_comis_reprog_base_original')
		gs_serie						= dw_proceso.getitemstring(il_row,'vista_comis_reprog_serie_original')
		gi_numero 					= dw_proceso.getitemnumber(il_row,'vista_comis_reprog_numero_original')
		gi_rut							= dw_proceso.getitemnumber(il_row,'vista_comis_reprog_rut')
	else
		gs_base						= dw_proceso.getitemstring(il_row,'codigo')
		gs_serie						= dw_proceso.getitemstring(il_row,'serie')
		gi_numero 					= dw_proceso.getitemnumber(il_row,'numero')
		gi_rut							= dw_proceso.getitemnumber(il_row,'rut')
	end if
elseif is_tipo='I' then
	gs_base							= dw_modif_datos.getitemstring(il_row,'base')
	gs_serie							= dw_modif_datos.getitemstring(il_row,'serie')
	gi_numero 						= dw_modif_datos.getitemnumber(il_row,'numero')
end if
CHOOSE CASE gs_base
	CASE "O" // Oferta
		if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
		Open(w_cuenta_corriente_oferta)
	CASE "L" // Anexo Liberador
		if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
		Open(w_cuenta_corriente_liberador)
	CASE "A" // Aumento Capacidad
		if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
		Open(w_cuenta_corriente_aumento_capacidad)
	CASE "P" // Pagaré
		if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
		Open(w_cuenta_corriente_pagare)
	CASE "C" // Contrato ISA	
		if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
		Open(w_cuenta_corriente_contrato_isa)
	CASE "D" // Derecho Especial
		if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
		Open(w_cuenta_corriente_derecho)
	CASE "R" //Repactación Ctas.Mantencion
		if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
		Open(w_cuenta_corriente_repactar_cta_mant)
END CHOOSE
end event

type cb_comi_089 from commandbutton within w_comision_proceso
integer x = 1550
integer y = 960
integer width = 690
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cálculo Comisiones"
end type

event clicked;string		ls_cod_cont,ls_mes,ls_insertrow,ls_base,ls_serie,ls_base_o,ls_serie_o,ls_cargo,ls_clasif,ls_moneda,ls_codigo,ls_est_age,ls_depto_jv,&
			ls_orig_vta,ls_pasa,ls_est_comi,ls_cod_age_2,ls_cod_age_3,ls_cod_sup_2,ls_cod_jef_2,ls_canal,ls_depto,ls_tipo_comi,&
			ls_moneda_o,ls_tipo,ls_cod_age_o,ls_cod_sup_o,ls_cod_jef_o
long		ll_tot_reg,ll_indi,ll_rut_cli,ll_cod_parque,ll_rut_cargo,ll_tipo_comp,ll_new,ll_new3,ll_cont,ll_malos,ll_valida_comi
datetime	ldt_fec_fin,ldt_fec_finiq
double	ldb_numero,ldb_numero_o,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_valor_uf,ldb_precio,ldb_porce_vta,ldb_precio_peso,ldb_tot_pag,ldb_porce_ing,ldb_comi,&
			ldb_monto_pag,ldb_porce_comp,ldb_precio_o
			
cb_grabar.visible								= true
st_det_proceso.text							= 'Cálculo Comisiones Contratos Nuevos: Promesas, Aumento Capac.'
dw_proceso.reset()
SetPointer(HourGlass!)
is_grabar										= 'C'
ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
if isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Proceso")
else
	if is_graba_comi='N' then
		dw_proceso.dataobject					= 'dw_comision_vtas_equivalente'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg									= dw_proceso.retrieve(ldt_fec_fin)
		is_tipo										= 'P'	
	elseif is_graba_comi='S' then
		dw_proceso.dataobject					= 'dw_comision_vtas_equivalente_ind'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg									= dw_proceso.retrieve(is_base,is_serie,idb_numero)
		is_tipo										= 'I'	
	end if
	
	hpb_1.Position									= ldb_tot_porc
	ls_mes											= '0'
	ls_insertrow										= 'S'
	SELECT	"TAB_UF"."VALOR_UF"
	INTO		:ldb_valor_uf
	FROM		"TAB_UF"
	WHERE	"TAB_UF"."FECHA_UF" = :ldt_fec_fin
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
			ldb_valor_uf								= ldb_valor_uf
		else
			messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
		end if
	else
		messagebox("Advertencia","Fecha Término No Registra Valor U.F.")
	end if
	if ldb_valor_uf>0 then
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_base									= dw_proceso.getitemstring(ll_indi,'codigo')
				ls_serie									= dw_proceso.getitemstring(ll_indi,'serie')
				ldb_numero								= dw_proceso.getitemnumber(ll_indi,'numero')
				ls_cargo									= dw_proceso.getitemstring(ll_indi,'cargo')
				ls_canal									= dw_proceso.getitemstring(ll_indi,'canal')
				ll_rut_cli									= dw_proceso.getitemnumber(ll_indi,'rut')
				ls_clasif									= dw_proceso.getitemstring(ll_indi,'clasifica_venta')
				ll_cod_parque							= dw_proceso.getitemnumber(ll_indi,'cod_parque')
				ls_moneda								= dw_proceso.getitemstring(ll_indi,'moneda')
				ldb_precio								= dw_proceso.getitemnumber(ll_indi,'precio')
				ldt_fec_finiq								= dw_proceso.getitemdatetime(ll_indi,'fecha_fin')
				
				
				if ls_serie='R' then
					SELECT DISTINCT	"CADENA_A"."CODIGO","CADENA_A"."SERIE","CADENA_A"."NUMERO","PAGO_OFERTA"."MONEDA","PAGO_OFERTA"."PRECIO"
					INTO		:ls_base_o,:ls_serie_o,:ldb_numero_o,:ls_moneda_o,:ldb_precio_o
					FROM		"CADENA" "CADENA_A","REPACTA_CREDITO","OFERTA_V" "OFERTA_V_A",	"CADENA" "CADENA_B","OFERTA_V" "OFERTA_V_B",	"PAGO_OFERTA"
					WHERE 	"CADENA_A"."CODIGO" = "REPACTA_CREDITO"."BASE_ORIGINAL" and  
								"CADENA_A"."SERIE" = "REPACTA_CREDITO"."SERIE_ORIGINAL" and  
								"CADENA_A"."NUMERO" = "REPACTA_CREDITO"."NUMERO_ORIGINAL" and  
								"REPACTA_CREDITO"."SERIE_ORIGINAL" = "OFERTA_V_A"."SERIE" and  
								"REPACTA_CREDITO"."NUMERO_ORIGINAL" = "OFERTA_V_A"."NRO_OFERTA" and  
								"REPACTA_CREDITO"."BASE" = "CADENA_B"."CODIGO" and  
								"REPACTA_CREDITO"."SERIE" = "CADENA_B"."SERIE" and  
								"REPACTA_CREDITO"."NUMERO" = "CADENA_B"."NUMERO" and  
								"CADENA_B"."SERIE" = "OFERTA_V_B"."SERIE" and  
								"CADENA_B"."NUMERO" = "OFERTA_V_B"."NRO_OFERTA" and  
								"OFERTA_V_A"."SERIE" = "PAGO_OFERTA"."SERIE" and  
								"OFERTA_V_A"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and
								"OFERTA_V_A"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and    
								"CADENA_A"."ESTADO" = 'P' AND  
								"REPACTA_CREDITO"."ESTADO" = 'V' AND  
								"CADENA_B"."CODIGO" = :ls_base AND
								"CADENA_B"."SERIE" = :ls_serie AND
								"CADENA_B"."NUMERO" = :ldb_numero
					USING	sqlca;
					if sqlca.sqlcode<>0 then
						if isnull(ls_moneda_o)  or ls_moneda_o=''  then ls_moneda_o=ls_moneda
						if isnull(ldb_precio_o) or ldb_precio_o=0 then ldb_precio_o=ldb_precio
					else
						ls_moneda						= ls_moneda_o
						ldb_precio						= ldb_precio_o
					end if
					dw_proceso.setitem(ll_indi,'moneda',ls_moneda)
					dw_proceso.setitem(ll_indi,'precio',ldb_precio)
					dw_proceso.accepttext()
				end if
				ldb_porce_vta							= dw_proceso.getitemnumber(ll_indi,'porce_comi')
				ls_tipo_comi								= dw_proceso.getitemstring(ll_indi,'tipo_deveng')
				if ls_tipo_comi='A' then
					if ls_cargo='A' then
						ls_cod_cont						= '037'
					else
						ls_cod_cont						= '023'
					end if
				elseif ls_tipo_comi='N' then
					if ls_base='O' then
						ls_cod_cont						= '089'
					elseif ls_base='A' then
						ls_cod_cont						= '050'
					elseif ls_base='L' then
						ls_cod_cont						= '036'
					end if
				end if
				ll_rut_cargo								= dw_proceso.getitemnumber(ll_indi,'rut_age')
				ls_codigo									= dw_proceso.getitemstring(ll_indi,'cod_age')
				ls_est_age								= dw_proceso.getitemstring(ll_indi,'estado')
				ls_depto_jv								= dw_proceso.getitemstring(ll_indi,'depto')
				if ls_moneda='1' then
					ldb_precio_peso					= ldb_precio
				else
					ldb_precio_peso					= ldb_precio * ldb_valor_uf
				end if
				if ldt_fec_finiq<ldt_fec_fin then
					ldb_tot_pag							= wf_tot_pag_comi(ls_base,ls_serie,ldb_numero,ldt_fec_finiq)
				else
					ldb_tot_pag							= wf_tot_pag_comi(ls_base,ls_serie,ldb_numero,ldt_fec_fin)
				end if
				ldb_porce_ing							= round(ldb_tot_pag / ldb_precio_peso * 100 ,2)
				dw_proceso.setitem(ll_indi,'cod_contab',ls_cod_cont)
				dw_proceso.setitem(ll_indi,'valor_uf',ldb_valor_uf)
				dw_proceso.setitem(ll_indi,'tot_pagado',ldb_tot_pag)
				dw_proceso.setitem(ll_indi,'porce_pago',ldb_porce_ing)
				dw_proceso.accepttext()
				
				if ls_serie= 'R' then
					SELECT DISTINCT	"TIPO_CONDOLENCIA", "CODIGO_TIPO_VTA"
					INTO 		:ll_tipo_comp,	:ls_orig_vta
					FROM		"COMISION_COMPARTIDA"  
					WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base_o ) AND  
								( "COMISION_COMPARTIDA"."SERIE" = :ls_serie_o ) AND  
								( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero_o ) AND
								( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
					USING	sqlca;
				else
					SELECT DISTINCT	"TIPO_CONDOLENCIA", "CODIGO_TIPO_VTA"
					INTO 		:ll_tipo_comp,	:ls_orig_vta
					FROM		"COMISION_COMPARTIDA"  
					WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
								( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
								( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND
								( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_tipo_comp) then
						ls_pasa							= 'S'
					else
						ls_pasa							= 'N'
					end if
				else
					ls_pasa								= 'N'
				end if
				ll_valida_comi							= wf_valida_comi(ls_serie,ldb_numero,'0',ls_codigo,ls_cod_cont)
				if ll_valida_comi>0 then
					ldb_porce_vta						= 0
				else
					ldb_porce_vta						= ldb_porce_vta
				end if
				if ls_pasa='N' then
					ldb_comi								= ldb_porce_vta
//					if ls_cargo='S' and ls_canal='NI' and ldb_porce_ing<idb_porcentaje and gs_conexion = "Parque El Prado" then //sup NI
					if ls_cargo='S' and ls_canal='NI'  then //sup NI
						ldb_comi							= 0
					else
						ldb_comi							= ldb_comi
					end if
					ldb_monto_pag						= round(ldb_precio_peso * ldb_comi / 100,0)
					ls_est_comi							= 'P'
					dw_proceso.setitem(ll_indi,'porce_vta',ldb_comi)
					dw_proceso.setitem(ll_indi,'monto_pag',ldb_monto_pag)
					dw_proceso.setitem(ll_indi,'estado_comi',ls_est_comi)
					dw_proceso.accepttext()
		//			if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_contab,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porce_pag,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,ls_est_comi,ls_est_age,'O',ll_cod_parque)= -1 then
		//				ll_malos++
		//			else
		//				ll_cont++
		//			end if
				else
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
						if ls_serie= 'R' then
							SELECT DISTINCT	"TIPO_CONDOLENCIA",	"CODIGO_TIPO_VTA",	"COD_AGE_2",	"COD_AGE_3",	"COD_SUP_2",	"COD_JEFE_2"
							INTO 		:ll_tipo_comp,	:ls_orig_vta,		:ls_cod_age_2,	:ls_cod_age_3,	:ls_cod_sup_2,	:ls_cod_jef_2
							FROM		"COMISION_COMPARTIDA"  
							WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base_o ) AND  
										( "COMISION_COMPARTIDA"."SERIE" = :ls_serie_o ) AND  
										( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero_o ) AND
										( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
							USING	sqlca;
						else
							SELECT DISTINCT	"TIPO_CONDOLENCIA",	"CODIGO_TIPO_VTA",	"COD_AGE_2",	"COD_AGE_3",	"COD_SUP_2",	"COD_JEFE_2"
							INTO 		:ll_tipo_comp,	:ls_orig_vta,		:ls_cod_age_2,	:ls_cod_age_3,	:ls_cod_sup_2,	:ls_cod_jef_2
							FROM		"COMISION_COMPARTIDA"  
							WHERE	( "COMISION_COMPARTIDA"."BASE" = :ls_base ) AND  
										( "COMISION_COMPARTIDA"."SERIE" = :ls_serie ) AND  
										( "COMISION_COMPARTIDA"."NUMERO" = :ldb_numero ) AND
										( "COMISION_COMPARTIDA"."ESTADO" = 'V' )
							USING	sqlca;
						end if
						if sqlca.sqlcode=0 then
							if not isnull(ll_tipo_comp) and ls_orig_vta<>'' then
								if ls_cargo='S' or ls_cargo='J' then
									if ls_codigo=ls_cod_sup_2 then
										ls_insertrow				= 'N'
									elseif ls_codigo=ls_cod_jef_2 then
										ls_insertrow				= 'N'
									else
										ls_insertrow				= 'S'
									end if
								else
									ls_insertrow					= 'S'
								end if
								if ls_orig_vta = '3' or ls_orig_vta = 'C' or ls_orig_vta = 'U' or ls_orig_vta = 'E' then
									ls_orig_vta					= ls_orig_vta
								else
									ls_orig_vta					= '5'
								end if
								if 	ls_insertrow='S' then
									ldb_porce_comp			= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'O',1)
								else
									ldb_porce_comp			= 1
								end if
								ldb_comi							= ldb_porce_vta *	ldb_porce_comp
								ldb_monto_pag					= round(ldb_precio_peso * ldb_comi / 100,0)
								ls_est_comi						= 'P'
								dw_proceso.setitem(ll_indi,'porce_vta',ldb_comi)
								dw_proceso.setitem(ll_indi,'monto_pag',ldb_monto_pag)
								dw_proceso.setitem(ll_indi,'estado_comi',ls_est_comi)
								dw_proceso.accepttext()
		//						if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_contab,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porce_pag,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,ls_est_comi,ls_est_age,'O',ll_cod_parque)= -1 then
		//							ll_malos++
		//						else
		//							ll_cont++
		//						end if
								if ls_insertrow='S' then							
									if ls_orig_vta = '3' or ls_orig_vta = 'C' or ls_orig_vta = 'U' or ls_orig_vta = 'E' then
										if ls_cargo='A' or ls_cargo='S'  or ls_cargo='J' and (ll_tipo_comp=1 or ll_tipo_comp=2 or ll_tipo_comp=3 or ll_tipo_comp=4)  then
											if ls_cargo='A' then
												SELECT	"COD_AGE",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"AGENTES"  
												WHERE	"AGENTES"."COD_AGE" = :ls_cod_age_2
												USING	sqlca;
											elseif ls_cargo='S' then
												SELECT	"COD_SUP",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"SUPERVISOR"  
												WHERE	"SUPERVISOR"."COD_SUP" = :ls_cod_sup_2
												USING	sqlca;		
											elseif ls_cargo='J' then
												SELECT	"JEFE_VENTAS",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"JEFE_VENTAS"  
												WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef_2
												USING	sqlca;	
											end if
											if sqlca.sqlcode=0 then
												if not isnull(ll_rut_cargo) and not isnull(ls_est_age) and not isnull(ls_canal) and not isnull(ls_depto) and not isnull(ls_cargo) then
													if ls_cargo='A' and ll_tipo_comp=1 then
														ls_insertrow						= 'N'
													else
														ls_insertrow						= 'S'
													end if
													if ls_insertrow='S' then		
														ll_new							= dw_proceso.insertrow(0)
														dw_proceso.scrolltorow(ll_new)
														dw_proceso.setitem(ll_new,'codigo',ls_base)
														dw_proceso.setitem(ll_new,'serie',ls_serie)
														dw_proceso.setitem(ll_new,'numero',ldb_numero)
														dw_proceso.setitem(ll_new,'rut',ll_rut_cli)
														dw_proceso.setitem(ll_new,'clasifica_venta',ls_clasif)
														dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
														dw_proceso.setitem(ll_new,'cod_parque',ll_cod_parque)
														dw_proceso.setitem(ll_new,'moneda',ls_moneda)
														dw_proceso.setitem(ll_new,'precio',ldb_precio)
														dw_proceso.setitem(ll_new,'porce_comi',ldb_porce_vta)
														dw_proceso.setitem(ll_new,'cod_contab',ls_cod_cont)
														dw_proceso.setitem(ll_new,'tot_pagado',ldb_tot_pag)
														dw_proceso.setitem(ll_new,'porce_pago',ldb_porce_ing)
														dw_proceso.accepttext()
														dw_proceso.setitem(ll_new,'cod_age',ls_codigo)
														dw_proceso.setitem(ll_new,'rut_age',ll_rut_cargo)
														dw_proceso.setitem(ll_new,'estado',ls_est_age)
														dw_proceso.setitem(ll_new,'canal',ls_canal)
														dw_proceso.setitem(ll_new,'depto',ls_depto)
														dw_proceso.setitem(ll_new,'cargo',ls_cargo)
														ldb_porce_comp				= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'N',2)
														ldb_comi							= ldb_porce_vta *	ldb_porce_comp	
														ldb_monto_pag					= round(ldb_precio_peso * ldb_comi / 100,0)
														ls_est_comi						= 'P'
														dw_proceso.setitem(ll_new,'porce_vta',ldb_comi)
														dw_proceso.setitem(ll_new,'monto_pag',ldb_monto_pag)
														dw_proceso.setitem(ll_new,'estado_comi',ls_est_comi)
														dw_proceso.accepttext()
			//											if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_contab,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porce_pag,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,ls_est_comi,ls_est_age,'O',ll_cod_parque)= -1 then
			//												ll_malos++
			//											else
			//												ll_cont++
			//											end if
													end if
												end if
											end if
											if ls_cargo='A' and (ll_tipo_comp=3 or ll_tipo_comp=4)  then
												SELECT	"COD_AGE",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"AGENTES"  
												WHERE	"AGENTES"."COD_AGE" = :ls_cod_age_3
												USING	sqlca;
												if sqlca.sqlcode=0 then
													if not isnull(ll_rut_cargo) and not isnull(ls_est_age) and not isnull(ls_canal) and not isnull(ls_depto) and not isnull(ls_cargo) then
														ll_new3							= dw_proceso.insertrow(0)
														dw_proceso.scrolltorow(ll_new3)
														dw_proceso.setitem(ll_new3,'codigo',ls_base)
														dw_proceso.setitem(ll_new3,'serie',ls_serie)
														dw_proceso.setitem(ll_new3,'numero',ldb_numero)
														dw_proceso.setitem(ll_new3,'rut',ll_rut_cli)
														dw_proceso.setitem(ll_new3,'clasifica_venta',ls_clasif)
														dw_proceso.setitem(ll_new3,'cod_contab',ls_cod_cont)
														dw_proceso.setitem(ll_new3,'valor_uf',ldb_valor_uf)
														dw_proceso.setitem(ll_new3,'cod_parque',ll_cod_parque)
														dw_proceso.setitem(ll_new3,'moneda',ls_moneda)
														dw_proceso.setitem(ll_new3,'precio',ldb_precio)
														dw_proceso.setitem(ll_new3,'porce_comi',ldb_porce_vta)
														dw_proceso.setitem(ll_new3,'tot_pagado',ldb_tot_pag)
														dw_proceso.setitem(ll_new3,'porce_pago',ldb_porce_ing)
														dw_proceso.accepttext()
														dw_proceso.setitem(ll_new3,'cod_age',ls_codigo)
														dw_proceso.setitem(ll_new3,'rut_age',ll_rut_cargo)
														dw_proceso.setitem(ll_new3,'estado',ls_est_age)
														dw_proceso.setitem(ll_new3,'canal',ls_canal)
														dw_proceso.setitem(ll_new3,'depto',ls_depto)
														dw_proceso.setitem(ll_new3,'cargo',ls_cargo)
														ldb_porce_comp				= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'N',3)
														ldb_comi							= ldb_porce_vta *	ldb_porce_comp	
														ldb_monto_pag					= round(ldb_precio_peso * ldb_comi / 100,0)
														ls_est_comi						= 'P'
														dw_proceso.setitem(ll_new3,'porce_vta',ldb_comi)
														dw_proceso.setitem(ll_new3,'monto_pag',ldb_monto_pag)
														dw_proceso.setitem(ll_new3,'estado_comi',ls_est_comi)
														dw_proceso.accepttext()
			//											if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_contab,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porce_pag,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,ls_est_comi,ls_est_age,'O',ll_cod_parque)= -1 then
			//												ll_malos++
			//											else
			//												ll_cont++
			//											end if
													end if
												end if
											end if
										end if
									elseif ls_orig_vta='5' then
										if ll_tipo_comp=2 and (ls_cargo='A' or ls_cargo= 'S' or ls_cargo= 'J') then
											if ls_cargo='A' then
												SELECT	"COD_AGE",	"RUT",			"ESTADO",		"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"AGENTES"  
												WHERE	"AGENTES"."COD_AGE" = :ls_cod_age_2
												USING	sqlca;
											elseif ls_cargo='S' then
												if ls_cod_sup_2= '0126K' then
													ls_cod_sup_2						= 'CS'
												else
													ls_cod_sup_2						= ls_cod_sup_2
												end if
												SELECT	"COD_SUP",	"RUT",			"ESTADO",	"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,	:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"SUPERVISOR"  
												WHERE	"SUPERVISOR"."COD_SUP" = :ls_cod_sup_2
												USING	sqlca;
											elseif ls_cargo='J' then
												SELECT	"JEFE_VENTAS",	"RUT",			"ESTADO",	"CANAL",		"DEPTO",		"CARGO"  
												INTO 		:ls_codigo,			:ll_rut_cargo,	:ls_est_age,	:ls_canal,	:ls_depto,	:ls_cargo  
												FROM		"JEFE_VENTAS"  
												WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jef_2
												USING	sqlca;	
											end if
											if sqlca.sqlcode=0 then
												if not isnull(ll_rut_cargo) and not isnull(ls_est_age) and not isnull(ls_canal) and not isnull(ls_depto) and not isnull(ls_cargo) then
													if ls_canal='NF' then
														ls_orig_vta							= 'X'
													else
														ls_orig_vta							= ls_orig_vta
													end if
													if ll_cod_parque=11 then
														if ls_cargo='A' then
															ls_insertrow						= 'S'
														else
															ls_insertrow						= 'N'
														end if
													else
														if ls_cargo='J' and ls_canal='NI' then
															ls_insertrow						= 'S' //modificación JU3
														elseif ls_cargo='S' and ls_canal='NI' then
															ls_insertrow						= 'N' //modificación JU3	
														else
															ls_insertrow						= 'S'
														end if
													end if
													if ls_insertrow='S' then		
														ll_new							= dw_proceso.insertrow(0)
														dw_proceso.scrolltorow(ll_new)
														dw_proceso.setitem(ll_new,'codigo',ls_base)
														dw_proceso.setitem(ll_new,'serie',ls_serie)
														dw_proceso.setitem(ll_new,'numero',ldb_numero)
														dw_proceso.setitem(ll_new,'rut',ll_rut_cli)
														dw_proceso.setitem(ll_new,'clasifica_venta',ls_clasif)
														dw_proceso.setitem(ll_new,'cod_contab',ls_cod_cont)
														dw_proceso.setitem(ll_new,'valor_uf',ldb_valor_uf)
														dw_proceso.setitem(ll_new,'cod_parque',ll_cod_parque)
														dw_proceso.setitem(ll_new,'moneda',ls_moneda)
														dw_proceso.setitem(ll_new,'precio',ldb_precio)
														dw_proceso.setitem(ll_new,'porce_comi',ldb_porce_vta)
														dw_proceso.setitem(ll_new,'tot_pagado',ldb_tot_pag)
														dw_proceso.setitem(ll_new,'porce_pago',ldb_porce_ing)
														dw_proceso.setitem(ll_new,'cod_age',ls_codigo)
														dw_proceso.setitem(ll_new,'rut_age',ll_rut_cargo)
														dw_proceso.setitem(ll_new,'estado',ls_est_age)
														dw_proceso.setitem(ll_new,'canal',ls_canal)
														dw_proceso.setitem(ll_new,'depto',ls_depto)
														dw_proceso.setitem(ll_new,'cargo',ls_cargo)
														ldb_porce_comp				= wf_porce_comi(ls_orig_vta,ll_tipo_comp,ls_cargo,'N',2)
														if ls_cargo='S' and ls_canal='NI' and gs_conexion = "Parque El Prado" then //sup NI
															SELECT	"PORC_SUPERVISOR"
															INTO		:ldb_porce_vta
															FROM 	"SUPERVISOR"  
															WHERE	( "SUPERVISOR"."COD_SUP" = :ls_codigo ) AND  
																		( "SUPERVISOR"."CANAL" = :ls_canal ) AND  
																		( "SUPERVISOR"."CARGO" = :ls_cargo )
															USING	sqlca;
														else
															ldb_porce_vta				= ldb_porce_vta
														end if
														ll_valida_comi					= wf_valida_comi(ls_serie,ldb_numero,'0',ls_codigo,ls_cod_cont)
														if ll_valida_comi>0 then
															ldb_porce_vta				= 0
														else
															ldb_porce_vta				= ldb_porce_vta
														end if
														ldb_comi							= ldb_porce_vta *	ldb_porce_comp	
														ldb_monto_pag					= round(ldb_precio_peso * ldb_comi / 100,0)
														ls_est_comi						= 'P'
														dw_proceso.setitem(ll_new,'porce_vta',ldb_comi)
														dw_proceso.setitem(ll_new,'monto_pag',ldb_monto_pag)
														dw_proceso.setitem(ll_new,'estado_comi',ls_est_comi)
														dw_proceso.accepttext()
			//											if f_graba_res_comi(ls_codigo,ll_rut_cargo,ldb_tot_pag,ls_cod_contab,ls_mes,ldt_fec_fin,ll_numero,ls_serie,ldb_porce_pag,ldb_comi,ldb_precio,ldb_monto_pag,ldb_valor_uf,'H',ls_moneda,ls_est_comi,ls_est_age,'O',ll_cod_parque)= -1 then
			//												ll_malos++
			//											else
			//												ll_cont++
			//											end if
													end if
												end if
											end if
										end if
									end if
								end if
							end if
						end if
					end if
				end if
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					ldb_tot_porc_aux											= ldb_tot_porc
				end if
				ldb_tot_porc														= (ll_indi * 100) / ll_tot_reg
				hpb_1.Position 													= ldb_tot_porc
				st_porc.text														= string(ldb_tot_porc,'#0.00')+" %"
				st_cuenta.text 													= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
				dw_proceso.accepttext()
			next
			dw_proceso.setFilter("porce_vta > 0")
			dw_proceso.filter()
			SetPointer(Arrow!)
			messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
										'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
			
		else
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
end if
end event

type dw_proceso from datawindow within w_comision_proceso
integer x = 73
integer y = 1396
integer width = 2679
integer height = 752
integer taborder = 10
string title = "none"
string dataobject = "dw_comision_vtas_equi_deveng"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	is_tipo			= 'P'	
	il_row				= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	is_tipo					= 'P'	
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

end event

type cb_crea_deveng from commandbutton within w_comision_proceso
integer x = 1550
integer y = 648
integer width = 690
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Deveng. Contrato Nuevos"
end type

event clicked;string		ls_base,ls_serie,ls_codigo,ls_cargo,ls_canal,ls_clas_vta,ls_depto,ls_estado,ls_canal_age2,ls_nulo,ls_origen_vta
long		ll_mes,ll_ano,ll_tot_reg,ll_indi,ll_malos=0,ll_cont=0,ll_sup_here
datetime	ldt_fec_fin,ldt_fec_max_fact
double	ldb_numero,ldb_porce_comi,ldb_tot_porc,ldb_tot_porc_aux,&
			ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07

setnull(ls_nulo)
st_det_proceso.text								= 'Cálculo Devengamiento Promesas, Aumento Capac.'
dw_proceso.reset()
SetPointer(HourGlass!)
is_grabar											= 'D'
ldt_fec_fin											= datetime(date(em_termino.text),time('00:00:00'))
if isnull(ldt_fec_fin) then
	messagebox("Advertencia","Debe Ingresar Fecha Proceso")
else
	if is_graba_deveng='N' then
		dw_proceso.dataobject					= 'dw_comision_vtas_equi_deveng'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg									= dw_proceso.retrieve(ldt_fec_fin)
		is_tipo										= 'P'	
	elseif is_graba_deveng='S' then
		dw_proceso.dataobject					= 'dw_comision_vtas_equi_deveng_ind'
		dw_proceso.settransobject(sqlca)
		ll_tot_reg									= dw_proceso.retrieve(is_base,is_serie,idb_numero)
		is_tipo										= 'I'	
	end if
	ldb_tot_porc										= 0
	ldb_tot_porc_aux								= 0			
	hpb_1.Position									= ldb_tot_porc
	ll_sup_here										= 0
	SELECT	max("FACTURA_OFERTA"."FECHA_CIERRE")  
	INTO 		:ldt_fec_max_fact  
	FROM		"FACTURA_OFERTA"
	WHERE	"FACTURA_OFERTA"."FECHA_CIERRE"<:ldt_fec_fin
	USING	sqlca;
	if ll_tot_reg >0 then
		for ll_indi=1 to ll_tot_reg
			ls_canal_age2							= ls_nulo
			ls_base									= dw_proceso.getitemstring(ll_indi,'codigo')
			ls_serie									= dw_proceso.getitemstring(ll_indi,'serie')
			ldb_numero								= dw_proceso.getitemnumber(ll_indi,'numero')
			ls_codigo									= dw_proceso.getitemstring(ll_indi,'cod_age')
			ls_cargo									= dw_proceso.getitemstring(ll_indi,'cargo')
			ls_canal									= dw_proceso.getitemstring(ll_indi,'canal')
			ls_clas_vta								= dw_proceso.getitemstring(ll_indi,'clasifica_venta')
			ldb_porce_comi						= dw_proceso.getitemnumber(ll_indi,'porce_vta')
			ldb_cta_01								= dw_proceso.getitemnumber(ll_indi,'c_primera')
			ldb_cta_02								= dw_proceso.getitemnumber(ll_indi,'c_segunda')
			ldb_cta_03								= dw_proceso.getitemnumber(ll_indi,'c_tercera')
			ldb_cta_04								= dw_proceso.getitemnumber(ll_indi,'c_cuarta')
			ldb_cta_05								= dw_proceso.getitemnumber(ll_indi,'c_quinta')
			ldb_cta_06								= dw_proceso.getitemnumber(ll_indi,'c_sexta')
			ldb_cta_07								= dw_proceso.getitemnumber(ll_indi,'c_septima')
			ls_depto									= dw_proceso.getitemstring(ll_indi,'depto')
			ls_estado								= dw_proceso.getitemstring(ll_indi,'estado')
			ll_sup_here								= 0
			ls_origen_vta							= dw_proceso.getitemstring(ll_indi,'tipo_venta')
//			if ls_cargo='S' then
//				ll_sup_here							= f_sup_heredado(ls_codigo)
//			end if
			if ls_cargo='J' and ls_depto='X' then
				SELECT	"CANAL_AGE"
				INTO		:ls_canal_age2
    				FROM		"VISTA_PRODUCC_MENSUAL"  
   				WHERE	"VISTA_PRODUCC_MENSUAL"."BASE" = :ls_base AND  
         					"VISTA_PRODUCC_MENSUAL"."SERIE" = :ls_serie AND  
         					"VISTA_PRODUCC_MENSUAL"."NUMERO" = :ldb_numero
				USING	sqlca;
				if isnull(ls_canal_age2) then ls_canal_age2='' 
				if ls_canal_age2<>'NI' then
					SELECT	"FC"."PORCE_VTA",	"FP"."C_PRIMERA",	"FP"."C_SEGUNDA",	"FP"."C_TERCERA",	"FP"."C_CUARTA",	"FP"."C_QUINTA",	"FP"."C_SEXTA",	"FP"."C_SEPTIMA"
					INTO		:ldb_porce_comi,		:ldb_cta_01,				:ldb_cta_02,				:ldb_cta_03,				:ldb_cta_04,			:ldb_cta_05,			:ldb_cta_06,			:ldb_cta_07
					FROM		"FORESTA"."COMISIONES_VTA_EQUIVAL" "FC",
								"FORESTA"."PORCENTAJE_PREMIO_PERSISTENCIA"	"FP"  
					WHERE	"FC"."CARGO" = "FP"."CARGO" and  
								"FC"."CANAL" = "FP"."CANAL" and  
								"FC"."CLASIF_VTA" = "FP"."CLASIF" and  
								"FC"."ESTADO" = "FP"."ESTADO" and  
								"FC"."CARGO" = :ls_cargo AND  
								//"FC"."CANAL" = :ls_canal AND  
								"FC"."CLASIF_VTA" = :ls_clas_vta AND
								"FC"."BASE" = :ls_base AND  
								"FC"."ESTADO" = 'V' 
					USING	sqlca;
				end if
			elseif ls_cargo='S' and ll_sup_here>0 then
				SELECT	"PORCE_VTA",		"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA"
				INTO		:ldb_porce_comi,	:ldb_cta_01,		:ldb_cta_02,		:ldb_cta_03,		:ldb_cta_04,		:ldb_cta_05,		:ldb_cta_06,	:ldb_cta_07
				FROM		"PORCENTAJE_PERSIST_SUP_HERE"  
				WHERE	"PORCENTAJE_PERSIST_SUP_HERE"."CARGO" = :ls_cargo AND  
							//"PORCENTAJE_PERSIST_SUP_HERE"."CANAL" = :ls_canal AND  
							"PORCENTAJE_PERSIST_SUP_HERE"."CLASIF_VTA" = :ls_clas_vta AND  
							"PORCENTAJE_PERSIST_SUP_HERE"."ESTADO" = 'V'  AND
							"PORCENTAJE_PERSIST_SUP_HERE"."BASE" = :ls_base 
				USING	sqlca;
			elseif ls_cargo='S' and ls_canal='NI' then
				SELECT	"PORC_SUPERVISOR",	0,				0,				0,				0,				0,				0,				0
				INTO		:ldb_porce_comi,			:ldb_cta_01,	:ldb_cta_02,	:ldb_cta_03,	:ldb_cta_04,	:ldb_cta_05,	:ldb_cta_06,	:ldb_cta_07
				FROM 	"SUPERVISOR"  
				WHERE	( "SUPERVISOR"."COD_SUP" = :ls_codigo ) AND  
							( "SUPERVISOR"."CANAL" = :ls_canal ) AND  
							( "SUPERVISOR"."DEPTO" = :ls_depto )
				USING	sqlca;
			elseif ls_cargo='A' and ls_origen_vta='X' then
				SELECT	"COMISIONES_VTA_EQUIVAL"."PORCE_VTA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_PRIMERA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_SEGUNDA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_TERCERA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_CUARTA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_QUINTA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_SEXTA",	"PORCENTAJE_PREMIO_PERSISTENCIA"."C_SEPTIMA"
				INTO		:ldb_porce_comi,	:ldb_cta_01,		:ldb_cta_02,		:ldb_cta_03,		:ldb_cta_04,		:ldb_cta_05,		:ldb_cta_06,	:ldb_cta_07			
				FROM		"COMISIONES_VTA_EQUIVAL","PORCENTAJE_PREMIO_PERSISTENCIA"  
				WHERE	"COMISIONES_VTA_EQUIVAL"."CARGO" = "PORCENTAJE_PREMIO_PERSISTENCIA"."CARGO" and  
							"COMISIONES_VTA_EQUIVAL"."CANAL" = "PORCENTAJE_PREMIO_PERSISTENCIA"."CANAL"  and  
							"COMISIONES_VTA_EQUIVAL"."CLASIF_VTA" = "PORCENTAJE_PREMIO_PERSISTENCIA"."CLASIF" and  
							"COMISIONES_VTA_EQUIVAL"."BASE" = "PORCENTAJE_PREMIO_PERSISTENCIA"."BASE" and  
							"COMISIONES_VTA_EQUIVAL"."BASE" = :ls_origen_vta AND  
							"COMISIONES_VTA_EQUIVAL"."CARGO" = :ls_cargo AND
							"COMISIONES_VTA_EQUIVAL"."CLASIF_VTA" = :ls_clas_vta AND  
							"COMISIONES_VTA_EQUIVAL"."ESTADO" = 'V'
				USING	sqlca;	
			end if
			if isnull(ldb_porce_comi) then ldb_porce_comi=0
			if isnull(ldb_cta_01) then ldb_cta_01=0
			if isnull(ldb_cta_02) then ldb_cta_02=0
			if isnull(ldb_cta_03) then ldb_cta_03=0
			if isnull(ldb_cta_04) then ldb_cta_04=0
			if isnull(ldb_cta_05) then ldb_cta_05=0
			if isnull(ldb_cta_06) then ldb_cta_06=0
			if isnull(ldb_cta_07) then ldb_cta_07=0
			dw_proceso.setitem(ll_indi,"porce_vta",ldb_porce_comi)
			dw_proceso.setitem(ll_indi,"c_primera",ldb_cta_01)
			dw_proceso.setitem(ll_indi,"c_segunda",ldb_cta_02)
			dw_proceso.setitem(ll_indi,"c_tercera",ldb_cta_03)
			dw_proceso.setitem(ll_indi,"c_cuarta",ldb_cta_04)
			dw_proceso.setitem(ll_indi,"c_quinta",ldb_cta_05)
			dw_proceso.setitem(ll_indi,"c_sexta",ldb_cta_06)
			dw_proceso.setitem(ll_indi,"c_septima",ldb_cta_07)
			dw_proceso.setitem(ll_indi,"canal2",ls_canal_age2)
			dw_proceso.accepttext()
			//wf_actualiz_porc_oferta_v(ls_serie,ll_numero,ldb_porce_comi,ls_cargo,ls_base)
			//wf_actualiz_fact_oferta(ls_base,ls_serie,ll_numero,ls_cargo,ls_estado,ldb_porce_comi,ldt_fec_max_fact)
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
				//if f_graba_dev_persist(ls_base,ls_serie,ll_numero,ls_cargo,ls_canal,ldb_porce_comi,ldb_cta_01,ldb_cta_02,ldb_cta_03,ldb_cta_04,ldb_cta_05,ldb_cta_06,ldb_cta_07,'N')= -1 then
	//				ll_malos++
	//			else
	//				ll_cont++
	//			end if
			end if
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				ldb_tot_porc_aux					= ldb_tot_porc
			end if
			ldb_tot_porc								= (ll_indi * 100) / ll_tot_reg
			hpb_1.Position 							= ldb_tot_porc
			st_porc.text								= string(ldb_tot_porc,'#0.00')+" %"
			st_cuenta.text 							= 'Total Reg. '+string(ll_tot_reg,'###,###,##0')+'    Reg. Cálculados '+string(ll_indi,'###,###,##0')+' ( '+string(ldb_tot_porc,'#0.00')+'% )'
			dw_proceso.accepttext()
		next
		SetPointer(Arrow!)
	else
		messagebox("Advertencia","No Registra Datos")
	end if
end if
end event

type st_cuenta from statictext within w_comision_proceso
integer x = 119
integer y = 656
integer width = 1275
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217750
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_comision_proceso
integer x = 123
integer y = 588
integer width = 1275
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_comision_proceso
integer x = 654
integer y = 508
integer width = 311
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_hasta from statictext within w_comision_proceso
integer x = 247
integer y = 120
integer width = 471
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Fecha Proceso:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_termino from editmask within w_comision_proceso
integer x = 727
integer y = 112
integer width = 443
integer height = 88
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;dw_proceso.reset()

end event

type p_termino from picture within w_comision_proceso
integer x = 1175
integer y = 108
integer width = 91
integer height = 96
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string		ls_fecha
datetime	ldt_fec_fin
double	ldb_valor_uf

dw_proceso.reset()
if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF

ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE "TAB_UF"."FECHA_UF" = :ldt_fec_fin
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
		ldb_valor_uf								= ldb_valor_uf
	else
		ldb_valor_uf								= 0
		messagebox("Advertencia","Fecha Proceso No Registra Valor U.F.")
	end if
else
	ldb_valor_uf									= 0
	messagebox("Advertencia","Fecha Proceso No Registra Valor U.F.")
end if
st_valor_uf.text 								= string(ldb_valor_uf,'###,###,##0.00')
		



end event

type cb_cerrar from commandbutton within w_comision_proceso
integer x = 2638
integer y = 1176
integer width = 334
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_proceso)
end event

type gb_periodo from groupbox within w_comision_proceso
integer x = 78
integer y = 56
integer width = 1362
integer height = 408
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período Comisión"
end type

type gb_6 from groupbox within w_comision_proceso
integer x = 1495
integer y = 560
integer width = 1513
integer height = 756
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "(Promesas, Aumento Capac)"
end type

type gb_2 from groupbox within w_comision_proceso
integer x = 1518
integer y = 120
integer width = 741
integer height = 304
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Proceso"
end type

type gb_5 from groupbox within w_comision_proceso
integer x = 2295
integer y = 120
integer width = 663
integer height = 304
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Actualizaciones"
end type

type gb_1 from groupbox within w_comision_proceso
integer x = 1472
integer y = 56
integer width = 1536
integer height = 408
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Contrato Trabajo Antiguos"
end type

type st_fondo from statictext within w_comision_proceso
integer x = 78
integer y = 488
integer width = 1362
integer height = 272
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_det_proceso from statictext within w_comision_proceso
integer x = 123
integer y = 328
integer width = 1275
integer height = 108
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 81324524
alignment alignment = center!
boolean focusrectangle = false
end type

