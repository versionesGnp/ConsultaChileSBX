forward
global type w_informe_estado_cartera from window
end type
type rb_gral from radiobutton within w_informe_estado_cartera
end type
type rb_jefe from radiobutton within w_informe_estado_cartera
end type
type st_remuneracion from statictext within w_informe_estado_cartera
end type
type pb_remuneracion from picturebutton within w_informe_estado_cartera
end type
type rb_todos from radiobutton within w_informe_estado_cartera
end type
type st_imprimir from statictext within w_informe_estado_cartera
end type
type pb_imprimir from picturebutton within w_informe_estado_cartera
end type
type pb_exportar from picturebutton within w_informe_estado_cartera
end type
type pb_ordenar from picturebutton within w_informe_estado_cartera
end type
type pb_general from picturebutton within w_informe_estado_cartera
end type
type pb_filtrar from picturebutton within w_informe_estado_cartera
end type
type st_exportar from statictext within w_informe_estado_cartera
end type
type st_agentes_general from statictext within w_informe_estado_cartera
end type
type st_ordenar from statictext within w_informe_estado_cartera
end type
type st_filtrar from statictext within w_informe_estado_cartera
end type
type pb_licencias from picturebutton within w_informe_estado_cartera
end type
type st_licencias from statictext within w_informe_estado_cartera
end type
type st_estado from statictext within w_informe_estado_cartera
end type
type st_3 from statictext within w_informe_estado_cartera
end type
type rb_menor_6_meses from radiobutton within w_informe_estado_cartera
end type
type rb_mas_6_meses from radiobutton within w_informe_estado_cartera
end type
type dw_lista from datawindow within w_informe_estado_cartera
end type
type st_procesar from statictext within w_informe_estado_cartera
end type
type pb_aceptar from picturebutton within w_informe_estado_cartera
end type
type st_2 from statictext within w_informe_estado_cartera
end type
type st_1 from statictext within w_informe_estado_cartera
end type
type em_codigo from editmask within w_informe_estado_cartera
end type
type st_nombre from statictext within w_informe_estado_cartera
end type
type rb_supervisor from radiobutton within w_informe_estado_cartera
end type
type rb_agente from radiobutton within w_informe_estado_cartera
end type
type pb_buscar from picturebutton within w_informe_estado_cartera
end type
type pb_cerrar from picturebutton within w_informe_estado_cartera
end type
type dw_informe from datawindow within w_informe_estado_cartera
end type
type gb_1 from groupbox within w_informe_estado_cartera
end type
type gb_2 from groupbox within w_informe_estado_cartera
end type
type ddlb_fec_fin from dropdownlistbox within w_informe_estado_cartera
end type
type ddlb_fec_ini from dropdownlistbox within w_informe_estado_cartera
end type
type gb_mas_menor from groupbox within w_informe_estado_cartera
end type
type gb_3 from groupbox within w_informe_estado_cartera
end type
end forward

global type w_informe_estado_cartera from window
integer width = 3365
integer height = 2164
boolean titlebar = true
string title = "Informe Estado Cartera por Jefe Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_gral rb_gral
rb_jefe rb_jefe
st_remuneracion st_remuneracion
pb_remuneracion pb_remuneracion
rb_todos rb_todos
st_imprimir st_imprimir
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_ordenar pb_ordenar
pb_general pb_general
pb_filtrar pb_filtrar
st_exportar st_exportar
st_agentes_general st_agentes_general
st_ordenar st_ordenar
st_filtrar st_filtrar
pb_licencias pb_licencias
st_licencias st_licencias
st_estado st_estado
st_3 st_3
rb_menor_6_meses rb_menor_6_meses
rb_mas_6_meses rb_mas_6_meses
dw_lista dw_lista
st_procesar st_procesar
pb_aceptar pb_aceptar
st_2 st_2
st_1 st_1
em_codigo em_codigo
st_nombre st_nombre
rb_supervisor rb_supervisor
rb_agente rb_agente
pb_buscar pb_buscar
pb_cerrar pb_cerrar
dw_informe dw_informe
gb_1 gb_1
gb_2 gb_2
ddlb_fec_fin ddlb_fec_fin
ddlb_fec_ini ddlb_fec_ini
gb_mas_menor gb_mas_menor
gb_3 gb_3
end type
global w_informe_estado_cartera w_informe_estado_cartera

type variables
string	is_opcion, is_codigo, is_clasif
Long		il_empresa
String	is_nombre, is_ap_pat, is_ap_mat, is_estado
Datetime	id_fec_ing
end variables

forward prototypes
public subroutine wf_detalle (datawindow adw_detalle)
public subroutine wf_buscar_supervisor (string as_codigo)
public subroutine wf_buscar_jefe (string as_codigo)
public subroutine wf_buscar_agente (string as_codigo)
end prototypes

public subroutine wf_detalle (datawindow adw_detalle);Date		ld_fec_ing_jefe,ld_fec_fin_jefe,ld_fec_ing_age,ld_fec_fin_age,ld_fec_ing_sup,ld_fec_fin_sup
String	ls_cod_jefe, ls_nom_jefe,ls_ap_pat_jefe,ls_ap_mat_jefe,ls_estado_jefe, ls_tiene_lic
String	ls_cod_agente,ls_nom_age,ls_ap_pat_age,ls_ap_mat_age,ls_estado_age,ls_clasif_age
String	ls_cod_sup,ls_nom_sup,ls_ap_pat_sup,ls_ap_mat_sup,ls_estado_sup,ls_clasid_sup, ls_age_aux
String	ls_filtro,ls_string
Long		ll_tot_reg, ll_indi,ll_dias_lic,ll_saldo_por_cob, ll_calc_dias,ll_count_reg
Long		ll_tot_ventas,ll_cant_vc_al_dia,ll_cant_vc_mora,ll_cant_r,ll_cant_p,ll_caja_vc_al_dia
Long		ll_caja_vc_mora,ll_caja_r,ll_caja_p, ll_new,ll_total_haberes,ll_cant_vc_mora_vsp
Long		ll_caja_vc_mora_vsp,ll_row,ll_rut_age,ll_sum_tot_pagado
Double	ld_ren_total,ld_ren_efectivo,ll_mes,ll_todos_dias
Datetime	ldt_fec_ini, ldt_fec_fin,ldt_fec_ing_age
Time		lt_hora
ls_age_aux	= ''
lt_hora		= time('00:00:00')
ldt_fec_ini	= datetime(date(ddlb_fec_ini.text),lt_hora)
ldt_fec_fin	= datetime(date(ddlb_fec_fin.text),lt_hora)
SetPointer(HourGlass!)
ll_tot_reg	= adw_detalle.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_cod_jefe			= dw_lista.getitemstring(ll_indi,'supervisor_cod_jefe')
	ls_nom_jefe			= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')
	ls_ap_pat_jefe		= dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')
	ls_ap_mat_jefe		= dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
	ls_estado_jefe		= dw_lista.getitemstring(ll_indi,'jefe_ventas_estado')
	ld_fec_ing_jefe	= date(dw_lista.getitemdatetime(ll_indi,'jefe_ventas_fecha_ing'))
	ld_fec_fin_jefe	= date(dw_lista.getitemdatetime(ll_indi,'jefe_ventas_fecha_fin'))
	ls_cod_agente		= dw_lista.getitemstring(ll_indi,'oferta_v_cod_age')
	ls_nom_age			= dw_lista.getitemstring(ll_indi,'agentes_nombre')
	ls_ap_pat_age		= dw_lista.getitemstring(ll_indi,'agentes_a_paterno')
	ls_ap_mat_age		= dw_lista.getitemstring(ll_indi,'agentes_a_materno')
	ls_estado_age		= dw_lista.getitemstring(ll_indi,'agentes_estado')
	ls_clasif_age		= dw_lista.getitemstring(ll_indi,'agentes_clasificacion')
	ld_fec_ing_age		= date(dw_lista.getitemdatetime(ll_indi,'agentes_fecha_ini'))
	ld_fec_fin_age		= date(dw_lista.getitemdatetime(ll_indi,'agentes_fecha_fin'))
	ls_cod_sup			= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
	ls_nom_sup			= dw_lista.getitemstring(ll_indi,'supervisor_nombre')
	ls_ap_pat_sup		= dw_lista.getitemstring(ll_indi,'supervisor_a_paterno')
	ls_ap_mat_sup		= dw_lista.getitemstring(ll_indi,'supervisor_a_materno')
	ls_estado_sup		= dw_lista.getitemstring(ll_indi,'supervisor_estado')
	ls_clasid_sup		= dw_lista.getitemstring(ll_indi,'supervisor_clasifica')
	ld_fec_ing_sup		= date(dw_lista.getitemdatetime(ll_indi,'supervisor_fecha_ing'))
	ld_fec_fin_sup		= date(dw_lista.getitemdatetime(ll_indi,'supervisor_fecha_fin'))
	ll_tot_ventas= 0;	ll_cant_vc_al_dia= 0;ll_cant_vc_mora= 0;ll_cant_vc_mora_vsp= 0
	ll_cant_r= 0;ll_cant_p= 0;ll_caja_vc_al_dia= 0;ll_caja_vc_mora= 0;ll_caja_vc_mora_vsp= 0
	ll_caja_r= 0;ll_caja_p= 0;ll_saldo_por_cob= 0;ll_total_haberes= 0;ll_mes= 0;ll_todos_dias= 0
	ll_tot_ventas		= dw_lista.getitemnumber(ll_indi,'total_ventas')
	ll_cant_vc_al_dia	= dw_lista.getitemnumber(ll_indi,'suma_cant_cv_al_dia')
//	ll_cant_vc_mora	= dw_lista.getitemnumber(ll_indi,'suma_cant_cv_con_mora')
	ll_cant_vc_mora	= dw_lista.getitemnumber(ll_indi,'sum_cant_sin_vsp')
	ll_cant_vc_mora_vsp= dw_lista.getitemnumber(ll_indi,'sum_cant_vsp')
	ll_cant_r			= dw_lista.getitemnumber(ll_indi,'suma_cant_r')
	ll_cant_p			= dw_lista.getitemnumber(ll_indi,'suma_cant_p')
	ll_caja_vc_al_dia	= dw_lista.getitemnumber(ll_indi,'suma_tot_pag_cv_al_dia')
	ll_caja_vc_mora	= dw_lista.getitemnumber(ll_indi,'sum_p_cant_sin_vsp')
	ll_caja_vc_mora_vsp= dw_lista.getitemnumber(ll_indi,'sum_p_cant_vsp')
	ll_caja_r			= dw_lista.getitemnumber(ll_indi,'suma_tot_pag_r')
	ll_caja_p			= dw_lista.getitemnumber(ll_indi,'suma_tot_pag_p')
	ll_saldo_por_cob	= dw_lista.getitemnumber(ll_indi,'suma_saldo_cob_al_dia')
	ll_total_haberes	= dw_lista.getitemnumber(ll_indi,'total_haberes')
	ll_mes				= dw_lista.getitemnumber(ll_indi,'tot_meses')
	ll_todos_dias		= dw_lista.getitemnumber(ll_indi,'todos_dias')
	ls_tiene_lic		= f_tiene_licencia(ls_cod_agente,ldt_fec_ini,ldt_fec_fin)
	if isnull(gl_count_lic) then gl_count_lic=0
	if ll_mes<>0 and not isnull(ll_mes) and ll_tot_ventas<>0 and not isnull(ll_tot_ventas) then
		ll_calc_dias		= ll_todos_dias - gl_count_lic
		ll_mes				= ll_calc_dias / 30
		if ll_mes>0 then
			ld_ren_total	= (ll_tot_ventas + ll_cant_p)/ ll_mes
		else
			ld_ren_total	= 0
		end if
	else
		ld_ren_total		= 0
	end if
//	gl_count_lic dias lic
	ll_calc_dias	= ll_todos_dias - gl_count_lic
	ll_mes			= ll_calc_dias / 30
	if ll_mes <=0 then 
		ld_ren_efectivo	= 0
	else
		ld_ren_efectivo	= (ll_cant_vc_al_dia + ll_cant_p) / ll_mes
	end if
	if ls_cod_agente <> ls_age_aux then
		ll_new	= dw_informe.insertrow(0)
		dw_informe.scrolltorow(ll_new)
		dw_informe.setitem(ll_new,'cod_jefe',ls_cod_jefe)
		dw_informe.setitem(ll_new,'cod_super',ls_cod_sup)
		dw_informe.setitem(ll_new,'nombre_jefe',ls_nom_jefe)
		dw_informe.setitem(ll_new,'ap_paterno_jefe',ls_ap_pat_jefe)
		dw_informe.setitem(ll_new,'ap_materno_jefe',ls_ap_mat_jefe)
	//	dw_informe.setitem(ll_new,'',ls_estado_jefe)
		dw_informe.setitem(ll_new,'cod_agente',ls_cod_agente)
		dw_informe.setitem(ll_new,'nombre_agente',ls_nom_age)
		dw_informe.setitem(ll_new,'ap_paterno_age',ls_ap_pat_age)
		dw_informe.setitem(ll_new,'ap_materno_age',ls_ap_mat_age)
	//	dw_informe.setitem(ll_new,'',ls_estado_age)
		dw_informe.setitem(ll_new,'clasifica_age',ls_clasif_age)
		dw_informe.setitem(ll_new,'fec_ing_age',ld_fec_ing_age)
		dw_informe.setitem(ll_new,'total_vtas',ll_tot_ventas)
		dw_informe.setitem(ll_new,'cant_vc_al_dia',ll_cant_vc_al_dia)
		dw_informe.setitem(ll_new,'cant_vc_mora_vsp',ll_cant_vc_mora_vsp)
		dw_informe.setitem(ll_new,'tp_vc_mora_vsp',ll_caja_vc_mora_vsp)
		dw_informe.setitem(ll_new,'cant_vc_mora',ll_cant_vc_mora)
		dw_informe.setitem(ll_new,'tp_vc_mora',ll_caja_vc_mora)
//		dw_informe.setitem(ll_new,'cant_vc_mora',ll_cant_vc_mora)
		dw_informe.setitem(ll_new,'cant_r',ll_cant_r)
		dw_informe.setitem(ll_new,'cant_p',ll_cant_p)
		dw_informe.setitem(ll_new,'tp_vc_al_dia',ll_caja_vc_al_dia)
//		dw_informe.setitem(ll_new,'tp_vc_mora',ll_caja_vc_mora)
		dw_informe.setitem(ll_new,'tp_r',ll_caja_r)
		dw_informe.setitem(ll_new,'tp_p',ll_caja_p)
		dw_informe.setitem(ll_new,'por_rendimiento',ld_ren_total)
		dw_informe.setitem(ll_new,'por_rendimiento_efectivo',ld_ren_efectivo)
		dw_informe.setitem(ll_new,'nro_dias_licencia',gl_count_lic)
		dw_informe.setitem(ll_new,'total_haber',ll_total_haberes)
		dw_informe.setitem(ll_new,'saldo_por_cob',ll_saldo_por_cob)
		dw_informe.setitem(ll_new,'fecha_cierre',date(ddlb_fec_fin.text))
//		Liberador		
		SELECT	count("ANEXO_LIBERADOR"."SERIE_M"),	SUM("ANEXO_LIBERADOR"."TOT_PAGADO")
		INTO 		:ll_count_reg   ,							:ll_sum_tot_pagado
		FROM 		"ANEXO_LIBERADOR",   
					"CADENA",   
					"PAGO_LIBERADOR"  
		WHERE	 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
				 ( "CADENA"."CODIGO" = 'L' ) AND  
				 ( "ANEXO_LIBERADOR"."COD_AGENTE" = :ls_cod_agente ) AND  
				 (("ANEXO_LIBERADOR"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
				 ( "ANEXO_LIBERADOR"."CIERRE_VENTA" <= :ldt_fec_fin ) )
		using		SQLCA;    
		if isnull(ll_count_reg) then ll_count_reg=0
		if isnull(ll_sum_tot_pagado) then ll_sum_tot_pagado=0
		dw_informe.setitem(ll_new,'cant_liberadores',ll_count_reg)
		dw_informe.setitem(ll_new,'total_pagado_liberador',ll_sum_tot_pagado)
//		Aumento
		SELECT	count("ANEXO_AUMENTO"."SERIE_M"),	SUM("ANEXO_AUMENTO"."TOT_PAGADO")
		INTO 		:ll_count_reg   ,							:ll_sum_tot_pagado
		FROM 		"ANEXO_AUMENTO",   
					"CADENA",   
					"PAGO_AUMENTO"  
		WHERE	 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
				 ( "CADENA"."CODIGO" = 'A' ) AND  
				 ( "ANEXO_AUMENTO"."COD_AGENTE" = :ls_cod_agente ) AND  
				 (("ANEXO_AUMENTO"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
				 ( "ANEXO_AUMENTO"."CIERRE_VENTA" <= :ldt_fec_fin ) )
		using		SQLCA;    
		if isnull(ll_count_reg) then ll_count_reg=0
		if isnull(ll_sum_tot_pagado) then ll_sum_tot_pagado=0
		dw_informe.setitem(ll_new,'cant_aumento',ll_count_reg)
		dw_informe.setitem(ll_new,'total_pagado_aumento',ll_sum_tot_pagado)
		ls_age_aux	= ls_cod_agente
	end if
next
DECLARE	x1 CURSOR FOR  
SELECT 	"AGENTES"."COD_AGE",   
			"AGENTES"."NOMBRE",   
			"AGENTES"."A_PATERNO",   
			"AGENTES"."A_MATERNO",   
			"AGENTES"."FECHA_INI",   
			"AGENTES"."COD_SUP",   
			"AGENTES"."CLASIFICACION",   
			"AGENTES"."RUT",
			"JEFE_VENTAS"."NOMBRE",   
			"JEFE_VENTAS"."A_PATERNO",   
			"JEFE_VENTAS"."A_MATERNO"   
FROM 		"AGENTES",   
			"JEFE_VENTAS",   
			"SUPERVISOR"  
WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
		 ( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
		 ( "AGENTES"."FECHA_INI" <= :ldt_fec_fin) and
	  ( ( "JEFE_VENTAS"."JEFE_VENTAS" = :is_codigo ) AND  
		 ( "AGENTES"."ESTADO" = 'A' ))
USING		sqlca;
open x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ls_cod_agente,:ls_nom_age,:ls_ap_pat_age,:ls_ap_mat_age,:ldt_fec_ing_age,:ls_cod_sup,:ls_clasif_age,:ll_rut_age,:ls_nom_jefe,:ls_ap_pat_jefe,:ls_ap_mat_jefe;
	if not isnull(ls_cod_agente) and not isnull(ls_ap_pat_age) then
		ls_string	= "cod_agente='"+trim(ls_cod_agente)+"'"
		ll_row = dw_informe.Find(ls_string, 1, dw_informe.RowCount() )
		IF ll_row <= 0 THEN
			ll_new	= dw_informe.insertrow(0)
			dw_informe.scrolltorow(ll_new)
			ls_tiene_lic		= f_tiene_licencia(ls_cod_agente,ldt_fec_ini,ldt_fec_fin)
			if isnull(gl_count_lic) then gl_count_lic=0
			dw_informe.setitem(ll_new,'cod_agente',ls_cod_agente)
			dw_informe.setitem(ll_new,'nombre_agente',ls_nom_age)
			dw_informe.setitem(ll_new,'ap_paterno_age',ls_ap_pat_age)
			dw_informe.setitem(ll_new,'ap_materno_age',ls_ap_mat_age)
			dw_informe.setitem(ll_new,'clasifica_age',ls_clasif_age)
			dw_informe.setitem(ll_new,'fec_ing_age',date(ldt_fec_ing_age))
			dw_informe.setitem(ll_new,'cod_super',ls_cod_sup)
			dw_informe.setitem(ll_new,'cod_jefe',is_codigo)
			dw_informe.setitem(ll_new,'nombre_jefe',ls_nom_jefe)
			dw_informe.setitem(ll_new,'ap_paterno_jefe',ls_ap_pat_jefe)
			dw_informe.setitem(ll_new,'ap_materno_jefe',ls_ap_mat_jefe)
			dw_informe.setitem(ll_new,'total_vtas',0)
			dw_informe.setitem(ll_new,'cant_vc_al_dia',0)
			dw_informe.setitem(ll_new,'cant_vc_mora_vsp',0)
			dw_informe.setitem(ll_new,'tp_vc_mora_vsp',0)
			dw_informe.setitem(ll_new,'cant_vc_mora',0)
			dw_informe.setitem(ll_new,'tp_vc_mora',0)
			dw_informe.setitem(ll_new,'cant_r',0)
			dw_informe.setitem(ll_new,'cant_p',0)
			dw_informe.setitem(ll_new,'tp_vc_al_dia',0)
			dw_informe.setitem(ll_new,'tp_r',0)
			dw_informe.setitem(ll_new,'tp_p',0)
			dw_informe.setitem(ll_new,'por_rendimiento',0)
			dw_informe.setitem(ll_new,'por_rendimiento_efectivo',0)
			dw_informe.setitem(ll_new,'nro_dias_licencia',gl_count_lic)
			dw_informe.setitem(ll_new,'cant_liberadores',0)
			dw_informe.setitem(ll_new,'total_pagado_liberador',0)
			dw_informe.setitem(ll_new,'cant_aumento',0)
			dw_informe.setitem(ll_new,'total_pagado_aumento',0)
			ll_total_haberes	= f_buscar_haberes(ll_rut_age,  ldt_fec_ini , ldt_fec_fin )
			dw_informe.setitem(ll_new,'total_haber',ll_total_haberes)
			dw_informe.setitem(ll_new,'saldo_por_cob',0)
			dw_informe.setitem(ll_new,'fecha_cierre',date(ddlb_fec_fin.text))
		end if
	end if
LOOP
close x1;
if rb_mas_6_meses.checked = true then
	rb_mas_6_meses.triggerevent(clicked!)
elseif rb_menor_6_meses.checked=true then
	rb_menor_6_meses.triggerevent(clicked!)
elseif rb_todos.checked=true then
	rb_todos.triggerevent(clicked!)
end if
SetPointer(Arrow!)
dw_informe.sort()
dw_informe.scrolltorow(1)
end subroutine

public subroutine wf_buscar_supervisor (string as_codigo);SELECT	"SUPERVISOR"."NOMBRE",   
			"SUPERVISOR"."A_PATERNO",   
			"SUPERVISOR"."A_MATERNO",   
			"SUPERVISOR"."FECHA_ING",   
			"SUPERVISOR"."ESTADO",   
			"SUPERVISOR"."CLASIFICA"  
INTO 		:is_nombre,   
			:is_ap_pat,   
			:is_ap_mat,   
			:id_fec_ing,   
			:is_estado,   
			:is_clasif  
FROM 		"SUPERVISOR"  
WHERE 	"SUPERVISOR"."COD_SUP" = :as_codigo   
Using		sqlca;
if sqlca.sqlcode=0 then
	st_nombre.text	= trim(is_nombre) +' '+trim(is_ap_pat)+' '+trim(is_ap_mat)
	st_estado.text	= trim(is_estado)
//else
//	st_nombre.text	= ''
//	st_estado.text	= ''
//	messagebox("Advertencia","No Existe Supervisor "+as_codigo)
//	close(w_informe_estado_cartera)
end if
end subroutine

public subroutine wf_buscar_jefe (string as_codigo);SELECT	"JEFE_VENTAS"."NOMBRE",   
			"JEFE_VENTAS"."A_PATERNO",   
			"JEFE_VENTAS"."A_MATERNO",   
			"JEFE_VENTAS"."FECHA_ING",   
			"JEFE_VENTAS"."ESTADO"  
INTO 		:is_nombre,   
			:is_ap_pat,   
			:is_ap_mat,   
			:id_fec_ing,   
			:is_estado  
FROM 		"JEFE_VENTAS"  
Where		"JEFE_VENTAS"."JEFE_VENTAS" = :as_codigo	
Using		sqlca;
if sqlca.sqlcode=0 then
	st_nombre.text	= trim(is_nombre) +' '+trim(is_ap_pat)+' '+trim(is_ap_mat)
	st_estado.text	= trim(is_estado)
//else
//	st_nombre.text	= ''
//	st_estado.text	= ''
//	messagebox("Advertencia","No Existe Jefe Venta "+as_codigo)
//	close(w_informe_estado_cartera)
end if

end subroutine

public subroutine wf_buscar_agente (string as_codigo);SELECT	"AGENTES"."NOMBRE",   
			"AGENTES"."A_PATERNO",   
			"AGENTES"."A_MATERNO",   
			"AGENTES"."FECHA_INI",   
			"AGENTES"."ESTADO",   
			"AGENTES"."CLASIFICACION"  
INTO 		:is_nombre,   
			:is_ap_pat,   
			:is_ap_mat,   
			:id_fec_ing,   
			:is_estado,   
			:is_clasif  
FROM 		"AGENTES"  
WHERE 	"AGENTES"."COD_AGE" = :as_codigo   
Using		sqlca;
if sqlca.sqlcode=0 then
	st_nombre.text	= trim(is_nombre) +' '+trim(is_ap_pat)+' '+trim(is_ap_mat)
	st_estado.text	= trim(is_estado)
//else
//	st_nombre.text	= ''
//	st_estado.text	= ''
//	messagebox("Advertencia","No Extiste Agente "+as_codigo)
//	close(w_informe_estado_cartera)
end if
end subroutine

on w_informe_estado_cartera.create
this.rb_gral=create rb_gral
this.rb_jefe=create rb_jefe
this.st_remuneracion=create st_remuneracion
this.pb_remuneracion=create pb_remuneracion
this.rb_todos=create rb_todos
this.st_imprimir=create st_imprimir
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_ordenar=create pb_ordenar
this.pb_general=create pb_general
this.pb_filtrar=create pb_filtrar
this.st_exportar=create st_exportar
this.st_agentes_general=create st_agentes_general
this.st_ordenar=create st_ordenar
this.st_filtrar=create st_filtrar
this.pb_licencias=create pb_licencias
this.st_licencias=create st_licencias
this.st_estado=create st_estado
this.st_3=create st_3
this.rb_menor_6_meses=create rb_menor_6_meses
this.rb_mas_6_meses=create rb_mas_6_meses
this.dw_lista=create dw_lista
this.st_procesar=create st_procesar
this.pb_aceptar=create pb_aceptar
this.st_2=create st_2
this.st_1=create st_1
this.em_codigo=create em_codigo
this.st_nombre=create st_nombre
this.rb_supervisor=create rb_supervisor
this.rb_agente=create rb_agente
this.pb_buscar=create pb_buscar
this.pb_cerrar=create pb_cerrar
this.dw_informe=create dw_informe
this.gb_1=create gb_1
this.gb_2=create gb_2
this.ddlb_fec_fin=create ddlb_fec_fin
this.ddlb_fec_ini=create ddlb_fec_ini
this.gb_mas_menor=create gb_mas_menor
this.gb_3=create gb_3
this.Control[]={this.rb_gral,&
this.rb_jefe,&
this.st_remuneracion,&
this.pb_remuneracion,&
this.rb_todos,&
this.st_imprimir,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_ordenar,&
this.pb_general,&
this.pb_filtrar,&
this.st_exportar,&
this.st_agentes_general,&
this.st_ordenar,&
this.st_filtrar,&
this.pb_licencias,&
this.st_licencias,&
this.st_estado,&
this.st_3,&
this.rb_menor_6_meses,&
this.rb_mas_6_meses,&
this.dw_lista,&
this.st_procesar,&
this.pb_aceptar,&
this.st_2,&
this.st_1,&
this.em_codigo,&
this.st_nombre,&
this.rb_supervisor,&
this.rb_agente,&
this.pb_buscar,&
this.pb_cerrar,&
this.dw_informe,&
this.gb_1,&
this.gb_2,&
this.ddlb_fec_fin,&
this.ddlb_fec_ini,&
this.gb_mas_menor,&
this.gb_3}
end on

on w_informe_estado_cartera.destroy
destroy(this.rb_gral)
destroy(this.rb_jefe)
destroy(this.st_remuneracion)
destroy(this.pb_remuneracion)
destroy(this.rb_todos)
destroy(this.st_imprimir)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_ordenar)
destroy(this.pb_general)
destroy(this.pb_filtrar)
destroy(this.st_exportar)
destroy(this.st_agentes_general)
destroy(this.st_ordenar)
destroy(this.st_filtrar)
destroy(this.pb_licencias)
destroy(this.st_licencias)
destroy(this.st_estado)
destroy(this.st_3)
destroy(this.rb_menor_6_meses)
destroy(this.rb_mas_6_meses)
destroy(this.dw_lista)
destroy(this.st_procesar)
destroy(this.pb_aceptar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_codigo)
destroy(this.st_nombre)
destroy(this.rb_supervisor)
destroy(this.rb_agente)
destroy(this.pb_buscar)
destroy(this.pb_cerrar)
destroy(this.dw_informe)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.ddlb_fec_fin)
destroy(this.ddlb_fec_ini)
destroy(this.gb_mas_menor)
destroy(this.gb_3)
end on

event open;String	ls_estado_aux
Datetime	ld_fecha_cierre
Long		ll_periodo,ll_anno
is_opcion 					= Message.StringParm
rb_gral.checked			= false
rb_jefe.checked			= false
rb_supervisor.checked	= false
rb_agente.checked			= false
gf_centrar(w_informe_estado_cartera)
dw_lista.settransobject(sqlca)
gs_ventana	= 'w_informe_estado_cartera'
f_valida_objeto_1()

CHOOSE CASE is_opcion
	CASE 'G' // General
		this.title					= 'Informe General Estado Cartera ( Jefe de Venta )'
		rb_gral.checked			= true
		rb_agente.enabled			= false
		rb_jefe.enabled			= false
		rb_supervisor.enabled	= false	
		pb_buscar.enabled			= false
		dw_informe.dataobject	= 'dwe_lista_cartera'
		dw_informe.settransobject(sqlca)
	CASE 'J','1' // Jefe Venta
		this.title					= 'Informe Estado Cartera por Jefe Venta'
		rb_jefe.checked 			= true
		rb_supervisor.checked 	= false
		rb_agente.checked 		= false
		rb_gral.enabled			= false
		dw_informe.dataobject	= 'dw_detalle_estado_cartera_por_jefe_vta'
		dw_informe.settransobject(sqlca)
		SELECT	"SUPERVISOR"."ESTADO"  
		INTO 		:ls_estado_aux  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","No tiene acceso")
			em_codigo.enabled					= false
			rb_jefe.enabled					= false
			rb_supervisor.enabled			= false
			rb_agente.enabled					= false
			pb_buscar.enabled					= false
			pb_aceptar.enabled				= false
			rb_gral.enabled					= false
			ddlb_fec_ini.enabled				= false
			ddlb_fec_fin.enabled				= false
			rb_mas_6_meses.enabled			= false
			rb_menor_6_meses.enabled		= false
			rb_todos.enabled					= false
		end if 
	CASE 'S','2' // Supervisor
		this.title					= 'Informe Estado Cartera por Supervisor'
		rb_jefe.checked 			= false
		rb_supervisor.checked 	= true
		rb_agente.checked 		= false
		pb_general.enabled		= false
		rb_gral.enabled			= false
		dw_informe.dataobject	= 'dw_detalle_estado_cartera_por_supervisor'
		dw_informe.settransobject(sqlca)
	CASE 'A','3' // Agente
		this.title					= 'Informe Estado Cartera por Agente'
		rb_jefe.checked 			= false
		rb_supervisor.checked 	= false
		rb_agente.checked 		= true
		pb_general.enabled		= false
		rb_gral.enabled			= false
		dw_informe.dataobject	= 'dw_detalle_estado_cartera_por_agente'
		dw_informe.settransobject(sqlca)
END CHOOSE
DECLARE 	x1 CURSOR FOR  
SELECT 	"CIERRE_VENTA"."PERIODO",   
			"CIERRE_VENTA"."ANNO",   
			"CIERRE_VENTA"."CIERRE_VENTA_INI"  
FROM 		"CIERRE_VENTA"  
ORDER BY "CIERRE_VENTA"."CIERRE_VENTA_INI" DESC   
USING		sqlca;
open x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ll_periodo,:ll_anno,:ld_fecha_cierre;
	if not isnull(ld_fecha_cierre) then	ddlb_fec_ini.AddItem(string(ld_fecha_cierre,"dd/mm/yyyy"))
LOOP
ddlb_fec_ini.selectitem(1)
close x1;
DECLARE 	x2 CURSOR FOR  
SELECT 	"CIERRE_VENTA"."PERIODO",   
			"CIERRE_VENTA"."ANNO",   
			"CIERRE_VENTA"."CIERRE_VENTA"  
FROM 		"CIERRE_VENTA"  
ORDER BY "CIERRE_VENTA"."CIERRE_VENTA" DESC   
USING		sqlca;
open x2;
DO WHILE sqlca.sqlcode=0
	fetch x2 into :ll_periodo,:ll_anno,:ld_fecha_cierre;
	if not isnull(ld_fecha_cierre) then	ddlb_fec_fin.AddItem(string(ld_fecha_cierre,"dd/mm/yyyy"))
LOOP
ddlb_fec_fin.selectitem(1)
close x2;
rb_todos.checked	= true

SELECT	"JEFE_VENTAS"."ESTADO"  
INTO 		:ls_estado_aux  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	em_codigo.text				= gs_user
	em_codigo.enabled			= true
	rb_jefe.enabled			= true
	rb_supervisor.enabled	= true
	rb_agente.enabled			= true
	pb_buscar.enabled			= true
	em_codigo.triggerevent(modified!)
else
	SELECT	"SUPERVISOR"."ESTADO"  
	INTO 		:ls_estado_aux  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode=0 and is_opcion <> "1" then
		em_codigo.text			= gs_user
		em_codigo.enabled		= false    
		rb_jefe.enabled		= false
		rb_supervisor.enabled= true
		rb_agente.enabled		= true
		pb_buscar.enabled		= true  
		em_codigo.triggerevent(modified!)
	else
		SELECT	"AGENTES"."ESTADO"  
		INTO 		:ls_estado_aux  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			em_codigo.text		= gs_user
			em_codigo.enabled	= false
			em_codigo.triggerevent(modified!)
			em_codigo.enabled	= true
			rb_gral.enabled	= true
		else 
//			rb_gral.enabled		= true
//			em_codigo.enabled		= true
//			rb_jefe.enabled		= true
//			rb_supervisor.enabled= true
//			rb_agente.enabled		= true
//			pb_buscar.enabled		= true  
//			em_codigo.enabled		= true
//			em_codigo.triggerevent(modified!)
		end if
	end if
end if

end event

event mousemove;st_procesar.visible	= false
st_filtrar.visible	= false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false
end event

type rb_gral from radiobutton within w_informe_estado_cartera
integer x = 1097
integer y = 92
integer width = 389
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " General"
end type

event clicked;em_codigo.text	= ''
st_nombre.text	= ''
st_estado.text	= ''
dw_informe.reset()
em_codigo.setfocus()
is_opcion		= 'G'
w_informe_estado_cartera.title	= "Informe General Gestion Actual ( Jefe de Venta )"
end event

type rb_jefe from radiobutton within w_informe_estado_cartera
integer x = 1097
integer y = 168
integer width = 389
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Jefe Venta"
end type

event clicked;em_codigo.text	= ''
st_nombre.text	= ''
st_estado.text	= ''
dw_informe.reset()
em_codigo.setfocus()
is_opcion		= '1'
w_informe_estado_cartera.title	= "Informe Gestion Actual por Jefe de Venta"
end event

type st_remuneracion from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2985
integer y = 1332
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Remuneración"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_remuneracion.visible=false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false

end event

type pb_remuneracion from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 1184
integer width = 169
integer height = 148
integer taborder = 140
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Contabilidad (o).BMP"
string disabledname = "Contabilidad (o)_no.BMP"
alignment htextalign = right!
end type

event ue_mousemove;st_remuneracion.visible=true
st_ordenar.visible	= false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;String	ls_codigo, ls_string
Datetime	ldt_fec_ini,ldt_fec_fin
Time		lt_hora
if dw_informe.getrow() > 0 then
	if dw_informe.dataobject='dwe_lista_cartera' then
		ls_codigo	= dw_informe.getitemstring(dw_informe.getrow(),'cod_agente')
	else
		ls_codigo	= trim(em_codigo.text)
	end if
	lt_hora		= time('00:00:00')
	ldt_fec_ini	= datetime(date(trim(ddlb_fec_ini.text)),lt_hora)
	ldt_fec_fin	= datetime(date(trim(ddlb_fec_fin.text)),lt_hora)
	ls_string	= ls_codigo+'~t'+string(ldt_fec_ini)+'~t'+string(ldt_fec_fin)+'~t'+'2'
	OpenWithParm(w_detalle_ventas,ls_string)
end if
end event

type rb_todos from radiobutton within w_informe_estado_cartera
integer x = 2711
integer y = 284
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Todos"
end type

event clicked;String	ls_filtro
if dw_informe.rowcount() > 0 then
	if rb_gral.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR VENDEDOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
	elseif rb_jefe.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR JEFE DE VENTA, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
	elseif rb_supervisor.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR SUPERVISOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
	elseif rb_agente.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR AGENTE, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
	end if
	ls_filtro	= ""
	dw_informe.SetFilter(ls_filtro)
	dw_informe.Filter( )
	dw_informe.sort()
	dw_informe.scrolltorow(1)
end if
end event

type st_imprimir from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3109
integer y = 872
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Imprimir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_remuneracion.visible=false
end event

type pb_imprimir from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 724
integer width = 169
integer height = 148
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event ue_mousemove;st_imprimir.visible	= true
st_procesar.visible	= false
st_exportar.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false
end event

event clicked;if dw_informe.rowcount() > 0 then 
	dw_informe.object.datawindow.print.Preview = true
	if dw_informe.dataobject='dwe_lista_cartera' then
		dw_informe.object.datawindow.zoom = 67
	else
		dw_informe.object.datawindow.zoom = 78
	end if
	f_Print( dw_informe )
	dw_informe.object.datawindow.zoom = 100
	dw_informe.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 568
integer width = 169
integer height = 148
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_exportar.visible	= true
st_procesar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false
end event

event clicked;datawindow dw_paso
dw_paso	= dw_informe
if dw_informe.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_ordenar from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 1332
integer width = 169
integer height = 148
integer taborder = 130
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_ordenar.visible	= true
st_remuneracion.visible=false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;if dw_informe.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_informe.SETSORT(NULO)
	dw_informe.SORT()
end if
end event

type pb_general from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 1032
integer width = 169
integer height = 148
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Agenc_on.BMP"
string disabledname = "Agenc_off.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_agentes_general.visible	= true
st_remuneracion.visible=false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;String	ls_codigo, ls_string
Date		ld_fec_ini,ld_fec_fin
if dw_informe.getrow() > 0 then
	if dw_informe.dataobject='dwe_lista_cartera' then
		ls_codigo	= dw_informe.getitemstring(dw_informe.getrow(),'cod_agente')
	else
		ls_codigo	= trim(em_codigo.text)
	end if
	ld_fec_ini	= date(trim(ddlb_fec_ini.text))
	ld_fec_fin	= date(trim(ddlb_fec_fin.text))
	ls_string	= ls_codigo+'~t'+string(ld_fec_ini)+'~t'+string(ld_fec_fin)+'~t'+'1'
	OpenWithParm(w_detalle_ventas,ls_string)
end if
end event

type pb_filtrar from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_filtrar.visible	= true
st_remuneracion.visible=false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_licencias.visible	= false

end event

event clicked;string nulo
setnull (nulo)
dw_informe.SETfilter(NULO)
dw_informe.filter()

end event

type st_exportar from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3109
integer y = 712
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Exportar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_remuneracion.visible=false
end event

type st_agentes_general from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2944
integer y = 1180
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Cartera Agentes"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_remuneracion.visible=false
end event

type st_ordenar from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3109
integer y = 1476
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Ordenar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_remuneracion.visible=false
end event

type st_filtrar from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3109
integer y = 1628
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Filtrar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;this.visible	= false
st_remuneracion.visible=false
end event

type pb_licencias from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 880
integer width = 169
integer height = 148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar_no.BMP"
alignment htextalign = left!
end type

event ue_mousemove;st_imprimir.visible	= false
st_procesar.visible	= false
st_exportar.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_remuneracion.visible=false
st_licencias.visible	= true

end event

event clicked;string	ls_codigo
if dw_informe.getrow() > 0 then
	if dw_informe.dataobject='dwe_lista_cartera' then
		ls_codigo	= dw_informe.getitemstring(dw_informe.getrow(),'cod_agente')
	else
		ls_codigo	= trim(em_codigo.text)
	end if
	openwithparm(w_reporte_licencias,ls_codigo)
end if
end event

type st_licencias from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3109
integer y = 1028
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Licencias"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false
end event

type st_estado from statictext within w_informe_estado_cartera
integer x = 576
integer y = 144
integer width = 151
integer height = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_informe_estado_cartera
integer x = 553
integer y = 88
integer width = 206
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_menor_6_meses from radiobutton within w_informe_estado_cartera
integer x = 2711
integer y = 196
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Menos de 6 meses"
end type

event clicked;String	ls_filtro
if dw_informe.rowcount() > 0 then
	if rb_gral.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR VENDEDOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
	elseif rb_jefe.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR JEFE DE VENTA, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
	elseif rb_supervisor.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR SUPERVISOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
	elseif rb_agente.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR AGENTE, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
	end if
	ls_filtro 	= "antiguedad ='Menor 6 meses'"
	dw_informe.SetFilter(ls_filtro)
	dw_informe.Filter( )
	dw_informe.sort()
	dw_informe.scrolltorow(1)
end if
end event

type rb_mas_6_meses from radiobutton within w_informe_estado_cartera
integer x = 2711
integer y = 108
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Mayor de 6 meses"
boolean checked = true
end type

event clicked;String	ls_filtro
if dw_informe.rowcount() > 0 then
	if rb_gral.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR VENDEDOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
	elseif rb_jefe.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR JEFE DE VENTA, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
	elseif rb_supervisor.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR SUPERVISOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
	elseif rb_agente.checked=true then
		dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR AGENTE, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
	end if
	ls_filtro	= "antiguedad ='Mayor 6 meses'"
	dw_informe.SetFilter(ls_filtro)
	dw_informe.Filter( )
	dw_informe.sort()
	dw_informe.scrolltorow(1)
end if
end event

type dw_lista from datawindow within w_informe_estado_cartera
boolean visible = false
integer x = 1189
integer y = 2052
integer width = 475
integer height = 432
integer taborder = 120
string dataobject = "dw_detalle_estado_cartera"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_procesar from statictext within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3109
integer y = 560
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Procesar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_filtrar.visible	= false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false



end event

type pb_aceptar from picturebutton within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 3141
integer y = 412
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_procesar.visible	= true
st_filtrar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false
end event

event clicked;//wf_inicializar_variables()
DateTime	ldt_fec_ini, ldt_fec_fin
time		lt_hora
Long		ll_tot_reg
lt_hora		= time('00:00:00')
ldt_fec_ini	= datetime(date(trim(ddlb_fec_ini.text)),lt_hora)
ldt_fec_fin	= datetime(date(trim(ddlb_fec_fin.text)),lt_hora)
dw_informe.reset()
if ldt_fec_ini <= ldt_fec_fin then
	if em_codigo.text <> '' then
		is_codigo = trim(em_codigo.text)
		CHOOSE CASE is_opcion
			CASE 'G'
				dw_informe.dataobject 	= 'dwe_lista_cartera'
				dw_informe.settransobject(sqlca)
				if rb_mas_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR VENDEDOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
				elseif rb_menor_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR VENDEDOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
				elseif rb_todos.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR VENDEDOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
				end if
				if is_opcion='G' then dw_informe.object.t_datos_jefe.text		= 'Estado:  '+is_estado+'                 Fecha Ingreso:  '+string(id_fec_ing,'dd/mm/yyyy')
				ll_tot_reg	= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin,trim(is_codigo))
			CASE '1'
				dw_informe.dataobject 	= 'dw_detalle_estado_cartera_por_jefe_vta'
				dw_informe.settransobject(sqlca)
				if rb_mas_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR JEFE DE VENTA, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
				elseif rb_menor_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR JEFE DE VENTA, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
				elseif rb_todos.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR JEFE DE VENTA, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
				end if
				ll_tot_reg	= dw_informe.retrieve(ldt_fec_ini,ldt_fec_fin,trim(is_codigo))
			CASE '2'
				dw_informe.dataobject 	= 'dw_detalle_estado_cartera_por_supervisor'
				dw_informe.settransobject(sqlca)
				if rb_mas_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR SUPERVISOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
				elseif rb_menor_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR SUPERVISOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
				elseif rb_todos.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR SUPERVISOR, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
				end if
				ll_tot_reg	= dw_informe.retrieve(ldt_fec_ini,ldt_fec_fin,trim(is_codigo))
			CASE '3'
				dw_informe.dataobject 	= 'dw_detalle_estado_cartera_por_agente'
				dw_informe.settransobject(sqlca)
				if rb_mas_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR AGENTE, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con más de seis meses en el periodo de muestra'
				elseif rb_menor_6_meses.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR AGENTE, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text+'~rsolamente agentes con menos de seis meses en el periodo de muestra'
				elseif rb_todos.checked=true then 
					dw_informe.object.t_cabecera.text	= 'ESTADO CARTERA POR AGENTE, VENTAS REALIZADAS ENTRE EL '+ddlb_fec_ini.text+' Y EL '+ddlb_fec_fin.text
				end if
				ll_tot_reg	= dw_informe.retrieve(ldt_fec_ini,ldt_fec_fin,trim(is_codigo))
		END CHOOSE
		if ll_tot_reg > 0 then
			if gs_conexion = "Parque El Prado" then
				il_empresa = 1
				dw_informe.object.t_titulo.text	= 'El Prado / Manantial / Santiago'
			elseif gs_conexion = "Parque La Foresta" then
				il_empresa = 2
				dw_informe.object.t_titulo.text	= 'El Foresta'
			else
				il_empresa = 3
				dw_informe.object.t_titulo.text	= 'Concepción'
			end if
			if is_opcion='G' then 
				wf_detalle(dw_lista)
			else
				if rb_mas_6_meses.checked = true then
					rb_mas_6_meses.triggerevent(clicked!)
				elseif rb_menor_6_meses.checked=true then
					rb_menor_6_meses.triggerevent(clicked!)
				elseif rb_todos.checked=true then
					rb_todos.triggerevent(clicked!)
				end if
				dw_informe.sort()
			end if
		else
			messagebox("Advertencia","No se registran datos, en el periodo "+ddlb_fec_ini.text+" al "+ddlb_fec_fin.text)
		end if
	else
		messagebox("Advertencia","Falta ingresar Código")
	end if
else
	messagebox("Advertencia","Rango fecha Incorrecta")
end if
end event

type st_2 from statictext within w_informe_estado_cartera
integer x = 2190
integer y = 144
integer width = 411
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha Término"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_informe_estado_cartera
integer x = 1742
integer y = 144
integer width = 361
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha inicio"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_codigo from editmask within w_informe_estado_cartera
integer x = 73
integer y = 120
integer width = 343
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
string displaydata = "T"
end type

event modified;if this.text <> '' then
	st_nombre.text = ''
	is_codigo		= trim(this.text)
	dw_informe.reset()
	if rb_jefe.checked = true or rb_gral.checked=true then
		wf_buscar_jefe(is_codigo)
	elseif rb_supervisor.checked = true then
		wf_buscar_supervisor(is_codigo)
	elseif rb_agente.checked = true then
		wf_buscar_agente(is_codigo)
	end if
end if
end event

type st_nombre from statictext within w_informe_estado_cartera
integer x = 73
integer y = 252
integer width = 937
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean focusrectangle = false
end type

type rb_supervisor from radiobutton within w_informe_estado_cartera
integer x = 1097
integer y = 236
integer width = 389
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Supervisor"
end type

event clicked;em_codigo.text	= ''
st_nombre.text	= ''
st_estado.text	= ''
dw_informe.reset()
em_codigo.setfocus()
is_opcion		= '2'
w_informe_estado_cartera.title	= "Informe Gestion Actual por Supervisor"
end event

type rb_agente from radiobutton within w_informe_estado_cartera
integer x = 1097
integer y = 304
integer width = 389
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Agente"
end type

event clicked;em_codigo.text	= ''
st_nombre.text	= ''
st_estado.text	= ''
dw_informe.reset()
em_codigo.setfocus()
is_opcion		= '3'
w_informe_estado_cartera.title	= "Informe Gestion Actual por Agente"
end event

type pb_buscar from picturebutton within w_informe_estado_cartera
integer x = 1504
integer y = 104
integer width = 142
integer height = 116
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
string disabledname = "lupa_no.bmp"
end type

event clicked;openwithparm(w_lista_codigos,is_opcion)
//em_codigo.triggerevent(modified!)
dw_informe.reset()

end event

type pb_cerrar from picturebutton within w_informe_estado_cartera
integer x = 3141
integer y = 1892
integer width = 169
integer height = 148
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_informe_estado_cartera)
end event

type dw_informe from datawindow within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 412
integer width = 3067
integer height = 1628
integer taborder = 50
string title = "none"
string dataobject = "dw_detalle_estado_cartera_por_agente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_procesar.visible	= false
st_filtrar.visible	= false
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_licencias.visible	= false
st_remuneracion.visible=false
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_informe_estado_cartera
integer x = 1056
integer y = 36
integer width = 622
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Opciones Busqueda"
end type

type gb_2 from groupbox within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 2670
integer y = 36
integer width = 645
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Seleccione Periodo"
end type

event ue_mousemove;st_procesar.visible	= false

end event

type ddlb_fec_fin from dropdownlistbox within w_informe_estado_cartera
integer x = 2203
integer y = 236
integer width = 384
integer height = 352
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean border = false
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_informe.reset()
end event

type ddlb_fec_ini from dropdownlistbox within w_informe_estado_cartera
integer x = 1733
integer y = 236
integer width = 384
integer height = 352
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean border = false
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_informe.reset()
end event

type gb_mas_menor from groupbox within w_informe_estado_cartera
event ue_mousemove pbm_mousemove
integer x = 1691
integer y = 36
integer width = 965
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ventas Periodo"
end type

event ue_mousemove;st_procesar.visible	= false

end event

type gb_3 from groupbox within w_informe_estado_cartera
integer x = 37
integer y = 36
integer width = 1010
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ingrese Código"
end type

