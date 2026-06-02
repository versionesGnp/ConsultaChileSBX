forward
global type w_generar_archivo_contab from window
end type
type cb_limpiar from commandbutton within w_generar_archivo_contab
end type
type cbx_sumar from checkbox within w_generar_archivo_contab
end type
type dw_suma from datawindow within w_generar_archivo_contab
end type
type ddlb_parque from dropdownlistbox within w_generar_archivo_contab
end type
type st_5 from statictext within w_generar_archivo_contab
end type
type ddlb_empresa from dropdownlistbox within w_generar_archivo_contab
end type
type st_4 from statictext within w_generar_archivo_contab
end type
type ddlb_caja from dropdownlistbox within w_generar_archivo_contab
end type
type st_3 from statictext within w_generar_archivo_contab
end type
type p_desde from picture within w_generar_archivo_contab
end type
type em_de from editmask within w_generar_archivo_contab
end type
type st_1 from statictext within w_generar_archivo_contab
end type
type cb_ver_detalle from commandbutton within w_generar_archivo_contab
end type
type dw_exporta_contab from datawindow within w_generar_archivo_contab
end type
type hpb_1 from hprogressbar within w_generar_archivo_contab
end type
type st_fondo from statictext within w_generar_archivo_contab
end type
type st_porc from statictext within w_generar_archivo_contab
end type
type st_resumen from statictext within w_generar_archivo_contab
end type
type p_hasta from picture within w_generar_archivo_contab
end type
type em_hasta from editmask within w_generar_archivo_contab
end type
type st_2 from statictext within w_generar_archivo_contab
end type
type cb_consultar from commandbutton within w_generar_archivo_contab
end type
type dw_detalle from datawindow within w_generar_archivo_contab
end type
type cb_ctacte from commandbutton within w_generar_archivo_contab
end type
type cb_exportar from commandbutton within w_generar_archivo_contab
end type
type cb_imprimir from commandbutton within w_generar_archivo_contab
end type
type cb_ordenar from commandbutton within w_generar_archivo_contab
end type
type cb_filtrar from commandbutton within w_generar_archivo_contab
end type
type cb_cerrar from commandbutton within w_generar_archivo_contab
end type
type gb_1 from groupbox within w_generar_archivo_contab
end type
type gb_2 from groupbox within w_generar_archivo_contab
end type
type dw_lista_resumen from datawindow within w_generar_archivo_contab
end type
type dw_lista from datawindow within w_generar_archivo_contab
end type
end forward

global type w_generar_archivo_contab from window
integer width = 3250
integer height = 2020
boolean titlebar = true
string title = "Generar Archivo Contabilidad"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cbx_sumar cbx_sumar
dw_suma dw_suma
ddlb_parque ddlb_parque
st_5 st_5
ddlb_empresa ddlb_empresa
st_4 st_4
ddlb_caja ddlb_caja
st_3 st_3
p_desde p_desde
em_de em_de
st_1 st_1
cb_ver_detalle cb_ver_detalle
dw_exporta_contab dw_exporta_contab
hpb_1 hpb_1
st_fondo st_fondo
st_porc st_porc
st_resumen st_resumen
p_hasta p_hasta
em_hasta em_hasta
st_2 st_2
cb_consultar cb_consultar
dw_detalle dw_detalle
cb_ctacte cb_ctacte
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
dw_lista_resumen dw_lista_resumen
dw_lista dw_lista
end type
global w_generar_archivo_contab w_generar_archivo_contab

type variables
datawindow dw_paso
date		ld_fecha_ini,ld_fecha_fin,ld_fecha_pago,ld_fecha_venc,ld_fecha_pago_ing
datetime	ldt_fecha_ini,ldt_fecha_fin
Time		lt_hora
long		ll_tot_reg,ll_indi,ll_monto,ll_new,ll_folio,ll_suma_monto1,ll_suma_monto2,&
			ll_suma_monto3,ll_suma_monto4,ll_monto_debe,ll_sum_monto_debe,	ll_sum_monto,&
			ll_tot_porc,ll_tot_porc_aux,ll_tipo_comision,ll_valor, ll_comision,il_cod_parque,&
			ll_sum_int_mora_p,ll_sum_int_mora_m,ll_sum_int_mora_f,ll_sum_int_gasto_p,ll_sum_int_gasto_m,&
			ll_sum_int_gasto_f,ll_sum_int_mora_r,ll_sum_int_gasto_r,ll_sum_mant_p,ll_sum_mant_m,ll_sum_mant_f,&
			ll_sum_mant_s,ll_sum_desc_p,ll_sum_desc_m,ll_sum_desc_f,ll_sum_desc_s,ll_sum_int_mora_c,ll_sum_int_gasto_c,&
			ll_sum_mant_c,ll_sum_desc_c
Double	lld_valor_uf,ld_factor,ll_sum_monto11_p,ll_sum_monto_otro_p,ll_sum_monto11_m,ll_sum_monto_otro_m,&
			ll_sum_monto11_s,ll_sum_monto_otro_s,ll_sum_monto11_f,ll_sum_monto_otro_f,ll_sum_monto_otro_c,ll_sum_monto11_c,&
			ll_numero
string	ls_base,ls_tipo_mov,ls_tipo_cob,ls_nro_cuenta,ls_rezago,ls_caja,ls_serie,&
			ls_forma_pago,ls_estado_cheque,ls_descrip_cuenta,ls_centro_costo,ls_tipo_empresa,&
			ls_codigo_otros,ls_descrip_otros,ls_estado_cheque_fecha,ls_caja_ok,&
			ls_string,ls_centro_costo_aux,ls_tipo_empresa_aux,ls_nro_cuenta_aux,&
			ls_descrip_cuenta_aux,ls_codigo_banco,ls_codigo_financiero,ls_codigo_banco_aux,&
			ls_codigo_financiero_aux,ls_cod_otro,ls_empresa,ls_codigo_cred,ls_vigente,&
			ls_tipo_cob_o,ls_tipo_cob_d,is_cod_parque,ls_codigo_otros_aux
end variables

forward prototypes
public subroutine wf_procesar_ambas_empresa ()
public subroutine wf_cheques_administradora ()
public subroutine wf_cheques_administradora1 ()
public subroutine wf_cheques_inmobiliaria1 ()
public subroutine wf_procesar_administradora ()
public subroutine wf_procesar_tarjeta_credito_dia_adm ()
public subroutine wf_procesar_tarjeta_credito_dia_inm ()
public subroutine wf_procesar_tarjeta_debito_adm ()
public subroutine wf_procesar_tarjeta_debito_inm ()
public subroutine wf_cheques_inmobiliaria ()
public subroutine wf_procesar_inmobiliaria ()
public subroutine wf_cargar_dw (long al_indi)
public function long wf_buscar_parque (string as_base, string as_serie, double al_numero, long al_fila)
end prototypes

public subroutine wf_procesar_ambas_empresa ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco
String	ls_banco,ls_cuotas
ls_caja										= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	wf_procesar_administradora()
	ll_suma_monto1=0;ll_suma_monto2=0;ll_suma_monto3=0;ll_suma_monto4=0
	wf_procesar_inmobiliaria()
END IF
end subroutine

public subroutine wf_cheques_administradora ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez
ls_caja						= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// Administradora cheques al dia mismo banco //TIPO_COB=TIPO_COB_AUX
	if gs_empresa='El Prado' or gs_empresa='La Foresta' or gs_empresa='Santiago' or gs_empresa='Concepcion' then
		ll_banco	= 16
		ls_banco	= '16'
	end if
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_a'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then 	ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then 	ll_suma_monto2 = dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then 	ll_suma_monto2 = dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then 	ll_suma_monto2 = dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then 	ll_suma_monto2 = dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if dw_suma.rowcount()>0 then
			if ll_suma_monto2>0 and il_cod_parque<>999 then
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then // el prado
				ll_cod_parque		= 1
				ll_new_lista			= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then // el manantial
				ll_cod_parque		= 102
				ll_new_lista			= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 	"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then // Concepcion
				ll_cod_parque		= 101
				ll_new_lista			= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 	"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then 
				ll_cod_parque	= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Administradora cheques al dia otro banco //TIPO_COB=TIPO_COB_AUX
	dw_suma.dataobject		= 'dw_buscar_sumas_montos_ch_2_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg				= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg > 0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 	then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 	then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto2 > 0 and il_cod_parque <> 999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then 
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then 
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then 
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Administradora cheques a fecha //TIPO_COB=TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_3_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')	
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')	
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')	
		if ll_suma_monto2>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
// Administradora cheques al dia mismo banco //TIPO_COB<>TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_4_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 		= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto2>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
END IF
end subroutine

public subroutine wf_cheques_administradora1 ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez

ls_caja						= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// Administradora cheques al dia otro banco //TIPO_COB<>TIPO_COB_AUX
	if gs_empresa='El Prado' or gs_empresa='La Foresta' or gs_empresa='Santiago' or gs_empresa='Concepcion' then
		ll_banco	= 16
		ls_banco	= '16'
	end if
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_5_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto2>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )   AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )   AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )   AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )   AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )   AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Administradora cheques a fecha //TIPO_COB<>TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_6_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto2>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Inmobiliaria cheques al dia mismo banco TIPO_COB<>TIPO_COB_AUX - OTRA EMPRESA
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_7_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Inmobiliaria cheques al dia otro banco TIPO_COB<>TIPO_COB_AUX - OTRA EMPRESA
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_8_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Inmobiliaria cheques a fecha TIPO_COB<>TIPO_COB_AUX - OTRA EMPRESA
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_9_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
END IF
end subroutine

public subroutine wf_cheques_inmobiliaria1 ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez
ls_caja						= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	if gs_empresa='El Prado' or gs_empresa='La Foresta' or gs_empresa='Concepcion' then
		ll_banco	= 1
		ls_banco	= '1'
	elseif gs_empresa='Santiago' then
		ll_banco	= 16
		ls_banco	= '16'
	end if
	// Inmobiliaria cheques al dia otro banco TIPO_COB<>TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_5'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Inmobiliaria cheques a fecha TIPO_COB<>TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_6'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto4>0 and il_cod_Parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_Parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_Parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_Parque=999 then
				ll_cod_parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_Parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Administradora cheques al dia mismo banco //TIPO_COB<>TIPO_COB_AUX - OTRA EMPRESA
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_7'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto2>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
		ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Administradora cheques al dia otro banco //TIPO_COB<>TIPO_COB_AUX - OTRA EMPRESA
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_8'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto2>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
	// Administradora cheques a fecha //TIPO_COB<>TIPO_COB_AUX - OTRA EMPRESA
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_9'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_santiago')		
		if il_cod_parque=101 then ll_suma_monto2 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto2>0 and il_cod_Parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto2		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto2>0 and il_cod_Parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto2	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto2>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto',ll_suma_monto2)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto',ll_suma_monto2)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
END IF
end subroutine

public subroutine wf_procesar_administradora ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_count_reg,&
			ll_fila,ll_cod_parque
String	ls_banco,ls_cuotas
ls_caja										= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	//Administradora efectivo
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ef_a'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'EF')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto1>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
			dw_lista.setitem(ll_new_lista,'forma_pago','EF')
			SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
		end if
		////suma_tot_santiago
		if dw_suma.rowcount()>0 then
			ll_suma_monto1		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista			= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
				dw_lista.setitem(ll_new_lista,'forma_pago','EF')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 	"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				if cbx_sumar.checked=true and dw_suma.getitemnumber(1,'suma_tot_prado')>0 then
					ll_suma_monto1	= ll_suma_monto1 + dw_suma.getitemnumber(1,'suma_tot_prado')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
				else
					ll_cod_parque		= 102
					ll_new_lista		= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				if cbx_sumar.checked=true and dw_suma.getitemnumber(1,'suma_tot_concepcion')>0 then
					ll_suma_monto1	= ll_suma_monto1 + dw_suma.getitemnumber(1,'suma_tot_concepcion')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
				else
					ll_cod_parque		= 101
					ll_new_lista		= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				if cbx_sumar.checked=true and dw_suma.getitemnumber(1,'suma_tot_manantial')>0 then
					ll_suma_monto1	= ll_suma_monto1 + dw_suma.getitemnumber(1,'suma_tot_manantial')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
				else
					ll_cod_parque		= 103
					ll_new_lista		= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if

		end if
	end if
	//Administradora Cheques
	wf_cheques_administradora()
	wf_cheques_administradora1()

	//Administradora Tarjeta Debito
	wf_procesar_tarjeta_debito_adm()

	// Administradora Tarjeta credito al dia
	wf_procesar_tarjeta_credito_dia_adm()

	// Administradora Tarjeta de Credito a fecha
	DECLARE	c_comi_adm2 CURSOR FOR  
	SELECT	"COMISION_TRANSBANK"."CODIGO",   
				"COMISION_TRANSBANK"."COMISION",   
				"COMISION_TRANSBANK"."TIPO_COMISION",   
				"TIPO_COMISION_TARJETA_CREDITO"."VIGENTE",
				"TIPO_TARJETA"."CUOTAS"  
	FROM 		"COMISION_TRANSBANK",   
				"TIPO_COMISION_TARJETA_CREDITO",
				"TIPO_TARJETA"
	WHERE  ( comision_transbank.tipo_comision = tipo_comision_tarjeta_credito.codigo (+)) and  
			 ( comision_transbank.tipo_comision = tipo_tarjeta.codigo (+)) and
			 (("COMISION_TRANSBANK"."CODIGO" = 'CC' ))   
	ORDER BY "COMISION_TRANSBANK"."TIPO_COMISION" ASC  
	USING		sqlca;
	open c_comi_adm2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0 
			fetch c_comi_adm2 into :ls_codigo_cred, :ld_factor, :ll_tipo_comision, :ls_vigente, :ls_cuotas;
			dw_suma.reset()
			if not isnull(ld_factor) then //ld_factor<>0 and 
				if not isnull(ll_tipo_comision) then
					if isnull(ls_vigente) or ls_vigente='S' or ls_cuotas='S' or ls_cuotas='N' then // tarjeta credito tiendas (Presto, etc.) a fecha
						ll_suma_monto4 	= 0
						if ll_tipo_comision>=1 and ll_tipo_comision<=5 then //=2
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_6_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',2,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision >= 900 and ls_cuotas='S' then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_6_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',5,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
							end if
						end if
						if ll_suma_monto4>0 and il_cod_parque<>999 then
							ll_new_lista		= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new_lista)
							dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
							dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
							dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
							dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
							dw_lista.setitem(ll_new_lista,'forma_pago','TC')
							SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
										"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
							INTO 		:ls_nro_cuenta,   
										:ls_descrip_cuenta  
							FROM 		"CUENTA_CONTABLE"  
							WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
									 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
									 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
									 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND
									 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
							USING		trans_1;
							if trans_1.sqlcode=0 then
								dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
								if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
								dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
							ll_new_resumen		= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new_resumen)
							dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
							dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
							SELECT	"COMISION_TRANSBANK"."COMISION"  
							INTO 		:ld_factor  
							FROM 		"COMISION_TRANSBANK"  
							WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
										"COMISION_TRANSBANK"."CODIGO" = 'CC'
							USING		trans_1;
							if not isnull(ld_factor) and ld_factor<>0 then
								ll_comision	= long(ll_suma_monto4 * ld_factor)
								ll_valor		= ll_suma_monto4 - ll_comision
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
											"CUENTA_CONTABLE"."CENTRO_COSTO"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta ,
											:ls_centro_costo
								FROM		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									ll_new_lista		= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new_lista)
									dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
									dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
									dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
									dw_lista.setitem(ll_new_lista,'forma_pago','TC')
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
										SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
										INTO 		:ll_nro_cuota  
										FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
										WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
										USING		trans_1;
										if ll_nro_cuota>0 then
											ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
										end if
									end if
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
									ll_new_resumen		= dw_lista_resumen.insertrow(0)
									dw_lista_resumen.scrolltorow(ll_new_resumen)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
									dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
									dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							else
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
						end if
						if dw_suma.rowcount()>0 then
							ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 1
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) and
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 102
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) and
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 101
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) and
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 103
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) and
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							
						end if
					end if
				end if
			end if
			setnull(ll_tipo_comision)
		LOOP
	end if
	close c_comi_adm2;
END IF
end subroutine

public subroutine wf_procesar_tarjeta_credito_dia_adm ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_count_reg,&
			ll_fila,ll_cod_parque
String	ls_banco,ls_cuotas
ls_caja										= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// Administradora Tarjeta credito al dia
	DECLARE	c_comi_adm CURSOR FOR  
	SELECT	"COMISION_TRANSBANK"."CODIGO",   
				"COMISION_TRANSBANK"."COMISION",   
				"COMISION_TRANSBANK"."TIPO_COMISION",   
				"TIPO_COMISION_TARJETA_CREDITO"."VIGENTE",
				"TIPO_TARJETA"."CUOTAS"  
	FROM 		"COMISION_TRANSBANK",   
				"TIPO_COMISION_TARJETA_CREDITO",
				"TIPO_TARJETA"
	WHERE  ( comision_transbank.tipo_comision = tipo_comision_tarjeta_credito.codigo (+)) and  
			 ( comision_transbank.tipo_comision = tipo_tarjeta.codigo (+)) and
			 (("COMISION_TRANSBANK"."CODIGO" = 'CC' ))   
	ORDER BY "COMISION_TRANSBANK"."TIPO_COMISION" ASC  
	USING		sqlca;
	open c_comi_adm;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0 
			fetch c_comi_adm into :ls_codigo_cred, :ld_factor, :ll_tipo_comision, :ls_vigente, :ls_cuotas;
			dw_suma.reset()
			if not isnull(ld_factor) then //ld_factor<>0 and 
				if not isnull(ll_tipo_comision) then
					if isnull(ls_vigente) or ls_vigente='S' or ls_cuotas='S' or ls_cuotas='N' then // tarjeta credito tiendas (Presto, etc.) al dia
						ll_suma_monto4 	= 0
						if ll_tipo_comision=2 then
							dw_suma.dataobject	= 'dw_buscar_sumas_ontos_tc_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',2)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision >= 900 and ls_cuotas='S' then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_1_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',5,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision >= 900 and ls_cuotas='N' then
							ld_factor	= 0
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_2_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',4,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision=1 then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_3_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',1)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision=3 then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_4_ad'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',3,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						end if
						if dw_suma.rowcount()>0 then
							if ll_suma_monto4>0 and il_cod_parque<>999 then
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4			= dw_suma.getitemnumber(1,'suma_tot_prado')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 1
								ll_new_lista			= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 102
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 101
								ll_new_lista			= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 103
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
						end if
					end if
				end if
			else
				if ll_tipo_comision >= 900 and ls_cuotas='N' then
					dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_5_ad'
					dw_suma.settransobject(sqlca)
					ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',4,ll_tipo_comision)
					if ll_count_reg>0 then
						for ll_fila=1 to ll_count_reg
							ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
							ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
							ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
							ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
							dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
						next
						dw_suma.accepttext()
						if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
						if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
						if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
						if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
						if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
						if ll_suma_monto4>0 and il_cod_parque<>999 then
							ll_new_lista		= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new_lista)
							dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
							dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
							dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
							dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
							dw_lista.setitem(ll_new_lista,'forma_pago','TC')
							SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
										"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
							INTO 		:ls_nro_cuenta,   
										:ls_descrip_cuenta  
							FROM 		"CUENTA_CONTABLE"  
							WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
									 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
									 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
									 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
									 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
							USING		trans_1;
							if trans_1.sqlcode=0 then
								dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
								if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
								dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
							ll_new_resumen		= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new_resumen)
							dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
							dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
							SELECT	"COMISION_TRANSBANK"."COMISION"  
							INTO 		:ld_factor  
							FROM 		"COMISION_TRANSBANK"  
							WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
										"COMISION_TRANSBANK"."CODIGO" = 'CC'
							USING		trans_1;
							if not isnull(ld_factor) and ld_factor<>0 then
								ll_comision	= long(ll_suma_monto4 * ld_factor)
								ll_valor		= ll_suma_monto4 - ll_comision
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
											"CUENTA_CONTABLE"."CENTRO_COSTO"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta ,
											:ls_centro_costo
								FROM		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									ll_new_lista		= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new_lista)
									dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
									dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
									dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
									dw_lista.setitem(ll_new_lista,'forma_pago','TC')
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if ll_tipo_comision=2 or ll_tipo_comision=5 then
										SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
										INTO 		:ll_nro_cuota  
										FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
										WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
										USING		trans_1;
										if ll_nro_cuota>0 then
											ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
										end if
									end if
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
									ll_new_resumen		= dw_lista_resumen.insertrow(0)
									dw_lista_resumen.scrolltorow(ll_new_resumen)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
									dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
									dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							else
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
						end if
						if dw_suma.rowcount()>0 then
							ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 1
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 102
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque	= 101
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 103
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
						end if
					end if
				end if
			end if
			setnull(ll_tipo_comision)
		LOOP
	end if
	close c_comi_adm;
END IF
end subroutine

public subroutine wf_procesar_tarjeta_credito_dia_inm ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez

ls_caja							= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// Inmobiliaria Tarjeta credito al dia
	DECLARE	c_comi_inm CURSOR FOR  
	SELECT	"COMISION_TRANSBANK"."CODIGO",   
				"COMISION_TRANSBANK"."COMISION",   
				"COMISION_TRANSBANK"."TIPO_COMISION",   
				"TIPO_COMISION_TARJETA_CREDITO"."VIGENTE",
				"TIPO_TARJETA"."CUOTAS"  
	FROM 	"COMISION_TRANSBANK",   
				"TIPO_COMISION_TARJETA_CREDITO",
				"TIPO_TARJETA"
	WHERE  ( comision_transbank.tipo_comision = tipo_comision_tarjeta_credito.codigo (+)) and  
			 ( comision_transbank.tipo_comision = tipo_tarjeta.codigo (+)) and
			 (("COMISION_TRANSBANK"."CODIGO" = 'CC' ))   
	ORDER BY "COMISION_TRANSBANK"."TIPO_COMISION" ASC  
	USING		sqlca;
	open c_comi_inm;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0 
			fetch c_comi_inm into :ls_codigo_cred, :ld_factor, :ll_tipo_comision, :ls_vigente, :ls_cuotas;
			dw_suma.reset()
			if not isnull(ld_factor) then //ld_factor<>0 and 
				if not isnull(ll_tipo_comision) then
					if isnull(ls_vigente) or ls_vigente='S' or ls_cuotas='S' or ls_cuotas='N' then // tarjeta credito tiendas (Presto, etc.) al dia
						ll_suma_monto4 	= 0
						if ll_tipo_comision=2 then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',2)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision >= 900 and ls_cuotas='S' then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_1'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',5,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision >= 900 and ls_cuotas='N' then
							ld_factor	= 0
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_2'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',4,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision=1 then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_3'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',1)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision=3 then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_4'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',3,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						end if
						if ll_suma_monto4>0 and il_cod_parque<>999 then
							ll_new_lista		= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new_lista)
							dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
							dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
							dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
							dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
							dw_lista.setitem(ll_new_lista,'forma_pago','TC')
							SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
										"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
							INTO 		:ls_nro_cuenta,   
										:ls_descrip_cuenta  
							FROM 		"CUENTA_CONTABLE"  
							WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
									 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
									 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
									 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
									 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
							USING		trans_1;
							if trans_1.sqlcode=0 then
								dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
								if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
								dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
							ll_new_resumen		= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new_resumen)
							dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
							dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
							SELECT	"COMISION_TRANSBANK"."COMISION"  
							INTO 		:ld_factor  
							FROM 		"COMISION_TRANSBANK"  
							WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
										"COMISION_TRANSBANK"."CODIGO" = 'CC'
							USING		trans_1;
							if not isnull(ld_factor) and ld_factor<>0 then
								ll_comision	= long(ll_suma_monto4 * ld_factor)
								ll_valor		= ll_suma_monto4 - ll_comision
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
											"CUENTA_CONTABLE"."CENTRO_COSTO"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta ,
											:ls_centro_costo
								FROM		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									ll_new_lista		= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new_lista)
									dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
									dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
									dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
									dw_lista.setitem(ll_new_lista,'forma_pago','TC')
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if ll_tipo_comision=2 or ll_tipo_comision=5 then
										SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
										INTO 		:ll_nro_cuota  
										FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
										WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
										USING		trans_1;
										if ll_nro_cuota>0 then
											ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
										end if
									end if
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
									ll_new_resumen		= dw_lista_resumen.insertrow(0)
									dw_lista_resumen.scrolltorow(ll_new_resumen)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
									dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
									dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							else
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
						end if
						if dw_suma.rowcount()>0 then
							ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 1
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 102
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 101
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 103
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
						end if
					end if
				end if
			else
				if ll_tipo_comision >= 900 and ls_cuotas='N' then
					dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_5'
					dw_suma.settransobject(sqlca)
					ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',4,ll_tipo_comision)//4
					if ll_count_reg>0 then
						for ll_fila=1 to ll_count_reg
							ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
							ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
							ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
							ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
							dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
						next
						dw_suma.accepttext()
						if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
						if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
						if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
						if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
						if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
						if ll_suma_monto4>0 and il_cod_parque<>999 then
							ll_new_lista		= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new_lista)
							dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
							dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
							dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
							dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
							dw_lista.setitem(ll_new_lista,'forma_pago','TC')
							SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
										"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
							INTO 		:ls_nro_cuenta,   
										:ls_descrip_cuenta  
							FROM 		"CUENTA_CONTABLE"  
							WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
									 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
									 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
									 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
									 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
							USING		trans_1;
							if trans_1.sqlcode=0 then
								dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
								if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
								dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
							ll_new_resumen		= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new_resumen)
							dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
							dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
							SELECT	"COMISION_TRANSBANK"."COMISION"  
							INTO 		:ld_factor  
							FROM 		"COMISION_TRANSBANK"  
							WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
										"COMISION_TRANSBANK"."CODIGO" = 'CC'
							USING		trans_1;
							if not isnull(ld_factor) and ld_factor<>0 then
								ll_comision	= long(ll_suma_monto4 * ld_factor)
								ll_valor		= ll_suma_monto4 - ll_comision
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
											"CUENTA_CONTABLE"."CENTRO_COSTO"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta ,
											:ls_centro_costo
								FROM		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									ll_new_lista		= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new_lista)
									dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
									dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
									dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
									dw_lista.setitem(ll_new_lista,'forma_pago','TC')
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if ll_tipo_comision=2 or ll_tipo_comision=5 then
										SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
										INTO 		:ll_nro_cuota  
										FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
										WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
										USING		trans_1;
										if ll_nro_cuota>0 then
											ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
										end if
									end if
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
									ll_new_resumen		= dw_lista_resumen.insertrow(0)
									dw_lista_resumen.scrolltorow(ll_new_resumen)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
									dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
									dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							else
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
								dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
								dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
								dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
							end if
						end if
						if dw_suma.rowcount()>0 then
							ll_suma_monto4			= dw_suma.getitemnumber(1,'suma_tot_prado')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 1
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4			= dw_suma.getitemnumber(1,'suma_tot_manantial')						
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 102
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4			= dw_suma.getitemnumber(1,'suma_tot_concepcion')						
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 101
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4			= dw_suma.getitemnumber(1,'suma_tot_santiago')						
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 103
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision=2 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
						end if
					end if
				end if
			end if
			setnull(ll_tipo_comision)
		LOOP
	end if
	close c_comi_inm;
END IF
end subroutine

public subroutine wf_procesar_tarjeta_debito_adm ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_count_reg,&
			ll_fila,ll_cod_parque
String	ls_banco,ls_cuotas
ls_caja										= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	//Administradora Tarjeta Debito
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_td_ad'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TD')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto1>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
			SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
			SELECT	"COMISION_TRANSBANK"."COMISION"  
			INTO 		:ld_factor  
			FROM 		"COMISION_TRANSBANK"  
			WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
			USING		sqlca;
			if not isnull(ld_factor) and ld_factor<>0 then
				ll_comision	= long(ll_suma_monto1 * ld_factor)
				ll_valor		= ll_suma_monto1 - ll_comision
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta ,
							:ls_centro_costo
				FROM		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_new_lista		= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'forma_pago','TD')
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
					dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			else
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto1		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto1 * ld_factor)
					ll_valor		= ll_suma_monto1 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta ,
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto1 * ld_factor)
					ll_valor		= ll_suma_monto1 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta ,
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto1 * ld_factor)
					ll_valor		= ll_suma_monto1 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta ,
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto1	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto1>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto1 * ld_factor)
					ll_valor		= ll_suma_monto1 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta ,
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','A')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','A')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto1)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
		end if
	end if
END IF
end subroutine

public subroutine wf_procesar_tarjeta_debito_inm ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez
ls_caja							= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// inmobiliaria Tarjeta Debito
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_td'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TD')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto3		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto3>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			SELECT	"COMISION_TRANSBANK"."COMISION"  
			INTO 		:ld_factor  
			FROM 		"COMISION_TRANSBANK"  
			WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
			USING		sqlca;
			if not isnull(ld_factor) and ld_factor<>0 then
				ll_comision	= long(ll_suma_monto3 * ld_factor)
				ll_valor		= ll_suma_monto3 - ll_comision
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )   AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_new_lista		= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
					dw_lista.setitem(ll_new_lista,'forma_pago','TD')
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
					dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			else
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
		end if 
		if dw_suma.rowcount()>0 then
			ll_suma_monto3		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto3>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto3 * ld_factor)
					ll_valor		= ll_suma_monto3 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta,  
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )   AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if 
			ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto3>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto3 * ld_factor)
					ll_valor		= ll_suma_monto3 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta,  
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )   AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto3>0 and il_cod_parque=999 then
				ll_cod_parque	= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto3 * ld_factor)
					ll_valor		= ll_suma_monto3 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta,  
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )   AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
			ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto3>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TD' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				SELECT	"COMISION_TRANSBANK"."COMISION"  
				INTO 		:ld_factor  
				FROM 		"COMISION_TRANSBANK"  
				WHERE 	"COMISION_TRANSBANK"."CODIGO" = 'CD'
				USING		sqlca;
				if not isnull(ld_factor) and ld_factor<>0 then
					ll_comision	= long(ll_suma_monto3 * ld_factor)
					ll_valor		= ll_suma_monto3 - ll_comision
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
								"CUENTA_CONTABLE"."CENTRO_COSTO"
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta,  
								:ls_centro_costo
					FROM		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CD' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )   AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new_lista		= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new_lista)
						dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
						dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
						dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
						dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
						dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
						dw_lista.setitem(ll_new_lista,'forma_pago','TD')
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
						ll_new_resumen		= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new_resumen)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
						dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
						dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
						dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
						dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
						dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
						dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
				else
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TD')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
		end if
	end if
END IF
end subroutine

public subroutine wf_cheques_inmobiliaria ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez
ls_caja						= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// Inmobiliaria cheques al dia mismo banco TIPO_COB=TIPO_COB_AUX
	if gs_empresa='El Prado' or gs_empresa='Concepcion' then
		ll_banco	= 1
		ls_banco	= '1'
	elseif gs_empresa='La Foresta' then
		ll_banco	= 1
		ls_banco	= '1'
	elseif gs_empresa='Santiago' then
		ll_banco	= 16
		ls_banco	= '16'
	end if
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 		= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
		end if
	end if
	// Inmobiliaria cheques al dia otro banco TIPO_COB=TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_2'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_Parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
		end if
	end if
	// Inmobiliaria cheques a fecha TIPO_COB=TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_3'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 		= dw_suma.getitemnumber(1,'suma_tot_foresta')	
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')	
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
		end if
	end if
	// Inmobiliaria cheques al dia mismo banco TIPO_COB<>TIPO_COB_AUX
	dw_suma.dataobject	= 'dw_buscar_sumas_montos_ch_4'
	dw_suma.settransobject(sqlca)
	ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'CH',ll_banco)
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_foresta')		
		if il_cod_parque=103 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto4 	= dw_suma.getitemnumber(1,'suma_tot_concepcion')		
		if ll_suma_monto4>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','CH')
			SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
						"CUENTA_CONTABLE"."CENTRO_COSTO"
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta,  
						:ls_centro_costo
			FROM 		"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
			USING		sqlca;
			dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 1
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 102
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 101
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
			ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
			if ll_suma_monto4>0 and il_cod_parque=999 then
				ll_cod_parque		= 103
				ll_new_lista		= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','CH')
				SELECT 	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
							"CUENTA_CONTABLE"."CENTRO_COSTO"
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta,  
							:ls_centro_costo
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."ESTATUS" = :ls_banco ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'A' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','CH')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
			end if
		end if
	end if
END IF
end subroutine

public subroutine wf_procesar_inmobiliaria ();Long		ll_new_resumen,ll_new_lista,ll_nro_cuota,ll_banco,ll_fila,ll_count_reg,&
			ll_cod_parque,ll_suma_monto3_m,ll_suma_monto3_s,ll_suma_monto3_c
String		ls_banco,ls_cuotas,ls_base_rez,ls_serie_rez
Double	ll_numero_rez
ls_caja							= trim(ddlb_caja.text)
if not isnull(ls_caja) and ls_caja<>'' then
	// inmobiliaria efectivo
	dw_suma.dataobject		= 'dw_buscar_sumas_montos_ef'
	dw_suma.settransobject(sqlca)
	ll_count_reg					= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'EF')
	if ll_count_reg>0 then
		for ll_fila=1 to ll_count_reg
			ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
			ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
			ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
			ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
			dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
		next
		dw_suma.accepttext()
		ll_suma_monto3	= 0
		if il_cod_parque=1 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_prado')
		if il_cod_parque=102 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_manantial')
		if il_cod_parque=11 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_foresta')
		if il_cod_parque=103 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_santiago')
		if il_cod_parque=101 then ll_suma_monto3	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
		if ll_suma_monto3>0 and il_cod_parque<>999 then
			ll_new_lista		= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new_lista)
			dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
			dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
			dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new_lista,'forma_pago','EF')
			SELECT DISTINCT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
						"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
			INTO 		:ls_nro_cuenta,   
						:ls_descrip_cuenta  
			FROM 	"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
					 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
					 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
					 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
				if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
				dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
			end if
			ll_new_resumen		= dw_lista_resumen.insertrow(0)
			dw_lista_resumen.scrolltorow(ll_new_resumen)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
			dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
			dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
			dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
			dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
			dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
		end if
		if dw_suma.rowcount()>0 then
			ll_suma_monto3		= dw_suma.getitemnumber(1,'suma_tot_prado')
			ll_suma_monto3_m	= dw_suma.getitemnumber(1,'suma_tot_manantial')
			ll_suma_monto3_s		= dw_suma.getitemnumber(1,'suma_tot_santiago')
			ll_suma_monto3_c		= dw_suma.getitemnumber(1,'suma_tot_concepcion')
			if isnull(ll_suma_monto3) then ll_suma_monto3 = 0
			if isnull(ll_suma_monto3_m) then ll_suma_monto3_m = 0
			if isnull(ll_suma_monto3_s) then ll_suma_monto3_s = 0
			if isnull(ll_suma_monto3_c) then ll_suma_monto3_c = 0
			if cbx_sumar.checked=true and (ll_suma_monto3 > 0 or ll_suma_monto3_m > 0 or ll_suma_monto3_s > 0 or ll_suma_monto3_c > 0)  and il_cod_parque=999 then
				ll_suma_monto3	= ll_suma_monto3 + ll_suma_monto3_m + ll_suma_monto3_s + ll_suma_monto3_c
				ll_cod_parque		= 1
				ll_new_lista			= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new_lista)
				dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
				dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
				dw_lista.setitem(ll_new_lista,'forma_pago','EF')
				SELECT DISTINCT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
				INTO 		:ls_nro_cuenta,   
							:ls_descrip_cuenta  
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
						 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
				ll_new_resumen		= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new_resumen)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
				dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
				dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
				dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
				dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
				dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
//				dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
//				dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
			else
				if ll_suma_monto3 > 0 and il_cod_parque = 999 then
					ll_cod_parque		= 1
					ll_new_lista			= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3)
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT DISTINCT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			
				if ll_suma_monto3_m > 0 and il_cod_parque=999 then
					ll_cod_parque		= 102
					ll_new_lista			= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3_m)
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT DISTINCT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3_m)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			
				if ll_suma_monto3_s > 0 and il_cod_parque=999 then
					ll_cod_parque		= 103
					ll_new_lista			= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3_s)
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT DISTINCT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3_s)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			
				if ll_suma_monto3_c > 0 and il_cod_parque=999 then
					ll_cod_parque		= 101
					ll_new_lista			= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new_lista)
					dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
					dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto3_c)
					dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new_lista,'forma_pago','EF')
					SELECT DISTINCT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
					INTO 		:ls_nro_cuenta,   
								:ls_descrip_cuenta  
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'EF' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'D' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
						if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
						dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
					end if
					ll_new_resumen		= dw_lista_resumen.insertrow(0)
					dw_lista_resumen.scrolltorow(ll_new_resumen)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
					dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
					dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto3_c)
					dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
					dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','EF')
					dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
				end if
			end if
		end if
	end if
	// Inmobiliaria Cheques
	wf_cheques_inmobiliaria()
	wf_cheques_inmobiliaria1()
	// inmobiliaria Tarjeta Debito
	wf_procesar_tarjeta_debito_inm()

	// Inmobiliaria Tarjeta credito al dia
	wf_procesar_tarjeta_credito_dia_inm()
	
	// Inmobiliaria Tarjeta de Credito a fecha
	DECLARE	c_comi_inm2 CURSOR FOR  
	SELECT	"COMISION_TRANSBANK"."CODIGO",   
				"COMISION_TRANSBANK"."COMISION",   
				"COMISION_TRANSBANK"."TIPO_COMISION",   
				"TIPO_COMISION_TARJETA_CREDITO"."VIGENTE",
				"TIPO_TARJETA"."CUOTAS"  
	FROM 		"COMISION_TRANSBANK",   
				"TIPO_COMISION_TARJETA_CREDITO",
				"TIPO_TARJETA"
	WHERE  ( comision_transbank.tipo_comision = tipo_comision_tarjeta_credito.codigo (+)) and  
			 ( comision_transbank.tipo_comision = tipo_tarjeta.codigo (+)) and
			 (("COMISION_TRANSBANK"."CODIGO" = 'CC' ))   
	ORDER BY "COMISION_TRANSBANK"."TIPO_COMISION" ASC  
	USING		sqlca;
	open c_comi_inm2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0 
			fetch c_comi_inm2 into :ls_codigo_cred, :ld_factor, :ll_tipo_comision, :ls_vigente, :ls_cuotas;
			dw_suma.reset()
			if not isnull(ld_factor) then //ld_factor<>0 and 
				if not isnull(ll_tipo_comision) then
					if isnull(ls_vigente) or ls_vigente='S' or ls_cuotas='S' or ls_cuotas='N' then // tarjeta credito tiendas (Presto, etc.) a fecha
						ll_suma_monto4 	= 0
						if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
//						if ll_tipo_comision=2 then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_6'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',2,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						elseif ll_tipo_comision >= 900 and ls_cuotas='S' then
							dw_suma.dataobject	= 'dw_buscar_sumas_montos_tc_6'
							dw_suma.settransobject(sqlca)
							ll_count_reg	= dw_suma.retrieve(ldt_fecha_ini,ls_caja,'TC',5,ll_tipo_comision)
							if ll_count_reg>0 then
								for ll_fila=1 to ll_count_reg
									ls_base				= dw_suma.getitemstring(ll_fila,'ingreso_base')
									ls_serie				= dw_suma.getitemstring(ll_fila,'ingreso_serie')
									ll_numero			= dw_suma.getitemnumber(ll_fila,'ingreso_contrato')
									ll_cod_parque		= wf_buscar_parque(ls_base,ls_serie,ll_numero,ll_fila)
									dw_suma.setitem(ll_fila,'cod_parque',ll_cod_parque)
								next
								dw_suma.accepttext()
								if il_cod_parque=1 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_prado')
								if il_cod_parque=102 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
								if il_cod_parque=11 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_foresta')
								if il_cod_parque=103 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
								if il_cod_parque=101 then ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							end if
						end if
						if dw_suma.rowcount()>0 then
							if ll_suma_monto4>0 and il_cod_parque<>999 then
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :il_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',il_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
	//									if ll_tipo_comision=2 or ll_tipo_comision=4 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',il_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4		= dw_suma.getitemnumber(1,'suma_tot_prado')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 1
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
	//									if ll_tipo_comision=2 or ll_tipo_comision=4 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_manantial')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 102
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
	//									if ll_tipo_comision=2 or ll_tipo_comision=4 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_concepcion')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 101
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
	//									if ll_tipo_comision=2 or ll_tipo_comision=4 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
							ll_suma_monto4	= dw_suma.getitemnumber(1,'suma_tot_santiago')
							if ll_suma_monto4>0 and il_cod_parque=999 then
								ll_cod_parque		= 103
								ll_new_lista		= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new_lista)
								dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
								dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
								dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
								dw_lista.setitem(ll_new_lista,'forma_pago','TC')
								SELECT DISTINCT "CUENTA_CONTABLE"."CTA_CONTABLE",   
											"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  
								INTO 		:ls_nro_cuenta,   
											:ls_descrip_cuenta  
								FROM 		"CUENTA_CONTABLE"  
								WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'TC' ) AND  
										 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
										 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' )  and 
										 ( "CUENTA_CONTABLE"."REZAGO" = 'N' )  and 
										 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision ) AND 
										 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
								USING		trans_1;
								if trans_1.sqlcode=0 then
									dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
									if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
									dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
								ll_new_resumen		= dw_lista_resumen.insertrow(0)
								dw_lista_resumen.scrolltorow(ll_new_resumen)
								dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
								dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
								SELECT	"COMISION_TRANSBANK"."COMISION"  
								INTO 		:ld_factor  
								FROM 		"COMISION_TRANSBANK"  
								WHERE 	"COMISION_TRANSBANK"."TIPO_COMISION" = :ll_tipo_comision AND
											"COMISION_TRANSBANK"."CODIGO" = 'CC'
								USING		trans_1;
								if not isnull(ld_factor) and ld_factor<>0 then
									ll_comision	= long(ll_suma_monto4 * ld_factor)
									ll_valor		= ll_suma_monto4 - ll_comision
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_valor)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",   
												"CUENTA_CONTABLE"."DESCRIPCION_CUENTA"  ,
												"CUENTA_CONTABLE"."CENTRO_COSTO"  
									INTO 		:ls_nro_cuenta,   
												:ls_descrip_cuenta ,
												:ls_centro_costo
									FROM		"CUENTA_CONTABLE"  
									WHERE  ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CC' ) AND  
											 ( "CUENTA_CONTABLE"."BASE" = 'F' ) AND  
											 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = 'I' ) AND  
											 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
											 ( "CUENTA_CONTABLE"."TIPO_COMISION" = :ll_tipo_comision )   AND 
											 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
									USING		trans_1;
									if trans_1.sqlcode=0 then
										ll_new_lista		= dw_lista.insertrow(0)
										dw_lista.scrolltorow(ll_new_lista)
										dw_lista.setitem(ll_new_lista,'cod_parque',ll_cod_parque)
										dw_lista.setitem(ll_new_lista,'tipo_empresa','I')
										dw_lista.setitem(ll_new_lista,'monto_debe',ll_comision)
										dw_lista.setitem(ll_new_lista,'centro_costo',ls_centro_costo)
										dw_lista.setitem(ll_new_lista,'cod_caja',ls_caja)
										dw_lista.setitem(ll_new_lista,'forma_pago','TC')
										dw_lista.setitem(ll_new_lista,'nro_cuenta_contab',ls_nro_cuenta)
										if ll_tipo_comision>=1 and ll_tipo_comision<=5 then
	//									if ll_tipo_comision=2 or ll_tipo_comision=4 or ll_tipo_comision=5 then
											SELECT	"TIPO_COMISION_TARJETA_CREDITO"."CUOTA_FINAL"  
											INTO 		:ll_nro_cuota  
											FROM 		"TIPO_COMISION_TARJETA_CREDITO"  
											WHERE 	"TIPO_COMISION_TARJETA_CREDITO"."CODIGO" = :ll_tipo_comision   
											USING		trans_1;
											if ll_nro_cuota>0 then
												ls_descrip_cuenta	= ls_descrip_cuenta+'D'+string(ll_nro_cuota)+' CTA.'
											end if
										end if
										if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
										dw_lista.setitem(ll_new_lista,'descrip_cuenta_contab',ls_descrip_cuenta)
										ll_new_resumen		= dw_lista_resumen.insertrow(0)
										dw_lista_resumen.scrolltorow(ll_new_resumen)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_parque',ll_cod_parque)
										dw_lista_resumen.setitem(ll_new_resumen,'tipo_empresa','I')
										dw_lista_resumen.setitem(ll_new_resumen,'centro_costo',ls_centro_costo)
										dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_comision)
										dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
										dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
										dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
										dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
									end if
								else
									dw_lista.setitem(ll_new_lista,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'monto_debe',ll_suma_monto4)
									dw_lista_resumen.setitem(ll_new_resumen,'cod_caja',ls_caja)
									dw_lista_resumen.setitem(ll_new_resumen,'forma_pago','TC')
									dw_lista_resumen.setitem(ll_new_resumen,'nro_cuenta_contab',ls_nro_cuenta)
									dw_lista_resumen.setitem(ll_new_resumen,'descrip_cuenta_contab',ls_descrip_cuenta)
								end if
							end if
						end if
					end if
				end if
			end if
			setnull(ll_tipo_comision)
		LOOP
	end if
	close c_comi_inm2;
END IF
end subroutine

public subroutine wf_cargar_dw (long al_indi);Long		ll_rut,ll_cod_parque,ll_monto_desc
String		ls_cod_otro_pago,ls_base_rez,ls_serie_rez,ls_monto_lado
Double	ll_numero_rez

ls_base									= dw_detalle.getitemstring(al_indi,'ingreso_base')
ls_serie									= dw_detalle.getitemstring(al_indi,'ingreso_serie')
ll_numero								= dw_detalle.getitemnumber(al_indi,'ingreso_contrato')
ll_rut										= dw_detalle.getitemnumber(al_indi,'ingreso_rut')
ls_caja									= dw_detalle.getitemstring(al_indi,'ingreso_cod_caja')
ll_folio									= dw_detalle.getitemnumber(al_indi,'ingreso_folio')
ls_tipo_cob								= dw_detalle.getitemstring(al_indi,'ingreso_tipo_cob')
ls_cod_otro_pago						= dw_detalle.getitemstring(al_indi,'ingreso_codigo_otro')
if ls_caja = ls_caja_ok then
	if ll_numero=0 then//and (il_cod_parque=1 or il_cod_parque=102) then ll_cod_parque=1
		SELECT	"CLIENTE_REZAGO"."BASE",   
					"CLIENTE_REZAGO"."SERIE",   
					"CLIENTE_REZAGO"."NUMERO"  
		INTO 		:ls_base_rez,   
					:ls_serie_rez,  
					:ll_numero_rez  
		FROM 		"CLIENTE_REZAGO"  
		WHERE  ( "CLIENTE_REZAGO"."RUT" = :ll_rut ) AND  
				 ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob ) AND   
				 ( "CLIENTE_REZAGO"."FOLIO" = :ll_folio )
		USing		sqlca;
		if sqlca.sqlcode=0 then
			SELECT	"CD_FOLIO"."COD_PARQUE"  
			INTO 		:ll_cod_parque  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :ls_base_rez ) AND  
					 ( "CD_FOLIO"."NUMERO" = :ll_numero_rez )   
			USING		sqlca;
			//					 ( "CD_FOLIO"."SERIE" = :ls_serie_rez ) AND  
			if sqlca.sqlcode<>0 then
				SELECT	"CADENA"."COD_PARQUE"  
				INTO 		:ll_cod_parque  
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :ls_base_rez ) AND  
						 ( "CADENA"."SERIE" = :ls_serie_rez ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero_rez )   
				USING		sqlca;
			end if
		end if
	else
		SELECT	"CADENA"."COD_PARQUE"  
		INTO 		:ll_cod_parque  
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
				 ( "CADENA"."SERIE" = :ls_serie ) AND  
				 ( "CADENA"."NUMERO" = :ll_numero )   
		USING		sqlca;
	end if 
//	if il_cod_parque=999 then il_cod_parque=ll_cod_parque
	if (ll_cod_parque=1 and il_cod_parque=1) or (ll_cod_parque=102 and il_cod_parque=102) or &
		(ll_numero=0 and il_cod_parque=1) or (ll_cod_parque=11 and il_cod_parque=11) or &
		(ll_numero=0 and il_cod_parque=11) or (ll_cod_parque=103 and il_cod_parque=103) or &
		(ll_numero=0 and il_cod_parque=103) or (ll_cod_parque=101 and il_cod_parque=101) or il_cod_parque=999 then
		ls_tipo_mov								= dw_detalle.getitemstring(al_indi,'ingreso_tipo_mov')
		ls_tipo_cob								= dw_detalle.getitemstring(al_indi,'ingreso_tipo_cob')
		ll_monto									= dw_detalle.getitemnumber(al_indi,'ingreso_monto')
		ls_rezago								= dw_detalle.getitemstring(al_indi,'ingreso_rezago')
		ls_caja									= dw_detalle.getitemstring(al_indi,'ingreso_cod_caja')
		ll_folio									= dw_detalle.getitemnumber(al_indi,'ingreso_folio')
		ls_cod_otro								= dw_detalle.getitemstring(al_indi,'ingreso_codigo_otro')
//		if ll_folio = 65365 then
//			messagebox("1","1")
//		end if
		if ls_caja='XY' then
			ld_fecha_pago_ing					= date(dw_detalle.getitemdatetime(al_indi,'ingreso_servipag'))
		else
			ld_fecha_pago_ing					= date(dw_detalle.getitemdatetime(al_indi,'ingreso_fecha_pago'))
		end if
		ld_fecha_venc							= date(dw_detalle.getitemdatetime(al_indi,'ingreso_fecha_venc'))
		lld_valor_uf							= dw_detalle.getitemnumber(al_indi,'ingreso_valor_uf')
		if ls_rezago='' or isnull(ls_rezago) or ls_rezago=' ' or len(ls_rezago)=0 then ls_rezago='N'
		if ls_rezago<>'S' then
			SELECT DISTINCT "DOCUMENTOS"."TIPO_COB",   
						"DOCUMENTOS"."TIPO_COB_AUX"  
			INTO 		:ls_tipo_cob_o,   
						:ls_tipo_cob_d  
			FROM 		"CADENA",   
						"DOCUMENTOS",   
						"INGRESO"  
			WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
					 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
					 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					 ( "CADENA"."CODIGO" = "INGRESO"."BASE" ) and  
					 ( "CADENA"."SERIE" = "INGRESO"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "INGRESO"."CONTRATO" ) and  
					 ( "CADENA"."COD_PARQUE" = :ll_cod_parque ) and  
					 ( "CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) AND  
					 ( "DOCUMENTOS"."FOLIO" = :ll_folio ) AND  
					 ( "DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob ) AND  
					 ( "DOCUMENTOS"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
					 ( "DOCUMENTOS"."COD_CAJA" = :ls_caja )   
			Using		sqlca;
		else
			SELECT DISTINCT "DOCUMENTOS"."TIPO_COB",   
						"DOCUMENTOS"."TIPO_COB_AUX"  
			INTO 		:ls_tipo_cob_o,   
						:ls_tipo_cob_d  
			FROM 		"DOCUMENTOS",   
						"INGRESO"  
			WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
					 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
					 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
					 ( "INGRESO"."CONTRATO" = 0 ) and  
					 ( "DOCUMENTOS"."FOLIO" = :ll_folio ) AND  
					 ( "DOCUMENTOS"."TIPO_COB" = :ls_tipo_cob ) AND  
					 ( "DOCUMENTOS"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
					 ( "DOCUMENTOS"."COD_CAJA" = :ls_caja )   
			Using		sqlca;
		end if
		if (ls_tipo_empresa='A' and ls_tipo_cob_o='BL') or (ls_tipo_empresa='A' and ls_tipo_cob_o='B0') or ((ls_tipo_empresa='I' and ls_tipo_cob_o='CI') or (ls_tipo_empresa='I' and ls_tipo_cob_o='C0') or (ls_tipo_empresa='I' and ls_tipo_cob_o='BE') or (ls_tipo_empresa='I' and ls_tipo_cob_o='CU') or (ls_tipo_empresa='I' and ls_tipo_cob_o='CC')or &
			(ls_tipo_empresa='I' and ls_tipo_cob='CS')) then
			if ls_rezago<>'S' then
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
							"CUENTA_CONTABLE"."CENTRO_COSTO",
							"CUENTA_CONTABLE"."CODIGO_OTROS",
							"CUENTA_CONTABLE"."CODIGO_BANCO",
							"CUENTA_CONTABLE"."TIPO_EMPRESA",
							"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
				INTO 		:ls_nro_cuenta,
							:ls_descrip_cuenta,
							:ls_centro_costo,
							:ls_codigo_otros,
							:ls_codigo_banco,
							:ls_tipo_empresa,
							:ls_codigo_financiero
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."BASE" = :ls_base ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = :ls_tipo_mov ) AND
						 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					ls_nro_cuenta					= 'NO TIENE CUENTA'
					ls_descrip_cuenta				= 'NO TIENE CUENTA'
					setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
				end if
			else
				SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
							"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
							"CUENTA_CONTABLE"."CENTRO_COSTO",
							"CUENTA_CONTABLE"."CODIGO_OTROS",
							"CUENTA_CONTABLE"."CODIGO_BANCO",
							"CUENTA_CONTABLE"."TIPO_EMPRESA",
							"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
				INTO 		:ls_nro_cuenta,
							:ls_descrip_cuenta,
							:ls_centro_costo,
							:ls_codigo_otros,
							:ls_codigo_banco,
							:ls_tipo_empresa,
							:ls_codigo_financiero
				FROM 		"CUENTA_CONTABLE"  
				WHERE  ( "CUENTA_CONTABLE"."BASE" = :ls_base ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "CUENTA_CONTABLE"."TIPO_MOV" = :ls_tipo_mov ) AND
						 ( "CUENTA_CONTABLE"."REZAGO" = 'S' ) AND 
						 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					ls_nro_cuenta			= 'NO TIENE CUENTA'
					ls_descrip_cuenta		= 'NO TIENE CUENTA'
					setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
				end if
			end if		
			ls_monto_lado	= 'D'
		else // distinto destino empresa
			if ls_tipo_cob_d = ls_tipo_cob then
				if ls_rezago<>'S' then
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO",
								"CUENTA_CONTABLE"."CODIGO_OTROS",
								"CUENTA_CONTABLE"."CODIGO_BANCO",
								"CUENTA_CONTABLE"."TIPO_EMPRESA",
								"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
					INTO 		:ls_nro_cuenta,
								:ls_descrip_cuenta,
								:ls_centro_costo,
								:ls_codigo_otros,
								:ls_codigo_banco,
								:ls_tipo_empresa,
								:ls_codigo_financiero
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."BASE" = :ls_base ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = :ls_tipo_mov ) AND
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						ls_nro_cuenta					= 'NO TIENE CUENTA'
						ls_descrip_cuenta				= 'NO TIENE CUENTA'
						setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
					end if
				else
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO",
								"CUENTA_CONTABLE"."CODIGO_OTROS",
								"CUENTA_CONTABLE"."CODIGO_BANCO",
								"CUENTA_CONTABLE"."TIPO_EMPRESA",
								"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
					INTO 		:ls_nro_cuenta,
								:ls_descrip_cuenta,
								:ls_centro_costo,
								:ls_codigo_otros,
								:ls_codigo_banco,
								:ls_tipo_empresa,
								:ls_codigo_financiero
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."BASE" = :ls_base ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = :ls_tipo_mov ) AND
							 ( "CUENTA_CONTABLE"."REZAGO" = 'S' ) AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						ls_nro_cuenta			= 'NO TIENE CUENTA'
						ls_descrip_cuenta		= 'NO TIENE CUENTA'
						setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
					end if
				end if		
				ls_monto_lado	= 'D'
			else
				if ls_rezago<>'S' then
					ls_monto_lado			= 'I'
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO",
								"CUENTA_CONTABLE"."CODIGO_OTROS",
								"CUENTA_CONTABLE"."CODIGO_BANCO",
								"CUENTA_CONTABLE"."TIPO_EMPRESA",
								"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
					INTO 		:ls_nro_cuenta,
								:ls_descrip_cuenta,
								:ls_centro_costo,
								:ls_codigo_otros,
								:ls_codigo_banco,
								:ls_tipo_empresa,
								:ls_codigo_financiero
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = :ls_tipo_empresa ) AND
							 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						if ls_tipo_cob='CU' then
							SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
										"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
										"CUENTA_CONTABLE"."CENTRO_COSTO",
										"CUENTA_CONTABLE"."CODIGO_OTROS",
										"CUENTA_CONTABLE"."CODIGO_BANCO",
										"CUENTA_CONTABLE"."TIPO_EMPRESA",
										"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
							INTO 		:ls_nro_cuenta,
										:ls_descrip_cuenta,
										:ls_centro_costo,
										:ls_codigo_otros,
										:ls_codigo_banco,
										:ls_tipo_empresa,
										:ls_codigo_financiero
							FROM 		"CUENTA_CONTABLE"  
							WHERE  ( "CUENTA_CONTABLE"."BASE" = :ls_base ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_COB" = :ls_tipo_cob ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_MOV" = :ls_tipo_mov ) AND
									 ( "CUENTA_CONTABLE"."REZAGO" = 'N' ) AND 
									 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								ls_nro_cuenta			= 'NO TIENE CUENTA'
								ls_descrip_cuenta		= 'NO TIENE CUENTA'
								setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
							else
								ls_monto_lado	= 'D'
							end if
						else
							ls_nro_cuenta			= 'NO TIENE CUENTA'
							ls_descrip_cuenta		= 'NO TIENE CUENTA'
							setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
						end if
					end if
				else
					ls_monto_lado			= 'I'	
					SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
								"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
								"CUENTA_CONTABLE"."CENTRO_COSTO",
								"CUENTA_CONTABLE"."CODIGO_OTROS",
								"CUENTA_CONTABLE"."CODIGO_BANCO",
								"CUENTA_CONTABLE"."TIPO_EMPRESA",
								"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
					INTO 		:ls_nro_cuenta,
								:ls_descrip_cuenta,
								:ls_centro_costo,
								:ls_codigo_otros,
								:ls_codigo_banco,
								:ls_tipo_empresa,
								:ls_codigo_financiero
					FROM 		"CUENTA_CONTABLE"  
					WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' ) AND  
							 ( "CUENTA_CONTABLE"."BASE" = 'A' ) AND  
							 ( "CUENTA_CONTABLE"."ESTATUS" = '0' ) AND  
							 ( "CUENTA_CONTABLE"."TIPO_EMPRESA" = :ls_tipo_empresa ) AND
							 ( "CUENTA_CONTABLE"."REZAGO" = 'S' ) AND 
							 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						if ls_tipo_cob='CU' then
							SELECT	"CUENTA_CONTABLE"."CTA_CONTABLE",
										"CUENTA_CONTABLE"."DESCRIPCION_CUENTA",
										"CUENTA_CONTABLE"."CENTRO_COSTO",
										"CUENTA_CONTABLE"."CODIGO_OTROS",
										"CUENTA_CONTABLE"."CODIGO_BANCO",
										"CUENTA_CONTABLE"."TIPO_EMPRESA",
										"CUENTA_CONTABLE"."CODIGO_FINANCIERO"
							INTO 		:ls_nro_cuenta,
										:ls_descrip_cuenta,
										:ls_centro_costo,
										:ls_codigo_otros,
										:ls_codigo_banco,
										:ls_tipo_empresa,
										:ls_codigo_financiero
							FROM 		"CUENTA_CONTABLE"  
							WHERE  ( "CUENTA_CONTABLE"."BASE" = :ls_base ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_COB" = :ls_tipo_cob ) AND  
									 ( "CUENTA_CONTABLE"."TIPO_MOV" = :ls_tipo_mov ) AND
									 ( "CUENTA_CONTABLE"."REZAGO" = 'S' ) AND 
									 ( "CUENTA_CONTABLE"."COD_PARQUE" = :ll_cod_parque )
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								ls_nro_cuenta			= 'NO TIENE CUENTA'
								ls_descrip_cuenta		= 'NO TIENE CUENTA'
								setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
							else
								ls_monto_lado	= 'D'
							end if
						else
							ls_nro_cuenta			= 'NO TIENE CUENTA'
							ls_descrip_cuenta		= 'NO TIENE CUENTA'
							setnull(ls_centro_costo);setnull(ls_tipo_empresa);setnull(ls_codigo_otros)
						end if
					end if
				end if
			end if
		end if
		if not isnull(ls_nro_cuenta) and ls_nro_cuenta<>'' then
			ll_new							= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,'base',ls_base)
			dw_lista.setitem(ll_new,'serie',ls_serie)
			dw_lista.setitem(ll_new,'numero',ll_numero)
			dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
			dw_lista.setitem(ll_new,'folio',ll_folio)
			dw_lista.setitem(ll_new,'tipo_cob',ls_tipo_cob)
			dw_lista.setitem(ll_new,'tipo_mov',ls_tipo_mov)
			if ls_nro_cuenta='3000300101' then
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
						 ( "INGRESO"."CODIGO_OTRO" = '112' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nro_cuenta			= '3000302001'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'ING.MANT.PROM.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'ING.MANT.PROM.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'ING.MANT.PROM.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'ING.MANT.PROM.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'ING.MANT.PROM.c'
					end if
				end if
			end if
			if ls_nro_cuenta='3000301001' AND (ls_cod_otro_pago='117' or ls_cod_otro_pago='112' or ls_cod_otro_pago='113' or ls_cod_otro_pago='114' or ls_cod_otro_pago='115' or ls_cod_otro_pago='40' or ls_cod_otro_pago='41' or ls_cod_otro_pago='51') then
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'F' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then 
					if (ll_monto + 1) = ll_monto_desc then
						ls_nro_cuenta			= '4101001001'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'DES.MANT.PROM.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'DES.MANT.PROM.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'DES.MANT.PROM.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'DES.MANT.PROM.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'DES.MANT.PROM.c'
						end if
					end if
				end if
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'K' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then 
					if ll_monto <= ll_monto_desc then
						ls_nro_cuenta			= '4100900204'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'DES.SEG.DES.P.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'DES.SEG.DES.P.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'DES.SEG.DES.P.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'DES.SEG.DES.P.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'DES.SEG.DES.P.c'
						end if
					end if
				end if
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'M' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nro_cuenta			= '4101001002'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'DES.DER.S.PRO.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'DES.DER.S.PRO.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'DES.DER.S.PRO.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'DES.DER.S.PRO.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'DES.DER.S.PRO.c'
					end if
				end if
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'L' ) AND  
						 ( "INGRESO"."CODIGO_OTRO" = '114' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nro_cuenta			= '4101001003'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'DES.TEMP.PROM.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'DES.TEMP.PROM.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'DES.TEMP.PROM.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'DES.TEMP.PROM.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'DES.TEMP.PROM.c'
					end if
				end if
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'L' ) AND  
						 ( "INGRESO"."CODIGO_OTRO" = '115' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nro_cuenta			= '4101001004'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'DES.VELAT.PRO.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'DES.VELAT.PRO.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'DES.VELAT.PRO.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'DES.VELAT.PRO.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'DES.VELAT.PRO.c'
					end if
				end if
			end if
			if ls_nro_cuenta='3000200102' then
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto_desc  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
						 ( "INGRESO"."CODIGO_OTRO" = '113' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nro_cuenta			= '3000302101'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'IN.D.SEP.PROM.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'IN.D.SEP.PROM.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'IN.D.SEP.PROM.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'IN.D.SEP.PROM.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'IN.D.SEP.PROM.c'
					end if
				end if
			end if
			if ls_nro_cuenta='3000300201' and (ls_cod_otro_pago='40' or ls_cod_otro_pago='41' or ls_cod_otro_pago='51') then
				if ls_cod_otro_pago='40' then //Velatorio
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
							 ( "INGRESO"."CODIGO_OTRO" = '115' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta			= '3000302301'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'SERV.VEL.PROM.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'SERV.VEL.PROM.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'SERV.VEL.PROM.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'SERV.VEL.PROM.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'SERV.VEL.PROM.c'
						end if
					end if
				elseif ls_cod_otro_pago='41' then //TEMPLO
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
							 ( "INGRESO"."CODIGO_OTRO" = '114' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta			= '3000302201'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'SERV.TEM.PROM.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'SERV.TEM.PROM.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'SERV.TEM.PROM.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'SERV.TEM.PROM.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'SERV.TEM.PROM.c'
						end if
					end if
				elseif ls_cod_otro_pago='51' then //MULTAS POR RESCILIACION
					ls_nro_cuenta			= '3000303001'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'ING.MULTA RES.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'ING.MULTA RES.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'ING.MULTA RES.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'ING.MULTA RES.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'ING.MULTA RES.c'
					end if
					
				end if
			end if
			if ls_nro_cuenta='3000302001' and (ls_cod_otro_pago='112' or ls_cod_otro_pago='113' or ls_cod_otro_pago='114' or ls_cod_otro_pago='115') then
				if ls_cod_otro_pago='112' then
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'F' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta			= '4101001001'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'DESC.MAN.PROM.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'DESC.MAN.PROM.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'DESC.MAN.PROM.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'DESC.MAN.PROM.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'DESC.MAN.PROM.c'
						end if
					end if
				elseif ls_cod_otro_pago='113' then
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'M' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta			= '4101001002'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'DES.D.SEP.PRO.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'DES.D.SEP.PRO.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'DES.D.SEP.PRO.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'DES.D.SEP.PRO.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'DES.D.SEP.PRO.c'
						end if
					end if
				elseif ls_cod_otro_pago='114' then
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'L' ) AND  
							 ( "INGRESO"."CODIGO_OTRO" = '41' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta			= '4101001003'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'DESC.TEM.PROM.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'DESC.TEM.PROM.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'DESC.TEM.PROM.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'DESC.TEM.PROM.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'DESC.TEM.PROM.c'
						end if
					end if
				elseif ls_cod_otro_pago='115' then
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'L' ) AND  
							 ( "INGRESO"."CODIGO_OTRO" = '40' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta			= '4101001004'
						if ls_centro_costo='42999' then
							ls_descrip_cuenta	= 'DESC.VEL.PROM.p'
						elseif ls_centro_costo='52999' then
							ls_descrip_cuenta	= 'DESC.VEL.PROM.m'
						elseif ls_centro_costo='2999' then
							ls_descrip_cuenta	= 'DESC.VEL.PROM.f'
						elseif ls_centro_costo='62999' then
							ls_descrip_cuenta	= 'DESC.VEL.PROM.s'
						elseif ls_centro_costo='72999' then
							ls_descrip_cuenta	= 'DESC.VEL.PROM.c'
						end if
					end if
				end if
			end if
			if ls_nro_cuenta='3000300201' and ls_cod_otro_pago='11' then
				if ls_cod_otro_pago='11' then
					ls_nro_cuenta			= '3000100103'
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'OTR.ING.D.ESP.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'OTR.ING.D.ESP.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'OTR.ING.D.ESP.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'OTR.ING.D.ESP.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'OTR.ING.D.ESP.c'
					end if
				end if
			end if
			dw_lista.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
			dw_lista.setitem(ll_new,'codigo_banco',ls_codigo_banco)
			dw_lista.setitem(ll_new,'codigo_financiero',ls_codigo_financiero)
			if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
			dw_lista.setitem(ll_new,'descrip_cuenta_contab',ls_descrip_cuenta)
			dw_lista.setitem(ll_new,'centro_costo',ls_centro_costo)
			dw_lista.setitem(ll_new,'tipo_empresa',ls_tipo_empresa)
			if ll_monto<0 and (ls_nro_cuenta='3000302001' or ls_nro_cuenta='3000301002' or &
				ls_nro_cuenta='4101001001' or ls_nro_cuenta='4101001002' or ls_nro_cuenta='4101001003' or &
				ls_nro_cuenta='4101001004' or ls_nro_cuenta='3000301001' or ls_nro_cuenta='4100900204' ) then
				dw_lista.setitem(ll_new,'monto_debe',(ll_monto * -1))
			else
				if ls_monto_lado	= 'I' then
					dw_lista.setitem(ll_new,'monto_debe',(ll_monto))
				else
					dw_lista.setitem(ll_new,'monto',ll_monto)
				end if
			end if
			dw_lista.setitem(ll_new,'codigo_otros',ls_codigo_otros)
			if ls_codigo_otros='S' then
				SELECT	"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
				INTO 		:ls_descrip_otros  
				FROM 		"CUENTA_CONTABLE_OTROS"  
				WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_otro   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if len(ls_descrip_otros)>36 then ls_descrip_otros = mid(ls_descrip_otros,1,36)// + fill(space(1),(36 - len(ls_descrip_otros)))
					ls_descrip_otros	= ls_cod_otro+' - '+ls_descrip_otros
					dw_lista.setitem(ll_new,'descrip_otros',ls_descrip_otros)
				else
					if ls_cod_otro='0' and ls_tipo_mov='L' then ls_descrip_otros='0 - OTROS'
					if ls_cod_otro='0' and ls_tipo_mov='S' then ls_descrip_otros='0 - DESCUENTOS'
					dw_lista.setitem(ll_new,'descrip_otros',ls_descrip_otros)
				end if
			ELSE
				ls_descrip_otros		= fill(space(1),40)
			end if
			if il_cod_parque <> 103 then
				if ls_nro_cuenta='3000300111' then 
					if ll_cod_parque=1 then
						ll_sum_int_mora_p	= ll_sum_int_mora_p + ll_monto
					elseif ll_cod_parque=102 then
						ll_sum_int_mora_m	= ll_sum_int_mora_m + ll_monto
					elseif ll_cod_parque=11 then
						ll_sum_int_mora_f	= ll_sum_int_mora_f + ll_monto
					elseif ll_cod_parque=103 then
						ll_sum_int_mora_r	= ll_sum_int_mora_r + ll_monto
					elseif ll_cod_parque=101 then
						ll_sum_int_mora_c	= ll_sum_int_mora_c + ll_monto
					end if
				end if
				if ls_nro_cuenta='3000300110' then
					if ll_cod_parque=1 then
						ll_sum_int_gasto_p	= ll_sum_int_gasto_p + ll_monto
					elseif ll_cod_parque=102 then
						ll_sum_int_gasto_m	= ll_sum_int_gasto_m + ll_monto
					elseif ll_cod_parque=11 then
						ll_sum_int_gasto_f	= ll_sum_int_gasto_f + ll_monto
					elseif ll_cod_parque=103 then
						ll_sum_int_gasto_r	= ll_sum_int_gasto_r + ll_monto
					elseif ll_cod_parque=101 then
						ll_sum_int_gasto_c	= ll_sum_int_gasto_c + ll_monto
					end if
				end if
				if ls_nro_cuenta='3000300101' then
					if ll_cod_parque=1 then
						ll_sum_mant_p			= ll_sum_mant_p + ll_monto
					elseif ll_cod_parque=102 then
						ll_sum_mant_m			= ll_sum_mant_m + ll_monto
					elseif ll_cod_parque=11 then
						ll_sum_mant_f			= ll_sum_mant_f + ll_monto
					elseif ll_cod_parque=103 then
						ll_sum_mant_s			= ll_sum_mant_s + ll_monto
					elseif ll_cod_parque=101 then
						ll_sum_mant_c			= ll_sum_mant_c + ll_monto
					end if
				end if
				if ls_nro_cuenta='3000301001' then
					if ll_cod_parque=1 then
						ll_sum_desc_p			= ll_sum_desc_p + ll_monto
					elseif ll_cod_parque=102 then
						ll_sum_desc_m			= ll_sum_desc_m + ll_monto
					elseif ll_cod_parque=11 then
						ll_sum_desc_f			= ll_sum_desc_f + ll_monto
					elseif ll_cod_parque=103 then
						ll_sum_desc_s			= ll_sum_desc_s + ll_monto
					elseif ll_cod_parque=101 then
						ll_sum_desc_c			= ll_sum_desc_c + ll_monto
					end if
				end if
			else
				if mid(ddlb_empresa.text,1,1)='A' and (ls_tipo_cob='BL' OR ls_tipo_cob='B0') then
					if ls_nro_cuenta='3000300111' then 
						if ll_cod_parque=1 then
							ll_sum_int_mora_p	= ll_sum_int_mora_p + ll_monto
						elseif ll_cod_parque=102 then
							ll_sum_int_mora_m	= ll_sum_int_mora_m + ll_monto
						elseif ll_cod_parque=11 then
							ll_sum_int_mora_f	= ll_sum_int_mora_f + ll_monto
						elseif ll_cod_parque=103 then
							ll_sum_int_mora_r	= ll_sum_int_mora_r + ll_monto
						elseif ll_cod_parque=101 then
							ll_sum_int_mora_c= ll_sum_int_mora_c + ll_monto
						end if
					end if
					if ls_nro_cuenta='3000300110' then
						if ll_cod_parque=1 then
							ll_sum_int_gasto_p	= ll_sum_int_gasto_p + ll_monto
						elseif ll_cod_parque=102 then
							ll_sum_int_gasto_m	= ll_sum_int_gasto_m + ll_monto
						elseif ll_cod_parque=11 then
							ll_sum_int_gasto_f	= ll_sum_int_gasto_f + ll_monto
						elseif ll_cod_parque=103 then
							ll_sum_int_gasto_r	= ll_sum_int_gasto_r + ll_monto
						elseif ll_cod_parque=101 then
							ll_sum_int_gasto_c	= ll_sum_int_gasto_c + ll_monto
						end if
					end if
				elseif mid(ddlb_empresa.text,1,1)='I' and (ls_tipo_cob='CI' or ls_tipo_cob='CU' or ls_tipo_cob='C0' or ls_tipo_cob='CC') then
					if ls_nro_cuenta='3000300111' then 
						if ll_cod_parque=1 then
							ll_sum_int_mora_p	= ll_sum_int_mora_p + ll_monto
						elseif ll_cod_parque=102 then
							ll_sum_int_mora_m	= ll_sum_int_mora_m + ll_monto
						elseif ll_cod_parque=11 then
							ll_sum_int_mora_f	= ll_sum_int_mora_f + ll_monto
						elseif ll_cod_parque=103 then
							ll_sum_int_mora_r	= ll_sum_int_mora_r + ll_monto
						elseif ll_cod_parque=101 then
							ll_sum_int_mora_c= ll_sum_int_mora_c + ll_monto
						end if
					end if
					if ls_nro_cuenta='3000300110' then
						if ll_cod_parque=1 then
							ll_sum_int_gasto_p	= ll_sum_int_gasto_p + ll_monto
						elseif ll_cod_parque=102 then
							ll_sum_int_gasto_m	= ll_sum_int_gasto_m + ll_monto
						elseif ll_cod_parque=11 then
							ll_sum_int_gasto_f	= ll_sum_int_gasto_f + ll_monto
						elseif ll_cod_parque=103 then
							ll_sum_int_gasto_r	= ll_sum_int_gasto_r + ll_monto
						elseif ll_cod_parque=101 then
							ll_sum_int_gasto_c	= ll_sum_int_gasto_c + ll_monto
						end if
					end if
					if ls_nro_cuenta='3000300101' then
						if ll_cod_parque=1 then
							ll_sum_mant_p			= ll_sum_mant_p + ll_monto
						elseif ll_cod_parque=102 then
							ll_sum_mant_m			= ll_sum_mant_m + ll_monto
						elseif ll_cod_parque=11 then
							ll_sum_mant_f			= ll_sum_mant_f + ll_monto
						elseif ll_cod_parque=103 then
							ll_sum_mant_s			= ll_sum_mant_s + ll_monto
						elseif ll_cod_parque=101 then
							ll_sum_mant_c			= ll_sum_mant_c + ll_monto
						end if
					end if
					if ls_nro_cuenta='3000301001' then
						if ll_cod_parque=1 then
							ll_sum_desc_p			= ll_sum_desc_p + ll_monto
						elseif ll_cod_parque=102 then
							ll_sum_desc_m			= ll_sum_desc_m + ll_monto
						elseif ll_cod_parque=11 then
							ll_sum_desc_f			= ll_sum_desc_f + ll_monto
						elseif ll_cod_parque=103 then
							ll_sum_desc_s			= ll_sum_desc_s + ll_monto
						elseif ll_cod_parque=101 then
							ll_sum_desc_c			= ll_sum_desc_c + ll_monto
						end if
					end if
				end if
			end if
			dw_lista.setitem(ll_new,'rezago',ls_rezago)
			dw_lista.setitem(ll_new,'forma_pago',ls_forma_pago)
			dw_lista.setitem(ll_new,'fecha_pago',ld_fecha_pago_ing)
			dw_lista.setitem(ll_new,'fecha_vcto',ld_fecha_venc)
			dw_lista.setitem(ll_new,'fecha_ini_consulta',ld_fecha_ini)
			dw_lista.setitem(ll_new,'fecha_fin_consulta',ld_fecha_fin)
			dw_lista.setitem(ll_new,'cod_caja',ls_caja)
			dw_lista.setitem(ll_new,'valor_uf',lld_valor_uf)
			dw_lista.setitem(ll_new,'estado_cheque',ls_estado_cheque)
			if ls_nro_cuenta='3000302001' then
				SELECT	"INGRESO"."MONTO"  
				INTO 		:ll_monto  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
						 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
						 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
						 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_new					= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					ls_codigo_otros		= 'S'
					ls_cod_otro				= '112'
					dw_lista.setitem(ll_new,'base',ls_base)
					dw_lista.setitem(ll_new,'serie',ls_serie)
					dw_lista.setitem(ll_new,'numero',ll_numero)
					dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
					dw_lista.setitem(ll_new,'folio',ll_folio)
					dw_lista.setitem(ll_new,'tipo_cob',ls_tipo_cob)
					dw_lista.setitem(ll_new,'tipo_mov','S')
					ls_nro_cuenta			= '4101001001'
					dw_lista.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
					dw_lista.setitem(ll_new,'codigo_banco',ls_codigo_banco)
					dw_lista.setitem(ll_new,'codigo_financiero',ls_codigo_financiero)
					if ls_centro_costo='42999' then
						ls_descrip_cuenta	= 'DESCUENTOS CS.p'
					elseif ls_centro_costo='52999' then
						ls_descrip_cuenta	= 'DESCUENTOS CS.m'
					elseif ls_centro_costo='2999' then
						ls_descrip_cuenta	= 'DESCUENTOS CS.f'
					elseif ls_centro_costo='62999' then
						ls_descrip_cuenta	= 'DESCUENTOS CS.s'
					elseif ls_centro_costo='72999' then
						ls_descrip_cuenta	= 'DESCUENTOS CS.s'
					end if
					
					if len(ls_descrip_cuenta)<40 then ls_descrip_cuenta = ls_descrip_cuenta + fill(space(1),(40 - len(ls_descrip_cuenta)))
					dw_lista.setitem(ll_new,'descrip_cuenta_contab',ls_descrip_cuenta)
					dw_lista.setitem(ll_new,'centro_costo',ls_centro_costo)
					dw_lista.setitem(ll_new,'tipo_empresa',ls_tipo_empresa)
					
					if ll_monto<0 and (ls_nro_cuenta='3000302001' or ls_nro_cuenta='3000301002' or &
						ls_nro_cuenta='4101001001' or ls_nro_cuenta='4101001002' or ls_nro_cuenta='4101001003' or &
						ls_nro_cuenta='4101001004' or ls_nro_cuenta='3000301001' or ls_nro_cuenta='4100900204') then
						dw_lista.setitem(ll_new,'monto_debe',(ll_monto * -1))
					else
						if ls_monto_lado	= 'I' then
							dw_lista.setitem(ll_new,'monto_debe',(ll_monto))
						else
							dw_lista.setitem(ll_new,'monto',ll_monto)
						end if
					end if
					dw_lista.setitem(ll_new,'codigo_otros',ls_codigo_otros)
					if ls_codigo_otros='S' then
						SELECT	"CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
						INTO 		:ls_descrip_otros  
						FROM 		"CUENTA_CONTABLE_OTROS"  
						WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_otro   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if len(ls_descrip_otros)>36 then ls_descrip_otros = mid(ls_descrip_otros,1,36)// + fill(space(1),(36 - len(ls_descrip_otros)))
							ls_descrip_otros	= ls_cod_otro+' - '+ls_descrip_otros
							dw_lista.setitem(ll_new,'descrip_otros',ls_descrip_otros)
						else
							if ls_cod_otro='0' and ls_tipo_mov='L' then ls_descrip_otros='0 - OTROS'
							if ls_cod_otro='0' and ls_tipo_mov='S' then ls_descrip_otros='0 - DESCUENTOS'
							dw_lista.setitem(ll_new,'descrip_otros',ls_descrip_otros)
						end if
					ELSE
						ls_descrip_otros		= fill(space(1),40)
					end if
					dw_lista.setitem(ll_new,'rezago',ls_rezago)
					dw_lista.setitem(ll_new,'forma_pago',ls_forma_pago)
					dw_lista.setitem(ll_new,'fecha_pago',ld_fecha_pago_ing)
					dw_lista.setitem(ll_new,'fecha_vcto',ld_fecha_venc)
					dw_lista.setitem(ll_new,'fecha_ini_consulta',ld_fecha_ini)
					dw_lista.setitem(ll_new,'fecha_fin_consulta',ld_fecha_fin)
					dw_lista.setitem(ll_new,'cod_caja',ls_caja)
					dw_lista.setitem(ll_new,'valor_uf',lld_valor_uf)
					dw_lista.setitem(ll_new,'estado_cheque',ls_estado_cheque)
				end if
			end if
		end if
	end if
end if
if ll_tot_porc <> ll_tot_porc_aux then 
	st_porc.text					= string(ll_tot_porc)+" %"
	ll_tot_porc_aux				= ll_tot_porc
end if
ll_tot_porc							= ((al_indi / ll_tot_reg) * 100)
hpb_1.Position 					= ll_tot_porc
end subroutine

public function long wf_buscar_parque (string as_base, string as_serie, double al_numero, long al_fila);String		ls_base_rez,ls_serie_rez
long		ll_parque
Double	ll_numero_rez

if ll_numero=0 then
	ls_base_rez		= dw_suma.getitemstring(al_fila,'cliente_rezago_base')
	ls_serie_rez	= dw_suma.getitemstring(al_fila,'cliente_rezago_serie')
	ll_numero_rez	= dw_suma.getitemnumber(al_fila,'cliente_rezago_numero')
	SELECT	"CD_FOLIO"."COD_PARQUE"  
	INTO 		:ll_parque  
	FROM 		"CD_FOLIO"  
	WHERE  ( "CD_FOLIO"."BASE" = :ls_base_rez ) AND  
			 ( "CD_FOLIO"."NUMERO" = :ll_numero_rez )   
	USING		sqlca;
	//			 ( "CD_FOLIO"."SERIE" = :ls_serie_rez ) AND  
	if sqlca.sqlcode<>0 then
		SELECT	"CADENA"."COD_PARQUE"  
		INTO 		:ll_parque  
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = :ls_base_rez ) AND  
				 ( "CADENA"."SERIE" = :ls_serie_rez ) AND  
				 ( "CADENA"."NUMERO" = :ll_numero_rez )   
		USING		sqlca;
	end if
else
	SELECT	"CADENA"."COD_PARQUE"  
	INTO 		:ll_parque  
	FROM 		"CADENA"  
	WHERE  ( "CADENA"."CODIGO" = :as_base ) AND  
			 ( "CADENA"."SERIE" = :as_serie ) AND  
			 ( "CADENA"."NUMERO" = :al_numero )   
	USING		sqlca;
end if 
return(ll_parque)
end function

on w_generar_archivo_contab.create
this.cb_limpiar=create cb_limpiar
this.cbx_sumar=create cbx_sumar
this.dw_suma=create dw_suma
this.ddlb_parque=create ddlb_parque
this.st_5=create st_5
this.ddlb_empresa=create ddlb_empresa
this.st_4=create st_4
this.ddlb_caja=create ddlb_caja
this.st_3=create st_3
this.p_desde=create p_desde
this.em_de=create em_de
this.st_1=create st_1
this.cb_ver_detalle=create cb_ver_detalle
this.dw_exporta_contab=create dw_exporta_contab
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_porc=create st_porc
this.st_resumen=create st_resumen
this.p_hasta=create p_hasta
this.em_hasta=create em_hasta
this.st_2=create st_2
this.cb_consultar=create cb_consultar
this.dw_detalle=create dw_detalle
this.cb_ctacte=create cb_ctacte
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_lista_resumen=create dw_lista_resumen
this.dw_lista=create dw_lista
this.Control[]={this.cb_limpiar,&
this.cbx_sumar,&
this.dw_suma,&
this.ddlb_parque,&
this.st_5,&
this.ddlb_empresa,&
this.st_4,&
this.ddlb_caja,&
this.st_3,&
this.p_desde,&
this.em_de,&
this.st_1,&
this.cb_ver_detalle,&
this.dw_exporta_contab,&
this.hpb_1,&
this.st_fondo,&
this.st_porc,&
this.st_resumen,&
this.p_hasta,&
this.em_hasta,&
this.st_2,&
this.cb_consultar,&
this.dw_detalle,&
this.cb_ctacte,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2,&
this.dw_lista_resumen,&
this.dw_lista}
end on

on w_generar_archivo_contab.destroy
destroy(this.cb_limpiar)
destroy(this.cbx_sumar)
destroy(this.dw_suma)
destroy(this.ddlb_parque)
destroy(this.st_5)
destroy(this.ddlb_empresa)
destroy(this.st_4)
destroy(this.ddlb_caja)
destroy(this.st_3)
destroy(this.p_desde)
destroy(this.em_de)
destroy(this.st_1)
destroy(this.cb_ver_detalle)
destroy(this.dw_exporta_contab)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_porc)
destroy(this.st_resumen)
destroy(this.p_hasta)
destroy(this.em_hasta)
destroy(this.st_2)
destroy(this.cb_consultar)
destroy(this.dw_detalle)
destroy(this.cb_ctacte)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_lista_resumen)
destroy(this.dw_lista)
end on

event close;Disconnect using Trans_1;
end event

event open;Long		ll_codigo
String	ls_descrip_parque,ls_parque

gf_centrar(w_generar_archivo_contab)
dw_lista.settransobject(sqlca)
dw_lista_resumen.settransobject(sqlca)
dw_exporta_contab.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_suma.settransobject(sqlca)
cb_ver_detalle.visible		= false
em_de.text					= string(today())
em_hasta.text				= string(today())
DECLARE x1 CURSOR FOR  
SELECT DISTINCT "DOCUMENTOS"."COD_CAJA"  
FROM 		"DOCUMENTOS"  
ORDER BY "DOCUMENTOS"."COD_CAJA" ASC  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_caja;
		if not isnull(ls_caja) and ls_caja<>'' then
			ddlb_caja.additem(ls_caja)
		end if
	LOOP
//	ddlb_caja.additem('TODAS')
//	ddlb_caja.text	= 'TODAS'
end if
close x1;
DECLARE x2 CURSOR FOR  
SELECT DISTINCT "CUENTA_CONTABLE"."TIPO_EMPRESA"  
FROM 		"CUENTA_CONTABLE"  
ORDER BY "CUENTA_CONTABLE"."TIPO_EMPRESA" ASC  
USING		sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_tipo_empresa;
		if not isnull(ls_tipo_empresa) and ls_tipo_empresa<>'' then
			if ls_tipo_empresa='A' then ls_tipo_empresa='Administradora'
			if ls_tipo_empresa='I' then ls_tipo_empresa='Inmobiliaria'
			ddlb_empresa.additem(ls_tipo_empresa)
		end if
		setnull(ls_tipo_empresa)
	LOOP
//	ddlb_empresa.additem('TODAS')
//	ddlb_empresa.text	= 'TODAS'
end if
close x2;
ddlb_parque.reset()
DECLARE	x3 CURSOR FOR  
SELECT 	"COD_PARQ"."CODIGO",   
			"COD_PARQ"."NOMBRE"  
FROM 	"COD_PARQ"  
WHERE 	"COD_PARQ"."GRUPO" = 1   
ORDER BY 1
USING		sqlca;
open x3;
DO WHILE sqlca.sqlcode=0
	fetch x3 into :ll_codigo, :ls_descrip_parque;
	if not isnull(ll_codigo) and ll_codigo>0 then
		ls_parque	= string(ll_codigo)+' - '+ls_descrip_parque
		ddlb_parque.additem(ls_parque)
	end if
	setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
LOOP
close x3;
if gs_conexion	= "Parque El Prado" then
	ddlb_parque.additem('999 - TODAS')
	ddlb_parque.text	= '999 - TODAS'
end if
if ddlb_parque.text='999 - TODAS' then
	cbx_sumar.visible			= false
	cbx_sumar.checked		= false
else
	cbx_sumar.visible			= false
	cbx_sumar.checked		= false
end if
end event

type cb_limpiar from commandbutton within w_generar_archivo_contab
integer x = 1559
integer y = 1796
integer width = 201
integer height = 96
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_codigo
String		ls_descrip_parque,ls_parque

ll_sum_int_mora_p									= 0
ll_sum_int_mora_m									= 0
ll_sum_int_mora_f										= 0
ll_sum_int_mora_r										= 0
ll_sum_int_mora_c									= 0
ll_sum_int_gasto_p									= 0
ll_sum_int_gasto_m									= 0
ll_sum_int_gasto_f										= 0
ll_sum_int_gasto_r									= 0
ll_sum_int_gasto_c									= 0
ll_sum_mant_p											= 0
ll_sum_mant_m										= 0
ll_sum_mant_f											= 0
ll_sum_mant_s											= 0
ll_sum_mant_c											= 0
ll_sum_desc_p											= 0
ll_sum_desc_m											= 0
ll_sum_desc_f											= 0
ll_sum_desc_s											= 0
ll_sum_desc_c											= 0
ll_sum_monto11_c										= 0
ll_sum_monto_otro_c									= 0
ll_sum_monto11_p									= 0
ll_sum_monto_otro_p									= 0
ll_sum_monto11_m									= 0
ll_sum_monto_otro_m								= 0
ll_sum_monto11_f										= 0
ll_sum_monto_otro_f									= 0
ll_sum_monto11_s										= 0
ll_sum_monto_otro_s									= 0
dw_lista.settransobject(sqlca)
dw_lista_resumen.settransobject(sqlca)
dw_exporta_contab.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_suma.settransobject(sqlca)

dw_lista.reset()
dw_lista_resumen.reset()
dw_exporta_contab.reset()
dw_detalle.reset()
dw_suma.reset()

cb_ver_detalle.visible		= false
//em_de.text					= string(today())
//em_hasta.text				= string(today())
DECLARE x1 CURSOR FOR  
SELECT DISTINCT "DOCUMENTOS"."COD_CAJA"  
FROM 		"DOCUMENTOS"  
ORDER BY "DOCUMENTOS"."COD_CAJA" ASC  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_caja;
		if not isnull(ls_caja) and ls_caja<>'' then
			ddlb_caja.additem(ls_caja)
		end if
	LOOP
//	ddlb_caja.additem('TODAS')
//	ddlb_caja.text	= 'TODAS'
end if
close x1;
DECLARE x2 CURSOR FOR  
SELECT DISTINCT "CUENTA_CONTABLE"."TIPO_EMPRESA"  
FROM 		"CUENTA_CONTABLE"  
ORDER BY "CUENTA_CONTABLE"."TIPO_EMPRESA" ASC  
USING		sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_tipo_empresa;
		if not isnull(ls_tipo_empresa) and ls_tipo_empresa<>'' then
			if ls_tipo_empresa='A' then ls_tipo_empresa='Administradora'
			if ls_tipo_empresa='I' then ls_tipo_empresa='Inmobiliaria'
			ddlb_empresa.additem(ls_tipo_empresa)
		end if
		setnull(ls_tipo_empresa)
	LOOP
//	ddlb_empresa.additem('TODAS')
//	ddlb_empresa.text	= 'TODAS'
end if
close x2;
ddlb_parque.reset()
DECLARE	x3 CURSOR FOR  
SELECT 	"COD_PARQ"."CODIGO",   
			"COD_PARQ"."NOMBRE"  
FROM 	"COD_PARQ"  
WHERE 	"COD_PARQ"."GRUPO" = 1   
ORDER BY 1
USING		sqlca;
open x3;
DO WHILE sqlca.sqlcode=0
	fetch x3 into :ll_codigo, :ls_descrip_parque;
	if not isnull(ll_codigo) and ll_codigo>0 then
		ls_parque	= string(ll_codigo)+' - '+ls_descrip_parque
		ddlb_parque.additem(ls_parque)
	end if
	setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
LOOP
close x3;
if gs_conexion	= "Parque El Prado" then
	ddlb_parque.additem('999 - TODAS')
	ddlb_parque.text	= '999 - TODAS'
end if
if ddlb_parque.text='999 - TODAS' then
	cbx_sumar.visible			= false
	cbx_sumar.checked		= false
else
	cbx_sumar.visible			= false
	cbx_sumar.checked		= false
end if
end event

type cbx_sumar from checkbox within w_generar_archivo_contab
integer x = 1833
integer y = 1808
integer width = 430
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sumar Efectivo"
end type

event clicked;dw_lista.reset()
dw_lista_resumen.reset()
end event

type dw_suma from datawindow within w_generar_archivo_contab
boolean visible = false
integer x = 585
integer y = 1284
integer width = 2382
integer height = 432
string title = "none"
string dataobject = "dw_buscar_sumas_montos_td"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_parque from dropdownlistbox within w_generar_archivo_contab
integer x = 2217
integer y = 84
integer width = 590
integer height = 648
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;Long	ll_pos
dw_lista.reset()
dw_lista_resumen.reset()
ll_pos							= pos(ddlb_parque.text,'-')
is_cod_parque				= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
il_cod_parque				= long(is_cod_parque)
if il_cod_parque=999 then
	cbx_sumar.visible		= false
	cbx_sumar.checked	= false
else
	cbx_sumar.visible		= false
	cbx_sumar.checked	= false
end if
end event

type st_5 from statictext within w_generar_archivo_contab
integer x = 2011
integer y = 92
integer width = 192
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_empresa from dropdownlistbox within w_generar_archivo_contab
integer x = 1481
integer y = 84
integer width = 512
integer height = 352
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
dw_lista_resumen.reset()
ll_sum_int_mora_p									= 0
ll_sum_int_mora_m									= 0
ll_sum_int_mora_f										= 0
ll_sum_int_mora_r										= 0
ll_sum_int_mora_c									= 0
ll_sum_int_gasto_p									= 0
ll_sum_int_gasto_m									= 0
ll_sum_int_gasto_f										= 0
ll_sum_int_gasto_r									= 0
ll_sum_int_gasto_c									= 0
ll_sum_mant_p											= 0
ll_sum_mant_m										= 0
ll_sum_mant_f											= 0
ll_sum_mant_s											= 0
ll_sum_mant_c											= 0
ll_sum_desc_p											= 0
ll_sum_desc_m											= 0
ll_sum_desc_f											= 0
ll_sum_desc_s											= 0
ll_sum_desc_c											= 0
ll_sum_monto11_c										= 0
ll_sum_monto_otro_c									= 0
ll_sum_monto11_p									= 0
ll_sum_monto_otro_p									= 0
ll_sum_monto11_m									= 0
ll_sum_monto_otro_m								= 0
ll_sum_monto11_f										= 0
ll_sum_monto_otro_f									= 0
ll_sum_monto11_s										= 0
ll_sum_monto_otro_s									= 0
end event

type st_4 from statictext within w_generar_archivo_contab
integer x = 1211
integer y = 92
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Empresa"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_caja from dropdownlistbox within w_generar_archivo_contab
integer x = 837
integer y = 84
integer width = 366
integer height = 352
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
dw_lista_resumen.reset()
ll_sum_int_mora_p									= 0
ll_sum_int_mora_m									= 0
ll_sum_int_mora_f										= 0
ll_sum_int_mora_r										= 0
ll_sum_int_mora_c									= 0
ll_sum_int_gasto_p									= 0
ll_sum_int_gasto_m									= 0
ll_sum_int_gasto_f										= 0
ll_sum_int_gasto_r									= 0
ll_sum_int_gasto_c									= 0
ll_sum_mant_p											= 0
ll_sum_mant_m										= 0
ll_sum_mant_f											= 0
ll_sum_mant_s											= 0
ll_sum_mant_c											= 0
ll_sum_desc_p											= 0
ll_sum_desc_m											= 0
ll_sum_desc_f											= 0
ll_sum_desc_s											= 0
ll_sum_desc_c											= 0
ll_sum_monto11_c										= 0
ll_sum_monto_otro_c									= 0
ll_sum_monto11_p									= 0
ll_sum_monto_otro_p									= 0
ll_sum_monto11_m									= 0
ll_sum_monto_otro_m								= 0
ll_sum_monto11_f										= 0
ll_sum_monto_otro_f									= 0
ll_sum_monto11_s										= 0
ll_sum_monto_otro_s									= 0
end event

type st_3 from statictext within w_generar_archivo_contab
integer x = 699
integer y = 92
integer width = 123
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Caja"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_desde from picture within w_generar_archivo_contab
integer x = 576
integer y = 84
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date		ld_fecha

ld_fecha	= date(em_de.text)
dw_lista.reset()
dw_lista_resumen.reset()
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_de.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_de.text	= string(date(Message.StringParm))
END IF

end event

type em_de from editmask within w_generar_archivo_contab
integer x = 233
integer y = 84
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;dw_lista.reset()
dw_lista_resumen.reset()
ll_sum_int_mora_p									= 0
ll_sum_int_mora_m									= 0
ll_sum_int_mora_f										= 0
ll_sum_int_mora_r										= 0
ll_sum_int_mora_c									= 0
ll_sum_int_gasto_p									= 0
ll_sum_int_gasto_m									= 0
ll_sum_int_gasto_f										= 0
ll_sum_int_gasto_r									= 0
ll_sum_int_gasto_c									= 0
ll_sum_mant_p											= 0
ll_sum_mant_m										= 0
ll_sum_mant_f											= 0
ll_sum_mant_s											= 0
ll_sum_mant_c											= 0
ll_sum_desc_p											= 0
ll_sum_desc_m											= 0
ll_sum_desc_f											= 0
ll_sum_desc_s											= 0
ll_sum_desc_c											= 0
ll_sum_monto11_c										= 0
ll_sum_monto_otro_c									= 0
ll_sum_monto11_p									= 0
ll_sum_monto_otro_p									= 0
ll_sum_monto11_m									= 0
ll_sum_monto_otro_m								= 0
ll_sum_monto11_f										= 0
ll_sum_monto_otro_f									= 0
ll_sum_monto11_s										= 0
ll_sum_monto_otro_s									= 0
end event

type st_1 from statictext within w_generar_archivo_contab
integer x = 64
integer y = 92
integer width = 160
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ver_detalle from commandbutton within w_generar_archivo_contab
boolean visible = false
integer x = 1024
integer y = 1796
integer width = 279
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Detalle"
end type

event clicked;if dw_lista_resumen.visible= true then
	if dw_lista_resumen.rowcount()>0 then 
		open(w_detalle_movimientos)
	end if
end if
end event

type dw_exporta_contab from datawindow within w_generar_archivo_contab
boolean visible = false
integer x = 114
integer y = 1932
integer width = 1737
integer height = 464
string title = "none"
string dataobject = "dwe_archivo_tesoreria_a_contabilidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type hpb_1 from hprogressbar within w_generar_archivo_contab
boolean visible = false
integer x = 914
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_generar_archivo_contab
boolean visible = false
integer x = 882
integer y = 936
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_porc from statictext within w_generar_archivo_contab
boolean visible = false
integer x = 1454
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type st_resumen from statictext within w_generar_archivo_contab
integer x = 2295
integer y = 1808
integer width = 530
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Resumen"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if st_resumen.text='Mostrar Resumen' then
	dw_lista_resumen.visible	= true
	cb_ver_detalle.visible		= true
	dw_lista.visible				= false
	st_resumen.text='Mostrar Detalle'
	dw_lista_resumen.setfocus()
elseif st_resumen.text='Mostrar Detalle' then
	dw_lista_resumen.visible	= false
	cb_ver_detalle.visible		= false
	dw_lista.visible				= true
	st_resumen.text='Mostrar Resumen'
	dw_lista.setfocus()
end if
st_resumen.visible				= true
end event

type p_hasta from picture within w_generar_archivo_contab
boolean visible = false
integer x = 1125
integer y = 84
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date	ld_fecha
ld_fecha	= date(em_hasta.text)
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_hasta.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_hasta.text	= string(date(Message.StringParm))
END IF
Date	ld_fecha_ing
ld_fecha_ing	= date(em_de.text)
ld_fecha			= date(em_hasta.text)
if ld_fecha_ing > ld_fecha then
	messagebox("Advertencia","Rango de Fecha Inválida")
	em_hasta.text	= em_de.text
end if

end event

type em_hasta from editmask within w_generar_archivo_contab
boolean visible = false
integer x = 782
integer y = 84
integer width = 338
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

type st_2 from statictext within w_generar_archivo_contab
boolean visible = false
integer x = 613
integer y = 92
integer width = 160
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_consultar from commandbutton within w_generar_archivo_contab
integer x = 2843
integer y = 80
integer width = 297
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;String		ls_monto_lado,ls_base_rez,ls_serie_rez,ls_cod_otro_pago
Long		ll_pos,ll_cod_parque,ll_cod_parque_aux,ll_rut,ll_monto_desc
Double	ll_numero_rez

SetPointer(HourGlass!)
connect using Trans_1;
dw_lista.reset()
dw_lista_resumen.reset()
ll_sum_int_mora_p									= 0
ll_sum_int_mora_m									= 0
ll_sum_int_mora_f										= 0
ll_sum_int_mora_r										= 0
ll_sum_int_mora_c									= 0
ll_sum_int_gasto_p									= 0
ll_sum_int_gasto_m									= 0
ll_sum_int_gasto_f										= 0
ll_sum_int_gasto_r									= 0
ll_sum_int_gasto_c									= 0
ll_sum_mant_p											= 0
ll_sum_mant_m										= 0
ll_sum_mant_f											= 0
ll_sum_mant_s											= 0
ll_sum_mant_c											= 0
ll_sum_desc_p											= 0
ll_sum_desc_m											= 0
ll_sum_desc_f											= 0
ll_sum_desc_s											= 0
ll_sum_desc_c											= 0
ll_sum_monto11_c										= 0
ll_sum_monto_otro_c									= 0
ll_sum_monto11_p									= 0
ll_sum_monto_otro_p									= 0
ll_sum_monto11_m									= 0
ll_sum_monto_otro_m								= 0
ll_sum_monto11_f										= 0
ll_sum_monto_otro_f									= 0
ll_sum_monto11_s										= 0
ll_sum_monto_otro_s									= 0
lt_hora													= time("00:00:00")
ld_fecha_ini												= date(em_de.text)
ld_fecha_fin												= date(em_de.text) //date(em_hasta.text)
ldt_fecha_ini											= datetime(ld_fecha_ini,lt_hora)
ldt_fecha_fin											= datetime(ld_fecha_ini,lt_hora) //datetime(ld_fecha_fin,lt_hora)
ls_caja_ok												= trim(ddlb_caja.text)
ll_pos														= pos(ddlb_parque.text,'-')
is_cod_parque											= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
il_cod_parque											= long(is_cod_parque)
if isnull(ldt_fecha_ini) or trim(em_de.text)="00/00/0000" or trim(em_de.text)="" then
	messagebox("Advertencia","Falta Ingresar Fecha")
	em_de.setfocus()
elseif isnull(ls_caja_ok) or trim(ddlb_caja.text)='none' or trim(ddlb_caja.text)='' then
	messagebox("Advertencia","Falta Ingresar Nº Caja")
	ddlb_caja.setfocus()
elseif isnull(trim(ddlb_empresa.text)) or trim(ddlb_empresa.text)='' or trim(ddlb_empresa.text)='none' then
	messagebox("Advertencia","Falta Ingresar Empresa")
	ddlb_empresa.setfocus()
elseif isnull(trim(ddlb_parque.text)) or trim(ddlb_parque.text)='' or trim(ddlb_parque.text)='none' then
	messagebox("Advertencia","Falta Ingresar Parque")
	ddlb_parque.setfocus()
else
	st_fondo.visible									= true
	hpb_1.visible 									= true
	st_porc.visible 									= true
	ll_tot_porc										= 0
	ll_tot_porc_aux									= 0
	hpb_1.Position									= ll_tot_porc
	st_porc.text										= string(ll_tot_porc)+" %"
	if ls_caja_ok<>'XY' then
		dw_detalle.dataobject					= 'dw_lista_movimientos_contables'
	else
		dw_detalle.dataobject					= 'dw_lista_movimientos_contables_xy'
	end if
	dw_detalle.settransobject(sqlca)
	ll_tot_reg										= dw_detalle.retrieve(ld_fecha_ini,ls_caja_ok)	//dw_detalle.retrieve(ld_fecha_ini,ld_fecha_fin,ls_caja_ok)
	dw_lista.object.t_titulo.text					= 'Informe Recaudación Caja Nº '+ ls_caja_ok +' del día '+string(ld_fecha_ini,"dd/mm/yyyy")
	dw_lista_resumen.object.t_titulo.text		= 'Informe Recaudación Caja Nº '+ ls_caja_ok +' del día '+string(ld_fecha_ini,"dd/mm/yyyy")
	if ll_tot_reg = 0 then 
		messagebox("Advertencia","No Registra Dato en Rango de Fecha Definida")
	else
		for ll_indi=1 to ll_tot_reg
			if mid(ddlb_empresa.text,1,1)='A' then
				if il_cod_parque<>999 then
					ls_string							= "tipo_empresa='A' and cod_parque="+string(il_cod_parque)
				else
					ls_string							= "tipo_empresa='A'"
				end if
				ls_tipo_empresa					= 'A'
			elseif mid(ddlb_empresa.text,1,1)='I' then
				if il_cod_parque<>999 then
					ls_string							= "tipo_empresa='I' and cod_parque="+string(il_cod_parque)
				else
					ls_string							= "tipo_empresa='I'"
				end if
				ls_tipo_empresa					= 'I'
			elseif mid(ddlb_empresa.text,1,1)='T' then
				ls_string								= ""
				ls_tipo_empresa					= ''
			end if
			wf_cargar_dw(ll_indi) // Carga detalle
		next
		dw_lista.sort()
		ll_tot_reg									= dw_lista.rowcount()
		if ll_tot_reg>0 then
			ls_nro_cuenta_aux						= dw_lista.getitemstring(1,'nro_cuenta_contab')
			ls_centro_costo_aux					= dw_lista.getitemstring(1,'centro_costo')
			ls_tipo_empresa_aux					= dw_lista.getitemstring(1,'tipo_empresa')
			ls_descrip_cuenta_aux				= dw_lista.getitemstring(1,'descrip_cuenta_contab')
			ls_codigo_banco_aux					= dw_lista.getitemstring(1,'codigo_banco')
			ls_codigo_financiero_aux				= dw_lista.getitemstring(1,'codigo_financiero')
			ll_cod_parque_aux						= dw_lista.getitemnumber(1,'cod_parque')
			ll_sum_monto							= 0
			ll_sum_monto_debe					= 0
			for ll_indi=1 to ll_tot_reg
				ls_base								= dw_lista.getitemstring(ll_indi,'base')
				ls_serie								= dw_lista.getitemstring(ll_indi,'serie')
				ll_numero							= dw_lista.getitemnumber(ll_indi,'numero')
				ll_cod_parque						= dw_lista.getitemnumber(ll_indi,'cod_parque')
				ls_tipo_cob							= dw_lista.getitemstring(ll_indi,'tipo_cob')
				ls_tipo_mov							= dw_lista.getitemstring(ll_indi,'tipo_mov')
				ls_nro_cuenta						= dw_lista.getitemstring(ll_indi,'nro_cuenta_contab')
				ls_descrip_cuenta					= dw_lista.getitemstring(ll_indi,'descrip_cuenta_contab')
				ls_centro_costo						= dw_lista.getitemstring(ll_indi,'centro_costo')
				ls_tipo_empresa					= dw_lista.getitemstring(ll_indi,'tipo_empresa')
				ls_codigo_banco					= dw_lista.getitemstring(ll_indi,'codigo_banco')
				ls_codigo_financiero				= dw_lista.getitemstring(ll_indi,'codigo_financiero')
				ll_monto								= dw_lista.getitemnumber(ll_indi,'monto')
				ll_monto_debe						= dw_lista.getitemnumber(ll_indi,'monto_debe')
				ls_codigo_otros						= dw_lista.getitemstring(ll_indi,'codigo_otros')
				ls_descrip_otros					= dw_lista.getitemstring(ll_indi,'descrip_otros')
				ls_rezago							= dw_lista.getitemstring(ll_indi,'rezago')
				ls_forma_pago						= dw_lista.getitemstring(ll_indi,'forma_pago')
				ld_fecha_pago						= date(dw_lista.getitemdatetime(ll_indi,'fecha_pago'))
				ld_fecha_venc						= date(dw_lista.getitemdatetime(ll_indi,'fecha_vcto'))
				ld_fecha_ini							= date(dw_lista.getitemdatetime(ll_indi,'fecha_ini_consulta'))
				ld_fecha_fin							= date(dw_lista.getitemdatetime(ll_indi,'fecha_fin_consulta'))
				ls_caja								= dw_lista.getitemstring(ll_indi,'cod_caja')
				lld_valor_uf							= double(dw_lista.getitemnumber(ll_indi,'valor_uf'))
				ls_estado_cheque					= dw_lista.getitemstring(ll_indi,'estado_cheque')
				if ls_nro_cuenta=ls_nro_cuenta_aux and ls_tipo_empresa=ls_tipo_empresa_aux then
					ll_sum_monto					= ll_sum_monto + ll_monto
					ll_sum_monto_debe			= ll_sum_monto_debe + ll_monto_debe
					if ls_tipo_mov='L' and il_cod_parque=1 then
						if mid(ls_descrip_otros,1,2) = '11' then
							ll_sum_monto11_p	= ll_sum_monto11_p + ll_monto
						else
							ll_sum_monto_otro_p	= ll_sum_monto_otro_p + ll_monto
						end if
					elseif ls_tipo_mov='L' and il_cod_parque=102 then
						if mid(ls_descrip_otros,1,2) = '11' then
							ll_sum_monto11_m		= ll_sum_monto11_m + ll_monto
						else
							ll_sum_monto_otro_m	= ll_sum_monto_otro_m + ll_monto
						end if
					elseif ls_tipo_mov='L' and il_cod_parque=103 then
						if mid(ls_descrip_otros,1,2) = '11' then
							ll_sum_monto11_s		= ll_sum_monto11_s + ll_monto
						else
							ll_sum_monto_otro_s	= ll_sum_monto_otro_s + ll_monto
						end if
					elseif ls_tipo_mov='L' and il_cod_parque=11 then
						if mid(ls_descrip_otros,1,2) = '11' then
							ll_sum_monto11_f		= ll_sum_monto11_f + ll_monto
						else
							ll_sum_monto_otro_f	= ll_sum_monto_otro_f + ll_monto
						end if
					elseif ls_tipo_mov='L' and il_cod_parque=101 then
						if mid(ls_descrip_otros,1,2) = '11' then
							ll_sum_monto11_c	= ll_sum_monto11_c + ll_monto
						else
							ll_sum_monto_otro_c	= ll_sum_monto_otro_c + ll_monto
						end if
					end if
				else
					if ls_nro_cuenta_aux='3000300110' then
						if ll_sum_int_gasto_p > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_p)
							dw_lista_resumen.setitem(ll_new,'cod_parque',1)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAp')
							dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_gasto_m > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_m)
							dw_lista_resumen.setitem(ll_new,'cod_parque',102)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAm')
							dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_gasto_f > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_f)
							dw_lista_resumen.setitem(ll_new,'cod_parque',11)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAf')
							dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_gasto_r > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_r)
							dw_lista_resumen.setitem(ll_new,'cod_parque',103)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAs')
							dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_gasto_c > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_c)
							dw_lista_resumen.setitem(ll_new,'cod_parque',101)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAc')
							dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
					elseif ls_nro_cuenta_aux='3000300111' then
						if ll_sum_int_mora_p > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_p)
							dw_lista_resumen.setitem(ll_new,'cod_parque',1)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAp')
							dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_mora_m > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_m)
							dw_lista_resumen.setitem(ll_new,'cod_parque',102)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAm')
							dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_mora_f > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_f)
							dw_lista_resumen.setitem(ll_new,'cod_parque',11)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAf')
							dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_mora_c > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_c)
							dw_lista_resumen.setitem(ll_new,'cod_parque',101)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAc')
							dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_int_mora_r > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_r)
							dw_lista_resumen.setitem(ll_new,'cod_parque',103)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAs')
							dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
					elseif ls_nro_cuenta_aux='3000300101' then
						if ll_sum_mant_p > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_mant_p)
							dw_lista_resumen.setitem(ll_new,'cod_parque',1)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','ING.S.MANT.AN.p')
							dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_mant_m > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_mant_m)
							dw_lista_resumen.setitem(ll_new,'cod_parque',102)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','ING.S.MANT.AN.m')
							dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_mant_f > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_mant_f)
							dw_lista_resumen.setitem(ll_new,'cod_parque',11)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','ING.S.MANT.AN.f')
							dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_mant_c > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_mant_c)
							dw_lista_resumen.setitem(ll_new,'cod_parque',101)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','ING.S.MANT.AN.c')
							dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_mant_s > 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto',ll_sum_mant_s)
							dw_lista_resumen.setitem(ll_new,'cod_parque',103)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','ING.S.MANT.AN.s')
							dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
					//
					elseif ls_nro_cuenta_aux='3000301001' then
						if ll_sum_desc_p < 0 AND ll_sum_desc_p <> 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							ll_sum_desc_p	= ll_sum_desc_p * -1
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_p)
							dw_lista_resumen.setitem(ll_new,'cod_parque',1)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTOS p')
							dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_desc_m < 0 AND ll_sum_desc_m <> 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							ll_sum_desc_m	= ll_sum_desc_m * -1
							dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_m)
							dw_lista_resumen.setitem(ll_new,'cod_parque',102)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTOS m')
							dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_desc_f < 0 AND ll_sum_desc_f <> 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							ll_sum_desc_f	= ll_sum_desc_f * -1
							dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_f)
							dw_lista_resumen.setitem(ll_new,'cod_parque',11)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTOS f')
							dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_desc_c < 0 AND ll_sum_desc_c <> 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							ll_sum_desc_c	= ll_sum_desc_c * -1
							dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_c)
							dw_lista_resumen.setitem(ll_new,'cod_parque',101)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTOS c')
							dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
						if ll_sum_desc_s < 0 AND ll_sum_desc_s <> 0 then
							ll_new						= dw_lista_resumen.insertrow(0)
							dw_lista_resumen.scrolltorow(ll_new)
							dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
							ll_sum_desc_s	= ll_sum_desc_s * -1
							dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_s)
							dw_lista_resumen.setitem(ll_new,'cod_parque',103)
							dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTOS s')
							dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
							dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
							dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
						end if
					
					elseif ls_nro_cuenta_aux<>'3000300110' and ls_nro_cuenta_aux<>'3000301001' and ls_nro_cuenta_aux<>'3000300111' and ls_nro_cuenta_aux<>'3000300101' then 
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						if ls_nro_cuenta_aux='NO TIENE CUENTA' then ls_descrip_cuenta_aux='NO TIENE CUENTA'
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_monto)
						dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_monto_debe)	
						dw_lista_resumen.setitem(ll_new,'cod_parque',ll_cod_parque_aux)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab',ls_descrip_cuenta_aux)
						dw_lista_resumen.setitem(ll_new,'centro_costo',ls_centro_costo_aux)
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					ls_nro_cuenta_aux			= ls_nro_cuenta
					ll_sum_monto				= ll_monto
					ll_sum_monto_debe		= ll_monto_debe
					ls_centro_costo_aux		= ls_centro_costo
					ls_tipo_empresa_aux		= ls_tipo_empresa
					ls_descrip_cuenta_aux	= ls_descrip_cuenta
					ls_codigo_banco_aux		= ls_codigo_banco
					ls_codigo_financiero_aux= ls_codigo_financiero
					ll_cod_parque_aux			= ll_cod_parque
					ls_codigo_otros_aux		= ls_codigo_otros
				end if
			next
			if ls_nro_cuenta_aux<>'3000300110' and ls_nro_cuenta_aux<>'3000300111' and ls_nro_cuenta_aux<>'3000300101' and &
				ls_nro_cuenta_aux<>'3000301001' then ////////// dividir
				
				ll_new								= dw_lista_resumen.insertrow(0)
				dw_lista_resumen.scrolltorow(ll_new)
				dw_lista_resumen.setitem(ll_new,'monto',ll_sum_monto)
				dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_monto_debe)

				if ls_nro_cuenta_aux='3000200102' then
					SELECT	"INGRESO"."MONTO"  
					INTO 		:ll_monto_desc  
					FROM 		"INGRESO"  
					WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
							 ( "INGRESO"."CODIGO_OTRO" = '113' ) AND  
							 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
							 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
							 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
							 ( "INGRESO"."BASE" = :ls_base ) AND  
							 ( "INGRESO"."SERIE" = :ls_serie ) AND  
							 ( "INGRESO"."CONTRATO" = :ll_numero )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nro_cuenta_aux				= '3000302101'
						if il_cod_parque=1 then
							ls_descrip_cuenta_aux	= 'IN.D.SEP.PROM.p'
						elseif il_cod_parque=102 then
							ls_descrip_cuenta_aux	= 'IN.D.SEP.PROM.m'
						elseif il_cod_parque=11 then
							ls_descrip_cuenta_aux	= 'IN.D.SEP.PROM.f'
						elseif il_cod_parque=103 then
							ls_descrip_cuenta_aux	= 'IN.D.SEP.PROM.s'
						elseif il_cod_parque=101 then
							ls_descrip_cuenta_aux	= 'IN.D.SEP.PROM.c'
						end if
					end if
				end if
				if ls_nro_cuenta='3000300201' and (ls_cod_otro_pago='40' or ls_cod_otro_pago='41' or ls_cod_otro_pago='51') then
					if ls_cod_otro_pago='40' then //Velatorio
						SELECT	"INGRESO"."MONTO"  
						INTO 		:ll_monto_desc  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
								 ( "INGRESO"."CODIGO_OTRO" = '115' ) AND  
								 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
								 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nro_cuenta_aux				= '3000302301'
							if il_cod_parque=1 then
								ls_descrip_cuenta_aux	= 'SERV.VEL.PROM.p'
							elseif il_cod_parque=102 then
								ls_descrip_cuenta_aux	= 'SERV.VEL.PROM.m'
							elseif il_cod_parque=11 then
								ls_descrip_cuenta_aux	= 'SERV.VEL.PROM.f'
							elseif il_cod_parque=103 then
								ls_descrip_cuenta_aux	= 'SERV.VEL.PROM.s'
							elseif il_cod_parque=101 then
								ls_descrip_cuenta_aux	= 'SERV.VEL.PROM.c'
							end if
						end if
					elseif ls_cod_otro_pago='41' then //TEMPLO
						SELECT	"INGRESO"."MONTO"  
						INTO 		:ll_monto_desc  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."TIPO_MOV" = 'S' ) AND  
								 ( "INGRESO"."CODIGO_OTRO" = '114' ) AND  
								 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
								 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nro_cuenta_aux				= '3000302201'
							if il_cod_parque=1 then
								ls_descrip_cuenta_aux	= 'SERV.TEM.PROM.p'
							elseif il_cod_parque=102 then
								ls_descrip_cuenta_aux	= 'SERV.TEM.PROM.m'
							elseif il_cod_parque=11 then
								ls_descrip_cuenta_aux	= 'SERV.TEM.PROM.f'
							elseif il_cod_parque=103 then
								ls_descrip_cuenta_aux	= 'SERV.TEM.PROM.s'
							elseif il_cod_parque=101 then
								ls_descrip_cuenta_aux	= 'SERV.TEM.PROM.c'
							end if
						end if
					elseif ls_cod_otro_pago='51' then //ING.MULTA RESC.
						ls_nro_cuenta_aux				= '3000303001'
						if il_cod_parque=1 then
							ls_descrip_cuenta_aux	= 'ING.MULTA RES.p'
						elseif il_cod_parque=102 then
							ls_descrip_cuenta_aux	= 'ING.MULTA RES.m'
						elseif il_cod_parque=11 then
							ls_descrip_cuenta_aux	= 'ING.MULTA RES.f'
						elseif il_cod_parque=103 then
							ls_descrip_cuenta_aux	= 'ING.MULTA RES.s'
						elseif il_cod_parque=101 then
							ls_descrip_cuenta_aux	= 'ING.MULTA RES.c'
						end if
					end if
				end if
				if ls_nro_cuenta='3000302001' and (ls_cod_otro_pago='112' or ls_cod_otro_pago='113' or ls_cod_otro_pago='114' or ls_cod_otro_pago='115') then
					if ls_cod_otro_pago='112' then
						SELECT	"INGRESO"."MONTO"  
						INTO 		:ll_monto_desc  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."TIPO_MOV" = 'F' ) AND  
								 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
								 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nro_cuenta_aux				= '4101001001'
							if il_cod_parque=1 then
								ls_descrip_cuenta_aux	= 'DESC.MAN.PROM.p'
							elseif il_cod_parque=102 then
								ls_descrip_cuenta_aux	= 'DESC.MAN.PROM.m'
							elseif il_cod_parque=11 then
								ls_descrip_cuenta_aux	= 'DESC.MAN.PROM.f'
							elseif il_cod_parque=103 then
								ls_descrip_cuenta_aux	= 'DESC.MAN.PROM.s'
							elseif il_cod_parque=101 then
								ls_descrip_cuenta_aux	= 'DESC.MAN.PROM.c'
							end if
						end if
					elseif ls_cod_otro_pago='113' then
						SELECT	"INGRESO"."MONTO"  
						INTO 		:ll_monto_desc  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."TIPO_MOV" = 'M' ) AND  
								 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
								 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nro_cuenta_aux				= '4101001002'
							if il_cod_parque=1 then
								ls_descrip_cuenta_aux	= 'DES.D.SEP.PRO.p'
							elseif il_cod_parque=102 then
								ls_descrip_cuenta_aux	= 'DES.D.SEP.PRO.m'
							elseif il_cod_parque=11 then
								ls_descrip_cuenta_aux	= 'DES.D.SEP.PRO.f'
							elseif il_cod_parque=103 then
								ls_descrip_cuenta_aux	= 'DES.D.SEP.PRO.s'
							elseif il_cod_parque=101 then
								ls_descrip_cuenta_aux	= 'DES.D.SEP.PRO.c'
							end if
						end if
					elseif ls_cod_otro_pago='114' then
						SELECT	"INGRESO"."MONTO"  
						INTO 		:ll_monto_desc  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."TIPO_MOV" = 'L' ) AND  
								 ( "INGRESO"."CODIGO_OTRO" = '41' ) AND  
								 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
								 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nro_cuenta_aux				= '4101001003'
							if il_cod_parque=1 then
								ls_descrip_cuenta_aux	= 'DESC.TEM.PROM.p'
							elseif il_cod_parque=102 then
								ls_descrip_cuenta_aux	= 'DESC.TEM.PROM.m'
							elseif il_cod_parque=11 then
								ls_descrip_cuenta_aux	= 'DESC.TEM.PROM.f'
							elseif il_cod_parque=103 then
								ls_descrip_cuenta_aux	= 'DESC.TEM.PROM.s'
							elseif il_cod_parque=101 then
								ls_descrip_cuenta_aux	= 'DESC.TEM.PROM.c'
							end if
						end if
					elseif ls_cod_otro_pago='115' then
						SELECT	"INGRESO"."MONTO"  
						INTO 		:ll_monto_desc  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."TIPO_MOV" = 'L' ) AND  
								 ( "INGRESO"."CODIGO_OTRO" = '40' ) AND  
								 ( "INGRESO"."FOLIO" = :ll_folio ) AND  
								 ( "INGRESO"."TIPO_COB" = :ls_tipo_cob ) AND  
								 ( "INGRESO"."FECHA_PAGO" = :ld_fecha_pago_ing ) AND  
								 ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ll_numero )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nro_cuenta_aux				= '4101001004'
							if il_cod_parque=1 then
								ls_descrip_cuenta_aux	= 'DESC.VEL.PROM.p'
							elseif il_cod_parque=102 then
								ls_descrip_cuenta_aux	= 'DESC.VEL.PROM.m'
							elseif il_cod_parque=11 then
								ls_descrip_cuenta_aux	= 'DESC.VEL.PROM.f'
							elseif il_cod_parque=103 then
								ls_descrip_cuenta_aux	= 'DESC.VEL.PROM.s'
							elseif il_cod_parque=101 then
								ls_descrip_cuenta_aux	= 'DESC.VEL.PROM.c'
							end if
						end if
					end if
				end if
				dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta_aux)
				if ls_nro_cuenta_aux='NO TIENE CUENTA' then ls_descrip_cuenta_aux='NO TIENE CUENTA'
				dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab',ls_descrip_cuenta_aux)
				dw_lista_resumen.setitem(ll_new,'centro_costo',ls_centro_costo_aux)
				dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
				dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
				dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
				dw_lista_resumen.setitem(ll_new,'cod_parque',ll_cod_parque_aux)
				dw_lista_resumen.accepttext()
			elseif ls_nro_cuenta_aux='3000300110' or ls_nro_cuenta_aux='3000300111' or ls_nro_cuenta_aux='3000301001' then
				if ls_nro_cuenta_aux='3000300110' then
					if ll_sum_int_gasto_p > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_p)
						dw_lista_resumen.setitem(ll_new,'cod_parque',1)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAp')
						dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_gasto_m > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_m)
						dw_lista_resumen.setitem(ll_new,'cod_parque',102)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAm')
						dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_gasto_f > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_f)
						dw_lista_resumen.setitem(ll_new,'cod_parque',11)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAf')
						dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_gasto_c > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_c)
						dw_lista_resumen.setitem(ll_new,'cod_parque',101)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAc')
						dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_gasto_r > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_gasto_r)
						dw_lista_resumen.setitem(ll_new,'cod_parque',103)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.IN.COB.MORAs')
						dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
				elseif ls_nro_cuenta_aux='3000300111' then
					if ll_sum_int_mora_p > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_p)
						dw_lista_resumen.setitem(ll_new,'cod_parque',1)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAp')
						dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_mora_m > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_m)
						dw_lista_resumen.setitem(ll_new,'cod_parque',102)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAm')
						dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_mora_f > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_f)
						dw_lista_resumen.setitem(ll_new,'cod_parque',11)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAf')
						dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_mora_c > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_c)
						dw_lista_resumen.setitem(ll_new,'cod_parque',101)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAc')
						dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_int_mora_r > 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						dw_lista_resumen.setitem(ll_new,'monto',ll_sum_int_mora_r)
						dw_lista_resumen.setitem(ll_new,'cod_parque',103)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','OT.ING.IN.MORAs')
						dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
				elseif ls_nro_cuenta_aux='3000301001' then
					if ll_sum_desc_p <> 0 and ll_sum_desc_p < 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						ll_sum_desc_p	= ll_sum_desc_p * -1
						dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_p)
						dw_lista_resumen.setitem(ll_new,'cod_parque',1)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTO p')
						dw_lista_resumen.setitem(ll_new,'centro_costo','42999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_desc_m <> 0 and ll_sum_desc_m < 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						ll_sum_desc_m	= ll_sum_desc_m * -1
						dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_m)
						dw_lista_resumen.setitem(ll_new,'cod_parque',102)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTO m')
						dw_lista_resumen.setitem(ll_new,'centro_costo','52999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_desc_c <> 0 and ll_sum_desc_c < 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						ll_sum_desc_c	= ll_sum_desc_c * -1
						dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_c)
						dw_lista_resumen.setitem(ll_new,'cod_parque',101)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTO c')
						dw_lista_resumen.setitem(ll_new,'centro_costo','72999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_desc_f <> 0 and ll_sum_desc_f < 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						ll_sum_desc_f	= ll_sum_desc_f * -1
						dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_f)
						dw_lista_resumen.setitem(ll_new,'cod_parque',11)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTO f')
						dw_lista_resumen.setitem(ll_new,'centro_costo','2999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
					if ll_sum_desc_s <> 0 and ll_sum_desc_s < 0 then
						ll_new						= dw_lista_resumen.insertrow(0)
						dw_lista_resumen.scrolltorow(ll_new)
						dw_lista_resumen.setitem(ll_new,'nro_cuenta_contab',ls_nro_cuenta)
						ll_sum_desc_s	= ll_sum_desc_s * -1
						dw_lista_resumen.setitem(ll_new,'monto_debe',ll_sum_desc_s)
						dw_lista_resumen.setitem(ll_new,'cod_parque',103)
						dw_lista_resumen.setitem(ll_new,'descrip_cuenta_contab','DESCUENTO s')
						dw_lista_resumen.setitem(ll_new,'centro_costo','62999')
						dw_lista_resumen.setitem(ll_new,'tipo_empresa',ls_tipo_empresa_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_banco',ls_codigo_banco_aux)
						dw_lista_resumen.setitem(ll_new,'codigo_financiero',ls_codigo_financiero_aux)
					end if
				end if
			end if
			SETNULL(ls_caja);Setnull(ls_empresa)
			
			ls_caja								= trim(ddlb_caja.text)
			ls_empresa							= trim(ddlb_empresa.text)
			
			if mid(ls_empresa,1,1)='T' then
				wf_procesar_ambas_empresa()
			elseif mid(ls_empresa,1,1)='A' then
				wf_procesar_administradora()
			elseif mid(ls_empresa,1,1)='I' then
				wf_procesar_inmobiliaria()
			end if
		end if
		dw_lista.SETfilter(ls_string)
		dw_lista.filter()
		dw_lista_resumen.SETfilter(ls_string)
		dw_lista_resumen.filter()
	end if
	st_fondo.visible						= false
	hpb_1.visible 						= false
	st_porc.visible 						= false
end if
Disconnect using Trans_1;
SetPointer(Arrow!)
end event

type dw_detalle from datawindow within w_generar_archivo_contab
boolean visible = false
integer x = 2075
integer y = 1784
integer width = 517
integer height = 432
string title = "none"
string dataobject = "dw_lista_movimientos_contables"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ctacte from commandbutton within w_generar_archivo_contab
integer x = 1307
integer y = 1796
integer width = 201
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta Cte"
end type

event clicked;if dw_lista.visible=true then
	if dw_lista.rowcount()>0 then
		gs_base		= dw_lista.getitemstring(dw_lista.getrow(),'base')
		gs_serie		= dw_lista.getitemstring(dw_lista.getrow(),'serie')
		gi_numero	= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
		IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
			CHOOSE CASE gs_base
				CASE "O" // Oferta
					Open(w_cuenta_corriente_oferta)
				CASE "L" // Anexo Liberador
					Open(w_cuenta_corriente_liberador)
				CASE "P" // Pagaré
					Open(w_cuenta_corriente_pagare)
				CASE "C" // Contrato ISA	
					Open(w_cuenta_corriente_contrato_isa)
				CASE "D" // Derecho
					Open(w_cuenta_corriente_derecho)
				CASE "R" // Derecho
					Open(w_cuenta_corriente_repactar_cta_mant)
			END CHOOSE
		else
			messagebox("Advertencia","Debe Seleccionar Contrato")
		END IF
	end if
else
	messagebox("Adveretencia","Debe Seleccionar Contrato en Lista de Detalle")
end if
end event

type cb_exportar from commandbutton within w_generar_archivo_contab
integer x = 727
integer y = 1796
integer width = 265
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;String	ls_glosa,ls_monto_haber,ls_monto_debe,ls_monto,ls_rut,ls_tipo_docto,ls_nro_docto,&
			ls_fecha_emision,ls_fecha_vcto,ls_nro_cheque,ls_serie_ch,ls_emp,ls_parque,ls_filtro
long		ll_resp=1,ll_count,ll_count_reg,ll_nro_cheque,ll_pos,ll_fila,ll_largo_serie,ll_cod_parque
Date		ld_fecha
dw_exporta_contab.reset()

ll_tot_reg						= dw_lista_resumen.rowcount() 
if ll_tot_reg > 0 then 
	ld_fecha						= date(w_generar_archivo_contab.em_de.text)
	ls_caja						= w_generar_archivo_contab.ddlb_caja.text
	ls_empresa					= mid(w_generar_archivo_contab.ddlb_empresa.text,1,1)
	ls_parque					= trim(ddlb_parque.text)
	ll_pos							= Pos(ls_parque," ")
	ls_parque					= trim(mid(ls_parque,1,ll_pos))
	if ls_parque='1' then
		ls_parque	= 'P'
	elseif ls_parque='102' then
		ls_parque	= 'M'
	elseif ls_parque='11' then
		ls_parque	= 'F'
	elseif ls_parque='999' then
		ls_parque	= 'T'
	elseif ls_parque='103' then
		ls_parque	= 'S'
	elseif ls_parque='101' then
		ls_parque	= 'C'
	end if
	SELECT	MAX("CAJA_GENERA_ARCHIVO"."CORRELATIVO")  
	INTO 		:ll_count  
	FROM 		"CAJA_GENERA_ARCHIVO"  
	WHERE  ( "CAJA_GENERA_ARCHIVO"."FECHA_GENERADA" = :ld_fecha ) AND  
			 ( "CAJA_GENERA_ARCHIVO"."CAJA" = :ls_caja ) AND  
			 ( "CAJA_GENERA_ARCHIVO"."EMPRESA" = :ls_empresa )   
	Using		sqlca;
	if sqlca.sqlcode=0 then
		if ll_count>0 then
			if ll_count=1 then ll_resp = MessageBox("Advertencia", "Este Archivo ya fue Generado "+string(ll_count)+" vez, desea crear nuevamente",Exclamation!, YesNo!, 2)
			if ll_count>1 then ll_resp = MessageBox("Advertencia", "Este Archivo ya fue Generado "+string(ll_count)+" veces, desea crear nuevamente",Exclamation!, YesNo!, 2)
		end if
	end if
	if ll_resp=1 then			
		for ll_indi=1 to ll_tot_reg
			ls_nro_cuenta		= trim(dw_lista_resumen.getitemstring(ll_indi,'nro_cuenta_contab'))
			ls_glosa				= trim(dw_lista_resumen.getitemstring(ll_indi,'descrip_cuenta_contab'))
			ls_centro_costo		= trim(dw_lista_resumen.getitemstring(ll_indi,'centro_costo'))
			ls_monto_haber	= string(dw_lista_resumen.getitemnumber(ll_indi,'monto'))
			ls_monto_debe		= string(dw_lista_resumen.getitemnumber(ll_indi,'monto_debe'))
			ll_cod_parque		= dw_lista_resumen.getitemnumber(ll_indi,'cod_parque')
			if ls_monto_debe="0" or isnull(ls_monto_debe) or len(ls_monto_debe)=0 then //haber=2
				ls_tipo_mov		= '2'
				ls_monto			= ls_monto_haber
			else//debe=1
				ls_tipo_mov		= '1'
				ls_monto			= ls_monto_debe
			end if
			ls_rut					= ''
			ls_tipo_docto		= ''
			ls_nro_docto		= ''
			ls_fecha_emision	= trim(em_de.text)
			ls_fecha_vcto		= ''
			SELECT	count("CUENTA_CONTABLE"."TIPO_COB")  
			INTO 		:ll_count_reg  
			FROM 	"CUENTA_CONTABLE"  
			WHERE  ( "CUENTA_CONTABLE"."TIPO_COB" = 'B' ) AND  
					 ( "CUENTA_CONTABLE"."CTA_CONTABLE" = :ls_nro_cuenta ) AND
					 ( "CUENTA_CONTABLE"."TIPO_MOV" = 'CH' OR  
						"CUENTA_CONTABLE"."TIPO_MOV" = 'EF')   
			USING	SQLCA;
			if ll_count_reg>0 then
				ls_nro_cheque	= 'DEPO'	
			else
				ls_nro_cheque	= ''	
			end if
			if mid(ls_nro_cuenta,1,5)='10005' then
				ls_rut			= '1'
				if ls_empresa='A' then
					DECLARE	x1 CURSOR FOR  
					SELECT 	"DOCUMENTOS"."N_CHEQUE",   
								"DOCUMENTOS"."MONTO"  
					FROM 	"DOCUMENTOS","INGRESO"  
					WHERE  ( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND
							 ( "DOCUMENTOS"."TIPO_COB" = 'BL' OR "DOCUMENTOS"."TIPO_COB" = 'B0' OR "DOCUMENTOS"."TIPO_COB" = 'FA') AND
							 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
       						 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
       						 ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) AND
							 ( "DOCUMENTOS"."FECHA_PAGO" = :ld_fecha ) AND  
							 ( "DOCUMENTOS"."FECHA_VENC" > :ld_fecha ) AND 
							 ( "INGRESO"."COD_PARQUE" = :ll_cod_parque ) AND
							 ( "DOCUMENTOS"."COD_CAJA" = :ls_caja )
					ORDER BY "DOCUMENTOS"."FECHA_VENC" ASC
					USING		sqlca;
					open x1;
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode=0
							fetch x1 into :ll_nro_cheque, :ll_monto;
							if not isnull(ll_nro_cheque) then
								ls_glosa					= trim(dw_lista_resumen.getitemstring(ll_indi,'descrip_cuenta_contab'))
								ls_monto					= string(ll_monto)
								ls_serie_ch				= string(ll_nro_cheque)
								ll_largo_serie			= len(ls_serie_ch) + 1
								IF ls_empresa='T' THEN
									ls_emp	= mid(trim(dw_lista_resumen.getitemstring(ll_indi,'tipo_empresa')),1,1)
									if gs_empresa='El Prado' then
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
									else
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
									end if
								else
									if gs_empresa='El Prado' then
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
									else
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
									end if
								end if
								if len(ls_glosa)<30 then 
									ls_glosa				= ls_glosa + fill(space(1),(30 - len(ls_glosa)))
								else
									ls_glosa				= mid(ls_glosa,1,30)
								end if
								ls_filtro					= "mid(glosa_contable,9,"+string(ll_largo_serie)+") = '"+mid(ls_glosa,9,ll_largo_serie)+ "'"
								ll_fila						= dw_exporta_contab.Find(ls_filtro,1, dw_exporta_contab.RowCount())
								if ll_fila = 0 then
									ll_new				= dw_exporta_contab.insertrow(0)
									dw_exporta_contab.scrolltorow(ll_new)
									dw_exporta_contab.setitem(ll_new,'cuenta_contable',ls_nro_cuenta)
									dw_exporta_contab.setitem(ll_new,'tipo_movimiento',ls_tipo_mov)
									dw_exporta_contab.setitem(ll_new,'glosa_contable',ls_glosa)
									dw_exporta_contab.setitem(ll_new,'monto',ls_monto)
									dw_exporta_contab.setitem(ll_new,'rut',ls_rut)
									dw_exporta_contab.setitem(ll_new,'tipo_documento',ls_tipo_docto)
									dw_exporta_contab.setitem(ll_new,'numero_documento',ls_nro_docto)
									dw_exporta_contab.setitem(ll_new,'fecha_emision',ls_fecha_emision)
									dw_exporta_contab.setitem(ll_new,'fecha_vencimiento',ls_fecha_vcto)
									dw_exporta_contab.setitem(ll_new,'numero_cheque',ls_nro_cheque)
									dw_exporta_contab.setitem(ll_new,'centro_costo',ls_centro_costo)
									dw_exporta_contab.setitem(ll_new,'fecha_comprobante',ls_fecha_emision)
								end if
							end if
							Setnull(ll_nro_cheque)
						LOOP
					end if
					close x1;

				elseif ls_empresa='I' then
					DECLARE	x2 CURSOR FOR  
					SELECT 	"DOCUMENTOS"."N_CHEQUE",   
								"DOCUMENTOS"."MONTO"  
					FROM 	"DOCUMENTOS" ,	"INGRESO"
					WHERE  ( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND
							 (( "DOCUMENTOS"."TIPO_COB" = 'CI' ) or
							 ( "DOCUMENTOS"."TIPO_COB" = 'C0' ) OR
							 ( "DOCUMENTOS"."TIPO_COB" = 'CU' ) OR
							 ( "DOCUMENTOS"."TIPO_COB" = 'BE' ) OR
							 ( "DOCUMENTOS"."TIPO_COB" = 'CC' )) AND
							 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
       						 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
       						 ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) AND
							 ( "DOCUMENTOS"."FECHA_PAGO" = :ld_fecha ) AND  
							 ( "DOCUMENTOS"."FECHA_VENC" > :ld_fecha ) AND 
							 ( "INGRESO"."COD_PARQUE" = :ll_cod_parque ) AND
							 ( "DOCUMENTOS"."COD_CAJA" = :ls_caja )
					ORDER BY "DOCUMENTOS"."FECHA_VENC" ASC
					USING		sqlca;
					open x2;
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode=0
							fetch x2 into :ll_nro_cheque, :ll_monto;
							if not isnull(ll_nro_cheque) then
								ls_glosa					= trim(dw_lista_resumen.getitemstring(ll_indi,'descrip_cuenta_contab'))
								ls_monto					= string(ll_monto)
								ls_serie_ch				= string(ll_nro_cheque)
								ll_largo_serie			= len(ls_serie_ch) + 1
								IF ls_empresa='T' THEN
									ls_emp	= mid(trim(dw_lista_resumen.getitemstring(ll_indi,'tipo_empresa')),1,1)
									if gs_empresa='El Prado' then
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
									else
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
									end if
								else
									if gs_empresa='El Prado' then
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
									else
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
									end if
								end if
								if len(ls_glosa)<30 then 
									ls_glosa				= ls_glosa + fill(space(1),(30 - len(ls_glosa)))
								else
									ls_glosa				= mid(ls_glosa,1,30)
								end if
								ls_filtro					= "mid(glosa_contable,9,"+string(ll_largo_serie)+") = '"+mid(ls_glosa,9,ll_largo_serie)+ "'"
								ll_fila						= dw_exporta_contab.Find(ls_filtro,1, dw_exporta_contab.RowCount())
								if ll_fila = 0 then
									ll_new				= dw_exporta_contab.insertrow(0)
									dw_exporta_contab.scrolltorow(ll_new)
									dw_exporta_contab.setitem(ll_new,'cuenta_contable',ls_nro_cuenta)
									dw_exporta_contab.setitem(ll_new,'tipo_movimiento',ls_tipo_mov)
									dw_exporta_contab.setitem(ll_new,'glosa_contable',ls_glosa)
									dw_exporta_contab.setitem(ll_new,'monto',ls_monto)
									dw_exporta_contab.setitem(ll_new,'rut',ls_rut)
									dw_exporta_contab.setitem(ll_new,'tipo_documento',ls_tipo_docto)
									dw_exporta_contab.setitem(ll_new,'numero_documento',ls_nro_docto)
									dw_exporta_contab.setitem(ll_new,'fecha_emision',ls_fecha_emision)
									dw_exporta_contab.setitem(ll_new,'fecha_vencimiento',ls_fecha_vcto)
									dw_exporta_contab.setitem(ll_new,'numero_cheque',ls_nro_cheque)
									dw_exporta_contab.setitem(ll_new,'centro_costo',ls_centro_costo)
									dw_exporta_contab.setitem(ll_new,'fecha_comprobante',ls_fecha_emision)
								end if
							end if
							Setnull(ll_nro_cheque)
						LOOP
					end if
					close x2;

				elseif ls_empresa='T' then
					DECLARE	x3 CURSOR FOR  
					SELECT 	"DOCUMENTOS"."N_CHEQUE",   
								"DOCUMENTOS"."MONTO"  
					FROM 	"DOCUMENTOS" ,	"INGRESO"
					WHERE  ( "DOCUMENTOS"."COD_PAGO" = 'CH' ) AND  
							 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
       						 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
       						 ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) AND
							 ( "INGRESO"."COD_PARQUE" = :ll_cod_parque ) AND
							 ( "DOCUMENTOS"."FECHA_PAGO" = :ld_fecha ) AND  
							 ( "DOCUMENTOS"."FECHA_VENC" > :ld_fecha ) AND 
							 ( "DOCUMENTOS"."COD_CAJA" = :ls_caja )
					ORDER BY "DOCUMENTOS"."FECHA_VENC" ASC
					USING		sqlca;
					open x3;
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode=0
							fetch x3 into :ll_nro_cheque, :ll_monto;
							if not isnull(ll_nro_cheque) then
								ls_glosa				= trim(dw_lista_resumen.getitemstring(ll_indi,'descrip_cuenta_contab'))
								ls_monto				= string(ll_monto)
								ls_serie_ch			= string(ll_nro_cheque)
								ll_largo_serie		= len(ls_serie_ch) + 1
								IF ls_empresa='T' THEN
									ls_emp	= mid(trim(dw_lista_resumen.getitemstring(ll_indi,'tipo_empresa')),1,1)
									if gs_empresa='El Prado' then
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
									else
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
									end if
								else
									if gs_empresa='El Prado' then
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
									else
										ls_glosa			= ls_glosa + ' N'+trim(ls_serie_ch)+' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
									end if
								end if
								if len(ls_glosa)<30 then 
									ls_glosa			= ls_glosa + fill(space(1),(30 - len(ls_glosa)))
								else
									ls_glosa			= mid(ls_glosa,1,30)
								end if
								ls_filtro				= "mid(glosa_contable,9,"+string(ll_largo_serie)+") = '"+mid(ls_glosa,9,ll_largo_serie)+ "'"
								ll_fila					= dw_exporta_contab.Find(ls_filtro,1, dw_exporta_contab.RowCount())
								if ll_fila = 0 then
									ll_new				= dw_exporta_contab.insertrow(0)
									dw_exporta_contab.scrolltorow(ll_new)
									dw_exporta_contab.setitem(ll_new,'cuenta_contable',ls_nro_cuenta)
									dw_exporta_contab.setitem(ll_new,'tipo_movimiento',ls_tipo_mov)
									dw_exporta_contab.setitem(ll_new,'glosa_contable',ls_glosa)
									dw_exporta_contab.setitem(ll_new,'monto',ls_monto)
									dw_exporta_contab.setitem(ll_new,'rut',ls_rut)
									dw_exporta_contab.setitem(ll_new,'tipo_documento',ls_tipo_docto)
									dw_exporta_contab.setitem(ll_new,'numero_documento',ls_nro_docto)
									dw_exporta_contab.setitem(ll_new,'fecha_emision',ls_fecha_emision)
									dw_exporta_contab.setitem(ll_new,'fecha_vencimiento',ls_fecha_vcto)
									dw_exporta_contab.setitem(ll_new,'numero_cheque',ls_nro_cheque)
									dw_exporta_contab.setitem(ll_new,'centro_costo',ls_centro_costo)
									dw_exporta_contab.setitem(ll_new,'fecha_comprobante',ls_fecha_emision)
								end if
							end if
							Setnull(ll_nro_cheque)
						LOOP
					end if
					close x3;
				end if
			else
				ll_new				= dw_exporta_contab.insertrow(0)
				dw_exporta_contab.scrolltorow(ll_new)
				dw_exporta_contab.setitem(ll_new,'cuenta_contable',ls_nro_cuenta)
				dw_exporta_contab.setitem(ll_new,'tipo_movimiento',ls_tipo_mov)
				IF ls_empresa='T' THEN
					ls_emp	= mid(trim(dw_lista_resumen.getitemstring(ll_indi,'tipo_empresa')),1,1)
					if gs_empresa='El Prado' then
						ls_glosa			= ls_glosa + ' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
					else
						ls_glosa			= ls_glosa + ' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_emp+ls_parque
					end if
				ELSE
					if gs_empresa='El Prado' then
						ls_glosa			= ls_glosa + ' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
					else
						ls_glosa			= ls_glosa + ' C:'+ls_caja+'-'+string(ld_fecha,"ddmmyy")+'-'+ls_empresa+ls_parque
					end if
				END IF
				if len(ls_glosa)<30 then 
					ls_glosa			= ls_glosa + fill(space(1),(30 - len(ls_glosa)))
				else
					ls_glosa			= mid(ls_glosa,1,30)
				end if
				dw_exporta_contab.setitem(ll_new,'glosa_contable',ls_glosa)
				dw_exporta_contab.setitem(ll_new,'monto',ls_monto)
				dw_exporta_contab.setitem(ll_new,'rut',ls_rut)
				dw_exporta_contab.setitem(ll_new,'tipo_documento',ls_tipo_docto)
				dw_exporta_contab.setitem(ll_new,'numero_documento',ls_nro_docto)
				dw_exporta_contab.setitem(ll_new,'fecha_emision',ls_fecha_emision)
				dw_exporta_contab.setitem(ll_new,'fecha_vencimiento',ls_fecha_vcto)
				dw_exporta_contab.setitem(ll_new,'numero_cheque',ls_nro_cheque)
				dw_exporta_contab.setitem(ll_new,'centro_costo',ls_centro_costo)
				dw_exporta_contab.setitem(ll_new,'fecha_comprobante',ls_fecha_emision)
			end if
		next
		dw_exporta_contab.accepttext()
		dw_paso					= dw_exporta_contab
//		OpenWithParm(w_exportar_archivo_contabilidad, dw_paso)
		f_DWToExcel( dw_paso )
	end if
end if

end event

type cb_imprimir from commandbutton within w_generar_archivo_contab
integer x = 466
integer y = 1804
integer width = 210
integer height = 80
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	if dw_lista.visible=true then
		dw_lista.Object.DataWindow.Zoom = 60
		IF PrintSetup( ) <> -1 THEN dw_lista.Print()
		dw_lista.Object.DataWindow.Zoom = 100
	else
		IF PrintSetup( ) <> -1 THEN dw_lista_resumen.Print()
	end if
END IF

end event

type cb_ordenar from commandbutton within w_generar_archivo_contab
integer x = 247
integer y = 1804
integer width = 219
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
if dw_lista_resumen.visible=true then
	if dw_lista_resumen.rowcount() > 0 then
		dw_lista_resumen.SETSORT(NULO)
		dw_lista_resumen.SORT()
	end if	
elseif dw_lista.visible=true then
	if dw_lista.rowcount() > 0 then
		dw_lista.SETSORT(NULO)
		dw_lista.SORT()
	end if	
end if

end event

type cb_filtrar from commandbutton within w_generar_archivo_contab
integer x = 64
integer y = 1804
integer width = 183
integer height = 80
integer taborder = 90
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
if dw_lista.visible=true then
	dw_lista.SETfilter(NULO)
	dw_lista.filter()
elseif dw_lista_resumen.visible=true then
	dw_lista_resumen.SETfilter(NULO)
	dw_lista_resumen.filter()
end if
end event

type cb_cerrar from commandbutton within w_generar_archivo_contab
integer x = 2857
integer y = 1796
integer width = 329
integer height = 96
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_generar_archivo_contab)
end event

type gb_1 from groupbox within w_generar_archivo_contab
integer x = 41
integer y = 16
integer width = 3145
integer height = 192
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_generar_archivo_contab
integer x = 41
integer y = 1756
integer width = 663
integer height = 148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_lista_resumen from datawindow within w_generar_archivo_contab
boolean visible = false
integer x = 41
integer y = 236
integer width = 3145
integer height = 1512
integer taborder = 80
string dataobject = "dwe_generar_archivo_contabilidad_resumen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	cb_ver_detalle.triggerevent(clicked!)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type dw_lista from datawindow within w_generar_archivo_contab
integer x = 41
integer y = 236
integer width = 3145
integer height = 1512
integer taborder = 60
string dataobject = "dwe_generar_archivo_contabilidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base		= dw_lista.getitemstring(row,'base')
	gs_serie		= dw_lista.getitemstring(row,'serie')
	gi_numero	= dw_lista.getitemnumber(row,'numero')
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base		= dw_lista.getitemstring(this.getrow(),'base')
	gs_serie		= dw_lista.getitemstring(this.getrow(),'serie')
	gi_numero	= dw_lista.getitemnumber(this.getrow(),'numero')
end if
end event

event doubleclicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base		= dw_lista.getitemstring(row,'base')
	gs_serie		= dw_lista.getitemstring(row,'serie')
	gi_numero	= dw_lista.getitemnumber(row,'numero')
	//if dw_lista.rowcount()>0 and gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN cb_ctacte.triggerevent(clicked!)
		dw_paso					= dw_lista
		f_DWToExcel( dw_paso )
end if
end event

