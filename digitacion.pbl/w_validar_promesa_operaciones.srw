forward
global type w_validar_promesa_operaciones from window
end type
type cb_limpiar_producto from commandbutton within w_validar_promesa_operaciones
end type
type st_precio_vta from statictext within w_validar_promesa_operaciones
end type
type st_ver_tipo_servicio from statictext within w_validar_promesa_operaciones
end type
type cb_1 from commandbutton within w_validar_promesa_operaciones
end type
type cb_ingreso_benef from commandbutton within w_validar_promesa_operaciones
end type
type dw_clientes from datawindow within w_validar_promesa_operaciones
end type
type cb_ingresar from commandbutton within w_validar_promesa_operaciones
end type
type ddlb_serie from dropdownlistbox within w_validar_promesa_operaciones
end type
type cb_ctrol_doc from commandbutton within w_validar_promesa_operaciones
end type
type pb_producto from picturebutton within w_validar_promesa_operaciones
end type
type pb_benef from picturebutton within w_validar_promesa_operaciones
end type
type st_gestion_serv from statictext within w_validar_promesa_operaciones
end type
type cb_val_benef from commandbutton within w_validar_promesa_operaciones
end type
type st_ctacte from statictext within w_validar_promesa_operaciones
end type
type cb_help from commandbutton within w_validar_promesa_operaciones
end type
type cbx_tipo_rechazo from checkbox within w_validar_promesa_operaciones
end type
type cb_memo from commandbutton within w_validar_promesa_operaciones
end type
type cb_buscar from commandbutton within w_validar_promesa_operaciones
end type
type dw_print from datawindow within w_validar_promesa_operaciones
end type
type cb_print from commandbutton within w_validar_promesa_operaciones
end type
type em_numero from editmask within w_validar_promesa_operaciones
end type
type st_5 from statictext within w_validar_promesa_operaciones
end type
type st_4 from statictext within w_validar_promesa_operaciones
end type
type dw_base from datawindow within w_validar_promesa_operaciones
end type
type st_3 from statictext within w_validar_promesa_operaciones
end type
type em_dv from editmask within w_validar_promesa_operaciones
end type
type st_2 from statictext within w_validar_promesa_operaciones
end type
type em_rut from editmask within w_validar_promesa_operaciones
end type
type st_1 from statictext within w_validar_promesa_operaciones
end type
type cb_ver from commandbutton within w_validar_promesa_operaciones
end type
type cb_limpiar from commandbutton within w_validar_promesa_operaciones
end type
type dw_lista_rezagos from datawindow within w_validar_promesa_operaciones
end type
type cb_rechazar from commandbutton within w_validar_promesa_operaciones
end type
type cb_aceptar from commandbutton within w_validar_promesa_operaciones
end type
type cb_cerrar from commandbutton within w_validar_promesa_operaciones
end type
type dw_ctto_asoc from datawindow within w_validar_promesa_operaciones
end type
type gb_2 from groupbox within w_validar_promesa_operaciones
end type
type gb_3 from groupbox within w_validar_promesa_operaciones
end type
type dw_lista_obs from datawindow within w_validar_promesa_operaciones
end type
type dw_seguro from datawindow within w_validar_promesa_operaciones
end type
type dw_revision from datawindow within w_validar_promesa_operaciones
end type
end forward

global type w_validar_promesa_operaciones from window
integer width = 3401
integer height = 2780
boolean titlebar = true
string title = "Revisión de Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar_producto cb_limpiar_producto
st_precio_vta st_precio_vta
st_ver_tipo_servicio st_ver_tipo_servicio
cb_1 cb_1
cb_ingreso_benef cb_ingreso_benef
dw_clientes dw_clientes
cb_ingresar cb_ingresar
ddlb_serie ddlb_serie
cb_ctrol_doc cb_ctrol_doc
pb_producto pb_producto
pb_benef pb_benef
st_gestion_serv st_gestion_serv
cb_val_benef cb_val_benef
st_ctacte st_ctacte
cb_help cb_help
cbx_tipo_rechazo cbx_tipo_rechazo
cb_memo cb_memo
cb_buscar cb_buscar
dw_print dw_print
cb_print cb_print
em_numero em_numero
st_5 st_5
st_4 st_4
dw_base dw_base
st_3 st_3
em_dv em_dv
st_2 st_2
em_rut em_rut
st_1 st_1
cb_ver cb_ver
cb_limpiar cb_limpiar
dw_lista_rezagos dw_lista_rezagos
cb_rechazar cb_rechazar
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_ctto_asoc dw_ctto_asoc
gb_2 gb_2
gb_3 gb_3
dw_lista_obs dw_lista_obs
dw_seguro dw_seguro
dw_revision dw_revision
end type
global w_validar_promesa_operaciones w_validar_promesa_operaciones

type variables
String		is_cod_prod,is_base,is_serie,is_dv,is_nuevo,is_sw_pasa='S',is_limpiar='N',is_new_precio='N',is_new_calc='S',is_mod_precio='S',is_error_cod,&
			is_recordar_benef='N', is_noexiste_serv='S'
Long		il_rut,il_ult_estado,il_reg_obs=0,il_cod_parque,il_periodo_mant,il_tipo_cliente=1,il_modif=0,il_plazo,il_plazo_mod=0,il_estado,il_cod_seguro
Datetime	idt_nulo
Double	il_numero,idb_valor_cuota_calc
end variables

forward prototypes
public subroutine wf_limpiar_detalle ()
public subroutine wf_calcular_liberador ()
public subroutine wf_calcular_promesa ()
public subroutine wf_calcular (string as_base)
public subroutine wf_calcular_producto ()
public function double wf_valor_mant (string as_base, string as_serie, double al_numero)
protected subroutine wf_observ (string as_base, string as_serie, double al_numero, double adb_rut, string as_parametro, long al_cod_obs)
public function string wf_capacidad_total (string as_base, string as_serie, double adb_numero)
public subroutine wf_ddlb_serie (string as_base)
public subroutine wf_cliente_rut (double ldb_rut)
public subroutine wf_valida_producto (long al_rut, string as_base, string as_serie, long al_numero)
public subroutine wf_calcular_liberador_iva ()
end prototypes

public subroutine wf_limpiar_detalle ();Datetime	ldt_fecha,ldt_fecha_vig
Double	ldb_uf_dia,ll_numero
Long		ll_new,ll_rut,ll_tot_reg,ll_indi,ll_tot_rev
String		ls_base,ls_serie,ls_dv,ls_descrip,ls_cod_prod,ls_pasa

dw_base.accepttext()
ll_rut								= long(em_rut.text)
ls_dv								= trim(em_dv.text)
ls_base							= dw_base.getitemstring(1,'base')
ls_serie							= trim(ddlb_serie.text)
ll_numero						= Double(em_numero.text)
ls_pasa							= 'N'
if ls_base='O' or ls_base='U' or isnull(ls_base) then
	if ls_base='U' then
		gs_cod_prod				= 'CO'
	else
		gs_cod_prod				= 'SE'
	end if
	ls_pasa						= 'S'	
	dw_revision.dataobject	= 'dw_revision_contratos_promesa'
	dw_revision.settransobject(sqlca)
	dw_revision.getchild('area',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(il_cod_parque,gs_cod_prod)=0 then
		idw_detalle2.insertrow(0)
	end if
	
	dw_revision.getchild('tipo_producto',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	if idw_detalle4.retrieve(gs_cod_prod)=0 then
		idw_detalle4.insertrow(0)
	end if
	
	dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
	idw_detalle12.settransobject(sqlca)
	idw_detalle12.insertrow(0)
	
	ll_new						= dw_revision.insertrow(0)
	dw_revision.setitem(ll_new,'estado_revision','V')
	dw_revision.accepttext()
elseif ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' then
	ls_pasa						= 'S'	
	dw_revision.dataobject	= 'dw_revision_contratos_liberador'
	dw_revision.settransobject(sqlca)
	dw_revision.getchild('area',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(il_cod_parque)=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_revision.getchild('serie_asoc',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	
	dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
	idw_detalle12.settransobject(sqlca)
	idw_detalle12.insertrow(0)
	
	ll_new						= dw_revision.insertrow(0)
	dw_revision.setitem(ll_new,'estado_revision','V')
	dw_revision.accepttext()
elseif ls_base='F' or ls_base='G' or ls_base='V' then
	ls_pasa						= 'S'	
	dw_revision.dataobject	= 'dw_revision_contratos_producto'
	dw_revision.settransobject(sqlca)
	dw_revision.getchild('codigo_servicio',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(il_cod_parque,'NI',ls_serie,'2')=0 then
		idw_detalle3.insertrow(0)
	end if
	dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
	idw_detalle1.settransobject(sqlca)
	if ll_numero > 0 then
		if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
			idw_detalle1.insertrow(0)
		end if
	else
		idw_detalle1.insertrow(0)
	end if
	dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
	idw_detalle12.settransobject(sqlca)
	idw_detalle12.insertrow(0)
	ll_new						= dw_revision.insertrow(0)
	dw_revision.setitem(ll_new,'estado_revision','V')
	dw_revision.accepttext()
else
	if is_limpiar='N' then
		ls_pasa						= 'N'	
		dw_revision.dataobject	= 'dwe_mensaje_no_listo'
		dw_revision.settransobject(sqlca)
		SELECT	"TIPO_CONTRATO"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 	"TIPO_CONTRATO"
		WHERE 	"TIPO_CONTRATO"."CODIGO" = :ls_base   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_revision.setitem(ll_new,'mensaje','No está Preparado Revisión de Contrato '+ls_descrip)
		end if
	else
		if ls_base='O' or ls_base='U' then
			ls_pasa						= 'S'	
			if ls_base='U' then
				gs_cod_prod				= 'CO'
			else
				gs_cod_prod				= 'SE'
			end if
			dw_revision.dataobject	= 'dw_revision_contratos_promesa'
			dw_revision.settransobject(sqlca)
			dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
				idw_detalle2.insertrow(0)
			end if
			
			dw_revision.getchild('tipo_producto',idw_detalle4)
			idw_detalle4.settransobject(sqlca)
			if idw_detalle4.retrieve(gs_cod_prod)=0 then
				idw_detalle4.insertrow(0)
			end if
			
			dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			idw_detalle12.insertrow(0)
			
			ll_new						= dw_revision.insertrow(0)
			dw_revision.setitem(ll_new,'estado_revision','V')
			dw_revision.accepttext()
		elseif ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' then
			ls_pasa						= 'S'	
			dw_revision.dataobject	= 'dw_revision_contratos_liberador'
			dw_revision.settransobject(sqlca)
			dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(il_cod_parque)=0 then
				idw_detalle2.insertrow(0)
			end if
			dw_revision.getchild('serie_asoc',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.rowcount()=0 then
				idw_detalle.insertrow(0)
			end if
			dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			idw_detalle12.insertrow(0)
			ll_new						= dw_revision.insertrow(0)
			dw_revision.setitem(ll_new,'estado_revision','V')
			dw_revision.accepttext()
		elseif ls_base='F' or ls_base='G' or ls_base='V' then
			ls_pasa						= 'S'	
			dw_revision.dataobject	= 'dw_revision_contratos_producto'
			dw_revision.settransobject(sqlca)
			dw_revision.getchild('codigo_servicio',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			if idw_detalle3.retrieve(il_cod_parque,'NI',ls_serie)=0 then
				idw_detalle3.insertrow(0)
			end if
			dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			idw_detalle12.insertrow(0)
			ll_new						= dw_revision.insertrow(0)
			dw_revision.setitem(ll_new,'estado_revision','V')
			dw_revision.accepttext()
		end if
	end if
end if
dw_lista_obs.reset()
if ls_pasa='S' then
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_dia  
	FROM 	"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha
	USING	sqlca;
	if sqlca.sqlcode=0 then
		dw_revision.setitem(ll_new,'uf_fecha_ctto',ldb_uf_dia)
	end if
	SELECT DISTINCT "FACTORES"."FECHA_VIGENCIA"  
	INTO 		:ldt_fecha_vig  
	FROM 	"FACTORES"  
	WHERE 	"FACTORES"."ESTADO_VIGENCIA" = 'V'   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		dw_revision.setitem(1,'fecha_factor_vigente',ldt_fecha_vig)
	end if
end if
ll_tot_rev					= dw_revision.rowcount()
if ll_tot_rev>0 then
else
	if gs_conexion = "Parque El Prado" then
		ll_tot_reg		= dw_seguro.retrieve(1,ls_base)
	elseif gs_conexion = "Parque La Foresta" then
		ll_tot_reg		= dw_seguro.retrieve(11,ls_base)
	end if
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		next
		dw_seguro.accepttext()
		dw_seguro.enabled	= false
	end if
end if
dw_revision.accepttext()

end subroutine

public subroutine wf_calcular_liberador ();Date		ld_fecha_1_venc,ld_fecha_ctto,ld_fecha,ld_fecha_nac
Datetime	ldt_fecha,ldt_fecha_prim,ldt_nulo,ldt_fec_res_aux,ldt_fecha_venc_vig_factor
String		ls_moneda,ls_tipo_sepultura,ls_tipo_construc,ls_area,ls_string,ls_descrip_moneda,&
			ls_base,ls_serie,ls_base_asoc,ls_serie_asoc,ls_dv,ls_descrip_estado,ls_texto_ctto,&
			ls_base_aux,ls_serie_aux,ls_forma_pago,ls_estado_aux,ls_falta,ls_moneda_res,&
			ls_sw_pie,ls_uso,ls_obs,ls_estado_sep
Double	ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor,ld_calculo,ldb_uf,ldb_precio_liber,ldb_precio_validado,&
			ldb_descto_liber,ldb_cuota_mant,ldb_liberador,lld_precio_contrato,lld_calc_desc,ldb_derecho,ldb_precio_val2,&
			ldb_precio_ctto_aux,ldb_val_cta,ldb_val_uf,ll_porce,ldb_porcen_real,ldb_precio_vta,ldb_descto_adic,ldb_porce_pie,&
			ldb_pie_minimo,ldb_pie_res,ldb_precio_res,ll_cal_15,ldb_gasto_adm,ldb_valor_mant,ll_numero,ll_numero_asoc,ll_numero_aux,&
			ldb_iva
Long		ll_plazo,ll_dias,ll_10_porce,ll_valor_cuota,ll_largototal,ll_posini,ll_capacidad,ll_cod_obs,&
			ll_gasto_peso,ll_valor_cta,ll_new,ll_fila,ll_rut,ll_periodo_mant,&
			ll_renta,ll_reg,ll_tot_reg,ll_tot_reg_rezago,ll_tot_reg_ctto_asoc,&
			ll_indi,ll_sum_res=0,ll_annos_liber,ll_capac_new,ll_dias_venc,ll_dif_dias,ll_plazo_max,ll_nulo

setnull(ll_nulo)
dw_revision.accepttext()
ls_sw_pie									= 'N'
ll_rut											= long(em_rut.text)
ls_dv											= trim(em_dv.text)
ls_base										= dw_base.getitemstring(1,'base')
ls_serie										= trim(ddlb_serie.text)
ll_numero									= Double(em_numero.text)
dw_revision.setitem(1,'rut',ll_rut)
dw_revision.setitem(1,'dv',ls_dv)
dw_revision.setitem(1,'base',ls_base)
dw_revision.setitem(1,'serie',ls_serie)
dw_revision.setitem(1,'numero',ll_numero)
ll_tot_reg_rezago							= dw_lista_rezagos.rowcount()

/*SELECT iva
INTO :ldb_iva
FROM tasa;

dw_revision.setitem(1,'iva_cuota',ldb_iva)*/

if ll_tot_reg_rezago>0 then
	ll_new									= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	if ll_tot_reg_rezago=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimiento de Pago en Rezago')
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimientos de Pagos en Rezago')
	end if
	dw_lista_obs.accepttext()
end if
ll_tot_reg_ctto_asoc						= dw_ctto_asoc.rowcount()
if ll_tot_reg_ctto_asoc>0 then
	ll_new									= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	for ll_indi=1 to ll_tot_reg_ctto_asoc
		ls_base_aux							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_codigo')
		ls_serie_aux							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_serie')
		ll_numero_aux						= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_numero')
		ls_estado_aux						= dw_ctto_asoc.getitemstring(ll_indi,'cadena_estado')
		ldt_fec_res_aux					= dw_ctto_asoc.getitemdatetime(ll_indi,'cadena_fecha_res')
		ls_texto_ctto						= ls_texto_ctto + ls_base_aux+'-'+ls_serie_aux+'-'+string(ll_numero_aux,"###,###,###,###,###")
		if ll_indi<>ll_tot_reg_ctto_asoc then
			ls_texto_ctto					= ls_texto_ctto+', '
		end if
		if ls_estado_aux='R' and year(date(ldt_fec_res_aux))>=2004 then
			ll_sum_res ++
		end if
	next
	if ll_tot_reg_ctto_asoc=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contrato Asociado '+ls_texto_ctto)
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contratos Asociados '+ls_texto_ctto)
	end if
	ls_forma_pago							= dw_revision.getitemstring(1,'forma_pago')
	dw_lista_obs.accepttext()
end if
ld_fecha_nac								= date(dw_revision.getitemdatetime(1,'fecha_nac'))
ld_fecha_ctto								= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
if not isnull(ld_fecha_ctto)  then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),3)
end if
if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),1)
end if
dw_revision.accepttext()
dw_lista_obs.accepttext()
ls_moneda									= dw_revision.getitemstring(1,'moneda')
ld_fecha_1_venc							= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto								= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo										= dw_revision.getitemnumber(1,'plazo')
ls_tipo_sepultura							= dw_revision.getitemstring(1,'tipo_sepult')
ls_area										= dw_revision.getitemstring(1,'area')
ll_capacidad									= dw_revision.getitemnumber(1,'capacidad')
if ls_base='L' then
	ls_uso									= 'NF'
else
	ls_uso									= dw_revision.getitemstring(1,'uso')
end if
ldb_uf											= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque								= dw_revision.getitemnumber(1,'cod_parque')
ls_forma_pago								= dw_revision.getitemstring(1,'forma_pago')
ldb_precio									= double(dw_revision.getitemnumber(1,'precio_contrato'))
ldb_precio_validado						= double(dw_revision.getitemnumber(1,'precio_contrato'))
ldb_precio_val2								= double(dw_revision.getitemnumber(1,'precio_contrato'))
lld_pie										= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf									= double(dw_revision.getitemnumber(1,'gasto_adm'))
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
	ld_calculo								= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
	if ls_forma_pago='1' or ls_forma_pago='3' then
		if isnull(ll_plazo) then
			dw_revision.setitem(1,'valor_cuota',ld_calculo)
		else
			dw_revision.setitem(1,'valor_cuota',(ld_calculo / ll_plazo))
		end if
	end if
end if
dw_revision.accepttext()
lld_saldo_finan								= double(dw_revision.getitemnumber(1,'saldo_financiar'))
if not isnull(ls_forma_pago) then
	if ls_forma_pago<>'2' and ls_forma_pago <> '4' then
		dw_revision.setitem(1,'factor_cuota',0)
		dw_revision.setitem(1,'gasto_adm',0)
		if lld_saldo_finan>0 and ll_plazo>0 then
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0)) //1
			else
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4)) //2
			end if
		end if
	else
		dw_revision.setitem(1,'factor_cuota',0)
		dw_revision.setitem(1,'gasto_adm',0)
		if lld_saldo_finan>0 and ll_plazo>0 then
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0)) //1
			else
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4)) //2
			end if
		end if
	end if
end if
if not isnull(ls_tipo_sepultura) then
	if ls_tipo_sepultura = '1' then
		ls_tipo_construc					= 'T'
	else
		ls_tipo_construc					= 'C'
	end if
end if
if not isnull(ls_area) and not isnull(ll_capacidad) and not isnull(ls_uso) and &
	not isnull(ldb_uf) and not isnull(il_cod_parque) and not isnull(ls_tipo_sepultura) and not isnull(ll_plazo) then
	if ls_base='L' then
		ll_plazo						= dw_revision.getitemnumber(1,'plazo')
		SELECT	"ANNO_INI", "SIGLA"
		INTO		:ll_plazo_max, :ls_obs
		FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 8
		USING	sqlca;
		if ll_plazo > ll_plazo_max then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_plazo),8)
			messagebox("Advertencia",ls_obs+' '+ string(ll_plazo_max)+' Cuotas'  )
			dw_revision.setitem(1,'plazo',ll_nulo)
			dw_revision.accepttext()
		end if
		
		ll_annos_liber						= dw_revision.getitemnumber(1,'liberador_annos')
		if not isnull(ll_annos_liber) and ll_annos_liber>0 then
			ls_base_asoc					= dw_revision.getitemstring(1,'base_asoc')
			ls_serie_asoc					= dw_revision.getitemstring(1,'serie_asoc')
			ll_numero_asoc				= dw_revision.getitemnumber(1,'numero_asoc')
			
			ldb_valor_mant					= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
			ls_string							= f_valida_precio_liberador_nuevo(ldb_valor_mant,ll_annos_liber,ls_moneda,ldb_uf)
			if ls_moneda='2' then //UF
				ldb_precio					= double(substr(1,1,ls_string))
				ldb_descto_liber			= double(substr(1,2,ls_string))
				ldb_precio_vta				= double(substr(1,3,ls_string))
				ldb_liberador				= double(substr(1,4,ls_string))
				ldb_pie_minimo			= double(substr(1,5,ls_string))
			else // peso
				ldb_precio					= double(long(substr(1,1,ls_string)))
				ldb_descto_liber			= double(substr(1,2,ls_string))
				ldb_precio_vta				= double(long(substr(1,3,ls_string)))
				ldb_liberador				= double(long(substr(1,4,ls_string)))
				ldb_pie_minimo			= double(substr(1,5,ls_string))
			end if
			if is_new_calc='N' then
				ldb_precio_vta				= ldb_precio_validado
			end if
			if is_new_precio='S' then
				ldb_precio_vta				= dw_revision.getitemnumber(1,'precio_contrato')
			end if
		end if
		dw_revision.setitem(1,'precio',ldb_precio)
		dw_revision.setitem(1,'descto_liber',ldb_descto_liber)
		dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
		dw_revision.setitem(1,'valor_cuota_mant',ldb_valor_mant)
		dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
		dw_revision.setitem(1,'periodo_mant',il_periodo_mant)
		dw_revision.setitem(1,'uso',ls_uso)
		if ls_forma_pago<>'2' and ls_forma_pago <> '4' then
			dw_revision.setitem(1,'valor_cuota',ldb_precio_vta)
		end if
		dw_revision.accepttext()
		if lld_pie=0 then
			ldb_porce_pie					= 0
		else
			ldb_porce_pie					= (lld_pie / ldb_precio * 100)
		end if
		
		if ls_uso='NF' then
			ll_cod_obs 						= 4										
		end if
		wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),ll_cod_obs)
		dw_revision.setfocus()
	elseif ls_base= 'A' then
		ll_plazo								= dw_revision.getitemnumber(1,'plazo')
		SELECT	"ANNO_INI", "SIGLA"
		INTO		:ll_plazo_max, :ls_obs
		FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 7
		USING	sqlca;
		if ll_plazo > ll_plazo_max then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_plazo),7)
			messagebox("Advertencia",ls_obs+' '+ string(ll_plazo_max)+' Cuotas'  )
			dw_revision.setitem(1,'plazo',ll_nulo)
			dw_revision.accepttext()
		end if
		
		ldb_valor_mant						= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
		ll_capac_new						= dw_revision.getitemnumber(1,'nueva_capac')
		if not isnull(ll_capac_new) and ll_capac_new>0 then
			ls_string							= f_valida_precio_aumento(ll_capacidad,ls_uso,ll_capac_new,il_cod_parque,ls_moneda,ldb_uf)
			if ls_moneda='2' then //UF
				ldb_precio					= double(substr(1,1,ls_string))
				ldb_pie_minimo			= double(substr(1,2,ls_string))
				ldb_descto_liber			= double(substr(1,3,ls_string))
				ldb_precio_vta				= double(substr(1,4,ls_string))
				ldb_liberador				= double(substr(1,5,ls_string))
			else // peso
				ldb_precio					= double(long(substr(1,1,ls_string)))
				ldb_pie_minimo			= double(substr(1,2,ls_string))
				ldb_descto_liber			= double(substr(1,3,ls_string))
				ldb_precio_vta				= double(long(substr(1,4,ls_string)))
				ldb_liberador				= double(long(substr(1,5,ls_string)))
			end if
			ldb_precio_vta					= ldb_precio
			if is_new_calc='N' then
				ldb_precio_vta				= ldb_precio_validado
			end if
			if is_new_precio='S' then
				ldb_precio_vta				= dw_revision.getitemnumber(1,'precio_contrato')
			end if
			dw_revision.setitem(1,'precio',ldb_precio)
			dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
			dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
			dw_revision.setitem(1,'uso',ls_uso)
			dw_revision.accepttext()
			ls_forma_pago					= dw_revision.getitemstring(1,'forma_pago')
			lld_pie							= double(dw_revision.getitemnumber(1,'pie'))
			if lld_pie < ldb_pie_minimo and lld_pie>=0 and ls_sw_pie='N' then
				ldb_porce_pie									= (lld_pie / ldb_precio * 100)
				if ls_uso='NF' then
					ll_cod_obs 				= 4										
				elseif ls_uso='NI' then
					ll_cod_obs 				= 11	
				end if
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),ll_cod_obs)
				dw_revision.setfocus()
			end if
		end if
	else
		ls_string								= f_valida_precio_liberador(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque,ls_base)
		if ls_moneda='2' then //UF
			ldb_precio						= double(substr(1,1,ls_string))
			ldb_derecho						= double(substr(1,2,ls_string))
			ldb_cuota_mant				= double(substr(1,3,ls_string))
			ldb_liberador					= double(substr(1,4,ls_string))
			ldb_pie_minimo				= double(substr(1,5,ls_string))
		else // peso
			ldb_precio						= double(long(substr(1,1,ls_string)))
			ldb_derecho						= double(long(substr(1,2,ls_string)))
			ldb_cuota_mant				= double(substr(1,3,ls_string))
			ldb_liberador					= double(long(substr(1,4,ls_string)))
			ldb_derecho						= ROUND((ldb_derecho / ldb_uf),0)
			ldb_pie_minimo				= double(substr(1,5,ls_string))
		end if
	end if
	
	ls_forma_pago							= dw_revision.getitemstring(1,'forma_pago')
	SELECT	"REVISION_CONTRATOS"."PRECIO_CONTRATO"  
	INTO 		:ldb_precio_ctto_aux  
	FROM 	"REVISION_CONTRATOS"  
	WHERE 	( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
			 	( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
			 	( "REVISION_CONTRATOS"."NUMERO" = :ll_numero ) AND  
			 	( "REVISION_CONTRATOS"."RUT" = :ll_rut )   
	USING	sqlca;
	if sqlca.sqlcode<>0 then
		if is_nuevo='S' and is_sw_pasa='S' then
			dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
			is_sw_pasa				= 'N'
		else
			if dw_revision.getitemnumber(1,'precio_contrato')=0 then
				dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
			end if
		end if
	end if
	dw_revision.setitem(1,'descto_liber',ldb_descto_liber)
	dw_revision.setitem(1,'valor_cuota_mant',ldb_valor_mant)
	ldb_liberador							= 0
end if
dw_revision.accepttext()
ls_moneda									= dw_revision.getitemstring(1,'moneda')
ld_fecha_1_venc							= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto								= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo										= dw_revision.getitemnumber(1,'plazo')
ls_tipo_sepultura							= dw_revision.getitemstring(1,'tipo_sepult')
ls_area										= dw_revision.getitemstring(1,'area')
ll_capacidad									= dw_revision.getitemnumber(1,'capacidad')
if ls_base='L' then
	ls_uso									= 'NF'
else
	ls_uso									= dw_revision.getitemstring(1,'uso')
end if
ldb_uf											= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque								= dw_revision.getitemnumber(1,'cod_parque')
ldb_precio									= double(dw_revision.getitemnumber(1,'precio_contrato'))
lld_pie										= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf									= double(dw_revision.getitemnumber(1,'gasto_adm'))
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
	ld_calculo							= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
	if ls_forma_pago='1' or ls_forma_pago='3' then
		dw_revision.setitem(1,'valor_cuota',ld_calculo)
		if isnull(ll_plazo) then
			dw_revision.setitem(1,'valor_cuota',ld_calculo)
		else
			dw_revision.setitem(1,'valor_cuota',(ld_calculo / ll_plazo))
		end if
	end if
end if
dw_revision.accepttext()

if is_new_precio='S' then
	lld_precio_contrato					= double(dw_revision.getitemnumber(1,'precio_contrato'))
	ldb_precio								= double(dw_revision.getitemnumber(1,'precio'))
	ldb_descto_adic						= (double(dw_revision.getitemnumber(1,'descto_liber'))*100)
	if lld_precio_contrato <> ldb_precio and ldb_precio>0 then
		lld_calc_desc						= 100 - round(((lld_precio_contrato * 100) / ldb_precio),2)
		lld_calc_desc						= lld_calc_desc - ldb_descto_adic
		ll_new								= dw_lista_obs.insertrow(0)
		dw_lista_obs.scrolltorow(0)
		dw_lista_obs.setitem(ll_new,'rut',ll_rut)
		dw_lista_obs.setitem(ll_new,'base',ls_base)
		dw_lista_obs.setitem(ll_new,'serie',ls_serie)
		dw_lista_obs.setitem(ll_new,'numero',ll_numero)
		dw_lista_obs.setitem(ll_new,'observacion','Se aplicó Descuento Adicional del '+string(lld_calc_desc,"###,##0.0#")+'% del Precio Venta')
		dw_lista_obs.accepttext()
	end if
end if
dw_revision.accepttext()
ld_fecha_1_venc						= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto							= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
lld_pie									= double(dw_revision.getitemnumber(1,'pie'))
if isnull(lld_pie) then lld_pie=0
if not isnull(ld_fecha_1_venc) then
	if not isnull(ld_fecha_ctto) then
		if lld_pie>0 then
			SELECT	"ANNO_INI"
			INTO		:ll_dias_venc
    			FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   			WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 6
			USING	sqlca;
			if isnull(ll_dias_venc) then ll_dias_venc=0
			ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias_venc)
			if ld_fecha_1_venc > ld_fecha then
				ll_dif_dias				= DaysAfter(ld_fecha_ctto,ld_fecha_1_venc)
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_dif_dias),6)	
			end if
		elseif lld_pie=0 then
			SELECT	"ANNO_INI"
			INTO		:ll_dias_venc
    			FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   			WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 9
			USING	sqlca;
			if isnull(ll_dias_venc) then ll_dias_venc=0
			ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias_venc)
			if ld_fecha_1_venc > ld_fecha then
				ll_dif_dias				= DaysAfter(ld_fecha_ctto,ld_fecha_1_venc)
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_dif_dias),9)		
			end if
		end if
	end if
	dw_revision.accepttext()
	ldt_fecha								= datetime(date(dw_revision.getitemdatetime(1,'fecha_ctto')),time('00:00:00'))
	ldt_fecha_prim						= dw_revision.getitemdatetime(1,'fecha_prim')
	lld_saldo_finan						= double(dw_revision.getitemnumber(1,'saldo_financiar'))
	ll_dias								= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
	ldt_fecha_venc_vig_factor		= dw_revision.getitemdatetime(1,'fecha_factor_vigente')
	ll_plazo								= dw_revision.getitemnumber(1,'plazo')
	if ll_dias>0 then dw_revision.setitem(1,'dias_vencimiento_prim',ll_dias)
	if not isnull(ll_plazo) and ll_plazo>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
		not isnull(ls_moneda) and not isnull(ldb_precio) then //not isnull(lld_gasto_uf) and lld_gasto_uf>0 and and ldb_precio>0
		if ldt_fecha_prim >= ldt_fecha then
			if ls_forma_pago='2' or ls_forma_pago='4' then
				if ll_plazo>=1 and ll_plazo<=11 then
					lld_saldo_finan	= double(dw_revision.getitemnumber(1,'saldo_financiar'))
					ll_plazo				= dw_revision.getitemnumber(1,'plazo')
					if ls_moneda='1' then //peso
						ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),0)
						dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //3
					else
						ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),4)
						dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //4
					end if
				else
					if ll_dias>=30 then
						SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
						INTO 		:lld_factor,	:ldb_gasto_adm
						FROM 	"FACTORES"  
						WHERE 	( "FACTORES"."BASE" = :ls_base ) AND  
								 	( "FACTORES"."NRO_CUOTAS_INICIAL" >= :ll_plazo )  AND  
								 	( "FACTORES"."NRO_CUOTAS_FINAL" <= :ll_plazo )  AND  
								 	(("FACTORES"."DIAS_INICIAL" >= :ll_dias )  AND  
								 	( "FACTORES"."DIAS_FINAL" <= :ll_dias ))  AND
								 	( "FACTORES"."MONEDA" = :ls_moneda ) AND
								 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor )
						USING	sqlca;
						if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
							ldb_gasto_adm		= 0
						end if
						if lld_factor > 0 then //and lld_saldo_finan > 0
							dw_revision.setitem(1,'factor_cuota',lld_factor)
							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
							dw_revision.accepttext()
							ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
							lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
							lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
							ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
							lld_saldo_finan		= round((lld_factor * ld_calculo),4)
							dw_revision.setitem(1,'valor_cuota',lld_saldo_finan) //5
						else
							SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
							INTO 		:lld_factor,	:ldb_gasto_adm
							FROM 	"FACTORES"  
							WHERE  	( "FACTORES"."BASE" = :ls_base ) AND  
									 	( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
									 	( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
									 	( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 	 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
									 	( "FACTORES"."DIAS_INICIAL" = (	SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																					FROM 	"FACTORES" 
																					WHERE	( "FACTORES"."BASE" = :ls_base ) AND 
																			    					( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																				 				( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																				 				( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																				 				( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																				 				( "FACTORES"."FACTOR" <> 0 ) ) )   ;
							if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
								ldb_gasto_adm		= 0
							end if
							if lld_factor > 0 then //and lld_saldo_finan > 0
								dw_revision.setitem(1,'factor_cuota',lld_factor)
								dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
								dw_revision.accepttext()
								ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
								lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
								lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
								ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
								lld_saldo_finan		= round((lld_factor * ld_calculo),4)
								dw_revision.setitem(1,'valor_cuota',lld_saldo_finan) //6
							end if
						end if
					else
						SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
						INTO 		:lld_factor,	:ldb_gasto_adm  
						FROM 	"FACTORES"  
						WHERE 	( "FACTORES"."BASE" = :ls_base ) AND  
									( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 	( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
								 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
								 	( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 	( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																				FROM 	"FACTORES" 
																				WHERE  ( "FACTORES"."BASE" = :ls_base ) AND 
																			 				( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																			 				( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																			 				( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																			 				( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 				( "FACTORES"."FACTOR" <> 0 ) ) )   
						USING		sqlca;
						if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
							ldb_gasto_adm		= 0
						end if
						if lld_factor > 0 then //and lld_saldo_finan > 0
							dw_revision.setitem(1,'factor_cuota',lld_factor)
							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
							dw_revision.accepttext()
							ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
							lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
							lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
							ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
							lld_saldo_finan		= round((lld_factor * ld_calculo),4)
							dw_revision.setitem(1,'valor_cuota',lld_saldo_finan) //7
						end if
					end if
				end if
			else
				if ls_moneda='1' then //peso
					ldb_val_cta					= 	round((lld_saldo_finan / ll_plazo),0)
					dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //3
				else
					ldb_val_cta					= 	round((lld_saldo_finan / ll_plazo),4)
					dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //4
				end if
			end if
			dw_revision.accepttext()
			ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
			lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
			lld_gasto_uf							= double(dw_revision.getitemnumber(1,'gasto_adm'))
			if isnull(lld_pie) then lld_pie=0
			if isnull(lld_gasto_uf) then lld_gasto_uf=0
			if isnull(ldb_precio) or isnull(lld_gasto_uf) then
				dw_revision.setitem(1,'saldo_financiar',0)
			else
				ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
				if ls_forma_pago='1' or ls_forma_pago='3' then
					dw_revision.setitem(1,'valor_cuota',ld_calculo)
				end if
			end if
			dw_revision.accepttext()
		else
			ll_new								= dw_lista_obs.insertrow(0)
			dw_lista_obs.scrolltorow(0)
			dw_lista_obs.setitem(ll_new,'rut',ll_rut)
			dw_lista_obs.setitem(ll_new,'base',ls_base)
			dw_lista_obs.setitem(ll_new,'serie',ls_serie)
			dw_lista_obs.setitem(ll_new,'numero',ll_numero)
			dw_lista_obs.setitem(ll_new,'observacion','Recuerde Fecha Primer Vencimiento debe ser Mayor o Igual a la Fecha Contrato')
			dw_lista_obs.accepttext()
		end if
	end if
	dw_revision.accepttext()
	ll_renta										= dw_revision.getitemnumber(1,'renta_liquida')
	ls_forma_pago								= dw_revision.getitemstring(1,'forma_pago')
	if ll_renta>0 and (ls_forma_pago='2' or ls_forma_pago='4') then
		SELECT	"ANNO_INI"
		INTO		:ll_porce
		FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 10
		USING	sqlca;
		if isnull(ll_porce) then ll_porce=0
		
		ldb_val_cta								= dw_revision.getitemnumber(1,'valor_cuota')
		ldb_val_uf								= dw_revision.getitemnumber(1,'uf_fecha_ctto')
		if ls_moneda='2' then //peso
			ll_valor_cta							= round((ldb_val_cta * ldb_val_uf),0)
		end if
		ll_porce									= round((ll_valor_cuota * 100 ) / ll_renta,2)
		ll_10_porce								= (ll_renta * ll_porce) / 100
		ldb_porcen_real						= round((ll_valor_cta * 100) / ll_renta,2)
		if ldb_porcen_real > ll_porce then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porcen_real),10)
		end if
	else
		if ls_forma_pago='1' or ls_forma_pago='3' then
			if ls_moneda='1' then //peso
				ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),0)
			else
				ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),4)
			end if
			dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //3
		end if
	end if
end if
dw_revision.accepttext()
end subroutine

public subroutine wf_calcular_promesa ();Date		ld_fecha_1_venc,ld_fecha_ctto,ld_fecha,ld_fecha_nac
Datetime	ldt_fecha,ldt_fecha_prim,ldt_nulo,ldt_fec_res_aux,ldt_fecha_venc_vig_factor
String		ls_moneda,ls_tipo_sepultura,ls_tipo_construc,ls_area,ls_uso,ls_string,ls_descrip_moneda,ls_base,ls_serie,ls_base_asoc,ls_serie_asoc,ls_dv,ls_descrip_estado,ls_texto_ctto,&
			ls_base_aux,ls_serie_aux,ls_forma_pago,ls_estado_aux,ls_falta,ls_moneda_res,ls_sw_pie
Double	ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor,ld_calculo,ldb_uf,ldb_porce_pie,ldb_derecho,ldb_cuota_mant,ldb_liberador,lld_precio_contrato,lld_calc_desc,&
			ldb_precio_ctto_aux,ldb_val_cta,ldb_val_uf,ll_porce,ldb_porcen_real,ldb_porce,ldb_pie_minimo,ldb_pie_res,ldb_precio_res,ll_cal_15,ldb_gasto_adm,ll_numero,ll_numero_asoc,&
			ll_numero_aux,ldb_precio_ctto
Long		ll_plazo,ll_dias,ll_10_porce,ll_valor_cuota,ll_largototal,ll_posini,ll_capacidad,ll_gasto_peso,ll_valor_cta,ll_new,ll_fila,ll_rut,ll_resuelto,ll_cta_resuelto,ll_fallec,&
			ll_renta,ll_reg,ll_tot_reg,ll_tot_reg_rezago,ll_tot_reg_ctto_asoc,ll_cod_obs,ll_dias_venc,ll_dif_dias,ll_indi,ll_reduccion,ll_tipo_producto,ll_sum_res=0

dw_revision.accepttext()
ls_sw_pie				= 'N'
ll_rut						= long(em_rut.text)
ls_dv						= trim(em_dv.text)
ls_base					= dw_base.getitemstring(1,'base')
ls_serie					= trim(ddlb_serie.text)
ll_numero				= Double(em_numero.text)

idb_valor_cuota_calc	= Double(dw_revision.getitemnumber(1,'valor_cuota'))
dw_revision.setitem(1,'rut',ll_rut)
dw_revision.setitem(1,'dv',ls_dv)
dw_revision.setitem(1,'base',ls_base)
dw_revision.setitem(1,'serie',ls_serie)
dw_revision.setitem(1,'numero',ll_numero)
ll_tot_reg_rezago		= dw_lista_rezagos.rowcount()
if ll_tot_reg_rezago>0 then
	ll_new				= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	if ll_tot_reg_rezago=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimiento de Pago en Rezago')
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimientos de Pagos en Rezago')
	end if
	dw_lista_obs.accepttext()
end if
ll_tot_reg_ctto_asoc	= dw_ctto_asoc.rowcount()
if ll_tot_reg_ctto_asoc>0 then
	ll_new				= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	for ll_indi=1 to ll_tot_reg_ctto_asoc
		ls_base_aux			= dw_ctto_asoc.getitemstring(ll_indi,'cadena_codigo')
		ls_serie_aux			= dw_ctto_asoc.getitemstring(ll_indi,'cadena_serie')
		ll_numero_aux		= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_numero')
		ls_estado_aux		= dw_ctto_asoc.getitemstring(ll_indi,'cadena_estado')
		ldt_fec_res_aux	= dw_ctto_asoc.getitemdatetime(ll_indi,'cadena_fecha_res')
		ll_fallec				= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_mora_fallecidos')
		ls_texto_ctto		= ls_texto_ctto + ls_base_aux+'-'+ls_serie_aux+'-'+string(ll_numero_aux,"###,###,###,###,###")
		if ll_indi<>ll_tot_reg_ctto_asoc then
			ls_texto_ctto	= ls_texto_ctto+', '
		end if
		if ls_estado_aux='R' and year(date(ldt_fec_res_aux))>=2004 and ll_fallec=0 then
			ll_sum_res ++
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(0),5)
		elseif ls_estado_aux='R' and ll_fallec>0 then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(0),12)
			ll_sum_res ++
		end if
	next
	if ll_tot_reg_ctto_asoc=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contrato Asociado '+ls_texto_ctto)
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contratos Asociados '+ls_texto_ctto)
	end if
	ls_forma_pago				= dw_revision.getitemstring(1,'forma_pago')
	if ll_sum_res>0 and (ls_forma_pago='2' or ls_forma_pago='4') then
		ldb_pie_res				= dw_revision.getitemnumber(1,'pie')
		if isnull(ldb_pie_res) then ldb_pie_res=0
		ldb_precio_res			= dw_revision.getitemnumber(1,'precio_contrato')
		if ldb_precio_res > 0 then
			SELECT	count("CADENA"."CODIGO" )
			INTO		:ll_cta_resuelto
    			FROM 	"CADENA"  
   			WHERE	"CADENA"."ESTADO" = 'R' AND
						"CADENA"."CODIGO" = :ls_base AND	
						"CADENA"."RUT" = :ll_rut
			USING	sqlca;
			if isnull(ll_cta_resuelto) then ll_cta_resuelto= 0
			if ll_cta_resuelto > 0 then
				if ll_cta_resuelto=1 then
					SELECT	"ANNO_INI"
					INTO		:ldb_porce
    					FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   					WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 5
					USING	sqlca;
				else
					SELECT	"ANNO_INI"
					INTO		:ldb_porce
    					FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   					WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 13
					USING	sqlca;
				end if
				if isnull(ldb_porce) then ldb_porce= 0
			end if
			if isnull(ldb_porce) then ldb_porce=0
			ll_cal_15							= (ldb_precio_res * ldb_porce) / 100
			if ldb_pie_res < ll_cal_15 then
				ls_sw_pie					= 'S'
				ls_moneda_res				= dw_revision.getitemstring(1,'moneda')
				if ll_cta_resuelto=1 then
					wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),5)
				else
					wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),13)
				end if
			end if
		end if
	end if
	dw_lista_obs.accepttext()
end if
ld_fecha_nac					= date(dw_revision.getitemdatetime(1,'fecha_nac'))
ld_fecha_ctto					= date(dw_revision.getitemdatetime(1,'fecha_ctto'))

if not isnull(ld_fecha_ctto)  then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),3)
end if
if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),1)
end if
dw_revision.accepttext()
dw_lista_obs.accepttext()
ls_moneda						= dw_revision.getitemstring(1,'moneda')
ld_fecha_1_venc				= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto					= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo							= dw_revision.getitemnumber(1,'plazo')
ls_tipo_sepultura				= dw_revision.getitemstring(1,'tipo_sepult')
ll_tipo_producto				= dw_revision.getitemnumber(1,'tipo_producto')
ls_area							= dw_revision.getitemstring(1,'area')
ll_capacidad						= dw_revision.getitemnumber(1,'capacidad')
ls_uso							= dw_revision.getitemstring(1,'uso')
ldb_uf								= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque					= dw_revision.getitemnumber(1,'cod_parque')
ls_forma_pago					= dw_revision.getitemstring(1,'forma_pago')
ldb_precio						= double(dw_revision.getitemnumber(1,'precio_contrato'))
lld_pie							= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf						= double(dw_revision.getitemnumber(1,'gasto_adm'))
ldb_precio_ctto					= double(dw_revision.getitemnumber(1,'precio_contrato'))
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
//	if ll_tipo_producto <> 15 or (ll_tipo_producto = 15 and (ldb_precio = 0 or isnull(ldb_precio) or lld_pie = 0 or isnull(lld_pie) or ll_plazo = 0 or isnull(ll_plazo) or il_modif > 0)) then
//		if idb_valor_cuota_calc <> lld_pie or lld_pie=0 or isnull(lld_pie) or il_modif > 0 then
//			if is_mod_precio <> 'N' then
				ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
//			end if
//		end if
//	end if
end if
dw_revision.accepttext()
lld_saldo_finan				= double(dw_revision.getitemnumber(1,'saldo_financiar'))
if not isnull(ls_forma_pago) then
	if ls_forma_pago<>'2' and ls_forma_pago<>'4' then
//		dw_revision.setitem(1,'renta_liquida',0)
		dw_revision.setitem(1,'factor_cuota',0)
		dw_revision.setitem(1,'gasto_adm',0)
		if lld_saldo_finan>0 and ll_plazo>0 then
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0))
			else
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4))
			end if
		end if
	end if
end if
if not isnull(ls_tipo_sepultura) then
	if ls_tipo_sepultura = '1' then
		ls_tipo_construc			= 'T'
	else
		if ls_tipo_sepultura='8' then
			SELECT 	"TIPO_CONSTRUCCION_AREA"."TIPO_CONST"  
			INTO 		:ls_tipo_construc  
			FROM 	"TIPO_CONSTRUCCION_AREA"  
			WHERE 	( "TIPO_CONSTRUCCION_AREA"."AREA" = :ls_area ) AND  
						( "TIPO_CONSTRUCCION_AREA"."COD_PARQUE" = :il_cod_parque ) AND  
						( "TIPO_CONSTRUCCION_AREA"."TIPO_PRODUCTO" = 'CO' ) AND  
						( "TIPO_CONSTRUCCION_AREA"."ESTADO_REG" = 'A' )   ;

		else
			ls_tipo_construc		= 'C'
		end if
	end if
end if
if not isnull(ls_area) and not isnull(ll_capacidad) and not isnull(ls_uso) and not isnull(ldb_uf) and not isnull(il_cod_parque) and not isnull(ls_tipo_sepultura) and not isnull(ll_tipo_producto) and not isnull(ld_fecha_ctto) then
//	ls_string						= f_valida_precio(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque)
	if is_mod_precio <> 'N' then
		ls_string						= f_valida_precio(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque,ll_tipo_producto,ld_fecha_ctto)
		if ls_moneda='2' then //UF
			ldb_precio				= double(substr(1,1,ls_string))
			ldb_derecho				= double(substr(1,2,ls_string))
			ldb_cuota_mant		= double(substr(1,3,ls_string))
			ldb_liberador			= double(substr(1,4,ls_string))
			ldb_pie_minimo		= double(substr(1,5,ls_string))
			ll_reduccion				= long(substr(1,6,ls_string))
		else // peso
			ldb_precio				= double(long(substr(1,1,ls_string)))
			ldb_derecho				= double(long(substr(1,2,ls_string)))
			ldb_cuota_mant		= double(substr(1,3,ls_string))
			ldb_liberador			= double(long(substr(1,4,ls_string)))
			ldb_derecho				= ROUND((ldb_derecho / ldb_uf),0)
			ldb_pie_minimo		= double(substr(1,5,ls_string))
			ll_reduccion				= long(substr(1,6,ls_string))
		end if
		if ls_serie='R' or ls_uso='NI' then
			ldb_derecho				= 0
		end if
		dw_revision.setitem(1,'reduccion',ll_reduccion)
		dw_revision.setitem(1,'precio',ldb_precio)
		if ldb_precio = ldb_precio_ctto then dw_revision.setitem(1,'precio_contrato',ldb_precio)
		dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)

		ls_forma_pago				= dw_revision.getitemstring(1,'forma_pago')
		if dw_revision.getitemnumber(1,'pie') < ldb_pie_minimo and &
			dw_revision.getitemnumber(1,'pie')>=0 and ls_sw_pie='N' and (ls_forma_pago='2' or ls_forma_pago='4') then
			ldb_porce_pie									= (lld_pie / ldb_precio * 100)
			if ls_uso='NF' then
				SELECT 	count("CODIGO")
				INTO		:ll_resuelto
				FROM 	"CADENA"  
				WHERE	( "CADENA"."RUT" = :ll_rut ) AND  
							( "CADENA"."ESTADO" = 'R' )
				USING	sqlca;
				if isnull(ll_resuelto) then ll_resuelto=0
				if ll_resuelto=0 then
					ll_cod_obs 									= 4										
				else
					ll_cod_obs 									= 5
				end if
			elseif ls_uso='NI' then
				ll_cod_obs 										= 11	
			end if
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),ll_cod_obs)
			dw_revision.setfocus()
		end if
		SELECT	"REVISION_CONTRATOS"."PRECIO_CONTRATO"  
		INTO 		:ldb_precio_ctto_aux  
		FROM 		"REVISION_CONTRATOS"  
		WHERE  ( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
				 ( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
				 ( "REVISION_CONTRATOS"."NUMERO" = :ll_numero ) AND  
				 ( "REVISION_CONTRATOS"."RUT" = :ll_rut )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			if is_nuevo='S' and is_sw_pasa='S' then
				dw_revision.setitem(1,'precio_contrato',ldb_precio)
				is_sw_pasa				= 'N'
			else
				if dw_revision.getitemnumber(1,'precio_contrato')=0 then
					dw_revision.setitem(1,'precio_contrato',ldb_precio)
				end if
			end if
		end if
		dw_revision.setitem(1,'derecho_especial',ldb_derecho)
		dw_revision.setitem(1,'valor_cuota_mant',ldb_cuota_mant)
		ldb_liberador					= 0
	end if
end if
dw_revision.accepttext()
if is_mod_precio <> 'N' then
	ls_moneda						= dw_revision.getitemstring(1,'moneda')
	ld_fecha_1_venc				= date(dw_revision.getitemdatetime(1,'fecha_prim'))
	ld_fecha_ctto					= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
	ll_plazo							= dw_revision.getitemnumber(1,'plazo')
	ls_tipo_sepultura				= dw_revision.getitemstring(1,'tipo_sepult')
	ll_tipo_producto				= dw_revision.getitemnumber(1,'tipo_producto')
	ls_area							= dw_revision.getitemstring(1,'area')
	ll_capacidad						= dw_revision.getitemnumber(1,'capacidad')
	ls_uso							= dw_revision.getitemstring(1,'uso')
	ldb_uf								= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
	il_cod_parque					= dw_revision.getitemnumber(1,'cod_parque')
	if ll_plazo>0 then
		ll_dias						= ll_plazo * 30
		ld_fecha_ctto				= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
		ld_fecha_nac				= date(dw_revision.getitemdatetime(1,'fecha_nac'))
		if not isnull(ld_fecha_ctto) then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),3)
		end if
		if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),1)
		end if
		ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias)
		ld_fecha_ctto				= ld_fecha
	end if
	dw_revision.accepttext()
	ldb_precio						= double(dw_revision.getitemnumber(1,'precio_contrato'))
	lld_pie							= double(dw_revision.getitemnumber(1,'pie'))
	lld_gasto_uf						= double(dw_revision.getitemnumber(1,'gasto_adm'))
	if isnull(lld_pie) then lld_pie=0
	if isnull(lld_gasto_uf) then lld_gasto_uf=0
	if isnull(ldb_precio) or isnull(lld_gasto_uf) then
		dw_revision.setitem(1,'saldo_financiar',0)
	else
//		if ll_tipo_producto <> 15 or (ll_tipo_producto = 15 and (ldb_precio = 0 or isnull(ldb_precio) or lld_pie = 0 or isnull(lld_pie) or ll_plazo = 0 or isnull(ll_plazo) or il_modif > 0))   then
//			if idb_valor_cuota_calc <> lld_pie or lld_pie=0 or isnull(lld_pie) or il_modif > 0 then
				ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
//			end if
//		end if
	end if
	dw_revision.accepttext()
	lld_precio_contrato				= double(dw_revision.getitemnumber(1,'precio_contrato'))
	ldb_precio							= double(dw_revision.getitemnumber(1,'precio'))
	if lld_precio_contrato <> ldb_precio and ldb_precio>0 then
		lld_calc_desc					= 100 - round(((lld_precio_contrato * 100) / ldb_precio),2)
		ll_new							= dw_lista_obs.insertrow(0)
		dw_lista_obs.scrolltorow(0)
		dw_lista_obs.setitem(ll_new,'rut',ll_rut)
		dw_lista_obs.setitem(ll_new,'base',ls_base)
		dw_lista_obs.setitem(ll_new,'serie',ls_serie)
		dw_lista_obs.setitem(ll_new,'numero',ll_numero)
		dw_lista_obs.setitem(ll_new,'observacion','Se aplicó el '+string(lld_calc_desc,"###,##0.0#")+'% Descuento del Precio Lista')
		dw_lista_obs.accepttext()
	end if
	dw_revision.accepttext()
	ld_fecha_1_venc					= date(dw_revision.getitemdatetime(1,'fecha_prim'))
	ld_fecha_ctto						= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
	lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
	if isnull(lld_pie) then lld_pie=0
	if not isnull(ld_fecha_1_venc) then
		if not isnull(ld_fecha_ctto) then
			if lld_pie>0 then
				SELECT	"ANNO_INI"
				INTO		:ll_dias_venc
					FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
					WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 6
				USING	sqlca;
				if isnull(ll_dias_venc) then ll_dias_venc=0
				ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias_venc)
				if ld_fecha_1_venc > ld_fecha then
					ll_dif_dias				= DaysAfter(ld_fecha_ctto,ld_fecha_1_venc)
					wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_dif_dias),6)	
				end if
			elseif lld_pie=0 then
				SELECT	"ANNO_INI"
				INTO		:ll_dias_venc
					FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
					WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 9
				USING	sqlca;
				if isnull(ll_dias_venc) then ll_dias_venc=0
				ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias_venc)
				if ld_fecha_1_venc > ld_fecha then
					ll_dif_dias				= DaysAfter(ld_fecha_ctto,ld_fecha_1_venc)
					wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_dif_dias),9)		
				end if
			end if
		end if
		dw_revision.accepttext()
		ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
		lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
		lld_gasto_uf							= double(dw_revision.getitemnumber(1,'gasto_adm'))
		if isnull(lld_pie) then lld_pie=0
		if isnull(lld_gasto_uf) then lld_gasto_uf=0
		if isnull(ldb_precio) or isnull(lld_gasto_uf) then
			dw_revision.setitem(1,'saldo_financiar',0)
		else
//			if ll_tipo_producto <> 15 or (ll_tipo_producto = 15 and (ldb_precio = 0 or isnull(ldb_precio) or lld_pie = 0 or isnull(lld_pie) or ll_plazo = 0 or isnull(ll_plazo) or il_modif > 0))  then
//				if idb_valor_cuota_calc <> lld_pie or lld_pie=0 or isnull(lld_pie) or il_modif > 0 then
					ld_calculo				= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
					dw_revision.setitem(1,'saldo_financiar',ld_calculo)
//				end if
//			end if
		end if
		dw_revision.accepttext()
		ldt_fecha								= datetime(date(dw_revision.getitemdatetime(1,'fecha_ctto')),time('00:00:00'))
		ldt_fecha_prim						= dw_revision.getitemdatetime(1,'fecha_prim')
		lld_saldo_finan						= double(dw_revision.getitemnumber(1,'saldo_financiar'))
		ll_dias								= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
		ldt_fecha_venc_vig_factor		= dw_revision.getitemdatetime(1,'fecha_factor_vigente')
		ll_plazo								= dw_revision.getitemnumber(1,'plazo')
		ll_tipo_producto					= dw_revision.getitemnumber(1,'tipo_producto')
		idb_valor_cuota_calc				= Double(dw_revision.getitemnumber(1,'valor_cuota'))
		if ll_tipo_producto <> 15 or (ll_tipo_producto = 15 and (ldb_precio = 0 or isnull(ldb_precio) or lld_pie = 0 or isnull(lld_pie) or ll_plazo = 0 or isnull(ll_plazo) or il_modif > 0)) then
			if idb_valor_cuota_calc <> lld_pie or lld_pie=0 or isnull(lld_pie) or il_modif > 0 then
				if ll_dias>0 then dw_revision.setitem(1,'dias_vencimiento_prim',ll_dias)
				if not isnull(ll_plazo) and ll_plazo>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
					not isnull(ls_moneda) and not isnull(ldb_precio) then //not isnull(lld_gasto_uf) and lld_gasto_uf>0 and and ldb_precio>0
					if ldt_fecha_prim >= ldt_fecha then
						if ls_forma_pago='2' or ls_forma_pago='4' then
							if ll_plazo>=1 and ll_plazo<=11 then
								lld_saldo_finan	= double(dw_revision.getitemnumber(1,'saldo_financiar'))
								ll_plazo				= dw_revision.getitemnumber(1,'plazo')
								if ls_moneda='1' then //peso
									dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0))
								else
									dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4))
								end if
							else
								if ll_dias>=30 then
									SELECT	"FACTORES"."FACTOR",
												"FACTORES"."FACTOR_GASTO_ADM"
									INTO 		:lld_factor,
												:ldb_gasto_adm
									FROM 		"FACTORES"  
									WHERE  ( "FACTORES"."BASE" = :ls_base ) AND  
											 ( "FACTORES"."NRO_CUOTAS_INICIAL" >= :ll_plazo )  AND  
											 ( "FACTORES"."NRO_CUOTAS_FINAL" <= :ll_plazo )  AND  
											 (("FACTORES"."DIAS_INICIAL" >= :ll_dias )  AND  
											 ( "FACTORES"."DIAS_FINAL" <= :ll_dias ))  AND
											 ( "FACTORES"."MONEDA" = :ls_moneda ) AND
											 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor )
											 
									USING		sqlca;
									if lld_factor > 0 then //and lld_saldo_finan > 0
										dw_revision.setitem(1,'factor_cuota',lld_factor)
										if date(dw_revision.getitemdatetime(1,'fecha_ctto')) > date('01/10/2013') then
											ldb_gasto_adm		= 0
										end if
										dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
										dw_revision.accepttext()
										ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
										lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
										lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
										if isnull(lld_pie) then lld_pie=0
										if isnull(lld_gasto_uf) then lld_gasto_uf=0
										ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
										lld_saldo_finan	= round((lld_factor * ld_calculo),4)
										dw_revision.setitem(1,'valor_cuota',lld_saldo_finan)
										dw_revision.accepttext()
									else
										SELECT	"FACTORES"."FACTOR",
													"FACTORES"."FACTOR_GASTO_ADM"
										INTO 		:lld_factor,
													:ldb_gasto_adm
										FROM 		"FACTORES"  
										WHERE  ( "FACTORES"."BASE" = :ls_base ) AND  
												 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
												 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
												 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
												 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
												 ( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																					FROM 		"FACTORES" 
																					WHERE  ( "FACTORES"."BASE" = :ls_base ) AND 
																							 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																							 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																							 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																							 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																							 ( "FACTORES"."FACTOR" <> 0 ) ) )   ;
										if lld_factor > 0 then //and lld_saldo_finan > 0
											dw_revision.setitem(1,'factor_cuota',lld_factor)
											if date(dw_revision.getitemdatetime(1,'fecha_ctto')) > date('01/10/2013') then
												ldb_gasto_adm		= 0
											end if
											dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
											dw_revision.accepttext()
											ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
											lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
											lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
											if isnull(lld_pie) then lld_pie=0
											if isnull(lld_gasto_uf) then lld_gasto_uf=0
											ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
											lld_saldo_finan	= round((lld_factor * ld_calculo),4)
											dw_revision.setitem(1,'valor_cuota',lld_saldo_finan)
											dw_revision.accepttext()
										end if
									end if
								else
									SELECT	"FACTORES"."FACTOR",
												"FACTORES"."FACTOR_GASTO_ADM"
									INTO 		:lld_factor,
												:ldb_gasto_adm  
									FROM 		"FACTORES"  
									WHERE  ( "FACTORES"."BASE" = :ls_base ) AND  
											 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
											 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
											 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
											 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
											 ( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																				FROM 		"FACTORES" 
																				WHERE  ( "FACTORES"."BASE" = :ls_base ) AND 
																						 ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																						 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																						 ( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																						 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																						 ( "FACTORES"."FACTOR" <> 0 ) ) )   
									USING		sqlca;
									if lld_factor > 0 then //and lld_saldo_finan > 0
										dw_revision.setitem(1,'factor_cuota',lld_factor)
										if date(dw_revision.getitemdatetime(1,'fecha_ctto')) > date('01/10/2013') then
											ldb_gasto_adm		= 0
										end if
										dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
										dw_revision.accepttext()
										ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
										lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
										lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
										if isnull(lld_pie) then lld_pie=0
										if isnull(lld_gasto_uf) then lld_gasto_uf=0
										ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
										lld_saldo_finan	= round((lld_factor * ld_calculo),4)
										dw_revision.setitem(1,'valor_cuota',lld_saldo_finan)
										dw_revision.accepttext()
									end if
								end if
							end if
						end if
						dw_revision.accepttext()
						ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
						lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
						lld_gasto_uf							= double(dw_revision.getitemnumber(1,'gasto_adm'))
						if isnull(lld_pie) then lld_pie=0
						if isnull(lld_gasto_uf) then lld_gasto_uf=0
						if isnull(ldb_precio) or isnull(lld_gasto_uf) then
							dw_revision.setitem(1,'saldo_financiar',0)
						else
//							if ll_tipo_producto <> 15 or (ll_tipo_producto = 15 and (ldb_precio = 0 or isnull(ldb_precio) or lld_pie = 0 or isnull(lld_pie) or ll_plazo = 0 or isnull(ll_plazo)  or il_modif > 0)) then
//								if idb_valor_cuota_calc <> lld_pie or lld_pie=0 or isnull(lld_pie) or il_modif > 0 then
									ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
									dw_revision.setitem(1,'saldo_financiar',ld_calculo)
//								end if
//							end if
						end if
						dw_revision.accepttext()
					else
						ll_new	= dw_lista_obs.insertrow(0)
						dw_lista_obs.scrolltorow(0)
						dw_lista_obs.setitem(ll_new,'rut',ll_rut)
						dw_lista_obs.setitem(ll_new,'base',ls_base)
						dw_lista_obs.setitem(ll_new,'serie',ls_serie)
						dw_lista_obs.setitem(ll_new,'numero',ll_numero)
						dw_lista_obs.setitem(ll_new,'observacion','Recuerde Fecha Primer Vencimiento debe ser Mayor o Igual a la Fecha Contrato')
						dw_lista_obs.accepttext()
					end if
				end if
			end if
		end if
		dw_revision.accepttext()
		ll_renta											= dw_revision.getitemnumber(1,'renta_liquida')
		ls_forma_pago									= dw_revision.getitemstring(1,'forma_pago')
		if ll_renta>0 and (ls_forma_pago='2' or ls_forma_pago='4') then
			SELECT	"ANNO_INI"
			INTO		:ldb_porce
			FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
			WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 10
			USING	sqlca;
			if isnull(ll_dias_venc) then ll_dias_venc=0
			ldb_val_cta									= dw_revision.getitemnumber(1,'valor_cuota')
			ldb_val_uf									= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			if ls_moneda='2' then //UF
				ll_valor_cta								= round((ldb_val_cta * ldb_val_uf),0)
			end if
			ll_porce										= round((ll_valor_cuota * 100 ) / ll_renta,2)
			ll_10_porce									= (ll_renta * ldb_porce) / 100
			ldb_porcen_real							= round((ll_valor_cta * 100) / ll_renta,2)
			if ldb_porcen_real > ldb_porce then
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porcen_real),10)
			end if
		end if
	end if
end if
dw_revision.accepttext()
end subroutine

public subroutine wf_calcular (string as_base);string		ls_base,ls_serie,ls_dv,ls_base_asoc,ls_serie_asoc,ls_descrip_estado
long		ll_rut,ll_tot_reg,ll_reg,ll_new
double	ldb_uf_dia,ll_numero,ll_numero_asoc
datetime	ldt_fecha

dw_lista_obs.reset()
dw_revision.accepttext()
dw_base.accepttext()
cb_ver.enabled								= false
ls_base										= dw_base.getitemstring(1,'base')
ls_serie										= trim(ddlb_serie.text)
ll_numero									= Double(em_numero.text)
ll_rut											= Long(em_rut.text)
ls_dv											= trim(em_dv.text)
if ll_rut>0 then
	DECLARE x1 CURSOR FOR  
	SELECT	"SERIE",	"NRO_OFERTA"
	FROM 	"CO_PROP"  
	WHERE 	"CO_PROP"."RUT" = :ll_rut   
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		ls_base_asoc					= ls_base			//'O'
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :ls_serie_asoc,:ll_numero_asoc;
			if not isnull(ls_serie_asoc) and ls_serie_asoc<>'' then
				ll_tot_reg				= dw_lista_obs.rowcount()
				ll_reg 					= dw_lista_obs.Find("base = '"+ls_base_asoc+"' and serie = '"+ls_serie_asoc+"' and numero = "+string(ll_numero_asoc), 1, ll_tot_reg)
				SELECT	"ESTADO"."SIGLA_ESTADO"  
				INTO 		:ls_descrip_estado  
				FROM 	"CADENA",	"ESTADO"  
				WHERE	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
							(("CADENA"."CODIGO" = :ls_base_asoc ) AND  
						 	( "CADENA"."SERIE" = :ls_serie_asoc ) AND  
						 	( "CADENA"."NUMERO" = :ll_numero_asoc ) )   
				USING	sqlca;
				if ll_reg=0 or isnull(ll_reg) then
					ll_new				= dw_lista_obs.insertrow(0)
					dw_lista_obs.scrolltorow(0)
					dw_lista_obs.setitem(ll_new,'rut',ll_rut)
					dw_lista_obs.setitem(ll_new,'base',ls_base_asoc)
					dw_lista_obs.setitem(ll_new,'serie',ls_serie_asoc)
					dw_lista_obs.setitem(ll_new,'numero',ll_numero_asoc)
					dw_lista_obs.setitem(ll_new,'observacion','Es Beneficiario del Contrato Nº '+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', se encuentra en ESTADO: '+ls_descrip_estado)
					dw_lista_obs.accepttext()
					cb_ver.enabled		= true
				end if
			end if
			setnull(ls_serie_asoc)
		LOOP
		dw_lista_obs.accepttext()
	end if
	close x1;
	DECLARE x2 CURSOR FOR  
	SELECT	"SERIE",	"NUMERO"
	FROM 	"COPROP_ISACRUZ"  
	WHERE 	"COPROP_ISACRUZ"."RUT" = :ll_rut   
	USING	sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		ls_base_asoc					= 'C'
		DO WHILE sqlca.sqlcode=0
			fetch x2 into :ls_serie_asoc,:ll_numero_asoc;
			if not isnull(ls_serie_asoc) and ls_serie_asoc<>'' then
				ll_tot_reg				= dw_lista_obs.rowcount()
				ll_reg 					= dw_lista_obs.Find("base = '"+ls_base_asoc+"' and serie = '"+ls_serie_asoc+"' and numero = "+string(ll_numero_asoc), 1, ll_tot_reg)
				SELECT	"ESTADO"."SIGLA_ESTADO"  
				INTO 		:ls_descrip_estado  
				FROM 	"CADENA","ESTADO"  
				WHERE  	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
							(("CADENA"."CODIGO" = :ls_base_asoc ) AND  
						 	( "CADENA"."SERIE" = :ls_serie_asoc ) AND  
						 	( "CADENA"."NUMERO" = :ll_numero_asoc ) )   
				USING	sqlca;
				if ll_reg=0 or isnull(ll_reg) then
					ll_new				= dw_lista_obs.insertrow(0)
					dw_lista_obs.scrolltorow(0)
					dw_lista_obs.setitem(ll_new,'rut',ll_rut)
					dw_lista_obs.setitem(ll_new,'base',ls_base_asoc)
					dw_lista_obs.setitem(ll_new,'serie',ls_serie_asoc)
					dw_lista_obs.setitem(ll_new,'numero',ll_numero_asoc)
					dw_lista_obs.setitem(ll_new,'observacion','Es Beneficiario del Contrato Nº '+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', se encuentra en ESTADO: '+ls_descrip_estado)
					dw_lista_obs.accepttext()
					cb_ver.enabled		= true
				end if
			end if
			setnull(ls_serie_asoc)
		LOOP
		dw_lista_obs.accepttext()
	end if
	close x2;
end if
if ls_base='O' or ls_base='U' or ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' or ls_base='F' or ls_base='G' or ls_base='V' then
	ldt_fecha							= dw_revision.getitemdatetime(1,'fecha_ctto')
	SELECT	"TAB_UF"."VALOR_UF",	sysdate
	INTO 		:ldb_uf_dia ,			:gdt_fec_sistema
	FROM 	"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha
	USING	sqlca;
	if sqlca.sqlcode=0 then
		dw_revision.setitem(1,'uf_fecha_ctto',ldb_uf_dia)
	end if
end if
if ls_base='O' or ls_base='U' then
	wf_calcular_promesa() 
elseif ls_base='L' and  date(ldt_fecha) >= date('20/02/2023') then
	wf_calcular_liberador_iva()
elseif ls_base='A' or ls_base='P' or ls_base='D' or ls_base='L' and date(ldt_fecha) < date('20/02/2023') then
	wf_calcular_liberador()
elseif ls_base='R' or ls_base='C' then
	messagebox("Advertencia","Solo es Posible Revisar Promesas, Derecho Especial, Pagaré, Aumento Capacidad y Anexo Liberador")
elseif ls_base='F' or ls_base='G' or ls_base='V' then
	wf_calcular_producto()
end if
end subroutine

public subroutine wf_calcular_producto ();Date		ld_fecha_1_venc,ld_fecha_ctto,ld_fecha,ld_fecha_nac
Datetime	ldt_fecha,ldt_fecha_prim,ldt_nulo,ldt_fec_res_aux,ldt_fecha_venc_vig_factor,ldt_fecha_nac
String		ls_moneda,ls_uso,ls_string,ls_descrip_moneda,ls_base,ls_serie,ls_base_asoc,ls_serie_asoc,ls_dv,ls_descrip_estado,ls_texto_ctto,&
			ls_base_aux,ls_serie_aux,ls_forma_pago,ls_estado_aux,ls_falta,ls_moneda_res,ls_sw_pie,ls_moneda_rev
Double	ldb_precio_contrato,ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor,ld_calculo,ldb_uf,	ldb_derecho,ldb_cuota_mant,ldb_liberador,lld_calc_desc,&
			ldb_precio_ctto_aux,ldb_val_cta,ldb_val_uf,ll_porce,ldb_porcen_real,ldb_pie_minimo,ldb_pie_res,ll_cal_15,ldb_gasto_adm,ll_numero,ll_numero_asoc,ll_numero_aux,&
			ldb_iva,ldb_pie
Long		ll_plazo,ll_dias,ll_10_porce,ll_valor_cuota,ll_largototal,ll_posini,ll_gasto_peso,ll_valor_cta,ll_new,ll_fila,ll_rut,ll_cta_cli,ll_estado_serv,ll_cta,&
			ll_renta,ll_reg,ll_tot_reg,ll_tot_reg_rezago,ll_tot_reg_ctto_asoc,ll_indi,ll_sum_res=0,ll_tipo_servicio,ll_tipo_benef,ll_capacidad,ll_cod_parque

setnull(ldt_nulo)
dw_revision.accepttext()
ls_sw_pie										= 'N'
ll_rut												= long(em_rut.text)
ls_dv												= trim(em_dv.text)
ls_base											= dw_base.getitemstring(1,'base')
ls_serie											= trim(ddlb_serie.text)
ll_numero										= Double(em_numero.text)

SELECT 	iva		INTO :ldb_iva	FROM tasa;
if ls_base <> 'G' and ls_base <> 'F' then ldb_iva=0
	
dw_revision.setitem(1,'iva_cuota',ldb_iva) 
dw_revision.setitem(1,'iva_pie',ldb_iva)

wf_valida_producto(ll_rut,ls_base,ls_serie,ll_numero)

ll_tot_reg_rezago								= dw_lista_rezagos.rowcount()
if ll_tot_reg_rezago>0 then
	ll_new										= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	if ll_tot_reg_rezago=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimiento de Pago en Rezago')
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimientos de Pagos en Rezago')
	end if
	dw_lista_obs.setitem(ll_new,'correlativo',dw_lista_obs.rowcount())
	dw_lista_obs.accepttext()
end if
ll_tot_reg_ctto_asoc							= dw_ctto_asoc.rowcount()
if ll_tot_reg_ctto_asoc>0 then
	ll_new										= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	for ll_indi=1 to ll_tot_reg_ctto_asoc
		ls_base_aux								= dw_ctto_asoc.getitemstring(ll_indi,'cadena_codigo')
		ls_serie_aux								= dw_ctto_asoc.getitemstring(ll_indi,'cadena_serie')
		ll_numero_aux							= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_numero')
		ls_estado_aux							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_estado')
		ldt_fec_res_aux						= dw_ctto_asoc.getitemdatetime(ll_indi,'cadena_fecha_res')
		ls_texto_ctto							= ls_texto_ctto + ls_base_aux+'-'+ls_serie_aux+'-'+string(ll_numero_aux,"###,###,###,###,###")
		if ll_indi<>ll_tot_reg_ctto_asoc then
			ls_texto_ctto						= ls_texto_ctto+', '
		end if
		if ls_estado_aux='R' and year(date(ldt_fec_res_aux))>=2004 then
			ll_sum_res ++
		end if
	next
	if ll_tot_reg_ctto_asoc=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contrato Asociado '+ls_texto_ctto)
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contratos Asociados '+ls_texto_ctto)
	end if
	dw_lista_obs.setitem(ll_new,'correlativo',dw_lista_obs.rowcount())
	ls_forma_pago								= dw_revision.getitemstring(1,'forma_pago')
	dw_lista_obs.accepttext()
end if
ld_fecha_nac									= date(dw_revision.getitemdatetime(1,'fecha_nac'))
ld_fecha_ctto									= date(dw_revision.getitemdatetime(1,'fecha_ctto'))

SELECT	"TAB_UF"."VALOR_UF"
INTO		:ldb_uf
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha_ctto
USING	sqlca;
if isnull(ldb_uf) then ldb_uf=0 

dw_revision.setitem(1,'uf_fecha_ctto',ldb_uf)


if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),1)
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),3)
end if

dw_revision.accepttext()
dw_lista_obs.accepttext()
ls_moneda										= dw_revision.getitemstring(1,'moneda')
ls_moneda_rev									= ls_moneda
ld_fecha_1_venc								= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto									= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo											= dw_revision.getitemnumber(1,'plazo')
ls_uso											= dw_revision.getitemstring(1,'uso')
ldb_uf												= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque									= dw_revision.getitemnumber(1,'cod_parque')
ls_forma_pago									= dw_revision.getitemstring(1,'forma_pago')

ldb_precio										= double(dw_revision.getitemnumber(1,'precio'))
ldb_precio_contrato							= double(dw_revision.getitemnumber(1,'precio_contrato'))

lld_pie											= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf										= double(dw_revision.getitemnumber(1,'gasto_adm'))
ll_tipo_servicio									= dw_revision.getitemnumber(1,'codigo_servicio')
ll_tipo_benef									= dw_revision.getitemnumber(1,'tipo_beneficiarios')
ll_capacidad										= dw_revision.getitemnumber(1,'capacidad')
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio_contrato) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
	ld_calculo									= ( ( ldb_precio_contrato - lld_pie ) + lld_gasto_uf )
	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
end if
dw_revision.accepttext()
lld_saldo_finan									= double(dw_revision.getitemnumber(1,'saldo_financiar'))
if not isnull(ls_forma_pago) then
	if ls_forma_pago<>'2' and ls_forma_pago <> '4' then
		dw_revision.setitem(1,'factor_cuota',0)
		dw_revision.setitem(1,'gasto_adm',0)
		if lld_saldo_finan>0 and ll_plazo>0 then
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0))
			else
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4))
			end if
		end if
	end if
end if
if not isnull(ll_tipo_benef) and not isnull(ll_capacidad) and not isnull(ls_uso) and not isnull(ldb_uf) and not isnull(il_cod_parque) and not isnull(ll_tipo_servicio) and not isnull(ll_tipo_benef) then
	SELECT	count("BASE")
	INTO 		:ll_cta
	FROM 	"PRODUCTO_VENTA_ASOCIADA"  
	WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R' OR "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' )
	USING	sqlca;
	if isnull(ll_cta) then ll_cta=0
	
	if ll_cta=0 then
		ls_string										= f_valida_precio_prducto(ll_tipo_benef,ll_capacidad,ll_tipo_servicio,ls_uso,ldb_uf,ls_moneda_rev)
		ldb_precio									= double(substr(1,1,ls_string)) 
		ldb_derecho									= double(substr(1,2,ls_string))
		ldb_pie_minimo							= double(substr(1,3,ls_string))
		ls_moneda									= substr(1,4,ls_string)
	else
		SELECT	 sum("VALOR_PRODUCTO")
		INTO 		:ldb_precio 
		FROM 	"PRODUCTO_VENTA_ASOCIADA"  
		WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R' OR "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' )
		USING	sqlca;
		if isnull(ldb_precio) then ldb_precio=0			
		
		
		ll_tipo_servicio								= dw_revision.getitemnumber(1,'codigo_servicio')
		ll_tipo_benef								= dw_revision.getitemnumber(1,'tipo_beneficiarios')
		ll_capacidad									= dw_revision.getitemnumber(1,'capacidad')
		ldb_pie										= dw_revision.getitemnumber(1,'pie')
		if isnull(ldb_pie) then ldb_pie=0
		SELECT	"PRODUCTO_LISTA_PRECIO"."MONEDA"
		INTO		:ls_moneda
		FROM 	"PRODUCTO_LISTA_PRECIO"
		WHERE 	"PRODUCTO_LISTA_PRECIO"."TIPO_BENEFICIARIO" = :ll_tipo_benef AND
					"PRODUCTO_LISTA_PRECIO"."CANTIDAD_BENEF" = :ll_capacidad AND
					"PRODUCTO_LISTA_PRECIO"."CODIGO_SERVICIO" = :ll_tipo_servicio AND
					"PRODUCTO_LISTA_PRECIO"."USO" = :ls_uso AND
					"PRODUCTO_LISTA_PRECIO"."MONEDA" = :ls_moneda AND
					"PRODUCTO_LISTA_PRECIO"."ESTADO_REG" = 'V'
		USING	sqlca;
		if isnull(ls_moneda) then ls_moneda='1'
		ldb_derecho									= 0
		ldb_pie_minimo							= 0
	end if
	if ls_moneda_rev = '1' then
		if ls_moneda='1' then
			ldb_precio								= ldb_precio
		elseif ls_moneda='2' then
			ldb_precio								= round(ldb_precio * ldb_uf,0)
		end if
	elseif ls_moneda_rev='2' then
		if ls_moneda='1' then
			ldb_precio								= round(ldb_precio / ldb_uf,2)
		elseif ls_moneda='2' then
			ldb_precio								= ldb_precio
		end if
	end if
	
	dw_revision.setitem(1,'precio',ldb_precio)
	dw_revision.setitem(1,'precio_venta',ldb_precio)
//	dw_revision.setitem(1,'precio_contrato',ldb_precio_contrato)
//	dw_revision.setitem(1,'precio_contrato',ldb_precio)
	dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
//	dw_revision.setitem(1,'moneda',ls_moneda)
	if ll_plazo=1 then
		if ls_moneda='1' then //peso
			dw_revision.setitem(1,'valor_cuota',round((ldb_precio_contrato - ldb_pie),0))
		else
			dw_revision.setitem(1,'valor_cuota',round((ldb_precio_contrato - ldb_pie),4))
		end if
	end if	
	dw_revision.accepttext()
	
	
	ls_forma_pago						= dw_revision.getitemstring(1,'forma_pago')
	SELECT	"REVISION_CONTRATOS"."PRECIO_CONTRATO"  
	INTO 		:ldb_precio_ctto_aux  
	FROM 	"REVISION_CONTRATOS"  
	WHERE 	"REVISION_CONTRATOS"."BASE" = :ls_base AND  
			 	"REVISION_CONTRATOS"."SERIE" = :ls_serie AND  
			 	"REVISION_CONTRATOS"."NUMERO" = :ll_numero AND  
			 	"REVISION_CONTRATOS"."RUT" = :ll_rut   
	USING	sqlca;
	if sqlca.sqlcode<>0 then
		if is_nuevo='S' and is_sw_pasa='S' then
			dw_revision.setitem(1,'precio_contrato',ldb_precio_contrato)
			is_sw_pasa							= 'N'
		else
			if dw_revision.getitemnumber(1,'precio_contrato')=0 then
				dw_revision.setitem(1,'precio_contrato',ldb_precio_contrato)
			end if
		end if
	end if
	dw_revision.setitem(1,'derecho_especial',ldb_derecho)
	dw_revision.setitem(1,'valor_cuota_mant',ldb_cuota_mant)
	ldb_liberador								= 0
end if
dw_revision.accepttext()
ls_moneda										= dw_revision.getitemstring(1,'moneda')
ld_fecha_1_venc								= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto									= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo											= dw_revision.getitemnumber(1,'plazo')
ls_uso											= dw_revision.getitemstring(1,'uso')
ldb_uf												= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque									= dw_revision.getitemnumber(1,'cod_parque')
ldb_precio										= double(dw_revision.getitemnumber(1,'precio'))
ldb_precio_contrato							= double(dw_revision.getitemnumber(1,'precio_contrato'))
lld_pie											= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf										= double(dw_revision.getitemnumber(1,'gasto_adm'))
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio_contrato) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
	ld_calculo									= ( ( ldb_precio_contrato - lld_pie ) + lld_gasto_uf )
	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
end if
dw_revision.accepttext()

ldb_precio_contrato							= double(dw_revision.getitemnumber(1,'precio_contrato'))
ldb_precio										= double(dw_revision.getitemnumber(1,'precio'))

if ldb_precio_contrato <> ldb_precio and ldb_precio>0 then
	lld_calc_desc								= 100 - round(((ldb_precio_contrato * 100) / ldb_precio),2)
	ll_new										= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	dw_lista_obs.setitem(ll_new,'observacion','Se aplicó el '+string(lld_calc_desc,"###,##0.0#")+'% Descuento del Precio Lista')
	dw_lista_obs.accepttext()
end if
dw_revision.accepttext()
ld_fecha_1_venc								= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto									= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
lld_pie											= double(dw_revision.getitemnumber(1,'pie'))
if isnull(lld_pie) then lld_pie=0
if not isnull(ld_fecha_1_venc) then
	if not isnull(ld_fecha_ctto) then
		if lld_pie>0 then
			ld_fecha								= RelativeDate(ld_fecha_ctto, 60)
			if ld_fecha_1_venc > ld_fecha then
				ll_new							= dw_lista_obs.insertrow(0)
				dw_lista_obs.scrolltorow(0)
				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
				dw_lista_obs.setitem(ll_new,'base',ls_base)
				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
				dw_lista_obs.setitem(ll_new,'observacion','Fecha 1º Vencimiento No puede ser Mayor a 60 dias, a partir de la Fecha del Contrato')
				dw_lista_obs.accepttext()
			end if
		elseif lld_pie=0 then
			ld_fecha								= RelativeDate(ld_fecha_ctto, 50)
			if ld_fecha_1_venc > ld_fecha then
				ll_new							= dw_lista_obs.insertrow(0)
				dw_lista_obs.scrolltorow(0)
				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
				dw_lista_obs.setitem(ll_new,'base',ls_base)
				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
				dw_lista_obs.setitem(ll_new,'observacion','Fecha 1º Vencimiento No puede ser Mayor a 30 dias, a partir de la Fecha del Contrato')
				dw_lista_obs.accepttext()
			end if
		end if
	end if
	dw_revision.accepttext()
	ldt_fecha										= datetime(date(dw_revision.getitemdatetime(1,'fecha_ctto')),time('00:00:00'))
	ldt_fecha_prim								= dw_revision.getitemdatetime(1,'fecha_prim')
	lld_saldo_finan								= double(dw_revision.getitemnumber(1,'saldo_financiar'))
	ll_dias										= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
	ldt_fecha_venc_vig_factor				= dw_revision.getitemdatetime(1,'fecha_factor_vigente')
	ll_plazo										= dw_revision.getitemnumber(1,'plazo')
	if ll_dias>0 then dw_revision.setitem(1,'dias_vencimiento_prim',ll_dias)
	if not isnull(ll_plazo) and ll_plazo>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
		not isnull(ls_moneda) and not isnull(ldb_precio_contrato) then //not isnull(lld_gasto_uf) and lld_gasto_uf>0 and and ldb_precio>0
		if ldt_fecha_prim >= ldt_fecha then
			if ls_forma_pago='2' or ls_forma_pago='4' then
				if ll_plazo>=1 and ll_plazo<=11 then
					lld_saldo_finan				= double(dw_revision.getitemnumber(1,'saldo_financiar'))
					ll_plazo						= dw_revision.getitemnumber(1,'plazo')
					if ls_moneda='1' then //peso
						dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0))
					else
						dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4))
					end if
				else
					if ll_dias>=30 then
						SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
						INTO 		:lld_factor,	:ldb_gasto_adm
						FROM 	"FACTORES"  
						WHERE 	( "FACTORES"."BASE" = :ls_base ) AND  
								 	( "FACTORES"."NRO_CUOTAS_INICIAL" >= :ll_plazo )  AND  
								 	( "FACTORES"."NRO_CUOTAS_FINAL" <= :ll_plazo )  AND  
								 	(("FACTORES"."DIAS_INICIAL" >= :ll_dias )  AND  
								 	( "FACTORES"."DIAS_FINAL" <= :ll_dias ))  AND
								 	( "FACTORES"."MONEDA" = :ls_moneda ) AND
								 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor )
						USING	sqlca;
						if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
							ldb_gasto_adm		= 0
						end if
						if lld_factor > 0 then //and lld_saldo_finan > 0
							dw_revision.setitem(1,'factor_cuota',lld_factor)
							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
							dw_revision.accepttext()
							ldb_precio_contrato	= double(dw_revision.getitemnumber(1,'precio_contrato'))
							ldb_precio				= double(dw_revision.getitemnumber(1,'precio'))
							lld_pie					= double(dw_revision.getitemnumber(1,'pie'))
							lld_gasto_uf				= double(dw_revision.getitemnumber(1,'gasto_adm'))
							ld_calculo				= ( ( ldb_precio_contrato - lld_pie ) + lld_gasto_uf )
							lld_saldo_finan			= round((lld_factor * ld_calculo),4)
							if ls_moneda='1' then
								dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,0))
							else
								dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,4))
							end if
						else
							SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
							INTO 		:lld_factor,	:ldb_gasto_adm
							FROM 	"FACTORES"  
							WHERE  	( "FACTORES"."BASE" = :ls_base ) AND  
									 	( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
									 	( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
									 	( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 	 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
									 	( "FACTORES"."DIAS_INICIAL" = (	SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																					FROM 	"FACTORES" 
																					WHERE	( "FACTORES"."BASE" = :ls_base ) AND 
																			    					( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																				 				( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																				 				( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																				 				( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																				 				( "FACTORES"."FACTOR" <> 0 ) ) )   ;
							if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
								ldb_gasto_adm		= 0
							end if
							if lld_factor > 0 then //and lld_saldo_finan > 0
								dw_revision.setitem(1,'factor_cuota',lld_factor)
								dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
								dw_revision.accepttext()
								ldb_precio_contrato			= double(dw_revision.getitemnumber(1,'precio_contrato'))
								lld_pie							= double(dw_revision.getitemnumber(1,'pie'))
								lld_gasto_uf						= double(dw_revision.getitemnumber(1,'gasto_adm'))
								ld_calculo						= ( ( ldb_precio_contrato - lld_pie ) + lld_gasto_uf )
								lld_saldo_finan					= round((lld_factor * ld_calculo),4)
								if ls_moneda='1' then
									dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,0))
								else
									dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,4))
								end if
							end if
						end if
					else
						SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
						INTO 		:lld_factor,	:ldb_gasto_adm  
						FROM 	"FACTORES"  
						WHERE 	( "FACTORES"."BASE" = :ls_base ) AND  
									( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 	( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
								 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
								 	( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 	( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																				FROM 	"FACTORES" 
																				WHERE  ( "FACTORES"."BASE" = :ls_base ) AND 
																			 				( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																			 				( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																			 				( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																			 				( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 				( "FACTORES"."FACTOR" <> 0 ) ) )   
						USING		sqlca;
						if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
							ldb_gasto_adm			= 0
						end if
						if lld_factor > 0 then //and lld_saldo_finan > 0
							dw_revision.setitem(1,'factor_cuota',lld_factor)
							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
							dw_revision.accepttext()
							ldb_precio_contrato	= double(dw_revision.getitemnumber(1,'precio_contrato'))
							ldb_precio				= double(dw_revision.getitemnumber(1,'precio'))
							lld_pie					= double(dw_revision.getitemnumber(1,'pie'))
							lld_gasto_uf				= double(dw_revision.getitemnumber(1,'gasto_adm'))
							ld_calculo				= ( ( ldb_precio_contrato - lld_pie ) + lld_gasto_uf )
							lld_saldo_finan			= round((lld_factor * ld_calculo),4)
							if ls_moneda='1' then
								dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,0))
							else
								dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,4))
							end if
						end if
					end if
				end if
			end if
			dw_revision.accepttext()
			ldb_precio_contrato					= double(dw_revision.getitemnumber(1,'precio_contrato'))
			ldb_precio								= double(dw_revision.getitemnumber(1,'precio'))
			lld_pie									= double(dw_revision.getitemnumber(1,'pie'))
			lld_gasto_uf								= double(dw_revision.getitemnumber(1,'gasto_adm'))
			if isnull(lld_pie) then lld_pie=0
			if isnull(lld_gasto_uf) then lld_gasto_uf=0
			if isnull(ldb_precio_contrato) or isnull(lld_gasto_uf) then
				dw_revision.setitem(1,'saldo_financiar',0)
			else
				ld_calculo							= ( ( ldb_precio_contrato - lld_pie ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
			end if
			dw_revision.accepttext()
		else
			ll_new									= dw_lista_obs.insertrow(0)
			dw_lista_obs.scrolltorow(0)
			dw_lista_obs.setitem(ll_new,'rut',ll_rut)
			dw_lista_obs.setitem(ll_new,'base',ls_base)
			dw_lista_obs.setitem(ll_new,'serie',ls_serie)
			dw_lista_obs.setitem(ll_new,'numero',ll_numero)
			dw_lista_obs.setitem(ll_new,'observacion','Recuerde Fecha Primer Vencimiento debe ser Mayor o Igual a la Fecha Contrato')
			dw_lista_obs.accepttext()
		end if
	end if
	dw_revision.accepttext()
	ll_renta											= dw_revision.getitemnumber(1,'renta_liquida')
	ls_forma_pago									= dw_revision.getitemstring(1,'forma_pago')
	
	
//	if ll_renta>0 and (ls_forma_pago='2' or ls_forma_pago='4') then
		if ls_moneda='1' then //peso
			ldb_val_cta								= round(dw_revision.getitemnumber(1,'valor_cuota'),0)
//			ll_porce									= round((long(dw_revision.getitemnumber(1,'valor_cuota')) * 100 ) / ll_renta,2)
//			ll_10_porce								= round((ll_renta * 10) / 100,0)
//			ldb_porcen_real						= round((ldb_val_cta * 100) / ll_renta,2)
//			if ldb_porcen_real > 10 then
//				ll_new								= dw_lista_obs.insertrow(0)
//				dw_lista_obs.scrolltorow(0)
//				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
//				dw_lista_obs.setitem(ll_new,'base',ls_base)
//				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
//				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
//				dw_lista_obs.setitem(ll_new,'observacion','Valor Cuota es un '+string(ldb_porcen_real,"##0.0#")+'% de Renta Líquida declarada, recuerde no debe ser Mayor al 10%')
//				dw_lista_obs.accepttext()
//				dw_revision.setfocus()
//			end if
		elseif ls_moneda='2' then //UF
			ldb_val_cta								= dw_revision.getitemnumber(1,'valor_cuota')
			ldb_val_uf								= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ll_valor_cta								= round((ldb_val_cta * ldb_val_uf),0)
//			ll_porce									= round((ll_valor_cuota * 100 ) / ll_renta,2)
//			ll_10_porce								= (ll_renta * 10) / 100
//			ldb_porcen_real						= round((ll_valor_cta * 100) / ll_renta,2)
//			if ldb_porcen_real > 10 then
//				ll_new								= dw_lista_obs.insertrow(0)
//				dw_lista_obs.scrolltorow(0)
//				dw_lista_obs.setitem(ll_new,'rut',ll_rut)
//				dw_lista_obs.setitem(ll_new,'base',ls_base)
//				dw_lista_obs.setitem(ll_new,'serie',ls_serie)
//				dw_lista_obs.setitem(ll_new,'numero',ll_numero)
//				dw_lista_obs.setitem(ll_new,'observacion','Valor Cuota es un '+string(ldb_porcen_real,"##0.0#")+'% de Renta Líquida declarada, recuerde no debe ser Mayor al 10%')
//				dw_lista_obs.accepttext()
//				dw_revision.setfocus()
//			end if
		end if
	//end if
end if
dw_revision.accepttext()
end subroutine

public function double wf_valor_mant (string as_base, string as_serie, double al_numero);double	ldb_valor_mant

il_periodo_mant		= 0
//wf_valor_mant(as_base,as_serie,al_numero)
if as_base='O' or as_base='U' then
	SELECT	"OFERTA_V"."VALOR_CUOTA_M","CADENA"."ESTADO_MORA_MANTENCION"  
	INTO		:ldb_valor_mant,:il_periodo_mant  
	FROM		"CADENA","OFERTA_V"  
	WHERE	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				( ( "CADENA"."CODIGO" = :as_base ) AND  
				( "CADENA"."SERIE" = :as_serie ) AND  
				( "CADENA"."NUMERO" = :al_numero ) )
	USING	sqlca;
elseif  as_base='C' then
	SELECT	"CONTRATO"."VALOR_CUOTA_M","CADENA"."ESTADO_MORA_MANTENCION"    
   	INTO 		:ldb_valor_mant,:il_periodo_mant   
    	FROM 	"CADENA","CONTRATO"  
   	WHERE	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
         		( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
         		( ( "CADENA"."CODIGO" = :as_base ) AND  
         		( "CADENA"."SERIE" = :as_serie ) AND  
         		( "CADENA"."NUMERO" = :al_numero ) )
	USING	sqlca;
end if

if il_periodo_mant=0 then
	ldb_valor_mant				= ldb_valor_mant * 12
elseif il_periodo_mant=1 then
	ldb_valor_mant				= ldb_valor_mant * 2
elseif il_periodo_mant=2 then
	ldb_valor_mant				= ldb_valor_mant * 1	
end if

if isnull(ldb_valor_mant) or ldb_valor_mant=0 then ldb_valor_mant=0
return ldb_valor_mant


end function

protected subroutine wf_observ (string as_base, string as_serie, double al_numero, double adb_rut, string as_parametro, long al_cod_obs);string		ls_obs,ls_exit='N',ls_existe='N',ls_forma_pago
long		ll_tot_reg,ll_indi,ll_cod_obs,ll_edad,ll_new
date		ld_fec_ctto,ld_fec_nac,ldt_nulo

//wf_observ(as_base,as_serie,al_numero,adb_rut,as_parametro,al_cod_obs)
setnull(ldt_nulo)
dw_seguro.accepttext()
dw_revision.accepttext()
dw_lista_obs.accepttext()

ll_tot_reg				= dw_lista_obs.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_cod_obs			= dw_lista_obs.getitemnumber(ll_indi,'codigo_obs')
	if al_cod_obs = ll_cod_obs then
		ls_exit			= 'S'
	end if
	if ls_exit='S' then
		ls_existe			= ls_exit
	end if
next
if ls_existe='N' then
	if al_cod_obs=1 then
		ld_fec_ctto						= date(as_parametro)
		ld_fec_nac						= date(dw_revision.getitemdatetime(1,'fecha_nac'))
		ls_forma_pago					= dw_revision.getitemstring(1,'forma_pago')
		if ld_fec_nac<ld_fec_ctto then
			ll_edad						= f_edad(ld_fec_ctto,ld_fec_nac)
			if ll_edad<18 then
				ls_obs					= 'Cliente Menor de Edad'
			else
//				if ls_forma_pago='2' then 
					ls_obs				= f_rev_ctto_observacion(string(ll_edad),al_cod_obs)
//				end if
			end if
			dw_revision.setitem(1,'edad',ll_edad)
			dw_seguro.setitem(1,'edad',ll_edad)
		else
			messagebox("Advertencia","Error... Fecha de Contrato debe ser MAYOR a Fecha de Nacimiento")
			dw_revision.setfocus()
			dw_revision.setcolumn('fecha_nac')
		end if
	else
		ls_obs							= f_rev_ctto_observacion(as_parametro,al_cod_obs)
	end if	
	if not isnull(ls_obs) and ls_obs<>'' then
		ll_new						= dw_lista_obs.insertrow(0)
		dw_lista_obs.scrolltorow(0)
		dw_lista_obs.setitem(ll_new,'rut',adb_rut)
		dw_lista_obs.setitem(ll_new,'base',as_base)
		dw_lista_obs.setitem(ll_new,'serie',as_serie)
		dw_lista_obs.setitem(ll_new,'numero',al_numero)
		dw_lista_obs.setitem(ll_new,'observacion',ls_obs)
		dw_lista_obs.setitem(ll_new,'codigo_obs',al_cod_obs)
	end if
	dw_lista_obs.accepttext()
end if
end subroutine

public function string wf_capacidad_total (string as_base, string as_serie, double adb_numero);string		ls_estado
long		ll_cap_tot,ll_fall,ll_tot_reg

//wf_capacidad_total(as_base,as_serie,adb_numero)

if as_base= 'O' or as_base='U'  then
	SELECT	("PAGO_OFERTA"."CAPACIDAD" + "PAGO_OFERTA"."N_REDUCCION")
	INTO		:ll_cap_tot
	FROM 	"OFERTA_V","PAGO_OFERTA"  
	WHERE	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
				"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
				"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
				"OFERTA_V"."SERIE" = :as_serie AND  
				"OFERTA_V"."NRO_OFERTA" = :adb_numero
	USING	sqlca;
elseif as_base= 'C' then
	SELECT	("CAPACIDAD" + "N_REDUCCION")
	INTO		:ll_cap_tot
	FROM 	"CONTRATO"
	WHERE	"CONTRATO"."SERIE_C" = :as_serie AND  
				"CONTRATO"."NRO_CONTRATO" = :adb_numero
	USING	sqlca;
end if
if isnull(ll_cap_tot) then ll_cap_tot=0

SELECT	"CADENA_MORA"."FALLECIDOS"
INTO		:ll_fall
FROM 	"CADENA_MORA"  
WHERE	"CADENA_MORA"."BASE" = :as_base AND  
     		"CADENA_MORA"."SERIE" = :as_serie AND  
      		"CADENA_MORA"."NUMERO" = :adb_numero
USING	sqlca;
if isnull(ll_fall) then ll_fall=0
 ll_tot_reg					= ll_cap_tot - ll_fall
 if ll_tot_reg<=0 then
	ls_estado				= 'OCUP'
else
	ls_estado				= 'DISP'
end if
if isnull(ls_estado) then ls_estado	= 'DISP'
Return ls_estado
	
	
end function

public subroutine wf_ddlb_serie (string as_base);string	ls_serie

//wf_ddlb_serie(as_base)
DECLARE x1 CURSOR FOR
SELECT	DISTINCT "CD_TIPO_SERIE"."SERIE"
FROM 				  "CD_TIPO_SERIE"
WHERE				 ( "CD_TIPO_SERIE"."BASE" = :as_base) AND
						 ( "CD_TIPO_SERIE"."REVISION_CTTO" = 'S' )
ORDER BY	"CD_TIPO_SERIE"."SERIE" ASC
USING    sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_serie;
		if not isnull(ls_serie) and ls_serie <> '' then
			ddlb_serie.AddItem(ls_serie)
		end if
		Setnull(ls_serie)
	LOOP
end if
close x1;
end subroutine

public subroutine wf_cliente_rut (double ldb_rut);string	ls_string
long	ll_cant,ll_resp

//wf_cliente_rut(ldb_rut)

dw_clientes.settransobject(sqlca)
ll_cant												= dw_clientes.Retrieve(ldb_rut)
if ll_cant = 0 THEN
	dw_clientes.insertrow(0)
	ll_resp 											= MessageBox("Advertencia", "Cliente NO Existe, desea Ingresarlo", Exclamation!, YesNo!, 2)
	if ll_resp = 1 THEN
		ls_string										= 'N'+'~t'+string(il_tipo_cliente)
		if ldb_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
	else
		em_rut.text									= ''
		em_dv.text									= ''
		em_rut.enabled							= true
		em_dv.enabled								= true
		em_rut.setfocus()
	end if
else
	//cb_aceptar.enabled							= true
	//dw_anexo_funeraria.enabled				= true
	dw_revision.setitem(1,'rut',ldb_rut)
	dw_revision.setitem(1,'dv',dw_clientes.getitemstring(1,'dv'))	
	em_dv.text										= dw_clientes.getitemstring(1,'dv')
	dw_clientes.enabled							= true
	dw_seguro.enabled							= true
end if
	
end subroutine

public subroutine wf_valida_producto (long al_rut, string as_base, string as_serie, long al_numero);string		ls_dv,ls_base,ls_uso,ls_moneda
long		ll_tot_reg,ll_activa,ll_estado_cd,ll_digitado,ll_cod_parque,ll_cta_cli,ll_nulo,ll_indi,ll_tot_reg_seg,ll_codigo_servicio,ll_capacidad
datetime	ldt_fecha_nac,ldt_nulo

setnull(ldt_nulo)
Setnull(ll_nulo)
dw_revision.accepttext()
ll_tot_reg			= dw_revision.rowcount()
if ll_tot_reg>0 and al_numero > 0 then
	ls_dv					= dw_revision.getitemstring(1,'dv')
	ll_cod_parque		= dw_revision.getitemnumber(1,'cod_parque')
	ll_activa				= dw_revision.getitemnumber(1,'sw_activa_servicio') 		
	ls_moneda			= dw_revision.getitemstring(1,'moneda')
	ll_codigo_servicio	= dw_revision.getitemnumber(1,'codigo_servicio')
	SELECT	count("CADENA"."CODIGO")
	INTO		:ll_digitado
	FROM		"CADENA"  
	WHERE	"CADENA"."CODIGO" = :as_base AND  
				"CADENA"."SERIE" = :as_serie AND  
				"CADENA"."NUMERO" = :al_numero
	USING	sqlca;
	
	SELECT	"CD_FOLIO"."ULT_ESTADO",	"CD_FOLIO"."COD_PARQUE"
	INTO		:ll_estado_cd,						:il_cod_parque
	FROM		"CD_FOLIO"  
	WHERE	"CD_FOLIO"."BASE" = :as_base AND  
				"CD_FOLIO"."SERIE" = :as_serie AND  
				"CD_FOLIO"."NUMERO" = :al_numero
	USING	sqlca;
	if isnull(ll_estado_cd) then ll_estado_cd=0
	
	if ll_estado_cd = 11 and ll_digitado > 0 then
		dw_seguro.visible											= false
		dw_revision.enabled										= true
		dw_revision.object.cod_parque.protect				= 1
		dw_revision.object.fecha_ctto.protect					= 1
		dw_revision.object.fecha_nac.protect					= 1
		dw_revision.object.renta_liquida.protect				= 1
//		dw_revision.object.uso.protect							= 1
//		dw_revision.object.tipo_beneficiarios.protect		= 1
//		dw_revision.object.capacidad.protect					= 1
//		dw_revision.object.codigo_servicio.protect			= 1
//		dw_revision.object.moneda.protect					= 1
//		dw_revision.object.forma_pago.protect				= 1
//		dw_revision.object.pie.protect							= 1
//		dw_revision.object.plazo.protect						= 1
//		dw_revision.object.origen_venta.protect				= 1
//		dw_revision.object.precio_contrato.protect			= 1
		if ll_activa = 0 then
			if as_base='F' or as_base='G' or as_base='V' then
				dw_revision.object.sw_activa_servicio.protect	= 0
				dw_revision.setfocus()
				dw_revision.setcolumn('sw_activa_servicio')
			else
				dw_revision.object.sw_activa_servicio.protect	= 1
				dw_revision.enabled									= false
			end if
		else
			dw_revision.object.sw_activa_servicio.protect	= 0
			dw_revision.setfocus()
			dw_revision.setcolumn('sw_activa_servicio')
		end if
	else
		
		SELECT	count("CLIENTE"."FECHA_NAC") 
		INTO		:ll_cta_cli
		FROM 	"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :al_rut
		USING	sqlca;
		if ll_cta_cli = 1 then
			SELECT	"CLIENTE"."FECHA_NAC"
			INTO		:ldt_fecha_nac
			FROM 	"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :al_rut
			USING	sqlca;
			if isnull(ldt_fecha_nac) or ldt_fecha_nac = datetime(date(string('01/01/1900'))) then
				ldt_fecha_nac			= ldt_nulo
			end if
		else
			ldt_fecha_nac				= ldt_nulo
		end if
		
		dw_revision.setitem(1,'rut',al_rut)
		dw_revision.setitem(1,'dv',ls_dv)
		dw_revision.setitem(1,'base',as_base)
		dw_revision.setitem(1,'serie',as_serie)
		dw_revision.setitem(1,'numero',al_numero)
		dw_revision.setitem(1,'cod_parque',il_cod_parque)
		if not isnull(ldt_fecha_nac) then dw_revision.setitem(1,'fecha_nac',ldt_fecha_nac)
		
		if isnull(dw_revision.getitemdatetime(1,'fecha_ctto')) then dw_revision.setitem(1,'fecha_ctto',date(gdt_fec_sistema))
		if dw_revision.getitemnumber(1,'plazo')=0 or isnull(dw_revision.getitemnumber(1,'plazo')) then
			dw_revision.setitem(1,'uso','NI')
			dw_revision.setitem(1,'tipo_beneficiarios',1)
			if as_base='F' then
//				SELECT 	DISTINCT "PRODUCTO_TIPO_SERVICIO"."CANTIDAD_FC"  
//				INTO 		:ll_capacidad  
//				FROM 	"PRODUCTO_TIPO_SERVICIO"  
//				WHERE 	"PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_codigo_servicio   ;
//				if isnull(ll_capacidad) or ll_capacidad=0 then ll_capacidad=1
//				dw_revision.setitem(1,'capacidad',ll_capacidad)

			else
//				dw_revision.setitem(1,'capacidad',1)
			end if
			dw_revision.setitem(1,'forma_pago','1')
			dw_revision.setitem(1,'pie',0)
			dw_revision.setitem(1,'plazo',1)
			if as_base='V' then
				if il_cod_parque=1 then
					dw_revision.setitem(1,'tipo_producto',337)
				elseif il_cod_parque=11 then
					dw_revision.setitem(1,'tipo_producto',341)
				elseif il_cod_parque=101 then
					dw_revision.setitem(1,'tipo_producto',339)
				elseif il_cod_parque=102 then
					dw_revision.setitem(1,'tipo_producto',338)
				elseif il_cod_parque=103 then
					dw_revision.setitem(1,'tipo_producto',340)
				end if
			end if
			dw_revision.setitem(1,'fecha_prim',date(gdt_fec_sistema))
		end if
		if as_base='F' then
//			SELECT 	DISTINCT "PRODUCTO_TIPO_SERVICIO"."CANTIDAD_FC"  
//			INTO 		:ll_capacidad  
//			FROM 	"PRODUCTO_TIPO_SERVICIO"  
//			WHERE 	"PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_codigo_servicio   ;
//			if isnull(ll_capacidad) or ll_capacidad=0 then ll_capacidad=1
//			dw_revision.setitem(1,'capacidad',ll_capacidad)
		end if
		dw_revision.accepttext()
		ls_uso				= dw_revision.getitemstring(1,'uso')
		if isnull(ls_uso) then ls_uso='NI'
		dw_revision.getchild('codigo_servicio',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if dw_revision.dataobject='dw_revision_contratos_producto' then
			if idw_detalle3.retrieve(il_cod_parque,ls_uso,as_serie,ls_moneda)=0 then
				idw_detalle3.insertrow(0)
			end if
		else
			if idw_detalle3.retrieve(ll_cod_parque,as_serie)=0 then
				idw_detalle3.insertrow(0)
			end if
		end if
		if dw_revision.dataobject='dw_revision_contratos_producto' then
			dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
			idw_detalle1.settransobject(sqlca)
			if al_numero > 0 then
				if idw_detalle1.retrieve(as_base,as_serie,al_numero)=0 then
					idw_detalle1.insertrow(0)
				end if
			else
				idw_detalle1.insertrow(0)
			end if
			
		end if
//		if isnull(ll_cod_parque) then
//			if idw_detalle3.retrieve(il_cod_parque,ls_uso)=0 then
//				idw_detalle3.insertrow(0)
//			end if
//		else
//			if idw_detalle3.retrieve(ll_cod_parque,ls_uso)=0 then
//				idw_detalle3.insertrow(0)
//			end if
//		end if
		if isnull(dw_revision.getitemnumber(1,'sw_activa_servicio')) then
			dw_revision.setitem(1,'sw_activa_servicio',1)
		end if	
		if ( as_base='F' and as_serie = 'C' ) or as_base='G' or as_base='V' then
			if as_base='F' then
				dw_revision.setitem(1,'cod_parque',il_cod_parque)
			elseif as_base='G' then
				dw_revision.setitem(1,'cod_parque',il_cod_parque)
			elseif as_base='V' then
				dw_revision.setitem(1,'cod_parque',il_cod_parque)
			end if
			dw_revision.setitem(1,'origen_venta','5')
			dw_revision.accepttext()
//			il_cod_parque											= dw_revision.getitemnumber(1,'cod_parque')
			ls_base													= dw_base.getitemstring(1,'base')
			if ls_base <> 'F' and ls_base<>'G' and ls_base<>'V' then
				if gs_cod_prod='CO' or gs_cod_prod='SE' then
					if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
						idw_detalle2.insertrow(0)
					end if
					if idw_detalle4.retrieve(gs_cod_prod)=0 then
						idw_detalle4.insertrow(0)
					end if
				else
					if idw_detalle2.retrieve(il_cod_parque)=0 then
						idw_detalle2.insertrow(0)
					end if
				end if
			else
//				dw_revision.setitem(1,'codigo_servicio',ll_nulo)
				dw_revision.accepttext()
				ls_uso				= dw_revision.getitemstring(1,'uso')
				if isnull(ls_uso) then ls_uso='NI'
				dw_revision.getchild('codigo_servicio',idw_detalle3)
				idw_detalle3.settransobject(sqlca)
				if dw_revision.dataobject='dw_revision_contratos_producto' then
					if idw_detalle3.retrieve(il_cod_parque,ls_uso,as_serie,ls_moneda)=0 then
						idw_detalle3.insertrow(0)
					end if
				else
					if idw_detalle3.retrieve(ll_cod_parque,as_serie)=0 then
						idw_detalle3.insertrow(0)
					end if
				end if
				
//				if isnull(ll_cod_parque) then
//					if idw_detalle3.retrieve(il_cod_parque,ls_uso)=0 then
//						idw_detalle3.insertrow(0)
//					end if
//				else
//					if idw_detalle3.retrieve(ll_cod_parque,ls_uso)=0 then
//						idw_detalle3.insertrow(0)
//					end if
//				end if
				
//				dw_revision.accepttext()
//				if idw_detalle3.retrieve(il_cod_parque,as_serie)=0 then
//					idw_detalle3.insertrow(0)
//				end if
			end if
			ll_tot_reg_seg	= dw_seguro.retrieve(il_cod_parque,ls_base)
			if ll_tot_reg_seg > 0 then
				for ll_indi=1 to ll_tot_reg_seg
					dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				dw_seguro.accepttext()
			end if
		end if
//		dw_revision.object.uso.protect							= 1
//		dw_revision.object.tipo_beneficiarios.protect		= 1
//		dw_revision.object.capacidad.protect					= 1
//		dw_revision.object.moneda.protect					= 1
//		dw_revision.object.forma_pago.protect				= 1
//		dw_revision.object.pie.protect							= 1
//		dw_revision.object.plazo.protect						= 1
		dw_revision.object.sw_activa_servicio.protect		= 0
	end if
end if
dw_revision.accepttext()

end subroutine

public subroutine wf_calcular_liberador_iva ();Date		ld_fecha_1_venc,ld_fecha_ctto,ld_fecha,ld_fecha_nac
Datetime	ldt_fecha,ldt_fecha_prim,ldt_nulo,ldt_fec_res_aux,ldt_fecha_venc_vig_factor
String		ls_moneda,ls_tipo_sepultura,ls_tipo_construc,ls_area,ls_string,ls_descrip_moneda,&
			ls_base,ls_serie,ls_base_asoc,ls_serie_asoc,ls_dv,ls_descrip_estado,ls_texto_ctto,&
			ls_base_aux,ls_serie_aux,ls_forma_pago,ls_estado_aux,ls_falta,ls_moneda_res,&
			ls_sw_pie,ls_uso,ls_obs,ls_estado_sep
Double	ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor,ld_calculo,ldb_uf,ldb_precio_liber,ldb_precio_validado,&
			ldb_descto_liber,ldb_cuota_mant,ldb_liberador,lld_precio_contrato,lld_calc_desc,ldb_derecho,ldb_precio_val2,&
			ldb_precio_ctto_aux,ldb_val_cta,ldb_val_uf,ll_porce,ldb_porcen_real,ldb_precio_vta,ldb_descto_adic,ldb_porce_pie,&
			ldb_pie_minimo,ldb_pie_res,ldb_precio_res,ll_cal_15,ldb_gasto_adm,ldb_valor_mant,ll_numero,ll_numero_asoc,ll_numero_aux,&
			ldb_iva,lld_pie_iva
Long		ll_plazo,ll_dias,ll_10_porce,ll_valor_cuota,ll_largototal,ll_posini,ll_capacidad,ll_cod_obs,&
			ll_gasto_peso,ll_valor_cta,ll_new,ll_fila,ll_rut,ll_periodo_mant,&
			ll_renta,ll_reg,ll_tot_reg,ll_tot_reg_rezago,ll_tot_reg_ctto_asoc,&
			ll_indi,ll_sum_res=0,ll_annos_liber,ll_capac_new,ll_dias_venc,ll_dif_dias,ll_plazo_max,ll_nulo

setnull(ll_nulo)
dw_revision.accepttext()
ls_sw_pie									= 'N'
ll_rut											= long(em_rut.text)
ls_dv											= trim(em_dv.text)
ls_base										= dw_base.getitemstring(1,'base')
ls_serie										= trim(ddlb_serie.text)
ll_numero									= Double(em_numero.text)
dw_revision.setitem(1,'rut',ll_rut)
dw_revision.setitem(1,'dv',ls_dv)
dw_revision.setitem(1,'base',ls_base)
dw_revision.setitem(1,'serie',ls_serie)
dw_revision.setitem(1,'numero',ll_numero)
ll_tot_reg_rezago							= dw_lista_rezagos.rowcount()

SELECT 	iva		INTO :ldb_iva	FROM tasa;

dw_revision.setitem(1,'iva_cuota',ldb_iva) 
dw_revision.setitem(1,'iva_pie',ldb_iva)

if ll_tot_reg_rezago>0 then
	ll_new									= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	if ll_tot_reg_rezago=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimiento de Pago en Rezago')
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_rezago)+' Movimientos de Pagos en Rezago')
	end if
	dw_lista_obs.accepttext()
end if
ll_tot_reg_ctto_asoc						= dw_ctto_asoc.rowcount()
if ll_tot_reg_ctto_asoc>0 then
	ll_new									= dw_lista_obs.insertrow(0)
	dw_lista_obs.scrolltorow(0)
	dw_lista_obs.setitem(ll_new,'rut',ll_rut)
	dw_lista_obs.setitem(ll_new,'base',ls_base)
	dw_lista_obs.setitem(ll_new,'serie',ls_serie)
	dw_lista_obs.setitem(ll_new,'numero',ll_numero)
	for ll_indi=1 to ll_tot_reg_ctto_asoc
		ls_base_aux							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_codigo')
		ls_serie_aux							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_serie')
		ll_numero_aux						= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_numero')
		ls_estado_aux						= dw_ctto_asoc.getitemstring(ll_indi,'cadena_estado')
		ldt_fec_res_aux					= dw_ctto_asoc.getitemdatetime(ll_indi,'cadena_fecha_res')
		ls_texto_ctto						= ls_texto_ctto + ls_base_aux+'-'+ls_serie_aux+'-'+string(ll_numero_aux,"###,###,###,###,###")
		if ll_indi<>ll_tot_reg_ctto_asoc then
			ls_texto_ctto					= ls_texto_ctto+', '
		end if
		if ls_estado_aux='R' and year(date(ldt_fec_res_aux))>=2004 then
			ll_sum_res ++
		end if
	next
	if ll_tot_reg_ctto_asoc=1 then
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contrato Asociado '+ls_texto_ctto)
	else
		dw_lista_obs.setitem(ll_new,'observacion','Tiene '+string(ll_tot_reg_ctto_asoc)+' Contratos Asociados '+ls_texto_ctto)
	end if
	ls_forma_pago							= dw_revision.getitemstring(1,'forma_pago')
	dw_lista_obs.accepttext()
end if
ld_fecha_nac								= date(dw_revision.getitemdatetime(1,'fecha_nac'))
ld_fecha_ctto								= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
if not isnull(ld_fecha_ctto)  then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),3)
end if
if not isnull(ld_fecha_ctto) and not isnull(ld_fecha_nac) then
	wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ld_fecha_ctto),1)
end if
dw_revision.accepttext()
dw_lista_obs.accepttext()
ls_moneda									= dw_revision.getitemstring(1,'moneda')
ld_fecha_1_venc							= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto								= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo										= dw_revision.getitemnumber(1,'plazo')
ls_tipo_sepultura							= dw_revision.getitemstring(1,'tipo_sepult')
ls_area										= dw_revision.getitemstring(1,'area')
ll_capacidad									= dw_revision.getitemnumber(1,'capacidad')
if ls_base='L' then
	ls_uso									= 'NF'
else
	ls_uso									= dw_revision.getitemstring(1,'uso')
end if
ldb_uf											= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque								= dw_revision.getitemnumber(1,'cod_parque')
ls_forma_pago								= dw_revision.getitemstring(1,'forma_pago')
ldb_precio									= double(dw_revision.getitemnumber(1,'precio_contrato'))
ldb_precio_validado						= double(dw_revision.getitemnumber(1,'precio_contrato'))
ldb_precio_val2								= double(dw_revision.getitemnumber(1,'precio_contrato'))
lld_pie										= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf									= double(dw_revision.getitemnumber(1,'gasto_adm'))
lld_pie_iva									= double(dw_revision.getitemnumber(1,'pie_iva'))
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
	ld_calculo								= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
	//ld_calculo								= ( ( ldb_precio - lld_pie_iva ) + lld_gasto_uf )
	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
	if ls_forma_pago='1' or ls_forma_pago='3' then
		if isnull(ll_plazo) then
			if ls_moneda='1' then
				dw_revision.setitem(1,'valor_cuota',round(ld_calculo,0))
			else
				dw_revision.setitem(1,'valor_cuota',round(ld_calculo,4))
			end if
		else
			if ls_moneda='1' then
				dw_revision.setitem(1,'valor_cuota',round((ld_calculo / ll_plazo),0))
			else
				dw_revision.setitem(1,'valor_cuota',round((ld_calculo / ll_plazo),4))
			end if
		end if
	end if
end if
dw_revision.accepttext()
lld_saldo_finan								= double(dw_revision.getitemnumber(1,'saldo_financiar'))
if not isnull(ls_forma_pago) then
	if ls_forma_pago<>'2' and ls_forma_pago <> '4' then
		dw_revision.setitem(1,'factor_cuota',0)
		dw_revision.setitem(1,'gasto_adm',0)
		if lld_saldo_finan>0 and ll_plazo>0 then
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0)) //1
			else
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4)) //2
			end if
		end if
	else
		dw_revision.setitem(1,'factor_cuota',0)
		dw_revision.setitem(1,'gasto_adm',0)
		if lld_saldo_finan>0 and ll_plazo>0 then
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),0)) //1
			else
				dw_revision.setitem(1,'valor_cuota', round((lld_saldo_finan / ll_plazo),4)) //2
			end if
		end if
	end if
end if
if not isnull(ls_tipo_sepultura) then
	if ls_tipo_sepultura = '1' then
		ls_tipo_construc					= 'T'
	else
		ls_tipo_construc					= 'C'
	end if
end if
if not isnull(ls_area) and not isnull(ll_capacidad) and not isnull(ls_uso) and &
	not isnull(ldb_uf) and not isnull(il_cod_parque) and not isnull(ls_tipo_sepultura) and not isnull(ll_plazo) then
	if ls_base='L' then
		ll_plazo						= dw_revision.getitemnumber(1,'plazo')
		SELECT	"ANNO_INI", "SIGLA"
		INTO		:ll_plazo_max, :ls_obs
		FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 8
		USING	sqlca;
		if ll_plazo > ll_plazo_max then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_plazo),8)
			messagebox("Advertencia",ls_obs+' '+ string(ll_plazo_max)+' Cuotas'  )
			dw_revision.setitem(1,'plazo',ll_nulo)
			dw_revision.accepttext()
		end if
		
		ll_annos_liber						= dw_revision.getitemnumber(1,'liberador_annos')
		if not isnull(ll_annos_liber) and ll_annos_liber>0 then
			ls_base_asoc					= dw_revision.getitemstring(1,'base_asoc')
			ls_serie_asoc					= dw_revision.getitemstring(1,'serie_asoc')
			ll_numero_asoc				= dw_revision.getitemnumber(1,'numero_asoc')
			
			ldb_valor_mant					= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
			ls_string							= f_valida_precio_liberador_nuevo(ldb_valor_mant,ll_annos_liber,ls_moneda,ldb_uf)
			if ls_moneda='2' then //UF
				ldb_precio					= double(substr(1,1,ls_string))
				ldb_descto_liber			= double(substr(1,2,ls_string))
				ldb_precio_vta				= double(substr(1,3,ls_string))
				ldb_liberador				= double(substr(1,4,ls_string))
				ldb_pie_minimo			= double(substr(1,5,ls_string))
			else // peso
				ldb_precio					= double(long(substr(1,1,ls_string)))
				ldb_descto_liber			= double(substr(1,2,ls_string))
				ldb_precio_vta				= double(long(substr(1,3,ls_string)))
				ldb_liberador				= double(long(substr(1,4,ls_string)))
				ldb_pie_minimo			= double(substr(1,5,ls_string))
			end if
			if is_new_calc='N' then
				ldb_precio_vta				= ldb_precio_validado
			end if
			if is_new_precio='S' then
				ldb_precio_vta				= dw_revision.getitemnumber(1,'precio_contrato')
			end if
		end if
		dw_revision.setitem(1,'precio',ldb_precio)
		dw_revision.setitem(1,'descto_liber',ldb_descto_liber)
		dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
		dw_revision.setitem(1,'valor_cuota_mant',ldb_valor_mant)
		dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
		dw_revision.setitem(1,'periodo_mant',il_periodo_mant)
		dw_revision.setitem(1,'uso',ls_uso)
		if ls_forma_pago<>'2' and ls_forma_pago <> '4' then
			if ls_moneda='1' then
				dw_revision.setitem(1,'valor_cuota',round(ldb_precio_vta,0))
			else
				dw_revision.setitem(1,'valor_cuota',round(ldb_precio_vta,4))
			end if
		end if
		dw_revision.accepttext()
		if ldb_precio > 0 then
			if lld_pie=0 then
				ldb_porce_pie					= 0
			else
				ldb_porce_pie					= (lld_pie / ldb_precio * 100)
			end if
			
			if ls_uso='NF' then
				ll_cod_obs 						= 4										
			end if
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),ll_cod_obs)
		else
			messagebox("Advertencia","No Registra Lista de Precio")
		end if
		dw_revision.setfocus()
	elseif ls_base= 'A' then
		ll_plazo								= dw_revision.getitemnumber(1,'plazo')
		SELECT	"ANNO_INI", "SIGLA"
		INTO		:ll_plazo_max, :ls_obs
		FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 7
		USING	sqlca;
		if ll_plazo > ll_plazo_max then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_plazo),7)
			messagebox("Advertencia",ls_obs+' '+ string(ll_plazo_max)+' Cuotas'  )
			dw_revision.setitem(1,'plazo',ll_nulo)
			dw_revision.accepttext()
		end if
		
		ldb_valor_mant						= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
		ll_capac_new						= dw_revision.getitemnumber(1,'nueva_capac')
		if not isnull(ll_capac_new) and ll_capac_new>0 then
			ls_string							= f_valida_precio_aumento(ll_capacidad,ls_uso,ll_capac_new,il_cod_parque,ls_moneda,ldb_uf)
			if ls_moneda='2' then //UF
				ldb_precio					= double(substr(1,1,ls_string))
				ldb_pie_minimo			= double(substr(1,2,ls_string))
				ldb_descto_liber			= double(substr(1,3,ls_string))
				ldb_precio_vta				= double(substr(1,4,ls_string))
				ldb_liberador				= double(substr(1,5,ls_string))
			else // peso
				ldb_precio					= double(long(substr(1,1,ls_string)))
				ldb_pie_minimo			= double(substr(1,2,ls_string))
				ldb_descto_liber			= double(substr(1,3,ls_string))
				ldb_precio_vta				= double(long(substr(1,4,ls_string)))
				ldb_liberador				= double(long(substr(1,5,ls_string)))
			end if
			ldb_precio_vta					= ldb_precio
			if is_new_calc='N' then
				ldb_precio_vta				= ldb_precio_validado
			end if
			if is_new_precio='S' then
				ldb_precio_vta				= dw_revision.getitemnumber(1,'precio_contrato')
			end if
			dw_revision.setitem(1,'precio',ldb_precio)
			dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
			dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
			dw_revision.setitem(1,'uso',ls_uso)
			dw_revision.accepttext()
			ls_forma_pago					= dw_revision.getitemstring(1,'forma_pago')
			lld_pie							= double(dw_revision.getitemnumber(1,'pie'))
			if ldb_precio > 0 then
				if lld_pie < ldb_pie_minimo and lld_pie>=0 and ls_sw_pie='N' then
					ldb_porce_pie									= (lld_pie / ldb_precio * 100)
					if ls_uso='NF' then
						ll_cod_obs 				= 4										
					elseif ls_uso='NI' then
						ll_cod_obs 				= 11	
					end if
					wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porce_pie),ll_cod_obs)
					dw_revision.setfocus()
				end if
			else
				messagebox("Advertencia","No Registra Lista de Precio")
			end if
		end if
	else
		ls_string								= f_valida_precio_liberador(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque,ls_base)
		if ls_moneda='2' then //UF
			ldb_precio						= double(substr(1,1,ls_string))
			ldb_derecho						= double(substr(1,2,ls_string))
			ldb_cuota_mant				= double(substr(1,3,ls_string))
			ldb_liberador					= double(substr(1,4,ls_string))
			ldb_pie_minimo				= double(substr(1,5,ls_string))
		else // peso
			ldb_precio						= double(long(substr(1,1,ls_string)))
			ldb_derecho						= double(long(substr(1,2,ls_string)))
			ldb_cuota_mant				= double(substr(1,3,ls_string))
			ldb_liberador					= double(long(substr(1,4,ls_string)))
			ldb_derecho						= ROUND((ldb_derecho / ldb_uf),0)
			ldb_pie_minimo				= double(substr(1,5,ls_string))
		end if
	end if
	
	ls_forma_pago							= dw_revision.getitemstring(1,'forma_pago')
	SELECT	"REVISION_CONTRATOS"."PRECIO_CONTRATO"  
	INTO 		:ldb_precio_ctto_aux  
	FROM 	"REVISION_CONTRATOS"  
	WHERE 	( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
			 	( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
			 	( "REVISION_CONTRATOS"."NUMERO" = :ll_numero ) AND  
			 	( "REVISION_CONTRATOS"."RUT" = :ll_rut )   
	USING	sqlca;
	if sqlca.sqlcode<>0 then
		if is_nuevo='S' and is_sw_pasa='S' then
			dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
			is_sw_pasa				= 'N'
		else
			if dw_revision.getitemnumber(1,'precio_contrato')=0 then
				dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
			end if
		end if
	end if
	dw_revision.setitem(1,'descto_liber',ldb_descto_liber)
	dw_revision.setitem(1,'valor_cuota_mant',ldb_valor_mant)
	ldb_liberador							= 0
end if
dw_revision.accepttext()
ls_moneda									= dw_revision.getitemstring(1,'moneda')
ld_fecha_1_venc							= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto								= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
ll_plazo										= dw_revision.getitemnumber(1,'plazo')
ls_tipo_sepultura							= dw_revision.getitemstring(1,'tipo_sepult')
ls_area										= dw_revision.getitemstring(1,'area')
ll_capacidad									= dw_revision.getitemnumber(1,'capacidad')
if ls_base='L' then
	ls_uso									= 'NF'
else
	ls_uso									= dw_revision.getitemstring(1,'uso')
end if
ldb_uf											= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
il_cod_parque								= dw_revision.getitemnumber(1,'cod_parque')
ldb_precio									= double(dw_revision.getitemnumber(1,'precio_contrato'))
lld_pie										= double(dw_revision.getitemnumber(1,'pie'))
lld_gasto_uf									= double(dw_revision.getitemnumber(1,'gasto_adm'))
if isnull(lld_pie) then lld_pie=0
if isnull(lld_gasto_uf) then lld_gasto_uf=0
if isnull(ldb_precio) or isnull(lld_gasto_uf) then
	dw_revision.setitem(1,'saldo_financiar',0)
else
	ld_calculo							= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
	//ld_calculo							= ( ( ldb_precio - lld_pie_iva ) + lld_gasto_uf )
	dw_revision.setitem(1,'saldo_financiar',ld_calculo)
	if ls_forma_pago='1' or ls_forma_pago='3' then
		if ls_moneda='1' then
			dw_revision.setitem(1,'valor_cuota',round(ld_calculo,0))
		else
			dw_revision.setitem(1,'valor_cuota',round(ld_calculo,4))
		end if
		if isnull(ll_plazo) then
			if ls_moneda='1' then
				dw_revision.setitem(1,'valor_cuota',round(ld_calculo,0))
			else
				dw_revision.setitem(1,'valor_cuota',round(ld_calculo,4))
			end if
		else
			dw_revision.setitem(1,'valor_cuota',(ld_calculo / ll_plazo))
		end if
	end if
end if
dw_revision.accepttext()

if is_new_precio='S' then
	lld_precio_contrato					= double(dw_revision.getitemnumber(1,'precio_contrato'))
	ldb_precio								= double(dw_revision.getitemnumber(1,'precio'))
	ldb_descto_adic						= (double(dw_revision.getitemnumber(1,'descto_liber'))*100)
	if lld_precio_contrato <> ldb_precio and ldb_precio>0 then
		lld_calc_desc						= 100 - round(((lld_precio_contrato * 100) / ldb_precio),2)
		lld_calc_desc						= lld_calc_desc - ldb_descto_adic
		ll_new								= dw_lista_obs.insertrow(0)
		dw_lista_obs.scrolltorow(0)
		dw_lista_obs.setitem(ll_new,'rut',ll_rut)
		dw_lista_obs.setitem(ll_new,'base',ls_base)
		dw_lista_obs.setitem(ll_new,'serie',ls_serie)
		dw_lista_obs.setitem(ll_new,'numero',ll_numero)
		dw_lista_obs.setitem(ll_new,'observacion','Se aplicó Descuento Adicional del '+string(lld_calc_desc,"###,##0.0#")+'% del Precio Venta')
		dw_lista_obs.accepttext()
	end if
end if
dw_revision.accepttext()
ld_fecha_1_venc						= date(dw_revision.getitemdatetime(1,'fecha_prim'))
ld_fecha_ctto							= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
lld_pie									= double(dw_revision.getitemnumber(1,'pie'))
if isnull(lld_pie) then lld_pie=0
if not isnull(ld_fecha_1_venc) then
	if not isnull(ld_fecha_ctto) then
		if lld_pie>0 then
			SELECT	"ANNO_INI"
			INTO		:ll_dias_venc
    			FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   			WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 6
			USING	sqlca;
			if isnull(ll_dias_venc) then ll_dias_venc=0
			ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias_venc)
			if ld_fecha_1_venc > ld_fecha then
				ll_dif_dias				= DaysAfter(ld_fecha_ctto,ld_fecha_1_venc)
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_dif_dias),6)	
			end if
		elseif lld_pie=0 then
			SELECT	"ANNO_INI"
			INTO		:ll_dias_venc
    			FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   			WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 9
			USING	sqlca;
			if isnull(ll_dias_venc) then ll_dias_venc=0
			ld_fecha						= RelativeDate(ld_fecha_ctto, ll_dias_venc)
			if ld_fecha_1_venc > ld_fecha then
				ll_dif_dias				= DaysAfter(ld_fecha_ctto,ld_fecha_1_venc)
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ll_dif_dias),9)		
			end if
		end if
	end if
	dw_revision.accepttext()
	ldt_fecha								= datetime(date(dw_revision.getitemdatetime(1,'fecha_ctto')),time('00:00:00'))
	ldt_fecha_prim						= dw_revision.getitemdatetime(1,'fecha_prim')
	lld_saldo_finan						= double(dw_revision.getitemnumber(1,'saldo_financiar'))
	ll_dias								= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
	ldt_fecha_venc_vig_factor		= dw_revision.getitemdatetime(1,'fecha_factor_vigente')
	ll_plazo								= dw_revision.getitemnumber(1,'plazo')
	if ll_dias>0 then dw_revision.setitem(1,'dias_vencimiento_prim',ll_dias)
	if not isnull(ll_plazo) and ll_plazo>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
		not isnull(ls_moneda) and not isnull(ldb_precio) then //not isnull(lld_gasto_uf) and lld_gasto_uf>0 and and ldb_precio>0
		if ldt_fecha_prim >= ldt_fecha then
			if ls_forma_pago='2' or ls_forma_pago='4' then
				if ll_plazo>=1 and ll_plazo<=11 then
					lld_saldo_finan	= double(dw_revision.getitemnumber(1,'saldo_financiar'))
					ll_plazo				= dw_revision.getitemnumber(1,'plazo')
					if ls_moneda='1' then //peso
						ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),0)
						dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //3
					else
						ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),4)
						dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //4
					end if
				else
					if ll_dias>=30 then
						SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
						INTO 		:lld_factor,	:ldb_gasto_adm
						FROM 	"FACTORES"  
						WHERE 	( "FACTORES"."BASE" = :ls_base ) AND  
								 	( "FACTORES"."NRO_CUOTAS_INICIAL" >= :ll_plazo )  AND  
								 	( "FACTORES"."NRO_CUOTAS_FINAL" <= :ll_plazo )  AND  
								 	(("FACTORES"."DIAS_INICIAL" >= :ll_dias )  AND  
								 	( "FACTORES"."DIAS_FINAL" <= :ll_dias ))  AND
								 	( "FACTORES"."MONEDA" = :ls_moneda ) AND
								 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor )
						USING	sqlca;
						if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
							ldb_gasto_adm		= 0
						end if
						if lld_factor > 0 then //and lld_saldo_finan > 0
							dw_revision.setitem(1,'factor_cuota',lld_factor)
							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
							dw_revision.accepttext()
							ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
							lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
							lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
							ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
							lld_saldo_finan		= round((lld_factor * ld_calculo),4)
							dw_revision.setitem(1,'valor_cuota',lld_saldo_finan) //5
						else
							SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
							INTO 		:lld_factor,	:ldb_gasto_adm
							FROM 	"FACTORES"  
							WHERE  	( "FACTORES"."BASE" = :ls_base ) AND  
									 	( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
									 	( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
									 	( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 	 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
									 	( "FACTORES"."DIAS_INICIAL" = (	SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																					FROM 	"FACTORES" 
																					WHERE	( "FACTORES"."BASE" = :ls_base ) AND 
																			    					( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																				 				( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																				 				( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																				 				( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																				 				( "FACTORES"."FACTOR" <> 0 ) ) )   ;
							if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
								ldb_gasto_adm		= 0
							end if
							if lld_factor > 0 then //and lld_saldo_finan > 0
								dw_revision.setitem(1,'factor_cuota',lld_factor)
								dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
								dw_revision.accepttext()
								ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
								lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
								lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
								ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
								lld_saldo_finan		= round((lld_factor * ld_calculo),4)
								if ls_moneda='1' then
									dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,0)) //6
								else
									dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,4)) //6
								end if
							end if
						end if
					else
						SELECT	"FACTOR",	"FACTOR_GASTO_ADM"
						INTO 		:lld_factor,	:ldb_gasto_adm  
						FROM 	"FACTORES"  
						WHERE 	( "FACTORES"."BASE" = :ls_base ) AND  
									( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 	( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
								 	( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
								 	( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 	( "FACTORES"."DIAS_INICIAL" = ( SELECT	MIN("FACTORES"."DIAS_INICIAL") 
																				FROM 	"FACTORES" 
																				WHERE  ( "FACTORES"."BASE" = :ls_base ) AND 
																			 				( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																			 				( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																			 				( "FACTORES"."FECHA_VIGENCIA" = :ldt_fecha_venc_vig_factor ) AND
																			 				( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 				( "FACTORES"."FACTOR" <> 0 ) ) )   
						USING		sqlca;
						if date(dw_revision.getitemdatetime(1,'fecha_ctto')) >= date('01/10/2013') then
							ldb_gasto_adm		= 0
						end if
						if lld_factor > 0 then //and lld_saldo_finan > 0
							dw_revision.setitem(1,'factor_cuota',lld_factor)
							dw_revision.setitem(1,'gasto_adm', ldb_gasto_adm * ll_plazo )
							dw_revision.accepttext()
							ldb_precio			= double(dw_revision.getitemnumber(1,'precio_contrato'))
							lld_pie				= double(dw_revision.getitemnumber(1,'pie'))
							lld_gasto_uf			= double(dw_revision.getitemnumber(1,'gasto_adm'))
							ld_calculo			= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
							lld_saldo_finan		= round((lld_factor * ld_calculo),4)
							if ls_moneda='1' then
								dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,0)) //7
							else
								dw_revision.setitem(1,'valor_cuota',round(lld_saldo_finan,4)) //7
							end if
						end if
					end if
				end if
			else
				if ls_moneda='1' then //peso
					ldb_val_cta					= 	round((lld_saldo_finan / ll_plazo),0)
					dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //3
				else
					ldb_val_cta					= 	round((lld_saldo_finan / ll_plazo),4)
					dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //4
				end if
			end if
			dw_revision.accepttext()
			ldb_precio							= double(dw_revision.getitemnumber(1,'precio_contrato'))
			lld_pie								= double(dw_revision.getitemnumber(1,'pie'))
			lld_gasto_uf							= double(dw_revision.getitemnumber(1,'gasto_adm'))
			if isnull(lld_pie) then lld_pie=0
			if isnull(lld_gasto_uf) then lld_gasto_uf=0
			if isnull(ldb_precio) or isnull(lld_gasto_uf) then
				dw_revision.setitem(1,'saldo_financiar',0)
			else
				ld_calculo						= ( ( ldb_precio - lld_pie ) + lld_gasto_uf )
				//ld_calculo						= ( ( ldb_precio - lld_pie_iva ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
				if ls_forma_pago='1' or ls_forma_pago='3' then
					if ls_moneda='1' then
						dw_revision.setitem(1,'valor_cuota',round(ld_calculo,0))
					else
						dw_revision.setitem(1,'valor_cuota',round(ld_calculo,4))
					end if
				end if
			end if
			dw_revision.accepttext()
		else
			ll_new								= dw_lista_obs.insertrow(0)
			dw_lista_obs.scrolltorow(0)
			dw_lista_obs.setitem(ll_new,'rut',ll_rut)
			dw_lista_obs.setitem(ll_new,'base',ls_base)
			dw_lista_obs.setitem(ll_new,'serie',ls_serie)
			dw_lista_obs.setitem(ll_new,'numero',ll_numero)
			dw_lista_obs.setitem(ll_new,'observacion','Recuerde Fecha Primer Vencimiento debe ser Mayor o Igual a la Fecha Contrato')
			dw_lista_obs.accepttext()
		end if
	end if
	dw_revision.accepttext()
	ll_renta										= dw_revision.getitemnumber(1,'renta_liquida')
	ls_forma_pago								= dw_revision.getitemstring(1,'forma_pago')
	if ll_renta>0 and (ls_forma_pago='2' or ls_forma_pago='4') then
		SELECT	"ANNO_INI"
		INTO		:ll_porce
		FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 10
		USING	sqlca;
		if isnull(ll_porce) then ll_porce=0
		
		ldb_val_cta								= dw_revision.getitemnumber(1,'valor_cuota')
		ldb_val_uf								= dw_revision.getitemnumber(1,'uf_fecha_ctto')
		if ls_moneda='2' then //peso
			ll_valor_cta							= round((ldb_val_cta * ldb_val_uf),0)
		end if
		ll_porce									= round((ll_valor_cuota * 100 ) / ll_renta,2)
		ll_10_porce								= (ll_renta * ll_porce) / 100
		ldb_porcen_real						= round((ll_valor_cta * 100) / ll_renta,2)
		if ldb_porcen_real > ll_porce then
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(ldb_porcen_real),10)
		end if
	else
		if ls_forma_pago='1' or ls_forma_pago='3' then
			if ls_moneda='1' then //peso
				ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),0)
			else
				ldb_val_cta			= 	round((lld_saldo_finan / ll_plazo),4)
			end if
			dw_revision.setitem(1,'valor_cuota',ldb_val_cta ) //3
		end if
	end if
end if
dw_revision.accepttext()
end subroutine

event open;Datetime		ldt_fecha,ldt_fecha_vig
long			ll_tot_reg,ll_indi
Double		ldb_uf_dia

Setnull(idt_nulo)
connect using Trans_1;
gf_centrar(w_validar_promesa_operaciones)
w_validar_promesa_operaciones.title	= 'Revisión de Contratos                            Usuario: '+gs_nom_comp_usuario
dw_lista_obs.settransobject(sqlca)
dw_ctto_asoc.settransobject(sqlca)
dw_lista_rezagos.settransobject(sqlca)
dw_seguro.settransobject(sqlca)
cb_ingreso_benef.visible		= false
select sysdate into :gdt_fec_sistema from dual;

dw_base.settransobject(sqlca)
dw_base.insertrow(0)
dw_base.accepttext()
if gs_conexion	= "Parque El Prado" then
	il_cod_parque				= 1
elseif gs_conexion = "Parque La Foresta" then
	il_cod_parque				= 11
end if
gs_mant_serv					= 'N'
gs_mant_serv_uso				= 'N'
dw_revision.dataobject		= 'dw_revision_contratos_promesa'
dw_revision.settransobject(sqlca)

dw_revision.getchild('area',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(il_cod_parque,'SE')=0 then
	idw_detalle2.insertrow(0)
end if

dw_revision.getchild('tipo_producto',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve('SE')=0 then
	idw_detalle4.insertrow(0)
end if

dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
idw_detalle12.settransobject(sqlca)
//if idw_detalle12.retrieve('M')=0 then
	idw_detalle12.insertrow(0)
//end if

dw_revision.insertrow(0)

dw_print.settransobject(sqlca)
cb_memo.enabled				= false
cbx_tipo_rechazo.enabled	= false
cb_ver.enabled					= false
ldt_fecha							= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_revision.setitem(1,'fecha_ctto',idt_nulo)
dw_revision.setitem(1,'fecha_nac',idt_nulo)
dw_revision.setitem(1,'fecha_prim',idt_nulo)
dw_revision.accepttext()
SELECT DISTINCT "FACTORES"."FECHA_VIGENCIA"  
INTO 	:ldt_fecha_vig  
FROM 	"FACTORES"  
WHERE "FACTORES"."ESTADO_VIGENCIA" = 'V'   
USING	sqlca;
if sqlca.sqlcode=0 then
	dw_revision.setitem(1,'fecha_factor_vigente',ldt_fecha_vig)
end if
dw_revision.setitem(1,'estado_revision','V')
SELECT	"TAB_UF"."VALOR_UF",	sysdate
INTO 		:ldb_uf_dia ,			:gdt_fec_sistema
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha
USING		sqlca;
if sqlca.sqlcode=0 then
	dw_revision.setitem(1,'uf_fecha_ctto',ldb_uf_dia)
end if
dw_revision.accepttext()
dw_revision.enabled		= false
if isvalid(w_cd_ingresar_control_documentacion) then
	is_base 					= trim(substr(1,1,Message.StringParm))
	is_serie					= trim(substr(1,2,Message.StringParm))
	il_numero				= Double(trim(substr(1,3,Message.StringParm)))
	dw_base.setitem(1,'base',is_base)
	dw_base.accepttext()
	ddlb_serie.text			= is_serie
	em_numero.text		= string(il_numero,"###,###,###,###,###")
	if il_numero>0 then
		em_numero.triggerevent(modified!)
	end if
end if
dw_base.enabled			= false
ddlb_serie.enabled		= false
em_numero.enabled		= false
ll_tot_reg					= dw_seguro.retrieve(il_cod_parque,is_base)
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled		= true
gs_ventana					= 'w_validar_promesa_operaciones'
f_valida_objeto()
em_rut.enabled			= true
em_dv.enabled				= true
em_rut.setfocus()
end event

on w_validar_promesa_operaciones.create
this.cb_limpiar_producto=create cb_limpiar_producto
this.st_precio_vta=create st_precio_vta
this.st_ver_tipo_servicio=create st_ver_tipo_servicio
this.cb_1=create cb_1
this.cb_ingreso_benef=create cb_ingreso_benef
this.dw_clientes=create dw_clientes
this.cb_ingresar=create cb_ingresar
this.ddlb_serie=create ddlb_serie
this.cb_ctrol_doc=create cb_ctrol_doc
this.pb_producto=create pb_producto
this.pb_benef=create pb_benef
this.st_gestion_serv=create st_gestion_serv
this.cb_val_benef=create cb_val_benef
this.st_ctacte=create st_ctacte
this.cb_help=create cb_help
this.cbx_tipo_rechazo=create cbx_tipo_rechazo
this.cb_memo=create cb_memo
this.cb_buscar=create cb_buscar
this.dw_print=create dw_print
this.cb_print=create cb_print
this.em_numero=create em_numero
this.st_5=create st_5
this.st_4=create st_4
this.dw_base=create dw_base
this.st_3=create st_3
this.em_dv=create em_dv
this.st_2=create st_2
this.em_rut=create em_rut
this.st_1=create st_1
this.cb_ver=create cb_ver
this.cb_limpiar=create cb_limpiar
this.dw_lista_rezagos=create dw_lista_rezagos
this.cb_rechazar=create cb_rechazar
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_ctto_asoc=create dw_ctto_asoc
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_lista_obs=create dw_lista_obs
this.dw_seguro=create dw_seguro
this.dw_revision=create dw_revision
this.Control[]={this.cb_limpiar_producto,&
this.st_precio_vta,&
this.st_ver_tipo_servicio,&
this.cb_1,&
this.cb_ingreso_benef,&
this.dw_clientes,&
this.cb_ingresar,&
this.ddlb_serie,&
this.cb_ctrol_doc,&
this.pb_producto,&
this.pb_benef,&
this.st_gestion_serv,&
this.cb_val_benef,&
this.st_ctacte,&
this.cb_help,&
this.cbx_tipo_rechazo,&
this.cb_memo,&
this.cb_buscar,&
this.dw_print,&
this.cb_print,&
this.em_numero,&
this.st_5,&
this.st_4,&
this.dw_base,&
this.st_3,&
this.em_dv,&
this.st_2,&
this.em_rut,&
this.st_1,&
this.cb_ver,&
this.cb_limpiar,&
this.dw_lista_rezagos,&
this.cb_rechazar,&
this.cb_aceptar,&
this.cb_cerrar,&
this.dw_ctto_asoc,&
this.gb_2,&
this.gb_3,&
this.dw_lista_obs,&
this.dw_seguro,&
this.dw_revision}
end on

on w_validar_promesa_operaciones.destroy
destroy(this.cb_limpiar_producto)
destroy(this.st_precio_vta)
destroy(this.st_ver_tipo_servicio)
destroy(this.cb_1)
destroy(this.cb_ingreso_benef)
destroy(this.dw_clientes)
destroy(this.cb_ingresar)
destroy(this.ddlb_serie)
destroy(this.cb_ctrol_doc)
destroy(this.pb_producto)
destroy(this.pb_benef)
destroy(this.st_gestion_serv)
destroy(this.cb_val_benef)
destroy(this.st_ctacte)
destroy(this.cb_help)
destroy(this.cbx_tipo_rechazo)
destroy(this.cb_memo)
destroy(this.cb_buscar)
destroy(this.dw_print)
destroy(this.cb_print)
destroy(this.em_numero)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_base)
destroy(this.st_3)
destroy(this.em_dv)
destroy(this.st_2)
destroy(this.em_rut)
destroy(this.st_1)
destroy(this.cb_ver)
destroy(this.cb_limpiar)
destroy(this.dw_lista_rezagos)
destroy(this.cb_rechazar)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_ctto_asoc)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_lista_obs)
destroy(this.dw_seguro)
destroy(this.dw_revision)
end on

event mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg									= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima					= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso						= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma							= ldb_suma + ldb_factor_prima
				ll_suma_peso						= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf										= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda								= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma							= ll_suma_peso
			end if
			if is_limpiar='S' then
				dw_revision.setitem(1,'c_total_cuota',ldb_suma)
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if*/

end event

event close;disconnect using Trans_1;
cb_cerrar.triggerevent(clicked!)
end event

type cb_limpiar_producto from commandbutton within w_validar_promesa_operaciones
boolean visible = false
integer x = 2693
integer y = 2648
integer width = 503
integer height = 112
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Limpiar Producto"
end type

event clicked;Long		ll_nulo

Setnull(ll_nulo)
is_noexiste_serv		= 'N'
dw_revision.setitem(1,'codigo_servicio',ll_nulo)
dw_revision.setitem(1,'precio_venta',ll_nulo)
dw_revision.setitem(1,'precio',ll_nulo)
dw_revision.accepttext()
dw_revision.setcolumn('codigo_servicio')
dw_revision.setfocus()
end event

type st_precio_vta from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 791
integer y = 780
integer width = 393
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 16711680
long backcolor = 15793151
string text = "Precio Venta"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_ver_tipo_servicio from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 544
integer y = 404
integer width = 571
integer height = 124
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 16711680
long backcolor = 15793151
string text = "Doble Click para Ver Detalle Tipo Servicio"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_validar_promesa_operaciones
integer x = 3872
integer y = 728
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "serie"
end type

event clicked;//String	ls_base,ls_serie,ls_dv,ls_descrip,ls_estado_cadena
//Long		ll_rut,ll_ult_estado,ll_count,ll_tot_reg,ll_cd_asigna
//Double	ll_numero
//
//dw_base.accepttext()
//dw_revision.accepttext()
//ll_rut													= long(em_rut.text)
//ls_dv													= trim(em_dv.text)
//ls_base												= dw_base.getitemstring(1,'base')
//ls_serie                        							= trim(ddlb_serie.text)
//is_sw_pasa											= 'S'
//
//if ls_base='O' or ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' or ls_base='F' then
//	if ls_base = 'F' then
//////Modificacion Mirko 15/01/2021
////		SELECT 	MIN("CD_FOLIO"."NUMERO"  )
////		INTO		:ll_numero
////		FROM 	"CD_FOLIO"  
////		WHERE 	( "CD_FOLIO"."BASE" = 'F' ) AND  
////					( "CD_FOLIO"."SERIE" = 'C' ) AND  
////					( "CD_FOLIO"."COD_AGENTE" = :gs_user ) AND  
////					( "CD_FOLIO"."ULT_ESTADO" < 11 OR "CD_FOLIO"."ULT_ESTADO" = 14)   
//// Codigo Marcos Ayala Original
//		SELECT	max("CD_FOLIO"."NUMERO")
//		INTO 		:ll_numero
//		FROM 	"CD_FOLIO","REVISION_CONTRATOS"
//		WHERE 	"CD_FOLIO"."BASE" = "REVISION_CONTRATOS"."BASE" AND
//					"CD_FOLIO"."SERIE" = "REVISION_CONTRATOS"."SERIE" AND
//					"CD_FOLIO"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" AND
//					"CD_FOLIO"."BASE" = :ls_base AND
//					"CD_FOLIO"."SERIE" = :ls_serie AND
//					"CD_FOLIO"."ULT_ESTADO" = 11
//		USING	sqlca;
//		if isnull(ll_numero) then ll_numero =0
//		
////		if ll_numero = 0 then 
////			messagebox("Advertencia","Ejecutivo NO tiene Folios Asignados")
//			
////			SELECT	min("CD_FOLIO"."NUMERO")
////			INTO 		:ll_numero
////			FROM 	"CD_FOLIO"
////			WHERE 	"CD_FOLIO"."BASE" = :ls_base AND
////						"CD_FOLIO"."SERIE" = :ls_serie
////			USING	sqlca;
////			if isnull(ll_numero) then ll_numero = 0
//			
////		else
////			em_numero.text							= string(ll_numero + 1)
////			em_numero.enabled						= false
//			
//			SELECT	COUNT("CD_FOLIO_DETALLE"."NUMERO")
//			INTO 		:ll_cd_asigna
//			FROM 	"CD_FOLIO_DETALLE"
//			WHERE 	"CD_FOLIO_DETALLE"."BASE" = :ls_base AND
//						"CD_FOLIO_DETALLE"."SERIE" = :ls_serie AND
//						"CD_FOLIO_DETALLE"."NUMERO" = (:ll_numero + 1)	AND	//(:ll_numero + 1) AND
//						( "CD_FOLIO_DETALLE"."ESTADO" = 2 OR "CD_FOLIO_DETALLE"."ESTADO" = 14)
//			USING	sqlca;
//			if isnull(ll_cd_asigna) then ll_cd_asigna =0
//			
//			if ll_cd_asigna > 0 then
//				em_numero.triggerevent(modified!)
//				dw_revision.setfocus()
//				dw_revision.setcolumn('codigo_servicio')			
//				dw_revision.accepttext()
//			else
//				messagebox("Advertencia","Contrato Funerario Sin Asignación Agente Ventas, Debe Ingresar Asignación",Exclamation!)
//				if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
//				open(w_cd_gestion_asignacion_agente)
//			end if
////		end if
//	else
//		ls_serie										= trim(ddlb_serie.text)
//		ll_numero									= Double(em_numero.text)
//		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' then
//			SELECT	COUNT("SERIE")  
//			INTO 		:ll_count  
//			FROM 	"TABLA_SERIES"  
//			WHERE  	( "TABLA_SERIES"."BASE" = :ls_base ) AND
//						( "TABLA_SERIES"."SERIE" = :ls_serie )   
//			USING	sqlca;
//			if ll_count=1 then
//				if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' and ls_base<>'' and not isnull(ls_base) and ll_numero>0 then
//					SELECT	"ESTADO"."NOMBRE_ESTADO"  
//					INTO 		:ls_estado_cadena  
//					FROM 	"CADENA","ESTADO"  
//					WHERE 	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
//								(("CADENA"."CODIGO" = :ls_base ) AND  
//								( "CADENA"."SERIE" = :ls_serie ) AND  
//								( "CADENA"."NUMERO" = :ll_numero ) )   
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Estado '+ls_estado_cadena)
//						wf_valida_producto(ll_rut,ls_base,ls_serie,ll_numero)
//						
//					elseif sqlca.sqlcode=100 then
//						if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then
//							is_nuevo							= 'S'
//							wf_limpiar_detalle()
//							SELECT	"ULT_ESTADO",	"COD_PARQUE"
//							INTO 		:ll_ult_estado,		:il_cod_parque
//							FROM 	"CD_FOLIO"  
//							WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
//										( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
//										( "CD_FOLIO"."NUMERO" = :ll_numero )   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								if ls_base<>'F' then
//									dw_revision.getchild('area',idw_detalle2)
//									idw_detalle2.settransobject(sqlca)
//									if idw_detalle2.retrieve(il_cod_parque)=0 then
//										idw_detalle2.insertrow(0)
//									end if
//								else
//									dw_revision.getchild('codigo_servicio',idw_detalle3)
//									idw_detalle3.settransobject(sqlca)
//									if idw_detalle3.retrieve(il_cod_parque)=0 then
//										idw_detalle3.insertrow(0)
//									end if
//								end if
//								SELECT	"CD_ESTADO"."DESCRIPCION"  
//								INTO 		:ls_descrip  
//								FROM 	"CD_ESTADO"  
//								WHERE 	"CD_ESTADO"."CODIGO" = :ll_ult_estado   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//			//						messagebox("Advertencia","Recuerde Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra en ESTADO '+ls_descrip+' en Control Documentario')
//								else
//									messagebox("Advertencia","Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' No Existe en Control Documentario')
//									wf_limpiar_detalle()
//									dw_revision.enabled	= false
//									em_numero.setfocus()
//								end if
//							else
//								dw_revision.enabled		= true
//								ls_base						= dw_base.getitemstring(1,'base')
//								SELECT	COUNT("CORRELATIVO")  
//								INTO 		:il_reg_obs  
//								FROM 	"REVISION_CONTRATOS_OBSERVACION"  
//								WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
//											( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
//											( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
//											( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
//								USING	sqlca;
//								if isnull(il_reg_obs) then il_reg_obs=0
//								if not isnull(ls_base) then wf_calcular(ls_base)
//								dw_revision.setfocus()
//							end if
//						else
//							is_nuevo							= 'N'
//							dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
//							if not isnull(ls_base) then wf_calcular(ls_base)
//							dw_revision.accepttext()
//						end if
//						ls_base								= dw_base.getitemstring(1,'base')
//						SELECT	COUNT("CORRELATIVO")  
//						INTO 		:il_reg_obs  
//						FROM 	"REVISION_CONTRATOS_OBSERVACION"  
//						WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
//									( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
//									( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
//									( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
//						USING	sqlca;
//						if isnull(il_reg_obs) then il_reg_obs=0
//						if is_nuevo							= 'S' then
//							if not isnull(ls_base) then wf_calcular(ls_base)
//							ll_rut								= Long(em_rut.text)
//							ls_dv								= trim(em_dv.text)
//							ls_base							= dw_base.getitemstring(1,'base')
//							ls_serie							= trim(ddlb_serie.text)
//							ll_numero						= Double(em_numero.text)
//							dw_revision.setitem(1,'rut',ll_rut)
//							dw_revision.setitem(1,'dv',ls_dv)
//							dw_revision.setitem(1,'base',ls_base)
//							dw_revision.setitem(1,'serie',ls_serie)
//							dw_revision.setitem(1,'numero',ll_numero)
//							dw_revision.setitem(1,'cod_parque',il_cod_parque)
//							dw_revision.setitem(1,'estado_revision','V')
//							if ls_base<>'F' then
//								if idw_detalle2.retrieve(il_cod_parque)=0 then
//									idw_detalle2.insertrow(0)
//								end if
//							else
//								if idw_detalle3.retrieve(il_cod_parque)=0 then
//									idw_detalle3.insertrow(0)
//								end if
//							end if
//							if ls_base='D' then dw_revision.setitem(1,'forma_pago','2')
//							dw_revision.accepttext()
//							dw_revision.setfocus()
//							dw_revision.setcolumn('cod_parque')
//							dw_revision.enabled			= true
//						end if
//						dw_revision.setfocus()
//					end if
//				else
//					if isnull(ll_rut) then
//						messagebox("Advertencia","Debe Ingresar Rut")
//						em_rut.setfocus()
//					elseif isnull(ls_dv) then
//						messagebox("Advertencia","Debe Ingresar Dv")
//						em_dv.setfocus()
//					elseif isnull(ls_base) then
//						messagebox("Advertencia","Debe Ingresar Base")
//						dw_base.setfocus()
//					elseif isnull(ls_serie) then
//						messagebox("Advertencia","Debe Ingresar Serie")
//						ddlb_serie.setfocus()
//					elseif isnull(ll_numero) then
//						messagebox("Advertencia","Debe Ingresar Número")
//						em_numero.setfocus()
//					end if
//				end if
//			else
//				messagebox("Advertencia","Serie No Corresponde a Tipo de Contrato")
//				ddlb_serie.reset()
//				ddlb_serie.setfocus()
//			end if
//		end if
//	end if
//else
//	messagebox("Advertencia","Solo es Posible Revisar Promesas, Derecho Especial, Pagaré, Aumento Capacidad y Anexo Liberador")
//	ddlb_serie.reset()
//end if
end event

type cb_ingreso_benef from commandbutton within w_validar_promesa_operaciones
integer x = 1312
integer y = 2588
integer width = 375
integer height = 92
integer taborder = 150
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingreso Benef."
end type

event clicked;pb_benef.triggerevent(clicked!)
end event

type dw_clientes from datawindow within w_validar_promesa_operaciones
boolean visible = false
integer x = 3579
integer y = 224
integer width = 686
integer height = 400
boolean enabled = false
string title = "none"
string dataobject = "d_ingreso_clientes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ingresar from commandbutton within w_validar_promesa_operaciones
integer x = 1312
integer y = 2492
integer width = 375
integer height = 92
integer taborder = 140
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ingresar &Gestión"
end type

event clicked;String		ls_string,ls_depto,ls_descrip,ls_base,ls_serie
Long		ll_estado,ll_tot_reg,ll_numero

ll_tot_reg		= dw_revision.rowcount() 
if ll_tot_reg>0 then
	ls_base			= dw_revision.getitemstring(1,'base')
	ls_serie			= dw_revision.getitemstring(1,'serie')
	ll_numero 		= dw_revision.getitemnumber(1,'numero')
	
	SELECT	"CD_FOLIO"."ULT_ESTADO","CD_FOLIO"."DEPTO_ASIGNADO"
	INTO		:ll_estado,	:ls_depto	
	FROM 	"CD_FOLIO"  
	WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
				( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				( "CD_FOLIO"."NUMERO" = :ll_numero )
	USING	sqlca;
	if isnull(ll_estado) then
		messagebox("Advertencia","Contrato Antiguo, es posible consultar Cuenta Corriente")
	else
		SELECT	"CD_ESTADO"."GLOSA"  
		INTO 		:ls_descrip  
		FROM 	"CD_ESTADO"  
		WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   ;
	
		if not isnull(ll_numero) and ll_numero>0 and not isnull(ls_base) and not isnull(ls_serie) then
			if (gs_conexion="Parque La Foresta" and ls_depto='O') or (gs_conexion="Parque La Foresta" and ls_depto='P') or &
				(gs_conexion="Parque La Foresta" and ls_depto='T') or (ls_depto=gs_depto) or (gs_depto='R' or gs_depto='X') or (gs_depto='O' and ll_estado=16) or &
				(gs_depto='O' and ll_estado=23) or gs_depto='I' or ll_estado=4 or ll_estado=10 or ll_estado=27 or ll_estado=5 or &
				ll_estado=24 or ll_estado=11 or ll_estado=9 or ll_estado=8 or ll_estado=18 or ll_estado=21 or ll_estado=22 or &
				ll_estado=25 OR ll_estado=26 OR ll_estado=28 OR ll_estado=29 then
				
				if ll_estado>1 then
					if ll_estado=100 or ll_estado=101 or ll_estado=102 or ll_estado=103 or ll_estado=104 or ll_estado=105 then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					elseif (gs_depto='P' and ll_estado<>6) and (gs_depto='P' and ll_estado<>17) then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					elseif ((gs_depto='V' or gs_depto='R' or gs_depto='X') and ll_estado=9)  or (gs_depto='E' and ll_estado=9) or &
							 (gs_depto='D' and ll_estado=9)  or (gs_depto='O' and ll_estado=5) or &
							 ((gs_depto='V' or gs_depto='R' or gs_depto='X') and ll_estado=11) or (gs_depto='E' and ll_estado=11) or &
							 (gs_depto='D' and ll_estado=11) or ((gs_depto='V' or gs_depto='R' or gs_depto='X') and ll_estado=4) or &
							 (gs_depto='E' and ll_estado=23) or (gs_depto='T' and ll_estado=4) or &
							 (gs_depto='D' and ll_estado=4) then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					elseif gs_depto<>'O' and ll_estado=8 then
						messagebox("Advertencia","No es posible Ingresar Gestión Folio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+', por encontrarse en Estado: '+string(ll_estado)+' - '+ls_descrip)
					else
						ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
						if isvalid(w_cd_ingresar_control_documentacion) then close(w_cd_ingresar_control_documentacion)
						openwithparm(w_cd_ingresar_control_documentacion,ls_string)
					end if
				else
					if gs_depto='V' or gs_depto='R' or gs_depto='X' then
						messagebox("Advertencia","No es posible Ingresar Gestión, recuerde Estado Actual por lo menos debe estar en Código 2-Asignado Form.Agente")
					elseif gs_depto='E' then
						messagebox("Advertencia","No es posible Ingresar Gestión, recuerde Estado Actual por lo menos debe estar en Código 21-Asignado Form.Ejecutivo")
					end if
				end if
			elseif ll_estado=9 then
				messagebox("Advertencia","Folio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+", está Aceptado por Depto. Operaciones")
			else
				messagebox("Advertencia","Folio "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+", No está Asignado a su Departamento")
			end if
		end if
	end if
end if
end event

type ddlb_serie from dropdownlistbox within w_validar_promesa_operaciones
integer x = 2514
integer y = 36
integer width = 261
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16776960
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String		ls_base,ls_serie,ls_dv,ls_descrip,ls_estado_cadena,ls_uso
Long		ll_rut,ll_ult_estado,ll_count,ll_tot_reg,ll_cd_asigna,ll_cadena
Double	ll_numero

dw_base.accepttext()
dw_revision.accepttext()
ll_rut													= long(em_rut.text)
ls_dv													= trim(em_dv.text)
ls_base												= dw_base.getitemstring(1,'base')
if not isnull(ls_base) and ls_base<>'' then
	ls_serie                        							= trim(ddlb_serie.text)
	is_sw_pasa											= 'S'
	
	if ls_base='O' or ls_base='U' or ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' or ls_base='F' or ls_base='G' or ls_base='V' then
		ls_serie										= trim(ddlb_serie.text)
		ll_numero									= Double(em_numero.text)
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' then
			SELECT	COUNT("SERIE")
			INTO 		:ll_count
			FROM 	"TABLA_SERIES"
			WHERE  	( "TABLA_SERIES"."BASE" = :ls_base ) AND
						( "TABLA_SERIES"."SERIE" = :ls_serie )
			USING	sqlca;
			if ll_count=1 then
				if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' and ls_base<>'' and not isnull(ls_base) and ll_numero>0 then
					SELECT	"ESTADO"."NOMBRE_ESTADO"  
					INTO 		:ls_estado_cadena  
					FROM 	"CADENA","ESTADO"  
					WHERE 	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Estado '+ls_estado_cadena)
						wf_valida_producto(ll_rut,ls_base,ls_serie,ll_numero)
						
					elseif sqlca.sqlcode=100 then
						if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then
							is_nuevo							= 'S'
							wf_limpiar_detalle()
							SELECT	"ULT_ESTADO",	"COD_PARQUE"
							INTO 		:ll_ult_estado,		:il_cod_parque
							FROM 	"CD_FOLIO"  
							WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
										( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
										( "CD_FOLIO"."NUMERO" = :ll_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_base<>'F' and ls_base<>'G' and ls_base<>'V' then
									dw_revision.getchild('area',idw_detalle2)
									idw_detalle2.settransobject(sqlca)
									if gs_cod_prod='CO' or gs_cod_prod='SE' then
										if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
											idw_detalle2.insertrow(0)
										end if
										if idw_detalle4.retrieve(gs_cod_prod)=0 then
											idw_detalle4.insertrow(0)
										end if
									else
										if idw_detalle2.retrieve(il_cod_parque)=0 then
											idw_detalle2.insertrow(0)
										end if
									end if
									idw_detalle12.reset()
									idw_detalle12.insertrow(0)
								else
									ls_uso			= dw_revision.getitemstring(1,'uso')
									if isnull(ls_uso) then ls_uso='NI'
									dw_revision.getchild('codigo_servicio',idw_detalle3)
									idw_detalle3.settransobject(sqlca)
									if dw_revision.dataobject='dw_revision_contratos_producto' then
										if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,'2')=0 then
											idw_detalle3.insertrow(0)
										end if
									else
										if idw_detalle3.retrieve(il_cod_parque,ls_serie)=0 then
											idw_detalle3.insertrow(0)
										end if
									end if
									if dw_revision.dataobject='dw_revision_contratos_producto' then
										dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
										idw_detalle1.settransobject(sqlca)
										if ll_numero > 0 then
											if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
												idw_detalle1.insertrow(0)
											end if
										else
											idw_detalle1.insertrow(0)
										end if
									end if
								end if
								SELECT	"CD_ESTADO"."DESCRIPCION"  
								INTO 		:ls_descrip  
								FROM 	"CD_ESTADO"  
								WHERE 	"CD_ESTADO"."CODIGO" = :ll_ult_estado   
								USING		sqlca;
								if sqlca.sqlcode=0 then
								else
									messagebox("Advertencia","Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' No Existe en Control Documentario')
									wf_limpiar_detalle()
									dw_revision.enabled	= false
									em_numero.setfocus()
								end if
							else
								dw_revision.enabled		= true
								ls_base						= dw_base.getitemstring(1,'base')
								SELECT	COUNT("CORRELATIVO")  
								INTO 		:il_reg_obs  
								FROM 	"REVISION_CONTRATOS_OBSERVACION"  
								WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
											( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
											( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
											( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
								USING	sqlca;
								if isnull(il_reg_obs) then il_reg_obs=0
								if not isnull(ls_base) then wf_calcular(ls_base)
								dw_revision.setfocus()
							end if
						else
							is_nuevo							= 'N'
							dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
							if not isnull(ls_base) then wf_calcular(ls_base)
							dw_revision.accepttext()
						end if
						ls_base								= dw_base.getitemstring(1,'base')
						SELECT	COUNT("CORRELATIVO")  
						INTO 		:il_reg_obs  
						FROM 	"REVISION_CONTRATOS_OBSERVACION"  
						WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
									( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
									( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
									( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
						USING	sqlca;
						if isnull(il_reg_obs) then il_reg_obs=0
						if is_nuevo							= 'S' then
							if not isnull(ls_base) then wf_calcular(ls_base)
							ll_rut								= Long(em_rut.text)
							ls_dv								= trim(em_dv.text)
							ls_base							= dw_base.getitemstring(1,'base')
							ls_serie							= trim(ddlb_serie.text)
							ll_numero						= Double(em_numero.text)
							dw_revision.setitem(1,'rut',ll_rut)
							dw_revision.setitem(1,'dv',ls_dv)
							dw_revision.setitem(1,'base',ls_base)
							dw_revision.setitem(1,'serie',ls_serie)
							dw_revision.setitem(1,'numero',ll_numero)
							dw_revision.setitem(1,'cod_parque',il_cod_parque)
							dw_revision.setitem(1,'estado_revision','V')
							if ls_base<>'F' and ls_base<>'G' and ls_base<>'V' then
								if gs_cod_prod='CO' or gs_cod_prod='SE' then
									if idw_detalle2.retrieve(il_cod_parque,gs_cod_prod)=0 then
										idw_detalle2.insertrow(0)
									end if
									if idw_detalle4.retrieve(gs_cod_prod)=0 then
										idw_detalle4.insertrow(0)
									end if
								else
									if idw_detalle2.retrieve(il_cod_parque)=0 then
										idw_detalle2.insertrow(0)
									end if
								end if
							else
								ls_uso			= dw_revision.getitemstring(1,'uso')
								if isnull(ls_uso) then ls_uso='NI'
								dw_revision.getchild('codigo_servicio',idw_detalle3)
								idw_detalle3.settransobject(sqlca)
								if dw_revision.dataobject='dw_revision_contratos_producto' then
									if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,'2')=0 then
										idw_detalle3.insertrow(0)
									end if
								else
									if idw_detalle3.retrieve(il_cod_parque,ls_serie)=0 then
										idw_detalle3.insertrow(0)
									end if
								end if
								if dw_revision.dataobject='dw_revision_contratos_producto' then
									dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
									idw_detalle1.settransobject(sqlca)
									if ll_numero > 0 then
										if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
											idw_detalle1.insertrow(0)
										end if
									else
										idw_detalle1.insertrow(0)
									end if
								end if
							end if
							if ls_base='D' then dw_revision.setitem(1,'forma_pago','2')
							dw_revision.accepttext()
							dw_revision.setfocus()
							dw_revision.setcolumn('cod_parque')
							dw_revision.enabled			= true
						end if
						dw_revision.setfocus()
					end if
				else
					if isnull(ll_rut) then
						messagebox("Advertencia","Debe Ingresar Rut")
						em_rut.setfocus()
					elseif isnull(ls_dv) then
						messagebox("Advertencia","Debe Ingresar Dv")
						em_dv.setfocus()
					elseif isnull(ls_base) then
						messagebox("Advertencia","Debe Ingresar Base")
						dw_base.setfocus()
					elseif isnull(ls_serie) then
						messagebox("Advertencia","Debe Ingresar Serie")
						ddlb_serie.setfocus()
					elseif isnull(ll_numero) then
						messagebox("Advertencia","Debe Ingresar Número")
						em_numero.setfocus()
					end if
				end if
			else
				messagebox("Advertencia","Serie No Corresponde a Tipo de Contrato")
				ddlb_serie.reset()
				ddlb_serie.setfocus()
			end if
		end if
	else
		messagebox("Advertencia","Solo es Posible Revisar Promesas, Derecho Especial, Pagaré, Aumento Capacidad, Anexo Liberador, Ventas Funerarias")
		ddlb_serie.reset()
	end if
elseif isnull(ls_base) or ls_base='' then
	dw_base.reset()
	dw_base.insertrow(0)
	ddlb_serie.text			= ''
	messagebox("Advertencia","Debe Ingresar Base Contrato")
	dw_base.setfocus()

end if
end event

event getfocus;String		ls_base, ls_dv
Double	ll_rut
ll_rut													= long(em_rut.text)
ls_dv													= trim(em_dv.text)
ls_base												= dw_base.getitemstring(1,'base')
if isnull(ll_rut) or ll_rut=0 then
	messagebox("Advertencia","Debe Ingresar Rut")
	em_rut.setfocus()
elseif isnull(ls_dv) or ls_dv='' then
	messagebox("Advertencia","Debe Ingresar Digito verificador")
	em_dv.setfocus()
elseif isnull(ls_base) or ls_base='' then
	messagebox("Advertencia","Debe Ingresar Base Contrato")
	dw_base.setfocus()
end if
end event

type cb_ctrol_doc from commandbutton within w_validar_promesa_operaciones
integer x = 1691
integer y = 2588
integer width = 325
integer height = 92
integer taborder = 170
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control Docto."
end type

event clicked;String		ls_string,ls_base,ls_serie
Double	ll_numero

if dw_revision.rowcount()>0 then
	ls_base		= dw_revision.getitemstring(1,'base')
	ls_serie		= dw_revision.getitemstring(1,'serie')
	ll_numero	= dw_revision.getitemnumber(1,'numero')
	ls_string		= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(ls_base) and ll_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type pb_producto from picturebutton within w_validar_promesa_operaciones
boolean visible = false
integer x = 827
integer y = 2604
integer width = 155
integer height = 136
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "Outsoursing (o).BMP"
string disabledname = "control_documentario_no.bmp"
end type

event clicked;string		ls_uso,ls_est_valida,ls_tipo_infor,ls_string,ls_base,ls_serie,ls_moneda
long		ll_tipo_benef,ll_cant_benef,ll_tipo_servicio,ll_digitada,ll_plazo,ll_cod_prod_asoc
Double	ll_numero,ldb_precio,lld_pie,lld_gasto_uf,ld_calculo

dw_revision.accepttext()
ls_base													= dw_revision.getitemstring(1,'base')
ls_serie													= dw_revision.getitemstring(1,'serie')
ll_numero												= dw_revision.getitemnumber(1,'numero')
ls_est_valida											= 'R'
ll_tipo_benef											= dw_revision.getitemnumber(1,'tipo_beneficiarios')
ll_cant_benef											= dw_revision.getitemnumber(1,'capacidad')
ll_tipo_servicio											= dw_revision.getitemnumber(1,'codigo_servicio')
il_cod_parque											= dw_revision.getitemnumber(1,'cod_parque')
ls_uso													= dw_revision.getitemstring(1,'uso')
ls_moneda												= dw_revision.getitemstring(1,'moneda')
SELECT DISTINCT "REVISION_CONTRATOS"."CODIGO_SERVICIO"  
INTO 		:ll_cod_prod_asoc  
FROM 	"REVISION_CONTRATOS"  
WHERE 	( "REVISION_CONTRATOS"."BASE" = :ls_base ) AND  
			( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
			( "REVISION_CONTRATOS"."NUMERO" = :ll_numero )   ;
if ll_cod_prod_asoc <> ll_tipo_servicio then
	DELETE FROM "PRODUCTO_VENTA_ASOCIADA"  
	WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
end if
ls_tipo_infor												= 'S'
ls_string													= string(ll_tipo_benef)+'~t'+string(ll_cant_benef)+'~t'+string(ll_tipo_servicio)+'~t'+string(il_cod_parque)+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_uso+'~t'+ls_est_valida+'~t'+ls_tipo_infor+'~t'+ls_moneda
if not isnull(ll_tipo_benef) and ll_tipo_benef>0 and not isnull(ll_cant_benef) and ll_cant_benef>0 and not isnull(ll_tipo_servicio) and ll_tipo_servicio>0 and not isnull(il_cod_parque) and il_cod_parque>0 and not isnull(ls_uso) and ls_uso<>'' then
	openwithparm(w_tipo_servicio_detalle,ls_string)
//	if ls_base='F' then
//		SELECT 	DISTINCT "PRODUCTO_TIPO_SERVICIO"."CANTIDAD_FC"  
//		INTO 		:ll_cant_benef  
//		FROM 	"PRODUCTO_TIPO_SERVICIO"  
//		WHERE 	"PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_tipo_servicio   
//		USING	sqlca;
//		if isnull(ll_cant_benef) or ll_cant_benef=0 then ll_cant_benef=1
//		if sqlca.sqlcode=0 then
//			dw_revision.setitem(1,'capacidad',ll_cant_benef)
//		end if
//	end if
	dw_revision.accepttext()
//	ldb_precio												= double(dw_revision.getitemnumber(1,'precio_contrato'))
//	lld_pie													= double(dw_revision.getitemnumber(1,'pie'))
//	lld_gasto_uf												= double(dw_revision.getitemnumber(1,'gasto_adm'))
//	ls_moneda												= dw_revision.getitemstring(1,'moneda')
//	ll_plazo													= dw_revision.getitemnumber(1,'plazo')
//	if isnull(lld_pie) then lld_pie=0
//	if isnull(lld_gasto_uf) then lld_gasto_uf=0
//	if isnull(ldb_precio) or isnull(lld_gasto_uf) then
//		dw_revision.setitem(1,'saldo_financiar',0)
//	else
//		//ld_calculo											= (( ldb_precio - lld_pie ) + lld_gasto_uf )lld_pie_iva
//		ld_calculo											= (( ldb_precio - lld_pie ) + lld_gasto_uf )
//		dw_revision.setitem(1,'saldo_financiar',ld_calculo)
//		if ls_moneda='1' then //peso
//			dw_revision.setitem(1,'valor_cuota', round((ld_calculo / ll_plazo),0))
//		else
//			dw_revision.setitem(1,'valor_cuota', round((ld_calculo / ll_plazo),4))
//		end if
//		
//	end if
//	dw_revision.accepttext()
	dw_revision.setfocus()
	dw_revision.setcolumn('sw_activa_servicio')
else
	if isnull(ll_tipo_benef) or ll_tipo_benef=0 then
		messagebox("Advertencia","Debe ingresar antes Tipo Beneficiario")
		dw_revision.setfocus()
		dw_revision.setcolumn('producto_anexo_tipo_beneficiarios')
	elseif isnull(ll_cant_benef) or ll_cant_benef=0 then
		messagebox("Advertencia","Debe ingresar antes Cantidad Beneficiario")
		dw_revision.setfocus()
		dw_revision.setcolumn('producto_pago_capacidad')	
	elseif isnull(ll_tipo_servicio) or ll_tipo_servicio=0 then
		messagebox("Advertencia","Debe ingresar antes Tipo Servicio")
		dw_revision.setfocus()
		dw_revision.setcolumn('producto_pago_codigo_servicio')
	elseif isnull(il_cod_parque) or il_cod_parque=0 then
		messagebox("Advertencia","Debe ingresar antes Parque")
		dw_revision.setfocus()
		dw_revision.setcolumn('cadena_cod_parque')
	elseif isnull(ls_uso) or ls_uso='' then
		messagebox("Advertencia","Debe ingresar antes Tipo Uso")
		dw_revision.setfocus()
		dw_revision.setcolumn('producto_anexo_uso')	
	end if
end if
end event

type pb_benef from picturebutton within w_validar_promesa_operaciones
boolean visible = false
integer x = 1019
integer y = 2604
integer width = 155
integer height = 136
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "control_documentario.bmp"
string disabledname = "control_documentario_no.bmp"
end type

event clicked;string		ls_string,ls_base,ls_serie
long		ll_tipo_benef,ll_capac
Double	ll_numero

dw_revision.accepttext()

ls_base													= dw_revision.getitemstring(1,'base')
ls_serie													= dw_revision.getitemstring(1,'serie')
ll_numero												= dw_revision.getitemnumber(1,'numero')
if ll_numero > 0 then
	ll_tipo_benef										= dw_revision.getitemnumber(1,'tipo_beneficiarios')
	il_cod_parque										= dw_revision.getitemnumber(1,'cod_parque')
	ll_capac												= dw_revision.getitemnumber(1,'capacidad')
	ls_string												= string(ll_tipo_benef)+'~t'+string(il_cod_parque)+'~t'+ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_capac)
	if not isnull(ll_tipo_benef) and ll_tipo_benef>0 then 
		is_recordar_benef								= 'S'
		openwithparm(w_producto_beneficiarios,ls_string)
		if dw_revision.dataobject='dw_revision_contratos_producto' then
			dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
			idw_detalle1.settransobject(sqlca)
			if ll_numero > 0 then
				if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
					idw_detalle1.insertrow(0)
				end if
			else
				idw_detalle1.insertrow(0)
			end if
		end if
	else
		if isnull(ll_tipo_benef) or ll_tipo_benef=0 then 
			messagebox("Advertencia","Debe ingresar antes Tipo Servicio")
			dw_revision.setfocus()
			dw_revision.setcolumn('producto_anexo_tipo_beneficiarios')
		elseif isnull(ll_capac) or ll_capac=0 then 
			messagebox("Advertencia","Debe ingresar antes Cantidad Beneficiarios")
			dw_revision.setfocus()
			dw_revision.setcolumn('producto_pago_capacidad')
		end if
	end if		
end if

end event

type st_gestion_serv from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2619
integer y = 1616
integer width = 763
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 16711680
long backcolor = 15793151
string text = "Mantenedor Gestion Servicios"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_val_benef from commandbutton within w_validar_promesa_operaciones
integer x = 2021
integer y = 2492
integer width = 288
integer height = 92
integer taborder = 180
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Validar &Benef"
end type

event clicked;String	ls_string

is_base						= dw_base.getitemstring(1,'base')
is_serie						= trim(ddlb_serie.text)
il_numero					= Double(em_numero.text)
if il_numero > 0 and not isnull(is_serie) and not isnull(is_base) then
	ls_string					= is_base+'~t'+is_serie+'~t'+string(il_numero)
	if isvalid(w_validar_beneficiarios) then close(w_validar_beneficiarios)
	openwithparm(w_validar_beneficiarios,ls_string)
else
	messagebox("Advertencia","Debe Ingresar Nº Promesa")
	dw_base.setfocus()
end if
end event

type st_ctacte from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 398
integer y = 2444
integer width = 850
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Doble Click muestra Cuenta Corriente"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ctacte.visible	= false
end event

type cb_help from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2363
integer y = 2588
integer width = 238
integer height = 92
integer taborder = 210
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ayuda"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;if isvalid(w_ayuda_revision_contratos) then close(w_ayuda_revision_contratos)
open(w_ayuda_revision_contratos)
end event

type cbx_tipo_rechazo from checkbox within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 896
integer y = 2508
integer width = 361
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Rechazo"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;datetime	ldt_fecha_crea
String		ls_string,ls_memo,ls_base,ls_serie,ls_dv
Long		ll_estado,ll_rut
Double	ll_numero

ll_rut							= long(em_rut.text)
ls_dv							= trim(em_dv.text)
ls_base						= dw_base.getitemstring(1,'base')
ls_serie						= trim(ddlb_serie.text)
ll_numero					= Double(em_numero.text)
if not isnull(ll_numero) and ll_numero>0 and not isnull(ls_base) and not isnull(ls_serie) then
	SELECT	sysdate
	INTO 		:gdt_fec_sistema
	FROM 		"TASA"  ;
	ldt_fecha_crea			= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ll_estado					= 5
	ls_memo					= 'RECHAZADO CONTRATO POR ADMINISTRACION DE VENTAS POR USUARIO '+gs_nom_comp_usuario+' EL DIA '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")
	ls_string					= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm:ss")+'~t'+'N'+'~t'+ls_memo+'~t'+string(ll_estado)
	openwithparm(w_ingreso_detalle_rechazo,ls_string)
end if
end event

type cb_memo from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1691
integer y = 2492
integer width = 325
integer height = 92
integer taborder = 160
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Memorando"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;String	ls_string,ls_memo,ls_base,ls_serie,ls_dv,ls_descrip_estado
Long		ll_estado,ll_estado_anterior,ll_rut
Datetime	ldt_fecha_crea,ldt_fecha_estado
Double	ll_numero

ll_rut							= long(em_rut.text)
ls_dv							= trim(em_dv.text)
ls_base						= dw_base.getitemstring(1,'base')
ls_serie						= trim(ddlb_serie.text)
ll_numero					= Double(em_numero.text)
if not isnull(ll_numero) and ll_numero>0 and not isnull(ls_base) and not isnull(ls_serie) then
	ll_estado_anterior	= il_ult_estado
	SELECT	"CD_FOLIO"."ULT_GLOSA_ESTADO",	"CD_FOLIO"."ULT_ESTADO",	"CD_FOLIO"."ULT_FECHA_ESTADO",	"CD_ESTADO"."DESCRIPCION"
	INTO 		:ls_memo,									:ll_estado,							:ldt_fecha_estado,							:ls_descrip_estado
	FROM 	"CD_FOLIO","REVISION_CONTRATOS","CD_ESTADO"	
   WHERE  	( "CD_FOLIO"."BASE" = "REVISION_CONTRATOS"."BASE" ) and  
          		( "CD_FOLIO"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
          		( "CD_FOLIO"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
			 	( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and 
			 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
			 	( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
			 	( "CD_FOLIO"."NUMERO" = :ll_numero )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if (ll_estado=4 and gs_depto='V') or (ll_estado=5 and gs_depto='V') or &
			(ll_estado=9 and gs_depto='O') or (ll_estado=16 and gs_depto='O') or &
			(ll_estado=10 and gs_depto='O') or (ll_estado=17 and gs_depto='O') then
			ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+trim(ls_memo)+'~t'+string(ll_estado)+'~t'+string(ldt_fecha_estado)+'~t'+string(ll_estado_anterior)
			openwithparm(w_cd_memorandum,ls_string)
		else
			messagebox("Advertencia","Para Ingresar MEMO en Control Documentario debe estar ACEPTADO o RECHAZADO, Actualmente se Encuentra en Estado "+ls_descrip_estado)
			cb_aceptar.setfocus()
		end if
	else
		messagebox("Advertencia","Antes de Ingresar Memorandum, debe Aceptar Revisión Contrato")
		cb_aceptar.setfocus()
	end if
else
	messagebox("Advertencia","Debe Aceptar Revisión Contrato")
	cb_aceptar.setfocus()
end if
end event

type cb_buscar from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 361
integer y = 2588
integer width = 439
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Revisión"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;if isvalid(w_lista_revisiones) then close(w_lista_revisiones)
open(w_lista_revisiones)
is_base												= dw_base.getitemstring(1,'base')
is_serie												= trim(ddlb_serie.text)
il_numero											= Double(em_numero.text)
end event

type dw_print from datawindow within w_validar_promesa_operaciones
boolean visible = false
integer x = 754
integer y = 2860
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_imprimir_orden_servicio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2363
integer y = 2492
integer width = 238
integer height = 92
integer taborder = 200
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;String	ls_base,ls_serie
Long		ll_rut
Double	ll_numero

dw_print.reset()
ls_base								= dw_base.getitemstring(1,'base')
ls_serie								= trim(ddlb_serie.text)
ll_numero							= Double(em_numero.text)
ll_rut									= Long(em_rut.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and &
	ll_numero>0 and ll_rut>0 then
	if ls_base='O' or ls_base='U' then
		dw_print.dataobject = 'dwe_imprimir_revision_contrato'
		dw_print.settransobject(sqlca)
		dw_print.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_nom_comp_usuario)
		f_Print( dw_print )
		
	elseif ls_base='F' or ls_base='G' or ls_base='V' then
		dw_print.dataobject = 'dwe_imprimir_orden_servicio'
		dw_print.settransobject(sqlca)
		dw_print.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_nom_comp_usuario)
		dw_print.object.usuario.text						= gs_user
		f_Print( dw_print )
		
		dw_print.dataobject = 'dwe_imprimir_orden_venta'
		dw_print.settransobject(sqlca)
		dw_print.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_nom_comp_usuario)
		dw_print.object.usuario.text						= gs_user
		f_Print( dw_print )
		
	else
		dw_print.dataobject = 'dwe_imprimir_revision_contrato_asoc'
		dw_print.settransobject(sqlca)
		dw_print.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_nom_comp_usuario)
		f_Print( dw_print )
	end if
	if dw_print.rowcount()=0 then
		messagebox("Advertencia","Antes de Imprimir Debe Aceptar Validación")
	else
		
	end if
end if
end event

type em_numero from editmask within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2912
integer y = 32
integer width = 457
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16776960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
end event

event modified;String		ls_base,ls_serie,ls_dv,ls_descrip,ls_estado_cadena,ls_agente,ls_uso,ls_pasa,ls_dv_dig_rev,ls_digitado,ls_origen_venta
Long		ll_ult_estado,ll_count,ll_tot_reg,ll_indi,ll_cod_seguro,ll_estado_reg,ll_reg,ll_cd_asigna,ll_tipo_servicio,ll_count_serv
Double	ldb_monto,ll_numero,ldb_iva,ll_rut_dig_rev,ll_rut

dw_base.accepttext()
dw_revision.accepttext()
ls_digitado											= 'N'
ll_rut													= long(em_rut.text)
ls_dv													= trim(em_dv.text)
ls_base												= dw_base.getitemstring(1,'base')
ls_serie												= trim(ddlb_serie.text)
ll_numero											= Double(em_numero.text)
is_base												= ls_base
is_serie												= ls_serie

dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
idw_detalle12.settransobject(sqlca)
if idw_detalle12.retrieve('M')=0 then
	idw_detalle12.insertrow(0)
end if

if not isnull(is_base) and is_base<>'' and not isnull(is_serie) and is_serie<>'' then
	il_numero											= ll_numero
	is_sw_pasa											= 'S'
	ls_pasa												= 'S'
	gs_mant_serv										= 'N'
	gs_mant_serv_uso									= 'N'
	SELECT 	iva		INTO :ldb_iva	FROM tasa;
	if ls_base <> 'G' then ldb_iva=0
	
	if (ls_base='O' or ls_base='U' or ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' or ls_base='F' or ls_base='G' or ls_base='V') then
		if not isnull(ls_serie) and ls_serie<> '' and not isnull(ll_numero) and ll_numero>0 then
			if ls_base='F' or ls_base='G' or ls_base='V' then
				SELECT	"ESTADO"."NOMBRE_ESTADO"  
				INTO 		:ls_estado_cadena  
				FROM 	"CADENA","ESTADO"  
				WHERE 	"CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" and  
							"CADENA"."CODIGO" = :ls_base AND  
							"CADENA"."SERIE" = :ls_serie AND  
							"CADENA"."NUMERO" = :ll_numero   
				USING	Trans_1;
				if Trans_1.sqlcode=0 then
					ls_digitado							= 'S'
					cb_aceptar.enabled				= false
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Estado '+ls_estado_cadena)
					if ls_base='F' or ls_base='G' or ls_base='V' then 
						if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then 
							cb_limpiar.triggerevent(clicked!)
							idw_detalle12.reset()
							idw_detalle12.insertrow(0)
						else
							ls_origen_venta		= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'origen_venta')
							if idw_detalle12.retrieve(ls_origen_venta) = 0 then idw_detalle12.insertrow(0)
							w_validar_promesa_operaciones.dw_revision.setitem(1,'iva_cuota',ldb_iva) 
							w_validar_promesa_operaciones.dw_revision.setitem(1,'iva_pie',ldb_iva)
							w_validar_promesa_operaciones.dw_revision.accepttext()
							ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
							if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
								SELECT 	Count("PRODUCTO_GESTION_SERVICIO"."BASE")
								INTO 		:ll_count_serv  
								FROM 	"PRODUCTO_GESTION_SERVICIO"  
								WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :ls_base ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :ls_serie ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :ll_numero )   ;
								if ll_count_serv > 0 then
									gs_base														= ls_base
									gs_serie														= ls_serie
									gi_numero													= ll_numero
									dw_revision.object.sw_activa_servicio_1.visible	= true
									dw_revision.object.t_13.visible							= true
									gs_mant_serv												= 'S'
									gs_mant_serv_uso											= 'N'
								else
									dw_revision.object.sw_activa_servicio_1.visible	= false
									dw_revision.object.t_13.visible							= false
								end if
							end if
						end if
					end if
				else
					cb_aceptar.enabled				= true
					ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
					if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
						SELECT 	Count("PRODUCTO_GESTION_SERVICIO"."BASE")
						INTO 		:ll_count_serv  
						FROM 	"PRODUCTO_GESTION_SERVICIO"  
						WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :ls_base ) AND  
									( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :ls_serie ) AND  
									( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :ll_numero )   ;
						if ll_count_serv > 0 then
							gs_base														= ls_base
							gs_serie														= ls_serie
							gi_numero													= ll_numero
							dw_revision.object.sw_activa_servicio_1.visible	= true
							dw_revision.object.t_13.visible							= true
							gs_mant_serv												= 'S'
							gs_mant_serv_uso											= 'N'
						else
							dw_revision.object.sw_activa_servicio_1.visible	= false
							dw_revision.object.t_13.visible							= false
						end if
					end if
					SELECT	COUNT("CD_FOLIO_DETALLE"."NUMERO")
					INTO 		:ll_cd_asigna
					FROM 	"CD_FOLIO_DETALLE"
					WHERE 	"CD_FOLIO_DETALLE"."BASE" = :ls_base AND
								"CD_FOLIO_DETALLE"."SERIE" = :ls_serie AND
								"CD_FOLIO_DETALLE"."NUMERO" = :ll_numero	AND
								( "CD_FOLIO_DETALLE"."ESTADO" = 2 OR "CD_FOLIO_DETALLE"."ESTADO" = 14)
					USING	sqlca;
					if isnull(ll_cd_asigna) then ll_cd_asigna =0
					if ll_cd_asigna > 0 then
						SELECT 	"CD_FOLIO"."COD_AGENTE"  
						INTO 		:ls_agente  
						FROM 	"CD_FOLIO"  
						WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
									( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
									( "CD_FOLIO"."NUMERO" = :ll_numero )   ;
						if isnull(ls_agente) or ls_agente='' then
							messagebox("Advertencia","Contrato Sin Asignación Agente Ventas, Debe Ingresar Asignación",Exclamation!)
							if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
							open(w_cd_gestion_asignacion_agente)
						else
							dw_revision.setfocus()
							dw_revision.setcolumn('codigo_servicio')			
							dw_revision.accepttext()
						end if
					else
						messagebox("Advertencia","Contrato Sin Asignación Agente Ventas, Debe Ingresar Asignación",Exclamation!)
						if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
						open(w_cd_gestion_asignacion_agente)
					end if
				end if
			end if
		end if
		
		ls_base											= dw_base.getitemstring(1,'base')
		ls_serie											= trim(ddlb_serie.text)
		ll_numero										= Double(em_numero.text)
		is_base											= ls_base
		is_serie											= ls_serie
		il_numero										= ll_numero
		if ll_numero > 0 then
			SELECT	Count("BASE")  
			INTO 		:ll_count  
			FROM 	"REVISION_CONTRATOS"  
			WHERE 	"REVISION_CONTRATOS"."BASE" = :ls_base AND
						"REVISION_CONTRATOS"."SERIE" = :ls_serie AND
						"REVISION_CONTRATOS"."NUMERO" = :ll_numero 
			USING		sqlca;
			if ll_count > 0 then
				SELECT	Count("BASE") 
				INTO 		:ll_count 
				FROM 	"REVISION_CONTRATOS"  
				WHERE 	"REVISION_CONTRATOS"."BASE" = :ls_base AND
							"REVISION_CONTRATOS"."SERIE" = :ls_serie AND
							"REVISION_CONTRATOS"."NUMERO" = :ll_numero
				USING		sqlca;
				if ll_count > 0 then
					SELECT DISTINCT "COD_PARQUE" ,	"RUT",				"DV"
					INTO 		:il_cod_parque ,				:ll_rut_dig_rev,		:ls_dv_dig_rev
					FROM 	"REVISION_CONTRATOS"  
					WHERE 	"REVISION_CONTRATOS"."BASE" = :ls_base AND
								"REVISION_CONTRATOS"."SERIE" = :ls_serie AND
								"REVISION_CONTRATOS"."NUMERO" = :ll_numero
					USING	sqlca;
					if isnull(il_cod_parque) then il_cod_parque=1
					ls_pasa									= 'S'
					is_new_calc								= 'N'
					if ll_rut_dig_rev <> ll_rut then
						ls_pasa								= 'N'
						if (ls_base= 'F' or ls_base='G' or ls_base='V') and ls_digitado = 'S' then
							
						else
							messagebox("Advertencia","Contrato N°: "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0')+", se encuentra Validado con Rut "+string(ll_rut_dig_rev)+'-'+ls_dv_dig_rev)
						end if
						ls_pasa								= 'N'
						
						wf_limpiar_detalle()
						dw_revision.enabled				= false
						em_rut.text							= ''
						em_dv.text							= ''
						dw_base.reset()
						dw_base.insertrow(0)
						ddlb_serie.text						= ''
						em_numero.text					= ''
						em_rut.setfocus()
					else
						if (ls_base= 'F' or ls_base='G' or ls_base='V') and ls_digitado = 'S' then
							
						else
							messagebox("Advertencia","Contrato Nº: "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0')+", se encuentra Validado")
						end if
						w_validar_promesa_operaciones.dw_revision.getchild('codigo_servicio',idw_detalle3)
						idw_detalle3.settransobject(sqlca)
						ls_uso				= dw_revision.getitemstring(1,'uso')
						if isnull(ls_uso) then ls_uso='NI'
						if dw_revision.dataobject='dw_revision_contratos_producto' then
							if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,'2')=0 then
								idw_detalle3.insertrow(0)
							end if
						else
							if idw_detalle3.retrieve(il_cod_parque,ls_serie)=0 then
								idw_detalle3.insertrow(0)
							end if
						end if
						if dw_revision.dataobject='dw_revision_contratos_producto' then
							dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
							idw_detalle1.settransobject(sqlca)
							if ll_numero > 0 then
								if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
									idw_detalle1.insertrow(0)
								end if
							else
								idw_detalle1.insertrow(0)
							end if
						end if
					end if
				else
					if (ls_base= 'F' or ls_base='G' or ls_base='V') and ls_digitado = 'S' then
							
					else
						messagebox("Advertencia","No es posible Ingresar Revisión, Contrato Nº: "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0')+", se encuentra Validado")
					end if
					ls_pasa									= 'N'
					wf_limpiar_detalle()
					dw_revision.enabled					= false
					em_numero.setfocus()
				end if
			else
				ls_pasa										= 'S'
			end if
			if ls_pasa='S' then
				if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' and ls_base<>'' and not isnull(ls_base) and ll_numero>0 then
					SELECT	"ESTADO"."NOMBRE_ESTADO","COD_PARQUE"  
					INTO 		:ls_estado_cadena,:il_cod_parque  
					FROM 	"CADENA","ESTADO"  
					WHERE	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
								(("CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero ) )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if ls_base='F' or ls_base='G' or ls_base='V' then
							wf_valida_producto(ll_rut,ls_base,ls_serie,ll_numero)
						else
							messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Estado '+ls_estado_cadena)
							is_nuevo													= 'N'
							dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
							il_cod_parque											= dw_revision.getitemnumber(1,'cod_parque')
							ll_tot_reg												= dw_seguro.retrieve(il_cod_parque,ls_base)
							if ll_tot_reg > 0 then
								dw_seguro.accepttext()
							end if
							
							SELECT	COUNT("COD_SEGURO")
							INTO		:ll_count
							FROM 	"SEGURO_ASOCIADOS"  
							WHERE   ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
										( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
										( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
										( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
							if ll_count > 0 then
								DECLARE x1 CURSOR FOR  
								SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
								FROM		"SEGURO_ASOCIADOS"  
								WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
											( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
											( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
											( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
								USING	sqlca;
								open x1;
								if sqlca.sqlcode=0 then
									do while sqlca.sqlcode=0
										Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
										if not isnull(ll_cod_seguro) then
											if ll_estado_reg = 0 then
												ll_reg 				= dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, dw_seguro.RowCount())
												if ll_reg > 0 then
													dw_seguro.setitem(ll_reg,'c_estado_reg',0)
												end if
											end if
										end if
										setnull(ll_cod_seguro)
									loop
								end if
								close x1;
								dw_seguro.accepttext()
							end if
							dw_seguro.enabled					= true
						end if
					elseif sqlca.sqlcode=100 then
						if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then
							is_nuevo								= 'S'
							wf_limpiar_detalle()
							SELECT	"ULT_ESTADO",	"COD_PARQUE"
							INTO 		:ll_ult_estado,		:il_cod_parque
							FROM 	"CD_FOLIO"  
							WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
										( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
										( "CD_FOLIO"."NUMERO" = :ll_numero )   
							USING	sqlca;
							if sqlca.sqlcode=0 then
								if ls_base<>'F' and ls_base<>'G' and ls_base<>'V' then
									dw_revision.settransobject(sqlca)
									dw_revision.getchild('area',idw_detalle2)
									idw_detalle2.settransobject(sqlca)
									if gs_cod_prod='CO' or gs_cod_prod='SE' then
										if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
											idw_detalle2.insertrow(0)
										end if
										if idw_detalle4.retrieve( gs_cod_prod)=0 then
											idw_detalle4.insertrow(0)
										end if
									else
										if idw_detalle2.retrieve(il_cod_parque)=0 then
											idw_detalle2.insertrow(0)
										end if
									end if
									
								else
									dw_revision.getchild('codigo_servicio',idw_detalle3)
									idw_detalle3.settransobject(sqlca)
									ls_uso				= dw_revision.getitemstring(1,'uso')
									if isnull(ls_uso) then ls_uso='NI'
									if dw_revision.dataobject='dw_revision_contratos_producto' then
										if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,'2')=0 then
											idw_detalle3.insertrow(0)
										end if
									else
										if idw_detalle3.retrieve(il_cod_parque,ls_serie)=0 then
											idw_detalle3.insertrow(0)
										end if
									end if
									if dw_revision.dataobject='dw_revision_contratos_producto' then
										dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
										idw_detalle1.settransobject(sqlca)
										if ll_numero > 0 then
											if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
												idw_detalle1.insertrow(0)
											end if
										else
											idw_detalle1.insertrow(0)
										end if
									end if
								end if
								idw_detalle12.reset()
								idw_detalle12.insertrow(0)
								SELECT	"DESCRIPCION"  
								INTO 		:ls_descrip  
								FROM 	"CD_ESTADO"  
								WHERE 	"CD_ESTADO"."CODIGO" = :ll_ult_estado   
								USING	sqlca;
								if sqlca.sqlcode=0 then
								else
									messagebox("Advertencia","Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' No Existe en Control Documentario')
									wf_limpiar_detalle()
									dw_revision.enabled			= false
									em_numero.setfocus()
								end if
							else
								if gs_conexion	= "Parque El Prado" then
									il_cod_parque					= 1
								elseif gs_conexion = "Parque La Foresta" then
									il_cod_parque					= 11
								end if
							end if
						else
							il_cod_parque							= dw_revision.getitemnumber(1,'cod_parque')
							if dw_revision.dataobject='dw_revision_contratos_liberador' or dw_revision.dataobject='dw_revision_contratos_producto' then
								w_validar_promesa_operaciones.dw_revision.setitem(1,'iva_cuota',ldb_iva) 
								w_validar_promesa_operaciones.dw_revision.setitem(1,'iva_pie',ldb_iva)
							end if
							w_validar_promesa_operaciones.dw_revision.accepttext()
							is_nuevo									= 'N'
							dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
							if not isnull(ls_base) then wf_calcular(ls_base)
							dw_revision.accepttext()
						end if
						ll_tot_reg									= dw_seguro.retrieve(il_cod_parque,ls_base)
						if ll_tot_reg > 0 then
							for ll_indi=1 to ll_tot_reg
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							next
							dw_seguro.accepttext()
						end if
						SELECT		COUNT("COD_SEGURO")
						INTO			:ll_count
						FROM 		"SEGURO_ASOCIADOS"  
						WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
									  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
									  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
									  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
						if ll_count > 0 then
							DECLARE x2 CURSOR FOR  
							SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
							FROM 	"SEGURO_ASOCIADOS"  
							WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
										( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
										( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
										( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
							USING	sqlca;
							open x2;
							if sqlca.sqlcode=0 then
								do while sqlca.sqlcode=0
									Fetch x2 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
									if not isnull(ll_cod_seguro) then
										if ll_estado_reg = 0 then
											ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, dw_seguro.RowCount())
											if ll_reg > 0 then
												dw_seguro.setitem(ll_reg,'c_estado_reg',0)
											end if
										end if
									end if
									setnull(ll_cod_seguro)
								loop
							end if
							close x2;
							dw_seguro.accepttext()
							dw_seguro.enabled						= true
						end if
						dw_revision.enabled							= true
						ls_base											= dw_base.getitemstring(1,'base')
						SELECT	COUNT("CORRELATIVO")  
						INTO 		:il_reg_obs  
						FROM 	"REVISION_CONTRATOS_OBSERVACION"  
						WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
										( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
										( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
						USING	sqlca;
						if isnull(il_reg_obs) then il_reg_obs=0
						if is_nuevo										= 'S' then
							if not isnull(ls_base) then wf_calcular(ls_base)
							ll_rut											= Long(em_rut.text)
							ls_dv											= trim(em_dv.text)
							ls_base										= dw_base.getitemstring(1,'base')
							ls_serie										= trim(ddlb_serie.text)
							ll_numero									= Double(em_numero.text)
							is_base										= ls_base
							is_serie										= ls_serie
							il_numero									= ll_numero
							if dw_revision.rowcount() = 0 then
								wf_limpiar_detalle()
							end if
							dw_revision.setitem(1,'rut',ll_rut)
							dw_revision.setitem(1,'dv',ls_dv)
							dw_revision.setitem(1,'base',ls_base)
							dw_revision.setitem(1,'serie',ls_serie)
							dw_revision.setitem(1,'numero',ll_numero)
							if ls_base<>'F' and ls_base<>'G' and ls_base<>'V' then
								if gs_cod_prod='CO' or gs_cod_prod='SE' then
									if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
										idw_detalle2.insertrow(0)
									end if
									if idw_detalle4.retrieve( gs_cod_prod)=0 then
										idw_detalle4.insertrow(0)
									end if
								else
									if idw_detalle2.retrieve(il_cod_parque)=0 then
										idw_detalle2.insertrow(0)
									end if
								end if
							else
								ls_uso				= dw_revision.getitemstring(1,'uso')
								if isnull(ls_uso) then ls_uso='NI'
								dw_revision.getchild('codigo_servicio',idw_detalle3)
								idw_detalle3.settransobject(sqlca)
								if dw_revision.dataobject='dw_revision_contratos_producto' then
									if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,'2')=0 then
										idw_detalle3.insertrow(0)
									end if
								else
									if idw_detalle3.retrieve(il_cod_parque,ls_serie)=0 then
										idw_detalle3.insertrow(0)
									end if
								end if
							end if
							dw_revision.setitem(1,'estado_revision','V')
							if ls_base='D' then dw_revision.setitem(1,'forma_pago','2')
							dw_revision.accepttext()
							dw_revision.setfocus()
							dw_revision.setcolumn('cod_parque')
							dw_revision.enabled						= true
						end if
						dw_revision.setfocus()
					end if
					dw_seguro.enabled								= true
				else
					if isnull(ll_rut) then
						messagebox("Advertencia","Debe Ingresar Rut")
						em_rut.setfocus()
					elseif isnull(ls_dv) then
						messagebox("Advertencia","Debe Ingresar Dv")
						em_dv.setfocus()
					elseif isnull(ls_base) then
						messagebox("Advertencia","Debe Ingresar Base")
						dw_base.setfocus()
					elseif isnull(ls_serie) then
						messagebox("Advertencia","Debe Ingresar Serie")
						ddlb_serie.setfocus()
					elseif isnull(ll_numero) then
						messagebox("Advertencia","Debe Ingresar Número")
						em_numero.setfocus()
					end if
				end if
			end if
		end if
	elseif not isnull(ls_base) then
		messagebox("Advertencia","Solo es Posible Revisar Promesas, Columbario, Funeraria, Crematorio, Derecho Especial, Pagaré, Aumento Capacidad y Anexo Liberador")
		em_numero.text											= ''
	end if
elseif isnull(ls_base) or ls_base='' then
	dw_base.reset()
	dw_base.insertrow(0)
	ddlb_serie.text			= ''
	em_numero.text		= ''
	messagebox("Advertencia","Debe Ingresar Base Contrato")
	dw_base.setfocus()
elseif isnull(ls_serie) or ls_serie='' then
	ddlb_serie.text			= ''
	em_numero.text		= ''
	messagebox("Advertencia","Debe Ingresar Serie Contrato")
	ddlb_serie.setfocus()
end if
end event

event getfocus;String		ls_base, ls_serie,ls_dv
Double	ll_rut
ll_rut													= long(em_rut.text)
ls_dv													= trim(em_dv.text)
ls_base												= dw_base.getitemstring(1,'base')
ls_serie												= trim(ddlb_serie.text)
if isnull(ll_rut) or ll_rut=0 then
	messagebox("Advertencia","Debe Ingresar Rut")
	em_rut.setfocus()
elseif isnull(ls_dv) or ls_dv='' then
	messagebox("Advertencia","Debe Ingresar Digito verificador")
	em_dv.setfocus()
elseif isnull(ls_base) or ls_base='' then
	messagebox("Advertencia","Debe Ingresar Base Contrato")
	dw_base.setfocus()
elseif isnull(ls_serie) or ls_serie='' then
	messagebox("Advertencia","Debe Ingresar Serie Contrato")
	ddlb_serie.setfocus()
end if
end event

type st_5 from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2798
integer y = 56
integer width = 96
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Nº"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_ctacte.visible	= false
end event

type st_4 from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2309
integer y = 56
integer width = 178
integer height = 64
integer textsize = -10
integer weight = 700
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

event ue_mousemove;st_ctacte.visible	= false
end event

type dw_base from datawindow within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1477
integer y = 32
integer width = 805
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_contratos_revision"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg						= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma			= ldb_suma + ldb_factor_prima
				ll_suma_peso		= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda				= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma			= ll_suma_peso
			end if
			dw_revision.setitem(1,'c_total_cuota',ldb_suma)
		end if
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if*/
end event

event itemchanged;String		ls_base,ls_serie,ls_dv,ls_descrip,ls_estado_cadena,ls_uso,ls_pasa,ls_origen_venta
Long		ll_rut,ll_ult_estado,ll_new,ll_count,ll_tot_reg,ll_indi
Double	ll_numero

dw_base.accepttext()
ddlb_serie.reset()
SetNull(gs_cod_prod)
ls_serie																	= ''
is_serie																	= ''
ll_rut																		= long(em_rut.text)
ls_dv																		= trim(em_dv.text)
if ll_rut > 0 and not isnull(ls_dv) and ls_dv <> '' then
	ls_base																	= dw_base.getitemstring(1,'base')
	is_base																	= ls_base
	is_sw_pasa																= 'S'
	ls_pasa																	= 'S'
	if ls_base='O' or ls_base='U' then
		if is_base='U' then
			gs_cod_prod													= 'CO'
		else
			gs_cod_prod													= 'SE'
		end if
		dw_seguro.visible													= true
		dw_revision.dataobject	= 'dw_revision_contratos_promesa'
		dw_revision.settransobject(sqlca)
		dw_revision.getchild('area',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		
		if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
			idw_detalle2.insertrow(0)
		end if
		
		dw_revision.getchild('tipo_producto',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if idw_detalle4.retrieve(gs_cod_prod)=0 then
			idw_detalle4.insertrow(0)
		end if
		
		dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
		idw_detalle12.settransobject(sqlca)
		if idw_detalle12.retrieve('M')=0 then
			idw_detalle12.insertrow(0)
		end if
		
		ll_new																= dw_revision.insertrow(0)
		dw_revision.setitem(ll_new,'pie',0)
		dw_revision.setitem(ll_new,'fecha_ctto',idt_nulo)
		dw_revision.setitem(ll_new,'fecha_nac',idt_nulo)
		dw_revision.setitem(ll_new,'fecha_prim',idt_nulo)
		dw_revision.setitem(ll_new,'c_total_cuota',0)
		if ls_base='U' then
			dw_revision.setitem(1,'tipo_sepult','8')
		end if
		dw_revision.accepttext()
		cb_ingresar.visible													= true
		cb_ingreso_benef.visible											= false
		
	elseif ls_base='L' or ls_base='A' or ls_base='P' or ls_base='D' then
		dw_seguro.visible											= true
		dw_revision.dataobject	= 'dw_revision_contratos_liberador'
		dw_revision.settransobject(sqlca)
		dw_revision.getchild('area',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(il_cod_parque)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_revision.getchild('tipo_producto',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if idw_detalle4.retrieve(gs_cod_prod)=0 then
			idw_detalle4.insertrow(0)
		end if
		dw_revision.getchild('serie_asoc',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
		
		dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
		idw_detalle12.settransobject(sqlca)
		if idw_detalle12.retrieve('M')=0 then
			idw_detalle12.insertrow(0)
		end if
		
		ll_new																= dw_revision.insertrow(0)
		dw_revision.setitem(ll_new,'pie',0)
		dw_revision.setitem(ll_new,'fecha_ctto',idt_nulo)
		dw_revision.setitem(ll_new,'fecha_nac',idt_nulo)
		dw_revision.setitem(ll_new,'fecha_prim',idt_nulo)
		dw_revision.accepttext()
		cb_ingresar.visible													= true
		cb_ingreso_benef.visible											= false
		
	elseif ls_base='F' or ls_base='G' or ls_base='V' then
		if (ls_base='F' or ls_base='G' or ls_base='V') and gs_depto<>'H' and gs_depto<>'I' and gs_depto<>'X' and gs_depto<>'R' and gs_depto<>'E' and gs_depto<>'O' and gs_depto<>'V' then  // Normalizacion
			messagebox("Advertencia","Ud. no puede Actualizar Producto Funeraria/Crematorio/Contrato Servicio")
			ls_pasa		= 'N'
		elseif ls_base<>'F' and ls_base <>'G' and ls_base <> 'V' and gs_depto<>'I' then		//and gs_depto='H'
			messagebox("Advertencia","Ud. Solo puede Actualizar Producto Funeraria/Crematorio/Contrato Servicio")
			ls_pasa		= 'N'
		else
			dw_seguro.visible												= true
			dw_revision.dataobject	= 'dw_revision_contratos_producto'
			dw_revision.settransobject(sqlca)
			dw_revision.getchild('codigo_servicio',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			
			dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			if idw_detalle12.retrieve('M')=0 then
				idw_detalle12.insertrow(0)
			end if
			ls_uso						= 'NI'
			if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,'2')=0 then
				idw_detalle3.insertrow(0)
			end if
			if dw_revision.dataobject='dw_revision_contratos_producto' then
				dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
				idw_detalle1.settransobject(sqlca)
				if ll_numero > 0 then
					if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
						idw_detalle1.insertrow(0)
					end if
				else
					idw_detalle1.insertrow(0)
				end if
			end if
			ll_new																= dw_revision.insertrow(0)
			dw_revision.setitem(ll_new,'pie',0)
			dw_revision.setitem(ll_new,'fecha_ctto',idt_nulo)
			dw_revision.setitem(ll_new,'fecha_nac',idt_nulo)
			dw_revision.setitem(ll_new,'fecha_prim',idt_nulo)
			dw_revision.accepttext()	
			cb_ingresar.visible													= false
			cb_ingreso_benef.visible											= true
		end if
	else
		messagebox('Mensaje','Modulo no listo')
		dw_revision.enabled = true
	end if
	if ls_pasa='S' then
		wf_ddlb_serie(ls_base)
		
		il_cod_parque														= dw_revision.getitemnumber(1,'cod_parque')
		if il_cod_parque > 0 then
			ll_tot_reg														= dw_seguro.retrieve(il_cod_parque,ls_base)
		else
			if gs_conexion = "Parque El Prado" then
				il_cod_parque												= 1
			elseif gs_conexion = "Parque La Foresta" then
				il_cod_parque												= 11
			elseif gs_conexion = "Parque Concepción" then
				il_cod_parque												= 801
			end if
		end if
		ll_tot_reg															= dw_seguro.retrieve(il_cod_parque,ls_base)
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				dw_seguro.setitem(ll_indi,'c_estado_reg',1)
			next
			dw_seguro.accepttext()
		end if
		ls_serie																	= trim(ddlb_serie.text)
		if ls_serie<>'' and not isnull(ls_serie) then
			SELECT	COUNT( distinct "CD_TIPO_SERIE"."SERIE")
			INTO 		:ll_count
			FROM 	"CD_TIPO_SERIE"  
			WHERE 	( "CD_TIPO_SERIE"."BASE" = :ls_base ) AND
						( "CD_TIPO_SERIE"."REVISION_CTTO" = 'S' )
			USING	sqlca;
			if ll_count>=1 then
				ll_numero														= Double(em_numero.text)
				if ls_base<>'' and not isnull(ls_base) and ls_base<>'O'  and ls_base<>'U' and ls_base<>'L' and 	ls_base<>'P' and ls_base<>'A' and ls_base<>'D' and ls_base<>'F' and ls_base<>'G' and ls_base<>'V' and ls_serie='' and ll_numero=0 then
					messagebox("Advertencia","Solo es Posible Revisar Promesas, Derecho Especial, Pagaré, Aumento Capacidad, Anexo Liberador, Servicio Funeraria")
				else
					if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' and ls_base<>'' and not isnull(ls_base) and ll_numero>0 then
						SELECT	"ESTADO"."NOMBRE_ESTADO"  
						INTO 		:ls_estado_cadena  
						FROM 	"CADENA","ESTADO"  
						WHERE 	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
									(("CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							if ls_base = 'F' or ls_base='G' or ls_base='V' then
								dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)
								wf_valida_producto(ll_rut,ls_base,ls_serie,ll_numero)
							else
								messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Estado '+ls_estado_cadena)
							end if
							ls_origen_venta		= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'origen_venta')
							if idw_detalle12.retrieve(ls_origen_venta) = 0 then idw_detalle12.insertrow(0)
						elseif sqlca.sqlcode=100 then
							if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then
								is_nuevo											= 'S'
								wf_limpiar_detalle()
								SELECT	"ULT_ESTADO",	"COD_PARQUE"
								INTO 		:ll_ult_estado,		:il_cod_parque
								FROM		"CD_FOLIO"  
								WHERE  	( "CD_FOLIO"."BASE" = :ls_base ) AND  
											( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
											( "CD_FOLIO"."NUMERO" = :ll_numero )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									if ls_base='F' or ls_base='G' or ls_base='V' then
										dw_revision.getchild('codigo_servicio',idw_detalle3)
										idw_detalle3.settransobject(sqlca)
										ls_uso									= dw_revision.getitemstring(1,'uso')
										if isnull(ls_uso) then ls_uso='NI'
										if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie)=0 then
											idw_detalle3.insertrow(0)
										end if
									else
										dw_revision.getchild('area',idw_detalle2)
										idw_detalle2.settransobject(sqlca)
										if gs_cod_prod='CO' or gs_cod_prod='SE' then
											if idw_detalle2.retrieve(il_cod_parque,gs_cod_prod)=0 then
												idw_detalle2.insertrow(0)
											end if
											if idw_detalle4.retrieve(gs_cod_prod)=0 then
												idw_detalle4.insertrow(0)
											end if
										else
											if idw_detalle2.retrieve(il_cod_parque)=0 then
												idw_detalle2.insertrow(0)
											end if
										end if
									end if
									SELECT	"CD_ESTADO"."DESCRIPCION"  
									INTO 		:ls_descrip  
									FROM 	"CD_ESTADO"  
									WHERE 	"CD_ESTADO"."CODIGO" = :ll_ult_estado   
									USING	sqlca;
									if sqlca.sqlcode=0 then
					//					messagebox("Advertencia","Recuerde Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra en ESTADO '+ls_descrip+' en Control Documentario')
									else
										messagebox("Advertencia","Contrato "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' No Existe en Control Documentario')
										wf_limpiar_detalle()
										dw_revision.enabled					= false
										em_numero.setfocus()
									end if
								else
									dw_revision.enabled						= true
									ls_base										= dw_base.getitemstring(1,'base')
									SELECT	COUNT("CORRELATIVO")  
									INTO 		:il_reg_obs  
									FROM 	"REVISION_CONTRATOS_OBSERVACION"  
									WHERE	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
												( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
												( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
												( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
									USING	sqlca;
									if isnull(il_reg_obs) then il_reg_obs=0
									if not isnull(ls_base) then wf_calcular(ls_base)
									dw_revision.setfocus()
								end if
							else
								dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
								is_nuevo											= 'N'
								if not isnull(ls_base) then wf_calcular(ls_base)
								dw_revision.accepttext()
							end if
							ls_origen_venta		= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'origen_venta')
							if idw_detalle12.retrieve(ls_origen_venta) = 0 then idw_detalle12.insertrow(0)
							ls_base												= dw_base.getitemstring(1,'base')
							SELECT	COUNT("CORRELATIVO")  
							INTO 		:il_reg_obs  
							FROM 	"REVISION_CONTRATOS_OBSERVACION"  
							WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
										( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
										( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
										( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
							USING	sqlca;
							if isnull(il_reg_obs) then il_reg_obs=0
							if is_nuevo											= 'S' then
								if not isnull(ls_base) then wf_calcular(ls_base)
								ll_rut												= Long(em_rut.text)
								ls_dv												= trim(em_dv.text)
								ls_base											= dw_base.getitemstring(1,'base')
								ls_serie											= trim(ddlb_serie.text)
								ll_numero										= Double(em_numero.text)
								dw_revision.setitem(1,'rut',ll_rut)
								dw_revision.setitem(1,'dv',ls_dv)
								dw_revision.setitem(1,'base',ls_base)
								dw_revision.setitem(1,'serie',ls_serie)
								dw_revision.setitem(1,'numero',ll_numero)
								dw_revision.setitem(1,'cod_parque',il_cod_parque)
								dw_revision.setitem(1,'estado_revision','V')
								if ls_base='D' then dw_revision.setitem(1,'forma_pago','2')
								dw_revision.accepttext()
								dw_revision.setfocus()
								dw_revision.setcolumn('cod_parque')
								dw_revision.enabled							= true
							end if
							dw_revision.setfocus()
						end if
					else
						if isnull(ll_rut) then
							messagebox("Advertencia","Debe Ingresar Rut")
							em_rut.setfocus()
						elseif isnull(ls_dv) then
							messagebox("Advertencia","Debe Ingresar Dv")
							em_dv.setfocus()
						elseif isnull(ls_base) then
							messagebox("Advertencia","Debe Ingresar Base")
							dw_base.setfocus()
						elseif isnull(ls_serie) then
							messagebox("Advertencia","Debe Ingresar Serie")
							ddlb_serie.setfocus()
						elseif isnull(ll_numero) then
							messagebox("Advertencia","Debe Ingresar Número")
							em_numero.setfocus()
						end if
					end if
				end if
			else
				messagebox("Advertencia","Serie No Corresponde a Tipo de Contrato")
				ddlb_serie.reset()
				ddlb_serie.setfocus()	
			end if
		end if
	end if
elseif isnull(ll_rut) or ll_rut=0 then
	dw_base.reset()
	dw_base.insertrow(0)
	messagebox("Advertencia","Debe Ingresar Rut")
	em_rut.setfocus()
elseif isnull(ls_dv) or ls_dv='' then
	dw_base.reset()
	dw_base.insertrow(0)
	messagebox("Advertencia","Debe Ingresar Digito Verificador")
	em_dv.setfocus()
end if
end event

event getfocus;String		ls_dv
Double	ll_rut
ll_rut													= long(em_rut.text)
ls_dv													= trim(em_dv.text)
if isnull(ll_rut) or ll_rut=0 then
	messagebox("Advertencia","Debe Ingresar Rut")
	em_rut.setfocus()
elseif isnull(ls_dv) or ls_dv='' then
	messagebox("Advertencia","Debe Ingresar Digito verificador")
	em_dv.setfocus()
end if
end event

type st_3 from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1294
integer y = 56
integer width = 165
integer height = 64
integer textsize = -10
integer weight = 700
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

event ue_mousemove;st_ctacte.visible	= false
end event

type em_dv from editmask within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1134
integer y = 40
integer width = 137
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16776960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event modified;Long		ll_rut,ll_renta,ll_new,ll_fallec
String	ls_dv,ls_estado_titular,ls_base,ls_serie,ls_estado_ctto,ls_res_fall='N',ls_obs,ls_origen_venta
date		ld_fecha_nac
Datetime	ldt_max_fecha
Double	ll_numero,ll_tot_reg,ll_indi

dw_revision.enabled								= false
is_sw_pasa											= 'S'
ll_rut													= long(em_rut.text)
gi_rut													= ll_rut
ls_dv													= trim(em_dv.text)
ls_base												= dw_base.getitemstring(1,'base')
ls_serie												= trim(ddlb_serie.text)
ll_numero											= Double(em_numero.text)
if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
	wf_cliente_rut(gi_rut)
	if STRING(ls_dv) <> STRING(gf_obtener_dv(ll_rut)) then
		messagebox('Error','El Rut no es Válido',stopsign!)
		em_dv.text									= ''
		dw_base.reset()
		dw_base.insertrow(0)
		ddlb_serie.reset()
		em_numero.text							= ''
		dw_base.enabled							= false
		ddlb_serie.enabled						= false
		em_numero.enabled						= false
		dw_ctto_asoc.reset()
		dw_lista_rezagos.reset()
		dw_revision.reset()
		dw_revision.insertrow(0)
		dw_lista_obs.reset()
		em_dv.setfocus()
	else
		dw_base.enabled							= true
		ddlb_serie.enabled						= true
		em_numero.enabled						= true
		if ll_numero>0 and not isnull(ls_base) and not isnull(ls_serie) then
			if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then
				ll_new								= dw_revision.insertrow(0)
				dw_revision.scrolltorow(0)
				dw_revision.setitem(ll_new,'rut',ll_rut)
				dw_revision.setitem(ll_new,'dv',ls_dv)
				dw_revision.setitem(ll_new,'base',ls_base)
				dw_revision.setitem(ll_new,'serie',ls_serie)
				dw_revision.setitem(ll_new,'numero',ll_numero)
				dw_revision.setitem(ll_new,'estado_revision','V')
				dw_revision.accepttext()
				dw_revision.setfocus()
			end if
			ls_origen_venta		= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'origen_venta')
			if idw_detalle12.retrieve(ls_origen_venta) = 0 then idw_detalle12.insertrow(0)
			dw_revision.enabled					= true
			dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
		end if
		SELECT	COUNT("CORRELATIVO")  
		INTO 		:il_reg_obs  
		FROM 	"REVISION_CONTRATOS_OBSERVACION"  
		WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
				 	( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
				 	( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
				 	( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
		USING	sqlca;
		if isnull(il_reg_obs) then il_reg_obs=0
		
		ll_tot_reg									=  dw_ctto_asoc.retrieve(ll_rut)
		if ll_tot_reg>0 then
			ls_estado_titular						= dw_ctto_asoc.getitemstring(1,'cliente_estado_titular')
			ld_fecha_nac							= date(dw_ctto_asoc.getitemdatetime(1,'cliente_fecha_nac'))
			ll_renta									= dw_ctto_asoc.getitemnumber(1,'cliente_total_rent')
			if not isnull(ls_base) then wf_calcular(ls_base)
		end if
		for ll_indi=1 to ll_tot_reg
			ls_estado_ctto							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_estado')
			ll_fallec									= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_mora_fallecidos')
			if ls_estado_ctto='R' and ll_fallec>0 then
				ls_res_fall							= 'S'
			end if
		next
		if ls_res_fall='S' then
			SELECT	"SIGLA"
			INTO		:ls_obs
    			FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
   			WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 12
			USING	sqlca;
			
			wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(0),12)
			messagebox("Advertencia",ls_obs)
		end if
		
		dw_lista_rezagos.retrieve(ll_rut)
		ls_base											= dw_base.getitemstring(1,'base')
		wf_calcular(ls_base)
		ll_tot_reg										= dw_ctto_asoc.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_estado_ctto							= dw_ctto_asoc.getitemstring(ll_indi,'cadena_estado')
				ll_fallec									= dw_ctto_asoc.getitemnumber(ll_indi,'cadena_mora_fallecidos')
				if ls_estado_ctto='R' and ll_fallec>0 then
					ls_res_fall							= 'S'
				end if
			next
			if ls_res_fall='S' then
				SELECT	"SIGLA"
				INTO		:ls_obs
				FROM 	"REVISION_CONTRATOS_OBS_CODIGO"  
				WHERE 	"REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = 12
				USING	sqlca;
				wf_observ(ls_base,ls_serie,ll_numero,ll_rut,string(0),12)
			end if
		end if
		dw_base.setfocus()
	end if
end if
end event

event getfocus;Double	ll_rut
ll_rut													= long(em_rut.text)
if isnull(ll_rut) or ll_rut=0 then
	messagebox("Advertencia","Debe Ingresar Rut")
	em_rut.setfocus()
end if
end event

type st_2 from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1088
integer y = 48
integer width = 46
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "-"
boolean focusrectangle = false
end type

event ue_mousemove;st_ctacte.visible	= false
end event

type em_rut from editmask within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 571
integer y = 40
integer width = 494
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16776960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event modified;Long		ll_rut,ll_renta,ll_new
String		ls_dv,ls_estado_titular,ls_base,ls_serie,ls_origen_venta
date		ld_fecha_nac
Datetime	ldt_max_fecha
Double	ll_numero

dw_revision.enabled								= false
is_sw_pasa											= 'S'
ll_rut													= long(em_rut.text)
ls_dv													= trim(em_dv.text)
ls_base												= dw_base.getitemstring(1,'base')
ls_serie												= trim(ddlb_serie.text)
ll_numero											= Double(em_numero.text)
if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
	wf_cliente_rut(ll_rut)
	if STRING(ls_dv) <> STRING(gf_obtener_dv(ll_rut)) then
		messagebox('Error','El Rut no es Válido',stopsign!)
		em_dv.text									= ''
		dw_base.reset()
		dw_base.insertrow(0)
		dw_base.reset()
		em_numero.text							= ''
		dw_base.enabled							= false
		ddlb_serie.enabled							= false
		em_numero.enabled						= false
		dw_ctto_asoc.reset()
		dw_lista_rezagos.reset()
		dw_revision.reset()
		dw_revision.insertrow(0)
		dw_lista_obs.reset()
		em_dv.setfocus()
	else
		dw_base.enabled							= true
		ddlb_serie.enabled							= true
		em_numero.enabled						= true
		if ll_numero>0 and not isnull(ls_base) and not isnull(ls_serie) then
			if dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto)=0 then
				ll_new								= dw_revision.insertrow(0)
				dw_revision.scrolltorow(0)
				dw_revision.setitem(ll_new,'rut',ll_rut)
				dw_revision.setitem(ll_new,'dv',ls_dv)
				dw_revision.setitem(ll_new,'base',ls_base)
				dw_revision.setitem(ll_new,'serie',ls_serie)
				dw_revision.setitem(ll_new,'numero',ll_numero)
				dw_revision.setitem(ll_new,'estado_revision','V')
				dw_revision.accepttext()
				dw_revision.setfocus()
			end if
			ls_origen_venta		= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'origen_venta')
			if idw_detalle12.retrieve(ls_origen_venta) = 0 then idw_detalle12.insertrow(0)
			dw_revision.enabled					= true
			dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
		end if
		SELECT	COUNT("CORRELATIVO")  
		INTO 		:il_reg_obs  
		FROM 	"REVISION_CONTRATOS_OBSERVACION"  
		WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
					( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
				 	( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
				 	( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) 
		USING	sqlca;
		if isnull(il_reg_obs) then il_reg_obs=0
		if dw_ctto_asoc.retrieve(ll_rut)>0 then
			ls_estado_titular						= dw_ctto_asoc.getitemstring(1,'cliente_estado_titular')
			ld_fecha_nac							= date(dw_ctto_asoc.getitemdatetime(1,'cliente_fecha_nac'))
			ll_renta									= dw_ctto_asoc.getitemnumber(1,'cliente_total_rent')
			if not isnull(ls_base) then wf_calcular(ls_base)
		end if
		dw_lista_rezagos.retrieve(ll_rut)
		ls_base										= dw_base.getitemstring(1,'base')
		wf_calcular(ls_base)
	end if
	em_dv.setfocus()
end if
end event

type st_1 from statictext within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 201
integer y = 56
integer width = 343
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Rut Cliente"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_ctacte.visible	= false
end event

type cb_ver from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2021
integer y = 2588
integer width = 288
integer height = 92
integer taborder = 190
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Benef"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;Long		ll_rut
String	ls_dv,ls_string

ll_rut					= long(em_rut.text)
ls_dv					= trim(em_dv.text)
if ll_rut>0 then
	ls_string			= string(ll_rut)+'~t'+ls_dv
	OpenWithParm(w_ver_beneficiario_con_ctto_asoc,ls_string)
end if
end event

type cb_limpiar from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2656
integer y = 2492
integer width = 238
integer height = 92
integer taborder = 220
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg									= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima					= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso						= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma							= ldb_suma + ldb_factor_prima
				ll_suma_peso						= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf										= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda								= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma							= ll_suma_peso
			end if
			if is_limpiar='S' then
				dw_revision.setitem(1,'c_total_cuota',ldb_suma)
			end if
		end if
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if
end event

event clicked;Datetime	ldt_fecha
Double	ldb_uf_dia
Long		ll_tot_reg,ll_indi,ll_tot_revision
String		ls_uso

Setnull(is_base);Setnull(is_serie);Setnull(il_numero);setnull(il_reg_obs);Setnull(il_plazo)
is_recordar_benef				= 'N'
il_plazo_mod					= 0
il_modif							= 0
is_limpiar						= 'N'
is_new_calc						= 'S'
is_mod_precio					= 'S'
il_reg_obs						= 0
il_tipo_cliente					= 1

dw_ctto_asoc.reset()
dw_lista_rezagos.reset()
cb_ingreso_benef.visible		= false
dw_base.reset()
dw_base.settransobject(sqlca)
dw_base.insertrow(0)

ddlb_serie.reset()
wf_ddlb_serie('')

ll_tot_reg							= dw_seguro.rowcount()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled				= false
is_new_precio						= 'N'
cb_aceptar.enabled				= true
cb_rechazar.enabled				= true
is_sw_pasa							= 'S'
em_rut.text							= ''
em_dv.text							= ''
em_numero.text					= ''
dw_base.enabled					= false
ddlb_serie.enabled				= false
em_numero.enabled				= false
ll_tot_revision						= dw_revision.rowcount()
wf_limpiar_detalle()
dw_revision.enabled				= false
cb_ver.enabled						= false
cb_memo.enabled					= false
cbx_tipo_rechazo.enabled		= false

Setnull(is_base);Setnull(is_serie);Setnull(il_numero);setnull(il_reg_obs)

dw_base.reset()
dw_base.insertrow(0)

ddlb_serie.reset()
wf_ddlb_serie(is_base)

is_sw_pasa							= 'S'
em_rut.text							= ''
em_dv.text							= ''
em_numero.text					= ''
dw_ctto_asoc.reset()
dw_lista_rezagos.reset()
gs_ventana							= 'w_validar_promesa_operaciones'
f_valida_objeto()
if dw_revision.dataobject='dwe_mensaje_no_listo' then
	dw_revision.dataobject		= 'dw_revision_contratos_promesa'
	dw_revision.settransobject(sqlca)
	dw_revision.getchild('area',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(il_cod_parque, 'SE')=0 then
		idw_detalle2.insertrow(0)
	end if
	
	dw_revision.getchild('tipo_producto',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	if idw_detalle4.retrieve('SE')=0 then
		idw_detalle4.insertrow(0)
	end if
	
	if is_base='F' or is_base='G' or is_base='V' then
		ls_uso		= dw_revision.getitemstring(1,'uso')
		if isnull(ls_uso) then ls_uso='NI'
		dw_revision.getchild('codigo_servicio',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(il_cod_parque,ls_uso,is_serie)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_revision.insertrow(0)
	else
		dw_revision.getchild('codigo_servicio',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(il_cod_parque,is_serie)=0 then
			idw_detalle3.insertrow(0)
		end if
		dw_revision.insertrow(0)
	end if
end if
em_rut.setfocus()
end event

type dw_lista_rezagos from datawindow within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1769
integer y = 1972
integer width = 1550
integer height = 480
integer taborder = 100
string dataobject = "dw_buscar_rezogo_asoc_rut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg									= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima					= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso						= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma							= ldb_suma + ldb_factor_prima
				ll_suma_peso						= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf										= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda								= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma							= ll_suma_peso
			end if
			if is_limpiar='S' then
				dw_revision.setitem(1,'c_total_cuota',ldb_suma)
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if*/
end event

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

type cb_rechazar from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 361
integer y = 2492
integer width = 439
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rechazar"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;Long		ll_ult_estado,ll_resp,ll_count_fila,ll_estado,ll_error=0,ll_grabar=0,ll_rut,ll_tot_reg,ll_indi
String		ls_parametro,ls_glosa,ls_age,ls_sup,ls_jefe,ls_base,ls_serie,ls_dv,ls_estado_cadena
Datetime	ldt_fecha
Double	ll_numero
dw_revision.accepttext()
dw_lista_obs.accepttext()
if gs_depto='V' or gs_depto='O' or gs_depto='H' then
	if dw_revision.getitemstring(1,'estado_revision')='V' then
		if is_nuevo='S' then
			dw_revision.setitem(1,'usuario_crea',gs_user)
			dw_revision.setitem(1,'fecha_crea',gdt_fec_sistema)
		end if
		dw_revision.accepttext()
		dw_lista_obs.accepttext()
		ll_rut													= long(em_rut.text)
		ls_dv													= trim(em_dv.text)
		ls_base												= dw_base.getitemstring(1,'base')
		ls_serie												= trim(ddlb_serie.text)
		ll_numero											= Double(em_numero.text)
		dw_revision.setitem(1,'base',ls_base)
		dw_revision.setitem(1,'serie',ls_serie)
		dw_revision.setitem(1,'numero',ll_numero)
		dw_revision.setitem(1,'rut',ll_rut)
		dw_revision.setitem(1,'dv',ls_dv)
		dw_revision.accepttext()
		SELECT	"ESTADO"."NOMBRE_ESTADO"  
		INTO 		:ls_estado_cadena  
		FROM		"CADENA","ESTADO"  
		WHERE	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
				 	(("CADENA"."CODIGO" = :ls_base ) AND  
				 	( "CADENA"."SERIE" = :ls_serie ) AND  
				 	( "CADENA"."NUMERO" = :ll_numero ) )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Entado '+ls_estado_cadena)
		elseif sqlca.sqlcode=100 then
//			DELETE FROM "REVISION_CONTRATOS_OBSERVACION"  
//			WHERE 	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
//						( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
//						( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
//						( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero )   
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
			ll_tot_reg										= dw_lista_obs.rowcount()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					dw_lista_obs.setitem(ll_indi,'correlativo',ll_indi)
					dw_lista_obs.setitem(ll_indi,'base',ls_base)
					dw_lista_obs.setitem(ll_indi,'serie',ls_serie)
					dw_lista_obs.setitem(ll_indi,'numero',ll_numero)
					dw_lista_obs.setitem(ll_indi,'rut',ll_rut)
				next
			end if
			dw_lista_obs.accepttext()
			il_cod_parque									= dw_revision.getitemnumber(1,'cod_parque')
			if dw_revision.getitemstring(1,'estado_revision')<>'R' then	
				if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' and ls_base<>'' and not isnull(ls_base) and ll_numero>0 then
					SELECT	sysdate 
					INTO 		:gdt_fec_sistema  
					FROM		"TASA"  ;
					ldt_fecha	= datetime(date(gdt_fec_sistema),time('00:00:00'))
					SELECT 	"ULT_ESTADO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"COD_PARQUE" 
					INTO 		:ll_ult_estado,		:ls_age,				:ls_sup,					:ls_jefe,					:il_cod_parque 
					FROM 	"CD_FOLIO"  
					WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
							 	( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							 	( "CD_FOLIO"."NUMERO" = :ll_numero )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if gs_depto='V' then
							//dw_revision.setitem(1,'estado_revision','R')
							dw_revision.accepttext()
							if dw_revision.update()=1 then
//								ll_grabar ++
//								ll_estado						= 5
//								ls_glosa						= 'RECHAZADO CONTRATO POR ADMINISTRACION DE VENTAS POR USUARIO '+gs_nom_comp_usuario+' EL DIA '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")
//								UPDATE	"CD_FOLIO"  
//								SET 		"ULT_ESTADO" = :ll_estado,   
//											"ULT_FECHA_ESTADO" = :ldt_fecha,   
//											"ULT_GLOSA_ESTADO" = :ls_glosa,   
//											"COD_PARQUE" = :il_cod_parque,
//											"ULT_MEMO" = '-',   
//											"ULT_USUARIO_GESTION" = :gs_user  
//								WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
//										 	( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
//										 	( "CD_FOLIO"."NUMERO" = :ll_numero )   
//								USING	sqlca;
//								if sqlca.sqlcode=0 then
//									ll_grabar ++
//									INSERT INTO "CD_FOLIO_DETALLE"  
//												( "BASE",		"SERIE",	"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"TIPO_RECHAZO",	"TIPO_EXCEPCION",	"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION",	"COD_PARQUE",	"ESTADO_MODIFICADO",	"MES_CIERRE",	"ANO_CIERRE" )  
//									VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema,	:gs_user,			:ll_estado,	:gdt_fec_sistema,	:ls_glosa,	'-',			:ls_age,				:ls_sup,					:ls_jefe,					null,							null,									null,					null, 						null,							null,											:il_cod_parque,		'N',								null,				null )  
//									USING	sqlca;
//									if sqlca.sqlcode=0 then
//										ll_grabar ++
//									else
//										ll_error ++
//										messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
//									end if
//								else
//									ll_error ++
//									messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO SQL: "+sqlca.sqlerrtext)
//								end if
								if dw_lista_obs.update()=1 then
									ll_grabar ++
								else
									ll_error ++
									messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
								end if
							else
								ll_error ++
								messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos SQL: "+sqlca.sqlerrtext)
							end if
							if ll_grabar=1 then
								commit using sqlca;
								cbx_tipo_rechazo.enabled				= true
								cb_memo.enabled							= true
								ll_resp										= messagebox("Rechazo","Grabación Exitosa, desea Seleccionar Tipo de Rechazo o Ingresar Memo",Exclamation!,YesNo!,2)
								if ll_resp=1 then
									cbx_tipo_rechazo.triggerevent(clicked!)
									cb_ingresar.triggerevent(clicked!)
								end if
								cb_aceptar.enabled						= false
								cb_rechazar.enabled						= false
								dw_base.enabled							= false
								ddlb_serie.enabled						= false
								em_numero.enabled						= false
								
							end if
							if ll_error=4 then
								rollback using sqlca;
							end if
				
						elseif gs_depto='O' then
							//dw_revision.setitem(1,'estado_revision','R')
							dw_revision.accepttext()
							if dw_revision.update()=1 then
								ll_grabar ++
//								ll_estado										= 10
//								ls_glosa										= 'RECHAZADO CONTRATO POR DEPARTAMENTO DE OPERACIONES A DEPARTAMENTO ADMINISTRACION DE VENTAS POR USUARIO '+gs_nom_comp_usuario+' EL DIA '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")
//								UPDATE	"CD_FOLIO"  
//								SET 		"ULT_ESTADO" = :ll_estado,   
//											"ULT_FECHA_ESTADO" = :ldt_fecha,   
//											"ULT_GLOSA_ESTADO" = :ls_glosa,   
//											"COD_PARQUE" = :il_cod_parque,
//											"ULT_MEMO" = '-',   
//											"ULT_USUARIO_GESTION" = :gs_user  
//								WHERE  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
//										 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
//										 ( "CD_FOLIO"."NUMERO" = :ll_numero )   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									ll_grabar ++
//									INSERT INTO "CD_FOLIO_DETALLE"  
//												( "BASE",		"SERIE",	"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"TIPO_RECHAZO",	"TIPO_EXCEPCION",	"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION",	"COD_PARQUE",	"ESTADO_MODIFICADO",	"MES_CIERRE",	"ANO_CIERRE" )  
//									VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema,	:gs_user,			:ll_estado,	:gdt_fec_sistema,	:ls_glosa,	'-',			:ls_age,				:ls_sup,					:ls_jefe,					null,							null,									null,					null, 						null,							null,											:il_cod_parque,		'N',								null,				null )  
//									USING	sqlca;
//									if sqlca.sqlcode=0 then
//										ll_grabar ++
//									else
//										ll_error ++
//										messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
//									end if
//								else
//									ll_error ++
//									messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO SQL: "+sqlca.sqlerrtext)
//								end if
//								if dw_lista_obs.update()=1 then
//									ll_grabar ++
//								else
//									ll_error ++
//									messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
//								end if
							else
								ll_error ++
								messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos SQL: "+sqlca.sqlerrtext)
							end if
							
							if ll_grabar=4 then
								commit using sqlca;
								cbx_tipo_rechazo.enabled				= true
								cb_memo.enabled							= true
								ll_resp										= messagebox("Rechazo","Grabación Exitosa, desea Seleccionar Tipo de Rechazo",Exclamation!,YesNo!,2)
								if ll_resp=1 then
									cbx_tipo_rechazo.triggerevent(clicked!)
									cb_ingresar.triggerevent(clicked!)
								end if
								cb_aceptar.enabled						= false
								cb_rechazar.enabled						= false
								dw_base.enabled							= false
								ddlb_serie.enabled							= false
								em_numero.enabled						= false
							end if
							if ll_error=4 then
								rollback using sqlca;
							end if
						else
							messagebox("Advertencia","Ud. NO tiene Permiso para Rechazar Contrato")
						end if
					else
						if ls_base='D' then
							if gs_depto='O' or gs_depto='V' then
								dw_revision.setitem(1,'estado_revision','V')
								dw_revision.accepttext()
								if dw_revision.update()=1 then
									commit;
									messagebox("Grabar","Grabación Exitosa")
								else
									rollback;
									messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
								end if
							end if
						else	
							messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###,###") +' No Existe en Control Documentario')
						end if
					end if
				end if
			else
				ll_grabar													= 0
				ll_error													= 0
				if dw_revision.update()=1 then
					ll_grabar ++
					if dw_lista_obs.update()=1 then
						ll_grabar ++
						messagebox("Grabar Modificaciones (Rechazo)","Grabación Exitosa")
						cb_aceptar.enabled							= false
						cb_rechazar.enabled							= false
						dw_base.enabled								= false
						ddlb_serie.enabled								= false
						em_numero.enabled							= false
						cb_limpiar.setfocus()
					else
						messagebox("Error Grabar Modificaciones (Rechazo)","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
						ll_error ++
					end if
				else
					messagebox("Error Grabar Modificaciones (Rechazo)","Error Grabar Tabla Revision_Contratos SQL: "+sqlca.sqlerrtext)
					ll_error ++
				end if
				if ll_grabar=2 then
					commit using sqlca;
				elseif ll_error>0 then
					rollback using sqlca;
				end if
			end if
		end if
	else
		messagebox("Advertencia","Recuerde para Rechazar la Revision debe estar VIGENTE")
	end if
else
	messagebox("Advertencia","Ud. NO tiene Permiso para Rechazar Contrato")
end if
end event

type cb_aceptar from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 23
integer y = 2492
integer width = 251
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Aceptar"
end type

event ue_mousemove;st_ctacte.visible	= false

end event

event clicked;Long		ll_resp,ll_count_fila,ll_estado,ll_error,ll_grabar,ll_est_reg,ll_codigo,ll_rut,ll_renta_liquida,ll_capacidad,ll_edad,ll_plazo,ll_pasa,ll_cd_funcion,ll_res,&
			ll_count,ll_tot_reg,ll_indi,ll_cod_serv,ll_tipo_benef,ll_activa_serv,ll_existe,ll_resp_benef
String		ls_parametro,ls_glosa,ls_age,ls_sup,ls_jefe,ls_dv,ls_base,ls_serie,ls_comp_titular,ls_moneda,ls_forma_pago,ls_area,ls_tipo_sepultura,ls_uso,ls_descrip_estado,ls_estado_cadena,&
			ls_origen,ls_benef_ok,ls_graba,ls_pasa,ls_msj_serv
Datetime	ldt_fecha,ldt_fecha_ctto,ldt_fecha_nac,ldt_fecha_prim
Double	ldb_uf,ldb_pie,ldb_precio,ldb_valor_cta_mant,ldb_valor_cuota,ldb_precio_contrato,ldb_monto,ll_numero,ll_digitado

ll_error=0;ll_grabar=0;ll_pasa=0;ll_count=0
ls_base											= dw_base.getitemstring(1,'base')
SELECT	"ENCARGADOS"."DEPTO"
INTO		:gs_depto
FROM 	"ENCARGADOS"  
WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;
	
if (ls_base='F' or ls_base='G' or ls_base='V') and gs_depto<>'H' and gs_depto<>'I' and gs_depto<>'X' and gs_depto<>'R' and gs_depto<>'E' and gs_depto<>'O' and gs_depto<>'V' then
	if ls_base='F' then
		messagebox("Advertencia","Ud. no puede Actualizar Producto Funeraria")
	elseif ls_base='G' then
		messagebox("Advertencia","Ud. no puede Actualizar Producto Crematorio")
	elseif ls_base='V' then
		messagebox("Advertencia","Ud. no puede Actualizar Contrato de Servicio")
	elseif ls_base='M' then
		messagebox("Advertencia","Ud. no puede Actualizar MultiProducto")
	end if
	ls_pasa											= 'N'
elseif ls_base<>'F' and ls_base <>'G' and ls_base <>'V' and gs_depto='H' and gs_depto<>'I' then
	messagebox("Advertencia","Ud. Solo puede Actualizar Producto Funeraria/Crematorio")
	ls_pasa											= 'N'
else
	ls_pasa											= 'S'
end if

if ls_pasa='S' then
	if is_nuevo='S' then
		dw_revision.setitem(1,'usuario_crea',gs_user)
		dw_revision.setitem(1,'fecha_crea',gdt_fec_sistema)
	end if
	dw_revision.accepttext()
	dw_lista_obs.accepttext()
	
	ll_rut												= long(em_rut.text)
	ls_dv												= trim(em_dv.text)
	ls_base											= dw_base.getitemstring(1,'base')
	ls_serie											= trim(ddlb_serie.text)
	ll_numero										= Double(em_numero.text)
	dw_revision.setitem(1,'base',ls_base)
	dw_revision.setitem(1,'serie',ls_serie)
	dw_revision.setitem(1,'numero',ll_numero)
	dw_revision.setitem(1,'rut',ll_rut)
	dw_revision.setitem(1,'dv',ls_dv)
	dw_revision.accepttext()
	
	if dw_revision.getitemstring(1,'estado_revision')='A' and gs_depto<>'O' then
		messagebox("Advertencia","Revisión Se Encuentra ACEPTADA")
	else
		SELECT	count("ESTADO"."NOMBRE_ESTADO")  
		INTO 		:ll_existe  
		FROM 	"CADENA",	"ESTADO"  
		WHERE  ( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
					(("CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero ) )   
		USING	sqlca;
		if isnull(ll_existe) then ll_existe=0
		
		if ll_existe > 0 then
			SELECT	"ESTADO"."NOMBRE_ESTADO"  
			INTO 		:ls_estado_cadena  
			FROM 	"CADENA",	"ESTADO"  
			WHERE  ( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
						(("CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero ) )   
			USING	sqlca;
			if isnull(ls_estado_cadena) then ls_estado_cadena='V'
			if ls_base <> 'F' and ls_base<>'G' and ls_base<>'A' and ls_base<>'V' then
				ls_graba							= 'N'
				messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###")+' se encuentra Digitada y en Estado '+ls_estado_cadena)
			else
				ls_graba							= 'S'
			end if
		else
			ls_graba								= 'S'
		end if
		if ls_graba = 'S' then
			DELETE FROM "REVISION_CONTRATOS_OBSERVACION"  
			WHERE	( "REVISION_CONTRATOS_OBSERVACION"."RUT" = :ll_rut ) AND  
						( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
						( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
						( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
			ll_tot_reg								= dw_lista_obs.rowcount()
			if ll_tot_reg>0 then
				for ll_indi=1 to ll_tot_reg
					dw_lista_obs.setitem(ll_indi,'correlativo',ll_indi)
					dw_lista_obs.setitem(ll_indi,'base',ls_base)
					dw_lista_obs.setitem(ll_indi,'serie',ls_serie)
					dw_lista_obs.setitem(ll_indi,'numero',ll_numero)
					dw_lista_obs.setitem(ll_indi,'rut',ll_rut)
				next
			end if
			dw_lista_obs.accepttext()
			dw_revision.accepttext()
			il_cod_parque							= dw_revision.getitemnumber(1,'cod_parque')
			ldt_fecha_ctto							= datetime(date(dw_revision.getitemdatetime(1,'fecha_ctto')),time('00:00:00'))
			ldt_fecha_nac							= dw_revision.getitemdatetime(1,'fecha_nac')
			ll_renta_liquida							= dw_revision.getitemnumber(1,'renta_liquida')
			ll_edad									= dw_revision.getitemnumber(1,'edad')
			ldb_uf										= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
			ls_moneda								= dw_revision.getitemstring(1,'moneda')
			ls_forma_pago							= dw_revision.getitemstring(1,'forma_pago')
			ls_area									= dw_revision.getitemstring(1,'area')
			ls_tipo_sepultura						= dw_revision.getitemstring(1,'tipo_sepult')
			ll_capacidad								= dw_revision.getitemnumber(1,'capacidad')
			ls_uso									= dw_revision.getitemstring(1,'uso')
			ldb_pie									= double(dw_revision.getitemnumber(1,'pie'))
			ll_plazo									= dw_revision.getitemnumber(1,'plazo')
			ldt_fecha_prim							= dw_revision.getitemdatetime(1,'fecha_prim')
			ldb_precio								= double(dw_revision.getitemnumber(1,'precio'))
			ldb_precio_contrato					= double(dw_revision.getitemnumber(1,'precio_contrato'))
			ldb_valor_cta_mant					= double(dw_revision.getitemnumber(1,'valor_cuota_mant'))
			ldb_valor_cuota						= double(dw_revision.getitemnumber(1,'valor_cuota'))
			ls_comp_titular							= dw_revision.getitemstring(1,'comprobante_titular')
			ls_origen									= dw_revision.getitemstring(1,'origen_venta')
			
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut")
				ll_pasa ++
				em_rut.setfocus()
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador")
				ll_pasa ++
				em_dv.setfocus()
			elseif isnull(ls_base) or ls_base='' then
				messagebox("Advertencia","Debe Ingresar Base")
				ll_pasa ++
				dw_base.setfocus()
			elseif isnull(ls_serie) or ls_serie='' then
				messagebox("Advertencia","Debe Ingresar Serie")
				ll_pasa ++
				ddlb_serie.setfocus()
			elseif isnull(ll_numero) or ll_numero=0 then
				messagebox("Advertencia","Debe Ingresar Número")
				ll_pasa ++
				em_numero.setfocus()
			elseif isnull(ldb_pie) then
				messagebox("Advertencia","Debe Ingresar Valor Pie, si la Venta NO Registra Pie debe Ingresar 0")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('pie')
			elseif isnull(il_cod_parque) or il_cod_parque=0 then
				messagebox("Advertencia","Debe Ingresar Parque")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('cod_parque')
			elseif isnull(ldt_fecha_ctto) or string(ldt_fecha_ctto,"dd/mm/yyyy")='00/00/0000' or string(ldt_fecha_ctto,"dd/mm/yyyy")='01/01/1900' then
				messagebox("Advertencia","Debe Ingresar Fecha Contrato")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('fecha_ctto')
			elseif isnull(ldt_fecha_nac) or string(ldt_fecha_nac,"dd/mm/yyyy")='00/00/0000' or string(ldt_fecha_nac,"dd/mm/yyyy")='01/01/1900' then
				messagebox("Advertencia","Debe Ingresar Fecha Contrato")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('fecha_ctto')
			elseif (isnull(ll_renta_liquida) or ll_renta_liquida=0) and (ls_forma_pago='2' or ls_forma_pago='4') and (ls_base='O' or ls_base='U') then
				messagebox("Advertencia","Debe Ingresar Renta Líquida")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('renta_liquida')
			elseif ll_renta_liquida>0 and ls_forma_pago<>'2' and ls_forma_pago<>'4' then
//				messagebox("Advertencia","Recuerde No es Necesario Ingresar Renta Líquida cuando la Forma de Pago es Contado")
			//	dw_revision.setfocus()
			//	dw_revision.setcolumn('renta_liquida')
			elseif isnull(ll_edad) or ll_edad=0 then
				messagebox("Advertencia","Debe Ingresar Edad")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('edad')
			elseif isnull(ldb_uf) or ldb_uf=0 then
				messagebox("Advertencia","Debe Ingresar U.F.")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('uf_fecha_ctto')
			elseif isnull(ls_moneda) or ls_moneda='' then
				messagebox("Advertencia","Debe Ingresar Moneda")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('moneda')
			elseif isnull(ls_forma_pago) or ls_forma_pago='' then
				messagebox("Advertencia","Debe Ingresar Forma de Pago")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('forma_pago')
			elseif isnull(ls_uso) or ls_uso='' then
				messagebox("Advertencia","Debe Ingresar Uso")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('uso')
			elseif isnull(ll_plazo) or ll_plazo=0 then
				messagebox("Advertencia","Debe Ingresar Plazo")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('plazo')
			elseif (isnull(ls_origen) or ls_origen='') and (ls_base='O'  or ls_base='U' or ls_base='F' or ls_base='G' or ls_base='V') then
				messagebox("Advertencia","Debe Ingresar Origen Venta")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('origen_venta')
			elseif isnull(ldt_fecha_prim) or string(ldt_fecha_prim,"dd/mm/yyyy")='00/00/0000' or string(ldt_fecha_prim,"dd/mm/yyyy")='01/01/1900' then
				messagebox("Advertencia","Debe Ingresar Fecha Primer Vencimiento")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('fecha_prim')
			elseif ldt_fecha_prim < ldt_fecha_ctto then
				messagebox("Advertencia","Recuerde Fecha Primer Vencimiento debe ser Mayor o Igual a la Fecha Contrato")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('fecha_prim')
			elseif isnull(ldb_precio) or ldb_precio=0 then
				messagebox("Advertencia","Debe Ingresar Precio Lista")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('precio')
			elseif isnull(ldb_precio_contrato) or ldb_precio_contrato=0 then
				messagebox("Advertencia","Debe Ingresar Precio Contrato")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('precio_contrato')
			elseif isnull(ldb_valor_cuota) or ldb_valor_cuota=0 then
				messagebox("Advertencia","Debe Ingresar Valor Cuota")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('valor_cuota')
			elseif isnull(ll_capacidad) or ll_capacidad=0 then
				messagebox("Advertencia","Debe Ingresar Capacidad")
				ll_pasa ++
				dw_revision.setfocus()
				dw_revision.setcolumn('capacidad')
			end if
			if ls_base='F' or ls_base='G' or ls_base='V' then
				ll_cod_serv							= dw_revision.getitemnumber(1,'codigo_servicio')
				ll_tipo_benef						= dw_revision.getitemnumber(1,'tipo_beneficiarios')
				ll_activa_serv						= dw_revision.getitemnumber(1,'sw_activa_servicio')
				if isnull(ll_activa_serv) then ll_activa_serv=1
				if ll_activa_serv = 2 then
					ls_benef_ok						= f_beneficiarios(ls_base,ls_serie,ll_numero,ll_capacidad)
					if ls_benef_ok = 'N' and is_recordar_benef='N' then
						if ls_base='F' and ll_cod_serv >= 670 and ll_cod_serv <= 674 then
							ll_resp_benef	= messagebox("Advertencia","Recuerde que debe Ingresar Beneficiario Servicio Funerario (Fallecido), desea Ingresarlo",Exclamation!,YesNo!,2)
							if ll_resp_benef=1 then pb_benef.triggerevent(clicked!)
						elseif ls_base='F' or ls_base='G' then
							if ls_base='F' then
								ls_msj_serv			= 'Funeraria'
							elseif ls_base='G' then
								ls_msj_serv			= 'Crematorio'
							end if
							messagebox("Advertencia","Recuerde que debe Ingresar Beneficiario Servicio "+ls_msj_serv+" (Fallecido)")
							pb_benef.triggerevent(clicked!)
						end if
						ll_pasa ++
//						pb_benef.triggerevent(clicked!)
					end if
				else
					ls_benef_ok						= 'S'
				end if
				
				if isnull(ll_cod_serv) or ll_cod_serv=0 then
					messagebox("Advertencia","Debe Ingresar Código Servicio")
					ll_pasa ++
					dw_revision.setfocus()
					dw_revision.setcolumn('codigo_servicio')
				elseif isnull(ll_tipo_benef) or ll_tipo_benef=0 then
					messagebox("Advertencia","Debe Ingresar Tipo Beneficiario")
					ll_pasa ++
					dw_revision.setfocus()
					dw_revision.setcolumn('tipo_beneficiarios')
				elseif isnull(ll_activa_serv) then
					messagebox("Advertencia","Debe Ingresar Estado Activación Servicio")
					ll_pasa ++
					dw_revision.setfocus()
					dw_revision.setcolumn('sw_activa_servicio')	
				end if
			else
				if isnull(ls_area) or ls_area='' then
					messagebox("Advertencia","Debe Ingresar Area")
					ll_pasa ++
					dw_revision.setfocus()
					dw_revision.setcolumn('area')
				elseif isnull(ls_tipo_sepultura) or ls_tipo_sepultura='' then
					messagebox("Advertencia","Debe Ingresar Tipo Sepultura")
					ll_pasa ++
					dw_revision.setfocus()
					dw_revision.setcolumn('tipo_sepult')
				end if
				if ls_base<>'A' then
					if isnull(ldb_valor_cta_mant) or ldb_valor_cta_mant=0 then
						messagebox("Advertencia","Debe Ingresar Valor Cuota Mantención")
						ll_pasa ++
						dw_revision.setfocus()
						dw_revision.setcolumn('valor_cuota_mant')
					end if
				end if
			end if
			if ll_pasa=0 then
				if dw_revision.getitemstring(1,'estado_revision')='V' then //Vigente
					dw_revision.accepttext()
					if dw_revision.update() = 1 then
						ll_count ++
						
						if dw_lista_obs.update() = 1 then
							ll_count ++
//						else
//							messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
						end if
						if ll_count=2 then 
							commit using sqlca;
							if gs_depto='O' or gs_depto='V' or gs_depto='E' or gs_depto='H' or gs_depto<>'X' or gs_depto<>'R' then	//se agregar depto X-R
								if ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' and ls_base<>'' and not isnull(ls_base) and ll_numero>0 then
									SELECT	sysdate 
									INTO 		:gdt_fec_sistema  
									FROM 	"TASA"  
									USING	sqlca;
									
									ldt_fecha								= datetime(date(gdt_fec_sistema),time('00:00:00'))
									SELECT	"ULT_ESTADO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"COD_PARQUE" 
									INTO 		:il_ult_estado,		:ls_age,				:ls_sup,					:ls_jefe,					:il_cod_parque 
									FROM 	"CD_FOLIO"  
									WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
												( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
												( "CD_FOLIO"."NUMERO" = :ll_numero )   
									USING	sqlca;
									if sqlca.sqlcode=0 then
//										if gs_depto='V' or gs_depto='H' or gs_depto<>'X' or gs_depto<>'R' or gs_depto<>'E' then // Venta  estaba gs_depto='E'
										if gs_depto='V' or gs_depto='H' or gs_depto='X' or gs_depto='R' or gs_depto='E' or gs_depto='I' then // Venta  estaba gs_depto='E'
											if il_ult_estado = 11 then
												if ls_base = 'F' or ls_base='G' or ls_base='V' then
													if ls_base='F' then
														ll_res				= MessageBox("Grabar","¿Desea Grabar Estado Activación Servicio Funerario?", Exclamation!, YesNo!, 2)
													elseif ls_base='G' then
														ll_res				= MessageBox("Grabar","¿Desea Grabar Estado Activación Servicio Crematorio?", Exclamation!, YesNo!, 2)
													elseif ls_base='V' then
														ll_res				= MessageBox("Grabar","¿Desea Grabar Estado Activación Servicio de Contrato?", Exclamation!, YesNo!, 2)
													end if
													if ll_res = 1 then
														if dw_revision.update()=1 then
															commit;
//															if ldb_precio <> ldb_precio_contrato and ldb_precio_contrato > 0 then
//																UPDATE	"PRODUCTO_VENTA_ASOCIADA"  
//																SET		 "VALOR_PRODUCTO" = :ldb_precio_contrato  
//																	WHERE	"PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base AND  
//																			"PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie AND  
//																			"PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero AND  
//																			"PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE" = 1 
//																USING	sqlca;
//																if sqlca.sqlcode=0 then
//																	commit;
//																else
//																	rollback;
//																end if
//															end if
//															cb_cerrar.triggerevent(clicked!) 	SE ELIMINA
															w_validar_promesa_operaciones.triggerevent(open!)
															w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
															return
														else
															rollback;
														end if
													end if
												end if
											elseif il_ult_estado = 4 then
												messagebox("Advertencia","Se actualizará Revisión, pero en Control Documentario NO por encontrase en Estado: 4-Aceptado Contrato y Entregar a Operaciones")
												ll_grabar					= 3
											else	
												if il_ult_estado=3 or il_ult_estado=2 or il_ult_estado=7 or il_ult_estado=13 then
													dw_revision.setitem(1,'estado_revision','V')
													dw_revision.accepttext()
													if dw_revision.update()=1 then
														commit;
													else
														rollback;
													end if
													if (gs_depto='X' or gs_depto='E' ) then	//or gs_depto='H' and (ls_base<>'F' and ls_base<>'G' and ls_base<>'V')) or (gs_depto='R' and (ls_base<>'F' and ls_base<>'G' and ls_base<>'V')					//if il_ult_estado <> 2 and (ls_base = 'F' or ls_base='G') then	//gs_depto='R' or 
														ll_grabar										= 2
//													end if
													else
														if il_ult_estado = 3 or il_ult_estado = 2 then		// 
															if ls_base = 'F' or ls_base = 'G' or ls_base = 'V' then					//funeraria
																if ls_benef_ok = 'S' then
																	ll_estado							= 4
																	ll_cd_funcion					= f_cd_folio_funeraria(ls_base,ls_serie,ll_numero,gdt_fec_sistema,ll_estado,gdt_fec_sistema,ls_age,ls_sup,ls_jefe,il_cod_parque)
																	if ll_cd_funcion = 1 then
																		SELECT	count("CADENA"."CODIGO")
																		INTO		:ll_digitado
																		FROM		"CADENA","PRODUCTO_ANEXO"  
																		WHERE	"CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" and  
																					"CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" and  
																					"CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" and  
																					"CADENA"."CODIGO" = :ls_base AND  
																					"CADENA"."SERIE" = :ls_serie AND  
																					"CADENA"."NUMERO" = :ll_numero 
																		USING	sqlca;
																		if isnull(ll_digitado) then ll_digitado=0
																		if ll_digitado=0 then
//																			if ldb_precio <> ldb_precio_contrato and ldb_precio_contrato > 0 then
//																				UPDATE	"PRODUCTO_VENTA_ASOCIADA"  
//																				SET		 "VALOR_PRODUCTO" = :ldb_precio_contrato  
//																				WHERE	"PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base AND  
//																							"PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie AND  
//																							"PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero AND  
//																							"PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE" = 1 
//																				USING	sqlca;
//																				if sqlca.sqlcode=0 then
//																					commit;
//																				else
//																					rollback;
//																				end if
//																			end if
//																			if (ll_plazo > 1 or ls_uso = 'NI' ) and ls_base = 'G' then
//																			if ((ll_plazo > 1 or ls_uso='NF') and ls_base = 'G') or ((ls_base='F' and (ls_uso='NF' or ll_plazo > 1)) then
																			if (ll_plazo > 1 and ls_base = 'G') or (ls_base='F' and ll_plazo > 1) then
																				messagebox("Grabar","Grabación Exitosa")
																			else
																				if isvalid(w_ingresar_funeraria) then close(w_ingresar_funeraria)
																				open(w_ingresar_funeraria)	
																			end if
																			w_validar_promesa_operaciones.triggerevent(open!)
																			w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
//																			cb_cerrar.triggerevent(clicked!)	SE ELIMINA
																			return
																		else
																			messagebox("Advertencia",'Contrato Digitado "No Puede Ser Modificado"' )
																			em_numero.setfocus()
																			return		
																		end if
																	end if
																end if
															else
																ll_estado				= 4
																ls_glosa				= 'ACEPTADO CONTRATO POR ADMINISTRACION DE VENTAS Y SE ENTREGA A DEPARTAMENTO OPERACIONES POR USUARIO '+gs_nom_comp_usuario+' EL DIA '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")
																UPDATE	"CD_FOLIO"  
																SET 		"ULT_ESTADO" = :ll_estado,   
																			"ULT_FECHA_ESTADO" = :ldt_fecha,   
																			"ULT_GLOSA_ESTADO" = :ls_glosa,   
																			"COD_PARQUE" = :il_cod_parque,
																			"ULT_MEMO" = '-',   
																			"ULT_USUARIO_GESTION" = :gs_user  
																WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
																			( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																			( "CD_FOLIO"."NUMERO" = :ll_numero )   
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	ll_grabar ++
																	INSERT INTO "CD_FOLIO_DETALLE"  
																				( "BASE",		"SERIE",	"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"TIPO_RECHAZO",	"TIPO_EXCEPCION",	"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION",	"COD_PARQUE",	"ESTADO_MODIFICADO",	"MES_CIERRE",	"ANO_CIERRE" )  
																	VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema,	:gs_user,			:ll_estado,	:gdt_fec_sistema,	:ls_glosa,	'-',			:ls_age,				:ls_sup,					:ls_jefe,					null,							null,									null,					null, 						null,							null,											:il_cod_parque,		'N',								null,				null )  
																	USING	sqlca;
																	if sqlca.sqlcode=0 then
																		ll_grabar ++
																	else
																		ll_error ++
																		messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
																	end if
																else
																	ll_error ++
																	messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO SQL: "+sqlca.sqlerrtext)
																end if
															end if
														else
															messagebox("Advertencia","No se Actualizará Control Documentario, el Estado DEBE ESTAR en Codigo: 3-RECEPCION CONTRATO DE AGENTE POR ADMIN.VENTAS")
														end if
													end if
													if dw_lista_obs.update()=1 then
														ll_grabar ++
													else
														ll_error ++
//														messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
													end if
													
												elseif il_ult_estado=9 then
													
													if ls_base = 'F' or ls_base='G' or ls_base='V' then //funeraria
														UPDATE		"SEGURO_ASOCIADOS"  
														SET 			"ESTADO_SEGURO" = 'I',
																		"ESTADO_REG" = 1
														WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																	  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																	  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
														USING		sqlca;
														if sqlca.sqlcode=0 then
															commit;
															ll_tot_reg						= dw_seguro.rowcount()
															for ll_indi=1 to ll_tot_reg
																ll_est_reg					= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
																ll_codigo						= dw_seguro.getitemnumber(ll_indi,'codigo')
																if ls_moneda='1' then
																	SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
																	INTO 		:ldb_monto  
																	FROM 	"TIPO_SEGURO"  
																	WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo AND
																				"TIPO_SEGURO"."BASE" = :ls_base AND
																				"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
																	USING	sqlca;
			//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
																elseif ls_moneda='2' then
																	SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
																	INTO 		:ldb_monto  
																	FROM 	"TIPO_SEGURO"  
																	WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																				"TIPO_SEGURO"."BASE" = :ls_base AND
																				"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
																	USING	sqlca;
			//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
																end if
																if ll_est_reg = 0 then
																	SELECT	Count("BASE")
																	INTO		:ll_count  
																	FROM		"SEGURO_ASOCIADOS"  
																	WHERE	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																				( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																				( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																				( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
																	USING	sqlca;
																	if ll_count > 0 then
																		UPDATE	"SEGURO_ASOCIADOS"  
																		SET 		"ESTADO_SEGURO" = 'A',
																					"ESTADO_REG" = 0,
																					"MONTO_PRIMA" = :ldb_monto,
																					"MONEDA" = :ls_moneda
																		WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																					( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																					( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																					( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
																		USING	sqlca;
																		if sqlca.sqlcode=0 then
																			commit;
																		elseif sqlca.sqlcode=100 then
																			INSERT INTO "SEGURO_ASOCIADOS"  
																						( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																			VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,						'A',						:ls_moneda,	:ls_forma_pago)  
																			USING	sqlca;
																			if sqlca.sqlcode=0 then
																				commit;
																			else
																				rollback;
																				messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																			end if
																		else
																			rollback;
																			messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																		end if
																	else
																		INSERT INTO "SEGURO_ASOCIADOS"  
																					( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																		VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
																		USING	sqlca;
																		if sqlca.sqlcode=0 then
																			commit;
																		else
																			rollback;
																			messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																		end if
																	end if
					
																end if
															next
														else
															rollback;
															ll_tot_reg								= dw_seguro.rowcount()
															for ll_indi=1 to ll_tot_reg
																ll_est_reg							= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
																ll_codigo								= dw_seguro.getitemnumber(ll_indi,'codigo')
																if ls_moneda='1' then
																	SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
																	INTO 		:ldb_monto  
																	FROM 	"TIPO_SEGURO"  
																	WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																				"TIPO_SEGURO"."BASE" = :ls_base AND
																				"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
																	USING	sqlca;
			//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
																elseif ls_moneda='2' then
																	SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
																	INTO 		:ldb_monto  
																	FROM 	"TIPO_SEGURO"  
																	WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																				"TIPO_SEGURO"."BASE" = :ls_base AND
																				"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
																	USING	sqlca;
			//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
																end if
																if ll_est_reg = 0 then
																	INSERT INTO "SEGURO_ASOCIADOS"  
																				( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																	VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto, 		:gs_user,	0,   					0,   					'A',						:ls_moneda,		:ls_forma_pago )  
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																		messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																	end if
																end if
															next
														end if
													
														ls_benef_ok				= f_beneficiarios(ls_base,ls_serie,ll_numero,ll_capacidad)
														if ls_benef_ok = 'S' or ls_benef_ok='N'  then
															if ls_benef_ok='N' then messagebox("Advertencia","Recuerde que debe Ingresar Beneficiarios")
															SELECT	count("CADENA"."CODIGO")
															INTO		:ll_digitado
															FROM		"CADENA","PRODUCTO_ANEXO"  
															WHERE	"CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" and  
																		"CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" and  
																		"CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" and  
																		"CADENA"."CODIGO" = :ls_base AND  
																		"CADENA"."SERIE" = :ls_serie AND  
																		"CADENA"."NUMERO" = :ll_numero 
															USING	sqlca;
															if isnull(ll_digitado) then ll_digitado=0
															if ll_digitado=0 then
																if ldb_precio <> ldb_precio_contrato and ldb_precio_contrato > 0 then
//																	UPDATE	"PRODUCTO_VENTA_ASOCIADA"  
//																	SET		 "VALOR_PRODUCTO" = :ldb_precio_contrato  
//																		WHERE	"PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base AND  
//																				"PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie AND  
//																				"PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero AND  
//																				"PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE" = 1 
//																	USING	sqlca;
//																	if sqlca.sqlcode=0 then
//																		commit;
//																	else
//																		rollback;
//																	end if
																end if
//																if ll_plazo > 1 and ls_base = 'G' then
//																if ((ll_plazo > 1 or ls_uso='NF') and ls_base = 'G') or (ls_base='F' and ls_uso='NF') then
																if (ll_plazo > 1 and ls_base = 'G') or (ls_base='F' and ll_plazo > 1) then
																	messagebox("Grabar","Grabación Exitosa")
																else
																	if isvalid(w_ingresar_funeraria) then close(w_ingresar_funeraria)
																	open(w_ingresar_funeraria)	
																end if
//																cb_cerrar.triggerevent(clicked!)	SE ELIMINA
																return
																w_validar_promesa_operaciones.triggerevent(open!)
																w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
															else
																messagebox("Advertencia",'Contrato Digitado "No Puede Ser Modificado"' )
																em_numero.setfocus()
																return		
															end if
														else
															messagebox("Grabar","Grabación Exitosa, Recuerde Ingresar Beneficiarios si es Requerido")
														end if
													else
														ll_grabar								=3
													end if	
												else
													SELECT	"CD_ESTADO"."DESCRIPCION"  
													INTO 		:ls_descrip_estado  
													FROM 	"CD_ESTADO"  
													WHERE 	"CD_ESTADO"."CODIGO" = :il_ult_estado  ;
													if ls_base <> 'F' and ls_base<>'G' and ls_base<>'V' then
														messagebox("Advertencia","No se Actualizó Control Documentario por encontrarce Actualmente en Estado "+string(il_ult_estado)+"-"+ls_descrip_estado+", recuerde debe estar es Estado: 2-Asignado Contrato Agente O 3-Recepción Contrato de Agente por Admin.Ventas")
													else
														commit using sqlca;
														messagebox("Grabar","Grabación Exitosa Contrato "+ls_base+'-'+ls_serie+'-'+String(ll_numero,'###,###,###,##0'))
													end if
													cb_limpiar.triggerevent(clicked!)
												end if
											end if
											if ll_grabar=3 then
												commit using sqlca;
												UPDATE		"SEGURO_ASOCIADOS"  
												SET 			"ESTADO_SEGURO" = 'I',
																"ESTADO_REG" = 1
												WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
															  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
															  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													commit;
													ll_tot_reg						= dw_seguro.rowcount()
													for ll_indi=1 to ll_tot_reg
														ll_est_reg					= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
														ll_codigo						= dw_seguro.getitemnumber(ll_indi,'codigo')
														if ls_moneda='1' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
														elseif ls_moneda='2' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
														end if
														if ll_est_reg = 0 then
															SELECT	Count("BASE")
															INTO		:ll_count  
															FROM		"SEGURO_ASOCIADOS"  
															WHERE	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																		( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																		( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																		( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
															USING	sqlca;
															if ll_count > 0 then
																UPDATE	"SEGURO_ASOCIADOS"  
																SET 		"ESTADO_SEGURO" = 'A',
																			"ESTADO_REG" = 0,
																			"MONTO_PRIMA" = :ldb_monto,
																			"MONEDA" = :ls_moneda
																WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																			( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																			( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																			( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																elseif sqlca.sqlcode=100 then
																	INSERT INTO "SEGURO_ASOCIADOS"  
																				( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																	VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,						'A',						:ls_moneda,	:ls_forma_pago)  
																	USING	sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																		messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																	end if
																else
																	rollback;
																	messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															else
																INSERT INTO "SEGURO_ASOCIADOS"  
																			( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																	messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															end if
			
														end if
													next
												else
													rollback;
													ll_tot_reg								= dw_seguro.rowcount()
													for ll_indi=1 to ll_tot_reg
														ll_est_reg							= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
														ll_codigo								= dw_seguro.getitemnumber(ll_indi,'codigo')
														if ls_moneda='1' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
														elseif ls_moneda='2' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
														end if
														if ll_est_reg = 0 then
															INSERT INTO "SEGURO_ASOCIADOS"  
																		( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
															VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto, 		:gs_user,	0,   					0,   					'A',						:ls_moneda,		:ls_forma_pago )  
															USING		sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
																messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
															end if
														end if
													next
												end if
												cb_memo.enabled							= true
												ll_resp	= messagebox("Grabar","Grabación Exitosa, desea Ingresar MEMO",Exclamation!,YesNo!,2)
												if ll_resp=1 then
													cb_memo.triggerevent(clicked!) //setfocus()
													cb_aceptar.enabled					= false
													cb_rechazar.enabled					= false
													dw_base.enabled						= false
													ddlb_serie.enabled					= false
													em_numero.enabled					= false
													//cb_limpiar.setfocus()
												else
													cb_aceptar.enabled					= false
													cb_rechazar.enabled					= false
													dw_base.enabled						= false
													ddlb_serie.enabled					= false
													em_numero.enabled					= false
													cb_limpiar.triggerevent(clicked!)
												end if
												
												
											end if
											if ll_error>0 then
												rollback using sqlca;
												messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
											end if
											
										elseif gs_depto='E' then // Venta
											if il_ult_estado = 23 then
												messagebox("Advertencia","Se actualizará Revisión, pero en Control Documentario NO por encontrase en Estado: 23-Aceptado Contrato y Entregar a Operaciones")
												ll_grabar		= 3
											else	
												if il_ult_estado=21 or il_ult_estado=22 or il_ult_estado=25 or il_ult_estado=29 then
													dw_revision.setitem(1,'estado_revision','V')
													dw_revision.accepttext()
													if dw_revision.update()=1 then
														commit;
													else
														rollback;
													end if
													if il_ult_estado=22 then
														ll_estado						= 23
														ls_glosa						= 'ACEPTADO CONTRATO POR ATENCION TERRENO Y SE ENTREGA A DEPARTAMENTO OPERACIONES POR USUARIO '+gs_nom_comp_usuario+' EL DIA '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")
														UPDATE	"CD_FOLIO"  
														SET 		"ULT_ESTADO" = :ll_estado,   
																	"ULT_FECHA_ESTADO" = :ldt_fecha,   
																	"ULT_GLOSA_ESTADO" = :ls_glosa, 
																	"COD_PARQUE" = :il_cod_parque,
																	"ULT_MEMO" = '-',   
																	"ULT_USUARIO_GESTION" = :gs_user  
														WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
																	( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																	( "CD_FOLIO"."NUMERO" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															ll_grabar ++
															INSERT INTO "CD_FOLIO_DETALLE"  
																		( "BASE",		"SERIE",	"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"TIPO_RECHAZO",	"TIPO_EXCEPCION",	"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION",	"COD_PARQUE",	"ESTADO_MODIFICADO",	"MES_CIERRE",	"ANO_CIERRE" )  
															VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema,	:gs_user,			:ll_estado,	:gdt_fec_sistema,	:ls_glosa,	'-',			:ls_age,				:ls_sup,					:ls_jefe,					null,							null,									null,					null, 						null,							null,											:il_cod_parque,		'N',								null,				null )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																ll_grabar ++
															else
																ll_error ++
																messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
															end if
														else
															ll_error ++
															messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO SQL: "+sqlca.sqlerrtext)
														end if
													else
														messagebox("Advertencia","No se Actualizará Control Documentario, el Estado DEBE ESTAR en Codigo: 3-RECEPCION CONTRATO DE AGENTE POR ADMIN.VENTAS")
													end if
													if dw_lista_obs.update()=1 then
														ll_grabar ++
													else
														ll_error ++
//														messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
													end if
												else
													SELECT	"CD_ESTADO"."DESCRIPCION"  
													INTO 		:ls_descrip_estado  
													FROM 	"CD_ESTADO"  
													WHERE 	"CD_ESTADO"."CODIGO" = :il_ult_estado  ;
													messagebox("Advertencia","No se Actualizó Control Documentario por encontrarce Actualmente en Estado "+string(il_ult_estado)+"-"+ls_descrip_estado+", recuerde debe estar es Estado: 21-Asignado Contrato Ejecutivo O 22-Recepción Contrato de Ejecutivo por Atención Terreno")
													cb_limpiar.triggerevent(clicked!)
												end if
											end if
											if ll_grabar=3 then
												commit using sqlca;
												UPDATE	"SEGURO_ASOCIADOS"  
												SET 		"ESTADO_SEGURO" = 'I',
															"ESTADO_REG" = 1
												WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
												USING	sqlca;
												if sqlca.sqlcode=0 then
													commit;
													ll_tot_reg						= dw_seguro.rowcount()
													for ll_indi=1 to ll_tot_reg
														ll_est_reg					= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
														ll_codigo						= dw_seguro.getitemnumber(ll_indi,'codigo')
														if ls_moneda='1' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
														elseif ls_moneda='2' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
														end if
														if ll_est_reg = 0 then
															SELECT		Count("SEGURO_ASOCIADOS"."BASE")
															INTO 			:ll_count  
															FROM 		"SEGURO_ASOCIADOS"  
															WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																		  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																		  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																		  ( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
															USING		sqlca;
															if ll_count > 0 then
																UPDATE	"SEGURO_ASOCIADOS"  
																SET 		"ESTADO_SEGURO" = 'A',
																			"ESTADO_REG" = 0,
																			"MONTO_PRIMA" = :ldb_monto,
																			"MONEDA" = :ls_moneda
																WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																			( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																			( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																			( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																elseif sqlca.sqlcode=100 then
																	INSERT INTO "SEGURO_ASOCIADOS"  
																				( "BASE",		"SERIE", "NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO")  
																	VALUES 	( :ls_base,	:ls_serie,	:ll_numero, :ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,   	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
																	USING		sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																		messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																	end if
																else
																	rollback;
																	messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															else
																INSERT INTO "SEGURO_ASOCIADOS"  
																			( "BASE",		"SERIE", "NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA" )  
																VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,						'A',						:ls_moneda )  
																USING		sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																	messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															end if
			
														end if
													next
												else
													rollback;
													ll_tot_reg									= dw_seguro.rowcount()
													for ll_indi=1 to ll_tot_reg
														ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
														ll_codigo									= dw_seguro.getitemnumber(ll_indi,'codigo')
														if ls_moneda='1' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
														elseif ls_moneda='2' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
														end if
														if ll_est_reg = 0 then
															INSERT INTO "SEGURO_ASOCIADOS"  
																		( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",   	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
															VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,   		:gs_user,	0,   					0,						'A',						:ls_moneda,	:ls_forma_pago )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
																messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
															end if
														end if
													next
												end if
												cb_memo.enabled								= true
												ll_resp											= messagebox("Grabar","Grabación Exitosa, desea Ingresar MEMO",Exclamation!,YesNo!,2)
												if ll_resp=1 then
													cb_memo.triggerevent(clicked!) //setfocus()
												end if
												cb_aceptar.enabled							= false
												cb_rechazar.enabled							= false
												dw_base.enabled								= false
												ddlb_serie.enabled								= false
												em_numero.enabled							= false
												//cb_limpiar.setfocus()
												
											end if
											if ll_error>0 then
												rollback using sqlca;
												messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
											end if
				
										elseif gs_depto='O' then //or gs_depto='H' then //Operaciones y Funeraria
											if il_ult_estado = 9 then
												messagebox("Advertencia","Se actualizará Revisión, pero en Control Documentario NO por encontrase en Estado: 9-Aceptado Contrato y Entrega a Digitación")
												ll_grabar											= 3
												dw_revision.setitem(1,'estado_revision','A')
												dw_revision.accepttext()
												if dw_revision.update()=1 then
													commit;
												else
													rollback;
												end if
											else	
												if il_ult_estado=4 or il_ult_estado=8 or il_ult_estado=18 or il_ult_estado=26 or il_ult_estado=16 or il_ult_estado=23 or (il_ult_estado=3 and ls_base='G' and ll_plazo>1) or (il_ult_estado=3 and ls_base='F' and ll_plazo>1) then
													dw_revision.setitem(1,'estado_revision','A')
													dw_revision.accepttext()
													if dw_revision.update()=1 then
														commit;
													else
														rollback;
													end if
//													if ls_base <> 'F' and ls_base<>'G' and ls_base<>'V' then //funeraria
														ll_estado										= 9
														ls_glosa										= 'ACEPTADO CONTRATO POR DEPARTAMENTO DE OPERACIONES Y SE ENTREGA A DIGITACION POR USUARIO '+gs_nom_comp_usuario+' EL DIA '+string(gdt_fec_sistema,"dd/mm/yyyy hh:mm")
														UPDATE	"CD_FOLIO"  
														SET 		"ULT_ESTADO" = :ll_estado,   
																	"ULT_FECHA_ESTADO" = :ldt_fecha,   
																	"ULT_GLOSA_ESTADO" = :ls_glosa,  
																	"COD_PARQUE" = :il_cod_parque,
																	"ULT_MEMO" = '-',   
																	"ULT_USUARIO_GESTION" = :gs_user  
														WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
																	( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
																	( "CD_FOLIO"."NUMERO" = :ll_numero )   
														USING	sqlca;
														if sqlca.sqlcode=0 then
															ll_grabar ++
															INSERT INTO "CD_FOLIO_DETALLE"  
																		( "BASE",		"SERIE",	"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"USUARIO_ENTREGAR_FORM",	"TIPO_RECHAZO",	"TIPO_EXCEPCION",	"ESTADO_EXCEPCION",	"ESTADO_ASOCIADO_EXCEPCION",	"COD_PARQUE",	"ESTADO_MODIFICADO",	"MES_CIERRE",	"ANO_CIERRE" )  
															VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:gdt_fec_sistema,	:gs_user,			:ll_estado,	:gdt_fec_sistema,	:ls_glosa,	'-',			:ls_age,				:ls_sup,					:ls_jefe,					null,							null,									null,					null, 						null,							null,											:il_cod_parque,		'N',								null,				null )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																ll_grabar ++
															else
																ll_error ++
																messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
															end if
														else
															ll_error ++
															messagebox("Error Grabar","Error Grabar Tabla CD_FOLIO SQL: "+sqlca.sqlerrtext)
														end if
														if dw_lista_obs.update()=1 then
															ll_grabar ++
														else
															ll_error ++
//															messagebox("Error Grabar","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
														end if
//													end if
												else
													SELECT	"CD_ESTADO"."DESCRIPCION"  
													INTO 		:ls_descrip_estado  
													FROM 	"CD_ESTADO"  
													WHERE 	"CD_ESTADO"."CODIGO" = :il_ult_estado  ;
													messagebox("Advertencia","No se Actualizó Control Documentario por encontrarce Actualmente en Estado "+string(il_ult_estado)+"-"+ls_descrip_estado+", recuerde debe estar es Estado: 4 - 8 - 16 - 18 - 13 - 26")
													cb_limpiar.triggerevent(clicked!)
												end if
											end if
											if ll_grabar=3 then
												commit using sqlca;
												UPDATE	"SEGURO_ASOCIADOS"  
												SET 		"ESTADO_SEGURO" = 'I',
															"ESTADO_REG" = 1
												WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
												USING	sqlca;
												if sqlca.sqlcode=0 then
													commit;
													ll_tot_reg									= dw_seguro.rowcount()
													for ll_indi=1 to ll_tot_reg
														ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
														ll_codigo									= dw_seguro.getitemnumber(ll_indi,'codigo')
														if ls_moneda='1' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
														elseif ls_moneda='2' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
														end if
														if ll_est_reg = 0 then
															SELECT	count("SEGURO_ASOCIADOS"."BASE")
															INTO 		:ll_count  
															FROM 	"SEGURO_ASOCIADOS"  
															WHERE	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																		( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																		( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																		( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
															USING	sqlca;
															if ll_count > 0 then
																UPDATE	"SEGURO_ASOCIADOS"  
																SET 		"ESTADO_SEGURO" = 'A',
																			"ESTADO_REG" = 0,
																			"MONTO_PRIMA" = :ldb_monto,
																			"MONEDA" = :ls_moneda
																WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																			( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																			( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																			( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																elseif sqlca.sqlcode=100 then
																	INSERT INTO "SEGURO_ASOCIADOS"  
																				( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																	VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,						0,						'A',						:ls_moneda,	:ls_forma_pago )  
																	USING	sqlca;
																	if sqlca.sqlcode=0 then
																		commit;
																	else
																		rollback;
																		messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																	end if
																else
																	rollback;
																	messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															else
																INSERT INTO "SEGURO_ASOCIADOS"  
																			( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,   		:gs_user,	0,						0,   					'A',						:ls_moneda,	:ls_forma_pago )  
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																	messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															end if
			
														end if
													next
												else
													rollback;
													ll_tot_reg									= dw_seguro.rowcount()
													for ll_indi=1 to ll_tot_reg
														ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
														ll_codigo									= dw_seguro.getitemnumber(ll_indi,'codigo')
														if ls_moneda='1' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
														elseif ls_moneda='2' then
															SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
															INTO 		:ldb_monto  
															FROM 	"TIPO_SEGURO"  
															WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																		"TIPO_SEGURO"."BASE" = :ls_base AND
																		"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
															USING	sqlca;
	//														ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
														end if
														if ll_est_reg = 0 then
															INSERT INTO "SEGURO_ASOCIADOS"  
																		( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
															VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,						0,   					'A',						:ls_moneda,	:ls_forma_pago )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
																messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
															end if
														end if
													next
												end if
												cb_memo.enabled								= true
												ll_resp											= messagebox("Grabar","Grabación Exitosa, desea Ingresar MEMO",Exclamation!,YesNo!,2)
												if ll_resp=1 then
													cb_memo.triggerevent(clicked!)
												end if
												cb_aceptar.enabled							= false
												cb_rechazar.enabled							= false
												dw_base.enabled								= false
												ddlb_serie.enabled							= false
												em_numero.enabled							= false
												//cb_limpiar.setfocus()
												
											end if
											if ll_error>0 then
												rollback using sqlca;
												messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
											end if
										else
											commit using sqlca;
											UPDATE	"SEGURO_ASOCIADOS"  
											SET 		"ESTADO_SEGURO" = 'I',
														"ESTADO_REG" = 1
											WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
														( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
														( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
												ll_tot_reg										= dw_seguro.rowcount()
												for ll_indi=1 to ll_tot_reg
													ll_est_reg									= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
													ll_codigo										= dw_seguro.getitemnumber(ll_indi,'codigo')
													if ls_moneda='1' then
														SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
														INTO 		:ldb_monto  
														FROM 	"TIPO_SEGURO"  
														WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																	"TIPO_SEGURO"."BASE" = :ls_base AND
																	"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
														USING	sqlca;
	//													ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
													elseif ls_moneda='2' then
														SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
														INTO 		:ldb_monto  
														FROM 	"TIPO_SEGURO"  
														WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																	"TIPO_SEGURO"."BASE" = :ls_base AND
																	"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
														USING	sqlca;
	//													ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
													end if
													if ll_est_reg = 0 then
														SELECT	Count("SEGURO_ASOCIADOS"."BASE")
														INTO 		:ll_count  
														FROM 	"SEGURO_ASOCIADOS"  
														WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																	( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																	( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																	( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
														USING	sqlca;
														if ll_count > 0 then
															UPDATE	"SEGURO_ASOCIADOS"  
															SET 		"ESTADO_SEGURO" = 'A',
																		"ESTADO_REG" = 0,
																		"MONTO_PRIMA" = :ldb_monto,
																		"MONEDA" = :ls_moneda
															WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																		( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																		( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																		( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															elseif sqlca.sqlcode=100 then
																INSERT INTO "SEGURO_ASOCIADOS"  
																			( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
																VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,  :ldb_monto,   		:gs_user,	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
																USING	sqlca;
																if sqlca.sqlcode=0 then
																	commit;
																else
																	rollback;
																	messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
																end if
															else
																rollback;
																messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
															end if
														else
															INSERT INTO "SEGURO_ASOCIADOS"  
																		( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
															VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
															USING	sqlca;
															if sqlca.sqlcode=0 then
																commit;
															else
																rollback;
																messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
															end if
														end if
		
													end if
												next
											else
												rollback;
												ll_tot_reg							= dw_seguro.rowcount()
												for ll_indi=1 to ll_tot_reg
													ll_est_reg						= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
													ll_codigo							= dw_seguro.getitemnumber(ll_indi,'codigo')
													if ls_moneda='1' then
														SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
														INTO 		:ldb_monto  
														FROM 	"TIPO_SEGURO"  
														WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																	"TIPO_SEGURO"."BASE" = :ls_base AND
																	"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
														USING	sqlca;
	//													ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
													elseif ls_moneda='2' then
														SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
														INTO 		:ldb_monto  
														FROM 	"TIPO_SEGURO"  
														WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
																	"TIPO_SEGURO"."BASE" = :ls_base AND
																	"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
														USING	sqlca;
	//													ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
													end if
													if ll_est_reg = 0 then
														INSERT INTO "SEGURO_ASOCIADOS"  
																	( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
														VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,   			:gdt_fec_sistema,  :ldb_monto,   		:gs_user,	0,						0,						'A',						:ls_moneda,	:ls_forma_pago )  
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
															messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
														end if
													end if
												next
											end if
											cb_memo.enabled							= true
											ll_resp										= messagebox("Grabar","Grabación Exitosa, desea Ingresar MEMO",Exclamation!,YesNo!,2)
											if ll_resp=1 then
												cb_memo.triggerevent(clicked!)
											end if
											cb_aceptar.enabled						= false
											cb_rechazar.enabled						= false
											dw_base.enabled							= false
											ddlb_serie.enabled						= false
											em_numero.enabled						= false
											//cb_limpiar.setfocus()
											
										end if
									else
										if ls_base='D' then
											if gs_depto='O' then
												dw_revision.setitem(1,'estado_revision','V')
												dw_revision.accepttext()
												if dw_revision.update()=1 then
													commit;
													messagebox("Grabar","Grabación Exitosa")
													cb_limpiar.setfocus()
												else
													rollback;
													messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
												end if
											end if
										else
											messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###,###") +' No Existe en Control Documentario')
										end if
									end if
								end if
							else
								ll_grabar													= 0
								ll_error													= 0
								dw_revision.setitem(1,'estado_revision','V')
								dw_revision.accepttext()
								if dw_revision.update()=1 then
									ll_grabar ++
									if dw_lista_obs.update()=1 then
										ll_grabar ++
										messagebox("Grabar","Grabación Exitosa")
										cb_aceptar.enabled							= false
										cb_rechazar.enabled							= false
										dw_base.enabled								= false
										ddlb_serie.enabled							= false
										em_numero.enabled							= false
										cb_limpiar.setfocus()
										
									else
//										messagebox("Grabar","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
										ll_error ++
									end if
								else
									messagebox("Grabar","Error Grabar Tabla Revision_Contratos SQL: "+sqlca.sqlerrtext)
									ll_error ++
								end if
								if ll_grabar=2 then
									commit using sqlca;
									UPDATE	"SEGURO_ASOCIADOS"  
									SET 		"ESTADO_SEGURO" = 'I',
												"ESTADO_REG" = 1
									WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										commit;
										ll_tot_reg										= dw_seguro.rowcount()
										for ll_indi=1 to ll_tot_reg
											ll_est_reg									= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
											ll_codigo										= dw_seguro.getitemnumber(ll_indi,'codigo')
											if ls_moneda='1' then
												SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
												INTO 		:ldb_monto  
												FROM 	"TIPO_SEGURO"  
												WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
															"TIPO_SEGURO"."BASE" = :ls_base AND
															"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
												USING	sqlca;
	//											ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
											elseif ls_moneda='2' then
												SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
												INTO 		:ldb_monto  
												FROM 	"TIPO_SEGURO"  
												WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
															"TIPO_SEGURO"."BASE" = :ls_base AND
															"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
												USING	sqlca;
	//											ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
											end if
											if ll_est_reg = 0 then
												SELECT	count("SEGURO_ASOCIADOS"."BASE")
												INTO 		:ll_count  
												FROM 	"SEGURO_ASOCIADOS"  
												WHERE	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
															( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
												USING	sqlca;
												if ll_count > 0 then
													UPDATE	"SEGURO_ASOCIADOS"  
													SET 		"ESTADO_SEGURO" = 'A',
																"ESTADO_REG" = 0,
																"MONTO_PRIMA" = :ldb_monto,
																"MONEDA" = :ls_moneda
													WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
																( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
																( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
																( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
													USING	sqlca;
													if sqlca.sqlcode=0 then
														commit;
													elseif sqlca.sqlcode=100 then
														INSERT INTO "SEGURO_ASOCIADOS"  
																	( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
														VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,   		:gs_user,	0,   					0,						'A',						:ls_moneda,	:ls_forma_pago )  
														USING	sqlca;
														if sqlca.sqlcode=0 then
															commit;
														else
															rollback;
															messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
														end if
													else
														rollback;
														messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
													end if
												else
													INSERT INTO "SEGURO_ASOCIADOS"  
																( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
													VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
														messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
													end if
												end if
	
											end if
										next
									else
										rollback;
										ll_tot_reg												= dw_seguro.rowcount()
										for ll_indi=1 to ll_tot_reg
											ll_est_reg											= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
											ll_codigo												= dw_seguro.getitemnumber(ll_indi,'codigo')
											if ls_moneda='1' then
												SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
												INTO 		:ldb_monto  
												FROM 	"TIPO_SEGURO"  
												WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
															"TIPO_SEGURO"."BASE" = :ls_base AND
															"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
												USING	sqlca;
	//											ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
											elseif ls_moneda='2' then
												SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
												INTO 		:ldb_monto  
												FROM 	"TIPO_SEGURO"  
												WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
															"TIPO_SEGURO"."BASE" = :ls_base AND
															"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
												USING	sqlca;
	//											ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
											end if
											if ll_est_reg = 0 then
												INSERT INTO "SEGURO_ASOCIADOS"  
															( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
												VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,   		:gs_user,   	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
												USING	sqlca;
												if sqlca.sqlcode=0 then
													commit;
												else
													rollback;
													messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
												end if
											end if
										next
									end if
								elseif ll_error>0 then
									rollback using sqlca;
								end if
							end if
						else
							rollback using sqlca;
							messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
						end if
					else
						rollback using sqlca;
						messagebox("Error Grabar","Error Grabar SQL: "+sqlca.sqlerrtext)
					end if	
				else
					ll_grabar													= 0
					ll_error													= 0
					if dw_revision.update()=1 then
						ll_grabar ++
						if dw_lista_obs.update()=1 then
							ll_grabar ++
							messagebox("Grabar Modificaciones","Grabación Exitosa")
							cb_aceptar.enabled							= false
							cb_rechazar.enabled							= false
							dw_base.enabled								= false
							ddlb_serie.enabled							= false
							em_numero.enabled							= false
							cb_limpiar.setfocus()
							
							
						else
//							messagebox("Error Grabar Modificaciones","Error Grabar Tabla Revision_Contratos_Observacion SQL: "+sqlca.sqlerrtext)
							ll_error ++
						end if
					else
						messagebox("Error Grabar Modificaciones","Error Grabar Tabla Revision_Contratos SQL: "+sqlca.sqlerrtext)
						ll_error ++
					end if
					if ll_grabar=2 then
						commit using sqlca;
						UPDATE		"SEGURO_ASOCIADOS"  
						SET 			"ESTADO_SEGURO" = 'I',
										"ESTADO_REG" = 1
						WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
									  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
									  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_tot_reg									= dw_seguro.rowcount()
							for ll_indi=1 to ll_tot_reg
								ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
								ll_codigo									= dw_seguro.getitemnumber(ll_indi,'codigo')
								if ls_moneda='1' then
									SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
									INTO 		:ldb_monto  
									FROM 	"TIPO_SEGURO"  
									WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
												"TIPO_SEGURO"."BASE" = :ls_base AND
												"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
									USING	sqlca;
	//								ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
								elseif ls_moneda='2' then
									SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
									INTO 		:ldb_monto  
									FROM 	"TIPO_SEGURO"  
									WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
												"TIPO_SEGURO"."BASE" = :ls_base AND
												"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
									USING	sqlca;
	//								ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
								end if
								if ll_est_reg = 0 then
									SELECT	count("SEGURO_ASOCIADOS"."BASE")
									INTO 		:ll_count  
									FROM 	"SEGURO_ASOCIADOS"  
									WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
									USING	sqlca;
									if ll_count > 0 then
										UPDATE	"SEGURO_ASOCIADOS"  
										SET 		"ESTADO_SEGURO" = 'A',
													"ESTADO_REG" = 0,
													"MONTO_PRIMA" = :ldb_monto,
													"MONEDA" = :ls_moneda
										WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
													( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
													( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
													( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										elseif sqlca.sqlcode=100 then
											INSERT INTO "SEGURO_ASOCIADOS"  
														( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
											VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,			:gs_user,	0,						0,						'A',						:ls_moneda,	:ls_forma_pago )  
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
												messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
											end if
										else
											rollback;
											messagebox("Error Grabar","Error UPDATE SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
										end if
									else
										INSERT INTO "SEGURO_ASOCIADOS"  
													( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
										VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,  :ldb_monto,   		:gs_user,	0,   					0,   					'A',						:ls_moneda,	:ls_forma_pago )  
										USING	sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
											messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
										end if
									end if
	
								end if
							next
						else
							rollback;
							ll_tot_reg												= dw_seguro.rowcount()
							for ll_indi=1 to ll_tot_reg
								ll_est_reg											= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
								ll_codigo												= dw_seguro.getitemnumber(ll_indi,'codigo')
								if ls_moneda='1' then
									SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PESO"  
									INTO 		:ldb_monto  
									FROM 	"TIPO_SEGURO"  
									WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
												"TIPO_SEGURO"."BASE" = :ls_base AND
												"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
									USING	sqlca;
	//								ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_peso')
								elseif ls_moneda='2' then
									SELECT DISTINCT "TIPO_SEGURO"."FACTOR_PRIMA"  
									INTO 		:ldb_monto  
									FROM 	"TIPO_SEGURO"  
									WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo  AND
												"TIPO_SEGURO"."BASE" = :ls_base AND
												"TIPO_SEGURO"."COD_PARQUE" = :il_cod_parque 
									USING	sqlca;
	//								ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
								end if
								if ll_est_reg = 0 then
									INSERT INTO "SEGURO_ASOCIADOS"  
												( "BASE",		"SERIE",	"NUMERO",	"COD_SEGURO",	"FECHA_CREA",	"MONTO_PRIMA",	"USUARIO",	"ESTADO_REG",	"FOLIO_SEGURO",	"ESTADO_SEGURO",	"MONEDA",	"FORMA_PAGO" )  
									VALUES 	( :ls_base, 	:ls_serie,	:ll_numero,	:ll_codigo,			:gdt_fec_sistema,	:ldb_monto,  		:gs_user,	0,						0,   					'A',						:ls_moneda,	:ls_forma_pago )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
										messagebox("Error Grabar","Error INSERT SEGURO_ASOCIADOS SQL "+sqlca.sqlerrtext)
									end if
								end if
							next
						end if
					elseif ll_error>0 then
						rollback using sqlca;
					end if
				end if
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 3099
integer y = 2488
integer width = 233
integer height = 100
integer taborder = 230
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_ctacte.visible	= false
end event

event clicked;string		ls_base,ls_serie,ls_salir
long		ll_cta,ll_existe_cad,ll_elimina,ll_existe_rev,ll_cod_serv_vta_asoc,ll_cod_serv
Double	ll_numero

ls_salir			= 'S'
if dw_revision.dataobject	= 'dw_revision_contratos_producto' then
	ls_base		= dw_base.getitemstring(1,'base')
	ls_serie		= trim(ddlb_serie.text)
	ll_numero	= Double(em_numero.text)		
	ll_cod_serv	= dw_revision.getitemnumber(1,'codigo_servicio')
	SELECT 	COUNT("REVISION_CONTRATOS"."BASE")  
	INTO 		:ll_cta  
	FROM 	"REVISION_CONTRATOS"  
	WHERE	( "REVISION_CONTRATOS"."BASE" = :ls_base) AND  
				( "REVISION_CONTRATOS"."SERIE" = :ls_serie ) AND  
				( "REVISION_CONTRATOS"."NUMERO" = :ll_numero )
	USING	sqlca;
	if isnull(ll_cta) or ll_cta=0 then ll_cta=0
	if ll_cta=0 then
		DELETE FROM "PRODUCTO_VENTA_ASOCIADA"  
		WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' OR "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R')
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
//			UPDATE	"CD_FOLIO"  
//			SET 		"ULT_ESTADO" = 3  
//			WHERE	( "CD_FOLIO"."BASE" = :ls_base ) AND  
//						( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
//						( "CD_FOLIO"."NUMERO" = :ll_numero )
//			USING	sqlca;
//			if sqlca.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
		else
			rollback;
		end if
	else
		SELECT DISTINCT "PRODUCTO_VENTA_ASOCIADA"."COD_SERVICIO"  
		INTO 		:ll_cod_serv_vta_asoc  
		FROM 	"PRODUCTO_VENTA_ASOCIADA"  
		WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :ls_base ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :ls_serie ) AND  
					( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :ll_numero )   ;
		if isnull(ll_cod_serv_vta_asoc) then ll_cod_serv_vta_asoc=0
		if ll_cod_serv <> ll_cod_serv_vta_asoc then
			messagebox("Advertencia","Debe Grabar Cambios")
			ls_salir		= 'N'
		end if
	end if
end if
//if ls_base = 'F' or ls_base='G' or ls_base='V' then
//	SELECT	COUNT("CADENA"."CODIGO")
//	INTO		:ll_existe_cad
//	FROM		"CADENA"
//	WHERE	"CADENA"."CODIGO" = :gs_base AND
//				"CADENA"."SERIE" = :gs_serie AND
//				"CADENA"."NUMERO" = :gi_numero
//	USING	sqlca;
//	if isnull(ll_existe_cad) then ll_existe_cad=0
//	
//	if ll_existe_cad=0 then
//		SELECT	COUNT("REVISION_CONTRATOS"."BASE")
//		INTO		:ll_existe_rev
//		FROM		"REVISION_CONTRATOS"
//		WHERE	"REVISION_CONTRATOS"."BASE" = :gs_base AND
//					"REVISION_CONTRATOS"."SERIE" = :gs_serie AND
//					"REVISION_CONTRATOS"."NUMERO" = :gi_numero
//		USING	sqlca;
//		if isnull(ll_existe_rev) then ll_existe_rev=0
//		if ll_existe_rev=0 then	
//			ll_elimina														= f_eliminar_funeraria(gs_base,gs_serie,gi_numero)
//		end if
//	end if
//	if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
//end if
if ls_salir='S' then close(w_validar_promesa_operaciones)


end event

type dw_ctto_asoc from datawindow within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1964
integer width = 1687
integer height = 480
integer taborder = 90
string dataobject = "dw_buscar_contratos_asoc_rut"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
end type

event ue_mousemove;if dw_ctto_asoc.rowcount()>0 then st_ctacte.visible = true
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg									= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima					= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso						= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma							= ldb_suma + ldb_factor_prima
				ll_suma_peso						= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf										= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda								= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma							= ll_suma_peso
			end if
			if is_limpiar='S' then
				dw_revision.setitem(1,'c_total_cuota',ldb_suma)
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if*/
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 										= dw_ctto_asoc.GetItemString(row, "cadena_codigo")
	gs_serie 										= dw_ctto_asoc.GetItemString(row, "cadena_serie")
	gi_numero 									= dw_ctto_asoc.GetItemNumber(row, "cadena_numero")
	gi_rut 										= dw_ctto_asoc.GetItemNumber(row, "cadena_rut")
	gs_apellido_paterno						= dw_ctto_asoc.GetItemString(row, "cliente_a_paterno")
	gs_apellido_materno						= dw_ctto_asoc.GetItemString(row, "cliente_a_materno")
	gs_nombres									= dw_ctto_asoc.GetItemString(row, "cliente_nombre")
	gs_dv											= dw_ctto_asoc.GetItemString(row, "cliente_dv")
	gs_estado									= dw_ctto_asoc.GetItemString(row, "cadena_estado")
	gl_cod_parque_cta						= dw_ctto_asoc.GetItemNumber(row, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O","U" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
		END CHOOSE
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_2 from groupbox within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 27
integer y = 1912
integer width = 1719
integer height = 556
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Lista Contratos Asociados"
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg						= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma			= ldb_suma + ldb_factor_prima
				ll_suma_peso		= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda				= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma			= ll_suma_peso
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if*/
end event

type gb_3 from groupbox within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 1751
integer y = 1912
integer width = 1582
integer height = 556
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Lista de Pagos (Rezago Marcados en Rojo)"
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg						= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma			= ldb_suma + ldb_factor_prima
				ll_suma_peso		= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda				= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma			= ll_suma_peso
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if*/
end event

type dw_lista_obs from datawindow within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2318
integer y = 432
integer width = 992
integer height = 616
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_observaciones_revision_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_codigo
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
st_gestion_serv.visible						= false
/*if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg					= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			ll_codigo					= dw_seguro.getitemnumber(ll_indi,'codigo')
			if ll_est_reg = 0 then
				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				if ll_codigo = 8 then
					ldb_factor_prima = 0.0
				end if
				ldb_suma			= ldb_suma + ldb_factor_prima
				ll_suma_peso		= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf			= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda	= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma	= ll_suma_peso
			end if
			dw_revision.setitem(1,'c_total_cuota',ldb_suma)
		end if
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if */
end event

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

type dw_seguro from datawindow within w_validar_promesa_operaciones
event ue_mousemove pbm_mousemove
integer x = 2327
integer y = 1116
integer width = 974
integer height = 320
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_lista_seguro_seleccion_ctto"
boolean vscrollbar = true
boolean border = false
end type

event ue_mousemove;Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
Long		ll_fila,ll_estado,ll_existe,ll_cod_reg

dw_seguro.accepttext()
st_gestion_serv.visible		= false
il_numero						= Double(em_numero.text)
if il_numero > 0 and il_cod_seguro > 0 then		// 
	ll_tot_reg					= dw_seguro.rowcount()
	ll_fila							= dw_seguro.getrow()
	if ll_fila > 0 then
		ll_estado					= il_estado		//dw_seguro.getitemnumber(ll_fila,'c_estado_reg')
		if is_error_cod = 'S' then	// ll_estado = 0 
			ll_codigo				= il_cod_seguro
			if ll_codigo=10 then
				ll_existe			= dw_seguro.find('(codigo=11 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=10 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=11 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=11 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=12 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=11) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=12 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
end event

event clicked;Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg						= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma			= ldb_suma + ldb_factor_prima
				ll_suma_peso		= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda				= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma			= ll_suma_peso
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if



//Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
//Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo_iva
//String		ls_columna,ls_moneda
//
//dw_seguro.accepttext()
//dw_revision.accepttext()
//if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
//	ll_tot_reg						= dw_seguro.rowcount()
//	if ll_tot_reg > 0 then
//		ll_edad						= dw_revision.getitemnumber(1,'edad')
//		for ll_indi=1 to ll_tot_reg
//			if ll_edad > 0 then
//				dw_seguro.setitem(ll_indi,'edad',ll_edad)
//			end if	
//			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
//			ll_codigo_iva			= dw_seguro.getitemnumber(ll_indi,'codigo')
//			if ll_est_reg = 0 then
//				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
//				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
//				if ll_codigo_iva = 8 then
//					ldb_factor_prima = 0.0
//				end if
//				ldb_suma			= ldb_suma + ldb_factor_prima
//				ll_suma_peso		= ll_suma_peso + ll_prima_peso
//			end if
//		next
//		if isnull(ldb_suma) then ldb_suma=0
//		if ldb_suma > 0 then
//			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
//			ls_moneda				= dw_revision.getitemstring(1,'moneda')
//			if ls_moneda='1' then
//				ldb_suma			= ll_suma_peso
//			end if
//		end if
//		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
//	else
//		dw_revision.setitem(1,'c_total_cuota',0)	
//	end if	
//dw_seguro.accepttext()
//dw_revision.accepttext()
//end if
end event

event itemchanged;Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_fila
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()
if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ll_tot_reg						= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			if ll_est_reg = 0 then
				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				ldb_suma			= ldb_suma + ldb_factor_prima
				ll_suma_peso		= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda				= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma			= ll_suma_peso
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
	dw_seguro.accepttext()
	dw_revision.accepttext()
end if
String		ls_forma_pago
Long		ll_estado,ll_codigo,ll_existe


dw_seguro.accepttext()
ls_columna					= dwo.name
if ls_columna='c_estado_reg' or  ls_columna<>'c_estado_reg' then
	ll_fila						= dw_seguro.getrow()
	if ll_fila > 0 then
		ll_estado				= Long(data)
		il_estado				= ll_estado
		if ll_estado = 0 then
			ll_codigo			= dw_seguro.getitemnumber(ll_fila,'codigo')
			il_cod_seguro	= ll_codigo
			if ll_codigo=10 then
				ll_existe	= dw_seguro.find('(codigo=11 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
				if ll_existe > 0 then
					messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.event ue_validar_codigo()
					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
					dw_seguro.accepttext()
					dw_seguro.setcolumn('factor_prima')
					is_error_cod	= 'S'
				end if
			elseif ll_codigo=11 then
				ll_existe		= dw_seguro.find('(codigo=10 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
				if ll_existe > 0 then
					messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.event ue_validar_codigo()
					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
					dw_seguro.accepttext()
					dw_seguro.setcolumn('factor_prima')
					is_error_cod	= 'S'
				end if
			elseif ll_codigo=12 then
				ll_existe		= dw_seguro.find('(codigo=10 or codigo=11) and c_estado_reg=0',1,dw_seguro.rowcount())
				if ll_existe > 0 then
					messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.event ue_validar_codigo()
					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
					dw_seguro.accepttext()
					dw_seguro.setcolumn('factor_prima')
					is_error_cod	= 'S'
				end if
			else
				is_error_cod		= 'N'
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
//
//Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
//Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo_iva
//String		ls_columna,ls_moneda
//
//dw_seguro.accepttext()
//dw_revision.accepttext()
//if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
//	ll_tot_reg						= dw_seguro.rowcount()
//	if ll_tot_reg > 0 then
//		ll_edad						= dw_revision.getitemnumber(1,'edad')
//		for ll_indi=1 to ll_tot_reg
//			if ll_edad > 0 then
//				dw_seguro.setitem(ll_indi,'edad',ll_edad)
//			end if	
//			ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
//			ll_codigo_iva			= dw_seguro.getitemnumber(ll_indi,'codigo')
//			if ll_est_reg = 0 then
//				ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
//				ll_prima_peso		= dw_seguro.getitemnumber(ll_indi,'factor_peso')
//				if ll_codigo_iva = 8 then
//					ldb_factor_prima = 0.0
//				end if
//				ldb_suma			= ldb_suma + ldb_factor_prima
//				ll_suma_peso		= ll_suma_peso + ll_prima_peso
//			end if
//		next
//		if isnull(ldb_suma) then ldb_suma=0
//		if ldb_suma > 0 then
//			lld_uf						= dw_revision.getitemnumber(1,'uf_fecha_ctto')
//			ls_moneda				= dw_revision.getitemstring(1,'moneda')
//			if ls_moneda='1' then
//				ldb_suma			= ll_suma_peso
//			end if
//		end if
//		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
//	else
//		dw_revision.setitem(1,'c_total_cuota',0)	
//	end if	
//dw_seguro.accepttext()
//dw_revision.accepttext()
//end if
//
end event

event itemfocuschanged;Long		ll_fila,ll_estado,ll_codigo,ll_existe,ll_tot_reg,ll_indi,ll_cod_reg

dw_seguro.accepttext()
il_numero						= Double(em_numero.text)
if il_numero > 0 and il_cod_seguro > 0 then		// 
	ll_tot_reg					= dw_seguro.rowcount()
	ll_fila							= dw_seguro.getrow()
	if ll_fila > 0 then
		ll_estado					= il_estado		//dw_seguro.getitemnumber(ll_fila,'c_estado_reg')
		if is_error_cod = 'S' then	// ll_estado = 0 
			ll_codigo				= il_cod_seguro
			if ll_codigo=10 then
				ll_existe			= dw_seguro.find('(codigo=11 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=10 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=11 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=12) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=11 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			elseif ll_codigo=12 then
				ll_existe	= dw_seguro.find('(codigo=10 or codigo=11) and c_estado_reg=0',1,ll_tot_reg)
				if ll_existe > 0 then
					for ll_indi=1 to ll_tot_reg
						if ll_codigo=12 then
							ll_cod_reg	= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ll_cod_reg = ll_codigo then
								dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							end if
						end if
					next
	//				messagebox("Advertencia","Solo puede Seleccionar Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
//					dw_seguro.setitem(ll_fila,'c_estado_reg',1)
//					dw_seguro.setcolumn('codigo')
					dw_seguro.accepttext()
					il_estado		= 1
//					dw_oferta_v.setfocus()
				end if
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
end event

type dw_revision from datawindow within w_validar_promesa_operaciones
event ue_mousemove pbm_dwnmousemove
event ue_mousemove2 pbm_dwnmousemove
integer x = 59
integer y = 144
integer width = 3305
integer height = 1752
integer taborder = 60
string title = "none"
string dataobject = "dw_revision_contratos_promesa"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_ctacte.visible	= false
Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_codigo_iva
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_revision.accepttext()

if dw_revision.dataobject <> 'dwe_mensaje_no_listo' then
	ls_columna											= dwo.name
	if ls_columna='t_tipo_servicio' then
		st_ver_tipo_servicio.visible					= true
	else
		st_ver_tipo_servicio.visible					= false
	end if
	if ls_columna='precio_venta' then
		st_precio_vta.visible							= true
	else
		st_precio_vta.visible							= false
	end if
	if ls_columna='sw_activa_servicio_1' or ls_columna='p_5' then
		st_gestion_serv.visible						= true
	else
		st_gestion_serv.visible						= false
	end if
	ll_tot_reg											= dw_seguro.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_est_reg									= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
			ll_codigo_iva								= dw_seguro.getitemnumber(ll_indi,'codigo')
			if ll_est_reg = 0 then
				ldb_factor_prima						= dw_seguro.getitemnumber(ll_indi,'factor_prima')
				ll_prima_peso							= dw_seguro.getitemnumber(ll_indi,'factor_peso')
				if ll_codigo_iva = 8 then
					ldb_factor_prima = 0.0
				end if
				ldb_suma								= ldb_suma + ldb_factor_prima
				ll_suma_peso							= ll_suma_peso + ll_prima_peso
			end if
		next
		if isnull(ldb_suma) then ldb_suma=0
		if ldb_suma > 0 then
			lld_uf											= dw_revision.getitemnumber(1,'uf_fecha_ctto')
			ls_moneda									= dw_revision.getitemstring(1,'moneda')
			if ls_moneda='1' then
				ldb_suma								= ll_suma_peso
			end if
		end if
		dw_revision.setitem(1,'c_total_cuota',ldb_suma)
	else
		dw_revision.setitem(1,'c_total_cuota',0)
	end if
end if
dw_seguro.accepttext()
dw_revision.accepttext()
end event

event itemchanged;String		ls_base,ls_columna,ls_moneda,ls_area,ls_uso,ls_tipo_sepultura,ls_string,ls_tipo_construc,ls_serie,ls_sw_pie,ls_estado_sep,ls_falta,ls_base_asoc,ls_serie_asoc,ls_nulo,ls_tipo_cons,ls_tipo_sepult_asoc,&
			ls_tipo_const_asoc,ls_anexo_lib,ls_pasa,ls_benef_ok,	ls_area_asoc,ls_sector_asoc,ls_area_asoc_plani,ls_anexo_aumento,ls_forma_pago,ls_estado_venta,ls_tipo_infor,ls_obs,ls_descrip_parque,&
			ls_descrip_moneda,ls_descrip_base,ls_origen_venta
Double	lld_pie,lld_gasto_adm,lld_precio,lld_derecho,lld_cta_mant,lld_saldo_finan,lld_valor_cta,lld_uf,lld_precio_contrato,ldb_valor_mant,ldb_uf,ldb_precio,ldb_derecho,ldb_cuota_mant,ldb_liberador,ldb_pie_minimo,&
			ldb_precio_ctto_aux,lld_gasto_uf,ld_calculo,ldb_descto_liber,ldb_precio_liber,ldb_precio_vta,ll_numero,ll_numero_asoc,ldb_new_precio,ldb_porce_pie,lld_pie_iva,ldb_pie_min,ldb_precio_lista,ldb_derecho_esp,&
			ldb_uf_dia,ldb_valor_cuota_rev
Long		ll_capacidad,ll_new,ll_rut,ll_cap_asoc,ll_cod_parque_asoc,ll_reduccion,ll_tipo_servicio,ll_tipo_benef,ll_activa,ll_cta,ll_fila,ll_annos_liber,ll_capac_new,ll_capac,ll_tot_reg,ll_indi,ll_existe_precio,ll_resuelto,ll_cod_obs,&
			ll_plazo,ll_plazo_max,ll_nulo,ll_tipo_producto,ll_codigo_iva,ll_edad,ll_count_serv,ll_resp_benef,ll_cod_serv
date		ld_fecha_ctto,ldt_nulo,ld_fecha_nac

ll_tot_reg														= dw_seguro.rowcount()
dw_seguro.accepttext()
ls_pasa															= 'S'
select sysdate into :gdt_fec_sistema from dual;
setnull(ll_nulo);setnull(ldt_nulo)
dw_base.accepttext()
dw_revision.accepttext()
Setnull(ls_nulo)
ls_columna														= dwo.name
ls_base															= dw_base.getitemstring(1,'base')
SELECT 	"TIPO_CONTRATO"."DESCRIPCION"  
INTO 		:ls_descrip_base  
FROM 	"TIPO_CONTRATO"  
WHERE 	"TIPO_CONTRATO"."CODIGO" = :ls_base   ;
ls_serie															= trim(ddlb_serie.text)
ll_numero														= Double(em_numero.text)
ll_rut																= long(em_rut.text)
SELECT 	"COD_PARQ"."NOMBRE"  
INTO 		:ls_descrip_parque  
FROM 	"COD_PARQ"  
WHERE 	"COD_PARQ"."CODIGO" = :il_cod_parque   ;

//dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
//idw_detalle12.settransobject(sqlca)
//if idw_detalle12.retrieve('M')=0 then
//	idw_detalle12.reset()
//	idw_detalle12.insertrow(0)
//end if

if dw_revision.dataobject='dw_revision_contratos_promesa' and (ls_columna='fecha_ctto' or ls_columna='moneda' or ls_columna='forma_pago' or ls_columna='area' or ls_columna='tipo_sepult' or &
	ls_columna='capacidad' or ls_columna='uso' or ls_columna='tipo_producto' or ls_columna='plazo' or ls_columna='fecha_prim' or ls_columna='precio_contrato' or ls_columna='pie' ) then
	il_modif ++
	lld_pie														= double(dw_revision.getitemnumber(1,'pie'))
	ll_plazo														= dw_revision.getitemnumber(1,'plazo')
	ll_tipo_producto											= dw_revision.getitemnumber(1,'tipo_producto')
	ls_moneda													= dw_revision.getitemstring(1,'moneda')
	
	if idb_valor_cuota_calc <> lld_pie and ls_columna='plazo' then	//lld_pie > 0 and 
		dw_revision.setitem(1,'pie',0)
		dw_revision.accepttext()
	elseif idb_valor_cuota_calc = lld_pie and (ls_columna = 'plazo' or ls_columna='pie') and ll_tipo_producto = 15 and ll_plazo > 0 then
		il_plazo_mod ++
		if il_plazo_mod < 2 then il_plazo = ll_plazo
		is_mod_precio											= 'N'
		if ll_plazo <> (il_plazo - 1) and ll_plazo <> il_plazo then
			is_mod_precio										= 'S'
			il_plazo_mod										= 0
			il_plazo 												= ll_plazo
			dw_revision.setitem(1,'pie',0)
			dw_revision.accepttext()
		end if
	else
		is_mod_precio											= 'S'
	end if
end if
if ls_columna='fecha_nac' or ls_columna='fecha_ctto' then
	if ls_columna='fecha_nac' then
		ld_fecha_nac											= date(dw_revision.getitemdatetime(1,'fecha_nac'))		//date(data)
	elseif ls_columna='fecha_ctto' then
		ld_fecha_ctto											= date(dw_revision.getitemdatetime(1,'fecha_ctto'))		//date(data)
	end if
	if not isnull(ld_fecha_nac) and not isnull(ld_fecha_ctto) and year(ld_fecha_nac) > 1901  then
		ll_edad														= f_edad(ld_fecha_ctto,ld_fecha_nac)
		dw_revision.setitem(1,'edad',ll_edad)
	else
		ls_pasa													= 'N'
	end if
	dw_revision.accepttext()
end if
if ls_columna='fecha_ctto' and dw_revision.dataobject='dw_revision_contratos_liberador' then
	ld_fecha_ctto												= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
	if date(ld_fecha_ctto) >= date('20/02/2023') then
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ll_codigo_iva = dw_seguro.getitemnumber(ll_indi,'codigo')
				dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				if ll_codigo_iva = 8 and ld_fecha_ctto >= date('20/02/2023') then
					dw_seguro.setitem(ll_indi,'c_estado_reg',0)
				end if
			next
			dw_seguro.accepttext()
		end if
	else
		for ll_indi=1 to ll_tot_reg
			dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		next
	end if
	dw_revision.accepttext( )
end if

dw_revision.accepttext()
if ls_columna='nueva_capac' then
	ll_capac_new												= dw_revision.getitemnumber(1,'nueva_capac')
	if not isnull(ll_capac_new) and ll_capac_new>0 then
		if ll_capac_new>=5 then
			messagebox("Advertencia","Nueva Capacidad No Puede Ser Mayor o Igual a 5")
			dw_revision.setfocus()
			dw_revision.setcolumn('nueva_capac')
			dw_revision.accepttext()
			ls_pasa												= 'N'
		else
			ls_pasa												= 'S'
		end if
		ll_capac													= dw_revision.getitemnumber(1,'capacidad')
		ls_uso													= dw_revision.getitemstring(1,'uso')
		
		if not isnull(il_cod_parque) and il_cod_parque>0 and not isnull(ll_capac) and ll_capac>0 and not isnull(ls_uso) and ls_uso<>'' then
			SELECT COUNT("LISTA_PRECIO_AUMENTO"."CAPAC_ACTUAL")
			INTO		:ll_existe_precio
			FROM 	"LISTA_PRECIO_AUMENTO"  
			WHERE	"LISTA_PRECIO_AUMENTO"."CAPAC_ACTUAL" = :ll_capac AND  
						"LISTA_PRECIO_AUMENTO"."CAPAC_NEW" = :ll_capac_new AND  
						"LISTA_PRECIO_AUMENTO"."COD_PARQUE" = :il_cod_parque AND  
						"LISTA_PRECIO_AUMENTO"."ESTADO" = 'V'
			USING	sqlca;
			if isnull(ll_existe_precio) then ll_existe_precio=0 
			if ll_existe_precio=0 then
				messagebox("Advertencia","No Existe Precio Para Nueva Capacidad, Parque y Capacidad Original Seleccionada")
				dw_revision.setfocus()
				dw_revision.setcolumn('nueva_capac')
				dw_revision.accepttext()
				ls_pasa												= 'N'
			else
				ls_pasa												= 'S'
			end if
		else
			ls_pasa													= 'S' 
		end if
	else
		ls_pasa														= 'N'
	end if
end if
if ls_pasa='S' then
	if ls_columna='precio_contrato' then
		if is_sw_pasa='S' then is_sw_pasa='N'
		is_new_precio												= 'S'
	elseif ls_columna='base_asoc' then
		ls_base_asoc												= dw_revision.getitemstring(1,'base_asoc')
		if not isnull(ls_base_asoc) and ls_base_asoc<>'' then
			dw_revision.getchild('serie',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base_asoc)
		end if
	elseif ls_columna='serie_asoc' or ls_columna='numero_asoc' then
		ls_base_asoc												= dw_revision.getitemstring(1,'base_asoc')
		ls_serie_asoc												= dw_revision.getitemstring(1,'serie_asoc')
		ll_numero_asoc											= dw_revision.getitemnumber(1,'numero_asoc')
		if ls_base_asoc<>'' and not isnull(ls_base_asoc) and ls_serie_asoc<>'' and &
			not isnull(ls_serie_asoc) and ll_numero_asoc>0 then
			ls_estado_sep											= wf_capacidad_total(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)		
				if ls_estado_sep= 'OCUP' then
					ls_uso										= 'NI'
					messagebox("Advertencia","Capacidad Total Sepultura Ocupada")
					dw_revision.setitem(1,'uso',ls_uso)
					dw_revision.accepttext()
					dw_revision.object.uso.protect			= 1
				else
					dw_revision.object.uso.protect			= 0
				end if
			
			ldb_valor_mant											= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
			dw_revision.setitem(1,'periodo_mant',il_periodo_mant)
			CHOOSE CASE ls_base_asoc
				CASE 'O','U'
					SELECT	"OFERTA_V"."TIPO_SEPULT",	"OFERTA_V"."TIPO_CONS",	"OFERTA_V"."ANEXO_LIB",	"PAGO_OFERTA"."CAPACIDAD",	"PAGO_OFERTA"."AREA",	"PAGO_OFERTA"."SECTOR",	"CADENA"."COD_PARQUE",	"OFERTA_V"."ANEXO_AUMENTO"
					INTO 		:ls_tipo_sepult_asoc,				:ls_tipo_const_asoc,			:ls_anexo_lib,					:ll_cap_asoc,							:ls_area_asoc,					:ls_sector_asoc,					:ll_cod_parque_asoc,			:ls_anexo_aumento
					FROM 	"CADENA","OFERTA_V","PAGO_OFERTA"  
					WHERE	( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								(("CADENA"."CODIGO" = :ls_base_asoc ) AND  
								( "CADENA"."SERIE" = :ls_serie_asoc ) AND  
								( "CADENA"."NUMERO" = :ll_numero_asoc ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_base='L' then
							if not isnull(ls_anexo_lib) or ls_anexo_lib<>'' then
								messagebox("Advertencia","Promesa Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', ya Tiene Anexo Liberador Asociado Nº'+ls_anexo_lib)
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							else
								if ls_tipo_sepult_asoc='1' then
									ls_tipo_cons						= 'T'
								else
									ls_tipo_cons	= 'C'
								end if
								SELECT	"AREA",					"CAPACIDAD"
								INTO 		:ls_area_asoc_plani,	:ll_cap_asoc
								FROM 	"BASE_PLANI"  
								WHERE	( "BASE_PLANI"."SECTOR" = :ls_sector_asoc ) AND  
											( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque_asoc )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_revision.setitem(1,'area',ls_area_asoc_plani)
								else
									dw_revision.setitem(1,'area',ls_area_asoc)
								end if
								dw_revision.setitem(1,'tipo_sepult',ls_tipo_sepult_asoc)
								dw_revision.setitem(1,'cod_parque',ll_cod_parque_asoc)
								dw_revision.setitem(1,'capacidad',ll_cap_asoc)
								dw_revision.accepttext()
							end if
						elseif ls_base='D' then
							if not isnull(ls_anexo_aumento) or ls_anexo_aumento<>'' then
								messagebox("Advertencia","Promesa Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', ya Tiene Derecho Especial Asociado Nº'+ls_anexo_aumento)
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							else
								if ls_tipo_sepult_asoc='1' then
									ls_tipo_cons						= 'T'
								else
									ls_tipo_cons						= 'C'
								end if
								SELECT	"AREA",					"CAPACIDAD"
								INTO 		:ls_area_asoc_plani,	:ll_cap_asoc
								FROM 	"BASE_PLANI"  
								WHERE	( "BASE_PLANI"."SECTOR" = :ls_sector_asoc ) AND  
											( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque_asoc )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_revision.setitem(1,'area',ls_area_asoc_plani)
								else
									dw_revision.setitem(1,'area',ls_area_asoc)
								end if
								dw_revision.setitem(1,'tipo_sepult',ls_tipo_sepult_asoc)
								dw_revision.setitem(1,'cod_parque',ll_cod_parque_asoc)
								dw_revision.setitem(1,'capacidad',ll_cap_asoc)
								dw_revision.accepttext()
							end if
						elseif ls_base='A' then
							if not isnull(ls_anexo_aumento) or ls_anexo_aumento<>'' then
								messagebox("Advertencia","Promesa Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', ya Tiene Anexo Aumento Capacidad Asociado Nº'+ls_anexo_aumento)
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							elseif ll_cap_asoc>=4 then
								messagebox("Advertencia","Promesa Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', Capacidad No Permite Generar "Ventas Aumento Capacidad"')
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							else
								if ls_tipo_sepult_asoc='1' then
									ls_tipo_cons						= 'T'
								else
									ls_tipo_cons						= 'C'
								end if
								SELECT	"AREA",					"CAPACIDAD"
								INTO 		:ls_area_asoc_plani,	:ll_capac
								FROM 	"BASE_PLANI"  
								WHERE	( "BASE_PLANI"."SECTOR" = :ls_sector_asoc ) AND  
											( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque_asoc )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_revision.setitem(1,'area',ls_area_asoc_plani)
								else
									dw_revision.setitem(1,'area',ls_area_asoc)
								end if
								dw_revision.setitem(1,'tipo_sepult',ls_tipo_sepult_asoc)
								dw_revision.setitem(1,'cod_parque',ll_cod_parque_asoc)
								dw_revision.setitem(1,'capacidad',ll_cap_asoc)
								dw_revision.accepttext()
							end if
						elseif ls_base='P' then
							if ls_tipo_sepult_asoc='1' then
								ls_tipo_cons									= 'T'
							else
								ls_tipo_cons									= 'C'
							end if
							SELECT	"AREA",					"CAPACIDAD"
							INTO 		:ls_area_asoc_plani,	:ll_cap_asoc
							FROM 	"BASE_PLANI"  
							WHERE	( "BASE_PLANI"."SECTOR" = :ls_sector_asoc ) AND  
										( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque_asoc )   
							USING	sqlca;
							if sqlca.sqlcode=0 then
								dw_revision.setitem(1,'area',ls_area_asoc_plani)
							else
								dw_revision.setitem(1,'area',ls_area_asoc)
							end if
							dw_revision.setitem(1,'tipo_sepult',ls_tipo_sepult_asoc)
							dw_revision.setitem(1,'cod_parque',ll_cod_parque_asoc)
							dw_revision.setitem(1,'capacidad',ll_cap_asoc)
							dw_revision.accepttext()
						end if
					else
						messagebox("Advertencia","Promesa Asociada Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+' No Existe')
						dw_revision.setitem(1,'base_asoc',ls_nulo)
						dw_revision.setitem(1,'serie_asoc',ls_nulo)
						dw_revision.setitem(1,'numero_asoc',0)
						is_limpiar							= 'S'
						wf_limpiar_detalle()
						dw_revision.accepttext()
					end if
				CASE 'C'
					SELECT	"CADENA"."COD_PARQUE",	"CONTRATO"."ZONA",	"CONTRATO"."CAPACIDAD",	"CONTRATO"."ANEXO_LIB",	"CONTRATO"."SECTOR",	"CONTRATO"."ANEXO_AUMENTO" 
					INTO 		:ll_cod_parque_asoc,		:ls_area_asoc,			:ll_cap_asoc,				:ls_anexo_lib,				:ls_sector_asoc,		:ls_anexo_aumento
					FROM 		"CADENA",   
								"CONTRATO"  
					WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							 (("CADENA"."CODIGO" = :ls_base_asoc ) AND  
							 ( "CADENA"."SERIE" = :ls_serie_asoc ) AND  
							 ( "CADENA"."NUMERO" = :ll_numero_asoc ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_base='L' then
							if not isnull(ls_anexo_lib) or ls_anexo_lib<>'' then
								messagebox("Advertencia","Contrato IsaCruz Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', ya Tiene Anexo Liberador Asociado Nº'+ls_anexo_lib)
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							else
								SELECT	"AREA",					"CAPACIDAD"
								INTO 		:ls_area_asoc_plani,	:ll_cap_asoc
								FROM		"BASE_PLANI"  
								WHERE	( "BASE_PLANI"."SECTOR" = :ls_sector_asoc ) AND  
											( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque_asoc )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_revision.setitem(1,'area',ls_area_asoc_plani)
								else
									dw_revision.setitem(1,'area',ls_area_asoc)
								end if
								dw_revision.setitem(1,'tipo_sepult','1')
								dw_revision.setitem(1,'cod_parque',ll_cod_parque_asoc)
								dw_revision.setitem(1,'capacidad',ll_cap_asoc)
								dw_revision.accepttext()
							end if
						elseif ls_base='A' then
							if not isnull(ls_anexo_aumento) or ls_anexo_aumento<>'' then
								messagebox("Advertencia","Contrato IsaCruz Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', ya Tiene Anexo Aumento Capacidad Asociado Nº'+ls_anexo_aumento)
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							elseif ll_cap_asoc>=4 then
								messagebox("Advertencia","Contrato IsaCruz Nº  "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', Capacidad No Permite Generar "Ventas Aumento Capacidad"')
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							elseif ll_cap_asoc<=1 then
								messagebox("Advertencia","Contrato IsaCruz Nº  "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+', Capacidad No Permite Generar "Ventas Aumento Capacidad"')
								dw_revision.setitem(1,'base_asoc',ls_nulo)
								dw_revision.setitem(1,'serie_asoc',ls_nulo)
								dw_revision.setitem(1,'numero_asoc',0)
								is_limpiar							= 'S'
								wf_limpiar_detalle()
								dw_revision.accepttext()
							else
								SELECT	"AREA",					"CAPACIDAD"
								INTO 		:ls_area_asoc_plani,	:ll_capac
								FROM 	"BASE_PLANI"  
								WHERE	( "BASE_PLANI"."SECTOR" = :ls_sector_asoc ) AND  
											( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque_asoc )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_revision.setitem(1,'area',ls_area_asoc_plani)
								else
									dw_revision.setitem(1,'area',ls_area_asoc)
								end if
								dw_revision.setitem(1,'tipo_sepult','1')
								dw_revision.setitem(1,'cod_parque',ll_cod_parque_asoc)
								dw_revision.setitem(1,'capacidad',ll_cap_asoc)
								dw_revision.accepttext()
							end if
						end if
					else
						messagebox("Advertencia","Contrato IsaCruz Asociada Nº "+ls_base_asoc+'-'+ls_serie_asoc+'-'+string(ll_numero_asoc,"###,###,###,###,###")+' No Existe')
						dw_revision.setitem(1,'base_asoc',ls_nulo)
						dw_revision.setitem(1,'serie_asoc',ls_nulo)
						dw_revision.setitem(1,'numero_asoc',0)
						is_limpiar							= 'S'
						wf_limpiar_detalle()
						dw_revision.accepttext()	
					end if
					if not isnull(il_cod_parque) and il_cod_parque>0 then
						if il_cod_parque<>ll_cod_parque_asoc then
							messagebox("Advertencia","Parque Seleccionado No Corresponde Al Parque Contrato Asociado")
							dw_revision.setitem(1,'base_asoc',ls_nulo)
							dw_revision.setitem(1,'serie_asoc',ls_nulo)
							dw_revision.setitem(1,'numero_asoc',0)
							is_limpiar							= 'S'
							wf_limpiar_detalle()
							dw_revision.accepttext()	
						end if
					end if
			END CHOOSE
			dw_revision.settransobject(sqlca)
			if ls_base<>'F' and ls_base<>'G' and ls_base<>'V' then
				dw_revision.getchild('area',idw_detalle2)
				idw_detalle2.settransobject(sqlca)
				if ls_base='U' then dw_revision.setitem(1,'tipo_sepult','8')
				if gs_cod_prod='CO' or gs_cod_prod='SE' then
					if idw_detalle2.retrieve(ll_cod_parque_asoc, gs_cod_prod)=0 then
						idw_detalle2.insertrow(0)
					end if
					if idw_detalle4.retrieve( gs_cod_prod)=0 then
						idw_detalle4.insertrow(0)
					end if
				else
					if idw_detalle2.retrieve(ll_cod_parque_asoc)=0 then
						idw_detalle2.insertrow(0)
					end if
				end if
			else
				dw_revision.getchild('codigo_servicio',idw_detalle3)
				idw_detalle3.settransobject(sqlca)
				ls_moneda													= dw_revision.getitemstring(1,'moneda')
				if dw_revision.dataobject='dw_revision_contratos_producto' then
					if ls_moneda='1' then
						ls_descrip_moneda									= 'Peso'
					elseif ls_moneda='2' then
						ls_descrip_moneda									= 'UF'
					end if
					if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,ls_moneda)=0 then
						idw_detalle3.insertrow(0)
						if not isnull(il_cod_parque) and not isnull(ls_uso) and not isnull(ls_serie) and not isnull(ls_moneda) then
							messagebox("Advertencia","No Existen Servicios Definido con Parque: "+string(il_cod_parque)+"-"+ls_descrip_parque+ ", Uso: "+ls_uso+ ", Contrato: "+ls_base+"-"+ls_descrip_base+" y Moneda: "+ls_moneda+"-"+ls_descrip_moneda )
						end if
					end if
				else
					if idw_detalle3.retrieve(ll_cod_parque_asoc,ls_serie)=0 then
						idw_detalle3.insertrow(0)
					end if
				end if
				if dw_revision.dataobject='dw_revision_contratos_producto' then
					dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
					idw_detalle1.settransobject(sqlca)
					if ll_numero > 0 then
						if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
							idw_detalle1.insertrow(0)
						end if
					else
						idw_detalle1.insertrow(0)
					end if
				end if
				
			end if
		end if
	elseif ls_columna='moneda' then
		dw_revision.accepttext()
		ls_moneda													= dw_revision.getitemstring(1,'moneda')
		lld_pie														= dw_revision.getitemnumber(1,'pie')
		lld_gasto_adm												= dw_revision.getitemnumber(1,'gasto_adm')
		lld_precio													= dw_revision.getitemnumber(1,'precio')
		lld_derecho													= dw_revision.getitemnumber(1,'derecho_especial')
		lld_cta_mant												= dw_revision.getitemnumber(1,'valor_cuota_mant')
		lld_saldo_finan												= dw_revision.getitemnumber(1,'saldo_financiar')
		if dw_revision.dataobject='dw_revision_contratos_liberador' then
			lld_pie_iva												= dw_revision.getitemnumber(1,'pie_iva')
		else
			lld_pie_iva												= 0
		end if
		lld_valor_cta												= dw_revision.getitemnumber(1,'valor_cuota')
		lld_uf															= dw_revision.getitemnumber(1,'uf_fecha_ctto')
		lld_precio_contrato										= dw_revision.getitemnumber(1,'precio_contrato')

		if ls_base='L' then
			ldb_descto_liber										= dw_revision.getitemnumber(1,'descto_liber')
			dw_revision.setitem(1,'descto_liber',ldb_descto_liber)
		end if
		if lld_uf>0 then
			ll_tipo_producto										= dw_revision.getitemnumber(1,'tipo_producto')
			if dw_revision.dataobject <> 'dw_revision_contratos_producto'  then
				if ls_moneda='1' then //peso
					if lld_pie < 500 then
						dw_revision.setitem(1,'pie',long(round((lld_pie * lld_uf),2)))
					end if
					if lld_precio_contrato < 500 then
						dw_revision.setitem(1,'precio_contrato',long(round((lld_precio_contrato * lld_uf),2)))
					end if
					if lld_valor_cta < 500 then
						dw_revision.setitem(1,'valor_cuota',long(round((lld_valor_cta * lld_uf),2)))
						ll_fila			= dw_seguro.Find("c_estado_reg = 0", 1, dw_seguro.RowCount())
						if ll_fila > 0 then
							dw_revision.setitem(1,'c_total_cuota',0)
						end if
					end if
				elseif ls_moneda='2' then //uf
					if lld_pie >= 500 then
						dw_revision.setitem(1,'pie',(lld_pie / lld_uf))
					end if
					if lld_precio_contrato >= 500 then
						dw_revision.setitem(1,'precio_contrato',(lld_precio_contrato / lld_uf))
					end if
					if lld_valor_cta >= 500 then
						dw_revision.setitem(1,'valor_cuota',(lld_valor_cta / lld_uf))
						ll_fila			= dw_seguro.Find("c_estado_reg = 0", 1, dw_seguro.RowCount())
						if ll_fila > 0 then
							dw_revision.setitem(1,'c_total_cuota',0)
						end if
					end if
				end if
			end if

			if dw_revision.dataobject = 'dw_revision_contratos_producto'  then
				ldb_uf												= dw_revision.getitemnumber(1,'uf_fecha_ctto')
				ll_plazo											= dw_revision.getitemnumber(1,'plazo')
				ls_moneda										= dw_revision.getitemstring(1,'moneda')
				ldb_precio										= double(dw_revision.getitemnumber(1,'precio_contrato'))
				lld_pie											= double(dw_revision.getitemnumber(1,'pie'))
				ldb_pie_min										= double(dw_revision.getitemnumber(1,'pie_minimo'))
				ldb_precio_lista									= double(dw_revision.getitemnumber(1,'precio'))
				ldb_derecho_esp								= double(dw_revision.getitemnumber(1,'derecho_especial'))
				ldb_uf_dia										= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
				lld_gasto_uf										= double(dw_revision.getitemnumber(1,'gasto_adm'))
				ls_moneda										= dw_revision.getitemstring(1,'moneda')
				ll_plazo											= dw_revision.getitemnumber(1,'plazo')
				ls_uso											= dw_revision.getitemstring(1,'uso')
				
				if isnull(lld_pie) then lld_pie=0
				if isnull(lld_gasto_uf) then lld_gasto_uf=0
				if isnull(ldb_precio) then ldb_precio=0
				if isnull(ldb_pie_min) then ldb_pie_min=0
				if isnull(ldb_precio_lista) then ldb_precio_lista=0
				if isnull(ldb_derecho_esp) then ldb_derecho_esp=0
				if isnull(lld_gasto_uf) then lld_gasto_uf=0
				if ls_moneda = '1' then
					if ldb_precio > 500 then
						dw_revision.setitem(1,'precio_contrato',ldb_precio)
						dw_revision.setitem(1,'pie',lld_pie)
						dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
						dw_revision.setitem(1,'precio',ldb_precio_lista)
						dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
						dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
						dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
					else
						ldb_precio										= round(ldb_precio * ldb_uf_dia,0)
						lld_pie											= round(lld_pie * ldb_uf_dia,0)
						ldb_pie_min										= round(ldb_pie_min * ldb_uf_dia,0)
						ldb_precio_lista									= round(ldb_precio_lista * ldb_uf_dia,0)
						ldb_derecho_esp								= round(ldb_derecho_esp * ldb_uf_dia,0)
						lld_gasto_uf										= round(lld_gasto_uf * ldb_uf_dia,0)
						dw_revision.setitem(1,'precio_contrato',ldb_precio)
						dw_revision.setitem(1,'pie',lld_pie)
						dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
						dw_revision.setitem(1,'precio',ldb_precio_lista)
						dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
						dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
						dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
					end if
					
				elseif ls_moneda='2' then
					if ldb_precio <= 500 then
						dw_revision.setitem(1,'precio_contrato',ldb_precio)
						dw_revision.setitem(1,'pie',lld_pie)
						dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
						dw_revision.setitem(1,'precio',ldb_precio_lista)
						dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
						dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
						dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
					else
						ldb_precio										= round(ldb_precio / ldb_uf_dia,4)
						lld_pie											= round(lld_pie / ldb_uf_dia,4)
						ldb_pie_min										= round(ldb_pie_min / ldb_uf_dia,4)
						ldb_precio_lista									= round(ldb_precio_lista / ldb_uf_dia,4)
						ldb_derecho_esp								= round(ldb_derecho_esp / ldb_uf_dia,4)
						lld_gasto_uf										= round(lld_gasto_uf / ldb_uf_dia,4)
						dw_revision.setitem(1,'precio_contrato',ldb_precio)
						dw_revision.setitem(1,'pie',lld_pie)
						dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
						dw_revision.setitem(1,'precio',ldb_precio_lista)
						dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
						dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
						dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
					end if
				end if
				if ls_moneda='1' then
					ls_descrip_moneda									= 'Peso'
				elseif ls_moneda='2' then
					ls_descrip_moneda									= 'UF'
				end if
				if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,ls_moneda)=0 then
					idw_detalle3.insertrow(0)
					if not isnull(il_cod_parque) and not isnull(ls_uso) and not isnull(ls_serie) and not isnull(ls_moneda) then
						messagebox("Advertencia","No Existen Servicios Definido con Parque: "+string(il_cod_parque)+"-"+ls_descrip_parque+ ", Uso: "+ls_uso+ ", Contrato: "+ls_base+"-"+ls_descrip_base+" y Moneda: "+ls_moneda+"-"+ls_descrip_moneda )
					end if
				end if
				
				dw_revision.accepttext()
				if isnull(ldb_precio) or isnull(lld_gasto_uf) then
					dw_revision.setitem(1,'saldo_financiar',0)
				else
					ld_calculo											= (( ldb_precio - lld_pie ) + lld_gasto_uf )
					dw_revision.setitem(1,'saldo_financiar',ld_calculo)
					if ls_moneda='1' then //peso
						dw_revision.setitem(1,'valor_cuota', round((ld_calculo / ll_plazo),0))
					else
						dw_revision.setitem(1,'valor_cuota', round((ld_calculo / ll_plazo),4))
					end if
					
				end if
			end if
			
			dw_revision.accepttext()
		end if
	elseif ls_columna='cod_parque' then
		il_cod_parque											= dw_revision.getitemnumber(1,'cod_parque')
		ls_base													= dw_base.getitemstring(1,'base')
		ls_serie													= trim(ddlb_serie.text)
		if ls_base <> 'F' and ls_base<>'G' and ls_base<>'V' then
			if ls_base='U' then dw_revision.setitem(1,'tipo_sepult','8')
			if gs_cod_prod='CO' or gs_cod_prod='SE' then
				if idw_detalle2.retrieve(il_cod_parque, gs_cod_prod)=0 then
					idw_detalle2.insertrow(0)
				end if
				if idw_detalle4.retrieve( gs_cod_prod)=0 then
					idw_detalle4.insertrow(0)
				end if
			else
				if idw_detalle2.retrieve(il_cod_parque)=0 then
					idw_detalle2.insertrow(0)
				end if
			end if
		else
			dw_revision.setitem(1,'codigo_servicio',ll_nulo)
			ls_moneda								= dw_revision.getitemstring(1,'moneda')
			dw_revision.accepttext()
			if dw_revision.dataobject='dw_revision_contratos_producto' then
				if ls_moneda='1' then
					ls_descrip_moneda									= 'Peso'
				elseif ls_moneda='2' then
					ls_descrip_moneda									= 'UF'
				end if
				if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,ls_moneda)=0 then
					idw_detalle3.insertrow(0)
					if not isnull(il_cod_parque) and not isnull(ls_uso) and not isnull(ls_serie) and not isnull(ls_moneda) then
						messagebox("Advertencia","No Existen Servicios Definido con Parque: "+string(il_cod_parque)+"-"+ls_descrip_parque+ ", Uso: "+ls_uso+ ", Contrato: "+ls_base+"-"+ls_descrip_base+" y Moneda: "+ls_moneda+"-"+ls_descrip_moneda )
					end if
				end if
			else
				if idw_detalle3.retrieve(il_cod_parque,ls_serie)=0 then
					idw_detalle3.insertrow(0)
				end if
			end if
			if dw_revision.dataobject='dw_revision_contratos_producto' then
				dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
				idw_detalle1.settransobject(sqlca)
				if ll_numero > 0 then
					if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
						idw_detalle1.insertrow(0)
					end if
				else
					idw_detalle1.insertrow(0)
				end if
			end if
		end if
		ll_tot_reg	= dw_seguro.retrieve(il_cod_parque,ls_base)
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ll_codigo_iva = dw_seguro.getitemnumber(ll_indi,'codigo')
				if ll_codigo_iva = 8 and ld_fecha_ctto < date('20/02/2023') then
					dw_seguro.setitem(ll_indi,'c_estado_reg',0)
				else
					dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				end if
			next
			dw_seguro.accepttext()
		end if
	
	elseif dw_revision.dataobject='dw_revision_contratos_liberador' and (ls_columna='uso' or ls_columna='liberador_annos') then
		is_new_precio											= 'N'
		dw_revision.accepttext()
		ls_moneda												= dw_revision.getitemstring(1,'moneda')
		ls_tipo_sepultura										= dw_revision.getitemstring(1,'tipo_sepult')
		ls_area													= dw_revision.getitemstring(1,'area')
		ll_capacidad												= dw_revision.getitemnumber(1,'capacidad')
		if ls_base='O'  or ls_base='U' then
			ld_fecha_ctto										= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
			ll_tipo_producto									= dw_revision.getitemnumber(1,'tipo_producto')
		end if
		if dw_revision.dataobject='dw_revision_contratos_liberador' and ls_base='L' then
			ls_uso												= 'NF'
		else
			ls_uso												= dw_revision.getitemstring(1,'uso')
		end if
		ldb_uf														= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
		il_cod_parque											= dw_revision.getitemnumber(1,'cod_parque')
		lld_saldo_finan											= double(dw_revision.getitemnumber(1,'saldo_financiar'))
		if ls_base='F' or ls_base='G' or ls_base='V' then
			ls_area												= '0'	
			ls_tipo_sepultura									= '0'	
		end if
		if not isnull(ls_area) and not isnull(ll_capacidad) and not isnull(ls_uso) and not isnull(ldb_uf) and not isnull(il_cod_parque) and not isnull(ls_tipo_sepultura) and not isnull(ll_tipo_producto) and not isnull(ld_fecha_ctto) then
			if dw_revision.dataobject='dw_revision_contratos_promesa' then //liberador
				if is_mod_precio <> 'N' then
					ls_string											= f_valida_precio(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque,ll_tipo_producto,ld_fecha_ctto)
					if ls_moneda='2' then //UF
						ldb_precio									= double(substr(1,1,ls_string))
						ldb_derecho									= double(substr(1,2,ls_string))
						ldb_cuota_mant							= double(substr(1,3,ls_string))
						ldb_liberador								= double(substr(1,4,ls_string))
						ldb_pie_minimo							= double(substr(1,5,ls_string))
						ll_reduccion									= long(substr(1,6,ls_string))
					else // peso
						ldb_precio									= double(long(substr(1,1,ls_string)))
						ldb_derecho									= double(long(substr(1,2,ls_string)))
						ldb_cuota_mant							= double(substr(1,3,ls_string))
						ldb_liberador								= double(long(substr(1,4,ls_string)))
						ldb_derecho									= ROUND((ldb_derecho / ldb_uf),0)
						ldb_pie_minimo							= double(substr(1,5,ls_string))
						ll_reduccion									= long(substr(1,6,ls_string))
					end if
					if is_new_precio='S' then
						ldb_precio_vta								= dw_revision.getitemnumber(1,'precio_contrato')
					end if
					dw_revision.setitem(1,'reduccion',ll_reduccion)
				end if
			elseif dw_revision.dataobject='dw_revision_contratos_liberador' and ls_base= 'L' then
				dw_revision.accepttext()
				ll_annos_liber									= dw_revision.getitemnumber(1,'liberador_annos')
				if not isnull(ll_annos_liber) and ll_annos_liber>0 then
					ls_base_asoc								= dw_revision.getitemstring(1,'base_asoc')
					ls_serie_asoc								= dw_revision.getitemstring(1,'serie_asoc')
					ll_numero_asoc							= dw_revision.getitemnumber(1,'numero_asoc')
					ldb_valor_mant								= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
					ls_string										= f_valida_precio_liberador_nuevo(ldb_valor_mant,ll_annos_liber,ls_moneda,ldb_uf)
					if ls_moneda='2' then //UF
						ldb_precio								= double(substr(1,1,ls_string))
						ldb_descto_liber						= double(substr(1,2,ls_string))
						ldb_precio_vta							= double(substr(1,3,ls_string))
						ldb_liberador							= double(substr(1,4,ls_string))
						ldb_pie_minimo						= double(substr(1,5,ls_string))
					else // peso
						ldb_precio								= double(long(substr(1,1,ls_string)))
						ldb_descto_liber						= double(substr(1,2,ls_string))
						ldb_precio_vta							= double(long(substr(1,3,ls_string)))
						ldb_liberador							= double(long(substr(1,4,ls_string)))
						ldb_pie_minimo						= double(substr(1,5,ls_string))
					end if
					if is_new_precio='S' then
						ldb_precio_vta							= dw_revision.getitemnumber(1,'precio_contrato')
					end if
					
					dw_revision.setitem(1,'precio',ldb_precio)
					dw_revision.setitem(1,'descto_liber',ldb_descto_liber)
					dw_revision.setitem(1,'precio_contrato',ldb_precio_vta)
					dw_revision.setitem(1,'valor_cuota_mant',ldb_valor_mant)
					dw_revision.setitem(1,'periodo_mant',il_periodo_mant)
				end if
			elseif dw_revision.dataobject='dw_revision_contratos_liberador' and ls_base= 'A' then
				dw_revision.accepttext()
				ldb_valor_mant									= wf_valor_mant(ls_base_asoc,ls_serie_asoc,ll_numero_asoc)
				ll_capac_new									= dw_revision.getitemnumber(1,'nueva_capac')
				if not isnull(ll_capac_new) and ll_capac_new>0 then
					ll_capac											= dw_revision.getitemnumber(1,'capacidad')
					ls_uso											= dw_revision.getitemstring(1,'uso')
					if not isnull(il_cod_parque) and il_cod_parque>0 and not isnull(ll_capac) and ll_capac>0 and not isnull(ls_uso) and ls_uso<>'' then
						SELECT COUNT("LISTA_PRECIO_AUMENTO"."CAPAC_ACTUAL")
						INTO		:ll_existe_precio
						FROM 	"LISTA_PRECIO_AUMENTO"  
						WHERE	"LISTA_PRECIO_AUMENTO"."CAPAC_ACTUAL" = :ll_capac AND  
									"LISTA_PRECIO_AUMENTO"."CAPAC_NEW" = :ll_capac_new AND  
									"LISTA_PRECIO_AUMENTO"."USO" = :ls_uso AND  
									"LISTA_PRECIO_AUMENTO"."COD_PARQUE" = :il_cod_parque AND  
									"LISTA_PRECIO_AUMENTO"."ESTADO" = 'V'
						USING	sqlca;
						if isnull(ll_existe_precio) then ll_existe_precio=0 
						if ll_existe_precio=0 then
							messagebox("Advertencia","No Existe Precio Para Nueva Capacidad, Parque y Capacidad Original Seleccionado")
						else
							ls_string										= f_valida_precio_aumento(ll_capacidad,ls_uso,ll_capac_new,il_cod_parque,ls_moneda,ldb_uf)
							if ls_moneda='2' then //UF
								ldb_precio								= double(substr(1,1,ls_string))
								ldb_pie_minimo						= double(substr(1,2,ls_string))
								ldb_descto_liber						= double(substr(1,3,ls_string))
								ldb_precio_vta							= double(substr(1,4,ls_string))
								ldb_liberador							= double(substr(1,5,ls_string))
							else // peso
								ldb_precio								= double(long(substr(1,1,ls_string)))
								ldb_pie_minimo						= double(substr(1,2,ls_string))
								ldb_descto_liber						= double(substr(1,3,ls_string))
								ldb_precio_vta							= double(long(substr(1,4,ls_string)))
								ldb_liberador							= double(long(substr(1,5,ls_string)))
							end if
							dw_revision.setitem(1,'precio',ldb_precio)
							dw_revision.setitem(1,'precio_contrato',ldb_precio)
							dw_revision.setitem(1,'pie_minimo',ldb_pie_minimo)
						end if
					end if
				end if	
			elseif dw_revision.dataobject='dw_revision_contratos_liberador' and ls_base<> 'L' and ls_base<> 'A'  then
				dw_revision.accepttext()
				ls_string											= f_valida_precio_liberador(ls_tipo_sepultura,ls_area,ll_capacidad,ls_uso,ls_moneda,ldb_uf,ls_tipo_construc,il_cod_parque,ls_base)
				if ls_moneda='2' then //UF
					ldb_precio									= double(substr(1,1,ls_string))
					ldb_derecho									= double(substr(1,2,ls_string))
					ldb_cuota_mant							= double(substr(1,3,ls_string))
					ldb_liberador								= double(substr(1,4,ls_string))
					ldb_pie_minimo							= double(substr(1,5,ls_string))
				else // peso
					ldb_precio									= double(long(substr(1,1,ls_string)))
					ldb_derecho									= double(long(substr(1,2,ls_string)))
					ldb_cuota_mant							= double(substr(1,3,ls_string))
					ldb_liberador								= double(long(substr(1,4,ls_string)))
					ldb_derecho									= ROUND((ldb_derecho / ldb_uf),0)
					ldb_pie_minimo							= double(substr(1,5,ls_string))
				end if
			end if	
			if ls_serie='R' or ls_uso='NI' then
				ldb_derecho										= 0
			end if
			dw_revision.setitem(1,'precio',ldb_precio)
			ls_forma_pago										= dw_revision.getitemstring(1,'forma_pago')
			lld_pie												= dw_revision.getitemnumber(1,'pie')
			if is_nuevo	= 'S' then dw_revision.setitem(1,'precio_contrato',ldb_precio)
			if lld_pie < ldb_pie_minimo and lld_pie>=0 and ls_sw_pie='N' and (ls_forma_pago='2' or ls_forma_pago='4') then
				dw_revision.setfocus()
			end if
			dw_revision.setitem(1,'derecho_especial',ldb_derecho)
			dw_revision.setitem(1,'valor_cuota_mant',ldb_valor_mant)
			ldb_liberador										= 0
		end if
		
		dw_revision.accepttext()
		ldb_precio												= double(dw_revision.getitemnumber(1,'precio_contrato'))
		lld_pie													= double(dw_revision.getitemnumber(1,'pie'))
		lld_gasto_uf												= double(dw_revision.getitemnumber(1,'gasto_adm'))
		if isnull(lld_pie) then lld_pie=0
		if isnull(lld_gasto_uf) then lld_gasto_uf=0
		if isnull(ldb_precio) or isnull(lld_gasto_uf) then
			dw_revision.setitem(1,'saldo_financiar',0)
		else
			if date(ld_fecha_ctto) >= date('20/02/2023') then
				ld_calculo											= (( ldb_precio - lld_pie_iva ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
			else
				ld_calculo											= (( ldb_precio - lld_pie ) + lld_gasto_uf )
				dw_revision.setitem(1,'saldo_financiar',ld_calculo)
			end if
			dw_revision.accepttext()
		end if
		
	//FRANCK
	elseif ls_columna='origen_venta' then
		ls_origen_venta		= dw_revision.getitemstring(1,'origen_venta')
//		dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
//		idw_detalle12.settransobject(sqlca)
		if idw_detalle12.retrieve(ls_origen_venta) = 0 then
			 dw_revision.modify("tipo_venta_subcat.visible='0'")
			 dw_revision.modify("t_subcat.visible='0'")
			 dw_revision.setitem(1,'tipo_venta_subcat',ls_nulo)
			 idw_detalle12.insertrow(0)
		else
			dw_revision.modify("t_subcat.visible='1'")
			dw_revision.modify("tipo_venta_subcat.visible='1'")
		end if
	//FIN FRANCK
	
	//producto
	elseif ls_columna='origen_venta' and (ls_base='F' or ls_base='G' or ls_base='V') then
		ls_origen_venta		= dw_revision.getitemstring(1,'origen_venta')
		ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
		ll_cod_serv				= dw_revision.getitemnumber(1,'codigo_servicio') 
		idw_detalle12.retrieve(ls_origen_venta)
		if ll_activa = 2 then
			if ls_base='F' and ll_cod_serv >= 670 and ll_cod_serv <= 674 then
				ll_resp_benef	= messagebox("Advertencia","Recuerde que debe Ingresar Beneficiario Servicio Funerario (Fallecido), desea Ingresarlo",Exclamation!,YesNo!,2)
				if ll_resp_benef=1 then pb_benef.triggerevent(clicked!)
			elseif ls_base='F' or ls_base='G' then
				messagebox("Advertencia","Recuerde que debe Ingresar Beneficiario Servicio Funerario (Fallecido)")
				pb_benef.triggerevent(clicked!)
			end if
//			pb_benef.triggerevent(clicked!)
		end if
	elseif (ls_columna='sw_activa_servicio' or ls_columna='sw_activa_servicio_1' ) and (ls_base='F' or ls_base='G' or ls_base='V') then	//elseif ls_columna='sw_activa_servicio' and (ls_base='F' or ls_base='G' or ls_base='V') then
		ll_capacidad				= dw_revision.getitemnumber(1,'capacidad') 
		ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
		ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
		if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
			if gs_mant_serv = 'S' then
				gs_mant_serv	= 'S'
				if isvalid(w_mantenedor_gestion_servicios) then close(w_mantenedor_gestion_servicios)
				open (w_mantenedor_gestion_servicios)
			end if
		end if
		ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
		if ll_activa = 2 then
			dw_revision.setitem(1,'fecha_activacion',gdt_fec_sistema)
			ls_benef_ok			= f_beneficiarios(ls_base,ls_serie,ll_numero,ll_capacidad)
			if ls_benef_ok = 'N' then
				if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
					ll_resp_benef	= messagebox("Advertencia","Recuerde que debe Ingresar Beneficiario Servicio Funerario (Fallecido), desea Ingresarlo",Exclamation!,YesNo!,2)
					if ll_resp_benef=1 then pb_benef.triggerevent(clicked!)
				elseif ls_base='F' or ls_base='G' then
					messagebox("Advertencia","Recuerde que debe Ingresar Beneficiario Servicio Funerario (Fallecido)")
					pb_benef.triggerevent(clicked!)
				end if
			end if
		else
			dw_revision.setitem(1,'fecha_activacion',ldt_nulo)
		end if
		dw_revision.accepttext()
	end if
	dw_revision.accepttext()
end if
if not isnull(ls_base)  then wf_calcular(ls_base)
if dw_revision.dataobject='dw_revision_contratos_producto' and (ls_columna='moneda' or ls_columna='tipo_beneficiarios' or ls_columna='capacidad' or ls_columna='codigo_servicio' or ls_columna='uso' or ls_columna='plazo' or ls_columna='pie' or ls_columna='fecha_prim' or ls_columna='precio_contrato') then
	ldb_valor_cuota_rev							= dw_revision.getitemnumber(1,'c_suma_val_cuota')
	if ldb_valor_cuota_rev > 0 and ls_columna='moneda' then
		messagebox("Advertencia","Se Modificó Moneda, debe Seleccionar Nuevo Tipo de Servicio")
		dw_revision.setitem(1,'codigo_servicio',ll_nulo)
		dw_revision.accepttext()
		if idw_detalle4.retrieve( gs_cod_prod)=0 then
			idw_detalle4.insertrow(0)
		end if
		
	end if
	if (ls_columna='codigo_servicio' or ls_columna='capacidad' ) and (ls_base='F' or ls_base='G' or ls_base='V') then
		dw_revision.accepttext()
		ll_capacidad									= dw_revision.getitemnumber(1,'capacidad')
		ll_tipo_servicio								= dw_revision.getitemnumber(1,'codigo_servicio')
		if not isnull(ll_capacidad) and not isnull(ll_tipo_servicio) then pb_producto.triggerevent(clicked!)
	end if
	ls_uso											= dw_revision.getitemstring(1,'uso')
	il_cod_parque									= dw_revision.getitemnumber(1,'cod_parque')
	if ls_columna = 'uso' then 
		ls_moneda									= dw_revision.getitemstring(1,'moneda')
		dw_revision.setitem(1,'codigo_servicio',ll_nulo)
		dw_revision.accepttext()
		if ls_moneda='1' then
			ls_descrip_moneda									= 'Peso'
		elseif ls_moneda='2' then
			ls_descrip_moneda									= 'UF'
		end if
		if idw_detalle3.retrieve(il_cod_parque,ls_uso,ls_serie,ls_moneda)=0 then
			idw_detalle3.insertrow(0)
			if not isnull(il_cod_parque) and not isnull(ls_uso) and not isnull(ls_serie) and not isnull(ls_moneda) then
				messagebox("Advertencia","No Existen Servicios Definido con Parque: "+string(il_cod_parque)+"-"+ls_descrip_parque+ ", Uso: "+ls_uso+ ", Contrato: "+ls_base+"-"+ls_descrip_base+" y Moneda: "+ls_moneda+"-"+ls_descrip_moneda )
			end if
		end if
		
	end if
	if dw_revision.dataobject='dw_revision_contratos_producto' then
		dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
		idw_detalle1.settransobject(sqlca)
		if ll_numero > 0 then
			if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
				idw_detalle1.insertrow(0)
			end if
		else
			idw_detalle1.insertrow(0)
		end if
	end if
	ll_tipo_benef									= dw_revision.getitemnumber(1,'tipo_beneficiarios')
	ll_capacidad										= dw_revision.getitemnumber(1,'capacidad')
	ll_tipo_servicio									= dw_revision.getitemnumber(1,'codigo_servicio')
	ldb_uf												= dw_revision.getitemnumber(1,'uf_fecha_ctto')
	ll_plazo											= dw_revision.getitemnumber(1,'plazo')
	ls_moneda										= dw_revision.getitemstring(1,'moneda')
	if isnull(ll_capacidad) then ll_capacidad=0
	if not isnull(ll_tipo_benef) and ll_tipo_benef>0 and not isnull(ll_tipo_servicio) and ll_tipo_servicio>0 and not isnull(ls_uso) and ls_uso<>'' then
		dw_revision.accepttext()
		ldb_precio												= double(dw_revision.getitemnumber(1,'precio_contrato'))
		lld_pie													= double(dw_revision.getitemnumber(1,'pie'))
		ldb_pie_min												= double(dw_revision.getitemnumber(1,'pie_minimo'))
		ldb_precio_lista											= double(dw_revision.getitemnumber(1,'precio'))
		ldb_derecho_esp										= double(dw_revision.getitemnumber(1,'derecho_especial'))
		ldb_uf_dia												= double(dw_revision.getitemnumber(1,'uf_fecha_ctto'))
		lld_gasto_uf												= double(dw_revision.getitemnumber(1,'gasto_adm'))
		ls_moneda												= dw_revision.getitemstring(1,'moneda')
		ll_plazo													= dw_revision.getitemnumber(1,'plazo')
		if isnull(lld_pie) then lld_pie=0
		if isnull(lld_gasto_uf) then lld_gasto_uf=0
		if isnull(ldb_precio) then ldb_precio=0
		if isnull(ldb_pie_min) then ldb_pie_min=0
		if isnull(ldb_precio_lista) then ldb_precio_lista=0
		if isnull(ldb_derecho_esp) then ldb_derecho_esp=0
		if isnull(lld_gasto_uf) then lld_gasto_uf=0
		if ls_moneda = '1' then
			if ldb_precio > 500 or (ls_moneda='1' and ldb_precio=1) then
				dw_revision.setitem(1,'precio_contrato',ldb_precio)
				dw_revision.setitem(1,'pie',lld_pie)
				dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
				dw_revision.setitem(1,'precio',ldb_precio_lista)
				dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
				dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
				dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
			else
				ldb_precio										= round(ldb_precio * ldb_uf_dia,0)
				lld_pie											= round(lld_pie * ldb_uf_dia,0)
				ldb_pie_min										= round(ldb_pie_min * ldb_uf_dia,0)
				ldb_precio_lista									= round(ldb_precio_lista * ldb_uf_dia,0)
				ldb_derecho_esp								= round(ldb_derecho_esp * ldb_uf_dia,0)
				lld_gasto_uf										= round(lld_gasto_uf * ldb_uf_dia,0)
				dw_revision.setitem(1,'precio_contrato',ldb_precio)
				dw_revision.setitem(1,'pie',lld_pie)
				dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
				dw_revision.setitem(1,'precio',ldb_precio_lista)
				dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
				dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
				dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
			end if
			
		elseif ls_moneda='2' then
			if ldb_precio <= 500 then
				dw_revision.setitem(1,'precio_contrato',ldb_precio)
				dw_revision.setitem(1,'pie',lld_pie)
				dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
				dw_revision.setitem(1,'precio',ldb_precio_lista)
				dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
				dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
				dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
			else
				ldb_precio										= round(ldb_precio / ldb_uf_dia,4)
				lld_pie											= round(lld_pie / ldb_uf_dia,4)
				ldb_pie_min										= round(ldb_pie_min / ldb_uf_dia,4)
				ldb_precio_lista									= round(ldb_precio_lista / ldb_uf_dia,4)
				ldb_derecho_esp								= round(ldb_derecho_esp / ldb_uf_dia,4)
				lld_gasto_uf										= round(lld_gasto_uf / ldb_uf_dia,4)
				dw_revision.setitem(1,'precio_contrato',ldb_precio)
				dw_revision.setitem(1,'pie',lld_pie)
				dw_revision.setitem(1,'pie_minimo',ldb_pie_min)
				dw_revision.setitem(1,'precio',ldb_precio_lista)
				dw_revision.setitem(1,'precio_venta',ldb_precio_lista)
				dw_revision.setitem(1,'derecho_especial',ldb_derecho_esp)
				dw_revision.setitem(1,'gasto_adm',lld_gasto_uf)
			end if
		end if
		dw_revision.accepttext()
		if isnull(ldb_precio) or isnull(lld_gasto_uf) then
			dw_revision.setitem(1,'saldo_financiar',0)
		else
			ld_calculo											= (( ldb_precio - lld_pie ) + lld_gasto_uf )
			dw_revision.setitem(1,'saldo_financiar',ld_calculo)
			if ls_moneda='1' then //peso
				dw_revision.setitem(1,'valor_cuota', round((ld_calculo / ll_plazo),0))
			else
				dw_revision.setitem(1,'valor_cuota', round((ld_calculo / ll_plazo),4))
			end if
			
		end if
		dw_revision.accepttext()
		ls_base							= dw_base.getitemstring(1,'base')
		if not isnull(ls_base) then wf_calcular(ls_base)	
		
	else
		if isnull(ll_tipo_benef) or ll_tipo_benef=0 then
			messagebox("Advertencia","Debe ingresar Tipo Beneficiario")
			dw_revision.setfocus()
			dw_revision.setcolumn('tipo_beneficiarios')
		end if
	end if
end if
dw_revision.accepttext()
end event

event clicked;string		ls_columna,ls_fecha,ls_base,ls_estado_rev,ls_marca
long		ll_activa,ll_tot_reg,ll_indi,ll_codigo_iva,ll_capacidad,ll_tipo_servicio
datetime	ldt_nulo
date		ld_fecha_ctto

setnull(ldt_nulo)
dw_revision.accepttext()

select sysdate into :gdt_fec_sistema from dual;
ls_estado_rev					= dw_revision.getitemstring(1,'estado_revision')
if ls_estado_rev <> 'A' or gs_depto='O' then
	ls_columna								= dwo.name
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_fecha							= string(date(dw_revision.getitemdatetime(1,'fecha_nac')))
			if isnull(ls_fecha) then ls_fecha = string(gdt_fec_sistema,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_revision.setitem(1,'fecha_nac',datetime(string(gdt_fec_sistema,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha						= trim(Message.StringParm)
				dw_revision.setitem(1,'fecha_nac',date(ls_fecha))
			END IF
			ls_base							= dw_base.getitemstring(1,'base')
			if not isnull(ls_base) then wf_calcular(ls_base)
			dw_revision.setfocus()
			dw_revision.setcolumn('fecha_nac')
			
		CASE 'p_2'
			ll_tot_reg						= dw_seguro.rowcount()
			ls_fecha							= string(date(dw_revision.getitemdatetime(1,'fecha_ctto')))
			if isnull(ls_fecha) then ls_fecha = string(gdt_fec_sistema,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_revision.setitem(1,'fecha_ctto',datetime(string(gdt_fec_sistema,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha						= trim(Message.StringParm)
				dw_revision.setitem(1,'fecha_ctto',date(ls_fecha))
			END IF
			dw_revision.accepttext()
			ls_base							= dw_base.getitemstring(1,'base')
			if not isnull(ls_base) then wf_calcular(ls_base)
			dw_revision.setfocus()
			dw_revision.setcolumn('fecha_ctto')
			if dw_revision.dataobject='dw_revision_contratos_liberador' then
				ld_fecha_ctto												= date(dw_revision.getitemdatetime(1,'fecha_ctto'))
				if date(ld_fecha_ctto) >= date('20/02/2023') then
					if ll_tot_reg > 0 then
						for ll_indi=1 to ll_tot_reg
							ll_codigo_iva = dw_seguro.getitemnumber(ll_indi,'codigo')
							dw_seguro.setitem(ll_indi,'c_estado_reg',1)
							if ll_codigo_iva = 8 and ld_fecha_ctto >= date('20/02/2023') then
								dw_seguro.setitem(ll_indi,'c_estado_reg',0)
							end if
						next
						dw_seguro.accepttext()
					end if
				else
					for ll_indi=1 to ll_tot_reg
						dw_seguro.setitem(ll_indi,'c_estado_reg',1)
					next
				end if
				dw_revision.accepttext( )
			end if
			dw_revision.accepttext()
			
		CASE 'p_3'
			ls_fecha							= string(date(dw_revision.getitemdatetime(1,'fecha_prim')))
			if isnull(ls_fecha) then ls_fecha = string(gdt_fec_sistema,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_revision.setitem(1,'fecha_prim',datetime(string(gdt_fec_sistema,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha						= trim(Message.StringParm)
				dw_revision.setitem(1,'fecha_prim',date(ls_fecha))
			END IF
			ls_base							= dw_base.getitemstring(1,'base')
			if not isnull(ls_base) then wf_calcular(ls_base)
			dw_revision.setfocus()
			dw_revision.setcolumn('fecha_prim')
		CASE 'p_5'
			if dw_revision.dataobject='dw_revision_contratos_producto' then
				ls_base					= dw_base.getitemstring(1,'base')
				ll_capacidad				= dw_revision.getitemnumber(1,'capacidad') 
				ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
				ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
				if ls_base='F' and ll_capacidad > 1 then	//ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
					if gs_mant_serv = 'S' or il_modif=0 or isnull(il_modif) then
						gs_mant_serv	= 'S'
						if isvalid(w_mantenedor_gestion_servicios) then close(w_mantenedor_gestion_servicios)
						open (w_mantenedor_gestion_servicios)
					end if
				end if
			end if
		CASE 'comprobante_titular'	
			is_new_calc						= 'N'
			
		CASE 'sw_activa_servicio'
			ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
			if ll_activa = 2 then
				dw_revision.setitem(1,'fecha_activacion',gdt_fec_sistema)
			else
				dw_revision.setitem(1,'fecha_activacion',ldt_nulo)
			end if
	END CHOOSE
	dw_revision.accepttext()
end if

if gs_depto<>'O' then
	ls_columna								= dwo.name
	CHOOSE CASE ls_columna
		CASE 'p_5'
			if dw_revision.dataobject='dw_revision_contratos_producto' then
				ls_base					= dw_base.getitemstring(1,'base')
				ll_capacidad				= dw_revision.getitemnumber(1,'capacidad') 
				ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
				ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
				if ls_base='F' and ll_capacidad > 1 then	//ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
					if gs_mant_serv = 'S' or il_modif=0 or isnull(il_modif) then
						gs_mant_serv	= 'S'
						if isvalid(w_mantenedor_gestion_servicios) then close(w_mantenedor_gestion_servicios)
						open (w_mantenedor_gestion_servicios)
					end if
				end if
			end if
	END CHOOSE
end if
end event

event itemerror;return 1
end event

event doubleclicked;string		ls_columna,ls_base
Long		ll_capacidad,ll_activa,ll_tipo_servicio

dw_revision.accepttext()
ls_columna							= dwo.name
if 	ls_columna= 't_tipo_servicio' then
	pb_producto.triggerevent(clicked!)
elseif ls_columna='t_cant_benef' then
	pb_benef.triggerevent(clicked!)
elseif (ls_columna='t_marca' or ls_columna='sw_activa_servicio_1' or ls_columna='sw_activa_servicio' or ls_columna='t_12' or ls_columna='fecha_activacion') and &
		dw_revision.dataobject='dw_revision_contratos_producto' then
	ll_capacidad				= dw_revision.getitemnumber(1,'capacidad') 
	ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
	ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
	if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
		if gs_mant_serv = 'S' then
			if isvalid(w_mantenedor_gestion_servicios) then close(w_mantenedor_gestion_servicios)
			open (w_mantenedor_gestion_servicios)
		end if
	end if
end if
end event

event itemfocuschanged;String		ls_columna,ls_base,ls_benef_ok,ls_serie
Long		ll_capacidad,ll_activa,ll_tipo_servicio,ll_res,ll_nulo
Double	ll_numero
datetime	ldt_nulo

Setnull(ll_nulo);Setnull(ldt_nulo)
ls_columna														= dwo.name
ls_base															= dw_base.getitemstring(1,'base')
ls_serie															= trim(ddlb_serie.text)
ll_numero														= Double(em_numero.text)
if dw_revision.dataobject='dw_revision_contratos_producto' and is_noexiste_serv = 'N' then
	is_noexiste_serv		= 'S'
	dw_revision.setitem(1,'codigo_servicio',ll_nulo)
	dw_revision.setitem(1,'precio_venta',ll_nulo)
	dw_revision.setitem(1,'precio',ll_nulo)
	dw_revision.accepttext()
	dw_revision.setfocus()
	dw_revision.setcolumn('codigo_servicio')
	
end if
if ((ls_columna='sw_activa_servicio' or ls_columna='sw_activa_servicio_1' ) and (ls_base='F' or ls_base='G' or ls_base='V')) and ll_numero>0 then
	ll_capacidad				= dw_revision.getitemnumber(1,'capacidad') 
	ll_activa					= dw_revision.getitemnumber(1,'sw_activa_servicio') 
	ll_tipo_servicio			= dw_revision.getitemnumber(1,'codigo_servicio')
	if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
				if isvalid(w_mantenedor_gestion_servicios) then close(w_mantenedor_gestion_servicios)
	end if
	if ll_activa = 2 then
	else
		dw_revision.setitem(1,'fecha_activacion',ldt_nulo)
	end if
end if


dw_revision.accepttext()
end event

