forward
global type w_detalle_periodo_cierre_de_venta_emp from window
end type
type cb_1 from commandbutton within w_detalle_periodo_cierre_de_venta_emp
end type
type cb_detalle_venta from commandbutton within w_detalle_periodo_cierre_de_venta_emp
end type
type dw_print from datawindow within w_detalle_periodo_cierre_de_venta_emp
end type
type cb_gestion from commandbutton within w_detalle_periodo_cierre_de_venta_emp
end type
type pb_exportar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
end type
type pb_imprimir from picturebutton within w_detalle_periodo_cierre_de_venta_emp
end type
type pb_ordenar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
end type
type pb_filtrar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
end type
type pb_cerrar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
end type
type dw_lista from datawindow within w_detalle_periodo_cierre_de_venta_emp
end type
type dw_jefe from datawindow within w_detalle_periodo_cierre_de_venta_emp
end type
end forward

global type w_detalle_periodo_cierre_de_venta_emp from window
integer width = 3675
integer height = 2320
boolean titlebar = true
string title = "Informe Gestión Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
cb_detalle_venta cb_detalle_venta
dw_print dw_print
cb_gestion cb_gestion
pb_exportar pb_exportar
pb_imprimir pb_imprimir
pb_ordenar pb_ordenar
pb_filtrar pb_filtrar
pb_cerrar pb_cerrar
dw_lista dw_lista
dw_jefe dw_jefe
end type
global w_detalle_periodo_cierre_de_venta_emp w_detalle_periodo_cierre_de_venta_emp

type variables
datetime	ldt_fec_ini,ldt_fec_fin
Date		id_fec_ing_jefe, id_fec_ing_sup
String	is_cod_jefe, is_cod_super, is_cod_agente, is_nombre_jefe, is_nombre_supervisor
string	is_estado_cont, is_moneda, is_ventana, is_codigo
long		il_mes,il_year, il_tot_reg, il_row, il_mes_fin,il_year_fin

end variables

forward prototypes
public subroutine wf_cargar_agentes ()
public subroutine wf_cargar_jefe_venta ()
public subroutine wf_cargar_supervisores ()
end prototypes

public subroutine wf_cargar_agentes ();string	ls_codigo_aux, ls_codigo, ls_nombre, ls_a_pat, ls_a_mat, ls_estado, ls_clasifica,&
			ls_codigo_jefe, ls_codigo_sup, ls_nom_jefe, ls_nom_sup
Double	ll_tot_uf_promesas,ll_tot_uf_liberador,ll_suma_uf,ll_tot_uf_vc,ll_tot_uf_rn,&
			ll_tot_uf_p,ll_tot_uf_vsp,ll_tot_uf_aumento
Long		ll_indi, ll_new, ll_cont_unidad_nro, ll_cont_unidad_nro_lib,ll_vgte_con2_moras,&
			ll_suma_contrato, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp,ll_uni_vgte_con2_moras,&
			ll_mes_aux, ll_anno_aux, ll_mes, ll_anno,ll_cont_unidad_nro_aum
Date		ld_fecha_ing, ld_fecha_cierre, ld_fecha_ing_jefe, ld_fecha_ing_sup
SetPointer(HourGlass!)
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0

dw_jefe.reset()

ls_codigo_aux					= dw_lista.getitemstring(1,'agentes_cod_age')
setnull(ll_mes_aux)//  		= dw_lista.getitemnumber(1,'cierre_venta_periodo')
setnull(ll_anno_aux)// 		= dw_lista.getitemnumber(1,'cierre_venta_anno')
for ll_indi=1 to il_tot_reg
	gi_rut						= dw_lista.getitemnumber(ll_indi,'agentes_rut')
	ll_mes						= dw_lista.getitemnumber(ll_indi,'cierre_venta_periodo')
	ll_anno						= dw_lista.getitemnumber(ll_indi,'cierre_venta_anno')
	ld_fecha_cierre			= date(dw_lista.getitemdatetime(ll_indi,'oferta_v_cierre_venta'))
	is_cod_jefe					= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
	id_fec_ing_jefe			= date(dw_lista.getitemdatetime(ll_indi,'jefe_ventas_fecha_ing'))
	is_nombre_jefe				= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
	is_cod_super				= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
	id_fec_ing_sup				= date(dw_lista.getitemdatetime(ll_indi,'supervisor_fecha_ing'))
	is_nombre_supervisor		= dw_lista.getitemstring(ll_indi,'supervisor_nombre')
	is_nombre_supervisor		= is_nombre_supervisor+' '+dw_lista.getitemstring(ll_indi,'supervisor_a_paterno')
	is_nombre_supervisor		= is_nombre_supervisor+' '+dw_lista.getitemstring(ll_indi,'supervisor_a_materno')
	ls_codigo					= dw_lista.getitemstring(ll_indi,'agentes_cod_age')
	ls_nombre					= dw_lista.getitemstring(ll_indi,'agentes_nombre')
	ls_a_pat						= dw_lista.getitemstring(ll_indi,'agentes_a_paterno')
	ls_a_mat						= dw_lista.getitemstring(ll_indi,'agentes_a_materno')
	ls_estado					= dw_lista.getitemstring(ll_indi,'agentes_estado')
	ls_clasifica				= dw_lista.getitemstring(ll_indi,'agentes_clasificacion')
	ll_cont_unidad_nro		= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
	ll_cont_unidad_nro_lib	= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
	ll_cont_unidad_nro_aum	= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_aum')
	ll_tot_uf_promesas		= dw_lista.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
	ll_tot_uf_liberador		= dw_lista.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
	ll_tot_uf_aumento			= dw_lista.getitemNumber(ll_indi,'tot_uf_aumento_jefe')
	ld_fecha_ing				= date(dw_lista.getitemDatetime(ll_indi,'agentes_fecha_ini'))
	ll_suma_uf					= ll_tot_uf_promesas + ll_tot_uf_liberador + ll_tot_uf_aumento
	ll_suma_contrato			= ll_cont_unidad_nro + ll_cont_unidad_nro_lib + ll_cont_unidad_nro_aum
	ll_tot_vc					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_v_mas_c')
	ll_tot_rn					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_r_mas_n')
	ll_tot_p						= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_p')
	ll_tot_vsp					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_vsp')
	ll_tot_uf_vc				= dw_lista.getitemNumber(ll_indi,'uf_jefe_v_mas_c')
	ll_tot_uf_rn				= dw_lista.getitemNumber(ll_indi,'uf_jefe_r_mas_n')
	ll_tot_uf_p					= dw_lista.getitemNumber(ll_indi,'uf_jefe_p')
	ll_tot_uf_vsp				= dw_lista.getitemNumber(ll_indi,'sum_jefe_uf_vsp')
	ll_vgte_con2_moras		= dw_lista.getitemNumber(ll_indi,'jefe_vgte_con2_moras')
	ll_uni_vgte_con2_moras= dw_lista.getitemNumber(ll_indi,'jefe_uni_vgte_con2_moras')
	if (ll_mes <> ll_mes_aux or ll_anno <> ll_anno_aux) or (isnull(ll_mes_aux) or isnull(ll_anno_aux)) then
		if ll_mes > 0 and not isnull(ll_mes) and ls_codigo<>'' and not isnull(ls_codigo) then
			ll_new				= dw_jefe.insertrow(0)
			dw_jefe.scrolltorow(ll_new)
			dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
			dw_jefe.setitem(ll_new,'periodo',ll_mes)
			dw_jefe.setitem(ll_new,'anno',ll_anno)
			dw_jefe.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
			dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
			dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
			dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
			dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
			dw_jefe.setitem(ll_new,'clasifica_jefe',ls_clasifica)
			dw_jefe.setitem(ll_new,'estado',ls_estado)
			dw_jefe.setitem(ll_new,'unidad_vta_nro',ll_cont_unidad_nro)
			dw_jefe.setitem(ll_new,'unidad_uf_prome',ll_tot_uf_promesas)
			dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',ll_cont_unidad_nro_lib)
			dw_jefe.setitem(ll_new,'unidad_uf_d_lib',ll_tot_uf_liberador)
			dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
			dw_jefe.setitem(ll_new,'unidad_uf_aum',ll_tot_uf_aumento)
//			dw_jefe.setitem(ll_new,'unidad_vta_total',ll_suma_contrato)
			dw_jefe.setitem(ll_new,'unidad_uf_total_uf',ll_suma_uf)
			dw_jefe.setitem(ll_new,'tot_uni_v_c',ll_tot_vc)
			dw_jefe.setitem(ll_new,'tot_uni_r_n',ll_tot_rn)
			dw_jefe.setitem(ll_new,'tot_uni_p',ll_tot_p)
			dw_jefe.setitem(ll_new,'tot_uni_vsp',ll_tot_vsp)
			dw_jefe.setitem(ll_new,'tot_uf_v_c',ll_tot_uf_vc)
			dw_jefe.setitem(ll_new,'tot_uf_r_n',ll_tot_uf_rn)
			dw_jefe.setitem(ll_new,'tot_uf_p',ll_tot_uf_p)
			dw_jefe.setitem(ll_new,'tot_uf_vsp',ll_tot_uf_vsp)
			dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',ll_vgte_con2_moras)
			dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',ll_uni_vgte_con2_moras)
			dw_jefe.setitem(ll_new,'fec_inicial',ldt_fec_ini)
			dw_jefe.setitem(ll_new,'fec_final',ldt_fec_fin)
		end if
		ls_codigo_aux	= ls_codigo
		ll_mes_aux		= ll_mes
		ll_anno_aux		= ll_anno
	end if
next
//long		ll_periodo, ll_anno_periodo,ll_row
//datetime	ldt_fec_cierre_vta
//string	ls_string
//DECLARE x2 CURSOR FOR  
//SELECT	"CIERRE_VENTA"."PERIODO",   
//			"CIERRE_VENTA"."ANNO",   
//			"CIERRE_VENTA"."CIERRE_VENTA"  
//FROM 		"CIERRE_VENTA"  
//WHERE 	("CIERRE_VENTA"."CIERRE_VENTA" >= :ldt_fec_ini and "CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin)
//Using		sqlca	;
//open x2;
//if sqlca.sqlcode = 0 then
//	DO WHILE sqlca.sqlcode = 0
//		fetch x2 into :ll_periodo,:ll_anno_periodo,:ldt_fec_cierre_vta;
//		ls_string	= "periodo="+string(ll_periodo)+" and anno="+string(ll_anno_periodo)
//		ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount())
//		IF ll_row = 0 THEN
//			if ls_codigo<>'' and not isnull(ls_codigo) then
//				ll_new	= dw_jefe.insertrow(0)
//				dw_jefe.scrolltorow(ll_new)
//				dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
//				dw_jefe.setitem(ll_new,'periodo',ll_periodo)
//				dw_jefe.setitem(ll_new,'anno',ll_anno_periodo)
//				dw_jefe.setitem(ll_new,'fecha_cierre',ldt_fec_cierre_vta)
//				dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
//				dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
//				dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
//				dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
//				dw_jefe.setitem(ll_new,'clasifica_jefe',ls_clasifica)
//				dw_jefe.setitem(ll_new,'estado',ls_estado)
//				dw_jefe.setitem(ll_new,'unidad_vta_nro',0)
//				dw_jefe.setitem(ll_new,'unidad_uf_prome',0)
//				dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',0)
//				dw_jefe.setitem(ll_new,'unidad_uf_d_lib',0)
//				dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',0)
//				dw_jefe.setitem(ll_new,'unidad_uf_aum',0)
//		//			dw_jefe.setitem(ll_new,'unidad_vta_total',0)
//				dw_jefe.setitem(ll_new,'unidad_uf_total_uf',0)
//				dw_jefe.setitem(ll_new,'tot_uni_v_c',0)
//				dw_jefe.setitem(ll_new,'tot_uni_r_n',0)
//				dw_jefe.setitem(ll_new,'tot_uni_p',0)
//				dw_jefe.setitem(ll_new,'tot_uni_vsp',0)
//				dw_jefe.setitem(ll_new,'tot_uf_v_c',0)
//				dw_jefe.setitem(ll_new,'tot_uf_r_n',0)
//				dw_jefe.setitem(ll_new,'tot_uf_p',0)
//				dw_jefe.setitem(ll_new,'tot_uf_vsp',0)
//				dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',0)
//				dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',0)
//				dw_jefe.setitem(ll_new,'fec_inicial',ldt_fec_ini)
//				dw_jefe.setitem(ll_new,'fec_final',ldt_fec_fin)
//			end if
//		end if
//	LOOP
//end if
//close x2;
dw_jefe.sort()
dw_jefe.scrolltorow(1)
if gs_conexion = "Parque El Prado" then
	dw_jefe.object.t_titulo.text	= 'Parque EL PRADO'
elseif gs_conexion = "Parque La Foresta" then
	dw_jefe.object.t_titulo.text	= 'Parque LA FORESTA'
elseif gs_conexion = "Parque Concepción" then
	dw_jefe.object.t_titulo.text	= 'Parque CONCEPCION'
end if
if il_mes = il_mes_fin and il_year = il_year_fin then
	dw_jefe.object.t_cabecera.text	= 'Informe de Producción por Agente~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+ ' al '+string(ldt_fec_fin,'dd/mm/yyyy')
else
	dw_jefe.object.t_cabecera.text	= 'Informe de Producción por Agente~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
end if

dw_jefe.object.t_datos_jefe.text			= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
dw_jefe.object.t_datos_supervisor.text	= 'Supervisor:   '+is_cod_super+'   '+is_nombre_supervisor+'   Fec.Ingreso: '+string(id_fec_ing_sup,'dd/mm/yyyy')
dw_jefe.object.t_usuario.text				= gs_user
SetPointer(Arrow!)
end subroutine

public subroutine wf_cargar_jefe_venta ();String	ls_nombre,ls_a_pat,ls_a_mat, ls_codigo,ls_estado, ls_codigo_aux
Double	ll_tot_uf_promesas,ll_tot_uf_liberador,ll_tot_uf_vc,ll_tot_uf_rn,ll_tot_uf_p,ll_tot_uf_vsp,&
			ll_tot_uf_aumento
Long		ll_cont_unidad_nro, ll_cont_unidad_nro_lib
Long		ll_suma_contrato, ll_indi, ll_new, ll_suma_uf, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp,&
			ll_vgte_con2_moras
Long		ll_uni_vgte_con2_moras, ll_mes_aux, ll_anno_aux, ll_mes, ll_anno,ll_cont_unidad_nro_aum
Date		ld_fecha_ing, ld_fecha_cierre
SetPointer(HourGlass!)
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0

dw_jefe.reset()
ls_codigo_aux					= dw_lista.getitemstring(1,'jefe_ventas_jefe_ventas')
setnull(ll_mes_aux)  //		= dw_lista.getitemnumber(1,'cierre_venta_periodo')
setnull(ll_anno_aux) //		= dw_lista.getitemnumber(1,'cierre_venta_anno')
for ll_indi=1 to il_tot_reg
	gi_rut						= dw_lista.getitemnumber(ll_indi,'jefe_ventas_rut')
	ll_mes						= dw_lista.getitemnumber(ll_indi,'cierre_venta_periodo')
	ll_anno						= dw_lista.getitemnumber(ll_indi,'cierre_venta_anno')
	ld_fecha_cierre			= date(dw_lista.getitemdatetime(ll_indi,'oferta_v_cierre_venta'))
	ls_nombre					= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')
	ls_a_pat						= dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')
	ls_a_mat						= dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
	ls_codigo					= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
	ls_estado					= dw_lista.getitemstring(ll_indi,'jefe_ventas_estado')
	ll_cont_unidad_nro		= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
	ll_cont_unidad_nro_lib	=dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
	ll_cont_unidad_nro_aum	=dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_aum')
	ll_tot_uf_promesas		= dw_lista.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
	ll_tot_uf_liberador		= dw_lista.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
	ll_tot_uf_aumento			= dw_lista.getitemNumber(ll_indi,'tot_uf_aumento_jefe')
	ld_fecha_ing				= date(dw_lista.getitemDatetime(ll_indi,'jefe_ventas_fecha_ing'))
	ll_suma_uf					= ll_tot_uf_promesas + ll_tot_uf_liberador + ll_tot_uf_aumento
	ll_suma_contrato			= ll_cont_unidad_nro + ll_cont_unidad_nro_lib + ll_cont_unidad_nro_aum
	ll_tot_vc					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_v_mas_c')
	ll_tot_rn					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_r_mas_n')
	ll_tot_p						= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_p')
	ll_tot_vsp					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_vsp')
	ll_tot_uf_vc				= dw_lista.getitemNumber(ll_indi,'uf_jefe_v_mas_c')
	ll_tot_uf_rn				= dw_lista.getitemNumber(ll_indi,'uf_jefe_r_mas_n')
	ll_tot_uf_p					= dw_lista.getitemNumber(ll_indi,'uf_jefe_p')
	ll_tot_uf_vsp				= dw_lista.getitemNumber(ll_indi,'sum_jefe_uf_vsp')
	ll_vgte_con2_moras		= dw_lista.getitemNumber(ll_indi,'jefe_vgte_con2_moras')
	ll_uni_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'jefe_uni_vgte_con2_moras')
	if (ll_mes <> ll_mes_aux or ll_anno <> ll_anno_aux) or (isnull(ll_mes_aux) or isnull(ll_anno_aux)) then
		if ll_mes > 0 and not isnull(ll_mes) then
			ll_new				= dw_jefe.insertrow(0)
			dw_jefe.scrolltorow(ll_new)
			dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
			dw_jefe.setitem(ll_new,'periodo',ll_mes)
			dw_jefe.setitem(ll_new,'anno',ll_anno)
			dw_jefe.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
			dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
			dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
			dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
			dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
			dw_jefe.setitem(ll_new,'clasifica_jefe','X')
			dw_jefe.setitem(ll_new,'estado',ls_estado)
			dw_jefe.setitem(ll_new,'unidad_vta_nro',ll_cont_unidad_nro)
			dw_jefe.setitem(ll_new,'unidad_uf_prome',ll_tot_uf_promesas)
			dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',ll_cont_unidad_nro_lib)
			dw_jefe.setitem(ll_new,'unidad_uf_d_lib',ll_tot_uf_liberador)
//			dw_jefe.setitem(ll_new,'unidad_vta_total',ll_suma_contrato)
			dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
			dw_jefe.setitem(ll_new,'unidad_uf_aum',ll_tot_uf_aumento)
			dw_jefe.setitem(ll_new,'unidad_uf_total_uf',ll_suma_uf)
			dw_jefe.setitem(ll_new,'tot_uni_v_c',ll_tot_vc)
			dw_jefe.setitem(ll_new,'tot_uni_r_n',ll_tot_rn)
			dw_jefe.setitem(ll_new,'tot_uni_p',ll_tot_p)
			dw_jefe.setitem(ll_new,'tot_uni_vsp',ll_tot_vsp)
			dw_jefe.setitem(ll_new,'tot_uf_v_c',ll_tot_uf_vc)
			dw_jefe.setitem(ll_new,'tot_uf_r_n',ll_tot_uf_rn)
			dw_jefe.setitem(ll_new,'tot_uf_p',ll_tot_uf_p)
			dw_jefe.setitem(ll_new,'tot_uf_vsp',ll_tot_uf_vsp)
			dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',ll_vgte_con2_moras)
			dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',ll_uni_vgte_con2_moras)
		end if
		ls_codigo_aux	= ls_codigo
		ll_mes_aux		= ll_mes
		ll_anno_aux		= ll_anno
	end if
next
//long		ll_periodo, ll_anno_periodo,ll_row
//datetime	ldt_fec_cierre_vta
//string	ls_string
//DECLARE x2 CURSOR FOR  
//SELECT	"CIERRE_VENTA"."PERIODO",   
//			"CIERRE_VENTA"."ANNO",   
//			"CIERRE_VENTA"."CIERRE_VENTA"  
//FROM 		"CIERRE_VENTA"  
//WHERE 	("CIERRE_VENTA"."CIERRE_VENTA" >= :ldt_fec_ini and "CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin)
//Using		sqlca	;
//open x2;
//if sqlca.sqlcode = 0 then
//	DO WHILE sqlca.sqlcode = 0
//		fetch x2 into :ll_periodo,:ll_anno_periodo,:ldt_fec_cierre_vta;
//		ls_string	= "periodo="+string(ll_periodo)+" and anno="+string(ll_anno_periodo)
//		ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount())
//		IF ll_row = 0 THEN
//			ll_new	= dw_jefe.insertrow(0)
//			dw_jefe.scrolltorow(ll_new)
//			dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
//			dw_jefe.setitem(ll_new,'periodo',ll_periodo)
//			dw_jefe.setitem(ll_new,'anno',ll_anno_periodo)
//			dw_jefe.setitem(ll_new,'fecha_cierre',ldt_fec_cierre_vta)
//			dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
//			dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
//			dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
//			dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
//			dw_jefe.setitem(ll_new,'clasifica_jefe','X')
//			dw_jefe.setitem(ll_new,'estado',ls_estado)
//			dw_jefe.setitem(ll_new,'unidad_vta_nro',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_prome',0)
//			dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_d_lib',0)
//			dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_aum',0)
//	//			dw_jefe.setitem(ll_new,'unidad_vta_total',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_total_uf',0)
//			dw_jefe.setitem(ll_new,'tot_uni_v_c',0)
//			dw_jefe.setitem(ll_new,'tot_uni_r_n',0)
//			dw_jefe.setitem(ll_new,'tot_uni_p',0)
//			dw_jefe.setitem(ll_new,'tot_uni_vsp',0)
//			dw_jefe.setitem(ll_new,'tot_uf_v_c',0)
//			dw_jefe.setitem(ll_new,'tot_uf_r_n',0)
//			dw_jefe.setitem(ll_new,'tot_uf_p',0)
//			dw_jefe.setitem(ll_new,'tot_uf_vsp',0)
//			dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',0)
//			dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',0)
//		end if
//	LOOP
//end if
//close x2;
dw_jefe.sort()
dw_jefe.scrolltorow(1)
if gs_conexion = "Parque El Prado" then
	dw_jefe.object.t_titulo.text	= 'Parque EL PRADO'
elseif gs_conexion = "Parque La Foresta" then
	dw_jefe.object.t_titulo.text	= 'Parque LA FORESTA'
elseif gs_conexion = "Parque Concepción" then
	dw_jefe.object.t_titulo.text	= 'Parque CONCEPCION'
end if
if il_mes = il_mes_fin and il_year = il_year_fin then	
	dw_jefe.object.t_cabecera.text= 'Informe de Producción por Jefe Venta~rCierre de Venta desde: '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
else
	dw_jefe.object.t_cabecera.text= 'Informe de Producción por Jefe Venta~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
end if
dw_jefe.object.t_usuario.text		= gs_user
SetPointer(Arrow!)
end subroutine

public subroutine wf_cargar_supervisores ();string	ls_codigo_aux, ls_codigo, ls_nombre, ls_a_pat, ls_a_mat, ls_estado, ls_clasifica,&
			ls_codigo_jefe, ls_nom_jefe
Double	ll_tot_uf_promesas,ll_tot_uf_liberador,ll_suma_uf,ll_tot_uf_vc,ll_tot_uf_rn,&
			ll_tot_uf_p,ll_tot_uf_vsp,ll_tot_uf_aumento
Long		ll_indi, ll_new, ll_cont_unidad_nro, ll_cont_unidad_nro_lib,ll_cont_unidad_nro_aum,&
			ll_suma_contrato, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp,ll_vgte_con2_moras,&
			ll_uni_vgte_con2_moras, ll_mes_aux, ll_anno_aux, ll_mes, ll_anno
Date		ld_fecha_ing, ld_fecha_cierre, ld_fecha_ing_jefe
SetPointer(HourGlass!)
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0

dw_jefe.reset()
ls_codigo_aux	= dw_lista.getitemstring(1,'supervisor_cod_sup')
setnull(ll_mes_aux)  //		= dw_lista.getitemnumber(1,'cierre_venta_periodo')
setnull(ll_anno_aux) //		= dw_lista.getitemnumber(1,'cierre_venta_anno')
for ll_indi=1 to il_tot_reg
	gi_rut					= dw_lista.getitemnumber(ll_indi,'supervisor_rut')
	ll_mes					= dw_lista.getitemnumber(ll_indi,'cierre_venta_periodo')
	ll_anno					= dw_lista.getitemnumber(ll_indi,'cierre_venta_anno')
	ld_fecha_cierre		= date(dw_lista.getitemdatetime(ll_indi,'oferta_v_cierre_venta'))
	is_cod_jefe				= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
	id_fec_ing_jefe		= date(dw_lista.getitemdatetime(ll_indi,'jefe_ventas_fecha_ing'))
	is_nombre_jefe			= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
	ls_codigo				= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
	ls_nombre				= dw_lista.getitemstring(ll_indi,'supervisor_nombre')
	ls_a_pat					= dw_lista.getitemstring(ll_indi,'supervisor_a_paterno')
	ls_a_mat					= dw_lista.getitemstring(ll_indi,'supervisor_a_materno')
	ls_estado				= dw_lista.getitemstring(ll_indi,'supervisor_estado')
	ls_clasifica			= dw_lista.getitemstring(ll_indi,'supervisor_clasifica')
	ll_cont_unidad_nro	= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
	ll_cont_unidad_nro_lib=dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
	ll_cont_unidad_nro_aum=dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_aum')
	ll_tot_uf_promesas	= dw_lista.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
	ll_tot_uf_liberador	= dw_lista.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
	ll_tot_uf_aumento		= dw_lista.getitemNumber(ll_indi,'tot_uf_aumento_jefe')
	ld_fecha_ing			= date(dw_lista.getitemDatetime(ll_indi,'supervisor_fecha_ing'))
	ll_suma_uf				= ll_tot_uf_promesas + ll_tot_uf_liberador + ll_tot_uf_aumento
	ll_suma_contrato		= ll_cont_unidad_nro + ll_cont_unidad_nro_lib + ll_cont_unidad_nro_aum
	ll_tot_vc				= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_v_mas_c')
	ll_tot_rn				= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_r_mas_n')
	ll_tot_p					= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_p')
	ll_tot_vsp				= dw_lista.getitemNumber(ll_indi,'sum_jefe_uni_vsp')
	ll_tot_uf_vc			= dw_lista.getitemNumber(ll_indi,'uf_jefe_v_mas_c')
	ll_tot_uf_rn			= dw_lista.getitemNumber(ll_indi,'uf_jefe_r_mas_n')
	ll_tot_uf_p				= dw_lista.getitemNumber(ll_indi,'uf_jefe_p')
	ll_tot_uf_vsp			= dw_lista.getitemNumber(ll_indi,'sum_jefe_uf_vsp')
	ll_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'jefe_vgte_con2_moras')
	ll_uni_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'jefe_uni_vgte_con2_moras')
	if (ll_mes <> ll_mes_aux or ll_anno <> ll_anno_aux) or (isnull(ll_mes_aux) or isnull(ll_anno_aux))then
		if ll_mes > 0 and not isnull(ll_mes) then
			ll_new	= dw_jefe.insertrow(0)
			dw_jefe.scrolltorow(ll_new)
			dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
			dw_jefe.setitem(ll_new,'periodo',ll_mes)
			dw_jefe.setitem(ll_new,'anno',ll_anno)
			dw_jefe.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
			dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
			dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
			dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
			dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
			dw_jefe.setitem(ll_new,'clasifica_jefe',ls_clasifica)
			dw_jefe.setitem(ll_new,'estado',ls_estado)
			dw_jefe.setitem(ll_new,'unidad_vta_nro',ll_cont_unidad_nro)
			dw_jefe.setitem(ll_new,'unidad_uf_prome',ll_tot_uf_promesas)
			dw_jefe.setitem(ll_new,'unidad_uf_aum',ll_tot_uf_aumento)
			dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',ll_cont_unidad_nro_lib)
			dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
			dw_jefe.setitem(ll_new,'unidad_uf_d_lib',ll_tot_uf_liberador)
//				dw_jefe.setitem(ll_new,'unidad_vta_total',ll_suma_contrato)
			dw_jefe.setitem(ll_new,'unidad_uf_total_uf',ll_suma_uf)
			dw_jefe.setitem(ll_new,'tot_uni_v_c',ll_tot_vc)
			dw_jefe.setitem(ll_new,'tot_uni_r_n',ll_tot_rn)
			dw_jefe.setitem(ll_new,'tot_uni_p',ll_tot_p)
			dw_jefe.setitem(ll_new,'tot_uni_vsp',ll_tot_vsp)
			dw_jefe.setitem(ll_new,'tot_uf_v_c',ll_tot_uf_vc)
			dw_jefe.setitem(ll_new,'tot_uf_r_n',ll_tot_uf_rn)
			dw_jefe.setitem(ll_new,'tot_uf_p',ll_tot_uf_p)
			dw_jefe.setitem(ll_new,'tot_uf_vsp',ll_tot_uf_vsp)
			dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',ll_vgte_con2_moras)
			dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',ll_uni_vgte_con2_moras)
		end if
		ls_codigo_aux	= ls_codigo
		ll_mes_aux		= ll_mes
		ll_anno_aux		= ll_anno
	end if
next
//long		ll_periodo, ll_anno_periodo,ll_row
//datetime	ldt_fec_cierre_vta
//string	ls_string
//DECLARE x2 CURSOR FOR  
//SELECT	"CIERRE_VENTA"."PERIODO",   
//			"CIERRE_VENTA"."ANNO",   
//			"CIERRE_VENTA"."CIERRE_VENTA"  
//FROM 		"CIERRE_VENTA"  
//WHERE 	("CIERRE_VENTA"."CIERRE_VENTA" >= :ldt_fec_ini and "CIERRE_VENTA"."CIERRE_VENTA" <= :ldt_fec_fin)
//Using		sqlca	;
//open x2;
//if sqlca.sqlcode = 0 then
//	DO WHILE sqlca.sqlcode = 0
//		fetch x2 into :ll_periodo,:ll_anno_periodo,:ldt_fec_cierre_vta;
//		ls_string	= "periodo="+string(ll_periodo)+" and anno="+string(ll_anno_periodo)
//		ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount())
//		IF ll_row = 0 THEN
//			ll_new	= dw_jefe.insertrow(0)
//			dw_jefe.scrolltorow(ll_new)
//			dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
//			dw_jefe.setitem(ll_new,'periodo',ll_periodo)
//			dw_jefe.setitem(ll_new,'anno',ll_anno_periodo)
//			dw_jefe.setitem(ll_new,'fecha_cierre',ldt_fec_cierre_vta)
//			dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
//			dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
//			dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
//			dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
//			dw_jefe.setitem(ll_new,'clasifica_jefe',ls_clasifica)
//			dw_jefe.setitem(ll_new,'estado',ls_estado)
//			dw_jefe.setitem(ll_new,'unidad_vta_nro',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_prome',0)
//			dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_d_lib',0)
//			dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_aum',0)
//	//			dw_jefe.setitem(ll_new,'unidad_vta_total',0)
//			dw_jefe.setitem(ll_new,'unidad_uf_total_uf',0)
//			dw_jefe.setitem(ll_new,'tot_uni_v_c',0)
//			dw_jefe.setitem(ll_new,'tot_uni_r_n',0)
//			dw_jefe.setitem(ll_new,'tot_uni_p',0)
//			dw_jefe.setitem(ll_new,'tot_uni_vsp',0)
//			dw_jefe.setitem(ll_new,'tot_uf_v_c',0)
//			dw_jefe.setitem(ll_new,'tot_uf_r_n',0)
//			dw_jefe.setitem(ll_new,'tot_uf_p',0)
//			dw_jefe.setitem(ll_new,'tot_uf_vsp',0)
//			dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',0)
//			dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',0)
//		end if
//	LOOP
//end if
//close x2;
dw_jefe.sort()
dw_jefe.scrolltorow(1)
if gs_conexion = "Parque El Prado" then
	dw_jefe.object.t_titulo.text	= 'Parque EL PRADO'
elseif gs_conexion = "Parque La Foresta" then
	dw_jefe.object.t_titulo.text	= 'Parque LA FORESTA'
elseif gs_conexion = "Parque Concepción" then
	dw_jefe.object.t_titulo.text	= 'Parque CONCEPCION'
end if
if il_mes = il_mes_fin and il_year = il_year_fin then
	dw_jefe.object.t_cabecera.text= 'Informe de Producción por Supervisor~rCierre de Venta desde: '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
else
	dw_jefe.object.t_cabecera.text= 'Informe de Producción por Supervisor~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
end if
dw_jefe.object.t_datos_jefe.text	= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
dw_jefe.object.t_usuario.text		= gs_user
SetPointer(Arrow!)
end subroutine

on w_detalle_periodo_cierre_de_venta_emp.create
this.cb_1=create cb_1
this.cb_detalle_venta=create cb_detalle_venta
this.dw_print=create dw_print
this.cb_gestion=create cb_gestion
this.pb_exportar=create pb_exportar
this.pb_imprimir=create pb_imprimir
this.pb_ordenar=create pb_ordenar
this.pb_filtrar=create pb_filtrar
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.dw_jefe=create dw_jefe
this.Control[]={this.cb_1,&
this.cb_detalle_venta,&
this.dw_print,&
this.cb_gestion,&
this.pb_exportar,&
this.pb_imprimir,&
this.pb_ordenar,&
this.pb_filtrar,&
this.pb_cerrar,&
this.dw_lista,&
this.dw_jefe}
end on

on w_detalle_periodo_cierre_de_venta_emp.destroy
destroy(this.cb_1)
destroy(this.cb_detalle_venta)
destroy(this.dw_print)
destroy(this.cb_gestion)
destroy(this.pb_exportar)
destroy(this.pb_imprimir)
destroy(this.pb_ordenar)
destroy(this.pb_filtrar)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
destroy(this.dw_jefe)
end on

event open;
gf_centrar(w_detalle_periodo_cierre_de_venta_emp)
pb_cerrar.enabled				= true
SetPointer(HourGlass!)
ldt_fec_ini						= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ldt_fec_fin						= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
is_ventana						= substr(1,3,Message.StringParm)
is_codigo						= substr(1,4,Message.StringParm)
CHOOSE CASE is_ventana
	CASE "1"
		dw_jefe.dataobject	= 'dwe_gestion_ventas_por_jefe_2'
		dw_lista.dataobject	= 'dw_informe_gestion_ventas_por_jefe_fecha'
	CASE "2"
		dw_jefe.dataobject	= 'dwe_gestion_ventas_por_super_2'
		dw_lista.dataobject	= 'dw_informe_gestion_ventas_por_sup_fecha'
	CASE "3"
		dw_jefe.dataobject	= 'dwe_gestion_ventas_por_agente_2'
		dw_lista.dataobject	= 'dw_informe_gestion_ventas_por_age_fecha'
END CHOOSE
dw_lista.settransobject(sqlca)
dw_jefe.settransobject(sqlca)
il_tot_reg						= dw_lista.retrieve(is_codigo,ldt_fec_ini,ldt_fec_fin)
if il_tot_reg=0 then
	messagebox("Advertencia","No registra datos")
	close(w_detalle_periodo_cierre_de_venta_emp)
else
	CHOOSE CASE is_ventana
		CASE "1" //jefe
			wf_cargar_jefe_venta()
		CASE "2" //superv
			wf_cargar_supervisores()
		CASE "3" //agente
			wf_cargar_agentes()
	END CHOOSE
end if
dw_jefe.setsort("fecha_cierre A")
dw_jefe.sort()

gs_ventana						= 'w_detalle_periodo_cierre_de_venta_emp'
f_valida_objeto_1()
SetPointer(Arrow!)

end event

type cb_1 from commandbutton within w_detalle_periodo_cierre_de_venta_emp
integer x = 1728
integer y = 1992
integer width = 654
integer height = 112
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Licencias Médicas Hist."
end type

event clicked;string	ls_codigo
long		ll_fila
ll_fila	= dw_jefe.getrow()
if ll_fila > 0 then
	if dw_jefe.dataobject='dwe_gestion_ventas_por_jefe_2' or &
		dw_jefe.dataobject='dwe_gestion_ventas_por_super_2' or &
		dw_jefe.dataobject='dwe_gestion_ventas_por_agente_2' then
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
		openwithparm(w_reporte_licencias,ls_codigo)
	end if
end if
end event

type cb_detalle_venta from commandbutton within w_detalle_periodo_cierre_de_venta_emp
integer x = 1275
integer y = 1992
integer width = 448
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo, ls_string
Long		ll_fila
ll_fila	= dw_jefe.getrow() 
if ll_fila > 0 then
	if isvalid(w_detalle_ventas_por_xxx) then close(w_detalle_ventas_por_xxx)
	CHOOSE CASE dw_jefe.dataobject
		CASE 'dwe_gestion_ventas_por_jefe_2'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
			ls_string	= "1"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)
		CASE 'dwe_gestion_ventas_por_super_2'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
			ls_string	= "2"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)
		CASE 'dwe_gestion_ventas_por_agente_2'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
			ls_string	= "3"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)	
	END CHOOSE
end if	

end event

type dw_print from datawindow within w_detalle_periodo_cierre_de_venta_emp
boolean visible = false
integer x = 2939
integer y = 1984
integer width = 411
integer height = 432
string dataobject = "dwe_gestion_ventas_por_agente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_gestion from commandbutton within w_detalle_periodo_cierre_de_venta_emp
integer x = 869
integer y = 1992
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Gestion"
end type

event clicked;if dw_jefe.rowcount() > 0 then
	if dw_jefe.dataobject = 'dwe_gestion_ventas_por_agente_2' then
		if isvalid(w_inf_gestion_individual) then close(w_inf_gestion_individual)
		OpenWithParm(w_inf_gestion_individual, "3")
		w_inf_gestion_individual.rb_agente.checked 		= true
		w_inf_gestion_individual.rb_agente.triggerevent(clicked!)
	end if
	if dw_jefe.dataobject ='dwe_gestion_ventas_por_super_2' then
		if isvalid(w_inf_gestion_individual) then close(w_inf_gestion_individual)
		OpenWithParm(w_inf_gestion_individual, "2")
		w_inf_gestion_individual.rb_supervisor.checked = true
		w_inf_gestion_individual.rb_supervisor.triggerevent(clicked!)
	end if
	if dw_jefe.dataobject = 'dwe_gestion_ventas_por_jefe_2' then
		if isvalid(w_inf_gestion_individual) then close(w_inf_gestion_individual)
		OpenWithParm(w_inf_gestion_individual, "1")
		w_inf_gestion_individual.rb_jefe.checked 		= true
		w_inf_gestion_individual.rb_jefe.triggerevent(clicked!)
	end if
	gf_centrar(w_inf_gestion_individual)
	w_inf_gestion_individual.st_detalle.visible		= false
	w_inf_gestion_individual.dw_lista.settransobject(sqlca)
	w_inf_gestion_individual.dw_detalle.settransobject(sqlca)
	w_inf_gestion_individual.dw_general.settransobject(sqlca)
	w_inf_gestion_individual.dw_informe.dataobject 	= 'dw_informe'
	w_inf_gestion_individual.dw_informe.settransobject(sqlca)
	w_inf_gestion_individual.dw_sin_detalle.settransobject(sqlca)
	w_inf_gestion_individual.dw_sin_detalle.visible	= false
	w_inf_gestion_individual.dw_informe.HSplitScroll= TRUE
	if w_inf_gestion_individual.dw_lista.retrieve() = 0 then messagebox("Advertencia","No registra dato")
	if w_inf_gestion_individual.rb_agente.checked = true then
		w_inf_gestion_individual.dw_informe.object.c_por_agente.Visible	= 0
		w_inf_gestion_individual.dw_informe.object.c_clasif.Visible 		= 1
		w_inf_gestion_individual.dw_informe.object.c_rescomi.x				= 892
		w_inf_gestion_individual.dw_informe.object.c_clasif.x 				= 1527
	end if
	if w_inf_gestion_individual.rb_jefe.checked = true then
		w_inf_gestion_individual.dw_informe.object.c_por_agente.Visible = 1
		w_inf_gestion_individual.dw_informe.object.c_rescomi.x				= 892
		w_inf_gestion_individual.dw_informe.object.c_por_agente.x			= 1527
		w_inf_gestion_individual.dw_informe.object.c_clasif.Visible 		= 0
		w_inf_gestion_individual.dw_informe.object.c_clasif.Visible 		= 0
		w_inf_gestion_individual.dw_informe.object.c_por_agente.text 		= 'Por Supervisor'
	end if
	if w_inf_gestion_individual.rb_supervisor.checked = true then
		w_inf_gestion_individual.dw_informe.object.c_por_agente.Visible	= 1
		w_inf_gestion_individual.dw_informe.object.c_clasif.Visible 		= 1
		w_inf_gestion_individual.dw_informe.object.c_por_agente.x			= 1733
		w_inf_gestion_individual.dw_informe.object.c_clasif.x					= 1162
		w_inf_gestion_individual.dw_informe.object.c_rescomi.x				= 663
		w_inf_gestion_individual.dw_informe.object.c_por_agente.text 		= 'Por Agente'
	end if
	if dw_jefe.dataobject = 'dwe_gestion_ventas_por_agente_2' then
		w_inf_gestion_individual.em_codigo.text	= dw_jefe.getitemstring(dw_jefe.getrow(),'cod_jefe')
		w_inf_gestion_individual.em_codigo.triggerevent(modified!)
		w_inf_gestion_individual.em_1.text					= string(ldt_fec_ini,'dd/mm/yyyy')
		w_inf_gestion_individual.em_2.text					= string(ldt_fec_fin,'dd/mm/yyyy')
		w_inf_gestion_individual.title 						= "Informe Gestion Actual por Agente"
		w_inf_gestion_individual.rb_jefe.checked 			= false
		w_inf_gestion_individual.rb_supervisor.checked 	= false
		w_inf_gestion_individual.pb_general.enabled		= true
	end if
	if dw_jefe.dataobject ='dwe_gestion_ventas_por_super_2' then
		w_inf_gestion_individual.em_codigo.text			= dw_jefe.getitemstring(dw_jefe.getrow(),'cod_jefe')
		w_inf_gestion_individual.em_codigo.triggerevent(modified!)
		w_inf_gestion_individual.em_1.text					= string(ldt_fec_ini,'dd/mm/yyyy')
		w_inf_gestion_individual.em_2.text					= string(ldt_fec_fin,'dd/mm/yyyy')
		w_inf_gestion_individual.title 						= "Informe Gestion Actual por Supervisor"
		w_inf_gestion_individual.rb_jefe.checked 			= false
		w_inf_gestion_individual.rb_agente.checked 		= false
		w_inf_gestion_individual.pb_general.enabled		= false
	end if
	if dw_jefe.dataobject = 'dwe_gestion_ventas_por_jefe_2' then
		w_inf_gestion_individual.em_codigo.text			= dw_jefe.getitemstring(dw_jefe.getrow(),'cod_jefe')
		w_inf_gestion_individual.em_codigo.triggerevent(modified!)
		w_inf_gestion_individual.em_1.text					= string(ldt_fec_ini,'dd/mm/yyyy')
		w_inf_gestion_individual.em_2.text					= string(ldt_fec_fin,'dd/mm/yyyy')
		w_inf_gestion_individual.title 						= "Informe Gestion Actual por Jefe de Venta"
		w_inf_gestion_individual.rb_supervisor.checked 	= false
		w_inf_gestion_individual.rb_agente.checked 		= false
		w_inf_gestion_individual.pb_general.enabled		= true
	end if
	w_inf_gestion_individual.pb_aceptar.triggerevent(clicked!)
else
	messagebox("Advertencia","No hay datos a consultar")
end if
w_inf_gestion_individual.pb_aceptar.setfocus()
end event

type pb_exportar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
event ue_mousemove pbm_mousemove
integer x = 46
integer y = 1976
integer width = 165
integer height = 148
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_jefe
if dw_jefe.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_imprimir from picturebutton within w_detalle_periodo_cierre_de_venta_emp
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1976
integer width = 165
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;String	ls_nombre,ls_a_pat,ls_a_mat, ls_codigo,ls_estado, ls_codigo_aux, ls_clasifica
long		ll_tot_reg, ll_indi, ll_new,ll_cont_unidad_nro, ll_cont_unidad_nro_lib,&
			ll_suma_contrato, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp, ll_vgte_con2_moras,&
			ll_uni_vgte_con2_moras, ll_periodo, ll_anno,ll_cont_unidad_nro_aum
Double	ll_tot_uf_vc,ll_tot_uf_rn,ll_tot_uf_p,ll_tot_uf_vsp, ll_suma_uf,ll_tot_uf_promesas,&
			ll_tot_uf_liberador,ll_tot_uf_aumento
Date		ld_fecha_ing, ld_fecha_cierre
Datetime	ldt_fecha_ini, ldt_fecha_fin
ll_tot_reg	= dw_jefe.rowcount()
if ll_tot_reg > 0 then
	CHOOSE CASE dw_jefe.dataobject
		CASE 'dwe_gestion_ventas_por_jefe_2'
			dw_print.dataobject	= 'dwe_gestion_ventas_por_jefe'
			dw_print.settransobject(sqlca)
		CASE 'dwe_gestion_ventas_por_super_2'
			dw_print.dataobject	= 'dwe_gestion_ventas_por_super'
			dw_print.settransobject(sqlca)
		CASE 'dwe_gestion_ventas_por_agente_2'
			dw_print.dataobject	= 'dwe_gestion_ventas_por_agente'
			dw_print.settransobject(sqlca)
	END CHOOSE
	if dw_jefe.rowcount() > 0 then 
		if dw_jefe.dataobject = 'dwe_gestion_ventas_por_jefe_2' or &
			dw_jefe.dataobject = 'dwe_gestion_ventas_por_super_2' or &
			dw_jefe.dataobject = 'dwe_gestion_ventas_por_agente_2' then
			for ll_indi = 1 to ll_tot_reg
				ls_codigo					= dw_jefe.getitemstring(ll_indi,'cod_jefe')
				ll_periodo					= dw_jefe.getitemnumber(ll_indi,'periodo')
				ll_anno						= dw_jefe.getitemnumber(ll_indi,'anno')
				ld_fecha_cierre			= date(dw_jefe.getitemdatetime(ll_indi,'fecha_cierre'))
				ls_nombre					= dw_jefe.getitemstring(ll_indi,'nom_jefe')
				ls_a_pat						= dw_jefe.getitemstring(ll_indi,'ap_paterno')
				ls_a_mat						= dw_jefe.getitemstring(ll_indi,'ap_materno')
				ld_fecha_ing				= date(dw_jefe.getitemdatetime(ll_indi,'fec_ing_jefe'))
				ls_clasifica				= dw_jefe.getitemstring(ll_indi,'clasifica_jefe')
				ls_estado					= dw_jefe.getitemstring(ll_indi,'estado')
				ll_cont_unidad_nro		= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro')
				ll_tot_uf_promesas		= dw_jefe.getitemnumber(ll_indi,'unidad_uf_prome')
				ll_cont_unidad_nro_lib	= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro_lib')
				ll_tot_uf_liberador		= dw_jefe.getitemnumber(ll_indi,'unidad_uf_d_lib')
				ll_cont_unidad_nro_aum	= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro_aum')
				ll_tot_uf_aumento			= dw_jefe.getitemnumber(ll_indi,'unidad_uf_aum')
				ll_suma_uf					= dw_jefe.getitemnumber(ll_indi,'unidad_uf_total_uf')
				ll_tot_vc					= dw_jefe.getitemnumber(ll_indi,'tot_uni_v_c')
				ll_tot_rn					= dw_jefe.getitemnumber(ll_indi,'tot_uni_r_n')
				ll_tot_p						= dw_jefe.getitemnumber(ll_indi,'tot_uni_p')
				ll_tot_vsp					= dw_jefe.getitemnumber(ll_indi,'tot_uni_vsp')
				ll_tot_uf_vc				= dw_jefe.getitemnumber(ll_indi,'tot_uf_v_c')
				ll_tot_uf_rn				= dw_jefe.getitemnumber(ll_indi,'tot_uf_r_n')
				ll_tot_uf_p					= dw_jefe.getitemnumber(ll_indi,'tot_uf_p')
				ll_tot_uf_vsp				= dw_jefe.getitemnumber(ll_indi,'tot_uf_vsp')
				ll_vgte_con2_moras		= dw_jefe.getitemnumber(ll_indi,'tot_uf_v_2_moras')
				ll_uni_vgte_con2_moras	= dw_jefe.getitemnumber(ll_indi,'tot_uni_v_2_moras')
				if dw_jefe.dataobject = 'dwe_gestion_ventas_por_agente_2' then
					ldt_fecha_ini			= dw_jefe.getitemDatetime(ll_indi,'fec_inicial')
					ldt_fecha_fin			= dw_jefe.getitemDatetime(ll_indi,'fec_final')
				end if
				ll_new						= dw_print.insertrow(0)
				dw_print.scrolltorow(ll_new)
				dw_print.setitem(ll_new,'cod_jefe',ls_codigo)
				dw_print.setitem(ll_new,'periodo',ll_periodo)
				dw_print.setitem(ll_new,'anno',ll_anno)
				dw_print.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
				dw_print.setitem(ll_new,'nom_jefe',ls_nombre)
				dw_print.setitem(ll_new,'ap_paterno',ls_a_pat)
				dw_print.setitem(ll_new,'ap_materno',ls_a_mat)
				dw_print.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
				dw_print.setitem(ll_new,'clasifica_jefe',ls_clasifica)
				dw_print.setitem(ll_new,'estado',ls_estado)
				dw_print.setitem(ll_new,'unidad_vta_nro',ll_cont_unidad_nro)
				dw_print.setitem(ll_new,'unidad_uf_prome',ll_tot_uf_promesas)
				dw_print.setitem(ll_new,'unidad_vta_nro_lib',ll_cont_unidad_nro_lib)
				dw_print.setitem(ll_new,'unidad_uf_d_lib',ll_tot_uf_liberador)
				dw_print.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
				dw_print.setitem(ll_new,'unidad_uf_aum',ll_tot_uf_aumento)
				dw_print.setitem(ll_new,'unidad_uf_total_uf',ll_suma_uf)
				dw_print.setitem(ll_new,'tot_uni_v_c',ll_tot_vc)
				dw_print.setitem(ll_new,'tot_uni_r_n',ll_tot_rn)
				dw_print.setitem(ll_new,'tot_uni_p',ll_tot_p)
				dw_print.setitem(ll_new,'tot_uni_vsp',ll_tot_vsp)
				dw_print.setitem(ll_new,'tot_uf_v_c',ll_tot_uf_vc)
				dw_print.setitem(ll_new,'tot_uf_r_n',ll_tot_uf_rn)
				dw_print.setitem(ll_new,'tot_uf_p',ll_tot_uf_p)
				dw_print.setitem(ll_new,'tot_uf_vsp',ll_tot_uf_vsp)
				dw_print.setitem(ll_new,'tot_uf_v_2_moras',ll_vgte_con2_moras)
				dw_print.setitem(ll_new,'tot_uni_v_2_moras',ll_uni_vgte_con2_moras)
				if dw_jefe.dataobject = 'dwe_gestion_ventas_por_agente_2' then
					dw_print.setitem(ll_new,'fec_inicial',ldt_fecha_ini)
					dw_print.setitem(ll_new,'fec_final',ldt_fecha_fin)
				end if
			next
			dw_print.object.t_usuario.text					= gs_user
			if gs_conexion = "Parque El Prado" then
				dw_print.object.t_titulo.text					= 'Parque EL PRADO'
			elseif gs_conexion = "Parque La Foresta" then
				dw_print.object.t_titulo.text					= 'Parque LA FORESTA'
			elseif gs_conexion = "Parque Concepción" then
				dw_print.object.t_titulo.text					= 'Parque CONCEPCION'
			end if
			CHOOSE CASE dw_print.dataobject
				CASE 'dwe_gestion_ventas_por_jefe'
					if il_mes = il_mes_fin and il_year = il_year_fin then
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Jefe Venta~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year)+', Cierre de Venta: '+string(ldt_fec_ini,'dd/mm/yyyy')
					else
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Jefe Venta~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin)+'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
					end if

				CASE 'dwe_gestion_ventas_por_super'
					if il_mes = il_mes_fin and il_year = il_year_fin then
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Supervisor~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year)+', Cierre de Venta: '+string(ldt_fec_ini,'dd/mm/yyyy')
					else
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Supervisor~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin)+'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
					end if
					dw_print.object.t_datos_jefe.text		= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
				CASE 'dwe_gestion_ventas_por_agente'
					if il_mes = il_mes_fin and il_year = il_year_fin then
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Agente~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year) +', Cierre de Venta: '+string(ldt_fec_ini,'dd/mm/yyyy')
					else
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Agente~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin) +'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
					end if
					dw_print.object.t_datos_jefe.text		= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
					dw_print.object.t_datos_supervisor.text= 'Supervisor:   '+is_cod_super+'   '+is_nombre_supervisor+'   Fec.Ingreso: '+string(id_fec_ing_sup,'dd/mm/yyyy')	
			END CHOOSE
			dw_print.object.datawindow.print.Preview = true
			f_Print( dw_print )
			dw_print.object.datawindow.print.Preview = false				
		end if			
	end if
end if
end event

type pb_ordenar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
event ue_mousemove pbm_mousemove
integer x = 219
integer y = 1976
integer width = 165
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_jefe.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_jefe.SETSORT(NULO)
	dw_jefe.SORT()
end if
end event

type pb_filtrar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
event ue_mousemove pbm_mousemove
integer x = 393
integer y = 1976
integer width = 165
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_jefe.SETfilter(NULO)
dw_jefe.filter()

end event

type pb_cerrar from picturebutton within w_detalle_periodo_cierre_de_venta_emp
integer x = 3447
integer y = 1980
integer width = 165
integer height = 148
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "salir.bmp"
string disabledname = "salir_off.bmp"
alignment htextalign = left!
end type

event clicked;close(w_detalle_periodo_cierre_de_venta_emp)
end event

type dw_lista from datawindow within w_detalle_periodo_cierre_de_venta_emp
boolean visible = false
integer x = 2455
integer y = 1984
integer width = 453
integer height = 1096
string dataobject = "dw_informe_gestion_ventas_por_jefe_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_jefe from datawindow within w_detalle_periodo_cierre_de_venta_emp
integer x = 46
integer y = 48
integer width = 3566
integer height = 1888
integer taborder = 10
string dataobject = "dwe_gestion_ventas_por_agente_2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna, ls_string
Long		ll_row
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 't_volver_agente'
		if dw_jefe.dataobject='dwe_gestion_ventas_por_agente_2' then
			dw_jefe.dataobject	= 'dwe_gestion_ventas_por_super_2'
			dw_jefe.settransobject(sqlca)
			wf_cargar_supervisores()
			ls_string	= "cod_jefe='"+trim(is_cod_super)+"'"
			ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount() )
			IF ll_row > 0 THEN
				dw_jefe.ScrollToRow( ll_row )
			end if
		end if
	CASE 't_volver_super'
		if dw_jefe.dataobject='dwe_gestion_ventas_por_super_2' then
			dw_jefe.dataobject	= 'dwe_gestion_ventas_por_jefe_2'
			pb_cerrar.enabled		= true
			dw_jefe.settransobject(sqlca)
			wf_cargar_jefe_venta()
			ls_string	= "cod_jefe='"+trim(is_cod_jefe)+"'"
			ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount() )
			IF ll_row > 0 THEN
				dw_jefe.ScrollToRow( ll_row )
			end if
		end if
	CASE 't_volver'
		if dw_jefe.dataobject='dw_informe_gestion_ventas_detalle_por_ag' then
			dw_jefe.dataobject	= 'dwe_gestion_ventas_por_agente_2'
			dw_jefe.settransobject(sqlca)
			wf_cargar_agentes()
			ls_string	= "cod_jefe='"+trim(is_cod_agente)+"'"
			ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount() )
			IF ll_row > 0 THEN
				dw_jefe.ScrollToRow( ll_row )
			end if
		end if
END CHOOSE

end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if this.getrow() > 0 then
	cb_detalle_venta.setfocus()
	cb_detalle_venta.triggerevent(clicked!)
//	if this.dataobject='dwe_gestion_ventas_por_jefe_2' or &
//		this.dataobject='dwe_gestion_ventas_por_super_2' or &
//		this.dataobject='dwe_gestion_ventas_por_agente_2'then
//		// ver consulta por el rut "Jefe / Supervisor / Agente"
//		gi_tipo_busqueda 	= 1
//		Open(w_listado_contratos)
//	end if
end if
end event

