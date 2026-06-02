forward
global type w_ingreso_gestion_ejecutivo_terreno_cob from window
end type
type cb_asigna_eje from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_asocia_rut from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cbx_comi from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cbx_ult_30 from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type pb_calculo from picturebutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type p_1 from picture within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type p_inicio from picture within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_4 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_3 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_2 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cbx_ingreso from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_demanda from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_pagos from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type hpb_1 from hprogressbar within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_porc from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_limpiar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type pb_buscar from picturebutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type em_ctto from editmask within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_1 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type dw_tipo_cob from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_marcar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_carta from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_actualizar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type pb_filtrar from picturebutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_grabar_formula from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_geo from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_ordenar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_filtrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_exportar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_imprimir from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_ctacte from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_historico from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cb_cerrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type gb_1 from groupbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type dw_filtro from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type gb_3 from groupbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_fondo from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type dw_lista from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type tab_cobranza from uo_atencion_terreno within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type tab_cobranza from uo_atencion_terreno within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type dw_select from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type cbx_filtra from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type rb_oculta from radiobutton within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type st_titulo from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type gb_2 from groupbox within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type em_termino from editmask within w_ingreso_gestion_ejecutivo_terreno_cob
end type
type em_inicio from editmask within w_ingreso_gestion_ejecutivo_terreno_cob
end type
end forward

global type w_ingreso_gestion_ejecutivo_terreno_cob from window
integer width = 4361
integer height = 2428
boolean titlebar = true
string title = "Cartera Cobranza Asignada por Ejecutivo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_calcular ( )
cb_asigna_eje cb_asigna_eje
cb_asocia_rut cb_asocia_rut
cbx_comi cbx_comi
cbx_ult_30 cbx_ult_30
pb_calculo pb_calculo
p_1 p_1
p_inicio p_inicio
st_4 st_4
st_3 st_3
st_2 st_2
cbx_ingreso cbx_ingreso
cb_demanda cb_demanda
cb_pagos cb_pagos
hpb_1 hpb_1
st_porc st_porc
cb_limpiar cb_limpiar
pb_buscar pb_buscar
em_ctto em_ctto
st_1 st_1
dw_tipo_cob dw_tipo_cob
cb_marcar cb_marcar
cb_carta cb_carta
cb_actualizar cb_actualizar
pb_filtrar pb_filtrar
cb_grabar_formula cb_grabar_formula
cb_geo cb_geo
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_ctacte cb_ctacte
cb_historico cb_historico
cb_cerrar cb_cerrar
gb_1 gb_1
dw_filtro dw_filtro
gb_3 gb_3
st_fondo st_fondo
dw_lista dw_lista
tab_cobranza tab_cobranza
dw_select dw_select
cbx_filtra cbx_filtra
rb_oculta rb_oculta
st_titulo st_titulo
gb_2 gb_2
em_termino em_termino
em_inicio em_inicio
end type
global w_ingreso_gestion_ejecutivo_terreno_cob w_ingreso_gestion_ejecutivo_terreno_cob

type variables
Long		il_row,il_existe_mix
Double	id_factor_gc
String		is_visible_tab,is_visible_dw='N',is_grupo_cob,is_estado,is_tipo_dw
datetime	idt_fec_ini,idt_fec_fin
date		id_fecha_hoy

datawindowchild	idw_detalle5,idw_detalle6
end variables

forward prototypes
public subroutine wf_pos_contrato_isa ()
public subroutine wf_pos_otros_cttos ()
public subroutine wf_pos_promesa ()
public subroutine wf_cargar_dw_contrato ()
public subroutine wf_filtros ()
public subroutine wf_carga_gestion (long al_indi, string as_usuario, datetime adt_fec_crea, long al_rut)
end prototypes

event ue_calcular();string		ls_nom_user,ls_ciudad,ls_base,ls_serie,ls_existe_pago,ls_fallecido,ls_nulo
datetime	ldt_fec_comi,ldt_fecha,ldt_fec_llama
long		ll_fila,ll_tot_reg,ll_res,ll_mes,ll_ano,ll_indi,ll_rut
double	ldb_ing_caja,ll_numero,ldb_tot_porc=0,ldb_tot_porc_aux=0

SetPointer(HourGlass!)
id_fecha_hoy													= date(gdt_fec_sistema)
w_ingreso_gestion_ejecutivo_terreno_cob.width		= 4390
SELECT	"TIPO_COBRANZA_TERRENO"
INTO 		:gs_tipo_cob
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;    

setnull(ls_nulo)
if isnull(gs_tipo_cob) or gs_tipo_cob='' and (( gs_depto= 'E' or gs_depto= 'I' or gs_depto= 'O') and gl_proceso>=4) then
	cb_demanda.enabled										= true
	cbx_ingreso.visible											= true
	is_tipo_dw													= 'T'
else
	SELECT	count("AT_USUARIO_MIXTO"."USUARIO")  
   	INTO 		:il_existe_mix  
   	FROM 	"AT_USUARIO_MIXTO"  
   	WHERE 	"AT_USUARIO_MIXTO"."USUARIO" = :gs_user
   	USING	sqlca;
	if isnull(il_existe_mix) then il_existe_mix=0
	if il_existe_mix=0 then
		dw_tipo_cob.setitem(1,'tipo_cobranza',gs_tipo_cob)
		dw_tipo_cob.object.tipo_cobranza.protect		= 1
		dw_tipo_cob.accepttext()
	else
		gs_tipo_cob												= ls_nulo
	end if
end if
if gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J' then
	is_grupo_cob		= 'C'
	if gs_tipo_cob='J' then
		cb_asigna_eje.enabled								= true
	end if	
elseif gs_tipo_cob='N' then
	is_grupo_cob		= 'N'
end if


SELECT	max("RES_COMI"."FECHA")  
INTO		:ldt_fec_comi  
FROM		"RES_COMI"  
WHERE 	("RES_COMI"."COD_CONTABLE" = 'P20' OR "RES_COMI"."COD_CONTABLE" = 'P21' OR "RES_COMI"."COD_CONTABLE" = 'P22')
USING	sqlca;
idt_fec_ini														= datetime((RelativeDate(date(ldt_fec_comi),+ 1)),time('00:00:00'))	
ll_mes															= month(date(idt_fec_ini))
ll_ano																= year(date(idt_fec_ini))	
idt_fec_fin														= f_fecha_fin(ll_mes,ll_ano)

if gs_conexion	= "Parque El Prado" then
	ls_ciudad														= '130'
else
	ls_ciudad														= '40'
end if

dw_filtro.SetTransObject(SQLCA)
dw_filtro.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
ll_fila																= dw_filtro.InsertRow(0)
dw_filtro.setitem(ll_fila,'ciudad',ls_ciudad)
idw_detalle.retrieve(ls_ciudad)
dw_lista.settransobject(sqlca)
id_factor_gc														= f_factor_gasto_cobranza()
tab_cobranza.tabpage_1.dw_contrato.settransobject(sqlca)
tab_cobranza.tabpage_1.dw_cliente.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_cobranza.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_carta.settransobject(sqlca)
tab_cobranza.tabpage_2.dw_publico.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_pagos.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_total.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_cuotas.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_detalle_mantencion.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_boton_cerrar.settransobject(sqlca)
tab_cobranza.tabpage_3.dw_boton_cerrar.insertrow(0)
tab_cobranza.tabpage_4.dw_cliente2.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.settransobject(sqlca)
tab_cobranza.tabpage_4.dw_ingreso.settransobject(sqlca)
tab_cobranza.tabpage_5.dw_cliente3.settransobject(sqlca)
tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.settransobject(sqlca)
tab_cobranza.tabpage_5.dw_ingreso_terreno.getchild('estado',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(gs_tipo_cob)=0 then
	idw_detalle2.insertrow(0)
end if
tab_cobranza.tabpage_5.dw_ingreso_terreno.insertrow(0)
tab_cobranza.visible											= false

if gs_depto='E' or gs_depto='I' or gs_depto='O' then 
	tab_cobranza.tabpage_4.cb_grabar.enabled		= true
	tab_cobranza.tabpage_5.cb_grabar_at.enabled	= true
else
	tab_cobranza.tabpage_4.cb_grabar.enabled		= false
	tab_cobranza.tabpage_5.cb_grabar_at.enabled	= false
end if

if gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J' then
	dw_lista.dataobject 										= 'dw_gestion_indiv_ejec_terreno' //OK
	dw_lista.settransobject(sqlca)
	
	dw_lista.getchild('tipo_cobranza',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	if idw_detalle6.retrieve(is_grupo_cob)=0 then
		idw_detalle6.insertrow(0)
	end if
	
	ll_tot_reg													= dw_lista.retrieve(id_fecha_hoy,gs_tipo_cob,gs_user)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Tiene cartera Asignada")
		close(w_ingreso_gestion_ejecutivo_terreno_cob)
	else
		SELECT	"ENCARGADOS"."NOMBRE"  
		INTO 		:ls_nom_user  
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			st_titulo.text											= 'Cartera de Cobranza en Terreno Ejecutivo '+ls_nom_user
		else
			st_titulo.text											= 'Cartera de Cobranza en Terreno Ejecutivo '+gs_user
		end if
			
		st_fondo.visible											= true
		hpb_1.visible 											= true
		st_porc.visible 											= true
		hpb_1.Position											= ldb_tot_porc
		for ll_indi=1 to ll_tot_reg
			ll_rut													= dw_lista.getitemnumber(ll_indi,'rut_cliente')
			ldt_fecha												= dw_lista.getitemdatetime(ll_indi,'fecha_crea')
			ls_base												= dw_lista.getitemstring(ll_indi,'base')
			ls_serie												= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero											= dw_lista.getitemnumber(ll_indi,'numero')
			ldt_fec_llama										= dw_lista.getitemdatetime(ll_indi,'fecha_llamado')
			ldb_ing_caja										= f_ing_caja_cob_terreno(ls_base,ls_serie,ll_numero,idt_fec_ini,idt_fec_fin,gs_tipo_cob)
			dw_lista.setitem(ll_indi,'ing_caja',ldb_ing_caja)
			if ldb_ing_caja>0 then
				ls_existe_pago									= 'S'
			else
				ls_existe_pago									= 'N'
			end if
			dw_lista.setitem(ll_indi,'existe_pago',ls_existe_pago)
			SELECT 	"FALLECIDOS"."NOMBRES"||' '||"FALLECIDOS"."AP_PATERNO"||' '||"FALLECIDOS"."AP_MATERNO"   //AS NOMB_PRIM_FALL
			INTO		:ls_fallecido
			FROM		"FALLECIDOS"
			WHERE	"FALLECIDOS"."BASE" = :ls_base AND
						"FALLECIDOS"."SS" = :ls_serie AND 
						"FALLECIDOS"."CONTRATO" = :ll_numero AND
					  	"FALLECIDOS"."ESTADO_REG" = 'A'  AND 
						"FALLECIDOS"."LLAVE" = (	SELECT	Min("FALLECIDOS"."LLAVE") 
															FROM		"FALLECIDOS"
															WHERE 	"FALLECIDOS"."BASE" = :ls_base AND
																		"FALLECIDOS"."SS" = :ls_serie AND 
																		"FALLECIDOS"."CONTRATO" =  :ll_numero  AND
																		"FALLECIDOS"."ESTADO_REG" = 'A' )
			USING	sqlca;
			dw_lista.setitem(ll_indi,'nomb_prim_fall',ls_fallecido)
			wf_carga_gestion(ll_indi,gs_user,ldt_fecha,ll_rut)
			
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				st_porc.text										= string(ldb_tot_porc,'#0.##')+" %"
				ldb_tot_porc_aux								= ldb_tot_porc
			end if
			ldb_tot_porc											= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 										= ldb_tot_porc
			dw_lista.accepttext()
		next
		st_fondo.visible											= false
		hpb_1.visible 											= false
		st_porc.visible 											= false
		tab_cobranza.visible									= false
		dw_filtro.setfocus()
		SetPointer(Arrow!)
	end if
else 
	dw_tipo_cob.insertrow(0)
	dw_tipo_cob.object.tipo_cobranza.protect			= 0
	dw_tipo_cob.accepttext()
end if
end event

public subroutine wf_pos_contrato_isa ();tab_cobranza.tabpage_3.st_6.x									= 27
tab_cobranza.tabpage_3.st_6.y									= 4
tab_cobranza.tabpage_3.st_6.width							= 850
tab_cobranza.tabpage_3.st_6.height							= 56
tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height			= 412

tab_cobranza.tabpage_3.st_8.x									= 27
tab_cobranza.tabpage_3.st_8.y									= 480
tab_cobranza.tabpage_3.st_8.width							= 850
tab_cobranza.tabpage_3.st_8.height							= 56
tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 536
tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 412

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 956
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_otros_cttos ();tab_cobranza.tabpage_3.st_6.x									= 27
tab_cobranza.tabpage_3.st_6.y									= 4
tab_cobranza.tabpage_3.st_6.width							= 850
tab_cobranza.tabpage_3.st_6.height							= 56
tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height			= 412

tab_cobranza.tabpage_3.st_7.x									= 27
tab_cobranza.tabpage_3.st_7.y									= 480
tab_cobranza.tabpage_3.st_7.width							= 850
tab_cobranza.tabpage_3.st_7.height							= 56
tab_cobranza.tabpage_3.dw_detalle_cuotas.x				= 18
tab_cobranza.tabpage_3.dw_detalle_cuotas.y				= 536
tab_cobranza.tabpage_3.dw_detalle_cuotas.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_cuotas.height			= 412

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 956
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1012
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 412
end subroutine

public subroutine wf_pos_promesa ();tab_cobranza.tabpage_3.st_6.x									= 27
tab_cobranza.tabpage_3.st_6.y									= 4
tab_cobranza.tabpage_3.st_6.width							= 850
tab_cobranza.tabpage_3.st_6.height							= 56
tab_cobranza.tabpage_3.dw_detalle_total.x					= 18
tab_cobranza.tabpage_3.dw_detalle_total.y					= 60
tab_cobranza.tabpage_3.dw_detalle_total.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_total.height			= 292

tab_cobranza.tabpage_3.st_7.x									= 27
tab_cobranza.tabpage_3.st_7.y									= 364
tab_cobranza.tabpage_3.st_7.width							= 850
tab_cobranza.tabpage_3.st_7.height							= 56
tab_cobranza.tabpage_3.dw_detalle_cuotas.x				= 18
tab_cobranza.tabpage_3.dw_detalle_cuotas.y				= 420
tab_cobranza.tabpage_3.dw_detalle_cuotas.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_cuotas.height			= 292

tab_cobranza.tabpage_3.st_8.x									= 27
tab_cobranza.tabpage_3.st_8.y									= 724
tab_cobranza.tabpage_3.st_8.width							= 850
tab_cobranza.tabpage_3.st_8.height							= 56
tab_cobranza.tabpage_3.dw_detalle_mantencion.x			= 18
tab_cobranza.tabpage_3.dw_detalle_mantencion.y			= 780
tab_cobranza.tabpage_3.dw_detalle_mantencion.width		= 2277
tab_cobranza.tabpage_3.dw_detalle_mantencion.height	= 292

tab_cobranza.tabpage_3.st_3.x									= 27
tab_cobranza.tabpage_3.st_3.y									= 1084
tab_cobranza.tabpage_3.st_3.width							= 1001
tab_cobranza.tabpage_3.st_3.height							= 56
tab_cobranza.tabpage_3.dw_detalle_pagos.x					= 18
tab_cobranza.tabpage_3.dw_detalle_pagos.y					= 1140
tab_cobranza.tabpage_3.dw_detalle_pagos.width			= 2277
tab_cobranza.tabpage_3.dw_detalle_pagos.height			= 292
end subroutine

public subroutine wf_cargar_dw_contrato ();Long		ll_tot_reg,ll_indi,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,&
			ii_mora_cobro,ii_inc_gastos,i,ll_valor_total,ll_cta_pag_s,ll_cta_pag_m,ll_plazo,ll_cta_pag_la,&
			ll_cta_pag_isa
String	ls_base,ls_serie,ls_moneda,ls_estado_comi
Double	lld_tasa,lld_valor_cuota,lld_tasa_peso,lld_valor_cuota_peso,id_gc,id_im,lld_valor_cuota_m,&
			id_monto,ll_numero

ll_tot_reg							= tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
for ll_indi=1 to ll_tot_reg
	ls_base							= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_codigo')
	ls_serie							= tab_cobranza.tabpage_1.dw_contrato.getitemstring(ll_indi,'cadena_serie')
	ll_numero						= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_numero')
	ll_mora_cred					= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_cred')
	ll_mora_mant					= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_mora_mant')
	ll_dias_mora_cred				= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_cred')
	ll_dias_mora_mant			= tab_cobranza.tabpage_1.dw_contrato.getitemnumber(ll_indi,'cadena_mora_dias_mora_mant')
	CHOOSE CASE ls_base
		CASE 'O'
			SELECT 	"PAGO_OFERTA"."TASA",   "PAGO_OFERTA"."MONEDA",   	"PAGO_OFERTA"."VALOR_CUOTA" ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"OFERTA_V"."VALOR_CUOTA_M",	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."ESTADO_COMI",	"PAGO_OFERTA"."NRO_CUOTAS"
			INTO 		:lld_tasa,   				:ls_moneda,   					:lld_valor_cuota  ,   				:lld_tasa_peso,   		:lld_tasa  ,				:lld_valor_cuota_m,				:ll_cta_pag_s,				:ll_cta_pag_m,				:ls_estado_comi,				:ll_plazo
			FROM 		"CADENA",   "OFERTA_V",   "PAGO_OFERTA"  ,	"TASA"
			WHERE	 ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("CADENA"."CODIGO" = 'O' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			Using		sqlca;
			if sqlca.sqlcode=0 then
// 			Promesa Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
// 			Promesa Calculo Mantencion				
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 0
				ii_inc_gastos 		= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 				= id_im + id_monto
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // CAMBIO DE 10 A 5%
							 ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_mant * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',(id_gc + id_im + ll_valor_total))

				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_s)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'C'
			SELECT	"CONTRATO"."TASA",   "CONTRATO"."VALOR_CUO",   	"CONTRATO"."MONEDA"  ,	"CONTRATO"."VALOR_CUOTA_M",	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"CONTRATO"."PLAZO",	"CONTRATO"."CTA_PAG_LA",	"CONTRATO"."CTA_PAG_ISA",	"CONTRATO"."CTA_PAG_M"
			INTO 		:lld_tasa,   			:lld_valor_cuota,   			:ls_moneda  ,			 	:lld_valor_cuota_m,				:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,				:ll_cta_pag_la,				:ll_cta_pag_isa,				:ll_cta_pag_m
			FROM 		"CADENA",   "CONTRATO"  , "TASA"
			WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					 (("CADENA"."CODIGO" = 'C' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',0)
				// Calculo Mantencion
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota_m * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 0
				ii_inc_gastos 		= 0
				FOR i = 1 TO ll_mora_mant 
					IF (ll_dias_mora_mant - (i - 1) * 365) > 1 THEN 
						ii_mora_cobro		= (ll_dias_mora_mant - (i - 1) * 365)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im 				= id_im + id_monto
						IF (ll_dias_mora_mant - (i - 1) * 365) > 30 THEN 
							 id_gc 			= id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // CAMBIO DE 10 A 5%
							 ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_mant * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',(id_gc + id_im + ll_valor_total))
			end if

		CASE 'D'
			SELECT	"DERECHO"."TASA",   	"DERECHO"."VALOR_CUO",  "DERECHO"."MONEDA"  ,	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF",	"DERECHO"."PLAZO",	"DERECHO"."CTA_PAG_LA",	"DERECHO"."CTA_PAG_ISA" 
			INTO 		:lld_tasa,   			:lld_valor_cuota,   		:ls_moneda ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo,				:ll_cta_pag_la,			:ll_cta_pag_isa
			FROM 		"CADENA",   "DERECHO"  ,	"TASA"
			WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
					 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
					 (("CADENA"."CODIGO" = 'D' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'P'
			SELECT	"PAGARE"."TASA",  "PAGARE"."VALOR_CUO",   "PAGARE"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"PAGARE"."PLAZO",	"PAGARE"."CTA_PAG_LA",	"PAGARE"."CTA_PAG_ISA"
			INTO 		:lld_tasa,   		:lld_valor_cuota,   		:ls_moneda  ,				:lld_tasa_peso,   		:lld_tasa ,					:ll_plazo			:ll_cta_pag_la,			:ll_cta_pag_isa
			FROM 		"CADENA",   "PAGARE"  ,	"TASA"
			WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
					 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
					 (("CADENA"."CODIGO" = 'P' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',(ll_cta_pag_la + ll_cta_pag_isa))
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'L'
			SELECT	"PAGO_LIBERADOR"."TASA",   "PAGO_LIBERADOR"."VALOR_CUOTA",  "PAGO_LIBERADOR"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_LIBERADOR"."CTA_PAG_M",	"ANEXO_LIBERADOR"."ESTADO_COMI",	"PAGO_LIBERADOR"."NRO_CUOTAS"
			INTO 		:lld_tasa,   					:lld_valor_cuota,   					:ls_moneda  ,							:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,							:ls_estado_comi,						:ll_plazo
			FROM 		"ANEXO_LIBERADOR",   "CADENA",   "PAGO_LIBERADOR"  ,	"TASA"
			WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
					 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
					 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
					 (("CADENA"."CODIGO" = 'L' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
		 	USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if

		CASE 'A'
			SELECT	"PAGO_AUMENTO"."TASA",  "PAGO_AUMENTO"."VALOR_CUOTA", "PAGO_AUMENTO"."MONEDA"  ,   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF" ,	"ANEXO_AUMENTO"."CTA_PAG_M",	"ANEXO_AUMENTO"."ESTADO_COMI",	"PAGO_AUMENTO"."NRO_CUOTAS"
			INTO 		:lld_tasa,   				:lld_valor_cuota,   				:ls_moneda  ,						:lld_tasa_peso,   		:lld_tasa ,					:ll_cta_pag_m,						:ls_estado_comi,						:ll_plazo
			FROM 		"ANEXO_AUMENTO",   "CADENA",   "PAGO_AUMENTO"  ,	"TASA"
			WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
					 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
					 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
					 ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
					 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
					 (("CADENA"."CODIGO" = 'A' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
		 	USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_m)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi',ls_estado_comi)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if
			
		CASE 'R'
			SELECT	"REPACTA_MANTENCION"."VALOR_CUOTA_UF", "REPACTA_MANTENCION"."TIPO_MONEDA",   	"TASA"."TASA_INT_P",   	"TASA"."TASA_INT_UF"  ,	"REPACTA_MANTENCION"."CUOTAS_PACTADAS",	"REPACTA_MANTENCION"."CTAS_PAGADAS"
			INTO 		:lld_valor_cuota,   							:ls_moneda,   								  	:lld_tasa_peso,   		:lld_tasa  ,				:ll_plazo,											:ll_cta_pag_s
			FROM 		"CADENA",   "REPACTA_MANTENCION",   "TASA"  
			WHERE  ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
					 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
					 (("CADENA"."CODIGO" = 'R' ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				// Calculo Credito
				setnull(ll_valor_total)
				if ls_moneda='2' then // uf
					lld_valor_cuota_peso	= lld_valor_cuota * gd_uf_dia
					lld_tasa					= lld_tasa
				else
					lld_tasa					= lld_tasa_peso
				end if
				lld_valor_cuota_peso 	= Round(lld_valor_cuota_peso, 0)
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 1
				ii_inc_gastos 		= 1
				FOR i = 1 TO ll_mora_cred 
					IF (ll_dias_mora_cred - (i - 1) * 30) > 5 THEN 
						ii_mora_cobro = (ll_dias_mora_cred - (i - 1) * 30)
						//	Funcion gf_int_mora
						setnull(id_monto)
						id_monto = (lld_tasa / 36000) * lld_valor_cuota_peso
						id_monto = (id_monto)
						id_monto = round((id_monto * ii_mora_cobro),0)
						//	Fin Funcion
						id_im = id_im + id_monto
						IF (ll_dias_mora_cred - (i - 1) * 30) > 30 THEN 
							id_gc = id_gc + Round(lld_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
							ii_inc_gastos = 1
						END IF
					END IF
				NEXT
				ll_valor_total	= ll_mora_cred * lld_valor_cuota_peso
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_cred',id_gc)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_cred',ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_cred',id_im)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_cred',(id_gc + id_im + ll_valor_total))
				// Calculo Mantencion
				setnull(ll_valor_total)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'gastos_adm_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'valor_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'interes_mora_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'total_mant',0)
				
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_cred',ll_cta_pag_s)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_pag_mant',0)
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'est_comi','')
				tab_cobranza.tabpage_1.dw_contrato.setitem(ll_indi,'ctas_plazo',ll_plazo)
			end if
	END CHOOSE
next
end subroutine

public subroutine wf_filtros ();long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto

setnull (gs_formula)
gs_formula							= ''
ll_filas								= dw_lista.rowcount()
gs_formula 							= dw_lista.describe("datawindow.syntax")
ll_largototal							= len(gs_formula)
ll_posini								= Pos(gs_formula, "filter") + 8
ll_posfin								= len("~nfilter~n")
ls_texto								= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin						= ll_indi
		ll_indi							= ll_largototal
	end if
next
ll_resto								= ll_posfin - ll_posini
gs_formula							= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' or ll_posini=0 or ll_posini=8 then
	gs_formula	= ''
end if

end subroutine

public subroutine wf_carga_gestion (long al_indi, string as_usuario, datetime adt_fec_crea, long al_rut);long		ll_tele_log,ll_aten_log
datetime	ldt_fec_llam,ldt_fec_aten

//wf_carga_gestion(al_indi,as_usuario,adt_fec_crea,al_rut)

SELECT	MAX("TELE_LOG"."FECHA") //as fecha_llamado  
INTO		:ldt_fec_llam
FROM		"TELE_LOG"
WHERE	"TELE_LOG"."RUT" = :al_rut AND
			"TELE_LOG"."USUARIO" = :as_usuario AND
			"TELE_LOG"."FECHA" >= :adt_fec_crea
USING	sqlca;

SELECT DISTINCT "TELE_LOG"."ESTADO" //as estado_tele_log,   
INTO		:ll_tele_log
FROM 	"TELE_LOG"
WHERE	"TELE_LOG"."RUT" = :al_rut AND
			"TELE_LOG"."USUARIO" = :as_usuario AND
			"TELE_LOG"."FECHA" =:ldt_fec_llam
USING	sqlca;

SELECT	MAX("ATENCION_LOG"."FECHA")	//as fecha_atencion,  
INTO		:ldt_fec_aten
FROM		"ATENCION_LOG"
WHERE	"ATENCION_LOG"."RUT" = :al_rut AND
			"ATENCION_LOG"."USUARIO" = :as_usuario AND
			"ATENCION_LOG"."FECHA" >= :adt_fec_crea
USING	sqlca;

SELECT DISTINCT "ATENCION_LOG"."ESTADO" //as estado_aten_log,   
INTO		:ll_aten_log
FROM		"ATENCION_LOG"
WHERE	"ATENCION_LOG"."USUARIO" = :as_usuario AND
			"ATENCION_LOG"."RUT" = :al_rut AND
			"ATENCION_LOG"."FECHA" = :ldt_fec_aten
USING	sqlca;

dw_lista.setitem(al_indi,'fecha_llamado',ldt_fec_llam)
dw_lista.setitem(al_indi,'estado_tele_log',ll_tele_log)
dw_lista.setitem(al_indi,'fecha_atencion',ldt_fec_aten)
dw_lista.setitem(al_indi,'estado_aten_log',ll_aten_log)
dw_lista.accepttext()
			




end subroutine

on w_ingreso_gestion_ejecutivo_terreno_cob.create
this.cb_asigna_eje=create cb_asigna_eje
this.cb_asocia_rut=create cb_asocia_rut
this.cbx_comi=create cbx_comi
this.cbx_ult_30=create cbx_ult_30
this.pb_calculo=create pb_calculo
this.p_1=create p_1
this.p_inicio=create p_inicio
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cbx_ingreso=create cbx_ingreso
this.cb_demanda=create cb_demanda
this.cb_pagos=create cb_pagos
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.cb_limpiar=create cb_limpiar
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_1=create st_1
this.dw_tipo_cob=create dw_tipo_cob
this.cb_marcar=create cb_marcar
this.cb_carta=create cb_carta
this.cb_actualizar=create cb_actualizar
this.pb_filtrar=create pb_filtrar
this.cb_grabar_formula=create cb_grabar_formula
this.cb_geo=create cb_geo
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_ctacte=create cb_ctacte
this.cb_historico=create cb_historico
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.dw_filtro=create dw_filtro
this.gb_3=create gb_3
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.tab_cobranza=create tab_cobranza
this.dw_select=create dw_select
this.cbx_filtra=create cbx_filtra
this.rb_oculta=create rb_oculta
this.st_titulo=create st_titulo
this.gb_2=create gb_2
this.em_termino=create em_termino
this.em_inicio=create em_inicio
this.Control[]={this.cb_asigna_eje,&
this.cb_asocia_rut,&
this.cbx_comi,&
this.cbx_ult_30,&
this.pb_calculo,&
this.p_1,&
this.p_inicio,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cbx_ingreso,&
this.cb_demanda,&
this.cb_pagos,&
this.hpb_1,&
this.st_porc,&
this.cb_limpiar,&
this.pb_buscar,&
this.em_ctto,&
this.st_1,&
this.dw_tipo_cob,&
this.cb_marcar,&
this.cb_carta,&
this.cb_actualizar,&
this.pb_filtrar,&
this.cb_grabar_formula,&
this.cb_geo,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_ctacte,&
this.cb_historico,&
this.cb_cerrar,&
this.gb_1,&
this.dw_filtro,&
this.gb_3,&
this.st_fondo,&
this.dw_lista,&
this.tab_cobranza,&
this.dw_select,&
this.cbx_filtra,&
this.rb_oculta,&
this.st_titulo,&
this.gb_2,&
this.em_termino,&
this.em_inicio}
end on

on w_ingreso_gestion_ejecutivo_terreno_cob.destroy
destroy(this.cb_asigna_eje)
destroy(this.cb_asocia_rut)
destroy(this.cbx_comi)
destroy(this.cbx_ult_30)
destroy(this.pb_calculo)
destroy(this.p_1)
destroy(this.p_inicio)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_ingreso)
destroy(this.cb_demanda)
destroy(this.cb_pagos)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.cb_limpiar)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_1)
destroy(this.dw_tipo_cob)
destroy(this.cb_marcar)
destroy(this.cb_carta)
destroy(this.cb_actualizar)
destroy(this.pb_filtrar)
destroy(this.cb_grabar_formula)
destroy(this.cb_geo)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_ctacte)
destroy(this.cb_historico)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.dw_filtro)
destroy(this.gb_3)
destroy(this.st_fondo)
destroy(this.dw_lista)
destroy(this.tab_cobranza)
destroy(this.dw_select)
destroy(this.cbx_filtra)
destroy(this.rb_oculta)
destroy(this.st_titulo)
destroy(this.gb_2)
destroy(this.em_termino)
destroy(this.em_inicio)
end on

event open;gs_tipo_cob														= ''
gf_centrar(w_ingreso_gestion_ejecutivo_terreno_cob)

dw_tipo_cob.dataobject										= 'dwe_tipo_conbranza'
dw_tipo_cob.settransobject(sqlca)
dw_tipo_cob.getchild('tipo_cobranza',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve('C')=0 then
	idw_detalle3.insertrow(0)
end if
dw_tipo_cob.insertrow(0)

cb_marcar.text													= 'Marcar Todo'
PostEvent('ue_calcular')
end event

type cb_asigna_eje from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 1147
integer y = 2164
integer width = 494
integer height = 92
integer taborder = 170
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Asignar Ejecutivo "
end type

event clicked;//string ls_tipo_cob,ls_base,ls_serie,ls_string
//long ldb_numero,ll_res
//
//dw_lista.accepttext()
//
//ls_tipo_cob					= dw_lista.getitemstring(il_row,'tipo_cobranza')
//if ls_tipo_cob<>'J' then
//	messagebox("Advertencia",'El Contrato Seleccionado no se Encuentra en Cartera "J-Judicial"')
//else
//	ls_base					= dw_lista.getitemstring(il_row,'base')
//	ls_serie					= dw_lista.getitemstring(il_row,'serie')
//	ldb_numero				= dw_lista.getitemnumber(il_row,'numero')
//	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
//		ll_res					= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
//		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
//		if ll_res=1 then
//			if isvalid(w_asignar_ejecutivo_atencion_terreno) then close(w_asignar_ejecutivo_atencion_terreno)
//			Open (w_asignar_ejecutivo_atencion_terreno)
//		end if
//	end if
//end if


long ll_fila

ll_fila									= dw_lista.Find("marca = 1", 1, dw_lista.RowCount())

if ll_fila=0 or isnull(ll_fila) then
	messagebox("Advertencia","Debe Seleccionar Contrato para Asignar")
else
	if isvalid(w_asignar_ejecutivo_atencion_terreno) then close(w_asignar_ejecutivo_atencion_terreno)
	open(w_asignar_ejecutivo_atencion_terreno)
end if
end event

type cb_asocia_rut from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 338
integer y = 2064
integer width = 375
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación. * Rut"
end type

event clicked;if dw_lista.getrow()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "base")
	gs_serie		= dw_lista.getitemstring(il_row, "serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "numero")
	gi_tipo_busqueda = 1
	if isvalid(w_listado_contratos) then close(w_listado_contratos)
	open(w_listado_contratos)
end if

end event

type cbx_comi from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4407
integer y = 568
integer width = 786
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Comisión (Todas)"
boolean checked = true
end type

event clicked;dw_lista.reset()
if cbx_comi.checked=true then
	cbx_comi.text	= 'Estado Comisión (Todas)'
elseif cbx_comi.checked=false then
	cbx_comi.text	= 'Estado Comisión (Pagadas)'
end if
end event

type cbx_ult_30 from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4407
integer y = 644
integer width = 786
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Con Pago Últ. 30 días"
end type

event clicked;string	ls_filtro
datetime	ldt_fec_ini
long	ll_tot_reg

ls_filtro									= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.accepttext()

ll_tot_reg								= dw_lista.rowcount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra datos")
else
	if cbx_ult_30.checked=true then
		ldt_fec_ini							= datetime((RelativeDate(date(gdt_fec_sistema), - 30)),time('00:00:00'))
		em_inicio.text						= string(date(ldt_fec_ini),'dd/mm/yyyy')
		ls_filtro								= " fec_ult_pago >= date('"+string(ldt_fec_ini,'dd/mm/yyyy')+"') "
		em_termino.text					= string(date(gdt_fec_sistema),'dd/mm/yyyy')
	elseif cbx_ult_30.checked=false then
		ldt_fec_ini							= datetime((RelativeDate(date(gdt_fec_sistema), - (30*4))),time('00:00:00'))
		em_inicio.text						= string(date(ldt_fec_ini),'dd/mm/yyyy')
		em_termino.text					= string(date(gdt_fec_sistema),'dd/mm/yyyy')
		ls_filtro								= ''
	end if
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.accepttext()
end if
end event

type pb_calculo from picturebutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 5221
integer y = 564
integer width = 137
integer height = 116
integer taborder = 50
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

event clicked;string		ls_pasa='S',ls_base,ls_serie,ls_filtro
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_max_pago
long		ll_tot_reg,ll_indi
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_numero,ldb_ing_caja

dw_lista.accepttext()

ldt_fec_ini														= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fec_fin														= datetime(date(em_termino.text),time('00:00:00'))

if isnull(ldt_fec_ini) or ldt_fec_ini= datetime(date('01/01/1900'),time('00:00:00')) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicio")
	ls_pasa											= 'N'
elseif isnull(ldt_fec_fin) or ldt_fec_fin= datetime(date('01/01/1900'),time('00:00:00')) then
	messagebox("Advertencia","Debe Ingresar Fecha Término")
	ls_pasa											= 'N'
elseif ldt_fec_ini>=ldt_fec_fin then
	messagebox("Advertencia","Rango Fecha Invalido")
	ls_pasa											= 'N'
end if

if ls_pasa='S' then
	dw_tipo_cob.TriggerEvent(Itemchanged!)
end if
end event

type p_1 from picture within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 5221
integer y = 428
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string		ls_fecha,ls_tipo_cob
long		ll_mes,ll_ano,ll_cta
datetime	ldt_fec_comi,ldt_fec_fin

dw_lista.reset()
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


end event

type p_inicio from picture within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4777
integer y = 428
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string		ls_fecha,ls_tipo_cob
long		ll_mes,ll_ano,ll_cta
datetime	ldt_fec_comi,ldt_fec_fin

dw_lista.reset()
if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF



end event

type st_4 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4910
integer y = 352
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec. Término"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4462
integer y = 352
integer width = 389
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec. Inicio"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4434
integer y = 172
integer width = 882
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 16711680
string text = "Cálculo Ingreso Caja"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_ingreso from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 3803
integer y = 188
integer width = 507
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calcular Ingreso"
end type

event clicked;long	ll_tot_reg
string	ls_tipo_cob
datetime	ldt_fec_ini

dw_lista.reset()

if cbx_ingreso.checked=true then
	w_ingreso_gestion_ejecutivo_terreno_cob.width	= 5486
	is_tipo_dw													= 'P'
	ldt_fec_ini													= datetime((RelativeDate(date(gdt_fec_sistema), - (30*4))),time('00:00:00'))
	em_inicio.text												= string(date(ldt_fec_ini),'dd/mm/yyyy')
	em_termino.text											= string(date(gdt_fec_sistema),'dd/mm/yyyy')
	
elseif cbx_ingreso.checked=false then
	is_tipo_dw													= 'T'	
	w_ingreso_gestion_ejecutivo_terreno_cob.width	= 4390
	dw_tipo_cob.TriggerEvent(Itemchanged!)
end if

ls_tipo_cob														= dw_tipo_cob.getitemstring(1,'tipo_cobranza')
if isnull(ls_tipo_cob) or ls_tipo_cob = '' then
	messagebox("Advertencia","Debe Seleccionar Cártera Cobranza")
	dw_tipo_cob.setfocus()
	dw_tipo_cob.setcolumn('tipo_cobranza')
end if
gf_centrar(w_ingreso_gestion_ejecutivo_terreno_cob)

end event

type cb_demanda from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 745
integer y = 2164
integer width = 398
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Paso Demanda"
end type

event clicked;string		ls_base,ls_serie,ls_estado_ctto,ls_cobrador
long		ll_graba,ll_res
double	ldb_numero

dw_lista.accepttext()

ls_estado_ctto			= dw_lista.getitemstring(il_row,'estado')
if ls_estado_ctto<>'M' then
	messagebox("Advertencia",'El Contrato Seleccionado no se Encuentra en Estado "M-Demanda"')
else
	ls_base					= dw_lista.getitemstring(il_row,'base')
	ls_serie					= dw_lista.getitemstring(il_row,'serie')
	ldb_numero				= dw_lista.getitemnumber(il_row,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		ll_res					= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
		if ll_res=1 then
			SELECT  "ENCARGADOS"."CODIGO_USUARIO"  
			INTO     :ls_cobrador
			FROM   "ENCARGADOS"  
			WHERE "ENCARGADOS"."TIPO_COBRANZA_TERRENO" = 'J' AND "ENCARGADOS"."ESTADO" = 'A'
			USING  sqlca;
			if not isnull(ls_cobrador) then
				ll_graba		= f_demanda_cliente_cartera(ls_base,ls_serie,ldb_numero,ls_cobrador)
			end if
//			ll_graba			= f_demanda_cliente_cartera(ls_base,ls_serie,ldb_numero,'ET30')
			if ll_graba>0 then
				messagebox("Grabar","Grabación Exitosa")
			end if
		end if
	end if
end if
end event

type cb_pagos from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 969
integer y = 2064
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pagos &Ventas"
end type

event clicked;string		ls_base,ls_serie,ls_string
double	ldb_numero

dw_lista.accepttext()
if il_row>0 then
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista.getitemnumber(il_row,'numero')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ldb_numero>0 then
		ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)
		if isvalid(w_rescomi_terreno) then close(w_rescomi_terreno)
		OpenWithParm (w_rescomi_terreno,ls_string)
	end if
end if
end event

type hpb_1 from hprogressbar within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 1367
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 1906
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

type cb_limpiar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_mousemove
integer x = 4041
integer y = 56
integer width = 242
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_filtro.reset()
 w_ingreso_gestion_ejecutivo_terreno_cob.triggerevent(Open!)
end event

type pb_buscar from picturebutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 3872
integer y = 2068
integer width = 110
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
Double	ll_numero
ll_numero							= Double(em_ctto.text)
ll_tot_reg							= dw_lista.rowcount()
if ll_numero>0 and ll_tot_reg>0 then
	ls_string							= "numero = "+string(ll_numero)
	ll_fila 								= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
		dw_lista.setitem(ll_fila,'marca',1)
		dw_lista.accepttext()
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if

end event

type em_ctto from editmask within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 3365
integer y = 2068
integer width = 498
integer height = 88
integer taborder = 140
integer textsize = -8
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

event modified;if long(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_1 from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 3063
integer y = 2084
integer width = 293
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Ctto:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_tipo_cob from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 37
integer y = 56
integer width = 901
integer height = 92
integer taborder = 50
string title = "none"
string dataobject = "dwe_tipo_conbranza"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string		ls_ciudad,ls_nom_user,ls_base,ls_serie,ls_existe_pago,ls_tipo_cob,ls_usuario,ls_fallecido,&
			ls_estado_comi1,ls_estado_comi2,ls_estado_comi3,ls_filtro
long		ll_fila,ll_tot_reg,ll_indi,ll_numero,ll_rut
double	ldb_ing_caja,ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_ing_caja_fec
datetime	ldt_fecha,ldt_nulo,ldt_fec_ini,ldt_fec_fin,ldt_fec_max_pago

dw_tipo_cob.accepttext()
setnull(ldt_nulo)
gs_tipo_cob														= dw_tipo_cob.getitemstring(1,'tipo_cobranza')
if gs_tipo_cob='C' or gs_tipo_cob='M' or gs_tipo_cob='E' or gs_tipo_cob='J' then
	is_grupo_cob												= 'C'
	if gs_tipo_cob='J' then
		cb_asigna_eje.enabled								= true
	else
		cb_asigna_eje.enabled								= false
	end if	
elseif gs_tipo_cob='N' then
	is_grupo_cob												= 'N'
end if

if isnull(gs_tipo_cob) or gs_tipo_cob='' then
	messagebox("Advertencia","Debe Ingresar Tipo Cobranza")
else
	if il_existe_mix>0 then
		dw_lista.dataobject 									= 'dw_gestion_indiv_ejec_terreno' //OK
		dw_lista.settransobject(sqlca)
		
		dw_lista.getchild('tipo_cobranza',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		if idw_detalle6.retrieve(is_grupo_cob)=0 then
			idw_detalle6.insertrow(0)
		end if
		ll_tot_reg												= dw_lista.retrieve(id_fecha_hoy,gs_tipo_cob,gs_user)
	else
		if is_tipo_dw='T' then
			dw_lista.dataobject 								= 'dw_gestion_indiv_ejec_terreno_todos'
			dw_lista.settransobject(sqlca)
			dw_lista.getchild('tipo_cobranza',idw_detalle6)
			idw_detalle6.settransobject(sqlca)
			if idw_detalle6.retrieve(is_grupo_cob)=0 then
				idw_detalle6.insertrow(0)
			end if
			ll_tot_reg											= dw_lista.retrieve(id_fecha_hoy,gs_tipo_cob)
		elseif is_tipo_dw='P' then
			dw_lista.dataobject 								= 'dw_gestion_indiv_ejec_terreno_pagos'
			if cbx_comi.checked=true then	//(Todas)
				ls_estado_comi1								= 'P'
				ls_estado_comi2								= 'S'
				ls_estado_comi3								= 'N'
			elseif cbx_comi.checked=false then //(Pagadas)
				ls_estado_comi1								= 'P'
				ls_estado_comi2								= 'P'
				ls_estado_comi3								= 'P'
			end if
			dw_lista.settransobject(sqlca)
			dw_lista.getchild('tipo_cobranza',idw_detalle6)
			idw_detalle6.settransobject(sqlca)
			if idw_detalle6.retrieve(is_grupo_cob)=0 then
				idw_detalle6.insertrow(0)
			end if
			ll_tot_reg											= dw_lista.retrieve(id_fecha_hoy,gs_tipo_cob,ls_estado_comi1,ls_estado_comi2,ls_estado_comi3)
		end if
	end if
	
	st_titulo.text													= 'Cartera de Cobranza en Terreno Ejecutivo '
	tab_cobranza.visible										= false
	dw_filtro.setfocus()
	
	dw_select.visible											= false
	st_titulo.y													= 192
	dw_lista.y													= 292
	dw_lista.height												= 1748
	tab_cobranza.y												= 300
	if gs_conexion	= "Parque El Prado" then
		ls_ciudad													= '130'
	else
		ls_ciudad													= '40'
	end if
	
	dw_filtro.SetTransObject(SQLCA)
	dw_filtro.getchild('comuna',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	ll_fila									= dw_filtro.InsertRow(0)
	dw_filtro.setitem(ll_fila,'ciudad',ls_ciudad)
	idw_detalle.retrieve(ls_ciudad)
	
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Tiene cartera Asignada")
	//	close(w_ingreso_gestion_ejecutivo_terreno_cob)
	else
		st_titulo.text												= 'Cartera de Cobranza Ejecutivo en Terreno'
		st_fondo.visible											= true
		hpb_1.visible 											= true
		st_porc.visible 											= true
		hpb_1.Position											= ldb_tot_porc
		for ll_indi=1 to ll_tot_reg
			ls_base												= dw_lista.getitemstring(ll_indi,'base')
			ls_serie												= dw_lista.getitemstring(ll_indi,'serie')
			ll_numero											= dw_lista.getitemnumber(ll_indi,'numero')
			ls_usuario											= dw_lista.getitemstring(ll_indi,'usuario_asignado')
			ldt_fecha												= dw_lista.getitemdatetime(ll_indi,'fecha_crea')
			ll_rut													= dw_lista.getitemnumber(ll_indi,'rut_cliente')
			
			ldb_ing_caja										= f_ing_caja_cob_terreno(ls_base,ls_serie,ll_numero,idt_fec_ini,idt_fec_fin,gs_tipo_cob)
			dw_lista.setitem(ll_indi,'ing_caja',ldb_ing_caja)
			if ldb_ing_caja>0 then
				ls_existe_pago									= 'S'
			else
				ls_existe_pago									= 'N'
			end if
			dw_lista.setitem(ll_indi,'existe_pago',ldb_ing_caja)
			SELECT 	"FALLECIDOS"."NOMBRES"||' '||"FALLECIDOS"."AP_PATERNO"||' '||"FALLECIDOS"."AP_MATERNO"   //AS NOMB_PRIM_FALL
			INTO		:ls_fallecido
			FROM		"FALLECIDOS"
			WHERE	"FALLECIDOS"."BASE" = :ls_base AND
						"FALLECIDOS"."SS" = :ls_serie AND 
						"FALLECIDOS"."CONTRATO" = :ll_numero AND
					 	"FALLECIDOS"."ESTADO_REG" = 'A' 	AND
						"FALLECIDOS"."LLAVE" = (	SELECT	Min("FALLECIDOS"."LLAVE") 
															FROM		"FALLECIDOS"
															WHERE 	"FALLECIDOS"."BASE" = :ls_base AND
																		"FALLECIDOS"."SS" = :ls_serie AND 
																		"FALLECIDOS"."CONTRATO" =  :ll_numero  AND
					 													"FALLECIDOS"."ESTADO_REG" = 'A' )
			USING	sqlca;
			dw_lista.setitem(ll_indi,'nomb_prim_fall',ls_fallecido)
			wf_carga_gestion(ll_indi,ls_usuario,ldt_fecha,ll_rut)
			
			if is_tipo_dw='P' then
				ldt_fec_ini										= datetime(date(em_inicio.text),time('00:00:00'))
				ldt_fec_fin										= datetime(date(em_termino.text),time('00:00:00'))
				ldb_ing_caja_fec								= f_ing_caja_cob_terreno(ls_base,ls_serie,ll_numero,ldt_fec_ini,ldt_fec_fin,gs_tipo_cob)
				SELECT	MAX("INGRESO"."FECHA_PAGO")  
					INTO 		:ldt_fec_max_pago  
					FROM		"INGRESO", "AT_ING_CAJA_COD_MOV"    
					WHERE	"INGRESO"."TIPO_COB" = "AT_ING_CAJA_COD_MOV"."TIPO_COB" and  
								"INGRESO"."TIPO_MOV" = "AT_ING_CAJA_COD_MOV"."TIPO_MOV" and  
								"INGRESO"."CODIGO_OTRO" = "AT_ING_CAJA_COD_MOV"."CODIGO_OTRO" and
								"INGRESO"."BASE" = :ls_base AND  
								"INGRESO"."SERIE" = :ls_serie AND  
								"INGRESO"."CONTRATO" = :ll_numero AND  
								"INGRESO"."PAGO_HIST" = 'A' AND
							"AT_ING_CAJA_COD_MOV"."DEPTO_CARTERA" = 'T'
				USING	sqlca;
				dw_lista.setitem(ll_indi,'fecha_ini',ldt_fec_ini)
				dw_lista.setitem(ll_indi,'fecha_fin',ldt_fec_fin)
				dw_lista.setitem(ll_indi,'monto',ldb_ing_caja_fec)
				dw_lista.setitem(ll_indi,'fec_ult_pago',ldt_fec_max_pago)
				dw_lista.accepttext()
			end if
			
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				st_porc.text										= string(ldb_tot_porc,'#0.##')+" %"
				ldb_tot_porc_aux								= ldb_tot_porc
			end if
			ldb_tot_porc											= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 										= ldb_tot_porc
			dw_lista.accepttext()
		next
		st_fondo.visible											= false
		hpb_1.visible 											= false
		st_porc.visible 											= false
		tab_cobranza.visible									= false
		dw_filtro.setfocus()
	end if
end if
end event

type cb_marcar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 1637
integer y = 2060
integer width = 425
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;long	ll_tot_reg,ll_indi

ll_tot_reg							= dw_lista.rowcount()
if ll_tot_reg>0 then
	if cb_marcar.text				='Marcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'marca',1)
		next
		cb_marcar.text				= 'Desmarcar Todo'

	elseif cb_marcar.text			='Desmarcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'marca',0)
		next
		cb_marcar.text				= 'Marcar Todo'
	end if
	dw_lista.accepttext()
end if
end event

type cb_carta from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 32
integer y = 2164
integer width = 302
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Envio Carta"
end type

event clicked;string	ls_string,ls_clasif,ls_filtro
long	ll_fila,ll_tot_reg,ll_parque,ll_accion,ll_new,ll_tot_filtro

dw_select.accepttext()
dw_lista.accepttext()
ll_tot_reg											= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_string											= "marca = "+string(1)
	ll_fila 												= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila=0 then
		messagebox("Advertencia","Debe Seleccionar Contrato para Asignar")
	else
		if is_visible_dw='N' then
			is_visible_dw							= 'S'
			rb_oculta	.visible						= true
			rb_oculta	.checked						= true
			cbx_filtra.visible						= true
			if gs_conexion	= "Parque El Prado" then
				ll_parque								= 1
			elseif gs_conexion = "Parque La Foresta" then
				ll_parque								= 11
			end if
			dw_select.getchild('clasificacion',idw_detalle5)
			idw_detalle5.settransobject(sqlca)
			if idw_detalle5.retrieve(ll_parque,gs_tipo_cob,gs_tipo_cob)=0 then
				idw_detalle5.insertrow(0)
			end if
			dw_select.settransobject(sqlca)
			dw_select.insertrow(0)
			dw_select.setitem(1,'parque',ll_parque)
			dw_select.accepttext()
			dw_select.visible							= true		//dw_select.visible					= false
			st_titulo.y									= 300			//st_titulo.y							= 192
			dw_lista.y									= 296			//dw_lista.y							= 292
			dw_lista.height								= 1744		//dw_lista.height					= 1748
			tab_cobranza.y								= 412			//tab_cobranza.y					= 300
		end if
		if isvalid(w_imprimir_carta_cobranza) then close(w_imprimir_carta_cobranza)
		ll_parque										= dw_select.getitemnumber(1,'parque')
		gl_cod_parque_cta						= ll_parque
		ls_clasif										= trim(dw_select.getitemstring(1,'clasificacion'))
		if not isnull(ll_parque) and ll_parque>0 and not isnull(ls_clasif) and ls_clasif<>'' then
			ls_filtro									= "marca=1 and cod_parque ="+string(ll_parque)
			dw_lista.SETfilter(ls_filtro)
			dw_lista.filter()
			dw_lista.accepttext()
			ll_tot_filtro								= dw_lista.rowcount()
			if ll_tot_filtro=0 then
				messagebox("Advertencia","No Registra Datos para Envio de Cartas")
			else
				SELECT	"GC_TIPO_CARTA"."ACCION"  
				INTO 		:ll_accion  
				FROM 	"GC_TIPO_CARTA"  
				WHERE	( "GC_TIPO_CARTA"."CLASIFICACION" = :ls_clasif ) AND  
							( "GC_TIPO_CARTA"."PARQUE" = :ll_parque )   
				USING	sqlca;
				ls_filtro									= string(ll_parque)+'~t'+string(ll_accion)+'~t'+ls_clasif
				openwithparm(w_imprimir_carta_cobranza,ls_filtro)
			end if
		else
			if isnull(ll_parque) or ll_parque=0 then
				messagebox("Advertencia","Debe Seleccionar Parque")
				dw_select.setfocus()
				dw_select.setcolumn('parque')
			elseif isnull(ls_clasif) or ls_clasif='' then
				messagebox("Advertencia","Debe Seleccionar Clasificación Carta")
				dw_select.setfocus()
				dw_select.setcolumn('clasificacion')
			end if
		end if
	end if
end if
end event

type cb_actualizar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 2784
integer y = 2304
integer width = 105
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Actualizar &Pagos"
end type

event clicked;SetPointer(HourGlass!)
DECLARE proc_cadena_mora PROCEDURE FOR SP_CADENA_MORA() ;
execute proc_cadena_mora;
DECLARE proc_cadena_mora_estado PROCEDURE FOR sp_cadena_mora_estado();
execute proc_cadena_mora_estado;
DECLARE proc_cadena_mora_lib PROCEDURE FOR sp_cadena_mora_lib();
execute proc_cadena_mora_lib;
DECLARE proc_cadena_mora_porc PROCEDURE FOR sp_cadena_mora_porc();
execute proc_cadena_mora_lib;
DECLARE proc_cadena_mora_pro PROCEDURE FOR sp_cadena_mora_pro();
execute proc_cadena_mora_lib;
SetPointer(Arrow!)
end event

type pb_filtrar from picturebutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 2373
integer y = 52
integer width = 110
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
string disabledname = "LUPA_no.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_ciudad,ls_comuna,ls_filtro
long	ll_tot_reg

dw_filtro.accepttext()
ll_tot_reg							= dw_lista.rowcount()
//wf_filtros()
ls_ciudad								= dw_filtro.getitemstring(1,'ciudad')
ls_comuna							= dw_filtro.getitemstring(1,'comuna') 
if not isnull(ls_ciudad) and ls_ciudad<>'' and not isnull(ls_comuna) and ls_comuna<>'' then
	ls_filtro							= "ciudad='"+ls_ciudad+"' and comuna='"+ls_comuna+"'"
//		if gs_formula<>'' and not isnull(gs_formula) then
//			ls_filtro					= gs_formula+" and cliente_ciudad='"+ls_ciudad+"' and cliente_comuna='"+ls_comuna+"'"
//		else
//		end if
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
else
	if isnull(ls_ciudad) or ls_ciudad='' then
		messagebox("Advertencia","Debe Seleccionar Ciudad")
		dw_filtro.setfocus()
		dw_filtro.setcolumn('ciudad')
	elseif isnull(ls_comuna) or ls_comuna='' then
		messagebox("Advertencia","Debe Seleccionar Comuna")
		dw_filtro.setfocus()
		dw_filtro.setcolumn('comuna')
	end if
end if
tab_cobranza.visible				= false
end event

type cb_grabar_formula from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_mousemove
integer x = 2286
integer y = 2064
integer width = 562
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar/Gra&bar Formula"
end type

event clicked;if isvalid(w_formulas) then close(w_formulas)
open(w_formulas)
end event

type cb_geo from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 343
integer y = 2164
integer width = 398
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Geo-Referencia"
end type

event clicked;long ret
Inet  iinet_base
if dw_lista.rowcount()>0 then
	gi_rut 				= dw_lista.GetItemNumber(il_row,"rut_cliente")
	gs_base				= dw_lista.getitemstring(il_row,"base")
	gs_serie				= dw_lista.getitemstring(il_row,"serie")
	gi_numero			= dw_lista.getitemnumber(il_row,"numero")
	is_estado			= dw_lista.getitemstring(il_row,'estado_gestion')
	ret 					= GetContextService("Internet",iinet_base)
	if ret = -1 then
		messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
		return
	end if
	if gs_conexion	= "Parque El Prado" then
		ret 				= iinet_base.HyperlinkToURL("http://intra.elprado.cl/geomod/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
	else
		ret 				= iinet_base.HyperlinkToURL("http://intra.elprado.cl/geoforesta/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
	end if
	if ret = -1 then
		messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
		return
	end if
end if
end event

type cb_ordenar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_dwnmousemove
integer x = 3378
integer y = 56
integer width = 219
integer height = 88
integer taborder = 40
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

type cb_filtrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_mousemove
integer x = 3602
integer y = 56
integer width = 197
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto

setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
gs_formula				= ''
ll_filas					= dw_lista.rowcount()
gs_formula 				= dw_lista.describe("datawindow.syntax")
ll_largototal				= len(gs_formula)
ll_posini					= Pos(gs_formula, "filter") + 8
ll_posfin					= len("~nfilter~n")
ls_texto					= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin			= ll_indi
		ll_indi				= ll_largototal
	end if
next
ll_resto					= ll_posfin - ll_posini
gs_formula				= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' or ll_posini=0 or ll_posini=8 then
	gs_formula	= ''
end if
end event

type cb_exportar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_mousemove
integer x = 3799
integer y = 56
integer width = 238
integer height = 88
integer taborder = 60
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

type cb_imprimir from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_mousemove
integer x = 3163
integer y = 56
integer width = 210
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

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type cb_ctacte from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 32
integer y = 2064
integer width = 302
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Cte."
end type

event clicked;string ls_base,ls_serie,param
long 	 ll_numero,ll_rut
if il_row > 0 and dw_lista.rowcount()>0 then
	gi_rut 						= dw_lista.GetItemNumber(il_row, "rut_cliente")
	gs_base						= dw_lista.getitemstring(il_row, "base")
	gs_serie						= dw_lista.getitemstring(il_row, "serie")
	gi_numero					= dw_lista.getitemnumber(il_row, "numero")
	is_estado					= dw_lista.getitemstring(il_row,'estado_gestion')
	param    						= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "F","G" // Anexo funeraria
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,param)	
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
	close(w_aviso_mensajes)
else
	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
end if

end event

type cb_historico from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_dwnmousemove
integer x = 718
integer y = 2064
integer width = 247
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "base")
	gs_serie		= dw_lista.getitemstring(il_row, "serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "numero")
	is_estado	= dw_lista.getitemstring(il_row,'estado_gestion')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_cerrar from commandbutton within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4050
integer y = 2064
integer width = 256
integer height = 92
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;SELECT	"TIPO_COBRANZA_TERRENO"
INTO 		:gs_tipo_cob
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING	sqlca;    

close(w_ingreso_gestion_ejecutivo_terreno_cob)
end event

type gb_1 from groupbox within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 3145
integer width = 1161
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_filtro from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 933
integer y = 48
integer width = 1454
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_filtrar_por_comuna"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_ciudad

ls_columna					= dw_filtro.GetColumnName ( )
if ls_columna='ciudad' then
	ls_ciudad					= dw_filtro.getitemstring(1,'ciudad')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle.retrieve(ls_ciudad)
	end if
	if ls_ciudad='999' then
		dw_filtro.setitem(1,'comuna','999')
	end if
	if ls_ciudad='0' then
		dw_filtro.setitem(1,'comuna','0')
	end if
end if
 pb_filtrar.triggerevent(Clicked!)

end event

type gb_3 from groupbox within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 32
integer width = 2496
integer height = 168
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar"
end type

type st_fondo from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 1335
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

type dw_lista from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 32
integer y = 288
integer width = 4270
integer height = 1752
integer taborder = 70
string dataobject = "dw_gestion_indiv_ejec_terreno_pagos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_folio,ll_status,ll_fila,ll_tot_reg,ll_parque
String		ls_tipo_cob,ls_columna,ls_filtro,ls_estado_cadena,ls_pasa,ls_string
Double	ldb_lat_geo,ldb_lon_geo

ls_columna																		= dwo.name
gs_formula																		= ''
if row>0 then
	il_row																			= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
	if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
	if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
	if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
	if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
	if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
	if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
	if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
	ldb_lat_geo																= double(dw_lista.GetItemNumber(il_row,"lat_geo"))
	ldb_lon_geo																= double(dw_lista.GetItemNumber(il_row,"lon_geo"))
	ll_status																	= dw_lista.GetItemNumber(il_row, "status_geo")
	if ll_status>0 then
		cb_geo.enabled													= true
	else
		cb_geo.enabled													= false
	end if
	gi_rut 																	= dw_lista.GetItemNumber(il_row, "rut_cliente")
	gs_base																	= dw_lista.getitemstring(il_row, "base")
	gs_serie																	= dw_lista.getitemstring(il_row, "serie")
	gi_numero																= dw_lista.getitemnumber(il_row, "numero")
	ls_estado_cadena														= dw_lista.getitemstring(il_row, 'estado')
	ls_pasa																	= 'S'
	
	
	if ls_pasa = 'S' then	
		wf_cargar_dw_contrato()
		tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
		tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
		tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
		if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
			ll_folio															= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
			ls_tipo_cob														= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
			tab_cobranza.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
		else
			tab_cobranza.tabpage_3.dw_detalle_pagos.reset()
		end if
		tab_cobranza.tabpage_4.dw_cliente2.retrieve(gi_rut)
		if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
			tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_4.dw_ingreso.reset()
		tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_4.rb_si.checked							= true
		tab_cobranza.tabpage_4.em_fecha_prox.text					= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_4.em_fecha_prox_terre.text			= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		
		tab_cobranza.tabpage_4.dw_ingreso.object.t_8.text			= 'Fecha Compromiso'
		//tab_cobranza.tabpage_4.dw_ingreso.object.t_11.visible		= false
				
		tab_cobranza.tabpage_5.dw_cliente3.retrieve(gi_rut)
		if tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.insertrow(0)
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.reset()
		tab_cobranza.tabpage_5.dw_ingreso_terreno.getchild('estado',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(is_grupo_cob)=0 then
			idw_detalle2.insertrow(0)
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.insertrow(0)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_5.rb_si_terreno.checked						= true
		tab_cobranza.tabpage_5.em_fecha_prox_visita.text					= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.em_fecha_prox_visita_terre.text			= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.dw_ingreso_terreno.object.t_12.text		= 'Fecha Compromiso'
		if gs_base='C' then
			tab_cobranza.tabpage_3.st_6.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
			tab_cobranza.tabpage_3.st_7.visible							= false
			tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= false
			tab_cobranza.tabpage_3.st_8.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= true
			tab_cobranza.tabpage_3.st_3.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
			wf_pos_contrato_isa()
		elseif gs_base='D' or gs_base='P' or gs_base='L' or gs_base='R' then
			tab_cobranza.tabpage_3.st_6.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
			tab_cobranza.tabpage_3.st_7.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= true
			tab_cobranza.tabpage_3.st_8.visible							= false
			tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= false
			tab_cobranza.tabpage_3.st_3.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
			wf_pos_otros_cttos()
		elseif gs_base='O' then
			tab_cobranza.tabpage_3.st_6.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_total.visible			= true
			tab_cobranza.tabpage_3.st_7.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_cuotas.visible		= true
			tab_cobranza.tabpage_3.st_8.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_mantencion.visible	= true
			tab_cobranza.tabpage_3.st_3.visible							= true
			tab_cobranza.tabpage_3.dw_detalle_pagos.visible			= true
			wf_pos_promesa()
		end if	
		if ls_columna='marca' then
			is_visible_tab														= 'N'
			tab_cobranza.visible												= false
		else
			is_visible_tab														= 'S'
			tab_cobranza.visible												= true
		end if
	else
		if gs_tipo_cob='C' then
			messagebox("Advertencia","Recuerde Contrato de be estar V-Vigente o R-Resuelto")
		elseif gs_tipo_cob='M' then
			messagebox("Advertencia","Recuerde Contrato de be estar C-Cancelado")
		elseif gs_tipo_cob='E' then
			messagebox("Advertencia","Recuerde Contrato de be estar V-Vigente")
		end if
	end if
else
	if ls_columna='t_mostrar_todo' then
		ls_filtro			= ''
	elseif ls_columna='t_mora' then
		if gs_tipo_cob='C' then
			ls_filtro		= 'mora_cred > 0'
		elseif gs_tipo_cob='M' then
			ls_filtro		= 'mora_mant >= 5'
		end if
	elseif ls_columna='t_c_pagos' then
		ls_filtro			= "ing_caja>0"	
	elseif ls_columna='t_s_pagos' then
		ls_filtro			= "ing_caja=0"		
	elseif ls_columna='t_pendiente' then
		ls_filtro			= "((isnull( fecha_llamado )) and (isnull( fecha_atencion )))"
	elseif ls_columna='t_gestionado' then
		ls_filtro			= "((not isnull( fecha_llamado )) or (not isnull( fecha_atencion )))"
	elseif ls_columna='t_demanda1' or ls_columna='t_demanda2' then
		ls_filtro			= "estado = 'M' "	
	elseif ls_columna='t_inubicable1' or ls_columna='t_inubicable2' then
		ls_filtro			= "(estado_tele_log = 39 or  estado_aten_log = 38) and estado <> 'M' "
	elseif ls_columna='t_venc_llam_c' or ls_columna='t_venc_llam_n' then
		ls_filtro			= "ante4_mas_fec_comp >= 4 and ing_caja =0 and estado <> 'M' "	
	elseif ls_columna='t_1_falta_llam_c' or ls_columna='t_1_falta_llam_n' then
		ls_filtro			= "fecha_hoy =  ante1_fec_comp and ing_caja =0 and estado <> 'M' "
	elseif ls_columna='t_2_falta_llam_c' or ls_columna='t_2_falta_llam_n' then
		ls_filtro			= "fecha_hoy =  ante2_fec_comp and ing_caja =0 and estado <> 'M' "
	elseif ls_columna='t_3_falta_llam_c' or ls_columna='t_3_falta_llam_n' then
		ls_filtro			= "fecha_hoy =  ante3_fec_comp and ing_caja =0 and estado <> 'M' "
	elseif ls_columna='t_menor_12' or ls_columna='t_menor_12_2' then
		if gs_tipo_cob='C' then
			ls_filtro		= 'ctas_pag_s <= 12'
		elseif gs_tipo_cob='M' then
			ls_filtro		= ''
		end if
	elseif ls_columna='t_filtrar_marca' then
		ll_tot_reg					= dw_lista.rowcount()
		if ll_tot_reg>0 then
			ls_string					= "marca = "+string(1)
			ll_fila 						= dw_lista.find(ls_string, 1, ll_tot_reg)
			if ll_fila=0 then
				messagebox("Advertencia","Debe Seleccionar Contrato para Asignar")
			else
				if is_visible_dw='S' then
					ll_parque			= dw_select.getitemnumber(1,'parque')
					if not isnull(ll_parque) and ll_parque>0 then
						ls_filtro		= "marca=1 and cadena_cod_parque ="+string(ll_parque)
					else
						messagebox("Advertencia","Debe Seleccionar Parque")
						dw_select.setfocus()
						dw_select.setcolumn('parque')
					end if
				else
					ls_filtro			= "marca=1 "
				end if
			end if
		end if
	end if
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.accepttext()
	if dw_lista.rowcount()>0 then 
		dw_lista.setSort("codigo_grupo A, fecha_prox_llamada A, fecha_prox_visita A, numero A");
		dw_lista.sort();
		dw_lista.scrolltorow(1)
	end if
end if
end event

event rowfocuschanged;Long		ll_folio,ll_status
String		ls_tipo_cob,ls_estado_cadena,ls_pasa
Double	ldb_lat_geo,ldb_lon_geo

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
	if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
	if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
	if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
	if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
	if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
	if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
	if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
	ldb_lat_geo						= double(dw_lista.GetItemNumber(il_row,"lat_geo"))
	ldb_lon_geo						= double(dw_lista.GetItemNumber(il_row,"lon_geo"))
	ll_status							= dw_lista.GetItemNumber(il_row, "status_geo")
	if ll_status>0 then
		cb_geo.enabled			= true
	else
		cb_geo.enabled			= false
	end if
	gi_rut 							= dw_lista.GetItemNumber(il_row, "rut_cliente")
	gs_base							= dw_lista.getitemstring(il_row, "base")
	gs_serie							= dw_lista.getitemstring(il_row, "serie")
	gi_numero						= dw_lista.getitemnumber(il_row, "numero")
	ls_estado_cadena				= dw_lista.getitemstring(il_row, 'estado')
	ls_pasa							= 'S'
	if ls_pasa = 'S' then	
		wf_cargar_dw_contrato()//tab_cobranza.tabpage_1.dw_contrato.retrieve(gi_rut)
		tab_cobranza.tabpage_1.dw_cliente.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_cobranza.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_carta.retrieve(gi_rut)
		tab_cobranza.tabpage_2.dw_publico.retrieve(gi_rut)
		tab_cobranza.tabpage_3.dw_detalle_cuotas.retrieve(gs_serie,gi_numero,gs_base)
		tab_cobranza.tabpage_3.dw_detalle_mantencion.retrieve(gs_serie,gi_numero,gs_base)
		if tab_cobranza.tabpage_3.dw_detalle_total.retrieve(gs_serie,gi_numero,gs_base)>0 then
			ll_folio		= tab_cobranza.tabpage_3.dw_detalle_total.getitemnumber(1,'folio')
			ls_tipo_cob	= tab_cobranza.tabpage_3.dw_detalle_total.getitemstring(1,'tipo_cob')
			tab_cobranza.tabpage_3.dw_detalle_pagos.retrieve(ll_folio,ls_tipo_cob)
		else
			tab_cobranza.tabpage_3.dw_detalle_pagos.reset()
		end if
		tab_cobranza.tabpage_4.dw_cliente2.retrieve(gi_rut)
		if tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.insertrow(0)
			tab_cobranza.tabpage_4.dw_ultima_cobranza_telefonica.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_4.dw_ingreso.reset()
		tab_cobranza.tabpage_4.dw_ingreso.insertrow(0)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_4.dw_ingreso.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_4.rb_si.checked								= true
		tab_cobranza.tabpage_4.em_fecha_prox.text						= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_4.em_fecha_prox_terre.text				= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.dw_cliente3.retrieve(gi_rut)
		if tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.retrieve(gi_rut)=0 then
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.insertrow(0)
			tab_cobranza.tabpage_5.dw_ultima_cobranza_visita.setitem(1,'glosa','NO REGISTRA COBRANZA TELEFONICA')
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.reset()
		tab_cobranza.tabpage_5.dw_ingreso_terreno.getchild('estado',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(is_grupo_cob)=0 then
			idw_detalle2.insertrow(0)
		end if
		tab_cobranza.tabpage_5.dw_ingreso_terreno.insertrow(0)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'usuario',gs_user)
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setitem(1,'fecha',gdt_fec_sistema)
		tab_cobranza.tabpage_5.rb_si_terreno.checked					= true
		tab_cobranza.tabpage_5.em_fecha_prox_visita.text				= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		tab_cobranza.tabpage_5.em_fecha_prox_visita_terre.text		= string(RelativeDate(date(gdt_fec_sistema), 5),"dd/mm/yyyy")
		if gs_base='C' then
			tab_cobranza.tabpage_3.st_6.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_total.visible				= true
			tab_cobranza.tabpage_3.st_7.visible								= false
			tab_cobranza.tabpage_3.dw_detalle_cuotas.visible			= false
			tab_cobranza.tabpage_3.st_8.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_mantencion.visible		= true
			tab_cobranza.tabpage_3.st_3.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_pagos.visible				= true
			wf_pos_contrato_isa()
		elseif gs_base='D' or gs_base='P' or gs_base='L' or gs_base='R' then
			tab_cobranza.tabpage_3.st_6.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_total.visible				= true
			tab_cobranza.tabpage_3.st_7.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_cuotas.visible			= true
			tab_cobranza.tabpage_3.st_8.visible								= false
			tab_cobranza.tabpage_3.dw_detalle_mantencion.visible		= false
			tab_cobranza.tabpage_3.st_3.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_pagos.visible				= true
			wf_pos_otros_cttos()
		elseif gs_base='O' then
			tab_cobranza.tabpage_3.st_6.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_total.visible				= true
			tab_cobranza.tabpage_3.st_7.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_cuotas.visible			= true
			tab_cobranza.tabpage_3.st_8.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_mantencion.visible		= true
			tab_cobranza.tabpage_3.st_3.visible								= true
			tab_cobranza.tabpage_3.dw_detalle_pagos.visible				= true
			wf_pos_promesa()
		end if
		if is_visible_tab='N' then
			tab_cobranza.visible													= false
		elseif is_visible_tab='S' then
			tab_cobranza.visible													= true
		end if
	else
		if gs_tipo_cob='C' then
			messagebox("Advertencia","Recuerde Contrato debe estar V-Vigente o R-Resuelto")
		elseif gs_tipo_cob='M' then
			messagebox("Advertencia","Recuerde Contrato debe estar C-Cancelado")
		elseif gs_tipo_cob='E' then
			messagebox("Advertencia","Recuerde Contrato debe estar V-Vigente")
		end if
	end if
end if
end event

type tab_cobranza from uo_atencion_terreno within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 667
integer y = 308
integer taborder = 80
end type

event selectionchanged;call super::selectionchanged;CHOOSE CASE tab_cobranza.SelectedTab
	CASE 4
		tab_cobranza.tabpage_4.dw_ingreso.setfocus()
	CASE 5
		tab_cobranza.tabpage_5.dw_ingreso_terreno.setfocus()
END CHOOSE
end event

type dw_select from datawindow within w_ingreso_gestion_ejecutivo_terreno_cob
event ue_mousemove pbm_dwnmousemove
boolean visible = false
integer x = 27
integer y = 180
integer width = 2469
integer height = 96
integer taborder = 60
string title = "none"
string dataobject = "dwe_select_parque_clasif_at"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;string	ls_columna
ls_columna				= dwo.name
if ls_columna='clasificacion_t' then
//	st_click.visible	= true
else
//	st_click.visible	= false
end if
end event

event clicked;String	ls_columna,ls_filtro,ls_clasif
Long		ll_cod_parque

dw_select.accepttext()
ls_columna							= dwo.name
if ls_columna='clasificacion_t' then
	ll_cod_parque					= dw_select.getitemnumber(1,'parque')
	ls_clasif							= trim(dw_select.getitemstring(1,'clasificacion'))
	if ll_cod_parque>0 and not isnull(ls_clasif) and ls_clasif<>'' then
		ls_filtro						= string(ll_cod_parque)+'~t'+ls_clasif
		openwithparm(w_significado_tipo_carta,ls_filtro)
	else
		if ll_cod_parque=0 or isnull(ll_cod_parque) then
			messagebox("Advertencia","Debe Seleccionar Parque")
			dw_select.setfocus()
			dw_select.setcolumn('parque')
		elseif ls_clasif='' or isnull(ls_clasif) then
			messagebox("Advertencia","Debe Seleccionar Tipo Carta")
			dw_select.setfocus()
			dw_select.setcolumn('clasificacion')
		end if
	end if
end if
end event

event itemchanged;String		ls_columna,ls_clasif,ls_fecha,ls_filtro,ls_string,ls_nomb_parque
Long		ll_parque,ll_month,ll_tot_reg,ll_fila,ll_tot_filtro,ll_res
Date		ld_fecha

this.accepttext()
dw_lista.accepttext()
ls_columna							= dwo.name
ll_tot_reg							= dw_lista.rowcount()
ls_string								= "marca = "+string(1)
ll_fila 									= dw_lista.find(ls_string, 1, ll_tot_reg)

if ls_columna='parque' then
	ll_parque							= dw_select.getitemnumber(1,'parque')
	gl_cod_parque_cta			= ll_parque
	if ll_parque>0 then
		idw_detalle5.retrieve(ll_parque,gs_tipo_cob,gs_tipo_cob)
		if not isnull(gs_formula) and gs_formula<>'' then
			if ll_fila=0 then
				ls_filtro				= gs_formula+" and cod_parque ="+string(ll_parque)
			else
				ls_filtro				= gs_formula+" and marca=1 and cod_parque ="+string(ll_parque)
			end if
		else
			if ll_fila=0 then
				ls_filtro				= "cod_parque ="+string(ll_parque)
			else
				ls_filtro				= "marca=1 and cod_parque ="+string(ll_parque)
			end if
		end if
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
		ll_tot_filtro					= dw_lista.rowcount()
		if ll_tot_filtro=0 then
			SELECT	"COD_PARQ"."NOMBRE"  
			INTO		:ls_nomb_parque  
			FROM		"COD_PARQ"  
			WHERE	"COD_PARQ"."CODIGO" = :ll_parque
			USING	sqlca;
			messagebox("Advertencia","No Registra Selección de Envio de Carta Parque "+ls_nomb_parque)
		end if
	end if
elseif ls_columna='clasificacion' then
	ll_parque							= dw_select.getitemnumber(1,'parque')
	ls_clasif							= dw_select.getitemstring(1,'clasificacion')
	if not isnull(gs_formula) and gs_formula<>'' then
		if ll_fila=0 then
			ls_filtro						= gs_formula+" and cod_parque ="+string(ll_parque)
		else
			ls_filtro						= gs_formula+" and marca=1 and cod_parque ="+string(ll_parque)
		end if
	else
		if ll_fila=0 then
			ls_filtro						= "cod_parque ="+string(ll_parque)
		else
			ls_filtro						= "marca=1 and cod_parque ="+string(ll_parque)
		end if
	end if
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.accepttext()
	ll_tot_filtro						= dw_lista.rowcount()
	if ll_tot_filtro=0 then
		SELECT	"COD_PARQ"."NOMBRE"  
		INTO		:ls_nomb_parque  
		FROM		"COD_PARQ"  
		WHERE	"COD_PARQ"."CODIGO" = :ll_parque
		USING	sqlca;
		messagebox("Advertencia","No Registra Selección de Envio de Carta Parque "+ls_nomb_parque)
	end if
	if ls_clasif='CG' or ls_clasif='D8' or ls_clasif='PS_D' then
		ld_fecha						= date(gdt_fec_sistema)
		ll_month						= month(ld_fecha)
		if ll_month=1 then
			ls_fecha					= '31/01/'+string(year(ld_fecha),"0000")
		elseif ll_month=2 then
			ls_fecha					= '28/02/'+string(year(ld_fecha),"0000")
		elseif ll_month=3 then
			ls_fecha					= '31/03/'+string(year(ld_fecha),"0000")
		elseif ll_month=4 then
			ls_fecha					= '30/04/'+string(year(ld_fecha),"0000")
		elseif ll_month=5 then
			ls_fecha					= '31/05/'+string(year(ld_fecha),"0000")
		elseif ll_month=6 then
			ls_fecha					= '30/06/'+string(year(ld_fecha),"0000")
		elseif ll_month=7 then
			ls_fecha					= '31/07/'+string(year(ld_fecha),"0000")
		elseif ll_month=8 then
			ls_fecha					= '31/08/'+string(year(ld_fecha),"0000")
		elseif ll_month=9 then
			ls_fecha					= '30/09/'+string(year(ld_fecha),"0000")
		elseif ll_month=10 then
			ls_fecha					= '31/10/'+string(year(ld_fecha),"0000")
		elseif ll_month=11 then
			ls_fecha					= '30/11/'+string(year(ld_fecha),"0000")
		elseif ll_month=12 then
			ls_fecha					= '31/12/'+string(year(ld_fecha),"0000")
		end if
	end if
end if

end event

type cbx_filtra from checkbox within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 2560
integer y = 184
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtra Repetión Últ Carta "
end type

event clicked;string	ls_clasif,ls_filtro
long	ll_tot_reg,ll_parque

dw_lista.accepttext()
dw_select.accepttext()
ll_tot_reg								= dw_lista.rowcount()
ls_clasif									= trim(dw_select.getitemstring(1,'clasificacion'))
ll_parque									= dw_select.getitemnumber(1,'parque')
if ll_tot_reg>0 then
	if cbx_filtra.checked=true then
		if not isnull(ls_clasif) and ls_clasif<>'' then
			wf_filtros()
			if not isnull(gs_formula) and gs_formula<>'' then
				ls_filtro					= gs_formula+" and ult_clasificacion_envio_carta<>'"+ls_clasif+"'"
			else
				ls_filtro					= "ult_clasificacion_envio_carta<>'"+ls_clasif+"'"
			end if
			dw_lista.SETfilter(ls_filtro)
			dw_lista.filter()
			dw_lista.accepttext()
		else
			messagebox("Advertencia","Debe Seleccionar Clasificación Carta")
			dw_select.setfocus()
			dw_select.setcolumn('clasificacion')
		end if
	else
		ls_filtro							= "marca=1 and cod_parque ="+string(ll_parque)
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	end if
end if
	
end event

type rb_oculta from radiobutton within w_ingreso_gestion_ejecutivo_terreno_cob
boolean visible = false
integer x = 3168
integer y = 192
integer width = 539
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ocultar Filtro Cartas"
end type

event clicked;string	ls_filtro

dw_select.reset()
dw_select.visible		= false
rb_oculta.visible		= false
rb_oculta.checked		= false
cbx_filtra.visible		= false
st_titulo.y				= 192
dw_lista.y				= 292
dw_lista.height			= 1748
tab_cobranza.y			= 300
ls_filtro					= ''
is_visible_dw			= 'N'
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.accepttext()
tab_cobranza.visible	= false
dw_filtro.setfocus()
end event

type st_titulo from statictext within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 32
integer y = 176
integer width = 3374
integer height = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4407
integer y = 264
integer width = 955
integer height = 288
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217739
string text = "Rango Fecha"
end type

type em_termino from editmask within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4914
integer y = 428
integer width = 315
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type em_inicio from editmask within w_ingreso_gestion_ejecutivo_terreno_cob
integer x = 4466
integer y = 428
integer width = 315
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

