forward
global type w_repacta_funeraria from window
end type
type st_1 from statictext within w_repacta_funeraria
end type
type cbx_sin_gc from checkbox within w_repacta_funeraria
end type
type cbx_sin_mora from checkbox within w_repacta_funeraria
end type
type dw_dias_mora from datawindow within w_repacta_funeraria
end type
type cb_imprimir_detalle from commandbutton within w_repacta_funeraria
end type
type cb_3 from commandbutton within w_repacta_funeraria
end type
type cb_2 from commandbutton within w_repacta_funeraria
end type
type st_3 from statictext within w_repacta_funeraria
end type
type st_4 from statictext within w_repacta_funeraria
end type
type st_fecha from statictext within w_repacta_funeraria
end type
type st_uf from statictext within w_repacta_funeraria
end type
type cb_1 from commandbutton within w_repacta_funeraria
end type
type cb_repacta from commandbutton within w_repacta_funeraria
end type
type dw_gastos_ci from datawindow within w_repacta_funeraria
end type
type dw_detalle_ci from datawindow within w_repacta_funeraria
end type
type dw_datos_ci from datawindow within w_repacta_funeraria
end type
type cb_ci_insertar from commandbutton within w_repacta_funeraria
end type
type cb_ci_borrar_item from commandbutton within w_repacta_funeraria
end type
type cb_ci_borrar from commandbutton within w_repacta_funeraria
end type
type dw_encabezado_ingreso_cupon from datawindow within w_repacta_funeraria
end type
type dw_abono from datawindow within w_repacta_funeraria
end type
type dw_ci_buscar_cliente from datawindow within w_repacta_funeraria
end type
type st_help_descuento from statictext within w_repacta_funeraria
end type
type st_help_abono from statictext within w_repacta_funeraria
end type
end forward

global type w_repacta_funeraria from window
integer x = 146
integer y = 288
integer width = 2949
integer height = 1944
boolean titlebar = true
string title = "Calculo de Mora"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
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
dw_gastos_ci dw_gastos_ci
dw_detalle_ci dw_detalle_ci
dw_datos_ci dw_datos_ci
cb_ci_insertar cb_ci_insertar
cb_ci_borrar_item cb_ci_borrar_item
cb_ci_borrar cb_ci_borrar
dw_encabezado_ingreso_cupon dw_encabezado_ingreso_cupon
dw_abono dw_abono
dw_ci_buscar_cliente dw_ci_buscar_cliente
st_help_descuento st_help_descuento
st_help_abono st_help_abono
end type
global w_repacta_funeraria w_repacta_funeraria

type variables
//// var nuevas
//double	id_valor_cuota,id_im,id_gc
//long		ii_dmora,ii_mora_cobro,ii_inc_gastos,ii_cantidad
//// fin var nuevas
Long		il_suma_dia,il_monto_mora,il_monto_gc,il_abono
Double	id_factor_gc,id_tasa_mant,il_fila_uf,idb_iva
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_borrar_fila (long al_fila)
public subroutine wf_calcular_interes (string as_cobro)
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

public subroutine wf_calcular_interes (string as_cobro);Long		ii_cantidad,ii_dmora,ii_mora_cobro,ii_inc_gastos,i,ll_gasto_cob,ll_mora,ll_gastos,ll_tot_reg,ll_indi,ll_monto,ll_total_monto,ll_day,ll_month,ll_year,ll_ctas_mora,ll_new,&
			ll_dias_dif,ll_suma_dias,ll_tot_fila,ll_reg,ll_dias_mora,ll_calc_dias,ld_dias_sum_mora,id_valor_cuota,id_im, ll_ctas_pag,ldb_suma_gasto_cob=0, ldb_mora=0,ll_max,&
			ll_dia_prox_pago,ll_cant_cred,ll_cant_mant,ll_acum_dias,ll_dias_mora_cred,ll_sumar_mes,ll_mora_cred,ll_dias,ll_acum_id_im,ll_acum_id_gc
String	ls_tipo_cob,ls_pasa,ls_fecha
Date		ld_fecha_hoy,ld_fecha_inicial,ld_fecha_prox_pago,ld_fecha_prox_venc
Datetime	ldt_fecha_prim,ldt_fecha_venc,ldt_fecha_venc_calc,ld_fecha_venc_cred,ldt_fecha_hoy
Double	ldb_tasa,ldb_val_cta_cred,id_monto,id_gc,ll_suma_acum_gc

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
	ldt_fecha_hoy							= datetime(date(ld_fecha_hoy),time('00:00:00'))
	w_repacta_funeraria.dw_gastos_ci.SetItem(1,'gastos_cob', 0)
	il_monto_gc								= 0
	w_repacta_funeraria.dw_gastos_ci.SetItem(1,'mora', 0)
	il_monto_mora							= 0
	w_repacta_funeraria.dw_gastos_ci.SetItem(1,'incluir_gastos', 1)
	w_repacta_funeraria.dw_detalle_ci.accepttext()
	w_repacta_funeraria.dw_gastos_ci.accepttext()
	ll_tot_reg								= w_repacta_funeraria.dw_detalle_ci.rowcount()
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_tipo_cob						= w_repacta_funeraria.dw_detalle_ci.getitemstring(ll_indi,"tipo_cob")
			if ls_tipo_cob='E' or ls_tipo_cob='A' or ls_tipo_cob='F' then
				ii_cantidad 					= w_repacta_funeraria.dw_detalle_ci.GetItemNumber(ll_indi,"cantidad")
				ll_monto						= w_repacta_funeraria.dw_detalle_ci.GetItemNumber(ll_indi,"c_total_linea")
				gl_n_cuotas_pag 			= ii_cantidad 
				if ls_tipo_cob='E' then
					id_valor_cuota 		= Round(w_repacta_funeraria.dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"), 0)
					ii_dmora 				= w_repacta_funeraria.dw_datos_ci.GetItemNumber(1,"c_dias_mora")
					if gs_base='O' or gs_base='U' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'pago_oferta_fecha_prim')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'oferta_v_cta_pag_s')
					elseif gs_base='L' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'pago_liberador_fecha_prim')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'anexo_liberador_cta_pag_m')
					elseif gs_base='A' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'pago_aumento_fecha_prim')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'anexo_aumento_cta_pag_m')
					elseif gs_base='R' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'fecha_primera_cta')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'ctas_pagadas')
					elseif gs_base='P' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'pagare_fecha_prim')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'c_cuotas_pagadas')
					elseif gs_base='D' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'derecho_fecha_prim')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'c_cuotas_pagadas')
					elseif gs_base='F' or gs_base='G' or gs_base='V' then
						ldt_fecha_prim		= w_repacta_funeraria.dw_datos_ci.GetItemdatetime(1,'producto_pago_fecha_prim')
						ll_ctas_pag			= w_repacta_funeraria.dw_datos_ci.GetItemnumber(1,'producto_anexo_cuotas_pag')
					end if
					ld_fecha_prox_pago	= date(DATEtime(funcion_venc( ldt_fecha_prim , ll_ctas_pag ))) //-1
					ll_ctas_mora			= w_repacta_funeraria.dw_datos_ci.GetItemNumber(1,'c_cuotas_mora')
				elseif ls_tipo_cob='A' then
					id_valor_cuota 		= ll_monto
					ii_dmora 				= w_repacta_funeraria.dw_datos_ci.GetItemNumber(1,'c_dias_mora_pie')
				elseif ls_tipo_cob='F' then
					if gs_base='O' or gs_base='C' then
						id_valor_cuota 		= Round(w_repacta_funeraria.dw_datos_ci.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
						ii_dmora 			= w_repacta_funeraria.dw_datos_ci.GetItemNumber(1,"c_dias_mora_mant")
					end if
				end if
				id_gc 							= 0
				id_im 							= 0
				if ls_tipo_cob='A' or ls_tipo_cob='E' then
					ii_mora_cobro 			= 1
					ii_inc_gastos 			= 1
				elseif ls_tipo_cob='F' then
					ii_mora_cobro 			= 0
					ii_inc_gastos 			= 0
				end if
				if ls_tipo_cob='E' then
			//		Mirko Inicio
					ll_acum_dias									= ii_dmora
					ll_dias_mora_cred								= ii_dmora
					ll_sumar_mes									= 1
					id_im 												= 0
					id_gc 												= 0
					ll_indi 												= 1
					ldb_tasa											= dw_datos_ci.GetItemNumber(1,"c_tasa")
					ldt_fecha_venc									= dw_datos_ci.getitemdatetime(1, "c_prox_pago")
					ldb_val_cta_cred								= id_valor_cuota
					ll_mora_cred									= ll_ctas_mora			
					FOR i = 1 TO ii_cantidad
						if ll_mora_cred > 0 then 
							if ll_sumar_mes <= ll_mora_cred then
								 IF ll_acum_dias > 5 or ll_dias_mora_cred > 5 THEN  
									  ii_mora_cobro				= ll_acum_dias
									  id_monto						= round( ( ldb_tasa / 36000) * ldb_val_cta_cred,0 )
									  id_monto 						= round( ( id_monto * ii_mora_cobro), 0 )
									  id_im							= id_monto
				
									  IF ll_acum_dias > 30 THEN
//										id_gc 							= ldb_val_cta_cred * id_factor_gc
//										id_gc 							= Round(ldb_val_cta_cred * id_factor_gc, 10 )
										id_gc 							= Truncate(ldb_val_cta_cred * id_factor_gc, 0 )
									  else
										id_gc							= 0
									  END IF;
									  ldt_fecha_venc_calc			= ldt_fecha_venc
									  SELECT add_months( :ldt_fecha_venc_calc, :ll_cant_cred ) INTO :ld_fecha_venc_cred  FROM dual ;
//									  ld_fecha_venc_cred			= datetime(RelativeDate( date( ldt_fecha_venc_calc), ll_cant_cred ))
				
									  if ld_fecha_venc_cred > ldt_fecha_hoy then
										ld_fecha_venc_cred		= ldt_fecha_hoy
									  else
										ldt_fecha_venc				= ld_fecha_venc_cred
									  end if
				
									  ll_dias							= DaysAfter(date( ld_fecha_venc_cred) , date(ldt_fecha_venc_calc) )  // ld_fecha_venc_cred - ldt_fecha_venc_calc
									  ll_acum_dias					= ll_acum_dias + ll_dias		// signo -
								 else	//if ii_dmora <= 5 then
									  ii_mora_cobro				= 0
									  id_im							= 0
									  id_gc							= 0
								 end if
							else
								 id_im 								= 0
								 id_gc 								= 0
							end if;
						else
							id_im 										= 0
							id_gc 										= 0
						end if;
						ll_mora										= ll_mora + id_im
						ll_suma_acum_gc							= ll_suma_acum_gc + id_gc
						ll_sumar_mes								= ll_sumar_mes + 1
					NEXT
			//		Mirko Fin	
					ll_suma_acum_gc				= round(ll_suma_acum_gc,0)
					id_gc								= round(id_gc,0)
					ll_gasto_cob						= ROUND(ll_gasto_cob + ll_suma_acum_gc,0)		//id_gc// + ll_acum_gasto
//					ll_mora							= ROUND(ll_mora + id_im,0)								// + ll_acum_mora
					ll_acum_id_im					= ll_mora
					ll_acum_id_gc					= ll_suma_acum_gc		//ll_gasto_cob
					ll_acum_id_gc					= ll_gasto_cob
					id_im								= ll_acum_id_im
					if isnull(ll_gasto_cob) then ll_gasto_cob=0
					if isnull(ll_mora) then ll_mora=0



					ll_mora						= id_im		// ll_mora + id_im
//					ll_gasto_cob					= ll_gasto_cob	// + id_gc
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"mora", ll_mora)
					
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"gasto_cred", ll_gasto_cob)
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"mora_cred", ll_mora)
					
					il_monto_mora				= ll_mora
					il_monto_gc					= ll_gasto_cob
				//	w_repacta_funeraria.dw_gastos_ci.SetItem(1,"incluir_gastos", ii_inc_gastos)
					w_repacta_funeraria.dw_detalle_ci.accepttext()
					ll_total_monto	= w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total")		//(1,"c_subtotal")
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
					w_repacta_funeraria.dw_gastos_ci.accepttext()
				
				elseif ls_tipo_cob='A' then
					FOR i = 1 TO ii_cantidad
						if i > 1 then
							il_suma_dia ++
							ii_dmora				= ii_dmora - il_suma_dia
						else
							il_suma_dia			= 0
						end if
						IF (ii_dmora - (i - 1) * 30) > 5  AND cbx_sin_mora.Checked = False THEN
							ii_mora_cobro 		= (ii_dmora - (i - 1) * 30)
							id_im 					= id_im + gf_int_mora(dw_datos_ci.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
							IF (ii_dmora - (i - 1) * 30) > 30  AND cbx_sin_gc.Checked = False THEN		
								id_gc 				= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
								ii_inc_gastos	= 1
							END IF
						ELSE
//								ii_mora_cobro 	= 0
//								id_im 			= 0
//								id_gc 			= 0
						END IF	
					NEXT
					ll_gasto_cob				= ll_gasto_cob + id_gc
					ll_mora					= ll_mora + id_im
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"mora", ll_mora)
					
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"gasto_cred", ll_gasto_cob)
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"mora_cred", ll_mora)
					il_monto_mora			= ll_mora
					il_monto_gc				= ll_gasto_cob
				//	w_repacta_funeraria.dw_gastos_ci.SetItem(1,"incluir_gastos", ii_inc_gastos)
					w_repacta_funeraria.dw_detalle_ci.accepttext()
					ll_total_monto			= w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total")		//(1,"c_subtotal")
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
					w_repacta_funeraria.dw_gastos_ci.accepttext()
					
				elseif ls_tipo_cob='F' then
					id_gc 					= 0
					id_im 					= 0
					ii_mora_cobro 		= 0
					ii_inc_gastos 		= 0
					FOR i = 1 TO ii_cantidad 
						IF (ii_dmora - (i - 1) * 365) > 5  AND cbx_sin_mora.Checked = False THEN 
							ii_mora_cobro		= (ii_dmora - (i - 1) * 365)
							id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
							IF (ii_dmora - (i - 1) * 365) > 30  AND cbx_sin_gc.Checked = False THEN 
								 id_gc 			= id_gc + Round(id_valor_cuota * id_factor_gc, 0)
								 ii_inc_gastos = 1
							END IF
						END IF
					NEXT
					ll_gasto_cob			= ll_gasto_cob + id_gc
					ll_mora					= ll_mora + id_im
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"gastos_cob", ll_gasto_cob)
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"mora", ll_mora)
					il_monto_mora			= ll_mora
					il_monto_gc				= ll_gasto_cob
				//	w_repacta_funeraria.dw_gastos_ci.SetItem(1,"incluir_gastos", ii_inc_gastos)
					w_repacta_funeraria.dw_detalle_ci.accepttext()
					ll_total_monto	= w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total")		//(1,"c_subtotal")
					w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
					w_repacta_funeraria.dw_gastos_ci.accepttext()
				end if
			end if
		next
		
	end if
end if
end subroutine

on w_repacta_funeraria.create
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
this.dw_gastos_ci=create dw_gastos_ci
this.dw_detalle_ci=create dw_detalle_ci
this.dw_datos_ci=create dw_datos_ci
this.cb_ci_insertar=create cb_ci_insertar
this.cb_ci_borrar_item=create cb_ci_borrar_item
this.cb_ci_borrar=create cb_ci_borrar
this.dw_encabezado_ingreso_cupon=create dw_encabezado_ingreso_cupon
this.dw_abono=create dw_abono
this.dw_ci_buscar_cliente=create dw_ci_buscar_cliente
this.st_help_descuento=create st_help_descuento
this.st_help_abono=create st_help_abono
this.Control[]={this.st_1,&
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
this.dw_gastos_ci,&
this.dw_detalle_ci,&
this.dw_datos_ci,&
this.cb_ci_insertar,&
this.cb_ci_borrar_item,&
this.cb_ci_borrar,&
this.dw_encabezado_ingreso_cupon,&
this.dw_abono,&
this.dw_ci_buscar_cliente,&
this.st_help_descuento,&
this.st_help_abono}
end on

on w_repacta_funeraria.destroy
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
destroy(this.dw_gastos_ci)
destroy(this.dw_detalle_ci)
destroy(this.dw_datos_ci)
destroy(this.cb_ci_insertar)
destroy(this.cb_ci_borrar_item)
destroy(this.cb_ci_borrar)
destroy(this.dw_encabezado_ingreso_cupon)
destroy(this.dw_abono)
destroy(this.dw_ci_buscar_cliente)
destroy(this.st_help_descuento)
destroy(this.st_help_abono)
end on

event open;double	id_uf
date 		id_fecha

idt_fecha_hoy						= date(gdt_fec_sistema)
dw_dias_mora.settransobject(sqlca)
dw_abono.settransobject(sqlca)
gs_rezago							= 'N'
il_suma_dia							= 0
cbx_sin_mora.checked			= false
cbx_sin_mora.visible				= false
cbx_sin_gc.checked				= false
cbx_sin_gc.visible					= false
gf_centrar(w_repacta_funeraria)
SELECT "TASA"."TASA_INT_UF",	"TASA"."IVA" 	INTO :id_tasa_mant,	:idb_iva	 FROM "TASA" WHERE "TASA"."LOOK" = 1 ;

gd_tiempo_serv 					= idt_fecha_hoy
//id_factor_gc						= f_factor_gasto_cobranza()
SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
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
idw_detalle.retrieve('CI')
	
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
if gs_base = 'O' or gs_base = 'D' then 
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
gs_ventana							= 'w_repacta_funeraria'
f_valida_objeto()
end event

event mousemove;st_help_descuento.visible		= false
if il_abono > 0 then
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type st_1 from statictext within w_repacta_funeraria
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

type cbx_sin_gc from checkbox within w_repacta_funeraria
event ue_mousemove pbm_mousemove
integer x = 1591
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

event clicked;if cbx_sin_gc.checked=true then
	dw_gastos_ci.setitem(1,'gastos_cob',0)
else
	dw_gastos_ci.setitem(1,'gastos_cob',il_monto_gc)
end if
end event

type cbx_sin_mora from checkbox within w_repacta_funeraria
event ue_mousmove pbm_mousemove
integer x = 1221
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

event clicked;if cbx_sin_mora.checked=true then
	dw_gastos_ci.setitem(1,'mora',0)
else
	dw_gastos_ci.setitem(1,'mora',il_monto_mora)
end if
end event

type dw_dias_mora from datawindow within w_repacta_funeraria
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

type cb_imprimir_detalle from commandbutton within w_repacta_funeraria
event ue_mousemove pbm_mousemove
integer x = 1911
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

event clicked;if dw_gastos_ci.rowcount() > 0 then
	if dw_gastos_ci.getitemnumber(1,'subtotal') > 0 and dw_gastos_ci.getitemnumber(1,'c_total') > 0 then
		if gs_base='V' then
			if isvalid(w_imprimir_detalle_pago_crematorio) then close(w_imprimir_detalle_pago_crematorio)
			open(w_imprimir_detalle_pago_crematorio)
		else
			if isvalid(w_imprimir_detalle_pago) then close(w_imprimir_detalle_pago)
			open(w_imprimir_detalle_pago)
		end if
	end if
end if
end event

type cb_3 from commandbutton within w_repacta_funeraria
event ue_mousemove pbm_mousemove
integer x = 2542
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

event clicked;Close(w_repacta_funeraria)
end event

type cb_2 from commandbutton within w_repacta_funeraria
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
	END CHOOSE
END IF
end event

type st_3 from statictext within w_repacta_funeraria
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

type st_4 from statictext within w_repacta_funeraria
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

type st_fecha from statictext within w_repacta_funeraria
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

type st_uf from statictext within w_repacta_funeraria
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

type cb_1 from commandbutton within w_repacta_funeraria
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1573
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

event clicked;String		ls_credito
double	tasa

IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
	CASE "O"
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
	CASE "F"
		SELECT		"PRODUCTO_ANEXO"."FORMA_PAGO",   
						"PRODUCTO_PAGO"."TASA"
		INTO 			:ls_credito,   
						:tasa
		FROM 		"CADENA",   
						"PRODUCTO_ANEXO",   
						"PRODUCTO_PAGO"  
		WHERE 	  ( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
					  ( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
					  ( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
					  ( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
					  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
					  ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
					  ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
					  ( ( "CADENA"."CODIGO" = :gs_base ) AND  
					  ( "CADENA"."SERIE" = :gs_serie ) AND  
					  ( "CADENA"."NUMERO" = :gi_numero ) )   ;
		if ls_credito = '2'  or ls_credito = '4' then	
			open(w_prepago_funeraria)			
		else
			messagebox(gs_app_name,'Esta Promesa No Tiene Crédito',information!)
		end if	
	END CHOOSE
END IF
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_repacta from commandbutton within w_repacta_funeraria
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1221
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
String	ls_credito

IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O"
			SELECT	"OFERTA_V"."FORMA_PAGO",   
						"PAGO_OFERTA"."TASA",
						"PAGO_OFERTA"."NRO_CUOTAS"
			INTO 		:ls_credito,   
						:tasa,
						:ll_plazo
			FROM 	"PAGO_OFERTA",   
						"OFERTA_V"  		
			WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and 
					 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and 
					 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
					 (("PAGO_OFERTA"."SERIE" = :gs_serie ) AND  
					 ( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) )   ;	
			if (ls_credito = '2' ) or (ls_credito='1' and ll_plazo>0) or (ls_credito = '4') then	
				open(w_cuotas)			
			else
				messagebox(gs_app_name,'Esta Promesa No Tiene Crédito',information!)
			end if	
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
		CASE "F"
			SELECT		"PRODUCTO_ANEXO"."FORMA_PAGO",   
							"PRODUCTO_PAGO"."TASA",   
							"PRODUCTO_PAGO"."PLAZO"  
			INTO 			:ls_credito,   
							:tasa,   
							:ll_plazo  
			FROM 		"CADENA",   
							"PRODUCTO_ANEXO",   
							"PRODUCTO_PAGO"  
			WHERE 	  ( "CADENA"."CODIGO" = "PRODUCTO_ANEXO"."BASE" ) and  
						  ( "CADENA"."SERIE" = "PRODUCTO_ANEXO"."SERIE" ) and  
						  ( "CADENA"."NUMERO" = "PRODUCTO_ANEXO"."NUMERO" ) and  
						  ( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
						  ( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
						  ( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
						  ( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
						  ( ( "CADENA"."CODIGO" = :gs_base ) AND  
						  ( "CADENA"."SERIE" = :gs_serie ) AND  
						  ( "CADENA"."NUMERO" = :gi_numero ) )   ;
			if (ls_credito = '2' ) or (ls_credito='1' and ll_plazo>0) or (ls_credito = '4') then	
				open(w_cuotas_funeraria)			
			else
				messagebox(gs_app_name,'Esta Promesa No Tiene Crédito',information!)
			end if	
	END CHOOSE
END IF
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_gastos_ci from datawindow within w_repacta_funeraria
event ue_mousemove pbm_mousemove
integer x = 1225
integer y = 1392
integer width = 1682
integer height = 308
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

type dw_detalle_ci from datawindow within w_repacta_funeraria
event itemchanged pbm_dwnitemchange
event ue_mousemove pbm_mousemove
integer x = 1198
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

event itemchanged;string		is_columna,ls_texto,ls_tipo_cob,ls_tipo_cob_aux,ls_pasa,ls_descrip_estado,ls_estado_cadena,ls_moneda_ctto,ls_moneda_insert,ls_string,ls_tipo_cob_otro
long 		il_monto,fila,ii_dmora, ii_mora_cobro,ii_inc_gastos, ii_cantidad, i, ll_cantidad,ll_ctas_pactadas_pie,ll_plazo,ll_ctas_pag,ll_tot_reg,ll_indi,&
			ll_count_tipo,ll_ctas_pagadas,ll_resta,ll_ctas_plazo,ll_ctas_cancel,ll_cod_seguro,ll_new_seg,ll_factor_peso,ll_cant_e,ll_fila,ll_fila_e,ll_ctas_pag_m,&
			ll_cantidad_cta,ll_cuota_ini,ll_cuota_fin,ll_new_iva,ll_cod_servicio,ll_fila_dscto,ll_fila_cuota_pie,ll_monto_descuento
double 	id_im, id_gc, id_valor_cuota,ld_monto,ldb_uf,ldb_prima,ll_monto_cuota_reg,ldb_iva,ll_iva_f,ll_mora_mant,ll_iva_p,ll_gasto_mant,ll_iva_r,ald_monto,ald_monto_cta,&
			ll_monto_cta,ll_monto_final,ll_iva_recalc,ll_total_monto

SELECT 	"TASA"."IVA"  INTO :idb_iva FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
this.SetItem(row, "uf", gd_uf)
ls_pasa								= 'S'
this.AcceptText()
is_columna							= this.GetColumnName()
ls_tipo_cob							= this.GetItemString(row, "tipo_cob")
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
					ls_pasa			= 'N'
					exit
				end if
			end if
		next
		dw_detalle_ci.accepttext()
	end if
end if
if ls_pasa='S' then
	ls_tipo_cob						= this.GetItemString(row, "tipo_cob")
	IF is_columna = "tipo_cob"  THEN
		IF ls_tipo_cob = "E" THEN
			this.SetItem(row, "cantidad", 1)
			this.SetItem(row,'cod_servicio',ll_cod_servicio)
			this.accepttext()
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
				elseif dw_datos_ci.DataObject = 'd_datos_cuenta_ci_funeraria' then
					ll_ctas_plazo	= dw_datos_ci.getitemnumber(1,'producto_pago_plazo')
					ll_ctas_cancel	= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
					ll_cod_servicio	= dw_datos_ci.getitemnumber(1,'producto_pago_codigo_servicio')
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
						if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
							ll_new_seg		= dw_detalle_ci.insertrow(0)
							dw_detalle_ci.setitem(ll_new_seg,'tipo_cob', string(ll_cod_seguro))
							dw_detalle_ci.setitem(ll_new_seg,'cantidad', ll_cant_e)
							dw_detalle_ci.setitem(ll_new_seg,'cod_servicio',ll_cod_servicio)
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
						setnull(ll_cod_seguro)
					loop
				end if
				close x1;
				dw_detalle_ci.accepttext()
				wf_calcular_interes(ls_tipo_cob)
				if gs_base='G' or gs_base='F' then
					//Script nuevo IVA Autor MM 22/12/2022
					if gs_tipo_cobro = 'BA' or gs_tipo_cobro = 'FA' or gs_tipo_cobro = 'CI' then
						ll_fila_e							= dw_detalle_ci.find("tipo_cob = 'E' ",1,dw_detalle_ci.rowcount())
						if ll_fila_e > 0 then
							ll_ctas_pag_m				= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
							ll_monto_cuota_reg		= round(dw_detalle_ci.getitemnumber(ll_fila_e,'c_total_linea'),0)
							ll_cantidad_cta				= dw_detalle_ci.GetItemNumber(ll_fila_e, "cantidad")
							if isnull(ll_cantidad_cta) or ll_cantidad_cta = 0 then ll_cantidad_cta=1
							ll_cuota_ini					= ll_ctas_pag_m + 1
							ll_cuota_fin					= (ll_cuota_ini + ll_cantidad_cta) - 1
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
									if gs_base='G' then
										gs_tipo_cobro_aux		= 'BE'
									elseif gs_base='F' then
										gs_tipo_cobro_aux		= 'BA'
									end if
									ll_iva_recalc					= round(ll_monto_cuota_reg * (idb_iva - 1),0)
									ll_iva_f 						= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
									if ll_iva_recalc <> ll_iva_f and ll_iva_recalc > 0 then
										ll_iva_f					= ll_iva_recalc
									end if
									ll_new_iva					= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
									if ll_new_iva > 0 then
										if ldb_iva > 0 then
											dw_detalle_ci.scrolltorow(ll_new_iva)
										else
											dw_detalle_ci.deleterow(ll_new_iva)
										end if
									else
										ll_new_iva				= dw_detalle_ci.insertrow(0)
									end if
									dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'D')
									dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
									dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
									gl_iva_exento_f		= ll_monto_cuota_reg
									ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
									if ll_new_iva > 0 then
										dw_detalle_ci.deleterow(ll_new_iva)
									end if
							  end if
							  ll_mora_mant			= round(dw_gastos_ci.getitemnumber(1,'mora_cred'),0)
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
										if gs_base='G' then
											gs_tipo_cobro_aux		= 'BE'
										elseif gs_base='F' then
											gs_tipo_cobro_aux		= 'BA'
										end if
										ll_iva_recalc 				= round(ll_mora_mant * (idb_iva - 1),0)
										ll_iva_p 						= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
										if ll_iva_recalc <> ll_iva_p and ll_iva_recalc > 0 then
											ll_iva_p					= ll_iva_recalc
										end if
										ll_new_iva					= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
										if ll_new_iva > 0 then
											dw_detalle_ci.scrolltorow(ll_new_iva)
										else
											ll_new_iva				= dw_detalle_ci.insertrow(0)
										end if
										dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
										dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
										dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
							  ll_gasto_mant				= round(dw_gastos_ci.getitemnumber(1,'gasto_cred'),0)
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
										if gs_base='G' then
											gs_tipo_cobro_aux		= 'BE'
										elseif gs_base='F' then
											gs_tipo_cobro_aux		= 'BA'
										end if
										ll_iva_recalc 				= round(ll_gasto_mant * (idb_iva - 1),0)
										ll_iva_r 						= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
										if ll_iva_recalc <> ll_iva_r and ll_iva_recalc > 0 then
											ll_iva_r					= ll_iva_recalc
										end if
										ll_new_iva					= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
										if ll_new_iva > 0 then
											dw_detalle_ci.scrolltorow(ll_new_iva)
										else
											ll_new_iva				= dw_detalle_ci.insertrow(0)
										end if
										dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
										dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
										dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
					end if
					//Fin script nuevo IVA Autor MM 22/12/2022
					//ls_string		= "isnull(tipo_cob_otro) "
					ls_string			= "isnull(cod_servicio) "
					ll_fila				= dw_detalle_ci.Find(ls_string, 1, dw_detalle_ci.RowCount())
					if ll_fila > 0 then
						dw_detalle_ci.deleterow(ll_fila)
					end if
				end if
				
			ELSE 
				this.SetItem(row, "monto", 0)
			END IF
		elseif ls_tipo_cob = "M" THEN
			this.SetItem(row, "moneda",'U')
			this.SetItem(row, "cantidad", 1)
			this.SetItem(row, "monto", 0)
			this.accepttext()
		ELSEIF ls_tipo_cob = "L" or ls_tipo_cob = "S" THEN
			this.SetItem(row, "monto", 0)
			this.SetItem(row, "cantidad", 1)
			ls_texto		= ls_tipo_cob+'~t'+'CI'
			openwithparm(w_apertura_tipo_cobro_otros,ls_texto)
		ELSEIF ls_tipo_cob = "A" THEN
			this.SetItem(row, "cantidad", 1)
			IF gs_rezago <> "S" THEN
				if gs_base='O' then
					if dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') > 0 and dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pagadas_pie') < dw_datos_ci.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') then
						ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'CI'+'~t'+'0'
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
				elseif gs_base='F' or gs_base='G' or gs_base='V' then
					if dw_datos_ci.getitemnumber(1,'producto_pago_ctas_pie_plazo') > 0 and dw_datos_ci.getitemnumber(1,'producto_pago_ctas_pie_pagadas') < dw_datos_ci.getitemnumber(1,'producto_pago_ctas_pie_plazo') then
						ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'CI'+'~t'+'0'
						openwithparm(w_ingreso_pago_pie_pactado,ls_texto)
						if Message.StringParm = 'N' then
							this.SetItem(row, "cantidad", 1)
						end if		
					else
						if dw_datos_ci.getitemnumber(1,'producto_pago_pie') > 0 and dw_datos_ci.GetItemNumber(1,"producto_pago_pie_pagado") > 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
							wf_borrar_fila(row)
						else
							this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
						end if
					end if
					this.accepttext()
					wf_calcular_interes(ls_tipo_cob)
				elseif gs_base<>'R' and gs_base<>'O' then
					if gs_base='L' then
						if dw_datos_ci.GetItemNumber(1,"pago_liberador_pie") = 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, No tiene Pie Pactado")
							wf_borrar_fila(row)
						else
							if dw_datos_ci.getitemnumber(1,'pago_liberador_pie_pagado') > 0 and dw_datos_ci.GetItemNumber(1,"pago_liberador_pie") > 0 then
								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
								wf_borrar_fila(row)
							else
								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
								this.accepttext()
								wf_calcular_interes(ls_tipo_cob)
							end if
						end if
							
					elseif gs_base='D' then
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
						if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') = 0 then
							messagebox("Advertencia","No es posible Ingresar Pie, No tiene Pie Pactado")
							wf_borrar_fila(row)
						else
							if dw_datos_ci.getitemnumber(1,'pago_aumento_pie') > 0 and dw_datos_ci.GetItemNumber(1,"pago_aumento_pie_pagado") > 0 then
								messagebox("Advertencia","No es posible Ingresar Pie, está Cancelado")
								wf_borrar_fila(row)
							else
								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
								this.accepttext()
								wf_calcular_interes(ls_tipo_cob)
							end if
						end if
						
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
		ELSEIF ls_tipo_cob = "F" THEN
			this.SetItem(row, "cantidad", 1)
			IF gs_rezago <> "S" THEN
				if gs_base='O' or gs_base='C' then
					this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
				else
					messagebox("Advertencia","No es posible Ingresar Pago Cuota Mantención")
					wf_borrar_fila(row)
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
	fila						= row
	if is_columna='cantidad' then
		ll_cantidad			= this.GetItemNumber(row, "cantidad")
		ls_tipo_cob			= this.getitemstring(row,'tipo_cob')
		wf_calcular_interes(ls_tipo_cob)
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
			CASE "F" , "G", "V"
				ll_plazo		= dw_datos_ci.getitemnumber(1,'producto_pago_plazo')
				ll_ctas_pag	= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
		END CHOOSE
		if ll_cantidad > ll_plazo and ls_tipo_cob = "E" then
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
			if ls_tipo_cob = "E" then
				IF ll_cantidad > 0 and ll_cantidad <= ll_resta AND gs_base<>'C' then //gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 THEN //AND
					this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_cuota_pesos"))
				else
					messagebox("Advertencia","Cantidad de Cuotas es Superior a Cuotas Pendientes")
					dw_gastos_ci.SetItem(1, "mora",0)
					dw_gastos_ci.SetItem(1, "gastos_cob",0)
					wf_borrar_fila(row)
				end if
			end if
			if ls_tipo_cob = "A" then
				IF ll_cantidad > 1 AND gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 AND gs_base='O' THEN
					messagebox("Advertencia","No es posible Ingresar más de 1 Cuota Pie, No es Parcelado")
					wf_borrar_fila(row)
				else
					IF ls_tipo_cob = "A" AND ll_cantidad = 1 AND gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 AND gs_base='O' THEN
						this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
					end if
				end if
			end if
			
			if gs_base='G' or gs_base='F' then
				ls_tipo_cob			= this.getitemstring(row,'tipo_cob')
				wf_calcular_interes(ls_tipo_cob)
				//Script nuevo IVA Autor MM 22/12/2022
				if ls_tipo_cob = 'E' then
					ll_monto_cuota_reg		= dw_detalle_ci.getitemnumber(row,'c_total_linea')
					ii_cantidad 					= dw_detalle_ci.GetItemNumber(row, "cantidad")
					if isnull(ii_cantidad) or ii_cantidad = 0 then ii_cantidad=1
					ll_cuota_ini					= ll_ctas_pag + 1
					ll_cuota_fin					= (ll_cuota_ini + ii_cantidad) - 1
			
					  SELECT  SUM("VISTA_MANTEN_IVA"."IVA" ) 
					  INTO    :ldb_iva
					  FROM    "VISTA_MANTEN_IVA"  
					  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
								( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
								( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
								( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'E' ) AND
								( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
								( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
					  if ldb_iva > 0 and ll_monto_cuota_reg > 0 then
							ll_iva_f 						= ldb_iva	
							ll_iva_recalc					= round(ll_monto_cuota_reg * (idb_iva - 1),0)
							if ll_iva_recalc <> ll_iva_f and ll_iva_recalc > 0 then
								ll_iva_f					= ll_iva_recalc
							end if
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
							gl_iva_exento_f		= ll_monto_cuota_reg
							ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_ci.deleterow(ll_new_iva)
							end if
					  end if
					  ll_mora_mant			= dw_gastos_ci.getitemnumber(1,'mora_cred')
					  if ll_mora_mant > 0 then
						  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
						  INTO    	:ldb_iva
						  FROM    "VISTA_MANTEN_IVA"  
						  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
									( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
									( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
									( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'G' ) AND
									( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
									( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
						  if ldb_iva > 0 and ll_mora_mant > 0 then
								ll_iva_p 			= ldb_iva
								ll_iva_recalc		= round(ll_mora_mant * (idb_iva - 1),0)
								if ll_iva_recalc <> ll_iva_p and ll_iva_recalc > 0 then
									ll_iva_p		= ll_iva_recalc
								end if
								ll_new_iva		= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
								if ll_new_iva > 0 then
									dw_detalle_ci.scrolltorow(ll_new_iva)
								else
									ll_new_iva	= dw_detalle_ci.insertrow(0)
								end if
								dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
								dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
						  SELECT  SUM("VISTA_MANTEN_IVA"."IVA")  
						  INTO    	:ldb_iva
						  FROM    "VISTA_MANTEN_IVA"  
						  WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
									( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
									( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
									( "VISTA_MANTEN_IVA"."TIPO_MOV" = 'J' ) AND
									( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
									( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin );
						  if ldb_iva > 0 and ll_gasto_mant > 0 then
							
								ll_iva_r 			= ldb_iva
								ll_iva_recalc		= round(ll_gasto_mant * (idb_iva - 1),0)
								if ll_iva_recalc <> ll_iva_r and ll_iva_recalc > 0 then
									ll_iva_r		= ll_iva_recalc
								end if
								ll_new_iva		= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
								if ll_new_iva > 0 then
									dw_detalle_ci.scrolltorow(ll_new_iva)
								else
									ll_new_iva		= dw_detalle_ci.insertrow(0)
								end if
								dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
								dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
					  //Fin script nuevo IVA Autor MM 22/12/2022
				end if
				
				
				ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_cta		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea'),0)
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_monto_cta 		//- ald_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
				this.accepttext()
				ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='S' and (tipo_cob_otro='108' or tipo_cob_otro='131' or tipo_cob_otro='141' or tipo_cob_otro='147' or tipo_cob_otro='154' or tipo_cob_otro='160' or tipo_cob_otro='161')", 1, dw_detalle_ci.rowcount())
				
				if ll_fila_dscto > 0 then
					ald_monto		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'monto'),0)
				end if
				ll_fila_cuota_pie	= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, dw_detalle_ci.rowcount())
				if ll_fila_cuota_pie > 0 then
					ald_monto_cta	= round(dw_detalle_ci.getitemnumber(ll_fila_cuota_pie,'c_total_linea'),0)
				end if
				if (ll_fila_dscto > 0 or ll_fila_cuota_pie > 0) and ald_monto > 0 then	//Descuento Mantencion
					ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, dw_detalle_ci.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_cta		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea'),0)
						ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
						if ll_fila_dscto > 0 then
							ll_monto_final	= ll_monto_cta - ald_monto
							ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
						end if
					end if
				end if
				ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='S' and tipo_cob_otro='102'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ald_monto		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'monto'),0)
				end if
				ald_monto_cta		= round(dw_gastos_ci.getitemnumber(1,'mora_cred'),0)
				if ll_fila_dscto > 0 and ald_monto_cta > 0 then	//Descuento Interes Mantencion
					ll_mora_mant			= round(dw_gastos_ci.getitemnumber(1,'mora_cred'),0)
					if ll_mora_mant > 0 then
						ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='V'", 1, dw_detalle_ci.rowcount())
						if ll_fila_dscto > 0 then
							ll_monto_final	= ll_mora_mant - ald_monto
							ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
						end if
					end if
				end if
				ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='S' and tipo_cob_otro='118'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ald_monto		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'monto'),0)
				end if
				ald_monto_cta		= round(dw_gastos_ci.getitemnumber(1,'gasto_cred'),0)
				if ll_fila_dscto > 0 and ald_monto_cta > 0 then	//Descuento gasto Cobranza Mantencion
					ll_gasto_mant			= round(dw_gastos_ci.getitemnumber(1,'gasto_cred'),0)
					if ll_gasto_mant > 0 then
						ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='X'", 1, dw_detalle_ci.rowcount())
						if ll_fila_dscto > 0 then
							ll_monto_final	= ll_gasto_mant - ald_monto
							ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
						end if
					end if
				end if
			end if
			
			
			
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
				if gs_base='O' or gs_base='C' then
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
	IF ls_tipo_cob = "E" AND this.GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" THEN //is_columna = "cantidad" AND 
		wf_calcular_interes(ls_tipo_cob)
		
		ii_cantidad 		= GetItemNumber(row, "cantidad")
		DECLARE x2 CURSOR FOR  
		SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",   "SEGURO_ASOCIADOS"."MONTO_PRIMA",		"SEGURO_ASOCIADOS"."MONEDA"
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
				fetch x2 into :ll_cod_seguro, :ldb_prima, :ls_moneda_ctto ;
				if not isnull(ll_cod_seguro) then
					ll_fila		= dw_detalle_ci.Find("tipo_cob = '"+string(ll_cod_seguro)+"'",1, dw_detalle_ci.RowCount())
					if ll_fila=0 then
						ll_new_seg		= dw_detalle_ci.insertrow(0)
						dw_detalle_ci.setitem(ll_new_seg,'tipo_cob', string(ll_cod_seguro))
						dw_detalle_ci.setitem(ll_new_seg,'cantidad', ii_cantidad)
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
					else
						dw_detalle_ci.setitem(ll_fila,'cantidad',ii_cantidad)
					end if
				end if
				setnull(ll_cod_seguro)
			loop
		end if
		close x2;
//		DECLARE x2 CURSOR FOR  
//		SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO"  
//		FROM 	"SEGURO_ASOCIADOS"  
//		WHERE ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
//				  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
//				  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
//				  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
//				  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )  AND
//				  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
//		USING	sqlca;
//		open x2;
//		if sqlca.sqlcode=0 then
//			do while sqlca.sqlcode=0
//				fetch x2 into :ll_cod_seguro;
//				if not isnull(ll_cod_seguro) then
//					ll_fila		= dw_detalle_ci.Find("tipo_cob = '"+string(ll_cod_seguro)+"'",1, dw_detalle_ci.RowCount())
//					dw_detalle_ci.setitem(ll_fila,'cantidad',ii_cantidad)
//				end if
//				setnull(ll_cod_seguro)
//			loop
//		end if
//		close x2;
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
		il_fila_uf	= row
		ld_monto		= dw_detalle_ci.getitemnumber(row,'monto_uf')
		if ld_monto > 800 then
			dw_detalle_ci.SetItem(row, "monto", 0)
			dw_detalle_ci.SetItem(row, "monto_uf", 0)
			dw_detalle_ci.accepttext()
			dw_gastos_ci.SetItem(1, "Subtotal",dw_detalle_ci.GetItemNumber(1,"c_subtotal"))
			dw_detalle_ci.setfocus()
			dw_detalle_ci.setcolumn('monto_uf')
			messagebox("Advertencia","Revisar Monto Ingresado, recuerde tiene Seleccionado Opción Ingreso MONTO en U.F.")
		end if
	end if
	wf_calcular_interes('E')
	dw_detalle_ci.accepttext()
	if isnull( dw_gastos_ci.getitemnumber(1,'c_total')) or dw_gastos_ci.getitemnumber(1,'c_total')=0 then
		dw_gastos_ci.SetItem(1,'mora', ROUND(dw_gastos_ci.Getitemnumber(1,'mora_cred') + dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
		dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(dw_gastos_ci.Getitemnumber(1,'gasto_cred') + dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
		ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal"),0)
		dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
	end if
	if isnull(dw_gastos_ci.getitemnumber(1,"incluir_gastos")) then dw_gastos_ci.SetItem(1,"incluir_gastos", 0)
	dw_gastos_ci.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
	dw_gastos_ci.accepttext()
	dw_detalle_ci.accepttext()
	if is_columna='monto' or ls_tipo_cob = "E" AND this.GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" then
		ls_tipo_cob						= dw_detalle_ci.getitemstring(row,'tipo_cob')
		ls_tipo_cob_otro				= dw_detalle_ci.getitemstring(row,'tipo_cob_otro')
		if ls_tipo_cob = 'S' then 
			ll_monto_descuento		= dw_detalle_ci.getitemnumber(row,'monto')
		else
			ll_monto_descuento		= 0
		end if
		if ls_tipo_cob='S' then
			if gs_base='G' or gs_base='F' then
				ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ll_monto_cta		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea'),0)
					ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_final	= ll_monto_cta //- ll_monto_descuento		//- ald_monto
						ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
						dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
					end if
				end if
				this.accepttext()
				ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='S' and (tipo_cob_otro='131' or tipo_cob_otro='141' or tipo_cob_otro='147' or tipo_cob_otro='108' or tipo_cob_otro='131' or tipo_cob_otro='147' or tipo_cob_otro='154')", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ald_monto		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'monto'),0)
				end if
				ll_fila_cuota_pie	= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, dw_detalle_ci.rowcount())
				if ll_fila_cuota_pie > 0 then
					ald_monto_cta	= round(dw_detalle_ci.getitemnumber(ll_fila_cuota_pie,'c_total_linea'),0)
				end if
				if (ll_fila_dscto > 0 or ll_fila_cuota_pie > 0) and ald_monto > 0 then	//Descuento Mantencion
					ll_fila_dscto				= dw_detalle_ci.Find("tipo_cob='E' or tipo_cob='A' or tipo_cob='U' or tipo_cob='Q'", 1, dw_detalle_ci.rowcount())
					if ll_fila_dscto > 0 then
						ll_monto_cta		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'c_total_linea'),0)
						ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='D'", 1, dw_detalle_ci.rowcount())
						if ll_fila_dscto > 0 then
							ll_monto_final	= ll_monto_cta - ald_monto
							ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
						end if
					end if
				end if
				ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='S' and ( tipo_cob_otro='102' ) ", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ald_monto		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'monto'),0)
				end if
				ald_monto_cta		= round(dw_gastos_ci.getitemnumber(1,'mora_cred'),0)
				if ll_fila_dscto > 0 and ald_monto_cta > 0 then	//Descuento Interes Mantencion
					ll_mora_mant			= round(dw_gastos_ci.getitemnumber(1,'mora_cred'),0)
					if ll_mora_mant > 0 then
						ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='V'", 1, dw_detalle_ci.rowcount())
						if ll_fila_dscto > 0 then
							ll_monto_final	= ll_mora_mant - ald_monto
							ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
						end if
					end if
				end if
				ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='S' and tipo_cob_otro='118'", 1, dw_detalle_ci.rowcount())
				if ll_fila_dscto > 0 then
					ald_monto		= round(dw_detalle_ci.getitemnumber(ll_fila_dscto,'monto'),0)
				end if
				ald_monto_cta		= round(dw_gastos_ci.getitemnumber(1,'gasto_cred'),0)
				if ll_fila_dscto > 0 and ald_monto_cta > 0 then	//Descuento gasto Cobranza Mantencion
					ll_gasto_mant			= round(dw_gastos_ci.getitemnumber(1,'gasto_cred'),0)
					if ll_gasto_mant > 0 then
						ll_fila_dscto			= dw_detalle_ci.Find("tipo_cob='X'", 1, dw_detalle_ci.rowcount())
						if ll_fila_dscto > 0 then
							ll_monto_final	= ll_gasto_mant - ald_monto
							ll_iva_recalc		= round(ll_monto_final * (idb_iva - 1),0)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto',ll_iva_recalc)
							dw_detalle_ci.setitem(ll_fila_dscto,'monto_uf', round( ll_iva_recalc / gd_uf,4))
						end if
					end if
				end if
			end if			
		end if
	end if
end if
w_repacta_funeraria.dw_detalle_ci.accepttext()
w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"))
w_repacta_funeraria.dw_gastos_ci.accepttext()
end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

event itemfocuschanged;Double	ld_monto

//if il_fila_uf > 0 then
//	if dw_detalle_ci.getitemstring(il_fila_uf,'moneda')='U' THEN
//		ld_monto		= dw_detalle_ci.getitemnumber(il_fila_uf,'monto_uf')
//		if ld_monto > 1500 then
//			dw_detalle_ci.SetItem(il_fila_uf, "monto", 0)
//			dw_detalle_ci.SetItem(il_fila_uf, "monto_uf", 0)
//			dw_detalle_ci.accepttext()
//		end if
//	end if
//end if

end event

event losefocus;//Double	ld_monto
//
//if il_fila_uf > 0 then
//	if dw_detalle_ci.getitemstring(il_fila_uf,'moneda')='U' THEN
//		ld_monto		= dw_detalle_ci.getitemnumber(il_fila_uf,'monto_uf')
//		if ld_monto > 1500 then
//			dw_detalle_ci.SetItem(il_fila_uf, "monto", 0)
//			dw_detalle_ci.SetItem(il_fila_uf, "monto_uf", 0)
//			dw_detalle_ci.accepttext()
//		end if
//	end if
//end if
w_repacta_funeraria.dw_detalle_ci.accepttext()
w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"))
w_repacta_funeraria.dw_gastos_ci.accepttext()
end event

type dw_datos_ci from datawindow within w_repacta_funeraria
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 784
integer width = 1143
integer height = 1036
integer taborder = 20
string dataobject = "d_datos_cuenta_ci_funeraria"
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

type cb_ci_insertar from commandbutton within w_repacta_funeraria
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1202
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

event clicked;long 		fila,ll_sw_pasa,ii_dmora, ii_mora_cobro,ii_inc_gastos,ll_indi,ll_cantidad,ll_tot_reg,ll_fila,ll_count_reg,ll_count_otro,ll_res,ll_sum_reg,ll_new_reg,ll_plazo,ll_ctas_pagadas,ll_cod_servicio,ll_count_fe,&
			ll_count_crem,ll_sw_pago_reg,ll_new_seg,ll_fila_e,ll_ctas_pag_m,ll_cantidad_cta,ll_cuota_ini,ll_cuota_fin,ll_new_iva,ll_fila_cred
double 	id_im, id_gc, id_valor_cuota,ll_monto,ll_valor_serv,ldb_valor_cuota,ldb_valor_cuota_peso,ll_valor_dscto_comer,ll_total_monto,ldb_uf,ll_cod_seguro, ldb_prima,&
			ll_monto_cuota_reg,ldb_iva,ll_iva_f,ll_mora_mant,ll_iva_p,ll_gasto_mant,ll_iva_r,ldb_valor,ll_calcular_iva
String		ls_tipo_cob,ls_moneda,ls_moneda_ctto,ls_string,ls_codigo_otro_cur,ls_tipo_mov,ls_tipo_l,ls_tipo_s,ls_cod_dscto_comer,ls_tipo_cob_serv,ls_tipo_servicio,&
			ls_moneda_insert,ls_descrip
			
ll_tot_reg		= dw_detalle_ci.rowcount()
ll_sw_pasa		= 0
ls_tipo_mov		= 'L'
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
		ll_indi				= ll_tot_reg
		ll_sw_pasa		= 1
	end if
next
IF ll_sw_pasa=0 THEN
	gl_n_cuotas_pag 	= 0
	fila 					= dw_detalle_ci.InsertRow(0)
	dw_detalle_ci.scrolltorow(fila)
	dw_detalle_ci.SetItem(fila, "folio", 0)
	if dw_detalle_ci.dataobject<>'de_detalle_ci_repacta' then 
		dw_detalle_ci.SetItem(fila, "moneda",'P')
		dw_detalle_ci.SetItem(fila,'uf', gd_uf)
	else
		dw_detalle_ci.SetItem(fila, "moneda",'U')
		dw_detalle_ci.SetItem(fila,'uf', gd_uf)
	end if
	IF fila = 1 and dw_datos_ci.rowcount() > 0 THEN
	  	IF gs_rezago <> "S" THEN	
			dw_gastos_ci.InsertRow(0)
			cb_ci_insertar.Enabled			= TRUE
			cb_ci_borrar_item.Enabled 		= true
			wf_calcular_interes(ls_tipo_cob)
		ELSE
			id_valor_cuota 		= 0
			ii_dmora 			= 0
			id_gc 					= 0
			id_im 					= 0
			ii_mora_cobro 		= 0
			ii_inc_gastos 		= 0
			dw_gastos_ci.InsertRow(0)
			cb_ci_borrar_item.Enabled 	= true
		END IF
		cbx_sin_mora.Visible 				= true
//		cbx_sin_mora.Checked 			= false
		cbx_sin_gc.Visible 					= true
//		cbx_sin_gc.Checked 				= false
		if gs_base='F' or gs_base='G' or gs_base='V' then
			ls_moneda_ctto						= dw_datos_ci.getitemstring(1,'producto_pago_moneda')
			ll_plazo									= dw_datos_ci.getitemnumber(1,'producto_pago_plazo')
			ldb_valor_cuota						= dw_datos_ci.getitemnumber(1,'producto_pago_valor_cuota')
			ldb_valor_cuota_peso					= dw_datos_ci.getitemnumber(1,'c_valor_cuota_pesos')
			ll_ctas_pagadas						= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
			ll_cod_servicio							= dw_datos_ci.getitemnumber(1,'producto_pago_codigo_servicio')
			ls_string									= "cod_servicio > 0"
			ll_fila										= dw_detalle_ci.Find(ls_string, 1, dw_detalle_ci.RowCount())
			
			if ll_fila = 0 then
				SELECT 	COUNT("VISTA_CONTRATO_FUNERARIA"."CODIGO_OTRO")
				INTO		:ll_count_reg
				FROM 	"VISTA_CONTRATO_FUNERARIA"  
				WHERE 	( "VISTA_CONTRATO_FUNERARIA"."BASE" = :gs_base ) AND  
							( "VISTA_CONTRATO_FUNERARIA"."SERIE" = :gs_serie ) AND  
							( "VISTA_CONTRATO_FUNERARIA"."NUMERO" = :gi_numero ) ;
				if ll_count_reg > 0 then
					SELECT 	Count("INGRESO"."TIPO_COB")
					INTO 		:ll_count_otro  
					FROM 	"INGRESO"  
					WHERE 	("INGRESO"."BASE" = :gs_base AND  "INGRESO"."SERIE" = :gs_serie AND  "INGRESO"."CONTRATO" = :gi_numero AND  "INGRESO"."PAGO_HIST" = 'A' AND "INGRESO"."CODIGO_SERVICIO" > 0 AND ("INGRESO"."TIPO_COB" = 'FA' or "INGRESO"."TIPO_COB" = 'CU') ) ;
					
					ll_count_otro = 0		 //Eliminar para produccion
					if ll_count_otro = 0 then
						if gs_base='F' and ( gs_serie='F' or gs_serie='I' ) then
							if ldb_valor_cuota_peso = 1 then
								gs_tipo_cobro					= 'BE'
							else
								if ll_plazo > 1 then
									gs_tipo_cobro				= 'BA'
								else
									gs_tipo_cobro				= 'FA'
								end if
							end if
							ll_res		= messagebox("Advertencia","Desea Asignar Detalle Pago - Servicio Funerario",Exclamation!,YesNo!)
						elseif gs_base='F' and ( gs_serie='C' or gs_serie='E' ) then
							if ldb_valor_cuota_peso = 1 then
								gs_tipo_cobro					= 'BE'
							else
								if ll_plazo > 1 then
									gs_tipo_cobro				= 'BA'
								else
									gs_tipo_cobro				= 'FA'
								end if
							end if
							ll_res		= messagebox("Advertencia","Desea Asignar Detalle Pago - Servicio Crematorio",Exclamation!,YesNo!)
						elseif gs_base='G' and (gs_serie='I' OR gs_serie='E' or gs_serie='N' or gs_serie='X' ) then
							if ldb_valor_cuota_peso = 1 then
								gs_tipo_cobro					= 'BE'
							else
//								if ll_plazo > 1 then
									gs_tipo_cobro				= 'BA'
//								else
//									gs_tipo_cobro				= 'FA'
//								end if
							end if
							idw_detalle12.retrieve(gs_tipo_cobro)
							ll_res				= messagebox("Advertencia","Desea Asignar Detalle Pago - Servicio Crematorio",Exclamation!,YesNo!)
						elseif gs_base='V' then
							gs_tipo_cobro					= 'BA'
							idw_detalle12.retrieve(gs_tipo_cobro)
							ll_res				= messagebox("Advertencia","Desea Asignar Detalle Pago - Contrato de Servicio",Exclamation!,YesNo!)
						end if
						if ll_res=1 then
							ll_sum_reg		= 1
							SELECT 	count("INGRESO"."TIPO_COB")  
							INTO 		:ll_count_fe  
							FROM 	"INGRESO"  
							WHERE 	( "INGRESO"."BASE" = :gs_base ) AND  
										( "INGRESO"."SERIE" = :gs_serie ) AND  
										( "INGRESO"."CONTRATO" = :gi_numero ) AND  
										( "INGRESO"."PAGO_HIST" = 'A' ) AND  
										( "INGRESO"."TIPO_COB" = :gs_tipo_cobro or "INGRESO"."TIPO_COB" = 'CU')   ;
							if isnull( ll_count_fe ) then  ll_count_fe=0
							if ll_count_fe = 0 then
								if gs_base='G' and (gs_serie='I' OR gs_serie='E' or gs_serie='N' or gs_serie='X') then
									if ldb_valor_cuota_peso = 1 then
										gs_tipo_cobro					= 'BE'
									else
//										if ll_plazo > 1 then
											gs_tipo_cobro				= 'BA'
//										else
//											gs_tipo_cobro				= 'FA'
//										end if
									end if
									idw_detalle12.retrieve(gs_tipo_cobro)
								end if
							else
								if gs_base='G' and (gs_serie='I' OR gs_serie='E' or gs_serie='N' or gs_serie='X') then
									//gs_tipo_cobro					= 'FA'		//'BA'
									if ldb_valor_cuota_peso = 1 then
										gs_tipo_cobro					= 'BE'
									else
//										if ll_plazo > 1 then
											gs_tipo_cobro				= 'BA'
//										else
//											gs_tipo_cobro				= 'FA'
//										end if
									end if
									idw_detalle12.retrieve(gs_tipo_cobro)
								end if
							end if
							//SELECT DISTINCT	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS",  	"PRODUCTO_VENTA_ASOCIADA"."VALOR_PRODUCTO"  
							
							DECLARE cur_detalle_f CURSOR FOR  
							SELECT 	'E' as TIPO_COB_L,"VISTA_CONTRATO_FUNERARIA"."CODIGO_OTRO",  	"VISTA_CONTRATO_FUNERARIA"."VALOR_PRODUCTO",	'S' as TIPO_COB_S,"VISTA_CONTRATO_FUNERARIA"."CODIGO_DESCTO_COMER" ,	"VISTA_CONTRATO_FUNERARIA"."DESCTO_COMER" ,	"VISTA_CONTRATO_FUNERARIA"."TIPO_COB",		"VISTA_CONTRATO_FUNERARIA"."COD_SERVICIO",		"VISTA_CONTRATO_FUNERARIA"."TIPO_SERVICIO"
							FROM 	"VISTA_CONTRATO_FUNERARIA"  
							WHERE 	( "VISTA_CONTRATO_FUNERARIA"."BASE" = :gs_base ) AND  
										( "VISTA_CONTRATO_FUNERARIA"."SERIE" = :gs_serie ) AND  
										( "VISTA_CONTRATO_FUNERARIA"."NUMERO" = :gi_numero ) 
							ORDER BY TIPO_COB_L ASC,
										"VISTA_CONTRATO_FUNERARIA"."VALOR_PRODUCTO" DESC,
										"VISTA_CONTRATO_FUNERARIA"."CODIGO_OTRO" ASC
							USING	sqlca;
							open cur_detalle_f;
							ll_fila				= dw_detalle_ci.getrow()
							dw_detalle_ci.scrolltorow(ll_fila)
							if sqlca.sqlcode = 0 then
								if ll_plazo <= 1 and ll_ctas_pagadas = 0 then
									DO WHILE sqlca.sqlcode = 0
										fetch cur_detalle_f into :ls_tipo_l, :ls_codigo_otro_cur, :ll_valor_serv, :ls_tipo_s,  :ls_cod_dscto_comer, :ll_valor_dscto_comer, :ls_tipo_cob_serv, :ll_cod_servicio, :ls_tipo_servicio ;
										if not isnull(ls_codigo_otro_cur) and ls_tipo_cob_serv = gs_tipo_cobro then
											SELECT 	Count("INGRESO"."TIPO_COB" ) 
											INTO 		:ll_count_crem  
											FROM 	"INGRESO"  
											WHERE 	( "INGRESO"."CODIGO_OTRO" = :ls_codigo_otro_cur ) AND  
														( "INGRESO"."BASE" = :gs_base ) AND  
														( "INGRESO"."SERIE" = :gs_serie ) AND  
														( "INGRESO"."CONTRATO" = :gi_numero ) 
											USING	Trans_1;
											ll_count_crem = 0  //Eliminar para produccion
											if ll_count_crem = 0 then
												if ls_tipo_servicio='A' then
													ll_cod_servicio		= 0
													ls_tipo_l				= 'L'
													SELECT DISTINCT	"CUENTA_CONTABLE_OTROS"."DESCRIPCION",	"CUENTA_CONTABLE_OTROS"."VALOR"
													INTO 		:ls_descrip  ,															:ldb_valor
													FROM 	"CUENTA_CONTABLE_OTROS"  
													WHERE 	( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_codigo_otro_cur ) AND  
																( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob_serv )  
													USING	Trans_1;
													if Trans_1.sqlcode=0 then
														messagebox("Advertencia","Recuerde que debe Eliminar Pagos Adicionales y Generar Otra "+ls_tipo_cob_serv+" para Servicios "+ls_codigo_otro_cur+' - '+ls_descrip+ " Valor $ "+string(ldb_valor))
													end if
												end if
												dw_detalle_ci.setitem(ll_fila,'tipo_cob',ls_tipo_l)
												dw_detalle_ci.setitem(ll_fila,'cod_servicio',ll_cod_servicio)
												dw_detalle_ci.setitem(ll_fila,'cantidad',1)
												dw_detalle_ci.accepttext()
												dw_detalle_ci.setitem(ll_fila,'tipo_cob_otro',ls_codigo_otro_cur)
												dw_detalle_ci.accepttext()
												if ls_moneda_ctto = '2' then
													if ll_valor_serv > 500 then
														dw_detalle_ci.setitem(ll_fila,'moneda','P')
														dw_detalle_ci.setitem(ll_fila,'monto',ll_valor_serv)
														dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ll_valor_serv / gd_uf,2))
													else
														dw_detalle_ci.setitem(ll_fila,'moneda','U')
														dw_detalle_ci.setitem(ll_fila,'monto_uf',ll_valor_serv)
														dw_detalle_ci.setitem(ll_fila,'monto', round( ll_valor_serv * gd_uf,0))
													end if
												elseif ls_moneda_ctto = '1' then
													dw_detalle_ci.setitem(ll_fila,'moneda','P')
													dw_detalle_ci.setitem(ll_fila,'monto',ll_valor_serv)
													dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ll_valor_serv / gd_uf,2))
												end if
												dw_detalle_ci.accepttext()
												if ll_valor_dscto_comer > 0 then
													ll_fila 							= dw_detalle_ci.InsertRow(0)
													dw_detalle_ci.scrolltorow(ll_fila)
													dw_detalle_ci.SetItem(ll_fila, "uf", gd_uf)
													dw_detalle_ci.SetItem(ll_fila, "folio", 0)
													dw_detalle_ci.SetItem(ll_fila, "estado", 'N')
													dw_detalle_ci.SetItem(ll_fila, 'base',gs_base)
													dw_detalle_ci.SetItem(ll_fila, 'serie',gs_serie)
													dw_detalle_ci.SetItem(ll_fila, 'numero',gi_numero)
													if ls_moneda_ctto='2' then
														dw_detalle_ci.SetItem(ll_fila, "moneda",'U')
													else
														dw_detalle_ci.SetItem(ll_fila, "moneda",'P')
													end if
													dw_detalle_ci.setitem(ll_fila,'tipo_cob','S')
													dw_detalle_ci.setitem(ll_fila,'cantidad',1)
													dw_detalle_ci.accepttext()
													dw_detalle_ci.setitem(ll_fila,'tipo_cob_otro',ls_cod_dscto_comer)
													dw_detalle_ci.accepttext()
													if ls_moneda_ctto = '2' then
														dw_detalle_ci.setitem(ll_fila,'moneda','U')
														dw_detalle_ci.setitem(ll_fila,'monto_uf',ll_valor_dscto_comer )
														dw_detalle_ci.setitem(ll_fila,'monto', round( ll_valor_dscto_comer * gd_uf,0) )
													elseif ls_moneda_ctto = '1' then
														dw_detalle_ci.setitem(ll_fila,'moneda','P')
														dw_detalle_ci.setitem(ll_fila,'monto',ll_valor_dscto_comer)
														dw_detalle_ci.setitem(ll_fila,'monto_uf', round( ll_valor_dscto_comer / gd_uf,2) )
													end if
												end if
											
												ll_sum_reg ++
												if ll_sum_reg <= ll_count_reg and not isnull(ls_codigo_otro_cur) then
													ll_fila	= dw_detalle_ci.insertrow(0)
													idw_detalle.retrieve(gs_tipo_cobro)
													idw_detalle12.retrieve(gs_tipo_cobro)
													dw_detalle_ci.scrolltorow(ll_fila)
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
											else
												if ll_sw_pago_reg=0 then
													messagebox("Advertencia","Pago Ya Registrado")
													ll_sw_pago_reg++
												end if
											end if
										end if
										Setnull(ls_codigo_otro_cur)
									LOOP
									
								elseif ll_plazo > 1 and ldb_valor_cuota > 0 and ll_ctas_pagadas < ll_plazo then
									dw_detalle_ci.setitem(ll_fila,'tipo_cob','E')
									
									dw_detalle_ci.setitem(ll_fila,'cantidad',1)
									dw_detalle_ci.accepttext()
									dw_detalle_ci.setitem(ll_fila,'tipo_cob_otro',ls_codigo_otro_cur)
									dw_detalle_ci.setitem(ll_fila,'cod_servicio',ll_cod_servicio)
									dw_detalle_ci.accepttext()
									if ls_moneda_ctto = '2' then
										if ll_valor_serv > 500 then
											dw_detalle_ci.setitem(ll_fila,'moneda','P')
											dw_detalle_ci.setitem(ll_fila,'monto',ldb_valor_cuota_peso)
											dw_detalle_ci.setitem(ll_fila,'monto_uf', ldb_valor_cuota)		//round( ldb_valor_cuota_peso / gd_uf,2))
										else
											dw_detalle_ci.setitem(ll_fila,'moneda','U')
											dw_detalle_ci.setitem(ll_fila,'monto_uf',ldb_valor_cuota )		//ll_valor_serv)
											dw_detalle_ci.setitem(ll_fila,'monto', ldb_valor_cuota_peso)	//round( ll_valor_serv * gd_uf,0))
										end if
									elseif ls_moneda_ctto = '1' then
										dw_detalle_ci.setitem(ll_fila,'moneda','P')
										dw_detalle_ci.setitem(ll_fila,'monto', ldb_valor_cuota_peso)	//ll_valor_serv)
										dw_detalle_ci.setitem(ll_fila,'monto_uf', ldb_valor_cuota)		//round( ll_valor_serv / gd_uf,2))
									end if
								end if
								ldb_uf									= gd_uf
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
										if not isnull(ll_cod_seguro) and ll_cod_seguro>0  then
											ll_new_seg		= dw_detalle_ci.insertrow(0)
											dw_detalle_ci.setitem(ll_new_seg,'tipo_cob', string(ll_cod_seguro))
											dw_detalle_ci.setitem(ll_new_seg,'cod_servicio',ll_cod_servicio)
											dw_detalle_ci.setitem(ll_new_seg,'cantidad', 1)
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
										setnull(ll_cod_seguro)
									loop
								end if
								close x1;
								dw_detalle_ci.accepttext()
							end if
							close cur_detalle_f;
							wf_calcular_interes('E')
							dw_detalle_ci.accepttext()
							if isnull( dw_gastos_ci.getitemnumber(1,'c_total')) or dw_gastos_ci.getitemnumber(1,'c_total')=0 then
								dw_gastos_ci.SetItem(1,'mora', ROUND(dw_gastos_ci.Getitemnumber(1,'mora_cred') + dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
								dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(dw_gastos_ci.Getitemnumber(1,'gasto_cred') + dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
//								ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"),0)

								ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal"),0)

								dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
							end if
							w_repacta_funeraria.dw_detalle_ci.accepttext()
							w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"))
							w_repacta_funeraria.dw_gastos_ci.accepttext()
							dw_gastos_ci.accepttext()
							if gs_base='G' or gs_base='F' then
								//Script nuevo IVA Autor MM 22/12/2022
								if gs_tipo_cobro = 'BA' or gs_tipo_cobro = 'FA' then
									ll_fila_e							= dw_detalle_ci.find("tipo_cob = 'E' ",1,dw_detalle_ci.rowcount())
									if ll_fila_e > 0 then
										ll_ctas_pag_m				= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
										ll_monto_cuota_reg		= dw_detalle_ci.getitemnumber(ll_fila_e,'c_total_linea')
										ll_cantidad_cta				= dw_detalle_ci.GetItemNumber(ll_fila_e, "cantidad")
										if isnull(ll_cantidad_cta) or ll_cantidad_cta = 0 then ll_cantidad_cta=1
										ll_cuota_ini					= ll_ctas_pag_m + 1
										ll_cuota_fin					= (ll_cuota_ini + ll_cantidad_cta) - 1
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
												if gs_base='G' then
													gs_tipo_cobro_aux		= 'BE'
												elseif gs_base='F' then
													gs_tipo_cobro_aux		= 'BA'
												end if
												
												ll_calcular_iva				= round(ll_monto_cuota_reg * (idb_iva - 1),0)
				
												ll_iva_f 						= ldb_iva	
												if ll_calcular_iva <> ll_iva_f then 
													ll_iva_f					= ll_calcular_iva
													ldb_iva					= ll_calcular_iva
												end if
												ll_iva_f 						= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
												ll_new_iva					= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
												if ll_new_iva > 0 then
													if ldb_iva > 0 then
														dw_detalle_ci.scrolltorow(ll_new_iva)
													else
														dw_detalle_ci.deleterow(ll_new_iva)
													end if
												else
													ll_new_iva			= dw_detalle_ci.insertrow(0)
												end if
												dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'D')
												dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
												dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
												gl_iva_exento_f		= ll_monto_cuota_reg
												ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
												if ll_new_iva > 0 then
													dw_detalle_ci.deleterow(ll_new_iva)
												end if
										  end if
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
													if gs_base='G' then
														gs_tipo_cobro_aux		= 'BE'
													elseif gs_base='F' then
														gs_tipo_cobro_aux		= 'BA'
													end if
													ll_iva_p 						= round(ll_mora_mant * (idb_iva - 1),0)
													ll_new_iva					= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
													if ll_new_iva > 0 then
														dw_detalle_ci.scrolltorow(ll_new_iva)
													else
														ll_new_iva				= dw_detalle_ci.insertrow(0)
													end if
													dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
													dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
													dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
													if gs_base='G' then
														gs_tipo_cobro_aux		= 'BE'
													elseif gs_base='F' then
														gs_tipo_cobro_aux		= 'BA'
													end if
													ll_iva_r 						= round(ll_gasto_mant * (idb_iva - 1),0)
													ll_new_iva					= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
													if ll_new_iva > 0 then
														dw_detalle_ci.scrolltorow(ll_new_iva)
													else
														ll_new_iva				= dw_detalle_ci.insertrow(0)
													end if
													dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
													dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
													dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
								end if
								//Fin script nuevo IVA Autor MM 22/12/2022
								//ls_string		= "isnull(tipo_cob_otro) "
								ls_string			= "isnull(cod_servicio) "
								ll_fila				= dw_detalle_ci.Find(ls_string, 1, dw_detalle_ci.RowCount())
								if ll_fila > 0 then
									dw_detalle_ci.deleterow(ll_fila)
								end if
							end if
							wf_calcular_interes('E')
							dw_detalle_ci.accepttext()
							if isnull( dw_gastos_ci.getitemnumber(1,'c_total')) or dw_gastos_ci.getitemnumber(1,'c_total')=0 then
								dw_gastos_ci.SetItem(1,'mora', ROUND(dw_gastos_ci.Getitemnumber(1,'mora_cred') + dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
								dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(dw_gastos_ci.Getitemnumber(1,'gasto_cred') + dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
//								ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"),0)

								ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal"),0)

								dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
							end if
							w_repacta_funeraria.dw_detalle_ci.accepttext()
							w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"))
							w_repacta_funeraria.dw_gastos_ci.accepttext()
							dw_gastos_ci.accepttext()
						end if
						
					else
						messagebox("Advertencia","Pago Ya Registrado")
//							dw_detalle_be.reset()
					end if
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

type cb_ci_borrar_item from commandbutton within w_repacta_funeraria
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 1545
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

event clicked;Long		ll_fila_e,ll_ctas_pag_m,ll_cantidad_cta,ll_cuota_ini,ll_cuota_fin,ll_new_iva,ll_cod_servicio,ll_mora_mant,ll_gasto_mant,ll_fila,ll_total_monto
Double	ll_monto_cuota_reg,ldb_iva,ll_calcular_iva,ll_iva_f,ll_iva_p,ll_iva_r
String		ls_moneda_insert,ls_string,ls_tipo_cob

IF dw_detalle_ci.RowCount() > 0 Then
	dw_detalle_ci.DeleteRow(dw_detalle_ci.GetRow())
	if dw_detalle_ci.rowcount()=0 then
		cb_ci_borrar_item.Enabled	= FALSE
		dw_gastos_ci.SetItem(1,"gastos_cob", 0)
		dw_gastos_ci.SetItem(1,"mora", 0)
		dw_gastos_ci.SetItem(1,"subtotal", 0)	
		il_monto_mora					= 0
		il_monto_gc						= 0
	end if
	if gs_base='G' then
		//Script nuevo IVA Autor MM 22/12/2022
		if gs_tipo_cobro = 'BA' or gs_tipo_cobro = 'FA' then
			ll_fila_e							= dw_detalle_ci.find("tipo_cob = 'E' or tipo_cob = 'A'",1,dw_detalle_ci.rowcount())
			if ll_fila_e > 0 then
				ls_tipo_cob					= dw_detalle_ci.getitemstring(ll_fila_e,'tipo_cob')
				ll_cod_servicio				= dw_datos_ci.getitemnumber(1,'producto_pago_codigo_servicio')
				ll_ctas_pag_m				= dw_datos_ci.getitemnumber(1,'producto_anexo_cuotas_pag')
				ll_monto_cuota_reg		= round(dw_detalle_ci.getitemnumber(ll_fila_e,'c_total_linea'),0)
				ll_cantidad_cta				= dw_detalle_ci.GetItemNumber(ll_fila_e, "cantidad")
				if isnull(ll_cantidad_cta) or ll_cantidad_cta = 0 then ll_cantidad_cta=1
				ll_cuota_ini					= ll_ctas_pag_m + 1
				ll_cuota_fin					= (ll_cuota_ini + ll_cantidad_cta) - 1
				SELECT SUM( "VISTA_MANTEN_IVA"."IVA"  )
				INTO    :ldb_iva
				FROM    "VISTA_MANTEN_IVA"  
				WHERE ( "VISTA_MANTEN_IVA"."BASE" = :gs_base ) AND  
						  ( "VISTA_MANTEN_IVA"."SERIE" = :gs_serie ) AND  
						  ( "VISTA_MANTEN_IVA"."NUMERO" = :gi_numero ) AND
						  ( "VISTA_MANTEN_IVA"."TIPO_MOV" = :ls_tipo_cob ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" >= :ll_cuota_ini ) AND
						  ( "VISTA_MANTEN_IVA"."NRO_CUOTA" <= :ll_cuota_fin ) ;
					if ldb_iva > 0 and ll_monto_cuota_reg > 0 then
						gs_tipo_cobro_aux		= 'BE'
						
						ll_calcular_iva			= round(ll_monto_cuota_reg * (idb_iva - 1),0)

						ll_iva_f 					= ldb_iva	
						if ll_calcular_iva <> ll_iva_f then 
							ll_iva_f				= ll_calcular_iva
							ldb_iva				= ll_calcular_iva
						end if
						ll_iva_f 					= ldb_iva		//round(ll_monto_cuota_reg * (idb_iva - 1),0)
						ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
						if ll_new_iva > 0 then
							if ldb_iva > 0 then
								dw_detalle_ci.scrolltorow(ll_new_iva)
							else
								dw_detalle_ci.deleterow(ll_new_iva)
							end if
						else
							ll_new_iva			= dw_detalle_ci.insertrow(0)
						end if
						dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'D')
						dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
						dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
						gl_iva_exento_f		= ll_monto_cuota_reg
						ll_new_iva			= dw_detalle_ci.Find("tipo_cob = 'D'", 1, dw_detalle_ci.rowcount())
						if ll_new_iva > 0 then
							dw_detalle_ci.deleterow(ll_new_iva)
						end if
				  end if
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
							gs_tipo_cobro_aux		= 'BE'
							ll_iva_p 					= round(ll_mora_mant * (idb_iva - 1),0)
							ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'V'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_ci.scrolltorow(ll_new_iva)
							else
								ll_new_iva			= dw_detalle_ci.insertrow(0)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'V')
							dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
							dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
							gs_tipo_cobro_aux		= 'BE'
							ll_iva_r 					= round(ll_gasto_mant * (idb_iva - 1),0)
							ll_new_iva				= dw_detalle_ci.Find("tipo_cob = 'X'", 1, dw_detalle_ci.rowcount())
							if ll_new_iva > 0 then
								dw_detalle_ci.scrolltorow(ll_new_iva)
							else
								ll_new_iva			= dw_detalle_ci.insertrow(0)
							end if
							dw_detalle_ci.setitem(ll_new_iva,'tipo_cob', 'X')
							dw_detalle_ci.setitem(ll_new_iva,'cod_servicio',ll_cod_servicio)
							dw_detalle_ci.SetItem(ll_new_iva, "iva", idb_iva)
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
		end if
		//Fin script nuevo IVA Autor MM 22/12/2022
		//ls_string		= "isnull(tipo_cob_otro) "
		ls_string			= "isnull(cod_servicio) "
		ll_fila				= dw_detalle_ci.Find(ls_string, 1, dw_detalle_ci.RowCount())
		if ll_fila > 0 then
			dw_detalle_ci.deleterow(ll_fila)
		end if
	end if
	wf_calcular_interes('E')
	dw_detalle_ci.accepttext()
	if isnull( dw_gastos_ci.getitemnumber(1,'c_total')) or dw_gastos_ci.getitemnumber(1,'c_total')=0 then
		dw_gastos_ci.SetItem(1,'mora', ROUND(dw_gastos_ci.Getitemnumber(1,'mora_cred') + dw_gastos_ci.Getitemnumber(1,'mora_mant'),0))
		dw_gastos_ci.SetItem(1,'gastos_cob',ROUND(dw_gastos_ci.Getitemnumber(1,'gasto_cred') + dw_gastos_ci.Getitemnumber(1,'gasto_mant'),0))
//								ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"),0)

		ll_total_monto					= ROUND(dw_detalle_ci.GetItemNumber(1,"c_subtotal"),0)

		dw_gastos_ci.SetItem(1,"Subtotal", ll_total_monto)
	end if
	w_repacta_funeraria.dw_detalle_ci.accepttext()
	w_repacta_funeraria.dw_gastos_ci.SetItem(1,"Subtotal", w_repacta_funeraria.dw_detalle_ci.GetItemNumber(1,"c_subtotal_total"))
	w_repacta_funeraria.dw_gastos_ci.accepttext()
	dw_gastos_ci.accepttext()
else
	cb_ci_borrar_item.Enabled		= FALSE
	il_fila_uf								= 0
END IF

end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type cb_ci_borrar from commandbutton within w_repacta_funeraria
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
integer x = 2542
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

event clicked;cbx_sin_mora.Visible 				= false
cbx_sin_mora.Checked 			= false
cbx_sin_gc.Visible 					= false
cbx_sin_gc.Checked 				= false
dw_detalle_ci.Reset()
dw_gastos_ci.Reset()
dw_dias_mora.Reset()
dw_ci_buscar_cliente.AcceptText()
il_suma_dia							= 0
il_fila_uf								= 0

end event

event ue_mousemove;st_help_descuento.visible	= false
if il_abono > 0 then
	st_help_abono.visible	= true
else
	st_help_abono.visible	= false
end if
end event

type dw_encabezado_ingreso_cupon from datawindow within w_repacta_funeraria
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
	st_help_abono.visible		= true
else
	st_help_abono.visible		= false
end if
end event

type dw_abono from datawindow within w_repacta_funeraria
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

type dw_ci_buscar_cliente from datawindow within w_repacta_funeraria
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

event itemchanged;string		is_base, is_serie,ls_dv
long 		il_nenc, il_ndat, il_rut
integer 	li_opcion
Double	il_numero

gs_tipo_cobro = "CI"
//gs_base = ""
//gs_serie = ""
//gi_numero = 0
gs_filtro = "cadena_codigo = 'O' OR cadena_codigo = 'L' OR cadena_codigo = 'P' OR cadena_codigo = 'D' OR cadena_codigo = 'R' OR cadena_codigo = 'F' OR cadena_codigo = 'G' or cadena_codigo='V' "
dw_ci_buscar_cliente.AcceptText()
il_rut 		= gi_rut		//long(dw_ci_buscar_cliente.GetItemString(1,"rl_rut"))
dw_ci_buscar_cliente.setitem(1,'dv',f_valida_rut(string(il_rut)))
IF il_rut = 0 THEN
	IF dw_ci_buscar_cliente.GetItemString(1,"rn_contrato") = "" THEN
		gi_tipo_busqueda = 2
		gs_apellido_paterno = dw_ci_buscar_cliente.GetItemString(1,"rs_a_paterno")
	ELSE 
		gi_numero = Double(dw_ci_buscar_cliente.GetItemString(1,"rn_contrato"))
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
		CASE "O","U","M"
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
		CASE "F", "G", "V"
			dw_datos_ci.DataObject 	= 'd_datos_cuenta_ci_funeraria'
	END CHOOSE
	dw_datos_ci.SetTransObject(SQLCA)
	il_ndat = dw_datos_ci.Retrieve(gs_serie,gi_numero,gs_base)
	IF  il_nenc > 0 THEN
		dw_ci_buscar_cliente.SetItem(1,"rs_a_paterno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno"))
		dw_ci_buscar_cliente.SetItem(1,"rs_a_materno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno"))
		dw_ci_buscar_cliente.SetItem(1,"rs_nombre", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre"))
		dw_ci_buscar_cliente.SetItem(1,"rn_contrato",String(gi_numero)) 
		dw_ci_buscar_cliente.SetItem(1,"rl_rut",String(dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")))
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
			gs_base 		= "O"
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
if gs_base = 'O' or gs_base = 'D' or gs_base='F' or gs_base='G' or gs_base='V' then 
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

type st_help_descuento from statictext within w_repacta_funeraria
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 1266
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

type st_help_abono from statictext within w_repacta_funeraria
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

