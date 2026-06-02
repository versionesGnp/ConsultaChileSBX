forward
global type w_detalle_ventas_convencion from window
end type
type cb_docto_pendiente from commandbutton within w_detalle_ventas_convencion
end type
type cb_filtrar from commandbutton within w_detalle_ventas_convencion
end type
type cb_exportar from commandbutton within w_detalle_ventas_convencion
end type
type cb_ordenar from commandbutton within w_detalle_ventas_convencion
end type
type cb_asocia_rut from commandbutton within w_detalle_ventas_convencion
end type
type cb_cta_cte from commandbutton within w_detalle_ventas_convencion
end type
type cb_imprimir from commandbutton within w_detalle_ventas_convencion
end type
type cb_cerrar from commandbutton within w_detalle_ventas_convencion
end type
type dw_detalle from datawindow within w_detalle_ventas_convencion
end type
end forward

global type w_detalle_ventas_convencion from window
integer width = 3858
integer height = 2248
boolean titlebar = true
string title = "Detalle Producción por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_docto_pendiente cb_docto_pendiente
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_asocia_rut cb_asocia_rut
cb_cta_cte cb_cta_cte
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_detalle_ventas_convencion w_detalle_ventas_convencion

type variables
long il_row
end variables

forward prototypes
public function double wf_persist_menor6 (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo)
public function double wf_persist (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo)
public function double wf_ponderacion (long al_mes, long al_ano, string as_tipo, datetime adt_fec_ini)
public function double wf_puntos (string as_uso, long al_cod_parque, string as_tipo, datetime adt_fec_ini)
public function long wf_rut_titular (long al_rut_titular)
public function string wf_clasif (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo)
end prototypes

public function double wf_persist_menor6 (string as_codigo, datetime adt_fec_clasif, long al_cod_parque, string as_cargo);string		ls_cod
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
		INTO		:ls_cod,:ll_cta,:ldb_sum		  
		FROM		"PRADO"."SUPERVISOR"
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

on w_detalle_ventas_convencion.create
this.cb_docto_pendiente=create cb_docto_pendiente
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_asocia_rut=create cb_asocia_rut
this.cb_cta_cte=create cb_cta_cte
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_docto_pendiente,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_asocia_rut,&
this.cb_cta_cte,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_detalle_ventas_convencion.destroy
destroy(this.cb_docto_pendiente)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_asocia_rut)
destroy(this.cb_cta_cte)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;string		ls_codigo,ls_cargo,ls_tipo,ls_base,ls_serie,ls_estado,ls_uso,ls_moneda,ls_estado_docto_pend,&
			ls_estado_rut_resuel,ls_forma_pago,ls_clasif_vta,ls_tipo_clasif,ls_tipo_cont,ls_clasif
long		ll_parque_agte,ll_tot_reg,ll_indi,ll_rut,ll_cod_parque,ll_mes,ll_ano,ll_rut_resuelto,&
			ll_contr_ped,ll_antig,ll_mult_res,ll_vta_cero
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_cierre,ldt_fecha_ing
double	ldb_numero,ldb_valor_uf,ldb_precio,ldb_porce_ing,ldb_persist,ldb_mora,ldb_calc_mora,ldb_precio_uf,ldb_ponder,&
			ldb_puntos,ldb_tot_uf

connect using Trans_1;
connect using Trans_2;

gf_centrar(w_detalle_ventas_convencion)
ldt_fecha_ini									= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ldt_fecha_fin									= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ls_codigo											= substr(1,3,Message.StringParm)
ll_parque_agte									= long(substr(1,4,Message.StringParm))
ls_cargo											= substr(1,5,Message.StringParm)
ls_tipo											= substr(1,6,Message.StringParm)
ls_tipo_clasif									= substr(1,7,Message.StringParm)
SELECT	"TAB_UF"."VALOR_UF"  
INTO		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_fin
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf) and ldb_valor_uf>0 then
		ldb_valor_uf										= ldb_valor_uf
	end if
end if
if ls_cargo = 'A' then
	dw_detalle.dataobject = 'dw_detalle_ventas_convencion'
	dw_detalle.settransobject(sqlca)
	dw_detalle.Object.usuario.text 			= gs_user
	ll_tot_reg									= dw_detalle.retrieve(ldt_fecha_ini,ldt_fecha_fin,ls_codigo,ll_parque_agte)
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_base								= dw_detalle.getitemstring(ll_indi,'codigo')
			ls_serie								= dw_detalle.getitemstring(ll_indi,'serie')
			ldb_numero							= dw_detalle.getitemnumber(ll_indi,'nro_oferta')
			ls_estado							= dw_detalle.getitemstring(ll_indi,'estado')
			ll_rut									= dw_detalle.getitemnumber(ll_indi,'rut_titular')
			ll_cod_parque						= dw_detalle.getitemnumber(ll_indi,'cod_parque_cont')
			ldt_fecha_cierre					= dw_detalle.getitemdatetime(ll_indi,'cierre_venta')
			ls_uso								= dw_detalle.getitemstring(ll_indi,'uso')
			ls_moneda							= dw_detalle.getitemstring(ll_indi,'moneda')
			ldb_precio							= dw_detalle.getitemnumber(ll_indi,'precio')
			ldb_porce_ing						= dw_detalle.getitemnumber(ll_indi,'vista_convencion_inter_porce_ing_cierre')
			ls_forma_pago						= dw_detalle.getitemstring(ll_indi,'vista_convencion_inter_forma_pago')
			ldt_fecha_ing						= dw_detalle.getitemdatetime(ll_indi,'vista_estructura_ventas_fecha_ini_age')
			ls_clasif_vta							= dw_detalle.getitemstring(ll_indi,'vista_convencion_inter_clasifica_venta')
			ls_tipo_cont							= dw_detalle.getitemstring(ll_indi,'vista_convencion_inter_tipo_cont')
			if ls_moneda = '1' then
				ldb_precio_uf					= Round(ldb_precio / ldb_valor_uf, 2)
			elseif ls_moneda = '2' then
				ldb_precio_uf					= Round(ldb_precio, 2)
			end if
			//----------Modificaciones--------------
			ll_contr_ped							= f_docto_pend_conv(ls_base,ls_serie,ldb_numero,ll_cod_parque,ldt_fecha_cierre)
			if ll_contr_ped=0 then
				ldb_precio_uf					= ldb_precio_uf
			else
				ldb_precio_uf					= 0
			end if
			if ldt_fecha_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_uso
				ldb_persist						= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				ldb_mora						= round(100 - ldb_persist, 4)
			elseif ls_tipo='N' and ldt_fecha_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_uso
				ll_antig							= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
				if ll_antig>=180 then	
					ldb_persist					= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				else
					ldb_persist					= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				end if
				ldb_mora						= round(100 - ldb_persist, 4)
			elseif ls_tipo='I' and ldt_fecha_ini= datetime(date(string('30/06/2012')),time('00:00:00')) then //NUEVO 30/06/2012
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_clasif_vta
				ldb_persist						= 0
				ldb_mora						= 0
			elseif (ls_tipo='N' and ldt_fecha_ini>= datetime(date(string('31/01/2013')),time('00:00:00'))) then //NUEVO 01/01/2013
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_clasif_vta
				ll_antig							= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
				if ll_antig>=180 then	
					ldb_persist					= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				else
					ldb_persist					= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				end if
				ldb_mora						= round(100 - ldb_persist, 4)
				if ls_tipo_cont='6' then
					if ldt_fecha_cierre>= datetime(date(string('31/01/2013')),time('00:00:00')) and  ldt_fecha_cierre<= datetime(date(string('30/04/2013')),time('00:00:00')) then
						ldb_precio_uf			= ldb_precio_uf
					elseif  ldt_fecha_cierre>= datetime(date(string('31/05/2013')),time('00:00:00')) and  ldt_fecha_cierre<= datetime(date(string('30/09/2013')),time('00:00:00')) then	
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
				ls_clasif							= wf_clasif(ls_codigo,ldt_fecha_fin,ll_parque_agte,ls_cargo)
			elseif (ls_tipo='I' and ldt_fecha_ini>= datetime(date(string('30/06/2013')),time('00:00:00'))) then
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_clasif_vta
				ll_antig							= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
				if ll_antig>=180 then	
					ldb_persist					= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				else
					ldb_persist					= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				end if
				ldb_mora						= round(100 - ldb_persist, 4)
				ls_clasif							= wf_clasif(ls_codigo,ldt_fecha_fin,ll_parque_agte,ls_cargo)
			elseif (ls_tipo='N' and ldt_fecha_ini>= datetime(date(string('31/01/2014')),time('00:00:00'))) then
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_clasif_vta
				ll_antig							= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
				if ll_antig>=180 then	
					ldb_persist					= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				else
					ldb_persist					= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				end if
				ldb_mora						= round(100 - ldb_persist, 4)
				ls_clasif							= wf_clasif(ls_codigo,ldt_fecha_fin,ll_parque_agte,ls_cargo)	
			end if
			if ll_rut_resuelto > 0 then
				if ldt_fecha_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
					ll_mult_res					= 0
				elseif ls_tipo='N' and ldt_fecha_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
					ll_mult_res					= 1
				elseif ls_tipo='I' and ldt_fecha_ini= datetime(date(string('30/06/2012')),time('00:00:00'))then //NUEVO 30/06/2012
					ll_mult_res					= 0
				elseif ls_tipo='N' and ldt_fecha_ini= datetime(date(string('31/01/2013')),time('00:00:00')) then //NUEVO 01/01/2012
					ll_mult_res					= 0	
				elseif ls_tipo='I' and ldt_fecha_ini= datetime(date(string('30/06/2014')),time('00:00:00')) then //NUEVO 01/01/2012
					ll_mult_res					= 1		
				else
					if ls_tipo='N' then //NUEVO 01/01/2014
						ll_mult_res				= 0
					elseif ls_tipo='I' then //NUEVO 30/06/2014
						ll_mult_res				= 1
					end if
				end if
			else
				ll_mult_res						= 1
			end if
			//------------------------------------
			ll_mes								= month(date(ldt_fecha_cierre))
			ll_ano									= year(date(ldt_fecha_cierre))
			ldb_ponder							= wf_ponderacion(ll_mes,ll_ano,ls_tipo,ldt_fecha_ini)
			ldb_puntos							= wf_puntos(ls_uso,ll_cod_parque,ls_tipo,ldt_fecha_ini)
			ldb_calc_mora						= Round(ldb_mora / 100, 4)
			if ll_contr_ped>0 then
				ls_estado_docto_pend		= 'SI'
			else
				ls_estado_docto_pend		= ''
			end if
			if ll_rut_resuelto>0 then
				ls_estado_rut_resuel			= 'SI'
			else
				ls_estado_rut_resuel			= ''
			end if
			if ls_tipo_clasif = 'C' and ls_clasif_vta <> 'C' then
				if (ls_estado = 'V' or ls_estado = 'C' or ls_estado = 'P' or ls_estado = 'S') then
					ldb_tot_uf					= round((((ldb_precio_uf * ldb_ponder) * ldb_puntos) * ll_mult_res),2)
				else
					ldb_tot_uf					= 0
				end if
			elseif ls_tipo_clasif = 'T' then
				if (ls_estado = 'V' or ls_estado = 'C' or ls_estado = 'P' or ls_estado = 'S') then
					ldb_tot_uf					= round((((ldb_precio_uf * ldb_ponder) * ldb_puntos) * ll_mult_res),2)
				else
					ldb_tot_uf					= 0
				end if
			else
				ldb_tot_uf						= 0
			end if
			dw_detalle.setitem(ll_indi,"c_tipo_clasif",ls_tipo_clasif)
			dw_detalle.setitem(ll_indi,"c_valor_uf",ldb_valor_uf)
			dw_detalle.setitem(ll_indi,"c_precio_uf",ldb_precio_uf)
			dw_detalle.setitem(ll_indi,"c_porce_mora",ldb_calc_mora)
			dw_detalle.setitem(ll_indi,"c_pond",ldb_ponder)
			dw_detalle.setitem(ll_indi,"c_puntos",ldb_puntos)
			dw_detalle.setitem(ll_indi,"c_docto_pend",ls_estado_docto_pend)
			dw_detalle.setitem(ll_indi,"c_rut_resuel",ls_estado_rut_resuel)
			dw_detalle.setitem(ll_indi,"c_puntaje",ldb_tot_uf)
			dw_detalle.setitem(ll_indi,"clasif",ls_clasif)
			dw_detalle.setitem(ll_indi,"clasif",ls_clasif)
			dw_detalle.setitem(ll_indi,"gs_depto",gs_depto)
			dw_detalle.setitem(ll_indi,"tipo_conven",ls_tipo)
			dw_detalle.accepttext()
		next
	else
		messagebox("Advertencia","No registra dato")
		close(w_detalle_ventas_convencion)
	end if
elseif ls_cargo = 'S' then
	dw_detalle.dataobject = 'dw_detalle_ventas_conven_sup'
	dw_detalle.settransobject(sqlca)
	dw_detalle.Object.usuario.text 			= gs_user
	ll_tot_reg									= dw_detalle.retrieve(ldt_fecha_ini,ldt_fecha_fin,ls_codigo,ll_parque_agte)
	if ll_tot_reg > 0 then
		for ll_indi = 1 to ll_tot_reg
			ls_base								= dw_detalle.getitemstring(ll_indi,'codigo')
			ls_serie								= dw_detalle.getitemstring(ll_indi,'serie')
			ldb_numero							= dw_detalle.getitemnumber(ll_indi,'nro_oferta')
			ls_estado							= dw_detalle.getitemstring(ll_indi,'estado')
			ll_rut									= dw_detalle.getitemnumber(ll_indi,'rut_titular')
			ll_cod_parque						= dw_detalle.getitemnumber(ll_indi,'cod_parque_cont')
			ldt_fecha_cierre					= dw_detalle.getitemdatetime(ll_indi,'cierre_venta')
			ls_uso								= dw_detalle.getitemstring(ll_indi,'uso')
			ls_moneda							= dw_detalle.getitemstring(ll_indi,'moneda')
			ldb_precio							= dw_detalle.getitemnumber(ll_indi,'precio')
			ldb_porce_ing						= dw_detalle.getitemnumber(ll_indi,'vista_convencion_inter_porce_ing_cierre')
			ls_forma_pago						= dw_detalle.getitemstring(ll_indi,'vista_convencion_inter_forma_pago')
			ldt_fecha_ing						= dw_detalle.getitemdatetime(ll_indi,'vista_supervisor_union_fecha_ing')
			ls_clasif_vta							= dw_detalle.getitemstring(ll_indi,'vista_convencion_inter_clasifica_venta')
			if ls_moneda = '1' then
				ldb_precio_uf					= Round(ldb_precio / ldb_valor_uf, 2)
			elseif ls_moneda = '2' then
				ldb_precio_uf					= Round(ldb_precio, 2)
			end if
			//----------Modificaciones--------------
			ll_contr_ped							= f_docto_pend_conv(ls_base,ls_serie,ldb_numero,ll_cod_parque,ldt_fecha_cierre)
			if ll_contr_ped=0 then
				ldb_precio_uf					= ldb_precio_uf
			else
				ldb_precio_uf					= 0
			end if
			if ldt_fecha_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_uso
				ldb_persist						= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				ldb_mora						= round(100 - ldb_persist, 4)
			elseif ls_tipo='N' and ldt_fecha_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
				ll_rut_resuelto 					= wf_rut_titular(ll_rut)
				ls_uso							= ls_uso
				ldb_persist						= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				ldb_mora						= round(100 - ldb_persist, 4)
			elseif ls_tipo='I' and ldt_fecha_ini= datetime(date(string('30/06/2012')),time('00:00:00'))  then //NUEVO 30/06/2012
				ll_rut_resuelto 				= wf_rut_titular(ll_rut)
				ls_uso						= ls_clasif_vta
				ll_antig						= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
				if ll_antig>=180 then	
					ldb_persist				= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				else
					ldb_persist				= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
				end if
				ldb_mora					= round(100 - ldb_persist, 4)
			else
				if ls_tipo='N' then //NUEVO 01/01/2013
					ll_rut_resuelto 				= wf_rut_titular(ll_rut)
					ls_uso						= ls_clasif_vta
					ll_antig						= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
					if ll_antig>=180 then	
						ldb_persist				= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
					else
						ldb_persist				= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
					end if
					ldb_mora					= round(100 - ldb_persist, 4)
					ls_clasif						= wf_clasif(ls_codigo,ldt_fecha_fin,ll_parque_agte,ls_cargo)
				elseif ls_tipo='I' then //NUEVO 30/06/2013
					ll_rut_resuelto 			= wf_rut_titular(ll_rut)
					ls_uso					= ls_clasif_vta
					ll_antig					= DaysAfter(date(ldt_fecha_ing), date(ldt_fecha_fin)) 	
					if ll_antig>=180 then	
						ldb_persist			= wf_persist(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
					else
						ldb_persist			= wf_persist_menor6(ls_codigo,ldt_fecha_fin,ll_cod_parque,ls_cargo)
					end if
					ldb_mora				= round(100 - ldb_persist, 4)
					ls_clasif					= wf_clasif(ls_codigo,ldt_fecha_fin,ll_parque_agte,ls_cargo)
				end if
			end if
			if ll_rut_resuelto > 0 then
				if ldt_fecha_ini<datetime(date(string('31/01/2012')),time('00:00:00')) then //ORIGEN
					ll_mult_res					= 0
				elseif ls_tipo='N' and ldt_fecha_ini= datetime(date(string('31/01/2012')),time('00:00:00')) then //NUEVO 01/01/2012
					ll_mult_res					= 1
				elseif ls_tipo='I' and ldt_fecha_ini= datetime(date(string('30/06/2012')),time('00:00:00')) then //NUEVO 30/06/2012
						ll_mult_res				= 0
				else
					if ls_tipo='N' then //NUEVO 01/01/2013
						ll_mult_res				= 0
					elseif ls_tipo='I' then //NUEVO 01/01/2013
						ll_mult_res				= 1
					end if
				end if
			else
				ll_mult_res						= 1
			end if
			//------------------------------------
			ll_mes								= month(date(ldt_fecha_cierre))
			ll_ano									= year(date(ldt_fecha_cierre))
			ldb_ponder							= wf_ponderacion(ll_mes,ll_ano,ls_tipo,ldt_fecha_ini)
			ldb_puntos							= wf_puntos(ls_uso,ll_cod_parque,ls_tipo,ldt_fecha_ini)
			ldb_calc_mora						= Round(ldb_mora / 100, 4)
			if ll_contr_ped>0 then
				ls_estado_docto_pend		= 'SI'
			else
				ls_estado_docto_pend		= ''
			end if
			if ll_rut_resuelto>0 then
				ls_estado_rut_resuel			= 'SI'
			else
				ls_estado_rut_resuel			= ''
			end if
			if ls_tipo_clasif = 'C' and ls_clasif_vta <> 'C' then
				if (ls_estado = 'V' or ls_estado = 'C' or ls_estado = 'P' or ls_estado = 'S') then
					ldb_tot_uf					= round((((ldb_precio_uf * ldb_ponder) * ldb_puntos) * ll_mult_res),2)
				else
					ldb_tot_uf					= 0
				end if
			elseif ls_tipo_clasif = 'T' then
				if (ls_estado = 'V' or ls_estado = 'C' or ls_estado = 'P' or ls_estado = 'S') then
					ldb_tot_uf					= round((((ldb_precio_uf * ldb_ponder) * ldb_puntos) * ll_mult_res),2)
				else
					ldb_tot_uf					= 0
				end if
			else
				ldb_tot_uf						= 0
			end if
			dw_detalle.setitem(ll_indi,"c_tipo_clasif",ls_tipo_clasif)
			dw_detalle.setitem(ll_indi,"c_valor_uf",ldb_valor_uf)
			dw_detalle.setitem(ll_indi,"c_precio_uf",ldb_precio_uf)
			dw_detalle.setitem(ll_indi,"c_porce_mora",ldb_calc_mora)
			dw_detalle.setitem(ll_indi,"c_pond",ldb_ponder)
			dw_detalle.setitem(ll_indi,"c_puntos",ldb_puntos)
			dw_detalle.setitem(ll_indi,"c_docto_pend",ls_estado_docto_pend)
			dw_detalle.setitem(ll_indi,"c_rut_resuel",ls_estado_rut_resuel)
			dw_detalle.setitem(ll_indi,"c_puntaje",ldb_tot_uf)
			dw_detalle.setitem(ll_indi,"clasif",ls_clasif)
			dw_detalle.accepttext()
		next
	else
		messagebox("Advertencia","No registra dato")
		close(w_detalle_ventas_convencion)
	end if
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_docto_pendiente from commandbutton within w_detalle_ventas_convencion
integer x = 850
integer y = 1980
integer width = 434
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Docto. Pendiente"
end type

event clicked;string	ls_base,ls_serie,ls_string,ls_tipo
double	ldb_numero

dw_detalle.accepttext()
if dw_detalle.rowcount() > 0 then
	ls_tipo				= 'M'
	ls_base				= dw_detalle.getitemstring(il_row,'codigo')
	ls_serie				= dw_detalle.getitemstring(il_row,'serie')
	ldb_numero			= dw_detalle.getitemnumber(il_row,'nro_oferta')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
		ls_string			= ls_tipo+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+gs_depto
		if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
		OpenWithParm (w_docto_pendiente_promesa,ls_string)
	end if
end if


end event

type cb_filtrar from commandbutton within w_detalle_ventas_convencion
integer x = 1810
integer y = 1980
integer width = 265
integer height = 88
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
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_exportar from commandbutton within w_detalle_ventas_convencion
integer x = 2341
integer y = 1980
integer width = 265
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_detalle_ventas_convencion
integer x = 2075
integer y = 1980
integer width = 265
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_asocia_rut from commandbutton within w_detalle_ventas_convencion
integer x = 466
integer y = 1980
integer width = 384
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación * Rut"
end type

event clicked;if dw_detalle.getrow() > 0 then 
	gi_rut = dw_detalle.getitemnumber(dw_detalle.getrow(),'rut_titular')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_cta_cte from commandbutton within w_detalle_ventas_convencion
integer x = 41
integer y = 1980
integer width = 425
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

dw_detalle.accepttext()
if dw_detalle.rowcount() > 0 then
	gs_base				= dw_detalle.getitemstring(il_row,'codigo')
	gs_serie				= dw_detalle.getitemstring(il_row,'serie')
	gi_numero			= dw_detalle.getitemnumber(il_row,'nro_oferta')
	gi_rut				= dw_detalle.getitemnumber(il_row,'rut_titular')
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
end if
end event

type cb_imprimir from commandbutton within w_detalle_ventas_convencion
integer x = 3168
integer y = 1980
integer width = 315
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

event clicked;long		ll_res

if dw_detalle.rowcount() > 0 then
	ll_res			= MessageBox("Imprimir", "Desea Imprimir el Informe", Exclamation!, YesNo!, 2)
	if ll_res=1 then
		f_Print( dw_detalle )
	else
		messagebox('Advertencia','Proceso Cancelado')
	end if
else
	messagebox('Advertencia','No Registra Datos para Imprimir')
end if
end event

type cb_cerrar from commandbutton within w_detalle_ventas_convencion
integer x = 3488
integer y = 1980
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_ventas_convencion)
end event

type dw_detalle from datawindow within w_detalle_ventas_convencion
integer x = 41
integer y = 36
integer width = 3762
integer height = 1916
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_ventas_convencion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;if dw_detalle.RowCount() > 0 then
	cb_cta_cte.triggerevent(clicked!)
end if

end event

