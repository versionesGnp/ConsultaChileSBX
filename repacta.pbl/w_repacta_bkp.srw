forward
global type w_repacta_bkp from window
end type
type dw_multiproducto from datawindow within w_repacta_bkp
end type
type st_1 from statictext within w_repacta_bkp
end type
type cbx_sin_gc from checkbox within w_repacta_bkp
end type
type cbx_sin_mora from checkbox within w_repacta_bkp
end type
type dw_dias_mora from datawindow within w_repacta_bkp
end type
type cb_imprimir_detalle from commandbutton within w_repacta_bkp
end type
type cb_3 from commandbutton within w_repacta_bkp
end type
type cb_2 from commandbutton within w_repacta_bkp
end type
type st_3 from statictext within w_repacta_bkp
end type
type st_4 from statictext within w_repacta_bkp
end type
type st_fecha from statictext within w_repacta_bkp
end type
type st_uf from statictext within w_repacta_bkp
end type
type cb_1 from commandbutton within w_repacta_bkp
end type
type cb_repacta from commandbutton within w_repacta_bkp
end type
type dw_datos_ci from datawindow within w_repacta_bkp
end type
type cb_ci_insertar from commandbutton within w_repacta_bkp
end type
type cb_ci_borrar_item from commandbutton within w_repacta_bkp
end type
type cb_ci_borrar from commandbutton within w_repacta_bkp
end type
type dw_encabezado_ingreso_cupon from datawindow within w_repacta_bkp
end type
type dw_abono from datawindow within w_repacta_bkp
end type
type dw_ci_buscar_cliente from datawindow within w_repacta_bkp
end type
type st_help_descuento from statictext within w_repacta_bkp
end type
type st_help_abono from statictext within w_repacta_bkp
end type
type dw_gastos_ci from datawindow within w_repacta_bkp
end type
type dw_detalle_ci from datawindow within w_repacta_bkp
end type
end forward

global type w_repacta_bkp from window
integer x = 146
integer y = 288
integer width = 2875
integer height = 2640
boolean titlebar = true
string title = "Calculo de Mora"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_multiproducto dw_multiproducto
st_1 st_1
cbx_sin_gc cbx_sin_gc
cbx_sin_mora cbx_sin_mora
dw_dias_mora dw_dias_mora
cb_imprimir_detalle cb_imprimir_detalle
cb_3 cb_3
cb_2 cb_2
st_3 st_3
st_4 st_4
st_fecha st_fecha
st_uf st_uf
cb_1 cb_1
cb_repacta cb_repacta
dw_datos_ci dw_datos_ci
cb_ci_insertar cb_ci_insertar
cb_ci_borrar_item cb_ci_borrar_item
cb_ci_borrar cb_ci_borrar
dw_encabezado_ingreso_cupon dw_encabezado_ingreso_cupon
dw_abono dw_abono
dw_ci_buscar_cliente dw_ci_buscar_cliente
st_help_descuento st_help_descuento
st_help_abono st_help_abono
dw_gastos_ci dw_gastos_ci
dw_detalle_ci dw_detalle_ci
end type
global w_repacta_bkp w_repacta_bkp

type variables
//// var nuevas
//double	id_valor_cuota,id_im,id_gc
//long		ii_dmora,ii_mora_cobro,ii_inc_gastos,ii_cantidad
//// fin var nuevas
Long		il_suma_dia,il_monto_mora,il_monto_gc,il_abono,il_int_mora,il_int_mora_cred,il_int_mora_mant,il_int_gc,il_int_gc_cred,il_int_gc_mant
Double	id_factor_gc,id_tasa_mant,il_fila_uf,idb_iva
Date		idt_fecha_hoy
string		is_pasa_descto
end variables

forward prototypes
public subroutine wf_borrar_fila (long al_fila)
public subroutine wf_calcular_interes (string as_cobro)
public subroutine wf_validar_descuento ()
public subroutine wf_crear_cupones_mantencion (long al_cantidad)
public subroutine wf_cargar_credito_m (string as_ctto, string as_tipo_cob, long al_cantidad, string as_tipo_ctto, long al_fila_m, string as_columna)
end prototypes

public subroutine wf_borrar_fila (long al_fila);Long	fila
dw_detalle_ci.deleterow(al_fila)
fila 					= dw_detalle_ci.InsertRow(0)
dw_detalle_ci.scrolltorow(fila)
dw_detalle_ci.setitem(fila,'monto',0)
dw_detalle_ci.setitem(fila,'cantidad',0)
if dw_detalle_ci.dataobject<>'de_detalle_ci_repacta' then dw_detalle_ci.SetItem(fila, "moneda",'P')
dw_detalle_ci.setfocus()
dw_detalle_ci.setcolumn('tipo_cob')
end subroutine

public subroutine wf_calcular_interes (string as_cobro);Long		ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,i,ll_gasto_cob,ll_mora,ll_gastos,	ll_tot_reg,ll_indi,ll_monto,ll_total_monto,ll_day,ll_month,ll_year,ll_ctas_mora,ll_new,&
			ll_dias_dif,ll_suma_dias,ll_tot_fila,ll_reg,ll_dias_mora,ll_calc_dias,ld_dias_sum_mora,id_valor_cuota,id_im, id_gc,ll_ctas_pag,ldb_suma_gasto_cob=0, ldb_mora=0,ll_max,&
			ll_dia_prox_pago,ll_cant_mant,ll_cant_cred,ll_count_filas,ll_valor_int,ll_suma_acum_gc,ll_acum_id_gc,ll_acum_id_im,ll_count_f,ll_count_e,ll_cuota,ll_cant
String	ls_tipo_cob,ls_pasa,ls_fecha,ls_tipo_cob_reg
Date		ld_fecha_hoy,ld_fecha_inicial,ld_fecha_prox_pago,ld_fecha_prox_venc
Datetime	ldt_fecha_prim

IF gs_rezago <> "S" THEN
	SELECT 	"ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", 	"ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
	INTO   	:ll_cant_mant,														:ll_cant_cred
	FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
	WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
			( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
			(("CADENA"."CODIGO" = :gs_base ) AND  
			( "CADENA"."SERIE" = :gs_serie ) AND  
			( "CADENA"."NUMERO" = :gi_numero ) )   ;
			
	ld_fecha_hoy							= date(gdt_fec_sistema)
	il_int_mora								= 0
	il_int_mora_cred						= 0
	il_int_mora_mant						= 0
	il_int_gc									= 0
	il_int_gc_cred							= 0
	il_int_gc_mant							= 0
	ls_tipo_cob_reg						= w_repacta.dw_detalle_ci.getitemstring(w_repacta.dw_detalle_ci.getrow(),"tipo_cob")
	if (ls_tipo_cob_reg='E' or ls_tipo_cob_reg='U') or ls_tipo_cob_reg='A' then
		ll_count_f 				= w_repacta.dw_detalle_ci.Find("tipo_cob ='F'",1, ll_tot_reg)
		if ll_count_f = 0 then
			w_repacta.dw_gastos_ci.SetItem(1,'gasto_mant', 0)
			w_repacta.dw_gastos_ci.SetItem(1,'mora_mant', 0)
			w_repacta.dw_gastos_ci.accepttext()
		end if
	elseif ls_tipo_cob_reg='F' then
		ll_count_e 				= w_repacta.dw_detalle_ci.Find("tipo_cob ='E' or tipo_cob ='A' or tipo_cob ='Q' or tipo_cob ='U'",1, ll_tot_reg)
		if ll_count_e = 0 then
			w_repacta.dw_gastos_ci.SetItem(1,'gasto_cred', 0)
			w_repacta.dw_gastos_ci.SetItem(1,'mora_cred', 0)
			w_repacta.dw_gastos_ci.accepttext()
		end if
	end if	
//	w_repacta.dw_gastos_ci.SetItem(1,'gastos_cob', 0)
	il_monto_gc								= 0
//	w_repacta.dw_gastos_ci.SetItem(1,'mora', 0)
	il_monto_mora							= 0
	w_repacta.dw_gastos_ci.SetItem(1,'incluir_gastos', 1)
	w_repacta.dw_detalle_ci.accepttext()
	w_repacta.dw_gastos_ci.accepttext()
	ll_tot_reg								= w_repacta.dw_detalle_ci.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_tipo_cob						= w_repacta.dw_detalle_ci.getitemstring(ll_indi,"tipo_cob")	
			if ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='Q' or ls_tipo_cob='U' or ls_tipo_cob='F' then
				ii_cantidad 					= w_repacta.dw_detalle_ci.GetItemNumber(ll_indi,"cantidad")
				ll_monto						= w_repacta.dw_detalle_ci.GetItemNumber(ll_indi,"c_total_linea")
				gl_n_cuotas_pag 			= ii_cantidad 
				if ls_tipo_cob='E' or ls_tipo_cob='U' then
					ll_cuota					= w_repacta.dw_datos_ci.getitemnumber(1, "c_cuotas_mora")
					id_valor_cuota 			= Round(w_repacta.dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"), 0)
					
					if gs_base='O' or gs_base='U' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'pago_oferta_fecha_prim')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'oferta_v_cta_pag_s')
					elseif gs_base='L' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'pago_liberador_fecha_prim')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'anexo_liberador_cta_pag_m')
					elseif gs_base='F' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'producto_pago_fecha_prim')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'producto_anexo_cuotas_pag')	
					elseif gs_base='A' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'pago_aumento_fecha_prim')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'anexo_aumento_cta_pag_m')
					elseif gs_base='R' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'fecha_primera_cta')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'ctas_pagadas')
					elseif gs_base='P' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'pagare_fecha_prim')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'c_cuotas_pagadas')
					elseif gs_base='D' then
						ldt_fecha_prim		= w_repacta.dw_datos_ci.GetItemdatetime(1,'derecho_fecha_prim')
						ll_ctas_pag			= w_repacta.dw_datos_ci.GetItemnumber(1,'c_cuotas_pagadas')
					end if
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag ))) //-1
					ll_ctas_mora			= w_repacta.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora')
					ii_dmora 				= w_repacta.dw_datos_ci.GetItemNumber(1,"c_dias_mora")
				elseif ls_tipo_cob='A' or ls_tipo_cob='Q' then
					id_valor_cuota 			= ll_monto
					ii_dmora 				= w_repacta.dw_datos_ci.GetItemNumber(1,'c_dias_mora_pie')
				elseif ls_tipo_cob='F' then
					if gs_base='O' or gs_base='C' or gs_base='U' then
						id_valor_cuota 		= Round(w_repacta.dw_datos_ci.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
						ii_dmora 			= w_repacta.dw_datos_ci.GetItemNumber(1,"c_dias_mora_mant")
					end if
				end if			
				id_gc 							= 0
				id_im 							= 0
				if ls_tipo_cob='A' or ls_tipo_cob='E' or  ls_tipo_cob='Q' or ls_tipo_cob='U' then
					ii_mora_cobro 			= 1
					ii_inc_gastos 			= 1
				elseif ls_tipo_cob='F' then
					ii_mora_cobro 			= 0
					ii_inc_gastos 			= 0
				end if
				if ls_tipo_cob='E' or ls_tipo_cob='U' then
					dw_dias_mora.reset()
					ll_dia_prox_pago		= day(ld_fecha_prox_pago)
					ld_fecha_inicial			= ld_fecha_prox_pago
					ll_day						= day(ld_fecha_inicial)
					ll_month					= month(ld_fecha_inicial)
					ll_year					= year(ld_fecha_inicial)
					if (ll_month=1 and ll_day>=31) or (ll_month=2 and ll_day>=28) or (ll_month=3 and ll_day>=31) or &
						(ll_month=4 and ll_day>=30) or (ll_month=5 and ll_day>=31) or (ll_month=6 and ll_day>=30) or &
						(ll_month=7 and ll_day>=31) or (ll_month=8 and ll_day>=31) or (ll_month=9 and ll_day>=30) or &
						(ll_month=10 and ll_day>=31) or (ll_month=11 and ll_day>=30) or (ll_month=12 and ll_day>=31) then
						ls_pasa				= 'S'
					else
						ls_pasa				= 'N'
					end if
					ll_max					= 1000
					FOR i = 1 TO ll_max
						ll_new				= dw_dias_mora.insertrow(0)
						dw_dias_mora.scrolltorow(ll_new)
						ll_day					= ll_dia_prox_pago
						ll_month				= month(ld_fecha_inicial)
						ll_year				= year(ld_fecha_inicial)
						ll_month	++
						if (ll_month=1 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day			= 31
						elseif (ll_month=2 and ll_dia_prox_pago>28) then
							ls_pasa			= 'S'
							ll_day				= 28
						elseif (ll_month=3 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day				= 31
						elseif (ll_month=4 and ll_dia_prox_pago>30) then
							ls_pasa			= 'S'
							ll_day				= 30
						elseif (ll_month=5 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day				= 31
						elseif (ll_month=6 and ll_dia_prox_pago>30) then
							ls_pasa			= 'S'
							ll_day			= 30
						elseif (ll_month=7 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day				= 31
						elseif (ll_month=8 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day				= 31
						elseif (ll_month=9 and ll_dia_prox_pago>30) then
							ls_pasa			= 'S'
							ll_day				= 30
						elseif (ll_month=10 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day				= 31
						elseif (ll_month=11 and ll_dia_prox_pago>30) then
							ls_pasa			= 'S'
							ll_day				= 30
						elseif (ll_month=12 and ll_dia_prox_pago>31) then
							ls_pasa			= 'S'
							ll_day				= 31
						end if
						if ll_month>12 then
							ll_year ++
							ll_month					= 1
							if (ll_month=1 and ls_pasa='S') then
								ls_pasa				= 'S'
								ll_day					= 31
							end if
						end if
						ls_fecha						= string(ll_day,'00')+'/'+string(ll_month,'00')+'/'+string(ll_year,'0000')
						ld_fecha_prox_venc		= date(ls_fecha)
						dw_dias_mora.setitem(ll_new,'fecha_inicial',ld_fecha_inicial)
						if ld_fecha_prox_venc > ld_fecha_hoy then 
							ld_fecha_prox_venc	= ld_fecha_hoy
						end if
						dw_dias_mora.setitem(ll_new,'fecha_venc',ld_fecha_prox_venc)
						if ld_fecha_prox_venc < ld_fecha_hoy then
							ll_dias_dif				= 0
							ll_count_filas			= dw_dias_mora.rowcount()
							if (ll_count_filas / ll_cant_cred ) = int(ll_count_filas / ll_cant_cred )  then
								ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_prox_venc)
							end if
							if ll_dias_dif<=0 then ll_dias_dif=0
							dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
							ld_fecha_inicial			= ld_fecha_prox_venc
							
//							if ll_dias_dif<=0 then ll_dias_dif=0
//							ll_dias_dif				= DaysAfter(ld_fecha_inicial, ld_fecha_prox_venc)
//							dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
//							ld_fecha_inicial			= ld_fecha_prox_venc
						else
							ll_dias_dif				= 0
							ll_count_filas			= dw_dias_mora.rowcount()
							if ( ll_count_filas / ll_cant_cred ) = int(ll_count_filas / ll_cant_cred ) then
								ll_dias_dif			= DaysAfter(ld_fecha_inicial, ld_fecha_hoy) //ld_fecha_prox_venc)
							end if
							if ll_dias_dif<=0 then ll_dias_dif=0
							dw_dias_mora.setitem(ll_new,'dias_mora',ll_dias_dif)
							ld_fecha_inicial			= ld_fecha_prox_venc
							ll_suma_dias			= ll_suma_dias + ll_dias_dif
							exit
						end if
						ll_suma_dias				= ll_suma_dias + ll_dias_dif
					NEXT
					ll_tot_fila							= dw_dias_mora.rowcount()
					for ll_reg=1 to ll_tot_fila
						ll_suma_dias				= ll_suma_dias - ll_dias_mora
						dw_dias_mora.setitem(ll_reg,'suma_dias',ll_suma_dias)
						ll_dias_mora				= dw_dias_mora.getitemnumber(ll_reg,'dias_mora')
					next
					dw_dias_mora.accepttext()
					ii_dmora							= 0
					ii_mora_cobro					= 0
					id_im								= 0
					id_gc								= 0
					FOR i = 1 TO ii_cantidad
						if ll_tot_fila > 0 and i <= ll_cuota then //ll_ctas_mora
							ii_dmora					= dw_dias_mora.GetItemNumber(i, "suma_dias")
							ll_dias_mora			= dw_dias_mora.GetItemNumber(i, "dias_mora")
							IF (ii_dmora > 5 AND cbx_sin_mora.Checked = False) THEN
								ii_mora_cobro   	= ii_dmora
								ll_valor_int			= ROUND(gf_int_mora(w_repacta.dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota),0)
								id_im 					= ROUND(id_im + ll_valor_int,0)
								IF (ii_dmora >= ll_dias_mora AND cbx_sin_gc.Checked = False) THEN    
								//IF (ii_dmora > 30 AND cbx_sin_gc.Checked = False) THEN    
									id_gc     			= Round(id_valor_cuota * id_factor_gc, 0)
									ll_suma_acum_gc	= ROUND(ll_suma_acum_gc + id_gc,0)
								END IF
							END IF  
						end if
					NEXT
					ll_mora							= round(ll_mora + id_im, 0)
					ll_gasto_cob						= round(ll_gasto_cob + ll_suma_acum_gc, 0)
					ll_acum_id_im					= ll_mora
					ll_acum_id_gc					= ll_gasto_cob
					if isnull(ll_gasto_cob) then ll_gasto_cob=0
					if isnull(ll_mora) then ll_mora=0
					if cbx_sin_gc.checked=false then
						//w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
						ii_dmora 				= w_repacta.dw_datos_ci.GetItemNumber(1,"c_dias_mora")
						ll_cant					= ii_cantidad * 30
						if ii_cantidad <= w_repacta.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora')  then   //// validar cantidad de cuotas mora a pagar
							if ii_cantidad = 1 and ii_dmora > 30 then
								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad,0))
							elseif (ii_cantidad >= 2 and ii_dmora <= ll_cant)  then   //or (ii_cantidad >= 2 and  w_repacta.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora') = ii_cantidad )
								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ( ii_cantidad - 1) ,0))
								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (ii_cantidad -1 ),0))
							elseif ii_cantidad >= 2 and ii_dmora > ll_cant then
								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad ,0))
							end if
						//	w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad,0))
						//	w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad,0))
						else
//							if w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") = 1 and ii_dmora > 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//							elseif ii_cantidad > w_repacta.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora')  then 
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//							elseif w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") >= 2 then
								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") - 1),0))
								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") - 1),0))
//							end if
						end if
						
						
//						if ii_cantidad <= w_repacta.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora')  then   //// validar cantidad de cuotas mora a pagar
//							if ii_cantidad = 1 and ii_dmora <= 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND((id_gc * (ii_cantidad - 1))  ,0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND((id_gc * (ii_cantidad - 1)) ,0))
//							elseif ii_cantidad = 1 and ii_dmora > 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad ,0))
//							elseif ii_cantidad >= 2 then	//and ii_dmora <= ll_cant then
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad ,0))
//								
////								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ( ii_cantidad - 1) ,0))
////								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (ii_cantidad - 1 ),0))
////							elseif ii_cantidad >= 2 and ii_dmora > ll_cant then
////								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
////								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad ,0))
//							end if
//						//	w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad,0))
//						//	w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad,0))
//						else
//							if w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") = 1 and ii_dmora <= 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") - 1),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") - 1),0))
//							elseif w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") = 1 and ii_dmora > 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//							elseif w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") >= 2 then	//and ii_dmora <= ll_cant then
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") ),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") ),0))
//								
////								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") - 1),0))
////								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") - 1),0))
////							elseif w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") >= 2 and ii_dmora > ll_cant then
////								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora")),0))
////								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora")),0))
//							end if
//						end if	
					end if
//					if cbx_sin_gc.checked=false then
//						//w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
//						ii_dmora 				= w_repacta.dw_datos_ci.GetItemNumber(1,"c_dias_mora")
//						ll_cant					= ii_cantidad * 30
//						if ii_cantidad <= w_repacta.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora')  then   //// validar cantidad de cuotas mora a pagar
//							if ii_cantidad = 1 and ii_dmora > 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad,0))
//							elseif (ii_cantidad >= 2 and ii_dmora <= ll_cant) then	//or (ll_cuotas) then  //ll_cuota
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ( ii_cantidad - 1) ,0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (ii_cantidad -1 ),0))
//							elseif ii_cantidad >= 2 and ii_dmora > ll_cant then
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad ,0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad ,0))
//							end if
//						//	w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * ii_cantidad,0))
//						//	w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob",  ROUND(id_gc * ii_cantidad,0))
//						else
//							if w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") = 1 and ii_dmora > 30 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora"),0))
//							elseif w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") >= 2 then
//								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") -1),0))
//								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora") -1),0))
////								w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora")),0))
////								w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ROUND(id_gc * (w_repacta.dw_datos_ci.GetItemNumber(1,"c_cuotas_mora")),0))
//							end if
//						end if	
//					end if
					if cbx_sin_mora.checked=false then
						w_repacta.dw_gastos_ci.SetItem(1,"mora", ll_mora) //original
						w_repacta.dw_gastos_ci.SetItem(1,"mora_cred", id_im)
					end if
					il_int_mora						= id_im
					il_int_mora_cred				= id_im
					il_int_gc							= ll_suma_acum_gc
					if ii_cantidad <= ll_ctas_mora then
						il_int_gc_cred				= ROUND(id_gc * ii_cantidad,0)
					else
						il_int_gc_cred				= ROUND(id_gc * ll_ctas_mora,0)
					end if
				//	il_monto_mora					= ll_mora
				//	il_monto_gc						= ll_gasto_cob
				//	w_repacta.dw_gastos_ci.SetItem(1,"incluir_gastos", ii_inc_gastos)
					w_repacta.dw_detalle_ci.accepttext()
					
					w_repacta.dw_gastos_ci.SetItem(1,'mora', ROUND(w_repacta.dw_gastos_ci.Getitemnumber(1,'mora_cred') + w_repacta.dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
					w_repacta.dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(w_repacta.dw_gastos_ci.Getitemnumber(1,'gasto_cred') + w_repacta.dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
					
					ll_total_monto					= round(w_repacta.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"),0) //(1,"c_subtotal_total")
					w_repacta.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
					w_repacta.dw_gastos_ci.accepttext()				
				elseif ls_tipo_cob='A' or ls_tipo_cob='Q' then
					FOR i = 1 TO ii_cantidad
						if i > 1 then
							il_suma_dia ++
							ii_dmora					= ii_dmora - il_suma_dia
						else
							il_suma_dia				= 0
						end if
						IF ((ii_dmora - (i - 1) * (ll_cant_cred * 30))) > 5  AND cbx_sin_mora.Checked = False THEN
							ii_mora_cobro 			= ((ii_dmora - (i - 1) * (ll_cant_cred * 30)))
							id_im 						= round(id_im + gf_int_mora(dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota),0)
							IF ((ii_dmora - (i - 1) * (ll_cant_cred * 30))) > 30  AND cbx_sin_gc.Checked = False THEN		
								id_gc 					= round(id_gc + Round(id_valor_cuota * id_factor_gc, 0),0)
								ii_inc_gastos		= 1
							END IF
						ELSE
//								ii_mora_cobro 		= 0
//								id_im 					= 0
//								id_gc 					= 0
						END IF	
					NEXT										
					ll_gasto_cob						= round(ll_gasto_cob + id_gc,0)
					ll_mora							= round(ll_mora + id_im,0)
					if ll_acum_id_im > 0 then
						ll_acum_id_im			= ROUND(ll_acum_id_im + id_im,0)
					else
						ll_acum_id_im			= id_im
					end if
					if ll_acum_id_gc > 0 then
						ll_acum_id_gc			= ROUND(ll_acum_id_gc + id_gc,0)
					else
						ll_acum_id_gc			= id_gc
					end if
					if isnull(ll_gasto_cob) then ll_gasto_cob=0
					if isnull(ll_mora) then ll_mora=0
					if isnull(ll_acum_id_im) then ll_acum_id_im=0
					if isnull(ll_acum_id_gc) then ll_acum_id_gc=0
					
					if cbx_sin_gc.checked=false then
						w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
						w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", ll_acum_id_gc)
					end if
					if cbx_sin_mora.checked=false then
						w_repacta.dw_gastos_ci.SetItem(1,"mora", ll_mora)
						w_repacta.dw_gastos_ci.SetItem(1,"mora_cred", ll_acum_id_im)
					end if
					
					w_repacta.dw_gastos_ci.SetItem(1,'mora', ROUND(w_repacta.dw_gastos_ci.Getitemnumber(1,'mora_cred') + w_repacta.dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
					w_repacta.dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(w_repacta.dw_gastos_ci.Getitemnumber(1,'gasto_cred') + w_repacta.dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
					il_int_mora					= ll_mora
					il_int_mora_cred			= ll_acum_id_im
					il_int_gc						= ll_gasto_cob
					il_int_gc_cred				= ll_acum_id_gc					
					
//					w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
//					w_repacta.dw_gastos_ci.SetItem(1,"mora", ll_mora)
//					il_monto_mora					= ll_mora
//					il_monto_gc						= ll_gasto_cob
				//	w_repacta.dw_gastos_ci.SetItem(1,"incluir_gastos", ii_inc_gastos)
					w_repacta.dw_detalle_ci.accepttext()
					ll_total_monto					= round(w_repacta.dw_detalle_ci.GetItemNumber(1,"c_subtotal"),0) //(1,"c_subtotal_total")
					w_repacta.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
					w_repacta.dw_gastos_ci.accepttext()
				elseif ls_tipo_cob='F' then
					id_gc 								= 0
					id_im 								= 0
					ii_mora_cobro 					= 0
					ii_inc_gastos 					= 0
					FOR i = 1 TO ii_cantidad 
						IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 5  AND cbx_sin_mora.Checked = False THEN 
							ii_mora_cobro			= ((ii_dmora - (i - 1) * (ll_cant_mant * 30)))
							id_im 						= round(id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota),0)
							IF ((ii_dmora - (i - 1) * (ll_cant_mant * 30))) > 30  AND cbx_sin_gc.Checked = False THEN 
								 id_gc 				= round(id_gc + Round(id_valor_cuota * id_factor_gc, 0),0)
								 ii_inc_gastos		= 1
							END IF
						END IF
					NEXT
					
					ll_gasto_cob						= round(ll_gasto_cob + id_gc,0)
					ll_mora							= round(ll_mora + id_im,0)
					if isnull(ll_gasto_cob) then ll_gasto_cob=0
					if isnull(ll_mora) then ll_mora=0

					if cbx_sin_gc.checked=false then	
						w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
						w_repacta.dw_gastos_ci.SetItem(1,"gasto_mant", id_gc)
					end if
					if cbx_sin_mora.checked=false then
						w_repacta.dw_gastos_ci.SetItem(1,"mora", ll_mora)
						w_repacta.dw_gastos_ci.SetItem(1,"mora_mant", id_im)
					end if
					il_int_mora					= ll_mora
					il_int_mora_mant			= id_im
					il_int_gc						= ll_gasto_cob
					il_int_gc_mant				= id_gc
					
//					w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
//					w_repacta.dw_gastos_ci.SetItem(1,"mora", ll_mora)
//					il_monto_mora					= ll_mora
//					il_monto_gc						= ll_gasto_cob

				//	w_repacta.dw_gastos_ci.SetItem(1,"incluir_gastos", ii_inc_gastos)
					w_repacta.dw_detalle_ci.accepttext()
					
					w_repacta.dw_gastos_ci.SetItem(1,'mora', ROUND(w_repacta.dw_gastos_ci.Getitemnumber(1,'mora_cred') + w_repacta.dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
					w_repacta.dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(w_repacta.dw_gastos_ci.Getitemnumber(1,'gasto_cred') + w_repacta.dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
					
					ll_total_monto					= round(w_repacta.dw_detalle_ci.GetItemNumber(1,"c_subtotal"),0) //(1,"c_subtotal_total")
					w_repacta.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
					w_repacta.dw_gastos_ci.accepttext()
				end if
			end if
		next
		if w_repacta.dw_gastos_ci.getitemnumber(1,"Subtotal")=0 or isnull(w_repacta.dw_gastos_ci.getitemnumber(1,"Subtotal")) then
			w_repacta.dw_gastos_ci.SetItem(1,"gastos_cob", 0)
			w_repacta.dw_gastos_ci.SetItem(1,"mora", 0)
			
			w_repacta.dw_gastos_ci.SetItem(1,"gasto_cred", 0)
			w_repacta.dw_gastos_ci.SetItem(1,"gasto_mant", 0)
			w_repacta.dw_gastos_ci.SetItem(1,"mora_cred", 0)
			w_repacta.dw_gastos_ci.SetItem(1,"mora_mant", 0)
		end if	
	end if
end if
end subroutine

public subroutine wf_validar_descuento ();long	ll_tot_reg,ll_fila_reg,ll_count_e,ll_indi,ll_fila_cob
double ll_monto,ll_monto_desc,ll_monto_uf,lbd_uf
string	ls_cod_descto,ls_glosa_otro,ls_tipo_comp_otro,ls_tipo_cob_ref,ls_nombre_ventana


//ls_nombre_ventana = 'w_repacta'
is_pasa_descto		= f_validar_descuentos()

//ls_cod_descto			= gs_codigo_otro
//ll_tot_reg				= w_repacta.dw_detalle_ci.rowcount()
////for ll_indi = 1 to ll_tot_reg
//	ll_fila_reg 				= w_repacta.dw_detalle_ci.Find("tipo_cob ='S'",ll_tot_reg, ll_tot_reg)
//	if ll_fila_reg>0 then
//		ll_monto_desc			= w_repacta.dw_detalle_ci.getitemnumber(ll_fila_reg,'monto')
//		SELECT	"TIPO_COB_OTRO_VALIDA"."GLOSA_OTRO", 
//					"TIPO_COB_OTRO_VALIDA"."TIPO_COB_REFERENCIA"  
//		INTO  	:ls_glosa_otro, :ls_tipo_cob_ref  
//		FROM 	"TIPO_COB_OTRO_VALIDA"  
//		WHERE 	"TIPO_COB_OTRO_VALIDA"."CODIGO_OTRO" = :ls_cod_descto and
//					"TIPO_COB_OTRO_VALIDA"."TIPO_COMPROBANTE" = 'BE' 
//		USING 	sqlca; //ls_tipo_comp_otro
//		
//		ll_fila_cob 				= w_repacta.dw_detalle_ci.Find("tipo_cob ='"+ls_tipo_cob_ref+"'",1, ll_tot_reg)
//	
//		if ll_fila_cob > 0 then
//			if ls_cod_descto = '102' then
//				ll_monto				= w_repacta.dw_gastos_ci.getitemnumber(1,'mora_cred')
//			elseif	ls_cod_descto = '118' then
//				ll_monto					= w_repacta.dw_gastos_ci.getitemnumber(1,'gasto_cred')
//			elseif	ls_cod_descto = '130' then
//				ll_monto					= w_repacta.dw_gastos_ci.getitemnumber(1,'mora_mant')
//			elseif	ls_cod_descto = '133' then
//				ll_monto					=w_repacta.dw_gastos_ci.getitemnumber(1,'gasto_mant')
//			else
//				ll_monto					= w_repacta.dw_detalle_ci.getitemnumber(ll_fila_cob,'monto')
//				if ll_monto = 0 then
//					ll_monto_uf					= w_repacta.dw_detalle_ci.getitemnumber(ll_fila_cob,'monto_uf')
//					if ll_monto_uf > 0 then
//						SELECT "TAB_UF"."VALOR_UF"  
//						INTO 		:lbd_uf  
//						FROM 	"TAB_UF"  
//						WHERE 	"TAB_UF"."FECHA_UF" = :gd_tiempo_serv
//						USING	sqlca;
//						ll_monto					= ll_monto_uf *lbd_uf
//					end if	
//				end if	
//			end if	
//			if ll_monto_desc >ll_monto then
//				messagebox('Advertencia','Monto Descuento '+ls_glosa_otro+' es Mayor al Monto a Descontar')
//				w_repacta.dw_detalle_ci.setitem(ll_fila_reg,'monto',0)
//			end if
//		end if	
//	end if
////next
end subroutine

public subroutine wf_crear_cupones_mantencion (long al_cantidad);Long		ll_count,ll_mora_mant,ll_estado_mora_mant,ll_ctas_pag_m,ll_cod_parque,ll_plazo,ll_cantidad,ll_res,ll_indi,ll_cant_meses,ll_nro_cuota,ll_cuponera,ll_ctas_pag_s,&
			ll_contar_cup_vig,ll_res2,ll_max_cuota
Double	ll_rut,ldb_valor_cuota_m,ll_cupon,ldb_valor_cuota_c
String		ls_estado_cuponera,ls_estado_ctto,ls_dv,ls_moneda,ls_paso='N'
date		ldt_fecha_venc_mant,ldt_fecha_prox,ldt_fecha_vencimiento,ldt_max_venc,ldt_fecha_prim,ldt_fecha_m

if gs_base='O' or gs_base='C' or gs_base='U' then
	ll_cantidad		= al_cantidad
	if ll_cantidad > 0 then
		SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
		INTO 		:ls_estado_cuponera  ,						:ll_cuponera
		FROM 	"CUPONERAS"  
		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					( "CUPONERAS"."NUMERO" = :gi_numero ) AND
					( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																		FROM 	"CUPONERAS"  
																		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																					( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
		USING	sqlca;
					
		SELECT 	count("CUPONERAS"."BASE")
		INTO 		:ll_count
		FROM 	"CUPONERAS"  
		WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
					( "CUPONERAS"."SERIE" = :gs_serie ) AND  
					( "CUPONERAS"."NUMERO" = :gi_numero )
		USING	sqlca;
		if isnull(ls_estado_cuponera) or ls_estado_cuponera='' then ll_count=0
		SELECT 	   "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"PAGO_OFERTA"."NRO_CUOTAS",	"PAGO_OFERTA"."MONEDA",	"CADENA"."COD_PARQUE",	"CADENA"."ESTADO",  	"CADENA"."RUT",   	"CLIENTE"."DV",   	"OFERTA_V"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"OFERTA_V"."CTA_PAG_M",   	"OFERTA_V"."CTA_PAG_S",		"PAGO_OFERTA"."VALOR_CUOTA" ,	"PAGO_OFERTA"."FECHA_PRIM",	"OFERTA_V"."FECHA_M"
		INTO 		  :ll_cant_meses,														:ll_plazo,									:ls_moneda,							:ll_cod_parque,					:ls_estado_ctto,   			:ll_rut,   					:ls_dv,   				:ldb_valor_cuota_m,   					:ll_mora_mant,   							:ldt_fecha_venc_mant,   							:ll_estado_mora_mant,   							:ll_ctas_pag_m  ,					:ll_ctas_pag_s,						:ldb_valor_cuota_c,						:ldt_fecha_prim,						:ldt_fecha_m
		FROM 	  "CADENA",   "OFERTA_V",   "PAGO_OFERTA",   "CLIENTE",   "CADENA_MORA" ,	"ESTADO_MORA_MANTENCION" 
		WHERE 	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
					( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
					( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
					( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero ) 
		UNION   
		SELECT 	  "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES",		"CONTRATO"."PLAZO",	"CONTRATO"."MONEDA","CADENA"."COD_PARQUE",	"CADENA"."ESTADO",   	"CADENA"."RUT",   	"CLIENTE"."DV",   	"CONTRATO"."VALOR_CUOTA_M",   	"CADENA_MORA"."MORA_MANT",   	"CADENA_MORA"."FECHA_VENC_MANT",   	"CADENA"."ESTADO_MORA_MANTENCION",   	"CONTRATO"."CTA_PAG_M"  ,	0, 0, null, null
		FROM 	  "CADENA",   "CADENA_MORA",   "CLIENTE",   "CONTRATO",	"ESTADO_MORA_MANTENCION"
		WHERE 	( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
					( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
					( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) and  
					( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) and  
					( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" ) and  
					( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) AND
					( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
					( "CADENA"."CODIGO" = :gs_base ) AND  
					( "CADENA"."SERIE" = :gs_serie ) AND  
					( "CADENA"."NUMERO" = :gi_numero )    ;
		if ls_estado_ctto='V' or ls_estado_ctto='C' then
			if ll_count >= 0 then
				ll_res 		= 1
//				if ll_cantidad > ( ll_mora_mant + 8 ) then
//					ll_res	= messagebox("Advertencia","Está Seguro de Crear "+string(ll_cantidad) +" Cupones de Mantención",Exclamation!,YesNo!,2)
//				else
//					ll_res	= messagebox("Advertencia","Está Seguro de Crear Cupones de Mantención",Exclamation!,YesNo!,2)
//				end if
			end if
			if ll_res = 1 then
				SELECT 	MAX("CUPONERAS_DETALLE"."NRO_CUPON")  
				INTO 		:ll_cupon  
				FROM 	"CUPONERAS_DETALLE"  ;
				ll_cupon ++
				if ll_count = 0 then
					ll_cuponera	= ll_count + 1
					INSERT INTO "CUPONERAS"  
									( "BASE",   	"SERIE",  	"NUMERO",   	"NRO_CUPONERA",   	"FECHA_CREA",   	"USUARIO_CREADOR",   	"CUPON_INICIAL",   	"CUPON_FINAL",   	"ESTADO_CUPONERA",   	"COD_PARQUE",   	"MONEDA_CTTO",   	"PLAZO",   	"CANT_PRINT",   	"ULT_FECHA_VENC_CRED_PRINT" )  
					VALUES 		( :gs_base,	:gs_serie,   :gi_numero,   	:ll_cuponera,   			:gdt_fec_sistema,	:gs_user,   					1,   						2,   					'V',   								:ll_cod_parque,   	:ls_moneda,   			:ll_plazo,   	0,   					null )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ls_paso		= 'S'
					else
						rollback;
					end if
					
				elseif ll_count = 1 then
					if (gs_base='O' or gs_base='U') and ll_ctas_pag_s < ll_plazo then
						SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
						INTO 		:ll_contar_cup_vig  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
						if ll_contar_cup_vig = 0 then
//							messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
							
							DECLARE sp_proc_genera_cuponera PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
							EXECUTE sp_proc_genera_cuponera;
							if ls_estado_cuponera = 'A' then
								UPDATE	"CUPONERAS"  
								SET 		"ESTADO_CUPONERA" = 'R'  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
										 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
								INTO 		:ls_estado_cuponera  ,						:ll_cuponera
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND
											( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																								FROM 	"CUPONERAS"  
																								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																											( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
								USING	sqlca;
											
								SELECT 	count("CUPONERAS"."BASE")
								INTO 		:ll_count
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero )
								USING	sqlca;
							end if
							ll_res2 = 1
						else
							ll_res2 = 1
						end if
					else
						ll_res2 	= 1
					end if
					
					if ll_res2 = 1 then
						if ls_estado_cuponera <> 'V' and ls_estado_cuponera <> 'C' then
							UPDATE 	"CUPONERAS"  
							SET 		"ESTADO_CUPONERA" = 'V'  
							WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
									  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						
						ls_paso	= 'S'
					else
						ls_paso	= 'N'
					end if
				elseif ll_count > 1 then
					if (gs_base='O' or gs_base='U') and ll_ctas_pag_s < ll_plazo then
						SELECT 	Count("CUPONERAS_DETALLE"."BASE" ) 
						INTO 		:ll_contar_cup_vig  
						FROM 	"CUPONERAS_DETALLE"  
						WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
								  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
								  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   ;
						if ll_contar_cup_vig = 0 then
//							messagebox("Advertencia","Contrato Tiene Saldo Cuota Crédito, debe tener Cuponera Vigente antes de Crear Cupones de Mantención")
							
							DECLARE sp_proc_genera_cup2 PROCEDURE FOR SP_GENERAR_CUPONERA( :gs_base, :gs_serie, :gi_numero, :ll_plazo, :gs_user, :ll_rut, :ldb_valor_cuota_c, :ldb_valor_cuota_m, :ls_dv, :ll_cod_parque, :ldt_fecha_prim, :ldt_fecha_m, :ls_moneda);
							EXECUTE sp_proc_genera_cup2;
							if ls_estado_cuponera = 'A' then
								UPDATE	"CUPONERAS"  
								SET 		"ESTADO_CUPONERA" = 'R'  
								WHERE  ( "CUPONERAS"."BASE" = :gs_base ) AND  
										 ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
										 ( "CUPONERAS"."ESTADO_CUPONERA" = :ls_estado_cuponera ) AND  
										 ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
								SELECT 	"CUPONERAS"."ESTADO_CUPONERA" ,	"CUPONERAS"."NRO_CUPONERA"
								INTO 		:ls_estado_cuponera  ,						:ll_cuponera
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero ) AND
											( "CUPONERAS"."NRO_CUPONERA" =  (	SELECT 	MAX("CUPONERAS"."NRO_CUPONERA")
																								FROM 	"CUPONERAS"  
																								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
																											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
																											( "CUPONERAS"."NUMERO" = :gi_numero ) ) )
								USING	sqlca;
											
								SELECT 	count("CUPONERAS"."BASE")
								INTO 		:ll_count
								FROM 	"CUPONERAS"  
								WHERE 	( "CUPONERAS"."BASE" = :gs_base ) AND  
											( "CUPONERAS"."SERIE" = :gs_serie ) AND  
											( "CUPONERAS"."NUMERO" = :gi_numero )
								USING	sqlca;
							end if
							ll_res2 = 1
						else
							ll_res2 = 1
						end if
					else
						ll_res2 	= 1
					end if
					if ll_res2 = 1 then
						UPDATE 	"CUPONERAS"  
						SET 		"ESTADO_CUPONERA" = 'V'  
						WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
								  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
								  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
								  ( "CUPONERAS"."NRO_CUPONERA" = :ll_cuponera )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							UPDATE 	"CUPONERAS"  
							SET 		"ESTADO_CUPONERA" = 'A'  
							WHERE ( "CUPONERAS"."BASE" = :gs_base ) AND  
									  ( "CUPONERAS"."SERIE" = :gs_serie ) AND  
									  ( "CUPONERAS"."NUMERO" = :gi_numero )  AND
									  ( "CUPONERAS"."NRO_CUPONERA" < :ll_cuponera )
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ls_paso	= 'S'
							else
								rollback;
							end if
						else
							rollback;
						end if
						
					end if
				end if
				if ls_paso = 'S' then
					SELECT 	MAX("CUPONERAS_DETALLE"."FECHA_VENC" ) 
					INTO 		:ldt_max_venc  
					FROM 	"CUPONERAS_DETALLE"  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					if not isnull(ldt_max_venc) then
						ldt_fecha_venc_mant	= ldt_max_venc
						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
						INTO		:ldt_fecha_prox
						FROM		dual;
						ldt_fecha_venc_mant	= ldt_fecha_prox
					end if
					
					SELECT 	count("CUPONERAS_DETALLE"."NRO_CUOTA" ) 
					INTO 		:ll_max_cuota  
					FROM 	"CUPONERAS_DETALLE"  
					WHERE ( "CUPONERAS_DETALLE"."BASE" = :gs_base ) AND  
							  ( "CUPONERAS_DETALLE"."SERIE" = :gs_serie ) AND  
							  ( "CUPONERAS_DETALLE"."NUMERO" = :gi_numero ) AND  
							  ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_cuponera ) AND  
							  ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
							  ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   ;
					if isnull(ll_max_cuota) or ll_max_cuota=0 then
						ll_max_cuota	= 0
					end if
					ldt_fecha_prox		= ldt_fecha_venc_mant
					for ll_indi = 1 to ll_cantidad
						ll_nro_cuota = ll_max_cuota + ll_ctas_pag_m + ll_indi
						if not isnull(ldt_fecha_prox) then
							INSERT INTO "CUPONERAS_DETALLE"  
										( "BASE",  	"SERIE",  	"NUMERO",	"NRO_CUPON",  	"RUT",   	"NRO_CUOTA",   	"FECHA_VENC",   	"ESTADO_PAGO_CUPON",   	"TIPO_MOV",   	"TIPO_COB_PAGO",   	"FOLIO_PAGO",   	"FECHA_PAGO",   	"MONTO_CUOTA_CONTRATO",   	"MONTO_CUOTA_PESO",   	"MONTO_INTERES_MORA",   	"MONTO_GASTO_COBRANZA",   	"NRO_CUPONERA",   	"DV",   	"IP_PRINT",   	"USUARIO_PRINT",   	"NUMERO_GRUPO_AVISO",   	"BASE_ASOC",   	"SERIE_ASOC",   	"NUMERO_ASOC",   	"MONTO_OTROS_COBROS",   	"USUARIO_ACTUALIZA_REG",   	"FECHA_ACTUALIZA_REG",   	"CUPON_WEB",   	"SW_GRAN_CUPON" )  
							VALUES 	( :gs_base,	:gs_serie,   :gi_numero,	:ll_cupon,   			:ll_rut,   :ll_nro_cuota,   		:ldt_fecha_prox,   	'V',   								'F',   				null,   					null,   				null,   				:ldb_valor_cuota_m,   				0,   								0,   									0,											:ll_count,   				:ls_dv,   	null,   			null,   					null,   								null,   				null,   				null,   					null,   								:gs_user,   								:gdt_fec_sistema,   				0,   					1 )  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ldt_fecha_venc_mant = ldt_fecha_prox;
								ll_cupon ++
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar Cupon SQL: "+sqlca.sqlerrtext)
							end if
		
						end if
						SELECT 	add_months( :ldt_fecha_venc_mant, :ll_cant_meses) 
						INTO		:ldt_fecha_prox
						FROM		dual;
					next
//					w_ver_cupones.triggerevent(open!)
				end if
			end if
		else
//			messagebox("Advertencia","Recuerde solo puede crear Cupones a Contratos en Estado VIGENTE o PAGADO")
		end if

	end if
else
//	messagebox("Advertencia","Solo se puede Crear Cupones de Mantención a O-PROMESAS y C-CONTRATOS ISA")
end if
end subroutine

public subroutine wf_cargar_credito_m (string as_ctto, string as_tipo_cob, long al_cantidad, string as_tipo_ctto, long al_fila_m, string as_columna);Long		ll_tot_reg_m,ll_fila_m,ll_indi_m,ll_cantidad_m,ll_fila
String		ls_tipo_mov_m,ls_moneda_m
Double	ldb_uf_m,ldb_monto_item_m,ll_cupon_m

ll_tot_reg_m					= dw_multiproducto.retrieve(as_ctto,as_tipo_cob,gi_rut,al_cantidad,as_tipo_ctto)
if ll_tot_reg_m > 0 then
	if as_columna='tipo_cob' then
		ll_fila_m						= al_fila_m
		for ll_indi_m=1 to ll_tot_reg_m
			ls_tipo_mov_m			= dw_multiproducto.getitemstring(ll_indi_m,'tipo_mov')
			ll_cantidad_m			= dw_multiproducto.getitemnumber(ll_indi_m,'cantidad')
			ldb_uf_m					= dw_multiproducto.getitemnumber(ll_indi_m,'monto_uf')
			ldb_monto_item_m	= dw_multiproducto.getitemnumber(ll_indi_m,'montoitem')
			ls_moneda_m			= dw_multiproducto.getitemstring(ll_indi_m,'moneda')
			ll_cupon_m				= dw_multiproducto.getitemnumber(ll_indi_m,'mpnro_cupon')
			if ll_indi_m > 1 then
				ll_fila_m				= dw_detalle_ci.insertrow(0)
				dw_detalle_ci.SetItem(ll_fila_m, 'uf', gd_uf)
			end if
			dw_detalle_ci.setitem(ll_fila_m,'tipo_cob', ls_tipo_mov_m)
			dw_detalle_ci.setitem(ll_fila_m,'cantidad', ll_cantidad_m)
			if ls_tipo_mov_m='D' or ls_tipo_mov_m='X' or ls_tipo_mov_m='V' then ls_moneda_m='1'
			if ls_moneda_m = '1' then
				dw_detalle_ci.SetItem(ll_fila_m, 'moneda','P')
				dw_detalle_ci.setitem(ll_fila_m,'monto_uf', ldb_uf_m)
				dw_detalle_ci.setitem(ll_fila_m,'monto', ldb_monto_item_m)
			elseif ls_moneda_m = '2' then
				dw_detalle_ci.SetItem(ll_fila_m, 'moneda','U')
				dw_detalle_ci.setitem(ll_fila_m,'monto_uf',  ldb_uf_m)
				dw_detalle_ci.setitem(ll_fila_m,'monto', ldb_monto_item_m)
			end if
			dw_detalle_ci.setitem(ll_fila_m,'estado','S')
		next
	elseif as_columna='cantidad' then
		for ll_indi_m=1 to ll_tot_reg_m
			ls_tipo_mov_m			= dw_multiproducto.getitemstring(ll_indi_m,'tipo_mov')
			ll_cantidad_m			= dw_multiproducto.getitemnumber(ll_indi_m,'cantidad')
			ldb_uf_m					= dw_multiproducto.getitemnumber(ll_indi_m,'monto_uf')
			ldb_monto_item_m	= dw_multiproducto.getitemnumber(ll_indi_m,'montoitem')
			ls_moneda_m			= dw_multiproducto.getitemstring(ll_indi_m,'moneda')
			ll_cupon_m				= dw_multiproducto.getitemnumber(ll_indi_m,'mpnro_cupon')
			ll_fila						= dw_detalle_ci.find("tipo_cob = '"+ ls_tipo_mov_m +"' ",1,ll_tot_reg_m)
			if isnull(ll_fila) then ll_fila=0
			if ll_fila = 0 then
				ll_fila					= dw_detalle_ci.insertrow(0)
			end if
			dw_detalle_ci.setitem(ll_fila,'tipo_cob', ls_tipo_mov_m)
			dw_detalle_ci.setitem(ll_fila,'cantidad', ll_cantidad_m)
			if ls_tipo_mov_m='D' or ls_tipo_mov_m='X' or ls_tipo_mov_m='V' then ls_moneda_m='1'
//			if (ls_tipo_mov_m='E' or ls_tipo_mov_m='F') and ll_cantidad_m > 1 then
//				ldb_uf_m				= round(ldb_uf_m / ll_cantidad_m,4)
//			end if
			if ls_moneda_m = '1' then
				dw_detalle_ci.SetItem(ll_fila, 'moneda','P')
				dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ldb_uf_m,4))
				dw_detalle_ci.setitem(ll_fila,'monto', ldb_monto_item_m)
			elseif ls_moneda_m = '2' then
				dw_detalle_ci.SetItem(ll_fila, 'moneda','U')
				dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ldb_uf_m,4))
				dw_detalle_ci.setitem(ll_fila,'monto', ldb_monto_item_m)
			end if
			dw_detalle_ci.setitem(ll_fila,'estado','S')
		next
	end if
	dw_detalle_ci.accepttext()
end if
end subroutine

on w_repacta_bkp.create
this.dw_multiproducto=create dw_multiproducto
this.st_1=create st_1
this.cbx_sin_gc=create cbx_sin_gc
this.cbx_sin_mora=create cbx_sin_mora
this.dw_dias_mora=create dw_dias_mora
this.cb_imprimir_detalle=create cb_imprimir_detalle
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_3=create st_3
this.st_4=create st_4
this.st_fecha=create st_fecha
this.st_uf=create st_uf
this.cb_1=create cb_1
this.cb_repacta=create cb_repacta
this.dw_datos_ci=create dw_datos_ci
this.cb_ci_insertar=create cb_ci_insertar
this.cb_ci_borrar_item=create cb_ci_borrar_item
this.cb_ci_borrar=create cb_ci_borrar
this.dw_encabezado_ingreso_cupon=create dw_encabezado_ingreso_cupon
this.dw_abono=create dw_abono
this.dw_ci_buscar_cliente=create dw_ci_buscar_cliente
this.st_help_descuento=create st_help_descuento
this.st_help_abono=create st_help_abono
this.dw_gastos_ci=create dw_gastos_ci
this.dw_detalle_ci=create dw_detalle_ci
this.Control[]={this.dw_multiproducto,&
this.st_1,&
this.cbx_sin_gc,&
this.cbx_sin_mora,&
this.dw_dias_mora,&
this.cb_imprimir_detalle,&
this.cb_3,&
this.cb_2,&
this.st_3,&
this.st_4,&
this.st_fecha,&
this.st_uf,&
this.cb_1,&
this.cb_repacta,&
this.dw_datos_ci,&
this.cb_ci_insertar,&
this.cb_ci_borrar_item,&
this.cb_ci_borrar,&
this.dw_encabezado_ingreso_cupon,&
this.dw_abono,&
this.dw_ci_buscar_cliente,&
this.st_help_descuento,&
this.st_help_abono,&
this.dw_gastos_ci,&
this.dw_detalle_ci}
end on

on w_repacta_bkp.destroy
destroy(this.dw_multiproducto)
destroy(this.st_1)
destroy(this.cbx_sin_gc)
destroy(this.cbx_sin_mora)
destroy(this.dw_dias_mora)
destroy(this.cb_imprimir_detalle)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_fecha)
destroy(this.st_uf)
destroy(this.cb_1)
destroy(this.cb_repacta)
destroy(this.dw_datos_ci)
destroy(this.cb_ci_insertar)
destroy(this.cb_ci_borrar_item)
destroy(this.cb_ci_borrar)
destroy(this.dw_encabezado_ingreso_cupon)
destroy(this.dw_abono)
destroy(this.dw_ci_buscar_cliente)
destroy(this.st_help_descuento)
destroy(this.st_help_abono)
destroy(this.dw_gastos_ci)
destroy(this.dw_detalle_ci)
end on

event open;double	id_uf
date 		id_fecha

idt_fecha_hoy						= date(gdt_fec_sistema)
dw_dias_mora.settransobject(sqlca)
dw_abono.settransobject(sqlca)
dw_multiproducto.settransobject(sqlca)
gs_rezago							= 'N'
il_suma_dia							= 0
cbx_sin_mora.checked			= false
cbx_sin_mora.visible				= false
cbx_sin_gc.checked				= false
cbx_sin_gc.visible					= false
gf_centrar(w_repacta)
SELECT 	"TASA"."TASA_INT_UF",	"TASA"."IVA",	"TASA"."GASTO_COB_MORA"
INTO 		:id_tasa_mant,				 :idb_iva,			:id_factor_gc
FROM 	"TASA" WHERE "TASA"."LOOK" = 1 ;

gd_tiempo_serv 					= idt_fecha_hoy
//id_factor_gc						= f_factor_gasto_cobranza()
dw_encabezado_ingreso_cupon.SetTransObject(SQLCA)
dw_encabezado_ingreso_cupon.Retrieve(" ", " ", 0)
st_fecha.text						= String(gd_tiempo_serv, "dd/mm/yyyy")
dw_ci_buscar_cliente.SetTransObject(SQLCA)
dw_ci_buscar_cliente.Retrieve()
dw_ci_buscar_cliente.InsertRow(0)
dw_ci_buscar_cliente.SetItem(1,"rs_a_paterno", "")
dw_ci_buscar_cliente.SetItem(1,"rs_a_materno", "")
dw_ci_buscar_cliente.SetItem(1,"rs_nombre", "")
dw_ci_buscar_cliente.SetItem(1,"rn_contrato","") 
dw_ci_buscar_cliente.SetItem(1,"rl_rut","")
//if gs_base='R' then
//	dw_detalle_ci.dataobject	= 'de_detalle_ci_repacta'
//else
	dw_detalle_ci.dataobject	= 'de_detalle_ci'
//end if
dw_detalle_ci.SetTransObject(SQLCA)
dw_detalle_ci.Retrieve()
dw_gastos_ci.SetTransObject(SQLCA)
dw_gastos_ci.Retrieve()

dw_detalle_ci.getchild('tipo_cob',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve('BE')
	
id_fecha 							= Date(st_fecha.text)
id_uf 								= 0
SELECT "TAB_UF"."VALOR_UF" INTO :id_uf FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :id_fecha;
IF id_uf > 0  THEN 
	gd_uf 							= id_uf	
	st_uf.text 						= String(id_uf, "###,###,###.0000")
ELSE
	Open(w_mantenedor_uf)
	id_fecha 						= Date(st_fecha.text)
	id_uf 							= 0
	SELECT "TAB_UF"."VALOR_UF" INTO :id_uf FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :id_fecha;
END IF
if gs_base = 'O' or gs_base='U' or gs_base = 'D' then 
	cb_repacta.enabled 			= true
	cb_1.enabled 					= true
end if
if today() <> date(gdt_fec_sistema) then
	messagebox("Advertencia","Debe Revisar Fecha del Computador NO Corresponde al día de Hoy "+string(gdt_fec_sistema,'dd/mm/yyyy'))
end if
dw_ci_buscar_cliente.setitem(1,'rn_contrato',gi_numero)
dw_ci_buscar_cliente.setitem(1,'rs_bs',gs_base+gs_serie)
dw_ci_buscar_cliente.triggerevent (itemchanged!)
il_abono								= dw_abono.retrieve(gs_base,gs_serie,gi_numero)
if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
gs_ventana							= 'w_repacta'
f_valida_objeto()
end event

event mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type dw_multiproducto from datawindow within w_repacta_bkp
integer x = 18
integer y = 1916
integer width = 2779
integer height = 508
integer taborder = 120
string dataobject = "d_arch_mul_cajnomina_presencial"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 712
integer width = 905
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
string text = "Datos del Contrato"
boolean focusrectangle = false
end type

event ue_mousemove;if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cbx_sin_gc from checkbox within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 1531
integer y = 1608
integer width = 503
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Sin Gasto Cob."
end type

event ue_mousemove;st_help_descuento.visible	= true
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event clicked;string ls_codigo_otro
long	ll_linea,ll_tot_filas,ll_fila

if cbx_sin_gc.checked=true then
	dw_gastos_ci.setitem(1,'gastos_cob',0)
	ll_tot_filas		= dw_detalle_ci.RowCount()
	IF ll_tot_filas > 0 Then
		for ll_fila = 1 to ll_tot_filas
			ls_codigo_otro		= dw_detalle_ci.getitemstring(ll_fila,'tipo_cob_otro')
			if ls_codigo_otro = '133' then
				ll_linea	 		= dw_detalle_ci.Find("tipo_cob_otro ='"+ls_codigo_otro+"'",1, ll_tot_filas)
				dw_detalle_ci.DeleteRow(ll_linea)
				dw_detalle_ci.accepttext()
				ll_tot_filas				= dw_detalle_ci.rowcount()
				ll_fila						= ll_fila - 1
			elseif ls_codigo_otro = '118' then	
				ll_linea	 		= dw_detalle_ci.Find("tipo_cob_otro ='"+ls_codigo_otro+"'",1, ll_tot_filas)
				dw_detalle_ci.DeleteRow(ll_linea)
				dw_detalle_ci.accepttext()
				ll_tot_filas				= dw_detalle_ci.rowcount()
				ll_fila						= ll_fila - 1
			end if
		next
		dw_detalle_ci.accepttext()
	end if	
else
	dw_gastos_ci.setitem(1,'gastos_cob', dw_gastos_ci.getitemnumber(1,'gasto_cred') + dw_gastos_ci.getitemnumber(1,'gasto_mant'))
	dw_gastos_ci.accepttext()
//	'mora_cred'
//	'mora_mant'
//	'gasto_cred'
//	'gasto_mant'
//	dw_gastos_ci.setitem(1,'gastos_cob', il_int_gc_cred + il_int_gc_mant)	//il_int_gc)
//	dw_gastos_ci.setitem(1,'gasto_cred',il_int_gc_cred)
//	dw_gastos_ci.setitem(1,'gasto_mant',il_int_gc_mant)
end if
end event

type cbx_sin_mora from checkbox within w_repacta_bkp
event ue_mousmove pbm_mousemove
integer x = 1161
integer y = 1608
integer width = 370
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Sin Mora"
end type

event ue_mousmove;st_help_descuento.visible	= true
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event clicked;string ls_codigo_otro
long	ll_linea,ll_tot_filas,ll_fila

if cbx_sin_mora.checked=true then
	dw_gastos_ci.setitem(1,'mora',0)
	ll_tot_filas		= dw_detalle_ci.RowCount()
	IF ll_tot_filas > 0 Then
		for ll_fila = 1 to ll_tot_filas
			ls_codigo_otro		= dw_detalle_ci.getitemstring(ll_fila,'tipo_cob_otro')
			if ls_codigo_otro = '130' then
				ll_linea	 		= dw_detalle_ci.Find("tipo_cob_otro ='"+ls_codigo_otro+"'",1, ll_tot_filas)
				dw_detalle_ci.DeleteRow(ll_linea)
				dw_detalle_ci.accepttext()
				ll_tot_filas				= dw_detalle_ci.rowcount()
				ll_fila						= ll_fila - 1
			elseif ls_codigo_otro = '102' then
				ll_linea	 		= dw_detalle_ci.Find("tipo_cob_otro ='"+ls_codigo_otro+"'",1, ll_tot_filas)
				dw_detalle_ci.DeleteRow(ll_linea)
				dw_detalle_ci.accepttext()
				ll_tot_filas				= dw_detalle_ci.rowcount()
				ll_fila						= ll_fila - 1
			end if
		next
		dw_detalle_ci.accepttext()
	end if	
else
	dw_gastos_ci.setitem(1,'mora', dw_gastos_ci.getitemnumber(1,'mora_cred') + dw_gastos_ci.getitemnumber(1,'mora_mant'))
	dw_gastos_ci.accepttext()
//	'mora_cred'
//	'mora_mant'
//	'gasto_cred'
//	'gasto_mant'
//	dw_gastos_ci.setitem(1,'gastos_cob', il_int_gc_cred + il_int_gc_mant)	//il_int_gc)
//	dw_gastos_ci.setitem(1,'gasto_cred',il_int_gc_cred)
//	dw_gastos_ci.setitem(1,'gasto_mant',il_int_gc_mant)
//	dw_gastos_ci.setitem(1,'mora',il_monto_mora)
	
//	dw_gastos_ci.setitem(1,'mora',il_int_mora)
//	dw_gastos_ci.setitem(1,'mora_cred',il_int_mora_cred)
//	dw_gastos_ci.setitem(1,'mora_mant',il_int_mora_mant)
end if
end event

type dw_dias_mora from datawindow within w_repacta_bkp
boolean visible = false
integer x = 718
integer y = 1948
integer width = 1563
integer height = 464
integer taborder = 110
string title = "none"
string dataobject = "dwe_lista_calculo_dias_mora_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;dw_dias_mora.print()
end event

type cb_imprimir_detalle from commandbutton within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 1851
integer y = 1720
integer width = 494
integer height = 104
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Detalle Pago"
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event clicked;long ll_indi,ll_tot_reg
string	ls_tipo_cob,ls_tipo_cob_otro

is_pasa_descto='S'
if dw_gastos_ci.rowcount() > 0 then
	ll_tot_reg					= dw_detalle_ci.rowcount()
	if ll_tot_reg>0 then
		for ll_indi= 1 to ll_tot_reg 
			ls_tipo_cob			= dw_detalle_ci.getitemstring(ll_indi,'tipo_cob')
//			ls_tipo_cob_otro	= gs_codigo_otro
			ls_tipo_cob_otro	= dw_detalle_ci.getitemstring(ll_indi,'tipo_cob_otro')
			gs_codigo_otro		= ls_tipo_cob_otro
			if ls_tipo_cob_otro = "" then ls_tipo_cob_otro = '0'
			if ls_tipo_cob = 'S' and ls_tipo_cob_otro <> '0' then
				wf_validar_descuento()
			end if	
		next
	end if	
	if is_pasa_descto = 'S' then
		if dw_gastos_ci.getitemnumber(1,'subtotal') > 0 and dw_gastos_ci.getitemnumber(1,'c_total') > 0 then
			if isvalid(w_imprimir_detalle_pago) then close(w_imprimir_detalle_pago)
			open(w_imprimir_detalle_pago)
		end if
	end if	
end if
end event

type cb_3 from commandbutton within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 2482
integer y = 1720
integer width = 325
integer height = 104
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event clicked;Close(w_repacta)
end event

type cb_2 from commandbutton within w_repacta_bkp
boolean visible = false
integer x = 37
integer y = 1916
integer width = 539
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Cuenta Corriente"
end type

event clicked;
IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho
			Open(w_cuenta_corriente_derecho)
	END CHOOSE
END IF
end event

type st_3 from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 229
integer y = 44
integer width = 261
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type st_4 from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 1024
integer y = 44
integer width = 247
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "U.F.:"
alignment alignment = right!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type st_fecha from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 498
integer y = 40
integer width = 480
integer height = 84
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type st_uf from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 1294
integer y = 40
integer width = 544
integer height = 84
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_1 from commandbutton within w_repacta_bkp
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1513
integer y = 1720
integer width = 247
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Prepago"
end type

event clicked;String	ls_credito,ls_estado,ls_estado_fac
double	tasa

ls_estado	= dw_encabezado_ingreso_cupon.getitemstring(1,'cadena_estado')

SELECT 	"ESTADO"."ESTADO_FACTURACION"  
INTO 		:ls_estado_fac  
FROM 	"ESTADO"  
WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado
USING	sqlca;

if ls_estado_fac = 'R' then
	Messagebox("Advertencia","No es Posible esta Operación Por Estado del Contrato")
else	
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
		CASE "O","U"
			SELECT	"OFERTA_V"."FORMA_PAGO",   
						"PAGO_OFERTA"."TASA"  
			INTO 		:ls_credito,   
						:tasa 
			FROM 		"PAGO_OFERTA",   
						"OFERTA_V"  
			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) )   ;
			if (ls_credito = '2' ) or ls_credito='4' then	
				open(w_prepago)
			else
				messagebox(gs_app_name,'Esta Promesa NO Tiene Crédito',information!)
			end if	
		CASE "L"
			Messagebox("Advertencia","Para Anexo Liberador, No es Posible esta Operación")
		CASE "A"
			Messagebox("Advertencia","Para Aumento Capacidad, No es Posible esta Operación")
		CASE "P"
			open(w_prepago_pagare)
		CASE "D"
			open(w_prepago_derecho)
		END CHOOSE
	END IF
end if	
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_repacta from commandbutton within w_repacta_bkp
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1161
integer y = 1720
integer width = 347
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reprogramar"
end type

event clicked;Long		ll_plazo
double 	tasa
String	ls_credito, ls_estado,ls_estado_fac

ls_estado	= dw_encabezado_ingreso_cupon.getitemstring(1,'cadena_estado')

SELECT 	"ESTADO"."ESTADO_FACTURACION"  
INTO 		:ls_estado_fac  
FROM 	"ESTADO"  
WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado
USING	sqlca;

if ls_estado_fac = 'R' then
	Messagebox("Advertencia","No es Posible esta Operación Por Estado del Contrato")
else	
	IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
		CHOOSE CASE gs_base
			CASE "O","U"
	//			SELECT	"OFERTA_V"."FORMA_PAGO",   
	//						"PAGO_OFERTA"."TASA",
	//						"PAGO_OFERTA"."NRO_CUOTAS"
	//			INTO 		:ls_credito,   
	//						:tasa,
	//						:ll_plazo
	//			FROM 		"PAGO_OFERTA",   
	//						"OFERTA_V"  		
	//			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and 
	//					 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and 
	//					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
	//					 (("PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
	//					 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) )   ;	
	//			if ll_plazo>0 then //if (ls_credito = '2' ) or (ls_credito='1' and ll_plazo>0) or (ls_credito = '4') then	
					open(w_cuotas)			
		//			open(w_repacta_credito)			
	//			else
	//				messagebox(gs_app_name,'Esta Promesa No Tiene Crédito',information!)
	//			end if	
			CASE "A"
				Messagebox("Advertencia","Para Aumento Capacidad, No es Posible esta Operación")
			CASE "L"
				Messagebox("Advertencia","Para Anexo Liberador, No es Posible esta Operación")
			CASE "P"
				open(w_cuotas_pagare)
			CASE "D"
				open(w_cuotas_derecho)
				
			CASE "R"
				Messagebox("Advertencia","Para Reprogramación de Manteción, No es Posible esta Operación")
		END CHOOSE
	END IF
end if	
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_datos_ci from datawindow within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 784
integer width = 1083
integer height = 1036
integer taborder = 20
string dataobject = "d_datos_cuenta_ci_aumento_capacidad"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_ci_insertar from commandbutton within w_repacta_bkp
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1143
integer y = 784
integer width = 338
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar Item"
end type

event clicked;long 		fila,ll_sw_pasa=0,ii_dmora, ii_mora_cobro,ii_inc_gastos,ll_indi,ll_cantidad,ll_tot_reg,ll_fila,ll_count_reg,ll_count_otro,ll_res,ll_sum_reg,ll_new_reg
double 	id_im, id_gc, id_valor_cuota,ll_monto,ll_valor_serv
String		ls_tipo_cob,ls_moneda,ls_moneda_ctto,ls_string,ls_codigo_otro_cur,ls_tipo_mov='L'

ll_tot_reg		= dw_detalle_ci.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_tipo_cob	= dw_detalle_ci.getitemstring(ll_indi,'tipo_cob')
	ll_cantidad	= dw_detalle_ci.getitemnumber(ll_indi,'cantidad')
	ls_moneda	= dw_detalle_ci.getitemstring(ll_indi,'moneda')
	if ls_moneda='P' then
		ll_monto	= dw_detalle_ci.getitemnumber(ll_indi,'monto')
	else
		ll_monto	= dw_detalle_ci.getitemnumber(ll_indi,'monto_uf')
	end if
	if ls_tipo_cob='' or isnull(ls_tipo_cob) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Tipo Cobro Inválido")
		dw_detalle_ci.setfocus()
		dw_detalle_ci.scrolltorow(ll_indi)
		dw_detalle_ci.setcolumn('tipo_cob')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	elseif ll_cantidad<=0 or isnull(ll_cantidad) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Cantidad Inválido")
		dw_detalle_ci.setfocus()
		dw_detalle_ci.scrolltorow(ll_indi)
		dw_detalle_ci.setcolumn('cantidad')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	elseif (ll_monto<=0 or isnull(ll_monto)) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Monto Inválido")
		dw_detalle_ci.setfocus()
		dw_detalle_ci.scrolltorow(ll_indi)
		dw_detalle_ci.setcolumn('monto')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	end if
next
IF ll_sw_pasa=0 THEN
	gl_n_cuotas_pag = 0
	fila = dw_detalle_ci.InsertRow(0)
	dw_detalle_ci.scrolltorow(fila)
	dw_detalle_ci.SetItem(fila, "folio", 0)
	dw_detalle_ci.SetItem(fila, 'base',gs_base)
	dw_detalle_ci.SetItem(fila, 'serie',gs_serie)
	dw_detalle_ci.SetItem(fila, 'numero',gi_numero)
	if dw_detalle_ci.dataobject<>'de_detalle_ci_repacta' then dw_detalle_ci.SetItem(fila, "moneda",'P')
	IF fila = 1 and dw_datos_ci.rowcount() > 0 THEN
	  	IF gs_rezago <> "S" THEN	
			dw_gastos_ci.InsertRow(0)
			cb_ci_insertar.Enabled			= TRUE
			cb_ci_borrar_item.Enabled 		= true
			wf_calcular_interes(ls_tipo_cob)
		ELSE
			id_valor_cuota 						= 0
			ii_dmora 							= 0
			id_gc 									= 0
			id_im 									= 0
			ii_mora_cobro 						= 0
			ii_inc_gastos 						= 0
			dw_gastos_ci.InsertRow(0)
			cb_ci_borrar_item.Enabled = true
		END IF
		cbx_sin_mora.Visible 					= true
//		cbx_sin_mora.Checked 				= false
		cbx_sin_gc.Visible 						= true
//		cbx_sin_gc.Checked 					= false
		if gs_base='F' then
			ls_moneda_ctto						= dw_datos_ci.getitemstring(1,'producto_pago_moneda')
			ls_string									= "tipo_cob_otro = '85' or tipo_cob_otro = '86' or tipo_cob_otro = '87' or tipo_cob_otro = '88' or tipo_cob_otro = '89' or tipo_cob_otro = '90' or tipo_cob_otro = '91' or tipo_cob_otro = '92'"
			ll_fila										= dw_detalle_ci.Find(ls_string, 1, dw_detalle_ci.RowCount())
			if ll_fila = 0 then
				SELECT 	COUNT("CUENTA_CONTABLE_OTROS"."CODIGO_OTROS")
				INTO		:ll_count_reg
				FROM 	"CUENTA_CONTABLE_OTROS",  	"PRODUCTO_VENTA_ASOCIADA",  	"CADENA",  	"PRODUCTO_ANEXO",  	"PRODUCTO_PAGO",  	"PRODUCTO_TIPO_SERVICIO"  
				WHERE	( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = "CADENA"."SERIE" ) and  
							( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
							( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
							( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
							( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
							( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
							( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
							( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
							( "PRODUCTO_VENTA_ASOCIADA"."BASE" = "CADENA"."CODIGO" ) and  
							( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = "CADENA"."NUMERO" ) and  
							( "PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and  
							( "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
							( "PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO" > 0 ) AND  
							( "CADENA"."CODIGO" = :gs_base ) AND  
							( "CADENA"."SERIE" = :gs_serie ) AND  
							( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) AND  
							( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :gs_tipo_cobro )    ;
				if ll_count_reg > 0 then
					SELECT 	Count("INGRESO"."TIPO_COB")
					INTO 		:ll_count_otro  
					FROM 	"INGRESO"  
					WHERE 	("INGRESO"."BASE" = :gs_base AND  "INGRESO"."SERIE" = :gs_serie AND  "INGRESO"."CONTRATO" = :gi_numero AND  "INGRESO"."PAGO_HIST" = 'A') AND  
								("INGRESO"."CODIGO_OTRO" = '85' OR  "INGRESO"."CODIGO_OTRO" = '86' OR  "INGRESO"."CODIGO_OTRO" = '87' or "INGRESO"."CODIGO_OTRO" = '88' OR  
								 "INGRESO"."CODIGO_OTRO" = '89' OR  "INGRESO"."CODIGO_OTRO" = '90' or "INGRESO"."CODIGO_OTRO" = '91' OR  "INGRESO"."CODIGO_OTRO" = '92' )   ;
					if ll_count_otro = 0 then
						ll_res		= messagebox("Advertencia","Desea Asignar Detalle Pago - Servicio Funerario",Exclamation!,YesNo!)
						if ll_res=1 then
							ll_sum_reg		= 1
							DECLARE cur_detalle_f CURSOR FOR  
							SELECT 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS",  	"PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO"  
							FROM 	"CUENTA_CONTABLE_OTROS",  	"PRODUCTO_VENTA_ASOCIADA",  	"CADENA",  	"PRODUCTO_ANEXO",  	"PRODUCTO_PAGO",  	"PRODUCTO_TIPO_SERVICIO"  
							WHERE	( "PRODUCTO_VENTA_ASOCIADA"."SERIE" = "CADENA"."SERIE" ) and  
										( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
										( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
										( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
										( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
										( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
										( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
										( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
										( "PRODUCTO_VENTA_ASOCIADA"."BASE" = "CADENA"."CODIGO" ) and  
										( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = "CADENA"."NUMERO" ) and  
										( "PRODUCTO_VENTA_ASOCIADA"."COD_DETALLE" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and  
										( "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO" = "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ) and  
										( "PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO" > 0 ) AND  
										( "CADENA"."CODIGO" = :gs_base ) AND  
										( "CADENA"."SERIE" = :gs_serie ) AND  
										( "PRODUCTO_VENTA_ASOCIADA"."NUMERO" = :gi_numero ) AND  
										( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :gs_tipo_cobro )   
							ORDER BY "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" ASC
							USING	sqlca;
							open cur_detalle_f;
							ll_fila				= dw_detalle_ci.getrow()
							dw_detalle_ci.scrolltorow(ll_fila)
							if sqlca.sqlcode = 0 then
								DO WHILE sqlca.sqlcode = 0
									fetch cur_detalle_f into :ls_codigo_otro_cur, :ll_valor_serv;
									if not isnull(ls_codigo_otro_cur) then
										dw_detalle_ci.setitem(ll_fila,'tipo_cob',ls_tipo_mov)
										dw_detalle_ci.setitem(ll_fila,'cantidad',1)
										dw_detalle_ci.accepttext()
										dw_detalle_ci.setitem(ll_fila,'tipo_cob_otro',ls_codigo_otro_cur)
										dw_detalle_ci.accepttext()
										if ls_moneda_ctto = '2' then
											dw_detalle_ci.setitem(ll_fila,'moneda','U')
											dw_detalle_ci.setitem(ll_fila,'monto_uf',ll_valor_serv)
											dw_detalle_ci.setitem(ll_fila,'monto', round( ll_valor_serv * gd_uf,0))
										elseif ls_moneda_ctto = '1' then
											dw_detalle_ci.setitem(ll_fila,'moneda','P')
											dw_detalle_ci.setitem(ll_fila,'monto',ll_valor_serv)
											dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ll_valor_serv / gd_uf,2))
										end if
										dw_detalle_ci.accepttext()
										ll_sum_reg ++
										if ll_sum_reg <= ll_count_reg and not isnull(ls_codigo_otro_cur) then
											ll_new_reg	= dw_detalle_ci.insertrow(0)
											ll_fila			= ll_new_reg
											idw_detalle.retrieve(gs_tipo_cobro)
											idw_detalle15.retrieve()
											dw_detalle_ci.scrolltorow(ll_fila)
											ll_fila			= dw_detalle_ci.getrow()
											dw_detalle_ci.SetItem(ll_fila,'uf', gd_uf)
											dw_detalle_ci.SetItem(ll_fila,'folio', 0)
											dw_detalle_ci.SetItem(ll_fila,'estado', 'N')
											dw_detalle_ci.SetItem(ll_fila,'base',gs_base)
											dw_detalle_ci.SetItem(ll_fila,'serie',gs_serie)
											dw_detalle_ci.SetItem(ll_fila,'numero',gi_numero)
											dw_detalle_ci.setitem(ll_fila,'cantidad',1)
											if ls_moneda_ctto = '2' then
												dw_detalle_ci.SetItem(ll_fila, "moneda",'U')
											elseif ls_moneda_ctto = '1' then
												dw_detalle_ci.SetItem(ll_fila, "moneda",'P')
											end if
											dw_detalle_ci.accepttext()
											dw_detalle_ci.scrolltorow(ll_fila)
										end if
									end if
									Setnull(ls_codigo_otro_cur)
								LOOP
							end if
							close cur_detalle_f;
							dw_detalle_ci.accepttext()
						end if
					end if
				else
					
				end if
			end if
		end if
	END IF
end if
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_ci_borrar_item from commandbutton within w_repacta_bkp
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1486
integer y = 784
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Eli&minar Item"
end type

event clicked;long 	ll_tot_reg,ll_indi,ll_fila,ll_tot_reg_dw
string ls_tipo_cob,ls_tipo_cob_e

ll_fila									= dw_detalle_ci.GetRow()
IF dw_detalle_ci.RowCount() > 0 Then
	ls_tipo_cob_e					= dw_detalle_ci.getitemstring(ll_fila,'tipo_cob')
	//Falta Eliminar codigo 4 y 6 cuando eliminana TIPO_COB ='E'
	if ls_tipo_cob_e = '1' or ls_tipo_cob_e = '2' or ls_tipo_cob_e = '3' or ls_tipo_cob_e = '4' or ls_tipo_cob_e = '5' or ls_tipo_cob_e = '6' or ls_tipo_cob_e = '7' then
		messagebox("Advertencia","No es Posible Eliminar Item, recuerde debe Eliminar E-Cuota o U-Cuota Reconocimiento")
		dw_detalle_ci.setfocus()
	elseif gs_base='L' and (ls_tipo_cob_e = 'D' or ls_tipo_cob_e = 'V' or ls_tipo_cob_e = 'X') then
		messagebox("Advertencia","No es Posible Eliminar Item, recuerde debe Eliminar Cuota Crédio o Pie")
		dw_detalle_ci.setfocus()
	elseif ((gs_base='U' or gs_base='O') and (ls_tipo_cob_e = 'D' or ls_tipo_cob_e = 'V' or ls_tipo_cob_e = 'X')) or (gs_base='C' and (ls_tipo_cob_e = 'D' or ls_tipo_cob_e = 'V' or ls_tipo_cob_e = 'X')) then
		messagebox("Advertencia","No es Posible Eliminar Item, recuerde debe Eliminar F-Cuota Mantención")
		dw_detalle_ci.setfocus()
	else
		dw_detalle_ci.DeleteRow(dw_detalle_ci.GetRow())
		if dw_detalle_ci.rowcount()=0 then
			cb_ci_borrar_item.Enabled= FALSE
			dw_gastos_ci.SetItem(1,"gastos_cob", 0)
			dw_gastos_ci.SetItem(1,"mora", 0)
			dw_gastos_ci.SetItem(1,"subtotal", 0)	
			
			dw_gastos_ci.SetItem(1,'mora_cred',0)
			dw_gastos_ci.SetItem(1,'gasto_cred',0)
			dw_gastos_ci.SetItem(1,'mora_mant',0)
			dw_gastos_ci.SetItem(1,'gasto_mant',0)
			
			il_monto_mora				= 0
			il_monto_gc					= 0
		else
			if ls_tipo_cob_e = 'E' or ls_tipo_cob_e='U' then
				ll_tot_reg				= dw_detalle_ci.rowcount()
				for ll_indi =1 to ll_tot_reg
					ls_tipo_cob			= dw_detalle_ci.GetItemString(ll_indi, "tipo_cob")
					if ls_tipo_cob = '1' or ls_tipo_cob = '2' or ls_tipo_cob = '3' or ls_tipo_cob = '4' or ls_tipo_cob = '5' or ls_tipo_cob = '6' or ls_tipo_cob = '7' then
						dw_detalle_ci.DeleteRow(ll_indi)
						ll_indi				= ll_indi - 1
						ll_tot_reg		= ll_tot_reg - 1
					end if
				next
			end if
			ll_tot_reg						= dw_detalle_ci.rowcount()
			for ll_indi =1 to ll_tot_reg
				ls_tipo_cob	= dw_detalle_ci.GetItemString(ll_indi, "tipo_cob")
				wf_calcular_interes(ls_tipo_cob)	
				dw_detalle_ci.accepttext()
			next	
			if dw_detalle_ci.rowcount()=0 then
				cb_ci_borrar_item.Enabled= FALSE
				dw_gastos_ci.SetItem(1,"gastos_cob", 0)
				dw_gastos_ci.SetItem(1,"mora", 0)
				dw_gastos_ci.SetItem(1,"subtotal", 0)	
				dw_gastos_ci.SetItem(1,'mora_cred',0)
				dw_gastos_ci.SetItem(1,'gasto_cred',0)
				dw_gastos_ci.SetItem(1,'mora_mant',0)
				dw_gastos_ci.SetItem(1,'gasto_mant',0)
				il_monto_mora				= 0
				il_monto_gc					= 0
			end if
		end if
		if (gs_base='L' and (ls_tipo_cob_e='E' or ls_tipo_cob_e='U' or ls_tipo_cob_e='A' or ls_tipo_cob_e='Q')) or ls_tipo_cob_e='F' then
			ll_tot_reg_dw			= dw_detalle_ci.rowcount()
			ll_fila						= dw_detalle_ci.Find("tipo_cob = 'D'",1, ll_tot_reg_dw)
			if ll_fila > 0 then
				dw_detalle_ci.DeleteRow(ll_fila)
			end if
			ll_tot_reg_dw			= dw_detalle_ci.rowcount()
			ll_fila						= dw_detalle_ci.Find("tipo_cob = 'V'",1, ll_tot_reg_dw)
			if ll_fila > 0 then
				dw_detalle_ci.DeleteRow(ll_fila)
			end if
			ll_tot_reg_dw			= dw_detalle_ci.rowcount()
			ll_fila						= dw_detalle_ci.Find("tipo_cob = 'X'",1, ll_tot_reg_dw)
			if ll_fila > 0 then
				dw_detalle_ci.DeleteRow(ll_fila)
			end if
			dw_detalle_ci.accepttext()
			if dw_detalle_ci.rowcount()=0 then
				cb_ci_borrar_item.Enabled= FALSE
				dw_gastos_ci.SetItem(1,"gastos_cob", 0)
				dw_gastos_ci.SetItem(1,"mora", 0)
				dw_gastos_ci.SetItem(1,"subtotal", 0)	
				dw_gastos_ci.SetItem(1,'mora_cred',0)
				dw_gastos_ci.SetItem(1,'gasto_cred',0)
				dw_gastos_ci.SetItem(1,'mora_mant',0)
				dw_gastos_ci.SetItem(1,'gasto_mant',0)
				il_monto_mora				= 0
				il_monto_gc					= 0
			end if
		end if
		
		if ls_tipo_cob_e='S' then
			ll_tot_reg_dw			= dw_detalle_ci.rowcount()
			ll_fila						= dw_detalle_ci.Find("tipo_cob = 'D'",1, ll_tot_reg_dw)
			if ll_fila > 0 then
				messagebox("Advertencia","Recuerde se Eliminarán Todos Los Items de Pagos")
				dw_detalle_ci.reset()	//DeleteRow(ll_fila)
			end if
			ll_tot_reg_dw			= dw_detalle_ci.rowcount()
			ll_fila						= dw_detalle_ci.Find("tipo_cob = 'V'",1, ll_tot_reg_dw)
			if ll_fila > 0 then
				messagebox("Advertencia","Recuerde se Eliminarán Todos Los Items de Pagos")
				dw_detalle_ci.reset()
			end if
			ll_tot_reg_dw			= dw_detalle_ci.rowcount()
			ll_fila						= dw_detalle_ci.Find("tipo_cob = 'X'",1, ll_tot_reg_dw)
			if ll_fila > 0 then
				messagebox("Advertencia","Recuerde se Eliminarán Todos Los Items de Pagos")
				dw_detalle_ci.reset()
			end if
			dw_detalle_ci.accepttext()
			if dw_detalle_ci.rowcount()=0 then
				cb_ci_borrar_item.Enabled= FALSE
				dw_gastos_ci.SetItem(1,"gastos_cob", 0)
				dw_gastos_ci.SetItem(1,"mora", 0)
				dw_gastos_ci.SetItem(1,"subtotal", 0)	
				dw_gastos_ci.SetItem(1,'mora_cred',0)
				dw_gastos_ci.SetItem(1,'gasto_cred',0)
				dw_gastos_ci.SetItem(1,'mora_mant',0)
				dw_gastos_ci.SetItem(1,'gasto_mant',0)
				il_monto_mora				= 0
				il_monto_gc					= 0
			end if
		end if
	end if
	ll_tot_reg						= dw_detalle_ci.rowcount()
	for ll_indi =1 to ll_tot_reg
		ls_tipo_cob	= dw_detalle_ci.GetItemString(ll_indi, "tipo_cob")
		wf_calcular_interes(ls_tipo_cob)	
		dw_detalle_ci.accepttext()
	next	
else
	cb_ci_borrar_item.Enabled	= FALSE
	il_fila_uf						= 0
END IF

end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_ci_borrar from commandbutton within w_repacta_bkp
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 2482
integer y = 784
integer width = 338
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Borrar"
end type

event clicked;cbx_sin_mora.Visible 			= false
cbx_sin_mora.Checked 		= false
cbx_sin_gc.Visible 				= false
cbx_sin_gc.Checked 			= false
dw_detalle_ci.Reset()
dw_gastos_ci.Reset()
dw_dias_mora.Reset()
dw_ci_buscar_cliente.AcceptText()
il_suma_dia	= 0
il_fila_uf	= 0

end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_encabezado_ingreso_cupon from datawindow within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 206
integer y = 156
integer width = 2519
integer height = 284
boolean bringtotop = true
string dataobject = "d_encabezado_ingreso_cupon"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_abono from datawindow within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 2144
integer y = 484
integer width = 526
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_suma_monto_abono_por_ctto_ctacte"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_abono.visible	= false
end event

type dw_ci_buscar_cliente from datawindow within w_repacta_bkp
event itemchanged pbm_dwnitemchange
event ue_mousemove pbm_mousemove
integer x = 178
integer y = 476
integer width = 2542
integer height = 196
integer taborder = 10
string dataobject = "de_buscar_cliente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string		is_base, is_serie,ls_base_h,ls_serie_h
long 		il_nenc, il_ndat, il_rut
integer 	li_opcion
Double	il_numero,ll_numero_h

gs_tipo_cobro = "BE"
//gs_base = ""
//gs_serie = ""
//gi_numero = 0
gs_filtro = "cadena_codigo = 'O' OR cadena_codigo = 'U' OR cadena_codigo = 'L' OR cadena_codigo = 'P' OR cadena_codigo = 'D' OR cadena_codigo = 'R' OR cadena_codigo = 'M' "
dw_ci_buscar_cliente.AcceptText()
il_rut = long(dw_ci_buscar_cliente.GetItemString(1,"rl_rut"))
IF il_rut = 0 THEN
	IF dw_ci_buscar_cliente.GetItemString(1,"rn_contrato") = "" THEN
		gi_tipo_busqueda = 2
		gs_apellido_paterno = dw_ci_buscar_cliente.GetItemString(1,"rs_a_paterno")
	ELSE 
		gi_numero = Long(dw_ci_buscar_cliente.GetItemString(1,"rn_contrato"))
		gi_tipo_busqueda = 0
	END IF	
ELSE 
	gi_rut = long(dw_ci_buscar_cliente.GetItemString(1,"rl_rut"))
	gi_tipo_busqueda = 1
END IF
Open(w_buscar_cliente)
IF gf_permitir_ingreso(gs_base, gs_serie, gi_numero) THEN
//	Open(w_advertencia)
	gs_rezago = " "
	dw_ci_buscar_cliente.AcceptText()
	cb_ci_borrar.SetFocus()
	cb_ci_borrar.TriggerEvent(Clicked!)
//	RETURN 0
END IF
IF gs_base <> ""	AND gs_serie <> "" AND gi_numero > 0 THEN
	il_nenc = dw_encabezado_ingreso_cupon.Retrieve(gs_base, gs_serie, gi_numero)
	IF il_nenc > 0 THEN 
		gi_rut = dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")
	ELSE
		gi_rut = 0
	END IF
//	Open(w_mensaje)
	If gi_rut = 0 THEN
		gs_rezago = " "
		dw_ci_buscar_cliente.AcceptText()
		cb_ci_borrar.SetFocus()
		cb_ci_borrar.TriggerEvent(Clicked!)
		RETURN 0
	END IF
	CHOOSE CASE gs_base
		CASE "O", "U","M"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_oferta'
		CASE "L"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_liberador'
		CASE "P"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_pagare'
		CASE "D"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_derecho'
		CASE "C"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_bl_cto_isa'
		CASE "A"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_aumento_capacidad'
		CASE "R"
			dw_datos_ci.DataObject 	= 'dw_repacta_mant_descripcion_traspaso'
	END CHOOSE
	dw_datos_ci.SetTransObject(SQLCA)
	il_ndat = dw_datos_ci.Retrieve(gs_serie,gi_numero,gs_base)
	IF  il_nenc > 0 THEN
		DECLARE sp_actualizar_cuponeras_1 PROCEDURE FOR sp_actualizar_cuponeras_1(:gs_base,:gs_serie,:gi_numero);
		EXECUTE sp_actualizar_cuponeras_1;
		
		DECLARE sp_nuevo_cadena_mora_2 PROCEDURE FOR sp_nuevo_cadena_mora(:gs_base,:gs_serie,:gi_numero,'M');
		EXECUTE sp_nuevo_cadena_mora_2;
		if gs_base='M' then
			DECLARE x2 CURSOR FOR  
			SELECT 	"CADENA"."CODIGO",   	"CADENA"."SERIE",   	"CADENA"."NUMERO"  
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."MPBASE" = :gs_base ) AND  
						( "CADENA"."MPSERIE" = :gs_serie ) AND  
						( "CADENA"."MPNUMERO" = :gi_numero )   
			USING	sqlca;
			open x2;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x2 into :ls_base_h, :ls_serie_h, :ll_numero_h ;
					if not isnull(ls_base_h) then
						DECLARE sp_actualizar_cuponeras_h1 PROCEDURE FOR sp_actualizar_cuponeras_1(:ls_base_h,:ls_serie_h,:ll_numero_h);
						EXECUTE sp_actualizar_cuponeras_h1;
						
						DECLARE sp_nuevo_cadena_mora_h2 PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base_h,:ls_serie_h,:ll_numero_h,'M');
						EXECUTE sp_nuevo_cadena_mora_h2;
					end if
					Setnull(ls_base_h)
				LOOP
			end if
			close x2;
		end if
		dw_ci_buscar_cliente.SetItem(1,"rs_a_paterno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno"))
		dw_ci_buscar_cliente.SetItem(1,"rs_a_materno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno"))
		dw_ci_buscar_cliente.SetItem(1,"rs_nombre", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre"))
		dw_ci_buscar_cliente.SetItem(1,"rn_contrato",String(gi_numero)) 
		dw_ci_buscar_cliente.SetItem(1,"rl_rut",String(dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")))
		dw_ci_buscar_cliente.SetItem(1,"rs_dv",String(dw_encabezado_ingreso_cupon.GetItemstring(1, "cliente_dv")))
		dw_ci_buscar_cliente.SetItem(1,"dv",String(dw_encabezado_ingreso_cupon.GetItemstring(1, "cliente_dv")))
		dw_ci_buscar_cliente.SetItem(1,"rs_bs",(gs_base+gs_serie))
		gs_nombre_completo = dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre")+ " " +dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno") + " " + dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno")
		gs_rezago = " "
//		sle_numero_ci.Enabled = True
//		sle_numero_ci.SetFocus()
		f_validar_pie_pactado_actualizar('CI',dw_datos_ci.dataobject,gs_base,gs_serie,gi_numero)
	ELSE
		MessageBox("Ingreso de CI", "No se encontró información asociada a ese número de documento.")
		cb_ci_borrar.TriggerEvent(Clicked!)
	END IF	
ELSE
	IF Long(dw_ci_buscar_cliente.GetItemString(1,"rl_rut")) > 0 THEN 
		//No se encuentra el cliente, preguntar si desea ingresar rezago
		li_opcion = MessageBox("Ingreso de CI", "No se encontró el Cliente o el contrato no ha sido ingresado, desea ingresar Comprobante de Ingreso en rezago ?", Exclamation!, YesNo!, 2)
		IF li_opcion = 1 THEN
			gs_rezago	= "S"
			gs_base 		= gs_base
			gs_serie 		= "I"
			gi_numero 	= 0
			gi_rut 		= long(dw_ci_buscar_cliente.GetItemString(1,"rl_rut"))
//			sle_numero_ci.Enabled = True
//			sle_numero_ci.SetFocus()
		ELSE
			gs_rezago 	= " "
			dw_ci_buscar_cliente.AcceptText()
			cb_ci_borrar.SetFocus()
			cb_ci_borrar.TriggerEvent(Clicked!)
		END IF
	ELSE
		//MessageBox("Ingreso de CI", "No se encontró información asociada a ese número de documento.")
		cb_ci_borrar.TriggerEvent(Clicked!)
	END IF
END IF
if gs_base = 'O' or gs_base = 'U' or gs_base = 'D' then 
	cb_repacta.enabled	= true
	cb_1.enabled 			= true
end if
//if gs_base = 'R' then 
//	cb_repacta.enabled	= true
//	cb_1.enabled 			= false
//end if
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type st_help_descuento from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1207
integer y = 1700
integer width = 695
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28573695
string text = "Debe Ingresar Todos los Item para Aplicar Descuentos"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type st_help_abono from statictext within w_repacta_bkp
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2139
integer y = 420
integer width = 539
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28573695
string text = "Cliente Posee ABONO"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help_descuento.visible	= false
end event

type dw_gastos_ci from datawindow within w_repacta_bkp
event ue_mousemove pbm_mousemove
integer x = 1138
integer y = 1372
integer width = 1687
integer height = 324
integer taborder = 70
string dataobject = "de_gastos_ci"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_detalle_ci from datawindow within w_repacta_bkp
event itemchanged pbm_dwnitemchange
event ue_mousemove pbm_mousemove
integer x = 1138
integer y = 900
integer width = 1682
integer height = 460
integer taborder = 60
string dataobject = "de_detalle_ci"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string		is_columna,ls_texto,ls_tipo_cob,ls_tipo_cob_aux,ls_pasa,ls_descrip_estado,ls_estado_cadena,ls_moneda_ctto,sw_ok,ls_tipo_comp,ls_moneda_insert,&
			ls_otro_dscto,ls_tipo_cob_dscto,ls_tipo_cob_m,ls_tipo_cob_g,ls_tipo_mov_iva,ls_pasa_mult
long 		il_monto,fila,ii_dmora, ii_mora_cobro,ii_inc_gastos, ii_cantidad, i, ll_cantidad,ll_ctas_pactadas_pie,ll_plazo,ll_ctas_pag,ll_tot_reg,ll_indi,ll_crear,&
			ll_count_tipo,ll_ctas_pagadas,ll_resta,ll_ctas_plazo,ll_ctas_cancel,ll_cod_seguro,ll_new_seg,ll_factor_peso,ll_cant_e,ll_fila,ll_fila_reg,ll_count_e,&
			ll_fila_gasto,ll_count_adic,ll_fila_pie,ll_monto_pie_ingreso,ldb_valor_pie_reg,ld_pie_pactado,ll_ctas,ll_ctas_pagadas_1,ll_ctas_pagadas_2,ll_ctas_pag_m,&
			ll_cuota_ini,ll_cuota_fin,ll_monto_cuota_reg,ll_new_iva,ll_iva_p,ll_mora_mant,ll_gasto_mant,ll_iva_r,ll_fila_dscto,ll_monto_cta,ll_monto_final,&
			ll_fila_m,ll_fila_d,ll_new_m,ll_count_m,ll_count_f,ll_buscar_fa,ll_tot_reg_2,ll_buscar_fe,ll_buscar_ea
double 	id_im, id_gc, id_valor_cuota,ld_monto,ldb_uf,ldb_prima,ldb_iva,ll_iva_f,ll_iva_recalc,ldb_iva_mora_mant,ldb_iva_gasto_mant,ll_iva_cuota,ll_iva_f_real

ls_pasa_mult	= 'S'
ls_pasa			= 'S'
sw_ok			= 'S'
this.SetItem(row, "uf", gd_uf)
this.AcceptText()
is_columna		= this.GetColumnName()
ls_tipo_cob		= this.GetItemString(row, "tipo_cob")
//ls_tipo_comp						= gs_tipo_cobro
//if gs_codigo_otro = "" then gs_codigo_otro = '0'
//if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
//	wf_validar_descuento()
//end if
IF ls_tipo_cob <> 'L' and ls_tipo_cob<>'S' THEN
	ll_tot_reg						= dw_detalle_ci.rowcount()
	if ll_tot_reg>1 then
		for ll_indi = 1 to ll_tot_reg
			ls_tipo_cob_aux		= dw_detalle_ci.getitemstring(ll_indi,'tipo_cob')
			if ls_tipo_cob = ls_tipo_cob_aux then 
				ll_count_tipo ++
				if ll_count_tipo = 2 then
					messagebox("Advertencia","No puede Ingresar Tipo Cobro "+ls_tipo_cob+" Duplicado")
					wf_borrar_fila(ll_indi)
					ls_pasa		= 'N'
					exit
				end if
			end if
		next
		dw_detalle_ci.accepttext()
	end if
end if
if ls_pasa='S' then
	ls_tipo_cob	= this.GetItemString(row, "tipo_cob")
	IF is_columna = "tipo_cob"  THEN
	ll_tot_reg						= dw_detalle_ci.rowcount()
		ll_fila_reg 					= dw_detalle_ci.Find("tipo_cob ='4' or tipo_cob ='6'",1, ll_tot_reg)
		if ll_fila_reg > 0 then
			ll_count_e 				= dw_detalle_ci.Find("tipo_cob ='E' or tipo_cob ='U'",1, ll_tot_reg)
			if ll_count_e = 0 then
				do while sw_ok = 'S'
					ll_fila_reg 		= dw_detalle_ci.Find("tipo_cob ='4' or tipo_cob ='6'",1, ll_tot_reg)
					if ll_fila_reg > 0 then
						dw_detalle_ci.deleterow(ll_fila_reg)
						ll_fila_reg 	= dw_detalle_ci.Find("tipo_cob ='4' or tipo_cob ='6'",1, ll_tot_reg)
						if ll_fila_reg = 0 then sw_ok = 'N'
					end if
				loop
			end if
		end if
		IF ls_tipo_cob = "E" or ls_tipo_cob = "U" THEN
			this.SetItem(row, "cantidad", 1)
			if gs_base='M' then
				ll_tot_reg_2				= dw_detalle_ci.rowcount()
				ll_buscar_fa				= dw_detalle_ci.find("tipo_cob='F' or tipo_cob='A' ",1,ll_tot_reg_2)
				if ll_buscar_fa > 0 then
					messagebox("Advertencia","No puede Ingresar Tipo Cobro "+ls_tipo_cob+", Existe Pago Asociado a F-Mantención o A-Pie Multiproducto")
					dw_detalle_ci.deleterow(row)
					row						= 1
					ls_pasa_mult			= 'N'
					dw_detalle_ci.scrolltorow(1)
				else
					wf_cargar_credito_m(gs_base+gs_serie+string(gi_numero),ls_tipo_cob,1,'CTO',row,is_columna)
				end if
			else
				IF gs_rezago <> "S" THEN
					if dw_datos_ci.DataObject = 'd_datos_cuenta_ci_oferta' then
						ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'pago_oferta_nro_cuotas')
						ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'oferta_v_cta_pag_s')
					elseif dw_datos_ci.DataObject = 'd_datos_cuenta_ci_liberador' then
						ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'pago_liberador_nro_cuotas')
						ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'anexo_liberador_cta_pag_m')
					elseif dw_datos_ci.DataObject = 'd_datos_cuenta_ci_pagare' then
						ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'pagare_plazo')
						ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'c_cuotas_pagadas')
					elseif dw_datos_ci.DataObject = 'd_datos_cuenta_ci_derecho' then
						ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'derecho_plazo')
						ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'c_cuotas_pagadas')
					elseif dw_datos_ci.DataObject = 'dw_repacta_mant_descripcion_traspaso' then //d_datos_cuenta_ci_reprog_mant
						ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'cuotas_pactadas')
						ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'ctas_pagadas')
					elseif dw_datos_ci.DataObject = 'd_datos_cuenta_ci_aumento_capacidad' then
						ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'pago_aumento_nro_cuotas')
						ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'anexo_aumento_cta_pag_m')
					end if
					if ll_ctas_plazo = ll_ctas_cancel then
						messagebox("Advertencia","No Registra Cuotas Pendientes (Cuotas Pagadas Idem al Plazo)")
						wf_borrar_fila(row)
	//					this.SetItem(row, "monto", 0)
	//					this.SetItem(row, "cantidad", 0)
					else
						this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"))
					end if
					ll_cant_e								= dw_detalle_ci.getitemnumber(row,'cantidad')
					ldb_uf									= gd_uf
					ll_count_adic						= 0
					DECLARE x1 CURSOR FOR  
					SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",
								"SEGURO_ASOCIADOS"."MONEDA"
					FROM 	"SEGURO_ASOCIADOS"  
					WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )  AND
							  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
					USING	sqlca;
					open x1;
					if sqlca.sqlcode=0 then
						do while sqlca.sqlcode=0
							fetch x1 into :ll_cod_seguro, :ldb_prima, :ls_moneda_ctto ;
							if not isnull(ll_cod_seguro) and ll_cod_seguro > 0  then
								ll_count_adic			= 0
								ll_tot_reg				= dw_detalle_ci.rowcount()
								for ll_indi =1 to ll_tot_reg
									ls_tipo_cob			= dw_detalle_ci.GetItemString(ll_indi, "tipo_cob")
									if ls_tipo_cob = string(ll_cod_seguro) then
										ll_count_adic ++
										dw_detalle_ci.setitem(ll_indi,'cantidad', ll_cant_e)
									end if
								next
								dw_detalle_ci.accepttext()
								if ll_count_adic = 0 then
									ll_new_seg		= dw_detalle_ci.insertrow(0)
									dw_detalle_ci.setitem(ll_new_seg,'tipo_cob', string(ll_cod_seguro))
									dw_detalle_ci.setitem(ll_new_seg,'cantidad', ll_cant_e)
									if ls_moneda_ctto = '1' then
										dw_detalle_ci.setitem(ll_new_seg,'monto_uf',  round( ldb_prima / gd_uf,4))
										dw_detalle_ci.setitem(ll_new_seg,'monto', ldb_prima)
									else
										dw_detalle_ci.setitem(ll_new_seg,'monto_uf',  ldb_prima )
										dw_detalle_ci.setitem(ll_new_seg,'monto', round( ldb_prima * gd_uf,0))
									end if
									dw_detalle_ci.setitem(ll_new_seg,'uf',gd_uf)
									dw_detalle_ci.setitem(ll_new_seg,'estado','S')
								//	gd_uf
									dw_detalle_ci.SetItem(ll_new_seg, "moneda",'P')
								end if
							end if
							setnull(ll_cod_seguro)
						loop
					end if
					close x1;
					dw_detalle_ci.accepttext()
					
					if gs_base='L' then
						ll_monto_cuota_reg		= dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos")	//dw_detalle_ci.getitemnumber(getrow(),'c_total_linea')
						this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"))
						ii_cantidad 					= dw_detalle_ci.GetItemNumber(row, "cantidad")
						if gs_base='L' then
							ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'anexo_liberador_cta_pag_m')
						end if
						ll_cuota_ini					= ll_ctas_pag_m + 1
						ll_cuota_fin					= (ll_cuota_ini + ii_cantidad) - 1
						SELECT SUM( "VISTA_MANTEN_IVA"."IVA"  )
						INTO    :ldb_iva
						FROM    "VISTA_MANTEN_IVA"  
						WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
								  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
								  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
								  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'E' ) AND
								  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
								  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin ) ;
						if ldb_iva > 0 and ll_monto_cuota_reg > 0 then
								ll_iva_f 				= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
								ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
								if ll_new_iva > 0 then
									if ldb_iva > 0 then
										dw_detalle_ci.scrolltorow(ll_new_iva)
									else
										dw_detalle_ci.deleterow(ll_new_iva)
									end if
								else
									ll_new_iva		= dw_detalle_ci.insertrow(0)
								end if
								dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'D')
								dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
								dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
								dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_f / gd_uf,4))
								dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_f)
								dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
								dw_detalle_ci.setitem(ll_new_iva,'estado','S')
								dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
						else
								ll_iva_f 				= 0
								ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
								if ll_new_iva > 0 then
									dw_detalle_ci.deleterow(ll_new_iva)
								end if
						end if
						wf_calcular_interes(ls_tipo_cob)
						ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_cred')
						if ll_mora_mant > 0 then
							  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
							  INTO    	:ldb_iva
							  FROM    "VISTA_MANTEN_IVA"  
							  WHERE   ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
										  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
										  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
										  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'G' ) AND
										  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
										  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
							  if ldb_iva > 0 and ll_mora_mant > 0 then
									ll_iva_p 					= round(ll_mora_mant * (idb_iva - 1),0)
									ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
									if ll_new_iva > 0 then
										dw_detalle_ci.scrolltorow(ll_new_iva)
									else
										ll_new_iva		= dw_detalle_ci.insertrow(0)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
	//								if rb_be_afecta.checked=true then
									dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
	//								end if
									dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
									ls_moneda_insert	= '1'
									if ls_moneda_insert = '1' then
										dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_p / gd_uf,4))
										dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_p)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
									dw_detalle_ci.setitem(ll_new_iva,'estado','S')
									dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
							  else
									ll_iva_p 			= 0
							  end if
						end if
						ll_gasto_mant				= dw_gastos_ci.getitemnumber(1,'gasto_cred')
						if ll_gasto_mant > 0 then
							  SELECT  SUM("VISTA_MANTEN_IVA"."IVA" ) 
							  INTO    	:ldb_iva
							  FROM    "VISTA_MANTEN_IVA"  
							  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
									  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
									  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
									  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'J' ) AND
									  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
									  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
							  if ldb_iva > 0 and ll_gasto_mant > 0 then
									ll_iva_r 					= round(ll_gasto_mant * (idb_iva - 1),0)
									ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
									if ll_new_iva > 0 then
										dw_detalle_ci.scrolltorow(ll_new_iva)
									else
										ll_new_iva			= dw_detalle_ci.insertrow(0)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
	//								if rb_be_afecta.checked=true then
										dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
	//								end if
									dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
									ls_moneda_insert	= '1'
									if ls_moneda_insert = '1' then
										dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_r / gd_uf,4))
										dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_r)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
									dw_detalle_ci.setitem(ll_new_iva,'estado','S')
									dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
							  else
									ll_iva_r 			= 0
							  end if
						end if
					end if
				ELSE 
					this.SetItem(row, "monto", 0)
				END IF
			end if
			wf_calcular_interes(ls_tipo_cob)
		elseif ls_tipo_cob = "M" THEN
			this.SetItem(row, "moneda",'U')
			this.SetItem(row, "cantidad", 1)
			this.SetItem(row, "monto", 0)
			this.accepttext()
		ELSEIF ls_tipo_cob = "L" or ls_tipo_cob = "S" THEN
			this.SetItem(row, "monto", 0)
			this.SetItem(row, "cantidad", 1)
			ls_texto		= ls_tipo_cob+'~t'+'BE'
		//	ls_texto		= ls_tipo_cob+'~t'+ls_tipo_comp
			openwithparm(w_apertura_tipo_cobro_otros,ls_texto)
		ELSEIF ls_tipo_cob = "A" or ls_tipo_cob = "Q" THEN 				//		ELSEIF ls_tipo_cob = "A" THEN
			if ls_tipo_cob = "A" or ls_tipo_cob = "Q" then
				this.SetItem(row, "cantidad", 1)
			else
				this.SetItem(row, "cantidad", 0)
			end if	
			IF gs_rezago <> "S" THEN
				if gs_base='O' or gs_base='U' then
					if dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pagadas_pie') < dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') then
						//ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'BE'+'~t'+'0'
						ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+gs_tipo_cobro+'~t'+'0'
						openwithparm(w_ingreso_pago_pie_pactado,ls_texto)
						if Message.StringParm = 'N' then
							this.SetItem(row, "cantidad", 1)
						end if		
					else
						if dw_datos_ci.getitemnumber(1,'pago_oferta_pie') > 0 and dw_datos_ci.GetItemNumber(1,"pago_oferta_pie_pagado") > 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
							wf_borrar_fila(row)
						else
							this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
						end if
					end if
					this.accepttext()
					wf_calcular_interes(ls_tipo_cob)
					
				elseif gs_base='L' then
					if dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pagadas_pie') < dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') then
//					if dw_datos_ci.getitemnumber(1,'pago_liberador_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pagadas_pie') >= dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') and dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') > 0 then
					//if dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pagadas_pie') < dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') then
						//ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'BE'+'~t'+'0'
						ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+gs_tipo_cobro+'~t'+'0'
						openwithparm(w_ingreso_pago_pie_pactado,ls_texto)
						if Message.StringParm = 'N' then
							this.SetItem(row, "cantidad", 1)
						end if		
					else
						if dw_datos_ci.getitemnumber(1,'pago_liberador_pie') > 0 and dw_datos_ci.GetItemNumber(1,"pago_liberador_pie_pagado") > 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
							wf_borrar_fila(row)
						else
							this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
						end if
					end if
					this.accepttext()
					wf_calcular_interes(ls_tipo_cob)
					
				elseif gs_base<>'R' and gs_base<>'O' and gs_base<>'U' then
//					if gs_base='L' then
//						if dw_datos_ci.GetItemNumber(1,"pago_liberador_pie") = 0 then
//							messagebox("Advertencia","No es posible Ingresar Pie, No tiene Pie Pactado")
//							wf_borrar_fila(row)
//						else
//							if dw_datos_ci.getitemnumber(1,'pago_liberador_pie_pagado') > 0 and dw_datos_ci.GetItemNumber(1,"pago_liberador_pie") > 0 then
//								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
//								wf_borrar_fila(row)
//							else
//								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
//								this.accepttext()
//								wf_calcular_interes(ls_tipo_cob)
//							end if
//						end if
					if gs_base='D' then
						if dw_datos_ci.getitemnumber(1,'derecho_pie') = 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, No tiene Pie Pactado")
							wf_borrar_fila(row)
						else								
							if dw_datos_ci.getitemnumber(1,'derecho_pie') > 0 and dw_datos_ci.GetItemNumber(1,"derecho_pie_pagado") > 0 then
								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
								wf_borrar_fila(row)
							else
								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
								this.accepttext()
								wf_calcular_interes(ls_tipo_cob)
							end if
						end if
						
					elseif gs_base='A' then
						if dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pactadas_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pagadas_pie') < dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pactadas_pie') then
					//	if dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pagadas_pie') < dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') then
					//		ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'BE'+'~t'+'0'
							ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+gs_tipo_cobro+'~t'+'0'
							openwithparm(w_ingreso_pago_pie_pactado,ls_texto)
							if Message.StringParm = 'N' then
								this.SetItem(row, "cantidad", 1)
							end if		
						else
							if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pagadas_pie') >= dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pactadas_pie') and dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pactadas_pie') > 0 then	
							//if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') > 0 and dw_datos_ci.GetItemNumber(1,"pago_aumento_pie_pagado") > 0 then
								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
								wf_borrar_fila(row)
							else
								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
							end if
						end if
						this.accepttext()
						wf_calcular_interes(ls_tipo_cob)
//						if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') = 0 then
//							messagebox("Advertencia","No es posible Ingresar Pie, No tiene Pie Pactado")
//							wf_borrar_fila(row)
//						else
//							if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') > 0 and dw_datos_ci.GetItemNumber(1,"pago_aumento_pie_pagado") > 0 then
//								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
//								wf_borrar_fila(row)
//							else
//								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
//								this.accepttext()
//								wf_calcular_interes(ls_tipo_cob)
//							end if
//						end if
					
					elseif gs_base='P' then
						if dw_datos_ci.getitemnumber(1,'pagare_pie') = 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, No tiene Pie Pactado")
							wf_borrar_fila(row)
						else
							if dw_datos_ci.getitemnumber(1,'pagare_pie') > 0 and dw_datos_ci.GetItemNumber(1,"pagare_pie_pagado") > 0 then
								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
								wf_borrar_fila(row)
							else
								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
								this.accepttext()
								wf_calcular_interes(ls_tipo_cob)
							end if
						end if
					end if
				else
					messagebox("Advertencia","No es posible Ingresar Pie")
					wf_borrar_fila(row)
				end if
			ELSE
				this.SetItem(row, "monto", 0)
			END IF
//--------------
		elseIF ls_tipo_cob = "A" or ls_tipo_cob = "Q" THEN //pie
			if gs_base='M' then
				ll_tot_reg_2				= dw_detalle_ci.rowcount()
				ll_buscar_fe				= dw_detalle_ci.find("tipo_cob='F' or tipo_cob='E' ",1,ll_tot_reg_2)
				if ll_buscar_fe > 0 then
					messagebox("Advertencia","No puede Ingresar Tipo Cobro "+ls_tipo_cob+", Existe Pago Asociado a E-Cuota Credito o F-Mantención Multiproducto")
					dw_detalle_ci.deleterow(row)
					row						= 1
					ls_pasa_mult			= 'N'
					dw_detalle_ci.scrolltorow(1)
				else
					wf_cargar_credito_m(gs_base+gs_serie+string(gi_numero),ls_tipo_cob,1,'CTO',row,is_columna)
				end if
			end if
//			IF gs_rezago <> "S" THEN
//				ls_estado_cadena 		= dw_datos_ci.getitemstring(1,'cadena_estado')
//				if gs_base='O' and dw_datos_ci.DataObject='d_datos_cuenta_ci_oferta' then
//					ll_ctas				= dw_datos_ci.getitemnumber(1,'pago_oferta_nro_cuotas')
//					ll_ctas_pagadas	= dw_datos_ci.getitemnumber(1,'oferta_v_cta_pag_s')
//					ld_pie_pactado		= dw_datos_ci.getitemnumber(1,'pago_oferta_pie')
//					
//				elseif gs_base='P' and dw_datos_ci.DataObject='d_datos_cuenta_ci_pagare' then
//					ll_ctas				= dw_datos_ci.getitemnumber(1,'pagare_plazo')
//					ll_ctas_pagadas_1	= dw_datos_ci.getitemnumber(1,'pagare_cta_pag_la')
//					ll_ctas_pagadas_2	= dw_datos_ci.getitemnumber(1,'pagare_cta_pag_isa')
//					ll_ctas_pagadas	= ll_ctas_pagadas_1 + ll_ctas_pagadas_2
//					ld_pie_pactado		= dw_datos_ci.getitemnumber(1,'pagare_pie')
//					
//				elseif gs_base='L' and dw_datos_ci.DataObject='d_datos_cuenta_ci_liberador' then
//					ll_ctas				= dw_datos_ci.getitemnumber(1,'pago_liberador_nro_cuotas')
//					ll_ctas_pagadas	= dw_datos_ci.getitemnumber(1,'anexo_liberador_cta_pag_m')
//					ld_pie_pactado		= dw_datos_ci.getitemnumber(1,'pago_liberador_pie')
//					
//				elseif gs_base='F' and dw_datos_ci.DataObject='d_datos_cuenta_ci_funeraria' then
//					ll_ctas				= dw_datos_ci.getitemnumber(1,'producto_pago_plazo')
//					ll_ctas_pagadas	= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
//					ld_pie_pactado		= dw_datos_ci.getitemnumber(1,'producto_pago_pie')
//					
//				elseif gs_base='D' and dw_datos_ci.DataObject='d_datos_cuenta_ci_derecho' then
//					ll_ctas				= dw_datos_ci.getitemnumber(1,'derecho_plazo')
//					ll_ctas_pagadas_1	= dw_datos_ci.getitemnumber(1,'derecho_cta_pag_la')
//					ll_ctas_pagadas_2	= dw_datos_ci.getitemnumber(1,'derecho_cta_pag_isa')
//					ll_ctas_pagadas	= ll_ctas_pagadas_1 + ll_ctas_pagadas_2
//					ld_pie_pactado		= dw_datos_ci.getitemnumber(1,'derecho_pie')
//					
//				elseif gs_base='A' and dw_datos_ci.DataObject='d_datos_cuenta_ci_aumento_capacidad' then
//					ll_ctas				= dw_datos_ci.getitemnumber(1,'pago_aumento_nro_cuotas')
//					ll_ctas_pagadas	= dw_datos_ci.getitemnumber(1,'anexo_aumento_cta_pag_m')
//					ld_pie_pactado		= dw_datos_ci.getitemnumber(1,'pago_aumento_pie')
//					
//				elseif gs_base='R' and dw_datos_ci.DataObject='dw_repacta_mant_descripcion_traspaso' then
//					ll_ctas				= 0
//					ll_ctas_pagadas	= 0
//					ld_pie_pactado		= 0
//				end if
//				if gs_base<>'C' then
//					if ld_pie_pactado=0 or isnull(ld_pie_pactado) then
//						messagebox("Advertencia","No es Posible Ingresar A-Pie, NO tiene Valor")
//						SetItem(row, "monto", 0)
//						SetItem(row, "cantidad", 0)
//						dw_detalle_ci.setfocus()
//						dw_detalle_ci.setcolumn('tipo_cob')
//					else
//						if ll_ctas_pagadas>=ll_ctas and ls_estado_cadena='C' then
//							messagebox("Advertencia","No es Posible Ingresar A-Pie")
//							SetItem(row, "monto", 0)
//							SetItem(row, "cantidad", 0)
//							dw_detalle_ci.setfocus()
//							dw_detalle_ci.setcolumn('tipo_cob')
//						else
//							//////////////////////////////////////////////
//							if gs_base='O' then
//								if dw_datos_ci.getitemnumber(1,'pago_oferta_pie') > 0 and &
//									dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pagadas_pie') >= dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') and dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') > 0 then
//									ls_pasa	= 'N'
//								else
//									ls_pasa	= 'S'
//								end if
//								if ls_pasa='N' then
//									if dw_datos_ci.getitemnumber(1,'c_valor_pie_pesos') > 0 and dw_datos_ci.getitemnumber(1,'pago_oferta_pie_pagado')>0  then
//										ls_pasa	= 'N'
//									else
//										ls_pasa	= 'S'
//									end if
//								end if
//								//	valida PIE Promesa
//								if ls_pasa='S' then
//									ll_fila_pie 		= dw_detalle_ci.Find("tipo_cob ='A' or tipo_cob ='Q'",1, ll_tot_reg)
//									if ll_fila_Pie > 0 then
//										ll_monto_pie_ingreso		= round(dw_detalle_ci.getitemnumber(dw_detalle_ci.getrow(),'c_total_linea'),0)
//									else
//										ll_monto_pie_ingreso		= 0
//									end if
//									if isnull(ll_monto_pie_ingreso) then ll_monto_pie_ingreso=0
//									ldb_valor_pie_reg				= round(f_valida_pie_pagado(gs_base, gs_serie, gi_numero, dw_datos_ci.getitemstring(1,'pago_oferta_moneda')),0)
//									if ldb_valor_pie_reg + ll_monto_pie_ingreso > ld_pie_pactado  then
//										ls_pasa	= 'N'
//									else
//										ls_pasa	= 'S'
//									end if
//								end if
//							elseif gs_base='L' then
//								if dw_datos_ci.getitemnumber(1,'pago_liberador_pie') > 0 and &
//									dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pagadas_pie') >= dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') and dw_datos_ci.getitemnumber(1,'pago_liberador_ctas_pactadas_pie') > 0 then
//									ls_pasa	= 'N'
//								else
//									ls_pasa	= 'S'
//								end if
//								if ls_pasa='S' then
//									if dw_datos_ci.getitemnumber(1,'c_valor_pie_pesos') > 0 and dw_datos_ci.getitemnumber(1,'pago_liberador_pie_pagado')>0  then
//										ls_pasa	= 'N'
//									else
//										ls_pasa	= 'S'
//									end if
//								end if
//								//	valida PIE Liberador
//								if ls_pasa='S' then
//									ll_fila_pie 		= dw_detalle_ci.Find("tipo_cob ='A' or tipo_cob ='Q'",1, ll_tot_reg)
//									if ll_fila_Pie > 0 then
//										ll_monto_pie_ingreso		= round(dw_detalle_ci.getitemnumber(dw_detalle_ci.getrow(),'c_total_linea'),0)
//									else
//										ll_monto_pie_ingreso		= 0
//									end if
//									if isnull(ll_monto_pie_ingreso) then ll_monto_pie_ingreso=0
//									ldb_valor_pie_reg				= round(f_valida_pie_pagado(gs_base, gs_serie, gi_numero, dw_datos_ci.getitemstring(1,'pago_liberador_moneda')),0)
//									if ldb_valor_pie_reg + ll_monto_pie_ingreso > ld_pie_pactado  then
//										ls_pasa	= 'N'
//									else
//										ls_pasa	= 'S'
//									end if
//								end if
//							elseif gs_base='F' then
//								if dw_datos_ci.getitemnumber(1,'c_valor_pie_pesos') > 0 and dw_datos_ci.getitemnumber(1,'producto_pago_pie_pagado')>0  then
//									ls_pasa	= 'N'
//								else
//									ls_pasa	= 'S'
//								end if
//							elseif gs_base='A' then
//								if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') > 0 and &
//									dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pagadas_pie') >= dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pactadas_pie') and dw_datos_ci.getitemnumber(1,'pago_aumento_ctas_pactadas_pie') > 0 then
//									ls_pasa	= 'N'
//								else
//									ls_pasa	= 'S'
//								end if
////								if ls_pasa='S' then
////									if dw_datos_ci.getitemnumber(1,'c_valor_pie_pesos') > 0 and dw_datos_ci.getitemnumber(1,'pago_aumento_pie_pagado')>0 then
////										ls_pasa	= 'N'
////									else
////										ls_pasa	= 'S'
////									end if
////								end if	
//								//	valida PIE Aumento
//								if ls_pasa='S' then
//									ll_fila_pie 		= dw_detalle_ci.Find("tipo_cob ='A' or tipo_cob ='Q'",1, ll_tot_reg)
//									if ll_fila_Pie > 0 then
//										ll_monto_pie_ingreso		= round(dw_detalle_ci.getitemnumber(dw_detalle_ci.getrow(),'c_total_linea'),0)
//									else
//										ll_monto_pie_ingreso		= 0
//									end if
//									if isnull(ll_monto_pie_ingreso) then ll_monto_pie_ingreso=0
//									ldb_valor_pie_reg				= round(f_valida_pie_pagado(gs_base, gs_serie, gi_numero, dw_datos_ci.getitemstring(1,'pago_aumento_moneda')),0)
//									if ldb_valor_pie_reg + ll_monto_pie_ingreso > ld_pie_pactado  then
//										ls_pasa	= 'N'
//									else
//										ls_pasa	= 'S'
//									end if
//								end if
//							elseif gs_base='D' then
//								if dw_datos_ci.getitemnumber(1,'c_valor_pie_pesos') > 0 and dw_datos_ci.getitemnumber(1,'derecho_pie_pagado')>0 then
//									ls_pasa	= 'N'
//								else
//									ls_pasa	= 'S'
//								end if
//							elseif gs_base='R' then
//								ls_pasa	= 'N'
//							elseif gs_base='P' then
//								if dw_datos_ci.getitemnumber(1,'c_valor_pie_pesos') > 0 and dw_datos_ci.getitemnumber(1,'pagare_pie_pagado')>0  then
//									ls_pasa	= 'N'
//								else
//									ls_pasa	= 'S'
//								end if
//							end if
//							if ls_pasa='N' then
//								messagebox("Advertencia","No es Posible Ingresar A-Pie")
//								SetItem(row, "monto", 0)
//								SetItem(row, "cantidad", 0)
//								dw_detalle_ci.setfocus()
//								dw_detalle_ci.setcolumn('tipo_cob')
//							else
//								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
//							end if
//						end if
//					end if
//				else
//					messagebox("Advertencia","No es Posible Ingresar A-Pie a Contrato")
//					SetItem(row, "monto", 0)
//					SetItem(row, "cantidad", 0)
//					dw_detalle_ci.setfocus()
//					dw_detalle_ci.setcolumn('tipo_cob')
//				end if
//			else
//				if this.getitemnumber(row,'cantidad') <= 1 or isnull(this.getitemnumber(row,'cantidad')) then SetItem(row, "cantidad", 1)
//				SetItem(row, "monto", 0)
//				w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.accepttext()
//			end if
//		
//--------------
		ELSEIF ls_tipo_cob = "F" THEN
			SELECT 	Count("CUPONERAS_DETALLE"."TIPO_MOV"  )
			INTO 		:ll_count_m 
			FROM 	"CUPONERAS",   "CUPONERAS_DETALLE"
			WHERE 	( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
						( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
						( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
						( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
						( ( "CUPONERAS"."BASE" = :gs_base ) AND  
						( "CUPONERAS"."SERIE" = :gs_serie ) AND  
						( "CUPONERAS"."NUMERO" = :gi_numero ) AND  
						( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
						( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND
						("CUPONERAS"."ESTADO_CUPONERA" = 'V' OR  "CUPONERAS"."ESTADO_CUPONERA" = 'C') )	   ;
			if isnull(ll_count_m) then ll_count_m=0
			
			SELECT 	"CADENA_MORA"."MORA_MANT"  
			INTO 		:ll_mora_mant  
			FROM 	"CADENA_MORA"  
			WHERE 	( "CADENA_MORA"."BASE" = :gs_base ) AND  
						( "CADENA_MORA"."SERIE" = :gs_serie ) AND  
						( "CADENA_MORA"."NUMERO" = :gi_numero )   ;
			if isnull(ll_mora_mant) then ll_mora_mant=0	
			
			if ll_count_m <= (ll_mora_mant + 1) then
				ll_crear		= (ll_mora_mant + 1) - ll_count_m
				wf_crear_cupones_mantencion(ll_crear)
			end if
			
			this.SetItem(row, "cantidad", 1)
			ii_cantidad							= 1
			IF gs_rezago <> "S" THEN
				if gs_base='M' then
					ll_tot_reg_2					= dw_detalle_ci.rowcount()
					ll_buscar_ea				= dw_detalle_ci.find("tipo_cob='E' or tipo_cob='A' ",1,ll_tot_reg_2)
					if ll_buscar_ea > 0 then
						messagebox("Advertencia","No puede Ingresar Tipo Cobro "+ls_tipo_cob+", Existe Pago Asociado a E-Cuota Credito o A-Pie Multiproducto")
						dw_detalle_ci.deleterow(row)
						row						= 1
						ls_pasa_mult			= 'N'
						dw_detalle_ci.scrolltorow(1)
					else
						wf_cargar_credito_m(gs_base+gs_serie+string(gi_numero),ls_tipo_cob,1,'CTO',row,is_columna)
					end if
				else
					if gs_base='O' or gs_base='C' or gs_base='U' then
						ll_monto_cuota_reg		= dw_datos_ci.GetItemNumber(1,"c_valor_cuota_mantencion_pesos")	//dw_detalle_ci.getitemnumber(getrow(),'c_total_linea')
						this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
						if gs_base='O' or gs_base='U' then
							ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'oferta_v_cta_pag_m')
						elseif gs_base='C' then
							ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'contrato_cta_pag_m')
						end if
						ll_cuota_ini					= ll_ctas_pag_m + 1
						ll_cuota_fin					= (ll_cuota_ini + ii_cantidad) - 1
						SELECT SUM( "VISTA_MANTEN_IVA"."IVA"  )
						INTO    :ldb_iva
						FROM    "VISTA_MANTEN_IVA"  
						WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
								  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
								  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
								  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'F' ) AND
								  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
								  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin ) ;
						if ldb_iva > 0 and ll_monto_cuota_reg > 0 then
							ll_iva_f 				= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
							ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								if ldb_iva > 0 then
									dw_detalle_ci.scrolltorow(ll_new_iva)
								else
									dw_detalle_ci.deleterow(ll_new_iva)
								end if
							else
								ll_new_iva		= dw_detalle_ci.insertrow(0)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'D')
							dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
							dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
							dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_f / gd_uf,4))
							dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_f)
							dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
							dw_detalle_ci.setitem(ll_new_iva,'estado','S')
							dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
						else
							ll_iva_f 				= 0
							ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_ci.deleterow(ll_new_iva)
							end if
						end if
						wf_calcular_interes(ls_tipo_cob)
						ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_mant')
						if ll_mora_mant > 0 then
							  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
							  INTO    	:ldb_iva
							  FROM    "VISTA_MANTEN_IVA"  
							  WHERE   ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
										  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
										  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
										  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'P' ) AND
										  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
										  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
							  if ldb_iva > 0 and ll_mora_mant > 0 then
									ll_iva_p 					= round(ll_mora_mant * (idb_iva - 1),0)
									ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
									if ll_new_iva > 0 then
										dw_detalle_ci.scrolltorow(ll_new_iva)
									else
										ll_new_iva		= dw_detalle_ci.insertrow(0)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
	//								if rb_be_afecta.checked=true then
									dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
	//								end if
									dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
									ls_moneda_insert	= '1'
									if ls_moneda_insert = '1' then
										dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_p / gd_uf,4))
										dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_p)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
									dw_detalle_ci.setitem(ll_new_iva,'estado','S')
									dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
							  else
									ll_iva_p 			= 0
							  end if
						end if
						ll_gasto_mant				= dw_gastos_ci.getitemnumber(1,'gasto_mant')
						if ll_gasto_mant > 0 then
							  SELECT  SUM("VISTA_MANTEN_IVA"."IVA" ) 
							  INTO    	:ldb_iva
							  FROM    "VISTA_MANTEN_IVA"  
							  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
									  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
									  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
									  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'R' ) AND
									  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
									  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
							  if ldb_iva > 0 and ll_gasto_mant > 0 then
									ll_iva_r 					= round(ll_gasto_mant * (idb_iva - 1),0)
									ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
									if ll_new_iva > 0 then
										dw_detalle_ci.scrolltorow(ll_new_iva)
									else
										ll_new_iva			= dw_detalle_ci.insertrow(0)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
	//								if rb_be_afecta.checked=true then
										dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
	//								end if
									dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
									ls_moneda_insert	= '1'
									if ls_moneda_insert = '1' then
										dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_r / gd_uf,4))
										dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_r)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
									dw_detalle_ci.setitem(ll_new_iva,'estado','S')
									dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
							  else
									ll_iva_r 			= 0
							  end if
						end if
						
						
					else
						messagebox("Advertencia","No es posible Ingresar Pago Cuota Mantención")
						wf_borrar_fila(row)
					end if
				end if
			ELSE 
				this.SetItem(row, "monto", 0)
			END IF
		ELSE
			this.SetItem(row, "monto", 0)
			this.SetItem(row, "cantidad", 1)
		END IF
	END IF
	this.accepttext()
	dw_gastos_ci.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
	fila							= row
	if is_columna='cantidad' then
		ll_cantidad			= this.GetItemNumber(row, "cantidad")
		CHOOSE CASE gs_base
			CASE "O","U"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'pago_oferta_nro_cuotas')
				ll_ctas_pag	= dw_datos_ci.getitemnumber(1,'oferta_v_cta_pag_s')
			CASE "L"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'pago_liberador_nro_cuotas')
				ll_ctas_pag	= dw_datos_ci.getitemnumber(1,'anexo_liberador_cta_pag_m')
			CASE "P"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'pagare_plazo')
				ll_ctas_pag	= ( dw_datos_ci.getitemnumber(1,'pagare_cta_pag_la') + dw_datos_ci.getitemnumber(1,'pagare_cta_pag_isa') )
			CASE "D"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'derecho_plazo')
				ll_ctas_pag	= (dw_datos_ci.getitemnumber(1,'derecho_cta_pag_la') + dw_datos_ci.getitemnumber(1,'derecho_cta_pag_isa'))
			CASE "R"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'cuotas_pactadas')
				ll_ctas_pag	= dw_datos_ci.getitemnumber(1,'ctas_pagadas')
			CASE "A"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'pago_aumento_nro_cuotas')
				ll_ctas_pag	= dw_datos_ci.getitemnumber(1,'anexo_aumento_cta_pag_m')
		END CHOOSE
		if ll_cantidad > ll_plazo and (ls_tipo_cob = "E" or ls_tipo_cob = "U") then
			messagebox("Advertencia","Nº Cuotas es Superior al Plazo")
			wf_borrar_fila(row)
//			this.SetItem(row, "cantidad", 0)
//			this.SetItem(row, "monto", 0)
//			this.accepttext()
		else
			if gs_base='O' or gs_base='U' then
				ll_ctas_pactadas_pie	= dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie')
			else
				ll_ctas_pactadas_pie	= 0
			end if
			if isnull(ll_ctas_pactadas_pie) then ll_ctas_pactadas_pie=0
			ls_tipo_cob			= this.GetItemString(row, "tipo_cob")
			ll_ctas_pagadas	= ll_ctas_pag
			ll_resta				= ll_plazo - ll_ctas_pagadas
			if isnull(ll_ctas_pactadas_pie) then ll_ctas_pactadas_pie = 0
			if isnull(ll_ctas_pagadas) then ll_ctas_pagadas=0
			if ls_tipo_cob = "E" or ls_tipo_cob = "U" then
				IF ll_cantidad > 0 and ll_cantidad <= ll_resta AND gs_base<>'C' then //gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 THEN //AND
					this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"))
				else
					messagebox("Advertencia","Cantidad de Cuotas es Superior a Cuotas Pendientes")
					dw_gastos_ci.SetItem(1, "mora",0)
					dw_gastos_ci.SetItem(1, "gastos_cob",0)
					wf_borrar_fila(row)
				end if
			end if
			if ls_tipo_cob = "A" or ls_tipo_cob = "Q" then
				IF ll_cantidad > 1 AND gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 AND (gs_base='O' or gs_base='U') THEN
					messagebox("Advertencia","No es posible Ingresar más de 1 Cuota Pie, No es Parcelado")
					wf_borrar_fila(row)
				else
					IF (ls_tipo_cob = "A" or ls_tipo_cob = "Q") AND ll_cantidad = 1 AND gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 AND (gs_base='O' or gs_base='U') THEN
						this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
					end if
				end if
			end if
		end if
		///////////////////////////////
		//Script nuevo IVA Autor MM 22/12/2022
		dw_detalle_ci.accepttext()
		wf_calcular_interes(ls_tipo_cob)
		ll_monto_cuota_reg		= dw_detalle_ci.getitemnumber(dw_detalle_ci.getrow(),'c_total_linea')
		ii_cantidad 					= GetItemNumber(row, "cantidad")
		if gs_base='O' or gs_base='C' or gs_base='L' or gs_base='U' then
			if ls_tipo_cob='F' then
				ll_monto_cuota_reg		= dw_datos_ci.GetItemNumber(1,"c_valor_cuota_mantencion_pesos")	//dw_detalle_ci.getitemnumber(getrow(),'c_total_linea')
			elseif ls_tipo_cob='E' then
				ll_monto_cuota_reg		= dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos")	
			end if
			if ll_monto_cuota_reg > 0 then
				if gs_base='O' or gs_base='U' then
					ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'oferta_v_cta_pag_m')
				elseif gs_base='C' then
					ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'contrato_cta_pag_m')
				elseif gs_base='L' then
					ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'anexo_liberador_cta_pag_m')
					
	//				ll_monto_cuota_reg		= dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos")	//dw_detalle_ci.getitemnumber(getrow(),'c_total_linea')
	//				this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"))
	//				if gs_base='L' then
	//					ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'')
	//				end if
				end if
				ll_cuota_ini					= ll_ctas_pag_m + 1
				ll_cuota_fin					= (ll_cuota_ini + ii_cantidad) - 1
	
				  SELECT  SUM("VISTA_MANTEN_IVA"."IVA" ) 
				  INTO    :ldb_iva
				  FROM    "VISTA_MANTEN_IVA"  
				  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
							( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
							( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
							( "VISTA_MANTEN_IVA"."TIPO_MOV" = :ls_tipo_cob ) AND	//F or E
							( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
							( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
				  if ldb_iva > 0 and ll_monto_cuota_reg > 0 then
						ll_iva_f 				= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
						ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
						if ll_new_iva > 0 then
							if ldb_iva > 0 then
								dw_detalle_ci.scrolltorow(ll_new_iva)
							else
								dw_detalle_ci.deleterow(ll_new_iva)
							end if
						else
							ll_new_iva		= dw_detalle_ci.insertrow(0)
						end if
						dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'D')
		//				if rb_be_afecta.checked=true then
							dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
		//				end if
						dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
						ls_moneda_insert	= '1'
						if ls_moneda_insert = '1' then
							dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_f / gd_uf,4))
							dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_f)
						end if
						dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
						dw_detalle_ci.setitem(ll_new_iva,'estado','S')
						dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
				  else
						ll_iva_f 				= 0
						ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
						if ll_new_iva > 0 then
							dw_detalle_ci.deleterow(ll_new_iva)
						end if
				  end if
				  if gs_base='O' or gs_base='C' or gs_base='U' then
				  	ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_mant')
					ls_tipo_cob_m			= 'P'
					ls_tipo_cob_g			= 'R'
				elseif gs_base='L' then
					ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_cred')
					ls_tipo_cob_m			= 'G'
					ls_tipo_cob_g			= 'J'
				end if
				  if ll_mora_mant > 0 then
					  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
					  INTO    	:ldb_iva
					  FROM    "VISTA_MANTEN_IVA"  
					  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
								( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
								( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
								( "VISTA_MANTEN_IVA"."TIPO_MOV" =:ls_tipo_cob_m ) AND
								( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
								( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
					  if ldb_iva > 0 and ll_mora_mant > 0 then
							ll_iva_p 			= round(ll_mora_mant * (idb_iva - 1),0)		//round(ldb_iva,0)
							ll_new_iva		= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_ci.scrolltorow(ll_new_iva)
							else
								ll_new_iva		= dw_detalle_ci.insertrow(0)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
		//					if rb_be_afecta.checked=true then
								dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
		//					end if
							dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
							ls_moneda_insert	= '1'
							if ls_moneda_insert = '1' then
								dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_p / gd_uf,4))
								dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_p)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
							dw_detalle_ci.setitem(ll_new_iva,'estado','S')
							dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
					  else
							ll_iva_p 			= 0
					  end if
				  end if
				  if gs_base='O' or gs_base='C' or gs_base='U' then
				  	ll_gasto_mant				= dw_gastos_ci.getitemnumber(1,'gasto_mant')
					ls_tipo_cob_m				= 'P'
					ls_tipo_cob_g				= 'R'
				  elseif gs_base='L' then
					ll_gasto_mant				= dw_gastos_ci.getitemnumber(1,'gasto_cred')
					ls_tipo_cob_m				= 'G'
					ls_tipo_cob_g				= 'J'
				  end if
				  if ll_gasto_mant > 0 then
					  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
					  INTO    	:ldb_iva
					  FROM    "VISTA_MANTEN_IVA"  
					  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
								( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
								( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
								( "VISTA_MANTEN_IVA"."TIPO_MOV" = :ls_tipo_cob_g ) AND
								( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
								( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
					  if ldb_iva > 0 and ll_gasto_mant > 0 then
							ll_iva_r 			= round(ll_gasto_mant * (idb_iva - 1),0)		//round(ldb_iva,0)	
							ll_new_iva		= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_ci.scrolltorow(ll_new_iva)
							else
								ll_new_iva		= dw_detalle_ci.insertrow(0)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
		//					if rb_be_afecta.checked=true then
								dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
		//					end if
							dw_detalle_ci.setitem(ll_new_iva,'cantidad', 1)
							ls_moneda_insert	= '1'
							if ls_moneda_insert = '1' then
								dw_detalle_ci.setitem(ll_new_iva,'monto_uf', round( ll_iva_r / gd_uf,4))
								dw_detalle_ci.setitem(ll_new_iva,'monto', ll_iva_r)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'uf',gd_uf)
							dw_detalle_ci.setitem(ll_new_iva,'estado','S')
							dw_detalle_ci.SetItem(ll_new_iva, "moneda",'P')
					  else
							ll_iva_r 			= 0
					  end if
				end if
			end if
			//Fin script nuevo IVA Autor MM 22/12/2022
		end if
		
	end if
	if ls_tipo_cob = 'I' and gs_rezago <> "S" then //Abono
		messagebox("Advertencia","No es Posible Ingresar I-Abono")
		wf_borrar_fila(row)
	end if
	
	IF gs_rezago <> "S" and ls_tipo_cob = 'K' THEN
		ls_estado_cadena	= dw_datos_ci.getitemstring(1,'cadena_estado')
		SELECT	"ESTADO"."NOMBRE_ESTADO"  
		INTO 		:ls_descrip_estado  
		FROM 		"ESTADO"  
		WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_cadena ;
		if not isnull(ls_descrip_estado) then
			if gs_rezago <> "S" then
				messagebox("Advertencia","Para aplicar este Tipo de Cobro el Estado del Contrato debe estar en: S-Seguro Desgravamen, actualmente se encuentra en: "+ls_descrip_estado)
			else
				messagebox("Advertencia","Para aplicar este Tipo de Cobro el Estado del Contrato debe estar en: S-Seguro Desgravamen, actualmente se está ingresando como Rezago")
			end if
		else
			messagebox("Advertencia","No es Posible Ingresar K-Seguro Desgravamen")
		end if
		SetItem(row, "monto", 0)
		SetItem(row, "cantidad", 0)
		dw_detalle_ci.setfocus()
		dw_detalle_ci.setcolumn('tipo_cob')
	end if
	IF ls_tipo_cob = "M" then //Derecho Sepultacion
		if gs_rezago <> "S" THEN
			ls_estado_cadena	= dw_datos_ci.getitemstring(1,'cadena_estado')
			if ls_estado_cadena='V' or ls_estado_cadena='C' then
				if gs_base='O' or gs_base='C' or gs_base='U' then
					SetItem(row, "cantidad", 1)
				else
					messagebox("Advertencia","No es Posible Ingresar M-Derecho Sepultura para este Tipo de Contrato")
					wf_borrar_fila(row)
				end if
			else
				messagebox("Advertencia","Recuerde que Contrato debe estar V-Vigente o C-Cancelado")
				wf_borrar_fila(row)
			end if
		else
			SetItem(row, "cantidad", 1)
		end if
	end if
	IF (ls_tipo_cob = "E" or ls_tipo_cob = "U") AND this.GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" THEN //is_columna = "cantidad" AND 
		wf_calcular_interes(ls_tipo_cob)
		
		ii_cantidad 		= dw_detalle_ci.GetItemNumber(row, "cantidad")
		DECLARE x2 CURSOR FOR  
		SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO"  
		FROM 	"SEGURO_ASOCIADOS"  
		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )  AND
				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
		USING	sqlca;
		open x2;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x2 into :ll_cod_seguro;
				if not isnull(ll_cod_seguro) then
					ll_fila		= dw_detalle_ci.Find("tipo_cob = '"+string(ll_cod_seguro)+"'",1, dw_detalle_ci.RowCount())
					dw_detalle_ci.setitem(ll_fila,'cantidad',ii_cantidad)
				end if
				setnull(ll_cod_seguro)
			loop
		end if
		close x2;
		dw_detalle_ci.accepttext()
	END IF
	IF ls_tipo_cob = "F" AND GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" THEN
		wf_calcular_interes(ls_tipo_cob)
	END IF
	if isnull(dw_gastos_ci.getitemnumber(1,"gastos_cob")) then		
		dw_gastos_ci.SetItem(1,"gastos_cob", 0)
		il_monto_gc				= 0
	end if
	if isnull(dw_gastos_ci.getitemnumber(1,"mora")) then 				
		dw_gastos_ci.SetItem(1,"mora", 0)
		il_monto_mora			= 0
	end if
	IF is_columna = "monto_uf" and dw_detalle_ci.getitemstring(row,'moneda')='U' THEN
		il_fila_uf		= row
		ld_monto		= dw_detalle_ci.getitemnumber(row,'monto_uf')
		if ld_monto > 800 or ld_monto < 0 then
			dw_detalle_ci.SetItem(row, "cantidad", 0)
			dw_detalle_ci.SetItem(row, "monto", 0)
			dw_detalle_ci.SetItem(row, "monto_uf", 0)
			dw_detalle_ci.accepttext()
			dw_gastos_ci.SetItem(1, "Subtotal",dw_detalle_ci.GetItemNumber(1,"c_subtotal"))
			dw_detalle_ci.setfocus()
			dw_detalle_ci.setcolumn('monto_uf')
			messagebox("Advertencia","Revisar Monto Ingresado, recuerde tiene Seleccionado Opción Ingreso MONTO en U.F. o Monto Mayor a CERO")
		else
			ll_fila_m				= dw_detalle_ci.Find("tipo_cob='M'", 1, dw_detalle_ci.rowcount())
			if ll_fila_m > 0 then
				ll_fila_d			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
				if ll_fila_d > 0 then
					ll_iva_recalc		= round(ld_monto * (idb_iva - 1),2)
					dw_detalle_ci.setitem(ll_fila_d,'monto_uf',ll_iva_recalc)
					dw_detalle_ci.setitem(ll_fila_d,'monto', round( ll_iva_recalc * gd_uf,4))
				else
					ll_new_m		= dw_detalle_ci.insertrow(0)
					ll_iva_recalc		= round(ld_monto * (idb_iva - 1),2)
					dw_detalle_ci.setitem(ll_new_m,'tipo_cob', 'D')
					dw_detalle_ci.SetItem(ll_new_m, "iva", idb_iva)
					dw_detalle_ci.setitem(ll_new_m,'cantidad', 1)
					ls_moneda_insert	= '2'
					if ls_moneda_insert = '2' then
						dw_detalle_ci.setitem(ll_new_m,'monto', round( ll_iva_recalc * gd_uf,4))
						dw_detalle_ci.setitem(ll_new_m,'monto_uf', ll_iva_recalc)
					end if
					dw_detalle_ci.setitem(ll_new_m,'uf',gd_uf)
					dw_detalle_ci.setitem(ll_new_m,'estado','S')
					dw_detalle_ci.SetItem(ll_new_m, "moneda",'U')
				end if
			end if
		end if
	end if
	IF is_columna = "monto" THEN
		il_fila_uf		= row
		ld_monto		= dw_detalle_ci.getitemnumber(row,'monto')
		if ld_monto < 0 then
			dw_detalle_ci.SetItem(row, "cantidad", 0)
			dw_detalle_ci.SetItem(row, "monto", 0)
			dw_detalle_ci.SetItem(row, "monto_uf", 0)
			dw_detalle_ci.accepttext()
			dw_gastos_ci.SetItem(1, "Subtotal",dw_detalle_ci.GetItemNumber(1,"c_subtotal"))
			dw_detalle_ci.setfocus()
			dw_detalle_ci.setcolumn('monto')
			messagebox("Advertencia","Revisar Monto Ingresado, recuerde MONTO debe ser Mayor a CERO")
		end if
		// Recalcular IVA
		
			ls_otro_dscto					= dw_detalle_ci.getitemstring(row,'tipo_cob_otro')
			ls_tipo_cob_dscto				= dw_detalle_ci.getitemstring(row,'tipo_cob')
			
			if ls_tipo_cob_dscto='S' and (ls_otro_dscto='132' or ls_otro_dscto='131') and ld_monto > 0 then	//Descuento Mantencion
				if gs_base='O' or gs_base='C' or gs_base='U' then
					if gs_base='O' or gs_base='U' then
						ll_ctas_pag_m		= dw_datos_ci.getitemnumber(1,'oferta_v_cta_pag_m')
					elseif gs_base='C' then
						ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'contrato_cta_pag_m')
					end if
					ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='F'", 1, dw_detalle_ci.rowcount())
					ls_tipo_mov_iva		= 'F'
					ls_tipo_cob_m			= 'P'
					ls_tipo_cob_g			= 'R'
				
				elseif gs_base='L' then
					ll_ctas_pag_m			= dw_datos_ci.getitemnumber(1,'anexo_liberador_cta_pag_m')
					ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='U'", 1, dw_detalle_ci.rowcount())
					ls_tipo_mov_iva		= 'E'
					ls_tipo_cob_m			= 'G'
					ls_tipo_cob_g			= 'J'
				end if
				if ll_fila_dscto > 0 then 
					ll_cantidad 				= dw_detalle_ci.getitemnumber(ll_fila_dscto,'cantidad')
				else
					ll_cantidad 				= 1
				end if
				ll_cuota_ini					= ll_ctas_pag_m + 1
				ll_cuota_fin					= (ll_cuota_ini + ll_cantidad) - 1
				SELECT COUNT( "VISTA_MANTEN_IVA"."BASE"  )
				INTO    :ll_count_f
				FROM    "VISTA_MANTEN_IVA"  
				WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
						  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
						  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
						  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = :ls_tipo_mov_iva ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin ) AND
						  ( "VISTA_MANTEN_IVA"."IVA" > 0 ) ;
								  
				if isnull(ll_count_f) then ll_count_f=0
//				ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='F'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_cta		= dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea')
					ll_cantidad			= dw_detalle_ci.getitemnumber(ll_fila_dscto,'cantidad')
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_monto_cta - ld_monto
						ll_iva_cuota		= (round(ll_monto_final * (idb_iva - 1),0)) / ll_cantidad
						ll_iva_f_real		= round(ll_iva_cuota * ll_count_f,0)
						ll_iva_recalc		= ll_iva_f_real
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			
			elseif ls_tipo_cob_dscto='S' and (ls_otro_dscto='103' or ls_otro_dscto='107' or ls_otro_dscto='109' or ls_otro_dscto='113' or ls_otro_dscto='151') and ld_monto > 0 then	//Descuento Derecho Sepultacion
				ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='M'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_cta		= dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea')
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_monto_cta - ld_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			elseif ls_tipo_cob_dscto='S' and ls_otro_dscto='130' and ld_monto > 0 then	//Descuento Interes Mantencion
				ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_mant')
				if ll_mora_mant > 0 then
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='V'", 1, this.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_mora_mant - ld_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			elseif ls_tipo_cob_dscto='S' and ls_otro_dscto='102' and ld_monto > 0 then	//Descuento Interes Credito
				ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_cred')
				if ll_mora_mant > 0 then
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='V'", 1, this.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_mora_mant - ld_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			elseif ls_tipo_cob_dscto='S' and ls_otro_dscto='133' and ld_monto > 0 then	//Descuento gasto Cobranza Mantencion
				ll_gasto_mant			= dw_gastos_ci.getitemnumber(1,'gasto_mant')
				if ll_gasto_mant > 0 then
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='X'", 1, this.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_gasto_mant - ld_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			elseif ls_tipo_cob_dscto='S' and ls_otro_dscto='118' and ld_monto > 0 then	//Descuento gasto Cobranza Credito
				ll_gasto_mant			= dw_gastos_ci.getitemnumber(1,'gasto_cred')
				if ll_gasto_mant > 0 then
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='X'", 1, this.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_gasto_mant - ld_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			end if
			if gs_base='L' and ls_tipo_cob_dscto='S' and (ls_otro_dscto='131' or ls_otro_dscto='141' or ls_otro_dscto='147' ) and ld_monto > 0 then	//Descuento Mantencion
				ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, this.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_cta		= dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea')
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, this.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_monto_cta - ld_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
			end if
			this.accepttext()
			// Fin Recalculo IVA
	end if
	if isnull(dw_gastos_ci.getitemnumber(1,"incluir_gastos")) then dw_gastos_ci.SetItem(1,"incluir_gastos", 0)
	dw_gastos_ci.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
	dw_gastos_ci.accepttext()
	
	//
//	if ll_fila_gasto > 0 then
//		ll_fila_gasto		= dw_detalle_ci.Find( "tipo_cob = 'Q'",1, ll_tot_reg)
//		if ll_fila_gasto > 0 then
//			dw_detalle_ci.setitem(ll_fila_gasto,"cantidad",0)
//		end if	
//	end if	
	//
end if
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

event itemfocuschanged;Double	ld_monto
string		ls_tipo_cob
Long		ll_fila

ls_tipo_cob			= dw_detalle_ci.getitemstring(row,'tipo_cob')
ll_fila					= dw_detalle_ci.rowcount()
if il_fila_uf > 0 then
	if il_fila_uf > ll_fila then
		il_fila_uf 		= ll_fila
	end if
	if dw_detalle_ci.getitemstring(il_fila_uf,'moneda')='U' THEN
		ld_monto		= dw_detalle_ci.getitemnumber(il_fila_uf,'monto_uf')
		if ld_monto > 800 or ld_monto < 0 then
			dw_detalle_ci.SetItem(il_fila_uf, "cantidad", 0)
			dw_detalle_ci.SetItem(il_fila_uf, "monto", 0)
			dw_detalle_ci.SetItem(il_fila_uf, "monto_uf", 0)
			dw_detalle_ci.accepttext()
		end if
	end if
	ld_monto		= dw_detalle_ci.getitemnumber(il_fila_uf,'monto')
	if ld_monto < 0 then
		dw_detalle_ci.SetItem(il_fila_uf, "cantidad", 0)
		dw_detalle_ci.SetItem(il_fila_uf, "monto", 0)
		dw_detalle_ci.SetItem(il_fila_uf, "monto_uf", 0)
		dw_detalle_ci.accepttext()
	end if
end if
//if gs_codigo_otro = "" then gs_codigo_otro = '0'
//if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
//	wf_validar_descuento()
//end if
end event

event losefocus;string	ls_tipo_cob
Double	ld_monto
Long		ll_fila, ll_tot_fila

ls_tipo_cob			= dw_detalle_ci.getitemstring(dw_detalle_ci.getrow(),'tipo_cob')
//ll_fila				= dw_detalle_ci.getrow()
ll_fila					= dw_detalle_ci.rowcount()
if il_fila_uf > 0 then
	if il_fila_uf > ll_fila then
		il_fila_uf 		= ll_fila
	end if
	if dw_detalle_ci.getitemstring(il_fila_uf,'moneda')='U' THEN
		ld_monto		= dw_detalle_ci.getitemnumber(il_fila_uf,'monto_uf')
		if ld_monto > 800 then
			dw_detalle_ci.SetItem(il_fila_uf, "monto", 0)
			dw_detalle_ci.SetItem(il_fila_uf, "monto_uf", 0)
			dw_detalle_ci.accepttext()
		end if
		if gs_codigo_otro="" then gs_codigo_otro = '0'
		if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
			wf_validar_descuento()
		end if
	end if
end if

//if gs_codigo_otro="" then gs_codigo_otro = '0'
//if ls_tipo_cob = 'S' and gs_codigo_otro <> '0' then
//	wf_validar_descuento()
//end if
end event

