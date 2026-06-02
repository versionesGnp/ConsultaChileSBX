forward
global type w_convencion from window
end type
type cb_3 from commandbutton within w_convencion
end type
type dw_tipo_clasif from datawindow within w_convencion
end type
type cb_filtrar from commandbutton within w_convencion
end type
type cb_limpiar from commandbutton within w_convencion
end type
type dw_base from datawindow within w_convencion
end type
type cb_1 from commandbutton within w_convencion
end type
type cb_bases from commandbutton within w_convencion
end type
type rb_internacional from radiobutton within w_convencion
end type
type rb_nacional from radiobutton within w_convencion
end type
type rb_super from radiobutton within w_convencion
end type
type rb_agte from radiobutton within w_convencion
end type
type em_agente from editmask within w_convencion
end type
type pb_buscar from picturebutton within w_convencion
end type
type st_promesa from statictext within w_convencion
end type
type cb_detalle from commandbutton within w_convencion
end type
type rb_nf from radiobutton within w_convencion
end type
type rb_ni from radiobutton within w_convencion
end type
type cb_ordenar from commandbutton within w_convencion
end type
type cb_clasif_hist from commandbutton within w_convencion
end type
type dw_lista from datawindow within w_convencion
end type
type dw_fecha_cierre from datawindow within w_convencion
end type
type pb_aceptar from picturebutton within w_convencion
end type
type cb_imprimir from commandbutton within w_convencion
end type
type cb_2 from commandbutton within w_convencion
end type
type cb_exportar from commandbutton within w_convencion
end type
type gb_1 from groupbox within w_convencion
end type
type gb_2 from groupbox within w_convencion
end type
type gb_3 from groupbox within w_convencion
end type
end forward

global type w_convencion from window
integer width = 3643
integer height = 2160
boolean titlebar = true
string title = "Listado Convención Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_3 cb_3
dw_tipo_clasif dw_tipo_clasif
cb_filtrar cb_filtrar
cb_limpiar cb_limpiar
dw_base dw_base
cb_1 cb_1
cb_bases cb_bases
rb_internacional rb_internacional
rb_nacional rb_nacional
rb_super rb_super
rb_agte rb_agte
em_agente em_agente
pb_buscar pb_buscar
st_promesa st_promesa
cb_detalle cb_detalle
rb_nf rb_nf
rb_ni rb_ni
cb_ordenar cb_ordenar
cb_clasif_hist cb_clasif_hist
dw_lista dw_lista
dw_fecha_cierre dw_fecha_cierre
pb_aceptar pb_aceptar
cb_imprimir cb_imprimir
cb_2 cb_2
cb_exportar cb_exportar
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_convencion w_convencion

type variables
long il_row
end variables

forward prototypes
public function double wf_ponderacion (long al_mes, long al_ano, string as_tipo, datetime adt_fec_ini)
public function double wf_puntos (string as_uso, long al_cod_parque, string as_tipo, datetime adt_fec_ini)
public function long wf_rut_titular (long al_rut_titular)
public function double wf_persist (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo)
public function double wf_persist_menor6 (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo)
public subroutine wf_lista_conven (datetime adt_ult_fec_cierre, double adb_valor_uf, datetime adt_fec_clasif, string as_cargo, string as_canal, datetime adt_fec_ini, datetime adt_fec_fin, string as_tipo, string as_tipo_clasif)
public function string wf_clasif (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo)
public function long wf_licen_medica (string as_cod_age, datetime adt_fec_ini, datetime adt_fec_fin)
end prototypes

public function double wf_ponderacion (long al_mes, long al_ano, string as_tipo, datetime adt_fec_ini);double	ldb_ponderacion

//wf_ponderacion(al_mes,al_ano,as_tipo,adt_fec_ini)
SELECT	"PONDERACION"  
INTO		:ldb_ponderacion  
FROM		"CONVEN_CIERRE_PONDERADO"  
WHERE		"CONVEN_CIERRE_PONDERADO"."MES" = :al_mes AND
			"CONVEN_CIERRE_PONDERADO"."ANNO" = :al_ano AND
			"CONVEN_CIERRE_PONDERADO"."TIPO" = :as_tipo AND
			"CONVEN_CIERRE_PONDERADO"."FECHA" = :adt_fec_ini
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_ponderacion) and ldb_ponderacion>0 then
		ldb_ponderacion					= ldb_ponderacion
	else
		ldb_ponderacion					= 0
	end if
else
	ldb_ponderacion						= 0
end if
if isnull(ldb_ponderacion) then ldb_ponderacion=0
return ldb_ponderacion
end function

public function double wf_puntos (string as_uso, long al_cod_parque, string as_tipo, datetime adt_fec_ini);double	ldb_puntos

//wf_puntos(as_uso,al_cod_parque,as_tipo,adt_fec_ini)
SELECT	"PUNTOS"  
INTO		:ldb_puntos  
FROM		"CONVEN_USO_PONDERADO"  
WHERE		( "CONVEN_USO_PONDERADO"."USO" = :as_uso ) AND  
			( "CONVEN_USO_PONDERADO"."COD_PARQUE" = :al_cod_parque ) AND  
			( "CONVEN_USO_PONDERADO"."TIPO" = :as_tipo ) AND
			( "CONVEN_USO_PONDERADO"."FECHA" = :adt_fec_ini )
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_puntos) and ldb_puntos>0 then
		ldb_puntos					= ldb_puntos
	else
		ldb_puntos					= 0
	end if
else
	ldb_puntos						= 0
end if
if isnull(ldb_puntos) then ldb_puntos=0
return ldb_puntos
end function

public function long wf_rut_titular (long al_rut_titular);long	ll_rut_resuelto

//wf_rut_titular(al_rut_titular)
SELECT DISTINCT "PRADO"."CADENA"."RUT"
INTO	:ll_rut_resuelto  
FROM	"PRADO"."CADENA"  
WHERE	( "PRADO"."CADENA"."RUT" = :al_rut_titular ) AND  
		( "PRADO"."CADENA"."ESTADO" = 'R' )
UNION
SELECT DISTINCT "FORESTA"."CADENA"."RUT"  
FROM	"FORESTA"."CADENA"  
WHERE	( "FORESTA"."CADENA"."RUT" = :al_rut_titular ) AND  
		( "FORESTA"."CADENA"."ESTADO" = 'R' )
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_rut_resuelto) and ll_rut_resuelto>0 then
		ll_rut_resuelto						= ll_rut_resuelto
	else
		ll_rut_resuelto						= 0
	end if
else
	ll_rut_resuelto							= 0
end if
if isnull(ll_rut_resuelto) then ll_rut_resuelto=0
return ll_rut_resuelto
end function

public function double wf_persist (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo);double	ldb_persist
//wf_persist(as_codigo,adt_fec_clasif,al_cod_parque,as_cargo)
if as_cargo='A' then
	if al_cod_parque = 11 then
		SELECT	"FORESTA"."CLASIFICA_HIST"."PORCE_CLASIFICA"
		INTO		:ldb_persist
		FROM		"FORESTA"."CLASIFICA_HIST"  
		WHERE		"FORESTA"."CLASIFICA_HIST"."COD_AGE" = :as_codigo AND
					"FORESTA"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldb_persist) then
				ldb_persist							= ldb_persist
			else
				ldb_persist							= 0
			end if
		else
			ldb_persist								= 0
		end if
	else
		SELECT	"PRADO"."CLASIFICA_HIST"."PORCE_CLASIFICA"
		INTO		:ldb_persist
		FROM		"PRADO"."CLASIFICA_HIST"  
		WHERE		"PRADO"."CLASIFICA_HIST"."COD_AGE" = :as_codigo AND
					"PRADO"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldb_persist) then
				ldb_persist							= ldb_persist
			else
				ldb_persist							= 0
			end if
		else
			ldb_persist								= 0
		end if
	end if
elseif as_cargo='S' then
	if al_cod_parque = 11 then
		SELECT	"FORESTA"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP"  
		INTO		:ldb_persist 
		FROM		"FORESTA"."CLASIFICA_HIST_SUP"  
		WHERE		"FORESTA"."CLASIFICA_HIST_SUP"."COD_SUP" = :as_codigo AND
					"FORESTA"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldb_persist) then
				ldb_persist							= ldb_persist
			else
				ldb_persist							= 0
			end if
		else
			ldb_persist								= 0
		end if
	else
		SELECT	"PRADO"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP" 
		INTO		:ldb_persist
		FROM		"PRADO"."CLASIFICA_HIST_SUP"  
		WHERE		"PRADO"."CLASIFICA_HIST_SUP"."COD_SUP" = :as_codigo AND
					"PRADO"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldb_persist) then
				ldb_persist							= ldb_persist
			else
				ldb_persist							= 0
			end if
		else
			ldb_persist								= 0
		end if
	end if
end if
if isnull(ldb_persist) then ldb_persist=0
return ldb_persist
end function

public function double wf_persist_menor6 (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo);string	ls_cod
long		ll_cta
double	ldb_persist,ldb_sum

//wf_persist_menor6(as_codigo,adt_fec_clasif,al_cod_parque,as_cargo)
if as_cargo='A' then
	if al_cod_parque = 11 then
		SELECT DISTINCT 	"FORESTA"."AGENTES"."COD_SUP",
				 (	SELECT	COUNT("CARGO"."COD_SUP")
			 		FROM 		"FORESTA"."AGENTES" "CARGO",
					 			"FORESTA"."CLASIFICA_HIST"  
			  		WHERE 	"CARGO"."COD_AGE" = "FORESTA"."CLASIFICA_HIST"."COD_AGE" and  
								"CARGO"."COD_SUP" = "FORESTA"."AGENTES"."COD_SUP" and  
								"FORESTA"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif and
								"FORESTA"."CLASIFICA_HIST"."CONTRATOS_CLASIFICA" > 0),
				 ( SELECT	SUM("FORESTA"."CLASIFICA_HIST"."PORCE_CLASIFICA")
					FROM 		"FORESTA"."AGENTES" "CARGO",   
								"FORESTA"."CLASIFICA_HIST"  
					WHERE 	"CARGO"."COD_AGE" = "FORESTA"."CLASIFICA_HIST"."COD_AGE" and  
								"CARGO"."COD_SUP" = "FORESTA"."AGENTES"."COD_SUP" and  
								"FORESTA"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif and
								"FORESTA"."CLASIFICA_HIST"."CONTRATOS_CLASIFICA" > 0)
  		INTO		:ls_cod,:ll_cta,:ldb_sum		  
  		FROM		"FORESTA"."AGENTES"
		WHERE		"FORESTA"."AGENTES"."COD_AGE" = :as_codigo  
      USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_cod) and ls_cod<>'' and not isnull(ll_cta) and ll_cta>0 and not isnull(ldb_sum) and ldb_sum>0 then
				if ll_cta>0 then
					ldb_persist			= ldb_sum / ll_cta
				else
					ldb_persist			= 0
				end if
			else
				ldb_persist				= 0
			end if
		else
			ldb_persist					= 0
		end if
	else
		SELECT DISTINCT 	"PRADO"."AGENTES"."COD_SUP",
				 (	SELECT	COUNT("CARGO"."COD_SUP")
			 		FROM 		"PRADO"."AGENTES" "CARGO",
					 			"PRADO"."CLASIFICA_HIST"  
			  		WHERE 	"CARGO"."COD_AGE" = "PRADO"."CLASIFICA_HIST"."COD_AGE" and  
								"CARGO"."COD_SUP" = "PRADO"."AGENTES"."COD_SUP" AND  
								"PRADO"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif AND
								"PRADO"."CLASIFICA_HIST"."CONTRATOS_CLASIFICA" > 0),
				 ( SELECT	SUM("PRADO"."CLASIFICA_HIST"."PORCE_CLASIFICA")
					FROM 		"PRADO"."AGENTES" "CARGO",   
								"PRADO"."CLASIFICA_HIST"  
					WHERE 	"CARGO"."COD_AGE" = "PRADO"."CLASIFICA_HIST"."COD_AGE" and  
								"CARGO"."COD_SUP" = "PRADO"."AGENTES"."COD_SUP" AND  
								"PRADO"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif AND
								"PRADO"."CLASIFICA_HIST"."CONTRATOS_CLASIFICA" > 0)
  		INTO		:ls_cod,:ll_cta,:ldb_sum		  
  		FROM		"PRADO"."AGENTES"
		WHERE		"PRADO"."AGENTES"."COD_AGE" = :as_codigo 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_cod) and ls_cod<>'' and not isnull(ll_cta) and ll_cta>0 and not isnull(ldb_sum) and ldb_sum>0 then
				if ll_cta>0 then
					ldb_persist			= ldb_sum / ll_cta
				else
					ldb_persist			= 0
				end if
			else
				ldb_persist				= 0
			end if
		else
			ldb_persist					= 0
		end if
	end if
elseif as_cargo='S' then 
	if al_cod_parque = 11 then
		SELECT DISTINCT	"FORESTA"."SUPERVISOR"."COD_JEFE",
								(	SELECT	COUNT("CARGO"."COD_JEFE")
									FROM 		"FORESTA"."SUPERVISOR" "CARGO",
												"FORESTA"."CLASIFICA_HIST_SUP"  
									WHERE 	"CARGO"."COD_SUP" = "FORESTA"."CLASIFICA_HIST_SUP"."COD_SUP" and  
												"CARGO"."COD_JEFE" = "FORESTA"."SUPERVISOR"."COD_JEFE" AND  
												"FORESTA"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif AND
												"FORESTA"."CLASIFICA_HIST_SUP"."CONTRATOS_CLASIFICA_SUP" > 0),
								(	SELECT	SUM("FORESTA"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP")
									FROM 		"FORESTA"."SUPERVISOR" "CARGO",   
												"FORESTA"."CLASIFICA_HIST_SUP"  
									WHERE 	"CARGO"."COD_SUP" = "FORESTA"."CLASIFICA_HIST_SUP"."COD_SUP" and  
												"CARGO"."COD_JEFE" = "FORESTA"."SUPERVISOR"."COD_JEFE" AND  
												"FORESTA"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif AND
												"FORESTA"."CLASIFICA_HIST_SUP"."CONTRATOS_CLASIFICA_SUP" > 0)
		INTO	:ls_cod,:ll_cta,:ldb_sum		  
		FROM	"FORESTA"."SUPERVISOR"
		WHERE	"FORESTA"."SUPERVISOR"."COD_SUP" =:as_codigo
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_cod) and ls_cod<>'' and not isnull(ll_cta) and ll_cta>0 and not isnull(ldb_sum) and ldb_sum>0 then
				if ll_cta>0 then
					ldb_persist			= ldb_sum / ll_cta
				else
					ldb_persist			= 0
				end if
			else
				ldb_persist				= 0
			end if
		else
			ldb_persist					= 0
		end if
	else
		SELECT DISTINCT	"PRADO"."SUPERVISOR"."COD_JEFE",
								(	SELECT	COUNT("CARGO"."COD_JEFE")
									FROM 		"PRADO"."SUPERVISOR" "CARGO",
												"PRADO"."CLASIFICA_HIST_SUP"  
									WHERE 	"CARGO"."COD_SUP" = "PRADO"."CLASIFICA_HIST_SUP"."COD_SUP" and  
												"CARGO"."COD_JEFE" = "PRADO"."SUPERVISOR"."COD_JEFE" AND  
												"PRADO"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif AND
												"PRADO"."CLASIFICA_HIST_SUP"."CONTRATOS_CLASIFICA_SUP" > 0),
								(	SELECT	SUM("PRADO"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP")
									FROM 		"PRADO"."SUPERVISOR" "CARGO",   
												"PRADO"."CLASIFICA_HIST_SUP"  
									WHERE 	"CARGO"."COD_SUP" = "PRADO"."CLASIFICA_HIST_SUP"."COD_SUP" and  
												"CARGO"."COD_JEFE" = "PRADO"."SUPERVISOR"."COD_JEFE" AND  
												"PRADO"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif AND
												"PRADO"."CLASIFICA_HIST_SUP"."CONTRATOS_CLASIFICA_SUP" > 0)
		INTO	:ls_cod,:ll_cta,:ldb_sum		  
		FROM	"PRADO"."SUPERVISOR"
		WHERE	"PRADO"."SUPERVISOR"."COD_SUP" =:as_codigo
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_cod) and ls_cod<>'' and not isnull(ll_cta) and ll_cta>0 and not isnull(ldb_sum) and ldb_sum>0 then
				if ll_cta>0 then
					ldb_persist			= ldb_sum / ll_cta
				else
					ldb_persist			= 0
				end if
			else
				ldb_persist				= 0
			end if
		else
			ldb_persist					= 0
		end if
	end if	
end if
if isnull(ldb_persist) then ldb_persist=0
return ldb_persist
end function

public subroutine wf_lista_conven (datetime adt_ult_fec_cierre, double adb_valor_uf, datetime adt_fec_clasif, string as_cargo, string as_canal, datetime adt_fec_ini, datetime adt_fec_fin, string as_tipo, string as_tipo_clasif);string		ls_descrip,ls_base,ls_serie,ls_estado_cont,ls_moneda,ls_uso,ls_cod_agte,ls_cod_sup,&
			ls_cod_agte_aux,ls_nombre_agte,ls_a_pater_agte,ls_a_mater_agte,ls_cod_sup_est,&
			ls_nombre_sup,ls_a_pater_sup,ls_a_mater_sup,ls_cod_jefe,ls_nombre_jefe,ls_a_pater_jefe,&
			ls_a_mater_jefe,ls_agente,ls_cod_sup_aux,ls_forma_pago,ls_clasif_vta,ls_conexion,&
			ls_supervisor,ls_agrega_tit,ls_conexion_aux,ls_clasif,ls_tipo_cont
long		ll_fila,ll_parque_cont,ll_rut_titular,ll_parque_agte,ll_parque_sup,&
			ll_parque_agte_aux,ll_parque_cont_aux,ll_parque,ll_rut_resuelto,ll_mes,ll_ano,&
			ll_new,ll_parque_sup_aux,ll_contr_ped,ll_antig,ll_mult_res,ll_vta_cero,ll_licen
datetime	ldt_cierre_venta,ldt_fec_ult_cierre,ldt_fecha_ing,ldt_cierre_ini
double	ldb_numero,ldb_precio,ldb_precio_uf,ldb_ponder,ldb_puntos,ldb_tot_uf,ldb_persist,ldb_mora,&
			ldb_calc_mora,ldb_puntaje,ldb_sum,ldb_porce_ing

dw_lista.Reset()
dw_fecha_cierre.AcceptText()
dw_base.AcceptText()
SetPointer(HourGlass!)
if as_tipo = 'I' then
	ls_descrip											= 'Internacional'
elseif as_tipo = 'N' then
	ls_descrip											= 'Nacional'
end if
if as_cargo = 'A' then
	dw_lista.dataobject								= 'dwe_convencion_inter'
	st_promesa.text									= 'Buscar Agente :'
	dw_lista.settransobject(sqlca)
	ll_fila													= 1
	if as_tipo_clasif = 'C' then
		ls_agrega_tit									= ', Clasificación Ventas A y B'
		DECLARE x1 CURSOR FOR
		SELECT		"CODIGO","SERIE","NRO_OFERTA","ESTADO","MONEDA","PRECIO","COD_PARQUE_CONT","CIERRE_VENTA","RUT_TITULAR","USO","COD_AGE","COD_PARQUE_AGE","COD_SUP","COD_PARQUE_SUP","FORMA_PAGO","PORCE_ING_CIERRE","CLASIFICA_VENTA","CONEXION","TIPO_CONT"  
		FROM			"VISTA_CONVENCION_INTER"
		WHERE		("VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :adt_fec_ini AND
						"VISTA_CONVENCION_INTER"."CIERRE_VENTA" <= :adt_fec_fin AND
						"VISTA_CONVENCION_INTER"."CANAL_AGE" = :as_canal AND
						"VISTA_CONVENCION_INTER"."ESTADO_AGE" = 'A' AND
						"VISTA_CONVENCION_INTER"."CLASIFICA_VENTA" <> :as_tipo_clasif AND
						( "VISTA_CONVENCION_INTER"."TIPO_CONT" = '4' OR "VISTA_CONVENCION_INTER"."TIPO_CONT" = '5' OR "VISTA_CONVENCION_INTER"."TIPO_CONT" = '6') AND
						( "VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'P' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'S') AND
						( "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'K' OR "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'M'))
		ORDER BY	"VISTA_CONVENCION_INTER"."CONEXION" DESC,
						"VISTA_CONVENCION_INTER"."COD_AGE" ASC,
					  	"VISTA_CONVENCION_INTER"."COD_PARQUE_AGE" ASC,
						"VISTA_CONVENCION_INTER"."CIERRE_VENTA" ASC
		USING		Trans_1;
	else
		ls_agrega_tit									= ', Clasificación Ventas A, B y C'
		DECLARE x3 CURSOR FOR
		SELECT		"CODIGO","SERIE","NRO_OFERTA","ESTADO","MONEDA","PRECIO","COD_PARQUE_CONT","CIERRE_VENTA","RUT_TITULAR","USO","COD_AGE","COD_PARQUE_AGE","COD_SUP","COD_PARQUE_SUP","FORMA_PAGO","PORCE_ING_CIERRE","CLASIFICA_VENTA","CONEXION","TIPO_CONT" 
		FROM			"VISTA_CONVENCION_INTER"
		WHERE		("VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :adt_fec_ini AND
						"VISTA_CONVENCION_INTER"."CIERRE_VENTA" <= :adt_fec_fin AND
						//( "VISTA_CONVENCION_INTER"."COD_AGE" = '737' or "VISTA_CONVENCION_INTER"."COD_AGE" = '2960' ) AND
						"VISTA_CONVENCION_INTER"."CANAL_AGE" = :as_canal AND
						"VISTA_CONVENCION_INTER"."ESTADO_AGE" = 'A' AND
						( "VISTA_CONVENCION_INTER"."TIPO_CONT" = '4' OR  "VISTA_CONVENCION_INTER"."TIPO_CONT" = '5' OR "VISTA_CONVENCION_INTER"."TIPO_CONT" = '6') AND
						( "VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'P' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'S') AND
						( "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'K' OR "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'M'))
		ORDER BY   "VISTA_CONVENCION_INTER"."CONEXION" DESC,
						"VISTA_CONVENCION_INTER"."COD_AGE" ASC,
					  	"VISTA_CONVENCION_INTER"."COD_PARQUE_AGE" ASC,
						"VISTA_CONVENCION_INTER"."CIERRE_VENTA" ASC
		USING		Trans_1;
	end if
	if as_tipo_clasif = 'C' then
		open x1;
	else
		open x3;
	end if
	if Trans_1.sqlcode=0 then
		DO WHILE Trans_1.sqlcode=0
			if as_tipo_clasif = 'C' then
				fetch x1 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_estado_cont,:ls_moneda,:ldb_precio,:ll_parque_cont,:ldt_cierre_venta,:ll_rut_titular,:ls_uso,:ls_cod_agte,:ll_parque_agte,:ls_cod_sup,:ll_parque_sup,:ls_forma_pago,:ldb_porce_ing,:ls_clasif_vta,:ls_conexion,:ls_tipo_cont;	
			else
				fetch x3 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_estado_cont,:ls_moneda,:ldb_precio,:ll_parque_cont,:ldt_cierre_venta,:ll_rut_titular,:ls_uso,:ls_cod_agte,:ll_parque_agte,:ls_cod_sup,:ll_parque_sup,:ls_forma_pago,:ldb_porce_ing,:ls_clasif_vta,:ls_conexion,:ls_tipo_cont;	
			end if
			if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 and not isnull(ls_cod_agte) and not isnull(ldt_cierre_venta) then
				dw_lista.Object.usuario.text	 		= gs_user
				dw_lista.Object.titulo_0.text	 		= 'Listado Convención '+ls_descrip
				dw_lista.Object.titulo_1.text	 		= 'Agentes de Ventas Canal '+as_canal+ls_agrega_tit
				dw_lista.Object.titulo_2.text	 		= 'Período de Ventas desde '+string(adt_fec_ini,'dd/mm/yyyy')+' hasta el '+string(adt_fec_fin,'dd/mm/yyyy')
				SELECT	max("CIERRE_VENTA"."CIERRE_VENTA")  
				INTO 		:ldt_fec_ult_cierre  
				FROM 		"CIERRE_VENTA"  
				WHERE		"CIERRE_VENTA"."CIERRE_VENTA" <= :adt_fec_fin
				USING		Trans_2;
				if Trans_2.sqlcode=0 then
					if not isnull(ldt_fec_ult_cierre) then
						ldt_fec_ult_cierre				= ldt_fec_ult_cierre
					else
						ldt_fec_ult_cierre				= adt_fec_fin
					end if
				else
					ldt_fec_ult_cierre					= adt_fec_fin
				end if
				dw_lista.Object.titulo_3.text	 	= 'Último Período de Ventas Finalizado '+string(ldt_fec_ult_cierre,'dd/mm/yyyy')
				if ll_fila = 1 then
					ls_cod_agte_aux					= ls_cod_agte
					ll_parque_agte_aux				= ll_parque_agte
					ll_parque_cont_aux				= ll_parque_cont
					ls_conexion_aux					= ls_conexion
				end if
				SELECT	"NOMBRE_AGE",		"A_PATERNO_AGE",	"A_MATERNO_AGE",	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",		"COD_PARQUE_AGE",	"FECHA_INI_AGE"  
				INTO		:ls_nombre_agte,	:ls_a_pater_agte,	:ls_a_mater_agte,	:ls_cod_sup_est,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque,	:ldt_fecha_ing		  
				FROM		"VISTA_ESTRUCTURA_VENTAS"  
				WHERE	"VISTA_ESTRUCTURA_VENTAS"."COD_AGE" = :ls_cod_agte_aux AND  
							"VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_AGE" = :ll_parque_agte_aux AND  
							"VISTA_ESTRUCTURA_VENTAS"."ESTADO_AGE" = 'A' AND  
							("VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'K' OR "VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'M') AND
							"VISTA_ESTRUCTURA_VENTAS"."CONEXION" = :ls_conexion_aux
				USING		Trans_2;
				if Trans_2.sqlcode=0 then
					ls_agente							= ls_nombre_agte+' '+ls_a_pater_agte+' '+ls_a_mater_agte
					if ls_moneda = '1' then
						ldb_precio_uf					= round(ldb_precio / adb_valor_uf, 2)
					elseif ls_moneda = '2' then
						ldb_precio_uf					= round(ldb_precio, 2)
					end if
					//----------Modificaciones--------------
					ll_contr_ped							= f_docto_pend_conv(ls_base,ls_serie,ldb_numero,ll_parque_cont,ldt_cierre_venta)
					if ll_contr_ped=0 then
						ldb_precio_uf					= ldb_precio_uf
					else
						ldb_precio_uf					= 0
					end if
					if adt_fec_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
						ll_rut_resuelto 					= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_uso
						ldb_persist						= wf_persist(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						ldb_mora						= round(100 - ldb_persist, 4)
					elseif as_tipo='N' and adt_fec_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 31/01/2012
						ll_rut_resuelto 					= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_uso
						ll_antig							= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
						if ll_antig>=180 then	
							ldb_persist					= wf_persist(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						else
							ldb_persist					= wf_persist_menor6(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						end if
						ldb_mora						= round(100 - ldb_persist, 4)
					elseif as_tipo='I' and adt_fec_ini= datetime(date(string('30/06/2012')),time('00:00:00')) then //NUEVO 30/06/2012
						ll_rut_resuelto 					= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_clasif_vta
						ldb_persist						= 0
						ldb_mora						= 0
					elseif (as_tipo='N' and adt_fec_ini>= datetime(date(string('31/01/2013')),time('00:00:00'))) then //NUEVO 31/01/2013 //NUEVO 30/06/2013
						ll_rut_resuelto	 				= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_clasif_vta
						ll_antig							= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
						if ll_antig>=180 then	
							ldb_persist					= wf_persist(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						else
							ldb_persist					= wf_persist_menor6(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						end if
						ldb_mora						= round(100 - ldb_persist, 4)
						if ls_tipo_cont='6' then
							if ldt_cierre_venta>= datetime(date(string('31/01/2013')),time('00:00:00')) and  ldt_cierre_venta<= datetime(date(string('30/04/2013')),time('00:00:00')) then
								ldb_precio_uf			= ldb_precio_uf
							elseif  ldt_cierre_venta>= datetime(date(string('31/05/2013')),time('00:00:00')) and  ldt_cierre_venta<= datetime(date(string('30/09/2013')),time('00:00:00')) then	
								if ldb_porce_ing>=2.98 then
									ldb_precio_uf		= ldb_precio_uf
								else
									ldb_precio_uf		= 0
								end if
							else
								ldb_precio_uf			= ldb_precio_uf
							end if
						else
							if ldb_porce_ing>=9.98 then
								ldb_precio_uf			= ldb_precio_uf
							else
								ldb_precio_uf			= 0
							end if
						end if
						if as_tipo= 'N' and ldt_cierre_venta>= datetime(date(string('01/01/2013')),time('00:00:00')) then //VENTAS_CERO
							ll_vta_cero					= f_cero_venta(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
						elseif as_tipo= 'I' and ldt_cierre_venta>= datetime(date(string('30/06/2013')),time('00:00:00')) then //VENTAS_CERO
							ll_vta_cero					= f_cero_venta_inter(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
						else
							ll_vta_cero					= 1
						end if
						ls_clasif							= wf_clasif(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
					elseif (as_tipo='I' and adt_fec_ini>= datetime(date(string('30/06/2013')),time('00:00:00'))) then //NUEVO 31/01/2013 //NUEVO 30/06/2013
						ll_rut_resuelto	 				= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_clasif_vta
						ll_antig							= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
						if ll_antig>=180 then	
							ldb_persist					= wf_persist(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						else
							ldb_persist					= wf_persist_menor6(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						end if
						ldb_mora						= round(100 - ldb_persist, 4)
						if as_tipo= 'N' and ldt_cierre_venta>= datetime(date(string('01/01/2013')),time('00:00:00')) then //VENTAS_CERO
							ll_vta_cero					= f_cero_venta(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
						elseif as_tipo= 'I' and ldt_cierre_venta>= datetime(date(string('30/06/2013')),time('00:00:00')) then //VENTAS_CERO
							ll_vta_cero					= f_cero_venta_inter(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
						else
							ll_vta_cero					= 1
						end if
						ls_clasif							= wf_clasif(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
					elseif (as_tipo='N' and adt_fec_ini>= datetime(date(string('31/01/2014')),time('00:00:00'))) then //NUEVO 31/01/2014
						ll_rut_resuelto	 				= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_clasif_vta
						ll_antig							= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
						if ll_antig>=180 then	
							ldb_persist					= wf_persist(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						else
							ldb_persist					= wf_persist_menor6(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)
						end if
						ldb_mora						= round(100 - ldb_persist, 4)
						if ldb_porce_ing>=2.98 then
							ldb_precio_uf				= ldb_precio_uf
						else
							ldb_precio_uf				= 0
						end if
						if as_tipo= 'N' and ldt_cierre_venta>= datetime(date(string('01/01/2013')),time('00:00:00')) then //VENTAS_CERO
							ll_vta_cero					= f_cero_venta(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
						elseif as_tipo= 'I' and ldt_cierre_venta>= datetime(date(string('30/06/2013')),time('00:00:00')) then //VENTAS_CERO
							ll_vta_cero					= f_cero_venta_inter(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
						else
							ll_vta_cero					= 1
						end if
						ls_clasif							= wf_clasif(ls_cod_agte_aux,adt_fec_clasif,ll_parque,as_cargo)	
					end if
					if ll_rut_resuelto > 0 then
						if adt_fec_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
							ll_mult_res					= 0
						elseif as_tipo='N' and adt_fec_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
							ll_mult_res					= 1
						elseif as_tipo='I' and adt_fec_ini= datetime(date(string('30/06/2012')),time('00:00:00')) then //NUEVO 30/06/2012
							ll_mult_res					= 0
						elseif as_tipo='N' and adt_fec_ini= datetime(date(string('31/01/2013')),time('00:00:00')) then //NUEVO 01/01/2012
							ll_mult_res					= 0
						elseif as_tipo='I' and adt_fec_ini= datetime(date(string('30/06/2013')),time('00:00:00')) then //NUEVO 01/01/2012
							ll_mult_res					= 1	
						else
							if as_tipo='N' then //NUEVO 31/01/2014
								ll_mult_res				= 0
							elseif as_tipo='I' then //NUEVO 30/06/2014
								ll_mult_res				= 1
							end if
						end if
					else
						ll_mult_res						= 1
					end if
					//------------------------------------
					ll_mes								= month(date(ldt_cierre_venta))
					ll_ano									= year(date(ldt_cierre_venta))
					ldb_ponder							= wf_ponderacion(ll_mes,ll_ano,as_tipo,adt_fec_ini)
					ldb_puntos							= wf_puntos(ls_uso,ll_parque_cont,as_tipo,adt_fec_ini)
					ldb_tot_uf							= round((((ldb_precio_uf * ldb_ponder) * ldb_puntos) * ll_mult_res),2)
					ldb_calc_mora						= Round(ldb_mora / 100, 4)
					ldb_puntaje							= (1 - ldb_calc_mora) * ldb_sum
					if ls_cod_agte_aux = ls_cod_agte then
						ldb_sum							= ldb_sum + ldb_tot_uf
					else
						ll_new							= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte_aux)
						dw_lista.setitem(ll_new,"total_uf",ldb_sum)
						dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
						dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
						dw_lista.setitem(ll_new,"agente",ls_agente)
						dw_lista.setitem(ll_new,"cod_super",ls_cod_sup_est)
						dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
						dw_lista.setitem(ll_new,"cod_parque",ll_parque_agte_aux)
						dw_lista.setitem(ll_new,"cargo",as_cargo)
						dw_lista.setitem(ll_new,"clasif",ls_clasif)
						dw_lista.setitem(ll_new,"cero_vta",ll_vta_cero)
						dw_lista.setitem(ll_new,"gs_depto",gs_depto)
						dw_lista.setitem(ll_new,"licen",ll_licen)
						
						ldb_sum							= ldb_tot_uf
						ls_cod_agte_aux 				= ls_cod_agte
						ll_parque_agte_aux			= ll_parque_agte
						ll_parque_cont_aux			= ll_parque_cont
						ls_conexion_aux				= ls_conexion
					end if
				end if
			end if
			ll_fila ++
			setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);Setnull(ls_cod_agte);Setnull(ldt_cierre_venta);Setnull(ll_parque_agte)
		LOOP
		ldb_calc_mora									= Round(ldb_mora / 100, 4)
		ldb_puntaje										= (1 - ldb_calc_mora) * ldb_sum
		ll_new											= dw_lista.insertrow(0)
		dw_lista.scrolltorow(ll_new)
		SELECT	"NOMBRE_AGE",		"A_PATERNO_AGE",	"A_MATERNO_AGE",	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_AGE",	"FECHA_INI_AGE"  
		INTO		:ls_nombre_agte,	:ls_a_pater_agte,	:ls_a_mater_agte,	:ls_cod_sup,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque,	:ldt_fecha_ing  
		FROM		"VISTA_ESTRUCTURA_VENTAS"  
		WHERE	"VISTA_ESTRUCTURA_VENTAS"."COD_AGE" = :ls_cod_agte_aux AND  
					"VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_AGE" = :ll_parque_agte_aux AND  
					"VISTA_ESTRUCTURA_VENTAS"."ESTADO_AGE" = 'A' AND  
					("VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'K' OR "VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'M')   AND
					"VISTA_ESTRUCTURA_VENTAS"."CONEXION" = :ls_conexion_aux
		USING	Trans_2;
		if Trans_2.sqlcode=0 then
			ls_agente									= 	ls_nombre_agte+' '+ls_a_pater_agte+' '+ls_a_mater_agte
			if as_tipo= 'N' and ldt_cierre_venta>= datetime(date(string('01/01/2013')),time('00:00:00')) then //VENTAS_CERO
				ll_vta_cero								= f_cero_venta(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
			elseif as_tipo= 'I' and ldt_cierre_venta>= datetime(date(string('30/06/2013')),time('00:00:00')) then //VENTAS_CERO
				ll_vta_cero								= f_cero_venta_inter(ls_cod_agte_aux,adt_fec_ini,adt_fec_fin,ll_parque)
			else
				ll_vta_cero								= 1
			end if
			ls_clasif										= wf_clasif(ls_cod_agte_aux,adt_fec_clasif,ll_parque_agte_aux,as_cargo)
			dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte_aux)
			dw_lista.setitem(ll_new,"total_uf",ldb_sum)
			dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
			dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
			dw_lista.setitem(ll_new,"agente",ls_agente)
			dw_lista.setitem(ll_new,"cod_super",ls_cod_sup)
			dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
			dw_lista.setitem(ll_new,"cod_parque",ll_parque)
			dw_lista.setitem(ll_new,"cargo",as_cargo)
			dw_lista.setitem(ll_new,"cero_vta",ll_vta_cero)
			dw_lista.setitem(ll_new,"clasif",ls_clasif)
			dw_lista.setitem(ll_new,"gs_depto",gs_depto)
			dw_lista.setitem(ll_new,"licen",ll_licen)
		end if
		ldb_sum											= ldb_tot_uf
	end if
	if as_tipo_clasif = 'C' then
		close x1;
	else
		close x3;
	end if
// sup	
elseif as_cargo = 'S' then
	dw_lista.dataobject								= 'dwe_convencion_inter_sup'
	st_promesa.text									= 'Buscar Supervisor :'
	dw_lista.settransobject(sqlca)
	ll_fila													= 1
	if as_tipo_clasif = 'C' then
		ls_agrega_tit									= ', Clasificación Ventas A y B'
		DECLARE x2 CURSOR FOR
		SELECT		"CODIGO","SERIE","NRO_OFERTA","ESTADO","MONEDA","PRECIO","COD_PARQUE_CONT","CIERRE_VENTA","RUT_TITULAR","USO","COD_AGE","COD_PARQUE_AGE","COD_SUP","COD_PARQUE_SUP","FORMA_PAGO","PORCE_ING_CIERRE","CLASIFICA_VENTA","CONEXION"   
		FROM			"VISTA_CONVENCION_INTER"
		WHERE		"VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :adt_fec_ini AND
						"VISTA_CONVENCION_INTER"."CIERRE_VENTA" <= :adt_fec_fin AND
						"VISTA_CONVENCION_INTER"."CANAL_SUP" = :as_canal AND
						"VISTA_CONVENCION_INTER"."ESTADO_SUP" = 'A' AND
						"VISTA_CONVENCION_INTER"."CLASIFICA_VENTA" <> :as_tipo_clasif AND
						( "VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'P' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'S' ) AND
						"VISTA_CONVENCION_INTER"."DEPTO_SUP" = 'R' and
						"VISTA_CONVENCION_INTER"."COD_SUP" <> 'CS'
		ORDER BY	"VISTA_CONVENCION_INTER"."CONEXION" DESC,
						"VISTA_CONVENCION_INTER"."COD_PARQUE_SUP" ASC,
						"VISTA_CONVENCION_INTER"."COD_SUP" ASC
		USING		Trans_1;
	else
		ls_agrega_tit									= ', Clasificación Ventas A, B y C'
		DECLARE x4 CURSOR FOR
		SELECT		"CODIGO","SERIE","NRO_OFERTA","ESTADO","MONEDA","PRECIO","COD_PARQUE_CONT","CIERRE_VENTA","RUT_TITULAR","USO","COD_AGE","COD_PARQUE_AGE","COD_SUP","COD_PARQUE_SUP","FORMA_PAGO","PORCE_ING_CIERRE","CLASIFICA_VENTA","CONEXION"   
		FROM			"VISTA_CONVENCION_INTER"
		WHERE		"VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :adt_fec_ini AND
						"VISTA_CONVENCION_INTER"."CIERRE_VENTA" <= :adt_fec_fin AND
						"VISTA_CONVENCION_INTER"."CANAL_SUP" = :as_canal AND
						"VISTA_CONVENCION_INTER"."ESTADO_SUP" = 'A' AND
						//"VISTA_CONVENCION_INTER"."COD_PARQUE_SUP" = 103 AND
						( "VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'P' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'S' ) AND
						"VISTA_CONVENCION_INTER"."DEPTO_SUP" = 'R' and
						"VISTA_CONVENCION_INTER"."COD_SUP" <> 'CS'
		ORDER BY	"VISTA_CONVENCION_INTER"."CONEXION" DESC,
						"VISTA_CONVENCION_INTER"."COD_PARQUE_SUP" ASC,
						"VISTA_CONVENCION_INTER"."COD_SUP" ASC
		USING		Trans_1;
	end if
	if as_tipo_clasif = 'C' then
		open x2;
	else
		open x4;
	end if
	if Trans_1.sqlcode=0 then
		DO WHILE Trans_1.sqlcode=0
			if as_tipo_clasif = 'C' then
				fetch x2 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_estado_cont,:ls_moneda,:ldb_precio,:ll_parque_cont,:ldt_cierre_venta,:ll_rut_titular,:ls_uso,:ls_cod_agte,:ll_parque_agte,:ls_cod_sup,:ll_parque_sup,:ls_forma_pago,:ldb_porce_ing,:ls_clasif_vta,:ls_conexion;	
			else
				fetch x4 INTO	:ls_base,:ls_serie,:ldb_numero,:ls_estado_cont,:ls_moneda,:ldb_precio,:ll_parque_cont,:ldt_cierre_venta,:ll_rut_titular,:ls_uso,:ls_cod_agte,:ll_parque_agte,:ls_cod_sup,:ll_parque_sup,:ls_forma_pago,:ldb_porce_ing,:ls_clasif_vta,:ls_conexion;	
			end if
			if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ldb_numero) and ldb_numero > 0 and not isnull(ls_cod_sup) then
				dw_lista.Object.usuario.text			= gs_user
				dw_lista.Object.titulo_0.text			= 'Listado Convención '+ls_descrip
				dw_lista.Object.titulo_1.text			= 'Supervisor de Ventas Canal '+as_canal+ls_agrega_tit
				dw_lista.Object.titulo_2.text			= 'Período de Ventas desde '+string(adt_fec_ini,'dd/mm/yyyy')+' hasta el '+string(adt_fec_fin,'dd/mm/yyyy')
				SELECT	max("CIERRE_VENTA"."CIERRE_VENTA")  
				INTO 		:ldt_fec_ult_cierre  
				FROM 	"CIERRE_VENTA"  
				WHERE	"CIERRE_VENTA"."CIERRE_VENTA" <= :adt_fec_fin
				USING	Trans_2;
				if Trans_2.sqlcode=0 then
					if not isnull(ldt_fec_ult_cierre) then
						ldt_fec_ult_cierre				= ldt_fec_ult_cierre
					else
						ldt_fec_ult_cierre				= adt_fec_fin
					end if
				else
					ldt_fec_ult_cierre					= adt_fec_fin
				end if
				dw_lista.Object.titulo_3.text	 		= 'Último Período de Ventas Finalizado '+string(ldt_fec_ult_cierre,'dd/mm/yyyy')
				if ll_fila = 1 then
					ls_cod_sup_aux					= ls_cod_sup
					ll_parque_sup_aux					= ll_parque_sup
					ll_parque_cont_aux				= ll_parque_cont
					ls_conexion_aux					= ls_conexion
				end if
				SELECT DISTINCT 	"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_SUP",	"FECHA_INI_SUP"  
				INTO		:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque,	:ldt_fecha_ing
				FROM		"VISTA_ESTRUCTURA_VENTAS"  
				WHERE	"VISTA_ESTRUCTURA_VENTAS"."COD_SUP" = :ls_cod_sup_aux AND  
							"VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_SUP" = :ll_parque_sup_aux AND  
							"VISTA_ESTRUCTURA_VENTAS"."ESTADO_SUP" = 'A' AND  
							"VISTA_ESTRUCTURA_VENTAS"."DEPTO_SUP" = 'R' AND
							"VISTA_ESTRUCTURA_VENTAS"."CONEXION" = :ls_conexion_aux
				USING	Trans_2;
				if Trans_2.sqlcode=0 then
					ls_supervisor						= ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
					if ls_moneda = '1' then
						ldb_precio_uf					= round(ldb_precio / adb_valor_uf, 2)
					elseif ls_moneda = '2' then
						ldb_precio_uf					= round(ldb_precio, 2)
					end if
					//----------Modificaciones--------------
					ll_contr_ped							= f_docto_pend_conv(ls_base,ls_serie,ldb_numero,ll_parque_cont,ldt_cierre_venta)
					if ll_contr_ped=0 then
						ldb_precio_uf					= ldb_precio_uf
					else
						ldb_precio_uf					= 0
					end if
					if adt_fec_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
						ll_rut_resuelto 					= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_uso
						ldb_persist						= wf_persist(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
						ldb_mora						= round(100 - ldb_persist, 4)
					elseif as_tipo='N' and adt_fec_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
						ll_rut_resuelto 					= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_uso
						ldb_persist						= wf_persist(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
						ldb_mora						= round(100 - ldb_persist, 4)
					elseif as_tipo='I' and adt_fec_ini= datetime(date(string('30/06/2012')),time('00:00:00')) then //NUEVO 30/06/2012
						ll_rut_resuelto 					= wf_rut_titular(ll_rut_titular)
						ls_uso							= ls_clasif_vta
						ll_antig							= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
						if ll_antig>=180 then	
							ldb_persist					= wf_persist(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
						else
							ldb_persist					= wf_persist_menor6(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
						end if
						ldb_mora						= round(100 - ldb_persist, 4)
					else
						if as_tipo='N' then //NUEVO 01/01/2013
							ll_rut_resuelto 				= wf_rut_titular(ll_rut_titular)
							ls_uso						= ls_clasif_vta
							ll_antig						= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
							if ll_antig>=180 then	
								ldb_persist				= wf_persist(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
							else
								ldb_persist				= wf_persist_menor6(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
							end if
							ldb_mora					= round(100 - ldb_persist, 4)
							ls_clasif						= wf_clasif(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
						elseif as_tipo='I' then //NUEVO 30/06/2013
							ll_rut_resuelto 				= wf_rut_titular(ll_rut_titular)
							ls_uso						= ls_clasif_vta
							ll_antig						= DaysAfter(date(ldt_fecha_ing), date(adt_fec_clasif)) 	
							if ll_antig>=180 then	
								ldb_persist				= wf_persist(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
							else
								ldb_persist				= wf_persist_menor6(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
							end if
							ldb_mora					= round(100 - ldb_persist, 4)
							ls_clasif						= wf_clasif(ls_cod_sup_aux,adt_fec_clasif,ll_parque,as_cargo)
						end if
					end if
					if ll_rut_resuelto > 0 then
						if adt_fec_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
							ll_mult_res					= 0
						elseif as_tipo='N' and adt_fec_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
							ll_mult_res					= 1
						elseif as_tipo='I' and adt_fec_ini= datetime(date(string('30/06/2012')),time('00:00:00'))then //NUEVO 30/06/2012
								ll_mult_res				= 0
						else
							if as_tipo='N' then //NUEVO 01/01/2013
								ll_mult_res				= 0
							elseif as_tipo='I' then //NUEVO 30/06/2013
								ll_mult_res				= 1	
							end if
						end if
					else
						ll_mult_res						= 1
					end if
					//------------------------------------
					ll_mes								= month(date(ldt_cierre_venta))
					ll_ano									= year(date(ldt_cierre_venta))
					ldb_ponder							= wf_ponderacion(ll_mes,ll_ano,as_tipo,adt_fec_ini)
					ldb_puntos							= wf_puntos(ls_uso,ll_parque_cont,as_tipo,adt_fec_ini)
					ll_contr_ped							= f_docto_pend_conv(ls_base,ls_serie,ldb_numero,ll_parque_cont,ldt_cierre_venta)
					ldb_tot_uf							= round((((ldb_precio_uf * ldb_ponder) * ldb_puntos) * ll_mult_res),2)
					ldb_calc_mora						= Round(ldb_mora / 100, 4)
					ldb_puntaje							= (1 - ldb_calc_mora) * ldb_sum
					if ls_cod_sup_aux = ls_cod_sup then
						ldb_sum							= ldb_sum + ldb_tot_uf
					else
						ll_new							= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup_aux)
						dw_lista.setitem(ll_new,"total_uf",ldb_sum)
						dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
						dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
						dw_lista.setitem(ll_new,"agente",ls_supervisor)
						dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
						dw_lista.setitem(ll_new,"cod_parque",ll_parque_sup_aux)
						dw_lista.setitem(ll_new,"cargo",as_cargo)
						dw_lista.setitem(ll_new,"clasif",ls_clasif)
						ldb_sum							= ldb_tot_uf
						ls_cod_sup_aux 				= ls_cod_sup
						ll_parque_sup_aux				= ll_parque_sup
						ll_parque_cont_aux			= ll_parque_cont
						ls_conexion_aux				= ls_conexion
					end if
				end if
			end if
			ll_fila ++
			setnull(ls_base);setnull(ls_serie);setnull(ldb_numero);Setnull(ls_cod_sup)
		LOOP
		ldb_calc_mora									= Round(ldb_mora / 100, 4)
		ldb_puntaje										= (1 - ldb_calc_mora) * ldb_sum
		ll_new											= dw_lista.insertrow(0)
		dw_lista.scrolltorow(ll_new)
		SELECT DISTINCT	"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_SUP",	"FECHA_INI_SUP"  
		INTO		:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque,	:ldt_fecha_ing  
		FROM		"VISTA_ESTRUCTURA_VENTAS"  
		WHERE	"VISTA_ESTRUCTURA_VENTAS"."COD_SUP" = :ls_cod_sup_aux AND  
					"VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_SUP" = :ll_parque_sup_aux AND  
					"VISTA_ESTRUCTURA_VENTAS"."ESTADO_SUP" = 'A' AND  
					"VISTA_ESTRUCTURA_VENTAS"."DEPTO_SUP" = 'R' AND
					"VISTA_ESTRUCTURA_VENTAS"."CONEXION" = :ls_conexion_aux  
		USING	Trans_2;
		if Trans_2.sqlcode=0 then
			ls_supervisor								= 	ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
			ls_clasif										= wf_clasif(ls_cod_sup_aux,adt_fec_clasif,ll_parque_sup_aux,as_cargo)
			dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup_aux)
			dw_lista.setitem(ll_new,"total_uf",ldb_sum)
			dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
			dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
			dw_lista.setitem(ll_new,"agente",ls_supervisor)
			dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
			dw_lista.setitem(ll_new,"cod_parque",ll_parque_cont_aux)
			dw_lista.setitem(ll_new,"cargo",as_cargo)
			dw_lista.setitem(ll_new,"clasif",ls_clasif)
		end if
		ldb_sum											= ldb_tot_uf
	end if
	if as_tipo_clasif = 'C' then
		close x2;
	else
		close x4;
	end if
end if
SetPointer(Arrow!)
dw_lista.accepttext()
dw_lista.setsort("puntaje D,mora A,total_uf D")
dw_lista.sort()
dw_lista.accepttext()
end subroutine

public function string wf_clasif (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo);string	ls_clasif
//wf_clasif(as_codigo,adt_fec_clasif,al_cod_parque,as_cargo)
if as_cargo='A' then
	if al_cod_parque = 11 then
		SELECT	"FORESTA"."CLASIFICA_HIST"."TIPO_CLASIFICA"
		INTO		:ls_clasif
		FROM		"FORESTA"."CLASIFICA_HIST"  
		WHERE	"FORESTA"."CLASIFICA_HIST"."COD_AGE" = :as_codigo AND
					"FORESTA"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_clasif) and ls_clasif<>'' then
				ls_clasif								= ls_clasif
			end if
		end if
	else
		SELECT	"PRADO"."CLASIFICA_HIST"."TIPO_CLASIFICA"
		INTO		:ls_clasif
		FROM		"PRADO"."CLASIFICA_HIST"  
		WHERE	"PRADO"."CLASIFICA_HIST"."COD_AGE" = :as_codigo AND
					"PRADO"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_clasif) and ls_clasif<>'' then
				ls_clasif								= ls_clasif
			end if
		end if
	end if
elseif as_cargo='S' then
	if al_cod_parque = 11 then
		SELECT	"FORESTA"."CLASIFICA_HIST_SUP"."TIPO_CLASIFICA_SUP"  
		INTO		:ls_clasif 
		FROM		"FORESTA"."CLASIFICA_HIST_SUP"  
		WHERE	"FORESTA"."CLASIFICA_HIST_SUP"."COD_SUP" = :as_codigo AND
					"FORESTA"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_clasif) and ls_clasif<>'' then
				ls_clasif								= ls_clasif
			end if
		end if
	else
		SELECT	"PRADO"."CLASIFICA_HIST_SUP"."TIPO_CLASIFICA_SUP" 
		INTO		:ls_clasif
		FROM		"PRADO"."CLASIFICA_HIST_SUP"  
		WHERE	"PRADO"."CLASIFICA_HIST_SUP"."COD_SUP" = :as_codigo AND
					"PRADO"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_clasif) and ls_clasif<>'' then
				ls_clasif								= ls_clasif
			end if
		end if
	end if
end if
if isnull(ls_clasif) or ls_clasif='' then ls_clasif='C'
return ls_clasif
end function

public function long wf_licen_medica (string as_cod_age, datetime adt_fec_ini, datetime adt_fec_fin);long		ll_licen,ll_cta_lice,ll_mes
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fec_ini_val,ldt_fec_fin_val

ldt_fec_ini_val						= datetime(date(string('01/01/1900')))
ldt_fec_fin_val						= datetime(date(string('01/01/1900')))

//wf_licen_medica(as_cod_age,adt_fec_ini,adt_fec_fin)
ll_cta_lice							= 0
DECLARE x3 CURSOR FOR
SELECT	"LICENCIAS"."FECHA_INICIO_LICENCIA", "LICENCIAS"."FECHA_FIN_LICENCIA"
FROM		"AGENTES",	"LICENCIAS"  
WHERE	"AGENTES"."RUT" = "LICENCIAS"."RUT_EMPLEADO" and  
			"AGENTES"."COD_AGE" = "LICENCIAS"."CODIGO_EMPLEADO" and  
			"AGENTES"."COD_AGE" = :as_cod_age AND
			(("LICENCIAS"."FECHA_FIN_LICENCIA" >= :adt_fec_ini AND "LICENCIAS"."FECHA_FIN_LICENCIA" <= :adt_fec_fin) OR
			("LICENCIAS"."FECHA_INICIO_LICENCIA" >= :adt_fec_ini AND "LICENCIAS"."FECHA_INICIO_LICENCIA" <= :adt_fec_fin) OR 
			("LICENCIAS"."FECHA_INICIO_LICENCIA" <= :adt_fec_ini AND "LICENCIAS"."FECHA_FIN_LICENCIA" >= :adt_fec_fin))
USING		sqlca;
open x3;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x3 INTO :ldt_fecha_ini,:ldt_fecha_fin;
		if not isnull(ldt_fecha_ini) and ldt_fecha_ini <> ldt_fec_ini_val and not isnull(ldt_fecha_fin) and ldt_fecha_fin <> ldt_fec_fin_val then
			if ldt_fecha_ini<adt_fec_ini and ldt_fecha_fin<=adt_fec_fin then
				ll_licen					= (daysafter(date(adt_fec_ini),date(ldt_fecha_fin))+1)
			elseif ldt_fecha_ini>=adt_fec_ini and ldt_fecha_fin<=adt_fec_fin then
				ll_licen					= (daysafter(date(ldt_fecha_ini), date(ldt_fecha_fin))+1)
			elseif ldt_fecha_ini>=adt_fec_ini and ldt_fecha_fin>=adt_fec_fin then
				ll_licen					= (daysafter(date(ldt_fecha_ini), date(adt_fec_fin))+1)
			elseif ldt_fecha_ini<=adt_fec_ini and ldt_fecha_fin>=adt_fec_fin then
				ll_licen					= (daysafter(date(adt_fec_ini), date(adt_fec_fin))+1)
			end if	
			ll_cta_lice					= ll_cta_lice + ll_licen
		end if
		setnull(ldt_fecha_ini);setnull(ldt_fecha_fin)
	LOOP
end if
close x3;
if ll_cta_lice<=0 then
	ll_cta_lice							= 0
end if

if isnull(ll_cta_lice) then ll_cta_lice=0
Return ll_cta_lice
end function

on w_convencion.create
this.cb_3=create cb_3
this.dw_tipo_clasif=create dw_tipo_clasif
this.cb_filtrar=create cb_filtrar
this.cb_limpiar=create cb_limpiar
this.dw_base=create dw_base
this.cb_1=create cb_1
this.cb_bases=create cb_bases
this.rb_internacional=create rb_internacional
this.rb_nacional=create rb_nacional
this.rb_super=create rb_super
this.rb_agte=create rb_agte
this.em_agente=create em_agente
this.pb_buscar=create pb_buscar
this.st_promesa=create st_promesa
this.cb_detalle=create cb_detalle
this.rb_nf=create rb_nf
this.rb_ni=create rb_ni
this.cb_ordenar=create cb_ordenar
this.cb_clasif_hist=create cb_clasif_hist
this.dw_lista=create dw_lista
this.dw_fecha_cierre=create dw_fecha_cierre
this.pb_aceptar=create pb_aceptar
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_3,&
this.dw_tipo_clasif,&
this.cb_filtrar,&
this.cb_limpiar,&
this.dw_base,&
this.cb_1,&
this.cb_bases,&
this.rb_internacional,&
this.rb_nacional,&
this.rb_super,&
this.rb_agte,&
this.em_agente,&
this.pb_buscar,&
this.st_promesa,&
this.cb_detalle,&
this.rb_nf,&
this.rb_ni,&
this.cb_ordenar,&
this.cb_clasif_hist,&
this.dw_lista,&
this.dw_fecha_cierre,&
this.pb_aceptar,&
this.cb_imprimir,&
this.cb_2,&
this.cb_exportar,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_convencion.destroy
destroy(this.cb_3)
destroy(this.dw_tipo_clasif)
destroy(this.cb_filtrar)
destroy(this.cb_limpiar)
destroy(this.dw_base)
destroy(this.cb_1)
destroy(this.cb_bases)
destroy(this.rb_internacional)
destroy(this.rb_nacional)
destroy(this.rb_super)
destroy(this.rb_agte)
destroy(this.em_agente)
destroy(this.pb_buscar)
destroy(this.st_promesa)
destroy(this.cb_detalle)
destroy(this.rb_nf)
destroy(this.rb_ni)
destroy(this.cb_ordenar)
destroy(this.cb_clasif_hist)
destroy(this.dw_lista)
destroy(this.dw_fecha_cierre)
destroy(this.pb_aceptar)
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;long	ll_pond_cierre,ll_pond_uso

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_convencion)
if gl_proceso>=2  then
	dw_tipo_clasif.dataobject			= 'dwe_convencion_tipo_clasif'
	dw_tipo_clasif.settransobject(sqlca)
	dw_tipo_clasif.insertrow(0)
	dw_base.dataobject					= 'dwe_conven_base'
	dw_base.settransobject(sqlca)
	dw_fecha_cierre.settransobject(sqlca)
	dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(datetime(date(string('31/01/2011'))))=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_fecha_cierre.insertrow(0)
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_convencion)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_3 from commandbutton within w_convencion
integer x = 3131
integer y = 2128
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

event clicked;//string	ls_descrip,ls_base,ls_serie,ls_estado_cont,ls_moneda,ls_uso,ls_cod_agte,ls_cod_sup,ls_cod_agte_aux,ls_nombre_agte,&
//			ls_a_pater_agte,ls_a_mater_agte,ls_cod_sup_est,ls_nombre_sup,ls_a_pater_sup,ls_a_mater_sup,ls_cod_jefe,ls_nombre_jefe,&
//			ls_a_pater_jefe,ls_a_mater_jefe,ls_agente,ls_contr_ped,ls_cod_sup_aux,ls_forma_pago,ls_clasif_vta,ls_supervisor
//long		ll_fila,ll_numero,ll_parque_cont,ll_rut_titular,ll_parque_agte,ll_parque_sup,ll_parque_agte_aux,ll_parque_cont_aux,&
//			ll_parque,ll_rut_resuelto,ll_mes,ll_ano,ll_new,ll_parque_sup_aux
//datetime	ldt_cierre_venta
//double	ldb_precio,ldb_precio_uf,ldb_ponder,ldb_puntos,ldb_tot_uf,ldb_persist,ldb_mora,ldb_calc_mora,ldb_puntaje,ldb_sum,&
//			ldb_porce_ing
//
//dw_lista.Reset()
//dw_fecha_cierre.AcceptText()
//dw_base.AcceptText()
//SetPointer(HourGlass!)
//if as_tipo = 'I' then
//	ls_descrip																	= 'Internacional'
//elseif as_tipo = 'N' then
//	ls_descrip																	= 'Nacional'
//end if
//if as_cargo = 'A' then
//	dw_lista.dataobject														= 'dwe_convencion_inter'
//	st_promesa.text															= 'Buscar Agente :'
//	dw_lista.settransobject(sqlca)
//	ll_fila																		= 1
//	DECLARE x1 CURSOR FOR
//	SELECT	"CODIGO",	"SERIE",	"NRO_OFERTA",	"ESTADO",	"MONEDA",	"PRECIO",	"COD_PARQUE_CONT",	"CIERRE_VENTA",	"RUT_TITULAR",	"USO",	"COD_AGE",	"COD_PARQUE_AGE",	"COD_SUP",	"COD_PARQUE_SUP", "FORMA_PAGO",	"PORCE_ING_CIERRE",	"CLASIFICA_VENTA"   
//	FROM		"VISTA_CONVENCION_INTER"
//	WHERE		("VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :adt_fec_ini AND
//				"VISTA_CONVENCION_INTER"."CIERRE_VENTA" <= :adt_fec_fin AND
//				"VISTA_CONVENCION_INTER"."CANAL_AGE" = :as_canal AND
//				"VISTA_CONVENCION_INTER"."ESTADO_AGE" = 'A' AND
//				"VISTA_CONVENCION_INTER"."CLASIFICA_VENTA" <> 'C' AND
//				( "VISTA_CONVENCION_INTER"."TIPO_CONT" = '4' OR  "VISTA_CONVENCION_INTER"."TIPO_CONT" = '5') AND
//				( "VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C') AND
//				( "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'K' OR "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'M'))
//	ORDER BY   "VISTA_CONVENCION_INTER"."COD_AGE" ASC,
//				  "VISTA_CONVENCION_INTER"."COD_PARQUE_AGE" ASC
//				  
//	USING		sqlca;
//	open x1;
//	if sqlca.sqlcode=0 then
//		DO WHILE sqlca.sqlcode=0
//			fetch x1 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ls_estado_cont,	:ls_moneda,	:ldb_precio,	:ll_parque_cont,	:ldt_cierre_venta,	:ll_rut_titular,	:ls_uso,	:ls_cod_agte,	:ll_parque_agte,	:ls_cod_sup,	:ll_parque_sup,	:ls_forma_pago,	:ldb_porce_ing,	:ls_clasif_vta;	
//				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 and not isnull(ls_cod_agte) and not isnull(ldt_cierre_venta) then
//					dw_lista.Object.usuario.text	 						= gs_user
//					dw_lista.Object.titulo_0.text	 						= 'Listado Convención '+ls_descrip
//					dw_lista.Object.titulo_1.text	 						= 'Agentes de Ventas Canal '+as_canal
//					dw_lista.Object.titulo_2.text	 						= 'Período de Ventas desde '+string(adt_fec_ini,'dd/mm/yyyy')+' hasta el '+string(adt_fec_fin,'dd/mm/yyyy')
//					if ll_fila = 1 then
//						ls_cod_agte_aux										= ls_cod_agte
//						ll_parque_agte_aux									= ll_parque_agte
//						ll_parque_cont_aux									= ll_parque_cont
//					end if
//					SELECT	"NOMBRE_AGE",		"A_PATERNO_AGE",	"A_MATERNO_AGE",	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",		"COD_PARQUE_AGE"  
//					INTO		:ls_nombre_agte,	:ls_a_pater_agte,	:ls_a_mater_agte,	:ls_cod_sup_est,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//					FROM		"VISTA_ESTRUCTURA_VENTAS"  
//					WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_AGE" = :ls_cod_agte_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_AGE" = :ll_parque_agte_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_AGE" = 'A' ) AND  
//								("VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'K' OR "VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'M')   
//					USING		Trans_1;
//					if Trans_1.sqlcode=0 then
//						ls_agente												= 	ls_nombre_agte+' '+ls_a_pater_agte+' '+ls_a_mater_agte
//						SELECT	"VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA"
//						INTO		:ls_contr_ped
//						FROM		"VISTA_DOCUMENTOS_PENDIENTES"  
//						WHERE 	( "VISTA_DOCUMENTOS_PENDIENTES"."CODIGO" = :ls_base ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."SERIE" = :ls_serie ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."NUMERO" = :ll_numero ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."COD_PARQUE" = :ll_parque_cont ) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."TIPO_EXCEPCION" = 4) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA" = 'P')
//						USING	Trans_2;		
//						if Trans_2.sqlcode=0 then
//							if not isnull(ls_contr_ped) and ls_contr_ped <> '' then
//							end if
//						else					
//							SELECT DISTINCT "PRADO"."CADENA"."RUT"  
//							INTO		:ll_rut_resuelto  
//							FROM		"PRADO"."CADENA"  
//							WHERE	 ( "PRADO"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									 ( "PRADO"."CADENA"."ESTADO" = 'R' )
//							UNION
//							SELECT DISTINCT "FORESTA"."CADENA"."RUT"  
//							FROM	  "FORESTA"."CADENA"  
//							WHERE	( "FORESTA"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "FORESTA"."CADENA"."ESTADO" = 'R' )
//							USING	Trans_2;
//							if Trans_2.sqlcode=0 then
//								if not isnull(ll_rut_resuelto) and ll_rut_resuelto > 0 then
//								end if
//							else
//								if ls_moneda = '1' then
//									ldb_precio_uf								= round(ldb_precio / adb_valor_uf, 2)
//								elseif ls_moneda = '2' then
//									ldb_precio_uf								= round(ldb_precio, 2)
//								end if
//								ll_mes											= month(date(ldt_cierre_venta))
//								ll_ano											= year(date(ldt_cierre_venta))
//								SELECT	"PONDERACION"  
//								INTO		:ldb_ponder  
//								FROM		"CONVEN_CIERRE_PONDERADO"  
//								WHERE		"CONVEN_CIERRE_PONDERADO"."MES" = :ll_mes AND
//											"CONVEN_CIERRE_PONDERADO"."ANNO" = :ll_ano AND
//											"CONVEN_CIERRE_PONDERADO"."TIPO" = :as_tipo AND
//											"CONVEN_CIERRE_PONDERADO"."FECHA" = :adt_fec_ini
//								USING		Trans_4;
//								SELECT	"PUNTOS"  
//								INTO		:ldb_puntos  
//								FROM		"CONVEN_USO_PONDERADO"  
//								WHERE		( "CONVEN_USO_PONDERADO"."USO" = :ls_uso ) AND  
//											( "CONVEN_USO_PONDERADO"."COD_PARQUE" = :ll_parque_cont ) AND  
//											( "CONVEN_USO_PONDERADO"."TIPO" = :as_tipo ) AND
//											( "CONVEN_USO_PONDERADO"."FECHA" = :adt_fec_ini )
//								USING		Trans_4;
//								
//								ldb_tot_uf										= ((ldb_precio_uf * ldb_ponder) * ldb_puntos)
//								if ll_parque = 11 then
//									SELECT	"FORESTA"."CLASIFICA_HIST"."PORCE_CLASIFICA"  
//									INTO		:ldb_persist  
//									FROM		"FORESTA"."CLASIFICA_HIST"  
//									WHERE		"FORESTA"."CLASIFICA_HIST"."COD_AGE" = :ls_cod_agte_aux AND
//												"FORESTA"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= round(100 - ldb_persist, 4)
//										else
//											ldb_mora								= round(0, 4)
//										end if
//									else
//										ldb_mora									= round(0, 4)
//									end if
//								else
//									SELECT	"PRADO"."CLASIFICA_HIST"."PORCE_CLASIFICA"  
//									INTO		:ldb_persist  
//									FROM		"PRADO"."CLASIFICA_HIST"  
//									WHERE		"PRADO"."CLASIFICA_HIST"."COD_AGE" = :ls_cod_agte_aux AND
//												"PRADO"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :adt_fec_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= round(100 - ldb_persist, 4)
//										else
//											ldb_mora								= round(0, 4)
//										end if
//									else
//										ldb_mora									= round(0, 4)
//									end if
//								end if
//								ldb_calc_mora									= Round(ldb_mora / 100, 4)
//								ldb_puntaje										= (1 - ldb_calc_mora) * ldb_sum
//
//								if ls_cod_agte_aux = ls_cod_agte then
//									ldb_sum										= ldb_sum + ldb_tot_uf
//								else
//									ll_new										= dw_lista.insertrow(0)
//									dw_lista.scrolltorow(ll_new)
//									dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte_aux)
//									dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//									dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//									dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//									dw_lista.setitem(ll_new,"agente",ls_agente)
//									dw_lista.setitem(ll_new,"cod_super",ls_cod_sup_est)
//									dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//									dw_lista.setitem(ll_new,"cod_parque",ll_parque_agte_aux)
//									dw_lista.setitem(ll_new,"cargo",as_cargo)
//									ldb_sum										= ldb_tot_uf
//									ls_cod_agte_aux 							= ls_cod_agte
//									ll_parque_agte_aux						= ll_parque_agte
//									ll_parque_cont_aux						= ll_parque_cont
//								end if
//							end if
//						end if
//					end if
//				end if
//				ll_fila ++
//				setnull(ls_base);setnull(ls_serie);setnull(ll_numero);Setnull(ls_cod_agte);Setnull(ldt_cierre_venta);Setnull(ll_parque_agte)
//			LOOP
//			ldb_calc_mora														= Round(ldb_mora / 100, 4)
//			ldb_puntaje															= (1 - ldb_calc_mora) * ldb_sum
//			ll_new																= dw_lista.insertrow(0)
//			dw_lista.scrolltorow(ll_new)
//			SELECT	"NOMBRE_AGE",		"A_PATERNO_AGE",	"A_MATERNO_AGE",	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_AGE"  
//			INTO		:ls_nombre_agte,	:ls_a_pater_agte,	:ls_a_mater_agte,	:ls_cod_sup,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//			FROM		"VISTA_ESTRUCTURA_VENTAS"  
//			WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_AGE" = :ls_cod_agte_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_AGE" = :ll_parque_agte_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_AGE" = 'A' ) AND  
//						("VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'K' OR "VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'M')   
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				ls_agente		= 	ls_nombre_agte+' '+ls_a_pater_agte+' '+ls_a_mater_agte
//				dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte_aux)
//				dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//				dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//				dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//				dw_lista.setitem(ll_new,"agente",ls_agente)
//				dw_lista.setitem(ll_new,"cod_super",ls_cod_sup)
//				dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//				dw_lista.setitem(ll_new,"cod_parque",ll_parque)
//				dw_lista.setitem(ll_new,"cargo",as_cargo)
//			end if
//			ldb_sum																= ldb_tot_uf
//		end if
//	close x1;
//// sup	
//elseif as_cargo = 'S' then
//	dw_lista.dataobject														= 'dwe_convencion_inter_sup'
//	st_promesa.text															= 'Buscar Supervisor :'
//	dw_lista.settransobject(sqlca)
//	ll_fila																		= 1
//	DECLARE x2 CURSOR FOR
//	SELECT	"CODIGO",	"SERIE",	"NRO_OFERTA",	"ESTADO",	"MONEDA",	"PRECIO",	"COD_PARQUE_CONT",	"CIERRE_VENTA",	"RUT_TITULAR",	"USO",	"COD_AGE",	"COD_PARQUE_AGE",	"COD_SUP",	"COD_PARQUE_SUP", "FORMA_PAGO",	"PORCE_ING_CIERRE",	"CLASIFICA_VENTA"   
//	FROM		"VISTA_CONVENCION_INTER"
//	WHERE		"VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :adt_fec_ini AND
//				"VISTA_CONVENCION_INTER"."CIERRE_VENTA" <= :adt_fec_fin AND
//				"VISTA_CONVENCION_INTER"."CANAL_SUP" = :as_canal AND
//				"VISTA_CONVENCION_INTER"."ESTADO_SUP" = 'A' AND
//				"VISTA_CONVENCION_INTER"."CLASIFICA_VENTA" <> 'C' AND
//				( "VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C') AND
//				"VISTA_CONVENCION_INTER"."DEPTO_SUP" = 'R' and
//				"VISTA_CONVENCION_INTER"."COD_SUP" <> 'CS'
//	ORDER BY	"VISTA_CONVENCION_INTER"."COD_PARQUE_SUP" ASC,
//				"VISTA_CONVENCION_INTER"."COD_SUP" ASC
//	USING		sqlca;
//	open x2;
//	if sqlca.sqlcode=0 then
//		DO WHILE sqlca.sqlcode=0
//			fetch x2 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ls_estado_cont,	:ls_moneda,	:ldb_precio,	:ll_parque_cont,	:ldt_cierre_venta,	:ll_rut_titular,	:ls_uso,	:ls_cod_agte,	:ll_parque_agte,	:ls_cod_sup,	:ll_parque_sup,	:ls_forma_pago,	:ldb_porce_ing,	:ls_clasif_vta;	
//				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 and not isnull(ls_cod_sup) then
//					dw_lista.Object.usuario.text	 						= gs_user
//					dw_lista.Object.titulo_0.text	 						= 'Listado Convención '+ls_descrip
//					dw_lista.Object.titulo_1.text	 						= 'Supervisor de Ventas Canal '+as_canal
//					dw_lista.Object.titulo_2.text	 						= 'Período de Ventas desde '+string(adt_fec_ini,'dd/mm/yyyy')+' hasta el '+string(adt_fec_fin,'dd/mm/yyyy')
//					if ll_fila = 1 then
//						ls_cod_sup_aux											= ls_cod_sup
//						ll_parque_sup_aux										= ll_parque_sup
//						ll_parque_cont_aux									= ll_parque_cont
//					end if
//					SELECT DISTINCT 	"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_SUP"  
//					INTO					:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//					FROM		"VISTA_ESTRUCTURA_VENTAS"  
//					WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_SUP" = :ls_cod_sup_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_SUP" = :ll_parque_sup_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_SUP" = 'A' ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."DEPTO_SUP" = 'R' )   
//					USING		Trans_1;
//					if Trans_1.sqlcode=0 then
//						ls_supervisor												= 	ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
//						SELECT	"VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA"
//						INTO		:ls_contr_ped
//						FROM		"VISTA_DOCUMENTOS_PENDIENTES"  
//						WHERE 	( "VISTA_DOCUMENTOS_PENDIENTES"."CODIGO" = :ls_base ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."SERIE" = :ls_serie ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."NUMERO" = :ll_numero ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."COD_PARQUE" = :ll_parque_cont) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."TIPO_EXCEPCION" = 4) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA" = 'P')
//						USING	Trans_2;		
//						if Trans_2.sqlcode=0 then
//							if not isnull(ls_contr_ped) and ls_contr_ped <> '' then
//							end if
//						else
//							SELECT DISTINCT "PRADO"."CADENA"."RUT"  
//							INTO	:ll_rut_resuelto  
//							FROM	"PRADO"."CADENA"  
//							WHERE	( "PRADO"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "PRADO"."CADENA"."ESTADO" = 'R' )
//							UNION
//							SELECT DISTINCT "FORESTA"."CADENA"."RUT"  
//							FROM	"FORESTA"."CADENA"  
//							WHERE	( "FORESTA"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "FORESTA"."CADENA"."ESTADO" = 'R' )
//							USING	Trans_4;
//							if Trans_4.sqlcode=0 then
//								if not isnull(ll_rut_resuelto) and ll_rut_resuelto > 0 then
//								end if
//							else
//								if ls_moneda = '1' then
//									ldb_precio_uf								= Round(ldb_precio / adb_valor_uf, 2)
//								elseif ls_moneda = '2' then
//									ldb_precio_uf								= Round(ldb_precio, 2)
//								end if
//								ll_mes											= month(date(ldt_cierre_venta))
//								ll_ano											= year(date(ldt_cierre_venta))
//								SELECT	"PONDERACION"  
//								INTO		:ldb_ponder  
//								FROM		"CONVEN_CIERRE_PONDERADO"  
//								WHERE		"CONVEN_CIERRE_PONDERADO"."MES" = :ll_mes AND
//											"CONVEN_CIERRE_PONDERADO"."ANNO" = :ll_ano AND
//											"CONVEN_CIERRE_PONDERADO"."TIPO" = :as_tipo AND
//											"CONVEN_CIERRE_PONDERADO"."FECHA" = :adt_fec_ini 
//								USING		Trans_4;
//								SELECT	"PUNTOS"  
//								INTO		:ldb_puntos  
//								FROM		"CONVEN_USO_PONDERADO"  
//								WHERE		( "CONVEN_USO_PONDERADO"."USO" = :ls_uso ) AND  
//											( "CONVEN_USO_PONDERADO"."COD_PARQUE" = :ll_parque_cont ) AND  
//											( "CONVEN_USO_PONDERADO"."TIPO" = :as_tipo ) AND
//											( "CONVEN_USO_PONDERADO"."FECHA" = :adt_fec_ini )
//								USING		Trans_4;
//								ldb_tot_uf										= ((ldb_precio_uf * ldb_ponder) * ldb_puntos)
//								if ll_parque = 11 then
//									SELECT	"FORESTA"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP"  
//									INTO		:ldb_persist  
//									FROM		"FORESTA"."CLASIFICA_HIST_SUP"  
//									WHERE		"FORESTA"."CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup_aux AND
//												"FORESTA"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= round(100 - ldb_persist,4)
//										else
//											ldb_mora								= round(0,4)
//										end if
//									else
//										ldb_mora									= round(0,4)
//									end if
//								else
//									SELECT	"PRADO"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP"  
//									INTO		:ldb_persist  
//									FROM		"PRADO"."CLASIFICA_HIST_SUP"  
//									WHERE		"PRADO"."CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup_aux AND
//												"PRADO"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :adt_fec_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= round(100 - ldb_persist,4)
//										else
//											ldb_mora								= round(0,4)
//										end if
//									else
//										ldb_mora									= round(0,4)
//									end if
//								end if
//								ldb_calc_mora									= Round(ldb_mora / 100, 4)
//								ldb_puntaje										= (1 - ldb_calc_mora) * ldb_sum
//								if ls_cod_sup_aux = ls_cod_sup then
//									ldb_sum										= ldb_sum + ldb_tot_uf
//								else
//									ll_new										= dw_lista.insertrow(0)
//									dw_lista.scrolltorow(ll_new)
//									dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup_aux)
//									dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//									dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//									dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//									dw_lista.setitem(ll_new,"agente",ls_supervisor)
//									dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//									dw_lista.setitem(ll_new,"cod_parque",ll_parque_sup_aux)
//									dw_lista.setitem(ll_new,"cargo",as_cargo)
//									ldb_sum										= ldb_tot_uf
//									ls_cod_sup_aux 							= ls_cod_sup
//									ll_parque_sup_aux							= ll_parque_sup
//									ll_parque_cont_aux						= ll_parque_cont
//								end if
//							end if
//						end if
//					end if
//				end if
//				ll_fila ++
//				setnull(ls_base);setnull(ls_serie);setnull(ll_numero);Setnull(ls_cod_sup)
//			LOOP
//			ldb_calc_mora														= Round(ldb_mora / 100, 4)
//			ldb_puntaje															= (1 - ldb_calc_mora) * ldb_sum
//			ll_new																= dw_lista.insertrow(0)
//			dw_lista.scrolltorow(ll_new)
//			SELECT DISTINCT	"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_SUP"  
//			INTO					:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//			FROM		"VISTA_ESTRUCTURA_VENTAS"  
//			WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_SUP" = :ls_cod_sup_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_SUP" = :ll_parque_sup_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_SUP" = 'A' ) AND  
//						("VISTA_ESTRUCTURA_VENTAS"."DEPTO_SUP" = 'R')   
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				ls_supervisor													= 	ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
//				dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup_aux)
//				dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//				dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//				dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//				dw_lista.setitem(ll_new,"agente",ls_supervisor)
//				dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//				dw_lista.setitem(ll_new,"cod_parque",ll_parque_cont_aux)
//				dw_lista.setitem(ll_new,"cargo",as_cargo)
//			end if
//			ldb_sum																= ldb_tot_uf
//		end if
//	close x2;
//end if
//SetPointer(Arrow!)
//dw_lista.accepttext()
//dw_lista.setsort("puntaje D")
//dw_lista.sort()
//dw_lista.accepttext()
end event

type dw_tipo_clasif from datawindow within w_convencion
integer x = 1705
integer y = 76
integer width = 1010
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_convencion_tipo_clasif"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.Reset()
dw_base.Reset()
end event

type cb_filtrar from commandbutton within w_convencion
integer x = 1303
integer y = 1888
integer width = 215
integer height = 92
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_limpiar from commandbutton within w_convencion
integer x = 2181
integer y = 1888
integer width = 215
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_convencion.triggerevent(open!)
gf_centrar(w_convencion)
dw_lista.Reset()
dw_base.Reset()
end event

type dw_base from datawindow within w_convencion
integer x = 46
integer y = 2080
integer width = 2807
integer height = 272
integer taborder = 30
string title = "none"
string dataobject = "dwe_conven_base"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_convencion
boolean visible = false
integer x = 3173
integer y = 2260
integer width = 210
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//string	ls_canal,ls_base,ls_serie,ls_estado_cont,ls_moneda,ls_uso,ls_cod_agte,ls_cod_sup,ls_cod_agte_aux,ls_nombre_agte,&
//			ls_a_pater_agte,ls_a_mater_agte,ls_cod_sup_est,ls_nombre_sup,ls_a_pater_sup,ls_a_mater_sup,ls_cod_jefe,ls_nombre_jefe,&
//			ls_a_pater_jefe,ls_a_mater_jefe,ls_agente,ls_contr_ped,ls_cod_sup_aux  
//long		ll_fila,ll_numero,ll_parque_cont,ll_rut_titular,ll_parque_agte,ll_parque_sup,ll_parque_agte_aux,ll_parque_cont_aux,&
//			ll_parque,ll_rut_resuelto,ll_mes,ll_ano,ll_new,ll_parque_sup_aux
//datetime	ldt_ult_fecha_cierre,ldt_fecha_clasif,ldt_fecha_cierre,ldt_cierre_venta
//double	ldb_valor_uf,ldb_precio,ldb_precio_uf,ldb_ponder,ldb_puntos,ldb_tot_uf,ldb_persist,ldb_mora,ldb_calc_mora,ldb_puntaje,&
//			ldb_sum
//
//dw_lista.Reset()
//dw_fecha_cierre.AcceptText()
//SetPointer(HourGlass!)
//SELECT	MAX("CIERRE_VENTA"."CIERRE_VENTA")
//INTO		:ldt_ult_fecha_cierre  
//FROM		"CIERRE_VENTA"
//USING		sqlca;
//if sqlca.sqlcode=0 then
//	if not isnull(ldt_ult_fecha_cierre) then
//		ldt_ult_fecha_cierre													= ldt_ult_fecha_cierre
//	end if
//end if
//SELECT	"TAB_UF"."VALOR_UF"  
//INTO		:ldb_valor_uf  
//FROM		"TAB_UF"  
//WHERE		"TAB_UF"."FECHA_UF" = :ldt_ult_fecha_cierre
//USING		sqlca;
//if sqlca.sqlcode=0 then
//	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
//		ldb_valor_uf															= ldb_valor_uf
//	end if
//end if
//SELECT 	MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
//INTO 		:ldt_fecha_clasif  
//FROM		"CLASIFICA_HIST"  
//WHERE		"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_ult_fecha_cierre
//USING		sqlca;
//if sqlca.sqlcode=0 then
//	if not isnull(ldt_fecha_clasif) then
//		ldt_fecha_clasif														= ldt_fecha_clasif
//	end if
//end if
//if rb_agte.checked = true then
//	dw_lista.dataobject														= 'dwe_convencion_inter'
//	dw_lista.settransobject(sqlca)
//	if rb_ni.checked = true then
//		ls_canal																	= 'NI'
//	elseif rb_nf.checked = true then	
//		ls_canal																	= 'NF'
//	end if
//	ll_fila																		= 1
//	ldt_fecha_cierre															= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')  
//	DECLARE x1 CURSOR FOR
//	SELECT	"CODIGO",	"SERIE",	"NRO_OFERTA",	"ESTADO",	"MONEDA",	"PRECIO",	"COD_PARQUE_CONT",	"CIERRE_VENTA",	"RUT_TITULAR",	"USO",	"COD_AGE",	"COD_PARQUE_AGE",	"COD_SUP",	"COD_PARQUE_SUP"   
//	FROM		"VISTA_CONVENCION_INTER"
//	WHERE		"VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :ldt_fecha_cierre AND
//				"VISTA_CONVENCION_INTER"."PORCE_ING_CIERRE" >= 1.98 AND
//				"VISTA_CONVENCION_INTER"."CANAL_AGE" = :ls_canal AND
//				"VISTA_CONVENCION_INTER"."ESTADO_AGE" = 'A' AND
//				(	 "VISTA_CONVENCION_INTER"."TIPO_CONT" = '4' OR  "VISTA_CONVENCION_INTER"."TIPO_CONT" = '5') AND
//				(	"VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C') AND
//				(	"VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'K' OR "VISTA_CONVENCION_INTER"."DEPTO_AGE" = 'M')
//	ORDER BY   "VISTA_CONVENCION_INTER"."COD_PARQUE_AGE" ASC,   
//				  "VISTA_CONVENCION_INTER"."COD_AGE" ASC
//	USING		sqlca;
//	open x1;
//	if sqlca.sqlcode=0 then
//		DO WHILE sqlca.sqlcode=0
//			fetch x1 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ls_estado_cont,	:ls_moneda,	:ldb_precio,	:ll_parque_cont,	:ldt_cierre_venta,	:ll_rut_titular,	:ls_uso,	:ls_cod_agte,	:ll_parque_agte,	:ls_cod_sup,	:ll_parque_sup;	
//				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 and not isnull(ls_cod_agte) then
//					dw_lista.Object.usuario.text	 						= gs_user
//					dw_lista.Object.titulo_1.text	 						= 'Agentes de Ventas Canal '+ls_canal
//					dw_lista.Object.titulo_2.text	 						= 'Período de Ventas desde '+string(ldt_fecha_cierre,'dd/mm/yyyy')+' hasta el '+string(ldt_ult_fecha_cierre,'dd/mm/yyyy')
//					if ll_fila = 1 then
//						ls_cod_agte_aux										= ls_cod_agte
//						ll_parque_agte_aux									= ll_parque_agte
//						ll_parque_cont_aux									= ll_parque_cont
//					end if
//					SELECT	"NOMBRE_AGE",		"A_PATERNO_AGE",	"A_MATERNO_AGE",	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_AGE"  
//					INTO		:ls_nombre_agte,	:ls_a_pater_agte,	:ls_a_mater_agte,	:ls_cod_sup_est,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//					FROM		"VISTA_ESTRUCTURA_VENTAS"  
//					WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_AGE" = :ls_cod_agte_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_AGE" = :ll_parque_agte_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_AGE" = 'A' ) AND  
//								("VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'K' OR "VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'M')   
//					USING		Trans_1;
//					if Trans_1.sqlcode=0 then
//						ls_agente		= 	ls_nombre_agte+' '+ls_a_pater_agte+' '+ls_a_mater_agte
//						
//						SELECT	"VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA"
//						INTO		:ls_contr_ped
//						FROM		"VISTA_DOCUMENTOS_PENDIENTES"  
//						WHERE 	( "VISTA_DOCUMENTOS_PENDIENTES"."CODIGO" = :ls_base ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."SERIE" = :ls_serie ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."NUMERO" = :ll_numero ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."COD_PARQUE" = :ll_parque_cont_aux ) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."TIPO_EXCEPCION" = 4) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA" = 'P')
//						USING	Trans_2;		
//						if Trans_2.sqlcode=0 then
//							if not isnull(ls_contr_ped) and ls_contr_ped <> '' then
//							end if
//						else
//							SELECT DISTINCT "PRADO"."CADENA"."RUT"  
//							INTO	:ll_rut_resuelto  
//							FROM	"PRADO"."CADENA"  
//							WHERE	( "PRADO"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "PRADO"."CADENA"."ESTADO" = 'R' )
//							UNION
//							SELECT DISTINCT "FORESTA"."CADENA"."RUT"  
//							FROM	"FORESTA"."CADENA"  
//							WHERE	( "FORESTA"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "FORESTA"."CADENA"."ESTADO" = 'R' )
//							USING	Trans_4;
//							if Trans_4.sqlcode=0 then
//								if not isnull(ll_rut_resuelto) and ll_rut_resuelto > 0 then
//								end if
//							else
//								if ls_moneda = '1' then
//									ldb_precio_uf								= round(ldb_precio / ldb_valor_uf, 2)
//								elseif ls_moneda = '2' then
//									ldb_precio_uf								= round(ldb_precio, 2)
//								end if
//								ll_mes											= month(date(ldt_cierre_venta))
//								ll_ano											= year(date(ldt_cierre_venta))
//								SELECT	"PONDERACION"  
//								INTO		:ldb_ponder  
//								FROM		"CONVEN_CIERRE_PONDERADO"  
//								WHERE		"CONVEN_CIERRE_PONDERADO"."MES" = :ll_mes AND
//											"CONVEN_CIERRE_PONDERADO"."ANNO" = :ll_ano AND
//											"CONVEN_CIERRE_PONDERADO"."TIPO" = 'I'
//								USING		Trans_4;
//								if Trans_4.sqlcode=0 then
//									if not isnull(ldb_ponder) and ldb_ponder>0 then
//										ldb_ponder								= ldb_ponder
//									end if
//								end if
//								SELECT	"PUNTOS"  
//								INTO		:ldb_puntos  
//								FROM		"CONVEN_USO_PONDERADO"  
//								WHERE		( "CONVEN_USO_PONDERADO"."USO" = :ls_uso ) AND  
//											( "CONVEN_USO_PONDERADO"."COD_PARQUE" = :ll_parque_cont_aux ) AND  
//											( "CONVEN_USO_PONDERADO"."TIPO" = 'I' )
//								USING		Trans_4;
//								if Trans_4.sqlcode=0 then
//									if not isnull(ldb_puntos) and ldb_puntos>0 then
//										ldb_puntos								= ldb_puntos
//									end if
//								end if
//								ldb_tot_uf										= ldb_precio_uf * ldb_ponder * ldb_puntos
//								if ll_parque = 11 then
//									SELECT	"FORESTA"."CLASIFICA_HIST"."PORCE_CLASIFICA"  
//									INTO		:ldb_persist  
//									FROM		"FORESTA"."CLASIFICA_HIST"  
//									WHERE		"FORESTA"."CLASIFICA_HIST"."COD_AGE" = :ls_cod_agte_aux AND
//												"FORESTA"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :ldt_fecha_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= round(100 - ldb_persist, 4)
//										else
//											ldb_mora								= round(0, 4)
//										end if
//									else
//										ldb_mora									= round(0, 4)
//									end if
//								else
//									SELECT	"PRADO"."CLASIFICA_HIST"."PORCE_CLASIFICA"  
//									INTO		:ldb_persist  
//									FROM		"PRADO"."CLASIFICA_HIST"  
//									WHERE		"PRADO"."CLASIFICA_HIST"."COD_AGE" = :ls_cod_agte_aux AND
//												"PRADO"."CLASIFICA_HIST"."FECHA_CLASIFICA" = :ldt_fecha_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= round(100 - ldb_persist, 4)
//										else
//											ldb_mora								= round(0, 4)
//										end if
//									else
//										ldb_mora									= round(0, 4)
//									end if
//								end if
//								ldb_calc_mora									= Round(ldb_mora / 100, 4)
//								ldb_puntaje										= ldb_sum * (1 - ldb_calc_mora)
//								
//								if ls_cod_agte_aux = ls_cod_agte and ll_parque_agte_aux = ll_parque_agte then
//									ldb_sum										= ldb_sum + ldb_tot_uf
//								else
//									ll_new										= dw_lista.insertrow(0)
//									dw_lista.scrolltorow(ll_new)
//									dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte_aux)
//									dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//									dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//									dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//									dw_lista.setitem(ll_new,"agente",ls_agente)
//									dw_lista.setitem(ll_new,"cod_super",ls_cod_sup_est)
//									dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//									dw_lista.setitem(ll_new,"cod_parque",ll_parque_agte_aux)
//									dw_lista.setitem(ll_new,"cargo",'A')
//									ldb_sum										= ldb_tot_uf
//									ls_cod_agte_aux 							= ls_cod_agte
//									ll_parque_agte_aux						= ll_parque_agte
//									ll_parque_cont_aux						= ll_parque_cont
//								end if
//							end if
//						end if
//					end if
//				end if
//				ll_fila ++
//				setnull(ls_base);setnull(ls_serie);setnull(ll_numero);Setnull(ls_cod_agte)
//			LOOP
//			
//			ldb_calc_mora									= Round(ldb_mora / 100, 4)
//			ldb_puntaje										= ldb_sum * (1 - ldb_calc_mora)
//			
//			
//			ll_new																= dw_lista.insertrow(0)
//			dw_lista.scrolltorow(ll_new)
//			SELECT	"NOMBRE_AGE",		"A_PATERNO_AGE",	"A_MATERNO_AGE",	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_AGE"  
//			INTO		:ls_nombre_agte,	:ls_a_pater_agte,	:ls_a_mater_agte,	:ls_cod_sup,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//			FROM		"VISTA_ESTRUCTURA_VENTAS"  
//			WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_AGE" = :ls_cod_agte_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_AGE" = :ll_parque_agte_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_AGE" = 'A' ) AND  
//						("VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'K' OR "VISTA_ESTRUCTURA_VENTAS"."DEPTO_AGE" = 'M')   
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				ls_agente		= 	ls_nombre_agte+' '+ls_a_pater_agte+' '+ls_a_mater_agte
//				dw_lista.setitem(ll_new,"cod_agte",ls_cod_agte_aux)
//				dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//				dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//				dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//				dw_lista.setitem(ll_new,"agente",ls_agente)
//				dw_lista.setitem(ll_new,"cod_super",ls_cod_sup)
//				dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//				dw_lista.setitem(ll_new,"cod_parque",ll_parque)
//				dw_lista.setitem(ll_new,"cargo",'A')
//			end if
//			ldb_sum																= ldb_tot_uf
//		end if
//	close x1;
//// sup	
//elseif rb_super.checked = true then
//	dw_lista.dataobject														= 'dwe_convencion_inter_sup'
//	dw_lista.settransobject(sqlca)
//	if rb_nf.checked = true then	
//		ls_canal																	= 'NF'
//	end if
//	ll_fila																		= 1
//	ldt_fecha_cierre															= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')  
//	DECLARE x2 CURSOR FOR
//	SELECT	"CODIGO",	"SERIE",	"NRO_OFERTA",	"ESTADO",	"MONEDA",	"PRECIO",	"COD_PARQUE_CONT",	"CIERRE_VENTA",	"RUT_TITULAR",	"USO",	"COD_AGE",	"COD_PARQUE_AGE",	"COD_SUP",	"COD_PARQUE_SUP"   
//	FROM		"VISTA_CONVENCION_INTER"
//	WHERE		"VISTA_CONVENCION_INTER"."CIERRE_VENTA" >= :ldt_fecha_cierre AND
//				"VISTA_CONVENCION_INTER"."PORCE_ING_CIERRE" >= 1.98 AND
//				"VISTA_CONVENCION_INTER"."CANAL_SUP" = :ls_canal AND
//				"VISTA_CONVENCION_INTER"."ESTADO_SUP" = 'A' AND
//				(	"VISTA_CONVENCION_INTER"."ESTADO" = 'V' OR "VISTA_CONVENCION_INTER"."ESTADO" = 'C') AND
//				(	"VISTA_CONVENCION_INTER"."DEPTO_SUP" = 'R')
//	ORDER BY   "VISTA_CONVENCION_INTER"."COD_PARQUE_SUP" ASC,   
//				  "VISTA_CONVENCION_INTER"."COD_SUP" ASC
//	USING		sqlca;
//	open x2;
//	if sqlca.sqlcode=0 then
//		DO WHILE sqlca.sqlcode=0
//			fetch x2 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ls_estado_cont,	:ls_moneda,	:ldb_precio,	:ll_parque_cont,	:ldt_cierre_venta,	:ll_rut_titular,	:ls_uso,	:ls_cod_agte,	:ll_parque_agte,	:ls_cod_sup,	:ll_parque_sup;	
//				if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 and not isnull(ls_cod_sup) then
//					dw_lista.Object.usuario.text	 						= gs_user
//					dw_lista.Object.titulo_1.text	 						= 'Supervisor de Ventas Canal '+ls_canal
//					dw_lista.Object.titulo_2.text	 						= 'Período de Ventas desde '+string(ldt_fecha_cierre,'dd/mm/yyyy')+' hasta el '+string(ldt_ult_fecha_cierre,'dd/mm/yyyy')
//					if ll_fila = 1 then
//						ls_cod_sup_aux											= ls_cod_sup
//						ll_parque_sup_aux										= ll_parque_sup
//						ll_parque_cont_aux									= ll_parque_cont
//					end if
//					SELECT DISTINCT 	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_SUP"  
//					INTO		:ls_cod_sup_est,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//					FROM		"VISTA_ESTRUCTURA_VENTAS"  
//					WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_SUP" = :ls_cod_sup_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_SUP" = :ll_parque_sup_aux ) AND  
//								( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_SUP" = 'A' ) AND  
//								("VISTA_ESTRUCTURA_VENTAS"."DEPTO_SUP" = 'R' )   
//					USING		Trans_1;
//					if Trans_1.sqlcode=0 then
//						ls_agente		= 	ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
//						SELECT	"VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA"
//						INTO		:ls_contr_ped
//						FROM		"VISTA_DOCUMENTOS_PENDIENTES"  
//						WHERE 	( "VISTA_DOCUMENTOS_PENDIENTES"."CODIGO" = :ls_base ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."SERIE" = :ls_serie ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."NUMERO" = :ll_numero ) AND  
//									( "VISTA_DOCUMENTOS_PENDIENTES"."COD_PARQUE" = :ll_parque_cont_aux ) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."TIPO_EXCEPCION" = 4) AND
//									( "VISTA_DOCUMENTOS_PENDIENTES"."ESTADO_ENTREGA_OPERA" = 'P')
//						USING	Trans_2;		
//						if Trans_2.sqlcode=0 then
//							if not isnull(ls_contr_ped) and ls_contr_ped <> '' then
//							end if
//						else
//							SELECT DISTINCT "PRADO"."CADENA"."RUT"  
//							INTO	:ll_rut_resuelto  
//							FROM	"PRADO"."CADENA"  
//							WHERE	( "PRADO"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "PRADO"."CADENA"."ESTADO" = 'R' )
//							UNION
//							SELECT DISTINCT "FORESTA"."CADENA"."RUT"  
//							FROM	"FORESTA"."CADENA"  
//							WHERE	( "FORESTA"."CADENA"."RUT" = :ll_rut_titular ) AND  
//									( "FORESTA"."CADENA"."ESTADO" = 'R' )
//							USING	Trans_4;
//							if Trans_4.sqlcode=0 then
//								if not isnull(ll_rut_resuelto) and ll_rut_resuelto > 0 then
//								end if
//							else
//								if ls_moneda = '1' then
//									ldb_precio_uf								= Round(ldb_precio / ldb_valor_uf, 2)
//								elseif ls_moneda = '2' then
//									ldb_precio_uf								= Round(ldb_precio, 2)
//								end if
//								ll_mes											= month(date(ldt_cierre_venta))
//								ll_ano											= year(date(ldt_cierre_venta))
//								SELECT	"PONDERACION"  
//								INTO		:ldb_ponder  
//								FROM		"CONVEN_CIERRE_PONDERADO"  
//								WHERE		"CONVEN_CIERRE_PONDERADO"."MES" = :ll_mes AND
//											"CONVEN_CIERRE_PONDERADO"."ANNO" = :ll_ano AND
//											"CONVEN_CIERRE_PONDERADO"."TIPO" = 'I'
//								USING		Trans_4;
//								if Trans_4.sqlcode=0 then
//									if not isnull(ldb_ponder) and ldb_ponder>0 then
//										ldb_ponder								= ldb_ponder
//									end if
//								end if
//								SELECT	"PUNTOS"  
//								INTO		:ldb_puntos  
//								FROM		"CONVEN_USO_PONDERADO"  
//								WHERE		( "CONVEN_USO_PONDERADO"."USO" = :ls_uso ) AND  
//											( "CONVEN_USO_PONDERADO"."COD_PARQUE" = :ll_parque_cont_aux ) AND  
//											( "CONVEN_USO_PONDERADO"."TIPO" = 'I' )
//								USING		Trans_4;
//								if Trans_4.sqlcode=0 then
//									if not isnull(ldb_puntos) and ldb_puntos>0 then
//										ldb_puntos								= ldb_puntos
//									end if
//								end if
//								ldb_tot_uf										= ldb_precio_uf * ldb_ponder * ldb_puntos
//								if ll_parque = 11 then
//									SELECT	"FORESTA"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP"  
//									INTO		:ldb_persist  
//									FROM		"FORESTA"."CLASIFICA_HIST_SUP"  
//									WHERE		"FORESTA"."CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup_aux AND
//												"FORESTA"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :ldt_fecha_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= 100 - ldb_persist
//										else
//											ldb_mora								= 0
//										end if
//									else
//										ldb_mora									= 0
//									end if
//								else
//									SELECT	"PRADO"."CLASIFICA_HIST_SUP"."PORCE_CLASIFICA_SUP"  
//									INTO		:ldb_persist  
//									FROM		"PRADO"."CLASIFICA_HIST_SUP"  
//									WHERE		"PRADO"."CLASIFICA_HIST_SUP"."COD_SUP" = :ls_cod_sup_aux AND
//												"PRADO"."CLASIFICA_HIST_SUP"."FECHA_CLASIFICA_SUP" = :ldt_fecha_clasif
//									USING		Trans_4;
//									if Trans_4.sqlcode=0 then
//										if not isnull(ldb_persist) and ldb_persist > 0 then
//											ldb_mora								= 100 - ldb_persist
//										else
//											ldb_mora								= 0
//										end if
//									else
//										ldb_mora									= 0
//									end if
//								end if
//								ldb_calc_mora									= Round(ldb_mora / 100, 4)
//								ldb_puntaje										= ldb_sum * (1 - ldb_calc_mora)
//								if ls_cod_sup_aux = ls_cod_sup and ll_parque_sup_aux = ll_parque_sup then
//									ldb_sum										= ldb_sum + ldb_tot_uf
//								else
//									ll_new										= dw_lista.insertrow(0)
//									dw_lista.scrolltorow(ll_new)
//									dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup_aux)
//									dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//									dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//									dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//									dw_lista.setitem(ll_new,"agente",ls_agente)
//									dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//									dw_lista.setitem(ll_new,"cod_parque",ll_parque_sup_aux)
//									dw_lista.setitem(ll_new,"cargo",'S')
//									ldb_sum										= ldb_tot_uf
//									ls_cod_sup_aux 							= ls_cod_sup
//									ll_parque_sup_aux							= ll_parque_sup
//									ll_parque_cont_aux						= ll_parque_cont
//								end if
//							end if
//						end if
//					end if
//				end if
//				ll_fila ++
//				setnull(ls_base);setnull(ls_serie);setnull(ll_numero);Setnull(ls_cod_sup)
//			LOOP
//			ldb_calc_mora														= Round(ldb_mora / 100, 4)
//			ldb_puntaje															= ldb_sum * (1 - ldb_calc_mora)
//			
//			
//			ll_new																= dw_lista.insertrow(0)
//			dw_lista.scrolltorow(ll_new)
//			SELECT DISTINCT	"COD_SUP",		"NOMBRE_SUP",		"A_PATERNO_SUP",	"A_MATERNO_SUP",	"COD_JEFE",		"NOMBRE_JEFE",		"A_PATERNO_JEFE",	"A_MATERNO_JEFE",	"COD_PARQUE_SUP"  
//			INTO		:ls_cod_sup_est,	:ls_nombre_sup,	:ls_a_pater_sup,	:ls_a_mater_sup,	:ls_cod_jefe,	:ls_nombre_jefe,	:ls_a_pater_jefe,	:ls_a_mater_jefe,	:ll_parque  
//			FROM		"VISTA_ESTRUCTURA_VENTAS"  
//			WHERE		( "VISTA_ESTRUCTURA_VENTAS"."COD_SUP" = :ls_cod_sup_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."COD_PARQUE_SUP" = :ll_parque_sup_aux ) AND  
//						( "VISTA_ESTRUCTURA_VENTAS"."ESTADO_SUP" = 'A' ) AND  
//						("VISTA_ESTRUCTURA_VENTAS"."DEPTO_SUP" = 'R')   
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				ls_agente		= 	ls_nombre_sup+' '+ls_a_pater_sup+' '+ls_a_mater_sup
//				dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup_aux)
//				dw_lista.setitem(ll_new,"total_uf",ldb_sum)
//				dw_lista.setitem(ll_new,"mora",ldb_calc_mora)
//				dw_lista.setitem(ll_new,"puntaje",ldb_puntaje)
//				dw_lista.setitem(ll_new,"agente",ls_agente)
//				dw_lista.setitem(ll_new,"cod_jefe",ls_cod_jefe)
//				dw_lista.setitem(ll_new,"cod_parque",ll_parque)
//				dw_lista.setitem(ll_new,"cargo",'S')
//			end if
//			ldb_sum																= ldb_tot_uf
//		end if
//	close x2;
//end if
//SetPointer(Arrow!)
//dw_lista.accepttext()
//dw_lista.setsort("puntaje D")
//dw_lista.sort()
//dw_lista.accepttext()
end event

type cb_bases from commandbutton within w_convencion
integer x = 41
integer y = 1888
integer width = 370
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Bases Calculo"
end type

event clicked;string	ls_string,ls_tipo_conven
datetime	ldt_fecha_ini

dw_fecha_cierre.accepttext()
dw_base.accepttext()

if rb_nacional.checked = true then
	ls_tipo_conven				= 'N'
elseif rb_internacional.checked = true then
	ls_tipo_conven				= 'I'
end if
ldt_fecha_ini					= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
if not isnull(ldt_fecha_ini) then
	ls_string						= string(ldt_fecha_ini,'dd/mm/yyyy')+'~t'+ls_tipo_conven
	if isvalid(w_convencion_bases) then close(w_convencion_bases)
		OpenWithParm (w_convencion_bases,ls_string)
else
	messagebox("Advertencia","Debe Seleccionar Fecha de Inicio Premiación")
end if
	
end event

type rb_internacional from radiobutton within w_convencion
integer x = 96
integer y = 168
integer width = 430
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Internacional"
end type

event clicked;dw_lista.Reset()
dw_base.Reset()
end event

type rb_nacional from radiobutton within w_convencion
integer x = 96
integer y = 96
integer width = 430
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nacional"
boolean checked = true
end type

event clicked;w_convencion.triggerevent(open!)
dw_lista.Reset()
dw_base.Reset()
end event

type rb_super from radiobutton within w_convencion
integer x = 667
integer y = 168
integer width = 393
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Supervisor"
end type

event clicked;w_convencion.triggerevent(open!)
dw_lista.Reset()
dw_base.Reset()
rb_ni.enabled		= false
rb_nf.checked		= true
st_promesa.text	= 'Buscar Supervisor :'

end event

type rb_agte from radiobutton within w_convencion
integer x = 667
integer y = 96
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agentes"
boolean checked = true
end type

event clicked;w_convencion.triggerevent(open!)
dw_lista.Reset()
dw_base.Reset()
rb_ni.enabled		= true
st_promesa.text	= 'Buscar Agente :'

end event

type em_agente from editmask within w_convencion
integer x = 2917
integer y = 1888
integer width = 242
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;if string(em_agente.text)<>'' then pb_buscar.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_convencion
integer x = 3173
integer y = 1888
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string,ls_age


ls_age								= trim(em_agente.text)
ll_tot_reg							= dw_lista.rowcount()
if dw_lista.rowcount() > 0 and not isnull(ls_age) then
	if dw_lista.dataobject		='dwe_convencion_inter' then
		ls_string					= "cod_agte = '"+ls_age+"'"
	elseif dw_lista.dataobject	='dwe_convencion_inter_sup' then
		ls_string					= "cod_sup = '"+ls_age+"'"
	end if
	ll_fila 							= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(0, false)
		dw_lista.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","No Existe Agente en la Lista")
		dw_lista.scrolltorow(1)
	end if
end if
end event

type st_promesa from statictext within w_convencion
integer x = 2450
integer y = 1904
integer width = 453
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Agente :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_detalle from commandbutton within w_convencion
integer x = 841
integer y = 1888
integer width = 375
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo,ls_string,ls_cargo,ls_tipo,ls_tipo_clasif
long		ll_cod_parque,ll_tot_reg
datetime	ldt_fecha_ini,ldt_fecha_fin

dw_base.accepttext()
ll_tot_reg									= dw_base.rowcount()
if ll_tot_reg>0 then
	if dw_lista.rowcount() > 0 and dw_base.rowcount() > 0 then
		ldt_fecha_ini						= dw_base.getitemdatetime(1,'fecha_ini')
		ldt_fecha_fin						= dw_base.getitemdatetime(1,'fecha_ult_cierre')
		ls_cargo								= dw_base.getitemstring(1,'cargo')
		ls_tipo								= dw_base.getitemstring(1,'tipo_conven')
		ls_tipo_clasif						= dw_base.getitemstring(1,'tipo_clasif')
		if dw_lista.dataobject			='dwe_convencion_inter' then
			ls_codigo						= dw_lista.getitemstring(il_row,'cod_agte')
			ll_cod_parque					= dw_lista.getitemnumber(il_row,'cod_parque')
		elseif dw_lista.dataobject		='dwe_convencion_inter_sup' then
			ls_codigo						= dw_lista.getitemstring(il_row,'cod_sup')
			ll_cod_parque					= dw_lista.getitemnumber(il_row,'cod_parque')
		end if
		if not isnull(ls_codigo) and ls_codigo<>''  then
			ls_string				= string(ldt_fecha_ini,'dd/mm/yyyy')+'~t'+string(ldt_fecha_fin,'dd/mm/yyyy') +'~t'+ls_codigo+'~t'+string(ll_cod_parque)+'~t'+ls_cargo+'~t'+ls_tipo+'~t'+ls_tipo_clasif
			if isvalid(w_detalle_ventas_convencion) then close(w_detalle_ventas_convencion)
			OpenWithParm (w_detalle_ventas_convencion,ls_string)
		end if
	end if
end if
end event

type rb_nf from radiobutton within w_convencion
integer x = 1198
integer y = 96
integer width = 352
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Canal N.F."
boolean checked = true
end type

event clicked;w_convencion.triggerevent(open!)
dw_lista.Reset()
dw_base.Reset()
end event

type rb_ni from radiobutton within w_convencion
integer x = 1198
integer y = 168
integer width = 352
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Canal N.I."
end type

event clicked;w_convencion.triggerevent(open!)
dw_lista.Reset()
dw_base.Reset()

end event

type cb_ordenar from commandbutton within w_convencion
integer x = 1522
integer y = 1888
integer width = 215
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_clasif_hist from commandbutton within w_convencion
integer x = 411
integer y = 1888
integer width = 425
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Hist"
end type

event clicked;string	ls_codigo,ls_string
long		ll_parque,ll_tot_reg
datetime	ldt_fecha_clasif

dw_base.accepttext()
dw_lista.accepttext()
ll_tot_reg									= dw_base.rowcount()
if ll_tot_reg>0 then
	ldt_fecha_clasif						= dw_base.getitemdatetime(1,'fecha_clasif')
	if not isnull(ldt_fecha_clasif) then
		if dw_lista.dataobject			='dwe_convencion_inter' and dw_lista.rowcount() > 0 then
			ls_codigo						= dw_lista.getitemstring(il_row,'cod_agte')
			ll_parque						= dw_lista.getitemnumber(il_row,'cod_parque')
		elseif dw_lista.dataobject		='dwe_convencion_inter_sup' and dw_lista.rowcount() > 0 then
			ls_codigo						= dw_lista.getitemstring(il_row,'cod_sup')
			ll_parque						= dw_lista.getitemnumber(il_row,'cod_parque')
		end if
		if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha_clasif) and not isnull(ll_parque) and ll_parque >0 then
			ls_string						= ls_codigo+'~t'+string(ldt_fecha_clasif,'dd/mm/yyyy')+'~t'+string(ll_parque)
			if isvalid(w_clasifica_historica_total) then close(w_clasifica_historica_total)
			OpenWithParm (w_clasifica_historica_total,ls_string)
		end if
	else
		messagebox("Advertencia","No Registra Fecha Clasificación")
	end if
end if
end event

type dw_lista from datawindow within w_convencion
integer x = 41
integer y = 284
integer width = 3543
integer height = 1572
integer taborder = 20
string title = "none"
string dataobject = "dwe_convencion_inter"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_detalle.triggerevent(clicked!)
end event

type dw_fecha_cierre from datawindow within w_convencion
integer x = 1655
integer y = 168
integer width = 1070
integer height = 96
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta_desde"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.Reset()
dw_base.Reset()
end event

type pb_aceptar from picturebutton within w_convencion
integer x = 2729
integer y = 144
integer width = 128
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_tipo_conven,ls_descrip,ls_cargo,ls_canal,ls_tipo_clasif
datetime	ldt_fecha_cierre,ldt_fecha_ini,ldt_fecha_fin,ldt_ult_fecha_cierre,ldt_fecha_clasif
double	ldb_valor_uf

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
dw_lista.Reset()
dw_base.Reset()
dw_tipo_clasif.AcceptText()
dw_fecha_cierre.AcceptText()
ls_tipo_clasif							= dw_tipo_clasif.getitemstring(1,'tipo_clasif')
ldt_fecha_cierre						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
if not isnull(ls_tipo_clasif) and ls_tipo_clasif<>'' and not isnull(ldt_fecha_cierre) then
	if rb_nacional.checked = true then
		ls_tipo_conven					= 'N'
		ls_descrip						= 'Nacional'
	elseif rb_internacional.checked = true then
		ls_tipo_conven					= 'I'
		ls_descrip						= 'Internacional'
	end if
	if rb_agte.checked = true then
		ls_cargo							= 'A'
	elseif rb_super.checked = true then
		ls_cargo							= 'S'
	end if
	if rb_ni.checked = true then
		ls_canal							= 'NI'
	elseif rb_nf.checked = true then
		ls_canal							= 'NF'
	end if
	SELECT	DISTINCT "CONVEN_CIERRE_PONDERADO"."FECHA",	"CONVEN_USO_PONDERADO"."FECHA_FIN"
	INTO 		:ldt_fecha_ini,										:ldt_fecha_fin		  
	FROM 		"CONVEN_CIERRE_PONDERADO",	"CONVEN_USO_PONDERADO"  
	WHERE 	( "CONVEN_CIERRE_PONDERADO"."TIPO" = "CONVEN_USO_PONDERADO"."TIPO" ) and  
				( "CONVEN_CIERRE_PONDERADO"."FECHA" = "CONVEN_USO_PONDERADO"."FECHA" ) and  
				( "CONVEN_CIERRE_PONDERADO"."FECHA" = :ldt_fecha_cierre ) AND  
				( "CONVEN_CIERRE_PONDERADO"."TIPO" = :ls_tipo_conven )
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_ini) and not isnull(ldt_fecha_fin) then
			dw_base.scrolltorow(dw_base.insertrow(0))
			dw_base.setitem(1,"fecha_ini",ldt_fecha_ini)
			dw_base.setitem(1,"fecha_fin",ldt_fecha_fin)
			dw_base.setitem(1,"tipo_conven",ls_tipo_conven)
			dw_base.setitem(1,"cargo",ls_cargo)
			dw_base.setitem(1,"canal",ls_canal)
			dw_base.setitem(1,"tipo_clasif",ls_tipo_clasif)
			SELECT	MAX("CIERRE_VENTA"."CIERRE_VENTA")
			INTO		:ldt_ult_fecha_cierre  
			FROM		"CIERRE_VENTA"
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ldt_ult_fecha_cierre) then
					ldt_ult_fecha_cierre	= ldt_ult_fecha_cierre
				end if
			end if
			if ldt_ult_fecha_cierre > ldt_fecha_fin then
				ldt_ult_fecha_cierre		=	ldt_fecha_fin
			else
				ldt_ult_fecha_cierre		= ldt_ult_fecha_cierre
			end if
			dw_base.setitem(1,"fecha_cierre",ldt_fecha_cierre)
			dw_base.setitem(1,"fecha_ult_cierre",ldt_ult_fecha_cierre)
			SELECT	"TAB_UF"."VALOR_UF"  
			INTO		:ldb_valor_uf  
			FROM		"TAB_UF"  
			WHERE		"TAB_UF"."FECHA_UF" = :ldt_ult_fecha_cierre
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
					dw_base.setitem(1,"valor_uf",ldb_valor_uf)
				end if
			end if
			SELECT 	MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
			INTO 		:ldt_fecha_clasif  
			FROM		"CLASIFICA_HIST"  
			WHERE		"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_ult_fecha_cierre
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ldt_fecha_clasif) then
					dw_base.setitem(1,"fecha_clasif",ldt_fecha_clasif)
				end if
			end if
			wf_lista_conven(ldt_ult_fecha_cierre,ldb_valor_uf,ldt_fecha_clasif,ls_cargo,ls_canal,ldt_fecha_ini,ldt_fecha_fin,ls_tipo_conven,ls_tipo_clasif)
		else
			messagebox("Advertencia",'No Registra Puntaje Convención '+ls_descrip+' con Fecha '+string(ldt_fecha_cierre,'dd/mm/yyyy'))
		end if
	else
		messagebox("Advertencia",'No Registra Puntaje Convención '+ls_descrip+' con Fecha '+string(ldt_fecha_cierre,'dd/mm/yyyy'))
	end if
else
	if isnull(ls_tipo_clasif) or ls_tipo_clasif='' then
		messagebox("Advertencia","Debe Seleccionar Tipo de Clasificación Considerada par Premiación")
		dw_tipo_clasif.setfocus()
	elseif isnull(ldt_fecha_cierre) then
		messagebox("Advertencia","Debe Seleccionar Fecha Inicio de Premiación")
		dw_fecha_cierre.setfocus()
	end if
end if
disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_imprimir from commandbutton within w_convencion
integer x = 1961
integer y = 1888
integer width = 215
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type cb_2 from commandbutton within w_convencion
integer x = 3296
integer y = 1888
integer width = 288
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_convencion)
end event

type cb_exportar from commandbutton within w_convencion
integer x = 1742
integer y = 1888
integer width = 215
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type gb_1 from groupbox within w_convencion
integer x = 622
integer y = 24
integer width = 485
integer height = 236
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cargo"
end type

type gb_2 from groupbox within w_convencion
integer x = 1152
integer y = 24
integer width = 453
integer height = 236
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Canal Ventas"
end type

type gb_3 from groupbox within w_convencion
integer x = 50
integer y = 24
integer width = 526
integer height = 236
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Convención"
end type

