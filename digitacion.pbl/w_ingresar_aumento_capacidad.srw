forward
global type w_ingresar_aumento_capacidad from window
end type
type pb_2 from picturebutton within w_ingresar_aumento_capacidad
end type
type st_seg_fune from statictext within w_ingresar_aumento_capacidad
end type
type cb_aval from commandbutton within w_ingresar_aumento_capacidad
end type
type cb_3 from commandbutton within w_ingresar_aumento_capacidad
end type
type dw_seguro from datawindow within w_ingresar_aumento_capacidad
end type
type cb_ver_cuenta from commandbutton within w_ingresar_aumento_capacidad
end type
type cb_porce_comi from commandbutton within w_ingresar_aumento_capacidad
end type
type em_serie from dropdownlistbox within w_ingresar_aumento_capacidad
end type
type p_1 from picture within w_ingresar_aumento_capacidad
end type
type st_help_memo from statictext within w_ingresar_aumento_capacidad
end type
type st_memo from commandbutton within w_ingresar_aumento_capacidad
end type
type st_buscar from statictext within w_ingresar_aumento_capacidad
end type
type pb_buscar from picturebutton within w_ingresar_aumento_capacidad
end type
type dw_jefe from datawindow within w_ingresar_aumento_capacidad
end type
type st_salir from statictext within w_ingresar_aumento_capacidad
end type
type st_limpiar from statictext within w_ingresar_aumento_capacidad
end type
type st_imprimir from statictext within w_ingresar_aumento_capacidad
end type
type st_grabar from statictext within w_ingresar_aumento_capacidad
end type
type pb_print from picturebutton within w_ingresar_aumento_capacidad
end type
type pb_limpiar from picturebutton within w_ingresar_aumento_capacidad
end type
type cb_cerrar from picturebutton within w_ingresar_aumento_capacidad
end type
type cb_aceptar from picturebutton within w_ingresar_aumento_capacidad
end type
type st_7 from statictext within w_ingresar_aumento_capacidad
end type
type st_6 from statictext within w_ingresar_aumento_capacidad
end type
type st_5 from statictext within w_ingresar_aumento_capacidad
end type
type em_dv from editmask within w_ingresar_aumento_capacidad
end type
type st_4 from statictext within w_ingresar_aumento_capacidad
end type
type em_rut from editmask within w_ingresar_aumento_capacidad
end type
type st_3 from statictext within w_ingresar_aumento_capacidad
end type
type st_2 from statictext within w_ingresar_aumento_capacidad
end type
type em_numero from editmask within w_ingresar_aumento_capacidad
end type
type st_1 from statictext within w_ingresar_aumento_capacidad
end type
type dw_1 from datawindow within w_ingresar_aumento_capacidad
end type
type dw_clientes from datawindow within w_ingresar_aumento_capacidad
end type
type dw_aumento_capacidad from datawindow within w_ingresar_aumento_capacidad
end type
type dw_supervisor from datawindow within w_ingresar_aumento_capacidad
end type
type dw_agente from datawindow within w_ingresar_aumento_capacidad
end type
end forward

global type w_ingresar_aumento_capacidad from window
integer x = 73
integer y = 48
integer width = 3442
integer height = 1976
boolean titlebar = true
string title = "Ingresar Aumento Capacidad"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
event ue_mousemove pbm_mousemove
pb_2 pb_2
st_seg_fune st_seg_fune
cb_aval cb_aval
cb_3 cb_3
dw_seguro dw_seguro
cb_ver_cuenta cb_ver_cuenta
cb_porce_comi cb_porce_comi
em_serie em_serie
p_1 p_1
st_help_memo st_help_memo
st_memo st_memo
st_buscar st_buscar
pb_buscar pb_buscar
dw_jefe dw_jefe
st_salir st_salir
st_limpiar st_limpiar
st_imprimir st_imprimir
st_grabar st_grabar
pb_print pb_print
pb_limpiar pb_limpiar
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
st_7 st_7
st_6 st_6
st_5 st_5
em_dv em_dv
st_4 st_4
em_rut em_rut
st_3 st_3
st_2 st_2
em_numero em_numero
st_1 st_1
dw_1 dw_1
dw_clientes dw_clientes
dw_aumento_capacidad dw_aumento_capacidad
dw_supervisor dw_supervisor
dw_agente dw_agente
end type
global w_ingresar_aumento_capacidad w_ingresar_aumento_capacidad

type variables
Date		id_fecha_dia
Datetime	idt_fecha_vig
Long		il_resp_age,il_resp_sup,il_graba_1,il_graba_2,il_graba_3,il_graba_4,il_graba_5,&
			il_graba_6,il_tipo_cliente=1,il_modif,il_modif_fec,il_modif_plazo
String		is_respuesta,is_serie, is_serie2,is_pasa_asigna='N',is_sw_age='N',is_sw_sup='N',is_sw_jef='N'
end variables

forward prototypes
public subroutine wf_nuevo_liberador ()
public function double f_comision_age2 (string as_tipo_sep, string as_area, integer an_capacidad, string as_uso)
public function integer f_tipo_contrato (string as_agente)
public function boolean wf_cadena (integer ai_modo)
public subroutine wf_limpiar ()
public subroutine wf_log_anexo_liberador ()
public subroutine wf_mostrar_liberador ()
public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso)
public function boolean f_validar ()
public subroutine wf_comisiones (string serie, double numero, double pie, integer credito, string area, string tipo_construccion)
end prototypes

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

public subroutine wf_nuevo_liberador ();string	ls_null
long		ll_null
Date		ld_null
setnull(ls_null);setnull(ll_null);setnull(ld_null)

cb_aceptar.text				= "Ingresar"
if isnull(gs_age) or isnull(gs_sup) or isnull(gs_jefe) or gs_age='' or gs_sup='' or gs_jefe='' then 
	dw_agente.reset()
	dw_supervisor.reset()
	dw_jefe.reset()
	dw_agente.InsertRow(0)
	dw_supervisor.InsertRow(0)
	dw_jefe.InsertRow(0)
	dw_clientes.InsertRow(0)
end if
dw_aumento_capacidad.reset()
dw_aumento_capacidad.InsertRow(0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_serie_m", gs_serie)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_aumento", gi_numero)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_ult_folio", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_base", ls_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_serie", ls_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_oferta", ll_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_rut", ll_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_tot_pagado", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cta_pag_m", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_abono_m", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_usuario", gs_user)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_fecha_ingreso", id_fecha_dia)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_forma_pago", ls_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_fecha_cierre", ld_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_fecha_com", ld_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_uf_cierre", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_resc", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_agente", gs_age)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_super", gs_sup)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_jef", gs_jefe)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_comi", "N")
dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_premio", "N")
dw_aumento_capacidad.SetItem(1, "anexo_aumento_total_com", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_por_ingre", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_sup", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_age", 0)
dw_aumento_capacidad.SetItem(1, 'estado_rut',1)
dw_aumento_capacidad.SetItem(1, "pago_aumento_serie_m", gs_serie)
dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_aumento", gi_numero)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha", id_fecha_dia)
dw_aumento_capacidad.SetItem(1, "pago_aumento_folio", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_precio", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_pie_pagado", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_pie", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_tasa", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_tasa_base", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_valor_cuota", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_cuotas", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_uf_dia", gd_uf_dia)
dw_aumento_capacidad.SetItem(1, "pago_aumento_moneda", ls_null)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_prim", ld_null)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_ult", ld_null)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_pie", ld_null)
dw_aumento_capacidad.SetItem(1, "pago_aumento_modificado", gs_user)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_mod", id_fecha_dia)
dw_aumento_capacidad.SetItem(1, "pago_aumento_gastos_adm", 0)
if isnull(gs_age) or isnull(gs_sup) or isnull(gs_jefe) or gs_age='' or gs_sup='' or gs_jefe='' then 
	em_rut.enabled				= true
	em_dv.enabled					= true
	em_rut.setfocus()
else
	if dw_clientes.retrieve(gi_rut)>0 then em_dv.text = dw_clientes.getitemstring(1,'dv')
	dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
	dw_aumento_capacidad.setitem(1, 'estado_contrato',0)
	dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
	dw_agente.enabled			= true
	dw_supervisor.enabled		= true
	dw_jefe.enabled				= true
	em_rut.enabled				= false
	em_dv.enabled					= false
	dw_agente.setfocus()
end if
end subroutine

public function double f_comision_age2 (string as_tipo_sep, string as_area, integer an_capacidad, string as_uso);double ld_porce_nf, ld_porce_ni

SELECT	"COMISIONES_INMOBI"."PORCE_NF",   
       	"COMISIONES_INMOBI"."PORCE_NI"  
INTO   	:ld_porce_nf,
       	:ld_porce_ni
FROM 		"COMISIONES_INMOBI"  
WHERE  ( "COMISIONES_INMOBI"."TIPO_SEP" = :as_tipo_sep ) AND  
       ( "COMISIONES_INMOBI"."AREA" = :as_area ) AND  
       ( "COMISIONES_INMOBI"."CAPACIDAD" = :an_capacidad );    

IF as_uso = "NF" THEN
	RETURN ld_porce_nf
ELSE
	RETURN ld_porce_ni
END IF

RETURN 0

end function

public function integer f_tipo_contrato (string as_agente);integer li_tipo_cont

SELECT	"AGENTES"."TIPO_CONT"  
INTO 		:li_tipo_cont
FROM 		"AGENTES"  
WHERE 	"AGENTES"."COD_AGE" = :as_agente;
	
RETURN li_tipo_cont


end function

public function boolean wf_cadena (integer ai_modo);string 	ls_barra,ls_base,ls_serie,ls_agente
datetime	ld_null
Double	ll_numero
ls_barra 	= 'A' + gs_serie + String(gi_numero)
setnull(ld_null)
gl_cod_parque	= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
if gl_cod_parque > 0 then idw_detalle2.retrieve(gl_cod_parque)
ls_agente		= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_cod_agente')
if isnull(gl_cod_parque) or gl_cod_parque=0 then
	SELECT	"AGENTES"."COD_PARQUE"  
	INTO 		:gl_cod_parque  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :ls_agente   
	USING		sqlca;
	if sqlca.sqlcode<>0 then gl_cod_parque	= 0
end if
ls_base		= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
ls_serie		= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
ll_numero	= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
IF ai_modo = 0 THEN // Es un Insert
	INSERT INTO "CADENA"
	("BARRA",	"RUT",  "CODIGO", "SERIE", 	"NUMERO", 	"ESTADO", "PRINT",	"EST_CUP",	"NRO_CARTA",	"FECHA_CARTA",	"ESTADO_CARTA",	"FECHA_ACT_ESTADO",	"CUOTA_CUPON",	"FECHA_RES",	"A_DEMANDAR",	"ESTADO_CONTABLE",	"ESTADO_TITULO",	"FECHA_TITULO",	"NRO_CARTA_M",	"FECHA_CARTA_M",	"ESTADO_CARTA_M",	"FECHA_ACT_ESTADO_M",	"COD_PARQUE")
	VALUES 
	(:ls_barra, :gi_rut,	'A',		:gs_serie,	:gi_numero,	'V',		'N',			'0',			'SC',				:ld_null,		'0',					:ld_null,				0,					:ld_null,		'0',				'A',						'N',					:ld_null,			'SC',				:ld_null,			'0', 					:ld_null,					:gl_cod_parque)
	USING	SQLCA;
	if sqlca.sqlcode = 0 then 
		il_graba_6	= 1
//		commit;
	else
		messagebox("Error Grabar Tabla CADENA","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
		il_graba_6	= 0
//		rollback;
	end if
	RETURN (SQLCA.SQLCode <> -1)
ELSE
	// Update
	UPDATE	"CADENA"  
   SET 		"COD_PARQUE" = :gl_cod_parque  
   WHERE  ( "CADENA"."CODIGO" = 'A' ) AND  
          ( "CADENA"."SERIE" = :gs_serie ) AND  
          ( "CADENA"."NUMERO" = :gi_numero )   
	using		sqlca;
	if sqlca.sqlcode = 0 then 
		il_graba_6	= 1
//		commit;
	else
		messagebox("Error Grabar Tabla CADENA","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
		il_graba_6	= 0
//		rollback;
	end if
	RETURN (SQLCA.SQLCode <> -1)
END IF
end function

public subroutine wf_limpiar ();long		ll_new,ll_cant,ll_null,ll_tot_reg,ll_indi
date		ld_null
string 	ls_null,ls_serie

if isnull(gd_uf_dia) then
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:gd_uf_dia  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia   ;
end if
dw_aumento_capacidad.reset()
dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
ll_new	= dw_aumento_capacidad.insertrow(0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_serie_m", gs_serie)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_aumento", gi_numero)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_ult_folio", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_base", ls_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_serie", ls_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_oferta", ll_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_rut", ll_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_tot_pagado", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cta_pag_m", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_abono_m", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_usuario", gs_user)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_fecha_ingreso", id_fecha_dia)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_forma_pago", ls_null)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_uf_cierre", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_nro_resc", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_agente", gs_age)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_super", gs_sup)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_jef", gs_jefe)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_comi", "N")
dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_premio", "N")
dw_aumento_capacidad.SetItem(1, "anexo_aumento_total_com", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_por_ingre", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_sup", 0)
dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_age", 0)
dw_aumento_capacidad.SetItem(1, 'estado_rut',1)
dw_aumento_capacidad.SetItem(1, 'estado_contrato',1)
dw_aumento_capacidad.SetItem(1, "pago_aumento_serie_m", gs_serie)
dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_aumento", gi_numero)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha", id_fecha_dia)
dw_aumento_capacidad.SetItem(1, "pago_aumento_folio", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_precio", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_pie_pagado", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_pie", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_tasa", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_tasa_base", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_valor_cuota", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_cuotas", 0)
dw_aumento_capacidad.SetItem(1, "pago_aumento_uf_dia", gd_uf_dia)
dw_aumento_capacidad.SetItem(1, "pago_aumento_moneda", ls_null)
dw_aumento_capacidad.SetItem(1, "pago_aumento_modificado", gs_user)
dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_mod", id_fecha_dia)
dw_aumento_capacidad.SetItem(1, "pago_aumento_gastos_adm", 0)
dw_clientes.reset()
dw_agente.reset()
dw_supervisor.reset()
dw_jefe.reset()
dw_supervisor.insertrow(0)
dw_agente.insertrow(0)
dw_clientes.insertrow(0)
dw_jefe.insertrow(0)
em_serie.reset()
DECLARE	x1 CURSOR FOR  
SELECT 	"TABLA_SERIES"."SERIE"  
FROM 		"TABLA_SERIES"  
WHERE 	"TABLA_SERIES"."BASE" = :gs_base   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0 
		fetch x1 into :ls_serie;
		if not isnull(ls_serie) then
			em_serie.AddItem(trim(ls_serie)) //if not isnull(ls_serie)	then 
		end if
		setnull(ls_serie)
	LOOP
end if
close x1;
dw_agente.enabled			= false
dw_supervisor.enabled		= false
dw_jefe.enabled				= false
dw_seguro.reset()
if gs_conexion = "Parque El Prado" then
	ll_tot_reg					= dw_seguro.retrieve(1,'A')
elseif gs_conexion = "Parque La Foresta" then
	ll_tot_reg					= dw_seguro.retrieve(11,'A')
elseif gs_conexion = "Parque Concepción" then
	ll_tot_reg					= dw_seguro.retrieve(801,'A')
end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled			= false
end subroutine

public subroutine wf_log_anexo_liberador ();String	ls_serie_m,ls_serie,ls_moneda,ls_base,ls_forma_pago
Long		ll_nro_liberador,ll_nro_oferta,ll_rut,ll_nro_cuotas,ll_cod_parque
Double	ll_saldo_financiero,ll_precio,ll_gastos_adm,ll_plazo,ll_tasa,&
			ll_uf_dia,ll_valor_cuota,ll_pie,ll_tasa_base
Datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_pie,ldt_fecha_hoy,ldt_fecha_ult,&
			ldt_fecha_ingreso
			
SELECT	sysdate  
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
ldt_fecha_hoy			= gdt_fec_sistema
ls_serie_m				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie_m')
ls_serie					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
ls_moneda				= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
ls_base					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
ls_forma_pago			= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')
ll_nro_liberador		= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_aumento')
ll_nro_oferta			= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
ll_rut						= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut')
ll_saldo_financiero		= dw_aumento_capacidad.getitemnumber(1,'saldo_finan')
ll_nro_cuotas			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
ll_precio					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio')
ll_valor_cuota			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota')
ll_pie						= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie')
ll_tasa					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa')
ll_tasa_base				= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa_base')
ll_gastos_adm			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm')
ll_uf_dia					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_uf_dia')
ldt_fecha					= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')
ldt_fecha_prim			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
ldt_fecha_ult			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_ult')
ldt_fecha_pie			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_pie')
ldt_fecha_ingreso		= dw_aumento_capacidad.getitemdatetime(1,'anexo_aumento_fecha_ingreso')
ll_cod_parque			= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
if ll_cod_parque > 0 then idw_detalle2.retrieve(ll_cod_parque)
if isnull(ls_serie_m) 		then ls_serie_m=' '
if isnull(ls_serie) 			then ls_serie=' '
if isnull(ls_moneda) 		then ls_moneda=' '
if isnull(ls_base) 			then ls_base=' '
if isnull(ls_forma_pago) 	then ls_forma_pago=' '
if isnull(ll_nro_liberador) then ll_nro_liberador=0
if isnull(ll_nro_oferta) 	then ll_nro_oferta=0
if isnull(ll_rut) 			then ll_rut=0
if isnull(ll_saldo_financiero) then ll_saldo_financiero=0
if isnull(ll_nro_cuotas) 	then ll_nro_cuotas=0
if isnull(ll_precio) 		then ll_precio=0
if isnull(ll_valor_cuota) 	then ll_valor_cuota=0
if isnull(ll_pie) 			then ll_pie=0
if isnull(ll_tasa) 			then ll_tasa=0
if isnull(ll_tasa_base) 	then ll_tasa_base=0
if isnull(ll_gastos_adm) 	then ll_gastos_adm=0
if isnull(ll_uf_dia) 		then ll_uf_dia=0
if isnull(ldt_fecha) 		then ldt_fecha=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_prim)	then ldt_fecha_prim=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ult) 	then ldt_fecha_ult=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_pie) 	then ldt_fecha_pie=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ingreso) then ldt_fecha_ingreso=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ll_cod_parque) 	then ll_cod_parque=0
INSERT INTO	"LOG_ANEXO_AUMENTO"  
			( "SERIE_M",   "NRO_AUMENTO",   	"RUT",   "BASE",   "SERIE",   "NRO_OFERTA",   "USUARIO_CREA",   "FECHA_CREA",   "FECHA",   "FORMA_PAGO",   "SALDO_FINANCIERO",   "MONEDA",   "PRECIO",   "PIE",   "FECHA_PIE",   "NRO_CUOTAS",   "FECHA_PRIM",   "TASA",   "TASA_BASE",	"GASTOS_ADM",   "UF_DIA",   "VALOR_CUOTA",   "FECHA_ULT",   "FECHA_INGRESO",		"COD_PARQUE" )  
VALUES	( :ls_serie_m, :ll_nro_liberador,:ll_rut, :ls_base, :ls_serie, :ll_nro_oferta, :gs_user,   		  :ldt_fecha_hoy,:ldt_fecha,:ls_forma_pago, :ll_saldo_financiero, :ls_moneda, :ll_precio, :ll_pie, :ldt_fecha_pie,:ll_nro_cuotas, :ldt_fecha_prim,:ll_tasa, :ll_tasa_base,	:ll_gastos_adm, :ll_uf_dia, :ll_valor_cuota, :ldt_fecha_ult,:ldt_fecha_ingreso,	:ll_cod_parque )  
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
end subroutine

public subroutine wf_mostrar_liberador ();Long		ll_count_reg,ll_count,ll_cod_seguro,ll_estado_reg,ll_reg
Double	ldb_monto

cb_aceptar.text 				= "Actualizar"
gi_rut 							= Long(dw_aumento_capacidad.GetItemNumber(1, "anexo_aumento_rut"))
dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
dw_aumento_capacidad.setitem(1, 'estado_contrato',0)
if dw_clientes.Retrieve(gi_rut)=0 then dw_clientes.insertrow(0)
dw_aumento_capacidad.SetItem(1,"compute",upper(dw_clientes.GetItemstring(1,"dv")))
em_dv.text						= upper(dw_clientes.GetItemstring(1,"dv"))
em_rut.text						= string(gi_rut)
SELECT	COUNT("CD_FOLIO_DETALLE"."BASE")  
INTO 		:ll_count_reg  
FROM 		"CD_FOLIO_DETALLE"  
WHERE  ( "CD_FOLIO_DETALLE"."BASE" = :gs_base ) AND
		 ( "CD_FOLIO_DETALLE"."SERIE" = :gs_serie ) AND  
		 ( "CD_FOLIO_DETALLE"."NUMERO" = :gi_numero ) AND
		 ( "CD_FOLIO_DETALLE"."ESTADO" = 99 )
USING		sqlca;
if ll_count_reg>0 then
	st_memo.italic						= true
else
	st_memo.italic						= false
end if
//if dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_resc') = 99 then
//	cb_aceptar.enabled				= false
//else
//	cb_aceptar.enabled				= true
//end if
em_rut.enabled						= false
em_dv.enabled							= false
SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
INTO			:ll_count
FROM 		"SEGURO_ASOCIADOS"  
WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
			  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
			  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
			  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
if ll_count > 0 then
	DECLARE x1 CURSOR FOR  
	SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
					"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
					"SEGURO_ASOCIADOS"."ESTADO_REG"  
	FROM 		"SEGURO_ASOCIADOS"  
	WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		do while sqlca.sqlcode=0
			Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
			if not isnull(ll_cod_seguro) then
				if ll_estado_reg = 0 then
					ll_reg = dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, dw_seguro.RowCount())
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
dw_seguro.enabled				= true

dw_aumento_capacidad.enabled	= true
dw_agente.enabled					= true
dw_supervisor.enabled				= true
dw_jefe.enabled						= true
dw_agente.setfocus()
end subroutine

public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso);double ld_porce_nf, ld_porce_ni

SELECT comisiones.porcent_nf,
	    comisiones.porcent_ni
INTO   :ld_porce_nf,
       :ld_porce_ni
FROM comisiones
WHERE (comisiones.tipo_venta = :as_tipo_venta) AND (comisiones.area_sepult = :as_area);

IF as_uso = "NF" THEN
	RETURN ld_porce_nf
ELSE
	RETURN ld_porce_ni
END IF

RETURN 0
end function

public function boolean f_validar ();string 	ls_forma_pago,ls_moneda
Double	lld_gastos_adm,lld_tasa,lld_kapital,lld_valor_cuo,lld_pie,lld_valor_adm
Long		ll_res

dw_aumento_capacidad.AcceptText()
dw_clientes.AcceptText()
IF IsNull(dw_aumento_capacidad.GetItemNumber(1, "anexo_aumento_rut")) THEN
	MessageBox("Error", "Debe ingresar el rut del cliente")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('anexo_aumento_rut')
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "anexo_aumento_cod_agente")) THEN
	MessageBox("Error", "Debe ingresar el codigo del agente")
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "anexo_aumento_cod_super")) THEN
	MessageBox("Error", "Debe ingresar el codigo del supervisor")
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "anexo_aumento_base")) THEN
	MessageBox("Error", "Debe ingresar base del contrato asociado")
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "anexo_aumento_serie")) THEN
	MessageBox("Error", "Debe ingresar la serie del contrato asociado")
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemNumber(1, "anexo_aumento_nro_oferta")) THEN
	MessageBox("Error", "Debe ingresar el número del contrato asociado")
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "anexo_aumento_serie_m")) THEN
	MessageBox("Error", "Debe ingresar la serie del Aumento Capacidad")
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemNumber(1, "anexo_aumento_nro_aumento")) THEN
	MessageBox("Error", "Debe ingresar el número del Aumento Capacidad")
	RETURN FALSE
END IF
ls_forma_pago	= dw_aumento_capacidad.GetItemString(1, "anexo_aumento_forma_pago")
IF IsNull(ls_forma_pago) THEN
	MessageBox("Error", "Debe ingresar la forma de pago")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('anexo_aumento_forma_pago')
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "anexo_aumento_area")) THEN
	MessageBox("Error", "Debe ingresar Area del Aumento Capacidad")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('anexo_aumento_area')
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemString(1, "pago_aumento_moneda")) THEN
	MessageBox("Error", "Debe ingresar el tipo de moneda")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_moneda')
	RETURN FALSE
END IF
IF dw_aumento_capacidad.GetItemNumber(1, "pago_aumento_precio") = 0 THEN
	MessageBox("Error", "Debe ingresar precio")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_precio')
	RETURN FALSE
END IF
IF dw_aumento_capacidad.GetItemNumber(1, "pago_aumento_tasa_base") = 0  and (dw_aumento_capacidad.GetItemString(1, 'anexo_aumento_forma_pago')='2' or dw_aumento_capacidad.GetItemString(1, 'anexo_aumento_forma_pago')='4') THEN
	MessageBox("Error", "Debe ingresar Tasa Contrato")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_tasa_base')
	RETURN FALSE
END IF
lld_gastos_adm	= double(dw_aumento_capacidad.GetItemNumber(1, "pago_aumento_gastos_adm"))
IF lld_gastos_adm = 0  and (ls_forma_pago='2' or ls_forma_pago='4') THEN
	ll_res		= MessageBox("Error", "Debe ingresar Gasto Administrativo, desea ingresarlo en '0'",Exclamation!,YesNo!,2)
	dw_aumento_capacidad.setfocus()
	if ll_res <> 1 then
		dw_aumento_capacidad.setcolumn('pago_aumento_gastos_adm')
		RETURN FALSE
	end if
END IF
IF dw_aumento_capacidad.GetItemNumber(1, "pago_aumento_valor_cuota") = 0 THEN
	MessageBox("Error", "Debe ingresar valor de la cuota")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_valor_cuota')
	RETURN FALSE
END IF
IF dw_aumento_capacidad.GetItemNumber(1, "pago_aumento_nro_cuotas") = 0 THEN
	MessageBox("Error", "Debe ingresar el número de cuotas")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_nro_cuotas')
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemDateTime(1, "pago_aumento_fecha_prim")) THEN
	MessageBox("Error", "Debe ingresar la fecha del primer vencimiento")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_fecha_prim')
	RETURN FALSE
END IF
IF IsNull(dw_aumento_capacidad.GetItemDateTime(1, "pago_aumento_fecha_ult")) THEN
	MessageBox("Error", "Debe ingresar la fecha del último vencimiento")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_fecha_ult')
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "nombre")) THEN
	MessageBox("Error", "Debe ingresar nombre del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "a_paterno")) THEN
	MessageBox("Error", "Debe ingresar apellido paterno del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "a_materno")) THEN
	MessageBox("Error", "Debe ingresar apellido materno del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "direccion_p")) THEN
	MessageBox("Error", "Debe ingresar la dirección particular del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "comuna")) THEN
	MessageBox("Error", "Debe ingresar la comuna donde vive el cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "ciudad")) THEN
	MessageBox("Error", "Debe ingresar la ciudad donde vive el cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "sexo")) THEN
	MessageBox("Error", "Debe ingresar el sexo del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemDateTime(1, "fecha_nac")) THEN
	MessageBox("Error", "Debe ingresar la fecha de nacimiento del cliente")
	RETURN FALSE
END IF
IF IsNull(dw_clientes.GetItemString(1, "esta_civil")) THEN
	MessageBox("Error", "Debe ingresar el estado civil del cliente")
	RETURN FALSE
END IF
ls_moneda		= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
lld_tasa			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa_base'))
if lld_tasa>100 then
	messagebox("Error","Valor Tasa Contrato Inválida")
	dw_aumento_capacidad.setfocus()
	dw_aumento_capacidad.setcolumn('pago_aumento_tasa_base')
	RETURN FALSE
end if
if ls_moneda='2' then //uf
	lld_kapital				= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio'))
	lld_valor_cuo			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota'))
	lld_valor_adm			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm'))
	lld_pie					= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie'))
	if lld_kapital>=500 then 
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_precio')
		RETURN FALSE
	elseif lld_valor_cuo>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_valor_cuota')
		RETURN FALSE
	elseif lld_valor_adm>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Gasto Administrativo)")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_gastos_adm')
		RETURN FALSE
	elseif lld_pie>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_pie')
		RETURN FALSE
	end if
end if
RETURN TRUE
end function

public subroutine wf_comisiones (string serie, double numero, double pie, integer credito, string area, string tipo_construccion);Long		correlativo,ll_cod_parque
double	c_pie,c_primera,c_segunda,c_tercera,c_cuarta,c_quinta ,c_sexta , c_septima, c_octava, c_novena,	porce_comi 

ll_cod_parque	= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
if ll_cod_parque>0 then
	if ll_cod_parque > 0 then idw_detalle2.retrieve(ll_cod_parque)
	SELECT	SERIE,	NUMERO  
	INTO 		:serie,	:numero  
	FROM 		COMISION_PROMESA  
	WHERE  ( BASE = 'A' ) AND ( SERIE = :serie ) AND ( NUMERO = :numero )   ;
	if sqlca.sqlcode = 0 then
		if pie < 10 then
			SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA,  C_OCTAVA,	C_NOVENA,  (C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) AS PORCENTAJE  
			INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima, :c_octava,:c_novena, :porce_comi 
			FROM 		PORCENTAJE_COMISIONES  
			WHERE  ( PIE_MIN <= :pie AND  PIE_MAX >= :pie) AND  
						AREA = :area AND T_CONS = :tipo_construccion AND ( CREDITO_MIN <= :credito AND CREDITO >= :credito ) AND
					 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0 and 
					   COD_PARQUE = :ll_cod_parque;
		elseif pie >= 10 then
			SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  , C_SEPTIMA, C_OCTAVA,	C_NOVENA,  (C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) AS PORCENTAJE  
			INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima, :c_octava,:c_novena, :porce_comi 
			FROM 		PORCENTAJE_COMISIONES  
			WHERE  ( PIE_MIN <= :pie AND  PIE_MAX >= :pie) AND  
						AREA = :area AND T_CONS = :tipo_construccion AND
					 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and 
					   COD_PARQUE = :ll_cod_parque;
		end if
		if sqlca.sqlcode = 0 and not isnull(correlativo) then
			UPDATE "COMISION_PROMESA"  
			SET C_PIE     = :c_pie,   
				 C_PRIMERA = :c_primera,   
				 C_SEGUNDA = :c_segunda,   
				 C_TERCERA = :c_tercera,   
				 C_CUARTA  = :c_cuarta,   
				 C_QUINTA  = :c_quinta,   
				 C_SEXTA   = :c_sexta,
				 C_SEPTIMA = :c_septima,
				 C_OCTAVA  = :c_octava,
				 C_NOVENA  = :c_novena
			where base    = 'A' and serie = :serie and numero = :numero ;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"PORCE_AGE" = :porce_comi ,
							"ESTATUS_COMISION" = '1'  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :numero ) ;
				if sqlca.sqlcode = 0 then
					commit;
				else
					ROLLBACK;
				end if
			end if
		end if
	end if
end if
end subroutine

on w_ingresar_aumento_capacidad.create
this.pb_2=create pb_2
this.st_seg_fune=create st_seg_fune
this.cb_aval=create cb_aval
this.cb_3=create cb_3
this.dw_seguro=create dw_seguro
this.cb_ver_cuenta=create cb_ver_cuenta
this.cb_porce_comi=create cb_porce_comi
this.em_serie=create em_serie
this.p_1=create p_1
this.st_help_memo=create st_help_memo
this.st_memo=create st_memo
this.st_buscar=create st_buscar
this.pb_buscar=create pb_buscar
this.dw_jefe=create dw_jefe
this.st_salir=create st_salir
this.st_limpiar=create st_limpiar
this.st_imprimir=create st_imprimir
this.st_grabar=create st_grabar
this.pb_print=create pb_print
this.pb_limpiar=create pb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.em_dv=create em_dv
this.st_4=create st_4
this.em_rut=create em_rut
this.st_3=create st_3
this.st_2=create st_2
this.em_numero=create em_numero
this.st_1=create st_1
this.dw_1=create dw_1
this.dw_clientes=create dw_clientes
this.dw_aumento_capacidad=create dw_aumento_capacidad
this.dw_supervisor=create dw_supervisor
this.dw_agente=create dw_agente
this.Control[]={this.pb_2,&
this.st_seg_fune,&
this.cb_aval,&
this.cb_3,&
this.dw_seguro,&
this.cb_ver_cuenta,&
this.cb_porce_comi,&
this.em_serie,&
this.p_1,&
this.st_help_memo,&
this.st_memo,&
this.st_buscar,&
this.pb_buscar,&
this.dw_jefe,&
this.st_salir,&
this.st_limpiar,&
this.st_imprimir,&
this.st_grabar,&
this.pb_print,&
this.pb_limpiar,&
this.cb_cerrar,&
this.cb_aceptar,&
this.st_7,&
this.st_6,&
this.st_5,&
this.em_dv,&
this.st_4,&
this.em_rut,&
this.st_3,&
this.st_2,&
this.em_numero,&
this.st_1,&
this.dw_1,&
this.dw_clientes,&
this.dw_aumento_capacidad,&
this.dw_supervisor,&
this.dw_agente}
end on

on w_ingresar_aumento_capacidad.destroy
destroy(this.pb_2)
destroy(this.st_seg_fune)
destroy(this.cb_aval)
destroy(this.cb_3)
destroy(this.dw_seguro)
destroy(this.cb_ver_cuenta)
destroy(this.cb_porce_comi)
destroy(this.em_serie)
destroy(this.p_1)
destroy(this.st_help_memo)
destroy(this.st_memo)
destroy(this.st_buscar)
destroy(this.pb_buscar)
destroy(this.dw_jefe)
destroy(this.st_salir)
destroy(this.st_limpiar)
destroy(this.st_imprimir)
destroy(this.st_grabar)
destroy(this.pb_print)
destroy(this.pb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.em_dv)
destroy(this.st_4)
destroy(this.em_rut)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_numero)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.dw_clientes)
destroy(this.dw_aumento_capacidad)
destroy(this.dw_supervisor)
destroy(this.dw_agente)
end on

event open;long		ll_cant,ll_null,ll_tot_reg,ll_indi
double	ll_numero_doc_pend
datetime	ld_null
string 	ls_null,ls_opcion_dig,ls_serie,ls_serie_doc_pend

gf_centrar(w_ingresar_aumento_capacidad)
SELECT DISTINCT "FACTORES"."FECHA_VIGENCIA"  
INTO 		:idt_fecha_vig  
FROM 	"FACTORES"  
WHERE 	"FACTORES"."ESTADO_VIGENCIA" = 'V'   
USING	sqlca;
dw_seguro.SetTransObject(SQLCA)
if gs_conexion = "Parque El Prado" then
	ll_tot_reg				= dw_seguro.retrieve(1,'A')
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	ll_tot_reg			= dw_seguro.retrieve(11,'A')
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
	ll_tot_reg			= dw_seguro.retrieve(801,'A')
end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
if isvalid(w_consultar_documentos_pendientes) then 
	ls_serie_doc_pend			= gs_serie
	ll_numero_doc_pend		= gi_numero
end if	
dw_seguro.enabled			= false
SELECT	"ENCARGADOS"."DIGITACION"
INTO 		:ls_opcion_dig
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_opcion_dig='1' or ls_opcion_dig='3'then 
		cb_aceptar.enabled	= true
	elseif ls_opcion_dig='2' then
		cb_aceptar.enabled	= false
	end if
end if
dw_clientes.SetTransObject(SQLCA)
dw_1.settransobject(sqlca)
dw_aumento_capacidad.SetTransObject(SQLCA)
dw_aumento_capacidad.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if

dw_aumento_capacidad.getchild('anexo_aumento_area',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if

dw_agente.SetTransObject(SQLCA)
dw_supervisor.SetTransObject(SQLCA)
dw_jefe.SetTransObject(SQLCA)

em_serie.text					= ''
gs_base							= 'A'
gs_serie							= ''
em_numero.text				= ''
em_rut.text						= ''
em_dv.text						= ''
id_fecha_dia					= date(gdt_fec_sistema)
cb_aval.enabled				= False
DECLARE	x1 CURSOR FOR  
SELECT 	"TABLA_SERIES"."SERIE"  
FROM 	"TABLA_SERIES"  
WHERE 	"TABLA_SERIES"."BASE" = :gs_base   
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0 
		fetch x1 into :ls_serie;
		if not isnull(ls_serie) then
			em_serie.AddItem(trim(ls_serie)) //if not isnull(ls_serie)	then 
		end if
		setnull(ls_serie)
	LOOP
end if
close x1;
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia  
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia;
IF gd_uf_dia = 0 or isnull(gd_uf_dia) THEN 
	messagebox("Advertencia","No se Registra U.F. del día "+string(id_fecha_dia))
	Open(w_mantenedor_uf)
end if
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia
using		sqlca;
if sqlca.sqlcode<>0 then
	close(w_ingresar_aumento_capacidad)
else
	setnull(gs_base);setnull(gs_serie);setnull(gi_numero);setnull(gi_rut)
	pb_limpiar.triggerevent(clicked!)
	em_rut.enabled	= false
	em_dv.enabled		= false
	em_serie.setfocus()
end if
if isvalid(w_consultar_documentos_pendientes) then 
	em_serie.text			= ls_serie_doc_pend
	em_numero.text		= string(ll_numero_doc_pend)
	em_numero.triggerEvent(modified!)
end if	
end event

type pb_2 from picturebutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 1454
integer y = 1664
integer width = 174
integer height = 152
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Contabilidad (o).BMP"
string disabledname = "Contabilidad (o)_no.bmp"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= true
st_help_memo.visible		= false
st_seg_fune.visible		= true
end event

event clicked;String		ls_string
Long		ll_existe

gs_serie		= trim(em_serie.text)
gi_numero	= Double(em_numero.text)
ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
ll_existe		= dw_seguro.find('(codigo=10 or codigo=11 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
if ll_existe > 0 and gi_numero > 0 then
	if isvalid(w_ingresar_benef_seguro_funeraria) then close(w_ingresar_benef_seguro_funeraria)
	openwithparm(w_ingresar_benef_seguro_funeraria,ls_string)
else
	messagebox("Advertencia","Debe estar Seleccionado Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
end if

end event

type st_seg_fune from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1111
integer y = 1600
integer width = 859
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Ingresar Beneficios Seguro Funeraria"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type cb_aval from commandbutton within w_ingresar_aumento_capacidad
integer x = 2606
integer y = 1656
integer width = 306
integer height = 76
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Aval"
end type

event clicked;Long	ll_rut_aval
ll_rut_aval	= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut_aval')
if isvalid(w_aval) then close(w_aval)
if not isnull(ll_rut_aval) and ll_rut_aval>0 then OpenWithParm(w_aval, STRING(ll_rut_aval))
end event

type cb_3 from commandbutton within w_ingresar_aumento_capacidad
boolean visible = false
integer x = 142
integer y = 1960
integer width = 251
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;Long	ll_nulo
Date	ld_nulo
ll_nulo	= 0
setnull(ld_nulo)
dw_aumento_capacidad.accepttext()
dw_aumento_capacidad.setitem(1,'pago_aumento_pie',ll_nulo)
dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_pie',ld_nulo)
dw_aumento_capacidad.accepttext()
dw_aumento_capacidad.setfocus()
dw_aumento_capacidad.setcolumn('pago_aumento_pie')
end event

type dw_seguro from datawindow within w_ingresar_aumento_capacidad
integer x = 2505
integer y = 40
integer width = 859
integer height = 592
integer taborder = 80
string dataobject = "dw_lista_seguro_seleccion_ctto"
boolean vscrollbar = true
boolean border = false
end type

type cb_ver_cuenta from commandbutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 2112
integer y = 1732
integer width = 480
integer height = 76
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "C&uenta corriente"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
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
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
END IF
end event

type cb_porce_comi from commandbutton within w_ingresar_aumento_capacidad
integer x = 2112
integer y = 1656
integer width = 480
integer height = 76
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "% &Comisión"
end type

event clicked;String	ls_string
if gi_numero>0 and not isnull(gs_serie) then
	gs_base		= 'A'
	gs_serie 	= trim(em_serie.text)
	gi_numero	= Double(trim(em_numero.text))	
	ls_string 	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	OpenWithParm(w_porcentaje_comision_ctto,ls_string)
end if
end event

type em_serie from dropdownlistbox within w_ingresar_aumento_capacidad
integer x = 626
integer y = 124
integer width = 233
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
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_ingresar_aumento_capacidad
boolean visible = false
integer x = 73
integer y = 112
integer width = 146
integer height = 112
boolean enabled = false
string picturename = "logo_parque_conce.jpg"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_help_memo from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 27
integer y = 1600
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Ingresar Memorandum"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type st_memo from commandbutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 87
integer y = 1664
integer width = 430
integer height = 152
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Memorandum"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= true
st_seg_fune.visible		= false
end event

event clicked;string	ls_numero,ls_serie,ls_string
Long		ll_nro_aux
gs_serie 	= trim(em_serie.text)
gs_base		= 'A'
gi_numero	= Double(trim(em_numero.text))
ls_numero 	= trim(em_numero.text)
if not isnull(gs_serie) and gs_serie<>'' and gi_numero>0 and not isnull(gs_age) and gs_age<>'' then
	SELECT	"CADENA"."NUMERO"  
	INTO 		:ll_nro_aux    
	FROM 		"CADENA"  
	WHERE  ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) 
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ls_string 	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
		OpenWithParm(w_ingreso_cd_memorandum_digitacion,ls_string)
		w_ingreso_cd_memorandum_digitacion.setfocus()
	else
		messagebox("Advertencia","Antes de Ingresar Memorandum debería estar Digitado Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"####,###,###,##0"))
	end if
//	em_numero.setfocus()
end if
end event

type st_buscar from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1216
integer y = 1600
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Buscar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
st_help_memo.visible		= false
end event

type pb_buscar from picturebutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 1243
integer y = 1664
integer width = 174
integer height = 152
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar.BMP"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= true
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;openwithparm(w_listado_contrato,'A')
end event

type dw_jefe from datawindow within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 1915
integer y = 512
integer width = 421
integer height = 92
integer taborder = 60
boolean bringtotop = true
string dataobject = "dwe_jefes"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_help_memo.visible		= false
end event

event itemchanged;Long		ll_resp,ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_rut,ll_nro,ll_cod_parque
String		ls_string,ls_obs,ls_tipo_cont,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_jefe,ls_cod_jefe,&
			ls_base_aux,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_contrato,ls_serie_contrato
Datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,&
			ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf,ll_numero_asoc

this.accepttext()
ls_cod_jefe	= dw_jefe.getitemstring(1,'jefes')
if not isnull(ls_cod_jefe) then
	if gi_rut>0 then
		is_sw_jef		= 'S'
		gs_base			= 'A'
		if gi_rut>0 then
			if is_pasa_asigna='S' then
				gs_serie = trim(em_serie.Text)
				gs_age	= dw_agente.getitemstring(1,'agente')
				gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
				gs_jefe	= dw_jefe.getitemstring(1,'jefes')
				if not isnull(gs_jefe) and gs_jefe<>'' then
					SELECT DISTINCT	"JEFE_VENTAS"."JEFE_VENTAS"  
					INTO 		:ls_jefe  
					FROM 		"JEFE_VENTAS"  
					WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if isnull(gs_jefe) then
							messagebox("Advertencia","Debe Ingresar Jefe Venta")
							dw_jefe.setfocus()
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_jef", gs_jefe)
							dw_aumento_capacidad.accepttext()
							if il_resp_age<>1 and il_resp_sup<>1 then
								if is_sw_jef='S' and gs_age<>'' and not isnull(gs_age) and gs_sup<>'' and not isnull(gs_sup) then //gs_nueva_oferta='S' and 
									ll_resp	= MessageBox("Advertencia", "Está seguro de ASIGNAR Liberador Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
									IF ll_resp = 1 THEN
										ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
										openwithparm(w_verificar_datos_contrato,ls_string)
										IF trim(Message.StringParm)='OK' THEN
											SELECT	"AGENTES"."TIPO_CONT"  
											INTO 		:ls_tipo_cont  
											FROM 		"AGENTES"  
											WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
											if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
												INSERT INTO "COMISION_PROMESA"  
															( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
												VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0			,0				,0			,0 )  
												USING		sqlca	;
												if sqlca.sqlcode=0 then
													ll_grabar_1	= 1
//													commit;
												else
													ll_grabar_1	= 0
//													rollback;
												end if
											end if
											ls_obs	= 'Aumento Capacidad creado por '+gs_user+' el '+string(gdt_fec_sistema)
											if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
											dw_aumento_capacidad.enabled			= true
											if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
												isnull(dw_jefe.getitemstring(1,'jefes')) then
												dw_aumento_capacidad.setitem(1,'estado_rut',1)
											else
												if gi_rut>0 then dw_aumento_capacidad.setitem(1,'estado_rut',0)
											end if
											////
											SELECT	"CADENA"."CODIGO"  
											INTO 		:ls_base_aux  
											FROM 		"CADENA"  
											WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
													 ( "CADENA"."SERIE" = :gs_serie ) AND  
													 ( "CADENA"."NUMERO" = :gi_numero )   
											USING		sqlca;
											if sqlca.sqlcode=100 then
												SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
												INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
												FROM 		"REVISION_CONTRATOS"  
												WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
														 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
														 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
														 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
												USING		sqlca;
												if sqlca.sqlcode=0 then
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_base',ls_base_asoc)
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_serie',ls_serie_asoc)
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_nro_oferta',ll_numero_asoc)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha',ldt_fecha_ctto_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_moneda',ls_moneda_rev)
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_forma_pago',ls_forma_pago_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_pie',ldb_pie_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_nro_cuotas',ll_plazo_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_gastos_adm',ldb_gasto_adm_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_valor_cuota',ldb_valor_cuota_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_precio',ldb_precio_ctto_rev)
													dw_aumento_capacidad.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha_prim',ldt_fecha_prim_rev)
													SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
													INTO 		:ldb_int_peso,								:ldb_int_uf
													FROM 		"INTERES_CUOTAS"  
													WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
															ldb_int_peso	= 0
															ldb_int_uf		= 0
														end if
														if ls_moneda_rev='1' then //peso
															dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_peso)
														elseif ls_moneda_rev='2' then //UF
															dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_uf)
														end if
													end if
													ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
													ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
													ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
													if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
														dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
														idw_detalle.settransobject(sqlca)
														idw_detalle.retrieve(ls_base_contrato)
													end if
													if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
														SELECT	"CADENA"."RUT"
														INTO 		:ll_rut
														FROM 		"CADENA"
														WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
																  ("CADENA"."SERIE" = :ls_serie_contrato) and
																  ("CADENA"."NUMERO" = :ll_nro) 
														USING		sqlca;
														if sqlca.sqlcode=0 then
															if gi_rut = ll_rut then
																dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																			  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																			  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																			  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
																if ll_resp=1 then
																	dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																	cb_aceptar.enabled	= true
																else
																	dw_aumento_capacidad.setitem(1,'estado_contrato',1)
																	cb_aceptar.enabled	= false
																end if
															end if
														else
															MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
															dw_aumento_capacidad.setitem(1,'estado_contrato',1)
															cb_aceptar.enabled	= false
														end if
													end if
												end if
											end if
											////
											dw_aumento_capacidad.setfocus()
											dw_aumento_capacidad.setcolumn('anexo_aumento_base')
										else
											dw_aumento_capacidad.enabled			= false
											dw_aumento_capacidad.setitem(1,'estado_rut',1)
											messagebox("Advertencia","NO fue Asignado Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
										end if
									else
										dw_aumento_capacidad.setitem(1,'estado_rut',1)
									END IF
								end if
							end if
						end if
					else
						messagebox("Advertencia","Jefe de Venta Inexistente")
						dw_jefe.reset()
						dw_jefe.insertrow(0)
						dw_jefe.setfocus()
						gs_jefe	= ''
					end if
				end if
		
			elseif is_pasa_asigna='N' and is_sw_jef='S' then
				gs_serie = trim(em_serie.Text)
				gs_age	= dw_agente.getitemstring(1,'agente')
				gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
				gs_jefe	= dw_jefe.getitemstring(1,'jefes')
				if not isnull(gs_jefe) and gs_jefe<>'' then
					SELECT DISTINCT	"JEFE_VENTAS"."JEFE_VENTAS"  
					INTO 		:ls_jefe  
					FROM 		"JEFE_VENTAS"  
					WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if isnull(gs_jefe) then
							messagebox("Advertencia","Debe Seleccionar Jefe Venta")
							dw_jefe.setfocus()
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_jef", gs_jefe)
							dw_aumento_capacidad.accepttext()
							if is_sw_jef='S' and gs_age<>'' and not isnull(gs_age) and gs_sup<>'' and not isnull(gs_sup) then//if il_resp_age=2 and il_resp_sup=2 and is_sw_jef='S' then
								ll_resp	= MessageBox("Advertencia", "Está seguro de ASIGNAR Aumento Capacidad Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								IF ll_resp = 1 THEN
									ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										SELECT	"AGENTES"."TIPO_CONT"  
										INTO 		:ls_tipo_cont  
										FROM 		"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
											INSERT INTO "COMISION_PROMESA"  
														( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
											VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0			,0				,0				,0 )  
											USING		sqlca	;
											if sqlca.sqlcode=0 then
//												commit;
												ll_grabar_1	= 1
											else
//												rollback;
												ll_grabar_1	= 0
											end if
										end if
										ls_obs	= 'Aumento Capacidad creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_aumento_capacidad.enabled			= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_aumento_capacidad.setitem(1,'estado_rut',1)
										else
											if gi_rut>0 then dw_aumento_capacidad.setitem(1,'estado_rut',0)
										end if
										////
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 		"CADENA"  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
											INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
											FROM 		"REVISION_CONTRATOS"  
											WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
													 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
													 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
													 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_base',ls_base_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_serie',ls_serie_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_nro_oferta',ll_numero_asoc)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha',ldt_fecha_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_moneda',ls_moneda_rev)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_forma_pago',ls_forma_pago_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_pie',ldb_pie_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_nro_cuotas',ll_plazo_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_gastos_adm',ldb_gasto_adm_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_valor_cuota',ldb_valor_cuota_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_precio',ldb_precio_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha_prim',ldt_fecha_prim_rev)
												SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
												INTO 		:ldb_int_peso,								:ldb_int_uf
												FROM 		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
														ldb_int_peso	= 0
														ldb_int_uf		= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_uf)
													end if
												end if
												ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
												ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
												ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
												if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
													dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
													idw_detalle.settransobject(sqlca)
													idw_detalle.retrieve(ls_base_contrato)
												end if
												if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
													SELECT	"CADENA"."RUT"
													INTO 		:ll_rut
													FROM 		"CADENA"
													WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
															  ("CADENA"."SERIE" = :ls_serie_contrato) and
															  ("CADENA"."NUMERO" = :ll_nro) 
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if gi_rut = ll_rut then
															dw_aumento_capacidad.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																		  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																		  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																		  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
															if ll_resp=1 then
																dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																dw_aumento_capacidad.setitem(1,'estado_contrato',1)
																cb_aceptar.enabled	= false
															end if
														end if
													else
														MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
														dw_aumento_capacidad.setitem(1,'estado_contrato',1)
														cb_aceptar.enabled	= false
													end if
												end if
											end if
										end if
										////
										dw_aumento_capacidad.setfocus()
										dw_aumento_capacidad.setcolumn('anexo_aumento_base')
									else
										dw_aumento_capacidad.enabled			= false
										dw_aumento_capacidad.setitem(1,'estado_rut',1)
										messagebox("Advertencia","NO fue Asignado Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									end if
								else
									dw_aumento_capacidad.setitem(1,'estado_rut',1)
								END IF
							end if
						end if
					else
						messagebox("Advertencia","Jefe de Venta Inexistente")
						dw_jefe.reset()
						dw_jefe.insertrow(0)
						dw_jefe.setfocus()
						gs_jefe	= ''
					end if
				end if
			end if
			if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
				commit using sqlca;
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"COD_AGENTE" = :gs_age,   
							"COD_SUPER" = :gs_sup,   
							"COD_JEF" = :gs_jefe  
				WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			else
				rollback using sqlca;
			end if
		end if
		ll_cod_parque	= dw_aumento_capacidad.getitemnumber(1, "cadena_cod_parque")
		if ll_cod_parque > 0 then idw_detalle2.retrieve(ll_cod_parque)
		this.accepttext()
	else
		messagebox("Advertencia","Recuerde antes de Asingar debe ingresar Rut Cliente")
		dw_jefe.reset()
		dw_jefe.insertrow(0)
		if gs_nueva_oferta='S' then
			dw_supervisor.reset()
			dw_agente.reset()
			dw_supervisor.insertrow(0)
			dw_agente.insertrow(0)
		end if
		em_rut.setfocus()
	end if
end if
end event

type st_salir from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3173
integer y = 1600
integer width = 197
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Salir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type st_limpiar from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1006
integer y = 1600
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Limpiar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type st_imprimir from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 795
integer y = 1600
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Imprimir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type st_grabar from statictext within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 585
integer y = 1600
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Grabar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type pb_print from picturebutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 823
integer y = 1664
integer width = 174
integer height = 152
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= true
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;String		ls_serie
Double	ll_numero

ls_serie		= trim(em_serie.text)
ll_numero	= Double(trim(em_numero.text))
if not isnull(ls_serie) and ll_numero>0 then
	if dw_1.retrieve(ls_serie,ll_numero) > 0 then f_Print( dw_1 )
end if
end event

type pb_limpiar from picturebutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 1033
integer y = 1664
integer width = 174
integer height = 152
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "trash.bmp"
end type

event ue_mousemove;st_limpiar.visible			= true
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;long		ll_new,ll_cant,ll_null
date		ld_null
string 	ls_null

//setnull(gs_base);setnull(gs_serie);setnull(gi_numero)
Setnull(il_graba_1);Setnull(il_graba_2);Setnull(il_graba_3);Setnull(il_graba_4)
Setnull(il_graba_5);Setnull(il_graba_6);Setnull(gl_cod_parque)
gs_base			= 'A'
gs_serie			= ''
em_numero.text	= ''
em_rut.text		= ''
em_dv.text		= ''
is_pasa_asigna	= 'N'
is_sw_age		= 'N'
is_sw_sup		= 'N'
is_sw_jef		= 'N'
st_memo.italic	= false
em_rut.enabled= true
em_dv.enabled	= true
wf_limpiar()
em_serie.setfocus()
end event

type cb_cerrar from picturebutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 3182
integer y = 1664
integer width = 174
integer height = 152
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= true
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;close(w_ingresar_aumento_capacidad)
end event

type cb_aceptar from picturebutton within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 613
integer y = 1664
integer width = 174
integer height = 152
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= true
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;double 	ld_porcent_age, ld_porcent_sup,ll_valor_cuota,pie,precio,porcentaje,ldb_tasa,ldb_uf_dia,ldb_gastos_adm,&
			ldb_pie_pagado,ld_saldo_finan,ll_cuota,ld_porc_jefe,ldb_tasa_base,ldb_valor_cuota,ldb_monto,&
			ldb_valor_cuota_mant,ldb_calculo,ldb_tasa_int_cta,ldb_tasa_cta
datetime	ld_fecha_pie,ld_fecha_ult,ld_fecha,ld_fecha_prim,ldt_fecha_prim,ldt_fec_venc_mant,ld_fecha_min,ld_fecha_max
long 		ll_contador,rut,numero,rut_busca,nro_cuotas,i,ll_estado_cd,ll_tot_reg,ll_indi,ll_est_reg,ll_codigo,ll_dias_tope_def,&
			ll_estado_graba,ll_nro_asoc,ll_cta_pag_m,ll_ctas,nro_cuotas_aux,ll_capacidad,ll_ult_folio,ll_count,&
			ll_plazo,ll_rut,ll_cod_parque,ll_count_vig,ll_dias_inicio_def,ll_cant
string 	compute,serie,tipo_cont,ls_moneda,tipo_cons,area,forma_pago,ls_depto_asignado,&
			ls_glosa,ls_memo,ls_ref,ls_base_asoc,ls_serie_asoc,ls_anexo_aumento,ls_tipo_venta,&
			ls_area,ls_uso,ls_tipo_sepult,ls_dv,ls_estado_cadena,ls_modif,ls_canal_venta

dw_aumento_capacidad.accepttext()
SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 then
	if String(dw_aumento_capacidad.getitemstring(1,'compute')) <> String(gf_obtener_dv(long(dw_aumento_capacidad.GetItemNumber(1, "anexo_aumento_rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.SetColumn('anexo_aumento_rut')
		return
	end if
	gs_age			= dw_agente.getitemstring(1,'agente')
	gs_sup			= dw_supervisor.getitemstring(1,'supervisores')
	gs_jefe			= dw_jefe.getitemstring(1,'jefes')
	precio   			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio')
	forma_pago		= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')
	ll_cuota   		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota')
	ls_tipo_venta	= dw_aumento_capacidad.GetItemString(1,"anexo_aumento_tipo_venta")
	ls_area			= dw_aumento_capacidad.GetItemString(1,"anexo_aumento_area")
	ls_uso			= dw_aumento_capacidad.GetItemString(1,"anexo_aumento_uso")
	ls_tipo_sepult	= dw_aumento_capacidad.GetItemString(1,"anexo_aumento_tipo_sepult")
	ll_capacidad		= dw_aumento_capacidad.GetItemNumber(1,"pago_aumento_capacidad")
	gl_cod_parque	= dw_aumento_capacidad.GetItemNumber(1,"cadena_cod_parque")
	ld_fecha_pie	= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_pie')
	ld_fecha_prim	= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
	ld_fecha			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')
	ld_fecha_ult		= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_ult')
	ls_canal_venta	= dw_aumento_capacidad.GetItemString(1,"anexo_aumento_canal_venta")
	
	
	ld_fecha_min	= datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
	ld_fecha_max	= datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
	SELECT 	count("ANEXO_AUMENTO"."NRO_AUMENTO"  )
	INTO 		:ll_cant 
	FROM 	"ANEXO_AUMENTO"  
	WHERE 	( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
				( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   ;
	if ll_cant =0 or dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_resc') = 0 then
		if (ld_fecha < ld_fecha_min or ld_fecha > ld_fecha_max) and not isnull(ld_fecha) then
			messagebox("Advertencia","Fecha Contrato Inválida")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_fecha')
			return
		end if
	
		if (ld_fecha_pie < ld_fecha_min or ld_fecha_pie > ld_fecha_max) and not isnull(ld_fecha_pie) then
			messagebox("Advertencia","Fecha Pie Inválida")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_oferta_fecha_pie')
			return
		end if

		if (ld_fecha_prim < ld_fecha_min or ld_fecha_prim > ld_fecha_max) and not isnull(ld_fecha_prim) then
			messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_fecha_prim')
			return
		end if
	end if
	if ld_fecha_ult < ld_fecha_min and not isnull(ld_fecha_ult) then
		messagebox("Advertencia","Fecha Ultimo Vencimiento Inválida")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_fecha_ult')
		return
	end if
	
	if isnull(gl_cod_parque) or gl_cod_parque=0 then
		messagebox('Advertencia','Debe Ingresar Código Parque',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('cadena_cod_parque')
		return
	end if
	if isnull(forma_pago) or forma_pago='' then
		messagebox('Advertencia','Debe Ingresar Forma de Pago',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('anexo_aumento_forma_pago')
		return
	end if
	if isnull(ls_area) or ls_area='' then
		messagebox('Advertencia','Debe Ingresar Area',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('anexo_aumento_area')
		return
	end if
	if isnull(ls_tipo_venta) or ls_tipo_venta='' then
		messagebox('Advertencia','Debe Ingresar Tipo Venta',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('anexo_aumento_tipo_venta')
		return
	end if
	if isnull(ls_canal_venta) or ls_canal_venta='' then
		messagebox('Advertencia','Debe Ingresar Canal de Venta',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('anexo_aumento_canal_venta')
		return
	end if
	if isnull(ls_uso) or ls_uso='' then
		messagebox('Advertencia','Debe Ingresar Uso',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('anexo_aumento_uso')
		return
	end if
	if isnull(ls_tipo_sepult) or ls_tipo_sepult='' then
		messagebox('Advertencia','Debe Ingresar Tipo Sepultura',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('anexo_aumento_tipo_sepult')
		return
	end if
	if isnull(ll_capacidad) or ll_capacidad<=0 then
		messagebox('Advertencia','Debe Ingresar Capacidad',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_capacidad')
		return
	end if
	if isnull(precio) or precio<=0 then
		messagebox('Advertencia','Debe Ingresar Precio',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_precio')
		return
	end if
	if gs_age='' or isnull(gs_age) then
		messagebox('Advertencia','Codigo Agente Inválido',stopsign!)
		dw_agente.setfocus()
		return
	end if
	if gs_sup='' or isnull(gs_sup) then
		messagebox('Advertencia','Codigo Supervisor Inválido',stopsign!)
		dw_supervisor.setfocus()
		return
	end if
	if gs_jefe='' or isnull(gs_jefe) then
		messagebox('Advertencia','Codigo Jefe de Venta Inválido',stopsign!)
		dw_jefe.setfocus()
		return
	end if
	if isnull(ll_cuota) or ll_cuota<=0 then
		messagebox('Advertencia','Debe Ingresar Valor Cuota',stopsign!)
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_valor_cuota')
		return
	end if
	
	dw_aumento_capacidad.SetItem(1, "anexo_aumento_estado_comi_sup", 'N')
	SELECT	"AGENTES"."TIPO_CONT"  
	INTO 		:tipo_cont  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :gs_age   ;
	if tipo_cont = '3' then
		dw_aumento_capacidad.SetItem(1, "anexo_aumento_estatus_comision", 1)
	else
		dw_aumento_capacidad.SetItem(1, "anexo_aumento_estatus_comision", 0)
	end if
	dw_aumento_capacidad.setitem(1,'anexo_aumento_cod_agente',gs_age)
	dw_aumento_capacidad.setitem(1,'anexo_aumento_cod_super',gs_sup)
	dw_aumento_capacidad.setitem(1,'anexo_aumento_cod_jef',gs_jefe)
	dw_aumento_capacidad.setitem(1,'anexo_aumento_rut',gi_rut)
	ld_saldo_finan				= dw_aumento_capacidad.getitemnumber(1,'saldo_finan')
	dw_aumento_capacidad.setitem(1,'anexo_aumento_saldo_financiar',ld_saldo_finan)
	pie        						= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie')
	precio     					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio')
	ll_valor_cuota				= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota')
	ls_moneda					= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
	ld_fecha_pie				= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_pie')
	ldb_tasa_base				= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa_base'))
	ld_fecha_prim				= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
	ldb_uf_dia					= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_uf_dia'))
	ld_fecha_ult					= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_ult')
	ldb_gastos_adm			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm'))
	ld_fecha						= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')
	ldb_pie_pagado			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie_pagado'))
	nro_cuotas 					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
	ldb_calculo					= pie + (nro_cuotas * ll_valor_cuota)
	if precio > ldb_calculo + 1000 then
		messagebox("Advertencia","Valor Cuota Inválida, debe revisar Plazo, Valor Cuota, Valor Pie o Precio")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_valor_cuota')
		return 
	end if
	dw_aumento_capacidad.accepttext()
	ldb_tasa						= f_tasa(nro_cuotas,ll_valor_cuota,ld_saldo_finan)
	if ldb_tasa <= 0.0001 then
		ldb_tasa						= 0.0001
		ldb_tasa_cta				= 0.0001
	else
		 ldb_tasa						= ldb_tasa
		 ldb_tasa_cta				= ldb_tasa / 100
	end if
	if ldb_tasa>0 and ldb_tasa<10 then
		dw_aumento_capacidad.setitem(1,'pago_aumento_tasa',ldb_tasa)
		dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_interes_cuota', ldb_tasa_cta)
		dw_aumento_capacidad.accepttext()
		IF MessageBox("Aumento Capacidad", "Desea Actualizar los datos ingresados", Question!, YesNo!) = 1 THEN
			il_graba_1				= dw_aumento_capacidad.Update()
			IF il_graba_1 = 1 THEN
				// Correcto
	//			Commit using SQLCA;
				serie 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie_m') 
				numero 				= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_aumento') 
				gs_serie				= serie
				gi_numero			= numero
				gi_rut 				= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut')
				ls_base_asoc		= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
				ls_serie_asoc		= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
				ll_nro_asoc			= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
				nro_cuotas 			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
				ldb_tasa_int_cta	= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa_interes_cuota')
				ls_anexo_aumento	= 'A'+gs_serie+string(gi_numero)
				CHOOSE CASE ls_base_asoc
					CASE 'C'
						SELECT	"CONTRATO"."CTA_AUMENTO"   
						INTO 		:nro_cuotas_aux   
						FROM 		"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie_asoc ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :ll_nro_asoc )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							UPDATE	"CONTRATO"  
							SET 		"CTA_AUMENTO" = :nro_cuotas,   
										"ANEXO_AUMENTO" = :ls_anexo_aumento
							WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie_asoc ) AND  
									 ( "CONTRATO"."NRO_CONTRATO" = :ll_nro_asoc )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								il_graba_2	= 1
	//								commit;
							else
								il_graba_2	= 0
	//								rollback;
							end if
						end if
	
					CASE 'O'
						SELECT	"OFERTA_V"."CTA_AUMENTO"   
						INTO 		:nro_cuotas_aux     
						FROM 		"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 (("OFERTA_V"."SERIE" = :ls_serie_asoc ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro_asoc ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							UPDATE	"OFERTA_V"  
							SET 		"CTA_AUMENTO" = :nro_cuotas,   
										"ANEXO_AUMENTO" = :ls_anexo_aumento  
							WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_asoc ) AND  
									 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro_asoc )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								il_graba_2	= 1
	//								commit;
							else
	//								rollback;
								il_graba_2	= 0
							end if
						end if
				END CHOOSE
				
				IF f_validar() THEN
					IF cb_aceptar.text = "Actualizar" THEN
						// Update
						IF Not(wf_cadena(1)) THEN
							MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
							rollback using SQLCA;
							RETURN
						else
							il_graba_3	= 1
							il_graba_4	= 1
							il_graba_5	= 1
						END IF
					ELSE
						// Insert
						// Trae porcentaje de venta del vendedor segun contrato 1 (antiguo)
						IF f_tipo_contrato(gs_age) = 1 THEN
							// Trae porcentaje de venta del vendedor segun contrato 1 (Antiguo)
							ld_porcent_age	= f_comision_age1(dw_aumento_capacidad.GetItemString(1,"anexo_aumento_tipo_venta"), & 
																		dw_aumento_capacidad.GetItemString(1,"anexo_aumento_area") , &
																		dw_aumento_capacidad.GetItemString(1,"anexo_aumento_uso"))
						ELSE
							// Trae porcentaje de venta del vendedor segun contrato 2 (Nuevo)
							ld_porcent_age	= f_comision_age2(dw_aumento_capacidad.GetItemString(1,"anexo_aumento_tipo_sepult"), & 
																		dw_aumento_capacidad.GetItemString(1,"anexo_aumento_area") , &
																		dw_aumento_capacidad.GetItemNumber(1,"pago_aumento_capacidad") , &
																		dw_aumento_capacidad.GetItemString(1,"anexo_aumento_uso"))
						END IF
						dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_age", ld_porcent_age)
						SELECT	"SUPERVISOR"."PORC_SUPERVISOR"  
						INTO 		:ld_porcent_sup  
						FROM 		"SUPERVISOR"  
						WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_sup", ld_porcent_sup)
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_sup", 0)
						end if
						SELECT DISTINCT	"JEFE_VENTAS"."PORC_JEFE_VTA"  
						INTO 		:ld_porc_jefe  
						FROM 		"JEFE_VENTAS"  
						WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_jefe", ld_porc_jefe)
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_porce_jefe", 0)
						end if					
						dw_aumento_capacidad.accepttext()
						il_graba_3	= dw_aumento_capacidad.update()
						if il_graba_3=1 then
	//						commit;
							SELECT	"CD_FOLIO"."ULT_ESTADO",
										"CD_FOLIO"."DEPTO_ASIGNADO"
							INTO 		:ll_estado_cd,
										:ls_depto_asignado
							FROM 		"CD_FOLIO"  
							WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
									 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
									 ( "CD_FOLIO"."NUMERO" = :gi_numero )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ll_estado_cd<>11 then
									ll_estado_graba	= 11
									ls_glosa				= 'AUMENTO CAPACIDAD DIGITADO'
									ls_memo				= '-'
									ls_ref				= '-'
									UPDATE	"CD_FOLIO"  
									SET 		"ULT_ESTADO" = :ll_estado_graba,   
												"ULT_FECHA_ESTADO" = :gdt_fec_sistema,   
												"ULT_GLOSA_ESTADO" = :ls_glosa,   
												"ULT_MEMO" = :ls_memo,   
												"ULT_USUARIO_GESTION" = :gs_user,   
												"ULT_REFERENCIA_MEMO" = :ls_ref  
									WHERE	 ( "CD_FOLIO"."BASE" = :gs_base ) AND  
											 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
											 ( "CD_FOLIO"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										il_graba_4		= 1
	//									commit;
										INSERT INTO	"CD_FOLIO_DETALLE"  
													( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO" )  
										VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,   		:ll_estado_graba,	:gdt_fec_sistema,	:ls_glosa,	:ls_memo,	:gs_age,			:gs_sup,				:gs_jefe,			:ls_ref )  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											il_graba_5	= 1
	//										commit;
										else
											il_graba_5	= 0
	//										rollback;
										end if
									else
										il_graba_4		= 0
	//									rollback;
									end if
								else
									il_graba_4			= 1
									il_graba_5			= 1
								end if
							else
								il_graba_4				= 1
								il_graba_5				= 1
							end if
						else
	//						rollback;
						end if
						IF Not(wf_cadena(0)) THEN
							MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
							rollback using SQLCA;
							RETURN
						END IF
					END IF
				end if
				if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
					if isnull(ldb_tasa) 			then ldb_tasa=0
					if isnull(ldb_tasa_base) 	then ldb_tasa_base=0
					if isnull(ldb_gastos_adm) 	then ldb_gastos_adm=0
				end if
				if il_graba_1 = 1 and il_graba_2 = 1 and il_graba_3 = 1 and il_graba_4 = 1 and il_graba_5 = 1 and il_graba_6 = 1 then
					commit using sqlca;
					
					UPDATE		"SEGURO_ASOCIADOS"  
					SET 			"ESTADO_SEGURO" = 'I',
									"ESTADO_REG" = 1
					WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
								  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
								  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_tot_reg		= dw_seguro.rowcount()
						for ll_indi=1 to ll_tot_reg
							ll_est_reg	= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
							ll_codigo		= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ls_moneda='1' then
								SELECT	"TIPO_SEGURO"."FACTOR_PESO"  
								INTO 		:ldb_monto  
								FROM 	"TIPO_SEGURO"  
								WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo and
											"TIPO_SEGURO"."COD_PARQUE" = :gl_cod_parque and
											"TIPO_SEGURO"."BASE" =  :gs_base
								USING	sqlca;
							elseif ls_moneda='2' then
								SELECT	"TIPO_SEGURO"."FACTOR_PRIMA"  
								INTO 		:ldb_monto  
								FROM 	"TIPO_SEGURO"  
								WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo and
											"TIPO_SEGURO"."COD_PARQUE" = :gl_cod_parque and
											"TIPO_SEGURO"."BASE" =  :gs_base
								USING	sqlca;
							end if
					
							//ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
							if ll_est_reg = 0 then
								SELECT		Count("SEGURO_ASOCIADOS"."BASE")
								INTO 			:ll_count  
								FROM 		"SEGURO_ASOCIADOS"  
								WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
											  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
											  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
											  ( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo )  
								USING		sqlca;
								if ll_count > 0 then
									UPDATE		"SEGURO_ASOCIADOS"  
									SET 			"ESTADO_SEGURO" = 'A',
													"ESTADO_REG" = 0,
													"MONTO_PRIMA" = :ldb_monto,
													"MONEDA" = :ls_moneda
									WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo ) 
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									elseif sqlca.sqlcode=100 then
										INSERT INTO "SEGURO_ASOCIADOS"  
													( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO" )  
										VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A' )  
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
												( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO" )  
									VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A' )  
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
						ll_tot_reg		= dw_seguro.rowcount()
						for ll_indi=1 to ll_tot_reg
							ll_est_reg	= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
							ll_codigo		= dw_seguro.getitemnumber(ll_indi,'codigo')
							if ls_moneda='1' then
								SELECT	"TIPO_SEGURO"."FACTOR_PESO"  
								INTO 		:ldb_monto  
								FROM 	"TIPO_SEGURO"  
								WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo and
											"TIPO_SEGURO"."COD_PARQUE" = :gl_cod_parque and
											"TIPO_SEGURO"."BASE" =  :gs_base
								USING	sqlca;
							elseif ls_moneda='2' then
								SELECT	"TIPO_SEGURO"."FACTOR_PRIMA"  
								INTO 		:ldb_monto  
								FROM 	"TIPO_SEGURO"  
								WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_codigo and
											"TIPO_SEGURO"."COD_PARQUE" = :gl_cod_parque and
											"TIPO_SEGURO"."BASE" =  :gs_base
								USING	sqlca;
							end if
							//ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
							if ll_est_reg = 0 then
								INSERT INTO "SEGURO_ASOCIADOS"  
											( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO" )  
								VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A' )  
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
					wf_log_anexo_liberador()
					if gs_nueva_oferta='S' then
						INSERT INTO "PAGO_AUMENTO"  
									( "SERIE_M",   "NRO_AUMENTO",   "FECHA",   "FOLIO",   "PRECIO",   "PIE_PAGADO",   "PIE",   	"TASA",		"TASA_BASE",   	"VALOR_CUOTA",   "NRO_CUOTAS",   "UF_DIA",   "MONEDA",   "FECHA_PRIM",   "FECHA_ULT",   "FECHA_PIE",   "MODIFICADO",   	"FECHA_MOD",   "GASTOS_ADM",			"CAPACIDAD",	"TASA_INTERES_CUOTA" )  
						VALUES 	( :gs_serie,   :gi_numero,   		 :ld_fecha, 0, 		  :precio, 	  :ldb_pie_pagado,:pie,		:ldb_tasa,  :ldb_tasa_base,	:ll_valor_cuota, :nro_cuotas, 	:ldb_uf_dia,:ls_moneda, :ld_fecha_prim, :ld_fecha_ult, :ld_fecha_pie, :gs_user,   								:id_fecha_dia, 		:ldb_gastos_adm,		:ll_capacidad,	:ldb_tasa_int_cta	 )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error Tabla Pago Aumento Capacidad SQL: "+sqlca.sqlerrtext)
						end if
					else
						ll_ult_folio	= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_ult_folio')
						UPDATE	"PAGO_AUMENTO"  
						SET 		"FECHA" = :ld_fecha,   
									"PRECIO" = :precio,   
									"PIE_PAGADO" = :ldb_pie_pagado,   
									"PIE" = :pie,   
									"TASA" = :ldb_tasa,   
									"TASA_BASE" = :ldb_tasa_base,   
									"VALOR_CUOTA" = :ll_valor_cuota,   
									"NRO_CUOTAS" = :nro_cuotas,   
									"UF_DIA" = :ldb_uf_dia,   
									"MONEDA" = :ls_moneda,   
									"FECHA_PRIM" = :ld_fecha_prim,   
									"FECHA_ULT" = :ld_fecha_ult,   
									"FECHA_PIE" = :ld_fecha_pie,   
									"MODIFICADO" = :gs_user,   
									"FECHA_MOD" = :id_fecha_dia,   				
									"GASTOS_ADM" = :ldb_gastos_adm,
									"CAPACIDAD" = :ll_capacidad,
									"TASA_INTERES_CUOTA" = :ldb_tasa_int_cta
						WHERE  ( "PAGO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
								 ( "PAGO_AUMENTO"."NRO_AUMENTO" = :gi_numero )  AND
								 ( "PAGO_AUMENTO"."FOLIO" = :ll_ult_folio )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
					gs_nueva_oferta	= 'N'
					if precio>0 then
						if pie = 0 and nro_cuotas = 1 then
							porcentaje	= round(((ll_valor_cuota * 100) / precio),2)
						else
							porcentaje	= round(((pie * 100) / precio),2)
						end if
					else
						porcentaje		= 0
					end if
					IF cb_aceptar.text = "Actualizar" THEN 
						wf_comisiones(serie,numero,porcentaje,nro_cuotas,ls_area,ls_tipo_sepult)//--nueva comision--
						ll_plazo					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
						ll_rut						= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut')
						ldb_valor_cuota		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota')
						ldt_fecha_prim			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
						SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cuota_mant)
						ls_dv						= TRIM(em_dv.text)
						ll_cod_parque			= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
						ls_moneda				= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado_cadena  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if ls_estado_cadena='V' then
							SELECT	"CUPONERAS"."NUMERO"  
							INTO 		:ll_count_vig  
							FROM 		"CUPONERAS"  
							WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
									 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
									 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if il_modif > 1 or il_modif_fec > 1 or il_modif_plazo > 1 then
									if il_modif > 1 then
										ls_modif	= 'E'
									elseif il_modif_fec > 1 then
										ls_modif	= 'C'
									elseif il_modif_plazo > 1 then
										ls_modif	= 'P'
									end if
									SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
									INTO 		:ldt_fec_venc_mant  
									FROM 		"CADENA_MORA"  
									WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
											 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									INSERT INTO "CUPONERAS_MODIFICA"  
												( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",		"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",		"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",		"MONEDA",	"TIPO_MODIFICACION" )
									VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_plazo,	:ll_rut,	:ls_dv,	:ldb_valor_cuota,		:ldb_valor_cuota_mant,	:ll_cod_parque,	:ldt_fecha_prim,	:ldt_fec_venc_mant,	:ls_moneda,	:ls_modif )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										DECLARE sp_nuevo_cadena_mora5 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
								      	EXECUTE sp_nuevo_cadena_mora5;
										
										DECLARE sp_proc_modifica_cuponera5 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
										EXECUTE sp_proc_modifica_cuponera5;
										
										DECLARE sp_nuevo_cadena_mora6 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_asoc,:ls_serie_asoc,:ll_nro_asoc,'M');
								      	EXECUTE sp_nuevo_cadena_mora6;
											
										DECLARE SP_DESARROLLO_CUOTA5 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
										EXECUTE SP_DESARROLLO_CUOTA5;
									else
										rollback;
									end if
								end if
							elseif sqlca.sqlcode=100 then
								DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
						      	EXECUTE sp_nuevo_cadena_mora;
								
								DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
								EXECUTE sp_proc_genera_cuponera;
								
								DECLARE SP_DESARROLLO_CUOTA PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
								EXECUTE SP_DESARROLLO_CUOTA;
							end if
						end if
						IF MessageBox("Grabar", "Grabación Exitosa, desea Ingresar otro Aumento Capacidad", Question!, YesNo!, 3) = 1 THEN
							Setnull(gs_serie);setnull(gi_numero);setnull(gs_base);setnull(gi_rut)
							Setnull(gs_age);setnull(gs_sup);setnull(gs_jefe);setnull(is_pasa_asigna);Setnull(is_sw_age)
							w_ingresar_aumento_capacidad.triggerevent(open!)
							//pb_limpiar.triggerevent(clicked!)
							//em_serie.setfocus()
						else
							gs_nueva_oferta	= 'N'
							cb_aceptar.text 	= "Actualizar"
						END IF
					ELSE
						wf_comisiones(serie,numero,porcentaje,nro_cuotas,ls_area,ls_tipo_sepult)//--nueva comision--
						ll_plazo					= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
						ll_rut					= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut')
						ldb_valor_cuota		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota')
						ldt_fecha_prim			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
						SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cuota_mant)
						ls_dv						= TRIM(em_dv.text)
						ll_cod_parque			= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
						ls_moneda				= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado_cadena  
						FROM 		"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if ls_estado_cadena='V' then
							SELECT	"CUPONERAS"."NUMERO"  
							INTO 		:ll_count_vig  
							FROM 		"CUPONERAS"  
							WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
									 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
									 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if il_modif > 1 or il_modif_fec > 1 or il_modif_plazo > 1 then
									if il_modif > 1 then
										ls_modif	= 'E'
									elseif il_modif_fec > 1 then
										ls_modif	= 'C'
									elseif il_modif_plazo > 1 then
										ls_modif	= 'P'
									end if
									SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
									INTO 		:ldt_fec_venc_mant  
									FROM 		"CADENA_MORA"  
									WHERE  ( "CADENA_MORA"."BASE" = :gs_base ) AND  
											 ( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA_MORA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									INSERT INTO "CUPONERAS_MODIFICA"  
												( "BASE",	"SERIE",		"NUMERO",	"FECHA_CREA",		"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",		"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",		"COD_PARQUE",		"FECHA_PRIM",		"FEC_VENC_MANT",		"MONEDA",	"TIPO_MODIFICACION" )
									VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,			'V',				:ll_plazo,	:ll_rut,	:ls_dv,	:ldb_valor_cuota,		:ldb_valor_cuota_mant,	:ll_cod_parque,	:ldt_fecha_prim,	:ldt_fec_venc_mant,	:ls_moneda,	:ls_modif )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
										DECLARE sp_nuevo_cadena_mora1 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
										EXECUTE sp_nuevo_cadena_mora1;
									
										DECLARE sp_proc_modifica_cuponera1 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
										EXECUTE sp_proc_modifica_cuponera1;
										
										DECLARE SP_DESARROLLO_CUOTA1 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
										EXECUTE SP_DESARROLLO_CUOTA1;
									else
										rollback;
									end if
								end if
							elseif sqlca.sqlcode=100 then
								DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
						     	EXECUTE sp_nuevo_cadena_mora2;
								
								DECLARE sp_proc_genera_cuponera2 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
								EXECUTE sp_proc_genera_cuponera2;
								
								DECLARE SP_DESARROLLO_CUOTA2 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
								EXECUTE SP_DESARROLLO_CUOTA2;
							end if
						end if
						IF MessageBox("Grabar", "Grabación Exitosa, desea Ingresar otro Aumento Capacidad", Question!, YesNo!, 3) = 1 THEN
							Setnull(gs_serie);setnull(gi_numero);setnull(gs_base);setnull(gi_rut)
							Setnull(gs_age);setnull(gs_sup);setnull(gs_jefe);setnull(is_pasa_asigna);Setnull(is_sw_age)
							w_ingresar_aumento_capacidad.triggerevent(open!)
//							pb_limpiar.triggerevent(clicked!)
//							em_serie.setfocus()
						else
							gs_nueva_oferta	= 'N'
							cb_aceptar.text 	= "Actualizar"
						END IF
					END IF
				else
					rollback using sqlca;
					messagebox("Error","Error Grabar SQL: "+sqlca.sqlerrtext)
				end if
			ELSE
				RollBack using SQLCA;
				messagebox("Error","Error Grabar SQL: "+sqlca.sqlerrtext)
			END IF
		END IF
	else
		messagebox("Advertencia","La Tasa es: "+string(ldb_tasa)+", debe ser Mayor o Igual a 0 y Menor a 10")
	end if
else
	em_serie.setfocus()
end if
end event

type st_7 from statictext within w_ingresar_aumento_capacidad
integer x = 1618
integer y = 528
integer width = 283
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe Venta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_ingresar_aumento_capacidad
integer x = 827
integer y = 528
integer width = 265
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Supervisor:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ingresar_aumento_capacidad
integer x = 9
integer y = 528
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_dv from editmask within w_ingresar_aumento_capacidad
integer x = 2336
integer y = 124
integer width = 101
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event modified;
if String(this.text) <> String(gf_obtener_dv(long(em_rut.text))) then
	messagebox('Error','El Rut no es valido',stopsign!)
	cb_aceptar.setfocus()
	dw_aumento_capacidad.setitem(1,'estado_rut',1)
	cb_aceptar.enabled 				= false
	dw_seguro.enabled				= false
	this.setfocus()
	em_rut.Setfocus()
else
	dw_aumento_capacidad.setitem(1,'estado_rut',0)
	cb_aceptar.enabled 				= true
	dw_seguro.enabled				= true
end if
end event

type st_4 from statictext within w_ingresar_aumento_capacidad
integer x = 2290
integer y = 140
integer width = 46
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_rut from editmask within w_ingresar_aumento_capacidad
integer x = 1920
integer y = 124
integer width = 370
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Long		ll_cant,ll_fila,ll_resp
String	ls_null,ls_dv,ls_string
Date		ld_null
Double	ld_valor_uf

gi_rut							= Long(em_rut.text)
gs_serie 						= em_serie.Text
gi_numero 					= Double(em_numero.text)
if gi_rut>0 then
	em_dv.text					= ''
	ll_cant						= dw_clientes.Retrieve(gi_rut)
	IF ll_cant = 0 THEN
		dw_clientes.insertrow(0)
		ll_resp 					= MessageBox("Advertencia", "Cliente NO Existe, desea Ingresarlo", Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			ls_string	= 'N'+'~t'+string(il_tipo_cliente)
			if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
		else
			em_rut.text				= ''
			em_dv.text				= ''
			em_rut.enabled		= true
			em_dv.enabled			= true
			em_rut.setfocus()
		END IF
	else
		cb_aceptar.enabled			= true
		dw_aumento_capacidad.enabled	= true
		dw_aumento_capacidad.setitem(1,'anexo_aumento_rut',gi_rut)
		if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
			isnull(dw_jefe.getitemstring(1,'jefes')) then
			dw_aumento_capacidad.setitem(1,'estado_rut',1)
		else
			dw_aumento_capacidad.setitem(1,'estado_rut',0)
		end if
		dw_aumento_capacidad.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))	
		em_dv.text									= dw_clientes.getitemstring(1,'dv')
		dw_clientes.enabled						= true
		dw_agente.enabled						= true
		dw_supervisor.enabled					= true
		dw_jefe.enabled							= true
		dw_seguro.enabled						= true
		if not isnull(gs_age) and gs_age<>'' then 
			is_pasa_asigna							= 'S'
			dw_agente.triggerevent(itemchanged!)
		end if
		dw_agente.setfocus()
	end if
//	if gs_nueva_oferta='S' then
//		if gi_numero >= gi_prim_nro_A_cd then //gi_prim_nro_A_cd >= gi_numero
//			String	ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_descrip
//			Long		ll_estado
//			SELECT	"CD_FOLIO"."COD_AGENTE",   
//						"CD_FOLIO"."COD_SUPERVISOR",   
//						"CD_FOLIO"."COD_JEFE_VENTA",
//						"CD_FOLIO"."COD_PARQUE",
//						"CD_FOLIO"."ULT_ESTADO"  
//			INTO 		:ls_cod_age,   
//						:ls_cod_sup,   
//						:ls_cod_jefe,
//						:gl_cod_parque,
//						:ll_estado
//			FROM		"CD_FOLIO"  
//			WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
//					 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
//					 ( "CD_FOLIO"."NUMERO" = :gi_numero ) 
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				if not isnull(ls_cod_age) and ls_cod_age<>'' then
//					SELECT	"CD_ESTADO"."DESCRIPCION"  
//					INTO 		:ls_descrip  
//					FROM 		"CD_ESTADO"  
//					WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado ;
//					if ll_estado<>9 then 
//						messagebox( "Advertencia","Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+&
//										', NO es posible Asignar por encontrarse en ESTADO: '+string(ll_estado)+'-'+ls_descrip)
//						dw_agente.enabled						= false
//						dw_supervisor.enabled				= false
//						dw_jefe.enabled						= false
//						dw_aumento_capacidad.enabled		= false
//						pb_limpiar.triggerevent(clicked!)
//					else
//						dw_agente.enabled						= True
//						dw_supervisor.enabled				= True
//						dw_jefe.enabled						= True
//						dw_aumento_capacidad.enabled		= true
//						dw_agente.setitem(1,'agente',ls_cod_age)
//						dw_supervisor.setitem(1,'supervisores',ls_cod_sup)
//						dw_jefe.setitem(1,'jefes',ls_cod_jefe)
//						dw_agente.accepttext()
//						if isnull(gs_age) or gs_age='' then dw_agente.triggerevent(itemchanged!)
//					end if
//				end if
//			end if
//		end if
//		dw_agente.setfocus()
//	else
//		dw_aumento_capacidad.setfocus()
//	end if
	dw_clientes.Object.DataWindow.ReadOnly	= "No"
else
	ls_dv												= dw_clientes.getitemstring(1,'dv')
	em_dv.text										= ls_dv
	dw_aumento_capacidad.setitem(1, 'anexo_aumento_rut',gi_rut)
	dw_aumento_capacidad.setitem(1, 'anexo_aumento_serie_m',gs_serie)
	dw_aumento_capacidad.setitem(1, 'anexo_aumento_nro_aumento',gi_numero)
	dw_aumento_capacidad.SetItem(1, 'anexo_aumento_fecha_ingreso',id_fecha_dia)
	dw_aumento_capacidad.SetItem(1, 'pago_aumento_fecha',id_fecha_dia)
	dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_agente", gs_age)
	dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_super", gs_sup)
	dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_jef", gs_jefe)
	dw_aumento_capacidad.SetItem(1, "anexo_aumento_ult_folio",0)
	dw_aumento_capacidad.SetItem(1, 'anexo_aumento_fecha_ingreso',id_fecha_dia)
	if isnull(dw_aumento_capacidad.getitemstring(1,'anexo_aumento_usuario')) then dw_aumento_capacidad.setitem(1,'anexo_aumento_usuario',gs_user)
	Setnull(ls_null);setnull(ld_null)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_folio", 0)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_precio", 0)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_pie", 0)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_pie", id_fecha_dia)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_nro_cuotas", 0)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_valor_cuota", 0)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_tasa", 0)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_prim", id_fecha_dia)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_uf_dia", gd_uf_dia)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_moneda", ls_null)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_modificado", gs_user)
	dw_aumento_capacidad.SetItem(1, 'pago_aumento_fecha_ult', gd_uf_dia)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_gastos_adm", 0)
	dw_aumento_capacidad.SetItem(1, 'pago_aumento_fecha',id_fecha_dia)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_fecha_mod", id_fecha_dia)
	dw_aumento_capacidad.SetItem(1, "pago_aumento_pie_pagado", 0)
	dw_clientes.enabled							= true
	dw_agente.enabled							= true
	dw_supervisor.enabled						= true
	dw_jefe.enabled								= true
	dw_seguro.enabled							= true
	dw_clientes.Object.DataWindow.ReadOnly	= "No"
end if
end event

type st_3 from statictext within w_ingresar_aumento_capacidad
integer x = 1774
integer y = 140
integer width = 123
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingresar_aumento_capacidad
integer x = 859
integer y = 140
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_numero from editmask within w_ingresar_aumento_capacidad
integer x = 1115
integer y = 124
integer width = 407
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;string		ls_estado,ls_descrip,ls_respuesta,ls_serie_aux,ls_modifica
long 		ll_count_reg,ll_cant,ll_cant_benef,ll_resp,ll_estado,ll_ult_estado,ll_cod_parque,ll_modifica
double 	ld_valor_uf,ll_numero

SetNull(gs_age);Setnull(gs_sup);Setnull(gs_jefe);setnull(gi_rut)
em_dv.text		= ''
is_serie 			= trim(em_serie.Text)
ll_numero 		= Double(trim(em_numero.text))
gs_serie			= is_serie
gi_numero		= ll_numero
gs_base 			= 'A'
gs_serie			= is_serie
if gi_numero>0 AND not isnull(is_serie) then
	if isnull(gs_age) or gs_age='' or isnull(gs_sup) or gs_sup='' or isnull(gs_jefe) or gs_jefe='' then
		SELECT	"ANEXO_AUMENTO"."COD_AGENTE",   
					"ANEXO_AUMENTO"."COD_SUPER",   
					"ANEXO_AUMENTO"."COD_JEF",
					"ANEXO_AUMENTO"."RUT"
		INTO		:gs_age,   
					:gs_sup,   
					:gs_jefe,
					:gi_rut
		FROM		"ANEXO_AUMENTO"  
		WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :is_serie ) AND  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   ;
	end if
	SELECT	"ANEXO_AUMENTO"."SERIE_M"  
	INTO 		:ls_serie_aux  
	FROM 		"ANEXO_AUMENTO",   
				"CADENA",   
				"PAGO_AUMENTO"  
	WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
			 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
			 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
			 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
			 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
			 (("ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
			 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero ) AND  
			 ( "CADENA"."CODIGO" = 'A' ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		is_pasa_asigna					= 'N'
		if dw_aumento_capacidad.Retrieve(gs_serie,gi_numero)>0 then
			ll_cod_parque						= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
			dw_agente.setitem(1,'agente',gs_age)
			dw_supervisor.setitem(1,'supervisores',gs_sup)
			dw_jefe.setitem(1,'jefes',gs_jefe)			
			if dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_resc') = 99 then
//				cb_aceptar.enabled			= false
				SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"
				INTO		:ll_modifica
				FROM 	"SAP_CADENA"  
				WHERE 	( "SAP_CADENA"."BASE" = 'A') AND  
						 	( "SAP_CADENA"."SERIE" = :gs_serie ) AND  
				  			( "SAP_CADENA"."NUMERO" = :gi_numero )  AND  
				  			( "SAP_CADENA"."TIPO_DEUDA" = 'C' or "SAP_CADENA"."TIPO_DEUDA" = 'E' ) 
				USING	sqlca;
				if ll_modifica > 0 then
					ls_modifica	= 'N'
				else
					ls_modifica	= 'S'
				end if
				dw_aumento_capacidad.setitem(1,'modifica',ls_modifica)
				dw_aumento_capacidad.accepttext()
			else
//				cb_aceptar.enabled			= true
			end if
			wf_mostrar_liberador()
			gs_nueva_oferta					= 'N'
			dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
			dw_aumento_capacidad.setitem(1, 'estado_contrato',0)
			em_rut.text					= string(gi_rut,"###,###,###,###")
			dw_agente.setfocus()
		else
			wf_nuevo_liberador()
			gs_nueva_oferta			= 'S'
		END IF
		dw_aumento_capacidad.accepttext()
	else
		ls_respuesta						= 'S'
		if ls_respuesta='S' then
			is_pasa_asigna					= 'S' //N
			if dw_aumento_capacidad.Retrieve(gs_serie,gi_numero)>0 then
				wf_mostrar_liberador()
				gs_nueva_oferta			= 'N'
				dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
				dw_aumento_capacidad.setitem(1, 'estado_contrato',0)
				dw_agente.setfocus()
			else
				wf_nuevo_liberador()
				gs_nueva_oferta			= 'S'
			END IF
			dw_agente.setitem(1,'agente',gs_age)
			dw_supervisor.setitem(1,'supervisores',gs_sup)
			dw_jefe.setitem(1,'jefes',gs_jefe)
			em_rut.text						= string(gi_rut,"###,###,###,###")
		else
			pb_limpiar.triggerevent(clicked!)
		end if	
	end if
end if
end event

type st_1 from statictext within w_ingresar_aumento_capacidad
integer x = 430
integer y = 140
integer width = 174
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_ingresar_aumento_capacidad
boolean visible = false
integer x = 1211
integer y = 2008
integer width = 658
integer height = 352
boolean titlebar = true
string dataobject = "dw_vb_liberador"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_clientes from datawindow within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 27
integer y = 652
integer width = 3351
integer height = 528
string dataobject = "d_ingreso_clientes"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event doubleclicked;String	ls_string
gi_rut	= this.getitemnumber(1,'rut')
ls_string	= 'M'+'~t'+string(il_tipo_cliente)
if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
end event

type dw_aumento_capacidad from datawindow within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 32
integer width = 3365
integer height = 1632
integer taborder = 70
string dataobject = "d_ingreso_aumento_capacidad"
boolean border = false
end type

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event itemchanged;long 		ll_cant, ll_fila, ll_nro_contrato, ll_nro,ll_nro_cuotas,ll_dias,ll_gasto_peso,ll_gastos_adm_peso,ll_rut_aux,ll_rut,ll_resp,ll_count_reg,ll_nulo,ll_tot_reg,ll_indi,&
			ll_dias_tope_def,ll_dias_inicio_def,ll_rut_aval
string 	ls_columna, ls_base_contrato, ls_serie_contrato, ls_null,ls_base,ls_fecha,ls_moneda,ls_area,ls_uso,ls_string
date 		ld_null,ld_fecha_prim,ld_fecha_min,ld_nulo
Datetime	ldt_fecha_prim,ldt_fecha
Double	lld_tasa,lld_kapital,lld_valor_cuo,lld_valor_adm,lld_pie,lld_valor_uf,ldb_precio,lld_gasto_uf,lld_saldo_finan,lld_factor,lld_fac_cta_mensual,lld_gastos_adm_uf,&
			ldb_suma_cuota

SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

ll_nulo	= 0
SetNull(ls_Null);SetNull(ld_null)
this.AcceptText()
ls_columna 									= GetColumnName()
IF ls_columna = "anexo_aumento_rut" THEN
	gi_rut									= Long(GetItemNumber(1, "anexo_aumento_rut"))
	ll_cant									= dw_clientes.Retrieve(gi_rut)
	IF ll_cant = 0 THEN
		ll_fila								= dw_clientes.InsertRow(0)
		dw_clientes.SetItem(ll_fila, "rut", gi_rut)
		dw_clientes.SetItem(ll_fila, "tipo", "L")
		dw_clientes.SetItem(ll_fila, "poblacion", "-")
		dw_clientes.SetItem(ll_fila, "nombre", ls_null)
		dw_clientes.SetItem(ll_fila, "a_paterno", ls_null)
		dw_clientes.SetItem(ll_fila, "a_materno", ls_null)
		dw_clientes.SetItem(ll_fila, "direccion_p", ls_null)
		dw_clientes.SetItem(ll_fila, "ciudad", ls_null)
		dw_clientes.SetItem(ll_fila, "sexo", ls_null)
		dw_clientes.SetItem(ll_fila, "esta_civil", ls_null)
		dw_clientes.SetItem(ll_fila, "fecha_nac", ld_null)
	ELSE
		cb_aceptar.enabled				= true
		dw_seguro.enabled				= true
		dw_aumento_capacidad.setitem(1,'estado_rut',0)
		dw_aumento_capacidad.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))
	END IF
end if
if ls_columna = 'cadena_cod_parque' then
	gl_cod_parque	= dw_aumento_capacidad.getitemnumber(1,'cadena_cod_parque')
	if gl_cod_parque > 0 then idw_detalle2.retrieve(gl_cod_parque)
	ll_tot_reg		= dw_seguro.retrieve(gl_cod_parque,'A')
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		next
		dw_seguro.accepttext()
	end if
end if
IF ls_columna = "compute" THEN
	if String(getitemstring(1,'compute')) <> String(gf_obtener_dv(long(GetItemNumber(1, "anexo_aumento_rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		cb_aceptar.setfocus()
		dw_aumento_capacidad.setitem(1,'estado_rut',1)
		this.setfocus()
		this.SetColumn('rut')
	else
		dw_aumento_capacidad.setitem(1,'estado_rut',0)
		cb_aceptar.enabled 				= true
		dw_seguro.enabled				= true
	end if
end if
IF ls_columna = "pago_aumento_fecha_prim" then
	ld_fecha_prim	= date(dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim'))
	ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
	if ld_fecha_prim < ld_fecha_min then
		messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
		dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_prim',date(gdt_fec_sistema))
		dw_aumento_capacidad.accepttext()
	end if
end if
IF ls_columna = "anexo_aumento_nro_oferta" or ls_columna ="anexo_aumento_base" or ls_columna ="anexo_aumento_serie" THEN
	ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
	ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
	ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
	if ls_columna = "anexo_aumento_base" then
		if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
			dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base_contrato)
		end if
	end if
	if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
		SELECT	"CADENA"."RUT"
		INTO 		:ll_rut
		FROM 		"CADENA"
		WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
				  ("CADENA"."SERIE" = :ls_serie_contrato) and
				  ("CADENA"."NUMERO" = :ll_nro) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if gi_rut = ll_rut then
				dw_aumento_capacidad.setitem(1,'estado_contrato',0)
				cb_aceptar.enabled	= true
				dw_seguro.enabled	= true
			else
				ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
							  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
							  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
							  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
				if ll_resp=1 then
					dw_aumento_capacidad.setitem(1,'estado_contrato',0)
					cb_aceptar.enabled	= true
					dw_seguro.enabled	= true
				else
					dw_aumento_capacidad.setitem(1,'estado_contrato',1)
					cb_aceptar.enabled	= false
					dw_seguro.enabled	= false
				end if
			end if
		else
			MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
			dw_aumento_capacidad.setitem(1,'estado_contrato',1)
			cb_aceptar.enabled	= false
			dw_seguro.enabled	= false
		end if
	end if
end if
if ls_columna="pago_aumento_fecha_prim" or ls_columna="pago_aumento_nro_cuotas" then
	ldt_fecha_prim	= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
	ll_nro_cuotas	= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
	if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
		ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
		if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
			dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_ult',date(ls_fecha))
		end if
	end if
end if
if ls_columna = "anexo_aumento_fecha" THEN
	dw_aumento_capacidad.SetItem(1 , "pago_aumento_uf_dia", gf_uf( String(GetItemDateTime(1, "pago_aumento_fecha"),"dd/mm/yyyy") ) )
	dw_aumento_capacidad.AcceptText()
END IF
if ls_columna='pago_aumento_valor_cuota' then
	SELECT	COUNT("LOG_ANEXO_AUMENTO"."NRO_AUMENTO")  
	INTO 		:il_modif  
	FROM 		"LOG_ANEXO_AUMENTO"  
	WHERE  ( "LOG_ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
			 ( "LOG_ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='pago_aumento_nro_cuotas' then
	SELECT	COUNT("LOG_ANEXO_AUMENTO"."NRO_AUMENTO")  
	INTO 		:il_modif_plazo
	FROM 		"LOG_ANEXO_AUMENTO"  
	WHERE  ( "LOG_ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
			 ( "LOG_ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='pago_aumento_fecha_prim' then
	SELECT	COUNT("LOG_ANEXO_AUMENTO"."NRO_AUMENTO")  
	INTO 		:il_modif_fec
	FROM 		"LOG_ANEXO_AUMENTO"  
	WHERE  ( "LOG_ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
			 ( "LOG_ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna="anexo_aumento_rut_aval" then
	ll_rut_aval				= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_rut_aval')
	if ll_rut_aval > 0 then
		cb_aval.enabled	= True
	else
		cb_aval.enabled	= False
	end if
end if
if ls_columna="pago_aumento_precio" or ls_columna="pago_aumento_tasa_base" or ls_columna="pago_aumento_valor_cuota" or ls_columna="pago_aumento_gastos_adm" or ls_columna="pago_aumento_pie" then
	ls_moneda		= this.getitemstring(1,'pago_aumento_moneda')
	lld_tasa			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa_base'))
	if lld_tasa>100 then
		messagebox("Error","Valor Tasa Contrato Inválida")
		dw_aumento_capacidad.setfocus()
		dw_aumento_capacidad.setcolumn('pago_aumento_tasa_base')
	end if
	if ls_moneda='2' then //uf
		lld_kapital				= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio'))
		lld_valor_cuo			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota'))
		lld_valor_adm			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm'))
		lld_pie					= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie'))
		if lld_kapital>=500 then 
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_precio')
		elseif lld_valor_cuo>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_valor_cuota')
		elseif lld_valor_adm>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Gasto Administrativo)")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_gastos_adm')
		elseif lld_pie>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_pie')
		end if
	end if
end if
if ls_columna="pago_aumento_moneda" then
	ls_moneda				= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
	lld_kapital				= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio'))
	lld_tasa					= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_tasa_base'))
	lld_valor_cuo			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_valor_cuota'))
	lld_valor_adm			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm'))
	lld_pie					= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie'))
	lld_valor_uf			= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_uf_dia'))
//	gd_uf_dia
	if gd_uf_dia>0 then
		if ls_moneda='1' then //peso
			if lld_kapital<500 then 
				dw_aumento_capacidad.setitem(1,'pago_aumento_precio',long(round((lld_kapital * lld_valor_uf),2)))
			end if
			if lld_valor_cuo<500 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',long(round((lld_valor_cuo * lld_valor_uf),2)))
			end if
			if lld_valor_adm<500 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_gastos_adm',long(round((lld_valor_adm * lld_valor_uf),2)))
			end if
			if lld_pie<500 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_pie',long(round((lld_pie * lld_valor_uf),2)))
			end if
		elseif ls_moneda='2' then //uf
			if lld_kapital>=500 then 
				dw_aumento_capacidad.setitem(1,'pago_aumento_precio',(lld_kapital / lld_valor_uf))
			end if
			if lld_valor_cuo>=500 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',(lld_valor_cuo / lld_valor_uf))
			end if
			if lld_valor_adm>=500 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_gastos_adm',(lld_valor_adm / lld_valor_uf))
			end if
			if lld_pie>=500 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_pie',(lld_pie / lld_valor_uf))
			end if
		end if
		dw_aumento_capacidad.accepttext()
	end if
END IF
if ls_columna="pago_aumento_nro_cuotas" or ls_columna="pago_aumento_moneda" then
	ll_nro_cuotas		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
	ls_moneda			= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
	if ll_nro_cuotas>0 and not isnull(ls_moneda) then
		SELECT	"TASA_GASTOS_ADM"."TASA_UF",   
					"TASA_GASTOS_ADM"."TASA_PESO"  
		INTO 		:lld_gasto_uf,   
					:ll_gasto_peso  
		FROM 		"TASA_GASTOS_ADM"  
		WHERE 	"TASA_GASTOS_ADM"."CODIGO" = 1   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_moneda='1' then //peso
				ll_gastos_adm_peso	= ll_nro_cuotas * ll_gasto_peso  
				if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
					ll_gastos_adm_peso	= 0
				end if
				dw_aumento_capacidad.setitem(1,'pago_aumento_gastos_adm',ll_gastos_adm_peso)
				SELECT	"INTERES_CUOTAS"."INTERES_PESOS"  
				INTO 		:lld_fac_cta_mensual  
				FROM 		"INTERES_CUOTAS"  
				WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cuotas   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
						lld_fac_cta_mensual	= 0
					end if
					dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',lld_fac_cta_mensual)
				end if
			elseif ls_moneda='2' then //uf
				lld_gastos_adm_uf		= ll_nro_cuotas * lld_gasto_uf  
				if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
					lld_gastos_adm_uf		= 0
				end if
				dw_aumento_capacidad.setitem(1,'pago_aumento_gastos_adm',lld_gastos_adm_uf)
				SELECT	"INTERES_CUOTAS"."INTERES_UF"  
				INTO 		:lld_fac_cta_mensual  
				FROM 		"INTERES_CUOTAS"  
				WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cuotas   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
						lld_fac_cta_mensual	= 0
					end if
					dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',lld_fac_cta_mensual)
				end if
			end if
		end if
	end if	
end if
if ls_columna="pago_aumento_nro_cuotas" or ls_columna="pago_aumento_fecha" or ls_columna="pago_aumento_fecha_prim" or &
	ls_columna="pago_aumento_moneda" or ls_columna="pago_aumento_precio" or ls_columna="pago_aumento_pie" or &
	ls_columna="pago_aumento_gastos_adm" then
	ll_nro_cuotas		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
	ldt_fecha			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')
	ldt_fecha_prim		= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
	ls_moneda			= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
	ldb_precio			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio')
	lld_pie				= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie')
	lld_gasto_uf		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm')
	dw_aumento_capacidad.accepttext()
	lld_saldo_finan	= double(dw_aumento_capacidad.getitemnumber(1,'saldo_finan'))
	if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
		not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
		ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
		if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
			ll_dias	= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
			if ll_nro_cuotas>=1 and ll_nro_cuotas<=11 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',ldb_precio + lld_pie)
			else
				if ll_dias>=30 then
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor  
					FROM 		"FACTORES"  
					WHERE  ( "FACTORES"."BASE" = 'A' ) AND  
							 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
							 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
							 ((:ll_dias >= "FACTORES"."DIAS_INICIAL")  AND  
							 ( :ll_dias <= "FACTORES"."DIAS_FINAL" ))  AND
							 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
							 ( "FACTORES"."MONEDA" = :ls_moneda )
					USING		sqlca;
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan	= lld_factor * lld_saldo_finan
						dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',lld_saldo_finan)
					else
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor 
						FROM 		"FACTORES"  
						WHERE  ( "FACTORES"."BASE" = 'A' ) AND  
								 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
								 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
								 ( "FACTORES"."FACTOR" = ( SELECT	MIN("FACTORES"."FACTOR") 
																	FROM 		"FACTORES" 
																	WHERE  ( "FACTORES"."BASE" = 'A' ) AND 
																			 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																			 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																			 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
																			 ( "FACTORES"."FACTOR" <> 0 ) ) )   ;
						if lld_factor > 0 and lld_saldo_finan > 0 then
							lld_saldo_finan	= lld_factor * lld_saldo_finan
							dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',lld_saldo_finan)
						end if
					end if
				else
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor 
					FROM 		"FACTORES"  
					WHERE  ( "FACTORES"."BASE" = 'A' ) AND  
							 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
							 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
							 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
							 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
							 ( "FACTORES"."FACTOR" = ( SELECT	MIN("FACTORES"."FACTOR") 
																FROM 		"FACTORES" 
																WHERE  ( "FACTORES"."BASE" = 'A' ) AND 
																		 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																		 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																		 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																		 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
																		 ( "FACTORES"."FACTOR" <> 0 ) ) )   
					USING		sqlca;
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan	= lld_factor * lld_saldo_finan
						dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',lld_saldo_finan)
					end if
				end if
			end if
//			SELECT	"FACTORES"."FACTOR"  
//			INTO 		:lld_factor  
//			FROM 		"FACTORES"  
//			WHERE  ( "FACTORES"."BASE" = :gs_base ) AND  
//					 ( :ll_nro_cuotas = "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
//					 ((:ll_dias >= "FACTORES"."DIAS_INICIAL")  AND  
//					 ( :ll_dias <= "FACTORES"."DIAS_FINAL" ))  AND
//					 ( "FACTORES"."MONEDA" = :ls_moneda )
//			USING		sqlca;
//			if sqlca.sqlcode=0 then
//				if lld_factor>0 and lld_saldo_finan>0 then
//					lld_saldo_finan	= lld_factor * lld_saldo_finan
//					dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',lld_saldo_finan)
//				end if
//			end if
		end if
	end if
end if
if ls_columna='pago_aumento_pie' then
	dw_aumento_capacidad.accepttext()
	lld_pie										= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie'))
	ls_moneda									= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
	if lld_pie>0 then
		ls_uso									= trim(dw_aumento_capacidad.getitemstring(1,'anexo_aumento_uso'))
		SELECT	Count("DETALLE_PAGO_PIE"."ESTADO")  
		INTO 		:ll_count_reg  
		FROM 	"DETALLE_PAGO_PIE"  
		WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :gs_base ) AND  
				 ( "DETALLE_PAGO_PIE"."SERIE" = :gs_serie ) AND  
				 ( "DETALLE_PAGO_PIE"."NUMERO" = :gi_numero ) AND  
				 ( "DETALLE_PAGO_PIE"."ESTADO" = 'C' )   
		USING		sqlca;
		if isnull(ll_count_reg) or ll_count_reg=0 then
			ls_string				= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'M'+'~t'+ls_moneda
			if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then
				openwithparm(w_mensaje_pie,ls_string)
				is_respuesta	= Message.StringParm
				IF trim(is_respuesta)='S' THEN 
					openwithparm(w_ingreso_pie_pactado,ls_string)
				elseif trim(is_respuesta)='C' THEN
					elseif trim(is_respuesta)='C' THEN
					cb_3.triggerevent(clicked!)
				end if
			else 
				if isnull(ls_uso) then
					messagebox("Advertencia","Debe ingresar antes Uso")
				elseif isnull(ls_moneda) then
					messagebox("Advertencia","Debe ingresar antes Moneda")
				end if
				cb_3.triggerevent(clicked!)
			end if
		else
			if ll_count_reg=1 then
				messagebox("Advertencia","No es posible Modificar Valor, existe pago asociado en Pactación del Pie")
			elseif ll_count_reg>1 then
				messagebox("Advertencia","No es posible Modificar Valor, existen pagos asociados en Pactación del Pie")
			end if
			SELECT	SUM("DETALLE_PAGO_PIE"."MONTO_CUOTA")
			INTO 		:ldb_suma_cuota  
			FROM 		"DETALLE_PAGO_PIE"  
			WHERE  ( "DETALLE_PAGO_PIE"."BASE" = :gs_base ) AND  
					 ( "DETALLE_PAGO_PIE"."SERIE" = :gs_serie ) AND  
					 ( "DETALLE_PAGO_PIE"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if ldb_suma_cuota>0 then
				dw_aumento_capacidad.setitem(1,'pago_aumento_pie',ldb_suma_cuota)
				dw_aumento_capacidad.accepttext()
			end if
		end if
	end if
end if
end event

event clicked;string	ls_columna,ls_fecha,ls_moneda
Datetime	ldt_fecha_prim,ldt_fecha
Date		ld_fecha_prim,ld_fecha_min
Long		ll_nro_cuotas,ll_dias,ll_dias_tope_def,ll_dias_inicio_def,ll_modifica
Double	ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor

SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

ls_columna	= dwo.name
if dw_aumento_capacidad.getitemnumber(1,'estado_rut')=0 and dw_aumento_capacidad.getitemnumber(1,'estado_contrato')=0 then
	CHOOSE CASE ls_columna
		CASE 'p_2'
			ls_fecha					= string(date(dw_aumento_capacidad.getitemdatetime(1,'anexo_aumento_fecha_ingreso')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_aumento_capacidad.setitem(1,'anexo_aumento_fecha_ingreso',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_aumento_capacidad.setitem(1,'anexo_aumento_fecha_ingreso',date(ls_fecha))
			END IF
			dw_aumento_capacidad.setcolumn('anexo_aumento_fecha_ingreso')
			
		CASE 'p_3'
			ls_fecha					= string(date(dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_pie')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_pie',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_pie',date(ls_fecha))
			END IF
			dw_aumento_capacidad.setcolumn('pago_aumento_fecha_pie')
	
		CASE 'p_4'
			ld_fecha_prim	= date(dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim'))
			ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
			if ld_fecha_prim < ld_fecha_min then
				messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
				dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_prim',date(gdt_fec_sistema))
				dw_aumento_capacidad.accepttext()
			else
				ls_fecha					= string(date(dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')))
				if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_prim',datetime(string(id_fecha_dia,gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_prim',date(ls_fecha))
				END IF
				ldt_fecha_prim	= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
				ll_nro_cuotas	= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
				if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
					ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
					if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
						dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_ult',date(ls_fecha))
					end if
				end if
				ll_nro_cuotas		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
				ldt_fecha			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')
				ldt_fecha_prim		= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
				ls_moneda			= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
				ldb_precio			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio')
				lld_pie				= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie')
				lld_gasto_uf		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm')
				dw_aumento_capacidad.accepttext()
				lld_saldo_finan	= double(dw_aumento_capacidad.getitemnumber(1,'saldo_finan'))
				if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
					not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
					ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
					if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
						ll_dias	= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor  
						FROM 		"FACTORES"  
						WHERE  ( "FACTORES"."BASE" = :gs_base ) AND  
								 ( :ll_nro_cuotas = "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 ((:ll_dias >= "FACTORES"."DIAS_INICIAL")  AND  
								 ( :ll_dias <= "FACTORES"."DIAS_FINAL" ))  AND
								 ( "FACTORES"."MONEDA" = :ls_moneda )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if lld_factor>0 and lld_saldo_finan>0 then
								lld_saldo_finan	= lld_factor * lld_saldo_finan
								dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',lld_saldo_finan)
							end if
						end if
					end if
				end if
			end if
			dw_aumento_capacidad.setfocus()
			dw_aumento_capacidad.setcolumn('pago_aumento_fecha_prim')
			
		CASE 'p_5'
			SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"
			INTO		:ll_modifica
			FROM 	"SAP_CADENA"  
			WHERE 	( "SAP_CADENA"."BASE" = 'A') AND  
						( "SAP_CADENA"."SERIE" = :gs_serie ) AND  
						( "SAP_CADENA"."NUMERO" = :gi_numero )  AND  
						( "SAP_CADENA"."TIPO_DEUDA" = 'C' or "SAP_CADENA"."TIPO_DEUDA" = 'E' ) 
			USING	sqlca;
			if ll_modifica > 0 then
				ls_fecha					= string(date(dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')))
				if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_aumento_capacidad.setitem(1,'pago_aumento_fecha',datetime(string(id_fecha_dia,gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_aumento_capacidad.setitem(1,'pago_aumento_fecha',date(ls_fecha))
				END IF
				dw_aumento_capacidad.SetItem(1,'pago_aumento_uf_dia', gf_uf( String(GetItemDateTime(1, "pago_aumento_fecha"),"dd/mm/yyyy") ) )
				dw_aumento_capacidad.AcceptText()		
				ll_nro_cuotas		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_nro_cuotas')
				ldt_fecha			= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha')
				ldt_fecha_prim		= dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_prim')
				ls_moneda			= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
				ldb_precio			= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_precio')
				lld_pie				= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie')
				lld_gasto_uf		= dw_aumento_capacidad.getitemnumber(1,'pago_aumento_gastos_adm')
				dw_aumento_capacidad.accepttext()
				lld_saldo_finan	= double(dw_aumento_capacidad.getitemnumber(1,'saldo_finan'))
				if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
					not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
					ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
					if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
						ll_dias	= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor  
						FROM 		"FACTORES"  
						WHERE  ( "FACTORES"."BASE" = :gs_base ) AND  
								 ( :ll_nro_cuotas = "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 ((:ll_dias >= "FACTORES"."DIAS_INICIAL")  AND  
								 ( :ll_dias <= "FACTORES"."DIAS_FINAL" ))  AND
								 ( "FACTORES"."MONEDA" = :ls_moneda )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if lld_factor>0 and lld_saldo_finan>0 then
								lld_saldo_finan	= lld_factor * lld_saldo_finan
								dw_aumento_capacidad.setitem(1,'pago_aumento_valor_cuota',lld_saldo_finan)
							end if
						end if
					end if
				end if
				dw_aumento_capacidad.setfocus()
				dw_aumento_capacidad.setcolumn('pago_aumento_fecha')
			end if
		CASE 'p_6'
			ls_fecha					= string(date(dw_aumento_capacidad.getitemdatetime(1,'pago_aumento_fecha_ult')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_ult',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_aumento_capacidad.setitem(1,'pago_aumento_fecha_ult',date(ls_fecha))
			END IF
			dw_aumento_capacidad.setcolumn('pago_aumento_fecha_ult')
	END CHOOSE
end if
end event

event doubleclicked;String		ls_columna,ls_moneda,ls_uso,ls_string
Long		ll_nulo
Date		ld_nulo
Double	lld_pie

ls_columna			= dwo.name
dw_aumento_capacidad.accepttext()
if ls_columna='t_pie' then
	lld_pie						= double(dw_aumento_capacidad.getitemnumber(1,'pago_aumento_pie'))
	ls_moneda					= dw_aumento_capacidad.getitemstring(1,'pago_aumento_moneda')
	if lld_pie>0 then
		ls_uso					= trim(dw_aumento_capacidad.getitemstring(1,'anexo_aumento_uso'))
		ls_string					= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
		if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then
			openwithparm(w_ingreso_pie_pactado,ls_string)
		else
			if isnull(ls_uso) then
				messagebox("Advertencia","Debe ingresar antes Uso")
			elseif isnull(ls_moneda) then
				messagebox("Advertencia","Debe ingresar antes Moneda")
			end if
			cb_3.triggerevent(clicked!)
		end if
	end if
end if
end event

type dw_supervisor from datawindow within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 1106
integer y = 512
integer width = 425
integer height = 96
integer taborder = 50
boolean bringtotop = true
string dataobject = "dwe_supervisores"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_help_memo.visible		= false
end event

event itemchanged;Long		ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_nro,ll_rut,ll_resp,ll_cod_parque
String		ls_string,ls_obs,ls_tipo_cont,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_jefe,&
			ls_cod_sup,ls_base_aux,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_contrato,ls_serie_contrato
Datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,&
			ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf,ll_numero_asoc
this.accepttext()
ls_cod_sup	= dw_supervisor.getitemstring(1,'supervisores')
if not isnull(ls_cod_sup) then
	if gi_rut>0 then
		is_sw_sup		= 'S'
		gs_serie 		= trim(em_serie.Text)
		gs_base			= 'A'
		if gi_rut>0 then
			if is_pasa_asigna='S' then
				gs_age	= dw_agente.getitemstring(1,'agente')
				gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
				gs_jefe	= dw_jefe.getitemstring(1,'jefes')
				if not isnull(gs_sup) and gs_sup<>'' then
					SELECT	"SUPERVISOR"."COD_JEFE"  
					INTO 		:ls_jefe  
					FROM 		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if isnull(gs_sup) then
							messagebox("Advertencia","Debe Ingresar Supervisor")
							dw_supervisor.setfocus()
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_super", gs_sup)
							dw_aumento_capacidad.accepttext()
							if il_resp_age<>1 then
								if is_sw_sup='S' and not isnull(gs_age) and gs_age<>'' and not isnull(gs_jefe) and gs_jefe<>''then //gs_nueva_oferta='S' and 
									il_resp_sup	= MessageBox("Advertencia", "Está seguro de ASIGNAR Aumento Capacidad Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
									IF il_resp_sup = 1 THEN
										ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
										openwithparm(w_verificar_datos_contrato,ls_string)
										IF trim(Message.StringParm)='OK' THEN
											SELECT	"AGENTES"."TIPO_CONT"  
											INTO 		:ls_tipo_cont  
											FROM 		"AGENTES"  
											WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
											if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
												INSERT INTO "COMISION_PROMESA"  
															( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
												VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0			,0				,0			,0 )  
												USING		sqlca	;
												if sqlca.sqlcode=0 then
													ll_grabar_1	= 1
//													commit;
												else
													ll_grabar_1	= 0
//													rollback;
												end if
											end if
											ls_obs	= 'Aumento Capacidad creado por '+gs_user+' el '+string(gdt_fec_sistema)
											if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
											dw_aumento_capacidad.enabled			= true
											if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
												isnull(dw_jefe.getitemstring(1,'jefes')) then
												dw_aumento_capacidad.setitem(1,'estado_rut',1)
											else
												if gi_rut>0 then dw_aumento_capacidad.setitem(1,'estado_rut',0)
											end if
											////
											SELECT	"CADENA"."CODIGO"  
											INTO 		:ls_base_aux  
											FROM 		"CADENA"  
											WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
													 ( "CADENA"."SERIE" = :gs_serie ) AND  
													 ( "CADENA"."NUMERO" = :gi_numero )   
											USING		sqlca;
											if sqlca.sqlcode=100 then
												SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
												INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
												FROM 		"REVISION_CONTRATOS"  
												WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
														 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
														 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
														 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
												USING		sqlca;
												if sqlca.sqlcode=0 then
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_base',ls_base_asoc)
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_serie',ls_serie_asoc)
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_nro_oferta',ll_numero_asoc)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha',ldt_fecha_ctto_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_moneda',ls_moneda_rev)
													dw_aumento_capacidad.SetItem(1,'anexo_aumento_forma_pago',ls_forma_pago_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_pie',ldb_pie_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_nro_cuotas',ll_plazo_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_gastos_adm',ldb_gasto_adm_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_valor_cuota',ldb_valor_cuota_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_precio',ldb_precio_ctto_rev)
													dw_aumento_capacidad.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
													dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha_prim',ldt_fecha_prim_rev)
													SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
													INTO 		:ldb_int_peso,								:ldb_int_uf
													FROM 		"INTERES_CUOTAS"  
													WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
															ldb_int_peso	= 0
															ldb_int_uf		= 0
														end if
														if ls_moneda_rev='1' then //peso
															dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_peso)
														elseif ls_moneda_rev='2' then //UF
															dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_uf)
														end if
													end if
													ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
													ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
													ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
													if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
														dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
														idw_detalle.settransobject(sqlca)
														idw_detalle.retrieve(ls_base_contrato)
													end if
													if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
														SELECT	"CADENA"."RUT"
														INTO 		:ll_rut
														FROM 		"CADENA"
														WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
																  ("CADENA"."SERIE" = :ls_serie_contrato) and
																  ("CADENA"."NUMERO" = :ll_nro) 
														USING		sqlca;
														if sqlca.sqlcode=0 then
															if gi_rut = ll_rut then
																dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																			  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																			  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																			  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
																if ll_resp=1 then
																	dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																	cb_aceptar.enabled	= true
																else
																	dw_aumento_capacidad.setitem(1,'estado_contrato',1)
																	cb_aceptar.enabled	= false
																end if
															end if
														else
															MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
															dw_aumento_capacidad.setitem(1,'estado_contrato',1)
															cb_aceptar.enabled	= false
														end if
													end if
												end if
											end if
											////
											dw_aumento_capacidad.setfocus()
											dw_aumento_capacidad.setcolumn('anexo_aumento_base')
										else
											dw_aumento_capacidad.enabled			= false
											dw_aumento_capacidad.setitem(1,'estado_rut',1)
											messagebox("Advertencia","NO fue Asignado Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
											dw_jefe.setfocus()
										end if
									else
										dw_aumento_capacidad.setitem(1,'estado_rut',1)
									END IF
								end if
							end if
						end if
					else
						messagebox("Advertencia","Supervisor Inexistente")
						dw_supervisor.reset()
						dw_supervisor.insertrow(0)
						dw_supervisor.setfocus()
						gs_sup	= ''
					end if
				end if
				
			elseif is_pasa_asigna='N' and is_sw_sup='S' then	
				gs_age	= dw_agente.getitemstring(1,'agente')
				gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
				gs_jefe	= dw_jefe.getitemstring(1,'jefes')
				if not isnull(gs_sup) and gs_sup<>'' then
					SELECT	"SUPERVISOR"."COD_JEFE"  
					INTO 		:ls_jefe  
					FROM 		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if isnull(gs_sup) then
							messagebox("Advertencia","Debe Ingresar Supervisor")
							dw_supervisor.setfocus()
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_super", gs_sup)
							dw_aumento_capacidad.accepttext()
							if is_sw_sup='S' and not isnull(gs_age) and gs_age<>'' and not isnull(gs_jefe) and gs_jefe<>'' then//if il_resp_age=2 and is_sw_sup='S' then
								il_resp_sup	= MessageBox("Advertencia", "Está seguro de ASIGNAR Aumento Capacidad Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								IF il_resp_sup = 1 THEN
									ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										SELECT	"AGENTES"."TIPO_CONT"  
										INTO 		:ls_tipo_cont  
										FROM 		"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
											INSERT INTO "COMISION_PROMESA"  
														( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
											VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0			,0				,0				,0 )  
											USING		sqlca	;
											if sqlca.sqlcode=0 then
//												commit;
												ll_grabar_1	= 1
											else
												ll_grabar_1	= 0
//												rollback;
											end if
										end if
										ls_obs	= 'Aumento Capacidad creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_aumento_capacidad.enabled			= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_aumento_capacidad.setitem(1,'estado_rut',1)
										else
											if gi_rut>0 then dw_aumento_capacidad.setitem(1,'estado_rut',0)
										end if
										////
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 		"CADENA"  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
											INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
											FROM 		"REVISION_CONTRATOS"  
											WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
													 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
													 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
													 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_base',ls_base_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_serie',ls_serie_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_nro_oferta',ll_numero_asoc)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha',ldt_fecha_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_moneda',ls_moneda_rev)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_forma_pago',ls_forma_pago_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_pie',ldb_pie_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_nro_cuotas',ll_plazo_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_gastos_adm',ldb_gasto_adm_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_valor_cuota',ldb_valor_cuota_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_precio',ldb_precio_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha_prim',ldt_fecha_prim_rev)
												SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
												INTO 		:ldb_int_peso,								:ldb_int_uf
												FROM 		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
														ldb_int_peso	= 0
														ldb_int_uf		= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_uf)
													end if
												end if
												ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
												ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
												ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
												if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
													dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
													idw_detalle.settransobject(sqlca)
													idw_detalle.retrieve(ls_base_contrato)
												end if
												if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
													SELECT	"CADENA"."RUT"
													INTO 		:ll_rut
													FROM 		"CADENA"
													WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
															  ("CADENA"."SERIE" = :ls_serie_contrato) and
															  ("CADENA"."NUMERO" = :ll_nro) 
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if gi_rut = ll_rut then
															dw_aumento_capacidad.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																		  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																		  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																		  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
															if ll_resp=1 then
																dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																dw_aumento_capacidad.setitem(1,'estado_contrato',1)
																cb_aceptar.enabled	= false
															end if
														end if
													else
														MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
														dw_aumento_capacidad.setitem(1,'estado_contrato',1)
														cb_aceptar.enabled	= false
													end if
												end if
											end if
										end if
										////
										dw_aumento_capacidad.setfocus()
										dw_aumento_capacidad.setcolumn('anexo_aumento_base')
									else
										dw_aumento_capacidad.enabled			= false
										dw_aumento_capacidad.setitem(1,'estado_rut',1)
										messagebox("Advertencia","NO fue Re-Asignado Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
										dw_jefe.setfocus()
									end if
								else
									dw_aumento_capacidad.setitem(1,'estado_rut',1)
								END IF
							end if
						end if
					else
						messagebox("Advertencia","Supervisor Inexistente")
						dw_supervisor.reset()
						dw_supervisor.insertrow(0)
						dw_supervisor.setfocus()
						gs_sup	= ''
					end if
				end if
			end if
			if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
				commit using sqlca;
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"COD_AGENTE" = :gs_age,   
							"COD_SUPER" = :gs_sup,   
							"COD_JEF" = :gs_jefe  
				WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			else
				rollback using sqlca;
			end if
		end if
		ll_cod_parque	= dw_aumento_capacidad.getitemnumber(1, "cadena_cod_parque")
		if ll_cod_parque > 0 then idw_detalle2.retrieve(ll_cod_parque)
		this.accepttext()
	else
		messagebox("Advertencia","Recuerde antes de Asingar debe ingresar Rut Cliente")
		dw_supervisor.reset()
		dw_supervisor.insertrow(0)
		if gs_nueva_oferta='S' then
			dw_agente.reset()
			dw_jefe.reset()
			dw_agente.insertrow(0)
			dw_jefe.insertrow(0)
		end if
		em_rut.setfocus()
	end if
end if
end event

type dw_agente from datawindow within w_ingresar_aumento_capacidad
event ue_mousemove pbm_mousemove
integer x = 215
integer y = 512
integer width = 430
integer height = 96
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_agentes"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_help_memo.visible		= false
end event

event itemchanged;Long		ll_resp,ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_nro,ll_rut,ll_cod_parque
String		ls_tipo_cont,ls_obs,ls_ok,ls_string,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_sup,ls_cod_age,ls_moneda_rev,ls_base_aux,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_contrato,ls_serie_contrato,ls_canal
Datetime	ldt_fecha_ctto_rev,ldt_gasto_adm_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,&
			ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf,ll_numero_asoc
this.accepttext()
ls_cod_age	= dw_agente.getitemstring(1,'agente')
if not isnull(ls_cod_age) then
	if gi_rut>0 then
		is_sw_age		= 'S'
		gs_serie 		= trim(em_serie.Text)
		gs_base			= 'A'
		if gi_rut>0 then
			if is_pasa_asigna='S' then
				gs_age	= dw_agente.getitemstring(1,'agente')
				gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
				gs_jefe	= dw_jefe.getitemstring(1,'jefes')
				if not isnull(gs_age) and gs_age<>'' then
					if gl_cod_parque=0 or isnull(gl_cod_parque) then
						SELECT	"AGENTES"."COD_SUP",
									"AGENTES"."COD_PARQUE",
									"SUPERVISOR"."COD_JEFE",
									"AGENTES"."CANAL"
						INTO 		:ls_sup,
									:gl_cod_parque,
									:gs_jefe,
									:ls_canal
						FROM 		"AGENTES",   
									"SUPERVISOR"  
						WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
								 (("AGENTES"."COD_AGE" = :gs_age ) )   
						USING		sqlca;
					else
						SELECT	"AGENTES"."COD_SUP",
									"SUPERVISOR"."COD_JEFE",
									"AGENTES"."CANAL"
						INTO 		:ls_sup,
									:gs_jefe,
									:ls_canal
						FROM 		"AGENTES",   
									"SUPERVISOR"  
						WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
								 (("AGENTES"."COD_AGE" = :gs_age ) )   
						USING		sqlca;
					end if
					if sqlca.sqlcode=0 then
						dw_aumento_capacidad.SetItem(1, "cadena_cod_parque", gl_cod_parque)
						dw_aumento_capacidad.SetItem(1, 'anexo_aumento_canal_venta', ls_canal)
						dw_supervisor.setitem(1,'supervisores',ls_sup)
						dw_jefe.setitem(1,'jefes',gs_jefe)
						dw_supervisor.accepttext()
						dw_jefe.accepttext()
						if isnull(gs_age) then
							messagebox("Advertencia","Debe Ingresar Agente")
							dw_agente.setfocus()
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_agente", gs_age)
							gs_sup			= ls_sup
							dw_aumento_capacidad.accepttext()
							if is_sw_age='S' and not isnull(gs_sup) and gs_sup<>'' and gs_jefe<>'' and not isnull(gs_jefe) then //gs_nueva_oferta='S' and 
								il_resp_age	= MessageBox("Advertencia", "Está seguro de ASIGNAR Aumento Capacidad Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								IF il_resp_age = 1 THEN
									ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										if gl_cod_parque=0 or isnull(gl_cod_parque) then
											SELECT	"AGENTES"."TIPO_CONT",
														"AGENTES"."COD_PARQUE"
											INTO 		:ls_tipo_cont,
														:gl_cod_parque
											FROM 		"AGENTES"  
											WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										else
											SELECT	"AGENTES"."TIPO_CONT"
											INTO 		:ls_tipo_cont
											FROM 		"AGENTES"  
											WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										end if
										dw_aumento_capacidad.SetItem(1, "cadena_cod_parque", gl_cod_parque)
										if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
											INSERT INTO "COMISION_PROMESA"  
														( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
											VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0			,0				,0			,0 )  
											USING		sqlca	;
											if sqlca.sqlcode=0 then
												ll_grabar_1	= 1
//												commit;
											else
												ll_grabar_1	= 0
//												rollback;
											end if
										end if
										ls_obs	= 'Aumento Capacidad creada por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_aumento_capacidad.setitem(1,'estado_rut',1)
										else
											if gi_rut>0 then dw_aumento_capacidad.setitem(1,'estado_rut',0)
										end if
										dw_aumento_capacidad.enabled			= true
										////
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 		"CADENA"  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
											INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
											FROM 		"REVISION_CONTRATOS"  
											WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
													 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
													 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
													 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_base',ls_base_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_serie',ls_serie_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_nro_oferta',ll_numero_asoc)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha',ldt_fecha_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_moneda',ls_moneda_rev)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_forma_pago',ls_forma_pago_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_pie',ldb_pie_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_nro_cuotas',ll_plazo_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_gastos_adm',ldb_gasto_adm_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_valor_cuota',ldb_valor_cuota_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_precio',ldb_precio_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha_prim',ldt_fecha_prim_rev)
												SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
												INTO 		:ldb_int_peso,								:ldb_int_uf
												FROM 		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
														ldb_int_peso	= 0
														ldb_int_uf		= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_uf)
													end if
												end if
												ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
												ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
												ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
												if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
													dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
													idw_detalle.settransobject(sqlca)
													idw_detalle.retrieve(ls_base_contrato)
												end if
												if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
													SELECT	"CADENA"."RUT"
													INTO 		:ll_rut
													FROM 		"CADENA"
													WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
															  ("CADENA"."SERIE" = :ls_serie_contrato) and
															  ("CADENA"."NUMERO" = :ll_nro) 
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if gi_rut = ll_rut then
															dw_aumento_capacidad.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																		  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																		  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																		  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
															if ll_resp=1 then
																dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																dw_aumento_capacidad.setitem(1,'estado_contrato',1)
																cb_aceptar.enabled	= false
															end if
														end if
													else
														MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
														dw_aumento_capacidad.setitem(1,'estado_contrato',1)
														cb_aceptar.enabled	= false
													end if
												end if
											end if
										end if
										////
										dw_aumento_capacidad.setfocus()
										dw_aumento_capacidad.setcolumn('anexo_aumento_base')
									else
										dw_aumento_capacidad.enabled			= false
										dw_aumento_capacidad.setitem(1,'estado_rut',1)
										messagebox("Advertencia","NO fue Asignada Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
										dw_supervisor.setfocus()
									end if
								else
									dw_aumento_capacidad.setitem(1,'estado_rut',1)
								END IF
							end if
						end if
					else
						messagebox("Advertencia","Agente Inexistente")
						dw_agente.reset()
						dw_agente.insertrow(0)
						dw_agente.setfocus()
						gs_age	= ''
					end if
				end if
			
			elseif is_pasa_asigna='N' and is_sw_age='S' then
				gs_age	= dw_agente.getitemstring(1,'agente')
				gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
				gs_jefe	= dw_jefe.getitemstring(1,'jefes')
				if not isnull(gs_age) and gs_age<>'' then
					if gl_cod_parque=0 or isnull(gl_cod_parque) then
						SELECT	"AGENTES"."COD_SUP",
									"AGENTES"."COD_PARQUE",
									"SUPERVISOR"."COD_JEFE",
									"AGENTES"."CANAL"
						INTO 		:ls_sup,
									:gl_cod_parque,
									:gs_jefe,
									:ls_canal
						FROM 		"AGENTES",   
									"SUPERVISOR"  
						WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
								 (("AGENTES"."COD_AGE" = :gs_age ) )   
						USING		sqlca;
					else
						SELECT	"AGENTES"."COD_SUP",
									"SUPERVISOR"."COD_JEFE",
									"AGENTES"."CANAL"
						INTO 		:ls_sup,
									:gs_jefe,
									:ls_canal
						FROM 		"AGENTES",   
									"SUPERVISOR"  
						WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
								 (("AGENTES"."COD_AGE" = :gs_age ) )   
						USING		sqlca;
					end if
					if sqlca.sqlcode=0 then
						dw_aumento_capacidad.SetItem(1, "cadena_cod_parque", gl_cod_parque)
						dw_aumento_capacidad.SetItem(1,'anexo_aumento_canal_venta', ls_canal)
						dw_supervisor.setitem(1,'supervisores',ls_sup)
						dw_jefe.setitem(1,'jefes',gs_jefe)
						dw_supervisor.accepttext()
						dw_jefe.accepttext()
						gs_sup		= ls_sup
						if isnull(gs_age) then
							messagebox("Advertencia","Debe Ingresar Agente")
							dw_agente.setfocus()
						else
							dw_aumento_capacidad.SetItem(1, "anexo_aumento_cod_agente", gs_age)
							dw_aumento_capacidad.accepttext()
							if is_sw_age='S' and not isnull(gs_sup) and gs_sup<>'' and gs_jefe<>'' and not isnull(gs_jefe) then
								il_resp_age	= MessageBox("Advertencia", "Está seguro de ASIGNAR Aumento Capacidad Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								IF il_resp_age = 1 THEN
									ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										if gl_cod_parque=0 or isnull(gl_cod_parque) then
											SELECT	"AGENTES"."TIPO_CONT",
														"AGENTES"."COD_PARQUE"
											INTO 		:ls_tipo_cont,
														:gl_cod_parque
											FROM 		"AGENTES"  
											WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										else
											SELECT	"AGENTES"."TIPO_CONT"
											INTO 		:ls_tipo_cont
											FROM 		"AGENTES"  
											WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										end if
										dw_aumento_capacidad.SetItem(1, "cadena_cod_parque", gl_cod_parque)
										if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
											INSERT INTO "COMISION_PROMESA"  
														( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
											VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0			,0				,0				,0 )  
											USING		sqlca	;
											if sqlca.sqlcode=0 then
												ll_grabar_1	= 1
//												commit;
											else
												ll_grabar_1	= 0
//												rollback;
											end if
										end if
										ls_obs	= 'Aumento Capacidad creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_aumento_capacidad.enabled		= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_aumento_capacidad.setitem(1,'estado_rut',1)
										else
											if gi_rut>0 then dw_aumento_capacidad.setitem(1,'estado_rut',0)
										end if
										////
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 		"CADENA"  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC"
											INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc
											FROM 		"REVISION_CONTRATOS"  
											WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
													 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
													 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND
													 ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_base',ls_base_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_serie',ls_serie_asoc)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_nro_oferta',ll_numero_asoc)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha',ldt_fecha_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_moneda',ls_moneda_rev)
												dw_aumento_capacidad.SetItem(1,'anexo_aumento_forma_pago',ls_forma_pago_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_pie',ldb_pie_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_nro_cuotas',ll_plazo_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_gastos_adm',ldb_gasto_adm_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_valor_cuota',ldb_valor_cuota_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_precio',ldb_precio_ctto_rev)
												dw_aumento_capacidad.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_aumento_capacidad.SetItem(1,'pago_aumento_fecha_prim',ldt_fecha_prim_rev)
												SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
												INTO 		:ldb_int_peso,								:ldb_int_uf
												FROM 		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if dw_aumento_capacidad.getitemstring(1,'anexo_aumento_forma_pago')='1' then
														ldb_int_peso	= 0
														ldb_int_uf		= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_aumento_capacidad.setitem(1,'pago_aumento_tasa_base',ldb_int_uf)
													end if
												end if
												ls_base_contrato 					= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_base')
												ls_serie_contrato 				= dw_aumento_capacidad.getitemstring(1,'anexo_aumento_serie')
												ll_nro								= dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_oferta')
												if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
													dw_aumento_capacidad.getchild('anexo_aumento_serie',idw_detalle)
													idw_detalle.settransobject(sqlca)
													idw_detalle.retrieve(ls_base_contrato)
												end if
												if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
													SELECT	"CADENA"."RUT"
													INTO 		:ll_rut
													FROM 		"CADENA"
													WHERE   ("CADENA"."CODIGO" = :ls_base_contrato) and 
															  ("CADENA"."SERIE" = :ls_serie_contrato) and
															  ("CADENA"."NUMERO" = :ll_nro) 
													USING		sqlca;
													if sqlca.sqlcode=0 then
														if gi_rut = ll_rut then
															dw_aumento_capacidad.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															ll_resp	= messagebox("Advertencia","Aumento Capacidad Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																		  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																		  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																		  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
															if ll_resp=1 then
																dw_aumento_capacidad.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																dw_aumento_capacidad.setitem(1,'estado_contrato',1)
																cb_aceptar.enabled	= false
															end if
														end if
													else
														MessageBox("Aumento Capacidad" , "No Existe el Contrato Asociado")	
														dw_aumento_capacidad.setitem(1,'estado_contrato',1)
														cb_aceptar.enabled	= false
													end if
												end if
											end if
										end if
										////
										dw_aumento_capacidad.setfocus()
										dw_aumento_capacidad.setcolumn('anexo_aumento_base')
									else
										dw_aumento_capacidad.enabled		= false
										dw_aumento_capacidad.setitem(1,'estado_rut',1)
										messagebox("Advertencia","NO fue Re-Asignada Aumento Capacidad Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
										dw_supervisor.setfocus()
									end if
								else
									dw_aumento_capacidad.setitem(1,'estado_rut',1)
								END IF
							end if
						end if
					else
						messagebox("Advertencia","Agente Inexistente")
						dw_agente.reset()
						dw_agente.insertrow(0)
						dw_agente.setfocus()
						gs_age	= ''
					end if
				end if
			end if
			if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
				commit using sqlca;
				UPDATE	"ANEXO_AUMENTO"  
				SET 		"COD_AGENTE" = :gs_age,   
							"COD_SUPER" = :gs_sup,   
							"COD_JEF" = :gs_jefe  
				WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = :gs_serie ) AND  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :gi_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
			else
				rollback using sqlca;
			end if
		end if
		ll_cod_parque	= dw_aumento_capacidad.getitemnumber(1, "cadena_cod_parque")
		if ll_cod_parque > 0 then idw_detalle2.retrieve(ll_cod_parque)
		this.accepttext()
	else
		messagebox("Advertencia","Recuerde antes de Asingar debe ingresar Rut Cliente")
		dw_agente.reset()
		dw_agente.insertrow(0)
		if gs_nueva_oferta='S' then
			dw_supervisor.reset()
			dw_jefe.reset()
			dw_supervisor.insertrow(0)
			dw_jefe.insertrow(0)
		end if
		em_rut.setfocus()
	end if
end if
end event

