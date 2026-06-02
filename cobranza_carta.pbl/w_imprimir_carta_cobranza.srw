forward
global type w_imprimir_carta_cobranza from window
end type
type dw_sicom from datawindow within w_imprimir_carta_cobranza
end type
type dw_d8 from datawindow within w_imprimir_carta_cobranza
end type
type em_zoom from editmask within w_imprimir_carta_cobranza
end type
type st_2 from statictext within w_imprimir_carta_cobranza
end type
type cb_preview from commandbutton within w_imprimir_carta_cobranza
end type
type st_1 from statictext within w_imprimir_carta_cobranza
end type
type st_nro_pag from statictext within w_imprimir_carta_cobranza
end type
type pb_5 from picturebutton within w_imprimir_carta_cobranza
end type
type pb_4 from picturebutton within w_imprimir_carta_cobranza
end type
type pb_3 from picturebutton within w_imprimir_carta_cobranza
end type
type pb_2 from picturebutton within w_imprimir_carta_cobranza
end type
type cb_imprimir from commandbutton within w_imprimir_carta_cobranza
end type
type cb_cerrar from commandbutton within w_imprimir_carta_cobranza
end type
type dw_carta from datawindow within w_imprimir_carta_cobranza
end type
type gb_2 from groupbox within w_imprimir_carta_cobranza
end type
end forward

global type w_imprimir_carta_cobranza from window
integer width = 3584
integer height = 2116
boolean titlebar = true
string title = "Imprimir Carta"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_sicom dw_sicom
dw_d8 dw_d8
em_zoom em_zoom
st_2 st_2
cb_preview cb_preview
st_1 st_1
st_nro_pag st_nro_pag
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_carta dw_carta
gb_2 gb_2
end type
global w_imprimir_carta_cobranza w_imprimir_carta_cobranza

type variables
Long		il_cod_parque,il_cod_accion,il_tot_reg,il_codigo_accion,il_corr_fin
String	is_clasif,is_filtro
Double	idb_descuento
end variables

forward prototypes
public subroutine wf_cargar_gc ()
public subroutine wf_cargar_carta_at_terreno ()
end prototypes

public subroutine wf_cargar_gc ();Long		ll_tot_reg,ll_indi,ll_estado_reg,ll_cod_parque,ll_rut,ll_new,ll_fallecido,&
			ll_capacidad,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,ll_total_pagado,&
			ll_suma_1,ll_deuda_cred
String		ls_base,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc_p,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_poblacion,ls_comuna,ls_ciudad,&
			ls_serie,ls_estado_ctto,ls_uso,ls_area,ls_sector,ls_sepultura,ls_fecha,&
			ls_estado_titular
datetime	ldt_fecha_ctto,ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fecha_hoy,ld_fecha_prox_envio
Double	ll_numero

SetPointer(HourGlass!)
ll_suma_1					= 1
ldt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_tot_reg					= w_asignar_envio_carta.dw_lista.rowcount()
SELECT	sysdate	INTO :gdt_fec_sistema	FROM "TASA"	WHERE "TASA"."LOOK" = 1 ;
for ll_indi=1 to ll_tot_reg
	ll_estado_reg			= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'estado_reg')
	if ll_estado_reg=0 then
		ls_base				= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'base')
		ls_serie				= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'serie')
		ll_numero			= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'numero')
		ll_cod_parque		= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'parque')
		ll_rut					= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'rut')
		ls_dv					= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'dv')
		ls_nombre			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'nombre')
		ls_ap_pat			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'a_paterno')
		ls_ap_mat			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'a_materno')
		ls_tipo_via			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'tipo_via_descripcion')
		ls_direc_p			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'direccion_p')
		ls_nro_part			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'numero_particular')
		ls_depto_part		= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'depto_particular')
		ls_block_part		= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'block_particular')
		ls_poblacion		= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'poblacion')
		ls_comuna			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'comuna_descripcion')
		ls_ciudad			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'ciudad_descripcion')
		ls_estado_ctto		= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'estado_contrato')
		ldt_fecha_ctto		= w_asignar_envio_carta.dw_lista.getitemdatetime(ll_indi,'fecha_contrato')
		ll_total_pagado	= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'tot_pagado')
		if is_clasif<>'A1' and is_clasif<>'B1' and is_clasif<>'A6' and is_clasif<>'B6' and &
			is_clasif<>'A7' and is_clasif<>'B7' and is_clasif<>'A2' and is_clasif<>'B2' and &
			is_clasif<>'A3' and is_clasif<>'C19' and is_clasif<>'C20' then
			ls_uso			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'uso')
		else
			ls_uso			= ''
		end if
		ll_fallecido		= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'fallecidos')
		ls_area				= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'area')
		ls_sector			= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'sector')
		ls_sepultura		= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'sepultura')
		ll_capacidad		= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'capacidad')
		ll_mora_cred		= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'mora_cred')
		ll_dias_mora_cred	= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'dias_mora_cred')
		ldt_fec_venc_cred	= w_asignar_envio_carta.dw_lista.getitemdatetime(ll_indi,'fecha_venc_cred')
		ll_mora_mant		= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'mora_mant')
		ll_dias_mora_mant	= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'dias_mora_mant')
		ldt_fec_venc_mant	= w_asignar_envio_carta.dw_lista.getitemdatetime(ll_indi,'fecha_venc_mant')
		ls_estado_titular	= w_asignar_envio_carta.dw_lista.getitemstring(ll_indi,'estado_titular')
		if isnull(ls_area) then ls_area=''
		if is_clasif='SIC_1' or is_clasif='SIC_2' or is_clasif='SIC_3' then
			ll_deuda_cred	= w_asignar_envio_carta.dw_lista.getitemnumber(ll_indi,'total_deuda_cred')
		end if
		ll_new				= dw_carta.insertrow(0)
		dw_carta.scrolltorow(ll_new)
		dw_carta.setitem(ll_new,'clasificacion',is_clasif)
		dw_carta.setitem(ll_new,'fecha_creacion',gdt_fec_sistema)
		dw_carta.setitem(ll_new,'usuario_creador',gs_user)
		dw_carta.setitem(ll_new,'cod_accion',il_cod_accion)
		dw_carta.setitem(ll_new,'correlativo',il_corr_fin + ll_suma_1)
		dw_carta.setitem(ll_new,'fecha_carta_envio',ldt_fecha_hoy)
		dw_carta.setitem(ll_new,'estado_titular',ls_estado_titular)
		dw_carta.setitem(ll_new,'total_pagado',ll_total_pagado)
		if is_clasif='SIC_1' or is_clasif='SIC_2' or is_clasif='SIC_3' then
			dw_carta.setitem(ll_new,'total_deuda_cred',ll_deuda_cred)
		end if
		ll_suma_1 ++
		if (is_clasif='CG' or is_clasif='D8' or is_clasif='PS_D') and isvalid(w_asignar_envio_carta) then
			dw_carta.setitem(ll_new,'fecha_plazo_cliente',date(w_asignar_envio_carta.em_fec_ini.text))
		end if
		if ll_cod_parque=1 or ll_cod_parque=102 or ll_cod_parque=103 then
			ls_fecha			= 'Santiago, '
		elseif ll_cod_parque=11 then
			ls_fecha			= 'La Serena, '
		end if
		ls_fecha				= ls_fecha + string(day(date(ldt_fecha_hoy)),"00")+' de '
		if month(date(ldt_fecha_hoy)) = 1 then 
			ls_fecha			= ls_fecha + 'Enero '
		elseif month(date(ldt_fecha_hoy)) = 2 then 
			ls_fecha			= ls_fecha + 'Febrero '
		elseif month(date(ldt_fecha_hoy)) = 3 then 
			ls_fecha			= ls_fecha + 'Marzo ' 
		elseif month(date(ldt_fecha_hoy)) = 4 then 
			ls_fecha			= ls_fecha + 'Abril ' 
		elseif month(date(ldt_fecha_hoy)) = 5 then 
			ls_fecha			= ls_fecha + 'Mayo ' 
		elseif month(date(ldt_fecha_hoy)) = 6 then 
			ls_fecha			= ls_fecha + 'Junio ' 
		elseif month(date(ldt_fecha_hoy)) = 7 then 
			ls_fecha			= ls_fecha + 'Julio ' 
		elseif month(date(ldt_fecha_hoy)) = 8 then 
			ls_fecha			= ls_fecha + 'Agosto '
		elseif month(date(ldt_fecha_hoy)) = 9 then 
			ls_fecha			= ls_fecha + 'Septiembre ' 
		elseif month(date(ldt_fecha_hoy)) = 10 then 
			ls_fecha			= ls_fecha + 'Octubre '
		elseif month(date(ldt_fecha_hoy)) = 11 then 
			ls_fecha			= ls_fecha + 'Noviembre '
		elseif month(date(ldt_fecha_hoy)) = 12 then 
			ls_fecha			= ls_fecha + 'Diciembre '
		end if
		ls_fecha				= ls_fecha + 'de '+string(year( date(ldt_fecha_hoy) ),"0000")
		ls_fecha				= trim(ls_fecha)
		dw_carta.setitem(ll_new,'fecha_carta_envio_texto',ls_fecha)
		dw_carta.setitem(ll_new,'estado_contrato',ls_estado_ctto)
		dw_carta.setitem(ll_new,'fecha_contrato',ldt_fecha_ctto)
		dw_carta.setitem(ll_new,'uso',ls_uso)
		dw_carta.setitem(ll_new,'fallecidos',ll_fallecido)
		dw_carta.setitem(ll_new,'area',ls_area)
		dw_carta.setitem(ll_new,'sector',ls_sector)
		dw_carta.setitem(ll_new,'sepultura',ls_sepultura)
		dw_carta.setitem(ll_new,'capacidad',ll_capacidad)
		dw_carta.setitem(ll_new,'mora_cred',ll_mora_cred)
		dw_carta.setitem(ll_new,'dias_mora_cred',ll_dias_mora_cred)
		dw_carta.setitem(ll_new,'fecha_venc_cred',ldt_fec_venc_cred)
		dw_carta.setitem(ll_new,'mora_mant',ll_mora_mant)
		dw_carta.setitem(ll_new,'dias_mora_mant',ll_dias_mora_mant)
		dw_carta.setitem(ll_new,'fecha_venc_mant',ldt_fec_venc_mant)
		ld_fecha_prox_envio	= datetime(RelativeDate(date(gdt_fec_sistema), 200),time('00:00:00'))
		dw_carta.setitem(ll_new,'fecha_prox_envio',ld_fecha_prox_envio)
		dw_carta.setitem(ll_new,'cod_parque',ll_cod_parque)
		dw_carta.setitem(ll_new,'nombre_cliente',ls_nombre)
		dw_carta.setitem(ll_new,'ap_paterno_cliente',ls_ap_pat)
		dw_carta.setitem(ll_new,'ap_materno_cliente',ls_ap_mat)
		dw_carta.setitem(ll_new,'base',ls_base)
		dw_carta.setitem(ll_new,'serie',ls_serie)
		dw_carta.setitem(ll_new,'numero',ll_numero)
		dw_carta.setitem(ll_new,'rut_cliente',ll_rut)
		dw_carta.setitem(ll_new,'tipo_via',ls_tipo_via)
		dw_carta.setitem(ll_new,'direccion_part',ls_direc_p)
		dw_carta.setitem(ll_new,'nro_part',ls_nro_part)
		dw_carta.setitem(ll_new,'depto_part',ls_depto_part)
		dw_carta.setitem(ll_new,'block_part',ls_block_part)
		dw_carta.setitem(ll_new,'poblacion_part',ls_poblacion)
		dw_carta.setitem(ll_new,'comuna_part',ls_comuna)
		dw_carta.setitem(ll_new,'ciudad_part',ls_ciudad)
	end if	
next
dw_carta.accepttext()
SetPointer(Arrow!)
end subroutine

public subroutine wf_cargar_carta_at_terreno ();Long		ll_tot_reg,ll_indi,ll_estado_reg,ll_cod_parque,ll_rut,ll_new,ll_fallecido,&
			ll_capacidad,ll_mora_cred,ll_mora_mant,ll_dias_mora_cred,ll_dias_mora_mant,ll_total_pagado,&
			ll_suma_1,ll_deuda_cred
String		ls_base,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc_p,&
			ls_nro_part,ls_depto_part,ls_block_part,ls_poblacion,ls_comuna,ls_ciudad,&
			ls_serie,ls_estado_ctto,ls_uso,ls_area,ls_sector,ls_sepultura,ls_fecha,&
			ls_estado_titular,ls_empresa
datetime	ldt_fecha_ctto,ldt_fec_venc_cred,ldt_fec_venc_mant,ldt_fecha_hoy,ld_fecha_prox_envio
Double	ll_numero

SetPointer(HourGlass!)
ll_suma_1							= 1
ldt_fecha_hoy						= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_tot_reg							= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.rowcount()
SELECT	sysdate	
INTO		:gdt_fec_sistema
FROM		"TASA"
WHERE	"TASA"."LOOK" = 1 ;
for ll_indi=1 to ll_tot_reg
	if ll_estado_reg=0 then
		ls_base						= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'base')
		ls_serie						= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'serie')
		ll_numero					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'numero')
		ll_cod_parque				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'cod_parque')
		ll_rut							= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'rut_cliente')
		ls_dv							= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'dv')
		ls_nombre					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'nombre')
		ls_ap_pat					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'a_paterno')
		ls_ap_mat					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'a_materno')
		ls_tipo_via					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'descripcion')
		ls_direc_p					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'direccion_p')
		ls_nro_part					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'numero_particular')
		ls_depto_part				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'depto_particular')
		ls_block_part				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'block_particular')
		ls_poblacion					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'poblacion')
		ls_comuna					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'sigla_comuna')
		ls_ciudad						= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'sigla_ciudad')
		ls_estado_ctto				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'estado')
		ldt_fecha_ctto				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemdatetime(ll_indi,'fecha')
		ll_total_pagado				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'tot_pagado')
		ls_uso						= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'uso')
		ll_fallecido					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'fallecidos')
		ls_area						= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'area')
		ls_sector						= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'sector')
		ls_sepultura					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'sepultura')
		ll_capacidad					= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'capacidad')
		ll_mora_cred				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'mora_cred')
		ll_dias_mora_cred			= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'dias_mora_cred')
		ldt_fec_venc_cred			= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemdatetime(ll_indi,'fecha_venc_cred')
		ll_mora_mant				= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'mora_mant')
		ll_dias_mora_mant		= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemnumber(ll_indi,'dias_mora_mant')
		ldt_fec_venc_mant			= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemdatetime(ll_indi,'fecha_venc_mant')
		ls_estado_titular			= w_ingreso_gestion_ejecutivo_terreno_cob.dw_lista.getitemstring(ll_indi,'estado_titular')
		ll_new						= dw_carta.insertrow(0)
		dw_carta.scrolltorow(ll_new)
		dw_carta.setitem(ll_new,'clasificacion',is_clasif)
		dw_carta.setitem(ll_new,'fecha_creacion',gdt_fec_sistema)
		dw_carta.setitem(ll_new,'usuario_creador',gs_user)
		dw_carta.setitem(ll_new,'cod_accion',il_cod_accion)
		dw_carta.setitem(ll_new,'correlativo',il_corr_fin + ll_suma_1)
		dw_carta.setitem(ll_new,'fecha_carta_envio',ldt_fecha_hoy)
		dw_carta.setitem(ll_new,'estado_titular',ls_estado_titular)
		dw_carta.setitem(ll_new,'total_pagado',ll_total_pagado)
		if is_clasif='SIC_1' or is_clasif='SIC_2' or is_clasif='SIC_3' then
			dw_carta.setitem(ll_new,'total_deuda_cred',ll_deuda_cred)
		end if
		ll_suma_1 ++
		if ll_cod_parque=1 or ll_cod_parque=102 or ll_cod_parque=103 then
			ls_fecha					= 'Santiago, '
		elseif ll_cod_parque=11 then
			ls_fecha					= 'La Serena, '
		end if
		ls_fecha						= ls_fecha + string(day(date(ldt_fecha_hoy)),"00")+' de '
		if month(date(ldt_fecha_hoy)) = 1 then 
			ls_fecha					= ls_fecha + 'Enero '
		elseif month(date(ldt_fecha_hoy)) = 2 then 
			ls_fecha					= ls_fecha + 'Febrero '
		elseif month(date(ldt_fecha_hoy)) = 3 then 
			ls_fecha					= ls_fecha + 'Marzo ' 
		elseif month(date(ldt_fecha_hoy)) = 4 then 
			ls_fecha					= ls_fecha + 'Abril ' 
		elseif month(date(ldt_fecha_hoy)) = 5 then 
			ls_fecha					= ls_fecha + 'Mayo ' 
		elseif month(date(ldt_fecha_hoy)) = 6 then 
			ls_fecha					= ls_fecha + 'Junio ' 
		elseif month(date(ldt_fecha_hoy)) = 7 then 
			ls_fecha					= ls_fecha + 'Julio ' 
		elseif month(date(ldt_fecha_hoy)) = 8 then 
			ls_fecha					= ls_fecha + 'Agosto '
		elseif month(date(ldt_fecha_hoy)) = 9 then 
			ls_fecha					= ls_fecha + 'Septiembre ' 
		elseif month(date(ldt_fecha_hoy)) = 10 then 
			ls_fecha					= ls_fecha + 'Octubre '
		elseif month(date(ldt_fecha_hoy)) = 11 then 
			ls_fecha					= ls_fecha + 'Noviembre '
		elseif month(date(ldt_fecha_hoy)) = 12 then 
			ls_fecha					= ls_fecha + 'Diciembre '
		end if
		ls_fecha						= ls_fecha + 'de '+string(year( date(ldt_fecha_hoy) ),"0000")
		ls_fecha						= trim(ls_fecha)
		dw_carta.setitem(ll_new,'fecha_carta_envio_texto',ls_fecha)
		dw_carta.setitem(ll_new,'estado_contrato',ls_estado_ctto)
		dw_carta.setitem(ll_new,'fecha_contrato',ldt_fecha_ctto)
		dw_carta.setitem(ll_new,'uso',ls_uso)
		dw_carta.setitem(ll_new,'fallecidos',ll_fallecido)
		dw_carta.setitem(ll_new,'area',ls_area)
		dw_carta.setitem(ll_new,'sector',ls_sector)
		dw_carta.setitem(ll_new,'sepultura',ls_sepultura)
		dw_carta.setitem(ll_new,'capacidad',ll_capacidad)
		dw_carta.setitem(ll_new,'mora_cred',ll_mora_cred)
		dw_carta.setitem(ll_new,'dias_mora_cred',ll_dias_mora_cred)
		dw_carta.setitem(ll_new,'fecha_venc_cred',ldt_fec_venc_cred)
		dw_carta.setitem(ll_new,'mora_mant',ll_mora_mant)
		dw_carta.setitem(ll_new,'dias_mora_mant',ll_dias_mora_mant)
		dw_carta.setitem(ll_new,'fecha_venc_mant',ldt_fec_venc_mant)
		ld_fecha_prox_envio		= datetime(RelativeDate(date(gdt_fec_sistema), 200),time('00:00:00'))
		dw_carta.setitem(ll_new,'fecha_prox_envio',ld_fecha_prox_envio)
		dw_carta.setitem(ll_new,'cod_parque',ll_cod_parque)
		dw_carta.setitem(ll_new,'nombre_cliente',ls_nombre)
		dw_carta.setitem(ll_new,'ap_paterno_cliente',ls_ap_pat)
		dw_carta.setitem(ll_new,'ap_materno_cliente',ls_ap_mat)
		dw_carta.setitem(ll_new,'base',ls_base)
		dw_carta.setitem(ll_new,'serie',ls_serie)
		dw_carta.setitem(ll_new,'numero',ll_numero)
		dw_carta.setitem(ll_new,'rut_cliente',ll_rut)
		dw_carta.setitem(ll_new,'tipo_via',ls_tipo_via)
		dw_carta.setitem(ll_new,'direccion_part',ls_direc_p)
		dw_carta.setitem(ll_new,'nro_part',ls_nro_part)
		dw_carta.setitem(ll_new,'depto_part',ls_depto_part)
		dw_carta.setitem(ll_new,'block_part',ls_block_part)
		dw_carta.setitem(ll_new,'poblacion_part',ls_poblacion)
		dw_carta.setitem(ll_new,'comuna_part',ls_comuna)
		dw_carta.setitem(ll_new,'ciudad_part',ls_ciudad)
	end if	
next
dw_carta.accepttext()
SetPointer(Arrow!)
end subroutine

on w_imprimir_carta_cobranza.create
this.dw_sicom=create dw_sicom
this.dw_d8=create dw_d8
this.em_zoom=create em_zoom
this.st_2=create st_2
this.cb_preview=create cb_preview
this.st_1=create st_1
this.st_nro_pag=create st_nro_pag
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_carta=create dw_carta
this.gb_2=create gb_2
this.Control[]={this.dw_sicom,&
this.dw_d8,&
this.em_zoom,&
this.st_2,&
this.cb_preview,&
this.st_1,&
this.st_nro_pag,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_carta,&
this.gb_2}
end on

on w_imprimir_carta_cobranza.destroy
destroy(this.dw_sicom)
destroy(this.dw_d8)
destroy(this.em_zoom)
destroy(this.st_2)
destroy(this.cb_preview)
destroy(this.st_1)
destroy(this.st_nro_pag)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_carta)
destroy(this.gb_2)
end on

event open;Datetime	ldt_fecha_ult
Date		ld_fecha_ult, ld_fecha_sist
Long		ll_resp

connect using Trans_1;
if isvalid(w_asignar_envio_carta) or isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
	gf_centrar(w_imprimir_carta_cobranza)
	il_cod_parque					= long(substr(1,1,Message.StringParm))
	il_cod_accion					= long(substr(1,2,Message.StringParm))
	is_clasif							= String(substr(1,3,Message.StringParm))
	SELECT	MAX("GC_CORRELATIVO"."FECHA")
	INTO 		:ldt_fecha_ult
	FROM 	"GC_CORRELATIVO"
	WHERE	"COD_PARQUE" = :il_cod_parque
	USING	sqlca;

	SELECT	max("GC_CORRELATIVO"."CORRELATIVO_FINAL")
	INTO 		:il_corr_fin
	FROM 	"GC_CORRELATIVO"  
	WHERE	"GC_CORRELATIVO"."FECHA" = :ldt_fecha_ult and
				"COD_PARQUE" = :il_cod_parque
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ld_fecha_ult					= date(ldt_fecha_ult)
		ld_fecha_sist				= date(gdt_fec_sistema)
		if ld_fecha_ult<>ld_fecha_sist then
			ll_resp					= messagebox("Advertencia","Desea Continuar Correlativo de Cartas ( Ultimo Nº : "+string(il_corr_fin,"###,###,###,###,###")+" ), recuerde si su Opción es NO el Correlativo se inicializará en (0 - Cero) ",Exclamation!,YesNo!,2)
			if ll_resp<>1 then
				il_corr_fin			= 0
			end if
		else
			if isnull(il_corr_fin) or il_corr_fin=0 then
				il_corr_fin			= 0
			end if
		end if
	else
		il_corr_fin					= 0
	end if
	CHOOSE CASE is_clasif
		CASE 'B'
			dw_carta.dataobject	= 'dw_imprimir_gc_b' //ok
		CASE 'D'
			dw_carta.dataobject	= 'dw_imprimir_gc_d' //ok
		CASE 'PJ'
			dw_carta.dataobject	= 'dw_imprimir_gc_pj' //ok
		CASE 'J'
			dw_carta.dataobject	= 'dw_imprimir_gc_j' //ok
		CASE 'PD'
			dw_carta.dataobject	= 'dw_imprimir_gc_pd' //ok
		CASE 'I'
			dw_carta.dataobject	= 'dw_imprimir_gc_i' //ok
		CASE 'A1','B1'
			dw_carta.dataobject	= 'dw_imprimir_gc_a1_b1' //ok
		CASE 'A2','B2'
			dw_carta.dataobject	= 'dw_imprimir_gc_a2_b2' //ok
		CASE 'A3'
			dw_carta.dataobject	= 'dw_imprimir_gc_a3' //OK
		CASE 'A6','B6'
			dw_carta.dataobject	= 'dw_imprimir_gc_a6_b6' //ok
		CASE 'A7','B7'
			dw_carta.dataobject	= 'dw_imprimir_gc_a7_b7' //ok
		CASE 'B3'
			dw_carta.dataobject	= 'dw_imprimir_gc_b3' //ok
		CASE 'B5'
			dw_carta.dataobject	= 'dw_imprimir_gc_b5' //ok
		CASE 'B19','C19'
			dw_carta.dataobject	= 'dw_imprimir_gc_b19_c19' //ok
		CASE 'B20','C20'
			dw_carta.dataobject	= 'dw_imprimir_gc_b20_c20' //ok
		CASE 'C3'
			dw_carta.dataobject	= 'dw_imprimir_gc_c3' //ok
		CASE 'CG'
			dw_carta.dataobject	= 'dw_imprimir_gc_cg' //ok
		CASE 'D8'
			dw_d8.settransobject(sqlca)
			dw_carta.dataobject	= 'dw_imprimir_gc_d8' //ok
		CASE 'E5'
			dw_carta.dataobject	= 'dw_imprimir_gc_e5' //ok
		CASE 'E6'
			dw_carta.dataobject	= 'dw_imprimir_gc_e6' //ok
		CASE 'F6'
			dw_carta.dataobject	= 'dw_imprimir_gc_f6' //ok
		CASE 'E7'
			dw_carta.dataobject	= 'dw_imprimir_gc_e7' //ok
		CASE 'E8'
			dw_carta.dataobject	= 'dw_imprimir_gc_e8' //ok
		CASE 'S1','S1_D'
			dw_carta.dataobject	= 'dw_imprimir_gc_s1' //ok
		CASE 'T1'
			dw_carta.dataobject	= 'dw_imprimir_gc_t1' //ok
		CASE 'PS_D'
			dw_carta.dataobject	= 'dw_imprimir_gc_ps_d' //ok
		CASE 'SIC_1'
			dw_carta.dataobject	= 'dw_imprimir_gc_sicom1' //ok
		CASE 'SIC_2'
			dw_carta.dataobject	= 'dw_imprimir_gc_sicom2' //ok
		CASE 'SIC_3'
			dw_carta.dataobject	= 'dw_imprimir_gc_sicom3' //ok
		CASE 'PDC_T'
			if gs_conexion = "Parque El Prado" then
				dw_carta.dataobject	= 'dw_imprimir_at_pdc_florida' //ok	 ATENCION TERRENO
			elseif gs_conexion = "Parque La Foresta" then
				dw_carta.dataobject	= 'dw_imprimir_at_pdc_serena' //ok	 ATENCION TERRENO
			elseif gs_conexion = "Parque Concepción" then
				dw_carta.dataobject	= 'dw_imprimir_at_pdc_concepcion'
			end if
		CASE 'PDM_T'
			if gs_conexion = "Parque El Prado" then
				dw_carta.dataobject	= 'dw_imprimir_at_pdm_florida' //ok	 ATENCION TERRENO
			elseif gs_conexion = "Parque La Foresta" then
				dw_carta.dataobject	= 'dw_imprimir_at_pdm_serena' //ok	 ATENCION TERRENO
			elseif gs_conexion = "Parque Concepción" then
				dw_carta.dataobject	= 'dw_imprimir_at_pdm_concepcion' //ok	 ATENCION TERRENO
			end if
		CASE 'IFC_T'
			dw_carta.dataobject	= 'dw_imprimir_at_ifc' ////ok	 ATENCION TERRENO
		CASE 'IFM_T'
			dw_carta.dataobject	= 'dw_imprimir_at_ifm' ////ok	 ATENCION TERRENO
	END CHOOSE
	if is_clasif<>'D8' and is_clasif<>'D' and is_clasif<>'SIC_1' and is_clasif<>'SIC_2' and is_clasif<>'SIC_3' then	
		cb_imprimir.text			= '&Imprimir'
	else
		cb_imprimir.text			= '&Exportar'
	end if
	dw_carta.settransobject(sqlca)
	if isvalid(w_asignar_envio_carta) then
		wf_cargar_gc()
	elseif isvalid(w_ingreso_gestion_ejecutivo_terreno_cob) then
		wf_cargar_carta_at_terreno()
	end if
	il_tot_reg						= dw_carta.rowcount()
	dw_carta.scrolltorow(1)
	st_nro_pag.text					= '1 de '+string(il_tot_reg,"###,###,###,###,###")
else
	close(w_imprimir_carta_cobranza)
end if
end event

event close;disconnect using Trans_1;
end event

type dw_sicom from datawindow within w_imprimir_carta_cobranza
boolean visible = false
integer x = 1719
integer y = 1996
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_exportar_sicom"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_d8 from datawindow within w_imprimir_carta_cobranza
boolean visible = false
integer x = 1074
integer y = 1996
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_exportar_carta_d8"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_zoom from editmask within w_imprimir_carta_cobranza
integer x = 2811
integer y = 1852
integer width = 238
integer height = 100
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "100"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
double increment = 5
string minmax = "30~~200"
end type

event modified;dw_carta.object.datawindow.zoom	= long(em_zoom.text)

end event

type st_2 from statictext within w_imprimir_carta_cobranza
integer x = 2560
integer y = 1872
integer width = 242
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "% ZOOM"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_preview from commandbutton within w_imprimir_carta_cobranza
integer x = 2139
integer y = 1852
integer width = 370
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Preview"
end type

event clicked;if cb_preview.text='&Preview' then
	dw_carta.object.datawindow.Print.Preview	= true
	dw_carta.object.datawindow.zoom				= 100 //85
	cb_preview.text									= 'No &Preview'
elseif cb_preview.text='No &Preview' then
	dw_carta.object.datawindow.zoom				= 100
	dw_carta.object.datawindow.Print.Preview	= false
	cb_preview.text									= '&Preview'
end if
end event

type st_1 from statictext within w_imprimir_carta_cobranza
integer x = 370
integer y = 1868
integer width = 498
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Carta Item Nº:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nro_pag from statictext within w_imprimir_carta_cobranza
integer x = 901
integer y = 1868
integer width = 544
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_imprimir_carta_cobranza
event ue_mousemove pbm_mousemove
integer x = 1961
integer y = 1864
integer width = 123
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_carta.ScrollToRow(il_tot_reg )
st_nro_pag.text	= string(il_tot_reg,"###,###,###,###,###")+' de '+string(il_tot_reg,"###,###,###,###,###")
end event

type pb_4 from picturebutton within w_imprimir_carta_cobranza
event ue_mousemove pbm_mousemove
integer x = 1833
integer y = 1864
integer width = 123
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila
ll_fila				= dw_carta.getrow() + 1
if ll_fila>il_tot_reg then ll_fila=il_tot_reg
dw_carta.Scrolltorow(ll_fila)
st_nro_pag.text	= string(ll_fila,"###,###,###,###,###")+' de '+string(il_tot_reg,"###,###,###,###,###")
end event

type pb_3 from picturebutton within w_imprimir_carta_cobranza
event ue_mousemove pbm_mousemove
integer x = 1705
integer y = 1864
integer width = 123
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila
ll_fila				= dw_carta.getrow() - 1
if ll_fila<1 then ll_fila=1
dw_carta.Scrolltorow(ll_fila)
st_nro_pag.text	= string(ll_fila,"###,###,###,###,###")+' de '+string(il_tot_reg,"###,###,###,###,###")
end event

type pb_2 from picturebutton within w_imprimir_carta_cobranza
event ue_mousemove pbm_mousemove
integer x = 1577
integer y = 1864
integer width = 123
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_carta.ScrollToRow(1)
st_nro_pag.text	= '1 de '+string(il_tot_reg,"###,###,###,###,###")
end event

type cb_imprimir from commandbutton within w_imprimir_carta_cobranza
integer x = 37
integer y = 1852
integer width = 274
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long			ll_resp,ll_indi,ll_tot_reg,ll_max,ll_rut,ll_mora_cred,&
				ll_mora_mant,ll_corr_lista,ll_cod_parque,ll_graba_1=0,ll_graba_2=0,ll_graba_3=0,ll_graba_4=0,&
				ll_corr_final,ll_new,ll_cod_accion,ll_graba_0=0,ll_graba_5=0,ll_largo,ll_mora_deuda,&
				ll_suma_deuda
String			ls_base,ls_serie,ls_cod_envio,ls_estado_envio,ls_carta,ls_nombre,ls_dir_pob,&
				ls_comuna_ciu,ls_promesa,ls_string,ls_depto_p,ls_tipo_via,ls_dir_p,ls_nro_p,ls_block_p,&
				ls_pob_p,ls_linea,ls_dv,ls_aportante,ls_rut,ls_fecha_vcto,ls_tipo_trans,ls_ap_pat,ls_ap_mat,&
				ls_tipo_calle,ls_indi_depto,ls_tipo_domi,ls_comuna,ls_ciudad,ls_cod_postal,ls_fono_c,ls_tipo_doc,&
				ls_tipo_moneda,ls_monto_deuda,ls_deuda_parc,ls_tipo_deudor,ls_rut_deudor_d,ls_email,ls_cod_area,&
				ls_cod_banco,ls_cuenta_ctte,ls_nro_doc,ls_tipo_doc_rec,ls_tipo_moneda_re,ls_monto_rectifi,ls_relleno,&
				ls_iden_sistema,ls_rut_parque,ls_count,ls_sum_deuda,ls_modalidad,ls_identificador
Datetime		ld_fecha_prox_envio,ldt_fecha_hoy
Date			ld_fecha_venc,ld_fecha_carta,ld_fec_prox_vcto
Double		ll_numero,ll_numero_aux
Datawindow	dw_paso

if dw_carta.rowcount()>0 then
	ls_estado_envio			= '0'
	if is_clasif='D8' or is_clasif='D' then
		ll_tot_reg				= dw_carta.rowcount()
		if ll_tot_reg > 0 then 
			dw_d8.reset()
			for ll_indi=1 to ll_tot_reg
				ld_fecha_venc	= date(dw_carta.getitemdatetime(ll_indi,'fecha_plazo_cliente'))
				ld_fecha_carta	= date(dw_carta.getitemdatetime(ll_indi,'fecha_carta_envio'))
				ls_nombre		= dw_carta.getitemstring(ll_indi,'nombre_cliente')+' '+dw_carta.getitemstring(ll_indi,'ap_paterno_cliente')+' '+dw_carta.getitemstring(ll_indi,'ap_materno_cliente')
				ls_tipo_via		= dw_carta.getitemstring(ll_indi,'tipo_via')
				ls_dir_p			= dw_carta.getitemstring(ll_indi,'direccion_part')
				ls_nro_p			= dw_carta.getitemstring(ll_indi,'nro_part')
				ls_depto_p		= dw_carta.getitemstring(ll_indi,'depto_part')
				ls_block_p		= dw_carta.getitemstring(ll_indi,'block_part')
				ls_pob_p			= dw_carta.getitemstring(ll_indi,'poblacion_part')
				ls_dir_pob		= ls_tipo_via+' '+ls_dir_p+' Nº: '+ls_nro_p
				if not isnull(ls_depto_p) and ls_depto_p<>'-' then
					ls_dir_pob	= ls_dir_pob + ' Depto.: '+ls_depto_p
				end if
				if not isnull(ls_block_p) and ls_block_p<>'-' then
					ls_dir_pob	= ls_dir_pob + ' Block: '+ls_block_p
				end if
				if not isnull(ls_pob_p) and ls_pob_p<>'-' then
					ls_dir_pob	= ls_dir_pob + ' Pob.: '+ls_pob_p
				end if
				ls_comuna_ciu	= dw_carta.getitemstring(ll_indi,'comuna_part') +' - '+ dw_carta.getitemstring(ll_indi,'ciudad_part')
				ls_promesa		= dw_carta.getitemstring(ll_indi,'base')+dw_carta.getitemstring(ll_indi,'serie')+string(dw_carta.getitemnumber(ll_indi,'numero'))
				ll_mora_cred	= dw_carta.getitemnumber(ll_indi,'mora_cred')
				ll_new			= dw_d8.insertrow(0)
				dw_d8.scrolltorow(ll_new)
				dw_d8.setitem(ll_new,'fecha_vencimiento',ld_fecha_venc)
				dw_d8.setitem(ll_new,'fecha_carta',ld_fecha_carta)
				dw_d8.setitem(ll_new,'nombre',ls_nombre)
				dw_d8.setitem(ll_new,'direccion_poblacion',ls_dir_pob)
				dw_d8.setitem(ll_new,'comuna_ciudad',ls_comuna_ciu)
				dw_d8.setitem(ll_new,'promesa',ls_promesa)
				dw_d8.setitem(ll_new,'mora_credito',ll_mora_cred)
			next
			dw_d8.accepttext()
			dw_paso				= dw_d8
			f_DWToExcel( dw_paso )
//			OpenWithParm(w_exportar_carta_d8, dw_paso)
		end if
		
	elseif is_clasif='SIC_1' or is_clasif='SIC_2' or is_clasif='SIC_3' then
		ll_tot_reg					= dw_carta.rowcount()
		if ll_tot_reg > 0 then 
			dw_sicom.reset()
			ls_iden_sistema	= 'SICOF'
			if w_asignar_envio_carta.dw_select.getitemnumber(1,'parque') = 11 then
				ls_rut_parque	= '0968359703'
			elseif w_asignar_envio_carta.dw_select.getitemnumber(1,'parque') = 103 then
				ls_rut_parque	= '0953620006'
			else
				ls_rut_parque	= '0968440004'
			end if
			ll_largo				= len(string(ll_tot_reg))
			if ll_largo < 12 then
				ls_count			= fill('0',(12 - ll_largo))+string(ll_tot_reg)
			else
				ls_count			= string(ll_tot_reg)
			end if
			ll_suma_deuda		= w_asignar_envio_carta.dw_lista.getitemnumber(1,'c_deuda_cred')
			ll_largo				= len(string(ll_suma_deuda))
			if ll_largo <= 18 then
				ls_sum_deuda	= fill('0',(18 - ll_largo))+string(ll_suma_deuda)+'00'
			else
				ls_sum_deuda	= string(ll_suma_deuda)
				ls_sum_deuda	= mid(ls_sum_deuda,1,20)
			end if
			ls_modalidad		= 'I'
			ls_identificador	= fill(' ',36)
			ls_relleno			= fill(' ',455)
			ll_new				= dw_sicom.insertrow(0)
			ls_linea				= ls_iden_sistema + ls_rut_parque + ls_count + ls_sum_deuda + ls_modalidad + ls_identificador + ls_relleno
			dw_sicom.scrolltorow(ll_new)
			dw_sicom.setitem(ll_new,'linea',ls_linea)
			
			for ll_indi=1 to ll_tot_reg
				ll_cod_parque		= dw_carta.getitemnumber(ll_indi,'cod_parque')
				if ll_cod_parque=11 then
					ls_aportante	= '754416'
				else
					ls_aportante	= '754408'
				end if
				ll_rut				= dw_carta.getitemnumber(ll_indi,'rut_cliente')
				SELECT	"CLIENTE"."DV",	  "CLIENTE"."FONO_C"
				INTO 		:ls_dv,					:ls_fono_c  
				FROM 		"CLIENTE"  
				WHERE 	"CLIENTE"."RUT" = :ll_rut   
				USING		sqlca;
				ll_largo				= len(string(ll_rut))
				if ll_largo < 9 then
					ls_rut			= fill('0',(9 - ll_largo))+string(ll_rut)+ls_dv
				else
					ls_rut			= string(ll_rut)+ls_dv
					ls_rut			= mid(ls_rut,1,10)
				end if

				ld_fecha_venc		= date(dw_carta.getitemdatetime(ll_indi,'fecha_plazo_cliente'))
				ld_fecha_carta		= date(dw_carta.getitemdatetime(ll_indi,'fecha_carta_envio'))
				ld_fec_prox_vcto	= RelativeDate(ld_fecha_carta, 20)
				ls_fecha_vcto		= string(ld_fec_prox_vcto,'yyyymmdd')
				
				ls_promesa			= string(dw_carta.getitemnumber(ll_indi,'numero'))
				ll_largo				= len(ls_promesa)
				if ll_largo < 16 then
					ls_promesa		= fill(' ',(16 - ll_largo))+ls_promesa
				else
					ls_promesa		= mid(ls_promesa,1,16)
				end if
				ls_tipo_trans		= '01'
				ls_nombre			= dw_carta.getitemstring(ll_indi,'nombre_cliente')
				ll_largo				= len(ls_nombre)
				if ll_largo < 40 then
					ls_nombre		= ls_nombre + fill(' ',(40 - ll_largo))
				else
					ls_nombre		= mid(ls_nombre,1,40)
				end if

				ls_ap_pat			= dw_carta.getitemstring(ll_indi,'ap_paterno_cliente')
				ll_largo				= len(ls_ap_pat)
				if ll_largo < 20 then
					ls_ap_pat		= ls_ap_pat + fill(' ',(20 - ll_largo))
				else
					ls_ap_pat		= mid(ls_ap_pat,1,20)
				end if
				
				ls_ap_mat			= dw_carta.getitemstring(ll_indi,'ap_materno_cliente')
				ll_largo				= len(ls_ap_mat)
				if ll_largo < 20 then
					ls_ap_mat		= ls_ap_mat + fill(' ',(20 - ll_largo))
				else
					ls_ap_mat		= mid(ls_ap_mat,1,20)
				end if
				
				ls_tipo_via			= dw_carta.getitemstring(ll_indi,'tipo_via')
				SELECT	"TIPO_VIA"."COD_SICOM"  
				INTO 		:ls_tipo_calle  
				FROM 		"TIPO_VIA"  
				WHERE 	"TIPO_VIA"."DESCRIPCION" = :ls_tipo_via   
				USING		sqlca;

				ls_dir_p				= dw_carta.getitemstring(ll_indi,'direccion_part')
				ll_largo				= len(ls_dir_p)
				if ll_largo < 40 then
					ls_dir_p			= 	ls_dir_p + fill(' ',(40 - ll_largo))
				else
					ls_dir_p			= mid(ls_dir_p,1,40)
				end if
				
				ls_nro_p				= dw_carta.getitemstring(ll_indi,'nro_part')
				ll_largo				= len(ls_nro_p)
				if ll_largo < 10 then
					ls_nro_p			= 	ls_nro_p + fill(' ',(10 - ll_largo))
				else
					ls_nro_p			= mid(ls_nro_p,1,10)
				end if

				ls_depto_p			= dw_carta.getitemstring(ll_indi,'depto_part')
				ll_largo				= len(ls_depto_p)
				if ll_largo < 5 then
					ls_depto_p		= 	ls_depto_p + fill(' ',(5 - ll_largo))
				else
					ls_depto_p		= mid(ls_depto_p,1,5)
				end if

				ls_block_p			= dw_carta.getitemstring(ll_indi,'block_part')
				if not isnull(ls_depto_p) and ls_depto_p<>'' and ls_depto_p<>'-' and &
					not isnull(ls_block_p) and ls_block_p<>'' and ls_block_p<>'-' then
					ls_indi_depto	= '01'
				else
					ls_indi_depto	= '10'
				end if
				ls_tipo_domi		= '01'

				ls_comuna			= dw_carta.getitemstring(ll_indi,'comuna_part') 
				ll_largo				= len(ls_comuna)
				if ll_largo < 30 then
					ls_comuna		= 	ls_comuna + fill(' ',(30 - ll_largo))
				else
					ls_comuna		= mid(ls_comuna,1,30)
				end if
				
				ls_ciudad			= dw_carta.getitemstring(ll_indi,'ciudad_part')
				ll_largo				= len(ls_ciudad)
				if ll_largo < 30 then
					ls_ciudad		= ls_ciudad + fill(' ',(30 - ll_largo))
				else
					ls_ciudad		= mid(ls_ciudad,1,30)
				end if
				
				ls_cod_postal		= '0000000000'
				
				ll_largo				= len(ls_fono_c)
				if ll_largo < 12 then
					ls_fono_c		= ls_fono_c + fill(' ',(12 - ll_largo))
				else
					ls_fono_c		= mid(ls_fono_c,1,12)
				end if
				
				ls_tipo_doc			= 'CT'
				ls_tipo_moneda		= '$ '
				
				ll_mora_deuda		= dw_carta.getitemnumber(ll_indi,'total_deuda_cred')
				ls_monto_deuda		= string(ll_mora_deuda)
				ll_largo				= len(ls_monto_deuda)
				if ll_largo < 12 then
					ls_monto_deuda		= fill('0',(12 - ll_largo))+ls_monto_deuda+'00'
				end if
				ls_deuda_parc		= fill('0',14)
				ls_tipo_deudor		= ' '
				ls_rut_deudor_d	= fill('0',10)
				ls_email				= fill(' ',60)
				ls_cod_area			= fill('0',4)
				ls_cod_banco		= fill('0',3)
				ls_cuenta_ctte		= fill('0',20)
				ls_nro_doc			= fill(' ',16)
				ls_tipo_doc_rec	= fill(' ',2)
				ls_tipo_moneda_re	= fill(' ',2)
//				ls_rut
				ls_monto_rectifi	= fill('0',14)
				ls_relleno			= fill('0',100)
				ll_new				= dw_sicom.insertrow(0)
				ls_linea				= ls_aportante + ls_rut + ls_fecha_vcto + ls_promesa + ls_tipo_trans + ls_ap_pat + ls_ap_mat + ls_nombre + ls_tipo_calle + ls_dir_p + ls_nro_p + ls_depto_p + ls_indi_depto + ls_tipo_domi + ls_comuna + ls_ciudad + ls_cod_postal + ls_fono_c + ls_tipo_doc + ls_tipo_moneda + ls_monto_deuda + ls_deuda_parc + ls_tipo_deudor + ls_rut_deudor_d + ls_email + ls_cod_area + ls_cod_banco + ls_cuenta_ctte + ls_nro_doc + ls_tipo_doc_rec + ls_tipo_moneda_re + ls_rut + ls_monto_rectifi + ls_relleno
				dw_sicom.scrolltorow(ll_new)
				dw_sicom.setitem(ll_new,'linea',ls_linea)
			next
			dw_sicom.accepttext()
			dw_paso				= dw_sicom
			f_DWToExcel( dw_paso )
//			OpenWithParm(w_exportar_carta_d8, dw_paso)
		end if
		
	else
		dw_carta.object.datawindow.zoom				= 100
		f_printdlg(dw_carta,gstr_print,w_imprimir_carta_cobranza)
			dw_carta.object.datawindow.zoom			= 100
		ll_resp													= messagebox("Imprimir","Se Imprimió Correctamente",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			ls_estado_envio									= '0'
			if dw_carta.update()=1 then
				ll_graba_0 										= 0
				ll_corr_final										= il_corr_fin + dw_carta.rowcount()
				ldt_fecha_hoy									= datetime(date(gdt_fec_sistema),time('00:00:00'))
				SELECT	sysdate
				INTO		:gdt_fec_sistema	
				FROM		"TASA"
				WHERE "TASA"."LOOK" = 1 ;
				
				INSERT INTO "GC_CORRELATIVO"  
							( "CLASIFICACION",	"FECHA",				"CORRELATIVO_INICIAL",	"CORRELATIVO_FINAL",	"COD_PARQUE" )  
				VALUES 	( :is_clasif,				:gdt_fec_sistema,	:il_corr_fin,						:ll_corr_final,				:il_cod_parque )  
				USING		SQLCA;
				if sqlca.sqlcode=0 then
					ll_graba_1									= 0
				else
					ll_graba_1 ++
				end if
				SELECT	Max("GC_LISTA_GESTION"."CODIGO_GRUPO")  
				INTO 		:ll_corr_lista  
				FROM 	"GC_LISTA_GESTION"  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if isnull(ll_corr_lista) then
						ll_corr_lista								= 1
					else
						ll_corr_lista ++
					end if
				else
					ll_corr_lista									= 1
				end if
				ls_carta											= 'Grupo Nº: '+string(ll_corr_lista)+', creado el día '+string(gdt_fec_sistema)+', Usuario: '+gs_user+', Total Carta(s): '+string(dw_carta.rowcount())+' y Clasificación: '+is_clasif
				INSERT INTO "GC_LISTA_GESTION"  
							( "CODIGO_GRUPO",	"FECHA_CREA",  	"OBSERVACION", 	"USUARIO_CREADOR",   "CLASIFICACION" )  
				VALUES 	( :ll_corr_lista, 			:gdt_fec_sistema, :ls_carta,   			:gs_user,   					:is_clasif )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_graba_2									= 0
				else
					ll_graba_2 ++
				end if
				SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
				INTO 		:ll_max  
				FROM		"CARTA_LOG"  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if isnull(ll_max) then
						ll_max									= 1
					else
						ll_max ++
					end if
				else
					ll_max										= 1
				end if
				ll_tot_reg										= dw_carta.rowcount()
				for ll_indi=1 to ll_tot_reg
					ls_base										= dw_carta.getitemstring(ll_indi,'base')
					ls_serie										= dw_carta.getitemstring(ll_indi,'serie')
					ll_numero									= dw_carta.getitemnumber(ll_indi,'numero')
					ll_rut											= dw_carta.getitemnumber(ll_indi,'rut_cliente')
					ls_cod_envio								= dw_carta.getitemstring(ll_indi,'base')
					ll_mora_cred								= dw_carta.getitemnumber(ll_indi,'mora_cred')
					ll_mora_mant								= dw_carta.getitemnumber(ll_indi,'mora_mant')
					ll_cod_accion								= dw_carta.getitemnumber(ll_indi,'cod_accion')
					dw_carta.setitem(ll_indi,'cod_grupo',ll_corr_lista)
					
					SELECT	"CARTA_LOG"."NUMERO"
					INTO 		:ll_numero_aux  
					FROM 	"CARTA_LOG"  
					WHERE	( "CARTA_LOG"."BASE" = :ls_base ) AND  
								( "CARTA_LOG"."SERIE" = :ls_serie ) AND  
								( "CARTA_LOG"."NUMERO" = :ll_numero ) AND  
							 	( "CARTA_LOG"."RUT" = :ll_rut ) AND  
							 	( "CARTA_LOG"."COD_ENVIO" = :ls_cod_envio ) AND  
							 	( "CARTA_LOG"."FECHA_CARTA" = :ldt_fecha_hoy ) AND  
							 	( "CARTA_LOG"."COD_ACCION" = :ll_cod_accion )   
					USING		Trans_1;
					if Trans_1.sqlcode=100 then
						INSERT INTO "CARTA_LOG"  
									( "BASE",   "SERIE",   "NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",   	"FECHA_CARTA",			"MORA",   		"COD_ACCION",   	"CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
						VALUES	( :ls_base, :ls_serie, :ll_numero, :ll_rut, :ls_cod_envio, :ls_estado_envio,  :ldt_fecha_hoy,   	:ll_mora_cred, :ll_cod_accion,  	:ll_max,				:ll_mora_mant, :is_clasif,			:gs_user )  
						USING	sqlca;
						if sqlca.sqlcode=0 then
							ll_graba_3		= 0
							if is_clasif='CG' or is_clasif='OR' then
								ll_graba_4	= 0
	//							UPDATE	"CLIENTE"  
	//							SET 		"ULT_COD_ENVIO_CARTA" = :ls_cod_envio,  
	//										"ULT_ESTADO_ENVIO_CARTA" = :ls_estado_envio,   
	//										"ULT_FECHA_ENVIO_CARTA" = :ldt_fecha_hoy,   
	//										"ULT_COD_ACCION_ENVIO_CARTA" = :ll_cod_accion,   
	//										"ULT_CLASIFICACION_ENVIO_CARTA" = :is_clasif   
	//							WHERE 	"CLIENTE"."RUT" = :ll_rut   
	//							USING		sqlca;
	//							if sqlca.sqlcode=0 then
									ll_graba_5	= 0
	//							else
	//								ll_graba_5 ++
	//							end if
							else
								UPDATE	"CADENA"  
								SET 		"NRO_CARTA" = :is_clasif,   
											"FECHA_CARTA" = :ldt_fecha_hoy,   
											"ESTADO_CARTA" = :ll_cod_accion  
								WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
											( "CADENA"."SERIE" = :ls_serie ) AND  
											( "CADENA"."NUMERO" = :ll_numero )   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									ll_graba_4	= 0
									UPDATE	"CLIENTE"  
									SET 		"ULT_COD_ENVIO_CARTA" = :ls_cod_envio,  
												"ULT_ESTADO_ENVIO_CARTA" = :ls_estado_envio,   
												"ULT_FECHA_ENVIO_CARTA" = :ldt_fecha_hoy,   
												"ULT_COD_ACCION_ENVIO_CARTA" = :ll_cod_accion,   
												"ULT_CLASIFICACION_ENVIO_CARTA" = :is_clasif   
									WHERE 	"CLIENTE"."RUT" = :ll_rut   
									USING	sqlca;
									if sqlca.sqlcode=0 then
										ll_graba_5	= 0
									else
										ll_graba_5 ++
									end if
								else
									ll_graba_4 ++
									exit
								end if
							end if
							ll_max ++
						else
							ll_graba_3 ++
							exit
						end if
					end if
				next
			else
				ll_graba_0 ++
			end if
			if ll_graba_0=0 and ll_graba_1=0 and ll_graba_2=0 and ll_graba_3=0 and ll_graba_4=0 and ll_graba_5=0 then
				commit using sqlca;
				dw_carta.accepttext()
				if dw_carta.update()=1 then
					commit;
				else
					rollback;
				end if
				ll_tot_reg								= dw_carta.rowcount()
				ls_string									= string(il_cod_accion)+'~t'+string(ll_tot_reg)+'~t'+is_clasif+'~t'+string(il_cod_parque)
				OpenWithParm(w_ingreso_proceso_carta, ls_string)
				messagebox("Grabar","Grabación Exitosa")
				if isvalid(w_asignar_envio_carta) then
					w_asignar_envio_carta.dw_lista.reset()
				elseif isvalid(w_ingreso_gestion_ejecutivo_terreno) then
					w_ingreso_gestion_ejecutivo_terreno.triggerevent(open!)
				end if
				cb_cerrar.triggerevent(clicked!)
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if	
end if
end event

type cb_cerrar from commandbutton within w_imprimir_carta_cobranza
integer x = 3195
integer y = 1852
integer width = 334
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprimir_carta_cobranza)
end event

type dw_carta from datawindow within w_imprimir_carta_cobranza
integer x = 37
integer y = 32
integer width = 3493
integer height = 1784
integer taborder = 10
string title = "none"
string dataobject = "dw_imprimir_gc_sicom3"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dw_carta.dataobject='dw_carta_d8' then
	if row>0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(row, TRUE)
	end if
end if
end event

event rowfocuschanged;if dw_carta.dataobject='dw_carta_d8' then
	if getrow()>0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(getrow(), TRUE)
	end if
end if
end event

event doubleclicked;string param
if dw_carta.dataobject='dw_carta_d8' then
	if this.getrow()>0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(this.getrow(), TRUE)
		gs_base			= dw_carta.getitemstring(this.getrow(),'base')
		gs_serie			= dw_carta.getitemstring(this.getrow(),'serie')
		gi_numero		= dw_carta.getitemnumber(this.getrow(),'numero')
		gi_rut			= dw_carta.getitemnumber(this.getrow(),'rut')
		param     		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				OpenWithParm(w_cuenta_corriente_oferta,param)
			CASE "L" // Anexo Liberador
				OpenWithParm(w_cuenta_corriente_liberador,param)		
			CASE "P" // Pagaré
				OpenWithParm(w_cuenta_corriente_pagare,param)		
			CASE "C" // Contrato ISA	
				OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
			CASE "D" // Derecho Especial
				OpenWithParm(w_cuenta_corriente_derecho,param)		
			CASE "R" //Reprog. Mant
				OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
			CASE "A" // Aumento Capacidad
				OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
		END CHOOSE
	end if
end if
end event

type gb_2 from groupbox within w_imprimir_carta_cobranza
event ue_mousemove pbm_mousemove
integer x = 1550
integer y = 1816
integer width = 562
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

