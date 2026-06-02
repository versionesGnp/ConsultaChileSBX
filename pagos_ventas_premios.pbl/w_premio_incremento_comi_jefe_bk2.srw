forward
global type w_premio_incremento_comi_jefe_bk2 from window
end type
type cb_exportar from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type cb_actualiza_pag from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type em_termino from editmask within w_premio_incremento_comi_jefe_bk2
end type
type st_cuenta from statictext within w_premio_incremento_comi_jefe_bk2
end type
type st_porc from statictext within w_premio_incremento_comi_jefe_bk2
end type
type hpb_1 from hprogressbar within w_premio_incremento_comi_jefe_bk2
end type
type cb_actualiz from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type cb_cta_cte from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type cb_respal from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type dw_fecha_cierre from datawindow within w_premio_incremento_comi_jefe_bk2
end type
type dw_parque from datawindow within w_premio_incremento_comi_jefe_bk2
end type
type cb_premio_pago from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type cb_grabar from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type cb_imprimir from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type cb_cerrar from commandbutton within w_premio_incremento_comi_jefe_bk2
end type
type pb_aceptar from picturebutton within w_premio_incremento_comi_jefe_bk2
end type
type dw_actualiza from datawindow within w_premio_incremento_comi_jefe_bk2
end type
type st_fondo from statictext within w_premio_incremento_comi_jefe_bk2
end type
type dw_premio_jefe from datawindow within w_premio_incremento_comi_jefe_bk2
end type
end forward

global type w_premio_incremento_comi_jefe_bk2 from window
integer width = 3378
integer height = 1932
boolean titlebar = true
string title = "Premio Incremento Comisión"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 80269524
cb_exportar cb_exportar
cb_actualiza_pag cb_actualiza_pag
em_termino em_termino
st_cuenta st_cuenta
st_porc st_porc
hpb_1 hpb_1
cb_actualiz cb_actualiz
cb_cta_cte cb_cta_cte
cb_respal cb_respal
dw_fecha_cierre dw_fecha_cierre
dw_parque dw_parque
cb_premio_pago cb_premio_pago
cb_grabar cb_grabar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
pb_aceptar pb_aceptar
dw_actualiza dw_actualiza
st_fondo st_fondo
dw_premio_jefe dw_premio_jefe
end type
global w_premio_incremento_comi_jefe_bk2 w_premio_incremento_comi_jefe_bk2

type variables
long			il_row, il_row_origen
end variables

forward prototypes
public function long wf_cta_vtas (string as_canal, datetime adt_fecha_cierre, string as_cod_jefe, double adb_porce_ing, long al_cod_parque, long al_unidad)
public function long wf_monto_comi (string as_canal, string as_cod_jefe, datetime adt_fec_comi, long al_cod_parque, long al_unidad)
public subroutine wf_lista_premiados (datetime adt_fecha_cierre, long al_cod_parque, string as_tabla)
public function double wf_producc_total (datetime adt_fec_comi, string as_cod_jef, string as_tabla)
public function long wf_calcula_premio (double adb_factor, datetime adt_fec_bono, string as_cod_jef, string as_tabla)
end prototypes

public function long wf_cta_vtas (string as_canal, datetime adt_fecha_cierre, string as_cod_jefe, double adb_porce_ing, long al_cod_parque, long al_unidad);string	ls_tipo_vta
long		ll_cta_vtas
//wf_cta_vtas(as_canal,adt_fecha_cierre,as_cod_jefe,adb_porce_ing,al_cod_parque,al_unidad)
if as_canal = 'NI' then
	SELECT	COUNT("BASE")
   	INTO		:ll_cta_vtas
	FROM		"VISTA_PRODUCC_MENSUAL"
	WHERE 	("VISTA_PRODUCC_MENSUAL"."BASE" = 'O' or "VISTA_PRODUCC_MENSUAL"."BASE" = 'A') and 
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :adt_fecha_cierre AND  
				"VISTA_PRODUCC_MENSUAL"."COD_JEF" = :as_cod_jefe AND  
				"VISTA_PRODUCC_MENSUAL"."PORCE_ING_CIERRE" >= :adb_porce_ing AND  
				"VISTA_PRODUCC_MENSUAL"."PARQUE_JEF" = :al_cod_parque
	USING		sqlca;			
elseif as_canal = 'NF' then
	SELECT	COUNT("BASE")
   	INTO		:ll_cta_vtas
	FROM		"VISTA_PRODUCC_MENSUAL"
	WHERE 	("VISTA_PRODUCC_MENSUAL"."BASE" = 'O' or "VISTA_PRODUCC_MENSUAL"."BASE" = 'A') and 
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" = :adt_fecha_cierre AND  
				"VISTA_PRODUCC_MENSUAL"."COD_JEF" = :as_cod_jefe AND  
				"VISTA_PRODUCC_MENSUAL"."PORCE_ING_CIERRE" >= :adb_porce_ing
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

public function long wf_monto_comi (string as_canal, string as_cod_jefe, datetime adt_fec_comi, long al_cod_parque, long al_unidad);//string	ls_tipo_vta
long		ll_total_comi
////wf_monto_comi(as_canal,as_cod_jefe,adt_fec_comi,al_cod_parque)
//if as_canal='NI' then
//	SELECT	sum("RES_COMI"."TOTAL_PAGO")
//	INTO		:ll_total_comi  
//	FROM		"RES_COMI", "CADENA", "OFERTA_V"
//	WHERE		"RES_COMI"."SERIE" = "CADENA"."SERIE" AND
//				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" AND
//				"CADENA"."CODIGO" = 'O' AND
//				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
//				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
//				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') and
//				"CADENA"."COD_PARQUE" = :al_cod_parque AND
//				"RES_COMI"."COD_AGE_SUP" = :as_cod_jefe  AND  
//				"RES_COMI"."FECHA" = :adt_fec_comi 
//	USING		sqlca;
//elseif as_canal='NF' then
//	SELECT	sum("RES_COMI"."TOTAL_PAGO")
//	INTO		:ll_total_comi  
//	FROM		"RES_COMI", "CADENA", "OFERTA_V"
//	WHERE		"RES_COMI"."SERIE" = "CADENA"."SERIE" AND
//				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" AND
//				"CADENA"."CODIGO" = 'O' AND
//				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
//				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
//				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') and
//				"RES_COMI"."COD_AGE_SUP" = :as_cod_jefe  AND  
//				"RES_COMI"."FECHA" = :adt_fec_comi 
//	USING		sqlca;
//elseif as_canal='UG' then
//	if al_unidad = 0 then
//		ls_tipo_vta = 'U'
//	elseif al_unidad = 1 then
//		ls_tipo_vta = 'C'
//	elseif al_unidad = 2 then
//		ls_tipo_vta = '3'
//	end if
//	SELECT	sum("RES_COMI"."TOTAL_PAGO")
//	INTO		:ll_total_comi  
//	FROM		"RES_COMI", "CADENA", "OFERTA_V"
//	WHERE		"RES_COMI"."SERIE" = "CADENA"."SERIE" AND
//				"RES_COMI"."CONTRATO" = "CADENA"."NUMERO" AND
//				"CADENA"."CODIGO" = 'O' AND
//				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
//				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
//				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') and
//				"RES_COMI"."COD_AGE_SUP" = :as_cod_jefe  AND  
//				"RES_COMI"."FECHA" = :adt_fec_comi AND
//				"OFERTA_V"."TIPO_VENTA" = :ls_tipo_vta
//	USING		sqlca;
//end if
//if sqlca.sqlcode=0 then
//	if not isnull(ll_total_comi) and ll_total_comi>0 then
//	end if
//end if
//if isnull(ll_total_comi) then ll_total_comi=0
Return ll_total_comi	
end function

public subroutine wf_lista_premiados (datetime adt_fecha_cierre, long al_cod_parque, string as_tabla);string	ls_cod_jefe,ls_nombre,ls_a_pater,ls_a_mater,ls_canal,ls_descrip,ls_cod_jefe_ugn
long		ll_cta_vtas_ugn,ll_mes,ll_ano,ll_val_fec_comi,ll_rut,ll_unidad,ll_vtas_presup,ll_cta_vtas,&
			ll_total_comi,ll_new,ll_total_comi_ugn,ll_vtas_presup_ugn,ll_tot_reg,ll_mes_comi,ll_ano_comi
datetime	ldt_fec_comi
double	ldb_porce_ing,ldb_porce,ldb_factor,ldb_premio,ldb_porce_ugn,ldb_total_prod

//wf_lista_premiados(adt_fecha_cierre,al_cod_parque,as_tabla)
ll_cta_vtas_ugn											= 0
ll_mes													= month(date(adt_fecha_cierre))
ll_ano														= year(date(adt_fecha_cierre))
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
FROM 	"RES_COMI"  
WHERE 	"RES_COMI"."FECHA" = :ldt_fec_comi and
			("RES_COMI"."COD_CONTABLE" = '021' ) and
			("RES_COMI"."COD_PARQUE" = :al_cod_parque ) 
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
					//ll_total_comi							= wf_monto_comi(ls_canal,ls_cod_jefe,ldt_fec_comi,al_cod_parque,ll_unidad)
					ldb_total_prod							= wf_producc_total(ldt_fec_comi,ls_cod_jefe,as_tabla)
					if ll_cta_vtas>0 then
						ldb_porce							= round(ll_cta_vtas / ll_vtas_presup * 100,2)
					else
						ldb_porce							= 0
					end if
					SELECT	"FACTOR"  
					INTO		:ldb_factor  
					FROM 	"PREMIO_INCREM_COMI_JEFE"  
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
					ldb_premio								= wf_calcula_premio(ldb_factor,ldt_fec_comi,ls_cod_jefe,as_tabla)
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
					//dw_premio_jefe.setitem(ll_new,'total_comision',ll_total_comi)
					dw_premio_jefe.setitem(ll_new,'producc_uf',ldb_total_prod)
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
							ll_cta_vtas_ugn						= ll_cta_vtas_ugn + ll_cta_vtas
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

public function double wf_producc_total (datetime adt_fec_comi, string as_cod_jef, string as_tabla);double	ldb_producc
//wf_producc_total(adt_fec_comi,as_cod_jef,as_tabla)
if as_tabla='O' then
	SELECT	SUM(	CASE WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN round("PAGO_OFERTA"."PRECIO",2) 
								WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN round("PAGO_OFERTA"."PRECIO" / "TAB_UF"."VALOR_UF",2)  END)
	INTO		:ldb_producc	
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA","TAB_UF"    
	WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
				"CADENA"."CODIGO" = 'O' AND
				"OFERTA_V"."FECHA_BONO_JEF" = :adt_fec_comi AND  
				"OFERTA_V"."COD_JEF" = :as_cod_jef AND
				"TAB_UF"."FECHA_UF" = :adt_fec_comi
	USING		sqlca;
elseif as_tabla='R' then
	SELECT	SUM(	CASE WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN round("PAGO_OFERTA"."PRECIO",2) 
								WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN round("PAGO_OFERTA"."PRECIO" / "RES_COMI"."VALOR_UF",2)  END)
	INTO		:ldb_producc	
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA","RES_COMI"    
	WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND  
				"CADENA"."CODIGO" = 'O' AND
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jef AND
				"OFERTA_V"."FECHA_BONO_JEF" = :adt_fec_comi AND
				"RES_COMI"."COD_CONTABLE" = '021'
	USING		sqlca;
end if
if sqlca.sqlcode=0 then
	if not isnull(ldb_producc) and ldb_producc>0 then
		ldb_producc				= ldb_producc
	end if
end if
if isnull(ldb_producc) then ldb_producc=0
Return ldb_producc
end function

public function long wf_calcula_premio (double adb_factor, datetime adt_fec_bono, string as_cod_jef, string as_tabla);string	ls_tipo_vta
double	ldb_precio,ldb_premio

//wf_calcula_premio(adb_factor,adt_fec_bono,as_cod_jef,as_tabla)
if as_tabla='O' then //OFERTA_V
	SELECT	SUM( CASE	WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN round("PAGO_OFERTA"."PRECIO",0)
								WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN round("PAGO_OFERTA"."PRECIO" * "TAB_UF"."VALOR_UF",0) END)
	INTO		:ldb_precio			
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA","TAB_UF"    
	WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
				"CADENA"."CODIGO" = 'O' AND
				"OFERTA_V"."FECHA_BONO_JEF" = :adt_fec_bono AND  
				"OFERTA_V"."COD_JEF" = :as_cod_jef AND
				"TAB_UF"."FECHA_UF" = :adt_fec_bono
	USING	sqlca;
elseif  as_tabla='R' then //RES_COMI
	SELECT	SUM(	CASE	WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN round("PAGO_OFERTA"."PRECIO",0) 
								WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN round("PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF",0) END )
	INTO		:ldb_precio			
	FROM		"OFERTA_V","PAGO_OFERTA","CADENA","RES_COMI"    
	WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND  
				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND  
				"CADENA"."CODIGO" = 'O' AND
				"RES_COMI"."COD_AGE_SUP" = :as_cod_jef AND
				"OFERTA_V"."FECHA_BONO_JEF" = :adt_fec_bono AND
				"RES_COMI"."COD_CONTABLE" = '021'
	USING	sqlca;
end if
if sqlca.sqlcode=0 then
	if not isnull(ldb_precio) and ldb_precio>0 then
		ldb_premio									= round(ldb_precio*adb_factor/100,0)
	end if
end if
if isnull(ldb_premio) then ldb_premio=0
Return ldb_premio
end function

event open;long		ll_parque,ll_porce_ing_cierre,ll_new
connect using Trans_1;
connect using Trans_2;
gf_centrar(w_premio_incremento_comi_jefe)


if gs_user='MARCOS' then
	cb_actualiz.visible								= true
end if

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(datetime(date(string('01/01/2012'))))=0 then
	idw_detalle4.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gs_conexion	= "Parque El Prado" then
	ll_parque											= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_parque											= 11
elseif gs_conexion	= "Parque Concepción" then
	ll_parque											= 801
end if
dw_parque.dataobject							= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
if gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
  	INTO 		:ll_parque  
    	FROM		"JEFE_VENTAS"  
   	WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user
	USING	sqlca;
	ll_new											= dw_parque.insertrow(0)
	dw_parque.scrolltorow(ll_new)
	dw_parque.setitem(ll_new,"parque",ll_parque)
	dw_parque.object.parque.protect			= 1
	dw_parque.accepttext()
	cb_grabar.visible								= false
	cb_premio_pago.visible						= false
else
	ll_new											= dw_parque.insertrow(0)
end if
dw_premio_jefe.dataobject						= 'dw_bono_jefe_presupuesto'
dw_premio_jefe.settransobject(sqlca)
dw_premio_jefe.Object.usuario.text			= gs_user

dw_actualiza.dataobject							= 'dw_actualiza_bono_jef_vtas'
dw_actualiza.settransobject(sqlca)
end event

on w_premio_incremento_comi_jefe_bk2.create
this.cb_exportar=create cb_exportar
this.cb_actualiza_pag=create cb_actualiza_pag
this.em_termino=create em_termino
this.st_cuenta=create st_cuenta
this.st_porc=create st_porc
this.hpb_1=create hpb_1
this.cb_actualiz=create cb_actualiz
this.cb_cta_cte=create cb_cta_cte
this.cb_respal=create cb_respal
this.dw_fecha_cierre=create dw_fecha_cierre
this.dw_parque=create dw_parque
this.cb_premio_pago=create cb_premio_pago
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.pb_aceptar=create pb_aceptar
this.dw_actualiza=create dw_actualiza
this.st_fondo=create st_fondo
this.dw_premio_jefe=create dw_premio_jefe
this.Control[]={this.cb_exportar,&
this.cb_actualiza_pag,&
this.em_termino,&
this.st_cuenta,&
this.st_porc,&
this.hpb_1,&
this.cb_actualiz,&
this.cb_cta_cte,&
this.cb_respal,&
this.dw_fecha_cierre,&
this.dw_parque,&
this.cb_premio_pago,&
this.cb_grabar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.pb_aceptar,&
this.dw_actualiza,&
this.st_fondo,&
this.dw_premio_jefe}
end on

on w_premio_incremento_comi_jefe_bk2.destroy
destroy(this.cb_exportar)
destroy(this.cb_actualiza_pag)
destroy(this.em_termino)
destroy(this.st_cuenta)
destroy(this.st_porc)
destroy(this.hpb_1)
destroy(this.cb_actualiz)
destroy(this.cb_cta_cte)
destroy(this.cb_respal)
destroy(this.dw_fecha_cierre)
destroy(this.dw_parque)
destroy(this.cb_premio_pago)
destroy(this.cb_grabar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.pb_aceptar)
destroy(this.dw_actualiza)
destroy(this.st_fondo)
destroy(this.dw_premio_jefe)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_exportar from commandbutton within w_premio_incremento_comi_jefe_bk2
integer x = 3419
integer y = 580
integer width = 238
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_actualiza
if dw_actualiza.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_actualiza_pag from commandbutton within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 2437
integer y = 24
integer width = 475
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Pagos"
end type

event clicked;string		ls_base,ls_serie
long		ll_numero,ll_graba,ll_tot_reg,ll_res,ll_dia,ll_indi
datetime	ldt_fecha_cierre,ldt_fecha_act,ldt_fecha_act_ing
double	ldb_porcent,ldb_tot_porc,ldb_tot_porc_aux

dw_fecha_cierre.accepttext()
ldt_fecha_cierre								= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_graba											= 0
if not isnull(ldt_fecha_cierre) then
	SELECT	max("OFERTA_V"."FECHA_BONO_JEF")
	INTO 		:ldt_fecha_act_ing  
  	 FROM 	"OFERTA_V"
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_act_ing) then
			ldt_fecha_act_ing					= ldt_fecha_act_ing
		end if
	end if
	ldt_fecha_act								= datetime(date(em_termino.text),time('00:00:00'))
	ll_dia											= day(date(gdt_fec_sistema))
	if gdt_fec_sistema > ldt_fecha_act then
		if ll_dia>17 then
			ll_res									= MessageBox("Advertencia","¿Desea Actualizar Porcentaje de Ingreso a Caja Supervisores?", Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				ll_tot_reg						= dw_actualiza.retrieve(ldt_fecha_act) 
				if ll_tot_reg>0 then
					SetPointer(HourGlass!)
					st_fondo.visible				= true
					hpb_1.visible 				= true
					st_porc.visible 				= true
					st_cuenta.visible			= true
					ldb_tot_porc					= 0
					ldb_tot_porc_aux			= 0			
					hpb_1.Position				= ldb_tot_porc
					for ll_indi=1 to ll_tot_reg
						ls_base					= dw_actualiza.getitemstring(ll_indi,'cadena_codigo')
						ls_serie					= dw_actualiza.getitemstring(ll_indi,'cadena_serie')
						ll_numero				= dw_actualiza.getitemnumber(ll_indi,'cadena_numero')
						if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>''	and not isnull(ll_numero) and ll_numero>0 then	
							UPDATE	"OFERTA_V"  
							SET		"FECHA_BONO_JEF" = :ldt_fecha_act  
							WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
										( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit using sqlca;
								ll_graba++	
							else
								rollback using sqlca;
								messagebox("Error Grabar","Error Grabar Promesa "+ls_base+'-'+ls_serie+'-'+string(ll_numero))
							end if
						end if
					next
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text				= string(ldb_tot_porc,'#0.##')+" %"
						ldb_tot_porc_aux		= ldb_tot_porc
					end if
					ldb_tot_porc					= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 				= ldb_tot_porc
					st_cuenta.text 				= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'  Reg. Cálculados '+string(ll_graba,'###,###,###')
				end if
				if ll_tot_reg=ll_graba then
					messagebox("Grabar","Grabación Exitosa")
				end if
				st_fondo.visible					= false
				hpb_1.visible 					= false
				st_porc.visible 					= false
				st_cuenta.visible				= false
				SetPointer(Arrow!)
				cb_actualiza_pag.visible		= false
				em_termino.visible			= false
			end if
		else
			messagebox("Advertencia","La Actualización de Ingreso a Caja No Debe Ser Antes del Día 17 de Cada Mes")
		end if
	else
		messagebox("Advertencia","Ingreso Caja Supervisor Fue Actualizado con Fecha "+string(ldt_fecha_act_ing,'dd/mm/yyyy'))
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
end event

type em_termino from editmask within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 2944
integer y = 24
integer width = 325
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type st_cuenta from statictext within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 1211
integer y = 912
integer width = 1042
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_porc from statictext within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 1582
integer y = 768
integer width = 306
integer height = 68
integer textsize = -10
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

type hpb_1 from hprogressbar within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 1211
integer y = 840
integer width = 1042
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_actualiz from commandbutton within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 370
integer y = 1632
integer width = 439
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actual. Res Comi"
end type

event clicked;string		ls_graba='N',ls_cod_jef,ls_serie,ls_est_premio
long		ll_tot_reg,ll_res,ll_numero,ll_graba=0
datetime	ldt_fecha_cierre
double	ldb_tot_porc,ldb_tot_porc_aux

dw_fecha_cierre.accepttext()
ldt_fecha_cierre								= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
if not isnull(ldt_fecha_cierre) then
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar Bono Jefes de Ventas ?', Exclamation!, YesNo!, 2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		SELECT	count("RES_COMI"."COD_AGE_SUP")
		INTO		:ll_tot_reg
		FROM		"RES_COMI", "OFERTA_V"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
					"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
					"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
					"RES_COMI"."COD_CONTABLE" = '021' AND  
					"RES_COMI"."FECHA" <= :ldt_fecha_cierre AND  
					"OFERTA_V"."ESTADO_BONO_JEF" = 'N'
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ll_tot_reg>0 then
				ls_graba								= 'S'
			else
				ls_graba								= 'N'
			end if
			ls_graba									= 'N'
		end if
		if ls_graba='N' then
			messagebox("Advertencia","No Registra Bono Jefe Ventas Sin Actualizar")
		else
			st_fondo.visible							= true
			hpb_1.visible 							= true
			st_porc.visible 							= true
			st_cuenta.visible						= true
			ldb_tot_porc								= 0
			ldb_tot_porc_aux						= 0			
			hpb_1.Position							= ldb_tot_porc
			DECLARE x1 CURSOR FOR
			SELECT	"RES_COMI"."COD_AGE_SUP",	"RES_COMI"."SERIE",	"RES_COMI"."CONTRATO",	"RES_COMI"."CODIGO_COM"  
			FROM		"RES_COMI", "OFERTA_V"  
			WHERE	"RES_COMI"."COD_AGE_SUP" = "OFERTA_V"."COD_JEF" and  
							"RES_COMI"."SERIE" = "OFERTA_V"."SERIE" and  
							"RES_COMI"."CONTRATO" = "OFERTA_V"."NRO_OFERTA" and  
							"RES_COMI"."COD_CONTABLE" = '021' AND  
							"RES_COMI"."FECHA" <= :ldt_fecha_cierre AND  
							"OFERTA_V"."ESTADO_BONO_JEF" = 'N'
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ls_cod_jef,	:ls_serie,	:ll_numero,	:ls_est_premio;
					if not isnull(ls_cod_jef) and ls_cod_jef<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 then
						UPDATE	"OFERTA_V"  
     					SET		"ESTADO_BONO_JEF" = :ls_est_premio  
						WHERE	( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :ll_numero )
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
							ll_graba++	
						else
							rollback using Trans_1;
							messagebox("Error Grabar","Error Grabar Promesa "+ls_serie+'-'+string(ll_numero))
						end if
					end if
					setnull(ls_cod_jef);setnull(ls_serie);setnull(ll_numero);setnull(ls_est_premio)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text					= string(ldb_tot_porc,'#0.##')+" %"
						ldb_tot_porc_aux			= ldb_tot_porc
					end if
					ldb_tot_porc						= (ll_graba / ll_tot_reg) * 100
					hpb_1.Position 					= ldb_tot_porc
					st_cuenta.text 					= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'  Reg. Cálculados '+string(ll_graba,'###,###,###')
				LOOP
			end if
			close x1;
			if ll_tot_reg=ll_graba then
				messagebox("Grabar","Grabación Exitosa")
			end if
			st_fondo.visible							= false
			hpb_1.visible 							= false
			st_porc.visible 							= false
			st_cuenta.visible						= false
			SetPointer(Arrow!)
//			cb_actualiza_pag.visible				= false
//			em_termino.visible					= false
		end if
	end if
else
	if isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
end event

type cb_cta_cte from commandbutton within w_premio_incremento_comi_jefe_bk2
integer x = 3977
integer y = 672
integer width = 425
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa

if dw_actualiza.rowcount() > 0 then
	if il_row>0 then
		gs_base						= dw_actualiza.getitemstring(il_row,'cadena_codigo')
		gs_serie						= dw_actualiza.getitemstring(il_row,'cadena_serie')
		gi_numero 					= dw_actualiza.getitemnumber(il_row,'cadena_numero')
		gi_rut							= dw_actualiza.getitemnumber(il_row,'cadena_rut')
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
end if
end event

type cb_respal from commandbutton within w_premio_incremento_comi_jefe_bk2
integer x = 3831
integer y = 800
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

event clicked;//elseif as_canal = 'UG' then
//	if al_unidad = 0 then
//		ls_tipo_vta = 'U'
//	elseif al_unidad = 1 then
//		ls_tipo_vta = 'C'
//	elseif al_unidad = 2 then
//		ls_tipo_vta = '3'
//	end if
//	SELECT	SUM(CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO" * (	SELECT	"FACTOR"  
//																												   FROM 		"PREMIO_INCREM_COMI_JEFE"  
//																												  	WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
//																																"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) / 100
//							WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF" * (	SELECT	"FACTOR"  
//																																					FROM 		"PREMIO_INCREM_COMI_JEFE"  
//																																					WHERE 	"PREMIO_INCREM_COMI_JEFE"."CANAL" = :as_canal AND  
//																																								"PREMIO_INCREM_COMI_JEFE"."FACTOR" = :adb_factor ) /100 END)
//	INTO		:ldb_sum_precio			
//	FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
//	WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
//				"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
//				"OFERTA_V"."SERIE" = "RES_COMI"."SERIE" AND
//				"OFERTA_V"."NRO_OFERTA" = "RES_COMI"."CONTRATO" AND
//				"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
//				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
//				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND   
//				"CADENA"."CODIGO" = 'O' AND
//				("RES_COMI"."COD_CONTABLE" = '023' or "RES_COMI"."COD_CONTABLE" = '037' or "RES_COMI"."COD_CONTABLE" = '089') AND   
//				"RES_COMI"."FECHA" = :adt_fech_comi AND  
//				"RES_COMI"."COD_AGE_SUP" = :as_cod_jef AND
//				"OFERTA_V"."TIPO_VENTA" = :ls_tipo_vta
//	USING		sqlca;	
end event

type dw_fecha_cierre from datawindow within w_premio_incremento_comi_jefe_bk2
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

event itemchanged;string		ls_columna
long		ll_mes,ll_ano,ll_dia
datetime	ldt_fec_cierre,ldt_fec_fin,ldt_fec_7porc,ldt_cierre_ant

dw_premio_jefe.reset()
dw_actualiza.reset()
dw_fecha_cierre.AcceptText()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'cierre_ventas'
		ldt_fec_cierre							= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
		ll_mes									= month(date(ldt_fec_cierre))
		ll_ano										= year(date(ldt_fec_cierre))
		if ll_mes = 12 then
			ll_mes			 					= ll_mes - 11
			ll_ano				 					= ll_ano + 1
		else
			ll_mes 								= ll_mes + 1
			ll_ano 								= ll_ano
		end if
		em_termino.text						= string('15/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
		ldt_fec_fin								= datetime(date(em_termino.text),time('00:00:00'))
		SELECT	max("OFERTA_V"."FECHA_BONO_JEF")
		INTO 		:ldt_fec_7porc  
		FROM 	"OFERTA_V"
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldt_fec_7porc) then
				ldt_fec_7porc					= ldt_fec_7porc
			end if
		end if
		if ldt_fec_7porc < ldt_fec_fin and gl_proceso>=4 then
			ll_dia									= day(date(gdt_fec_sistema))
			if ll_dia>17 then
				cb_actualiza_pag.visible		= true
				em_termino.visible			= true
				pb_aceptar.enabled			= false
			else
				cb_actualiza_pag.visible		= false
				em_termino.visible			= false
				pb_aceptar.enabled			= true
				messagebox("Advertencia",'No es Posible Generar Bono Jefes de Ventas, con Fecha :'+string(ldt_fec_fin,'dd/mm/yyyy'))
				SELECT	max("CIERRE_VENTA"."CIERRE_VENTA")  
    				INTO 		:ldt_cierre_ant  
    				FROM		"CIERRE_VENTA"  
  				WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" < :ldt_fec_cierre
				USING	sqlca;
				if sqlca.sqlcode=0 then
					dw_fecha_cierre.setitem(1,'cierre_ventas',ldt_cierre_ant)
					dw_fecha_cierre.accepttext()
				end if
			end if
		else
			cb_actualiza_pag.visible			= false
			em_termino.visible				= false
			pb_aceptar.enabled				= true
		end if
END CHOOSE
dw_fecha_cierre.accepttext()
end event

type dw_parque from datawindow within w_premio_incremento_comi_jefe_bk2
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

type cb_premio_pago from commandbutton within w_premio_incremento_comi_jefe_bk2
integer x = 1317
integer y = 1632
integer width = 379
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

type cb_grabar from commandbutton within w_premio_incremento_comi_jefe_bk2
integer x = 41
integer y = 1632
integer width = 325
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
long		ll_tot_reg,ll_cod_parque,ll_res,ll_indi,ll_rut,ll_monto_ing,ll_contr,ll_premio,ll_count,ll_mes,ll_monto_prem,ll_malos=0,ll_cont=0
datetime	ldt_fecha_cierre,ldt_fec_comi
double	ldb_factor,ldb_porc_ing,ldb_precio,ldb_valor_uf,ldb_tot_porc,ldb_tot_porc_aux

SetPointer(HourGlass!)
dw_parque.accepttext()
dw_fecha_cierre.accepttext()
dw_premio_jefe.accepttext()
ll_tot_reg 										= dw_premio_jefe.rowcount() 
ldt_fecha_cierre								= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_cod_parque									= dw_parque.getitemnumber(1,'parque')
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato Para Grabar")
else
	ll_res											= MessageBox("Advertencia", '¿ Desea Actualizar en Tabla Res_comi ?', Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		for ll_indi=1 to ll_tot_reg
			ls_cod_jef							= dw_premio_jefe.getitemstring(ll_indi,'cod_jefe')
			ldb_factor							= dw_premio_jefe.getitemnumber(ll_indi,'factor')
			ls_canal								= dw_premio_jefe.getitemstring(ll_indi,'canal')
			ldt_fec_comi						= dw_premio_jefe.getitemdatetime(ll_indi,'fecha_comi')
			ll_mes								= month(date(ldt_fecha_cierre))
			ls_cod_cont							= '021'
			ll_monto_prem						= dw_premio_jefe.getitemnumber(ll_indi,'premio')
			SELECT	COUNT("RES_COMI"."COD_AGE_SUP")
			INTO		:ll_count
			FROM		"RES_COMI","JEFE_VENTAS" 
			WHERE	( "RES_COMI"."COD_AGE_SUP" = "JEFE_VENTAS"."JEFE_VENTAS") AND
						( "JEFE_VENTAS"."COD_PARQUE" = :ll_cod_parque ) AND
						( "RES_COMI"."COD_AGE_SUP" = :ls_cod_jef ) AND
						( "RES_COMI"."COD_CONTABLE" = :ls_cod_cont ) AND  
						( "RES_COMI"."FECHA" = :ldt_fecha_cierre )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ll_count=0 then
					if (ls_canal='NI' or ls_canal= 'NF' or ls_canal='T') and ll_monto_prem>0 then
						if not isnull(ls_cod_jef) and ls_cod_jef<>'' and not isnull(ls_canal) and ls_canal<>'' and not isnull(ldt_fecha_cierre) then
							if ls_canal='NF'  or ls_canal='NI' then
								DECLARE x1 CURSOR FOR  
								SELECT	"OFERTA_V"."COD_JEF",
											"JEFE_VENTAS"."RUT",
											(	SELECT 	sum("INGRESO"."MONTO")
												FROM		"INGRESO"
												WHERE	"INGRESO"."BASE" = "CADENA"."CODIGO" AND
															"INGRESO"."SERIE" = "CADENA"."SERIE" AND
															"INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND
															("INGRESO"."TIPO_MOV" = 'A' OR  "INGRESO"."TIPO_MOV" = 'E') AND
															"INGRESO"."FECHA_PAGO" <= :ldt_fec_comi) as tot_pagado, 
											"CADENA"."NUMERO",
											"CADENA"."SERIE",
											round((	SELECT	sum("INGRESO"."MONTO")
														FROM 	"INGRESO"
														WHERE	"INGRESO"."BASE" = "CADENA"."CODIGO" AND
																	"INGRESO"."SERIE" = "CADENA"."SERIE" AND
																	"INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND
																	("INGRESO"."TIPO_MOV" = 'A' OR  "INGRESO"."TIPO_MOV" = 'E') AND
																	"INGRESO"."FECHA_PAGO" <= :ldt_fec_comi) / round(	CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO"
																																					WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "TAB_UF"."VALOR_UF"  END,0) * 100,2),
											"PAGO_OFERTA"."PRECIO",
											"TAB_UF"."VALOR_UF",
											'H',
											"PAGO_OFERTA"."MONEDA",
											'P',
											'A'
								FROM		"OFERTA_V","PAGO_OFERTA","CADENA","TAB_UF","JEFE_VENTAS"    
								WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND 
											"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND  
											"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" AND  
											"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" AND  
											"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" AND
											"OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" AND
											"CADENA"."CODIGO" = 'O' AND
											"OFERTA_V"."FECHA_BONO_JEF" = :ldt_fec_comi AND  
											"OFERTA_V"."COD_JEF" = :ls_cod_jef AND
											"TAB_UF"."FECHA_UF" = :ldt_fec_comi
								USING	Trans_1;
							elseif ls_canal='T' then
								DECLARE x2 CURSOR FOR
								SELECT	"RES_COMI"."COD_AGE_SUP",
											"RES_COMI"."RUT",
											SUM(CASE WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN "PAGO_OFERTA"."PRECIO"
														WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO" * "RES_COMI"."VALOR_UF" END), 
											"RES_COMI"."VALOR_UF",
											"RES_COMI"."HABER",
											"RES_COMI"."CODIGO_COM",
											"RES_COMI"."ESTADO_AGE_SUP"
								FROM		"RES_COMI", "OFERTA_V",	"PAGO_OFERTA","CADENA"    
								WHERE	"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND  
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
								USING	Trans_1;			
							end if
							if ls_canal='NF' or ls_canal='NI' then
								open x1;
							elseif ls_canal='T' then
								open x2;
							end if
							if Trans_1.sqlcode=0 then
								DO WHILE Trans_1.sqlcode=0
									if ls_canal='NF' or ls_canal='NI' then
										fetch x1 INTO	:ls_cod_age_sup,:ll_rut,:ll_monto_ing,:ll_contr,:ls_serie,:ldb_porc_ing,:ldb_precio,:ldb_valor_uf,:ls_haber,:ls_moneda, :ls_codigo_com,:ls_estado;
									elseif ls_canal='T' then
										fetch x2 INTO	:ls_cod_age_sup,:ll_rut,:ldb_precio,:ldb_valor_uf,:ls_haber,:ls_codigo_com,:ls_estado;
									end if
									if not isnull(ls_cod_age_sup) and ls_cod_age_sup<>'' then
										if ls_canal= 'NF' or ls_canal= 'NI' then
											if ls_moneda = '1' then //peso
												ll_premio 			= round(ldb_precio * ldb_factor/ 100,0)
											elseif ls_moneda = '2' then //uf
												ll_premio			= round(round(ldb_precio * ldb_valor_uf,0) * ldb_factor / 100,0) 
											end if
											if f_graba_res_comi(ls_cod_age_sup,ll_rut,ll_monto_ing,ls_cod_cont,string(ll_mes),ldt_fecha_cierre,ll_contr,ls_serie,ldb_porc_ing,ldb_factor,ldb_precio,ll_premio,ldb_valor_uf,ls_haber,ls_moneda,ls_codigo_com,ls_estado,'O',ll_cod_parque,0,0)=-1 then
												ll_malos++
											else
												ll_cont++
											end if
										elseif ls_canal= 'T' then
											ll_premio					= dw_premio_jefe.getitemnumber(ll_indi,'premio')
											f_graba_res_comi(ls_cod_age_sup,ll_rut,0,ls_cod_cont,string(ll_mes),ldt_fecha_cierre,0,' ',0,0,ldb_precio,ll_premio,ldb_valor_uf,ls_haber,'',ls_codigo_com,ls_estado,'O',ll_cod_parque,0,0)
										end if
									end if
									setnull(ls_cod_age_sup)
								LOOP
								messagebox("Grabar",'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
															'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
							end if
							if ls_canal='NF' or ls_canal='NI' then
								close x1;
							elseif ls_canal='T'then
								close x2;	
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

type cb_imprimir from commandbutton within w_premio_incremento_comi_jefe_bk2
integer x = 1701
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

type cb_cerrar from commandbutton within w_premio_incremento_comi_jefe_bk2
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

type pb_aceptar from picturebutton within w_premio_incremento_comi_jefe_bk2
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
		if ll_count>0 then
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
				wf_lista_premiados(ldt_fecha_cierre,ll_cod_parque,'R')
			end if
		else
			cb_grabar.visible										= true
			if (gs_depto='D' or gs_depto='I' and gl_proceso>=4 )then
				dw_premio_jefe.dataobject						= 'dw_bono_jefe_presupuesto'
				dw_premio_jefe.settransobject(sqlca)
				wf_lista_premiados(ldt_fecha_cierre,ll_cod_parque,'O')
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

type dw_actualiza from datawindow within w_premio_incremento_comi_jefe_bk2
integer x = 3355
integer y = 132
integer width = 1449
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_actualiza_bono_jef_vtas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_fondo from statictext within w_premio_incremento_comi_jefe_bk2
boolean visible = false
integer x = 1189
integer y = 752
integer width = 1093
integer height = 268
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

type dw_premio_jefe from datawindow within w_premio_incremento_comi_jefe_bk2
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

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

