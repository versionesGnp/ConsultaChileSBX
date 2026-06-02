forward
global type w_ingresar_funeraria from window
end type
type em_serie from dropdownlistbox within w_ingresar_funeraria
end type
type st_producto from statictext within w_ingresar_funeraria
end type
type pb_producto from picturebutton within w_ingresar_funeraria
end type
type pb_benef from picturebutton within w_ingresar_funeraria
end type
type st_ver_benef from statictext within w_ingresar_funeraria
end type
type st_ver_tipo_servicio from statictext within w_ingresar_funeraria
end type
type st_ver_pie_pactado from statictext within w_ingresar_funeraria
end type
type st_help_seguro_2 from statictext within w_ingresar_funeraria
end type
type cb_x from picturebutton within w_ingresar_funeraria
end type
type st_help_porce_comi from statictext within w_ingresar_funeraria
end type
type cb_porce_comi from picturebutton within w_ingresar_funeraria
end type
type st_help_cta_cte from statictext within w_ingresar_funeraria
end type
type cb_ver_cuenta from picturebutton within w_ingresar_funeraria
end type
type st_memo from picturebutton within w_ingresar_funeraria
end type
type cb_3 from commandbutton within w_ingresar_funeraria
end type
type em_base from editmask within w_ingresar_funeraria
end type
type st_8 from statictext within w_ingresar_funeraria
end type
type dw_seguro from datawindow within w_ingresar_funeraria
end type
type cb_seguro2 from commandbutton within w_ingresar_funeraria
end type
type p_1 from picture within w_ingresar_funeraria
end type
type st_buscar from statictext within w_ingresar_funeraria
end type
type pb_buscar from picturebutton within w_ingresar_funeraria
end type
type dw_jefe from datawindow within w_ingresar_funeraria
end type
type st_salir from statictext within w_ingresar_funeraria
end type
type st_limpiar from statictext within w_ingresar_funeraria
end type
type st_imprimir from statictext within w_ingresar_funeraria
end type
type st_grabar from statictext within w_ingresar_funeraria
end type
type pb_print from picturebutton within w_ingresar_funeraria
end type
type pb_limpiar from picturebutton within w_ingresar_funeraria
end type
type cb_cerrar from picturebutton within w_ingresar_funeraria
end type
type cb_aceptar from picturebutton within w_ingresar_funeraria
end type
type st_5 from statictext within w_ingresar_funeraria
end type
type em_dv from editmask within w_ingresar_funeraria
end type
type st_4 from statictext within w_ingresar_funeraria
end type
type em_rut from editmask within w_ingresar_funeraria
end type
type st_3 from statictext within w_ingresar_funeraria
end type
type st_2 from statictext within w_ingresar_funeraria
end type
type em_numero from editmask within w_ingresar_funeraria
end type
type st_1 from statictext within w_ingresar_funeraria
end type
type em_serie2 from editmask within w_ingresar_funeraria
end type
type dw_1 from datawindow within w_ingresar_funeraria
end type
type dw_clientes from datawindow within w_ingresar_funeraria
end type
type dw_supervisor from datawindow within w_ingresar_funeraria
end type
type dw_agente from datawindow within w_ingresar_funeraria
end type
type st_6 from statictext within w_ingresar_funeraria
end type
type st_7 from statictext within w_ingresar_funeraria
end type
type st_help_memo from statictext within w_ingresar_funeraria
end type
type dw_anexo_funeraria from datawindow within w_ingresar_funeraria
end type
end forward

global type w_ingresar_funeraria from window
integer x = 73
integer y = 48
integer width = 3438
integer height = 1992
boolean titlebar = true
string title = "Ingresar Servicio Funerario"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
event ue_mousemove pbm_mousemove
em_serie em_serie
st_producto st_producto
pb_producto pb_producto
pb_benef pb_benef
st_ver_benef st_ver_benef
st_ver_tipo_servicio st_ver_tipo_servicio
st_ver_pie_pactado st_ver_pie_pactado
st_help_seguro_2 st_help_seguro_2
cb_x cb_x
st_help_porce_comi st_help_porce_comi
cb_porce_comi cb_porce_comi
st_help_cta_cte st_help_cta_cte
cb_ver_cuenta cb_ver_cuenta
st_memo st_memo
cb_3 cb_3
em_base em_base
st_8 st_8
dw_seguro dw_seguro
cb_seguro2 cb_seguro2
p_1 p_1
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
st_5 st_5
em_dv em_dv
st_4 st_4
em_rut em_rut
st_3 st_3
st_2 st_2
em_numero em_numero
st_1 st_1
em_serie2 em_serie2
dw_1 dw_1
dw_clientes dw_clientes
dw_supervisor dw_supervisor
dw_agente dw_agente
st_6 st_6
st_7 st_7
st_help_memo st_help_memo
dw_anexo_funeraria dw_anexo_funeraria
end type
global w_ingresar_funeraria w_ingresar_funeraria

type variables
Date		id_fecha_dia
Datetime	idt_fecha_vig
Long		il_resp_age,il_resp_sup,il_graba_1,il_graba_2,il_graba_3,il_graba_4,il_graba_5,il_tipo_cliente=1,il_modif,il_modif_plazo,il_modif_fec,il_estado,il_cod_seguro
String		is_base,is_serie, is_serie2,is_pasa_asigna='N',is_sw_age='N',is_sw_sup='N',is_sw_jef='N',is_respuesta,is_pasa='S',is_cerrar='1',is_error_cod
long		gi_prim_prod_funer_cd=1
Double	idb_iva,idb_suma
end variables

forward prototypes
public function double f_comision_sup1 (string as_area)
public function boolean wf_cadena (integer ai_modo)
public subroutine wf_limpiar ()
public subroutine wf_log_anexo_liberador ()
public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso)
public function boolean f_validar ()
public subroutine wf_mostrar_producto ()
public subroutine wf_nuevo_producto ()
public function long wf_digitada ()
public function string wf_graba_venta_asociada ()
public function string wf_beneficiarios ()
public subroutine wf_buscar_seguro (string as_base, string as_serie, double al_numero)
public subroutine wf_comisiones (string serie, double numero, double pie, integer credito)
end prototypes

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_producto.visible				= false

end event

public function double f_comision_sup1 (string as_area);double ld_porce

SELECT	"COM"
INTO 		:ld_porce
FROM 	"COMI_SUP"
WHERE ("COMI_SUP"."AREA" = :as_area);

RETURN ld_porce

end function

public function boolean wf_cadena (integer ai_modo);string 	ls_barra,ls_base,ls_serie,ls_agente
datetime	ld_null
Double	ll_numero
ls_barra 								= gs_base + gs_serie + String(gi_numero)
setnull(ld_null)
gl_cod_parque						= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
ls_agente							= dw_anexo_funeraria.getitemstring(1,'producto_anexo_cod_agente')
if isnull(gl_cod_parque) or gl_cod_parque=0 then
	SELECT	"AGENTES"."COD_PARQUE"  
	INTO 		:gl_cod_parque  
	FROM 	"AGENTES"  
	WHERE	"AGENTES"."COD_AGE" = :ls_agente   
	USING	sqlca;
	if sqlca.sqlcode<>0 then gl_cod_parque	= 0
end if
ls_base								= dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')
ls_serie								= dw_anexo_funeraria.getitemstring(1,'producto_anexo_serie')
ll_numero							= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_numero')
IF ai_modo = 0 THEN // Es un Insert
	INSERT INTO "CADENA"
				("BARRA",	"RUT",  "CODIGO",		"SERIE", 		"NUMERO", 	"ESTADO",	"PRINT",	"EST_CUP",	"NRO_CARTA",	"FECHA_CARTA",	"ESTADO_CARTA",	"FECHA_ACT_ESTADO",	"CUOTA_CUPON",	"FECHA_RES",	"A_DEMANDAR",	"ESTADO_CONTABLE",	"ESTADO_TITULO",	"FECHA_TITULO",	"NRO_CARTA_M",	"FECHA_CARTA_M",	"ESTADO_CARTA_M",	"FECHA_ACT_ESTADO_M",	"COD_PARQUE")
	VALUES 	(:ls_barra, 	:gi_rut,	:gs_base,	:gs_serie,	:gi_numero,	'V',			'N',		'0',				'SC',				:ld_null,				'0',							:ld_null,						0,						:ld_null,			'0',						'A',							'N',						:ld_null,				'SC',					:ld_null,					'0', 							:ld_null,							:gl_cod_parque)
	USING	sqlca;
	if sqlca.sqlcode = 0 then 
		il_graba_2	= 1
//		commit;
	else
		messagebox("Error Grabar Tabla CADENA","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
		il_graba_2	= 0
//		rollback;
	end if
	RETURN (SQLCA.SQLCode <> -1)
ELSE
	// Update
	UPDATE	"CADENA"  
   	SET 		"COD_PARQUE" = :gl_cod_parque  
   	WHERE  	"CADENA"."CODIGO" = :gs_base AND  
          		"CADENA"."SERIE" = :gs_serie AND  
          		"CADENA"."NUMERO" = :gi_numero   
	USING	sqlca;
	if sqlca.sqlcode = 0 then 
		il_graba_2						= 1
//		commit;
	else
		messagebox("Error Grabar Tabla CADENA","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
		il_graba_2						= 0
//		rollback;
	end if
	RETURN (SQLCA.SQLCode <> -1)
END IF
end function

public subroutine wf_limpiar ();long		ll_new,ll_cant,ll_null=0,ll_tot_reg,ll_indi,ll_nulo
datetime	ldt_nulo
string 	ls_nulo

setnull(ldt_nulo);setnull(ls_nulo);setnull(ll_nulo)
dw_anexo_funeraria.reset()
if isnull(gd_uf_dia) then
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:gd_uf_dia  
	FROM 	"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia   ;
end if
ll_new					= dw_anexo_funeraria.insertrow(0)

dw_anexo_funeraria.SetItem(1,"producto_anexo_base",gs_base)
dw_anexo_funeraria.SetItem(1,"producto_anexo_serie",gs_serie)
dw_anexo_funeraria.SetItem(1,"producto_anexo_numero",gi_numero)
dw_anexo_funeraria.SetItem(1,"producto_anexo_ult_folio",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_rut",ll_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_total_pagado",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_uso",'')
dw_anexo_funeraria.SetItem(1,"producto_anexo_cuotas_pag",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_fecha_ingreso",id_fecha_dia)
dw_anexo_funeraria.SetItem(1,"producto_anexo_ingreso_sistema",id_fecha_dia)
dw_anexo_funeraria.SetItem(1,"producto_anexo_forma_pago",ls_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_fecha_cierre", ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_fecha_com",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_uf_cierre",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_nro_resc",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_agente",gs_age)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_super",gs_sup)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_jefe",gs_jefe)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_comi","N")
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_premio","N")
dw_anexo_funeraria.SetItem(1,"producto_anexo_total_com",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_ingre",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_age",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_sup",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_jefe",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_seguro",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_ult_fecha_seg",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_u_folio",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_u_fecha",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estatus_comision",ls_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_comi_sup",'N')
dw_anexo_funeraria.SetItem(1,"producto_anexo_cierre_venta",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cierre_venta_semanal",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_saldo_financiar",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_u_fecha_sem",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_ing_cierre",ll_null)
dw_anexo_funeraria.SetItem(1,'estado_rut',1)
dw_anexo_funeraria.SetItem(1,'estado_contrato',1)

dw_anexo_funeraria.SetItem(1, "producto_pago_base",gs_base)
dw_anexo_funeraria.SetItem(1, "producto_pago_serie",gs_serie)
dw_anexo_funeraria.SetItem(1, "producto_pago_numero",gi_numero)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha",id_fecha_dia)
dw_anexo_funeraria.SetItem(1, "producto_pago_folio",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_precio",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_pie_pagado",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_pie",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_tasa",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_tasa_base",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_valor_cuota",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_plazo",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_uf_dia",gd_uf_dia)
dw_anexo_funeraria.SetItem(1, "producto_pago_moneda",ls_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_gasto_adm",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_ctas_pie_plazo",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_ctas_pie_pagadas",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_usuario_crea",gs_user)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_prim",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_ult",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_pie",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_pie_prim",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_codigo_servicio",ll_null)

//dw_anexo_funeraria.SetItem(1, "pago_liberador_modificado", gs_user)
//dw_anexo_funeraria.SetItem(1, "pago_liberador_fecha_mod", id_fecha_dia)
dw_clientes.reset()
dw_agente.reset()
dw_supervisor.reset()
dw_jefe.reset()
dw_supervisor.insertrow(0)
dw_agente.insertrow(0)
dw_clientes.insertrow(0)
dw_jefe.insertrow(0)
dw_seguro.reset()
if gs_conexion = "Parque El Prado" then
	ll_tot_reg	= dw_seguro.retrieve(1, gs_base)
elseif gs_conexion = "Parque La Foresta" then
	ll_tot_reg	= dw_seguro.retrieve(11, gs_base)
end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled			= false
dw_agente.enabled			= false
dw_supervisor.enabled		= false
dw_jefe.enabled				= false
end subroutine

public subroutine wf_log_anexo_liberador ();String		ls_serie,ls_moneda,ls_base,ls_forma_pago
Long		ll_rut,ll_nro_cuotas,ll_cod_parque
Double	ll_saldo_financiero,ll_precio,ll_gastos_adm,ll_plazo,ll_tasa,&
			ll_uf_dia,ll_valor_cuota,ll_pie,ll_tasa_base,ll_numero
Datetime	ldt_fecha,ldt_fecha_prim,ldt_fecha_pie,ldt_fecha_hoy,ldt_fecha_ult,&
			ldt_fecha_ingreso
			
SELECT	sysdate  
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
ldt_fecha_hoy					= gdt_fec_sistema
ls_base							= dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')
ls_serie							= dw_anexo_funeraria.getitemstring(1,'producto_anexo_serie')
ll_numero						= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_numero')
ls_moneda						= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
ls_forma_pago					= dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')
ll_rut								= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_rut')
ll_saldo_financiero				= dw_anexo_funeraria.getitemnumber(1,'saldo_finan')
ll_nro_cuotas					= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
ll_precio							= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
ll_valor_cuota					= dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')
ll_pie								= dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie')
ll_tasa							= dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa')
ll_tasa_base						= dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa_base')
ll_gastos_adm					= dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm')
ll_uf_dia							= dw_anexo_funeraria.getitemnumber(1,'producto_pago_uf_dia')
ll_cod_parque					= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
ldt_fecha							= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')
ldt_fecha_prim					= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
ldt_fecha_ult					= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_ult')
ldt_fecha_pie					= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')
ldt_fecha_ingreso				= dw_anexo_funeraria.getitemdatetime(1,'producto_anexo_fecha_ingreso')

if isnull(ls_serie) then ls_serie=' '
if isnull(ls_moneda) then ls_moneda=' '
if isnull(ls_base) then ls_base=' '
if isnull(ls_forma_pago) then ls_forma_pago=' '
if isnull(ll_numero) then ll_numero=0
if isnull(ll_rut) then ll_rut=0
if isnull(ll_saldo_financiero) then ll_saldo_financiero=0
if isnull(ll_nro_cuotas) then ll_nro_cuotas=0
if isnull(ll_precio) then ll_precio=0
if isnull(ll_valor_cuota) then ll_valor_cuota=0
if isnull(ll_pie) then ll_pie=0
if isnull(ll_tasa) then ll_tasa=0
if isnull(ll_tasa_base) then ll_tasa_base=0
if isnull(ll_gastos_adm) then ll_gastos_adm=0
if isnull(ll_uf_dia) then ll_uf_dia=0
if isnull(ll_cod_parque) then ll_cod_parque=0
if isnull(ldt_fecha) then ldt_fecha=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_prim) then ldt_fecha_prim=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ult) then ldt_fecha_ult=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_pie) then ldt_fecha_pie=datetime(date("01/01/1900"),time("00:00:00"))
if isnull(ldt_fecha_ingreso) then ldt_fecha_ingreso=datetime(date("01/01/1900"),time("00:00:00"))

INSERT INTO	"LOG_PRODUCTO"  
			( "SERIE",   "NUMERO",   "RUT",   "BASE",   	"USUARIO_CREA",  	"FECHA_CREA",   "FECHA",   "FORMA_PAGO",   "SALDO_FINANCIERO",   "MONEDA",   "PRECIO",   "PIE",   	"FECHA_PIE",   "NRO_CUOTAS",   "FECHA_PRIM",   "TASA",	"TASA_BASE",   "GASTOS_ADM",  "UF_DIA",   "VALOR_CUOTA",   "FECHA_ULT",   "FECHA_INGRESO",	"COD_PARQUE" )  
VALUES	( :ls_serie, :ll_numero, 	:ll_rut, 	:ls_base, :gs_user,   		  		:ldt_fecha_hoy,		:ldt_fecha,:ls_forma_pago, 	:ll_saldo_financiero, 		:ls_moneda, :ll_precio, 	:ll_pie, 	:ldt_fecha_pie,	:ll_nro_cuotas, 		:ldt_fecha_prim,:ll_tasa, 	:ll_tasa_base,	:ll_gastos_adm, 	:ll_uf_dia, 	:ll_valor_cuota, 	:ldt_fecha_ult,	:ldt_fecha_ingreso,	:ll_cod_parque )  
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
end subroutine

public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso);double ld_porce_nf, ld_porce_ni

SELECT	"PORCENT_NF",	"PORCENT_NI"
INTO		:ld_porce_nf,		:ld_porce_ni
FROM		"COMISIONES"
WHERE 	("COMISIONES"."TIPO_VENTA" = :as_tipo_venta) AND
			("COMISIONES"."AREA_SEPULT" = :as_area);
IF as_uso = "NF" THEN
	RETURN ld_porce_nf
ELSE
	RETURN ld_porce_ni
END IF

RETURN 0



end function

public function boolean f_validar ();string 	ls_forma_pago,ls_moneda
Double	lld_gastos_adm,lld_tasa,lld_kapital,lld_valor_cuo,lld_pie,lld_valor_adm

dw_anexo_funeraria.AcceptText()
dw_clientes.AcceptText()

ls_moneda										= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
lld_tasa											= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa_base'))
if lld_tasa>100 then
	messagebox("Error","Valor Tasa Contrato Inválida")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_tasa_base')
	RETURN FALSE
end if
if  isnull(dw_anexo_funeraria.GetItemNumber(1,"producto_anexo_rut")) THEN
	messageBox("Error", "Debe ingresar el rut del cliente")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_anexo_rut')
elseif isnull(dw_anexo_funeraria.GetItemString(1,"producto_anexo_cod_agente")) THEN
	messageBox("Error", "Debe ingresar el codigo del Agente")
	dw_agente.setfocus()
elseif isnull(dw_anexo_funeraria.GetItemString(1,"producto_anexo_cod_super")) THEN
	messageBox("Error", "Debe ingresar el codigo del Supervisor")
	dw_supervisor.setfocus()
elseif isnull(dw_anexo_funeraria.GetItemString(1,"producto_anexo_cod_jefe")) THEN
	messageBox("Error", "Debe ingresar el codigo del Jefe Ventas")
	dw_jefe.setfocus()
elseif isnull(dw_anexo_funeraria.GetItemString(1,"producto_anexo_base")) THEN
	messageBox("Error", "Debe ingresar base del contrato asociado")
	em_base.setfocus()
elseif isnull(dw_anexo_funeraria.GetItemString(1,"producto_anexo_serie")) THEN
	messageBox("Error", "Debe ingresar la serie del contrato asociado")
	em_serie.setfocus()
elseif isnull(dw_anexo_funeraria.GetItemNumber(1,"producto_anexo_numero")) THEN
	messageBox("Error", "Debe ingresar el número del contrato asociado")
	em_numero.setfocus()
end if

ls_forma_pago									= dw_anexo_funeraria.GetItemString(1, "producto_anexo_forma_pago")
if isnull(ls_forma_pago) THEN
	messageBox("Error", "Debe ingresar la forma de pago")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_anexo_forma_pago')
elseif isnull(dw_anexo_funeraria.GetItemString(1, "producto_pago_moneda")) THEN
	messageBox("Error", "Debe ingresar el tipo de moneda")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_moneda')
elseif dw_anexo_funeraria.GetItemNumber(1, "producto_pago_precio") = 0 THEN
	messageBox("Error", "Debe ingresar precio")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_precio')
elseif dw_anexo_funeraria.GetItemNumber(1, "producto_pago_tasa_base") = 0  and (dw_anexo_funeraria.GetItemString(1, 'producto_anexo_forma_pago')='2' or dw_anexo_funeraria.GetItemString(1, 'producto_anexo_forma_pago')='4') THEN
	messageBox("Error", "Debe ingresar Tasa Contrato")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_tasa_base')
end if

//lld_gastos_adm									= double(dw_anexo_funeraria.GetItemNumber(1, "producto_pago_gasto_adm"))
//if lld_gastos_adm = 0  and (ls_forma_pago='2' or ls_forma_pago='4')THEN
//	messageBox("Error", "Debe ingresar Gasto Administrativo")
//	dw_anexo_funeraria.setfocus()
//	dw_anexo_funeraria.setcolumn('producto_pago_gasto_adm')
if dw_anexo_funeraria.GetItemNumber(1, "producto_pago_valor_cuota") = 0 THEN
	messageBox("Error", "Debe ingresar valor de la cuota")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_valor_cuota')
elseif dw_anexo_funeraria.GetItemNumber(1, "producto_pago_plazo") = 0 THEN
	messageBox("Error", "Debe ingresar el número de cuotas")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_plazo')
elseif isnull(dw_anexo_funeraria.GetItemDateTime(1, "producto_pago_fecha_prim")) THEN
	messageBox("Error", "Debe ingresar la fecha del primer vencimiento")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_fecha_prim')
elseif isnull(dw_anexo_funeraria.GetItemDateTime(1, "producto_pago_fecha_ult")) THEN
	messageBox("Error", "Debe ingresar la fecha del último vencimiento")
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_pago_fecha_ult')
elseif isnull(dw_clientes.GetItemString(1, "nombre")) THEN
	messageBox("Error", "Debe ingresar nombre del cliente")
elseif isnull(dw_clientes.GetItemString(1, "a_paterno")) THEN
	messageBox("Error", "Debe ingresar apellido paterno del cliente")
elseif isnull(dw_clientes.GetItemString(1, "a_materno")) THEN
	messageBox("Error", "Debe ingresar apellido materno del cliente")
elseif isnull(dw_clientes.GetItemString(1, "direccion_p")) THEN
	messageBox("Error", "Debe ingresar la dirección particular del cliente")
elseif isnull(dw_clientes.GetItemString(1, "comuna")) THEN
	messageBox("Error", "Debe ingresar la comuna donde vive el cliente")
elseif isnull(dw_clientes.GetItemString(1, "ciudad")) THEN
	messageBox("Error", "Debe ingresar la ciudad donde vive el cliente")
elseif isnull(dw_clientes.GetItemString(1, "sexo")) THEN
	messageBox("Error", "Debe ingresar el sexo del cliente")
elseif isnull(dw_clientes.GetItemDateTime(1, "fecha_nac")) THEN
	messageBox("Error", "Debe ingresar la fecha de nacimiento del cliente")
elseif isnull(dw_clientes.GetItemString(1, "esta_civil")) THEN
	messageBox("Error", "Debe ingresar el estado civil del cliente")
end if
RETURN TRUE
end function

public subroutine wf_mostrar_producto ();Long		ll_count_reg,ll_count,ll_cod_seguro,ll_estado_reg,ll_reg
Double	ldb_monto

cb_aceptar.text 							= "Actualizar"
gi_rut 										= Long(dw_anexo_funeraria.GetItemNumber(1, "producto_anexo_rut"))
dw_anexo_funeraria.SetItem(1,'estado_rut',0)
dw_anexo_funeraria.setitem(1,'estado_contrato',0)
if dw_clientes.Retrieve(gi_rut)=0 then dw_clientes.insertrow(0)

dw_anexo_funeraria.SetItem(1,"dv",upper(dw_clientes.GetItemstring(1,"dv")))
em_dv.text									= upper(dw_clientes.GetItemstring(1,"dv"))
em_rut.text									= string(gi_rut)
SELECT	COUNT("CD_FOLIO_DETALLE"."BASE")  
INTO 		:ll_count_reg  
FROM 	"CD_FOLIO_DETALLE"  
WHERE 	"CD_FOLIO_DETALLE"."BASE" = :gs_base AND  
		 	"CD_FOLIO_DETALLE"."SERIE" = :gs_serie AND  
		 	"CD_FOLIO_DETALLE"."NUMERO" = :gi_numero AND
		 	"CD_FOLIO_DETALLE"."ESTADO" = 99
USING		sqlca;
if ll_count_reg>0 then
	st_memo.italic							= true
else
	st_memo.italic							= false
end if
em_rut.enabled							= false
em_dv.enabled								= false
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
dw_seguro.enabled							= true
dw_anexo_funeraria.enabled				= true
dw_agente.enabled							= true
dw_supervisor.enabled						= true
dw_jefe.enabled								= true
dw_agente.setfocus()
//dw_anexo_liberador.setfocus()
end subroutine

public subroutine wf_nuevo_producto ();string		ls_nulo
long		ll_nulo,ll_null=0
Datetime	ldt_nulo
setnull(ls_nulo);setnull(ldt_nulo);setnull(ll_nulo)

cb_aceptar.text									= "Ingresar"
dw_agente.reset()
dw_anexo_funeraria.reset()
dw_supervisor.reset()
dw_jefe.reset()
dw_agente.InsertRow(0)
dw_supervisor.InsertRow(0)
dw_jefe.InsertRow(0)
dw_clientes.InsertRow(0)
dw_anexo_funeraria.InsertRow(0)
dw_anexo_funeraria.SetItem(1,"producto_anexo_base",gs_base)
dw_anexo_funeraria.SetItem(1,"producto_anexo_serie",gs_serie)
dw_anexo_funeraria.SetItem(1,"producto_anexo_numero",gi_numero)
dw_anexo_funeraria.SetItem(1,"producto_anexo_rut",gi_rut)

dw_anexo_funeraria.SetItem(1,"producto_anexo_ult_folio",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_total_pagado",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_uso",'')
dw_anexo_funeraria.SetItem(1,"producto_anexo_cuotas_pag",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_fecha_ingreso",id_fecha_dia)
dw_anexo_funeraria.SetItem(1,"producto_anexo_ingreso_sistema",id_fecha_dia)
dw_anexo_funeraria.SetItem(1,"producto_anexo_forma_pago",ls_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_fecha_cierre", ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_fecha_com",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_uf_cierre",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_nro_resc",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_agente",gs_age)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_super",gs_sup)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_jefe",gs_jefe)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_comi","N")
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_premio","N")
dw_anexo_funeraria.SetItem(1,"producto_anexo_total_com",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_ingre",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_age",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_sup",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_jefe",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_seguro",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_ult_fecha_seg",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_u_folio",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_u_fecha",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estatus_comision",ls_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_comi_sup",'N')
dw_anexo_funeraria.SetItem(1,"producto_anexo_cierre_venta",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_cierre_venta_semanal",ldt_nulo)
dw_anexo_funeraria.SetItem(1,"producto_anexo_saldo_financiar",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_u_fecha_sem",ll_null)
dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_ing_cierre",ll_null)
dw_anexo_funeraria.SetItem(1,'estado_rut',1)
dw_anexo_funeraria.SetItem(1,'estado_contrato',1)

dw_anexo_funeraria.SetItem(1, "producto_pago_base",gs_base)
dw_anexo_funeraria.SetItem(1, "producto_pago_serie",gs_serie)
dw_anexo_funeraria.SetItem(1, "producto_pago_numero",gi_numero)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha",id_fecha_dia)
dw_anexo_funeraria.SetItem(1, "producto_pago_folio",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_precio",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_pie_pagado",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_pie",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_tasa",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_tasa_base",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_valor_cuota",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_plazo",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_uf_dia",gd_uf_dia)
dw_anexo_funeraria.SetItem(1, "producto_pago_moneda",ls_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_gasto_adm",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_ctas_pie_plazo",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_ctas_pie_pagadas",ll_null)
dw_anexo_funeraria.SetItem(1, "producto_pago_usuario_crea",gs_user)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_prim",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_ult",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_pie",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_fecha_pie_prim",ldt_nulo)
dw_anexo_funeraria.SetItem(1, "producto_pago_codigo_servicio",ll_null)

//dw_anexo_funeraria.SetItem(1, "pago_liberador_modificado", gs_user)
//dw_anexo_funeraria.SetItem(1, "pago_liberador_fecha_mod", id_fecha_dia)
em_rut.enabled			= true
em_dv.enabled				= true
em_rut.setfocus()
end subroutine

public function long wf_digitada ();long	ll_digitada
SELECT	count("PRODUCTO_PAGO"."BASE")  
INTO 		:ll_digitada
FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
WHERE	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
			( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
			( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
			( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
			( ( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
			( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
			( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )
USING	sqlca;
if isnull(ll_digitada) or ll_digitada=0 then ll_digitada=0
Return ll_digitada

end function

public function string wf_graba_venta_asociada ();string		ls_uso,ls_uso_c	,ls_graba='N'
long		ll_cod_serv,ll_tipo_benef,ll_capac,ll_cod_serv_c,ll_tipo_benef_c,ll_capac_c
double	ldb_precio,ldb_sum_prod

dw_anexo_funeraria.accepttext()
ldb_precio   										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
ls_uso	   										= dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso')
ll_cod_serv 										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_codigo_servicio')
ll_tipo_benef									= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_tipo_beneficiarios')
ll_capac	  										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_capacidad')

SELECT 	"USO","COD_SERVICIO","TIPO_BENEFICIARIO","CAPACIDAD"
INTO		:ls_uso_c,:ll_cod_serv_c,:ll_tipo_benef_c,:ll_capac_c
FROM		"PRODUCTO_VENTA_ASOCIADA"  
WHERE	"PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base AND  
			"PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie AND  
			"PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero AND 
			"PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE" = 1  AND  
			("PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' or "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R')
USING	sqlca;
if isnull(ls_uso_c) or ls_uso_c='' then ls_uso_c=''
if isnull(ll_cod_serv_c) or ll_cod_serv_c=0 then ll_cod_serv_c=0
if isnull(ll_tipo_benef_c) or ll_tipo_benef_c=0 then ll_tipo_benef_c=0
if isnull(ll_capac_c) or ll_capac_c=0 then ll_capac_c=0

if ls_uso=ls_uso_c and ll_cod_serv=ll_cod_serv_c and ll_tipo_benef=ll_tipo_benef_c and ll_capac=ll_capac_c then
	SELECT 	SUM("VALOR_PRODUCTO")
	INTO		:ldb_sum_prod
	FROM		"PRODUCTO_VENTA_ASOCIADA"  
	WHERE	"PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base AND  
				"PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie AND  
				"PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero AND 
				("PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' or "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R')
	USING	sqlca;
	if isnull(ldb_sum_prod) or ldb_sum_prod=0 then ldb_sum_prod=0
	if round(ldb_precio,2) = round(ldb_sum_prod,2) then
		ls_graba					= 'S'
	else
		ls_graba					= 'S'		//'N'		Modificado Mirko 12112024 sacar validacion por diferencia
	end if
else
	ls_graba						= 'N'
end if

if ls_graba='S' then
	UPDATE	"PRODUCTO_VENTA_ASOCIADA"  	
	SET		"ESTADO" = 'D' 
	WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) AND  
				( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' or "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'R')
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
else
	messagebox("Advertencia","Valor Producto con Diferencias Producto Seleccionado")
	pb_producto.triggerevent(clicked!)
end if
Return ls_graba

end function

public function string wf_beneficiarios ();string	ls_benef_ok
long	ll_capac,ll_benef,ll_activa


//wf_beneficiarios()
dw_anexo_funeraria.accepttext()

SELECT	"REVISION_CONTRATOS"."SW_ACTIVA_SERVICIO"
INTO		:ll_activa
FROM		"REVISION_CONTRATOS"
WHERE	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
			( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
			( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) 
USING	sqlca;
if isnull(ll_activa) then ll_activa=1

ll_capac	  											= dw_anexo_funeraria.getitemnumber(1,'producto_pago_capacidad')
if ll_activa=2 then
	ls_benef_ok										= f_beneficiarios(gs_base,gs_serie,gi_numero,ll_capac)
	if ls_benef_ok = 'N' then
		messagebox("Advertencia","Debe Ingresar Beneficiario Servicio Funerario (Fallecido)")
		pb_benef.triggerevent(clicked!)
	end if
else
	ls_benef_ok										= 'S'
end if
Return ls_benef_ok

end function

public subroutine wf_buscar_seguro (string as_base, string as_serie, double al_numero);String	ls_base_aux

SELECT	"BASE_CTTO_ORIGINAL"  
INTO 		:ls_base_aux  
FROM 	"SEGURO_RENTA_DECESO"  
WHERE  	"SEGURO_RENTA_DECESO"."BASE_CTTO_ORIGINAL" = :as_base AND  
		 	"SEGURO_RENTA_DECESO"."SERIE_CTTO_ORIGINAL" = :as_serie AND  
		 	"SEGURO_RENTA_DECESO"."NUMERO_CTTO_ORIGINAL" = :al_numero   
USING		sqlca;
if sqlca.sqlcode=0 then
	cb_x.italic	= true
else
	cb_x.italic	= false
end if
end subroutine

public subroutine wf_comisiones (string serie, double numero, double pie, integer credito);//Long	 correlativo,ll_cod_parque
//double c_pie,	c_primera,c_segunda,c_tercera,c_cuarta,c_quinta ,c_sexta ,c_septima, c_octava, c_novena, porce_comi 
//
//ll_cod_parque	= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
//SELECT	SERIE,NUMERO  
//INTO 		:serie,:numero  
//FROM 		COMISION_PROMESA  
//WHERE  ( BASE = 'L' ) AND ( SERIE = :serie ) AND ( NUMERO = :numero )   ;
////if credito = 1 then pie = 100
//if sqlca.sqlcode = 0 then
//	if pie < 10 then
//		SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA, 	C_NOVENA,	(C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) AS PORCENTAJE  
//		INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima, :c_octava,:c_novena,	:porce_comi 
//		FROM 		PORCENTAJE_COMISIONES  
//		WHERE  ( PIE_MIN <= :pie AND  PIE_MAX >= :pie) AND  
//					AREA = 'X' AND T_CONS = 'X' AND ( CREDITO_MIN <= :credito AND CREDITO >= :credito ) and
//				 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and
//				 ( COD_PARQUE = :ll_cod_parque );
//	elseif pie >= 10 then
//		SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA,	C_NOVENA, (C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) AS PORCENTAJE  
//		INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima,:c_octava, :c_novena,:porce_comi 
//		FROM 		PORCENTAJE_COMISIONES  
//		WHERE  ( PIE_MIN <= :pie AND  PIE_MAX >= :pie) AND  
//					AREA = 'X' AND T_CONS = 'X' and 
//				 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and
//				 ( COD_PARQUE = :ll_cod_parque );
//	end if
//	if sqlca.sqlcode = 0 and not isnull(correlativo) then
//		UPDATE "COMISION_PROMESA"  
//		SET C_PIE     = :c_pie,   
//			 C_PRIMERA = :c_primera,   
//			 C_SEGUNDA = :c_segunda,   
//			 C_TERCERA = :c_tercera,   
//			 C_CUARTA  = :c_cuarta,   
//			 C_QUINTA  = :c_quinta,   
//			 C_SEXTA   = :c_sexta, 
//			 C_SEPTIMA = :c_septima,
//			 C_OCTAVA  = :c_octava,
//			 C_NOVENA  = :c_novena
//		where base    = 'L' and serie = :serie and numero = :numero ;
//		if sqlca.sqlcode = 0 then
//			UPDATE	"ANEXO_LIBERADOR"  
//			SET 		"PORCE_AGE" = :porce_comi ,
//				 		"ESTATUS_COMISION" = '1'  
//			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :serie ) AND  
//					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :numero ) ;
//			if sqlca.sqlcode = 0 then
//				commit;
//			else
//				ROLLBACK;
//			end if
//		end if
//	end if
//end if
end subroutine

on w_ingresar_funeraria.create
this.em_serie=create em_serie
this.st_producto=create st_producto
this.pb_producto=create pb_producto
this.pb_benef=create pb_benef
this.st_ver_benef=create st_ver_benef
this.st_ver_tipo_servicio=create st_ver_tipo_servicio
this.st_ver_pie_pactado=create st_ver_pie_pactado
this.st_help_seguro_2=create st_help_seguro_2
this.cb_x=create cb_x
this.st_help_porce_comi=create st_help_porce_comi
this.cb_porce_comi=create cb_porce_comi
this.st_help_cta_cte=create st_help_cta_cte
this.cb_ver_cuenta=create cb_ver_cuenta
this.st_memo=create st_memo
this.cb_3=create cb_3
this.em_base=create em_base
this.st_8=create st_8
this.dw_seguro=create dw_seguro
this.cb_seguro2=create cb_seguro2
this.p_1=create p_1
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
this.st_5=create st_5
this.em_dv=create em_dv
this.st_4=create st_4
this.em_rut=create em_rut
this.st_3=create st_3
this.st_2=create st_2
this.em_numero=create em_numero
this.st_1=create st_1
this.em_serie2=create em_serie2
this.dw_1=create dw_1
this.dw_clientes=create dw_clientes
this.dw_supervisor=create dw_supervisor
this.dw_agente=create dw_agente
this.st_6=create st_6
this.st_7=create st_7
this.st_help_memo=create st_help_memo
this.dw_anexo_funeraria=create dw_anexo_funeraria
this.Control[]={this.em_serie,&
this.st_producto,&
this.pb_producto,&
this.pb_benef,&
this.st_ver_benef,&
this.st_ver_tipo_servicio,&
this.st_ver_pie_pactado,&
this.st_help_seguro_2,&
this.cb_x,&
this.st_help_porce_comi,&
this.cb_porce_comi,&
this.st_help_cta_cte,&
this.cb_ver_cuenta,&
this.st_memo,&
this.cb_3,&
this.em_base,&
this.st_8,&
this.dw_seguro,&
this.cb_seguro2,&
this.p_1,&
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
this.st_5,&
this.em_dv,&
this.st_4,&
this.em_rut,&
this.st_3,&
this.st_2,&
this.em_numero,&
this.st_1,&
this.em_serie2,&
this.dw_1,&
this.dw_clientes,&
this.dw_supervisor,&
this.dw_agente,&
this.st_6,&
this.st_7,&
this.st_help_memo,&
this.dw_anexo_funeraria}
end on

on w_ingresar_funeraria.destroy
destroy(this.em_serie)
destroy(this.st_producto)
destroy(this.pb_producto)
destroy(this.pb_benef)
destroy(this.st_ver_benef)
destroy(this.st_ver_tipo_servicio)
destroy(this.st_ver_pie_pactado)
destroy(this.st_help_seguro_2)
destroy(this.cb_x)
destroy(this.st_help_porce_comi)
destroy(this.cb_porce_comi)
destroy(this.st_help_cta_cte)
destroy(this.cb_ver_cuenta)
destroy(this.st_memo)
destroy(this.cb_3)
destroy(this.em_base)
destroy(this.st_8)
destroy(this.dw_seguro)
destroy(this.cb_seguro2)
destroy(this.p_1)
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
destroy(this.st_5)
destroy(this.em_dv)
destroy(this.st_4)
destroy(this.em_rut)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_numero)
destroy(this.st_1)
destroy(this.em_serie2)
destroy(this.dw_1)
destroy(this.dw_clientes)
destroy(this.dw_supervisor)
destroy(this.dw_agente)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_help_memo)
destroy(this.dw_anexo_funeraria)
end on

event open;long		ll_cant,ll_null,ll_tot_reg,ll_indi
datetime	ld_null
string 	ls_null,ls_opcion_dig,ls_serie

connect using	Trans_1;
connect using	Trans_2;
gs_graba_prod			= 'X'
gf_centrar(w_ingresar_funeraria)

if isvalid(w_validar_promesa_operaciones) then
	gs_base				= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
	gs_serie				= trim(w_validar_promesa_operaciones.ddlb_serie.text)
else
	gs_base				= Message.StringParm
end if
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
SELECT DISTINCT "FACTORES"."FECHA_VIGENCIA"  
INTO		:idt_fecha_vig  
FROM		"FACTORES"  
WHERE	"FACTORES"."ESTADO_VIGENCIA" = 'V'   
USING	sqlca;
dw_seguro.SetTransObject(SQLCA)
if gs_conexion = "Parque El Prado" then
	ll_tot_reg							= dw_seguro.retrieve(1,gs_base)
	if gl_cod_parque=1 then
		p_1.picturename				= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 				= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 				= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 				= 'logo_e.bmp'
	end if
elseif	gs_conexion = "Parque La Foresta" then
	ll_tot_reg							= dw_seguro.retrieve(11,gs_base)
	p_1.picturename 					= 'logo_e_s.bmp'

end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled						= false
SELECT	"ENCARGADOS"."DIGITACION"
INTO 		:ls_opcion_dig
FROM 	"ENCARGADOS"  
WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING	sqlca;
if sqlca.sqlcode=0 then
	if ls_opcion_dig='1' or ls_opcion_dig='3'then 
		cb_aceptar.enabled				= true
	elseif ls_opcion_dig='2' then
		cb_aceptar.enabled				= false
	end if
end if
dw_clientes.SetTransObject(SQLCA)
dw_1.settransobject(sqlca)
dw_anexo_funeraria.SetTransObject(SQLCA)
dw_anexo_funeraria.getchild('producto_anexo_serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if

dw_anexo_funeraria.getchild('producto_pago_codigo_servicio',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(gl_cod_parque,'NI',gs_serie,'2')=0 then
	idw_detalle2.insertrow(0)
end if

dw_agente.SetTransObject(SQLCA)
dw_supervisor.SetTransObject(SQLCA)
dw_jefe.SetTransObject(SQLCA)

//gs_base										= 'F'
//gs_serie										= 'F'
em_base.text								= gs_base
//em_serie.text								= gs_serie
em_numero.text							= ''
em_rut.text									= ''
em_dv.text									= ''
id_fecha_dia								= date(gdt_fec_sistema)
cb_x.italic 									= false
SELECT 	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia  
FROM 	"TAB_UF"  
WHERE	"TAB_UF"."FECHA_UF" = :id_fecha_dia;
IF gd_uf_dia = 0 or isnull(gd_uf_dia) THEN 
	messagebox("Advertencia","No se Registra U.F. del día "+string(id_fecha_dia))
	open(w_mantenedor_uf)
end if
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:gd_uf_dia
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia
using		sqlca;
if sqlca.sqlcode<>0 then
	close(w_ingresar_funeraria)
else
	setnull(gs_serie);setnull(gi_numero);setnull(gi_rut)
	pb_limpiar.triggerevent(clicked!)
	em_rut.enabled						= false
	em_dv.enabled							= false
	em_serie.setfocus()
end if
SELECT 	"TASA"."IVA"  
INTO 		:idb_iva
FROM 	"TASA"   ;

if gs_base<>'G' and gs_base <> 'F' then idb_iva=0
dw_anexo_funeraria.setitem(1,'valor_iva',idb_iva)
dw_anexo_funeraria.setitem(1,'cuota_seguros', 0)

if isvalid(w_validar_promesa_operaciones) then
	gs_base 									= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'base')
	gs_serie 									= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'serie')
	gi_numero 								= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'numero')
	gi_rut		 								= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'rut')
	gs_dv 									= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'dv')
	
	SELECT 		"CD_FOLIO"."COD_AGENTE", 	"CD_FOLIO"."COD_SUPERVISOR",		 "CD_FOLIO"."COD_JEFE_VENTA"
	INTO 			:gs_age, 							:gs_sup, 										:gs_jefe
	FROM 		"CD_FOLIO","CD_FOLIO_DETALLE"
	WHERE 		"CD_FOLIO"."BASE" = "CD_FOLIO_DETALLE"."BASE" AND
					"CD_FOLIO"."SERIE" = "CD_FOLIO_DETALLE"."SERIE" AND
					"CD_FOLIO"."NUMERO" = "CD_FOLIO_DETALLE"."NUMERO" AND  
					"CD_FOLIO"."BASE" = :gs_base AND
					"CD_FOLIO"."SERIE" = :gs_serie AND
					"CD_FOLIO"."NUMERO" = :gi_numero AND
					( "CD_FOLIO_DETALLE"."ESTADO" = 2 OR "CD_FOLIO_DETALLE"."ESTADO" = 14) AND
					"CD_FOLIO_DETALLE"."FECHA_ESTADO" = ( 	SELECT 	MAX("CD_FOLIO_DETALLE"."FECHA_ESTADO")
																				FROM 	"CD_FOLIO_DETALLE"
																				WHERE 	"CD_FOLIO_DETALLE"."BASE" = :gs_base AND
																							"CD_FOLIO_DETALLE"."SERIE" = :gs_serie AND
																							"CD_FOLIO_DETALLE"."NUMERO" = :gi_numero AND
																						  ( "CD_FOLIO_DETALLE"."ESTADO" = 2 OR "CD_FOLIO_DETALLE"."ESTADO" = 14) )
	USING sqlca;
	if isnull(gs_age)  then gs_age='CA'
	if isnull(gs_sup)  then gs_age='CS'
	if isnull(gs_jefe)  then gs_age='CJ'
	
	em_base.Text							= gs_base
	em_serie.Text							= gs_serie
	em_numero.Text						= string(gi_numero)
	em_rut.Text								= string(gi_rut)
	em_dv.Text								= gs_dv
	dw_agente.setitem(1,'agente',gs_age)
	dw_supervisor.setitem(1,'supervisores',gs_sup)
	dw_jefe.setitem(1,'jefes',gs_jefe)
	dw_agente.accepttext()
	dw_supervisor.accepttext()
	dw_jefe.accepttext()
	gs_depto									= 'O'
	em_rut.triggerevent(modified!)
	dw_jefe.setfocus()
	dw_jefe.triggerevent(itemchanged!)
	
	dw_anexo_funeraria.enabled		= false
	dw_anexo_funeraria.SetItem(1,'estado_rut',1)
	dw_anexo_funeraria.SetItem(1,'estado_contrato',1)
	dw_anexo_funeraria.accepttext()
	cb_aceptar.enabled					= true
	cb_aceptar.setfocus()
end if
end event

event close;is_cerrar						= '0'  //evento cerrar
//is_cerrar						= '1'  //boton cerrar
cb_cerrar.triggerevent(clicked!)
end event

type em_serie from dropdownlistbox within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
event ue_tecla pbm_keyup
integer x = 878
integer y = 232
integer width = 229
integer height = 376
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_limpiar.visible						= false
st_grabar.visible						= false
st_salir.visible							= false
st_ver_pie_pactado.visible			= false
st_imprimir.visible						= false
st_help_memo.visible					= false
st_buscar.visible						= false
st_help_cta_cte.visible				= false
st_help_seguro_2.visible				= false
st_help_porce_comi.visible			= false

end event

type st_producto from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2126
integer y = 1668
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Tipo Producto"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= true
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= true
end event

type pb_producto from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 2190
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Outsoursing (o).BMP"
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= true
end event

event clicked;string	ls_uso,ls_est_valida,ls_tipo_infor,ls_string
long	ll_tipo_benef,ll_cant_benef,ll_tipo_servicio,ll_cod_parque,ll_digitada

dw_anexo_funeraria.accepttext()

ll_digitada												= wf_digitada()
if ll_digitada>0 then
	ls_est_valida										= 'D'
else
	ls_est_valida										= 'R'
end if
ll_tipo_benef											= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_tipo_beneficiarios')
ll_cant_benef											= dw_anexo_funeraria.getitemnumber(1,'producto_pago_capacidad')
ll_tipo_servicio											= dw_anexo_funeraria.getitemnumber(1,'producto_pago_codigo_servicio')
ll_cod_parque											= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
ls_uso													= dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso')

ls_tipo_infor												= 'S'
ls_string													= string(ll_tipo_benef)+'~t'+string(ll_cant_benef)+'~t'+string(ll_tipo_servicio)+'~t'+string(ll_cod_parque)+'~t'+gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+ls_uso+'~t'+ls_est_valida+'~t'+ls_tipo_infor
if not isnull(ll_tipo_benef) and ll_tipo_benef>0 and not isnull(ll_cant_benef) and ll_cant_benef>0 and not isnull(ll_tipo_servicio) and ll_tipo_servicio>0 and not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_uso) and ls_uso<>'' then
	openwithparm(w_tipo_servicio_detalle,ls_string)
else
	if isnull(ll_tipo_benef) or ll_tipo_benef=0 then
		messagebox("Advertencia","Debe ingresar antes Tipo Beneficiario")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_anexo_tipo_beneficiarios')
	elseif isnull(ll_cant_benef) or ll_cant_benef=0 then
		messagebox("Advertencia","Debe ingresar antes Cantidad Beneficiario")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_capacidad')	
	elseif isnull(ll_tipo_servicio) or ll_tipo_servicio=0 then
		messagebox("Advertencia","Debe ingresar antes Tipo Servicio")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_codigo_servicio')
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia","Debe ingresar antes Parque")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('cadena_cod_parque')
	elseif isnull(ls_uso) or ls_uso='' then
		messagebox("Advertencia","Debe ingresar antes Tipo Uso")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_anexo_uso')	
	end if
end if
end event

type pb_benef from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 2030
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "control_documentario.bmp"
string disabledname = "control_documentario_no.bmp"
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= true
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;string	ls_string
long	ll_tipo_benef,ll_cod_parque,ll_capac

dw_anexo_funeraria.accepttext()
ll_tipo_benef											= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_tipo_beneficiarios')
ll_cod_parque											= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
ll_capac													= dw_anexo_funeraria.getitemnumber(1,'producto_pago_capacidad')
ls_string													= string(ll_tipo_benef)+'~t'+string(ll_cod_parque)+'~t'+gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_capac)
if not isnull(ll_tipo_benef) and ll_tipo_benef>0 then 
	openwithparm(w_producto_beneficiarios,ls_string)
else
	if isnull(ll_tipo_benef) or ll_tipo_benef=0 then 
		messagebox("Advertencia","Debe ingresar antes Tipo Servicio")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_anexo_tipo_beneficiarios')
	elseif isnull(ll_capac) or ll_capac=0 then 
		messagebox("Advertencia","Debe ingresar antes Cantidad Beneficiarios")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_capacidad')
	end if
end if		


end event

type st_ver_benef from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2647
integer y = 392
integer width = 576
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
string text = "Doble Click para Ver Detalle Beneficiarios"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= true
st_producto.visible				= false

end event

type st_ver_tipo_servicio from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 370
integer y = 500
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= true
st_ver_benef.visible			= false
st_producto.visible				= false

end event

type st_ver_pie_pactado from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1655
integer y = 1168
integer width = 393
integer height = 124
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long backcolor = 15793151
string text = "Doble Click para Ver Pie Pactado"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false

end event

type st_help_seguro_2 from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1952
integer y = 1668
integer width = 539
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Ingreso Beneficiarios"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= true
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false

end event

type cb_x from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 2002
integer y = 2076
integer width = 155
integer height = 136
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "control_documentario.bmp"
string disabledname = "control_documentario_no.bmp"
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= true
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
end event

event clicked;String		ls_string
Long		ll_cantidad,ll_tipo_seguro,ll_reg
Double	lld_factor_seg_comp,ll_nro_aux
Datetime	ldt_fecha_duracion_vigencia,ldt_fecha
Date		ldt_fecha_ctto

if Double(em_numero.text) > 0 then
	ldt_fecha_ctto									= date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha'))
	ll_tipo_seguro									= 3
	SELECT	"CANTIDAD_BENEFICIARIO",	"FACTOR",					"FECHA_DURACION_VIGENCIA"
	INTO 		:ll_cantidad,							:lld_factor_seg_comp,	:ldt_fecha_duracion_vigencia
	FROM 	"TIPO_SEGURO"  
	WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_tipo_seguro   
	USING	sqlca;
	ll_reg 											= dw_seguro.Find("codigo = "+string(ll_tipo_seguro), 1, dw_seguro.RowCount())
	if ll_reg > 0 then
		if dw_seguro.getitemnumber(ll_reg,'c_estado_reg') = 0 and  ldt_fecha_ctto >= date('01/10/2013') then
			gs_base									= trim(em_base.text)
			gs_serie									= trim(em_serie.text)
			gi_numero								= Double(em_numero.text)
			SELECT	"SEGURO_RENTA_DECESO"."NUMERO_CTTO_ORIGINAL"  
			INTO 		:ll_nro_aux  
			FROM 	"SEGURO_RENTA_DECESO"  
			WHERE	"SEGURO_RENTA_DECESO"."BASE_CTTO_ORIGINAL" = :gs_base AND  
						"SEGURO_RENTA_DECESO"."SERIE_CTTO_ORIGINAL" = :gs_serie AND  
						"SEGURO_RENTA_DECESO"."NUMERO_CTTO_ORIGINAL" = :gi_numero   
			USING	sqlca;
			if sqlca.sqlcode<>0 then
				ldt_fecha								= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')
				INSERT INTO "SEGURO_RENTA_DECESO"  
							( "BASE_CTTO_ORIGINAL",	"SERIE_CTTO_ORIGINAL",  "NUMERO_CTTO_ORIGINAL", "FECHA",   	"FOLIO_SEGURO",   "CODIGO_SEGURO",  "VALOR_DECESO_UF",   "VALOR_RENTA_UF",	"CANTIDAD_MESES_RENTA",	"FACTOR" )  
				VALUES	( :gs_base,   					:gs_serie,						:gi_numero,						:ldt_fecha, 	:gi_numero,   			:ll_tipo_seguro, 	0,   							0,							:ll_cantidad,   						:lld_factor_seg_comp )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					cb_x.italic	= true
				else
					rollback;
				end if
			end if
			ls_string									= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(lld_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
			openwithparm(w_ingreso_beneficiario_seg_comple,ls_string)
		elseif dw_seguro.getitemnumber(ll_reg,'c_estado_reg') = 1 and ldt_fecha_ctto < date('01/10/2013') then
			ls_string									= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(lld_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
			openwithparm(w_ingreso_beneficiario_seg_comple,ls_string)
		else
			messagebox("Advertencia","Debe Seleccionar Tipo Seguro Asociado")
			dw_seguro.setfocus()
		end if
	elseif ldt_fecha_ctto < date('01/10/2013') then
		ls_string										= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(lld_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
		openwithparm(w_ingreso_beneficiario_seg_comple,ls_string)
	else
		messagebox("Advertencia","Tipo Seguro (2º Beneficiario) No está VIGENTE")
	end if
end if
end event

type st_help_porce_comi from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1865
integer y = 1668
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "% Comisión"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= true
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type cb_porce_comi from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1865
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ver_pagos_cta_mant.bmp"
string disabledname = "ver_pagos_cta_mant_no.bmp"
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= true
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;String	ls_string
if gi_numero>0 and not isnull(gs_serie) then
	gs_base						= trim(em_base.text)
	gs_serie 						= trim(em_serie.text)
	gi_numero					= Double(trim(em_numero.text))	
	ls_string 						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	OpenWithParm(w_porcentaje_comision_ctto,ls_string)
end if
end event

type st_help_cta_cte from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1573
integer y = 1668
integer width = 416
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Cuenta Corriente"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= true
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type cb_ver_cuenta from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1701
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Aclaraciones (o).bmp"
string disabledname = "Aclaraciones (o) off.bmp"
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= true
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
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
		CASE "F","G", "V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			Open(w_cuenta_corriente_funeraria)
	END CHOOSE
END IF
end event

type st_memo from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 878
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string picturename = "Agenc_on.bmp"
string disabledname = "Agenc_off.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= true
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;string		ls_numero,ls_serie,ls_string
Double	ll_nro_aux
gs_serie 					= trim(em_serie.text)
gi_numero				= Double(trim(em_numero.text))
ls_numero 				= trim(em_numero.text)
if not isnull(gs_serie) and gs_serie<>'' and gi_numero>0 and not isnull(gs_age) and gs_age<>'' then
	SELECT	"CADENA"."NUMERO"  
	INTO 		:ll_nro_aux    
	FROM 	"CADENA"  
	WHERE	"CADENA"."SERIE" = :gs_serie AND  
				"CADENA"."CODIGO" = :gs_base AND  
			 	"CADENA"."NUMERO" = :gi_numero 
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ls_string 			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
		OpenWithParm(w_ingreso_cd_memorandum_digitacion,ls_string)
		w_ingreso_cd_memorandum_digitacion.setfocus()
	else
		messagebox("Advertencia","Antes de Ingresar Memorandum debería estar Digitado Anexo Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"####,###,###,##0"))
	end if
//	em_numero.setfocus()
end if
end event

type cb_3 from commandbutton within w_ingresar_funeraria
boolean visible = false
integer x = 142
integer y = 2012
integer width = 251
integer height = 96
integer taborder = 160
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
dw_anexo_funeraria.accepttext()
dw_anexo_funeraria.setitem(1,'producto_pago_pie',ll_nulo)
dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ld_nulo)
dw_anexo_funeraria.accepttext()
dw_anexo_funeraria.setfocus()
dw_anexo_funeraria.setcolumn('producto_pago_pie')
end event

type em_base from editmask within w_ingresar_funeraria
event ue_mousemove pbm_dwnmousemove
integer x = 517
integer y = 228
integer width = 201
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

event ue_mousemove;st_limpiar.visible				= false
st_grabar.visible				= false
st_salir.visible					= false
st_imprimir.visible				= false
st_buscar.visible				= false
st_help_memo.visible			= false
end event

event losefocus;em_base.text	= gs_base
end event

type st_8 from statictext within w_ingresar_funeraria
integer x = 338
integer y = 244
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
string text = "Base:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_seguro from datawindow within w_ingresar_funeraria
event ue_mousemove pbm_dwnmousemove
integer x = 2459
integer y = 172
integer width = 933
integer height = 428
integer taborder = 80
string dataobject = "dw_lista_seguro_seleccion_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event itemchanged;Double	ldb_factor_prima,ll_suma_peso,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo_iva,ll_fila,ll_suma,ll_sw
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_anexo_funeraria.accepttext()
ls_columna							= dwo.name
if dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota') > 0 and not isnull(dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')) and ls_columna='c_estado_reg' then
	ll_tot_reg						= dw_seguro.rowcount()
	ls_moneda						= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
//	ldb_suma						= dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')
//	if isnull(ldb_suma) then ldb_suma=0
	if ll_tot_reg > 0 then
		SELECT 	"REVISION_CONTRATOS"."EDAD"  
		INTO 		:ll_edad  
		FROM 	"REVISION_CONTRATOS"  
		WHERE 	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
					( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
					( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) AND  
					( "REVISION_CONTRATOS"."RUT" = :gi_rut )   ;

		if ll_edad > 0 then
			dw_seguro.setitem(row,'edad',ll_edad)
		end if	
//		ldb_suma				= dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')
		ldb_factor_prima		= dw_seguro.getitemnumber(row,'factor_prima')
		ll_prima_peso			= dw_seguro.getitemnumber(row,'factor_peso')
		ll_est_reg				= long(data)		//dw_seguro.getitemnumber(row,'c_estado_reg')
		ll_codigo_iva			= dw_seguro.getitemnumber(row,'codigo')
		dw_seguro.accepttext()
		if ll_est_reg = 0 and (ldb_factor_prima > 0 or ll_prima_peso > 0) then
			if ll_codigo_iva = 8 then
				ldb_factor_prima = 0.0
			end if
			if ls_moneda='1' then
//				ldb_suma			= dw_seguro.getitemnumber(1,'c_sum_total_peso')
				idb_suma			= idb_suma + ll_prima_peso
			else
//				ldb_suma			= dw_seguro.getitemnumber(1,'c_sum_total')
				idb_suma			= idb_suma + ldb_factor_prima
			end if		
		elseif ll_est_reg = 1 and (ldb_factor_prima > 0 or ll_prima_peso > 0) then
			if ll_codigo_iva = 8 then
				ldb_factor_prima = 0.0
			end if
			if ls_moneda='1' then
//				ldb_suma			= dw_seguro.getitemnumber(1,'c_sum_total_peso')
				idb_suma			= round(idb_suma,2) - round(ll_prima_peso,2)
			else
//				ldb_suma			= dw_seguro.getitemnumber(1,'c_sum_total')
				idb_suma			= round(idb_suma,2) - round(ldb_factor_prima,2)
			end if		
		end if

	end if	
	
end if
dw_anexo_funeraria.accepttext()
dw_seguro.accepttext()
//ll_suma								= 0
//ll_fila									= dw_seguro.Find('c_estado_reg = 0', 1, ll_tot_reg)
//if ll_fila = 0 then idb_suma=0
//for ll_indi=1 to ll_tot_reg
//	ll_sw								= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
//	if ll_sw=1 then 	ll_suma ++
//next
//if ll_tot_reg = ll_suma then idb_suma=0
if isnull(idb_suma) then idb_suma=0
dw_anexo_funeraria.setitem(1,'cuota_seguros', idb_suma)
dw_seguro.accepttext()
dw_anexo_funeraria.accepttext()



String		ls_forma_pago
Long		ll_estado,ll_codigo,ll_existe

is_error_cod				= 'N'
dw_seguro.accepttext()
ls_columna					= dwo.name
if ls_columna='c_estado_reg' then
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
			end if
		end if
	end if
	dw_seguro.accepttext()
end if
end event

event itemfocuschanged;Long		ll_fila,ll_estado,ll_codigo,ll_existe,ll_tot_reg,ll_indi,ll_cod_reg

dw_seguro.accepttext()
if gi_numero > 0 and il_cod_seguro > 0 then
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

event losefocus;Long		ll_fila,ll_estado,ll_codigo,ll_existe,ll_tot_reg,ll_indi,ll_cod_reg

dw_seguro.accepttext()
if gi_numero > 0 and il_cod_seguro > 0 then
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

type cb_seguro2 from commandbutton within w_ingresar_funeraria
boolean visible = false
integer x = 2359
integer y = 2032
integer width = 521
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Seguro Desgrav."
end type

event clicked;String	ls_base_aux,ls_string
Long		ll_cantidad,ll_tipo_seguro
Double	lld_factor_seg_comp
datetime	ldt_fecha_duracion_vigencia

if Double(em_numero.text) > 0 then
	gs_base									= trim(em_base.text)
	gs_serie									= trim(em_serie.text)
	gi_numero								= Double(em_numero.text)
	SELECT	"CADENA"."CODIGO"  
	INTO 		:ls_base_aux  
	FROM		"CADENA"  
	WHERE  	"CADENA"."CODIGO" = :gs_base AND  
			 	"CADENA"."SERIE" = :gs_serie AND  
			 	"CADENA"."NUMERO" = :gi_numero   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ll_tipo_seguro						= 3
		SELECT	"CANTIDAD_BENEFICIARIO",	"FACTOR",					"FECHA_DURACION_VIGENCIA"
		INTO 		:ll_cantidad,							:lld_factor_seg_comp,	:ldt_fecha_duracion_vigencia
		FROM		"TIPO_SEGURO"  
		WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_tipo_seguro   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ldt_fecha_duracion_vigencia > gdt_fec_sistema then
				ls_string						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(lld_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
				openwithparm(w_ingreso_seguro_complementario,ls_string)
			else
				messagebox("Advertencia","Seguro No Vigente")
			end if
		end if
	else
		messagebox("Advertencia","Recuerde debe Grabar antes de Ingresar Seguro")
	end if
end if
end event

type p_1 from picture within w_ingresar_funeraria
integer x = 37
integer y = 32
integer width = 251
integer height = 268
string picturename = "logo_e.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_buscar from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1504
integer y = 1668
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= true
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type pb_buscar from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1536
integer y = 1736
integer width = 155
integer height = 136
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= true
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;openwithparm(w_listado_contrato,gs_base)
end event

type dw_jefe from datawindow within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 3086
integer y = 56
integer width = 279
integer height = 92
integer taborder = 70
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

event itemchanged;Long		ll_resp,ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_reg,ll_rut,ll_cod_servicio,ll_tipo_benef,ll_capac,ll_cta_seg,ll_cod_seg,ll_tot_seg,ll_indi,ll_estado_reg
String		ls_string,ls_obs,ls_tipo_cont,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_jefe,ls_cod_jefe,ls_fecha,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_aux,ls_uso,ls_origen_venta
Datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf,ldb_monto,&
			ll_numero_asoc,ldb_tasa_base,ldb_precio_venta_rev

dw_jefe.accepttext()
ls_cod_jefe																= dw_jefe.getitemstring(1,'jefes')
if not isnull(ls_cod_jefe) then
	if gi_rut>0 then
		is_sw_jef														= 'S'
		gs_serie 															= trim(em_base.Text)
		gs_serie 															= trim(em_serie.Text)
		if is_pasa_asigna='S' then
			gs_age														= dw_agente.getitemstring(1,'agente')
			gs_sup														= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe														= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_jefe) and gs_jefe<>'' then
				SELECT	"JEFE_VENTAS"."JEFE_VENTAS"  
				INTO 		:ls_jefe  
				FROM 	"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if isnull(gs_jefe) then
						messagebox("Advertencia","Debe Ingresar Jefe Venta")
						dw_jefe.setfocus()
					else
						dw_anexo_funeraria.SetItem(1, "producto_anexo_cod_jefe", gs_jefe)
						dw_anexo_funeraria.accepttext()
						if il_resp_age<>1 and il_resp_sup<>1 then
							if is_sw_jef='S' and gs_age<>'' and not isnull(gs_age) and gs_sup<>'' and not isnull(gs_sup) then //gs_nueva_oferta='S' and 
								ll_resp														= MessageBox("Advertencia", "Está seguro de ASIGNAR Producto Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								IF ll_resp = 1 THEN
									ls_string													= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										SELECT	"AGENTES"."TIPO_CONT"  
										INTO 		:ls_tipo_cont  
										FROM 	"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age ;
										if ls_tipo_cont = '3' OR ls_tipo_cont = '4' then
											INSERT INTO "COMISION_PROMESA"  
														( "BASE",		"SERIE",		"NUMERO",	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
											VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	0,			0,					0,					0,					0,					0,					0,				0,					0,					0 )  
											USING		sqlca	;
											if sqlca.sqlcode=0 then
												ll_grabar_1	= 1
//													commit;
											else
												ll_grabar_1	= 0
//													rollback;
											end if
										else
											ll_grabar_1		= 1
										end if
										ls_obs														= 'Producto creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_anexo_funeraria.enabled							= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_anexo_funeraria.setitem(1,'estado_rut',1)
											dw_anexo_funeraria.setitem(1,'estado_contrato',1)
										else
											if gi_rut>0 then
												dw_anexo_funeraria.setitem(1,'estado_rut',0)
												dw_anexo_funeraria.setitem(1,'estado_contrato',0)
											end if
										end if
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 	"CADENA"  
										WHERE	"CADENA"."CODIGO" = :gs_base AND  
													"CADENA"."SERIE" = :gs_serie AND  
												 	"CADENA"."NUMERO" = :gi_numero   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",	"CODIGO_SERVICIO",	"TIPO_BENEFICIARIOS",	"USO", 	"CAPACIDAD",	0.0001,				"ORIGEN_VENTA",		"PRECIO_VENTA"
											INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,	:ll_cod_servicio,		:ll_tipo_benef,				:ls_uso,	:ll_capac,		:ldb_tasa_base,	:ls_origen_venta,		:ldb_precio_venta_rev
											FROM 	"REVISION_CONTRATOS"  
											WHERE	"REVISION_CONTRATOS"."BASE" = :gs_base AND  
														"REVISION_CONTRATOS"."SERIE" = :gs_serie AND  
													 	"REVISION_CONTRATOS"."NUMERO" = :gi_numero AND
													 	("REVISION_CONTRATOS"."ESTADO_REVISION" = 'A'  OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V') 
											USING		sqlca;
											if sqlca.sqlcode=0 then
												idw_detalle2.retrieve(ll_cod_parque_rev,ls_uso,gs_serie,ls_moneda_rev)
												dw_anexo_funeraria.setitem(1,'producto_anexo_base',gs_base)
												dw_anexo_funeraria.setitem(1,'producto_anexo_serie',gs_serie)
												dw_anexo_funeraria.setitem(1,'producto_anexo_numero',gi_numero)
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha',ldt_fecha_ctto_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_moneda',ls_moneda_rev)
												dw_anexo_funeraria.setitem(1,'producto_anexo_forma_pago',ls_forma_pago_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie_rev)
												dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie_rev * idb_iva)
												if ldb_pie_rev > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then 
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ldt_fecha_ctto_rev)
												end if
												dw_anexo_funeraria.setitem(1,'producto_pago_plazo',ll_plazo_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gasto_adm_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cuota_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_precio',ldb_precio_ctto_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
												dw_anexo_funeraria.setitem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',ldt_fecha_prim_rev)
												if ll_plazo_rev = 1 then
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',ldt_fecha_prim_rev)
												elseif ll_plazo_rev > 1 then
													ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
													if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
														dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
													end if
												end if
												
												dw_anexo_funeraria.setitem(1,'estado_contrato',0)
												dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
												dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_benef)
												dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
												dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capac)
												dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_venta',ls_origen_venta)
												
												dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_tasa_base)
												dw_anexo_funeraria.accepttext()
												
												SELECT	count("COD_SEGURO")
												INTO		:ll_cta_seg
												FROM		"SEGURO_ASOCIADOS"  
												WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
															"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
															"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
															"SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' 
												USING	sqlca;
												if isnull(ll_cta_seg) or ll_cta_seg=0 then ll_cta_seg=0
												if ll_cta_seg>0 then
													DECLARE x1 CURSOR FOR  
													SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
													FROM 	"SEGURO_ASOCIADOS"  
													WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
																( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
																( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
																( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
													USING	sqlca;
													open x1;
													if sqlca.sqlcode=0 then
														do while sqlca.sqlcode=0
															Fetch x1 into :ll_cod_seg, :ldb_monto, :ll_estado_reg;
															if not isnull(ll_cod_seg) then
																if ll_estado_reg = 0 then
																	ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seg), 1, dw_seguro.RowCount())
																	if ll_reg > 0 then
																		dw_seguro.setitem(ll_reg,'c_estado_reg',0)
																	end if
																end if
															end if
															setnull(ll_cod_seg)
														loop
													end if
													close x1;
													dw_seguro.accepttext()
													dw_seguro.enabled						= true
												end if
												SELECT	"INTERES_PESOS",	"INTERES_UF"
												INTO 		:ldb_int_peso,			:ldb_int_uf
												FROM		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
														ldb_int_peso						= 0
														ldb_int_uf							= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_uf)
													end if
												end if
											end if
										end if
										dw_anexo_funeraria.setfocus()
										dw_anexo_funeraria.setcolumn('producto_anexo_base')
										
									else
										dw_anexo_funeraria.enabled					= false
										dw_anexo_funeraria.setitem(1,'estado_rut',1)
										dw_anexo_funeraria.setitem(1,'estado_contrato',1)
										messagebox("Advertencia","NO fue Asignado Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									end if
								else
									dw_anexo_funeraria.setitem(1,'estado_rut',1)
									dw_anexo_funeraria.setitem(1,'estado_contrato',1)
								end if
							end if
						end if
					end if
				else
					messagebox("Advertencia","Jefe de Venta Inexistente")
					dw_jefe.reset()
					dw_jefe.insertrow(0)
					dw_jefe.setfocus()
					gs_jefe																	= ''
				end if
			end if
	
		elseif is_pasa_asigna='N' and is_sw_jef='S' then
			gs_age																			= dw_agente.getitemstring(1,'agente')
			gs_sup																			= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe																			= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_jefe) and gs_jefe<>'' then
				SELECT	"JEFE_VENTAS"."JEFE_VENTAS"  
				INTO 		:ls_jefe  
				FROM 	"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if isnull(gs_jefe) then
						messagebox("Advertencia","Debe Seleccionar Jefe Venta")
						dw_jefe.setfocus()
					else
						dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_jefe",gs_jefe)
						dw_anexo_funeraria.accepttext()
						if is_sw_jef='S' and gs_age<>'' and not isnull(gs_age) and gs_sup<>'' and not isnull(gs_sup) then//if il_resp_age=2 and il_resp_sup=2 and is_sw_jef='S' then
							ll_resp														= MessageBox("Advertencia", "Está seguro de ASIGNAR Producto Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
							IF ll_resp = 1 THEN
								ls_string														= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
								openwithparm(w_verificar_datos_contrato,ls_string)
								IF trim(Message.StringParm)='OK' THEN
									SELECT	"AGENTES"."TIPO_CONT"  
									INTO 		:ls_tipo_cont  
									FROM 	"AGENTES"  
									WHERE 	"AGENTES"."COD_AGE" = :gs_age ;
									if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
										INSERT INTO "COMISION_PROMESA"  
													( "BASE",		"SERIE",		"NUMERO",	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
										VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	0,			0,					0,					0,					0,					0,					0,				0,					0,					0)  
										USING	sqlca	;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs													= 'Producto creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									dw_anexo_funeraria.enabled						= true
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_funeraria.setitem(1,'estado_rut',1)
										dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									else
										if gi_rut>0 then
											dw_anexo_funeraria.setitem(1,'estado_rut',0)
											dw_anexo_funeraria.setitem(1,'estado_contrato',0)
										end if
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM		"CADENA"  
									WHERE	"CADENA"."CODIGO" = :gs_base AND  
											 	"CADENA"."SERIE" = :gs_serie AND  
											 	"CADENA"."NUMERO" = :gi_numero   
									USING	sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",	"CODIGO_SERVICIO",	"TIPO_BENEFICIARIOS",	"USO",	"CAPACIDAD", 	0.0001,				"ORIGEN_VENTA",		"PRECIO_VENTA"
										INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,	:ll_cod_servicio,		:ll_tipo_benef,				:ls_uso,	:ll_capac,		:ldb_tasa_base,	:ls_origen_venta,		:ldb_precio_venta_rev
										FROM		"REVISION_CONTRATOS"  
										WHERE	"REVISION_CONTRATOS"."BASE" = :gs_base AND  
													"REVISION_CONTRATOS"."SERIE" = :gs_serie AND  
												 	"REVISION_CONTRATOS"."NUMERO" = :gi_numero AND
												 	("REVISION_CONTRATOS"."ESTADO_REVISION" = 'A'  OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V') 
										USING	sqlca;
										if sqlca.sqlcode=0 then
											idw_detalle2.retrieve(ll_cod_parque_rev,ls_uso,gs_serie,ls_moneda_rev)
											dw_anexo_funeraria.SetItem(1,'producto_anexo_base',gs_base)
											dw_anexo_funeraria.SetItem(1,'producto_anexo_serie',gs_serie)
											dw_anexo_funeraria.SetItem(1,'producto_anexo_numero',gi_numero)
											dw_anexo_funeraria.SetItem(1,'producto_pago_fecha',ldt_fecha_ctto_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_moneda',ls_moneda_rev)
											dw_anexo_funeraria.SetItem(1,'producto_anexo_forma_pago',ls_forma_pago_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_pie',ldb_pie_rev)
											dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie_rev * idb_iva)
											if ldb_pie_rev > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then 
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ldt_fecha_ctto_rev)
											end if
											dw_anexo_funeraria.SetItem(1,'producto_pago_plazo',ll_plazo_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_gasto_adm',ldb_gasto_adm_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_precio',ldb_precio_ctto_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
											dw_anexo_funeraria.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_funeraria.SetItem(1,'producto_pago_fecha_prim',ldt_fecha_prim_rev)
											if ll_plazo_rev = 1 then
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',ldt_fecha_prim_rev)
											elseif ll_plazo_rev > 1 then
												ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
												if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
												end if
											end if
											
											dw_anexo_funeraria.setitem(1,'estado_contrato',0)
											dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_benef)
											dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
											dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capac)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_venta',ls_origen_venta)
											
											dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_tasa_base)
											
											SELECT	count("COD_SEGURO")
											INTO		:ll_cta_seg
											FROM		"SEGURO_ASOCIADOS"  
											WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
														"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
														"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
														"SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' 
											USING	sqlca;
											if isnull(ll_cta_seg) or ll_cta_seg=0 then ll_cta_seg=0
											if ll_cta_seg>0 then
												DECLARE x2 CURSOR FOR  
												SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
												FROM 	"SEGURO_ASOCIADOS"  
												WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
															( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
												USING	sqlca;
												open x2;
												if sqlca.sqlcode=0 then
													do while sqlca.sqlcode=0
														Fetch x2 into :ll_cod_seg, :ldb_monto, :ll_estado_reg;
														if not isnull(ll_cod_seg) then
															if ll_estado_reg = 0 then
																ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seg), 1, dw_seguro.RowCount())
																if ll_reg > 0 then
																	dw_seguro.setitem(ll_reg,'c_estado_reg',0)
																end if
															end if
														end if
														setnull(ll_cod_seg)
													loop
												end if
												close x2;
												dw_seguro.accepttext()
												dw_seguro.enabled						= true
											end if
											SELECT	"INTERES_PESOS",	"INTERES_UF"
											INTO 		:ldb_int_peso,			:ldb_int_uf
											FROM		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING	sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
													ldb_int_peso								= 0
													ldb_int_uf									= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_uf)
												end if
											end if
										end if
									end if
									dw_anexo_funeraria.setfocus()
									dw_anexo_funeraria.setcolumn('producto_anexo_base')
								else
									dw_anexo_funeraria.enabled								= false
									dw_anexo_funeraria.setitem(1,'estado_rut',1)
									dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									messagebox("Advertencia","NO fue Asignado Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
								end if
							else
								dw_anexo_funeraria.setitem(1,'estado_rut',1)
								dw_anexo_funeraria.setitem(1,'estado_contrato',1)
							end if
						end if
					end if
				else
					messagebox("Advertencia","Jefe de Venta Inexistente")
					dw_jefe.reset()
					dw_jefe.insertrow(0)
					dw_jefe.setfocus()
					gs_jefe																			= ''
				end if
			end if
		end if
		if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
			commit using sqlca;
			UPDATE	"PRODUCTO_ANEXO"  
			SET 		"COD_AGENTE" = :gs_age,   
						"COD_SUPER" = :gs_sup,   
						"COD_JEFE" = :gs_jefe  
			WHERE	"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
					 	"PRODUCTO_ANEXO"."NUMERO" = :gi_numero   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback using sqlca;
		end if
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
	dw_anexo_funeraria.accepttext()
	if isvalid(w_validar_promesa_operaciones) then
		cb_aceptar.setfocus()
		is_pasa 				= 'S'
	end if
end if

end event

type st_salir from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3205
integer y = 1668
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= true
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type st_limpiar from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1335
integer y = 1668
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= true
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type st_imprimir from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1179
integer y = 1668
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= true
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type st_grabar from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1010
integer y = 1668
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= true
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type pb_print from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1207
integer y = 1736
integer width = 155
integer height = 136
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= true
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;String		ls_serie,ls_descrip,ls_base,ls_tipo_ctto
Double	ll_numero,ll_rut

ls_base					= trim(em_base.text)
ls_serie					= trim(em_serie.text)
ll_numero				= Double(trim(em_numero.text))
ll_rut						= Double(trim(em_rut.text))
if not isnull(ls_serie) and ll_numero>0 then
	if dw_1.retrieve(ls_serie,ll_numero,ll_rut,ls_base) > 0 then
		SELECT	"COD_PARQ"."NOMBRE"  ,
					"TIPO_CONTRATO"."DESCRIPCION"
		INTO 		:ls_descrip ,
					:ls_tipo_ctto
		FROM 	"CADENA",	"COD_PARQ"  ,"TIPO_CONTRATO"
		WHERE	"CADENA"."COD_PARQUE" = "COD_PARQ"."CODIGO" and  
					"CADENA"."CODIGO" = "TIPO_CONTRATO"."CODIGO" and  
					"CADENA"."CODIGO" = :ls_base AND  
					"CADENA"."SERIE" = :ls_serie AND  
				 	"CADENA"."NUMERO" = :ll_numero   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_1.object.titulo.text = 'PARQUE '+ls_descrip
		else
			dw_1.object.titulo.text = 'PARQUE '+gs_nom_cod_parque	//gs_conexion
		end if
		
		dw_1.object.t_1.text		= 'CUENTA CORRIENTE '+ls_tipo_ctto+'  [Base = '+ls_base+' ]'
		f_Print( dw_1 )
	end if
end if
end event

type pb_limpiar from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1371
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "trash.bmp"
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= true
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;//setnull(gs_base);
setnull(gs_serie);setnull(gi_numero)
gs_graba_prod								= 'X'
//gs_base										= 'F'
//gs_serie										= 'F'
em_base.text								= gs_base
em_serie.text								= ''		//gs_serie
em_numero.text							= ''
setnull(gl_cod_parque)
em_rut.text									= ''
em_dv.text									= ''
is_pasa_asigna								= 'N'
is_sw_age									= 'N'
is_sw_sup									= 'N'
is_sw_jef									= 'N'
st_memo.italic								= false
em_rut.enabled							= true
em_dv.enabled								= true
cb_x.italic									= false
wf_limpiar()
em_serie.setfocus()
end event

type cb_cerrar from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 3227
integer y = 1736
integer width = 155
integer height = 136
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= true
st_help_cta_cte.visible		= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;close(w_ingresar_funeraria)

//string		ls_pasa,ls_uso
//long		ll_digitada,ll_res,ll_tot_reg,ll_existe_cad,ll_elimina,ll_plazo,ll_ult_estado
//double	ldb_precio,ldb_sum_prod,ldt_precio_prod,ldb_sum_cta,ldb_valor_pie,ldb_valor_cuota
//
//ll_tot_reg												= dw_anexo_funeraria.rowcount()
//ls_uso													= dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso')
//ldb_precio   												= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
//ll_plazo													= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
//ldb_valor_cuota										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')
//ls_pasa													= 'N'
//if ll_tot_reg=0 then
//	gs_graba_prod										= 'X'
//end if
//if gs_graba_prod='X' then //sin datos
//	ls_pasa												= 'S'
//end if
//if ls_uso='NF' and ldb_precio > 0 and ll_plazo > 0 and ldb_valor_cuota > 0 then
//	gs_graba_prod										= 'N'
//	ls_pasa												= 'N'
//end if
//if gs_graba_prod='S' then
//	dw_anexo_funeraria.accepttext()
//	ll_digitada											= wf_digitada()
//	if ll_digitada=0 then
//		if is_cerrar = '1' then  //boton cerrar
//			ll_res											=  MessageBox("Advertencia", 'Desea Cerrar sin Guardar el Registro', Exclamation!, YesNo!, 2)
//		end if
//		ll_res												=  1
//		if ll_res=1 then
//			SELECT 	"CD_FOLIO"."ULT_ESTADO"  
//			INTO 		:ll_ult_estado  
//			FROM 	"CD_FOLIO"  
//			WHERE 	( "CD_FOLIO"."BASE" = :gs_base ) AND  
//						( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
//						( "CD_FOLIO"."NUMERO" = :gi_numero )   ;
//			if ll_ult_estado <> 9 then
//				UPDATE	"PRODUCTO_VENTA_ASOCIADA"  	
//				SET		"ESTADO" = 'R' 
//				WHERE 	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
//							( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
//							( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) 
//				USING	sqlca;
//				if sqlca.sqlcode=0 then
//					commit;
//					UPDATE	"CD_FOLIO"  
//					SET 		"ULT_ESTADO" = 3  
//					WHERE	( "CD_FOLIO"."BASE" = :gs_base ) AND  
//								( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
//								( "CD_FOLIO"."NUMERO" = :gi_numero )
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit;
//					else
//						rollback;
//					end if
//				else
//					rollback;
//				end if	
//			end if
//			ls_pasa										= 'S'
//		end if
//	else
//		ldb_precio   										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
//		SELECT SUM("VALOR_PRODUCTO")
//		INTO		:ldb_sum_prod
//		FROM		"PRODUCTO_VENTA_ASOCIADA"  
//		WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
//					( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
//					( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) AND  
//					( "PRODUCTO_VENTA_ASOCIADA"."ESTADO" = 'D' )
//		USING	sqlca;
//		if isnull(ldb_sum_prod) then ldb_sum_prod=0
//		
//		if round(ldb_precio,2) = round(ldb_sum_prod,2) then
//			ls_pasa										= 'S'
//			SELECT	"PRODUCTO_PAGO"."PRECIO"  
//			INTO 		:ldt_precio_prod
//			FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
//			WHERE	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
//						( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
//						( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
//						( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
//						( ( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
//						( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
//						( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )
//			USING	sqlca;
//			if isnull(ldt_precio_prod) or ldt_precio_prod=0 then ldt_precio_prod=0
//			if round(ldb_sum_prod,2) = round(ldt_precio_prod,2) then
//				ls_pasa									= 'S'
//				SELECT	SUM("DETALLE_PAGO_PIE"."MONTO_CUOTA")
//				INTO 		:ldb_sum_cta  
//				FROM 	"DETALLE_PAGO_PIE"  
//				WHERE 	"DETALLE_PAGO_PIE"."BASE" = :gs_base AND  
//							"DETALLE_PAGO_PIE"."SERIE" = :gs_serie AND  
//							"DETALLE_PAGO_PIE"."NUMERO" = :gi_numero   
//				USING		sqlca;
//				if ldb_sum_cta>0 and long(em_numero.text)>0 then
//					ldb_valor_pie									= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
//					if round(ldb_valor_pie,4) = round(ldb_sum_cta,4) then
//						ls_pasa								= 'S'
//					else
//						ls_pasa								= 'N'
//						if is_cerrar = '1' then  //boton cerrar
//							messagebox('Error','No coincide Valor Pie con las cuotas pactadas, la suma Pactada es: '+string(ldb_sum_cta,"###,###,###,###,##0.0###"),stopsign!)
//						else
//						end if
//						dw_anexo_funeraria.setfocus()
//						dw_anexo_funeraria.SetColumn('producto_pago_pie')
//					end if
//				end if
//			else
//				if round(ldb_sum_prod,2) <> round(ldt_precio_prod,2) then
//					ls_pasa									= 'N'
//					if is_cerrar = '1' then   //boton cerrar
//						messagebox("Advertencia","Debe Grabar Modificación al Registro")
//					end if
//				end if	
//			end if
//		else
//			if round(ldb_precio,2) <> round(ldb_sum_prod,2) then
//				ls_pasa										= 'N'
//				if is_cerrar = '1' then  //boton cerrar
//					messagebox("Advertencia","Valor Servicio Funerario Ingresado, No Corresponde a Tipo Servicio Seleccionado")
//				end if
//				dw_anexo_funeraria.setfocus()
//				dw_anexo_funeraria.setcolumn('producto_pago_codigo_servicio')
//			end if
//		end if
//	end if	
//end if
//if ls_pasa='S' then
//	SELECT	"ENCARGADOS"."DEPTO"
//	INTO		:gs_depto
//	FROM 	"ENCARGADOS"  
//	WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
//	USING	sqlca;
////	if isvalid(w_validar_promesa_operaciones) then 
////		close(w_validar_promesa_operaciones)
////	end if
//
//	SELECT	COUNT("CADENA"."CODIGO")
//	INTO		:ll_existe_cad
//	FROM		"CADENA"
//	WHERE	"CADENA"."CODIGO" = :gs_base AND
//				"CADENA"."SERIE" = :gs_serie AND
//				"CADENA"."NUMERO" = :gi_numero
//	USING	sqlca;
//	if isnull(ll_existe_cad) then ll_existe_cad=0
//	if ll_existe_cad=0 and ll_ult_estado <> 9 then 
//		ll_elimina									= f_eliminar_funeraria(gs_base,gs_serie,gi_numero)
//	end if	
//
//	close(w_ingresar_funeraria)
//elseif ls_pasa='N' then
//	close(w_ingresar_funeraria)
//end if
end event

type cb_aceptar from picturebutton within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1038
integer y = 1732
integer width = 155
integer height = 136
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar_no.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= false
st_grabar.visible				= true
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

event clicked;double 	ldb_porc_age, ldb_porc_sup,ldb_porc_jef,ldb_valor_cta,ldb_precio,ldb_porc,ldb_tasa,ldb_uf_dia,ldb_gastos_adm,ldb_monto_peso,ldb_pie_pagado,ldb_saldo_finan,&
			ldb_tasa_base,ldb_pie,ldb_valor_cta_m,ldb_calculo,ldb_monto,ldb_precio_tab,ldb_sum_prod,ll_numero_dacion,ll_monto_peso,ll_folio_e,ll_monto_dscto,ldb_precio_venta,&
			ldb_tasa_12,ldb_tasa_cta,ldb_tasa_int_cta,ll_valor_cta_m
datetime	ldt_fec_pie,ldt_fec_ult,ldt_fec,ldt_fec_prim,ldt_fec_venc_mant,ldt_fecha_pago,ldt_fecha_hora
long 		ll_contador,ll_estado_cd,ll_estado_graba,ll_tot_reg,ll_indi,ll_est_reg,ll_codigo,ll_res1,ll_res2,ll_cta,ll_tipo_benef,ll_graba_dacion,ll_count_pago_novacion,&
			ll_cta_pag_m,ll_ctas,ll_ult_folio,ll_plazo,ll_rut,ll_cod_parque,ll_count_vig,ll_count,ll_cod_servicio,ll_cod_serv_tab,ll_cant_benef,ll_count_g,ll_hora_pago,ll_minuto_pago,&
			ll_count_cadena_mora,ll_count_cuponera
//Int		ll_tasa
string 	ls_tip_cont,ls_moneda,ls_forma_pag,ls_depto_asig,ls_glosa,ls_memo,ls_ref,ls_anexo_lib,ls_dv,ls_estado_cadena,ls_modif,ls_pasa,ls_graba_prod,ls_graba_benef,&
			ls_anexo_dacion,ls_base_dacion,ls_serie_dacion,ls_contrato_ori,ls_hora,ls_fecha_palabra,ls_contrato,ls_uso,ls_graba_servicios,ls_moneda_cta_m

dw_anexo_funeraria.accepttext()
gs_graba_prod																= 'N'
ls_pasa																		= 'S'
ll_graba_dacion															= 0

SELECT sysdate INTO :ldt_fecha_hora FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;
ls_hora							= string(ldt_fecha_hora,"hh:mm")
ll_hora_pago					= long(mid(ls_hora,1,2))
ll_minuto_pago					= long(mid(ls_hora,4,2))
ldt_fecha_pago																= datetime(date(gdt_fec_sistema),time('00:00:00'))
SELECT 	COUNT("CADENA"."CODIGO" ) 
INTO 		:ll_count_g  
FROM 	"CADENA"  
WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
			( "CADENA"."SERIE" = :gs_serie ) AND  
			( "CADENA"."NUMERO" = :gi_numero )   ;
if isnull(ll_count_g) then ll_count_g=0
if ll_count_g = 0 then
	gs_nueva_oferta														= 'S'
else
	gs_nueva_oferta														= 'N'
end if

SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA"  ;
if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 then
	if String(dw_anexo_funeraria.getitemstring(1,'dv')) <> String(gf_obtener_dv(long(dw_anexo_funeraria.GetItemNumber(1, "producto_anexo_rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.SetColumn('producto_anexo_rut')
		return
	end if
	gs_age																	= dw_agente.getitemstring(1,'agente')
	gs_sup																	= dw_supervisor.getitemstring(1,'supervisores')
	gs_jefe																	= dw_jefe.getitemstring(1,'jefes')
	ldb_precio   																= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
	ldb_precio_venta														= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio_venta')
	ls_forma_pag															= dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')
	gl_cod_parque															= dw_anexo_funeraria.GetItemNumber(1,"cadena_cod_parque")
	ldb_pie																	= dw_anexo_funeraria.GetItemNumber(1,'producto_pago_pie')
	ldt_fec_pie																= dw_anexo_funeraria.GetItemdatetime(1,'producto_pago_fecha_pie')
	ll_ult_folio																= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_ult_folio')
	ll_cod_servicio															= dw_anexo_funeraria.getitemnumber(1,'producto_pago_codigo_servicio')
	ll_tipo_benef															= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_tipo_beneficiarios')
	ll_cant_benef															= dw_anexo_funeraria.getitemnumber(1,'producto_pago_capacidad')
	ll_plazo 																	= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
	ldb_valor_cta															= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota'))
	ls_moneda																= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	ldb_tasa_base															= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa_base'))
	ldt_fec_prim																= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
	ldb_uf_dia																= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_uf_dia'))
	ldt_fec_ult																= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_ult')
	ldb_gastos_adm														= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm'))
	ldt_fec																	= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')
	ldb_pie_pagado														= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie_pagado'))
	ldb_saldo_finan															= dw_anexo_funeraria.getitemnumber(1,'saldo_finan')
	ldb_calculo																= ldb_pie + (ll_plazo * ldb_valor_cta)
	ls_anexo_dacion														= trim(dw_anexo_funeraria.getitemstring(1,'producto_anexo_anexo_dacion'))
	ls_uso																	= dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso')
	if gs_age='' or isnull(gs_age) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Codigo Agente Inválido',stopsign!)
		dw_agente.setfocus()
	elseif gs_sup='' or isnull(gs_sup) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Codigo Supervisor Inválido',stopsign!)
		dw_supervisor.setfocus()
	elseif gs_jefe='' or isnull(gs_jefe) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Codigo Jefe de Venta Inválido',stopsign!)
		dw_jefe.setfocus()
	elseif isnull(ldb_precio) or ldb_precio<=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Precio',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_precio')
	elseif isnull(ls_forma_pag) or ls_forma_pag='' then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Forma de Pago',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_anexo_forma_pago')
	elseif isnull(gl_cod_parque) or gl_cod_parque=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Código Parque',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('cadena_cod_parque')
	elseif isnull(ldb_pie) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Pie',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_pie')
//	elseif isnull(ldt_fec_pie) then
//		ls_pasa																= 'N'
//		messagebox('Advertencia','Debe Ingresar Fecha Pie',stopsign!)
//		dw_anexo_funeraria.setfocus()
//		dw_anexo_funeraria.setcolumn('producto_pago_fecha_pie')
	elseif isnull(ll_cod_servicio) or ll_cod_servicio=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Código Servicio',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_codigo_servicio')
	elseif isnull(ll_tipo_benef) or ll_tipo_benef=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Tipo Beneficiario',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_anexo_tipo_beneficiarios')
	elseif isnull(ll_cant_benef) or ll_cant_benef=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Cantidad Beneficiario',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_capacidad')
	elseif isnull(ll_plazo) or ll_plazo=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Plazo Crédito',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_plazo')
	elseif isnull(ldb_valor_cta) or ldb_valor_cta=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Valor Cuota',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_valor_cuota')
	elseif isnull(ls_moneda) or ls_moneda='' then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Tipo Moneda',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_moneda')
	elseif isnull(ldb_tasa_base) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Tasa Crédito',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_tasa_base')
	elseif isnull(ldt_fec_prim) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Fecha Primer Vencimiento',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_fecha_prim')
	elseif isnull(ldb_uf_dia) or ldb_uf_dia=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Valor U.F.',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_uf_dia')	
	elseif isnull(ldt_fec_ult) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Fecha Último Vencimiento',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_fecha_ult')	
	elseif isnull(ldt_fec) then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Fecha Contrato',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_fecha')		
	elseif isnull(ldb_saldo_finan) or ldb_saldo_finan=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Debe Ingresar Saldo a Financiar',stopsign!)
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('saldo_finan')		
	end if
	ldb_calculo																= ldb_pie + (ll_plazo * ldb_valor_cta)	
	SELECT	"SUPERVISOR"."PORC_SUPERVISOR"  
	INTO 		:ldb_porc_sup  
	FROM 	"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
	USING	sqlca;
	if isnull(ldb_porc_sup) or ldb_porc_sup=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Error Porcentaje de Comisión Supervisor Inválida, debe chequear con Departamento Informática Tabla Supervisor',stopsign!)
		dw_anexo_funeraria.setfocus()
	end if
	SELECT	"JEFE_VENTAS"."PORC_JEFE_VTA"  
	INTO 		:ldb_porc_jef  
	FROM 	"JEFE_VENTAS"  
	WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
	USING	sqlca;
	if isnull(ldb_porc_jef) or ldb_porc_jef=0 then
		ls_pasa																= 'N'
		messagebox('Advertencia','Error Porcentaje de Comisión Jefe de Venta Inválida, debe chequear con Departamento Informática Tabla Jefe_Venta',stopsign!)
		dw_anexo_funeraria.setfocus()
	end if
	dw_anexo_funeraria.SetItem(1,"producto_anexo_estado_comi_sup",'N')
	SELECT	"AGENTES"."TIPO_CONT"  
	INTO 		:ls_tip_cont  
	FROM 	"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :gs_age   ;
	if ls_tip_cont = '1' then
		dw_anexo_funeraria.SetItem(1,"producto_anexo_estatus_comision",0)
	else
		dw_anexo_funeraria.SetItem(1,"producto_anexo_estatus_comision",1)
	end if
	dw_anexo_funeraria.setitem(1,'producto_anexo_cod_agente',gs_age)
	dw_anexo_funeraria.setitem(1,'producto_anexo_cod_super',gs_sup)
	dw_anexo_funeraria.setitem(1,'producto_anexo_cod_jefe',gs_jefe)
	dw_anexo_funeraria.setitem(1,'producto_anexo_rut',gi_rut)
	if ldb_precio=0 or ldb_calculo=0 or isnull(ldb_precio) or isnull(ldb_calculo) then
//	if round(ldb_precio,2) > round(ldb_calculo,2) then
		ls_pasa																= 'N'
		messagebox("Advertencia","Valor Cuota Inválida, debe revisar Plazo, Valor Cuota, Valor Pie o Precio")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_valor_cuota')
	end if
	dw_anexo_funeraria.setitem(1,'producto_anexo_saldo_financiar',ldb_saldo_finan)
	dw_anexo_funeraria.accepttext()
	ldb_tasa																	= f_tasa(ll_plazo,ldb_valor_cta,ldb_saldo_finan)
	if ldb_tasa <= 0.0001 then
		ldb_tasa						= 0.0001
		ldb_tasa_cta				= 0.0001
		 ldb_tasa_int_cta			= 0.0001
	else
		 ldb_tasa						= ldb_tasa
		 ldb_tasa_cta				= ldb_tasa / 100
		 ldb_tasa_int_cta			= ldb_tasa_cta
	end if
	//ldb_tasa																	=  0.0130679313
//	ldb_tasa																	= 0.0001
	if ls_forma_pag <> '2' then ldb_tasa = 0.0001
	SELECT SUM("PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO")  
   	INTO		:ldb_sum_prod  
    	FROM		"PRODUCTO_VENTA_ASOCIADA"  
   	WHERE	( "PRODUCTO_VENTA_ASOCIADA"."BASE" = :gs_base ) AND  
         		( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = :gs_serie ) AND  
         		( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) 
	USING	sqlca;
//	if round(ldb_precio,2) <> round(ldb_sum_prod,2) then
	if ldb_sum_prod=0 or isnull(ldb_sum_prod) then
		ls_pasa																= 'N'
		messagebox("Advertencia","Valor Servicio Funerario Ingresado, No Corresponde a Tipo Servicio Seleccionado")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_codigo_servicio')
	end if
	if ls_pasa= 'S' then
		SELECT 	"PRODUCTO_TIPO_SERVICIO"."MONEDA_CTA_MORTUORIA",   	"PRODUCTO_TIPO_SERVICIO"."VALOR_CTA_MORTUORIA"  
    		INTO 		:ls_moneda_cta_m,   															:ll_valor_cta_m  
    		FROM 	"PRODUCTO_TIPO_SERVICIO"  
   		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" = :ll_cod_servicio ) AND  
					( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :gl_cod_parque ) AND  
					( "PRODUCTO_TIPO_SERVICIO"."MONEDA_CTA_MORTUORIA" = :ls_moneda )  
		USING	sqlca;
		if sqlca.sqlcode <> 0 then
			ls_moneda_cta_m			= ls_moneda
			if ls_moneda='1' then
				ll_valor_cta_m			= 600000
			elseif ls_moneda='2' then
				ll_valor_cta_m			= 15
			end if
		end if
		if ldb_tasa < 0 then ldb_tasa=0
		if ldb_tasa>=0 and ldb_tasa<10 then
			dw_anexo_funeraria.setitem(1,'producto_pago_tasa',ldb_tasa)
			dw_anexo_funeraria.setitem(1,'producto_pago_tasa_interes_cuota', ldb_tasa_cta)
			dw_anexo_funeraria.setitem(1,'producto_anexo_base',gs_base)
			
			dw_anexo_funeraria.accepttext()
			IF MessageBox("Anexo Producto", "Desea Actualizar los datos ingresados", Question!, YesNo!) = 1 THEN
				ls_graba_prod										= wf_graba_venta_asociada()
				ls_graba_benef										= wf_beneficiarios()
				if ls_graba_prod='S' and ls_graba_benef='S' then		
					SELECT	count("PRODUCTO_ANEXO"."BASE")
					INTO		:ll_cta	
					FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
					WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
								"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
								"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
								"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
								"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
								"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
								"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if  not isnull(ll_cta) and ll_cta>0 then
							SELECT	"PRODUCTO_PAGO"."PRECIO",	"PRODUCTO_PAGO"."CODIGO_SERVICIO"  
							INTO		:ldb_precio_tab,:ll_cod_serv_tab	
							FROM		"PRODUCTO_ANEXO","PRODUCTO_PAGO"  
							WHERE	"PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" and  
										"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
										"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
										"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
										"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
										"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
										"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
							USING	sqlca;
							if round(ldb_precio,2) <> round(ldb_precio_tab,2) then
								ll_res1													= messagebox("Advertencia","Desea Modificar el Precio de Venta", Question!, YesNo!)
								if ll_res1=1 then
									ls_pasa												= 'S'
								else
									ls_pasa												= 'N'
								end if
							end if
							if ll_cod_servicio<> ll_cod_serv_tab then
								ll_res2													= messagebox("Advertencia","Desea Modificar Tipo de Servicio", Question!, YesNo!)
								if ll_res2=1 then
									ls_pasa												= 'S'
								else
									ls_pasa												= 'N'
								end if
							end if
						end if
					end if
					il_graba_1														= dw_anexo_funeraria.Update()
					if il_graba_1 = 1 then
						gs_base 														= dw_anexo_funeraria.getitemstring(1,'producto_anexo_base') 
						gs_serie 														= dw_anexo_funeraria.getitemstring(1,'producto_anexo_serie') 
						gi_numero													= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_numero') 
						gi_rut 														= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_rut')
						if not isnull(ls_anexo_dacion) and ls_anexo_dacion<>'' then
							ls_base_dacion											= mid(ls_anexo_dacion,1,1)
							ls_serie_dacion											= mid(ls_anexo_dacion,2,1)
							ll_numero_dacion										= double(mid(ls_anexo_dacion,3))
							if ls_base_dacion='O' then
								UPDATE 	"OFERTA_V"  
								SET 		"ANEXO_DACION" = :ls_anexo_dacion  
								WHERE 	( "OFERTA_V"."SERIE" = :gs_serie ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :gi_numero )   
								USING	sqlca;
								commit;
								ll_graba_dacion ++
							elseif ls_base_dacion='C' then
								UPDATE 	"CONTRATO"  
								SET 		"ANEXO_DACION" = :ls_anexo_dacion  
								WHERE 	( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
											( "CONTRATO"."NRO_CONTRATO" = :gi_numero )   
								USING	sqlca;
								commit;
								ll_graba_dacion ++
							elseif ls_base_dacion='G' then
								UPDATE 	"PRODUCTO_ANEXO"  
								SET 		"ANEXO_DACION" = :ls_anexo_dacion  
								WHERE 	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
											( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
											( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )  
								USING	sqlca;
								commit;
								ll_graba_dacion ++
							end if
							ls_contrato_ori		= gs_base+gs_serie+string(gi_numero,'###################')
							if gs_base='O' or ls_base_dacion='U' then
								UPDATE 	"OFERTA_V"  
								SET 		"ANEXO_DACION" = :ls_contrato_ori  
								WHERE 	( "OFERTA_V"."SERIE" = :ls_serie_dacion ) AND  
											( "OFERTA_V"."NRO_OFERTA" = :ll_numero_dacion )  
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
		
							elseif ls_base_dacion='C' then
								UPDATE 	"CONTRATO"  
								SET 		"ANEXO_DACION" = :ls_contrato_ori  
								WHERE 	( "CONTRATO"."SERIE_C" = :ls_serie_dacion ) AND  
											( "CONTRATO"."NRO_CONTRATO" = :ll_numero_dacion ) 
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if

							end if
							
							if ll_graba_dacion > 0 then
								SELECT 	Count("CADENA_MORA"."BASE")  
								INTO 		:ll_count_cadena_mora  
								FROM 	"CADENA_MORA"  
								WHERE 	( "CADENA_MORA"."BASE" = :gs_base ) AND  
											( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
											( "CADENA_MORA"."NUMERO" = :gi_numero )   ;
								if isnull(ll_count_cadena_mora) then ll_count_cadena_mora=0
								if ll_count_cadena_mora = 0 then
									DECLARE sp_nuevo_cadena_mora0 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
									EXECUTE sp_nuevo_cadena_mora0;
								end if
								SELECT 	Count("CUPONERAS"."BASE")
								INTO 		:ll_count_cuponera  
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
											("CUPONERAS"."ESTADO_CUPONERA" = 'V' OR  "CUPONERAS"."ESTADO_CUPONERA" = 'C')   ;
								if isnull(ll_count_cuponera) then ll_count_cuponera=0
								if ll_count_cuponera = 0 then
									DECLARE sp_proc_genera_cuponera0 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cta, :ldb_valor_cta_m, :ls_dv, :ll_cod_parque, :ldt_fec_prim, :ldt_fec_venc_mant, :ls_moneda );
									EXECUTE sp_proc_genera_cuponera0;
								end if
								SELECT 	Count("INGRESO"."TIPO_COB")
								INTO 		:ll_count_pago_novacion  
								FROM 	"INGRESO"  
								WHERE 	( "INGRESO"."BASE" = :gs_base ) AND  
											( "INGRESO"."SERIE" = :gs_serie ) AND  
											( "INGRESO"."CONTRATO" = :gi_numero ) AND  
											( "INGRESO"."TIPO_MOV" = 'E' ) AND  
											( "INGRESO"."CODIGO_OTRO" = '0' ) AND  
											( "INGRESO"."PAGO_HIST" = 'A' )   ;
								if isnull(ll_count_pago_novacion) then ll_count_pago_novacion=0
								if ll_count_pago_novacion = 0 then
									if ll_cod_servicio= 400 or ll_cod_servicio= 401 or ll_cod_servicio= 402 or ll_cod_servicio= 403 then 
										ll_monto_peso		= round(ldb_precio * ldb_uf_dia,0)
										ll_monto_dscto		= (ll_monto_peso - 1) * -1
										ls_fecha_palabra	= f_retorna_fecha_palabra(date(ldt_fecha_pago))
										ls_contrato			= gs_base+gs_serie+string(gi_numero,'##################')
										SELECT 	MIN("CUPONERAS_DETALLE"."NRO_CUPON")
										INTO 		:ll_folio_e  
										FROM 	"CUPONERAS",   "CUPONERAS_DETALLE"  
										WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
													( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
													( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
													( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
													( ( "CUPONERAS"."BASE" = :gs_base ) AND  
													( "CUPONERAS"."SERIE" = :gs_serie ) AND  
													( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
													( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) )   ;
										if ll_folio_e > 0 then
											INSERT INTO "INGRESO"  
														( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"NRO_CUPON",   	"TIPO_COB_ORIGINAL",   	"CODIGO_SERVICIO" )  	
											VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'E',   				:ll_monto_peso,   	1,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'0',   						null,   				null,   									142,   				0,   					99,   							1,   							:ls_moneda,   		:ldb_precio,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   					:ll_folio_e,   		'BE',   							:ll_cod_servicio )  
											USING		sqlca;
											commit;
											
											INSERT INTO "INGRESO"  
														( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"NRO_CUPON",   	"TIPO_COB_ORIGINAL",   	"CODIGO_SERVICIO" )  	
											VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'S',   				:ll_monto_dscto,   	0,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'165',   					null,   				null,   									142,   				0,   					99,   							0,   							'1',   					:ll_monto_dscto,   	'N',   					:ldt_fecha_pago,   		'0',   							'N',   					:ll_folio_e,   		'BE',   							:ll_cod_servicio )  
											USING		sqlca;
											commit;
											
											INSERT INTO "INGRESO_NEWSING"  
														( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"CODIGO_SERVICIO" )  	
											VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'E',   				:ll_monto_peso,   	1,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'0',   						null,   				null,   									142,   				0,   					99,   							0,   							:ls_moneda,   		:ldb_precio,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   			   		:ll_cod_servicio )  
											USING		sqlca;
											commit;
											
											INSERT INTO "INGRESO_NEWSING"  
														( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   		"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"CODIGO_SERVICIO" )  	
											VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'S',   				:ll_monto_dscto,   	0,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'165',   					null,   				null,   									142,   				0,   					99,   							0,   							'1',   					:ll_monto_dscto,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   			   		:ll_cod_servicio )  
											USING		sqlca;
											commit;
											
											INSERT INTO "DOCUMENTOS"  
														( "FOLIO",  		"TIPO_COB",   	"N_CHEQUE",   	"COD_BANCO",   	"MONTO",   	"FECHA_VENC",   	"COD_PAGO",   "NUM_CHEQUES",   	"REZAGO",   	"FECHA_PAGO",   	"COD_CAJA",   	"ESTADO_CH",   	"GLOSA_CH",   	"FECHA_ESTADO_CH",   	"COD_TARJETA_CREDITO",   	"NRO_CUOTAS_CREDITO",   	"COD_AUTORIZACION_CREDITO",   	"TIPO_TARJETA_CREDITO",   	"COD_TARJETA_DEBITO",   	"COD_AUTORIZACION_DEBITO",   	"COD_BANCO_DEBITO",   	"TRASPADO_PAGO",   	"TIPO_PAGO_TARJETA_CREDITO",   "HORA_PAGO",   	"MINUTO_PAGO",   	"TARJETA_EMPRESA",   	"TIPO_COB_AUX",   	"ESTADO_PAGO_SAP",   	"MONTO_UF",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"SOCIEDAD",   	"TIPO_COB_ORIGINAL",   	"NRO_CUPON" )  	
											VALUES 	( :ll_folio_e,   	'CU',   			999,   			999,   				1,   			:ldt_fecha_pago,  	'EF',   			0,   						' ',   				:ldt_fecha_pago, 	'AI',   				'C',   					'-',   				null,   						null,   								null,   								null,   										null,   								null,   							null,   									null,   							null,   						null,   										:ll_hora_pago,   	:ll_minuto_pago,   	null,   						'BE',   					99,   							1,   					:ldt_fecha_pago,   		'0',   							'N',   					'CL02',   			'BE',   							:ll_folio_e )  ;
											commit;
											
											INSERT INTO "DOCUMENTOS_NEWSING"  
														( "FOLIO",  		"TIPO_COB",   	"N_CHEQUE",   	"COD_BANCO",   	"MONTO",   	"FECHA_VENC",   	"COD_PAGO",   "NUM_CHEQUES",   	"REZAGO",   	"FECHA_PAGO",   	"COD_CAJA",   	"ESTADO_CH",   	"GLOSA_CH",   	"FECHA_ESTADO_CH",   	"COD_TARJETA_CREDITO",   	"NRO_CUOTAS_CREDITO",   	"COD_AUTORIZACION_CREDITO",   	"TIPO_TARJETA_CREDITO",   	"COD_TARJETA_DEBITO",   	"COD_AUTORIZACION_DEBITO",   	"COD_BANCO_DEBITO",   	"TRASPADO_PAGO",   	"TIPO_PAGO_TARJETA_CREDITO",   "HORA_PAGO",   	"MINUTO_PAGO",   	"TARJETA_EMPRESA",   	"TIPO_COB_AUX",   	"ESTADO_PAGO_SAP",   	"MONTO_UF",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO")  	
											VALUES 	( :ll_folio_e,   	'CU',   			999,   			999,   				1,   			:ldt_fecha_pago,  	'EF',   			0,   						' ',   				:ldt_fecha_pago, 	'AI',   				'C',   					'-',   				null,   						null,   								null,   								null,   										null,   								null,   							null,   									null,   							null,   						null,   										:ll_hora_pago,   	:ll_minuto_pago,   	null,   						'BE',   					99,   							1,   					:ldt_fecha_pago,   		'0',   							'N' )  ;
											commit;
											
											INSERT INTO "INGRESO_NEWSING_CABECERA"  
														( "TIPO_COB",  	"FOLIO",   	"FECHA_PAGO",   	"FECHA_PAGO_PALABRA",   	"COD_PARQUE",   	"NRO_CONTRATO",   	"UF_DIA",   	"COD_CAJA",   	"USUARIO",   	"PAGA_CON",   	"VUELTO",   	"PROXIMO_PAGO",   	"MONTO_TOTAL_PALABRA",   	"PAGO_EF",   	"PAGO_CH",   	"PAGO_TC",   	"PAGO_TD",   	"FOLIO_BE",   	"RUT_CLIENTE",   	"REZAGO",   	"NETO",   	"EXENTO",   	"IVA",   	"TOTAL",   	"IP_PRINT",   	"IP_PC",   		"CONEXION",   	"FECHA_FOLIO_ELEC",   	"TIPO_COB_ORIGEN_NE",   	"FOLIO_ORIGEN_NE",   	"FECHA_PAGO_ORIGEN_NE",   	"COD_PARQUE_CTTO" )  	
											VALUES 	( 'CU',   				:ll_folio_e,	:ldt_fecha_pago,   :ls_fecha_palabra,   				150,   				:ls_contrato,   			:gd_uf_dia,	'AI',   				:gs_user,   		'1',   				'0',  				'-',   						'Uno',   								'1',   				'0',   				'0',   				'0',   				null,   			:gi_rut,   			' ',   				0,   			1,   				0,   		1,   			null,   			'10.0.254.17',   :gs_conexion,   :ldt_fecha_pago,   		null,   							null,   						null,   								142 )  ;
											commit;
											
											UPDATE 	"PRODUCTO_ANEXO"  
											SET 		"CUOTAS_PAG" = 1,   
														"TOTAL_PAGADO" = 1  
											WHERE 	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
														( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
														( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) ;
											commit;

											UPDATE 	"CUPONERAS_DETALLE"  
											SET 		"ESTADO_PAGO_CUPON" = 'C',   
														"TIPO_COB_PAGO" = 'CU',   
														"FOLIO_PAGO" = :ll_folio_e,   
														"FECHA_PAGO" = :ldt_fecha_pago  
											WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
														( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
														( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
														( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_folio_e )   ;
											commit;
											
											DECLARE sp_nuevo_cadena_mora_g1 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
											EXECUTE sp_nuevo_cadena_mora_g1;

										end if
									end if
								end if
							end if
						end if
						IF f_validar() THEN
							IF cb_aceptar.text = "Actualizar" THEN
								// Update
								IF Not(wf_cadena(1)) THEN
									MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
									RETURN
								else
									il_graba_3										= 1
									il_graba_4										= 1
									il_graba_5										= 1
								END IF
							ELSE
								ldb_porc_age 										= 5
								dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_age",ldb_porc_age)
								SELECT	"SUPERVISOR"."PORC_SUPERVISOR"  
								INTO 		:ldb_porc_sup  
								FROM 	"SUPERVISOR"  
								WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_sup",ldb_porc_sup)
								else
									dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_sup",0)
								end if
								SELECT	"JEFE_VENTAS"."PORC_JEFE_VTA"  
								INTO 		:ldb_porc_jef  
								FROM 	"JEFE_VENTAS"  
								WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_jefe",ldb_porc_jef)
								else
									dw_anexo_funeraria.SetItem(1,"producto_anexo_porce_jefe",0)
								end if
								dw_anexo_funeraria.accepttext()
								if dw_anexo_funeraria.update()=1 then
									il_graba_3										= 1
									SELECT	"ULT_ESTADO",	"DEPTO_ASIGNADO"
									INTO 		:ll_estado_cd,		:ls_depto_asig
									FROM 	"CD_FOLIO"  
									WHERE	"CD_FOLIO"."BASE" = :gs_base AND  
												"CD_FOLIO"."SERIE" = :gs_serie AND  
												"CD_FOLIO"."NUMERO" = :gi_numero
									USING	sqlca;
									if sqlca.sqlcode=0 then
										if ll_estado_cd<>11 then
											ll_estado_graba						= 11
											ls_glosa									= 'PRODUCTO SERV FUNERARIO DIGITADO'
											ls_memo									= '-'
											ls_ref										= '-'
											UPDATE	"CD_FOLIO"  
											SET 		"ULT_ESTADO" = :ll_estado_graba,   
														"ULT_FECHA_ESTADO" = :gdt_fec_sistema,   
														"ULT_GLOSA_ESTADO" = :ls_glosa,   
														"ULT_MEMO" = :ls_memo,   
														"ULT_USUARIO_GESTION" = :gs_user,   
														"ULT_REFERENCIA_MEMO" = :ls_ref,
														"COD_PARQUE" = :gl_cod_parque 
											WHERE	"CD_FOLIO"."BASE" = :gs_base AND  
														"CD_FOLIO"."SERIE" = :gs_serie AND  
														"CD_FOLIO"."NUMERO" = :gi_numero   
											USING	sqlca;
											if sqlca.sqlcode=0 then
												il_graba_4							= 1
			//									commit;
												INSERT INTO	"CD_FOLIO_DETALLE"  
															( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",	"GLOSA",		"MEMO",		"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"COD_PARQUE")  
												VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,   			:ll_estado_graba,	:gdt_fec_sistema,	:ls_glosa,	:ls_memo,	:gs_age,				:gs_sup,					:gs_jefe,					:ls_ref,						:gl_cod_parque )  
												USING	sqlca;
												if sqlca.sqlcode=0 then
													il_graba_5						= 1
			//										commit;
												else
													il_graba_5						= 0
			//										rollback;
												end if
											else
												il_graba_4							= 0
			//									rollback;
											end if
										else
											il_graba_4								= 1
											il_graba_5								= 1
										end if
									else
										il_graba_4									= 1
										il_graba_5									= 1
									end if
								else
									il_graba_3	= 0
								end if
								IF Not(wf_cadena(0)) THEN
									MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
									il_graba_2										= 0
									rollback using SQLCA;
									RETURN
								END IF
							END IF			
						end if
						if ldb_tasa<=0 then ldb_tasa=0
						if ldb_tasa_base<=0 then ldb_tasa_base=0
						if ldb_gastos_adm<=0 then ldb_gastos_adm=0
						if il_graba_1=1 and il_graba_2=1 and il_graba_3=1 and il_graba_4=1 and il_graba_5=1 then
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
								ll_tot_reg											= dw_seguro.rowcount()
								for ll_indi=1 to ll_tot_reg
									ll_est_reg										= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
									ll_codigo											= dw_seguro.getitemnumber(ll_indi,'codigo')
									ldb_monto										= dw_seguro.getitemnumber(ll_indi,'factor_prima')
									ldb_monto_peso								= dw_seguro.getitemnumber(ll_indi,'factor_peso')
									if ls_moneda='1' then
										ldb_monto									= ldb_monto_peso
									elseif ls_moneda='2' then
										ldb_monto									= ldb_monto
									end if
									if ll_est_reg = 0 then
										SELECT	Count("SEGURO_ASOCIADOS"."BASE")
										INTO 		:ll_count  
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
													"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
													"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
													"SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo   
										USING	sqlca;
										if ll_count > 0 then
											UPDATE	"SEGURO_ASOCIADOS"  
											SET 		"ESTADO_SEGURO" = 'A',
														"ESTADO_REG" = 0
											WHERE 	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
														"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
														"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
														"SEGURO_ASOCIADOS"."COD_SEGURO" = :ll_codigo 
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
											elseif sqlca.sqlcode=100 then
												INSERT INTO "SEGURO_ASOCIADOS"  
															( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",		"FORMA_PAGO" )  
												VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						: ls_moneda,	:ls_forma_pag)  
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
														( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",		"FORMA_PAGO")  
											VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						: ls_moneda,	:ls_forma_pag )  
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
								ll_tot_reg											= dw_seguro.rowcount()
								for ll_indi=1 to ll_tot_reg
									ll_est_reg										= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
									ll_codigo											= dw_seguro.getitemnumber(ll_indi,'codigo')
									ldb_monto										= dw_seguro.getitemnumber(ll_indi,'factor_prima')
									ldb_monto_peso								= dw_seguro.getitemnumber(ll_indi,'factor_peso')
									if ls_moneda='1' then
										ldb_monto									= ldb_monto_peso
									elseif ls_moneda='2' then
										ldb_monto									= ldb_monto
									end if
									if ll_est_reg = 0 then
										INSERT INTO "SEGURO_ASOCIADOS"  
													( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",		"FORMA_PAGO" )  
										VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						: ls_moneda,	:ls_forma_pag )  
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
							if gs_nueva_oferta='S' then
								INSERT INTO "PRODUCTO_PAGO" 
											( "BASE",		"SERIE",		"NUMERO",	"FOLIO",	"FECHA",	"PRECIO",	"PIE",		"PIE_PAGADO",		"TASA",		"VALOR_CUOTA",	"PLAZO",	"UF_DIA",	"MONEDA",	"FECHA_PRIM",	"FECHA_ULT",	"FECHA_PIE",	"GASTO_ADM",		"CTAS_PIE_PLAZO",	"CTAS_PIE_PAGADAS",	"CODIGO_SERVICIO",	"FECHA_PIE_PRIM",	"USUARIO_CREA",	"TASA_BASE", "CAPACIDAD" ,		"PRECIO_VENTA",		"TASA_INTERES_CUOTA")
								VALUES	( :gs_base,	:gs_serie,	:gi_numero,	0,			:ldt_fec,	:ldb_precio,	:ldb_pie,	:ldb_pie_pagado,	:ldb_tasa,	:ldb_valor_cta,		:ll_plazo,	:ldb_uf_dia,	:ls_moneda,	:ldt_fec_prim,	:ldt_fec_ult,		:ldt_fec_pie,		:ldb_gastos_adm,	0,							0,								:ll_cod_servicio,		:ldt_fec,					:gs_user,   			 :ldb_tasa_base,	:ll_cant_benef,	:ldb_precio_venta,		:ldb_tasa_int_cta)
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
									messagebox("Error Grabar","Error Tabla Producto Pago SQL: "+sqlca.sqlerrtext)
								end if
							else
								dw_anexo_funeraria.accepttext()
								ll_ult_folio													= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_ult_folio')
								if isnull(ll_ult_folio) then ll_ult_folio=0
								UPDATE	"PRODUCTO_PAGO"
								SET		"FECHA"= :ldt_fec,
											"PRECIO"= :ldb_precio,
											"PRECIO_VENTA" = :ldb_precio_venta,
											"PIE"= :ldb_pie,
											"PIE_PAGADO"= :ldb_pie_pagado,
											"TASA"= :ldb_tasa,
											"VALOR_CUOTA"= :ldb_valor_cta,
											"PLAZO"= :ll_plazo,
											"UF_DIA"= :ldb_uf_dia,
											"MONEDA"= :ls_moneda,
											"FECHA_PRIM"= :ldt_fec_prim,
											"FECHA_ULT"= :ldt_fec_ult,
											"FECHA_PIE"= :ldt_fec_pie,
											"GASTO_ADM"= :ldb_gastos_adm,
											"CTAS_PIE_PLAZO"=0,
											"CTAS_PIE_PAGADAS"=0,
											"CODIGO_SERVICIO"=:ll_cod_servicio,
											"FECHA_PIE_PRIM"= :ldt_fec,
											"USUARIO_CREA"= :gs_user,
											"TASA_BASE"=:ldb_tasa_base,
											"CAPACIDAD"=:ll_cant_benef,
											"TASA_INTERES_CUOTA" = :ldb_tasa_int_cta
								WHERE	"PRODUCTO_PAGO"."BASE" = :gs_base AND  
											"PRODUCTO_PAGO"."SERIE" = :gs_serie AND  
											"PRODUCTO_PAGO"."NUMERO" = :gi_numero AND
											"PRODUCTO_PAGO"."FOLIO" = :ll_ult_folio
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit using sqlca;
								else
									rollback  using sqlca;
								end if
							end if
							gs_nueva_oferta	= 'N'
							if ldb_precio > 0 then
								if ldb_pie = 0 and ll_plazo = 1 then
									ldb_porc												= round(((ldb_valor_cta * 100) / ldb_precio),2)
								else
									ldb_porc												= round(((ldb_pie * 100) / ldb_precio),2)
								end if
							else
								ldb_porc													= 0
							end if
							IF cb_aceptar.text = "Actualizar" THEN 
								wf_comisiones(gs_serie,gi_numero,ldb_porc,ll_plazo) //--nueva comision--
								wf_log_anexo_liberador()
								ll_plazo													= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
								ll_rut														= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_rut')
								ldt_fec_prim												= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
								SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cta_m)
								ls_dv														= TRIM(em_dv.text)
								ll_cod_parque											= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
								ls_moneda												= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
								ldb_tasa_int_cta										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa_interes_cuota')
								
								SELECT	"CADENA"."ESTADO"  
								INTO 		:ls_estado_cadena  
								FROM 	"CADENA"  
								WHERE	"CADENA"."CODIGO" = :gs_base AND  
											"CADENA"."SERIE" = :gs_serie AND  
											"CADENA"."NUMERO" = :gi_numero   
								USING	sqlca;
								if ls_estado_cadena='V' then
									SELECT	"CUPONERAS"."NUMERO"  
									INTO 		:ll_count_vig  
									FROM 	"CUPONERAS"  
									WHERE	"CUPONERAS"."BASE" = :gs_base AND  
												"CUPONERAS"."SERIE" = :gs_serie AND  
												"CUPONERAS"."NUMERO" = :gi_numero AND  
												"CUPONERAS"."ESTADO_CUPONERA" = 'V'   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										if il_modif > 1 or il_modif_fec > 1 or il_modif_plazo > 1 then
											if il_modif > 1 then
												ls_modif										= 'E'
											elseif il_modif_fec > 1 then
												ls_modif										= 'C'
											elseif il_modif_plazo > 1 then
												ls_modif										= 'P'
											end if
											SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
											INTO 		:ldt_fec_venc_mant  
											FROM 	"CADENA_MORA"  
											WHERE	"CADENA_MORA"."BASE" = :gs_base AND  
														"CADENA_MORA"."SERIE" = :gs_serie AND  
														"CADENA_MORA"."NUMERO" = :gi_numero   
											USING	sqlca;
											INSERT INTO "CUPONERAS_MODIFICA"  
														( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",	"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",	"COD_PARQUE",	"FECHA_PRIM",	"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
											VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,				'V',					:ll_plazo,	:ll_rut,	:ls_dv,	:ldb_valor_cta,				:ldb_valor_cta_m,			:ll_cod_parque,		:ldt_fec_prim,	:ldt_fec_venc_mant,	:ls_moneda,	:ls_modif )  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
												DECLARE sp_nuevo_cadena_mora1 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
												EXECUTE sp_nuevo_cadena_mora1;
												
												DECLARE sp_proc_modifica_cuponera1 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cta, :ldb_valor_cta_m, :ls_dv, :ll_cod_parque, :ldt_fec_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
												EXECUTE sp_proc_modifica_cuponera1;
												
												ldb_tasa_12				= (ldb_tasa / 100) * 12
												DECLARE SP_DESARROLLO_CUOTA1 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa_12, :ldb_valor_cta, :ldb_gastos_adm, :ldt_fec_prim, :ls_moneda, :ldb_tasa_int_cta);
												EXECUTE SP_DESARROLLO_CUOTA1;
											else
												rollback;
											end if
										else
											ldb_tasa_12				= (ldb_tasa / 100) * 12
											DECLARE SP_DESARROLLO_CUOTA2 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa_12, :ldb_valor_cta, :ldb_gastos_adm, :ldt_fec_prim, :ls_moneda, :ldb_tasa_int_cta);
											EXECUTE SP_DESARROLLO_CUOTA2;
										end if
									elseif sqlca.sqlcode=100 then
										DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
										EXECUTE sp_nuevo_cadena_mora;
										
										DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cta, :ldb_valor_cta_m, :ls_dv, :ll_cod_parque, :ldt_fec_prim, :ldt_fec_venc_mant, :ls_moneda );
										EXECUTE sp_proc_genera_cuponera;
										
										ldb_tasa_12				= (ldb_tasa / 100) * 12
										DECLARE SP_DESARROLLO_CUOTA PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa_12, :ldb_valor_cta, :ldb_gastos_adm, :ldt_fec_prim, :ls_moneda, :ldb_tasa_int_cta);
										EXECUTE SP_DESARROLLO_CUOTA;
									end if
								end if
								if ll_graba_dacion > 0 then
									SELECT 	Count("INGRESO"."TIPO_COB")
									INTO 		:ll_count_pago_novacion  
									FROM 	"INGRESO"  
									WHERE 	( "INGRESO"."BASE" = :gs_base ) AND  
												( "INGRESO"."SERIE" = :gs_serie ) AND  
												( "INGRESO"."CONTRATO" = :gi_numero ) AND  
												( "INGRESO"."TIPO_MOV" = 'E' ) AND  
												( "INGRESO"."CODIGO_OTRO" = '0' ) AND  
												( "INGRESO"."PAGO_HIST" = 'A' )   ;
									if isnull(ll_count_pago_novacion) then ll_count_pago_novacion=0
									if ll_count_pago_novacion = 0 then
										if ll_cod_servicio= 400 or ll_cod_servicio= 401 or ll_cod_servicio= 402 or ll_cod_servicio= 403 then 
											ll_monto_peso		= round(ldb_precio * ldb_uf_dia,0)
											ll_monto_dscto		= (ll_monto_peso - 1) * -1
											ls_fecha_palabra	= f_retorna_fecha_palabra(date(ldt_fecha_pago))
											ls_contrato			= gs_base+gs_serie+string(gi_numero,'##################')
											SELECT 	MIN("CUPONERAS_DETALLE"."NRO_CUPON")
											INTO 		:ll_folio_e  
											FROM 	"CUPONERAS",   "CUPONERAS_DETALLE"  
											WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
														( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
														( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
														( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
														( ( "CUPONERAS"."BASE" = :gs_base ) AND  
														( "CUPONERAS"."SERIE" = :gs_serie ) AND  
														( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
														( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) )   ;
											if ll_folio_e > 0 then
												INSERT INTO "INGRESO"  
															( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"NRO_CUPON",   	"TIPO_COB_ORIGINAL",   	"CODIGO_SERVICIO" )  	
												VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'E',   				:ll_monto_peso,   	1,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'0',   						null,   				null,   									142,   				0,   					99,   							1,   							:ls_moneda,   		:ldb_precio,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   					:ll_folio_e,   		'BE',   							:ll_cod_servicio )  
												USING		sqlca;
												commit;
												
												INSERT INTO "INGRESO"  
															( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"NRO_CUPON",   	"TIPO_COB_ORIGINAL",   	"CODIGO_SERVICIO" )  	
												VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'S',   				:ll_monto_dscto,   	0,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'165',   					null,   				null,   									142,   				0,   					99,   							0,   							'1',   					:ll_monto_dscto,   	'N',   					:ldt_fecha_pago,   		'0',   							'N',   					:ll_folio_e,   		'BE',   							:ll_cod_servicio )  
												USING		sqlca;
												commit;
												
												INSERT INTO "INGRESO_NEWSING"  
															( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"CODIGO_SERVICIO" )  	
												VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'E',   				:ll_monto_peso,   	1,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'0',   						null,   				null,   									142,   				0,   					99,   							0,   							:ls_moneda,   		:ldb_precio,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   			   		:ll_cod_servicio )  
												USING		sqlca;
												commit;
												
												INSERT INTO "INGRESO_NEWSING"  
															( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   		"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"CODIGO_SERVICIO" )  	
												VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'S',   				:ll_monto_dscto,   	0,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'165',   					null,   				null,   									142,   				0,   					99,   							0,   							'1',   					:ll_monto_dscto,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   			   		:ll_cod_servicio )  
												USING		sqlca;
												commit;
												
												INSERT INTO "DOCUMENTOS"  
															( "FOLIO",  		"TIPO_COB",   	"N_CHEQUE",   	"COD_BANCO",   	"MONTO",   	"FECHA_VENC",   	"COD_PAGO",   "NUM_CHEQUES",   	"REZAGO",   	"FECHA_PAGO",   	"COD_CAJA",   	"ESTADO_CH",   	"GLOSA_CH",   	"FECHA_ESTADO_CH",   	"COD_TARJETA_CREDITO",   	"NRO_CUOTAS_CREDITO",   	"COD_AUTORIZACION_CREDITO",   	"TIPO_TARJETA_CREDITO",   	"COD_TARJETA_DEBITO",   	"COD_AUTORIZACION_DEBITO",   	"COD_BANCO_DEBITO",   	"TRASPADO_PAGO",   	"TIPO_PAGO_TARJETA_CREDITO",   "HORA_PAGO",   	"MINUTO_PAGO",   	"TARJETA_EMPRESA",   	"TIPO_COB_AUX",   	"ESTADO_PAGO_SAP",   	"MONTO_UF",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"SOCIEDAD",   	"TIPO_COB_ORIGINAL",   	"NRO_CUPON" )  	
												VALUES 	( :ll_folio_e,   	'CU',   			999,   			999,   				1,   			:ldt_fecha_pago,  	'EF',   			0,   						' ',   				:ldt_fecha_pago, 	'AI',   				'C',   					'-',   				null,   						null,   								null,   								null,   										null,   								null,   							null,   									null,   							null,   						null,   										:ll_hora_pago,   	:ll_minuto_pago,   	null,   						'BE',   					99,   							1,   					:ldt_fecha_pago,   		'0',   							'N',   					'CL02',   			'BE',   							:ll_folio_e )  ;
												commit;
												
												INSERT INTO "DOCUMENTOS_NEWSING"  
															( "FOLIO",  		"TIPO_COB",   	"N_CHEQUE",   	"COD_BANCO",   	"MONTO",   	"FECHA_VENC",   	"COD_PAGO",   "NUM_CHEQUES",   	"REZAGO",   	"FECHA_PAGO",   	"COD_CAJA",   	"ESTADO_CH",   	"GLOSA_CH",   	"FECHA_ESTADO_CH",   	"COD_TARJETA_CREDITO",   	"NRO_CUOTAS_CREDITO",   	"COD_AUTORIZACION_CREDITO",   	"TIPO_TARJETA_CREDITO",   	"COD_TARJETA_DEBITO",   	"COD_AUTORIZACION_DEBITO",   	"COD_BANCO_DEBITO",   	"TRASPADO_PAGO",   	"TIPO_PAGO_TARJETA_CREDITO",   "HORA_PAGO",   	"MINUTO_PAGO",   	"TARJETA_EMPRESA",   	"TIPO_COB_AUX",   	"ESTADO_PAGO_SAP",   	"MONTO_UF",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO")  	
												VALUES 	( :ll_folio_e,   	'CU',   			999,   			999,   				1,   			:ldt_fecha_pago,  	'EF',   			0,   						' ',   				:ldt_fecha_pago, 	'AI',   				'C',   					'-',   				null,   						null,   								null,   								null,   										null,   								null,   							null,   									null,   							null,   						null,   										:ll_hora_pago,   	:ll_minuto_pago,   	null,   						'BE',   					99,   							1,   					:ldt_fecha_pago,   		'0',   							'N' )  ;
												commit;
												
												INSERT INTO "INGRESO_NEWSING_CABECERA"  
															( "TIPO_COB",  	"FOLIO",   	"FECHA_PAGO",   	"FECHA_PAGO_PALABRA",   	"COD_PARQUE",   	"NRO_CONTRATO",   	"UF_DIA",   	"COD_CAJA",   	"USUARIO",   	"PAGA_CON",   	"VUELTO",   	"PROXIMO_PAGO",   	"MONTO_TOTAL_PALABRA",   	"PAGO_EF",   	"PAGO_CH",   	"PAGO_TC",   	"PAGO_TD",   	"FOLIO_BE",   	"RUT_CLIENTE",   	"REZAGO",   	"NETO",   	"EXENTO",   	"IVA",   	"TOTAL",   	"IP_PRINT",   	"IP_PC",   		"CONEXION",   	"FECHA_FOLIO_ELEC",   	"TIPO_COB_ORIGEN_NE",   	"FOLIO_ORIGEN_NE",   	"FECHA_PAGO_ORIGEN_NE",   	"COD_PARQUE_CTTO" )  	
												VALUES 	( 'CU',   				:ll_folio_e,	:ldt_fecha_pago,   :ls_fecha_palabra,   				150,   				:ls_contrato,   			:gd_uf_dia,	'AI',   				:gs_user,   		'1',   				'0',  				'-',   						'Uno',   								'1',   				'0',   				'0',   				'0',   				null,   			:gi_rut,   			' ',   				0,   			1,   				0,   		1,   			null,   			'10.0.254.17',   :gs_conexion,   :ldt_fecha_pago,   		null,   							null,   						null,   								142 )  ;
												commit;
												
												UPDATE 	"PRODUCTO_ANEXO"  
												SET 		"CUOTAS_PAG" = 1,   
															"TOTAL_PAGADO" = 1  
												WHERE 	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
															( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
															( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) ;
												commit;
	
												UPDATE 	"CUPONERAS_DETALLE"  
												SET 		"ESTADO_PAGO_CUPON" = 'C',   
															"TIPO_COB_PAGO" = 'CU',   
															"FOLIO_PAGO" = :ll_folio_e,   
															"FECHA_PAGO" = :ldt_fecha_pago  
												WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
															( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
															( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
															( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_folio_e )   ;
												commit;
												
												DECLARE sp_nuevo_cadena_mora_g2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
												EXECUTE sp_nuevo_cadena_mora_g2;
											end if
										end if
									end if
								end if
								if ll_cant_benef > 0 and ls_uso='NF' and gs_base='F' then
									ls_graba_servicios								= f_insertar_servicio_producto(gs_base,gs_serie,gi_numero,ll_cod_servicio,ll_cant_benef,ls_moneda_cta_m,ll_valor_cta_m)
									if ls_graba_servicios='N' then
										messagebox("Advertencia","Existe Diferencia en Tabla PRODUCTO_GESTION_SERVICIO (Cantidad de Servicios según Codigo Servicio Funeraria)")
									end if
								end if
								MessageBox("Grabar", "Grabación Exitosa")
								gs_graba_prod															= 'S'
								Setnull(gs_serie);setnull(gi_numero);setnull(gi_rut)
								Setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
								pb_limpiar.triggerevent(clicked!)
								em_numero.setfocus()
								if gs_base='F' or gs_base='G' or gs_base='V' then
									cb_cerrar.triggerevent(clicked!)
									return
								END IF
							ELSE
								wf_comisiones(gs_serie,gi_numero,ldb_porc,ll_plazo)//--nueva comision--
								wf_log_anexo_liberador()		
								ll_plazo																		= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
								ll_rut																			= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_rut')
								ldb_valor_cta																= dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')
								ldt_fec_prim																	= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
								SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cta_m)
								ls_dv																			= TRIM(em_dv.text)
								ll_cod_parque																= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
								ls_moneda																	= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
								SELECT	"CADENA"."ESTADO"  
								INTO 		:ls_estado_cadena  
								FROM 	"CADENA"  
								WHERE	"CADENA"."CODIGO" = :gs_base AND  
											"CADENA"."SERIE" = :gs_serie AND  
											"CADENA"."NUMERO" = :gi_numero   
								USING	sqlca;
								if ls_estado_cadena='V' then
									SELECT	"CUPONERAS"."NUMERO"  
									INTO 		:ll_count_vig  
									FROM 	"CUPONERAS"  
									WHERE	"CUPONERAS"."BASE" = :gs_base AND  
												"CUPONERAS"."SERIE" = :gs_serie AND  
												"CUPONERAS"."NUMERO" = :gi_numero AND  
												"CUPONERAS"."ESTADO_CUPONERA" = 'V'   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										if il_modif > 1 or il_modif_fec > 1 or il_modif_plazo > 1 then
											if il_modif > 1 then
												ls_modif														= 'E'
											elseif il_modif_fec > 1 then
												ls_modif														= 'C'
											elseif il_modif_plazo > 1 then
												ls_modif														= 'P'
											end if
											SELECT	"CADENA_MORA"."FECHA_VENC_MANT"  
											INTO 		:ldt_fec_venc_mant  
											FROM		"CADENA_MORA"  
											WHERE  	"CADENA_MORA"."BASE" = :gs_base AND  
														"CADENA_MORA"."SERIE" = :gs_serie AND  
														"CADENA_MORA"."NUMERO" = :gi_numero   
											USING	sqlca;
											INSERT INTO "CUPONERAS_MODIFICA"  
														( "BASE",		"SERIE",		"NUMERO",	"FECHA_CREA",	"USUARIO",	"DEPTO_SOLICITA",	"ESTADO_REG",	"PLAZO",		"RUT",	"DV",		"VALOR_CUOTA_CRED",	"VALOR_CUOTA_MANT",		"COD_PARQUE",	"FECHA_PRIM",	"FEC_VENC_MANT",	"MONEDA",	"TIPO_MODIFICACION" )
											VALUES	( :gs_base,	:gs_serie,	:gi_numero,	:gdt_fec_sistema,	:gs_user,	:gs_depto,				'V',					:ll_plazo,		:ll_rut,	:ls_dv,	:ldb_valor_cta,				:ldb_valor_cta_m,				:ll_cod_parque,		:ldt_fec_prim,	:ldt_fec_venc_mant,	:ls_moneda,	:ls_modif )  
											USING	sqlca;
											if sqlca.sqlcode=0 then
												commit;
												DECLARE sp_nuevo_cadena_mora3 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
												EXECUTE sp_nuevo_cadena_mora3;
												
												DECLARE sp_proc_modifica_cuponera2 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cta, :ldb_valor_cta_m, :ls_dv, :ll_cod_parque, :ldt_fec_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
												EXECUTE sp_proc_modifica_cuponera2;
												
												ldb_tasa_12				= (ldb_tasa / 100) * 12
												DECLARE SP_DESARROLLO_CUOTA3 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa_12, :ldb_valor_cta, :ldb_gastos_adm, :ldt_fec_prim, :ls_moneda, :ldb_tasa_int_cta);
												EXECUTE SP_DESARROLLO_CUOTA3;
											else
												rollback;
											end if
										else
											ldb_tasa_12				= (ldb_tasa / 100) * 12
											DECLARE SP_DESARROLLO_CUOTA33 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa_12, :ldb_valor_cta, :ldb_gastos_adm, :ldt_fec_prim, :ls_moneda, :ldb_tasa_int_cta);
											EXECUTE SP_DESARROLLO_CUOTA33;
										end if
									elseif sqlca.sqlcode=100 then
										DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
										EXECUTE sp_nuevo_cadena_mora2;
										
										DECLARE sp_proc_genera_cuponera2 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cta, :ldb_valor_cta_m, :ls_dv, :ll_cod_parque, :ldt_fec_prim, :ldt_fec_venc_mant, :ls_moneda );
										EXECUTE sp_proc_genera_cuponera2;
										
										ldb_tasa_12				= (ldb_tasa / 100) * 12
										DECLARE SP_DESARROLLO_CUOTA22 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa_12, :ldb_valor_cta, :ldb_gastos_adm, :ldt_fec_prim, :ls_moneda, :ldb_tasa_int_cta);
										EXECUTE SP_DESARROLLO_CUOTA22;
									end if
									if ll_graba_dacion > 0 then
										SELECT 	Count("INGRESO"."TIPO_COB")
										INTO 		:ll_count_pago_novacion  
										FROM 	"INGRESO"  
										WHERE 	( "INGRESO"."BASE" = :gs_base ) AND  
													( "INGRESO"."SERIE" = :gs_serie ) AND  
													( "INGRESO"."CONTRATO" = :gi_numero ) AND  
													( "INGRESO"."TIPO_MOV" = 'E' ) AND  
													( "INGRESO"."CODIGO_OTRO" = '0' ) AND  
													( "INGRESO"."PAGO_HIST" = 'A' )   ;
										if isnull(ll_count_pago_novacion) then ll_count_pago_novacion=0
										if ll_count_pago_novacion = 0 then
											if ll_cod_servicio= 400 or ll_cod_servicio= 401 or ll_cod_servicio= 402 or ll_cod_servicio= 403 then 
												ll_monto_peso		= round(ldb_precio * ldb_uf_dia,0)
												ll_monto_dscto		= (ll_monto_peso - 1) * -1
												ls_fecha_palabra	= f_retorna_fecha_palabra(date(ldt_fecha_pago))
												ls_contrato			= gs_base+gs_serie+string(gi_numero,'##################')
												SELECT 	MIN("CUPONERAS_DETALLE"."NRO_CUPON")
												INTO 		:ll_folio_e  
												FROM 	"CUPONERAS",   "CUPONERAS_DETALLE"  
												WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
															( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
															( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
															( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
															( ( "CUPONERAS"."BASE" = :gs_base ) AND  
															( "CUPONERAS"."SERIE" = :gs_serie ) AND  
															( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
															( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) )   ;
												if ll_folio_e > 0 then
													INSERT INTO "INGRESO"  
																( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"NRO_CUPON",   	"TIPO_COB_ORIGINAL",   	"CODIGO_SERVICIO" )  	
													VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'E',   				:ll_monto_peso,   	1,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'0',   						null,   				null,   									142,   				0,   					99,   							1,   							:ls_moneda,   		:ldb_precio,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   					:ll_folio_e,   		'BE',   							:ll_cod_servicio )  
													USING		sqlca;
													commit;
													
													INSERT INTO "INGRESO"  
																( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"NRO_CUPON",   	"TIPO_COB_ORIGINAL",   	"CODIGO_SERVICIO" )  	
													VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'S',   				:ll_monto_dscto,   	0,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'165',   					null,   				null,   									142,   				0,   					99,   							0,   							'1',   					:ll_monto_dscto,   	'N',   					:ldt_fecha_pago,   		'0',   							'N',   					:ll_folio_e,   		'BE',   							:ll_cod_servicio )  
													USING		sqlca;
													commit;
													
													INSERT INTO "INGRESO_NEWSING"  
																( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   	"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"CODIGO_SERVICIO" )  	
													VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'E',   				:ll_monto_peso,   	1,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'0',   						null,   				null,   									142,   				0,   					99,   							0,   							:ls_moneda,   		:ldb_precio,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   			   		:ll_cod_servicio )  
													USING		sqlca;
													commit;
													
													INSERT INTO "INGRESO_NEWSING"  
																( "FOLIO",  	"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",  	"MONTO",   			"CUOTAS_PAG",   	"SERIE",   	"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   	"RUT",   	"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   	"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   	"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   		"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"CODIGO_SERVICIO" )  	
													VALUES 	( :ll_folio_e,	'CU',   			:ldt_fecha_pago,	'S',   				:ll_monto_dscto,   	0,   					:gs_serie,   :gi_numero,   		'AI', 				' ',   				:gd_uf_dia,   	'A',   					:gs_base,   	:gi_rut,	:gs_user,   		null,   			null,   				null,   					null,   						'CL02',   			null,   				null,   			null,   			'165',   					null,   				null,   									142,   				0,   					99,   							0,   							'1',   					:ll_monto_dscto,   		'N',   					:ldt_fecha_pago,   		'0',   							'N',   			   		:ll_cod_servicio )  
													USING		sqlca;
													commit;
													
													INSERT INTO "DOCUMENTOS"  
																( "FOLIO",  		"TIPO_COB",   	"N_CHEQUE",   	"COD_BANCO",   	"MONTO",   	"FECHA_VENC",   	"COD_PAGO",   "NUM_CHEQUES",   	"REZAGO",   	"FECHA_PAGO",   	"COD_CAJA",   	"ESTADO_CH",   	"GLOSA_CH",   	"FECHA_ESTADO_CH",   	"COD_TARJETA_CREDITO",   	"NRO_CUOTAS_CREDITO",   	"COD_AUTORIZACION_CREDITO",   	"TIPO_TARJETA_CREDITO",   	"COD_TARJETA_DEBITO",   	"COD_AUTORIZACION_DEBITO",   	"COD_BANCO_DEBITO",   	"TRASPADO_PAGO",   	"TIPO_PAGO_TARJETA_CREDITO",   "HORA_PAGO",   	"MINUTO_PAGO",   	"TARJETA_EMPRESA",   	"TIPO_COB_AUX",   	"ESTADO_PAGO_SAP",   	"MONTO_UF",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO",   	"SOCIEDAD",   	"TIPO_COB_ORIGINAL",   	"NRO_CUPON" )  	
													VALUES 	( :ll_folio_e,   	'CU',   			999,   			999,   				1,   			:ldt_fecha_pago,  	'EF',   			0,   						' ',   				:ldt_fecha_pago, 	'AI',   				'C',   					'-',   				null,   						null,   								null,   								null,   										null,   								null,   							null,   									null,   							null,   						null,   										:ll_hora_pago,   	:ll_minuto_pago,   	null,   						'BE',   					99,   							1,   					:ldt_fecha_pago,   		'0',   							'N',   					'CL02',   			'BE',   							:ll_folio_e )  ;
													commit;
													
													INSERT INTO "DOCUMENTOS_NEWSING"  
																( "FOLIO",  		"TIPO_COB",   	"N_CHEQUE",   	"COD_BANCO",   	"MONTO",   	"FECHA_VENC",   	"COD_PAGO",   "NUM_CHEQUES",   	"REZAGO",   	"FECHA_PAGO",   	"COD_CAJA",   	"ESTADO_CH",   	"GLOSA_CH",   	"FECHA_ESTADO_CH",   	"COD_TARJETA_CREDITO",   	"NRO_CUOTAS_CREDITO",   	"COD_AUTORIZACION_CREDITO",   	"TIPO_TARJETA_CREDITO",   	"COD_TARJETA_DEBITO",   	"COD_AUTORIZACION_DEBITO",   	"COD_BANCO_DEBITO",   	"TRASPADO_PAGO",   	"TIPO_PAGO_TARJETA_CREDITO",   "HORA_PAGO",   	"MINUTO_PAGO",   	"TARJETA_EMPRESA",   	"TIPO_COB_AUX",   	"ESTADO_PAGO_SAP",   	"MONTO_UF",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO")  	
													VALUES 	( :ll_folio_e,   	'CU',   			999,   			999,   				1,   			:ldt_fecha_pago,  	'EF',   			0,   						' ',   				:ldt_fecha_pago, 	'AI',   				'C',   					'-',   				null,   						null,   								null,   								null,   										null,   								null,   							null,   									null,   							null,   						null,   										:ll_hora_pago,   	:ll_minuto_pago,   	null,   						'BE',   					99,   							1,   					:ldt_fecha_pago,   		'0',   							'N' )  ;
													commit;
													
													INSERT INTO "INGRESO_NEWSING_CABECERA"  
																( "TIPO_COB",  	"FOLIO",   	"FECHA_PAGO",   	"FECHA_PAGO_PALABRA",   	"COD_PARQUE",   	"NRO_CONTRATO",   	"UF_DIA",   	"COD_CAJA",   	"USUARIO",   	"PAGA_CON",   	"VUELTO",   	"PROXIMO_PAGO",   	"MONTO_TOTAL_PALABRA",   	"PAGO_EF",   	"PAGO_CH",   	"PAGO_TC",   	"PAGO_TD",   	"FOLIO_BE",   	"RUT_CLIENTE",   	"REZAGO",   	"NETO",   	"EXENTO",   	"IVA",   	"TOTAL",   	"IP_PRINT",   	"IP_PC",   		"CONEXION",   	"FECHA_FOLIO_ELEC",   	"TIPO_COB_ORIGEN_NE",   	"FOLIO_ORIGEN_NE",   	"FECHA_PAGO_ORIGEN_NE",   	"COD_PARQUE_CTTO" )  	
													VALUES 	( 'CU',   				:ll_folio_e,	:ldt_fecha_pago,   :ls_fecha_palabra,   				150,   				:ls_contrato,   			:gd_uf_dia,	'AI',   				:gs_user,   		'1',   				'0',  				'-',   						'Uno',   								'1',   				'0',   				'0',   				'0',   				null,   			:gi_rut,   			' ',   				0,   			1,   				0,   		1,   			null,   			'10.0.254.17',   :gs_conexion,   :ldt_fecha_pago,   		null,   							null,   						null,   								142 )  ;
													commit;
													
													UPDATE 	"PRODUCTO_ANEXO"  
													SET 		"CUOTAS_PAG" = 1,   
																"TOTAL_PAGADO" = 1  
													WHERE 	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
																( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
																( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) ;
													commit;
		
													UPDATE 	"CUPONERAS_DETALLE"  
													SET 		"ESTADO_PAGO_CUPON" = 'C',   
																"TIPO_COB_PAGO" = 'CU',   
																"FOLIO_PAGO" = :ll_folio_e,   
																"FECHA_PAGO" = :ldt_fecha_pago  
													WHERE 	( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
																( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
																( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
																( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_folio_e )   ;
													commit;
													
													DECLARE sp_nuevo_cadena_mora_g3 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
													EXECUTE sp_nuevo_cadena_mora_g3;
												end if
											end if
										end if
									end if
								end if
								if ll_cant_benef > 0 and ls_uso='NF' and gs_base='F' then
									ls_graba_servicios								= f_insertar_servicio_producto(gs_base,gs_serie,gi_numero,ll_cod_servicio,ll_cant_benef,ls_moneda_cta_m,ll_valor_cta_m)
									if ls_graba_servicios='N' then
										messagebox("Advertencia","Existe Diferencia en Tabla PRODUCTO_GESTION_SERVICIO (Cantidad de Servicios según Codigo Servicio Funeraria)")
									end if
								end if
								MessageBox("Grabar", "Grabación Exitosa")
								gs_graba_prod															= 'S'
								Setnull(gs_serie);setnull(gi_numero);setnull(gi_rut)
								Setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
								pb_limpiar.triggerevent(clicked!)
//								em_numero.setfocus()
								em_serie.setfocus()
								if gs_base='F' or gs_base='G' or gs_base='V' then
									cb_cerrar.triggerevent(clicked!)
									return
								end if
							END IF
						else
							messagebox("Error","Error Grabar SQL: "+sqlca.sqlerrtext)
							rollback using sqlca;
						end if
					ELSE
						RollBack using SQLCA;
						messagebox("Error","Error Grabar SQL: "+sqlca.sqlerrtext)
					END IF
				else
					if ll_cant_benef > 0 and ls_uso='NF' and gs_base='F' then
						ls_graba_servicios								= f_insertar_servicio_producto(gs_base,gs_serie,gi_numero,ll_cod_servicio,ll_cant_benef,ls_moneda_cta_m,ll_valor_cta_m)
						if ls_graba_servicios='N' then
							messagebox("Advertencia","Existe Diferencia en Tabla PRODUCTO_GESTION_SERVICIO (Cantidad de Servicios según Codigo Servicio Funeraria)")
						end if
					end if
				end if //ls_graba
			END IF
		else
			messagebox("Advertencia","La Tasa es: "+string(ldb_tasa)+", debe ser Mayor o Igual a 0 y Menor a 10")
		end if
	end if
else
	em_numero.setfocus()
end if
end event

type st_5 from statictext within w_ingresar_funeraria
integer x = 1746
integer y = 68
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

type em_dv from editmask within w_ingresar_funeraria
integer x = 2240
integer y = 228
integer width = 101
integer height = 92
integer taborder = 40
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
	dw_anexo_funeraria.setitem(1,'estado_rut',1)
	cb_aceptar.enabled 				= false
	this.setfocus()
	em_rut.Setfocus()
else
	dw_anexo_funeraria.setitem(1,'estado_rut',0)
	cb_aceptar.enabled 				= true
end if

if is_pasa = 'S' then
	is_pasa								= 'N'
	em_dv.triggerevent(modified!)
	dw_jefe.setfocus()
end if
end event

type st_4 from statictext within w_ingresar_funeraria
integer x = 2208
integer y = 244
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
boolean focusrectangle = false
end type

type em_rut from editmask within w_ingresar_funeraria
integer x = 1838
integer y = 228
integer width = 357
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

event modified;Long		ll_cant,ll_fila,ll_resp,ll_estado
String	ls_null,ls_dv,ls_string,ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_descrip,ls_pasa
Date		ld_null
Double	ld_valor_uf

gs_base 													= em_base.Text
gs_serie 													= em_serie.Text
gi_numero 												= Double(em_numero.text)
gi_rut														= Long(em_rut.text)
gs_dv 													= em_dv.Text
if gi_rut>0 then
	em_dv.text											= ''
	ll_cant												= dw_clientes.Retrieve(gi_rut)
	if ll_cant = 0 THEN
		dw_clientes.insertrow(0)
		ll_resp 											= MessageBox("Advertencia", "Cliente NO Existe, desea Ingresarlo", Exclamation!, YesNo!, 2)
		if ll_resp = 1 THEN
			ls_string										= 'N'+'~t'+string(il_tipo_cliente)
			if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
			cb_aceptar.enabled						= true
		else
			em_rut.text									= ''
			em_dv.text									= ''
			em_rut.enabled							= true
			em_dv.enabled								= true
			em_rut.setfocus()
			cb_aceptar.enabled							= true
		end if
	else
		cb_aceptar.enabled							= true
		dw_anexo_funeraria.enabled				= true
		dw_anexo_funeraria.setitem(1,'producto_anexo_rut',gi_rut)
		if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
			isnull(dw_jefe.getitemstring(1,'jefes')) then
			dw_anexo_funeraria.setitem(1,'estado_rut',1)
		else
			dw_anexo_funeraria.setitem(1,'estado_rut',0)
		end if
		dw_anexo_funeraria.setitem(1,'dv',dw_clientes.getitemstring(1,'dv'))	
		em_dv.text										= dw_clientes.getitemstring(1,'dv')
		dw_clientes.enabled							= true
		dw_agente.enabled							= true
		dw_supervisor.enabled						= true
		dw_jefe.enabled								= true
		dw_seguro.enabled							= true
		if not isnull(gs_age) and gs_age<>'' then 
			is_pasa_asigna								= 'S'
			dw_agente.triggerevent(itemchanged!)
		end if
		dw_agente.setfocus()
	end if
	if gs_nueva_oferta='S' then
		if gi_numero >= gi_prim_nro_L_cd then //gi_prim_nro_L_cd >= gi_numero
			SELECT	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"COD_PARQUE",	"ULT_ESTADO"  
			INTO 		:ls_cod_age,		:ls_cod_sup,			:ls_cod_jefe,			:gl_cod_parque,	:ll_estado
			FROM		"CD_FOLIO"  
			WHERE	"CD_FOLIO"."BASE" = :gs_base AND  
						"CD_FOLIO"."SERIE" = :gs_serie AND  
					 	"CD_FOLIO"."NUMERO" = :gi_numero 
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ls_cod_age) and ls_cod_age<>'' then
					SELECT	"DESCRIPCION"  
					INTO 		:ls_descrip  
					FROM 	"CD_ESTADO"  
					WHERE	"CD_ESTADO"."CODIGO" = :ll_estado ;
					if ll_estado<>9 then 
						messagebox( "Advertencia","Anexo Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+&
										', NO es posible Asignar por encontrarse en ESTADO: '+string(ll_estado)+'-'+ls_descrip)
						dw_agente.enabled					= false
						dw_supervisor.enabled				= false
						dw_jefe.enabled						= false
						dw_anexo_funeraria.enabled		= false
						dw_seguro.enabled					= false
						pb_limpiar.triggerevent(clicked!)
					else
						dw_agente.enabled					= True
						dw_supervisor.enabled				= True
						dw_jefe.enabled						= True
						dw_anexo_funeraria.enabled		= true
						dw_seguro.enabled					= True
						dw_agente.setitem(1,'agente',ls_cod_age)
						dw_supervisor.setitem(1,'supervisores',ls_cod_sup)
						dw_jefe.setitem(1,'jefes',ls_cod_jefe)
						dw_agente.accepttext()
						if isnull(gs_age) or gs_age='' then dw_agente.triggerevent(itemchanged!)
					end if
				end if
			end if
		end if
		dw_agente.setfocus()
	else
		dw_anexo_funeraria.setfocus()
	end if
	dw_clientes.Object.DataWindow.ReadOnly			= "No"
else
	ls_dv															= dw_clientes.getitemstring(1,'dv')
	em_dv.text													= ls_dv
	dw_anexo_funeraria.setitem(1,"producto_anexo_rut",gi_rut)
	dw_anexo_funeraria.setitem(1,"producto_anexo_serie",gs_serie)
	dw_anexo_funeraria.setitem(1,"producto_anexo_numero",gi_numero)
	dw_anexo_funeraria.setitem(1,"producto_anexo_fecha_ingreso",id_fecha_dia)
	dw_anexo_funeraria.setitem(1,"producto_pago_fecha",id_fecha_dia)
	dw_anexo_funeraria.setitem(1,"producto_anexo_cod_agente",gs_age)
	dw_anexo_funeraria.setitem(1,"producto_anexo_cod_super",gs_sup)
	dw_anexo_funeraria.setitem(1,"producto_anexo_cod_jefe",gs_jefe)
	dw_anexo_funeraria.setitem(1,"producto_anexo_ult_folio",0)
	if isnull(dw_anexo_funeraria.getitemstring(1,"producto_pago_usuario_crea")) then dw_anexo_funeraria.setitem(1,"producto_pago_usuario_crea",gs_user)
	Setnull(ls_null);setnull(ld_null)
	
	dw_anexo_funeraria.setitem(1,"producto_pago_base",gs_base)
	dw_anexo_funeraria.setitem(1,"producto_pago_serie",gs_serie)
	dw_anexo_funeraria.setitem(1,"producto_pago_numero",gi_numero)
	dw_anexo_funeraria.setitem(1,"producto_pago_folio",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_precio",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_pie",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_fecha_pie",id_fecha_dia)
	dw_anexo_funeraria.setitem(1,"producto_pago_plazo",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_valor_cuota",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_tasa",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_fecha_prim",id_fecha_dia)
	dw_anexo_funeraria.setitem(1,"producto_pago_uf_dia",gd_uf_dia)
	dw_anexo_funeraria.setitem(1,"producto_pago_moneda",ls_null)
	dw_anexo_funeraria.setitem(1,"producto_pago_fecha_ult", gd_uf_dia)
	dw_anexo_funeraria.setitem(1,"producto_pago_gasto_adm",0)
	dw_anexo_funeraria.setitem(1,"producto_pago_fecha",id_fecha_dia)
	dw_anexo_funeraria.setitem(1,"producto_pago_pie_pagado", 0)
	
//	dw_anexo_funeraria.setitem(1,"producto_pago_ctas_pie_plazo", 0)
//	dw_anexo_funeraria.setitem(1,"producto_pago_ctas_pie_pagadas", 0)
//	dw_anexo_funeraria.setitem(1,"producto_pago_codigo_servicio", 0)
//	dw_anexo_funeraria.setitem(1,"producto_pago_fecha_pie_prim",0)
//	dw_anexo_funeraria.setitem(1,"producto_pago_usuario_crea", 0)
		
//	dw_anexo_funeraria.setitem(1,"pago_liberador_fecha_mod", id_fecha_dia)
//	dw_anexo_funeraria.setitem(1,"pago_liberador_modificado",gs_user)
	
	dw_clientes.enabled										= true
	dw_agente.enabled										= true
	dw_supervisor.enabled									= true
	dw_jefe.enabled											= true
	dw_seguro.enabled										= true
	dw_clientes.Object.DataWindow.ReadOnly			= "No"
	dw_agente.setfocus()
end if



end event

type st_3 from statictext within w_ingresar_funeraria
integer x = 1701
integer y = 244
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

type st_2 from statictext within w_ingresar_funeraria
integer x = 1102
integer y = 244
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

type em_numero from editmask within w_ingresar_funeraria
integer x = 1344
integer y = 228
integer width = 329
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

event modified;string		ls_estado,ls_descrip,ls_respuesta,ls_serie_aux,ls_moneda,ls_forma_pago,ls_area,ls_uso,ls_origen_venta,ls_fecha
long 		ll_count_reg,ll_cant,ll_cant_benef,ll_resp,ll_estado,ll_ult_estado,ll_cod_parque,ll_plazo,ll_cod_servicio,ll_tipo_beneficio,ll_tipo_producto,ll_capacidad
double 	ld_valor_uf,ldb_pie,ldb_precio,ldb_gasto_adm,ldb_saldo_financiar,ldb_valor_cuota,ldb_precio_ctto,ldb_factor,ldb_precio_venta_rev
datetime	ldt_fecha_ctto,ldt_fecha_prim,ldt_ult_fecha

if is_pasa = 'N' then
	SetNull(gs_age);Setnull(gs_sup);Setnull(gs_jefe);setnull(gi_rut);setnull(gi_numero);idb_suma=0
end if
gs_base 											= trim(em_base.Text)
gs_serie 											= trim(em_serie.Text)
gi_numero 										= Double(trim(em_numero.text))	
if gi_numero>0 then
	dw_anexo_funeraria.setitem(1,'valor_iva',idb_iva)
	dw_anexo_funeraria.setitem(1,'cuota_seguros', 0)
	em_rut.enabled							= true
	em_dv.enabled								= true
	if not isnull(w_validar_promesa_operaciones) then
		SELECT 	"REVISION_CONTRATOS"."CAPACIDAD",	"REVISION_CONTRATOS"."RUT",	"REVISION_CONTRATOS"."DV",  	"REVISION_CONTRATOS"."MONEDA",   	"REVISION_CONTRATOS"."COD_PARQUE",   	"REVISION_CONTRATOS"."FECHA_CTTO",   	"REVISION_CONTRATOS"."FORMA_PAGO",   	"REVISION_CONTRATOS"."AREA",   	"REVISION_CONTRATOS"."USO",   	"REVISION_CONTRATOS"."PIE",   	"REVISION_CONTRATOS"."PLAZO",   	"REVISION_CONTRATOS"."FECHA_PRIM",   	"REVISION_CONTRATOS"."GASTO_ADM",   	"REVISION_CONTRATOS"."PRECIO",   	"REVISION_CONTRATOS"."SALDO_FINANCIAR",   	"REVISION_CONTRATOS"."VALOR_CUOTA",   	"REVISION_CONTRATOS"."PRECIO_CONTRATO",   	"REVISION_CONTRATOS"."FACTOR_CUOTA",   	"REVISION_CONTRATOS"."ORIGEN_VENTA",   	"REVISION_CONTRATOS"."CODIGO_SERVICIO",   	"REVISION_CONTRATOS"."TIPO_BENEFICIARIOS",   	"REVISION_CONTRATOS"."TIPO_PRODUCTO",   	"CD_FOLIO"."COD_AGENTE",   	"CD_FOLIO"."COD_SUPERVISOR",   	"CD_FOLIO"."COD_JEFE_VENTA",   	"CD_FOLIO"."ULT_ESTADO",	"REVISION_CONTRATOS"."PRECIO_VENTA"
		INTO 		:ll_capacidad,									:gi_rut,   								:gs_dv,   								:ls_moneda,   									:ll_cod_parque,   										:ldt_fecha_ctto,   										:ls_forma_pago,   										:ls_area,   									:ls_uso,   									:ldb_pie,   								:ll_plazo,   									:ldt_fecha_prim,   									:ldb_gasto_adm,   								:ldb_precio,   									:ldb_saldo_financiar,   									:ldb_valor_cuota,   									:ldb_precio_ctto,   											:ldb_factor,   												:ls_origen_venta,   									:ll_cod_servicio,   											:ll_tipo_beneficio,   											:ll_tipo_producto,   										:gs_age,   							:gs_sup,   									:gs_jefe,   									:ll_ult_estado,						:ldb_precio_venta_rev
		FROM 	"REVISION_CONTRATOS",   	"CD_FOLIO"  
		WHERE 	( "REVISION_CONTRATOS"."BASE" = "CD_FOLIO"."BASE" ) and  
					( "REVISION_CONTRATOS"."SERIE" = "CD_FOLIO"."SERIE" ) and  
					( "REVISION_CONTRATOS"."NUMERO" = "CD_FOLIO"."NUMERO" ) and  
					( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
					( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
					( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_agente.setitem(1,'agente',gs_age)
			dw_supervisor.setitem(1,'supervisores',gs_sup)
			dw_jefe.setitem(1,'jefes',gs_jefe)
			em_rut.text			= string(gi_rut)
			em_dv.text			= gs_dv
			if idw_detalle2.retrieve(ll_cod_parque,ls_uso,gs_serie,ls_moneda)=0 then
				idw_detalle2.insertrow(0)
			end if
			dw_anexo_funeraria.setitem(1,'producto_pago_fecha',date(gdt_fec_sistema))
			dw_anexo_funeraria.setitem(1,'cadena_cod_parque',ll_cod_parque)
			dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capacidad)
			dw_anexo_funeraria.setitem(1,'producto_anexo_forma_pago',ls_forma_pago)
			dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
			dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
			dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_beneficio)
			dw_anexo_funeraria.setitem(1,'producto_pago_moneda',ls_moneda)
			dw_anexo_funeraria.setitem(1,'producto_pago_precio',ldb_precio)
			dw_anexo_funeraria.setitem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
			dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie)
			dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie * idb_iva)
			if ldb_pie > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',date(gdt_fec_sistema))
			end if
			dw_anexo_funeraria.setitem(1,'producto_pago_plazo',ll_plazo)
			dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',ldt_fecha_prim)
			dw_anexo_funeraria.setitem(1,'producto_pago_tasa',ldb_factor)
			dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_factor)
			dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gasto_adm)
			dw_anexo_funeraria.setitem(1,'producto_pago_uf_dia',gd_uf_dia)
			dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cuota)
			dw_anexo_funeraria.setitem(1,'producto_anexo_fecha_ingreso',gdt_fec_sistema)
			ls_fecha			= f_fecha_vcto_prim(  ll_plazo ,  ldt_fecha_prim  )
			if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
			end if
			dw_anexo_funeraria.accepttext()
		end if
		

	end if
	if isnull(gs_age) or gs_age='' or isnull(gs_sup) or gs_sup='' or isnull(gs_jefe) or gs_jefe='' then
		SELECT	"COD_AGENTE",	"COD_SUPER",	"COD_JEFE"  
		INTO		:gs_age,				:gs_sup,			:gs_jefe  
		FROM		"PRODUCTO_ANEXO"  
		WHERE	( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
					( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
					( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero )   ;
	end if
	if gi_numero >= gi_prim_prod_funer_cd and gi_prim_prod_funer_cd>0 then
		SELECT	"ULT_ESTADO",	"COD_PARQUE"
		INTO 		:ll_estado,			:gl_cod_parque
		FROM		"CD_FOLIO"  
		WHERE	( "CD_FOLIO"."BASE" = :gs_base ) AND  
					( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
					( "CD_FOLIO"."NUMERO" = :gi_numero )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			SELECT	"CD_ESTADO"."DESCRIPCION"  
			INTO 		:ls_descrip  
			FROM 	"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   ;
			if ll_estado<>9 and ll_estado<>11 then
				if ll_estado=11 then
					is_pasa_asigna							= 'N'
					if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
						wf_mostrar_producto()
						wf_buscar_seguro(gs_base,gs_serie,gi_numero);
						gs_nueva_oferta					= 'N'
						dw_anexo_funeraria.setitem(1,'estado_rut',0)
						dw_anexo_funeraria.setitem(1,'estado_contrato',0)
						dw_agente.setitem(1,'agente',gs_age)
						dw_supervisor.setitem(1,'supervisores',gs_sup)
						dw_jefe.setitem(1,'jefes',gs_jefe)
						dw_agente.setfocus()
					else
						wf_nuevo_producto()
						gs_nueva_oferta					= 'S'
					end if
				elseif ll_estado=9 then
					if gs_serie = is_serie2 THEN
						is_pasa_asigna						= 'N'
						if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
							wf_mostrar_producto()
							wf_buscar_seguro(gs_base,gs_serie,gi_numero);
							gs_nueva_oferta				= 'N'
							dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
							dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
							dw_agente.setfocus()
						else
							wf_nuevo_producto()
							gs_nueva_oferta				= 'S'
						end if
						dw_anexo_funeraria.accepttext()
						dw_agente.setitem(1,'agente',gs_age)
						dw_supervisor.setitem(1,'supervisores',gs_sup)
						dw_jefe.setitem(1,'jefes',gs_jefe)
					Else
						cb_aceptar.text						= "Ingresar"
						ll_resp								= MessageBox("Advertencia Asignación Producto", "Producto NO asignado, desea Ingresarlo",Exclamation!, YesNo!, 2)
						if ll_resp = 1 THEN
							gs_nueva_oferta				= 'S'
							is_pasa_asigna					= 'S'
							wf_limpiar()
							em_rut.enabled				= true
							em_dv.enabled					= true
							dw_agente.enabled			= true
							dw_supervisor.enabled		= true
							dw_jefe.enabled				= true
							dw_seguro.enabled			= true
							dw_agente.reset()
							dw_supervisor.reset()
							dw_jefe.reset()
							dw_agente.insertrow(0)
							dw_supervisor.insertrow(0)
							dw_jefe.insertrow(0)
							em_rut.text						= ''
							em_dv.text						= ''
							em_rut.setfocus()
						else
							dw_clientes.enabled			= false
							dw_agente.enabled			= false
							dw_supervisor.enabled		= false
							dw_jefe.enabled				= false
							dw_seguro.enabled			= false
							em_rut.text						= ''
							em_dv.text						= ''
							gs_nueva_oferta				= 'N'
							is_pasa_asigna					= 'N'
							em_rut.enabled				= false
							em_dv.enabled					= false
							setnull(gi_rut);setnull(gi_numero)
							setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
							wf_limpiar()
							em_serie.setfocus()
						end if
					end if
				else
					messagebox( "Advertencia","Anexo Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+&
									', NO es posible Digitarse por encontrarse en ESTADO: '+string(ll_estado)+'-'+ls_descrip)
					dw_clientes.enabled					= false
					dw_agente.enabled					= false
					dw_supervisor.enabled				= false
					dw_jefe.enabled						= false
					dw_seguro.enabled					= false
					em_rut.text								= ''
					em_dv.text								= ''
					gs_nueva_oferta						= 'N'
					is_pasa_asigna							= 'N'
					em_rut.enabled						= false
					em_dv.enabled							= false
					setnull(gi_rut);setnull(gs_serie);setnull(gi_numero)
					setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
					
					wf_limpiar()
					em_serie.setfocus()
				end if
			elseif isnull(ll_estado) then
				is_pasa_asigna								= 'N'
				if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
					wf_mostrar_producto()
					wf_buscar_seguro(gs_base,gs_serie,gi_numero);
					gs_nueva_oferta						= 'N'
					dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
					dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
					dw_agente.setfocus()
				END IF
				dw_anexo_funeraria.accepttext()
				dw_agente.setitem(1,'agente',gs_age)
				dw_supervisor.setitem(1,'supervisores',gs_sup)
				dw_jefe.setitem(1,'jefes',gs_jefe)
				if not isnull(gs_age) and gs_age<>'' then is_sw_age='S'
			else
				if not isnull(gs_serie) and gs_serie<>'' and gi_numero>0 and not isnull(gi_numero) then
					is_pasa_asigna							= 'N'
					if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
						wf_mostrar_producto()
						wf_buscar_seguro(gs_base,gs_serie,gi_numero);
						gs_nueva_oferta					= 'N'
						dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
						dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
						dw_agente.setfocus()
					else
						wf_nuevo_producto()
						gs_nueva_oferta					= 'S'
					END IF
					dw_anexo_funeraria.accepttext()
					dw_agente.setitem(1,'agente',gs_age)
					dw_supervisor.setitem(1,'supervisores',gs_sup)
					dw_jefe.setitem(1,'jefes',gs_jefe)
				end if
			end if
		else
			SELECT	"PRODUCTO_ANEXO"."SERIE",	"PRODUCTO_ANEXO"."COD_AGENTE",	"PRODUCTO_ANEXO"."COD_SUPER",	"PRODUCTO_ANEXO"."COD_JEFE"  
			INTO		:ls_serie_aux,						:gs_age,											:gs_sup,										:gs_jefe  
			FROM 	"PRODUCTO_ANEXO","CADENA","PRODUCTO_PAGO"  
			WHERE	"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
						"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
						"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
						"PRODUCTO_ANEXO"."BASE" = "CADENA"."CODIGO" and  
						"PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" and  
						"PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" and  
						"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
						"PRODUCTO_ANEXO"."NUMERO" = :gi_numero AND  
						"CADENA"."CODIGO" = :gs_base
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero) > 0 then
					dw_agente.setitem(1,'agente',gs_age)
					dw_supervisor.setitem(1,'supervisores',gs_sup)
					dw_jefe.setitem(1,'jefes',gs_jefe)
					wf_mostrar_producto()
					wf_buscar_seguro(gs_base,gs_serie,gi_numero);
					gs_nueva_oferta			= 'N'
					dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
					dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
					dw_anexo_funeraria.accepttext()
					dw_agente.setfocus()
				end if
			else
				SELECT	"CD_FOLIO"."ULT_ESTADO"  
				INTO 		:ll_ult_estado  
				FROM 	"CD_FOLIO"  
				WHERE 	( "CD_FOLIO"."BASE" = :gs_base ) AND  
							( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
							( "CD_FOLIO"."NUMERO" = :gi_numero )   
				USING	sqlca;
				if sqlca.sqlcode<>0 then 
					OpenWithParm(w_verificar_contrato, gs_base+'~t'+gs_serie+'~t'+string(gi_numero))
					ls_respuesta										= Message.StringParm
				end if				
				if ls_respuesta='S' then
					if not isnull(gs_serie) and gs_serie<>'' and gi_numero>0 and not isnull(gi_numero) then
						is_pasa_asigna									= 'N'
						if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
							wf_mostrar_producto()
							wf_buscar_seguro(gs_base,gs_serie,gi_numero);
							gs_nueva_oferta							= 'N'
							dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
							dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
							dw_agente.setitem(1,'agente',gs_age)
							dw_supervisor.setitem(1,'supervisores',gs_sup)
							dw_jefe.setitem(1,'jefes',gs_jefe)
							dw_agente.setfocus()
						else
							pb_limpiar.triggerevent(clicked!)
							messagebox("Advertencia","Anexo Producto "+gs_base+' - '+gs_serie+ ' - '+string(gi_numero,"###,###,###,###,###")+" Inexistente")
						end if
					else
						pb_limpiar.triggerevent(clicked!)
						messagebox("Advertencia","Anexo Producto "+gs_base+' - '+gs_serie+ ' - '+string(gi_numero,"###,###,###,###,###")+" Inexistente")
					end if
				else
					pb_limpiar.triggerevent(clicked!)
				end if	
			end if
		end if
	else
		SELECT	"PRODUCTO_ANEXO"."SERIE",	"PRODUCTO_ANEXO"."COD_AGENTE",	"PRODUCTO_ANEXO"."COD_SUPER",	"PRODUCTO_ANEXO"."COD_JEFE"  
		INTO		:ls_serie_aux,						:gs_age,											:gs_sup,										:gs_jefe  
		FROM 	"PRODUCTO_ANEXO","CADENA","PRODUCTO_PAGO"  
		WHERE	"PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" and  
					"PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" and  
					"PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" and  
					"PRODUCTO_ANEXO"."SERIE" = "CADENA"."SERIE" and  
					"PRODUCTO_ANEXO"."NUMERO" = "CADENA"."NUMERO" and
					"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
					"PRODUCTO_ANEXO"."NUMERO" = :gi_numero AND  
					"CADENA"."CODIGO" = :gs_base 
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
				dw_agente.setitem(1,'agente',gs_age)
				dw_supervisor.setitem(1,'supervisores',gs_sup)
				dw_jefe.setitem(1,'jefes',gs_jefe)
				wf_mostrar_producto()
				wf_buscar_seguro(gs_base,gs_serie,gi_numero);
				gs_nueva_oferta									= 'N'
				dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
				dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
				dw_anexo_funeraria.accepttext()
				dw_agente.setfocus()
			end if
		else
			SELECT	"CD_FOLIO"."ULT_ESTADO"  
			INTO 		:ll_ult_estado  
			FROM 	"CD_FOLIO"  
			WHERE	"CD_FOLIO"."BASE" = :gs_base AND  
						"CD_FOLIO"."SERIE" = :gs_serie AND  
						"CD_FOLIO"."NUMERO" = :gi_numero    
			USING		sqlca;
			if sqlca.sqlcode<>0 then 
				OpenWithParm(w_verificar_contrato, gs_base+'~t'+gs_serie+'~t'+string(gi_numero))
				ls_respuesta													= Message.StringParm
			end if				
			if ls_respuesta='S' then
				dw_agente.setitem(1,'agente',gs_age)
				dw_supervisor.setitem(1,'supervisores',gs_sup)
				dw_jefe.setitem(1,'jefes',gs_jefe)
				is_pasa_asigna													= 'N'
				if dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
					wf_mostrar_producto()
					wf_buscar_seguro(gs_base,gs_serie,gi_numero);
					gs_nueva_oferta											= 'N'
					dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
					dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
					dw_agente.setfocus()
				else
					wf_nuevo_producto()
					gs_nueva_oferta											= 'S'
				END IF
			else
				pb_limpiar.triggerevent(clicked!)
			end if
		end if
	end if	
end if
dw_anexo_funeraria.setitem(1,'iva_pie',0)
dw_anexo_funeraria.setitem(1,'valor_iva',idb_iva)
dw_anexo_funeraria.setitem(1,'cuota_seguros', 0)
dw_anexo_funeraria.accepttext()
 is_pasa = 'S'
end event

type st_1 from statictext within w_ingresar_funeraria
integer x = 695
integer y = 244
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

type em_serie2 from editmask within w_ingresar_funeraria
event ue_mousemove pbm_dwnmousemove
boolean visible = false
integer x = 539
integer y = 56
integer width = 201
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

event ue_mousemove;st_limpiar.visible				= false
st_grabar.visible				= false
st_salir.visible					= false
st_imprimir.visible				= false
st_buscar.visible				= false
st_help_memo.visible			= false
end event

event losefocus;if isvalid(w_validar_promesa_operaciones) then em_serie.text = gs_serie
end event

type dw_1 from datawindow within w_ingresar_funeraria
boolean visible = false
integer x = 599
integer y = 1964
integer width = 658
integer height = 352
boolean titlebar = true
string dataobject = "dw_rep_impresion_ctta_cte_producto"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_clientes from datawindow within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 27
integer y = 744
integer width = 3351
integer height = 524
string dataobject = "d_ingreso_clientes"
boolean border = false
end type

event ue_mousemove;st_limpiar.visible		= false
st_grabar.visible			= false
st_salir.visible			= false
st_imprimir.visible		= false
st_buscar.visible			= false
st_help_memo.visible		= false
end event

event doubleclicked;String	ls_string
gi_rut				= dw_clientes.getitemnumber(1,'rut')
ls_string			= 'M'+'~t'+string(il_tipo_cliente)
if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
end event

type dw_supervisor from datawindow within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 2523
integer y = 56
integer width = 279
integer height = 92
integer taborder = 60
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

event itemchanged;Long		ll_grabar_1,ll_grabar_2,ll_plazo_rev,ll_cod_parque_rev,ll_rut,ll_resp,ll_cod_servicio,ll_tipo_benef,ll_capac,ll_cta_seg,ll_cod_seg,ll_estado_reg,ll_reg
String		ls_string,ls_obs,ls_tipo_cont,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_jefe,ls_cod_sup,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_aux,ls_uso,ls_origen_venta,ls_fecha
datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf,ldb_monto,&
			ll_numero_asoc,ldb_tasa_base,ldb_precio_venta_rev
			
this.accepttext()
ll_grabar_1	= 0
ll_grabar_2	= 1
ls_cod_sup	= dw_supervisor.getitemstring(1,'supervisores')
if not isnull(ls_cod_sup) then
	if gi_rut>0 then
		is_sw_sup													= 'S'
		gs_base														= trim(em_base.Text)
		gs_serie 														= trim(em_serie.Text)
		if is_pasa_asigna='S' then
			gs_age													= dw_agente.getitemstring(1,'agente')
			gs_sup													= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe													= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_sup) and gs_sup<>'' then
				SELECT	"SUPERVISOR"."COD_JEFE"  
				INTO 		:ls_jefe  
				FROM 	"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if isnull(gs_sup) then
						messagebox("Advertencia","Debe Ingresar Supervisor")
						dw_supervisor.setfocus()
					else
						dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_super",gs_sup)
						dw_anexo_funeraria.accepttext()
						if il_resp_age<>1 then
							if is_sw_sup='S' and not isnull(gs_age) and gs_age<>'' and not isnull(gs_jefe) and gs_jefe<>''then //gs_nueva_oferta='S' and 
								if isvalid(w_validar_promesa_operaciones) then
									il_resp_sup							= 0
								else
									il_resp_sup							= MessageBox("Advertencia", "Está seguro de ASIGNAR Producto Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								end if	
								IF il_resp_sup = 1 THEN
									ls_string								= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										SELECT	"AGENTES"."TIPO_CONT"  
										INTO 		:ls_tipo_cont  
										FROM 	"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age ;
										if ls_tipo_cont = '3' OR ls_tipo_cont = '4' then
											INSERT INTO "COMISION_PROMESA"  
														( "BASE",		"SERIE",		"NUMERO",	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
											VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	0,			0,					0,					0,					0,					0,					0,				0,					0,					0 )  
											USING		sqlca	;
											if sqlca.sqlcode=0 then
												ll_grabar_1	= 1
//													commit;
											else
												ll_grabar_1	= 0
//													rollback;
											end if
										end if
										ls_obs										= 'Producto creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_anexo_funeraria.enabled			= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_anexo_funeraria.setitem(1,'estado_rut',1)
											dw_anexo_funeraria.setitem(1,'estado_contrato',1)
										else
											if gi_rut>0 then
												dw_anexo_funeraria.setitem(1,'estado_rut',0)
												dw_anexo_funeraria.setitem(1,'estado_contrato',0)
											end if
										end if
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 	"CADENA"  
										WHERE  	"CADENA"."CODIGO" = :gs_base AND  
												 	"CADENA"."SERIE" = :gs_serie AND  
												 	"CADENA"."NUMERO" = :gi_numero   
										USING	sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",	"CODIGO_SERVICIO",	"TIPO_BENEFICIARIOS", "USO",	"CAPACIDAD",	0.0001				"ORIGEN_VENTA",		"PRECIO_VENTA"
											INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,	:ll_cod_servicio,		:ll_tipo_benef,				:ls_uso,	:ll_capac,		:ldb_tasa_base,	:ls_origen_venta,		:ldb_precio_venta_rev
											FROM		"REVISION_CONTRATOS"  
											WHERE	"REVISION_CONTRATOS"."BASE" = :gs_base AND  
														"REVISION_CONTRATOS"."SERIE" = :gs_serie AND  
														"REVISION_CONTRATOS"."NUMERO" = :gi_numero AND
													 	("REVISION_CONTRATOS"."ESTADO_REVISION" = 'A'  OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V') 
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_anexo_funeraria.setitem(1,'producto_anexo_base',gs_base)
												dw_anexo_funeraria.setitem(1,'producto_anexo_serie',gs_serie)
												dw_anexo_funeraria.setitem(1,'producto_anexo_numero',gi_numero)
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha',ldt_fecha_ctto_rev)
												dw_anexo_funeraria.setitem(1,'producto_pagor_moneda',ls_moneda_rev)
												dw_anexo_funeraria.setitem(1,'producto_anexo_forma_pago',ls_forma_pago_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie_rev)
												dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie_rev * idb_iva)
												if ldb_pie_rev > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then 
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ldt_fecha_ctto_rev)
												end if
												dw_anexo_funeraria.setitem(1,'producto_pago_plazo',ll_plazo_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gasto_adm_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cuota_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_precio',ldb_precio_ctto_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
												dw_anexo_funeraria.setitem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',ldt_fecha_prim_rev)
												
												if not isnull(ldt_fecha_prim_rev) and not isnull(ll_plazo_rev) and ll_plazo_rev>0 then
													ls_fecha									= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
													if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
														dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
													end if
												end if
												
												
												dw_anexo_funeraria.setitem(1,'estado_contrato',0)
												dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
												dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_benef)
												dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
												dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capac)
												dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_venta',ls_origen_venta)
												
												dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_tasa_base)
												
												SELECT	count("COD_SEGURO")
												INTO		:ll_cta_seg
												FROM		"SEGURO_ASOCIADOS"  
												WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
															"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
															"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
															"SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' 
												USING	sqlca;
												if isnull(ll_cta_seg) or ll_cta_seg=0 then ll_cta_seg=0
												if ll_cta_seg>0 then
													DECLARE x1 CURSOR FOR  
													SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
													FROM 	"SEGURO_ASOCIADOS"  
													WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
																( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
																( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
																( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
													USING	sqlca;
													open x1;
													if sqlca.sqlcode=0 then
														do while sqlca.sqlcode=0
															Fetch x1 into :ll_cod_seg, :ldb_monto, :ll_estado_reg;
															if not isnull(ll_cod_seg) then
																if ll_estado_reg = 0 then
																	ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seg), 1, dw_seguro.RowCount())
																	if ll_reg > 0 then
																		dw_seguro.setitem(ll_reg,'c_estado_reg',0)
																	end if
																end if
															end if
															setnull(ll_cod_seg)
														loop
													end if
													close x1;
													dw_seguro.accepttext()
													dw_seguro.enabled						= true
												end if
												SELECT	"INTERES_PESOS",	"INTERES_UF"
												INTO 		:ldb_int_peso,			:ldb_int_uf
												FROM		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING	sqlca;
												if sqlca.sqlcode=0 then
													if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
														ldb_int_peso						= 0
														ldb_int_uf							= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_uf)
													end if
												end if
											end if
										end if
										dw_anexo_funeraria.setfocus()
										dw_anexo_funeraria.setcolumn('base')
									else
										dw_anexo_funeraria.enabled					= false
										dw_anexo_funeraria.setitem(1,'estado_rut',1)
										dw_anexo_funeraria.setitem(1,'estado_contrato',1)
										messagebox("Advertencia","NO fue Asignado Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
										dw_jefe.setfocus()
									end if
								else
									dw_anexo_funeraria.setitem(1,'estado_rut',1)
									dw_anexo_funeraria.setitem(1,'estado_contrato',1)
								END IF
							end if
						end if
					end if
				else
					messagebox("Advertencia","Supervisor Inexistente")
					dw_supervisor.reset()
					dw_supervisor.insertrow(0)
					dw_supervisor.setfocus()
					gs_sup																	= ''
				end if
			end if
			
		elseif is_pasa_asigna='N' and is_sw_sup='S' then	
			gs_age																			= dw_agente.getitemstring(1,'agente')
			gs_sup																			= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe																			= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_sup) and gs_sup<>'' then
				SELECT	"SUPERVISOR"."COD_JEFE"  
				INTO 		:ls_jefe  
				FROM 	"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if isnull(gs_sup) then
						messagebox("Advertencia","Debe Ingresar Supervisor")
						dw_supervisor.setfocus()
					else
						dw_anexo_funeraria.SetItem(1, "producto_anexo_cod_super", gs_sup)
						dw_anexo_funeraria.accepttext()
						if is_sw_sup='S' and not isnull(gs_age) and gs_age<>'' and not isnull(gs_jefe) and gs_jefe<>'' then//if il_resp_age=2 and is_sw_sup='S' then
							if isvalid (w_validar_promesa_operaciones)  then
								il_resp_sup													= 0
							else
								il_resp_sup													= MessageBox("Advertencia", "Está seguro de ASIGNAR Producto Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
							end if
							IF il_resp_sup = 1 THEN
								ls_string														= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
								openwithparm(w_verificar_datos_contrato,ls_string)
								IF trim(Message.StringParm)='OK' THEN
									SELECT	"AGENTES"."TIPO_CONT"  
									INTO 		:ls_tipo_cont  
									FROM 	"AGENTES"  
									WHERE 	"AGENTES"."COD_AGE" = :gs_age  ;
									if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
										INSERT INTO "COMISION_PROMESA"  
													( "BASE",		"SERIE",		"NUMERO",	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
										VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	0,			0,					0,					0,					0,					0,					0,				0,					0,					0)  
										USING		sqlca	;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs														= 'Producto creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									dw_anexo_funeraria.enabled							= true
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_funeraria.setitem(1,'estado_rut',1)
										dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									else
										if gi_rut>0 then
											dw_anexo_funeraria.setitem(1,'estado_rut',0)
											dw_anexo_funeraria.setitem(1,'estado_contrato',0)
										end if
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM		"CADENA"  
									WHERE	"CADENA"."CODIGO" = :gs_base AND  
												"CADENA"."SERIE" = :gs_serie AND  
												"CADENA"."NUMERO" = :gi_numero   
									USING	sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",	"CODIGO_SERVICIO",	"TIPO_BENEFICIARIOS",	"USO",	"CAPACIDAD",	0.0001				"ORIGEN_VENTA",	"PRECIO_VENTA"
										INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,	:ll_cod_servicio,		:ll_tipo_benef,				:ls_uso,	:ll_capac,		:ldb_tasa_base,	:ls_origen_venta,	:ldb_precio_venta_rev
										FROM		"REVISION_CONTRATOS"  
										WHERE	"REVISION_CONTRATOS"."BASE" = :gs_base AND  
												 	"REVISION_CONTRATOS"."SERIE" = :gs_serie AND  
												 	"REVISION_CONTRATOS"."NUMERO" = :gi_numero AND
												 	("REVISION_CONTRATOS"."ESTADO_REVISION" = 'A'  OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V') 
										USING		sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_funeraria.setitem(1,'producto_anexo_base',gs_base)
											dw_anexo_funeraria.setitem(1,'producto_anexo_serie',gs_serie)
											dw_anexo_funeraria.setitem(1,'producto_anexo_numero',gi_numero)
											dw_anexo_funeraria.setitem(1,'producto_pago_fecha',ldt_fecha_ctto_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_moneda',ls_moneda_rev)
											dw_anexo_funeraria.setitem(1,'producto_anexo_forma_pago',ls_forma_pago_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie_rev)
											dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie_rev * idb_iva)
											if ldb_pie_rev > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then 
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ldt_fecha_ctto_rev)
												end if
											dw_anexo_funeraria.setitem(1,'producto_pago_plazo',ll_plazo_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gasto_adm_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_precio',ldb_precio_ctto_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
											dw_anexo_funeraria.setitem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',ldt_fecha_prim_rev)
											
											if not isnull(ldt_fecha_prim_rev) and not isnull(ll_plazo_rev) and ll_plazo_rev>0 then
												ls_fecha									= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
												if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
												end if
											end if
											
											dw_anexo_funeraria.setitem(1,'estado_contrato',0)
											dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_benef)
											dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
											dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capac)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_venta',ls_origen_venta)
											
											dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_tasa_base)
											
											SELECT	count("COD_SEGURO")
											INTO		:ll_cta_seg
											FROM		"SEGURO_ASOCIADOS"  
											WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
														"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
														"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
														"SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' 
											USING	sqlca;
											if isnull(ll_cta_seg) or ll_cta_seg=0 then ll_cta_seg=0
											if ll_cta_seg>0 then
												DECLARE x2 CURSOR FOR  
												SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
												FROM 	"SEGURO_ASOCIADOS"  
												WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
															( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
												USING	sqlca;
												open x2;
												if sqlca.sqlcode=0 then
													do while sqlca.sqlcode=0
														Fetch x2 into :ll_cod_seg, :ldb_monto, :ll_estado_reg;
														if not isnull(ll_cod_seg) then
															if ll_estado_reg = 0 then
																ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seg), 1, dw_seguro.RowCount())
																if ll_reg > 0 then
																	dw_seguro.setitem(ll_reg,'c_estado_reg',0)
																end if
															end if
														end if
														setnull(ll_cod_seg)
													loop
												end if
												close x2;
												dw_seguro.accepttext()
												dw_seguro.enabled						= true
											end if
											SELECT	"INTERES_PESOS",	"INTERES_UF"
											INTO 		:ldb_int_peso,			:ldb_int_uf
											FROM		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING	sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
													ldb_int_peso								= 0
													ldb_int_uf									= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_uf)
												end if
											end if
										end if
									end if
									dw_anexo_funeraria.setfocus()
								else
									dw_anexo_funeraria.enabled							= false
									dw_anexo_funeraria.setitem(1,'estado_rut',1)
									dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									messagebox("Advertencia","NO fue Re-Asignado Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									dw_jefe.setfocus()
								end if
							else
								dw_anexo_funeraria.setitem(1,'estado_rut',1)
								dw_anexo_funeraria.setitem(1,'estado_contrato',1)
							END IF
						end if
					end if
				else
					messagebox("Advertencia","Supervisor Inexistente")
					dw_supervisor.reset()
					dw_supervisor.insertrow(0)
					dw_supervisor.setfocus()
					gs_sup																		= ''
				end if
			end if
		end if
		if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
			commit using sqlca;
			UPDATE	"PRODUCTO_ANEXO"  
			SET 		"COD_AGENTE" = :gs_age,   
						"COD_SUPER" = :gs_sup,   
						"COD_JEFE" = :gs_jefe  
			WHERE	"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
						"PRODUCTO_ANEXO"."NUMERO" = :gi_numero  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback using sqlca;
		end if
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
is_pasa = 'S'
end event

type dw_agente from datawindow within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
integer x = 1952
integer y = 56
integer width = 279
integer height = 92
integer taborder = 50
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

event itemchanged;Long		ll_resp,ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_rut,ll_cod_servicio,ll_tipo_benef,ll_capac,ll_cta_seg,ll_cod_seg,ll_estado_reg,ll_reg
String		ls_tipo_cont,ls_obs,ls_ok,ls_string,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_sup,ls_cod_age,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_aux,ls_uso,ls_origen_venta,ls_fecha
Datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_uf,ldb_int_peso,ldb_monto,&
			ll_numero_asoc,ldb_tasa_base,ldb_precio_venta_rev

dw_agente.accepttext()
ls_cod_age										= dw_agente.getitemstring(1,'agente')
if not isnull(ls_cod_age) then
	if gi_rut>0 then
		is_sw_age								= 'S'
		gs_base									= trim(em_base.Text)
		gs_serie 									= trim(em_serie.Text)
		if is_pasa_asigna='S' then
			gs_age								= dw_agente.getitemstring(1,'agente')
			gs_sup								= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe								= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_age) and gs_age<>'' then
				if gl_cod_parque=0 or isnull(gl_cod_parque) then
					SELECT	"AGENTES"."COD_SUP",	"AGENTES"."COD_PARQUE"
					INTO 		:ls_sup,						:gl_cod_parque
					FROM		"AGENTES","SUPERVISOR"  
					WHERE	"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
							 	"AGENTES"."COD_AGE" = :gs_age
					USING	sqlca;
				else
					SELECT	"AGENTES"."COD_SUP"
					INTO 		:ls_sup
					FROM 	"AGENTES","SUPERVISOR"  
					WHERE  	"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP"and  
							 	"AGENTES"."COD_AGE" = :gs_age   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					dw_anexo_funeraria.setitem(1,"cadena_cod_parque",gl_cod_parque)
					if isnull(gs_age) then
						messagebox("Advertencia","Debe Ingresar Agente")
						dw_agente.setfocus()
					else
						dw_anexo_funeraria.setitem(1,"producto_anexo_cod_agente", gs_age)
						dw_anexo_funeraria.accepttext()
						if is_sw_age='S' and not isnull(gs_sup) and gs_sup<>'' and gs_jefe<>'' and not isnull(gs_jefe) then //gs_nueva_oferta='S' and 
							if isvalid((w_validar_promesa_operaciones) ) then
								il_resp_age									= 0
							else
								il_resp_age									= MessageBox("Advertencia", "Está seguro de ASIGNAR Producto Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
							end if	
							if il_resp_age = 1 THEN
								ls_string										= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
								openwithparm(w_verificar_datos_contrato,ls_string)
								if trim(Message.StringParm)='OK' THEN
									if gl_cod_parque=0 or isnull(gl_cod_parque) then
										SELECT	"AGENTES"."TIPO_CONT",	"AGENTES"."COD_PARQUE"
										INTO 		:ls_tipo_cont,					:gl_cod_parque
										FROM		"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age ;
									else
										SELECT	"AGENTES"."TIPO_CONT"
										INTO 		:ls_tipo_cont
										FROM 	"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age ;
									end if
									dw_anexo_funeraria.SetItem(1, "cadena_cod_parque", gl_cod_parque)
									if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
										INSERT INTO	"COMISION_PROMESA"  
													( "BASE",		"SERIE",		"NUMERO",		"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
										VALUES	( :gs_base,	:gs_serie,	:gi_numero ,	0,			0,					0,					0,					0,					0,					0,				0,					0,					0 )  
										USING	sqlca	;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs									= 'Producto creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_funeraria.setitem(1,'estado_rut',1)
										dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									else
										if gi_rut>0 then
											dw_anexo_funeraria.setitem(1,'estado_rut',0) 
											dw_anexo_funeraria.setitem(1,'estado_contrato',0)
										end if
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM 	"CADENA"  
									WHERE	"CADENA"."CODIGO" = :gs_base AND  
												"CADENA"."SERIE" = :gs_serie AND  
											 	"CADENA"."NUMERO" = :gi_numero   
									USING	sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",			"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",	"CODIGO_SERVICIO",	"TIPO_BENEFICIARIOS",	"USO",	"CAPACIDAD",	0.0001,				"ORIGEN_VENTA",		"PRECIO_VENTA"
										INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,		:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,	:ll_cod_servicio,		:ll_tipo_benef,				:ls_uso,	:ll_capac,		:ldb_tasa_base,	:ls_origen_venta,		:ldb_precio_venta_rev
										FROM		"REVISION_CONTRATOS"  
										WHERE  	"REVISION_CONTRATOS"."BASE" = :gs_base AND  
												 	"REVISION_CONTRATOS"."SERIE" = :gs_serie AND  
												 	"REVISION_CONTRATOS"."NUMERO" = :gi_numero AND
												 	("REVISION_CONTRATOS"."ESTADO_REVISION" = 'A'  OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V') 
										USING	sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_funeraria.setitem(1,'producto_anexo_base',gs_base)
											dw_anexo_funeraria.setitem(1,'producto_anexo_serie',gs_serie)
											dw_anexo_funeraria.setitem(1,'producto_anexo_numero',gi_numero)
											dw_anexo_funeraria.setitem(1,'producto_pago_fecha',ldt_fecha_ctto_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_moneda',ls_moneda_rev)
											dw_anexo_funeraria.setitem(1,'producto_anexo_forma_pago',ls_forma_pago_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie_rev)
											dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie_rev * idb_iva)
											if ldb_pie_rev > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then 
												dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ldt_fecha_ctto_rev)
											end if
											dw_anexo_funeraria.setitem(1,'producto_pago_plazo',ll_plazo_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gasto_adm_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_precio',ldb_precio_ctto_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
											dw_anexo_funeraria.setitem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',ldt_fecha_prim_rev)
											if not isnull(ldt_fecha_prim_rev) and not isnull(ll_plazo_rev) and ll_plazo_rev>0 then
												ls_fecha									= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
												if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
												end if
											end if
											dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_benef)
											dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
											dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capac)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_venta',ls_origen_venta)
											
											dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_tasa_base)
											
											SELECT	count("COD_SEGURO")
											INTO		:ll_cta_seg
											FROM		"SEGURO_ASOCIADOS"  
											WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
														"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
														"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
														"SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' 
											USING	sqlca;
											if isnull(ll_cta_seg) or ll_cta_seg=0 then ll_cta_seg=0
											if ll_cta_seg>0 then
												DECLARE x1 CURSOR FOR  
												SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
												FROM 	"SEGURO_ASOCIADOS"  
												WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
															( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
												USING	sqlca;
												open x1;
												if sqlca.sqlcode=0 then
													do while sqlca.sqlcode=0
														Fetch x1 into :ll_cod_seg, :ldb_monto, :ll_estado_reg;
														if not isnull(ll_cod_seg) then
															if ll_estado_reg = 0 then
																ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seg), 1, dw_seguro.RowCount())
																if ll_reg > 0 then
																	dw_seguro.setitem(ll_reg,'c_estado_reg',0)
																end if
															end if
														end if
														setnull(ll_cod_seg)
													loop
												end if
												close x1;
												dw_seguro.accepttext()
												dw_seguro.enabled						= true
											end if
											SELECT	"INTERES_PESOS",	"INTERES_UF"
											INTO 		:ldb_int_peso,			:ldb_int_uf
											FROM 	"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
													ldb_int_peso						= 0
													ldb_int_uf							= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_uf)
												end if
											end if
										end if
									end if
									dw_anexo_funeraria.enabled				= true
									dw_anexo_funeraria.setfocus()
									dw_anexo_funeraria.setcolumn('producto_anexo_base')
								else
									dw_anexo_funeraria.enabled				= false
									dw_anexo_funeraria.setitem(1,'estado_rut',1)
									dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									messagebox("Advertencia","NO fue Asignado Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									dw_supervisor.setfocus()
								end if
							else
								dw_anexo_funeraria.setitem(1,'estado_rut',1)
								dw_anexo_funeraria.setitem(1,'estado_contrato',1)
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
			gs_age																	= dw_agente.getitemstring(1,'agente')
			gs_sup																	= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe																	= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_age) and gs_age<>'' then
				if gl_cod_parque=0 or isnull(gl_cod_parque) then
					SELECT	"AGENTES"."COD_SUP",	"AGENTES"."COD_PARQUE"
					INTO 		:ls_sup,						:gl_cod_parque
					FROM		"AGENTES","SUPERVISOR"  
					WHERE	"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP"and  
							 	"AGENTES"."COD_AGE" = :gs_age
					USING	sqlca;
				else
					SELECT	"AGENTES"."COD_SUP"
					INTO 		:ls_sup
					FROM 	"AGENTES","SUPERVISOR"  
					WHERE	"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
							 	"AGENTES"."COD_AGE" = :gs_age
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					dw_anexo_funeraria.SetItem(1, "cadena_cod_parque", gl_cod_parque)
					if isnull(gs_age) then
						messagebox("Advertencia","Debe Ingresar Agente")
						dw_agente.setfocus()
					else
						dw_anexo_funeraria.SetItem(1,"producto_anexo_cod_agente",gs_age)
						dw_anexo_funeraria.accepttext()
						if is_sw_age='S' and not isnull(gs_sup) and gs_sup<>'' and gs_jefe<>'' and not isnull(gs_jefe) then
							if isvalid((w_validar_promesa_operaciones) ) then
								il_resp_age									= 0
							else
								il_resp_age									= MessageBox("Advertencia", "Está seguro de ASIGNAR Producto Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
							end if
							if il_resp_age = 1 THEN
								ls_string										= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
								openwithparm(w_verificar_datos_contrato,ls_string)
								if trim(Message.StringParm)='OK' THEN
									if gl_cod_parque=0 or isnull(gl_cod_parque) then
										SELECT	"TIPO_CONT",	"COD_PARQUE"
										INTO 		:ls_tipo_cont,	:gl_cod_parque
										FROM 	"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age ;
									else
										SELECT	"TIPO_CONT"
										INTO 		:ls_tipo_cont
										FROM 	"AGENTES"  
										WHERE	"AGENTES"."COD_AGE" = :gs_age ;
									end if
									dw_anexo_funeraria.SetItem(1, "cadena_cod_parque", gl_cod_parque)
									if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
										INSERT INTO "COMISION_PROMESA"  
													( "BASE",		"SERIE",		"NUMERO",	"C_PIE",	"C_PRIMERA",	"C_SEGUNDA",	"C_TERCERA",	"C_CUARTA",	"C_QUINTA",	"C_SEXTA",	"C_SEPTIMA",	"C_OCTAVA",	"C_NOVENA" )  
										VALUES 	( :gs_base,	:gs_serie,	:gi_numero,	0,			0,					0,					0,					0,					0,					0,				0,					0,					0)  
										USING	sqlca;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs											= 'Producto creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									dw_anexo_funeraria.enabled				= true
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_funeraria.setitem(1,'estado_rut',1)
										dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									else
										if gi_rut>0 then
											dw_anexo_funeraria.setitem(1,'estado_rut',0)
											dw_anexo_funeraria.setitem(1,'estado_contrato',0)
										end if
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM		"CADENA"  
									WHERE	"CADENA"."CODIGO" = :gs_base AND  
											 	"CADENA"."SERIE" = :gs_serie AND  
											 	"CADENA"."NUMERO" = :gi_numero   
									USING		sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",	"CODIGO_SERVICIO",	"TIPO_BENEFICIARIOS", "USO",	"CAPACIDAD",	0.0001,				"ORIGEN_VENTA",		"PRECIO_VENTA"
										INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,	:ll_cod_servicio,		:ll_tipo_benef,				:ls_uso,	:ll_capac,		:ldb_tasa_base,	:ls_origen_venta,		:ldb_precio_venta_rev
										FROM		"REVISION_CONTRATOS"  
										WHERE  	"REVISION_CONTRATOS"."BASE" = :gs_base AND  
												 	"REVISION_CONTRATOS"."SERIE" = :gs_serie AND  
												 	"REVISION_CONTRATOS"."NUMERO" = :gi_numero AND
												 	("REVISION_CONTRATOS"."ESTADO_REVISION" = 'A'  OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V') 
										USING	sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_funeraria.setitem(1,'producto_anexo_base',gs_base)
											dw_anexo_funeraria.setitem(1,'producto_anexo_serie',gs_serie)
											dw_anexo_funeraria.setitem(1,'producto_anexo_numero',gi_numero)
											dw_anexo_funeraria.setitem(1,'producto_pago_fecha',ldt_fecha_ctto_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_moneda',ls_moneda_rev)
											dw_anexo_funeraria.setitem(1,'producto_anexo_forma_pago',ls_forma_pago_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_pie_rev)
											dw_anexo_funeraria.setitem(1,'iva_pie',ldb_pie_rev * idb_iva)
											if ldb_pie_rev > 0 and isnull(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')) then 
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',ldt_fecha_ctto_rev)
												end if
											dw_anexo_funeraria.setitem(1,'producto_pago_plazo',ll_plazo_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ldb_gasto_adm_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_precio',ldb_precio_ctto_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_precio_venta',ldb_precio_venta_rev)
											dw_anexo_funeraria.setitem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',ldt_fecha_prim_rev)
											
											if not isnull(ldt_fecha_prim_rev) and not isnull(ll_plazo_rev) and ll_plazo_rev>0 then
												ls_fecha									= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
												if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
													dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
												end if
											end if
											
											dw_anexo_funeraria.setitem(1,'producto_pago_codigo_servicio',ll_cod_servicio)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_beneficiarios',ll_tipo_benef)
											dw_anexo_funeraria.setitem(1,'producto_anexo_uso',ls_uso)
											dw_anexo_funeraria.setitem(1,'producto_pago_capacidad',ll_capac)
											dw_anexo_funeraria.setitem(1,'producto_anexo_tipo_venta',ls_origen_venta)
											
											dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_tasa_base)
											
											SELECT	count("COD_SEGURO")
											INTO		:ll_cta_seg
											FROM		"SEGURO_ASOCIADOS"  
											WHERE	"SEGURO_ASOCIADOS"."BASE" = :gs_base AND  
														"SEGURO_ASOCIADOS"."SERIE" = :gs_serie AND  
														"SEGURO_ASOCIADOS"."NUMERO" = :gi_numero AND  
														"SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' 
											USING	sqlca;
											if isnull(ll_cta_seg) or ll_cta_seg=0 then ll_cta_seg=0
											if ll_cta_seg>0 then
												DECLARE x2 CURSOR FOR  
												SELECT	"COD_SEGURO","MONTO_PRIMA",	"ESTADO_REG"  
												FROM 	"SEGURO_ASOCIADOS"  
												WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
															( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
															( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
															( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
												USING	sqlca;
												open x2;
												if sqlca.sqlcode=0 then
													do while sqlca.sqlcode=0
														Fetch x2 into :ll_cod_seg, :ldb_monto, :ll_estado_reg;
														if not isnull(ll_cod_seg) then
															if ll_estado_reg = 0 then
																ll_reg 						= dw_seguro.Find("codigo = "+string(ll_cod_seg), 1, dw_seguro.RowCount())
																if ll_reg > 0 then
																	dw_seguro.setitem(ll_reg,'c_estado_reg',0)
																end if
															end if
														end if
														setnull(ll_cod_seg)
													loop
												end if
												close x2;
												dw_seguro.accepttext()
												dw_seguro.enabled						= true
											end if
											SELECT	"INTERES_PESOS",	"INTERES_UF"
											INTO 		:ldb_int_peso,			:ldb_int_uf
											FROM		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING	sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
													ldb_int_peso							= 0
													ldb_int_uf								= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',ldb_int_uf)
												end if
											end if
										end if
									end if
									dw_anexo_funeraria.setfocus()
								else
									dw_anexo_funeraria.enabled							= false
									dw_anexo_funeraria.setitem(1,'estado_rut',1)
									dw_anexo_funeraria.setitem(1,'estado_contrato',1)
									messagebox("Advertencia","NO fue Re-Asignado Producto Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									dw_supervisor.setfocus()
								end if
							else
								dw_anexo_funeraria.setitem(1,'estado_rut',1)
								dw_anexo_funeraria.setitem(1,'estado_contrato',1)
											
							end if
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
			UPDATE	"PRODUCTO_ANEXO"  
			SET 		"COD_AGENTE" = :gs_age,   
						"COD_SUPER" = :gs_sup,   
						"COD_JEFE" = :gs_jefe  
			WHERE	"PRODUCTO_ANEXO"."BASE" = :gs_base AND  
						"PRODUCTO_ANEXO"."SERIE" = :gs_serie AND  
					 	"PRODUCTO_ANEXO"."NUMERO" = :gi_numero
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
			end if
		else
			rollback using sqlca;
		end if
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
is_pasa = 'S'
end event

type st_6 from statictext within w_ingresar_funeraria
integer x = 2254
integer y = 68
integer width = 265
integer height = 56
boolean bringtotop = true
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

type st_7 from statictext within w_ingresar_funeraria
integer x = 2802
integer y = 76
integer width = 283
integer height = 56
boolean bringtotop = true
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

type st_help_memo from statictext within w_ingresar_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 814
integer y = 1668
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

event ue_mousemove;st_ver_pie_pactado.visible	= false
st_help_memo.visible			= true
st_grabar.visible				= false
st_imprimir.visible				= false
st_limpiar.visible				= false
st_buscar.visible				= false
st_salir.visible					= false
st_help_cta_cte.visible		= false
st_help_porce_comi.visible	= false
st_help_seguro_2.visible		= false
st_ver_tipo_servicio.visible	= false
st_ver_benef.visible			= false
st_producto.visible				= false
end event

type dw_anexo_funeraria from datawindow within w_ingresar_funeraria
event ue_mousemove pbm_dwnmousemove
integer x = 27
integer y = 40
integer width = 3342
integer height = 1608
integer taborder = 90
string dataobject = "dw_ingreso_anexo_funeraria"
boolean border = false
end type

event ue_mousemove;string	ls_columna

ls_columna							= dwo.name
if ls_columna='t_pie' then
	st_ver_pie_pactado.visible	= true
else
	st_ver_pie_pactado.visible	= false
end if
if ls_columna='t_tipo_servicio' then
	st_ver_tipo_servicio.visible	= true
else
	st_ver_tipo_servicio.visible	= false
end if
if ls_columna='t_beneficiario_tipo' then
	st_ver_benef.visible			= true
else
	st_ver_benef.visible	= false
end if
st_help_memo.visible				= false
st_grabar.visible					= false
st_imprimir.visible					= false
st_limpiar.visible					= false
st_buscar.visible					= false
st_salir.visible						= false
st_help_cta_cte.visible			= false
st_help_porce_comi.visible		= false
st_help_seguro_2.visible			= false
st_producto.visible					= false
end event

event itemchanged;long 		ll_cant, ll_fila,  ll_nro_cuotas,ll_dias,ll_gasto_peso,ll_gastos_adm_peso,ll_capac,ll_rut_aux,ll_rut,ll_resp,ll_count_reg,ll_tipo_servicio,ll_cod_parque,&
			ll_tipo_benef,ll_cant_benef,ll_tot_reg,ll_indi
string 	ls_columna, ls_base_contrato, ls_serie_contrato, ls_null,ls_base,ls_fecha,ls_moneda,ls_uso,ls_string,ls_serie,ls_est_valida,ls_tipo_infor,ls_anexo_dacion,ls_ctto_text,&
			ls_base_dac,ls_serie_dac
date 		ld_null,ld_fecha_prim,ld_fecha_min
Datetime	ldt_fecha_prim,ldt_fecha
Double	lld_tasa,lld_kapital,lld_valor_cuo,lld_valor_adm,lld_pie,lld_valor_uf,ldb_precio,lld_gasto_uf,lld_saldo_finan,lld_factor,lld_fac_cta_mensual,lld_gastos_adm_uf,ldb_suma_cuota,&
			ll_numero,ll_nro_contrato,ll_nro,ldb_pie,ldb_iva_pie_trun,ll_numero_dac

SetNull(ls_Null);SetNull(ld_null)
dw_anexo_funeraria.setitem(1,'valor_iva',idb_iva)
if dw_anexo_funeraria.getitemnumber(1,'cuota_seguros') = 0 or isnull( dw_anexo_funeraria.getitemnumber(1,'cuota_seguros') ) then dw_anexo_funeraria.setitem(1,'cuota_seguros', 0)
dw_anexo_funeraria.AcceptText()
ls_columna 											= GetColumnName()
IF ls_columna = "rut" THEN
	gi_rut												= Long(GetItemNumber(1, "rut"))
	ll_cant											= dw_clientes.Retrieve(gi_rut)
	IF ll_cant = 0 THEN
		ll_fila											= dw_clientes.InsertRow(0)
		dw_clientes.setitem(ll_fila, "rut", gi_rut)
		dw_clientes.setitem(ll_fila, "tipo", "L")
		dw_clientes.setitem(ll_fila, "poblacion", "-")
		dw_clientes.setitem(ll_fila, "nombre", ls_null)
		dw_clientes.setitem(ll_fila, "a_paterno", ls_null)
		dw_clientes.setitem(ll_fila, "a_materno", ls_null)
		dw_clientes.setitem(ll_fila, "direccion_p", ls_null)
		dw_clientes.setitem(ll_fila, "ciudad", ls_null)
		dw_clientes.setitem(ll_fila, "sexo", ls_null)
		dw_clientes.setitem(ll_fila, "esta_civil", ls_null)
		dw_clientes.setitem(ll_fila, "fecha_nac", ld_null)
	ELSE
		cb_aceptar.enabled						= true
		dw_anexo_funeraria.setitem(1,'estado_rut',0)
		dw_anexo_funeraria.setitem(1,'dv',dw_clientes.getitemstring(1,'dv'))
	END IF
end if
if ls_columna = 'cadena_cod_parque' then
	gl_cod_parque		= dw_anexo_funeraria.getitemnumber(1,'cadena_cod_parque')
	ls_uso				= dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso')
	ls_base_contrato 	= dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')
	ls_serie_contrato 	= dw_anexo_funeraria.getitemstring(1,'producto_anexo_serie')
	ll_nro					= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_numero')
	ls_moneda			= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	idw_detalle2.retrieve(gl_cod_parque,ls_uso,ls_serie_contrato,ls_moneda)

	ll_tot_reg			= dw_seguro.retrieve(gl_cod_parque,gs_base)
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		next
		dw_seguro.accepttext()
	end if
end if
IF ls_columna = "dv" THEN
	if integer(getitemstring(1,'dv')) <> integer(gf_obtener_dv(long(GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		cb_aceptar.setfocus()
		dw_anexo_funeraria.setitem(1,'estado_rut',1)
		this.setfocus()
		this.SetColumn('rut')
	else
		dw_anexo_funeraria.setitem(1,'estado_rut',0)
		cb_aceptar.enabled 				= true
	end if
end if
IF ls_columna = "producto_anexo_numero" or ls_columna ="producto_anexo_base" or ls_columna ="producto_anexo_serie" THEN
	ls_base_contrato 						= dw_anexo_funeraria.getitemstring(1,'producto_anexo_base')
	ls_serie_contrato 						= dw_anexo_funeraria.getitemstring(1,'producto_anexo_serie')
	ll_nro										= dw_anexo_funeraria.getitemnumber(1,'producto_anexo_numero')
	if ls_columna = "producto_anexo_base" then
		if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
			dw_anexo_funeraria.getchild('producto_anexo_serie',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base_contrato)
		end if
	end if
	if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
		SELECT	"CADENA"."RUT"
		INTO 		:ll_rut
		FROM 	"CADENA"
		WHERE 	"CADENA"."CODIGO" = :ls_base_contrato and 
				  	"CADENA"."SERIE" = :ls_serie_contrato and
				  	"CADENA"."NUMERO" = :ll_nro 
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if gi_rut = ll_rut then
				dw_anexo_funeraria.setitem(1,'estado_contrato',0)
				cb_aceptar.enabled			= true
			else
				ll_resp							= messagebox("Advertencia","Anexo Producto Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
							  						" es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
							  						ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
							  						string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
				if ll_resp=1 then
					dw_anexo_funeraria.setitem(1,'estado_contrato',0)
					cb_aceptar.enabled		= true
				else
					dw_anexo_funeraria.setitem(1,'estado_contrato',1)
					cb_aceptar.enabled		= false
				end if
			end if
		else
			MessageBox("Anexo Producto" , "No Existe el Contrato Asociado")	
			dw_anexo_funeraria.setitem(1,'estado_contrato',1)
			cb_aceptar.enabled				= false
		end if
	end if
end if
if ls_columna="producto_pago_fecha_prim" or ls_columna="producto_pago_plazo" then
	ldt_fecha_prim								= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
	ll_nro_cuotas								= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
	if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
		ls_fecha									= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
		if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
			dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
		end if
	end if
end if
if ls_columna = "producto_pago_fecha" THEN
	dw_anexo_funeraria.SetItem(1 , "producto_pago_uf_dia", gf_uf( String(GetItemDateTime(1, "producto_pago_fecha"),"dd/mm/yyyy") ) )
	dw_anexo_funeraria.AcceptText()
END IF
if ls_columna = "producto_pago_fecha_prim" THEN
	ld_fecha_prim								= date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim'))
	ld_fecha_min								= RelativeDate(date(gdt_fec_sistema),  - 30)
	if ld_fecha_prim < ld_fecha_min then
		messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
		dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',date(gdt_fec_sistema))
		dw_anexo_funeraria.accepttext()
	end if
end if
if ls_columna="producto_pago_precio" or ls_columna="producto_pago_tasa_base" or ls_columna="producto_pago_valor_cuota" or ls_columna="producto_pago_gasto_adm" or ls_columna="producto_pago_pie" then
	ls_moneda									= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	lld_tasa										= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa_base'))
	if lld_tasa>100 then
		messagebox("Error","Valor Tasa Contrato Inválida")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_pago_tasa_base')
	end if
	if ls_moneda='2' then //uf
		lld_kapital								= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio'))
		lld_valor_cuo							= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota'))
		lld_valor_adm							= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm'))
		lld_pie									= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
		if lld_kapital>=500 then 
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
			dw_anexo_funeraria.setfocus()
			dw_anexo_funeraria.setcolumn('producto_pago_precio')
		elseif lld_valor_cuo>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
			dw_anexo_funeraria.setfocus()
			dw_anexo_funeraria.setcolumn('producto_pago_valor_cuota')
		elseif lld_valor_adm>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Gasto Administrativo)")
			dw_anexo_funeraria.setfocus()
			dw_anexo_funeraria.setcolumn('producto_pago_gasto_adm')
		elseif lld_pie>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
			dw_anexo_funeraria.setfocus()
			dw_anexo_funeraria.setcolumn('producto_pago_pie')
		end if
	end if
end if
if ls_columna="producto_pago_moneda" then
	ls_moneda									= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	lld_kapital									= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio'))
	lld_tasa										= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_tasa_base'))
	lld_valor_cuo								= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota'))
	lld_valor_adm								= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm'))
	lld_pie										= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
	lld_valor_uf									= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_uf_dia'))
//	gd_uf_dia
	if gd_uf_dia>0 then
		if ls_moneda='1' then //peso
			dw_anexo_funeraria.setitem(1,'producto_pago_precio',long(round((lld_kapital * lld_valor_uf),2)))
			dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',long(round((lld_valor_cuo * lld_valor_uf),2)))
			dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',long(round((lld_valor_adm * lld_valor_uf),2)))
			dw_anexo_funeraria.setitem(1,'producto_pago_pie',long(round((lld_pie * lld_valor_uf),2)))
			ldb_pie				= long(round((lld_pie * lld_valor_uf),2))
			ldb_iva_pie_trun	= truncate((ldb_pie * idb_iva),2)
			dw_anexo_funeraria.setitem(1,'iva_pie',ldb_iva_pie_trun)
		elseif ls_moneda='2' then //uf
			dw_anexo_funeraria.setitem(1,'producto_pago_precio',(lld_kapital / lld_valor_uf))
			dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',(lld_valor_cuo / lld_valor_uf))
			dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',(lld_valor_adm / lld_valor_uf))
			dw_anexo_funeraria.setitem(1,'producto_pago_pie',(lld_pie / lld_valor_uf))
			ldb_pie				= (lld_pie / lld_valor_uf)
			ldb_iva_pie_trun	= round((ldb_pie * idb_iva),4)
			dw_anexo_funeraria.setitem(1,'iva_pie',ldb_iva_pie_trun)
		end if
		dw_anexo_funeraria.accepttext()
	end if
END IF
if ls_columna="producto_pago_plazo" or ls_columna="producto_pago_moneda" then
	ll_nro_cuotas								= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
	ls_moneda									= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	if ll_nro_cuotas>0 and not isnull(ls_moneda) then
		SELECT	"TASA_UF",		"TASA_PESO"  
		INTO 		:lld_gasto_uf,	:ll_gasto_peso
		FROM 	"TASA_GASTOS_ADM"  
		WHERE 	"TASA_GASTOS_ADM"."CODIGO" = 1   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			lld_gasto_uf							= 0
			ll_gasto_peso						= 0  
			if ls_moneda='1' then //peso
				ll_gastos_adm_peso			= ll_nro_cuotas * ll_gasto_peso  
				if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
					ll_gastos_adm_peso		= 0
				end if
				dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',ll_gastos_adm_peso)
				SELECT	"INTERES_PESOS"  
				INTO 		:lld_fac_cta_mensual  
				FROM 	"INTERES_CUOTAS"  
				WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cuotas   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
						lld_fac_cta_mensual				= 0
					end if
					dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',lld_fac_cta_mensual)
				end if
			elseif ls_moneda='2' then //uf
				lld_gastos_adm_uf							= ll_nro_cuotas * lld_gasto_uf  
				if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
					lld_gastos_adm_uf	= 0
				end if
				dw_anexo_funeraria.setitem(1,'producto_pago_gasto_adm',lld_gastos_adm_uf)
				SELECT	"INTERES_UF"  
				INTO 		:lld_fac_cta_mensual  
				FROM 	"INTERES_CUOTAS"  
				WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cuotas   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if dw_anexo_funeraria.getitemstring(1,'producto_anexo_forma_pago')='1' then
						lld_fac_cta_mensual				= 0
					end if
					dw_anexo_funeraria.setitem(1,'producto_pago_tasa_base',lld_fac_cta_mensual)
				end if
			end if
		end if
	end if	
end if	
if ls_columna='producto_pago_valor_cuota' then
	SELECT	COUNT("LOG_PRODUCTO"."BASE")  
	INTO 		:il_modif  
	FROM 	"LOG_PRODUCTO"  
	WHERE  	( "LOG_PRODUCTO"."BASE" = :gs_base ) AND  
				( "LOG_PRODUCTO"."SERIE" = :gs_serie ) AND  
			 	( "LOG_PRODUCTO"."NUMERO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='producto_pago_plazo' then
	SELECT	COUNT("LOG_PRODUCTO"."BASE")  
	INTO 		:il_modif_plazo  
	FROM 	"LOG_PRODUCTO"  
	WHERE  	( "LOG_PRODUCTO"."BASE" = :gs_base ) AND  
				( "LOG_PRODUCTO"."SERIE" = :gs_serie ) AND  
			 	( "LOG_PRODUCTO"."NUMERO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='producto_pago_fecha_prim' then
	SELECT	COUNT("LOG_PRODUCTO"."BASE")  
	INTO 		:il_modif_fec  
	FROM 	"LOG_PRODUCTO"  
	WHERE  	( "LOG_PRODUCTO"."BASE" = :gs_base ) AND  
				( "LOG_PRODUCTO"."SERIE" = :gs_serie ) AND  
				( "LOG_PRODUCTO"."NUMERO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='producto_pago_pie' then
	dw_anexo_funeraria.accepttext()
	lld_pie										= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
	ls_moneda									= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	if lld_pie>0 then
		ls_uso									= trim(dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso'))
		SELECT	Count("DETALLE_PAGO_PIE"."ESTADO")  
		INTO 		:ll_count_reg  
		FROM 	"DETALLE_PAGO_PIE"  
		WHERE	"DETALLE_PAGO_PIE"."BASE" = :gs_base AND  
					"DETALLE_PAGO_PIE"."SERIE" = :gs_serie AND  
				 	"DETALLE_PAGO_PIE"."NUMERO" = :gi_numero AND  
				 	"DETALLE_PAGO_PIE"."ESTADO" = 'C'   
		USING	sqlca;
		if isnull(ll_count_reg) or ll_count_reg=0 then
			ls_string								= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(lld_pie)+'~t'+ls_uso+'~t'+'M'+'~t'+ls_moneda
			if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then
				openwithparm(w_mensaje_pie,ls_string)
				is_respuesta	= Message.StringParm
				IF trim(is_respuesta)='S' THEN 
					openwithparm(w_ingreso_pie_pactado,ls_string)
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
			FROM		"DETALLE_PAGO_PIE"  
			WHERE  	"DETALLE_PAGO_PIE"."BASE" = :gs_base AND  
					 	"DETALLE_PAGO_PIE"."SERIE" = :gs_serie AND  
					 	"DETALLE_PAGO_PIE"."NUMERO" = :gi_numero    
			USING		sqlca;
			if ldb_suma_cuota>0 then
				dw_anexo_funeraria.setitem(1,'producto_pago_pie',ldb_suma_cuota)
				ldb_pie				= ldb_suma_cuota
				ldb_iva_pie_trun	= truncate((ldb_pie * idb_iva),2)
				dw_anexo_funeraria.setitem(1,'iva_pie',ldb_iva_pie_trun)
				dw_anexo_funeraria.accepttext()
			end if
		end if
	end if
end if
if ls_columna='producto_pago_codigo_servicio'  then
	pb_producto.triggerevent(clicked!)
end if
if ls_columna="producto_pago_capacidad" then
	pb_benef.triggerevent(clicked!)
end if
if ls_columna="producto_pago_plazo" or ls_columna="producto_pago_fecha" or ls_columna="producto_pago_fecha_prim" or &
	ls_columna="producto_pago_moneda" or ls_columna="producto_pago_precio" or ls_columna="producto_pago_pie" or &
	ls_columna="producto_pago_gasto_adm" then

	ll_nro_cuotas					= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
	ldt_fecha							= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')
	ldt_fecha_prim					= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
	ls_moneda						= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	ldb_precio						= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
	lld_pie							= dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie')
	lld_gasto_uf						= dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm')
	dw_anexo_funeraria.accepttext()
	lld_saldo_finan					= double(dw_anexo_funeraria.getitemnumber(1,'saldo_finan'))
	if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
		not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
		ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
		if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
			ll_dias					= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
			if ll_nro_cuotas>=1 and ll_nro_cuotas<=11 then
				dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',ldb_precio + lld_pie)
			else
				if ll_dias>=30 then
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor  
					FROM 	"FACTORES"  
					WHERE 	"FACTORES"."BASE" = :gs_base AND  
								:ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL" AND  
							 	:ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL" AND  
							 	:ll_dias >= "FACTORES"."DIAS_INICIAL" AND  
							 	:ll_dias <= "FACTORES"."DIAS_FINAL" AND
							 	"FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig AND
							 	"FACTORES"."MONEDA" = :ls_moneda 
					USING	sqlca;
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan				= lld_factor * lld_saldo_finan
						dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',lld_saldo_finan)
					else
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor 
						FROM 	"FACTORES"  
						WHERE	"FACTORES"."BASE" = :gs_base AND  
									:ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL" AND  
								 	:ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL" AND  
								 	"FACTORES"."MONEDA" = :ls_moneda AND  
								 	"FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig AND
								 	"FACTORES"."FACTOR" = (	SELECT	MIN("FACTORES"."FACTOR") 
																		FROM 	"FACTORES" 
																		WHERE	"FACTORES"."BASE" = :gs_base AND 
																			 		:ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL" AND  
																			 		:ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL" AND  
																			 		"FACTORES"."MONEDA" = :ls_moneda AND 
																			 		"FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig AND
																			 		"FACTORES"."FACTOR" <> 0 )   ;
						if lld_factor > 0 and lld_saldo_finan > 0 then
							lld_saldo_finan						= lld_factor * lld_saldo_finan
							dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',lld_saldo_finan)
						end if
					end if
				else
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor 
					FROM 	"FACTORES"  
					WHERE 	"FACTORES"."BASE" = :gs_base AND  
							 	:ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL" AND  
							 	:ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL" AND  
							 	"FACTORES"."MONEDA" = :ls_moneda AND  
							 	"FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig AND
							 	"FACTORES"."FACTOR" = (	SELECT	MIN("FACTORES"."FACTOR") 
																	FROM 	"FACTORES" 
																	WHERE 	"FACTORES"."BASE" = :gs_base AND 
																		 		:ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL" AND  
																		 		:ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL" AND  
																		 		"FACTORES"."MONEDA" = :ls_moneda AND 
																		 		"FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig AND
																		 		"FACTORES"."FACTOR" <> 0 )   
					USING		sqlca;
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan	= lld_factor * lld_saldo_finan
						dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',lld_saldo_finan)
					end if
				end if
			end if
		end if
	end if
end if

if ls_columna='producto_pago_valor_cuota' then
	SELECT	COUNT("LOG_PRODUCTO"."BASE")  
	INTO 		:il_modif  
	FROM 	"LOG_PRODUCTO"  
	WHERE  	( "LOG_PRODUCTO"."BASE" = :gs_base ) AND  
				( "LOG_PRODUCTO"."SERIE" = :gs_serie ) AND  
			 	( "LOG_PRODUCTO"."NUMERO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='producto_pago_plazo' then
	SELECT	COUNT("LOG_PRODUCTO"."BASE")  
	INTO 		:il_modif_plazo  
	FROM 	"LOG_PRODUCTO"  
	WHERE  	( "LOG_PRODUCTO"."BASE" = :gs_base ) AND  
				( "LOG_PRODUCTO"."SERIE" = :gs_serie ) AND  
			 	( "LOG_PRODUCTO"."NUMERO" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='producto_pago_fecha_prim' then
	SELECT	COUNT("LOG_PRODUCTO"."BASE")  
	INTO 		:il_modif_fec  
	FROM 	"LOG_PRODUCTO"  
	WHERE  	( "LOG_PRODUCTO"."BASE" = :gs_base ) AND  
				( "LOG_PRODUCTO"."SERIE" = :gs_serie ) AND  
				( "LOG_PRODUCTO"."NUMERO" = :gi_numero )   
	USING		sqlca;
end if

if ls_columna='producto_anexo_anexo_dacion' then
	ls_anexo_dacion					= trim(dw_anexo_funeraria.getitemstring(1,'producto_anexo_anexo_dacion'))
	ls_ctto_text							= gs_base+gs_serie+string(gi_numero)
	if ls_anexo_dacion=ls_ctto_text then
		messagebox("Advertencia","No es Posible Asociar el misma Contrato")
		dw_anexo_funeraria.setitem(1,'producto_anexo_anexo_dacion','')
		dw_anexo_funeraria.accepttext()
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('producto_anexo_anexo_dacion')
	else
		if mid(ls_anexo_dacion,1,1)='O' or mid(ls_anexo_dacion,1,1)='C' or mid(ls_anexo_dacion,1,1)='P' or mid(ls_anexo_dacion,1,1)='G' then
			ls_base_dac					= mid(ls_anexo_dacion,1,1)
			ls_serie_dac					= mid(ls_anexo_dacion,2,1)
			ll_numero_dac				= Double(mid(ls_anexo_dacion,3))
			SELECT	Count("SOL_ESTATUS"."BASE")  
			INTO 		:ll_count_reg  
			FROM 		"SOL_ESTATUS"  
			WHERE  (("SOL_ESTATUS"."BASE" = :ls_base_dac AND  
						"SOL_ESTATUS"."SERIE" = :ls_serie_dac AND  
						"SOL_ESTATUS"."NUMERO" = :ll_numero_dac AND  
						"SOL_ESTATUS"."CODIGO_SOLICITUD" = '2') OR  
					 ( "SOL_ESTATUS"."BASE" = :ls_base_dac AND  
						"SOL_ESTATUS"."SERIE" = :ls_serie_dac AND  
						"SOL_ESTATUS"."NUMERO" = :ll_numero_dac AND  
						"SOL_ESTATUS"."CODIGO_SOLICITUD" = '13'))   
			USING		sqlca;
			if ll_count_reg=0 or isnull(ll_count_reg) then
				messagebox("Advertencia","Contrato Original debe Tener Asociada Solicitud de 2-Resciliación por Reprogramación o 13-Dación en Pago")
				dw_anexo_funeraria.setitem(1,'producto_anexo_anexo_dacion','')
				dw_anexo_funeraria.accepttext()
			end if
		else
			messagebox("Advertencia","Solo puede Ingresar C-Contrato, P-Pagaré, O-Promesas o G-Crematorio")
			dw_anexo_funeraria.setitem(1,'producto_anexo_anexo_dacion','')
			dw_anexo_funeraria.accepttext()
		end if
	end if
end if
end event

event clicked;string		ls_columna,ls_fecha,ls_moneda,ls_string
Datetime	ldt_fecha_prim,ldt_fecha
Date		ld_fecha_prim,ld_fecha_min
Long		ll_nro_cuotas,ll_dias,ll_est_rut,ll_est_ctto
Double	ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor

ls_columna											= dwo.name
ll_est_rut												= dw_anexo_funeraria.getitemnumber(1,'estado_rut')
ll_est_ctto											= dw_anexo_funeraria.getitemnumber(1,'estado_contrato')
if ll_est_rut=0 and ll_est_ctto=0 then
	CHOOSE CASE ls_columna
		CASE 'p_fec_ingr'
			ls_fecha									= string(date(dw_anexo_funeraria.getitemdatetime(1,'producto_anexo_fecha_ingreso')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_funeraria.setitem(1,'producto_anexo_fecha_ingreso',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha								= trim(Message.StringParm)
				dw_anexo_funeraria.setitem(1,'producto_anexo_fecha_ingreso',date(ls_fecha))
			END IF
			dw_anexo_funeraria.setcolumn('producto_anexo_fecha_ingreso')
			
		CASE 'p_fec_pie'
			ls_fecha									= string(date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_pie')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha								= trim(Message.StringParm)
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_pie',date(ls_fecha))
			END IF
			dw_anexo_funeraria.setcolumn('producto_pago_fecha_pie')
	
		CASE 'p_fec_prim'
			ld_fecha_prim							= date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim'))
			ld_fecha_min							= RelativeDate(date(gdt_fec_sistema),  - 30)
			if ld_fecha_prim < ld_fecha_min then
				messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',date(gdt_fec_sistema))
				dw_anexo_funeraria.accepttext()
			else
				ls_fecha								= string(date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')))
				if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',datetime(string(id_fecha_dia,gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha							= trim(Message.StringParm)
					dw_anexo_funeraria.setitem(1,'producto_pago_fecha_prim',date(ls_fecha))
				END IF
				ldt_fecha_prim						= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
				ll_nro_cuotas						= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
				if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
					ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
					if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
						dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
					end if
				end if
				
				
				ll_nro_cuotas								= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
				ldt_fecha										= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')
				ldt_fecha_prim								= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
				ls_moneda									= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
				ldb_precio									= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
				lld_pie										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie')
				lld_gasto_uf									= dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm')
				dw_anexo_funeraria.accepttext()
				lld_saldo_finan								= double(dw_anexo_funeraria.getitemnumber(1,'saldo_finan'))
				if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
					not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
					ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
					if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
						ll_dias								= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor  
						FROM 	"FACTORES"  
						WHERE 	"FACTORES"."BASE" = :gs_base AND  
								 	:ll_nro_cuotas = "FACTORES"."NRO_CUOTAS_INICIAL" AND  
								 	:ll_dias >= "FACTORES"."DIAS_INICIAL" AND  
								 	:ll_dias <= "FACTORES"."DIAS_FINAL" AND
								 	"FACTORES"."MONEDA" = :ls_moneda
						USING	sqlca;
						if sqlca.sqlcode=0 then
							if lld_factor>0 and lld_saldo_finan>0 then
								lld_saldo_finan				= lld_factor * lld_saldo_finan
								dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',lld_saldo_finan)
								dw_anexo_funeraria.setitem(1,'valor_cuota_iva',lld_saldo_finan * idb_iva)
								dw_anexo_funeraria.setitem(1,'iva_pie',lld_pie * idb_iva)
							end if
						end if
					end if
				end if
			end if
			dw_anexo_funeraria.setfocus()
			dw_anexo_funeraria.setcolumn('producto_pago_fecha_prim')
			
		CASE 'p_fec_contrato'
			ls_fecha											= string(date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha										= trim(Message.StringParm)
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha',date(ls_fecha))
			END IF
			dw_anexo_funeraria.SetItem(1,'producto_pago_uf_dia', gf_uf( String(GetItemDateTime(1, "producto_pago_fecha"),"dd/mm/yyyy") ) )
			dw_anexo_funeraria.AcceptText()		
			ll_nro_cuotas									= dw_anexo_funeraria.getitemnumber(1,'producto_pago_plazo')
			ldt_fecha											= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha')
			ldt_fecha_prim									= dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_prim')
			ls_moneda										= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
			ldb_precio										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_precio')
			lld_pie											= dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie')
			lld_gasto_uf										= dw_anexo_funeraria.getitemnumber(1,'producto_pago_gasto_adm')
			dw_anexo_funeraria.accepttext()
			lld_saldo_finan									= double(dw_anexo_funeraria.getitemnumber(1,'saldo_finan'))
			if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
				not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
				ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
				if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
					ll_dias									= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor  
					FROM 	"FACTORES"  
					WHERE 	"FACTORES"."BASE" = :gs_base AND  
							 	:ll_nro_cuotas = "FACTORES"."NRO_CUOTAS_INICIAL" AND  
							 	:ll_dias >= "FACTORES"."DIAS_INICIAL" AND  
							 	:ll_dias <= "FACTORES"."DIAS_FINAL" AND
							 	"FACTORES"."MONEDA" = :ls_moneda
					USING	sqlca;
					if sqlca.sqlcode=0 then
						if lld_factor>0 and lld_saldo_finan>0 then
							lld_saldo_finan						= lld_factor * lld_saldo_finan
							dw_anexo_funeraria.setitem(1,'producto_pago_valor_cuota',lld_saldo_finan)
							dw_anexo_funeraria.setitem(1,'valor_cuota_iva',lld_saldo_finan * idb_iva)
							dw_anexo_funeraria.setitem(1,'iva_pie',lld_pie * idb_iva)
						end if
					end if
				end if
			end if
			dw_anexo_funeraria.setfocus()
			dw_anexo_funeraria.setcolumn('producto_pago_fecha')
			
		CASE 'p_fec_ult'
			ls_fecha													= string(date(dw_anexo_funeraria.getitemdatetime(1,'producto_pago_fecha_ult')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha												= trim(Message.StringParm)
				dw_anexo_funeraria.setitem(1,'producto_pago_fecha_ult',date(ls_fecha))
			END IF
			dw_anexo_funeraria.setcolumn('producto_pago_fecha_ult')
	END CHOOSE
end if
end event

event doubleclicked;string		ls_columna,ls_moneda,ls_uso,ls_string,ls_est_valida,ls_tipo_infor
long		ll_tipo_seguro,ll_cantidad,ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_ano_nac,ll_edad,ll_tipo_servicio,&
			ll_cod_parque,ll_tipo_benef,ll_cant_benef,ll_capac
date		ld_fecha,ld_fecha_tope
double	ldb_pie,ldb_factor,ldb_factor_seg_comp

dw_anexo_funeraria.accepttext()
ls_columna									= dwo.name
if ls_columna='t_pie' or ls_columna= 'producto_pago_pie' then
	dw_anexo_funeraria.accepttext()
	ldb_pie									= double(dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie'))
	ls_moneda								= dw_anexo_funeraria.getitemstring(1,'producto_pago_moneda')
	if ldb_pie>0 then
		ls_uso								= trim(dw_anexo_funeraria.getitemstring(1,'producto_anexo_uso'))
		ls_string								= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ldb_pie)+'~t'+ls_uso+'~t'+'C'+'~t'+ls_moneda
		if not isnull(ls_uso) and ls_uso<>'' and not isnull(ls_moneda) then
			openwithparm(w_ingreso_pie_pactado,ls_string)
		else
			if isnull(ls_uso) then
				messagebox("Advertencia","Debe ingresar antes Uso")
				dw_anexo_funeraria.setfocus()
				dw_anexo_funeraria.setcolumn('producto_anexo_uso')
			elseif isnull(ls_moneda) then
				messagebox("Advertencia","Debe ingresar antes Moneda")
				dw_anexo_funeraria.setfocus()
				dw_anexo_funeraria.setcolumn('producto_pago_moneda')
			end if
			cb_3.triggerevent(clicked!)
		end if
	end if
elseif ls_columna='t_seguro' then	
	ll_tipo_seguro						= dw_anexo_funeraria.getitemnumber(1,'pago_oferta_codigo_tipo_seguro')
	if ll_tipo_seguro>0 then
		SELECT	"CANTIDAD_BENEFICIARIO",	"UF_SEGURO"  
		INTO 		:ll_cantidad,							:ldb_factor  
		FROM 	"TIPO_SEGURO"  
		WHERE	"TIPO_SEGURO"."CODIGO" = :ll_tipo_seguro   
		USING	sqlca;
		ls_string							= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(ldb_factor)+'~t'+string(ll_tipo_seguro)
		openwithparm(w_ingreso_beneficiario_seg_comple,ls_string)
	else
		messagebox("Advertencia","Debe seleccionar Tipo de Seguro Complementario antes de Ingresar Beneficiarios")
		dw_anexo_funeraria.setfocus()
		dw_anexo_funeraria.setcolumn('pago_oferta_codigo_tipo_seguro')
	end if
	
elseif ls_columna='pago_oferta_codigo_tipo_seguro' then
	ll_tipo_seguro						= dw_anexo_funeraria.getitemnumber(1,'pago_oferta_codigo_tipo_seguro')
	if ll_tipo_seguro>0 then
		SELECT	"CANTIDAD_BENEFICIARIO",	"FACTOR"  
		INTO 		:ll_cantidad,							:ldb_factor_seg_comp  
		FROM 	"TIPO_SEGURO"  
		WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_tipo_seguro   
		USING		sqlca;
		ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(ldb_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
		if ll_tipo_seguro=2 then
			ld_fecha						= date(dw_clientes.getitemdatetime(1,'fecha_nac'))
			ld_fecha_tope				= date(dw_anexo_funeraria.getitemdatetime(1,'fecha'))
			if not isnull(ld_fecha) then
				ll_dia_hoy				= day(ld_fecha_tope)
				ll_dia_nac				= day(ld_fecha)
				ll_mes_hoy				= month(ld_fecha_tope)
				ll_mes_nac				= month(ld_fecha)
				ll_ano_hoy				= year(ld_fecha_tope)
				ll_ano_nac				= year(ld_fecha)
				ll_edad					= ll_ano_hoy - ll_ano_nac
				if ll_mes_hoy > ll_mes_nac then
					ll_edad ++
				elseif ll_mes_hoy = ll_mes_nac then
					if ll_dia_hoy >= ll_dia_nac then
						ll_edad ++
					end if
				end if
				if ll_edad<=65 then
					openwithparm(w_ingreso_seguro_complementario,ls_string)
				else
					messagebox("Advertencia","Recuerde No es posible Ingresar Beneficiarios, Titular debe tener Menos de 65 Años")
				end if
			else
				messagebox("Advertencia","Debe Ingresar Cliente, recuerde ingresar correctamente Fecha de Nacimiento")
			end if
		else
			openwithparm(w_ingreso_seguro_complementario,ls_string)
		end if
	end if	
elseif 	ls_columna= 't_tipo_servicio' then 
	pb_producto.triggerevent(clicked!)
elseif 	ls_columna= 't_cant_benef' then
	pb_benef.triggerevent(clicked!)
end if
end event

event itemfocuschanged;Double 	ldb_producto_precio,ldb_producto_valor_cuota,ldb_iva,ldb_factor_prima,ldb_suma,ll_numero_dac
Long    	ll_tot_reg,ll_indi,ll_est_reg,ll_codigo,ll_count_reg
Date	  	ld_fecha_ctto
String		ls_anexo_dacion,ls_ctto_text,ls_base_dac,ls_serie_dac

ldb_producto_precio						= dw_anexo_funeraria.getitemnumber(1,'producto_pago_pie')
ldb_producto_valor_cuota				= dw_anexo_funeraria.getitemnumber(1,'producto_pago_valor_cuota')

if ldb_producto_precio > 0 then
	dw_anexo_funeraria.setitem(1,'iva_pie',ldb_producto_precio * idb_iva)
end if
if ldb_producto_valor_cuota > 0 then
	dw_anexo_funeraria.setitem(1,'valor_cuota_iva',ldb_producto_valor_cuota * idb_iva)
end if
ls_anexo_dacion					= trim(dw_anexo_funeraria.getitemstring(1,'producto_anexo_anexo_dacion'))
ls_ctto_text							= gs_base+gs_serie+string(gi_numero)
if ls_anexo_dacion=ls_ctto_text then
	messagebox("Advertencia","No es Posible Asociar el misma Contrato")
	dw_anexo_funeraria.setitem(1,'producto_anexo_anexo_dacion','')
	dw_anexo_funeraria.accepttext()
	dw_anexo_funeraria.setfocus()
	dw_anexo_funeraria.setcolumn('producto_anexo_anexo_dacion')
else
	if mid(ls_anexo_dacion,1,1)='O' or mid(ls_anexo_dacion,1,1)='C' or mid(ls_anexo_dacion,1,1)='P' or mid(ls_anexo_dacion,1,1)='G' then
		ls_base_dac					= mid(ls_anexo_dacion,1,1)
		ls_serie_dac					= mid(ls_anexo_dacion,2,1)
		ll_numero_dac				= Double(mid(ls_anexo_dacion,3))
		SELECT	Count("SOL_ESTATUS"."BASE")  
		INTO 		:ll_count_reg  
		FROM 	"SOL_ESTATUS"  
		WHERE  	(("SOL_ESTATUS"."BASE" = :ls_base_dac AND  
					"SOL_ESTATUS"."SERIE" = :ls_serie_dac AND  
					"SOL_ESTATUS"."NUMERO" = :ll_numero_dac AND  
					"SOL_ESTATUS"."CODIGO_SOLICITUD" = '2') OR  
				 	( "SOL_ESTATUS"."BASE" = :ls_base_dac AND  
					"SOL_ESTATUS"."SERIE" = :ls_serie_dac AND  
					"SOL_ESTATUS"."NUMERO" = :ll_numero_dac AND  
					"SOL_ESTATUS"."CODIGO_SOLICITUD" = '13'))   
		USING		sqlca;
		if ll_count_reg=0 or isnull(ll_count_reg) then
//			messagebox("Advertencia","Contrato Original debe Tener Asociada Solicitud de 2-Resciliación por Reprogramación o 13-Dación en Pago")
			dw_anexo_funeraria.setitem(1,'producto_anexo_anexo_dacion','')
		end if
	else
//		messagebox("Advertencia","Solo puede Ingresar C-Contrato, P-Pagaré, O-Promesas o G-Crematorio")
		dw_anexo_funeraria.setitem(1,'producto_anexo_anexo_dacion','')
	end if
end if

dw_anexo_funeraria.accepttext( )

end event

