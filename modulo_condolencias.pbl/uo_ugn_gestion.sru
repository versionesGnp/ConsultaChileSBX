forward
global type uo_ugn_gestion from tab
end type
type tabpage_1 from userobject within uo_ugn_gestion
end type
type dw_cliente from datawindow within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_contrato from datawindow within tabpage_1
end type
type cb_cerrar_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within uo_ugn_gestion
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type
type tabpage_2 from userobject within uo_ugn_gestion
end type
type cb_cerrar_2 from commandbutton within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type dw_cobranza from datawindow within tabpage_2
end type
type tabpage_2 from userobject within uo_ugn_gestion
cb_cerrar_2 cb_cerrar_2
st_1 st_1
dw_cobranza dw_cobranza
end type
type tabpage_3 from userobject within uo_ugn_gestion
end type
type cb_cerrar_3 from commandbutton within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type dw_fallecido from datawindow within tabpage_3
end type
type tabpage_3 from userobject within uo_ugn_gestion
cb_cerrar_3 cb_cerrar_3
st_2 st_2
dw_fallecido dw_fallecido
end type
type tabpage_4 from userobject within uo_ugn_gestion
end type
type dw_encuesta from datawindow within tabpage_4
end type
type st_9 from statictext within tabpage_4
end type
type dw_ingreso from datawindow within tabpage_4
end type
type dw_cliente2 from datawindow within tabpage_4
end type
type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
end type
type cb_grabar from commandbutton within tabpage_4
end type
type cb_cerrar_4 from commandbutton within tabpage_4
end type
type tabpage_4 from userobject within uo_ugn_gestion
dw_encuesta dw_encuesta
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_grabar cb_grabar
cb_cerrar_4 cb_cerrar_4
end type
type tabpage_5 from userobject within uo_ugn_gestion
end type
type dw_email from datawindow within tabpage_5
end type
type dw_cotiz_imprime from datawindow within tabpage_5
end type
type cb_crea_archivo from commandbutton within tabpage_5
end type
type cb_grabar_cotizacion from commandbutton within tabpage_5
end type
type cb_cerrar_5 from commandbutton within tabpage_5
end type
type dw_cotizacion_agente from datawindow within tabpage_5
end type
type dw_cotizacion from datawindow within tabpage_5
end type
type tabpage_5 from userobject within uo_ugn_gestion
dw_email dw_email
dw_cotiz_imprime dw_cotiz_imprime
cb_crea_archivo cb_crea_archivo
cb_grabar_cotizacion cb_grabar_cotizacion
cb_cerrar_5 cb_cerrar_5
dw_cotizacion_agente dw_cotizacion_agente
dw_cotizacion dw_cotizacion
end type
end forward

global type uo_ugn_gestion from tab
integer width = 2546
integer height = 2072
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean showpicture = false
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
global uo_ugn_gestion uo_ugn_gestion

type variables
string	is_ruta='',is_nombre='',is_extension=''
long	il_fila,il_cta_max_plazo,il_count=0
datawindowchild idw_detalle5,idw_detalle6,idw_detalle7 
end variables

forward prototypes
public subroutine wf_calc_promesa ()
end prototypes

public subroutine wf_calc_promesa ();string		ls_moneda,ls_tip_sepul,ls_area,ls_uso,ls_forma_pag
long		ll_plazo,ll_capac,ll_cod_parque
date		ld_fec_1venc,ld_fec_ctto
double	ldb_uf,ldb_precio,ldb_pie,ldb_gasto_uf,ldb_calculo

//cod_parque
//sector
//capacidad
//tipo_sepultura
//fecha


//
//uo_ugn_gestion.tabpage_5.dw_cotizacion.accepttext()
//ls_moneda						= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemstring(1,'moneda')
//ld_fec_1venc					= date(uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemdatetime(1,'fecha_prim'))
//ld_fec_ctto						= date(uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemdatetime(1,'fecha_ctto'))
//ll_plazo							= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'plazo')
//ls_tip_sepul						= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemstring(1,'tipo_sepult')
//ls_area							= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemstring(1,'area')
//ll_capac							= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'capacidad')
//ls_uso							= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemstring(1,'uso')
//ldb_uf								= double(uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'uf_fecha_ctto'))
//ll_cod_parque					= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'cod_parque')
//ls_forma_pag					= uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemstring(1,'forma_pago')
//ldb_precio						= double(uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'precio_contrato'))
//ldb_pie							= double(uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'pie'))
//ldb_gasto_uf					= double(uo_ugn_gestion.tabpage_5.dw_cotizacion.getitemnumber(1,'gasto_adm'))
//if isnull(ldb_pie) then ldb_pie=0
//if isnull(ldb_gasto_uf) then ldb_gasto_uf=0
//if isnull(ldb_precio) or isnull(ldb_gasto_uf) then
//	uo_ugn_gestion.tabpage_5.dw_cotizacion.setitem(1,'saldo_financiar',0)
//else
//	ldb_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
//	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
//end if
//dw_revision.accepttext()
////lld_saldo_finan				= double(dw_revision.getitemnumber(1,'saldo_financiar'))
////if not isnull(ls_forma_pago) then
////	if ls_forma_pago<>'2' and ls_forma_pago<>'4' then
//////		dw_revision.setitem(1,'renta_liquida',0)
////		dw_revision.setitem(1,'factor_cuota',0)
////		dw_revision.setitem(1,'gasto_adm',0)
////		if lld_saldo_finan>0 and ll_plazo>0 then
////			if ls_moneda='1' then //peso
////				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0))
////			else
////				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4))
////			end if
////		end if
////	end if
////end if
////if not isnull(ls_tipo_sepultura) then
////	if ls_tipo_sepultura = '1' then
////		ls_tipo_construc		= 'T'
////	else
////		ls_tipo_construc		= 'C'
////	end if
////end if
////if not isnull(ls_area) and not isnull(ll_capacidad) and not isnull(ls_uso) and &
////	not isnull(ldb_uf) and not isnull(il_cod_parque) and not isnull(ls_tipo_sepultura) then
////	ls_string						= f_valida_precio(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque)
////	if ls_moneda='2' then //UF
////		ldb_precio				= double(substr(1,1,ls_string))
////		ldb_derecho				= double(substr(1,2,ls_string))
////		ldb_cuota_mant			= double(substr(1,3,ls_string))
////		ldb_liberador			= double(substr(1,4,ls_string))
////		ldb_pie_minimo			= double(substr(1,5,ls_string))
////		ll_reduccion			= long(substr(1,6,ls_string))
////	else // peso
////		ldb_precio				= double(long(substr(1,1,ls_string)))
////		ldb_derecho				= double(long(substr(1,2,ls_string)))
////		ldb_cuota_mant			= double(substr(1,3,ls_string))
////		ldb_liberador			= double(long(substr(1,4,ls_string)))
////		ldb_derecho				= ROUND((ldb_derecho / ldb_uf),0)
////		ldb_pie_minimo			= double(substr(1,5,ls_string))
////		ll_reduccion			= long(substr(1,6,ls_string))
////	end if
////	if ls_serie='R' or ls_uso='NI' then
////		ldb_derecho				= 0
////	end if
////	dw_revision.setitem(1,'reduccion',ll_reduccion)
////	dw_revision.setitem(1,'precio',ldb_precio)
////	dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
////	ls_forma_pago				= dw_revision.getitemstring(1,'forma_pago')
////	if dw_revision.getitemnumber(1,'pie') < ldb_pie_minimo and &
////		dw_revision.getitemnumber(1,'pie')>=0 and ls_sw_pie='N' and (ls_forma_pago='2' or ls_forma_pago='4') then
////		ll_new						= dw_lista_obs.insertrow(0)
////		dw_lista_obs.scrolltorow(0)
////		dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////		dw_lista_obs.setitem(ll_new,'base',ls_base)
////		dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////		dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////		if ls_moneda='2' then //UF
////			ls_falta			= String((ldb_pie_minimo - dw_revision.getitemnumber(1,'pie')),"###,###,###,##0.0###")+' U.F.'
////		else
////			ls_falta			= String((ldb_pie_minimo - dw_revision.getitemnumber(1,'pie')),"###,###,###,##0")+' Pesos'
////		end if
////		dw_lista_obs.setitem(ll_new,'observacion','Advertencia Pie es Menor al Pie Mínimo Indicado por Lista, faltan '+ls_falta)
////		dw_lista_obs.accepttext()
////		dw_revision.setfocus()
////	end if
////	SELECT	"REVISION_CONTRATOS"."PRECIO_CONTRATO"  
////	INTO 		:ldb_precio_ctto_aux  
////	FROM 		"REVISION_CONTRATOS"  
////	WHERE  ( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
////			 ( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
////			 ( "REVISION_CONTRATOS"."NUMERO" = :ll_numero ) AND  
////			 ( "REVISION_CONTRATOS"."RUT" = :ll_rut )   
////	USING		sqlca;
////	if sqlca.sqlcode<>0 then
////		if is_nuevo='S' and is_sw_pasa='S' then
////			dw_revision.setitem(1,'precio_contrato',ldb_precio)
////			is_sw_pasa				= 'N'
////		else
////			if dw_revision.getitemnumber(1,'precio_contrato')=0 then
////				dw_revision.setitem(1,'precio_contrato',ldb_precio)
////			end if
////		end if
////	end if
////	dw_revision.setitem(1,'derecho_especial',ldb_derecho)
////	dw_revision.setitem(1,'valor_cuota_mant',ldb_cuota_mant)
////	ldb_liberador					= 0
////end if
////dw_revision.accepttext()
////ls_moneda						= dw_revision.getitemstring(1,'moneda')
////ld_fecha_1_venc				= date(dw_revision.getitemdatetime(1,'fecha_prim'))
////ld_fecha_ctto					= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
////ll_plazo							= dw_revision.getitemnumber(1,'plazo')
////ls_tipo_sepultura				= dw_revision.getitemstring(1,'tipo_sepult')
////ls_area							= dw_revision.getitemstring(1,'area')
////ll_capacidad						= dw_revision.getitemnumber(1,'capacidad')
////ls_uso							= dw_revision.getitemstring(1,'uso')
////ldb_uf								= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
////il_cod_parque					= dw_revision.getitemnumber(1,'cod_parque')
////if ll_plazo>0 then
////	ll_dias						= ll_plazo * 30
////	ld_fecha_ctto				= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
////	if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
////		wf_dps(ld_fecha_ctto,ld_fecha_nac,ls_forma_pago,ll_rut,ls_base,ls_serie,ll_numero)
////	end if
////	ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias)
////	ld_fecha_ctto				= ld_fecha
////	ld_fecha_nac				= date(dw_revision.getitemdatetime(1,'fecha_nac'))
////end if
////dw_revision.accepttext()
////ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
////lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
////lld_gasto_uf						= double(dw_revision.getitemnumber(1,'gasto_adm'))
////if isnull(lld_pie) then lld_pie=0
////if isnull(lld_gasto_uf) then lld_gasto_uf=0
////if isnull(ldb_precio) or isnull(lld_gasto_uf) then
////	dw_revision.setitem(1,'saldo_financiar',0)
////else
////	ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
////	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
////end if
////dw_revision.accepttext()
////lld_precio_contrato				= double(dw_revision.getitemnumber(1,'precio_contrato'))
////ldb_precio							= double(dw_revision.getitemnumber(1,'precio'))
////if lld_precio_contrato <> ldb_precio and ldb_precio>0 then
////	lld_calc_desc					= 100 - round(((lld_precio_contrato * 100) / ldb_precio),2)
////	ll_new							= dw_lista_obs.insertrow(0)
////	dw_lista_obs.scrolltorow(0)
////	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////	dw_lista_obs.setitem(ll_new,'base',ls_base)
////	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////	dw_lista_obs.setitem(ll_new,'observacion','Se aplicó el '+string(lld_calc_desc,"###,##0.0#")+'% Descuento del Precio Lista')
////	dw_lista_obs.accepttext()
////end if
////dw_revision.accepttext()
////ld_fecha_1_venc					= date(dw_revision.getitemdatetime(1,'fecha_prim'))
////ld_fecha_ctto						= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
////lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
////if isnull(lld_pie) then lld_pie=0
////if not isnull(ld_fecha_1_venc) then
////	if not isnull(ld_fecha_ctto) then
////		if lld_pie>0 then
////			ld_fecha					= RelativeDate(ld_fecha_ctto, 60)
////			if ld_fecha_1_venc > ld_fecha then
////				ll_new				= dw_lista_obs.insertrow(0)
////				dw_lista_obs.scrolltorow(0)
////				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////				dw_lista_obs.setitem(ll_new,'base',ls_base)
////				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////				dw_lista_obs.setitem(ll_new,'observacion','Fecha 1º Vencimiento No puede ser Mayor a 60 dias, a partir de la Fecha del Contrato')
////				dw_lista_obs.accepttext()
////			end if
////		elseif lld_pie=0 then
////			ld_fecha					= RelativeDate(ld_fecha_ctto, 50)
////			if ld_fecha_1_venc > ld_fecha then
////				ll_new				= dw_lista_obs.insertrow(0)
////				dw_lista_obs.scrolltorow(0)
////				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////				dw_lista_obs.setitem(ll_new,'base',ls_base)
////				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////				dw_lista_obs.setitem(ll_new,'observacion','Fecha 1º Vencimiento No puede ser Mayor a 30 dias, a partir de la Fecha del Contrato')
////				dw_lista_obs.accepttext()
////			end if
////		end if
////	end if
////	dw_revision.accepttext()
////	ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
////	lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
////	lld_gasto_uf						= double(dw_revision.getitemnumber(1,'gasto_adm'))
////	if isnull(lld_pie) then lld_pie=0
////	if isnull(lld_gasto_uf) then lld_gasto_uf=0
////	if isnull(ldb_precio) or isnull(lld_gasto_uf) then
////		dw_revision.setitem(1,'saldo_financiar',0)
////	else
////		ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
////		dw_revision.setitem(1,'saldo_financiar',ld_calculo)
////	end if
////	dw_revision.accepttext()
////	ldt_fecha							= dw_revision.getitemdatetime(1,'fecha_ctto')
////	ldt_fecha_prim						= dw_revision.getitemdatetime(1,'fecha_prim')
////	lld_saldo_finan					= double(dw_revision.getitemnumber(1,'saldo_financiar'))
////	ll_dias								= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
////	ldt_fecha_venc_vig_factor		= dw_revision.getitemdatetime(1,'fecha_factor_vigente')
////	ll_plazo								= dw_revision.getitemnumber(1,'plazo')
////	if ll_dias>0 then dw_revision.setitem(1,'dias_vencimiento_prim',ll_dias)
////	if not isnull(ll_plazo) and ll_plazo>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
////		not isnull(ls_moneda) and not isnull(ldb_precio) then //not isnull(lld_gasto_uf) and lld_gasto_uf>0 and and ldb_precio>0
////		if ldt_fecha_prim >= ldt_fecha then
////			if ls_forma_pago='2' or ls_forma_pago='4' then
////				if ll_plazo>=1 and ll_plazo<=11 then
////					lld_saldo_finan	= double(dw_revision.getitemnumber(1,'saldo_financiar'))
////					ll_plazo				= dw_revision.getitemnumber(1,'plazo')
////					if ls_moneda='1' then //peso
////						dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0))
////					else
////						dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4))
////					end if
////				else
////					if ll_dias>=30 then
////						SELECT	"FACTORES"."FACTOR",
////									"FACTORES"."FACTOR_GASTO_ADM"
////						INTO 		:lld_factor,
////									:ldb_gasto_adm
////						FROM 		"FACTORES"  
////						WHERE  ( "FACTORES"."BASE" = 'O' ) AND  
////								 ( "FACTORES"."NRO_CUOTAS_INICIAL" >= :ll_plazo )  AND  
////								 ( "FACTORES"."NRO_CUOTAS_FINAL" <= :ll_plazo )  AND  
////								 (("FACTORES"."DIAS_INICIAL" >= :ll_dias )  AND  
////								 ( "FACTORES"."DIAS_FINAL" <= :ll_dias ))  AND
////								 ( "FACTORES"."MONEDA" = :ls_moneda ) AND
////								 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor )
////								 
////						USING		sqlca;
////						if lld_factor > 0 then //and lld_saldo_finan > 0
////							dw_revision.setitem(1,'factor_cuota',lld_factor)
////							if date(dw_revision.getitemdatetime(1,'fecha_ctto')) > date('01/10/2013') then
////								ldb_gasto_adm		= 0
////							end if
////							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
////							dw_revision.accepttext()
////							ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
////							lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
////							lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
////							ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
////							lld_saldo_finan	= round((lld_factor * ld_calculo),4)
////							dw_revision.setitem(1,'valor_cuota',lld_saldo_finan)
////							dw_revision.accepttext()
////						else
////							SELECT	"FACTORES"."FACTOR",
////										"FACTORES"."FACTOR_GASTO_ADM"
////							INTO 		:lld_factor,
////										:ldb_gasto_adm
////							FROM 		"FACTORES"  
////							WHERE  ( "FACTORES"."BASE" = 'O' ) AND  
////									 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
////									 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
////									 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
////								 	 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
////									 ( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
////																		FROM 		"FACTORES" 
////																		WHERE  ( "FACTORES"."BASE" = 'O' ) AND 
////																			    ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
////																				 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
////																				 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
////																				 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
////																				 ( "FACTORES"."FACTOR" <> 0 ) ) )   ;
////							if lld_factor > 0 then //and lld_saldo_finan > 0
////								dw_revision.setitem(1,'factor_cuota',lld_factor)
////								if date(dw_revision.getitemdatetime(1,'fecha_ctto')) > date('01/10/2013') then
////									ldb_gasto_adm		= 0
////								end if
////								dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
////								dw_revision.accepttext()
////								ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
////								lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
////								lld_gasto_uf		= double(dw_revision.getitemnumber(1,'gasto_adm'))
////								ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
////								lld_saldo_finan	= round((lld_factor * ld_calculo),4)
////								dw_revision.setitem(1,'valor_cuota',lld_saldo_finan)
////								dw_revision.accepttext()
////							end if
////						end if
////					else
////						SELECT	"FACTORES"."FACTOR",
////									"FACTORES"."FACTOR_GASTO_ADM"
////						INTO 		:lld_factor,
////									:ldb_gasto_adm  
////						FROM 		"FACTORES"  
////						WHERE  ( "FACTORES"."BASE" = 'O' ) AND  
////								 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
////								 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
////								 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
////								 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
////								 ( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
////																	FROM 		"FACTORES" 
////																	WHERE  ( "FACTORES"."BASE" = 'O' ) AND 
////																			 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
////																			 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
////																			 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
////																			 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
////																			 ( "FACTORES"."FACTOR" <> 0 ) ) )   
////						USING		sqlca;
////						if lld_factor > 0 then //and lld_saldo_finan > 0
////							dw_revision.setitem(1,'factor_cuota',lld_factor)
////							if date(dw_revision.getitemdatetime(1,'fecha_ctto')) > date('01/10/2013') then
////								ldb_gasto_adm		= 0
////							end if
////							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
////							dw_revision.accepttext()
////							ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
////							lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
////							lld_gasto_uf		= double(dw_revision.getitemnumber(1,'gasto_adm'))
////							ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
////							lld_saldo_finan	= round((lld_factor * ld_calculo),4)
////							dw_revision.setitem(1,'valor_cuota',lld_saldo_finan)
////							dw_revision.accepttext()
////						end if
////					end if
////				end if
////			end if
////			dw_revision.accepttext()
////			ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
////			lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
////			lld_gasto_uf							= double(dw_revision.getitemnumber(1,'gasto_adm'))
////			if isnull(lld_pie) then lld_pie=0
////			if isnull(lld_gasto_uf) then lld_gasto_uf=0
////			if isnull(ldb_precio) or isnull(lld_gasto_uf) then
////				dw_revision.setitem(1,'saldo_financiar',0)
////			else
////				ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
////				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
////			end if
////			dw_revision.accepttext()
////		else
////			ll_new	= dw_lista_obs.insertrow(0)
////			dw_lista_obs.scrolltorow(0)
////			dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////			dw_lista_obs.setitem(ll_new,'base',ls_base)
////			dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////			dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////			dw_lista_obs.setitem(ll_new,'observacion','Recuerde Fecha Primer Vencimiento debe ser Mayor o Igual a la Fecha Contrato')
////			dw_lista_obs.accepttext()
////		end if
////	end if
////	dw_revision.accepttext()
////	ll_renta											= dw_revision.getitemnumber(1,'renta_liquida')
////	ls_forma_pago									= dw_revision.getitemstring(1,'forma_pago')
////	if ll_renta>0 and (ls_forma_pago='2' or ls_forma_pago='4') then
////		if ls_moneda='1' then //peso
////			ldb_val_cta								= dw_revision.getitemnumber(1,'valor_cuota')
////			ll_porce									= round((long(dw_revision.getitemnumber(1,'valor_cuota')) * 100 ) / ll_renta,2)
////			ll_10_porce								= round((ll_renta * 10) / 100,0)
////			ldb_porcen_real						= round((ldb_val_cta * 100) / ll_renta,2)
////			if ldb_porcen_real > 10 then
////				ll_new				= dw_lista_obs.insertrow(0)
////				dw_lista_obs.scrolltorow(0)
////				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////				dw_lista_obs.setitem(ll_new,'base',ls_base)
////				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////				dw_lista_obs.setitem(ll_new,'observacion','Valor Cuota es un '+string(ldb_porcen_real,"##0.0#")+'% de Renta Líquida declarada, recuerde no debe ser Mayor al 10%')
////				dw_lista_obs.accepttext()
////				dw_revision.setfocus()
////			end if
////		elseif ls_moneda='2' then //UF
////			ldb_val_cta								= dw_revision.getitemnumber(1,'valor_cuota')
////			ldb_val_uf								= dw_revision.getitemnumber(1,'uf_fecha_ctto')
////			ll_valor_cta								= round((ldb_val_cta * ldb_val_uf),0)
////			ll_porce									= round((ll_valor_cuota * 100 ) / ll_renta,2)
////			ll_10_porce								= (ll_renta * 10) / 100
////			ldb_porcen_real						= round((ll_valor_cta * 100) / ll_renta,2)
////			if ldb_porcen_real > 10 then
////				ll_new				= dw_lista_obs.insertrow(0)
////				dw_lista_obs.scrolltorow(0)
////				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
////				dw_lista_obs.setitem(ll_new,'base',ls_base)
////				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
////				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
////				dw_lista_obs.setitem(ll_new,'observacion','Valor Cuota es un '+string(ldb_porcen_real,"##0.0#")+'% de Renta Líquida declarada, recuerde no debe ser Mayor al 10%')
////				dw_lista_obs.accepttext()
////				dw_revision.setfocus()
////			end if
////		end if
////	end if
////end if
////dw_revision.accepttext()
end subroutine

on uo_ugn_gestion.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on uo_ugn_gestion.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

type tabpage_1 from userobject within uo_ugn_gestion
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2510
integer height = 1944
integer taborder = 1
long backcolor = 67108864
string text = "Antecedentes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_cliente dw_cliente
st_4 st_4
dw_contrato dw_contrato
cb_cerrar_1 cb_cerrar_1
end type

on tabpage_1.create
this.dw_cliente=create dw_cliente
this.st_4=create st_4
this.dw_contrato=create dw_contrato
this.cb_cerrar_1=create cb_cerrar_1
this.Control[]={this.dw_cliente,&
this.st_4,&
this.dw_contrato,&
this.cb_cerrar_1}
end on

on tabpage_1.destroy
destroy(this.dw_cliente)
destroy(this.st_4)
destroy(this.dw_contrato)
destroy(this.cb_cerrar_1)
end on

type dw_cliente from datawindow within tabpage_1
integer x = 14
integer y = 8
integer width = 2469
integer height = 628
integer taborder = 10
string title = "none"
string dataobject = "dw_antecedentes_cliente_ugn"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within tabpage_1
integer x = 37
integer y = 628
integer width = 567
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratos Asociados"
boolean focusrectangle = false
end type

event clicked;w_general_cobranza_telefonica.tab_cobranza.visible	= false
end event

type dw_contrato from datawindow within tabpage_1
integer x = 18
integer y = 700
integer width = 2441
integer height = 1100
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_contrato_por_ugn_cliente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_numero,ll_folio
if getrow()>0 then
	il_fila		= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(il_fila,'cadena_numero')
end if
end event

event clicked;String	ls_base,ls_serie,ls_tipo_cob
Long		ll_numero,ll_folio
if row>0 then
	il_fila		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_fila, TRUE)
	ls_base		= this.getitemstring(il_fila,'cadena_codigo')
	ls_serie		= this.getitemstring(il_fila,'cadena_serie')
	ll_numero	= this.getitemnumber(il_fila,'cadena_numero')
end if
end event

type cb_cerrar_1 from commandbutton within tabpage_1
integer x = 18
integer y = 1824
integer width = 2441
integer height = 104
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type tabpage_2 from userobject within uo_ugn_gestion
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2510
integer height = 1944
long backcolor = 67108864
string text = "Gestión Histórica"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cerrar_2 cb_cerrar_2
st_1 st_1
dw_cobranza dw_cobranza
end type

on tabpage_2.create
this.cb_cerrar_2=create cb_cerrar_2
this.st_1=create st_1
this.dw_cobranza=create dw_cobranza
this.Control[]={this.cb_cerrar_2,&
this.st_1,&
this.dw_cobranza}
end on

on tabpage_2.destroy
destroy(this.cb_cerrar_2)
destroy(this.st_1)
destroy(this.dw_cobranza)
end on

type cb_cerrar_2 from commandbutton within tabpage_2
integer x = 23
integer y = 1808
integer width = 2437
integer height = 108
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type st_1 from statictext within tabpage_2
integer x = 27
integer y = 16
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestión Telefónica"
boolean focusrectangle = false
end type

type dw_cobranza from datawindow within tabpage_2
integer x = 23
integer y = 76
integer width = 2437
integer height = 1712
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_historial_gestion_ugn"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type tabpage_3 from userobject within uo_ugn_gestion
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2510
integer height = 1944
long backcolor = 67108864
string text = "Antecedente Fallecido"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_cerrar_3 cb_cerrar_3
st_2 st_2
dw_fallecido dw_fallecido
end type

on tabpage_3.create
this.cb_cerrar_3=create cb_cerrar_3
this.st_2=create st_2
this.dw_fallecido=create dw_fallecido
this.Control[]={this.cb_cerrar_3,&
this.st_2,&
this.dw_fallecido}
end on

on tabpage_3.destroy
destroy(this.cb_cerrar_3)
destroy(this.st_2)
destroy(this.dw_fallecido)
end on

type cb_cerrar_3 from commandbutton within tabpage_3
integer x = 18
integer y = 1824
integer width = 2441
integer height = 104
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type st_2 from statictext within tabpage_3
integer x = 27
integer y = 16
integer width = 699
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedente Fallecido"
boolean focusrectangle = false
end type

type dw_fallecido from datawindow within tabpage_3
integer x = 18
integer y = 76
integer width = 2450
integer height = 1508
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ugn_antecedentes_fallecido_ficha"
boolean border = false
boolean livescroll = true
end type

type tabpage_4 from userobject within uo_ugn_gestion
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2510
integer height = 1944
long backcolor = 67108864
string text = "Gestión Telefónica"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_encuesta dw_encuesta
st_9 st_9
dw_ingreso dw_ingreso
dw_cliente2 dw_cliente2
dw_ultima_cobranza_telefonica dw_ultima_cobranza_telefonica
cb_grabar cb_grabar
cb_cerrar_4 cb_cerrar_4
end type

on tabpage_4.create
this.dw_encuesta=create dw_encuesta
this.st_9=create st_9
this.dw_ingreso=create dw_ingreso
this.dw_cliente2=create dw_cliente2
this.dw_ultima_cobranza_telefonica=create dw_ultima_cobranza_telefonica
this.cb_grabar=create cb_grabar
this.cb_cerrar_4=create cb_cerrar_4
this.Control[]={this.dw_encuesta,&
this.st_9,&
this.dw_ingreso,&
this.dw_cliente2,&
this.dw_ultima_cobranza_telefonica,&
this.cb_grabar,&
this.cb_cerrar_4}
end on

on tabpage_4.destroy
destroy(this.dw_encuesta)
destroy(this.st_9)
destroy(this.dw_ingreso)
destroy(this.dw_cliente2)
destroy(this.dw_ultima_cobranza_telefonica)
destroy(this.cb_grabar)
destroy(this.cb_cerrar_4)
end on

type dw_encuesta from datawindow within tabpage_4
integer x = 23
integer y = 1560
integer width = 2450
integer height = 244
integer taborder = 30
string title = "none"
string dataobject = "dw_encuesta_mc"
boolean border = false
boolean livescroll = true
end type

type st_9 from statictext within tabpage_4
integer x = 59
integer y = 892
integer width = 777
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Cobranza Telefónica"
boolean focusrectangle = false
end type

type dw_ingreso from datawindow within tabpage_4
integer x = 9
integer y = 948
integer width = 2478
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_gestion_ejecutivo_ugn"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Date		ld_fecha_asigna,ldt_fecha_tope,ld_fecha,ld_nulo
String	ls_columna,ls_base,ls_serie,ls_descrip,ls_estado_gestion,ls_nulo
Long		ll_row,ll_numero,ll_estado,ll_nulo

this.accepttext()
Setnull(ld_nulo);Setnull(ll_nulo);Setnull(ls_nulo)
ll_row				= w_ingreso_individual_ugn.dw_lista.getrow()
ls_columna			= dwo.name
ld_fecha_asigna	= date(w_ingreso_individual_ugn.dw_lista.getitemdatetime(ll_row,'ugn_cliente_asignar_falle_fecha_ingreso'))
if ls_columna='estado_gestion' then
	ls_estado_gestion	= trim(dw_ingreso.getitemstring(1,'estado_gestion'))
	if not isnull(ls_estado_gestion) and ls_estado_gestion<>'22' and dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then 
		dw_ingreso.setitem(1,'base',ls_nulo)
		dw_ingreso.setitem(1,'serie',ls_nulo)
		dw_ingreso.setitem(1,'numero',ll_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna = 'fecha_prox_llamado' then
	ld_fecha			= Date(dw_ingreso.getitemdatetime(1,'fecha_prox_llamado'))
	ldt_fecha_tope	= RelativeDate(ld_fecha_asigna, 15)
	if ld_fecha > ldt_fecha_tope then
		messagebox("Advertencia","Fecha Próximo Llamado No debe ser Mayor al "+string(ld_fecha_asigna,'dd/mm/yyyy')+ " fecha Tope para realizar Gestión")
		dw_ingreso.setitem(1,'fecha_prox_llamado',ld_nulo)
		dw_ingreso.accepttext()
	end if
elseif ls_columna='serie' or ls_columna='numero' or ls_columna='base' then
	if ls_columna='base' then
		ls_base			= dw_ingreso.getitemstring(1,'base')
		idw_detalle.retrieve(ls_base)
	end if
	if ls_columna='numero' then
		if ll_numero > 0 then
			ls_base			= dw_ingreso.getitemstring(1,'base')
			ls_serie			= dw_ingreso.getitemstring(1,'serie')
			ll_numero		= dw_ingreso.getitemnumber(1,'numero')
			if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
				SELECT	"CD_FOLIO"."ULT_ESTADO", 	"CD_ESTADO"."DESCRIPCION"  
				INTO 		:ll_estado,						:ls_descrip  
				FROM		"CD_FOLIO",	"CD_ESTADO"  
				WHERE  ( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and  
						 (("CD_FOLIO"."BASE" = :ls_base ) AND  
						 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						 ( "CD_FOLIO"."NUMERO" = :ll_numero ) )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###')+" existe en Control Documentario - Estado "+string(ll_estado)+'-'+ls_descrip)
				else
					messagebox("Advertencia","No Existe en Control Documnetario Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,##0'))
//					dw_ingreso.setitem(1,'base',ls_nulo)
//					dw_ingreso.setitem(1,'serie',ls_nulo)
					dw_ingreso.setitem(1,'numero',ll_nulo)
					dw_ingreso.accepttext()
				end if
			end if
		end if
	end if
end if
end event

event itemfocuschanged;Date		ld_fecha_asigna,ldt_fecha_tope,ld_fecha,ld_nulo
String	ls_columna,ls_base,ls_serie,ls_estado_gestion,ls_nulo
Long		ll_row,ll_numero,ll_estado,ll_nulo

this.accepttext()
ls_columna			= dwo.name
Setnull(ld_nulo);Setnull(ll_nulo);Setnull(ls_nulo)
ll_row				= w_ingreso_individual_ugn.dw_lista.getrow()
ld_fecha				= Date(dw_ingreso.getitemdatetime(1,'fecha_prox_llamado'))
ld_fecha_asigna	= date(w_ingreso_individual_ugn.dw_lista.getitemdatetime(ll_row,'ugn_cliente_asignar_falle_fecha_ingreso'))
if not isnull(ld_fecha) then
	ldt_fecha_tope	= RelativeDate(ld_fecha_asigna, 15)
	if ld_fecha > ldt_fecha_tope then
		dw_ingreso.setitem(1,'fecha_prox_llamado',ld_nulo)
		dw_ingreso.accepttext()
	end if
end if
if ls_columna<>'base' and ls_columna<>'serie' and ls_columna<>'numero' and dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then
	ls_base				= dw_ingreso.getitemstring(1,'base')
	ls_serie				= dw_ingreso.getitemstring(1,'serie')
	ll_numero			= dw_ingreso.getitemnumber(1,'numero')
	ls_estado_gestion	= trim(dw_ingreso.getitemstring(1,'estado_gestion'))
	if ll_numero > 0 and not isnull(ls_base) and not isnull(ls_serie) then
		SELECT	"CD_FOLIO"."ULT_ESTADO"
		INTO 		:ll_estado
		FROM		"CD_FOLIO",	"CD_ESTADO"  
		WHERE  ( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and  
				 (("CD_FOLIO"."BASE" = :ls_base ) AND  
				 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_numero ) )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
//			dw_ingreso.setitem(1,'base',ls_nulo)
//			dw_ingreso.setitem(1,'serie',ls_nulo)
			dw_ingreso.setitem(1,'numero',ll_nulo)
			dw_ingreso.accepttext()
		end if
	end if
end if
end event

event clicked;String	ls_columna,ls_fecha,ls_estado
Date		ld_fecha_hoy

ls_estado		= dw_ingreso.getitemstring(1,'estado_gestion')
if not isnull(ls_estado) then
	ld_fecha_hoy	= date(gdt_fec_sistema)
	ls_columna		= dwo.name
	if ls_columna='p_1' then
		ls_fecha					= string(date(dw_ingreso.getitemdatetime(1,'fecha_prox_llamado')))
		if isnull(ls_fecha) then ls_fecha = string(ld_fecha_hoy,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso.setitem(1,'fecha_prox_llamado',datetime(string(ld_fecha_hoy,gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso.setitem(1,'fecha_prox_llamado',date(ls_fecha))
		END IF
		dw_ingreso.setfocus()
		dw_ingreso.setcolumn('fecha_prox_llamado')
	end if
end if
end event

event constructor;if dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then	//dw_ingreso_gestion_supervisor_ugn
	dw_ingreso.getchild('serie',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.insertrow(0)
end if
end event

type dw_cliente2 from datawindow within tabpage_4
integer x = 14
integer y = 8
integer width = 2473
integer height = 360
integer taborder = 20
string title = "none"
string dataobject = "dw_antecedentes_cliente_ugn_titulo"
boolean border = false
boolean livescroll = true
end type

type dw_ultima_cobranza_telefonica from datawindow within tabpage_4
integer x = 9
integer y = 364
integer width = 2469
integer height = 540
integer taborder = 40
string title = "none"
string dataobject = "dw_ultima_cobranza_ugn"
boolean border = false
boolean livescroll = true
end type

type cb_grabar from commandbutton within tabpage_4
integer x = 18
integer y = 1820
integer width = 1225
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Grabar"
end type

event clicked;long		ll_ret,ll_tot_reg,ll_indi,ll_rut,ll_nro_grupo,ll_sum_reg,ll_count_reg,ll_row,ll_grupo,ll_correlativo,ll_grupo_asignado,ll_nota_mc,ll_nota_serv,&
			ll_nota_1,ll_nota_2
String		ls_glosa,ls_estado,ls_estado_tele='19',ls_glosa_tele,ls_string,ls_estado_reg
Datetime	ldt_fecha,ldt_fecha_prox

dw_ingreso.accepttext()
ls_estado		= trim(dw_ingreso.getitemstring(1,'estado_gestion'))
ls_glosa			= trim(dw_ingreso.getitemstring(1,'glosa_gestion'))
ldt_fecha_prox	= dw_ingreso.getitemdatetime(1,'fecha_prox_llamado')
ldt_fecha			= dw_ingreso.getitemdatetime(1,'fecha_gestion')
ll_nota_serv		= dw_encuesta.getitemnumber(1,'nota_servicio')
ll_nota_mc		= dw_encuesta.getitemnumber(1,'nota_maestro_c')
if not isnull(ls_estado) and not isnull(ls_glosa)and not isnull(ldt_fecha_prox) then
	ll_ret 		= messagebox('Actulizar','Desea actualizar los datos',Question!,YesNo!,2)
	if ll_ret = 1 then
		SELECT	sysdate
		INTO 		:gdt_fec_sistema
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING		sqlca;
		if isvalid(w_ingreso_individual_ugn) then
			ll_row		= w_ingreso_individual_ugn.dw_lista.getrow()
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_prox_llamado_cob',ldt_fecha_prox)
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_ult_estado_gestion',ls_estado)
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_ult_fecha_gestion',ldt_fecha)
			w_ingreso_individual_ugn.dw_lista.setitem(ll_row,'ugn_cliente_ult_glosa_gestion',ls_glosa)
			w_ingreso_individual_ugn.dw_lista.accepttext()
			ll_grupo				= w_ingreso_individual_ugn.dw_lista.getitemnumber(w_ingreso_individual_ugn.dw_lista.getrow(),'ugn_cliente_grupo')
			ll_correlativo		= w_ingreso_individual_ugn.dw_lista.getitemnumber(w_ingreso_individual_ugn.dw_lista.getrow(),'ugn_cliente_correlativo')
			UPDATE	"UGN_CLIENTE"  
			SET 		"ULT_ESTADO_GESTION" = :ls_estado,   
						"ULT_FECHA_GESTION" = :ldt_fecha,   
						"ULT_GLOSA_GESTION" = :ls_glosa,   
						"PROX_LLAMADO_COB" = :ldt_fecha_prox  
			WHERE  ( "UGN_CLIENTE"."GRUPO" = :ll_grupo ) AND  
					 ( "UGN_CLIENTE"."CORRELATIVO" = :ll_correlativo )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				if dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then // UGN
					dw_ingreso.setitem(1,'grupo',ll_grupo)				
				elseif dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then //dw_ingreso_gestion_ejecutivo_ugn
					dw_ingreso.setitem(1,'grupo',ll_grupo)
					SELECT DISTINCT "UGN_EJECUTIVO_DETALLE"."GRUPO"  
					INTO 	 	:ll_grupo_asignado  
					FROM 	 "UGN_EJECUTIVO_DETALLE"  
					WHERE	 ( "UGN_EJECUTIVO_DETALLE"."GRUPO_CLIENTE" = :ll_grupo ) AND  
								 ( "UGN_EJECUTIVO_DETALLE"."CORRELATIVO_CLIENTE" = :ll_correlativo )// AND  
					//			 ( "UGN_EJECUTIVO_DETALLE"."ESTADO_GESTION" = '0' )   
					USING  sqlca;
					if sqlca.sqlcode = 0 then
						dw_ingreso.setitem(1,'grupo_asignacion',ll_grupo_asignado)
					else
						rollback;
					//	messagebox("Advertencia","Error Grabar Lista Gestión SQL:  "+sqlca.sqlerrtext)
					end if	
				end if
				dw_ingreso.accepttext()
				if dw_ingreso.update() = 1 then
					commit;
					//if dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then
					if dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then
						ls_estado_reg	= 'J'
						ll_nota_serv		= dw_encuesta.getitemnumber(1,'nota_servicio')
						ll_nota_mc		= dw_encuesta.getitemnumber(1,'nota_maestro_c')
						SELECT	"UGN_ENCUESTA_SERVICIO"."NOTA_SERVICIO",   
									"UGN_ENCUESTA_SERVICIO"."NOTA_MAESTRO_C"  
						INTO 		:ll_nota_1,:ll_nota_2  
						FROM 	"UGN_ENCUESTA_SERVICIO"  
						WHERE 	( "UGN_ENCUESTA_SERVICIO"."GRUPO" = :ll_grupo ) AND  
									( "UGN_ENCUESTA_SERVICIO"."CORRELATIVO" = :ll_correlativo )
						USING	sqlca;

						if (not isnull(ll_nota_serv) or not isnull(ll_nota_mc))and isnull(ll_nota_1) and isnull(ll_nota_2) then
							messagebox('Advertencia','No se Ingreso Datos de Encuesta')
						elseif ll_nota_1 > 0 and ll_nota_2 > 0 then
							messagebox('Advertencia','Datos de Encuesta Ya Ingresados')
						else
							if ll_nota_serv > 0 and ll_nota_mc > 0 then
								INSERT INTO "UGN_ENCUESTA_SERVICIO"  
											( "NOTA_SERVICIO", "NOTA_MAESTRO_C","DESCRIPCION_NOTA","GRUPO","CORRELATIVO" )  
								VALUES 	( :ll_nota_serv,:ll_nota_mc,null,:ll_grupo, :ll_correlativo )  
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
									messagebox('Error Grabar','Error al Actualizar UGN_ENCUESTA SQL: '+sqlca.SQLErrText,information!)
								end if
							end if
						end if
					//elseif dw_ingreso.dataobject='dw_ingreso_gestion_ejecutivo_ugn' then
					elseif dw_ingreso.dataobject='dw_ingreso_gestion_supervisor_ugn' then
						ls_estado_reg	= 'G'
					end if
					UPDATE	"UGN_CLIENTE"  
					SET 		"ESTADO_REGISTRO" = :ls_estado_reg  
					WHERE  ( "UGN_CLIENTE"."GRUPO" = :ll_grupo ) AND  
							 ( "UGN_CLIENTE"."CORRELATIVO" = :ll_correlativo )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox('Error Grabar','Error al Actualizar UGN_CLIENTE SQL: '+sqlca.SQLErrText,information!)
					end if
					messagebox("Grabar","Grabación Exitosa")
					if isvalid(w_ingreso_individual_ugn) then
						w_ingreso_individual_ugn.tab_cobranza.visible						= false
					end if
				else
				//	messagebox('Error Grabar','Error al Grabar Detalle_Gestión SQL: '+sqlca.SQLErrText,information!)
					ROLLBACK;
				end if
			else
				rollback;
			//	messagebox("Advertencia","Error Grabar Lista Gestión SQL:  "+sqlca.sqlerrtext)
			end if
		end if
	end if
else
	messagebox("Advertencia","Debe Ingresar Datos")
	dw_ingreso.setfocus()
end if
end event

type cb_cerrar_4 from commandbutton within tabpage_4
integer x = 1248
integer y = 1820
integer width = 1216
integer height = 104
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type tabpage_5 from userobject within uo_ugn_gestion
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2510
integer height = 1944
long backcolor = 67108864
string text = "Cotización"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_email dw_email
dw_cotiz_imprime dw_cotiz_imprime
cb_crea_archivo cb_crea_archivo
cb_grabar_cotizacion cb_grabar_cotizacion
cb_cerrar_5 cb_cerrar_5
dw_cotizacion_agente dw_cotizacion_agente
dw_cotizacion dw_cotizacion
end type

on tabpage_5.create
this.dw_email=create dw_email
this.dw_cotiz_imprime=create dw_cotiz_imprime
this.cb_crea_archivo=create cb_crea_archivo
this.cb_grabar_cotizacion=create cb_grabar_cotizacion
this.cb_cerrar_5=create cb_cerrar_5
this.dw_cotizacion_agente=create dw_cotizacion_agente
this.dw_cotizacion=create dw_cotizacion
this.Control[]={this.dw_email,&
this.dw_cotiz_imprime,&
this.cb_crea_archivo,&
this.cb_grabar_cotizacion,&
this.cb_cerrar_5,&
this.dw_cotizacion_agente,&
this.dw_cotizacion}
end on

on tabpage_5.destroy
destroy(this.dw_email)
destroy(this.dw_cotiz_imprime)
destroy(this.cb_crea_archivo)
destroy(this.cb_grabar_cotizacion)
destroy(this.cb_cerrar_5)
destroy(this.dw_cotizacion_agente)
destroy(this.dw_cotizacion)
end on

type dw_email from datawindow within tabpage_5
boolean visible = false
integer x = 1042
integer y = 1940
integer width = 1184
integer height = 236
integer taborder = 50
string title = "none"
string dataobject = "dwe_email"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cotiz_imprime from datawindow within tabpage_5
integer x = 434
integer y = 1944
integer width = 539
integer height = 224
integer taborder = 50
string title = "none"
string dataobject = "dw_cotiz_imprime"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_crea_archivo from commandbutton within tabpage_5
boolean visible = false
integer x = 18
integer y = 1948
integer width = 379
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crea archivo"
end type

event clicked;string	ls_nom_archivo
long	ll_res,ll_dia,ll_mes,ll_ano,ll_folio


ll_dia													= day(date(gdt_fec_sistema))
ll_mes												= month(date(gdt_fec_sistema))
ll_ano													= year(date(gdt_fec_sistema))
is_ruta												= 'c:\cotizacion\'	
is_nombre											= string(il_count)+'_cotizacion_nuevos_canales_'+string(ll_dia,'00')+string(ll_mes,'00')+string(ll_ano,'00')
is_extension											= '.pdf'
ls_nom_archivo										= is_ruta+is_nombre+is_extension
SetPointer(HourGlass!)
if FileExists(ls_nom_archivo) = true then
	if	messagebox('Archivo Existente','Desea Reemplazar el Archivo de Respaldado '+ls_nom_archivo, information!, OKCancel!, 2) = 1 then
		FileDelete(ls_nom_archivo)
		ll_res											= dw_cotiz_imprime.SaveAs(ls_nom_archivo, PDF!, true)
		if ll_res = 1 then
			messagebox('Archivo PDF','Archivo respaldado en '+ls_nom_archivo, information!)
		else
			messagebox('Error','Archivo PDF NO Respaldado', information!)
		end if
	else
		ll_res 											= dw_cotiz_imprime.SaveAs(ls_nom_archivo, PDF!, true)	
		if ll_res = 1 then
			messagebox('Archivo PDF','Archivo respaldado en '+ls_nom_archivo, information!)
		else
			messagebox('Error','Archivo PDF No Respaldado', information!)
		end if
	end if	
else
	dw_cotiz_imprime.Object.DataWindow.Export.PDF.Method = Distill! 
//	dw_cotiz_imprime.Object.DataWindow.Printer = "Sybase DataWindow PS" 
	dw_cotiz_imprime.Object.DataWindow.Printer = "PDF"
	//dw_cotiz_imprime.Object.DataWindow.Printer = "Acrobat Distiller" 
	dw_cotiz_imprime.Object.DataWindow.Export.PDF.Distill.CustomPostScript="Yes" 
	ll_res												= dw_cotiz_imprime.SaveAs(ls_nom_archivo, PDF!, TRUE)
	
	
	if ll_res = 1 then
		messagebox('Archivo PDF','Archivo respaldado en '+ls_nom_archivo, information!)
	else
		messagebox('Error','Archivo PDF No Respaldado', information!)
	end if
end if
SetPointer(Arrow!)

end event

type cb_grabar_cotizacion from commandbutton within tabpage_5
integer x = 14
integer y = 1804
integer width = 1216
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Grabar pdf"
end type

event clicked;string 	ls_pasa='S',ls_nombre,ls_pater,ls_mater,ls_dv,ls_fono,ls_moneda,ls_sector,ls_tipo_sepul,ls_fono_ejec,ls_cod_age,ls_email_age,&
			ls_email_user,ls_email_jef,ls_asunto,ls_mensaje,ls_res,ls_nom_cotiz,ls_nom_age,ls_email,ls_pasa2='S',ls_nulo,ls_file,ls_file_directory
long		ll_cod_parque,ll_rut,ll_capac,ll_ret,ll_tot_reg,ll_indi,ll_pos,ll_new,ll_largo,ll_tot_reg2,ll_nulo
datetime	ldt_fecha
mailFileDescription		mAttach

dw_cotizacion.accepttext()
setnull(ls_nulo);setnull(ll_nulo)
ll_cod_parque			= dw_cotizacion.GetItemnumber(1,'cod_parque')
ls_nombre				= dw_cotizacion.GetItemString(1,'nombre_cotizante')
ls_pater					= dw_cotizacion.GetItemString(1,'ap_paterno_cotizante')
ls_mater					= dw_cotizacion.GetItemString(1,'ap_materno_cotizante')
ll_rut						= dw_cotizacion.GetItemNumber(1,'rut_cotizante')
ls_dv						= dw_cotizacion.GetItemString(1,'dv_cotizante')
ls_fono					= dw_cotizacion.GetItemString(1,'fono_cotizante')
ls_moneda				= dw_cotizacion.GetItemString(1,'moneda')
ls_sector					= dw_cotizacion.GetItemString(1,'sector')
ll_capac					= dw_cotizacion.GetItemNumber(1,'capacidad')
ls_tipo_sepul			= dw_cotizacion.GetItemString(1,'tipo_sepultura')
ls_fono_ejec			= dw_cotizacion.GetItemString(1,'fono_ejecutivo')
ldt_fecha					= dw_cotizacion.GetItemDatetime(1,'fecha')
ls_cod_age				= dw_cotizacion.GetItemstring(1,'cod_agente')
ls_email_age			= dw_cotizacion.GetItemstring(1,'mail')
if isnull(ll_cod_parque) or ll_cod_parque = 0 then
	messagebox('Advertencia','Debe Seleccionar Parque')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('cod_parque')
	ls_pasa				= 'N'
elseif isnull(ls_nombre) or ls_nombre='' then
	messagebox('Advertencia','Debe Ingresar NOMBRE COTIZANTE')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('nombre_cotizante')
	ls_pasa			= 'N'
elseif isnull(ls_pater) or ls_pater='' then
	messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO COTIZANTE')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('nombre_cotizante')
	ls_pasa			= 'N'
elseif isnull(ls_mater) or ls_mater='' then
	messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO COTIZANTE')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('nombre_cotizante')
	ls_pasa			= 'N'
elseif isnull(ll_rut) or ll_rut=0 then
	messagebox('Advertencia','Debe Ingresar RUT COTIZANTE')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('rut_cotizante')
	ls_pasa			= 'N'		
elseif isnull(ls_dv) or ls_dv='' then
	messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR COTIZANTE')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('dv_cotizante')
	ls_pasa		= 'N'
elseif isnull(ls_fono) or ls_fono='' then
	messagebox('Advertencia','Debe Ingresar FONO COTIZANTE')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('fono_cotizante')
	ls_pasa		= 'N'	
elseif isnull(ls_fono_ejec) or ls_fono_ejec='' then
	messagebox('Advertencia','Debe Ingresar FONO EJECUTIVO')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('fono_ejecutivo')
	ls_pasa		= 'N'
elseif isnull(ldt_fecha) then
	messagebox('Advertencia','Debe Ingresar FECHA')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('fecha')
	ls_pasa		= 'N'
elseif isnull(ls_cod_age) or ls_cod_age='' then
	messagebox('Advertencia','Debe Ingresar AGENTE VENTAS')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('cod_agente')
	ls_pasa		= 'N'	
elseif isnull(ls_email_age) or ls_email_age='' then
	messagebox('Advertencia','Debe Ingresar EMAIL AGENTE VENTAS')
	dw_cotizacion.setfocus()
	dw_cotizacion.setcolumn('mail')
	ls_pasa		= 'N'	
//elseif isnull(ls_moneda) or ls_moneda='' then
//	messagebox('Advertencia','Debe Ingresar MONEDA')
//	dw_cotizacion.setfocus()
//	dw_cotizacion.setcolumn('fono_cotizante')
//	ls_pasa		= 'S'
//elseif isnull(ls_sector) or ls_sector='' then
//	messagebox('Advertencia','Debe Ingresar SECTOR SEPULTURA')
//	dw_cotizacion.setfocus()
//	dw_cotizacion.setcolumn('sector')
//	ls_pasa		= 'S'	
//elseif isnull(ll_capac) or ll_capac=0 then
//	messagebox('Advertencia','Debe Ingresar CAPACIDAD SEPULTURA')
//	dw_cotizacion.setfocus()
//	dw_cotizacion.setcolumn('capacidad')
//	ls_pasa		= 'S'
//elseif isnull(ls_tipo_sepul) or ls_tipo_sepul='' then
//	messagebox('Advertencia','Debe Ingresar TIPO SEPULTURA')
//	dw_cotizacion.setfocus()
//	dw_cotizacion.setcolumn('tipo_sepultura')
//	ls_pasa		= 'S'
end if
if ls_pasa='S' then
	dw_cotizacion.setitem(1,'nombre_cotizante',ls_nombre)
	dw_cotizacion.setitem(1,'ap_paterno_cotizante',ls_pater)
	dw_cotizacion.setitem(1,'ap_materno_cotizante',ls_mater)
	dw_cotizacion.setitem(1,'rut_cotizante',ll_rut)
	dw_cotizacion.setitem(1,'dv_cotizante',ls_dv)
	dw_cotizacion.setitem(1,'fono_cotizante',ls_fono)
	dw_cotizacion.setitem(1,'moneda',ls_moneda)
	dw_cotizacion.setitem(1,'sector',ls_sector)
	dw_cotizacion.setitem(1,'capacidad',ll_capac)
	dw_cotizacion.setitem(1,'tipo_sepultura',ls_tipo_sepul)
	dw_cotizacion.setitem(1,'fono_ejecutivo',ls_fono_ejec)
	SELECT	MAX("COTIZACIONES"."CORRELATIVO_INTERNO")  
	INTO 		:il_count  
	FROM 	"COTIZACIONES"  
	USING	sqlca;
	if il_count=0 or isnull(il_count) then
		il_count	= 1
	else
		il_count ++
	end if
	dw_cotizacion.setitem(1,'correlativo_interno',il_count)
	ll_ret																= MessageBox('Actualizar', "Desea Grabar Ficha De Cotización", Question!, YesNo!, 2)
	if ll_ret = 1 then
		DO WHILE ls_pasa2='S'
			ll_pos                           								= POS (ls_email_age,';')
			ll_largo													= Len(ls_email_age) 
			if ll_pos>0 then
				ls_email		                							= trim(mid(ls_email_age,1,( ll_pos - 1)))
				if not isnull(ls_email) then
					ll_new											= dw_email.insertrow(0)
					dw_email.scrolltorow(ll_new)
					dw_email.setitem(ll_new,"email",ls_email)
					dw_email.accepttext()
					ls_email_age									= trim(mid(ls_email_age,(ll_pos+1),ll_largo))
					ll_largo											= Len(ls_email_age)
					if ll_largo>0 then
						ls_pasa2										= 'S'
					else
						ls_pasa2										= 'N'
						ls_email_age								= ls_nulo
					end if
				end if
			else
				if ll_largo>0 then
					ls_email		                						= trim(ls_email_age)
					ls_pasa2											= 'N'
					ll_new											= dw_email.insertrow(0)
					dw_email.scrolltorow(ll_new)
					dw_email.setitem(ll_new,"email",ls_email)
					dw_email.accepttext()
				end if
			end if
		LOOP
		SELECT	"ENCARGADOS_A"."EMAIL","ENCARGADOS_B"."EMAIL","AGENTES"."NOMBRE"||' '|| "AGENTES"."A_PATERNO"||' '||"AGENTES"."A_MATERNO"
		INTO		:ls_email_user,:ls_email_jef,:ls_nom_cotiz
		FROM		"AGENTES","SUPERVISOR","JEFE_VENTAS",
					"ENCARGADOS" "ENCARGADOS_A",
					"ENCARGADOS" "ENCARGADOS_B"   
		WHERE	"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" AND
					"SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" AND
					"AGENTES"."COD_AGE" = "ENCARGADOS_A"."CODIGO_USUARIO" AND
					"JEFE_VENTAS"."JEFE_VENTAS" = "ENCARGADOS_B"."CODIGO_USUARIO" AND
					"AGENTES"."COD_AGE" = :gs_user 
		USING	sqlca;
		if isnull(ls_email_user) then ls_email_user=''
		if isnull(ls_email_jef) then ls_email_jef=''
		
		if not isnull(ls_email_jef) and not isnull(ls_email_jef) then
			ll_new											= dw_email.insertrow(0)
			dw_email.scrolltorow(ll_new)
			dw_email.setitem(ll_new,"email",ls_email_jef)
			dw_email.accepttext()
		end if 
		SELECT	"NOMBRE"||' '|| "A_PATERNO" ||' '|| "A_MATERNO"  
    		INTO		:ls_nom_age
    		FROM		"AGENTES"  
   		WHERE	"AGENTES"."COD_AGE" = :ls_cod_age
		USING	sqlca;
		if ls_pasa='S' then
			ls_asunto												= 'Cotización '+string(il_count)+ ' Realizada por ejecutivo :'+ls_nom_cotiz
			ls_mensaje												= 'Cotización realizada a :'+ls_nombre+' '+ls_pater+' '+ls_mater+' rut: '+string(ll_rut)+'-'+ls_dv+'	Ejecutivo cotizador: '+ls_nom_cotiz+'  Ejecutivo atención: '+ls_nom_age+' Fecha: '+string(gdt_fec_sistema)
			if dw_cotizacion.update()=1 then
				commit;
				ll_tot_reg											= dw_cotiz_imprime.retrieve(il_count)
				if ll_tot_reg>0 then
					dw_cotiz_imprime.object.usuario.text		= gs_user
					cb_crea_archivo.triggerevent(clicked!)
//					mailsession mses
//					mailreturncode mret
//					mailmessage mmsg
//					mses													= create mailsession
//					mret													= mses.maillogon(mailnewsession!)
//					if mret <> mailReturnSuccess! then
//						return
//					end if
//					ll_tot_reg2											= dw_email.rowcount()
//					for ll_indi=1 to ll_tot_reg2
//						ls_email											= dw_email.getitemstring(ll_indi,'email')
//						mmsg.recipient[ll_indi].name				= ls_email
//					next
//					mmsg.notetext										= ls_mensaje
//					
//					//ls_file													= 'cotizacion_unidad_nuevos_canales.pdf'
//					//ls_file_directory									=	'C:\'+ls_file
//					ls_file													= is_nombre+is_extension
//					ls_file_directory									= is_ruta+ls_file
//					
//					mAttach.FileType 									= mailAttach!
//					mAttach.PathName 								= ls_file_directory
//					mAttach.FileName 								= ls_file
//					mmsg.subject										= ls_asunto
//					
//					mAttach.Position 									= len(mMsg.notetext) - 1	
//					mMsg.AttachmentFile[1] 						= mAttach
//					
//					mses.mailsend(mmsg)
//					if mret <> mailreturnsuccess! then
//						return
//					end if
//					mses.maillogoff()
//					destroy mses
					
					SELECT	sysdate
					INTO 		:gdt_fec_sistema
					FROM 	"TASA"  ;
					if len(ls_asunto) > 1500 then ls_asunto=mid(ls_asunto,1,1500)
					ls_mensaje						= 'MENSAJE ENVIADO: '+ls_mensaje
					if len(ls_mensaje) > 1500 then ls_mensaje=mid(ls_mensaje,1,1500)
					
					messagebox("Grabar","Grabación Exitosa")
					is_ruta												= ls_nulo
					is_nombre											= ls_nulo
					is_extension											= ls_nulo
					il_count												= ll_nulo
					cb_cerrar_5.triggerevent(clicked!)
//					dw_cotizacion.reset()
//					dw_cotizacion.InsertRow(0)
				else
					messagebox("Advertencia","No Registra Cotización Folio: "+string(il_count,'###,###,##0'))
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Ficha De Cotización SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
end event

type cb_cerrar_5 from commandbutton within tabpage_5
integer x = 1248
integer y = 1804
integer width = 1216
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string text = "&Cerrar"
end type

event clicked;if isvalid(w_ingreso_individual_ugn) then
	w_ingreso_individual_ugn.tab_cobranza.visible						= false
end if
end event

type dw_cotizacion_agente from datawindow within tabpage_5
integer x = 14
integer y = 1232
integer width = 1559
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dwe_cotizacion_lista_age"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string		ls_cod_age,ls_fono,ls_fonoc,ls_celular,ls_email

dw_cotizacion_agente.accepttext()
ls_cod_age					= dw_cotizacion_agente.getitemstring(1,'')
SELECT 	"FONO",	"FONO_COMERCIAL",	"CELULAR",	"EMAIL"
INTO 		:ls_fono,	:ls_fonoc,				:ls_celular,	:ls_email
FROM 	"UGN_COTIZACION_AGENTE"
WHERE 	"UGN_COTIZACION_AGENTE"."COD_AGENTE" = :ls_cod_age;

if not isnull(ls_cod_age) and ls_cod_age <> '' then
	dw_cotizacion.setitem(1,'cod_ejecutivo',gs_user)
	dw_cotizacion.setitem(1,'fono_ejecutivo',ls_fono)
	dw_cotizacion.setitem(1,'celular_ejecutivo',ls_celular)
	dw_cotizacion.setitem(1,'mail',ls_email)
	dw_cotizacion.setitem(1,'cod_agente',ls_cod_age)
end if
dw_cotizacion.accepttext()
end event

type dw_cotizacion from datawindow within tabpage_5
integer y = 32
integer width = 2482
integer height = 1768
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_cotizacion_ugn"
boolean border = false
end type

event clicked;String	ls_estado,ls_columna,ls_fecha
Datetime	ldt_fecha_fall

ls_columna	= dwo.name
if ls_columna = 'p_1' then
	ls_fecha	= string(date(dw_cotizacion.getitemdatetime(dw_cotizacion.getrow(),'fecha')))
	if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_cotizacion.setitem(dw_cotizacion.getrow(),'fecha',datetime(string(today(),gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha				= trim(Message.StringParm)
		dw_cotizacion.setitem(dw_cotizacion.getrow(),'fecha',date(ls_fecha))
	END IF
end if
end event

event itemchanged;datetime	ldt_fecha_hoy,ldt_fecha
double   	ldb_valor_uf_dia,ldb_valor,ldb_derecho,ldb_mant,ldb_lib,ldb_pie_min,ldb_factor_cta,ldb_factor_gto,&
			ldb_gasto,ldb_cuota,ldb_val_cuota,ldb_uf_dia,ldb_descuento
string   	ls_nombre,ls_columna,ls_dv,ls_sector,ls_tipo_sepultura,ls_uso,ls_nombre_cotizante,ls_ap_pat_cotizante,&
			ls_ap_mat_cotizante,ls_rut,ls_moneda,ls_nulo,ls_ejecutivo,ls_fono_cotizante,ls_tipo_sepult
long     	ll_new,ll_rut,ll_capacidad,ll_parque,ll_valor_uso_ni,ll_reduc,ll_plazo,ll_cuota,ll_nulo,ll_count,ll_res,&
			ll_count_cot,ll_cod_parque,ll_cta_max_plazo

dw_cotizacion.accepttext()
ls_columna									= dwo.name  
Setnull(ll_nulo);setnull(ls_nulo)
if ls_columna = 'cod_parque' then
	ll_cod_parque							= dw_cotizacion.getitemnumber(1,'cod_parque')
	dw_cotizacion.getchild('sector',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.retrieve(ll_cod_parque)
	dw_cotizacion.getchild('capacidad',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.insertrow(0)
	dw_cotizacion.getchild('tipo_sepultura',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	idw_detalle5.insertrow(0)
	dw_cotizacion.getchild('uso',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.insertrow(0)
	dw_cotizacion.getchild('numero_reducciones',idw_detalle7)
	idw_detalle7.settransobject(sqlca)
	idw_detalle7.insertrow(0)
	dw_cotizacion.setitem(1,'sector',ls_nulo)
	dw_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_cotizacion.setitem(1,'uso',ls_nulo)
	dw_cotizacion.setitem(1,'numero_reducciones',ll_nulo)
	dw_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	//dw_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	//dw_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
	dw_cotizacion.accepttext()
end if
if ls_columna = 'rut_cotizante' then
	ll_rut										= long(data)
	if not isnull(ll_rut) and ll_rut >0 then
		ldt_fecha_hoy						= datetime(date(gdt_fec_sistema),time('00:00:00'))
		SELECT	Count("COTIZACIONES"."COD_EJECUTIVO")   
		INTO		:ll_count_cot
		FROM 	"COTIZACIONES"  
		WHERE 	"COTIZACIONES"."RUT_COTIZANTE" = :ll_rut   
		USING	sqlca;
		if ll_count_cot>0 then
			ll_res								= messagebox("Advertencia","Existe(n) "+string(ll_count_cot)+" Cotizacion(es) Para este Rut, desea Ver Detalle",Exclamation!,YesNo!,2)
			if ll_res=1 then
				OpenWithParm(w_cotizaciones_guardadas, string(ll_rut))
			end if
		end if
		SELECT	"TAB_UF"."VALOR_UF"
		INTO 		:ldb_valor_uf_dia
		FROM 	"TAB_UF"
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_cotizacion.setitem(dw_cotizacion.getrow(),'uf_dia',ldb_valor_uf_dia)
		end if
	end if
end if
if ls_columna='sector' then
	ll_cod_parque							= dw_cotizacion.getitemnumber(1,'cod_parque')
	if isnull(ll_cod_parque) or ll_cod_parque = 0 then
		messagebox('Advertencia','Falta Ingresar Parque',stopsign!)
		dw_cotizacion.setfocus()
		dw_cotizacion.setcolumn('cod_parque')
	end if	
	dw_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_cotizacion.setitem(1,'uso',ls_nulo)
	dw_cotizacion.setitem(1,'numero_reducciones',ll_nulo)
end if
if ls_columna='tipo_sepultura' then
	dw_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_cotizacion.setitem(1,'uso',ls_nulo)
	dw_cotizacion.setitem(1,'numero_reducciones',ll_nulo)
end if
if ls_columna='capacidad' then
	dw_cotizacion.setitem(1,'uso',ls_nulo)
	dw_cotizacion.setitem(1,'numero_reducciones',ll_nulo)
end if
if ls_columna='uso' then
	dw_cotizacion.setitem(1,'numero_reducciones',ll_nulo)
end if

if ls_columna='sector' or ls_columna='tipo_sepultura' or ls_columna='capacidad' or ls_columna='uso' then
	ll_cod_parque					= dw_cotizacion.getitemnumber(1,'cod_parque')
	ls_sector							= dw_cotizacion.getitemstring(1,'sector')
	ls_tipo_sepult					= dw_cotizacion.getitemstring(1,'tipo_sepultura')
	ll_capacidad						= dw_cotizacion.getitemnumber(1,'capacidad')
	ls_uso							= dw_cotizacion.getitemstring(1,'uso')
	if not isnull(ls_sector) and not isnull(ls_tipo_sepult) and ll_capacidad>0 and not isnull(ls_uso) then
		SELECT	"LISTA_PRECIO"."REDUCCION"  
		INTO		:ll_reduc
		FROM 	"LISTA_PRECIO"  
		WHERE	( "LISTA_PRECIO"."SECTOR" = :ls_sector ) AND  
					( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepult ) AND  
					( "LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad ) AND  
					( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque ) AND  
					( "LISTA_PRECIO"."CANAL" = :ls_uso )    
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_cotizacion.setitem(1,'numero_reducciones',ll_reduc)
		else
			dw_cotizacion.setitem(1,'numero_reducciones',ll_nulo)
		end if
	end if
end if
dw_cotizacion.accepttext()
if ls_columna='rut_cotizante' or ls_columna='dv_cotizante' then
	ll_rut								= dw_cotizacion.getitemnumber(dw_cotizacion.getrow(),'rut_cotizante')
	ls_dv								= dw_cotizacion.getitemstring(dw_cotizacion.getrow(),'dv_cotizante')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then 
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			dw_cotizacion.setfocus()
			dw_cotizacion.setcolumn('dv_cotizante')
			dw_cotizacion.setitem(1,'c_estado','N')
		else
			SELECT 	"NOMBRE",					"A_PATERNO",			"A_MATERNO",				"FONO_P"
			INTO 		:ls_nombre_cotizante,	:ls_ap_pat_cotizante,	:ls_ap_mat_cotizante,	:ls_fono_cotizante
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING	sqlca;
			if sqlca.sqlcode<>0 then
				SELECT distinct "NOMBRE_COTIZANTE",	"AP_PATERNO_COTIZANTE",	"AP_MATERNO_COTIZANTE",	"FONO_COTIZANTE"
				INTO 		:ls_nombre_cotizante,	:ls_ap_pat_cotizante,				:ls_ap_mat_cotizante,			:ls_fono_cotizante
				FROM 	"COTIZACIONES"  
				WHERE	"COTIZACIONES"."RUT_COTIZANTE" = :ll_rut
				USING 	sqlca;
			end if
			if sqlca.sqlcode=0 then
				this.setitem(1,'nombre_cotizante',ls_nombre_cotizante)   
				this.setitem(1,'ap_paterno_cotizante',ls_ap_pat_cotizante)   
				this.setitem(1,'ap_materno_cotizante',ls_ap_mat_cotizante)
				this.setitem(1,'fono_cotizante',ls_fono_cotizante)
				this.accepttext()
			end if
			this.setitem(1,'c_estado','S')
		end if 
	end if
end if
//if ls_columna='plazo' then
//	SELECT	MAX("NRO_CUOTAS")
//	INTO 		:ll_cta_max_plazo  
//	FROM 	"INTERES_CUOTAS";
//	ll_plazo							= dw_cotizacion.getitemnumber(1,'plazo')
//	ll_capacidad						= dw_cotizacion.getitemnumber(1,'capacidad')
//	if ll_capacidad=1 and ll_plazo>36 then
//		messagebox("Advertencia","Plazo NO debe ser Mayor a 36 Cuotas")
//	else
//		if ll_plazo>ll_cta_max_plazo then
//			messagebox("Advertencia","Error en Nº Cuotas Plazo, No debe ser Mayor a "+string(ll_cta_max_plazo))
//		end if
//	end if
//end if
if ls_columna='sector' or ls_columna='capacidad' or ls_columna='tipo_sepultura' or ls_columna='uso' then
	ll_parque							= dw_cotizacion.getitemnumber(1,'cod_parque')
	ls_sector  						= dw_cotizacion.getitemstring(1,'sector')
	if not isnull(ls_sector) and ls_sector<>'' then
		idw_detalle5.retrieve(ls_sector,ll_parque)
	//	dw_cotizacion.setitem(1,'dscto_uso_anticipado',0)
	end if
	ll_capacidad  					= dw_cotizacion.getitemNumber(1,'capacidad')
	ls_tipo_sepultura 				= dw_cotizacion.getitemstring(1,'tipo_sepultura')
	ls_uso							= dw_cotizacion.getitemstring(1,'uso')
	ls_nombre_cotizante			= dw_cotizacion.getItemString(1,'nombre_cotizante')
	ls_ap_pat_cotizante			= dw_cotizacion.getItemString(1,'ap_paterno_cotizante')
	ls_ap_mat_cotizante			= dw_cotizacion.getItemString(1,'ap_materno_cotizante')
	ls_moneda						= dw_cotizacion.getItemString(1,'moneda')
	ldb_uf_dia						= dw_cotizacion.getitemnumber(1,'uf_dia')
	//ll_plazo							= dw_cotizacion.getitemnumber(1,'plazo')
	idw_detalle4.retrieve(ls_sector,ls_tipo_sepultura,ll_parque)
	idw_detalle6.retrieve(ls_sector,ls_tipo_sepultura,ll_capacidad,ll_parque)
	idw_detalle7.retrieve(ls_sector,ls_tipo_sepultura,ll_capacidad,ll_parque,ls_uso)
	if not isnull(ls_sector) and ll_capacidad>0 and not isnull(ls_tipo_sepultura) and not isnull(ls_uso) then
		SELECT	"VALOR",		"DERECHO",		"MANTENCION",	"LIBERADOR",	"PIE_MINIMO",	"REDUCCION"  
		INTO 		:ldb_valor,	:ldb_derecho,	:ldb_mant,			:ldb_lib,			:ldb_pie_min,	:ll_reduc  
		FROM 	"LISTA_PRECIO"
		WHERE	( "LISTA_PRECIO"."SECTOR" = :ls_sector ) AND  
					( "LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad ) AND  
					( "LISTA_PRECIO"."CANAL" = :ls_uso ) AND  
					( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepultura ) AND  
					( "LISTA_PRECIO"."COD_PARQUE" = :ll_parque )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_uso='NI' then
				if ls_moneda='1' then
					dw_cotizacion.setitem(1,'valor_uso_ni',round(ldb_valor * ldb_uf_dia,0))
					dw_cotizacion.setitem(1,'pie_minimo_ni',round(ldb_pie_min * ldb_uf_dia,0))
				else
					dw_cotizacion.setitem(1,'valor_uso_ni',ldb_valor)
					dw_cotizacion.setitem(1,'pie_minimo_ni',ldb_pie_min)
				end if
			else
				if ls_moneda='1' then
					dw_cotizacion.setitem(1,'valor_uso_anticipado',round(ldb_valor * ldb_uf_dia,0))
					dw_cotizacion.setitem(1,'pie_minimo_nf',round(ldb_pie_min * ldb_uf_dia,0))
				else
					dw_cotizacion.setitem(1,'valor_uso_anticipado',ldb_valor)
					dw_cotizacion.setitem(1,'pie_minimo_nf',ldb_pie_min)
				end if
			end if
			dw_cotizacion.setitem(1,'valor_mantencion_anual',ldb_mant)
		end if
	end if	
end if
if ls_columna='moneda' then
	ls_moneda						= data
	ldb_uf_dia						= dw_cotizacion.getitemnumber(1,'uf_dia')
	if ldb_uf_dia>0 then
		if ls_moneda='1' then
			dw_cotizacion.setitem(1,'valor_uso_ni',round(dw_cotizacion.getitemnumber(1,'valor_uso_ni') * ldb_uf_dia,0))
			dw_cotizacion.setitem(1,'pie_minimo_ni',round(dw_cotizacion.getitemnumber(1,'pie_minimo_ni') * ldb_uf_dia,0))
		//	dw_cotizacion.setitem(1,'dscto_uso_anticipado',round(dw_cotizacion.getitemnumber(1,'dscto_uso_anticipado') * ldb_uf_dia,0))
			dw_cotizacion.setitem(1,'valor_uso_anticipado',round(dw_cotizacion.getitemnumber(1,'valor_uso_anticipado') * ldb_uf_dia,0))
			dw_cotizacion.setitem(1,'pie_minimo_nf',round(dw_cotizacion.getitemnumber(1,'pie_minimo_nf') * ldb_uf_dia,0))
		//	dw_cotizacion.setitem(1,'valor_cuota',round(dw_cotizacion.getitemnumber(1,'valor_cuota') * ldb_uf_dia,0))
		else
			dw_cotizacion.setitem(1,'valor_uso_ni',round(dw_cotizacion.getitemnumber(1,'valor_uso_ni') / ldb_uf_dia,4))
			dw_cotizacion.setitem(1,'pie_minimo_ni',round(dw_cotizacion.getitemnumber(1,'pie_minimo_ni') / ldb_uf_dia,4))
		//	dw_cotizacion.setitem(1,'dscto_uso_anticipado',round(dw_cotizacion.getitemnumber(1,'dscto_uso_anticipado') / ldb_uf_dia,4))
			dw_cotizacion.setitem(1,'valor_uso_anticipado',round(dw_cotizacion.getitemnumber(1,'valor_uso_anticipado') / ldb_uf_dia,4))
			dw_cotizacion.setitem(1,'pie_minimo_nf',round(dw_cotizacion.getitemnumber(1,'pie_minimo_nf') / ldb_uf_dia,4))
		//	dw_cotizacion.setitem(1,'valor_cuota',round(dw_cotizacion.getitemnumber(1,'valor_cuota') / ldb_uf_dia,4))
		end if
		dw_cotizacion.accepttext()
	else
		messagebox("Advertencia","Debe Ingresar UF Día")
	end if
end if

if /*ls_columna='plazo' or*/ ls_columna='valor_uso_ni' or ls_columna='uso' or ls_columna='pie_minimo_ni' or &
	ls_columna='valor_uso_anticipado' or ls_columna='pie_minimo_nf' /*or ls_columna ='dscto_uso_anticipado'*/ then
	//ll_plazo							= dw_cotizacion.getitemnumber(1,'plazo')
	ls_moneda						= dw_cotizacion.getitemstring(1,'moneda')
	if isnull(ls_moneda) or ls_moneda='' then
		messagebox("Advertencia","Debe Ingresar Tipo Moneda")
	else
//		if isnull(ll_plazo) then
//			ll_plazo					= 0
//		else
//			ll_plazo					= ll_plazo
//		end if
//		if ll_plazo>0 then
//			SELECT	MAX("INTERES_CUOTAS"."NRO_CUOTAS")
//			INTO 		:ll_cta_max_plazo
//			FROM 	"INTERES_CUOTAS";
//			
//			SELECT DISTINCT "FACTOR",	"FACTOR_GASTO_ADM"  
//			INTO		:ldb_factor_cta,		:ldb_factor_gto
//			FROM 	"FACTORES"  
//			WHERE  	( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL" ) AND
//						( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL" ) AND
//						( "FACTORES"."MONEDA" = :ls_moneda ) AND
//						( "FACTORES"."ESTADO_VIGENCIA" = 'V' ) AND
//						( "FACTORES"."BASE" = 'O' )
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				if ll_plazo > 17 then
//					ls_uso				= dw_cotizacion.getitemstring(1,'uso')
//					if ls_uso='NI' then
//						ldb_valor			= dw_cotizacion.getitemnumber(1,'valor_uso_ni')
//						ldb_pie_min		= dw_cotizacion.getitemnumber(1,'pie_minimo_ni')
//				//		ldb_descuento 	= dw_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
//					else
//						ldb_valor			= dw_cotizacion.getitemnumber(1,'valor_uso_anticipado')
//						ldb_pie_min		= dw_cotizacion.getitemnumber(1,'pie_minimo_nf')
//				//		ldb_descuento 	= dw_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
//					end if
//					if ls_moneda='1' then
//						ldb_gasto		= round(ll_plazo * ldb_factor_gto,0)
//						ldb_cuota		= ((ldb_valor - ldb_pie_min) - ldb_descuento) + ldb_gasto
//						ldb_val_cuota	= round(ldb_cuota * ldb_factor_cta,0)
//					else
//						ldb_gasto		= round(ll_plazo * ldb_factor_gto,4)
//						ldb_cuota		= ((ldb_valor - ldb_pie_min) - ldb_descuento) + ldb_gasto
//						ldb_val_cuota	= round(ldb_cuota * ldb_factor_cta,4)
//					end if
//					dw_cotizacion.setitem(1,'valor_cuota',ldb_val_cuota)
//					dw_cotizacion.accepttext()
//				elseif ll_plazo>0 and ll_plazo<18 then
//					ls_uso				= dw_cotizacion.getitemstring(1,'uso')
//					if ls_uso='NI' then
//						ldb_valor			= dw_cotizacion.getitemnumber(1,'valor_uso_ni')
//						ldb_pie_min		= dw_cotizacion.getitemnumber(1,'pie_minimo_ni')
//				//		ldb_descuento 	= dw_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
//					else
//						ldb_valor			= dw_cotizacion.getitemnumber(1,'valor_uso_anticipado')
//						ldb_pie_min		= dw_cotizacion.getitemnumber(1,'pie_minimo_nf')
//				//		ldb_descuento 	= dw_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
//					end if
//					if ls_moneda='1' then
//						ldb_cuota		= (ldb_valor - ldb_pie_min) - ldb_descuento
//						ldb_val_cuota	= round(ldb_cuota / ll_plazo,0)
//					else
//						ldb_cuota		= (ldb_valor - ldb_pie_min) - ldb_descuento
//						ldb_val_cuota	= round(ldb_cuota / ll_plazo,4)
//					end if
//					dw_cotizacion.setitem(1,'valor_cuota',ldb_val_cuota)
//					dw_cotizacion.accepttext()
//				end if
//			 end if
//		end if
	end if
end if
this.accepttext()
end event

event doubleclicked;string		ls_columna
long		ll_rut,ll_count_cot

ls_columna					= dwo.name  
if ls_columna = 'rut_cotizante' or ls_columna = 'nombre_cotizante' or ls_columna = 'ap_paterno_cotizante' or ls_columna = 'ap_materno_cotizante'  &
or	ls_columna = 'fono_cotizante' or ls_columna = 'rut_cotizante_t' or ls_columna = 'dv_cotizante' or ls_columna = 'fono_cotizante_t' &
or	ls_columna = 'nombre_cotizante_t' or ls_columna = 'ap_paterno_cotizante_t' or ls_columna = 'ap_materno_cotizante_t' then
	ll_rut						= dw_cotizacion.getitemnumber(getrow(),'rut_cotizante')
	if not isnull(ll_rut) and ll_rut >0 then
		SELECT	Count("COTIZACIONES"."COD_EJECUTIVO")   
		INTO		:ll_count_cot
		FROM 	"COTIZACIONES"  
		WHERE 	"COTIZACIONES"."RUT_COTIZANTE" = :ll_rut   
		USING	sqlca;
		if ll_count_cot>0 then
			OpenWithParm(w_cotizaciones_guardadas, string(ll_rut))
		end if
	end if
end if
end event

