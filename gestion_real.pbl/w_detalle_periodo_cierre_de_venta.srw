forward
global type w_detalle_periodo_cierre_de_venta from window
end type
type dw_lista_aumento from datawindow within w_detalle_periodo_cierre_de_venta
end type
type cb_1 from commandbutton within w_detalle_periodo_cierre_de_venta
end type
type cb_detalle_venta from commandbutton within w_detalle_periodo_cierre_de_venta
end type
type dw_print from datawindow within w_detalle_periodo_cierre_de_venta
end type
type cb_gestion from commandbutton within w_detalle_periodo_cierre_de_venta
end type
type pb_exportar from picturebutton within w_detalle_periodo_cierre_de_venta
end type
type pb_imprimir from picturebutton within w_detalle_periodo_cierre_de_venta
end type
type pb_ordenar from picturebutton within w_detalle_periodo_cierre_de_venta
end type
type pb_filtrar from picturebutton within w_detalle_periodo_cierre_de_venta
end type
type pb_cerrar from picturebutton within w_detalle_periodo_cierre_de_venta
end type
type dw_lista from datawindow within w_detalle_periodo_cierre_de_venta
end type
type dw_jefe from datawindow within w_detalle_periodo_cierre_de_venta
end type
end forward

global type w_detalle_periodo_cierre_de_venta from window
integer width = 3680
integer height = 2248
boolean titlebar = true
string title = "Informe Gestión Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_lista_aumento dw_lista_aumento
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
global w_detalle_periodo_cierre_de_venta w_detalle_periodo_cierre_de_venta

type variables
datetime	ldt_fec_ini,ldt_fec_fin
Date		id_fec_ing_jefe, id_fec_ing_sup, id_fec_ing_jefe2,id_fec_ing_sup2
String	is_cod_jefe,is_cod_jefe2, is_cod_super,is_cod_super2, is_cod_agente
String	is_nombre_jefe,is_nombre_jefe2, is_nombre_supervisor,is_nombre_supervisor2
string	is_estado_cont, is_moneda
long		il_mes,il_year, il_tot_reg,il_tot_reg_aum, il_row, il_mes_fin,il_year_fin

end variables

forward prototypes
public subroutine wf_cargar_jefe_venta ()
public subroutine wf_cargar_supervisores ()
public subroutine wf_cargar_agentes ()
end prototypes

public subroutine wf_cargar_jefe_venta ();String	ls_nombre,ls_a_pat,ls_a_mat, ls_codigo,ls_estado, ls_codigo_aux
Long		ll_cont_unidad_nro, ll_tot_uf_promesas, ll_tot_uf_liberador,ll_cont_unidad_nro_lib
Long		ll_suma_contrato, ll_indi, ll_new, ll_suma_uf, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp
Long		ll_tot_uf_vc,ll_tot_uf_rn,ll_tot_uf_p,ll_tot_uf_vsp, ll_vgte_con2_moras
Long		ll_uni_vgte_con2_moras,ll_fila
Date		ld_fecha_ing

SetPointer(HourGlass!)
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0;setnull(ls_codigo)
Setnull(ls_codigo_aux)
dw_jefe.reset()
if il_tot_reg>0 then
	ls_codigo_aux	= dw_lista.getitemstring(1,'jefe_ventas_jefe_ventas')
	// Cargar Promesas
	for ll_indi=1 to il_tot_reg
		ls_codigo					= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
		ls_nombre					= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')
		ls_a_pat						= dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')
		ls_a_mat						= dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
		ls_estado					= dw_lista.getitemstring(ll_indi,'jefe_ventas_estado')
		ll_cont_unidad_nro		= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
		ll_cont_unidad_nro_lib	= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
		ll_tot_uf_promesas		= dw_lista.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
		ll_tot_uf_liberador		= dw_lista.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
		ld_fecha_ing				= date(dw_lista.getitemDatetime(ll_indi,'jefe_ventas_fecha_ing'))
		ll_suma_uf					= ll_tot_uf_promesas + ll_tot_uf_liberador
		ll_suma_contrato			= ll_cont_unidad_nro + ll_cont_unidad_nro_lib
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
		if ls_codigo <> ls_codigo_aux or ll_indi=1 then
			if ls_codigo <> '' and not isnull(ls_codigo) then
				ll_new	= dw_jefe.insertrow(0)
				dw_jefe.scrolltorow(ll_new)
				dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
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
				dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',0)
				dw_jefe.setitem(ll_new,'unidad_uf_d_aum',0)
				dw_jefe.setitem(ll_new,'tot_uni_v_c_aum',0)
				dw_jefe.setitem(ll_new,'tot_uni_r_n_aum',0)
				dw_jefe.setitem(ll_new,'tot_uni_p_aum',0)
				dw_jefe.setitem(ll_new,'tot_uni_vsp_aum',0)
				dw_jefe.setitem(ll_new,'tot_uf_v_c_aum',0)
				dw_jefe.setitem(ll_new,'tot_uf_r_n_aum',0)
				dw_jefe.setitem(ll_new,'tot_uf_p_aum',0)
				dw_jefe.setitem(ll_new,'tot_uf_vsp_aum',0)
				dw_jefe.setitem(ll_new,'tot_uf_v_2_moras_aum',0)
				dw_jefe.setitem(ll_new,'tot_uni_v_2_moras_aum',0)
			end if
			ls_codigo_aux			= ls_codigo
		end if
	next
end if
// Cargar Aumento Capacidad
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0;setnull(ls_codigo)
Setnull(ls_codigo_aux)
if il_tot_reg_aum>0 then
	ls_codigo_aux	= dw_lista_aumento.getitemstring(1,'jefe_ventas_jefe_ventas')
	// Cargar Promesas
	for ll_indi=1 to il_tot_reg_aum
		ls_codigo					= dw_lista_aumento.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
		ls_nombre					= dw_lista_aumento.getitemstring(ll_indi,'jefe_ventas_nombre')
		ls_a_pat						= dw_lista_aumento.getitemstring(ll_indi,'jefe_ventas_a_paterno')
		ls_a_mat						= dw_lista_aumento.getitemstring(ll_indi,'jefe_ventas_a_materno')
		ls_estado					= dw_lista_aumento.getitemstring(ll_indi,'jefe_ventas_estado')
		ll_cont_unidad_nro		= dw_lista_aumento.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
		ll_tot_uf_promesas		= dw_lista_aumento.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
		ld_fecha_ing				= date(dw_lista_aumento.getitemDatetime(ll_indi,'jefe_ventas_fecha_ing'))
		ll_suma_uf					= ll_tot_uf_promesas + ll_tot_uf_liberador
		ll_suma_contrato			= ll_cont_unidad_nro + ll_cont_unidad_nro_lib
		ll_tot_vc					= dw_lista_aumento.getitemNumber(ll_indi,'sum_jefe_uni_v_mas_c')
		ll_tot_rn					= dw_lista_aumento.getitemNumber(ll_indi,'sum_jefe_uni_r_mas_n')
		ll_tot_p						= dw_lista_aumento.getitemNumber(ll_indi,'sum_jefe_uni_p')
		ll_tot_vsp					= dw_lista_aumento.getitemNumber(ll_indi,'sum_jefe_uni_vsp')
		ll_tot_uf_vc				= dw_lista_aumento.getitemNumber(ll_indi,'uf_jefe_v_mas_c')
		ll_tot_uf_rn				= dw_lista_aumento.getitemNumber(ll_indi,'uf_jefe_r_mas_n')
		ll_tot_uf_p					= dw_lista_aumento.getitemNumber(ll_indi,'uf_jefe_p')
		ll_tot_uf_vsp				= dw_lista_aumento.getitemNumber(ll_indi,'sum_jefe_uf_vsp')
		ll_vgte_con2_moras		= dw_lista_aumento.getitemNumber(ll_indi,'jefe_vgte_con2_moras')
		ll_uni_vgte_con2_moras	= dw_lista_aumento.getitemNumber(ll_indi,'jefe_uni_vgte_con2_moras')
		if ls_codigo <> ls_codigo_aux or ll_indi=1 then
			if ls_codigo <> '' and not isnull(ls_codigo) then
				ll_fila = dw_jefe.Find("cod_jefe = '"+ls_codigo+"'",1, dw_jefe.RowCount())
				if ll_fila>0 then
					ll_new	= ll_fila
					dw_jefe.scrolltorow(ll_new)
				else
					ll_new	= dw_jefe.insertrow(0)
					dw_jefe.scrolltorow(ll_new)
					dw_jefe.setitem(ll_new,'unidad_vta_nro',0)
					dw_jefe.setitem(ll_new,'unidad_uf_prome',0)
					dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',0)
					dw_jefe.setitem(ll_new,'unidad_uf_d_lib',0)
					dw_jefe.setitem(ll_new,'unidad_uf_total_uf',0)
					dw_jefe.setitem(ll_new,'tot_uni_v_c',0)
					dw_jefe.setitem(ll_new,'tot_uni_r_n',0)
					dw_jefe.setitem(ll_new,'tot_uni_p',0)
					dw_jefe.setitem(ll_new,'tot_uni_vsp',0)
					dw_jefe.setitem(ll_new,'tot_uf_v_c',0)
					dw_jefe.setitem(ll_new,'tot_uf_r_n',0)
					dw_jefe.setitem(ll_new,'tot_uf_p',0)
					dw_jefe.setitem(ll_new,'tot_uf_vsp',0)
					dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',0)
					dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',0)
				end if
				dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
				dw_jefe.setitem(ll_new,'nom_jefe',ls_nombre)
				dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat)
				dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat)
				dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fecha_ing)
				dw_jefe.setitem(ll_new,'clasifica_jefe','X')
				dw_jefe.setitem(ll_new,'estado',ls_estado)
				dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro)
				dw_jefe.setitem(ll_new,'unidad_uf_d_aum',ll_tot_uf_promesas)
				dw_jefe.setitem(ll_new,'tot_uni_v_c_aum',ll_tot_vc)
				dw_jefe.setitem(ll_new,'tot_uni_r_n_aum',ll_tot_rn)
				dw_jefe.setitem(ll_new,'tot_uni_p_aum',ll_tot_p)
				dw_jefe.setitem(ll_new,'tot_uni_vsp_aum',ll_tot_vsp)
				dw_jefe.setitem(ll_new,'tot_uf_v_c_aum',ll_tot_uf_vc)
				dw_jefe.setitem(ll_new,'tot_uf_r_n_aum',ll_tot_uf_rn)
				dw_jefe.setitem(ll_new,'tot_uf_p_aum',ll_tot_uf_p)
				dw_jefe.setitem(ll_new,'tot_uf_vsp_aum',ll_tot_uf_vsp)
				dw_jefe.setitem(ll_new,'tot_uf_v_2_moras_aum',ll_vgte_con2_moras)
				dw_jefe.setitem(ll_new,'tot_uni_v_2_moras_aum',ll_uni_vgte_con2_moras)
			end if
			ls_codigo_aux			= ls_codigo
		end if
	next
end if
dw_jefe.object.t_titulo.text	= gs_conexion
if il_mes = il_mes_fin and il_year = il_year_fin then	
	dw_jefe.object.t_cabecera.text= 'Informe de Producción por Jefe Venta~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year)+', Cierre de Venta desde: '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
else
	dw_jefe.object.t_cabecera.text= 'Informe de Producción por Jefe Venta~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin)+'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
end if
dw_jefe.object.t_usuario.text		= gs_user
dw_jefe.SORT()
dw_jefe.scrolltorow(1)
SetPointer(Arrow!)
end subroutine

public subroutine wf_cargar_supervisores ();string	ls_codigo_aux, ls_codigo, ls_nombre, ls_a_pat, ls_a_mat, ls_estado, ls_clasifica
String	ls_codigo_jefe
Long		ll_indi, ll_new, ll_cont_unidad_nro, ll_cont_unidad_nro_lib,ll_uni_vgte_con2_moras
Long		ll_suma_contrato, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp, ll_vgte_con2_moras,ll_count_vta
Double	ll_tot_uf_vc,ll_tot_uf_rn,ll_tot_uf_p,ll_tot_uf_vsp,ll_tot_uf_liberador,ll_suma_uf,&
			ll_tot_uf_promesas,ll_suma_precio
Date		ld_fecha_ing
SetPointer(HourGlass!)
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0
dw_jefe.reset()
ls_codigo_aux	= dw_lista.getitemstring(1,'supervisor_cod_sup')
for ll_indi=1 to il_tot_reg
	if ls_codigo <> ls_codigo_aux then
		if ls_codigo <> '' and not isnull(ls_codigo) then
			if ls_codigo_jefe = is_cod_jefe then
				ll_new	= dw_jefe.insertrow(0)
				dw_jefe.scrolltorow(ll_new)
				dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
				SELECT	Sum("PAGO_AUMENTO"."PRECIO"),	Count("PAGO_AUMENTO"."PRECIO")
				INTO 		:ll_suma_precio,					:ll_count_vta  
				FROM 		"ANEXO_AUMENTO",   
							"PAGO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
						 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
						 (("ANEXO_AUMENTO"."COD_SUPER" = :ls_codigo ) AND  
						 ( "ANEXO_AUMENTO"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
						 ( "ANEXO_AUMENTO"."CIERRE_VENTA" <= :ldt_fec_fin ) )   
				USING		sqlca;
				if isnull(ll_suma_precio) then ll_suma_precio=0
				if isnull(ll_count_vta) then ll_count_vta=0
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
				dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_count_vta)
				dw_jefe.setitem(ll_new,'unidad_uf_aum',ll_suma_precio)
			end if
		end if
		ls_codigo_aux			= ls_codigo
	end if
	ls_codigo_jefe			= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
	ls_codigo				= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
	ls_nombre				= dw_lista.getitemstring(ll_indi,'supervisor_nombre')
	ls_a_pat					= dw_lista.getitemstring(ll_indi,'supervisor_a_paterno')
	ls_a_mat					= dw_lista.getitemstring(ll_indi,'supervisor_a_materno')
	ls_estado				= dw_lista.getitemstring(ll_indi,'supervisor_estado')
	ls_clasifica			= dw_lista.getitemstring(ll_indi,'supervisor_clasifica')
	is_cod_jefe2			= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
	id_fec_ing_jefe2		= date(dw_lista.getitemdatetime(ll_indi,'jefe_ventas_fecha_ing'))
	is_nombre_jefe2		= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
	ll_cont_unidad_nro	= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_sup')
	ll_cont_unidad_nro_lib=dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_sup_lib')
	ll_tot_uf_promesas	= dw_lista.getitemNumber(ll_indi,'tot_uf_promesas_sup')
	ll_tot_uf_liberador	= dw_lista.getitemNumber(ll_indi,'tot_uf_liberador_sup')
	ld_fecha_ing			= date(dw_lista.getitemDatetime(ll_indi,'supervisor_fecha_ing'))
	ll_suma_uf				= ll_tot_uf_promesas + ll_tot_uf_liberador
	ll_suma_contrato		= ll_cont_unidad_nro + ll_cont_unidad_nro_lib
	ll_tot_vc				= dw_lista.getitemNumber(ll_indi,'sum_sup_uni_v_mas_c')
	ll_tot_rn				= dw_lista.getitemNumber(ll_indi,'sum_sup_uni_r_mas_n')
	ll_tot_p					= dw_lista.getitemNumber(ll_indi,'sum_sup_uni_p')
	ll_tot_vsp				= dw_lista.getitemNumber(ll_indi,'sum_sup_uni_vsp')
	ll_tot_uf_vc			= dw_lista.getitemNumber(ll_indi,'uf_sup_v_mas_c')
	ll_tot_uf_rn			= dw_lista.getitemNumber(ll_indi,'uf_sup_r_mas_n')
	ll_tot_uf_p				= dw_lista.getitemNumber(ll_indi,'uf_sup_p')
	ll_tot_uf_vsp			= dw_lista.getitemNumber(ll_indi,'sum_sup_uf_vsp')
	ll_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'sup_vgte_con2_moras')
	ll_uni_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'sup_uni_vgte_con2_moras')
next
dw_jefe.object.t_titulo.text			= gs_conexion
if il_mes = il_mes_fin and il_year = il_year_fin then
	dw_jefe.object.t_cabecera.text	= 'Informe de Producción por Supervisor~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year)+', Cierre de Venta desde: '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
else
	dw_jefe.object.t_cabecera.text	= 'Informe de Producción por Supervisor~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin)+'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
end if
dw_jefe.object.t_datos_jefe.text		= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
dw_jefe.object.t_usuario.text			= gs_user
dw_jefe.SORT()
dw_jefe.scrolltorow(1)
SetPointer(Arrow!)
end subroutine

public subroutine wf_cargar_agentes ();string	ls_codigo_aux, ls_codigo, ls_nombre, ls_a_pat, ls_a_mat, ls_estado, ls_clasifica
String	ls_codigo_super,ls_codigo_age,ls_nom_age,ls_a_pat_age,ls_a_mat_age,ls_clas_age
String	ls_string
Long		ll_indi, ll_new, ll_cont_unidad_nro,ll_cont_unidad_nro_lib,&
			ll_suma_contrato, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp,ll_vgte_con2_moras,&
			ll_uni_vgte_con2_moras, ll_row, ll_tot_filas,ll_count_vta
Double	ll_suma_precio,ll_tot_uf_liberador,ll_suma_uf,ll_tot_uf_promesas,&
			ll_tot_uf_vc,ll_tot_uf_rn,ll_tot_uf_p,ll_tot_uf_vsp
Date		ld_fecha_ing
DateTime	ld_fec_ini_age, ld_fec_fin_age

SetPointer(HourGlass!)
ll_tot_vc=0;ll_tot_rn=0;ll_tot_p=0;ll_tot_vsp=0
ll_tot_uf_vc=0;ll_tot_uf_rn=0;ll_tot_uf_p=0;ll_tot_uf_vsp=0
dw_jefe.reset()
ls_codigo_aux	= dw_lista.getitemstring(1,'agentes_cod_age')
for ll_indi=1 to il_tot_reg
	if ls_codigo <> ls_codigo_aux then
		if ls_codigo <> '' and not isnull(ls_codigo) then
			if ls_codigo_super = is_cod_super then
				ll_new	= dw_jefe.insertrow(0)
				dw_jefe.scrolltorow(ll_new)
				dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
				SELECT	Sum("PAGO_AUMENTO"."PRECIO"),	Count("PAGO_AUMENTO"."PRECIO")
				INTO 		:ll_suma_precio,					:ll_count_vta  
				FROM 		"ANEXO_AUMENTO",   
							"PAGO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
						 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
						 (("ANEXO_AUMENTO"."COD_AGENTE" = :ls_codigo ) AND  
						 ( "ANEXO_AUMENTO"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
						 ( "ANEXO_AUMENTO"."CIERRE_VENTA" <= :ldt_fec_fin ) )   
				USING		sqlca;
				if isnull(ll_suma_precio) then ll_suma_precio=0
				if isnull(ll_count_vta) then ll_count_vta=0
				dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_count_vta)
				dw_jefe.setitem(ll_new,'unidad_uf_aum',ll_suma_precio)
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
				dw_jefe.setitem(ll_new,'fec_inicial',ldt_fec_ini)
				dw_jefe.setitem(ll_new,'fec_final',ldt_fec_fin)
			end if
		end if
		ls_codigo_aux		= ls_codigo
	end if
	is_cod_jefe2			= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
	id_fec_ing_jefe2		= date(dw_lista.getitemdatetime(ll_indi,'jefe_ventas_fecha_ing'))
	is_nombre_jefe2		= dw_lista.getitemstring(ll_indi,'jefe_ventas_nombre')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_paterno')+' '+dw_lista.getitemstring(ll_indi,'jefe_ventas_a_materno')
	is_cod_super2			= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
	id_fec_ing_sup2		= date(dw_lista.getitemdatetime(ll_indi,'supervisor_fecha_ing'))
	is_nombre_supervisor2= dw_lista.getitemstring(ll_indi,'supervisor_nombre')+' '+dw_lista.getitemstring(ll_indi,'supervisor_a_paterno')+' '+dw_lista.getitemstring(ll_indi,'supervisor_a_materno')
	ls_codigo_super		= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
	ls_codigo				= dw_lista.getitemstring(ll_indi,'agentes_cod_age')
	ls_nombre				= dw_lista.getitemstring(ll_indi,'agentes_nombre')
	ls_a_pat					= dw_lista.getitemstring(ll_indi,'agentes_a_paterno')
	ls_a_mat					= dw_lista.getitemstring(ll_indi,'agentes_a_materno')
	ls_estado				= dw_lista.getitemstring(ll_indi,'agentes_estado')
	ls_clasifica			= dw_lista.getitemstring(ll_indi,'agentes_clasificacion')
	ll_cont_unidad_nro	= dw_lista.getitemNumber(ll_indi,'cont_unidad_nro')
	ll_cont_unidad_nro_lib=dw_lista.getitemNumber(ll_indi,'cont_unidad_nro_lib')
	ll_tot_uf_promesas	= dw_lista.getitemNumber(ll_indi,'tot_uf_promesas')
	ll_tot_uf_liberador	= dw_lista.getitemNumber(ll_indi,'tot_uf_liberador')
	ld_fecha_ing			= date(dw_lista.getitemDatetime(ll_indi,'agentes_fecha_ini'))
	ll_suma_uf				= ll_tot_uf_promesas + ll_tot_uf_liberador
//	ll_suma_contrato		= ll_cont_unidad_nro + ll_cont_unidad_nro_lib
	ll_tot_vc				= dw_lista.getitemNumber(ll_indi,'sum_age_uni_v_mas_c')
	ll_tot_rn				= dw_lista.getitemNumber(ll_indi,'sum_age_uni_r_mas_n')
	ll_tot_p					= dw_lista.getitemNumber(ll_indi,'sum_age_uni_p')
	ll_tot_vsp				= dw_lista.getitemNumber(ll_indi,'sum_age_uni_vsp')
	ll_tot_uf_vc			= dw_lista.getitemNumber(ll_indi,'uf_age_v_mas_c')
	ll_tot_uf_rn			= dw_lista.getitemNumber(ll_indi,'uf_age_r_mas_n')
	ll_tot_uf_p				= dw_lista.getitemNumber(ll_indi,'uf_age_p')
	ll_tot_uf_vsp			= dw_lista.getitemNumber(ll_indi,'sum_age_uf_vsp')
	ll_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'age_vgte_con2_moras')
	ll_uni_vgte_con2_moras	= dw_lista.getitemNumber(ll_indi,'age_uni_vgte_con2_moras')
next
string ls_ult_age, ls_ult_sup, ls_ult
ls_ult_age	= dw_lista.getitemstring(il_tot_reg,'agentes_cod_age')
ls_ult		= dw_jefe.getitemstring(dw_jefe.rowcount(),'cod_jefe')
if ls_codigo=ls_ult_age and ls_codigo_super=is_cod_super and ls_codigo<>ls_ult and ls_codigo<>'' and not isnull(ls_codigo) then
	ll_new	= dw_jefe.insertrow(0)
	dw_jefe.scrolltorow(ll_new)
	dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo)
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
//	dw_jefe.setitem(ll_new,'unidad_vta_total',ll_suma_contrato)
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
//ll_tot_filas	= dw_jefe.RowCount()
DECLARE x1 CURSOR FOR  
SELECT "AGENTES"."COD_AGE",   
		"AGENTES"."NOMBRE",   
		"AGENTES"."A_PATERNO",   
		"AGENTES"."A_MATERNO",   
		"AGENTES"."FECHA_INI",   
		"AGENTES"."FECHA_FIN",   
		"AGENTES"."CLASIFICACION"  
 FROM "AGENTES"  
WHERE "AGENTES"."ESTADO" = 'A' AND
		"AGENTES"."COD_SUP" = :is_cod_super
Using	sqlca ;
open x1;
if sqlca.sqlcode = 0 then
	DO WHILE sqlca.sqlcode = 0 
		fetch x1 into :ls_codigo_age,:ls_nom_age,:ls_a_pat_age,:ls_a_mat_age,:ld_fec_ini_age, :ld_fec_fin_age,:ls_clas_age;
		ls_string	= "cod_jefe='"+trim(ls_codigo_age)+"'"
		ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount() )
		IF ll_row = 0 THEN
			if ls_codigo_age<>'' and not isnull(ls_codigo_age) then
				ll_new	= dw_jefe.insertrow(0)
				dw_jefe.scrolltorow(ll_new)
				dw_jefe.setitem(ll_new,'cod_jefe',ls_codigo_age)
				dw_jefe.setitem(ll_new,'nom_jefe',ls_nom_age)
				dw_jefe.setitem(ll_new,'ap_paterno',ls_a_pat_age)
				dw_jefe.setitem(ll_new,'ap_materno',ls_a_mat_age)
				dw_jefe.setitem(ll_new,'fec_ing_jefe',ld_fec_ini_age)
				dw_jefe.setitem(ll_new,'clasifica_jefe',ls_clas_age)
				dw_jefe.setitem(ll_new,'estado','A')
				dw_jefe.setitem(ll_new,'unidad_vta_nro',0)
				dw_jefe.setitem(ll_new,'unidad_uf_prome',0)
				dw_jefe.setitem(ll_new,'unidad_vta_nro_lib',0)
				dw_jefe.setitem(ll_new,'unidad_uf_d_lib',0)
				dw_jefe.setitem(ll_new,'unidad_uf_total_uf',0)
				dw_jefe.setitem(ll_new,'tot_uni_v_c',0)
				dw_jefe.setitem(ll_new,'tot_uni_r_n',0)
				dw_jefe.setitem(ll_new,'tot_uni_p',0)
				dw_jefe.setitem(ll_new,'tot_uni_vsp',0)
				dw_jefe.setitem(ll_new,'tot_uf_v_c',0)
				dw_jefe.setitem(ll_new,'tot_uf_r_n',0)
				dw_jefe.setitem(ll_new,'tot_uf_p',0)
				dw_jefe.setitem(ll_new,'tot_uf_vsp',0)
				dw_jefe.setitem(ll_new,'tot_uf_v_2_moras',0)
				dw_jefe.setitem(ll_new,'tot_uni_v_2_moras',0)
				dw_jefe.setitem(ll_new,'fec_inicial',ldt_fec_ini)
				dw_jefe.setitem(ll_new,'fec_final',ldt_fec_fin)
				SELECT	Sum("PAGO_AUMENTO"."PRECIO"),	Count("PAGO_AUMENTO"."PRECIO")
				INTO 		:ll_suma_precio,					:ll_count_vta  
				FROM 		"ANEXO_AUMENTO",   
							"PAGO_AUMENTO"  
				WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
						 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
						 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
						 (("ANEXO_AUMENTO"."COD_AGENTE" = :ls_codigo_age ) AND  
						 ( "ANEXO_AUMENTO"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
						 ( "ANEXO_AUMENTO"."CIERRE_VENTA" <= :ldt_fec_fin ) )   
				USING		sqlca;
				if isnull(ll_suma_precio) then ll_suma_precio=0
				if isnull(ll_count_vta) then ll_count_vta=0
				dw_jefe.setitem(ll_new,'unidad_vta_nro_aum',ll_count_vta)
				dw_jefe.setitem(ll_new,'unidad_uf_aum',ll_suma_precio)
			end if
		END IF
	LOOP
end if
close x1;
dw_jefe.object.t_titulo.text				= gs_conexion
if il_mes = il_mes_fin and il_year = il_year_fin then
	dw_jefe.object.t_cabecera.text		= 'Informe de Producción por Agente~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year) +', Cierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+ ' al '+string(ldt_fec_fin,'dd/mm/yyyy')
else
	dw_jefe.object.t_cabecera.text		= 'Informe de Producción por Agente~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin) +'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
end if
dw_jefe.object.t_datos_jefe.text			= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
dw_jefe.object.t_datos_supervisor.text	= 'Supervisor:   '+is_cod_super+'   '+is_nombre_supervisor+'   Fec.Ingreso: '+string(id_fec_ing_sup,'dd/mm/yyyy')
dw_jefe.object.t_usuario.text				= gs_user
dw_jefe.SORT()
dw_jefe.scrolltorow(1)
SetPointer(Arrow!)
end subroutine

on w_detalle_periodo_cierre_de_venta.create
this.dw_lista_aumento=create dw_lista_aumento
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
this.Control[]={this.dw_lista_aumento,&
this.cb_1,&
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

on w_detalle_periodo_cierre_de_venta.destroy
destroy(this.dw_lista_aumento)
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

event open;Long	ll_tot_filas, ll_indi
gf_centrar(w_detalle_periodo_cierre_de_venta)
pb_cerrar.enabled					= true
ldt_fec_ini							= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ldt_fec_fin							= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
il_mes								= long(substr(1,3,Message.StringParm))
il_year								= long(substr(1,4,Message.StringParm))
il_mes_fin							= long(substr(1,5,Message.StringParm))
il_year_fin							= long(substr(1,6,Message.StringParm))
dw_jefe.dataobject				= 'dwe_informe_gestion_ventas_por_jefe_2'
dw_jefe.settransobject(sqlca)
// Cargar Promesas
dw_lista.dataobject				= 'dw_informe_gestion_ventas'
dw_lista.settransobject(sqlca)
il_tot_reg							= dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)
// Cargar Aumento Capacidad
dw_lista_aumento.dataobject	= 'dw_informe_gestion_ventas_aumento'
dw_lista_aumento.settransobject(sqlca)
il_tot_reg_aum						= dw_lista_aumento.retrieve(ldt_fec_ini,ldt_fec_fin)
if il_tot_reg=0 and il_tot_reg_aum=0 then
	messagebox("Advertencia","No registra datos")
	close(w_detalle_periodo_cierre_de_venta)
else
	wf_cargar_jefe_venta()
end if
gs_ventana							= 'w_detalle_periodo_cierre_de_venta'
f_valida_objeto_1()
SetPointer(Arrow!)

end event

type dw_lista_aumento from datawindow within w_detalle_periodo_cierre_de_venta
boolean visible = false
integer x = 270
integer y = 2120
integer width = 1189
integer height = 1096
integer taborder = 90
string dataobject = "dw_informe_gestion_ventas_aumento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_detalle_periodo_cierre_de_venta
integer x = 1728
integer y = 1992
integer width = 654
integer height = 112
integer taborder = 80
integer textsize = -9
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
	if dw_jefe.dataobject='dwe_informe_gestion_ventas_por_jefe_2' or &
		dw_jefe.dataobject='dwe_informe_gestion_ventas_por_super_2' or &
		dw_jefe.dataobject='dwe_informe_gestion_ventas_por_agente_2' or &
		dw_jefe.dataobject='dw_informe_gestion_ventas_detalle_por_ag' then
		if dw_jefe.dataobject='dw_informe_gestion_ventas_detalle_por_ag' then
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'agentes_cod_age')
		else
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
		end if
		openwithparm(w_reporte_licencias,ls_codigo)
	end if
end if
end event

type cb_detalle_venta from commandbutton within w_detalle_periodo_cierre_de_venta
integer x = 1275
integer y = 1992
integer width = 448
integer height = 112
integer taborder = 70
integer textsize = -9
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
		CASE 'dwe_informe_gestion_ventas_por_jefe_2'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
			ls_string	= "1"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)
		CASE 'dwe_informe_gestion_ventas_por_super_2'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
			ls_string	= "2"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)
		CASE 'dwe_informe_gestion_ventas_por_agente_2'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'cod_jefe')
			ls_string	= "3"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)	
		CASE 'dw_informe_gestion_ventas_detalle_por_ag'
			ls_codigo	= dw_jefe.getitemstring(ll_fila,'agentes_cod_age')
			ls_string	= "4"+'~t'+ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+string(il_mes)+'~t'+string(il_year)+'~t'+string(il_mes_fin)+'~t'+string(il_year_fin)
			OpenWithParm(w_detalle_ventas_por_xxx, ls_string)	
	END CHOOSE
end if	

end event

type dw_print from datawindow within w_detalle_periodo_cierre_de_venta
boolean visible = false
integer x = 1504
integer y = 2116
integer width = 411
integer height = 432
string dataobject = "dwe_informe_gestion_ventas_por_jefe_2_pr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_gestion from commandbutton within w_detalle_periodo_cierre_de_venta
integer x = 869
integer y = 1992
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Gestion"
end type

event clicked;if dw_jefe.rowcount() > 0 then
	if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_agente_2' or dw_jefe.dataobject='dw_informe_gestion_ventas_detalle_por_ag' then
		if isvalid(w_inf_gestion_individual) then close(w_inf_gestion_individual)
		OpenWithParm(w_inf_gestion_individual, "3")
		w_inf_gestion_individual.rb_agente.checked 		= true
		w_inf_gestion_individual.rb_agente.triggerevent(clicked!)
	end if
	if dw_jefe.dataobject ='dwe_informe_gestion_ventas_por_super_2' then
		if isvalid(w_inf_gestion_individual) then close(w_inf_gestion_individual)
		OpenWithParm(w_inf_gestion_individual, "2")
		w_inf_gestion_individual.rb_supervisor.checked = true
		w_inf_gestion_individual.rb_supervisor.triggerevent(clicked!)
	end if
	if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_jefe_2' then
		if isvalid(w_inf_gestion_individual) then close(w_inf_gestion_individual)
		OpenWithParm(w_inf_gestion_individual, "1")
		w_inf_gestion_individual.rb_jefe.checked 		= true
		w_inf_gestion_individual.rb_jefe.triggerevent(clicked!)
	end if
	gf_centrar(w_inf_gestion_individual)
	w_inf_gestion_individual.st_detalle.visible			= false
	w_inf_gestion_individual.dw_lista.settransobject(sqlca)
	w_inf_gestion_individual.dw_detalle.settransobject(sqlca)
	w_inf_gestion_individual.dw_general.settransobject(sqlca)
	w_inf_gestion_individual.dw_informe.dataobject 	= 'dw_informe'
	w_inf_gestion_individual.dw_informe.settransobject(sqlca)
	w_inf_gestion_individual.dw_sin_detalle.settransobject(sqlca)
	w_inf_gestion_individual.dw_sin_detalle.visible	= false
	w_inf_gestion_individual.dw_informe.HSplitScroll	= TRUE
	if w_inf_gestion_individual.dw_lista.retrieve() = 0 then messagebox("Advertencia","No registra dato")
	if w_inf_gestion_individual.rb_agente.checked = true then
		w_inf_gestion_individual.dw_informe.object.c_por_agente.Visible	= 0
		w_inf_gestion_individual.dw_informe.object.c_clasif.Visible 		= 1
		w_inf_gestion_individual.dw_informe.object.c_rescomi.x				= 892
		w_inf_gestion_individual.dw_informe.object.c_clasif.x 				= 1527
	end if
	if w_inf_gestion_individual.rb_jefe.checked = true then
		w_inf_gestion_individual.dw_informe.object.c_por_agente.Visible 	= 1
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
	if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_agente_2' or dw_jefe.dataobject='dw_informe_gestion_ventas_detalle_por_ag' then
		if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_agente_2' then
			w_inf_gestion_individual.em_codigo.text	= dw_jefe.getitemstring(dw_jefe.getrow(),'cod_jefe')
			w_inf_gestion_individual.em_codigo.triggerevent(modified!)
		end if
		if dw_jefe.dataobject = 'dw_informe_gestion_ventas_detalle_por_ag' then
			w_inf_gestion_individual.em_codigo.text	= dw_jefe.getitemstring(dw_jefe.getrow(),'agentes_cod_age')
			w_inf_gestion_individual.em_codigo.triggerevent(modified!)
		end if
		w_inf_gestion_individual.em_1.text					= string(ldt_fec_ini,'dd/mm/yyyy')
		w_inf_gestion_individual.em_2.text					= string(ldt_fec_fin,'dd/mm/yyyy')
		w_inf_gestion_individual.title 						= "Informe Gestion Actual por Agente"
		w_inf_gestion_individual.rb_jefe.checked 			= false
		w_inf_gestion_individual.rb_supervisor.checked 	= false
		w_inf_gestion_individual.pb_general.enabled		= true
	end if
	if dw_jefe.dataobject ='dwe_informe_gestion_ventas_por_super_2' then
		w_inf_gestion_individual.em_codigo.text			= dw_jefe.getitemstring(dw_jefe.getrow(),'cod_jefe')
		w_inf_gestion_individual.em_codigo.triggerevent(modified!)
		w_inf_gestion_individual.em_1.text					= string(ldt_fec_ini,'dd/mm/yyyy')
		w_inf_gestion_individual.em_2.text					= string(ldt_fec_fin,'dd/mm/yyyy')
		w_inf_gestion_individual.title 						= "Informe Gestion Actual por Supervisor"
		w_inf_gestion_individual.rb_jefe.checked 			= false
		w_inf_gestion_individual.rb_agente.checked 		= false
		w_inf_gestion_individual.pb_general.enabled		= false
	end if
	if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_jefe_2' then
		w_inf_gestion_individual.em_codigo.text			= dw_jefe.getitemstring(dw_jefe.getrow(),'cod_jefe')
		w_inf_gestion_individual.em_1.text					= string(ldt_fec_ini,'dd/mm/yyyy')
		w_inf_gestion_individual.em_2.text					= string(ldt_fec_fin,'dd/mm/yyyy')
		w_inf_gestion_individual.title 						= "Informe Gestion Actual por Jefe de Venta"
		w_inf_gestion_individual.rb_supervisor.checked 	= false
		w_inf_gestion_individual.rb_agente.checked 		= false
		w_inf_gestion_individual.pb_general.enabled		= true
	end if
	w_inf_gestion_individual.rb_promesas.checked			= true
	w_inf_gestion_individual.rb_promesas.triggerevent(clicked!)
	w_inf_gestion_individual.pb_aceptar.triggerevent(clicked!)
	w_inf_gestion_individual.setfocus()
else
	messagebox("Advertencia","No hay datos a consultar")
	dw_jefe.setfocus()
end if
end event

type pb_exportar from picturebutton within w_detalle_periodo_cierre_de_venta
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

type pb_imprimir from picturebutton within w_detalle_periodo_cierre_de_venta
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

event clicked;long		ll_tot_reg, ll_indi, ll_new
String	ls_nombre,ls_a_pat,ls_a_mat, ls_codigo,ls_estado, ls_codigo_aux, ls_clasifica
Long		ll_cont_unidad_nro,ll_cont_unidad_nro_lib
Long		ll_suma_contrato, ll_tot_vc,ll_tot_rn,ll_tot_p,ll_tot_vsp
Long		ll_uni_vgte_con2_moras,ll_cont_unidad_nro_aum, ll_vgte_con2_moras
Long		ll_tot_vc_aum,ll_tot_rn_aum,ll_tot_p_aum,ll_tot_vsp_aum,ll_tot_uf_vc_aum
Long		ll_uni_vgte_con2_moras_aum
Double	ll_tot_uf_rn_aum,ll_tot_uf_p_aum,ll_tot_uf_vsp_aum,ll_vgte_con2_moras_aum,ll_tot_uf_aum,&
			ll_suma_uf_aum,ll_tot_uf_vc,ll_tot_uf_rn,ll_tot_uf_p,ll_tot_uf_vsp,ll_suma_uf,&
			ll_tot_uf_promesas, ll_tot_uf_liberador
Date		ld_fecha_ing
Datetime	ldt_fecha_ini, ldt_fecha_fin
ll_tot_reg	= dw_jefe.rowcount()
if ll_tot_reg > 0 then
	CHOOSE CASE dw_jefe.dataobject
		CASE 'dwe_informe_gestion_ventas_por_jefe_2'
			dw_print.dataobject	= 'dwe_informe_gestion_ventas_por_jefe_2_pr' //'dwe_informe_gestion_ventas_por_jefe'
			dw_print.settransobject(sqlca)
		CASE 'dwe_informe_gestion_ventas_por_super_2'
			dw_print.dataobject	= 'dwe_informe_gestion_ventas_por_super'
			dw_print.settransobject(sqlca)
		CASE 'dwe_informe_gestion_ventas_por_agente_2'
			dw_print.dataobject	= 'dwe_informe_gestion_ventas_por_agente'
			dw_print.settransobject(sqlca)
		CASE 'dw_informe_gestion_ventas_detalle_por_ag'
			dw_jefe.object.datawindow.print.Preview = true
			f_Print( dw_jefe )
			dw_jefe.object.datawindow.print.Preview = false	
	END CHOOSE
	if dw_jefe.rowcount() > 0 then 
		if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_jefe_2' or &
			dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_super_2' or &
			dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_agente_2' then
			for ll_indi = 1 to ll_tot_reg
				ls_codigo						= dw_jefe.getitemstring(ll_indi,'cod_jefe')
				ls_nombre						= dw_jefe.getitemstring(ll_indi,'nom_jefe')
				ls_a_pat							= dw_jefe.getitemstring(ll_indi,'ap_paterno')
				ls_a_mat							= dw_jefe.getitemstring(ll_indi,'ap_materno')
				ld_fecha_ing					= date(dw_jefe.getitemdatetime(ll_indi,'fec_ing_jefe'))
				ls_clasifica					= dw_jefe.getitemstring(ll_indi,'clasifica_jefe')
				ls_estado						= dw_jefe.getitemstring(ll_indi,'estado')
				ll_cont_unidad_nro			= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro')
				ll_tot_uf_promesas			= dw_jefe.getitemnumber(ll_indi,'unidad_uf_prome')
				ll_cont_unidad_nro_lib		= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro_lib')
				ll_tot_uf_liberador			= dw_jefe.getitemnumber(ll_indi,'unidad_uf_d_lib')
				ll_suma_uf						= dw_jefe.getitemnumber(ll_indi,'unidad_uf_total_uf')
				ll_tot_vc						= dw_jefe.getitemnumber(ll_indi,'tot_uni_v_c')
				ll_tot_rn						= dw_jefe.getitemnumber(ll_indi,'tot_uni_r_n')
				ll_tot_p							= dw_jefe.getitemnumber(ll_indi,'tot_uni_p')
				ll_tot_vsp						= dw_jefe.getitemnumber(ll_indi,'tot_uni_vsp')
				ll_tot_uf_vc					= dw_jefe.getitemnumber(ll_indi,'tot_uf_v_c')
				ll_tot_uf_rn					= dw_jefe.getitemnumber(ll_indi,'tot_uf_r_n')
				ll_tot_uf_p						= dw_jefe.getitemnumber(ll_indi,'tot_uf_p')
				ll_tot_uf_vsp					= dw_jefe.getitemnumber(ll_indi,'tot_uf_vsp')
				ll_vgte_con2_moras			= dw_jefe.getitemnumber(ll_indi,'tot_uf_v_2_moras')
				ll_uni_vgte_con2_moras		= dw_jefe.getitemnumber(ll_indi,'tot_uni_v_2_moras')
				if dw_print.dataobject	= 'dwe_informe_gestion_ventas_por_jefe_2_pr' then
					ll_cont_unidad_nro_aum		= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro_aum')
					ll_tot_uf_aum					= dw_jefe.getitemnumber(ll_indi,'unidad_uf_d_aum')
					ll_tot_vc_aum					= dw_jefe.getitemnumber(ll_indi,'tot_uni_v_c_aum')
					ll_tot_rn_aum					= dw_jefe.getitemnumber(ll_indi,'tot_uni_r_n_aum')
					ll_tot_p_aum					= dw_jefe.getitemnumber(ll_indi,'tot_uni_p_aum')
					ll_tot_vsp_aum					= dw_jefe.getitemnumber(ll_indi,'tot_uni_vsp_aum')
					ll_tot_uf_vc_aum				= dw_jefe.getitemnumber(ll_indi,'tot_uf_v_c_aum')
					ll_tot_uf_rn_aum				= dw_jefe.getitemnumber(ll_indi,'tot_uf_r_n_aum')
					ll_tot_uf_p_aum				= dw_jefe.getitemnumber(ll_indi,'tot_uf_p_aum')
					ll_tot_uf_vsp_aum				= dw_jefe.getitemnumber(ll_indi,'tot_uf_vsp_aum')
					ll_vgte_con2_moras_aum		= dw_jefe.getitemnumber(ll_indi,'tot_uf_v_2_moras_aum')
					ll_uni_vgte_con2_moras_aum	= dw_jefe.getitemnumber(ll_indi,'tot_uni_v_2_moras_aum')
				elseif dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_super_2' then
					ll_cont_unidad_nro_aum		= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro_aum')
					ll_tot_uf_aum					= dw_jefe.getitemnumber(ll_indi,'unidad_uf_aum')
				end if
				if dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_agente_2' then
					ldt_fecha_ini					= dw_jefe.getitemdatetime(ll_indi,'fec_inicial')
					ldt_fecha_fin					= dw_jefe.getitemdatetime(ll_indi,'fec_final')
					ll_cont_unidad_nro_aum		= dw_jefe.getitemnumber(ll_indi,'unidad_vta_nro_aum')
					ll_tot_uf_aum					= dw_jefe.getitemnumber(ll_indi,'unidad_uf_aum')
				end if
				ll_new								= dw_print.insertrow(0)
				dw_print.scrolltorow(ll_new)
				dw_print.setitem(ll_new,'cod_jefe',ls_codigo)
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
				if dw_print.dataobject	= 'dwe_informe_gestion_ventas_por_jefe_2_pr' then
					dw_print.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
					dw_print.setitem(ll_new,'unidad_uf_d_aum',ll_tot_uf_aum)
					dw_print.setitem(ll_new,'tot_uni_v_c_aum',ll_tot_vc_aum)
					dw_print.setitem(ll_new,'tot_uni_r_n_aum',ll_tot_rn_aum)
					dw_print.setitem(ll_new,'tot_uni_p_aum',ll_tot_p_aum)
					dw_print.setitem(ll_new,'tot_uni_vsp_aum',ll_tot_vsp_aum)
					dw_print.setitem(ll_new,'tot_uf_v_c_aum',ll_tot_uf_vc_aum)
					dw_print.setitem(ll_new,'tot_uf_r_n_aum',ll_tot_uf_rn_aum)
					dw_print.setitem(ll_new,'tot_uf_p_aum',ll_tot_uf_p_aum)
					dw_print.setitem(ll_new,'tot_uf_vsp_aum',ll_tot_uf_vsp_aum)
					dw_print.setitem(ll_new,'tot_uf_v_2_moras_aum',ll_vgte_con2_moras_aum)
					dw_print.setitem(ll_new,'tot_uni_v_2_moras_aum',ll_uni_vgte_con2_moras_aum)
				elseif dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_super_2' then
					dw_print.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
					dw_print.setitem(ll_new,'unidad_uf_aum',ll_tot_uf_aum)
				elseif dw_jefe.dataobject = 'dwe_informe_gestion_ventas_por_agente_2' then
					dw_print.setitem(ll_new,'unidad_vta_nro_aum',ll_cont_unidad_nro_aum)
					dw_print.setitem(ll_new,'unidad_uf_aum',ll_tot_uf_aum)
				end if
				if dw_print.dataobject = 'dwe_informe_gestion_ventas_por_agente' then
					dw_jefe.setitem(ll_new,'fec_inicial',ldt_fecha_ini)
					dw_jefe.setitem(ll_new,'fec_final',ldt_fecha_fin)
				end if
			next
			dw_print.object.t_usuario.text					= gs_user
			dw_print.object.t_titulo.text						= gs_conexion
			CHOOSE CASE dw_print.dataobject
				CASE 'dwe_informe_gestion_ventas_por_jefe_2_pr'
					if il_mes = il_mes_fin and il_year = il_year_fin then
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Jefe Venta~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year)+', Cierre de Venta: '+string(ldt_fec_ini,'dd/mm/yyyy')
					else
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Jefe Venta~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin)+'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
					end if
				CASE 'dwe_informe_gestion_ventas_por_super'
					if il_mes = il_mes_fin and il_year = il_year_fin then
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Supervisor~rPeriodo: '+string(il_mes,'00')+' - '+string(il_year)+', Cierre de Venta: '+string(ldt_fec_ini,'dd/mm/yyyy')
					else
						dw_print.object.t_cabecera.text		= 'Informe de Producción por Supervisor~rPeriodo: desde '+string(il_mes,'00')+' - '+string(il_year)+' al '+string(il_mes_fin,'00')+' - '+string(il_year_fin)+'~rCierre de Venta: desde '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
					end if
					dw_print.object.t_datos_jefe.text		= 'Jefe Venta:   '+is_cod_jefe+'   '+is_nombre_jefe+'   Fec.Ingreso: '+string(id_fec_ing_jefe,'dd/mm/yyyy')
				CASE 'dwe_informe_gestion_ventas_por_agente'
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

type pb_ordenar from picturebutton within w_detalle_periodo_cierre_de_venta
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

type pb_filtrar from picturebutton within w_detalle_periodo_cierre_de_venta
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

type pb_cerrar from picturebutton within w_detalle_periodo_cierre_de_venta
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

event clicked;close(w_detalle_periodo_cierre_de_venta)
end event

type dw_lista from datawindow within w_detalle_periodo_cierre_de_venta
boolean visible = false
integer x = 2089
integer y = 2116
integer width = 1189
integer height = 1096
string dataobject = "dw_informe_gestion_ventas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_jefe from datawindow within w_detalle_periodo_cierre_de_venta
integer x = 46
integer y = 48
integer width = 3566
integer height = 1888
integer taborder = 10
string dataobject = "dwe_informe_gestion_ventas_por_agente_2"
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
		if dw_jefe.dataobject='dwe_informe_gestion_ventas_por_agente_2' then
			dw_jefe.dataobject	= 'dwe_informe_gestion_ventas_por_super_2'
			dw_jefe.settransobject(sqlca)
			wf_cargar_supervisores()
			ls_string	= "cod_jefe='"+trim(is_cod_super)+"'"
			ll_row = dw_jefe.Find(ls_string, 1, dw_jefe.RowCount() )
			IF ll_row > 0 THEN
				dw_jefe.ScrollToRow( ll_row )
			end if
		end if
	CASE 't_volver_super'
		if dw_jefe.dataobject='dwe_informe_gestion_ventas_por_super_2' then
			dw_jefe.dataobject	= 'dwe_informe_gestion_ventas_por_jefe_2'
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
			dw_jefe.dataobject	= 'dwe_informe_gestion_ventas_por_agente_2'
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

event doubleclicked;long	ll_cant, ll_uf,ll_uf_aum
if this.getrow() > 0 then
	pb_cerrar.enabled		= false
	il_row					= this.getrow()
	if this.dataobject='dwe_informe_gestion_ventas_por_jefe_2' then
		is_cod_jefe				= this.getitemstring(il_row,'cod_jefe')
		is_nombre_jefe			= this.getitemstring(il_row,'nom_jefe')+' '+this.getitemstring(il_row,'ap_paterno')+' '+this.getitemstring(il_row,'ap_materno')
		id_fec_ing_jefe		= date(this.getitemDatetime(il_row,'fec_ing_jefe'))
		this.dataobject		= 'dwe_informe_gestion_ventas_por_super_2'
		this.settransobject(sqlca)
		wf_cargar_supervisores()
	elseif this.dataobject='dwe_informe_gestion_ventas_por_super_2' then
		is_cod_super			= this.getitemstring(this.getrow(),'cod_jefe')
		is_nombre_supervisor	= this.getitemstring(il_row,'nom_jefe')+' '+this.getitemstring(il_row,'ap_paterno')+' '+this.getitemstring(il_row,'ap_materno')
		id_fec_ing_sup			= date(this.getitemDatetime(il_row,'fec_ing_jefe'))
		this.dataobject		= 'dwe_informe_gestion_ventas_por_agente_2'
		this.settransobject(sqlca)
		wf_cargar_agentes()
	elseif this.dataobject='dwe_informe_gestion_ventas_por_agente_2' then
		is_cod_agente	= this.getitemstring(this.getrow(),'cod_jefe')
		ll_cant			= this.getitemnumber(this.getrow(),'unidad_uf_prome')
		ll_uf				= this.getitemnumber(this.getrow(),'unidad_uf_d_lib')
		ll_uf_aum		= this.getitemnumber(this.getrow(),'unidad_uf_aum')
		if ll_cant>0 or ll_uf>0 or ll_uf_aum>0 then
			this.dataobject		= 'dw_informe_gestion_ventas_detalle_por_ag'
			this.settransobject(sqlca)
			this.retrieve(ldt_fec_ini,ldt_fec_fin,is_cod_agente)
			dw_jefe.object.t_titulo.text			= gs_conexion
			if il_mes = il_mes_fin and il_year = il_year_fin then
				dw_jefe.object.t_cabecera.text	= 'Informe de Producción~rPeriodo '+string(il_mes,'00')+' del año '+string(il_year) +', cierre de Venta '+string(ldt_fec_ini,'dd/mm/yyyy')
			else
				dw_jefe.object.t_cabecera.text	= 'Informe de Producción~rPeriodo desde el '+string(il_mes,'00')+' del año '+string(il_year)+' hasta el '+string(il_mes_fin,'00')+' del año '+string(il_year_fin) +', cierre de Venta del '+string(ldt_fec_ini,'dd/mm/yyyy')+' al '+string(ldt_fec_fin,'dd/mm/yyyy')
			end if
		else
			messagebox("Adevertencia","No registra dato Agente "+is_cod_agente)
		end if
	
	elseif this.dataobject='dw_informe_gestion_ventas_detalle_por_ag' then
		gi_numero 			= dw_jefe.getitemnumber(dw_jefe.getrow(),'cadena_numero')
		gi_tipo_busqueda 	= 8
		Open(w_listado_contratos)
	end if
end if
end event

