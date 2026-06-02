forward
global type w_ingresar_liberador from window
end type
type pb_2 from picturebutton within w_ingresar_liberador
end type
type em_serie from dropdownlistbox within w_ingresar_liberador
end type
type cb_3 from commandbutton within w_ingresar_liberador
end type
type dw_seguro from datawindow within w_ingresar_liberador
end type
type cb_ingresar from commandbutton within w_ingresar_liberador
end type
type cb_seguro2 from commandbutton within w_ingresar_liberador
end type
type cb_ver_cuenta from commandbutton within w_ingresar_liberador
end type
type cb_porce_comi from commandbutton within w_ingresar_liberador
end type
type p_1 from picture within w_ingresar_liberador
end type
type st_help_memo from statictext within w_ingresar_liberador
end type
type st_memo from commandbutton within w_ingresar_liberador
end type
type st_buscar from statictext within w_ingresar_liberador
end type
type pb_buscar from picturebutton within w_ingresar_liberador
end type
type dw_jefe from datawindow within w_ingresar_liberador
end type
type st_salir from statictext within w_ingresar_liberador
end type
type st_limpiar from statictext within w_ingresar_liberador
end type
type st_imprimir from statictext within w_ingresar_liberador
end type
type st_grabar from statictext within w_ingresar_liberador
end type
type pb_print from picturebutton within w_ingresar_liberador
end type
type pb_limpiar from picturebutton within w_ingresar_liberador
end type
type cb_cerrar from picturebutton within w_ingresar_liberador
end type
type cb_aceptar from picturebutton within w_ingresar_liberador
end type
type st_7 from statictext within w_ingresar_liberador
end type
type st_6 from statictext within w_ingresar_liberador
end type
type st_5 from statictext within w_ingresar_liberador
end type
type em_dv from editmask within w_ingresar_liberador
end type
type st_4 from statictext within w_ingresar_liberador
end type
type em_rut from editmask within w_ingresar_liberador
end type
type st_3 from statictext within w_ingresar_liberador
end type
type st_2 from statictext within w_ingresar_liberador
end type
type em_numero from editmask within w_ingresar_liberador
end type
type st_1 from statictext within w_ingresar_liberador
end type
type dw_1 from datawindow within w_ingresar_liberador
end type
type dw_clientes from datawindow within w_ingresar_liberador
end type
type dw_supervisor from datawindow within w_ingresar_liberador
end type
type dw_agente from datawindow within w_ingresar_liberador
end type
type st_seg_fune from statictext within w_ingresar_liberador
end type
type dw_anexo_liberador from datawindow within w_ingresar_liberador
end type
end forward

global type w_ingresar_liberador from window
integer x = 73
integer y = 48
integer width = 3419
integer height = 1956
boolean titlebar = true
string title = "Ingresar Anexo Liberador"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
event ue_mousemove pbm_mousemove
pb_2 pb_2
em_serie em_serie
cb_3 cb_3
dw_seguro dw_seguro
cb_ingresar cb_ingresar
cb_seguro2 cb_seguro2
cb_ver_cuenta cb_ver_cuenta
cb_porce_comi cb_porce_comi
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
dw_supervisor dw_supervisor
dw_agente dw_agente
st_seg_fune st_seg_fune
dw_anexo_liberador dw_anexo_liberador
end type
global w_ingresar_liberador w_ingresar_liberador

type variables
Date		id_fecha_dia
Datetime	idt_fecha_vig
Long		il_resp_age,il_resp_sup,il_graba_1,il_graba_2,il_graba_3,il_graba_4,il_graba_5,&
			il_graba_6,il_tipo_cliente=1,il_modif,il_modif_plazo,il_modif_fec,il_estado,il_cod_seguro
String		is_error_cod,is_respuesta,is_serie, is_serie2,is_pasa_asigna='N',is_sw_age='N',is_sw_sup='N',is_sw_jef='N'
end variables

forward prototypes
public function double f_comision_sup1 (string as_area)
public function boolean wf_cadena (integer ai_modo)
public subroutine wf_limpiar ()
public subroutine wf_log_anexo_liberador ()
public subroutine wf_mostrar_liberador ()
public subroutine wf_nuevo_liberador ()
public function double f_comision_age1 (string as_tipo_venta, string as_area, string as_uso)
public function boolean f_validar ()
public subroutine wf_buscar_seguro (string as_base, string as_serie, double al_numero)
public subroutine wf_comisiones (string serie, double numero, double pie, integer credito)
end prototypes

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

public function double f_comision_sup1 (string as_area);double ld_porce

SELECT comi_sup.com
INTO :ld_porce
FROM comi_sup
WHERE (comi_sup.area = :as_area);

RETURN ld_porce

end function

public function boolean wf_cadena (integer ai_modo);string 	ls_barra,ls_base,ls_serie,ls_agente
datetime	ld_null
Long		ll_numero
ls_barra 		= 'L' + gs_serie + String(gi_numero)
setnull(ld_null)
gl_cod_parque	= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
ls_agente		= dw_anexo_liberador.getitemstring(1,'cod_agente')
if isnull(gl_cod_parque) or gl_cod_parque=0 then
	SELECT	"AGENTES"."COD_PARQUE"  
	INTO 		:gl_cod_parque  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :ls_agente   
	USING		sqlca;
	if sqlca.sqlcode<>0 then gl_cod_parque	= 0
end if
ls_base		= dw_anexo_liberador.getitemstring(1,'base')
ls_serie		= dw_anexo_liberador.getitemstring(1,'serie')
ll_numero	= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
IF ai_modo = 0 THEN // Es un Insert
	INSERT INTO "CADENA"
				("BARRA",	"RUT",  "CODIGO", "SERIE", 	"NUMERO", 	"ESTADO", "PRINT",	"EST_CUP",	"NRO_CARTA",	"FECHA_CARTA",	"ESTADO_CARTA",	"FECHA_ACT_ESTADO",	"CUOTA_CUPON",	"FECHA_RES",	"A_DEMANDAR",	"ESTADO_CONTABLE",	"ESTADO_TITULO",	"FECHA_TITULO",	"NRO_CARTA_M",	"FECHA_CARTA_M",	"ESTADO_CARTA_M",	"FECHA_ACT_ESTADO_M",	"COD_PARQUE")
	VALUES 	(:ls_barra, :gi_rut,	'L',		:gs_serie,	:gi_numero,	'V',		'N',			'0',			'SC',				:ld_null,		'0',					:ld_null,				0,					:ld_null,		'0',				'A',						'N',					:ld_null,			'SC',				:ld_null,			'0', 					:ld_null,					:gl_cod_parque)
	USING	SQLCA;
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
   WHERE  ( "CADENA"."CODIGO" = 'L' ) AND  
          ( "CADENA"."SERIE" = :gs_serie ) AND  
          ( "CADENA"."NUMERO" = :gi_numero )   
	USING		sqlca;
	if sqlca.sqlcode = 0 then 
		il_graba_2	= 1
//		commit;
	else
		messagebox("Error Grabar Tabla CADENA","Error Grabar CADENA SQL: "+sqlca.sqlerrtext)
		il_graba_2	= 0
//		rollback;
	end if
	RETURN (SQLCA.SQLCode <> -1)
END IF
end function

public subroutine wf_limpiar ();long		ll_new,ll_cant,ll_null,ll_tot_reg,ll_indi
date		ld_null
string 	ls_null

dw_anexo_liberador.reset()
if isnull(gd_uf_dia) then
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:gd_uf_dia  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha_dia   ;
end if
ll_new	= dw_anexo_liberador.insertrow(0)
dw_anexo_liberador.SetItem(1, "serie_m", gs_serie)
dw_anexo_liberador.SetItem(1, "nro_liberador", gi_numero)
dw_anexo_liberador.SetItem(1, "ult_folio", 0)
dw_anexo_liberador.SetItem(1, "base", ls_null)
dw_anexo_liberador.SetItem(1, "serie", ls_null)
dw_anexo_liberador.SetItem(1, "nro_oferta", ll_null)
dw_anexo_liberador.SetItem(1, "rut", ll_null)
dw_anexo_liberador.SetItem(1, "tot_pagado", 0)
dw_anexo_liberador.SetItem(1, "cta_pag_m", 0)
dw_anexo_liberador.SetItem(1, "abono_m", 0)
dw_anexo_liberador.SetItem(1, "usuario", gs_user)
dw_anexo_liberador.SetItem(1, "fecha_ingreso", id_fecha_dia)
dw_anexo_liberador.SetItem(1, "forma_pago", ls_null)
//dw_anexo_liberador.SetItem(1, "fecha_cierre", ld_null)
//dw_anexo_liberador.SetItem(1, "fecha_com", ld_null)
dw_anexo_liberador.SetItem(1, "uf_cierre", 0)
dw_anexo_liberador.SetItem(1, "nro_resc", 0)
dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
dw_anexo_liberador.SetItem(1, "estado_comi", "N")
dw_anexo_liberador.SetItem(1, "estado_premio", "N")
dw_anexo_liberador.SetItem(1, "total_com", 0)
dw_anexo_liberador.SetItem(1, "por_ingre", 0)
dw_anexo_liberador.SetItem(1, "porce_sup", 0)
dw_anexo_liberador.SetItem(1, "anexo_liberador_porce_jefe", 0)
dw_anexo_liberador.SetItem(1, "porce_age", 0)
dw_anexo_liberador.SetItem(1, 'estado_rut',1)
dw_anexo_liberador.SetItem(1, 'estado_contrato',1)
dw_anexo_liberador.SetItem(1, "pago_liberador_serie_m", gs_serie)
dw_anexo_liberador.SetItem(1, "pago_liberador_nro_liberador", gi_numero)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha", id_fecha_dia)
dw_anexo_liberador.SetItem(1, "pago_liberador_folio", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_precio", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_pie_pagado", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_pie", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_tasa", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_tasa_base", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_valor_cuota", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_nro_cuotas", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_uf_dia", gd_uf_dia)
dw_anexo_liberador.SetItem(1, "pago_liberador_moneda", ls_null)
dw_anexo_liberador.SetItem(1, "pago_liberador_modificado", gs_user)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_mod", id_fecha_dia)
dw_anexo_liberador.SetItem(1, "pago_liberador_gastos_adm", 0)
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
	ll_tot_reg	= dw_seguro.retrieve(1,'L')
elseif gs_conexion = "Parque La Foresta" then
	ll_tot_reg	= dw_seguro.retrieve(11,'L')
elseif gs_conexion = "Parque Concepción" then
	ll_tot_reg	= dw_seguro.retrieve(801,'L')
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
ls_serie_m				= dw_anexo_liberador.getitemstring(1,'serie_m')
ls_serie					= dw_anexo_liberador.getitemstring(1,'serie')
ls_moneda				= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
ls_base					= dw_anexo_liberador.getitemstring(1,'base')
ls_forma_pago			= dw_anexo_liberador.getitemstring(1,'forma_pago')
ll_nro_liberador		= dw_anexo_liberador.getitemnumber(1,'nro_liberador')
ll_nro_oferta			= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
ll_rut					= dw_anexo_liberador.getitemnumber(1,'rut')
ll_saldo_financiero	= dw_anexo_liberador.getitemnumber(1,'saldo_finan')
ll_nro_cuotas			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
ll_precio				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio')
ll_valor_cuota			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota')
ll_pie					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie')
ll_tasa					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa')
ll_tasa_base			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa_base')
ll_gastos_adm			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm')
ll_uf_dia				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_uf_dia')
ll_cod_parque			= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
ldt_fecha				= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')
ldt_fecha_prim			= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
ldt_fecha_ult			= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_ult')
ldt_fecha_pie			= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_pie')
ldt_fecha_ingreso		= dw_anexo_liberador.getitemdatetime(1,'fecha_ingreso')

if isnull(ls_serie_m) then ls_serie_m=' '
if isnull(ls_serie) then ls_serie=' '
if isnull(ls_moneda) then ls_moneda=' '
if isnull(ls_base) then ls_base=' '
if isnull(ls_forma_pago) then ls_forma_pago=' '
if isnull(ll_nro_liberador) then ll_nro_liberador=0
if isnull(ll_nro_oferta) then ll_nro_oferta=0
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

INSERT INTO	"LOG_ANEXO_LIBERADOR"  
			( "SERIE_M",   "NRO_LIBERADOR",   "RUT",   "BASE",   "SERIE",   "NRO_OFERTA",   "USUARIO_CREA",   "FECHA_CREA",   "FECHA",   "FORMA_PAGO",   "SALDO_FINANCIERO",   "MONEDA",   "PRECIO",   "PIE",   "FECHA_PIE",   "NRO_CUOTAS",   "FECHA_PRIM",   "TASA",	"TASA_BASE",   "GASTOS_ADM",   "UF_DIA",   "VALOR_CUOTA",   "FECHA_ULT",   "FECHA_INGRESO",		"COD_PARQUE" )  
VALUES	( :ls_serie_m, :ll_nro_liberador, :ll_rut, :ls_base, :ls_serie, :ll_nro_oferta, :gs_user,   		  :ldt_fecha_hoy,:ldt_fecha,:ls_forma_pago, :ll_saldo_financiero, :ls_moneda, :ll_precio, :ll_pie, :ldt_fecha_pie,:ll_nro_cuotas, :ldt_fecha_prim,:ll_tasa, :ll_tasa_base,	:ll_gastos_adm, :ll_uf_dia, :ll_valor_cuota, :ldt_fecha_ult,:ldt_fecha_ingreso,	:ll_cod_parque )  
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
end subroutine

public subroutine wf_mostrar_liberador ();Long		ll_count_reg,ll_count,ll_cod_seguro,ll_estado_reg,ll_reg
Double	ldb_monto
string		ls_modifica

cb_aceptar.text 				= "Actualizar"
gi_rut 							= Long(dw_anexo_liberador.GetItemNumber(1, "rut"))
dw_anexo_liberador.SetItem(1, 'estado_rut',0)
dw_anexo_liberador.setitem(1, 'estado_contrato',0)
if dw_clientes.Retrieve(gi_rut)=0 then dw_clientes.insertrow(0)
dw_anexo_liberador.SetItem(1,"compute",upper(dw_clientes.GetItemstring(1,"dv")))
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
	st_memo.italic					= true
else
	st_memo.italic					= false
end if
em_rut.enabled					= false
em_dv.enabled						= false
if dw_anexo_liberador.getitemnumber(1,'nro_resc') = 99 then
	//cb_aceptar.enabled			= false
	ls_modifica			= 'N'
	dw_anexo_liberador.setitem(1,'modifica',ls_modifica)
	dw_anexo_liberador.accepttext()
else
	//cb_aceptar.enabled			= true
	ls_modifica			= 'S'
	dw_anexo_liberador.setitem(1,'modifica',ls_modifica)
	dw_anexo_liberador.accepttext()
end if
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
dw_anexo_liberador.enabled	= true
dw_agente.enabled				= true
dw_supervisor.enabled			= true
dw_jefe.enabled					= true
dw_agente.setfocus()
//dw_anexo_liberador.setfocus()
end subroutine

public subroutine wf_nuevo_liberador ();string	ls_null
long		ll_null
Date		ld_null
setnull(ls_null);setnull(ll_null);setnull(ld_null)

cb_aceptar.text	= "Ingresar"
dw_agente.reset()
dw_anexo_liberador.reset()
dw_supervisor.reset()
dw_jefe.reset()
dw_agente.InsertRow(0)
dw_supervisor.InsertRow(0)
dw_jefe.InsertRow(0)
dw_clientes.InsertRow(0)
dw_anexo_liberador.InsertRow(0)
dw_anexo_liberador.SetItem(1, "serie_m", gs_serie)
dw_anexo_liberador.SetItem(1, "nro_liberador", gi_numero)
dw_anexo_liberador.SetItem(1, "ult_folio", 0)
dw_anexo_liberador.SetItem(1, "base", ls_null)
dw_anexo_liberador.SetItem(1, "serie", ls_null)
dw_anexo_liberador.SetItem(1, "nro_oferta", ll_null)
dw_anexo_liberador.SetItem(1, "rut", ll_null)
dw_anexo_liberador.SetItem(1, "tot_pagado", 0)
dw_anexo_liberador.SetItem(1, "cta_pag_m", 0)
dw_anexo_liberador.SetItem(1, "abono_m", 0)
dw_anexo_liberador.SetItem(1, "usuario", gs_user)
dw_anexo_liberador.SetItem(1, "fecha_ingreso", id_fecha_dia)
dw_anexo_liberador.SetItem(1, "forma_pago", ls_null)
dw_anexo_liberador.SetItem(1, "fecha_cierre", ld_null)
dw_anexo_liberador.SetItem(1, "fecha_com", ld_null)
dw_anexo_liberador.SetItem(1, "uf_cierre", 0)
dw_anexo_liberador.SetItem(1, "nro_resc", 0)
dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
dw_anexo_liberador.SetItem(1, "estado_comi", "N")
dw_anexo_liberador.SetItem(1, "estado_premio", "N")
dw_anexo_liberador.SetItem(1, "total_com", 0)
dw_anexo_liberador.SetItem(1, "por_ingre", 0)
dw_anexo_liberador.SetItem(1, "porce_sup", 0)
dw_anexo_liberador.SetItem(1, "porce_age", 0)
dw_anexo_liberador.SetItem(1, 'estado_rut',1)
dw_anexo_liberador.SetItem(1, "pago_liberador_serie_m", gs_serie)
dw_anexo_liberador.SetItem(1, "pago_liberador_nro_liberador", gi_numero)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha", id_fecha_dia)
dw_anexo_liberador.SetItem(1, "pago_liberador_folio", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_precio", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_pie_pagado", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_pie", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_tasa", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_tasa_base", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_valor_cuota", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_nro_cuotas", 0)
dw_anexo_liberador.SetItem(1, "pago_liberador_uf_dia", gd_uf_dia)
dw_anexo_liberador.SetItem(1, "pago_liberador_moneda", ls_null)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_prim", ld_null)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_ult", ld_null)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_pie", ld_null)
dw_anexo_liberador.SetItem(1, "pago_liberador_modificado", gs_user)
dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_mod", id_fecha_dia)
dw_anexo_liberador.SetItem(1, "pago_liberador_gastos_adm", 0)
em_rut.enabled		= true
em_dv.enabled		= true
em_rut.setfocus()
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

dw_anexo_liberador.AcceptText()
dw_clientes.AcceptText()

ls_moneda		= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
lld_tasa			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa_base'))
if lld_tasa>100 then
	messagebox("Error","Valor Tasa Contrato Inválida")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_tasa_base')
	RETURN FALSE
end if
if ls_moneda='2' then //uf
	lld_kapital				= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio'))
	lld_valor_cuo			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota'))
	lld_valor_adm			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm'))
	lld_pie					= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie'))
	if lld_kapital>=500 then 
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_precio')
		RETURN FALSE
	elseif lld_valor_cuo>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_valor_cuota')
		RETURN FALSE
	elseif lld_valor_adm>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Gasto Administrativo)")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_gastos_adm')
		RETURN FALSE
	elseif lld_pie>=500 then
		messagebox("Error","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_pie')
		RETURN FALSE
	end if
end if
IF IsNull(dw_anexo_liberador.GetItemNumber(1, "rut")) THEN
	MessageBox("Error", "Debe ingresar el rut del cliente")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('rut')
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemString(1, "cod_agente")) THEN
	MessageBox("Error", "Debe ingresar el codigo del agente")
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemString(1, "cod_super")) THEN
	MessageBox("Error", "Debe ingresar el codigo del supervisor")
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemString(1, "base")) THEN
	MessageBox("Error", "Debe ingresar base del contrato asociado")
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemString(1, "serie")) THEN
	MessageBox("Error", "Debe ingresar la serie del contrato asociado")
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemNumber(1, "nro_oferta")) THEN
	MessageBox("Error", "Debe ingresar el número del contrato asociado")
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemString(1, "serie_m")) THEN
	MessageBox("Error", "Debe ingresar la serie del Liberador")
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemNumber(1, "nro_liberador")) THEN
	MessageBox("Error", "Debe ingresar el número del Liberador")
	RETURN FALSE
END IF
ls_forma_pago	= dw_anexo_liberador.GetItemString(1, "forma_pago")
IF IsNull(ls_forma_pago) THEN
	MessageBox("Error", "Debe ingresar la forma de pago")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('forma_pago')
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemString(1, "pago_liberador_moneda")) THEN
	MessageBox("Error", "Debe ingresar el tipo de moneda")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_moneda')
	RETURN FALSE
END IF
IF dw_anexo_liberador.GetItemNumber(1, "pago_liberador_precio") = 0 THEN
	MessageBox("Error", "Debe ingresar precio")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_precio')
	RETURN FALSE
END IF
IF dw_anexo_liberador.GetItemNumber(1, "pago_liberador_tasa_base") = 0  and (dw_anexo_liberador.GetItemString(1, 'forma_pago')='2' or dw_anexo_liberador.GetItemString(1, 'forma_pago')='4') THEN
	ll_res		= MessageBox("Error", "Debe ingresar Tasa Contrato, desea Ingresar en '0'",Exclamation!,YesNo!,2)
	if ll_res <> 1 then
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_tasa_base')
		RETURN FALSE
	end if
END IF
lld_gastos_adm	= double(dw_anexo_liberador.GetItemNumber(1, "pago_liberador_gastos_adm"))
IF lld_gastos_adm = 0  and (ls_forma_pago='2' or ls_forma_pago='4')THEN
	ll_res		= MessageBox("Error", "Debe ingresar Gasto Administrativo, desea Ingresar en '0'",Exclamation!,YesNo!,2)
	if ll_res <> 1 then
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_gastos_adm')
		RETURN FALSE
	end if
END IF
IF dw_anexo_liberador.GetItemNumber(1, "pago_liberador_valor_cuota") = 0 THEN
	MessageBox("Error", "Debe ingresar valor de la cuota")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_valor_cuota')
	RETURN FALSE
END IF
IF dw_anexo_liberador.GetItemNumber(1, "pago_liberador_nro_cuotas") = 0 THEN
	MessageBox("Error", "Debe ingresar el número de cuotas")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_nro_cuotas')
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemDateTime(1, "pago_liberador_fecha_prim")) THEN
	MessageBox("Error", "Debe ingresar la fecha del primer vencimiento")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_fecha_prim')
	RETURN FALSE
END IF
IF IsNull(dw_anexo_liberador.GetItemDateTime(1, "pago_liberador_fecha_ult")) THEN
	MessageBox("Error", "Debe ingresar la fecha del último vencimiento")
	dw_anexo_liberador.setfocus()
	dw_anexo_liberador.setcolumn('pago_liberador_fecha_ult')
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
RETURN TRUE
end function

public subroutine wf_buscar_seguro (string as_base, string as_serie, double al_numero);String	ls_base_aux

SELECT	"SEGURO_RENTA_DECESO"."BASE_CTTO_ORIGINAL"  
INTO 		:ls_base_aux  
FROM 		"SEGURO_RENTA_DECESO"  
WHERE  ( "SEGURO_RENTA_DECESO"."BASE_CTTO_ORIGINAL" = :as_base ) AND  
		 ( "SEGURO_RENTA_DECESO"."SERIE_CTTO_ORIGINAL" = :as_serie ) AND  
		 ( "SEGURO_RENTA_DECESO"."NUMERO_CTTO_ORIGINAL" = :al_numero )   
USING		sqlca;
if sqlca.sqlcode=0 then
	cb_ingresar.italic	= true
else
	cb_ingresar.italic	= false
end if
end subroutine

public subroutine wf_comisiones (string serie, double numero, double pie, integer credito);Long	 correlativo,ll_cod_parque
double c_pie,	c_primera,c_segunda,c_tercera,c_cuarta,c_quinta ,c_sexta ,c_septima, c_octava, c_novena, porce_comi 

ll_cod_parque	= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
SELECT	SERIE,NUMERO  
INTO 		:serie,:numero  
FROM 		COMISION_PROMESA  
WHERE  ( BASE = 'L' ) AND ( SERIE = :serie ) AND ( NUMERO = :numero )   ;
//if credito = 1 then pie = 100
if sqlca.sqlcode = 0 then
	if pie < 10 then
		SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA, 	C_NOVENA,	(C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) AS PORCENTAJE  
		INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima, :c_octava,:c_novena,	:porce_comi 
		FROM 		PORCENTAJE_COMISIONES  
		WHERE  ( PIE_MIN <= :pie AND  PIE_MAX >= :pie) AND  
					AREA = 'X' AND T_CONS = 'X' AND ( CREDITO_MIN <= :credito AND CREDITO >= :credito ) and
				 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and
				 ( COD_PARQUE = :ll_cod_parque );
	elseif pie >= 10 then
		SELECT	CORRELATIVO ,C_PIE ,C_PRIMERA ,C_SEGUNDA ,C_TERCERA ,C_CUARTA ,C_QUINTA ,C_SEXTA  ,C_SEPTIMA, C_OCTAVA,	C_NOVENA, (C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) AS PORCENTAJE  
		INTO 		:correlativo,:c_pie,:c_primera,:c_segunda,:c_tercera,:c_cuarta,:c_quinta,:c_sexta ,:c_septima,:c_octava, :c_novena,:porce_comi 
		FROM 		PORCENTAJE_COMISIONES  
		WHERE  ( PIE_MIN <= :pie AND  PIE_MAX >= :pie) AND  
					AREA = 'X' AND T_CONS = 'X' and 
				 ( C_PIE + C_PRIMERA + C_SEGUNDA + C_TERCERA + C_CUARTA + C_QUINTA + C_SEXTA + C_SEPTIMA + C_OCTAVA + C_NOVENA) > 0  and
				 ( COD_PARQUE = :ll_cod_parque );
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
		where base    = 'L' and serie = :serie and numero = :numero ;
		if sqlca.sqlcode = 0 then
			UPDATE	"ANEXO_LIBERADOR"  
			SET 		"PORCE_AGE" = :porce_comi ,
				 		"ESTATUS_COMISION" = '1'  
			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :serie ) AND  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :numero ) ;
			if sqlca.sqlcode = 0 then
				commit;
			else
				ROLLBACK;
			end if
		end if
	end if
end if
end subroutine

on w_ingresar_liberador.create
this.pb_2=create pb_2
this.em_serie=create em_serie
this.cb_3=create cb_3
this.dw_seguro=create dw_seguro
this.cb_ingresar=create cb_ingresar
this.cb_seguro2=create cb_seguro2
this.cb_ver_cuenta=create cb_ver_cuenta
this.cb_porce_comi=create cb_porce_comi
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
this.dw_supervisor=create dw_supervisor
this.dw_agente=create dw_agente
this.st_seg_fune=create st_seg_fune
this.dw_anexo_liberador=create dw_anexo_liberador
this.Control[]={this.pb_2,&
this.em_serie,&
this.cb_3,&
this.dw_seguro,&
this.cb_ingresar,&
this.cb_seguro2,&
this.cb_ver_cuenta,&
this.cb_porce_comi,&
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
this.dw_supervisor,&
this.dw_agente,&
this.st_seg_fune,&
this.dw_anexo_liberador}
end on

on w_ingresar_liberador.destroy
destroy(this.pb_2)
destroy(this.em_serie)
destroy(this.cb_3)
destroy(this.dw_seguro)
destroy(this.cb_ingresar)
destroy(this.cb_seguro2)
destroy(this.cb_ver_cuenta)
destroy(this.cb_porce_comi)
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
destroy(this.dw_supervisor)
destroy(this.dw_agente)
destroy(this.st_seg_fune)
destroy(this.dw_anexo_liberador)
end on

event open;long		ll_cant,ll_null,ll_tot_reg,ll_indi,ll_est_reg,ll_prima_peso,ll_suma_peso,ll_tot_reg_seguro,ll_codigo,ldb_iva
double	ll_numero_doc_pend,ldb_factor_prima,ldb_suma
datetime	ld_null
string 	ls_null,ls_opcion_dig,ls_serie,ls_serie_doc_pend,ls_moneda

SELECT 	"TASA"."IVA"  
INTO 		:ldb_iva
FROM 	"TASA"   ;

dw_anexo_liberador.setitem(1,'valor_iva',ldb_iva)

SELECT DISTINCT "FACTORES"."FECHA_VIGENCIA"  
INTO 		:idt_fecha_vig  
FROM 	"FACTORES"  
WHERE 	"FACTORES"."ESTADO_VIGENCIA" = 'V'   
USING	sqlca;
dw_seguro.SetTransObject(SQLCA)
if gs_conexion = "Parque El Prado" then
	ll_tot_reg	= dw_seguro.retrieve(1,'L')
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
	p_1.picturename 		= 'logo_e_s.bmp'
	ll_tot_reg	= dw_seguro.retrieve(11,'L')
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 		= 'logo_parque_conce.jpg'
	ll_tot_reg				= dw_seguro.retrieve(801,'L')
end if
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		//dw_seguro.setitem(ll_indi,'c_estado_reg',0)
	next
	dw_seguro.accepttext()
end if
dw_seguro.enabled			= false

SELECT	"ENCARGADOS"."DIGITACION"
INTO 		:ls_opcion_dig
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_opcion_dig='1' or ls_opcion_dig='3'then 
		cb_aceptar.enabled	= true
	elseif ls_opcion_dig='2' then
		cb_aceptar.enabled	= false
	else
		cb_aceptar.enabled	= false
	end if
end if
gf_centrar(w_ingresar_liberador)
dw_clientes.SetTransObject(SQLCA)

dw_1.settransobject(sqlca)
dw_anexo_liberador.SetTransObject(SQLCA)
dw_anexo_liberador.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
if isvalid(w_consultar_documentos_pendientes) then 
	ls_serie_doc_pend			= gs_serie
	ll_numero_doc_pend		= gi_numero
end if	
dw_agente.SetTransObject(SQLCA)
dw_supervisor.SetTransObject(SQLCA)
dw_jefe.SetTransObject(SQLCA)
em_serie.text		= 'L'
gs_base				= 'L'
gs_serie				= 'L'
em_numero.text	= ''
em_rut.text			= ''
em_dv.text			= ''
id_fecha_dia		= date(gdt_fec_sistema)
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
em_serie.text		= gs_serie
cb_ingresar.italic 	= false
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
	close(w_ingresar_liberador)
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

type pb_2 from picturebutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 1280
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
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= true
end event

event clicked;String		ls_string
Long		ll_existe

gs_serie		= trim(em_serie.text)
gi_numero	= Double(em_numero.text)
gs_base		= 'L'
ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
ll_existe		= dw_seguro.find('(codigo=10 or codigo=11 or codigo=12) and c_estado_reg=0',1,dw_seguro.rowcount())
if ll_existe > 0 and gi_numero > 0 then
	if isvalid(w_ingresar_benef_seguro_funeraria) then close(w_ingresar_benef_seguro_funeraria)
	openwithparm(w_ingresar_benef_seguro_funeraria,ls_string)
else
	messagebox("Advertencia","Debe estar Seleccionado Un Seguro Funerario (10-Seg.Fun100 o 11-Seg.Fun.300 o 12-Seg.Fun.500)")
end if

end event

type em_serie from dropdownlistbox within w_ingresar_liberador
event ue_mousemove pbm_mousemove
event ue_tecla pbm_keyup
integer x = 457
integer y = 204
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
end event

event modified;gs_serie	= this.text
dw_anexo_liberador.setitem(1,'nro_liberador',gs_serie)
dw_anexo_liberador.accepttext()
end event

type cb_3 from commandbutton within w_ingresar_liberador
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
dw_anexo_liberador.accepttext()
dw_anexo_liberador.setitem(1,'pago_liberador_pie',ll_nulo)
dw_anexo_liberador.setitem(1,'pago_liberador_fecha_pie',ld_nulo)
dw_anexo_liberador.accepttext()
dw_anexo_liberador.setfocus()
dw_anexo_liberador.setcolumn('pago_liberador_pie')
end event

type dw_seguro from datawindow within w_ingresar_liberador
integer x = 2505
integer y = 276
integer width = 846
integer height = 396
integer taborder = 70
string dataobject = "dw_lista_seguro_seleccion_ctto"
boolean vscrollbar = true
boolean border = false
end type

event itemchanged;Double	ldb_factor_prima,ldb_suma,ll_suma_peso,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_anexo_liberador.accepttext()

ll_tot_reg						= dw_seguro.rowcount()

if ll_tot_reg >= 0 then
	for ll_indi=1 to ll_tot_reg
		ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
		ll_codigo					= dw_seguro.getitemnumber(ll_indi,'codigo')
		if row = ll_indi then
			ll_est_reg = integer(data)
		end if
		if ll_est_reg = 0 then
			ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
			if ll_codigo = 8 then
				ldb_factor_prima = 0.0
			end if
			ldb_suma			= ldb_suma + ldb_factor_prima
		end if
	next
if isnull(ldb_suma) then ldb_suma=0
	dw_anexo_liberador.setitem(1,'cuota_seguros',ldb_suma)
end if
dw_seguro.accepttext()
dw_anexo_liberador.accepttext()


String		ls_forma_pago
Long		ll_fila,ll_estado,ll_existe

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

event itemfocuschanged;Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_anexo_liberador.accepttext()

ll_tot_reg						= dw_seguro.rowcount()

if ll_tot_reg >= 0 then
	for ll_indi=1 to ll_tot_reg
		ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
		ll_codigo					= dw_seguro.getitemnumber(ll_indi,'codigo')
		if ll_est_reg = 0 then
			ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
			if ll_codigo = 8 then
				ldb_factor_prima = 0.0
			end if
			ldb_suma			= ldb_suma + ldb_factor_prima
		end if
	next
if isnull(ldb_suma) then ldb_suma=0
	dw_anexo_liberador.setitem(1,'cuota_seguros',ldb_suma)
end if
dw_seguro.accepttext()
dw_anexo_liberador.accepttext()

Long		ll_fila,ll_estado,ll_existe,ll_cod_reg

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

event clicked;Double	ldb_factor_prima,ldb_suma=0,ll_suma_peso=0,lld_uf,ll_prima_peso
Long		ll_indi,ll_tot_reg,ll_est_reg,ll_edad,ll_codigo
String		ls_columna,ls_moneda

dw_seguro.accepttext()
dw_anexo_liberador.accepttext()

ll_tot_reg						= dw_seguro.rowcount()

if ll_tot_reg >= 0 then
	for ll_indi=1 to ll_tot_reg
		ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
		ll_codigo					= dw_seguro.getitemnumber(ll_indi,'codigo')
		if ll_est_reg = 0 then
			ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
			if ll_codigo = 8 then
				ldb_factor_prima = 0.0
			end if
			ldb_suma			= ldb_suma + ldb_factor_prima
		end if
	next
if isnull(ldb_suma) then ldb_suma=0
	dw_anexo_liberador.setitem(1,'cuota_seguros',ldb_suma)
end if
dw_seguro.accepttext()
dw_anexo_liberador.accepttext()
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

type cb_ingresar from commandbutton within w_ingresar_liberador
integer x = 2075
integer y = 1740
integer width = 882
integer height = 76
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Ingresar Segundo Segurado"
end type

event clicked;String	ls_string
Long		ll_nro_aux,ll_cantidad,ll_tipo_seguro=3
Double	lld_factor_seg_comp
Datetime	ldt_fecha_duracion_vigencia,ldt_fecha

if Double(em_numero.text) > 0 then
	gs_base		= 'L'
	gs_serie		= trim(em_serie.text)
	gi_numero	= Double(em_numero.text)
	SELECT	"TIPO_SEGURO"."CANTIDAD_BENEFICIARIO",   
				"TIPO_SEGURO"."FACTOR",
				"TIPO_SEGURO"."FECHA_DURACION_VIGENCIA"
	INTO 		:ll_cantidad,   
				:lld_factor_seg_comp,
				:ldt_fecha_duracion_vigencia
	FROM 		"TIPO_SEGURO"  
	WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_tipo_seguro   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		SELECT	"SEGURO_RENTA_DECESO"."NUMERO_CTTO_ORIGINAL"  
		INTO 		:ll_nro_aux  
		FROM 		"SEGURO_RENTA_DECESO"  
		WHERE  ( "SEGURO_RENTA_DECESO"."BASE_CTTO_ORIGINAL" = :gs_base ) AND  
				 ( "SEGURO_RENTA_DECESO"."SERIE_CTTO_ORIGINAL" = :gs_serie ) AND  
				 ( "SEGURO_RENTA_DECESO"."NUMERO_CTTO_ORIGINAL" = :gi_numero )   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			ldt_fecha	= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')
			INSERT INTO "SEGURO_RENTA_DECESO"  
						( "BASE_CTTO_ORIGINAL",	"SERIE_CTTO_ORIGINAL",  "NUMERO_CTTO_ORIGINAL", "FECHA",   	"FOLIO_SEGURO",   "CODIGO_SEGURO",  "VALOR_DECESO_UF",   "VALOR_RENTA_UF",	"CANTIDAD_MESES_RENTA",	"FACTOR" )  
			VALUES	( :gs_base,   				:gs_serie,					:gi_numero,					:ldt_fecha, :gi_numero,   		:ll_tipo_seguro, 	0,   						0,						:ll_cantidad,   			:lld_factor_seg_comp )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				cb_ingresar.italic	= true
			else
				rollback;
			end if
		end if
		ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(lld_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
		openwithparm(w_ingreso_beneficiario_seg_comple,ls_string)
	end if
end if
end event

type cb_seguro2 from commandbutton within w_ingresar_liberador
boolean visible = false
integer x = 2153
integer y = 2088
integer width = 521
integer height = 76
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
	gs_base		= 'L'
	gs_serie		= trim(em_serie.text)
	gi_numero	= Double(em_numero.text)
	SELECT	"CADENA"."CODIGO"  
	INTO 		:ls_base_aux  
	FROM 		"CADENA"  
	WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ll_tipo_seguro				= 3
		SELECT	"TIPO_SEGURO"."CANTIDAD_BENEFICIARIO",   
					"TIPO_SEGURO"."FACTOR",
					"TIPO_SEGURO"."FECHA_DURACION_VIGENCIA"
		INTO 		:ll_cantidad,   
					:lld_factor_seg_comp,
					:ldt_fecha_duracion_vigencia
		FROM 		"TIPO_SEGURO"  
		WHERE 	"TIPO_SEGURO"."CODIGO" = :ll_tipo_seguro   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ldt_fecha_duracion_vigencia > gdt_fec_sistema then
				ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(lld_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
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

type cb_ver_cuenta from commandbutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 2478
integer y = 1656
integer width = 480
integer height = 76
integer taborder = 160
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

type cb_porce_comi from commandbutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 2075
integer y = 1656
integer width = 389
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;String	ls_string
if gi_numero>0 and not isnull(gs_serie) then
	gs_base		= 'L'
	gs_serie 	= trim(em_serie.text)
	gi_numero	= Double(trim(em_numero.text))	
	ls_string 	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	OpenWithParm(w_porcentaje_comision_ctto,ls_string)
end if
end event

type p_1 from picture within w_ingresar_liberador
integer x = 37
integer y = 32
integer width = 251
integer height = 268
string picturename = "logo_e.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_help_memo from statictext within w_ingresar_liberador
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

type st_memo from commandbutton within w_ingresar_liberador
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

event clicked;string			ls_numero,ls_serie,ls_string
Double		ll_nro_aux

gs_serie 		= trim(em_serie.text)
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
		ls_string 	= 'L'+'~t'+gs_serie+'~t'+string(gi_numero)
		OpenWithParm(w_ingreso_cd_memorandum_digitacion,ls_string)
		w_ingreso_cd_memorandum_digitacion.setfocus()
	else
		messagebox("Advertencia","Antes de Ingresar Memorandum debería estar Digitado Anexo Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"####,###,###,##0"))
	end if
//	em_numero.setfocus()
end if
end event

type st_buscar from statictext within w_ingresar_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1065
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= false
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

type pb_buscar from picturebutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 1093
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

event clicked;openwithparm(w_listado_contrato,'L')
end event

type dw_jefe from datawindow within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 2939
integer y = 160
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

event itemchanged;Long		ll_resp,ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_numero_asoc,&
			ll_nro,ll_rut,ll_annos_lib,ll_tot_reg,ll_indi,ll_codigo_iva
String	ls_string,ls_obs,ls_tipo_cont,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_jefe,ls_cod_jefe,&
			ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,ls_base_aux,&
			ls_base_contrato,ls_serie_contrato,ls_fecha
Datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,&
			ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf

this.accepttext()
ls_cod_jefe	= dw_jefe.getitemstring(1,'jefes')
if not isnull(ls_cod_jefe) then
	if gi_rut>0 then
		is_sw_jef	= 'S'
		gs_serie 	= trim(em_serie.Text)
		gs_base		= 'L'
		if is_pasa_asigna='S' then
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
						dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
						dw_anexo_liberador.accepttext()
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
										if ls_tipo_cont = '3' OR ls_tipo_cont = '4' then
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
										ls_obs	= 'Liberador creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_anexo_liberador.enabled			= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_anexo_liberador.setitem(1,'estado_rut',1)
										else
											if gi_rut>0 then dw_anexo_liberador.setitem(1,'estado_rut',0)
										end if
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 		"CADENA"  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",		"LIBERADOR_ANNOS"
											INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,		:ll_annos_lib
											FROM 	"REVISION_CONTRATOS"  
											WHERE	( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
														( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
														( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) 
													//	ANd									( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A' OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V')  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_anexo_liberador.SetItem(1,'base',ls_base_asoc)
												dw_anexo_liberador.SetItem(1,'serie',ls_serie_asoc)
												dw_anexo_liberador.SetItem(1,'nro_oferta',ll_numero_asoc)
												dw_anexo_liberador.SetItem(1,'pago_liberador_fecha',ldt_fecha_ctto_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_moneda',ls_moneda_rev)
												dw_anexo_liberador.SetItem(1,'forma_pago',ls_forma_pago_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_pie',ldb_pie_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_nro_cuotas',ll_plazo_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_gastos_adm',ldb_gasto_adm_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_valor_cuota',ldb_valor_cuota_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_precio',ldb_precio_ctto_rev)
												dw_anexo_liberador.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_fecha_prim',ldt_fecha_prim_rev)
												
												ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
												//if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
												dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
												
												dw_anexo_liberador.SetItem(1,'pago_liberador_anno_liberar',ll_annos_lib)
												SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
												INTO 		:ldb_int_peso,								:ldb_int_uf
												FROM 	"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING	sqlca;
												if sqlca.sqlcode=0 then
													if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
														ldb_int_peso	= 0
														ldb_int_uf		= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_uf)
													end if
												end if
												ls_base_contrato 					= dw_anexo_liberador.getitemstring(1,'base')
												ls_serie_contrato 				= dw_anexo_liberador.getitemstring(1,'serie')
												ll_nro								= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
												if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
													dw_anexo_liberador.getchild('serie',idw_detalle)
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
															dw_anexo_liberador.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																		  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																		  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																		  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
															if ll_resp=1 then
																dw_anexo_liberador.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																dw_anexo_liberador.setitem(1,'estado_contrato',1)
																cb_aceptar.enabled	= false
															end if
														end if
													else
														MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
														dw_anexo_liberador.setitem(1,'estado_contrato',1)
														cb_aceptar.enabled	= false
													end if
												end if
											end if
										end if
										dw_anexo_liberador.setfocus()
										dw_anexo_liberador.setcolumn('base')
									else
										dw_anexo_liberador.enabled			= false
										dw_anexo_liberador.setitem(1,'estado_rut',1)
										messagebox("Advertencia","NO fue Asignado Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									end if
								else
									dw_anexo_liberador.setitem(1,'estado_rut',1)
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
						dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
						dw_anexo_liberador.accepttext()
						if is_sw_jef='S' and gs_age<>'' and not isnull(gs_age) and gs_sup<>'' and not isnull(gs_sup) then//if il_resp_age=2 and il_resp_sup=2 and is_sw_jef='S' then
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
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs	= 'Liberador creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									dw_anexo_liberador.enabled			= true
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_liberador.setitem(1,'estado_rut',1)
									else
										if gi_rut>0 then dw_anexo_liberador.setitem(1,'estado_rut',0)
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM 		"CADENA"  
									WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
											 ( "CADENA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"FECHA_CTTO",		"UF_FECHA_CTTO",	"MONEDA",			"FORMA_PAGO",		"AREA",			"PIE",				"PLAZO",			"FECHA_PRIM",			"GASTO_ADM",			"SALDO_FINANCIAR",			"VALOR_CUOTA",		"PRECIO_CONTRATO",	"FACTOR_CUOTA",		"COD_PARQUE",		"BASE_ASOC",	"SERIE_ASOC",	"NUMERO_ASOC",		"LIBERADOR_ANNOS"
										INTO 		:ldt_fecha_ctto_rev,	:ldb_uf_ctto_rev,		:ls_moneda_rev,	:ls_forma_pago_rev,	:ls_area_rev,	:ldb_pie_rev,	:ll_plazo_rev,	:ldt_fecha_prim_rev,	:ldb_gasto_adm_rev,	:ldb_saldo_financiar_rev,	:ldb_valor_cuota_rev,	:ldb_precio_ctto_rev,		:ldb_factor_cuota_rev,	:ll_cod_parque_rev,	:ls_base_asoc,	:ls_serie_asoc,	:ll_numero_asoc,		:ll_annos_lib
										FROM 		"REVISION_CONTRATOS"  
										WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
												 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
												 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) 
												 //AND
												// ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A' OR "REVISION_CONTRATOS"."ESTADO_REVISION" = 'V')  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_liberador.SetItem(1,'base',ls_base_asoc)
											dw_anexo_liberador.SetItem(1,'serie',ls_serie_asoc)
											dw_anexo_liberador.SetItem(1,'nro_oferta',ll_numero_asoc)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha',ldt_fecha_ctto_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_moneda',ls_moneda_rev)
											dw_anexo_liberador.SetItem(1,'forma_pago',ls_forma_pago_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_pie',ldb_pie_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_nro_cuotas',ll_plazo_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_gastos_adm',ldb_gasto_adm_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_precio',ldb_precio_ctto_rev)
											dw_anexo_liberador.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha_prim',ldt_fecha_prim_rev)
											
											ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
											//if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
											dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
											
											dw_anexo_liberador.SetItem(1,'pago_liberador_anno_liberar',ll_annos_lib)
											SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
											INTO 		:ldb_int_peso,								:ldb_int_uf
											FROM 		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
													ldb_int_peso	= 0
													ldb_int_uf		= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_uf)
												end if
											end if
											ls_base_contrato 					= dw_anexo_liberador.getitemstring(1,'base')
											ls_serie_contrato 				= dw_anexo_liberador.getitemstring(1,'serie')
											ll_nro								= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
											if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
												dw_anexo_liberador.getchild('serie',idw_detalle)
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
														dw_anexo_liberador.setitem(1,'estado_contrato',0)
														cb_aceptar.enabled	= true
													else
														ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																	  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																	  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																	  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
														if ll_resp=1 then
															dw_anexo_liberador.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															dw_anexo_liberador.setitem(1,'estado_contrato',1)
															cb_aceptar.enabled	= false
														end if
													end if
												else
													MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
													dw_anexo_liberador.setitem(1,'estado_contrato',1)
													cb_aceptar.enabled	= false
												end if
											end if
										end if
									end if
									dw_anexo_liberador.setfocus()
									dw_anexo_liberador.setcolumn('base')
								else
									dw_anexo_liberador.enabled			= false
									dw_anexo_liberador.setitem(1,'estado_rut',1)
									messagebox("Advertencia","NO fue Asignado Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
								end if
							else
								dw_anexo_liberador.setitem(1,'estado_rut',1)
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
		////
		dw_anexo_liberador.accepttext( )
		ll_tot_reg						= dw_seguro.rowcount()
		if date(ldt_fecha_ctto_rev) >= date('20/02/2023') then
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ll_codigo_iva = dw_seguro.getitemnumber(ll_indi,'codigo')
					dw_seguro.setitem(ll_indi,'c_estado_reg',1)
					if ll_codigo_iva = 8 and date(ldt_fecha_ctto_rev) >= date('20/02/2023') then
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
		dw_anexo_liberador.accepttext( )
		////
		
		if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
			commit using sqlca;
			UPDATE	"ANEXO_LIBERADOR"  
			SET 		"COD_AGENTE" = :gs_age,   
						"COD_SUPER" = :gs_sup,   
						"COD_JEF" = :gs_jefe  
			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
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

type st_salir from statictext within w_ingresar_liberador
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

type st_limpiar from statictext within w_ingresar_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 878
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

type st_imprimir from statictext within w_ingresar_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 690
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

type st_grabar from statictext within w_ingresar_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 503
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

type pb_print from picturebutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 718
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

event clicked;String	ls_serie
Long		ll_numero

ls_serie		= trim(em_serie.text)
ll_numero	= Double(trim(em_numero.text))
if not isnull(ls_serie) and ll_numero>0 then
	if dw_1.retrieve(ls_serie,ll_numero) > 0 then f_Print( dw_1 )
end if
end event

type pb_limpiar from picturebutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 905
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

event clicked;//setnull(gs_base);setnull(gs_serie);setnull(gi_numero)
em_serie.text			= 'L'
gs_base					= 'L'
gs_serie					= 'L'
em_serie.text			= gs_serie
setnull(gl_cod_parque)
em_numero.text		= ''
em_rut.text				= ''
em_dv.text				= ''
is_pasa_asigna			= 'N'
is_sw_age				= 'N'
is_sw_sup				= 'N'
is_sw_jef				= 'N'
st_memo.italic			= false
em_rut.enabled		= true
em_dv.enabled			= true
cb_ingresar.italic		= false
wf_limpiar()
em_numero.setfocus()
end event

type cb_cerrar from picturebutton within w_ingresar_liberador
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

event clicked;close(w_ingresar_liberador)
end event

type cb_aceptar from picturebutton within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 530
integer y = 1664
integer width = 174
integer height = 152
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

event ue_mousemove;st_limpiar.visible			= false
st_grabar.visible			= true
st_salir.visible				= false
st_imprimir.visible			= false
st_buscar.visible			= false
st_help_memo.visible		= false
st_seg_fune.visible		= false
end event

event clicked;double 	ld_porcent_age, ld_porcent_sup,ll_valor_cuota,pie,precio,porcentaje,ldb_tasa,ldb_uf_dia,ldb_gastos_adm,&
			ldb_pie_pagado,ld_saldo_finan,ld_porc_jefe,ldb_tasa_base,ldb_pie,ldb_valor_cuota,ldb_valor_cuota_mant,&
			ldb_calculo,ldb_monto,ldb_tasa_int_cta,numero,ldb_tasa_cta
datetime	ld_fecha_pie,ld_fecha_ult,ld_fecha,ld_fecha_prim,ldt_fecha_pie,ldt_fecha_prim,ldt_fec_venc_mant
long 		ll_contador,rut,rut_busca,nro_cuotas, i,ll_estado_cd,ll_estado_graba,ll_nro_asoc,ll_tot_reg,ll_indi,ll_est_reg,ll_codigo,&
			ll_cta_pag_m,ll_ctas,ll_ult_folio,ll_plazo,ll_rut,ll_cod_parque,ll_count_vig,ll_count,ll_anno_liberar,ll_ctas_pag_isa,ll_dias_tope_def,&
			ll_dias_inicio_def,ll_count_lib,ll_cant
//Int		ll_tasa
string 	compute,serie,tipo_cont,ls_moneda,tipo_cons,area,forma_pago,ls_depto_asignado,&
			ls_glosa,ls_memo,ls_ref,ls_base_asoc,ls_serie_asoc,ls_anexo_lib,ls_dv,&
			ls_estado_cadena,ls_modif,ls_canal_venta
Datetime	ld_fecha_min,ld_fecha_max

dw_anexo_liberador.accepttext()
SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  INTO :gdt_fec_sistema,	:ll_dias_tope_def,			:ll_dias_inicio_def
FROM 	"TASA"  ;

if not isnull(gs_base) and not isnull(gs_serie) and gi_numero>0 and gi_rut>0 then
	if String(dw_anexo_liberador.getitemstring(1,'compute')) <> String(gf_obtener_dv(long(dw_anexo_liberador.GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.SetColumn('rut')
		return
	end if
	gs_age			= dw_agente.getitemstring(1,'agente')
	gs_sup			= dw_supervisor.getitemstring(1,'supervisores')
	gs_jefe			= dw_jefe.getitemstring(1,'jefes')
	precio   			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio')
	forma_pago		= dw_anexo_liberador.getitemstring(1,'forma_pago')
	gl_cod_parque	= dw_anexo_liberador.GetItemNumber(1,"cadena_cod_parque")
	ldb_pie			= dw_anexo_liberador.GetItemNumber(1,'pago_liberador_pie')
	ldt_fecha_pie	= dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
	SELECT 	count("ANEXO_LIBERADOR"."NRO_LIBERADOR"  )
	INTO 		:ll_cant 
	FROM 	"ANEXO_LIBERADOR"  
	WHERE 	( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   ;
	if ll_cant =0 or dw_anexo_liberador.getitemnumber(1,'nro_resc') = 0 then
		ld_fecha_min	= datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
		ld_fecha_max	= datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
		if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
			messagebox("Advertencia","Fecha Pie Inválida")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_fecha_pie')
			return
		end if
	end if
	if isnull(gl_cod_parque) or gl_cod_parque=0 then
		messagebox('Advertencia','Debe Ingresar Código Parque',stopsign!)
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('cadena_cod_parque')
		return
	end if
	if isnull(forma_pago) or forma_pago='' then
		messagebox('Advertencia','Debe Ingresar Forma de Pago',stopsign!)
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('forma_pago')
		return
	end if
	if isnull(precio) or precio<=0 then
		messagebox('Advertencia','Debe Ingresar Precio',stopsign!)
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_precio')
		return
	end if
	if (isnull(ldb_pie) and isnull(ldt_fecha_pie)) or (ldb_pie=0 and isnull(ldt_fecha_pie)) then
	else
		if (isnull(ldb_pie) and not isnull(ldt_fecha_pie)) or (not isnull(ldb_pie) and isnull(ldt_fecha_pie)) or&
			(ldb_pie=0 and not isnull(ldt_fecha_pie))then
			if isnull(ldb_pie) or ldb_pie=0 then 
				messagebox('Advertencia','Debe Ingresar Pie',stopsign!)
				dw_anexo_liberador.setfocus()
				dw_anexo_liberador.setcolumn('pago_liberador_pie')
			elseif isnull(ldt_fecha_pie) then
				messagebox('Advertencia','Debe Ingresar Fecha Pie',stopsign!)
				dw_anexo_liberador.setfocus()
				dw_anexo_liberador.setcolumn('pago_liberador_fecha_pie')
			end if
			return
		end if
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
	SELECT	"SUPERVISOR"."PORC_SUPERVISOR"  
	INTO 		:ld_porcent_sup  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
	USING		sqlca;
	if isnull(ld_porcent_sup) or ld_porcent_sup=0 then
		messagebox('Advertencia','Error Porcentaje de Comisión Supervisor Inválida, debe chequear con Departamento Informática Tabla Supervisor',stopsign!)
		dw_anexo_liberador.setfocus()
		return
	end if
	SELECT DISTINCT	"JEFE_VENTAS"."PORC_JEFE_VTA"  
	INTO 		:ld_porc_jefe  
	FROM 		"JEFE_VENTAS"  
	WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
	USING		sqlca;
	if isnull(ld_porc_jefe) or ld_porc_jefe=0 then
		messagebox('Advertencia','Error Porcentaje de Comisión Jefe de Venta Inválida, debe chequear con Departamento Informática Tabla Jefe_Venta',stopsign!)
		dw_anexo_liberador.setfocus()
		return
	end if
	dw_anexo_liberador.SetItem(1, "estado_comi_sup", 'N')
	SELECT	"AGENTES"."TIPO_CONT"  
	INTO 		:tipo_cont  
	FROM 		"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :gs_age   ;
	if tipo_cont = '1' then
		dw_anexo_liberador.SetItem(1, "estatus_comision", 0)
	else
		dw_anexo_liberador.SetItem(1, "estatus_comision", 1)
	end if
	dw_anexo_liberador.setitem(1,'cod_agente',gs_age)
	dw_anexo_liberador.setitem(1,'cod_super',gs_sup)
	dw_anexo_liberador.setitem(1,'cod_jef',gs_jefe)
	dw_anexo_liberador.setitem(1,'rut',gi_rut)
	nro_cuotas 					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
	pie        						= dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie')
	precio     					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio')
	ll_valor_cuota				= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota'))
	ls_moneda					= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
	ld_fecha_pie				= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_pie')
	ls_canal_venta				= dw_anexo_liberador.getitemstring(1,'anexo_liberador_canal_venta')
	if isnull(ls_canal_venta) or ls_canal_venta = '' then
		messagebox("Advertencia","Debe Ingregar Canal de Ventas")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('anexo_liberador_canal_venta')
		return
	end if	
	ldb_tasa_base				= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa_base'))
	ld_fecha_prim				= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
	if ll_cant =0 or dw_anexo_liberador.getitemnumber(1,'nro_resc') = 0 then
		if (ld_fecha_prim < ld_fecha_min or ld_fecha_prim > ld_fecha_max) and not isnull(ld_fecha_prim) then
			messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_fecha_prim')
			return
		end if
	end if	
	ldb_uf_dia					= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_uf_dia'))
	ld_fecha_ult					= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_ult')
	if ld_fecha_ult < ld_fecha_min and not isnull(ld_fecha_prim) then
		messagebox("Advertencia","Fecha Ultimo Vencimiento Inválida")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_fecha_ult')
		return
	end if
	ldb_gastos_adm			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm'))
	ld_fecha						= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')
	if ll_cant = 0 or dw_anexo_liberador.getitemnumber(1,'nro_resc') = 0 then
		if (ld_fecha < ld_fecha_min or ld_fecha > ld_fecha_max) and not isnull(ld_fecha) then
			messagebox("Advertencia","Fecha Liberador Inválida")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_fecha')
			return
		end if
	end if
	ldb_pie_pagado			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie_pagado'))
	ll_anno_liberar				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_anno_liberar')
	ld_saldo_finan				= dw_anexo_liberador.getitemnumber(1,'saldo_finan')
	if isnull(ll_anno_liberar) then ll_anno_liberar=0
	if ll_anno_liberar = 0 then
		messagebox("Advertencia","Año a Liberar Inválido")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_anno_liberar')
		return
	end if
	
	ldb_calculo					= pie + (nro_cuotas * ll_valor_cuota)
	// validar estas variables
	if precio > ldb_calculo + 1000 then
		messagebox("Advertencia","Valor Cuota Inválida, debe revisar Plazo, Valor Cuota, Valor Pie o Precio")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_valor_cuota')
		return
	end if
	dw_anexo_liberador.setitem(1,'anexo_liberador_saldo_financiar',ld_saldo_finan)
	dw_anexo_liberador.accepttext()
	ldb_tasa						= f_tasa(nro_cuotas,ll_valor_cuota,ld_saldo_finan)
	if ldb_tasa <= 0.0001 then
		ldb_tasa						= 0.0001
		ldb_tasa_cta				= 0.0001
	else
		 ldb_tasa						= ldb_tasa
		 ldb_tasa_cta				= ldb_tasa / 100
	end if
	if ldb_tasa>0 and ldb_tasa<10 then
		dw_anexo_liberador.setitem(1,'pago_liberador_tasa',ldb_tasa)
		dw_anexo_liberador.setitem(1,'pago_liberador_tasa_interes_cuota',ldb_tasa_cta)
		dw_anexo_liberador.accepttext()
		IF MessageBox("Anexo Liberador", "Desea Actualizar los datos ingresados", Question!, YesNo!) = 1 THEN
			il_graba_1			= dw_anexo_liberador.Update()
			IF il_graba_1 = 1 THEN
				// Correcto
	//			Commit using SQLCA;
				serie 					= dw_anexo_liberador.getitemstring(1,'serie_m') 
				numero 				= dw_anexo_liberador.getitemnumber(1,'nro_liberador') 
				gs_serie				= serie
				gi_numero			= numero
				gi_rut 				= dw_anexo_liberador.getitemnumber(1,'rut')
				ls_base_asoc		= dw_anexo_liberador.getitemstring(1,'base')
				ls_serie_asoc		= dw_anexo_liberador.getitemstring(1,'serie')
				ll_nro_asoc			= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
				ldb_tasa_int_cta	= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa_interes_cuota'))
				CHOOSE CASE ls_base_asoc
					CASE 'C'
						SELECT	"CONTRATO"."CTA_PAG_M",
									"CONTRATO"."CTA_PAG_ISA",
									"CONTRATO"."ANEXO_LIB"  
						INTO 		:ll_cta_pag_m,   
									:ll_ctas_pag_isa,
									:ls_anexo_lib  
						FROM 	"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie_asoc ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :ll_nro_asoc )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
//							if ll_cta_pag_m < 99 then
//								SELECT 		SUM("INGRESO"."CUOTAS_PAG")
//								INTO 			:ll_cta_pag_m  
//								FROM 		"INGRESO"  
//								WHERE	  ( "INGRESO"."TIPO_MOV" = 'F' ) AND  
//											  ( "INGRESO"."BASE" = :ls_base_asoc ) AND  
//											  ( "INGRESO"."SERIE" = :ls_serie_asoc ) AND  
//											  ( "INGRESO"."CONTRATO" = :ll_nro_asoc )   ;
								if isnull(ll_cta_pag_m) then ll_cta_pag_m=0
								if isnull(ll_ctas_pag_isa) then ll_ctas_pag_isa=0
								SELECT 	Count("CADENA"."CODIGO" )
								INTO 		:ll_count_lib  
								FROM 	"CADENA"  
								WHERE 	( "CADENA"."CODIGO" = 'L' ) AND  
											( "CADENA"."SERIE" = :gs_serie ) AND  
											( "CADENA"."NUMERO" = :gi_numero )   ;
								if ll_count_lib > 0 then
									ll_cta_pag_m	= ll_cta_pag_m - ll_anno_liberar
									if ll_cta_pag_m <= 0 then ll_cta_pag_m = 0
								end if
								ll_ctas			= ll_cta_pag_m + ll_anno_liberar //+ ll_ctas_pag_isa	//Juan ctas historicas fuera // 99
								ls_anexo_lib		= 'L'+gs_serie+string(gi_numero)
								UPDATE	"CONTRATO"  
								SET 		"CTA_PAG_M" = :ll_ctas,   
											"ANEXO_LIB" = :ls_anexo_lib  
								WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie_asoc ) AND  
										 ( "CONTRATO"."NRO_CONTRATO" = :ll_nro_asoc )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									il_graba_6	= 1
	//								commit;
								else
									il_graba_6	= 0
	//								rollback;
								end if
//							else
//								il_graba_6		= 1
//							end if
						end if
	
					CASE 'O', 'U'
						SELECT	"OFERTA_V"."CTA_PAG_M",   
									"OFERTA_V"."ANEXO_LIB"  
						INTO 		:ll_cta_pag_m,   
									:ls_anexo_lib  
						FROM 	"OFERTA_V",   
									"PAGO_OFERTA"  
						WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								 (("OFERTA_V"."SERIE" = :ls_serie_asoc ) AND  
								 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro_asoc ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
//							if ll_cta_pag_m < 99 then
//								SELECT 		SUM("INGRESO"."CUOTAS_PAG")
//								INTO 			:ll_cta_pag_m  
//								FROM 		"INGRESO"  
//								WHERE	  ( "INGRESO"."TIPO_MOV" = 'F' ) AND  
//											  ( "INGRESO"."BASE" = :ls_base_asoc ) AND  
//											  ( "INGRESO"."SERIE" = :ls_serie_asoc ) AND  
//											  ( "INGRESO"."CONTRATO" = :ll_nro_asoc )   ;
								if isnull(ll_cta_pag_m) then ll_cta_pag_m=0
								SELECT 	Count("CADENA"."CODIGO" )
								INTO 		:ll_count_lib  
								FROM 	"CADENA"  
								WHERE 	( "CADENA"."CODIGO" = 'L' ) AND  
											( "CADENA"."SERIE" = :gs_serie ) AND  
											( "CADENA"."NUMERO" = :gi_numero )   ;
								if ll_count_lib > 0 then
									ll_cta_pag_m	= ll_cta_pag_m - ll_anno_liberar
									if ll_cta_pag_m <= 0 then ll_cta_pag_m = 0
								end if
								ll_ctas			= ll_cta_pag_m + ll_anno_liberar	//99
								ls_anexo_lib	= 'L'+gs_serie+string(gi_numero)
								UPDATE	"OFERTA_V"  
								SET 		"CTA_PAG_M" = :ll_ctas,   
											"ANEXO_LIB" = :ls_anexo_lib  
								WHERE  ( "OFERTA_V"."SERIE" = :ls_serie_asoc ) AND  
										 ( "OFERTA_V"."NRO_OFERTA" = :ll_nro_asoc )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									il_graba_6	= 1
	//								commit;
								else
									il_graba_6	= 0
	//								rollback;
								end if
//							else
//								il_graba_6		= 1
//							end if
						end if
				END CHOOSE
				
				IF f_validar() THEN
					IF cb_aceptar.text = "Actualizar" THEN
						// Update
						IF Not(wf_cadena(1)) THEN
							MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
	//						rollback using SQLCA;
							RETURN
						else
							il_graba_3	= 1
							il_graba_4	= 1
							il_graba_5	= 1
						END IF
					ELSE
						// Insert
						// Trae porcentaje de venta del vendedor segun contrato 1 (antiguo)
						ld_porcent_age 	= 5
						dw_anexo_liberador.SetItem(1, "porce_age", ld_porcent_age)
						SELECT	"SUPERVISOR"."PORC_SUPERVISOR"  
						INTO 		:ld_porcent_sup  
						FROM 		"SUPERVISOR"  
						WHERE 	"SUPERVISOR"."COD_SUP" = :gs_sup   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_anexo_liberador.SetItem(1, "porce_sup", ld_porcent_sup)
						else
							dw_anexo_liberador.SetItem(1, "porce_sup", 0)
						end if
						SELECT DISTINCT	"JEFE_VENTAS"."PORC_JEFE_VTA"  
						INTO 		:ld_porc_jefe  
						FROM 		"JEFE_VENTAS"  
						WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_jefe   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_anexo_liberador.SetItem(1, "anexo_liberador_porce_jefe", ld_porc_jefe)
						else
							dw_anexo_liberador.SetItem(1, "anexo_liberador_porce_jefe", 0)
						end if
						dw_anexo_liberador.accepttext()
						if dw_anexo_liberador.update()=1 then
							il_graba_3	= 1
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
									ls_glosa				= 'ANEXO LIBERADOR DIGITADO'
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
										il_graba_4	= 1
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
							il_graba_3	= 0
	//						rollback;
						end if
						IF Not(wf_cadena(0)) THEN
							MessageBox("SQL error en cadena ", SQLCA.SQLErrText, Information!)
							il_graba_2	= 0
							rollback using SQLCA;
							RETURN
						END IF
					END IF			
				end if
//				if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
				if ldb_tasa<=0 then ldb_tasa=0
				if ldb_tasa_base<=0 then ldb_tasa_base=0
				if ldb_gastos_adm<=0 then ldb_gastos_adm=0
//				end if
				if il_graba_1=1 and il_graba_2=1 and il_graba_3=1 and il_graba_4=1 and il_graba_5=1 and il_graba_6=1 then
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
//							ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
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
													( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",		"FORMA_PAGO" )  
										VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						:ls_moneda,		:forma_pago )  
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
												( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",		"FORMA_PAGO" )  
									VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						:ls_moneda,		:forma_pago )  
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
//							ldb_monto	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
							if ll_est_reg = 0 then
								INSERT INTO "SEGURO_ASOCIADOS"  
											( "BASE",		"SERIE",   	"NUMERO",   	"COD_SEGURO",   		"FECHA_CREA",   	"MONTO_PRIMA",   	"USUARIO",   	"ESTADO_REG",   	"FOLIO_SEGURO",   	"ESTADO_SEGURO",	"MONEDA",		"FORMA_PAGO"	 )  
								VALUES 	( :gs_base, 	:gs_serie,   :gi_numero,   	:ll_codigo,   				:gdt_fec_sistema,  :ldb_monto,   			:gs_user,   		0,   					0,   						'A',						:ls_moneda,		:forma_pago )  
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
					
					if gs_nueva_oferta='S' then
						INSERT INTO "PAGO_LIBERADOR"  
									( "PAGO_LIBERADOR"."SERIE_M",   	"PAGO_LIBERADOR"."NRO_LIBERADOR",   "PAGO_LIBERADOR"."FECHA",  "PAGO_LIBERADOR"."FOLIO",  "PAGO_LIBERADOR"."PRECIO", "PAGO_LIBERADOR"."PIE_PAGADO",   "PAGO_LIBERADOR"."PIE",   	"PAGO_LIBERADOR"."TASA", 	"PAGO_LIBERADOR"."TASA_BASE",	 	"PAGO_LIBERADOR"."VALOR_CUOTA",  "PAGO_LIBERADOR"."NRO_CUOTAS",   "PAGO_LIBERADOR"."UF_DIA",	"PAGO_LIBERADOR"."MONEDA", "PAGO_LIBERADOR"."FECHA_PRIM",   "PAGO_LIBERADOR"."FECHA_ULT",   	"PAGO_LIBERADOR"."FECHA_PIE",   	"PAGO_LIBERADOR"."MODIFICADO",   "PAGO_LIBERADOR"."FECHA_MOD", "PAGO_LIBERADOR"."GASTOS_ADM",	"ANNO_LIBERAR",		"TASA_INTERES_CUOTA" )  
						VALUES 	( :gs_serie,   						:gi_numero,   		 						:ld_fecha, 						0, 		  						:precio, 	  					:ldb_pie_pagado,						:pie,								:ldb_tasa,  					:ldb_tasa_base,						:ll_valor_cuota, 						:nro_cuotas, 							:ldb_uf_dia,					:ls_moneda, 					:ld_fecha_prim, 						:ld_fecha_ult, 						:ld_fecha_pie, 						:gs_user,   							:id_fecha_dia, 					:ldb_gastos_adm,		:ll_anno_liberar,	:ldb_tasa_int_cta )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error Tabla Pago Liberador SQL: "+sqlca.sqlerrtext)
						end if
					else
						dw_anexo_liberador.accepttext()
						ll_ult_folio		= dw_anexo_liberador.getitemnumber(1,'ult_folio')
						if isnull(ll_ult_folio) then ll_ult_folio=0
						UPDATE	"PAGO_LIBERADOR"  
						SET 		"PAGO_LIBERADOR"."FECHA" = :ld_fecha,   
									"PAGO_LIBERADOR"."PRECIO" = :precio,   
									"PAGO_LIBERADOR"."PIE_PAGADO" = :ldb_pie_pagado,   
									"PAGO_LIBERADOR"."PIE" = :pie,   
									"PAGO_LIBERADOR"."TASA" = :ldb_tasa,   
									"PAGO_LIBERADOR"."TASA_BASE" = :ldb_tasa_base,   
									"PAGO_LIBERADOR"."VALOR_CUOTA" = :ll_valor_cuota,   
									"PAGO_LIBERADOR"."NRO_CUOTAS" = :nro_cuotas,   
									"PAGO_LIBERADOR"."UF_DIA" = :ldb_uf_dia,   
									"PAGO_LIBERADOR"."MONEDA" = :ls_moneda,   
									"PAGO_LIBERADOR"."FECHA_PRIM" = :ld_fecha_prim,   
									"PAGO_LIBERADOR"."FECHA_ULT" = :ld_fecha_ult,   
									"PAGO_LIBERADOR"."FECHA_PIE" = :ld_fecha_pie,   
									"PAGO_LIBERADOR"."MODIFICADO" = :gs_user,   
									"PAGO_LIBERADOR"."FECHA_MOD" = :id_fecha_dia,   				
									"PAGO_LIBERADOR"."GASTOS_ADM" = :ldb_gastos_adm,
									"PAGO_LIBERADOR"."ANNO_LIBERAR" = :ll_anno_liberar,
									"TASA_INTERES_CUOTA" = :ldb_tasa_int_cta
						WHERE  ( "PAGO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
								 ( "PAGO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND
								 ( "PAGO_LIBERADOR"."FOLIO" = :ll_ult_folio )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit using sqlca;
						else
							rollback  using sqlca;
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
		//					if dw_1.retrieve(serie,numero) > 0 then 
		//						if 1 = MessageBox("Imprimir", 'Desea imprimir',Exclamation!, YesNo!, 2) then
		//							f_printdlg(dw_1,gstr_print,w_ingresar_liberador)
		//						end if
		//					end if
						wf_comisiones(serie,numero,porcentaje,nro_cuotas)//--nueva comision--
						wf_log_anexo_liberador()
						
						ll_plazo					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
						ll_rut						= dw_anexo_liberador.getitemnumber(1,'rut')
						ldb_valor_cuota		= dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota')
						ldt_fecha_prim			= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
						SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cuota_mant)
						ls_dv						= TRIM(em_dv.text)
						ll_cod_parque			= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
						ls_moneda				= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado_cadena  
						FROM 	"CADENA"  
						WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
								 ( "CADENA"."SERIE" = :gs_serie ) AND  
								 ( "CADENA"."NUMERO" = :gi_numero )   
						USING		sqlca;
						if ls_estado_cadena='V' then
							SELECT	"CUPONERAS"."NUMERO"  
							INTO 		:ll_count_vig  
							FROM 	"CUPONERAS"  
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
										
										DECLARE sp_nuevo_cadena_mora4 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_asoc,:ls_serie_asoc,:ll_nro_asoc,'M');
								      	EXECUTE sp_nuevo_cadena_mora4;
											
										DECLARE SP_DESARROLLO_CUOTA PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
										EXECUTE SP_DESARROLLO_CUOTA;
									else
										rollback;
									end if
								end if
							elseif sqlca.sqlcode=100 then
								DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
						      	EXECUTE sp_nuevo_cadena_mora;
								
								DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
								EXECUTE sp_proc_genera_cuponera;
								
								DECLARE sp_nuevo_cadena_mora5 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_asoc,:ls_serie_asoc,:ll_nro_asoc,'M');
								EXECUTE sp_nuevo_cadena_mora5;
								
								DECLARE SP_DESARROLLO_CUOTA1 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
								EXECUTE SP_DESARROLLO_CUOTA1;
							end if
						end if
						UPDATE	"CUPONERAS_DETALLE"  
						SET		"ESTADO_PAGO_CUPON" = 'C',
									"TIPO_COB_PAGO" = 'CS'
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base_asoc ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_asoc ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_nro_asoc ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
						IF MessageBox("Grabar", "Grabación Exitosa, desea Ingresar otro Anexo Liberador", Question!, YesNo!, 3) = 1 THEN
							Setnull(gs_serie);setnull(gi_numero);setnull(gs_base);setnull(gi_rut)
							Setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
							pb_limpiar.triggerevent(clicked!)
							em_numero.setfocus()
						else
							gs_nueva_oferta	= 'N'
							cb_aceptar.text 	= "Actualizar"
						END IF
					ELSE
		//					if dw_1.retrieve(serie,numero) > 0 then 
		//						if 1 = MessageBox("Imprimir", 'Desea imprimir',Exclamation!, YesNo!, 2) then
		//							f_printdlg(dw_1,gstr_print,w_ingresar_liberador)
		//						end if
		//					end if
						wf_comisiones(serie,numero,porcentaje,nro_cuotas)//--nueva comision--
						wf_log_anexo_liberador()		
						ll_plazo					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
						ll_rut					= dw_anexo_liberador.getitemnumber(1,'rut')
						ldb_valor_cuota		= dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota')
						ldt_fecha_prim			= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
						SetNull(ldt_fec_venc_mant);SetNull(ldb_valor_cuota_mant)
						ls_dv						= TRIM(em_dv.text)
						ll_cod_parque			= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
						ls_moneda				= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
						SELECT	"CADENA"."ESTADO"  
						INTO 		:ls_estado_cadena  
						FROM 	"CADENA"  
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
										DECLARE sp_nuevo_cadena_mora3 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
								      	EXECUTE sp_nuevo_cadena_mora3;
										
										DECLARE sp_proc_modifica_cuponera2 PROCEDURE FOR SP_MODIFICAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda, :ls_modif );
										EXECUTE sp_proc_modifica_cuponera2;
										
										DECLARE sp_nuevo_cadena_mora6 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_asoc,:ls_serie_asoc,:ll_nro_asoc,'M');
										EXECUTE sp_nuevo_cadena_mora6;
										
										DECLARE SP_DESARROLLO_CUOTA2 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
										EXECUTE SP_DESARROLLO_CUOTA2;
									else
										rollback;
									end if
								end if
							elseif sqlca.sqlcode=100 then
								DECLARE sp_nuevo_cadena_mora2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'N');
						      	EXECUTE sp_nuevo_cadena_mora2;
								
								DECLARE sp_proc_genera_cuponera2 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota, :ldb_valor_cuota_mant, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fec_venc_mant, :ls_moneda );
								EXECUTE sp_proc_genera_cuponera2;
								
								DECLARE sp_nuevo_cadena_mora7 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_asoc,:ls_serie_asoc,:ll_nro_asoc,'M');
								EXECUTE sp_nuevo_cadena_mora7;
								
								DECLARE SP_DESARROLLO_CUOTA3 PROCEDURE FOR SP_DESARROLLO_CUOTA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :precio, :pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gastos_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_int_cta);
								EXECUTE SP_DESARROLLO_CUOTA3;
							end if
						end if
						UPDATE	"CUPONERAS_DETALLE"  
						SET		"ESTADO_PAGO_CUPON" = 'C',
									"TIPO_COB_PAGO" = 'CS'
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base_asoc ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie_asoc ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_nro_asoc ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
						IF MessageBox("Grabar", "Grabación Exitosa, desea Ingresar otro Anexo Liberador", Question!, YesNo!, 3) = 1 THEN
							Setnull(gs_serie);setnull(gi_numero);setnull(gs_base);setnull(gi_rut)
							Setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
							pb_limpiar.triggerevent(clicked!)
							em_numero.setfocus()
						else
							gs_nueva_oferta	= 'N'
							cb_aceptar.text 	= "Actualizar"
						END IF
					END IF
				else
					messagebox("Error","Error Grabar SQL: "+sqlca.sqlerrtext)
					rollback using sqlca;
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
	em_numero.setfocus()
end if
end event

type st_7 from statictext within w_ingresar_liberador
integer x = 2647
integer y = 176
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

type st_6 from statictext within w_ingresar_liberador
integer x = 2665
integer y = 48
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

type st_5 from statictext within w_ingresar_liberador
integer x = 1993
integer y = 48
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

type em_dv from editmask within w_ingresar_liberador
integer x = 2341
integer y = 208
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
	dw_anexo_liberador.setitem(1,'estado_rut',1)
	cb_aceptar.enabled 				= false
	this.setfocus()
	em_rut.Setfocus()
else
	dw_anexo_liberador.setitem(1,'estado_rut',0)
	cb_aceptar.enabled 				= true
end if
end event

type st_4 from statictext within w_ingresar_liberador
integer x = 2299
integer y = 224
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

type em_rut from editmask within w_ingresar_liberador
integer x = 1925
integer y = 208
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

event modified;Long		ll_cant,ll_fila,ll_resp,ll_tot_reg,ll_indi,ll_codigo_iva
String	ls_null,ls_dv,ls_string
Date		ld_null,ld_fecha_ctto
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
			em_rut.text			= ''
			em_dv.text			= ''
			em_rut.enabled		= true
			em_dv.enabled		= true
			em_rut.setfocus()
		END IF
	else
		cb_aceptar.enabled			= true
		dw_anexo_liberador.enabled	= true
		dw_anexo_liberador.setitem(1,'rut',gi_rut)
		if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
			isnull(dw_jefe.getitemstring(1,'jefes')) then
			dw_anexo_liberador.setitem(1,'estado_rut',1)
		else
			dw_anexo_liberador.setitem(1,'estado_rut',0)
		end if
		dw_anexo_liberador.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))	
		em_dv.text						= dw_clientes.getitemstring(1,'dv')
		dw_clientes.enabled			= true
		dw_agente.enabled			= true
		dw_supervisor.enabled		= true
		dw_jefe.enabled				= true
		dw_seguro.enabled			= true
		if not isnull(gs_age) and gs_age<>'' then 
			is_pasa_asigna				= 'S'
			dw_agente.triggerevent(itemchanged!)
		end if
		dw_agente.setfocus()
	end if
	if gs_nueva_oferta='S' then
		if gi_numero >= gi_prim_nro_L_cd then //gi_prim_nro_L_cd >= gi_numero
			String	ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_descrip
			Long		ll_estado
			SELECT	"CD_FOLIO"."COD_AGENTE",   
						"CD_FOLIO"."COD_SUPERVISOR",   
						"CD_FOLIO"."COD_JEFE_VENTA",
						"CD_FOLIO"."COD_PARQUE",
						"CD_FOLIO"."ULT_ESTADO"  
			INTO 		:ls_cod_age,   
						:ls_cod_sup,   
						:ls_cod_jefe,
						:gl_cod_parque,
						:ll_estado
			FROM		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :gi_numero ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ls_cod_age) and ls_cod_age<>'' then
					SELECT	"CD_ESTADO"."DESCRIPCION"  
					INTO 		:ls_descrip  
					FROM 		"CD_ESTADO"  
					WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado ;
					if ll_estado<>9 then 
						messagebox( "Advertencia","Anexo Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+&
										', NO es posible Asignar por encontrarse en ESTADO: '+string(ll_estado)+'-'+ls_descrip)
						dw_agente.enabled					= false
						dw_supervisor.enabled				= false
						dw_jefe.enabled						= false
						dw_anexo_liberador.enabled		= false
						dw_seguro.enabled					= false
						pb_limpiar.triggerevent(clicked!)
					else
						dw_agente.enabled					= True
						dw_supervisor.enabled				= True
						dw_jefe.enabled						= True
						dw_anexo_liberador.enabled		= true
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
		dw_anexo_liberador.setfocus()
	end if
	dw_clientes.Object.DataWindow.ReadOnly	= "No"
else
	ls_dv									= dw_clientes.getitemstring(1,'dv')
	em_dv.text							= ls_dv
	dw_anexo_liberador.setitem(1, 'rut',gi_rut)
	dw_anexo_liberador.setitem(1, 'serie_m',gs_serie)
	dw_anexo_liberador.setitem(1, 'nro_liberador',gi_numero)
	dw_anexo_liberador.SetItem(1, 'fecha_ingreso',id_fecha_dia)
	dw_anexo_liberador.SetItem(1, 'pago_liberador_fecha',id_fecha_dia)
	dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
	dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
	dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
	dw_anexo_liberador.SetItem(1, "ult_folio",0)
	dw_anexo_liberador.SetItem(1, 'fecha_ingreso',id_fecha_dia)
	if isnull(dw_anexo_liberador.getitemstring(1,'usuario')) then dw_anexo_liberador.setitem(1,'usuario',gs_user)
	Setnull(ls_null);setnull(ld_null)
	dw_anexo_liberador.setitem(1, 'pago_liberador_serie_m',gs_serie)
	dw_anexo_liberador.setitem(1, 'pago_liberador_nro_liberador',gi_numero)
	dw_anexo_liberador.SetItem(1, "pago_liberador_folio", 0)
	dw_anexo_liberador.SetItem(1, "pago_liberador_precio", 0)
	dw_anexo_liberador.SetItem(1, "pago_liberador_pie", 0)
	dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_pie", id_fecha_dia)
	dw_anexo_liberador.SetItem(1, "pago_liberador_nro_cuotas", 0)
	dw_anexo_liberador.SetItem(1, "pago_liberador_valor_cuota", 0)
	dw_anexo_liberador.SetItem(1, "pago_liberador_tasa", 0)
	dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_prim", id_fecha_dia)
	dw_anexo_liberador.SetItem(1, "pago_liberador_uf_dia", gd_uf_dia)
	dw_anexo_liberador.SetItem(1, "pago_liberador_moneda", ls_null)
	dw_anexo_liberador.SetItem(1, "pago_liberador_modificado", gs_user)
	dw_anexo_liberador.SetItem(1, 'pago_liberador_fecha_ult', gd_uf_dia)
	dw_anexo_liberador.SetItem(1, "pago_liberador_gastos_adm", 0)
	dw_anexo_liberador.SetItem(1, 'pago_liberador_fecha',id_fecha_dia)
	dw_anexo_liberador.SetItem(1, "pago_liberador_fecha_mod", id_fecha_dia)
	dw_anexo_liberador.SetItem(1, "pago_liberador_pie_pagado", 0)
	dw_clientes.enabled			= true
	dw_agente.enabled			= true
	dw_supervisor.enabled		= true
	dw_jefe.enabled				= true
	dw_seguro.enabled			= True
	dw_clientes.Object.DataWindow.ReadOnly	= "No"
	dw_agente.setfocus()
end if



ll_tot_reg						= dw_seguro.rowcount()
ld_fecha_ctto					= date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha'))
if date(ld_fecha_ctto) >= date('20/02/2023') then
	dw_anexo_liberador.setitem(1,'iva_pie',0)
	dw_anexo_liberador.setitem(1,'total_valor_cuota',0)
	dw_anexo_liberador.setitem(1,'total_cuota_iva',0)
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
dw_anexo_liberador.accepttext( )
end event

type st_3 from statictext within w_ingresar_liberador
integer x = 1787
integer y = 224
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

type st_2 from statictext within w_ingresar_liberador
integer x = 695
integer y = 224
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

type em_numero from editmask within w_ingresar_liberador
integer x = 951
integer y = 208
integer width = 649
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;string       ls_estado,ls_descrip,ls_respuesta,ls_serie_aux,ls_modifica
long         ll_count_reg,ll_cant,ll_cant_benef,ll_resp,ll_estado,ll_ult_estado,ll_dias_inicio_def,ll_dias_tope_def,ll_tot_reg,ll_indi,ll_est_reg,&
			  ll_codigo
double 	  ld_valor_uf,ll_numero,ldb_factor_prima,ldb_suma,ldb_iva
datetime   ldt_fecha_pie,ld_fecha_max,ld_fecha_min

SELECT  	sysdate,               "TASA"."DIAS_TOPE_REPACTA",              "TASA"."DIAS_INICIO_REPACTA"  ,              "TASA"."IVA"  
INTO 		:gdt_fec_sistema,           :ll_dias_tope_def,                                          :ll_dias_inicio_def,					:ldb_iva
FROM   	"TASA"  ;

dw_anexo_liberador.setitem(1,'valor_iva',ldb_iva)

if isvalid(w_ingresar_liberador) then 
	 SetNull(gs_age);Setnull(gs_sup);Setnull(gs_jefe);setnull(gi_rut);setnull(gs_base)
	 Setnull(gs_serie);setnull(gi_numero)
	 is_serie                                = trim(em_serie.Text)
	 ll_numero                           = Double(trim(em_numero.text))
	 gs_serie                                              = is_serie
	 gi_numero                         = ll_numero
	 gs_base                                               = 'L'
	 gs_serie                                              = em_serie.text
	 if gi_numero>0 then
		 if isnull(gs_age) or gs_age='' or isnull(gs_sup) or gs_sup='' or isnull(gs_jefe) or gs_jefe='' then
			  SELECT  "ANEXO_LIBERADOR"."COD_AGENTE",   
						 "ANEXO_LIBERADOR"."COD_SUPER",   
						 "ANEXO_LIBERADOR"."COD_JEF"  
			  INTO     :gs_age,   
						:gs_sup,   
						:gs_jefe  
			  FROM   "ANEXO_LIBERADOR"  
			  WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
						( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   ;
		 end if
		 if ll_numero >= gi_prim_nro_L_cd and gi_prim_nro_L_cd>0 then
			  SELECT  "CD_FOLIO"."ULT_ESTADO",
						"CD_FOLIO"."COD_PARQUE"
			  INTO   :ll_estado,
						:gl_cod_parque
			  FROM   "CD_FOLIO"  
			  WHERE ( "CD_FOLIO"."BASE" = :gs_base ) AND  
						( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
						( "CD_FOLIO"."NUMERO" = :ll_numero )   
			  USING  sqlca;
			  if sqlca.sqlcode=0 then
				SELECT  "CD_ESTADO"."DESCRIPCION"  
				INTO       :ls_descrip  
				FROM       "CD_ESTADO"  
				WHERE      "CD_ESTADO"."CODIGO" = :ll_estado   ;
				if ll_estado<>9 and ll_estado<>11 then
					 if ll_estado=11 then
						 is_pasa_asigna                                                                = 'N'
						 if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
							  wf_mostrar_liberador()
							  wf_buscar_seguro(gs_base,gs_serie,gi_numero);
							  gs_nueva_oferta                                            = 'N'
							  dw_anexo_liberador.SetItem(1, 'estado_rut',0)
							  dw_anexo_liberador.setitem(1, 'estado_contrato',0)
							  dw_agente.setitem(1,'agente',gs_age)
							  dw_supervisor.setitem(1,'supervisores',gs_sup)
							  dw_jefe.setitem(1,'jefes',gs_jefe)
							  dw_agente.setfocus()
							  // inicio
							  ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
							  ld_fecha_min    = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
							  ld_fecha_max   = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
							  if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
								dw_agente.enabled                                                      = false
								dw_supervisor.enabled                                = false
								dw_jefe.enabled                                                                            = false
							  end if     
							  //            fin
						 else
							  wf_nuevo_liberador()
							  gs_nueva_oferta                                            = 'S'
						 end if
					 elseif ll_estado=9 then
						 IF is_serie = is_serie2 THEN
							  is_pasa_asigna                                                                = 'N'
							  if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
								wf_mostrar_liberador()
								wf_buscar_seguro(gs_base,gs_serie,gi_numero);
								gs_nueva_oferta                                            = 'N'
								dw_anexo_liberador.SetItem(1, 'estado_rut',0)
								dw_anexo_liberador.setitem(1, 'estado_contrato',0)
								dw_agente.setfocus()
								// inicio
								ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
								ld_fecha_min   = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
								ld_fecha_max  = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
								if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
									 dw_agente.enabled                                                      = false
									 dw_supervisor.enabled                                = false
									 dw_jefe.enabled                                                                            = false
								end if    
								//            fin
							  else
								wf_nuevo_liberador()
								gs_nueva_oferta                                            = 'S'
							  END IF
							  dw_anexo_liberador.accepttext()
							  dw_agente.setitem(1,'agente',gs_age)
							  dw_supervisor.setitem(1,'supervisores',gs_sup)
							  dw_jefe.setitem(1,'jefes',gs_jefe)
						 ELSE
							  cb_aceptar.text                                                = "Ingresar"
							  ll_resp  = MessageBox("Advertencia Asignación de Liberador", "Liberador NO asignado, desea Ingresarla",Exclamation!, YesNo!, 2)
							  IF ll_resp = 1 THEN
									gs_nueva_oferta                                            = 'S'
									is_pasa_asigna                                                = 'S'
									wf_limpiar()
									em_rut.enabled                                              = true
									em_dv.enabled                                               = true
									dw_agente.enabled                      = true
									dw_supervisor.enabled = true
									dw_jefe.enabled                                            = true
									dw_seguro.enabled                      = true
									dw_agente.reset()
									dw_supervisor.reset()
									dw_jefe.reset()
									dw_agente.insertrow(0)
									dw_supervisor.insertrow(0)
									dw_jefe.insertrow(0)
									em_rut.text                                                                      = ''
									em_dv.text                                                                       = ''
									em_rut.setfocus()
							  ELSE
									dw_clientes.enabled                    = false
									dw_agente.enabled                      = false
									dw_supervisor.enabled = false
									dw_jefe.enabled                                            = false
									dw_seguro.enabled                      = false
									em_rut.text                                                                      = ''
									em_dv.text                                                                       = ''
									gs_nueva_oferta                                            = 'N'
									is_pasa_asigna                                                = 'N'
									em_rut.enabled                                                             = false
									em_dv.enabled                                               = false
									setnull(gi_rut);setnull(gs_serie);setnull(gi_numero)
									setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
									wf_limpiar()
									em_numero.setfocus()
							  END IF
						 END IF
					 else
						 messagebox( "Advertencia","Anexo Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")+&
																											 ', NO es posible Digitarse por encontrarse en ESTADO: '+string(ll_estado)+'-'+ls_descrip)
						 dw_clientes.enabled                     = false
						 dw_agente.enabled                      = false
						 dw_supervisor.enabled = false
						 dw_jefe.enabled                                            = false
						 dw_seguro.enabled                       = false
						 em_rut.text                                                                      = ''
						 em_dv.text                                                                       = ''
						 gs_nueva_oferta                                            = 'N'
						 is_pasa_asigna                                                = 'N'
						 em_rut.enabled                                                             = false
						 em_dv.enabled                                               = false
						 setnull(gi_rut);setnull(gs_serie);setnull(gi_numero)
						 setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
						  wf_limpiar()
						 em_numero.setfocus()
					 end if
				elseif isnull(ll_estado) then
					 is_pasa_asigna                                                                = 'N'
					 if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
						 wf_mostrar_liberador()
						 wf_buscar_seguro(gs_base,gs_serie,gi_numero);
						 gs_nueva_oferta                                            = 'N'
						 dw_anexo_liberador.SetItem(1, 'estado_rut',0)
						 dw_anexo_liberador.setitem(1, 'estado_contrato',0)
						 dw_agente.setfocus()
						 // inicio
						 ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
						 ld_fecha_min    = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
						 ld_fecha_max   = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
						 if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
							  dw_agente.enabled                                                      = false
							  dw_supervisor.enabled                               = false
							  dw_jefe.enabled                                                                            = false
						 end if    
						 //            fin
					 END IF
					 dw_anexo_liberador.accepttext()
					 dw_agente.setitem(1,'agente',gs_age)
					 dw_supervisor.setitem(1,'supervisores',gs_sup)
					 dw_jefe.setitem(1,'jefes',gs_jefe)
					 if not isnull(gs_age) and gs_age<>'' then is_sw_age='S'
				else
					 if not isnull(gs_serie) and gs_serie<>'' and ll_numero>0 and not isnull(ll_numero) then
						 is_pasa_asigna                                                                = 'N'
						 if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
							  wf_mostrar_liberador()
							  wf_buscar_seguro(gs_base,gs_serie,gi_numero);
							  gs_nueva_oferta                                            = 'N'
							  dw_anexo_liberador.SetItem(1, 'estado_rut',0)
							  dw_anexo_liberador.setitem(1, 'estado_contrato',0)
							  dw_agente.setfocus()
							  // inicio
							  ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
							  ld_fecha_min    = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
							  ld_fecha_max   = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
							  if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
								dw_agente.enabled                                                      = false
								dw_supervisor.enabled                                = false
								dw_jefe.enabled                                                                            = false
							  end if     
							  //            fin
						 else
							  wf_nuevo_liberador()
							  gs_nueva_oferta                                            = 'S'
						 END IF
						 dw_anexo_liberador.accepttext()
						 dw_agente.setitem(1,'agente',gs_age)
						 dw_supervisor.setitem(1,'supervisores',gs_sup)
						 dw_jefe.setitem(1,'jefes',gs_jefe)
					 end if
				end if
			  else
					SELECT  "ANEXO_LIBERADOR"."SERIE_M",  
								"ANEXO_LIBERADOR"."COD_AGENTE",   
								"ANEXO_LIBERADOR"."COD_SUPER",   
								"ANEXO_LIBERADOR"."COD_JEF"  
					INTO     :ls_serie_aux,
								:gs_age,   
								:gs_sup,   
								:gs_jefe  
					FROM     "ANEXO_LIBERADOR",   
								"CADENA",   
								"PAGO_LIBERADOR"  
					WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
							  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
							  ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
							  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
							  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
							  (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
							  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
							  ( "CADENA"."CODIGO" = 'L' ) )   
					USING                  sqlca;
					if sqlca.sqlcode=0 then
						 if dw_anexo_liberador.Retrieve(gs_serie,gi_numero) > 0 then
							 dw_agente.setitem(1,'agente',gs_age)
							 dw_supervisor.setitem(1,'supervisores',gs_sup)
							 dw_jefe.setitem(1,'jefes',gs_jefe)
							 wf_mostrar_liberador()
							 wf_buscar_seguro(gs_base,gs_serie,gi_numero);
							 gs_nueva_oferta                                            = 'N'
							 dw_anexo_liberador.SetItem(1, 'estado_rut',0)
							 dw_anexo_liberador.setitem(1, 'estado_contrato',0)
							 dw_anexo_liberador.accepttext()
							 dw_agente.setfocus()
							 // inicio
							 ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
							 ld_fecha_min    = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
							 ld_fecha_max   = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
							 if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
								  dw_agente.enabled                                                      = false
								  dw_supervisor.enabled                               = false
								  dw_jefe.enabled                                                                            = false
							 end if    
							 //            fin
						 end if
					else
						 SELECT  "CD_FOLIO"."ULT_ESTADO"  
						 INTO     :ll_ult_estado  
						 FROM     "CD_FOLIO"  
						 WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
									( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
									( "CD_FOLIO"."NUMERO" = :gi_numero )   
						 USING   sqlca;
						 if sqlca.sqlcode<>0 then 
							 OpenWithParm(w_verificar_contrato, gs_base+'~t'+gs_serie+'~t'+string(gi_numero))
							 ls_respuesta      = Message.StringParm
						 end if                                                    
						 if ls_respuesta='S' then
							 if not isnull(gs_serie) and gs_serie<>'' and ll_numero>0 and not isnull(ll_numero) then
								  is_pasa_asigna                                                                = 'N'
								  if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
										wf_mostrar_liberador()
										wf_buscar_seguro(gs_base,gs_serie,gi_numero);
										gs_nueva_oferta                                            = 'N'
										dw_anexo_liberador.SetItem(1, 'estado_rut',0)
										dw_anexo_liberador.setitem(1, 'estado_contrato',0)
										dw_agente.setitem(1,'agente',gs_age)
										dw_supervisor.setitem(1,'supervisores',gs_sup)
										dw_jefe.setitem(1,'jefes',gs_jefe)
										dw_agente.setfocus()
										// inicio
										ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
										ld_fecha_min   = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
										ld_fecha_max  = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
										if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
															 dw_agente.enabled                                                      = false
															 dw_supervisor.enabled                                = false
															 dw_jefe.enabled                                                                            = false
										end if    
										//            fin
								  else
										pb_limpiar.triggerevent(clicked!)
										messagebox("Advertencia","Anexo Liberador "+gs_base+' - '+gs_serie+ ' - '+string(ll_numero,"###,###,###,###,###")+" Inexistente")
								  END IF
							 else
								  pb_limpiar.triggerevent(clicked!)
								  messagebox("Advertencia","Anexo Liberador "+gs_base+' - '+gs_serie+ ' - '+string(ll_numero,"###,###,###,###,###")+" Inexistente")
							 end if
						 else
							 pb_limpiar.triggerevent(clicked!)
						end if    
					end if
			  end if
		 else
			  SELECT  "ANEXO_LIBERADOR"."SERIE_M",  
						 "ANEXO_LIBERADOR"."COD_AGENTE",   
						 "ANEXO_LIBERADOR"."COD_SUPER",   
						 "ANEXO_LIBERADOR"."COD_JEF"  
			  INTO      :ls_serie_aux,
						 :gs_age,   
						 :gs_sup,   
						 :gs_jefe  
			  FROM    "ANEXO_LIBERADOR",   
						 "CADENA",   
						 "PAGO_LIBERADOR"  
			  WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					  ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
					  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
					  (("ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
					  ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero ) AND  
					  ( "CADENA"."CODIGO" = 'L' ) )   
			  USING                  sqlca;
			  if sqlca.sqlcode=0 then
					if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
						 dw_agente.setitem(1,'agente',gs_age)
						 dw_supervisor.setitem(1,'supervisores',gs_sup)
						 dw_jefe.setitem(1,'jefes',gs_jefe)
						 wf_mostrar_liberador()
						 wf_buscar_seguro(gs_base,gs_serie,gi_numero);
						 gs_nueva_oferta                                            = 'N'
						 dw_anexo_liberador.SetItem(1, 'estado_rut',0)
						 dw_anexo_liberador.setitem(1, 'estado_contrato',0)
						 dw_anexo_liberador.accepttext()
						 dw_agente.setfocus()
						 // inicio
						 ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
						 ld_fecha_min   = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
						 ld_fecha_max  = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
						 if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
							 dw_agente.enabled                                                      = false
							 dw_supervisor.enabled                               = false
							 dw_jefe.enabled                                                                            = false
						 end if    
						 //            fin
					end if
			  else
					SELECT  "CD_FOLIO"."ULT_ESTADO"  
					INTO      :ll_ult_estado  
					FROM      "CD_FOLIO"  
					WHERE  ( "CD_FOLIO"."BASE" = :gs_base ) AND  
								( "CD_FOLIO"."SERIE" = :gs_serie ) AND  
								( "CD_FOLIO"."NUMERO" = :gi_numero )   
					USING   sqlca;
					if sqlca.sqlcode<>0 then 
						 OpenWithParm(w_verificar_contrato, gs_base+'~t'+gs_serie+'~t'+string(gi_numero))
						 ls_respuesta     = Message.StringParm
					end if                                                    
					if ls_respuesta='S' then
						 dw_agente.setitem(1,'agente',gs_age)
						 dw_supervisor.setitem(1,'supervisores',gs_sup)
						 dw_jefe.setitem(1,'jefes',gs_jefe)
						 is_pasa_asigna                                                                = 'N'
						 if dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
							 wf_mostrar_liberador()
							 wf_buscar_seguro(gs_base,gs_serie,gi_numero);
							 gs_nueva_oferta                                            = 'N'
							 dw_anexo_liberador.SetItem(1, 'estado_rut',0)
							 dw_anexo_liberador.setitem(1, 'estado_contrato',0)
							 dw_agente.setfocus()
							 // inicio
							 ldt_fecha_pie   = dw_anexo_liberador.GetItemdatetime(1,'pago_liberador_fecha_pie')
							 ld_fecha_min    = datetime(RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1)),time('00:00:00'))
							 ld_fecha_max   = datetime(RelativeDate(date(gdt_fec_sistema),  ll_dias_tope_def),time('00:00:00'))
							 if (ldt_fecha_pie < ld_fecha_min or ldt_fecha_pie > ld_fecha_max) and not isnull(ldt_fecha_pie) then
												  dw_agente.enabled                                    = false
												  dw_supervisor.enabled                               = false
												  dw_jefe.enabled                                      = false
							 end if    
							 //            fin
						 else
							 wf_nuevo_liberador()
							 gs_nueva_oferta                                            = 'S'
						 END IF
					else
						 pb_limpiar.triggerevent(clicked!)
					end if
			  end if
		 end if     
	 end if
end if
dw_anexo_liberador.setitem(1,'valor_iva',ldb_iva)

dw_seguro.accepttext()
dw_anexo_liberador.accepttext()

ll_tot_reg						= dw_seguro.rowcount()

if ll_tot_reg >= 0 then
	for ll_indi=1 to ll_tot_reg
		ll_est_reg				= dw_seguro.getitemnumber(ll_indi,'c_estado_reg')
		ll_codigo					= dw_seguro.getitemnumber(ll_indi,'codigo')
		if ll_codigo = 8 then
			dw_seguro.setitem(ll_indi,'c_estado_reg',0)
		else
			dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		end if
		if ll_est_reg = 1 then
			ldb_factor_prima	= dw_seguro.getitemnumber(ll_indi,'factor_prima')
			if ll_codigo = 8 then
				ldb_factor_prima = 0.0
			end if
			ldb_suma			= ldb_suma + ldb_factor_prima
		end if
	next
if isnull(ldb_suma) then ldb_suma=0
	dw_anexo_liberador.setitem(1,'cuota_seguros',ldb_suma)
end if
dw_seguro.accepttext()
dw_anexo_liberador.accepttext()

end event

type st_1 from statictext within w_ingresar_liberador
integer x = 288
integer y = 224
integer width = 151
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

type dw_1 from datawindow within w_ingresar_liberador
boolean visible = false
integer x = 923
integer y = 1912
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

type dw_clientes from datawindow within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 27
integer y = 676
integer width = 3351
integer height = 520
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
gi_rut		= this.getitemnumber(1,'rut')
ls_string	= 'M'+'~t'+string(il_tipo_cliente)
if gi_rut>0 then openwithparm(w_ingreso_cliente,ls_string) 
end event

type dw_supervisor from datawindow within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 2939
integer y = 32
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

event itemchanged;Long		ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_numero_asoc,&
			ll_nro,ll_rut,ll_resp,ll_annos_lib
String	ls_string,ls_obs,ls_tipo_cont,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_jefe,&
			ls_cod_sup,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_aux,ls_base_contrato,ls_serie_contrato,ls_fecha
datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,&
			ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_peso,ldb_int_uf
			
this.accepttext()
ls_cod_sup	= dw_supervisor.getitemstring(1,'supervisores')
if not isnull(ls_cod_sup) then
	if gi_rut>0 then
		is_sw_sup	= 'S'
		gs_serie 	= trim(em_serie.Text)
		gs_base		= 'L'
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
						dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
						dw_anexo_liberador.accepttext()
						if il_resp_age<>1 then
							if is_sw_sup='S' and not isnull(gs_age) and gs_age<>'' and not isnull(gs_jefe) and gs_jefe<>''then //gs_nueva_oferta='S' and 
								il_resp_sup	= MessageBox("Advertencia", "Está seguro de ASIGNAR Liberador Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
								IF il_resp_sup = 1 THEN
									ls_string	= gs_serie+'~t'+string(gi_numero)+'~t'+gs_age+'~t'+string(gdt_fec_sistema)+'~t'+string(gdt_fec_sistema)+'~t'+'V'+'~t'+ls_obs+'~t'+gs_sup+'~t'+gs_jefe
									openwithparm(w_verificar_datos_contrato,ls_string)
									IF trim(Message.StringParm)='OK' THEN
										SELECT	"AGENTES"."TIPO_CONT"  
										INTO 		:ls_tipo_cont  
										FROM 		"AGENTES"  
										WHERE 	"AGENTES"."COD_AGE" = :gs_age and "AGENTES"."COD_SUP" <> '036'  ;
										if ls_tipo_cont = '3' OR ls_tipo_cont = '4' then
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
										ls_obs	= 'Liberador creado por '+gs_user+' el '+string(gdt_fec_sistema)
										if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
										dw_anexo_liberador.enabled			= true
										if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
											isnull(dw_jefe.getitemstring(1,'jefes')) then
											dw_anexo_liberador.setitem(1,'estado_rut',1)
										else
											if gi_rut>0 then dw_anexo_liberador.setitem(1,'estado_rut',0)
										end if
										SELECT	"CADENA"."CODIGO"  
										INTO 		:ls_base_aux  
										FROM 		"CADENA"  
										WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
												 ( "CADENA"."SERIE" = :gs_serie ) AND  
												 ( "CADENA"."NUMERO" = :gi_numero )   
										USING		sqlca;
										if sqlca.sqlcode=100 then
											SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC",	"REVISION_CONTRATOS"."LIBERADOR_ANNOS"
											INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc,		:ll_annos_lib
											FROM 		"REVISION_CONTRATOS"  
											WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
													 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
													 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) 
													 //AND
													// ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
											USING		sqlca;
											if sqlca.sqlcode=0 then
												dw_anexo_liberador.SetItem(1,'base',ls_base_asoc)
												dw_anexo_liberador.SetItem(1,'serie',ls_serie_asoc)
												dw_anexo_liberador.SetItem(1,'nro_oferta',ll_numero_asoc)
												dw_anexo_liberador.SetItem(1,'pago_liberador_fecha',ldt_fecha_ctto_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_moneda',ls_moneda_rev)
												dw_anexo_liberador.SetItem(1,'forma_pago',ls_forma_pago_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_pie',ldb_pie_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_nro_cuotas',ll_plazo_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_gastos_adm',ldb_gasto_adm_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_valor_cuota',ldb_valor_cuota_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_precio',ldb_precio_ctto_rev)
												dw_anexo_liberador.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
												dw_anexo_liberador.SetItem(1,'pago_liberador_fecha_prim',ldt_fecha_prim_rev)
												
												ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
												//if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
												dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
												
												dw_anexo_liberador.SetItem(1,'pago_liberador_anno_liberar',ll_annos_lib)
												SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
												INTO 		:ldb_int_peso,								:ldb_int_uf
												FROM 		"INTERES_CUOTAS"  
												WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
												USING		sqlca;
												if sqlca.sqlcode=0 then
													if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
														ldb_int_peso	= 0
														ldb_int_uf		= 0
													end if
													if ls_moneda_rev='1' then //peso
														dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_peso)
													elseif ls_moneda_rev='2' then //UF
														dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_uf)
													end if
												end if
												ls_base_contrato 					= dw_anexo_liberador.getitemstring(1,'base')
												ls_serie_contrato 				= dw_anexo_liberador.getitemstring(1,'serie')
												ll_nro								= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
												if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
													dw_anexo_liberador.getchild('serie',idw_detalle)
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
															dw_anexo_liberador.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																		  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																		  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																		  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
															if ll_resp=1 then
																dw_anexo_liberador.setitem(1,'estado_contrato',0)
																cb_aceptar.enabled	= true
															else
																dw_anexo_liberador.setitem(1,'estado_contrato',1)
																cb_aceptar.enabled	= false
															end if
														end if
													else
														MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
														dw_anexo_liberador.setitem(1,'estado_contrato',1)
														cb_aceptar.enabled	= false
													end if
												end if
											end if
										end if
										dw_anexo_liberador.setfocus()
										dw_anexo_liberador.setcolumn('base')
									else
										dw_anexo_liberador.enabled			= false
										dw_anexo_liberador.setitem(1,'estado_rut',1)
										messagebox("Advertencia","NO fue Asignado Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
										dw_jefe.setfocus()
									end if
								else
									dw_anexo_liberador.setitem(1,'estado_rut',1)
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
						dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
						dw_anexo_liberador.accepttext()
						if is_sw_sup='S' and not isnull(gs_age) and gs_age<>'' and not isnull(gs_jefe) and gs_jefe<>'' then//if il_resp_age=2 and is_sw_sup='S' then
							il_resp_sup	= MessageBox("Advertencia", "Está seguro de ASIGNAR Liberador Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
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
										VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0		,0					,0			,0 )  
										USING		sqlca	;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs	= 'Liberador creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									dw_anexo_liberador.enabled			= true
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_liberador.setitem(1,'estado_rut',1)
									else
										if gi_rut>0 then dw_anexo_liberador.setitem(1,'estado_rut',0)
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM 		"CADENA"  
									WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
											 ( "CADENA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC",	"REVISION_CONTRATOS"."LIBERADOR_ANNOS"
										INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc,		:ll_annos_lib
										FROM 		"REVISION_CONTRATOS"  
										WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
												 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
												 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero ) 
												 //AND
												// ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_liberador.SetItem(1,'base',ls_base_asoc)
											dw_anexo_liberador.SetItem(1,'serie',ls_serie_asoc)
											dw_anexo_liberador.SetItem(1,'nro_oferta',ll_numero_asoc)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha',ldt_fecha_ctto_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_moneda',ls_moneda_rev)
											dw_anexo_liberador.SetItem(1,'forma_pago',ls_forma_pago_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_pie',ldb_pie_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_nro_cuotas',ll_plazo_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_gastos_adm',ldb_gasto_adm_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_precio',ldb_precio_ctto_rev)
											dw_anexo_liberador.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha_prim',ldt_fecha_prim_rev)
											
											ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
											//if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
											dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
											
											dw_anexo_liberador.SetItem(1,'pago_liberador_anno_liberar',ll_annos_lib)
											SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
											INTO 		:ldb_int_peso,								:ldb_int_uf
											FROM 		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
													ldb_int_peso	= 0
													ldb_int_uf		= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_uf)
												end if
											end if
											ls_base_contrato 					= dw_anexo_liberador.getitemstring(1,'base')
											ls_serie_contrato 				= dw_anexo_liberador.getitemstring(1,'serie')
											ll_nro								= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
											if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
												dw_anexo_liberador.getchild('serie',idw_detalle)
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
														dw_anexo_liberador.setitem(1,'estado_contrato',0)
														cb_aceptar.enabled	= true
													else
														ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																	  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																	  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																	  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
														if ll_resp=1 then
															dw_anexo_liberador.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															dw_anexo_liberador.setitem(1,'estado_contrato',1)
															cb_aceptar.enabled	= false
														end if
													end if
												else
													MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
													dw_anexo_liberador.setitem(1,'estado_contrato',1)
													cb_aceptar.enabled	= false
												end if
											end if
										end if
									end if
									dw_anexo_liberador.setfocus()
								else
									dw_anexo_liberador.enabled			= false
									dw_anexo_liberador.setitem(1,'estado_rut',1)
									messagebox("Advertencia","NO fue Re-Asignado Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									dw_jefe.setfocus()
								end if
							else
								dw_anexo_liberador.setitem(1,'estado_rut',1)
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
			UPDATE	"ANEXO_LIBERADOR"  
			SET 		"COD_AGENTE" = :gs_age,   
						"COD_SUPER" = :gs_sup,   
						"COD_JEF" = :gs_jefe  
			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
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
end event

type dw_agente from datawindow within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 2194
integer y = 32
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

event itemchanged;Long		ll_resp,ll_grabar_1=0,ll_grabar_2=1,ll_plazo_rev,ll_cod_parque_rev,ll_numero_asoc,&
			ll_rut,ll_nro,ll_annos_lib,ll_tot_reg,ll_indi,ll_codigo_iva
String		ls_tipo_cont,ls_obs,ls_ok,ls_string,ls_age_aux,ls_sup_aux,ls_jefe_aux,ls_sup,ls_cod_age,ls_moneda_rev,ls_forma_pago_rev,ls_area_rev,ls_base_asoc,ls_serie_asoc,&
			ls_base_aux,ls_base_contrato,ls_serie_contrato,ls_canal,ls_fecha
Datetime	ldt_fecha_ctto_rev,ldt_fecha_prim_rev
Double	ldb_uf_ctto_rev,ldb_pie_rev,ldb_gasto_adm_rev,ldb_saldo_financiar_rev,ldb_valor_cuota_rev,&
			ldb_precio_ctto_rev,ldb_factor_cuota_rev,ldb_int_uf,ldb_int_peso

this.accepttext()
ls_cod_age	= dw_agente.getitemstring(1,'agente')
if not isnull(ls_cod_age) then
	if gi_rut>0 then
		is_sw_age	= 'S'
		gs_serie 	= trim(em_serie.Text)
		gs_base		= 'L'
		if is_pasa_asigna='S' then
			gs_age	= dw_agente.getitemstring(1,'agente')
			gs_sup	= dw_supervisor.getitemstring(1,'supervisores')
			gs_jefe	= dw_jefe.getitemstring(1,'jefes')
			if not isnull(gs_age) and gs_age<>'' then
				if gl_cod_parque=0 or isnull(gl_cod_parque) then
					SELECT	"AGENTES"."COD_SUP",
								"AGENTES"."COD_PARQUE",
								"AGENTES"."CANAL"
					INTO 		:ls_sup,
								:gl_cod_parque,
								:ls_canal
					FROM 		"AGENTES",   
								"SUPERVISOR"  
					WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							 (("AGENTES"."COD_AGE" = :gs_age ) )   
					USING		sqlca;
				else
					SELECT	"AGENTES"."COD_SUP",
								"AGENTES"."CANAL"
					INTO 		:ls_sup,
								:ls_canal
					FROM 		"AGENTES",   
								"SUPERVISOR"  
					WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							 (("AGENTES"."COD_AGE" = :gs_age ) )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					dw_anexo_liberador.SetItem(1, "cadena_cod_parque", gl_cod_parque)
					dw_anexo_liberador.SetItem(1, "anexo_liberador_canal_venta", ls_canal)
					if isnull(gs_age) then
						messagebox("Advertencia","Debe Ingresar Agente")
						dw_agente.setfocus()
					else
						dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
						dw_anexo_liberador.accepttext()
						if is_sw_age='S' and not isnull(gs_sup) and gs_sup<>'' and gs_jefe<>'' and not isnull(gs_jefe) then //gs_nueva_oferta='S' and 
							il_resp_age	= MessageBox("Advertencia", "Está seguro de ASIGNAR Liberador Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
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
									dw_anexo_liberador.SetItem(1, "cadena_cod_parque", gl_cod_parque)
									if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
										INSERT INTO "COMISION_PROMESA"  
													( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
										VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0		,0					,0			,0 )  
										USING		sqlca	;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs	= 'Liberador creada por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_liberador.setitem(1,'estado_rut',1)
									else
										if gi_rut>0 then dw_anexo_liberador.setitem(1,'estado_rut',0)
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM 		"CADENA"  
									WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
											 ( "CADENA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC",	"REVISION_CONTRATOS"."LIBERADOR_ANNOS"
										INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc,		:ll_annos_lib
										FROM 		"REVISION_CONTRATOS"  
										WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
												 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
												 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )
												 //AND
												// ( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_liberador.SetItem(1,'base',ls_base_asoc)
											dw_anexo_liberador.SetItem(1,'serie',ls_serie_asoc)
											dw_anexo_liberador.SetItem(1,'nro_oferta',ll_numero_asoc)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha',ldt_fecha_ctto_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_moneda',ls_moneda_rev)
											dw_anexo_liberador.SetItem(1,'forma_pago',ls_forma_pago_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_pie',ldb_pie_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_nro_cuotas',ll_plazo_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_gastos_adm',ldb_gasto_adm_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_precio',ldb_precio_ctto_rev)
											dw_anexo_liberador.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha_prim',ldt_fecha_prim_rev)
											
											ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
											//if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
											dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
																					
											
											dw_anexo_liberador.SetItem(1,'pago_liberador_anno_liberar',ll_annos_lib)
											SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
											INTO 		:ldb_int_peso,								:ldb_int_uf
											FROM 		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
													ldb_int_peso	= 0
													ldb_int_uf		= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_uf)
												end if
											end if
											ls_base_contrato 					= dw_anexo_liberador.getitemstring(1,'base')
											ls_serie_contrato 				= dw_anexo_liberador.getitemstring(1,'serie')
											ll_nro								= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
											if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
												dw_anexo_liberador.getchild('serie',idw_detalle)
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
														dw_anexo_liberador.setitem(1,'estado_contrato',0)
														cb_aceptar.enabled	= true
													else
														ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																	  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																	  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																	  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
														if ll_resp=1 then
															dw_anexo_liberador.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															dw_anexo_liberador.setitem(1,'estado_contrato',1)
															cb_aceptar.enabled	= false
														end if
													end if
												else
													MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
													dw_anexo_liberador.setitem(1,'estado_contrato',1)
													cb_aceptar.enabled	= false
												end if
											end if
										end if
									end if
									dw_anexo_liberador.enabled			= true
									dw_anexo_liberador.setfocus()
									dw_anexo_liberador.setcolumn('base')
								else
									dw_anexo_liberador.enabled			= false
									dw_anexo_liberador.setitem(1,'estado_rut',1)
									messagebox("Advertencia","NO fue Asignada Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									dw_supervisor.setfocus()
								end if
							else
								dw_anexo_liberador.setitem(1,'estado_rut',1)
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
								"AGENTES"."CANAL"
					INTO 		:ls_sup,
								:gl_cod_parque,
								:ls_canal
					FROM 		"AGENTES",   
								"SUPERVISOR"  
					WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							 (("AGENTES"."COD_AGE" = :gs_age ) )   
					USING		sqlca;
				else
					SELECT	"AGENTES"."COD_SUP",
								"AGENTES"."CANAL"
					INTO 		:ls_sup,
								:ls_canal
					FROM 		"AGENTES",   
								"SUPERVISOR"  
					WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							 (("AGENTES"."COD_AGE" = :gs_age ) )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					dw_anexo_liberador.SetItem(1, "cadena_cod_parque", gl_cod_parque)
					dw_anexo_liberador.SetItem(1, "anexo_liberador_canal_venta", ls_canal)
					if isnull(gs_age) then
						messagebox("Advertencia","Debe Ingresar Agente")
						dw_agente.setfocus()
					else
						dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
						dw_anexo_liberador.accepttext()
						if is_sw_age='S' and not isnull(gs_sup) and gs_sup<>'' and gs_jefe<>'' and not isnull(gs_jefe) then
							il_resp_age	= MessageBox("Advertencia", "Está seguro de ASIGNAR Liberador Nº "+gs_serie+'-'+string(gi_numero,"###,###,###,###"),Exclamation!, YesNo!, 2)
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
									dw_anexo_liberador.SetItem(1, "cadena_cod_parque", gl_cod_parque)
									if ls_tipo_cont = '3' or ls_tipo_cont = '4' then
										INSERT INTO "COMISION_PROMESA"  
													( "BASE"  ,"SERIE"   ,"NUMERO"   ,"C_PIE","C_PRIMERA","C_SEGUNDA","C_TERCERA","C_CUARTA","C_QUINTA","C_SEXTA","C_SEPTIMA","C_OCTAVA","C_NOVENA" )  
										VALUES 	( :gs_base ,:gs_serie ,:gi_numero ,0      ,0          ,0          ,0          ,0         ,0         ,0 			,0				,0				,0)  
										USING		sqlca	;
										if sqlca.sqlcode=0 then
											ll_grabar_1	= 1
//												commit;
										else
											ll_grabar_1	= 0
//												rollback;
										end if
									end if
									ls_obs	= 'Liberador creado por '+gs_user+' el '+string(gdt_fec_sistema)
									if len(ls_obs)>50 then ls_obs=mid(ls_obs,1,50)
									dw_anexo_liberador.enabled		= true
									if isnull(dw_agente.getitemstring(1,'agente')) or isnull(dw_supervisor.getitemstring(1,'supervisores')) or &
										isnull(dw_jefe.getitemstring(1,'jefes')) then
										dw_anexo_liberador.setitem(1,'estado_rut',1)
									else
										if gi_rut>0 then dw_anexo_liberador.setitem(1,'estado_rut',0)
									end if
									SELECT	"CADENA"."CODIGO"  
									INTO 		:ls_base_aux  
									FROM 		"CADENA"  
									WHERE  ( "CADENA"."CODIGO" = :gs_base ) AND  
											 ( "CADENA"."SERIE" = :gs_serie ) AND  
											 ( "CADENA"."NUMERO" = :gi_numero )   
									USING		sqlca;
									if sqlca.sqlcode=100 then
										SELECT	"REVISION_CONTRATOS"."FECHA_CTTO",	"REVISION_CONTRATOS"."UF_FECHA_CTTO",	"REVISION_CONTRATOS"."MONEDA",	"REVISION_CONTRATOS"."FORMA_PAGO",	"REVISION_CONTRATOS"."AREA",	"REVISION_CONTRATOS"."PIE",	"REVISION_CONTRATOS"."PLAZO",	"REVISION_CONTRATOS"."FECHA_PRIM",	"REVISION_CONTRATOS"."GASTO_ADM",	"REVISION_CONTRATOS"."SALDO_FINANCIAR",	"REVISION_CONTRATOS"."VALOR_CUOTA",	"REVISION_CONTRATOS"."PRECIO_CONTRATO",	"REVISION_CONTRATOS"."FACTOR_CUOTA",	"REVISION_CONTRATOS"."COD_PARQUE",	"REVISION_CONTRATOS"."BASE_ASOC",	"REVISION_CONTRATOS"."SERIE_ASOC",	"REVISION_CONTRATOS"."NUMERO_ASOC",	"REVISION_CONTRATOS"."LIBERADOR_ANNOS"
										INTO 		:ldt_fecha_ctto_rev,						:ldb_uf_ctto_rev,								:ls_moneda_rev,						:ls_forma_pago_rev,						:ls_area_rev,						:ldb_pie_rev,						:ll_plazo_rev,						:ldt_fecha_prim_rev,						:ldb_gasto_adm_rev,						:ldb_saldo_financiar_rev,						:ldb_valor_cuota_rev,					:ldb_precio_ctto_rev,							:ldb_factor_cuota_rev,						:ll_cod_parque_rev,						:ls_base_asoc,								:ls_serie_asoc,							:ll_numero_asoc,		:ll_annos_lib
										FROM 		"REVISION_CONTRATOS"  
										WHERE  ( "REVISION_CONTRATOS"."BASE" = :gs_base ) AND  
												 ( "REVISION_CONTRATOS"."SERIE" = :gs_serie ) AND  
												 ( "REVISION_CONTRATOS"."NUMERO" = :gi_numero )
												 //AND
												 //( "REVISION_CONTRATOS"."ESTADO_REVISION" = 'A')  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											dw_anexo_liberador.SetItem(1,'base',ls_base_asoc)
											dw_anexo_liberador.SetItem(1,'serie',ls_serie_asoc)
											dw_anexo_liberador.SetItem(1,'nro_oferta',ll_numero_asoc)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha',ldt_fecha_ctto_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_moneda',ls_moneda_rev)
											dw_anexo_liberador.SetItem(1,'forma_pago',ls_forma_pago_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_pie',ldb_pie_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_nro_cuotas',ll_plazo_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_gastos_adm',ldb_gasto_adm_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_valor_cuota',ldb_valor_cuota_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_precio',ldb_precio_ctto_rev)
											dw_anexo_liberador.SetItem(1,'cadena_cod_parque',ll_cod_parque_rev)
											dw_anexo_liberador.SetItem(1,'pago_liberador_fecha_prim',ldt_fecha_prim_rev)
											
											ls_fecha			= f_fecha_vcto_prim(  ll_plazo_rev ,  ldt_fecha_prim_rev  )
											//if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
											dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
											
											dw_anexo_liberador.SetItem(1,'pago_liberador_anno_liberar',ll_annos_lib)
											SELECT	"INTERES_CUOTAS"."INTERES_PESOS",	"INTERES_CUOTAS"."INTERES_UF"
											INTO 		:ldb_int_peso,								:ldb_int_uf
											FROM 		"INTERES_CUOTAS"  
											WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_plazo_rev   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
													ldb_int_peso	= 0
													ldb_int_uf		= 0
												end if
												if ls_moneda_rev='1' then //peso
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_peso)
												elseif ls_moneda_rev='2' then //UF
													dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',ldb_int_uf)
												end if
											end if
											ls_base_contrato 					= dw_anexo_liberador.getitemstring(1,'base')
											ls_serie_contrato 				= dw_anexo_liberador.getitemstring(1,'serie')
											ll_nro								= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
											if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
												dw_anexo_liberador.getchild('serie',idw_detalle)
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
														dw_anexo_liberador.setitem(1,'estado_contrato',0)
														cb_aceptar.enabled	= true
													else
														ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
																	  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
																	  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
																	  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
														if ll_resp=1 then
															dw_anexo_liberador.setitem(1,'estado_contrato',0)
															cb_aceptar.enabled	= true
														else
															dw_anexo_liberador.setitem(1,'estado_contrato',1)
															cb_aceptar.enabled	= false
														end if
													end if
												else
													MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
													dw_anexo_liberador.setitem(1,'estado_contrato',1)
													cb_aceptar.enabled	= false
												end if
											end if
										end if
									end if
									dw_anexo_liberador.setfocus()
								else
									dw_anexo_liberador.enabled		= false
									dw_anexo_liberador.setitem(1,'estado_rut',1)
									messagebox("Advertencia","NO fue Re-Asignada Liberador Nº "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###"))
									dw_supervisor.setfocus()
								end if
							else
								dw_anexo_liberador.setitem(1,'estado_rut',1)
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
		dw_anexo_liberador.accepttext( )
		ll_tot_reg						= dw_seguro.rowcount()
		if date(ldt_fecha_ctto_rev) >= date('20/02/2023') then
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ll_codigo_iva = dw_seguro.getitemnumber(ll_indi,'codigo')
					dw_seguro.setitem(ll_indi,'c_estado_reg',1)
					if ll_codigo_iva = 8 and date(ldt_fecha_ctto_rev) >= date('20/02/2023') then
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
		dw_anexo_liberador.accepttext( )
		//////
		ll_tot_reg						= dw_seguro.rowcount()
		if date(ldt_fecha_ctto_rev) >= date('20/02/2023') then
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ll_codigo_iva = dw_seguro.getitemnumber(ll_indi,'codigo')
					dw_seguro.setitem(ll_indi,'c_estado_reg',1)
					if ll_codigo_iva = 8 and date(ldt_fecha_ctto_rev) >= date('20/02/2023') then
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
		dw_anexo_liberador.accepttext( )
		///////
		if ll_grabar_1	= 1 and ll_grabar_2 = 1 then
			commit using sqlca;
			UPDATE	"ANEXO_LIBERADOR"  
			SET 		"COD_AGENTE" = :gs_age,   
						"COD_SUPER" = :gs_sup,   
						"COD_JEF" = :gs_jefe  
			WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
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
end event

type st_seg_fune from statictext within w_ingresar_liberador
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 937
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

type dw_anexo_liberador from datawindow within w_ingresar_liberador
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 32
integer width = 3365
integer height = 1632
integer taborder = 80
string dataobject = "d_ingreso_anexo_liberador"
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

event itemchanged;long 		ll_cant, ll_fila, ll_nro_cuotas,ll_dias,ll_gasto_peso,ll_gastos_adm_peso,ll_rut_aux,ll_rut,ll_resp,ll_count_reg,ll_nulo,ll_tot_reg,ll_indi,ll_dias_tope_def,&
			ll_dias_inicio_def,ll_est_reg,ll_prima_peso,ll_suma_peso
string 	ls_columna, ls_base_contrato, ls_serie_contrato, ls_null,ls_base,ls_fecha,ls_moneda,ls_uso,ls_string
date 		ld_null,ld_fecha_prim,ld_fecha_min,ld_nulo,ld_fecha_ctto
Datetime	ldt_fecha_prim,ldt_fecha
Double	lld_tasa,lld_kapital,lld_valor_cuo,lld_valor_adm,lld_pie,lld_valor_uf,ldb_precio,lld_gasto_uf,lld_saldo_finan,lld_factor,lld_fac_cta_mensual,lld_gastos_adm_uf,&
			ldb_suma_cuota,ll_nro_contrato,ll_nro,ldb_iva,ldb_factor_prima,ldb_suma,lld_uf,ldb_iva_pie_trun
SetNull(ls_Null);SetNull(ld_null);SetNull(ll_nulo)

SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA"  , "TASA"."IVA"  
INTO 		:gdt_fec_sistema,	
			:ll_dias_tope_def,			
			:ll_dias_inicio_def,
			:ldb_iva
FROM 	"TASA"  ;

dw_anexo_liberador.setitem(1,'valor_iva',ldb_iva)

this.AcceptText()
ls_columna 								= GetColumnName()
IF ls_columna = "rut" THEN
	gi_rut									= Long(GetItemNumber(1, "rut"))
	ll_cant								= dw_clientes.Retrieve(gi_rut)
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
		dw_anexo_liberador.setitem(1,'estado_rut',0)
		dw_anexo_liberador.setitem(1,'compute',dw_clientes.getitemstring(1,'dv'))
	END IF
end if
if ls_columna = 'cadena_cod_parque' then
	gl_cod_parque							= dw_anexo_liberador.getitemnumber(1,'cadena_cod_parque')
	ll_tot_reg								= dw_seguro.retrieve(gl_cod_parque,'L')
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			dw_seguro.setitem(ll_indi,'c_estado_reg',0)
		next
		dw_seguro.accepttext()
	end if
end if
IF ls_columna = "compute" THEN
	if integer(getitemstring(1,'compute')) <> integer(gf_obtener_dv(long(GetItemNumber(1, "rut")))) then
		messagebox('Error','El Rut no es valido',stopsign!)
		cb_aceptar.setfocus()
		dw_anexo_liberador.setitem(1,'estado_rut',1)
		this.setfocus()
		this.SetColumn('rut')
	else
		dw_anexo_liberador.setitem(1,'estado_rut',0)
		cb_aceptar.enabled 				= true
		dw_seguro.enabled				= true
	end if
end if
IF ls_columna = "nro_oferta" or ls_columna ="base" or ls_columna ="serie" THEN
	ls_base_contrato 						= dw_anexo_liberador.getitemstring(1,'base')
	ls_serie_contrato 						= dw_anexo_liberador.getitemstring(1,'serie')
	ll_nro										= dw_anexo_liberador.getitemnumber(1,'nro_oferta')
	if ls_columna = "base" then
		if not isnull(ls_base_contrato) and ls_base_contrato<>'' then
			dw_anexo_liberador.getchild('serie',idw_detalle)
			idw_detalle.settransobject(sqlca)
			idw_detalle.retrieve(ls_base_contrato)
		end if
	end if
	if not isnull(ls_base_contrato) and not isnull(ls_serie_contrato) and not isnull(ll_nro) and ll_nro>0 then
		SELECT		"CADENA"."RUT"
		INTO 			:ll_rut
		FROM 		"CADENA"
		WHERE   	("CADENA"."CODIGO" = :ls_base_contrato) and 
				  		("CADENA"."SERIE" = :ls_serie_contrato) and
				  		("CADENA"."NUMERO" = :ll_nro) 
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if gi_rut = ll_rut then
				dw_anexo_liberador.setitem(1,'estado_contrato',0)
				cb_aceptar.enabled	= true
				dw_seguro.enabled	= true
			else
				ll_resp	= messagebox("Advertencia","Anexo Liberador Nº "+gs_base+"-"+gs_serie+"-"+string(gi_numero,"###,###,###,###")+&
							  " es contratado por un TERCERO ??? ( El Contrato Asociado es Nº "+ls_base_contrato+"-"+&
							  ls_serie_contrato+"-"+string(ll_nro,"###,###,###,###") +" con Rut: "+ &
							  string(ll_rut,"###,###,###,###")+")",Exclamation!,YesNo!,2 )
				if ll_resp=1 then
					dw_anexo_liberador.setitem(1,'estado_contrato',0)
					cb_aceptar.enabled	= true
					dw_seguro.enabled	= true
				else
					dw_anexo_liberador.setitem(1,'estado_contrato',1)
					cb_aceptar.enabled	= false
					dw_seguro.enabled	= false
				end if
			end if
		else
			MessageBox("Anexo Liberador" , "No Existe el Contrato Asociado")	
			dw_anexo_liberador.setitem(1,'estado_contrato',1)
			cb_aceptar.enabled	= false
			dw_seguro.enabled	= false
		end if
	end if
end if
if ls_columna="pago_liberador_fecha_prim" or ls_columna="pago_liberador_nro_cuotas" then
	ldt_fecha_prim				= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
	ll_nro_cuotas				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
	if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
		ls_fecha					= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
		if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
			dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
		end if
	end if
end if
if ls_columna = "fecha" THEN
	dw_anexo_liberador.SetItem(1 , "pago_liberador_uf_dia", gf_uf( String(GetItemDateTime(1, "pago_liberador_fecha"),"dd/mm/yyyy") ) )
	dw_anexo_liberador.AcceptText()
END IF
if ls_columna = "pago_liberador_fecha_prim" THEN
	ld_fecha_prim				= date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim'))
	ld_fecha_min				= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
	if ld_fecha_prim < ld_fecha_min then
		messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
		dw_anexo_liberador.setitem(1,'pago_liberador_fecha_prim',date(gdt_fec_sistema))
		dw_anexo_liberador.accepttext()
	end if
end if
if ls_columna="pago_liberador_precio" or ls_columna="pago_liberador_tasa_base" or ls_columna="pago_liberador_valor_cuota" or ls_columna="pago_liberador_gastos_adm" or ls_columna="pago_liberador_pie" then
	ls_moneda					= this.getitemstring(1,'pago_liberador_moneda')
	lld_tasa						= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa_base'))
	if lld_tasa>100 then
		messagebox("Error","Valor Tasa Contrato Inválida")
		dw_anexo_liberador.setfocus()
		dw_anexo_liberador.setcolumn('pago_liberador_tasa_base')
	end if
	if ls_moneda='2' then //uf
		lld_kapital				= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio'))
		lld_valor_cuo			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota'))
		lld_valor_adm			= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm'))
		lld_pie					= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie'))
		if lld_kapital>=500 then 
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Precio)")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_precio')
		elseif lld_valor_cuo>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Cuota)")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_valor_cuota')
		elseif lld_valor_adm>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Valor Gasto Administrativo)")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_gastos_adm')
		elseif lld_pie>=500 then
			messagebox("Advertencia","Recuerde los Valores deben ser ingresados en U.F. (Verificar Pie)")
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_pie')
		end if
	end if
end if
if ls_columna="pago_liberador_moneda" then
	ls_moneda					= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
	lld_kapital					= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio'))
	lld_tasa						= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_tasa_base'))
	lld_valor_cuo				= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota'))
	lld_valor_adm				= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm'))
	lld_pie						= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie'))
	lld_valor_uf					= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_uf_dia'))
//	gd_uf_dia
	if gd_uf_dia>0 then
		if ls_moneda='1' then //peso
			if lld_kapital<500 then 
				dw_anexo_liberador.setitem(1,'pago_liberador_precio',long(round((lld_kapital * lld_valor_uf),2)))
				//dw_anexo_liberador.setitem(1,'iva_pie',lld_kapital * ldb_iva)
			end if
			if lld_valor_cuo<500 then
				dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',long(round((lld_valor_cuo * lld_valor_uf),2)))
				//dw_anexo_liberador.setitem(1,'valor_cuota_iva',lld_valor_cuo * ldb_iva)
			end if
			if lld_valor_adm<500 then
				dw_anexo_liberador.setitem(1,'pago_liberador_gastos_adm',long(round((lld_valor_adm * lld_valor_uf),2)))
			end if
			if lld_pie<500 then
				dw_anexo_liberador.setitem(1,'pago_liberador_pie',long(round((lld_pie * lld_valor_uf),2)))
				//dw_anexo_liberador.setitem(1,'iva_pie',lld_pie * ldb_iva)
			end if
		elseif ls_moneda='2' then //uf
			if lld_kapital>=500 then 
				dw_anexo_liberador.setitem(1,'pago_liberador_precio',(lld_kapital / lld_valor_uf))
				//dw_anexo_liberador.setitem(1,'iva_pie',lld_kapital * ldb_iva)
			end if
			if lld_valor_cuo>=500 then
				dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',(lld_valor_cuo / lld_valor_uf))
				//dw_anexo_liberador.setitem(1,'valor_cuota_iva',lld_valor_cuo * ldb_iva)
			end if
			if lld_valor_adm>=500 then
				dw_anexo_liberador.setitem(1,'pago_liberador_gastos_adm',(lld_valor_adm / lld_valor_uf))
			end if
			if lld_pie>=500 then
				dw_anexo_liberador.setitem(1,'pago_liberador_pie',(lld_pie / lld_valor_uf))
				//dw_anexo_liberador.setitem(1,'iva_pie',lld_pie * ldb_iva)
			end if
		end if
		dw_anexo_liberador.accepttext()
	end if
END IF
if ls_columna="pago_liberador_nro_cuotas" or ls_columna="pago_liberador_moneda" then
	ll_nro_cuotas				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
	ls_moneda					= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
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
				if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
					ll_gastos_adm_peso	= 0
				end if
				dw_anexo_liberador.setitem(1,'pago_liberador_gastos_adm',ll_gastos_adm_peso)
				SELECT	"INTERES_CUOTAS"."INTERES_PESOS"  
				INTO 		:lld_fac_cta_mensual  
				FROM 		"INTERES_CUOTAS"  
				WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cuotas   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
						lld_fac_cta_mensual	= 0
					end if
					dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',lld_fac_cta_mensual)
				end if
			elseif ls_moneda='2' then //uf
				lld_gastos_adm_uf		= ll_nro_cuotas * lld_gasto_uf  
				if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
					lld_gastos_adm_uf	= 0
				end if
				dw_anexo_liberador.setitem(1,'pago_liberador_gastos_adm',lld_gastos_adm_uf)
				SELECT	"INTERES_CUOTAS"."INTERES_UF"  
				INTO 		:lld_fac_cta_mensual  
				FROM 		"INTERES_CUOTAS"  
				WHERE 	"INTERES_CUOTAS"."NRO_CUOTAS" = :ll_nro_cuotas   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if dw_anexo_liberador.getitemstring(1,'forma_pago')='1' then
						lld_fac_cta_mensual	= 0
					end if
					dw_anexo_liberador.setitem(1,'pago_liberador_tasa_base',lld_fac_cta_mensual)
				end if
			end if
		end if
	end if	
end if	
if ls_columna='pago_liberador_valor_cuota' then
	SELECT	COUNT("LOG_ANEXO_LIBERADOR"."NRO_LIBERADOR")  
	INTO 		:il_modif  
	FROM 		"LOG_ANEXO_LIBERADOR"  
	WHERE  ( "LOG_ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
			 ( "LOG_ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='pago_liberador_nro_cuotas' then
	SELECT	COUNT("LOG_ANEXO_LIBERADOR"."NRO_LIBERADOR")  
	INTO 		:il_modif_plazo  
	FROM 		"LOG_ANEXO_LIBERADOR"  
	WHERE  ( "LOG_ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
			 ( "LOG_ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
	USING		sqlca;
end if
if ls_columna='pago_liberador_fecha_prim' then
	SELECT	COUNT("LOG_ANEXO_LIBERADOR"."NRO_LIBERADOR")  
	INTO 		:il_modif_fec  
	FROM 		"LOG_ANEXO_LIBERADOR"  
	WHERE  ( "LOG_ANEXO_LIBERADOR"."SERIE_M" = :gs_serie ) AND  
			 ( "LOG_ANEXO_LIBERADOR"."NRO_LIBERADOR" = :gi_numero )   
	USING		sqlca;
end if

if ls_columna="pago_liberador_nro_cuotas" or ls_columna="pago_liberador_fecha" or ls_columna="pago_liberador_fecha_prim" or &
	ls_columna="pago_liberador_moneda" or ls_columna="pago_liberador_precio" or ls_columna="pago_liberador_pie" or &
	ls_columna="pago_liberador_gastos_adm" then

	ll_nro_cuotas				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
	ldt_fecha						= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')
	ldt_fecha_prim				= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
	ls_moneda					= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
	ldb_precio					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio')
	lld_pie						= dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie')
	lld_gasto_uf					= dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm')
	dw_anexo_liberador.accepttext()
	lld_saldo_finan				= double(dw_anexo_liberador.getitemnumber(1,'saldo_finan'))
	if not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 and not isnull(ldt_fecha) and not isnull(ldt_fecha_prim) and &
		not isnull(ls_moneda) and not isnull(ldb_precio) and not isnull(lld_pie) and not isnull(lld_gasto_uf) and &
		ldb_precio>0 and lld_pie>0 and lld_gasto_uf>0 then
		if ldt_fecha_prim > ldt_fecha and ll_nro_cuotas > 0 then
			ll_dias	= DaysAfter(date(ldt_fecha),date(ldt_fecha_prim))
			if ll_nro_cuotas>=1 and ll_nro_cuotas<=11 then
				dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',ldb_precio + lld_pie)
				dw_anexo_liberador.setitem(1,'valor_cuota_iva',(ldb_precio + lld_pie)*ldb_iva)
			else
				if ll_dias>=30 then
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor  
					FROM 		"FACTORES"  
					WHERE  ( "FACTORES"."BASE" = 'L' ) AND  
							 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
							 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
							 ((:ll_dias >= "FACTORES"."DIAS_INICIAL")  AND  
							 ( :ll_dias <= "FACTORES"."DIAS_FINAL" ))  AND
							 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
							 ( "FACTORES"."MONEDA" = :ls_moneda )
					USING		sqlca;
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan	= lld_factor * lld_saldo_finan
						dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',lld_saldo_finan)
						dw_anexo_liberador.setitem(1,'valor_cuota_iva',(ldb_precio + lld_pie)*ldb_iva)
					else
						SELECT	"FACTORES"."FACTOR"  
						INTO 		:lld_factor 
						FROM 		"FACTORES"  
						WHERE  ( "FACTORES"."BASE" = 'L' ) AND  
								 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
								 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
								 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
								 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
								 ( "FACTORES"."FACTOR" = ( SELECT	MIN("FACTORES"."FACTOR") 
																	FROM 		"FACTORES" 
																	WHERE  ( "FACTORES"."BASE" = 'L' ) AND 
																			 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																			 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																			 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																			 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
																			 ( "FACTORES"."FACTOR" <> 0 ) ) )   ;
						if lld_factor > 0 and lld_saldo_finan > 0 then
							lld_saldo_finan	= lld_factor * lld_saldo_finan
							dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',lld_saldo_finan)
							dw_anexo_liberador.setitem(1,'valor_cuota_iva',(lld_saldo_finan)*ldb_iva)
						end if
					end if
				else
					SELECT	"FACTORES"."FACTOR"  
					INTO 		:lld_factor 
					FROM 		"FACTORES"  
					WHERE  ( "FACTORES"."BASE" = 'L' ) AND  
							 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
							 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
							 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
							 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
							 ( "FACTORES"."FACTOR" = ( SELECT	MIN("FACTORES"."FACTOR") 
																FROM 		"FACTORES" 
																WHERE  ( "FACTORES"."BASE" = 'L' ) AND 
																		 ( :ll_nro_cuotas >= "FACTORES"."NRO_CUOTAS_INICIAL")  AND  
																		 ( :ll_nro_cuotas <= "FACTORES"."NRO_CUOTAS_FINAL")  AND  
																		 ( "FACTORES"."MONEDA" = :ls_moneda ) AND 
																		 ( "FACTORES"."FECHA_VIGENCIA" = :idt_fecha_vig ) AND
																		 ( "FACTORES"."FACTOR" <> 0 ) ) )   
					USING		sqlca;
					if lld_factor > 0 and lld_saldo_finan > 0 then
						lld_saldo_finan	= lld_factor * lld_saldo_finan
						dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',lld_saldo_finan)
						dw_anexo_liberador.setitem(1,'valor_cuota_iva',lld_saldo_finan*ldb_iva)
					end if
				end if
			end if
		end if
	end if
end if
if ls_columna='pago_liberador_pie' then
	dw_anexo_liberador.accepttext()
	lld_pie										= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie'))
	ls_moneda									= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
	if lld_pie>0 then
		ls_uso			= 'NF'
		SELECT		Count("DETALLE_PAGO_PIE"."ESTADO")  
		INTO 			:ll_count_reg  
		FROM 		"DETALLE_PAGO_PIE"  
		WHERE  		( "DETALLE_PAGO_PIE"."BASE" = :gs_base ) AND  
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
			SELECT		SUM("DETALLE_PAGO_PIE"."MONTO_CUOTA")
			INTO 			:ldb_suma_cuota  
			FROM 		"DETALLE_PAGO_PIE"  
			WHERE  		( "DETALLE_PAGO_PIE"."BASE" = :gs_base ) AND  
					 		( "DETALLE_PAGO_PIE"."SERIE" = :gs_serie ) AND  
					 		( "DETALLE_PAGO_PIE"."NUMERO" = :gi_numero )   
			USING		sqlca;
			if ldb_suma_cuota>0 then
				dw_anexo_liberador.setitem(1,'pago_liberador_pie',ldb_suma_cuota)
				ldb_iva_pie_trun	= truncate((ldb_suma_cuota*ldb_iva),2)
				dw_anexo_liberador.setitem(1,'iva_pie',ldb_iva_pie_trun)
				dw_anexo_liberador.accepttext()
			end if
		end if
	end if
end if
end event

event clicked;string	ls_columna,ls_fecha,ls_moneda
Datetime	ldt_fecha_prim,ldt_fecha
Date		ld_fecha_prim,ld_fecha_min
Long		ll_nro_cuotas,ll_dias,ll_dias_tope_def,ll_dias_inicio_def
Double	ldb_precio,lld_pie,lld_gasto_uf,lld_saldo_finan,lld_factor,ldb_iva


SELECT	sysdate,	"TASA"."DIAS_TOPE_REPACTA",	"TASA"."DIAS_INICIO_REPACTA", "IVA"
INTO		:gdt_fec_sistema,	
			:ll_dias_tope_def,			
			:ll_dias_inicio_def,
			:ldb_iva
FROM 	"TASA"  ;

ls_columna	= dwo.name
if dw_anexo_liberador.getitemnumber(1,'estado_rut')=0 and dw_anexo_liberador.getitemnumber(1,'estado_contrato')=0 then
	CHOOSE CASE ls_columna
		CASE 'p_2'
			ls_fecha					= string(date(dw_anexo_liberador.getitemdatetime(1,'fecha_ingreso')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_liberador.setitem(1,'fecha_ingreso',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_anexo_liberador.setitem(1,'fecha_ingreso',date(ls_fecha))
			END IF
			dw_anexo_liberador.setcolumn('fecha_ingreso')
			
		CASE 'p_3'
			ls_fecha					= string(date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_pie')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha_pie',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha_pie',date(ls_fecha))
			END IF
			dw_anexo_liberador.setcolumn('pago_liberador_fecha_pie')
	
		CASE 'p_4'
			ld_fecha_prim	= date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim'))
			ld_fecha_min	= RelativeDate(date(gdt_fec_sistema),  (ll_dias_inicio_def * -1))
			if ld_fecha_prim < ld_fecha_min then
				messagebox("Advertencia","Fecha Primer Vencimiento Inválida")
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha_prim',date(gdt_fec_sistema))
				dw_anexo_liberador.accepttext()
			else
				ls_fecha					= string(date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')))
				if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
				if f_valida_fecha(ls_fecha)=-1 then 
					dw_anexo_liberador.setitem(1,'pago_liberador_fecha_prim',datetime(string(id_fecha_dia,gs_formato_fecha)))
					return
				end if
				OpenWithParm(w_calendar,ls_fecha)
				IF not isnull(Message.StringParm) THEN
					ls_fecha				= trim(Message.StringParm)
					dw_anexo_liberador.setitem(1,'pago_liberador_fecha_prim',date(ls_fecha))
				END IF
				ldt_fecha_prim	= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
				ll_nro_cuotas	= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
				if not isnull(ldt_fecha_prim) and not isnull(ll_nro_cuotas) and ll_nro_cuotas>0 then
					ls_fecha			= f_fecha_vcto_prim(  ll_nro_cuotas ,  ldt_fecha_prim  )
					if not isnull(ls_fecha) and ls_fecha<>'//' and ls_fecha<>'' then
						dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
					end if
				end if
				ll_nro_cuotas		= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
				ldt_fecha				= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')
				ldt_fecha_prim		= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
				ls_moneda			= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
				ldb_precio			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio')
				lld_pie				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie')
				lld_gasto_uf			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm')
				dw_anexo_liberador.accepttext()
				lld_saldo_finan		= double(dw_anexo_liberador.getitemnumber(1,'saldo_finan'))
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
								dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',lld_saldo_finan)
								dw_anexo_liberador.setitem(1,'valor_cuota_iva',lld_saldo_finan*ldb_iva)
								dw_anexo_liberador.setitem(1,'iva_pie',lld_pie*ldb_iva)
							end if
						end if
					end if
				end if
			end if
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_fecha_prim')
			
		CASE 'p_5'
			ls_fecha					= string(date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha',date(ls_fecha))
			END IF
			dw_anexo_liberador.SetItem(1,'pago_liberador_uf_dia', gf_uf( String(GetItemDateTime(1, "pago_liberador_fecha"),"dd/mm/yyyy") ) )
			dw_anexo_liberador.AcceptText()		
			ll_nro_cuotas		= dw_anexo_liberador.getitemnumber(1,'pago_liberador_nro_cuotas')
			ldt_fecha			= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha')
			ldt_fecha_prim		= dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_prim')
			ls_moneda			= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
			ldb_precio			= dw_anexo_liberador.getitemnumber(1,'pago_liberador_precio')
			lld_pie				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie')
			lld_gasto_uf		= dw_anexo_liberador.getitemnumber(1,'pago_liberador_gastos_adm')
			dw_anexo_liberador.accepttext()
			lld_saldo_finan	= double(dw_anexo_liberador.getitemnumber(1,'saldo_finan'))
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
							dw_anexo_liberador.setitem(1,'pago_liberador_valor_cuota',lld_saldo_finan)
							dw_anexo_liberador.setitem(1,'valor_cuota_iva',lld_saldo_finan*ldb_iva)
							dw_anexo_liberador.setitem(1,'iva_pie',lld_pie*ldb_iva)
						end if
					end if
				end if
			end if
			dw_anexo_liberador.setfocus()
			dw_anexo_liberador.setcolumn('pago_liberador_fecha')
			
		CASE 'p_6'
			ls_fecha					= string(date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha_ult')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_anexo_liberador.setitem(1,'pago_liberador_fecha_ult',date(ls_fecha))
			END IF
			dw_anexo_liberador.setcolumn('pago_liberador_fecha_ult')
	END CHOOSE
end if
end event

event doubleclicked;String		ls_columna,ls_moneda,ls_uso,ls_string
Long		ll_nulo
Date		ld_nulo
Double	lld_pie

ls_columna						= dwo.name
dw_anexo_liberador.accepttext()
if ls_columna='t_pie' then
	lld_pie						= double(dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie'))
	ls_moneda					= dw_anexo_liberador.getitemstring(1,'pago_liberador_moneda')
	if lld_pie>0 then
		ls_uso					= 'NF'
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

event itemfocuschanged;Double ldb_liberador_precio,ldb_liberador_valor_cuota,ldb_iva,ldb_factor_prima,ldb_suma
Long    ll_tot_reg,ll_indi,ll_est_reg,ll_codigo
Date	  ld_fecha_ctto

ldb_liberador_precio						= dw_anexo_liberador.getitemnumber(1,'pago_liberador_pie')
ldb_liberador_valor_cuota				= dw_anexo_liberador.getitemnumber(1,'pago_liberador_valor_cuota')

SELECT	 "TASA"."IVA"  
INTO 		:ldb_iva
FROM 	"TASA"  ;

if ldb_liberador_precio > 0 then
	dw_anexo_liberador.setitem(1,'iva_pie',ldb_liberador_precio * ldb_iva)
end if
if ldb_liberador_valor_cuota > 0 then
	dw_anexo_liberador.setitem(1,'valor_cuota_iva',ldb_liberador_valor_cuota * ldb_iva)
end if

ld_fecha_ctto				= date(dw_anexo_liberador.getitemdatetime(1,'pago_liberador_fecha'))

if date(ld_fecha_ctto) <= date('20/02/2023') then
	dw_anexo_liberador.setitem(1,'iva_pie',0)
	dw_anexo_liberador.setitem(1,'total_valor_cuota',0)
	dw_anexo_liberador.setitem(1,'total_cuota_iva',0)
end if
dw_anexo_liberador.accepttext( )

end event

