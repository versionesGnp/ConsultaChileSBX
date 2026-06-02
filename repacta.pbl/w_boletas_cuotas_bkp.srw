forward
global type w_boletas_cuotas_bkp from window
end type
type dw_dias_mora from datawindow within w_boletas_cuotas_bkp
end type
type cb_imprimir_detalle from commandbutton within w_boletas_cuotas_bkp
end type
type cb_repactar from commandbutton within w_boletas_cuotas_bkp
end type
type cb_cerrar from commandbutton within w_boletas_cuotas_bkp
end type
type cb_ver_cuenta from commandbutton within w_boletas_cuotas_bkp
end type
type dw_gastos_bl from datawindow within w_boletas_cuotas_bkp
end type
type dw_detalle_bl from datawindow within w_boletas_cuotas_bkp
end type
type dw_datos_bl from datawindow within w_boletas_cuotas_bkp
end type
type cb_bl_insertar from commandbutton within w_boletas_cuotas_bkp
end type
type cb_bl_borrar_item from commandbutton within w_boletas_cuotas_bkp
end type
type cb_bl_borrar from commandbutton within w_boletas_cuotas_bkp
end type
type dw_bl_buscar_cliente from datawindow within w_boletas_cuotas_bkp
end type
type st_n_caja from statictext within w_boletas_cuotas_bkp
end type
type st_5 from statictext within w_boletas_cuotas_bkp
end type
type st_uf from statictext within w_boletas_cuotas_bkp
end type
type st_4 from statictext within w_boletas_cuotas_bkp
end type
type st_fecha from statictext within w_boletas_cuotas_bkp
end type
type st_3 from statictext within w_boletas_cuotas_bkp
end type
type dw_encabezado_ingreso_cupon from datawindow within w_boletas_cuotas_bkp
end type
end forward

global type w_boletas_cuotas_bkp from window
integer x = 5
integer y = 4
integer width = 2830
integer height = 1836
boolean titlebar = true
string title = "Calculo Mantenciones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_dias_mora dw_dias_mora
cb_imprimir_detalle cb_imprimir_detalle
cb_repactar cb_repactar
cb_cerrar cb_cerrar
cb_ver_cuenta cb_ver_cuenta
dw_gastos_bl dw_gastos_bl
dw_detalle_bl dw_detalle_bl
dw_datos_bl dw_datos_bl
cb_bl_insertar cb_bl_insertar
cb_bl_borrar_item cb_bl_borrar_item
cb_bl_borrar cb_bl_borrar
dw_bl_buscar_cliente dw_bl_buscar_cliente
st_n_caja st_n_caja
st_5 st_5
st_uf st_uf
st_4 st_4
st_fecha st_fecha
st_3 st_3
dw_encabezado_ingreso_cupon dw_encabezado_ingreso_cupon
end type
global w_boletas_cuotas_bkp w_boletas_cuotas_bkp

type variables
//long		il_cta_mora,ii_dmora,ii_mora_cobro,ii_inc_gastos,ii_cantidad
//Double	id_valor_cuota,id_gc,id_im,id_interes_gc

Double	id_factor_gc,id_interes_gc,id_tasa_mant
Long		il_cantidad_malo
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_borrar_fila (long al_fila)
end prototypes

public subroutine wf_borrar_fila (long al_fila);Long	fila
dw_detalle_bl.deleterow(al_fila)
dw_detalle_bl.accepttext()
fila 					= dw_detalle_bl.InsertRow(0)
dw_detalle_bl.scrolltorow(fila)
dw_detalle_bl.setitem(fila,'monto',0)
dw_detalle_bl.setitem(fila,'monto_uf',0)
dw_detalle_bl.setitem(fila,'cantidad',0)
dw_detalle_bl.SetItem(fila, "moneda",'P')
dw_detalle_bl.setfocus()
dw_detalle_bl.setcolumn('tipo_cob')
end subroutine

on w_boletas_cuotas_bkp.create
this.dw_dias_mora=create dw_dias_mora
this.cb_imprimir_detalle=create cb_imprimir_detalle
this.cb_repactar=create cb_repactar
this.cb_cerrar=create cb_cerrar
this.cb_ver_cuenta=create cb_ver_cuenta
this.dw_gastos_bl=create dw_gastos_bl
this.dw_detalle_bl=create dw_detalle_bl
this.dw_datos_bl=create dw_datos_bl
this.cb_bl_insertar=create cb_bl_insertar
this.cb_bl_borrar_item=create cb_bl_borrar_item
this.cb_bl_borrar=create cb_bl_borrar
this.dw_bl_buscar_cliente=create dw_bl_buscar_cliente
this.st_n_caja=create st_n_caja
this.st_5=create st_5
this.st_uf=create st_uf
this.st_4=create st_4
this.st_fecha=create st_fecha
this.st_3=create st_3
this.dw_encabezado_ingreso_cupon=create dw_encabezado_ingreso_cupon
this.Control[]={this.dw_dias_mora,&
this.cb_imprimir_detalle,&
this.cb_repactar,&
this.cb_cerrar,&
this.cb_ver_cuenta,&
this.dw_gastos_bl,&
this.dw_detalle_bl,&
this.dw_datos_bl,&
this.cb_bl_insertar,&
this.cb_bl_borrar_item,&
this.cb_bl_borrar,&
this.dw_bl_buscar_cliente,&
this.st_n_caja,&
this.st_5,&
this.st_uf,&
this.st_4,&
this.st_fecha,&
this.st_3,&
this.dw_encabezado_ingreso_cupon}
end on

on w_boletas_cuotas_bkp.destroy
destroy(this.dw_dias_mora)
destroy(this.cb_imprimir_detalle)
destroy(this.cb_repactar)
destroy(this.cb_cerrar)
destroy(this.cb_ver_cuenta)
destroy(this.dw_gastos_bl)
destroy(this.dw_detalle_bl)
destroy(this.dw_datos_bl)
destroy(this.cb_bl_insertar)
destroy(this.cb_bl_borrar_item)
destroy(this.cb_bl_borrar)
destroy(this.dw_bl_buscar_cliente)
destroy(this.st_n_caja)
destroy(this.st_5)
destroy(this.st_uf)
destroy(this.st_4)
destroy(this.st_fecha)
destroy(this.st_3)
destroy(this.dw_encabezado_ingreso_cupon)
end on

event open;double 	id_uf
date 		id_fecha
Long		ll_estado,ii_cantidad
String	ls_opera

dw_dias_mora.settransobject(sqlca)
idt_fecha_hoy		= date(gdt_fec_sistema)
gf_centrar(w_boletas_cuotas)
gs_rezago			= 'N'
//id_tasa_mant
SELECT	"TASA"."TASA_INT_UF"  
INTO 		:id_tasa_mant  
FROM 		"TASA"  
WHERE 	"TASA"."LOOK" = 1   ;

//id_interes_uf	= f_factor_gasto_cobranza()
SELECT "TASA"."GASTO_COB_MORA" INTO :id_interes_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
if gs_base = 'O' or gs_base = 'C' then 
else
	messagebox('No hay Información','Seleccione un Contrato o Promesa.',information!)
	close(w_boletas_cuotas)
	return
end if
gf_centrar(w_boletas_cuotas)
dw_encabezado_ingreso_cupon.SetTransObject(SQLCA)
dw_encabezado_ingreso_cupon.Retrieve(" ", " ", 0)
st_fecha.text	= String(gd_tiempo_serv, "dd/mm/yyyy")
st_n_caja.text = profilestring("INMOB.INI", "Ubicación", "Caja","99")
dw_bl_buscar_cliente.SetTransObject(SQLCA)
dw_bl_buscar_cliente.Retrieve()
dw_bl_buscar_cliente.InsertRow(0)
dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_nombre", "")
dw_bl_buscar_cliente.SetItem(1,"rn_contrato","") 
dw_bl_buscar_cliente.SetItem(1,"rl_rut","")
dw_gastos_bl.InsertRow(0)
dw_bl_buscar_cliente.SetTransObject(SQLCA)
dw_bl_buscar_cliente.Retrieve()
dw_bl_buscar_cliente.InsertRow(0)
dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", "")
dw_bl_buscar_cliente.SetItem(1,"rs_nombre", "")
dw_bl_buscar_cliente.SetItem(1,"rn_contrato","") 
dw_bl_buscar_cliente.SetItem(1,"rl_rut","")
dw_bl_buscar_cliente.AcceptText()
dw_gastos_bl.SetTransObject(SQLCA)
dw_gastos_bl.Retrieve()
dw_datos_bl.SetTransObject(SQLCA)

dw_detalle_bl.getchild('tipo_cob',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve('BL')

dw_detalle_bl.getchild('tipo_cob_otro',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve()

id_fecha 		= idt_fecha_hoy
st_fecha.text 	= string(id_fecha,'dd/mm/yyyy')
id_uf 			= 0
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:id_uf  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha;
IF id_uf > 0  THEN 
	gd_uf 		= id_uf	
	st_uf.text 	= String(id_uf, "###,###,###.0000")
ELSE
//	Open(w_mantenedor_uf)
	id_fecha		= Date(st_fecha.text)
	id_uf 		= 0
	SELECT	"TAB_UF"."VALOR_UF"  
   INTO 		:id_uf  
   FROM 		"TAB_UF"  
   WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha;
END IF
dw_bl_buscar_cliente.setitem(1,'rn_contrato',gi_numero)
dw_bl_buscar_cliente.setitem(1,'rs_bs',gs_base+gs_serie)
dw_bl_buscar_cliente.triggerevent (itemchanged!)
if dw_datos_bl.dataobject='d_datos_cuenta_bl_cto_isa' then
	ii_cantidad	= dw_datos_bl.GetItemNumber(1, "c_cuotas_en_mora")
elseif dw_datos_bl.dataobject='d_datos_cuenta_bl_oferta' then
	ii_cantidad = dw_datos_bl.GetItemNumber(1, "c_cuotas_mora_m")
end if
SELECT	count("REPACTA_MANTENCION"."ESTADO_PAGO")
INTO 		:ll_estado  
FROM 		"REPACTA_MANTENCION"  
WHERE  ( "REPACTA_MANTENCION"."BASE_ORIGINAL" = :gs_base ) AND  
		 ( "REPACTA_MANTENCION"."SERIE_ORIGINAL" = :gs_serie ) AND  
		 ( "REPACTA_MANTENCION"."NUMERO_ORIGINAL" = :gi_numero )   
Using	sqlca ;
if sqlca.sqlcode = 0 then
	if ll_estado > 0 then
		cb_repactar.enabled		= true
//	else
//		if ii_cantidad >= 1 then
//			cb_repactar.enabled	= true
//		else
//			cb_repactar.enabled	= false
//		end if
	end if
else
	if ii_cantidad >= 1 then
		cb_repactar.enabled		= true
	else
		cb_repactar.enabled		= false
	end if
end if
gs_ventana							= 'w_boletas_cuotas'
f_valida_objeto()
SELECT	"ENCARGADOS"."OPERA"  
INTO 		:ls_opera  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	if ls_opera='1' or gs_depto='I' then
		cb_repactar.enabled		= true
	else
		cb_repactar.enabled		= false
	end if
end if
end event

type dw_dias_mora from datawindow within w_boletas_cuotas_bkp
boolean visible = false
integer x = 832
integer y = 1776
integer width = 1563
integer height = 464
string title = "none"
string dataobject = "dwe_lista_calculo_dias_mora_credito"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event doubleclicked;dw_dias_mora.print()
end event

type cb_imprimir_detalle from commandbutton within w_boletas_cuotas_bkp
integer x = 1710
integer y = 1608
integer width = 498
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Detalle Pago"
end type

event clicked;if dw_gastos_bl.getitemnumber(1,'subtotal') > 0 and dw_gastos_bl.getitemnumber(1,'c_total') > 0 then
	if isvalid(w_imprimir_detalle_pago) then close(w_imprimir_detalle_pago)
	open(w_imprimir_detalle_pago)
end if
end event

type cb_repactar from commandbutton within w_boletas_cuotas_bkp
integer x = 1061
integer y = 1608
integer width = 439
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reprogramación"
end type

event clicked;String	ls_string, ls_fecha, ls_estado
long 		i, ll_dia,ll_mes,ll_anno,ll_count_reg,ii_dmora,ii_mora_cobro,ii_inc_gastos,&
			ii_cantidad
double	ld_total,ll_total,ld_resul,id_valor_cuota,id_im,id_gc
Date		ld_fec_prox_pago

ii_dmora=0;ii_mora_cobro=0;ii_inc_gastos=0;ii_cantidad=0;ld_total=0;ll_total=0
ld_resul=0;id_valor_cuota=0;id_im=0;id_gc=0
Setnull(gd_val_deuda);setnull(gd_val_interes)
if gs_base='O' or gs_base='C' then
	gl_n_cuotas_pag 		= 0 
	ls_estado				= trim(dw_encabezado_ingreso_cupon.getitemstring(1,'cadena_estado'))
	SELECT	COUNT("SOL_REACTIVA"."RUT_TITULAR")  
	INTO 		:ll_count_reg  
	FROM 		"SOL_ESTATUS",   
				"SOL_REACTIVA"  
	WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_REACTIVA"."BASE" ) and  
			 ( "SOL_ESTATUS"."SERIE" = "SOL_REACTIVA"."SERIE" ) and  
			 ( "SOL_ESTATUS"."NUMERO" = "SOL_REACTIVA"."NUMERO" ) and  
			 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_REACTIVA"."CORRELATIVO" ) and  
			 (("SOL_ESTATUS"."BASE" = :gs_base ) AND  
			 ( "SOL_ESTATUS"."SERIE" = :gs_serie ) AND  
			 ( "SOL_ESTATUS"."NUMERO" = :gi_numero ) AND  
			 ( "SOL_REACTIVA"."ESTATUS_OPERACION" = 0 ) AND
			 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '3' ) AND  
			 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) )   
	USING		sqlca ;
	if ls_estado='V' or ls_estado='C' or ls_estado='R' or (ls_estado='N' and ll_count_reg>0) then
		dw_detalle_bl.SetItem(1,"cuota_mantencion", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
		IF gs_rezago <> "S" THEN	 
			id_valor_cuota 		= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
			ii_dmora 				= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
//			id_interes_gc			= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
			IF ii_dmora > 5 THEN 
				ii_mora_cobro 		= ii_dmora 
				id_im 				= gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
				IF ii_dmora > 30 THEN 
					id_gc 			= Round(id_valor_cuota * id_interes_gc, 0) //005// PASA DE .1 A .05 10/1/2000
					ii_inc_gastos	= 1
				END IF
			ELSE
				id_gc 				= 0
				id_im 				= 0
				ii_mora_cobro 		= 0
				ii_inc_gastos 		= 0
			END IF
		ELSE
			id_valor_cuota			= 0
			ii_dmora 				= 0
			id_gc 					= 0
			id_im 					= 0
			ii_mora_cobro 			= 0
			ii_inc_gastos 			= 0
		END IF
		if dw_datos_bl.dataobject='d_datos_cuenta_bl_cto_isa' then
			ii_cantidad 				= dw_datos_bl.GetItemNumber(1, "c_cuotas_en_mora")
			ll_dia						= dw_datos_bl.GetItemNumber(1,'c_prox_pago_dia')
			ll_mes						= dw_datos_bl.GetItemNumber(1,'c_prox_pago_mes')
			ll_anno						= dw_datos_bl.GetItemNumber(1,'c_prox_pago_anno')
			gs_moneda					= '2' //dw_datos_bl.GetItemstring(1,'contrato_moneda')
			gl_ctas_pag_m				= dw_datos_bl.GetItemnumber(1,'contrato_cta_pag_m')
		elseif dw_datos_bl.dataobject='d_datos_cuenta_bl_oferta' then
			ii_cantidad 				= dw_datos_bl.GetItemNumber(1, "c_cuotas_mora_m")
			ll_dia						= dw_datos_bl.GetItemNumber(1,'f_prox_pago_dia')
			ll_mes						= dw_datos_bl.GetItemNumber(1,'c_prox_pago_mes')
			ll_anno						= dw_datos_bl.GetItemNumber(1,'c_prox_pago_anno')
			gs_moneda					= '2' //dw_datos_bl.GetItemstring(1,'pago_oferta_moneda')
			gl_ctas_pag_m				= dw_datos_bl.GetItemnumber(1,'oferta_v_cta_pag_m')
		end if
		if ii_cantidad>=0 then
			gl_cta_mora_original		= ii_cantidad
			ls_fecha						= string(ll_dia,"00")+'/'+string(ll_mes,"00")+'/'+string(ll_anno)
			ld_fec_prox_pago			= date(ls_fecha)
			gl_n_cuotas_pag 			= ii_cantidad 
			id_valor_cuota 			= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
			ii_dmora 					= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
//			id_interes_gc				= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
			ll_total						= ii_cantidad * dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos")
			id_gc 						= 0
			id_im 						= 0
			ii_mora_cobro 				= 0
			ii_inc_gastos 				= 0
			FOR i = 1 TO ii_cantidad 
				IF (ii_dmora - (i - 1) * 365) > 5 THEN 
					ii_mora_cobro 		= (ii_dmora - (i - 1) * 365)
					id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
					IF (ii_dmora - (i - 1) * 365) > 30 THEN 
						 id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0) //005// CAMBIO DE 10 A 5%
						 ii_inc_gastos = 1
					END IF
				END IF
			NEXT
			ld_resul						= ( id_gc + id_im )* ii_inc_gastos 
			ld_total						=  round(((ld_resul * ii_inc_gastos) + ll_total),0)
			gd_val_interes				= ld_resul
			gd_val_deuda				= ll_total
			gi_rut						= long(dw_bl_buscar_cliente.getitemstring(1,'rl_rut'))
			gs_dv							= dw_bl_buscar_cliente.getitemstring(1,'cf_obtener_dv')
			ls_string					= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ld_total)+'~t'+trim(dw_encabezado_ingreso_cupon.getitemstring(1,'f_nombre')+'~t'+string(ld_fec_prox_pago)+'~t'+string(ii_cantidad))
			if isvalid(w_detalle_repactacion_por_contrato) then close(w_detalle_repactacion_por_contrato)
			OpenWithParm(w_detalle_repactacion_por_contrato,ls_string)
		else
			messagebox("Advertencia","No tiene Cuotas en Mora para Reprogramar")
		end if
	else
		if ls_estado='N' then
			messagebox("Advertencia","Recuerde para Reprogramar, Contrato Nulo debe existir Solicitud de Reactivación Aceptada")
		else
			messagebox("Advertencia","Recuerde para Reprogramar, El Contrato debe estar Vigente, Cancelado, Nulo o Resuelto")
		end if
	end if
else
	messagebox("Advertencia","Solo se Reprograma Cuota Mantención de Promesa y Contrato Isacruz")
end if
end event

type cb_cerrar from commandbutton within w_boletas_cuotas_bkp
event clicked pbm_bnclicked
integer x = 2432
integer y = 1608
integer width = 329
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_boletas_cuotas)
end event

type cb_ver_cuenta from commandbutton within w_boletas_cuotas_bkp
event clicked pbm_bnclicked
boolean visible = false
integer x = 14
integer y = 1852
integer width = 576
integer height = 108
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Cuenta corriente"
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

type dw_gastos_bl from datawindow within w_boletas_cuotas_bkp
integer x = 1111
integer y = 1280
integer width = 1687
integer height = 296
integer taborder = 70
string dataobject = "de_gastos_bl"
boolean border = false
boolean livescroll = true
end type

type dw_detalle_bl from datawindow within w_boletas_cuotas_bkp
event itemchanged pbm_dwnitemchange
integer x = 1056
integer y = 784
integer width = 1710
integer height = 488
integer taborder = 60
string dataobject = "dw_detalle_bl_ctas_mant"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	is_columna,ls_tipo_cob,ls_moneda,ls_tipo_cob_aux,ls_estado_cadena,ls_descrip_estado,&
			ls_tipo_comp='BE',ls_texto,ls_pasa='S'
long 		il_monto,fila,ii_dmora, ii_mora_cobro,ii_inc_gastos, ii_cantidad, i,&
			ll_ctas=0,ll_count_reg,ll_folio,ll_ctas_pagadas_1=0,ll_ctas_pagadas_2=0,ll_ctas_pagadas=0,&
			ll_cantidad,ll_plazo,ll_ctas_pactadas_pie,ll_suma,ll_tot_reg,ll_indi,ll_count_tipo=0,&
			ll_resta
double 	id_im, id_gc, id_valor_cuota,ld_monto
Datetime	ldt_fecha_hoy

this.accepttext()
is_columna	= this.GetColumnName()
ls_tipo_cob	= this.GetItemString(row, "tipo_cob")
IF ls_tipo_cob <> 'L' and ls_tipo_cob<>'S' THEN
	ll_tot_reg						= dw_detalle_bl.rowcount()
	if ll_tot_reg>1 then
		for ll_indi = 1 to ll_tot_reg
			ls_tipo_cob_aux		= dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
			if ls_tipo_cob = ls_tipo_cob_aux then 
				ll_count_tipo ++
				if ll_count_tipo = 2 then
					messagebox("Advertencia","No puede Ingresar Tipo Cobro "+ls_tipo_cob+" Duplicado")
					wf_borrar_fila(ll_indi)
					ls_pasa	= 'N'
					exit
				end if
			end if
		next
		dw_detalle_bl.accepttext()
	end if
end if
if ls_pasa='S' then
	ii_inc_gastos 						= 1
	IF is_columna = "tipo_cob"  THEN
		IF ls_tipo_cob = "E" THEN
			this.SetItem(row, "cantidad", 1)
			IF gs_rezago <> "S" THEN
				this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_pesos"))
			ELSE 
				this.SetItem(row, "monto", 0)
			END IF
		ELSE
			IF ls_tipo_cob = "L" or ls_tipo_cob = "S" THEN
				this.SetItem(row, "monto", 0)
				this.SetItem(row, "cantidad", 1)
				ls_texto		= ls_tipo_cob+'~t'+'BL'
				openwithparm(w_apertura_tipo_cobro_otros,ls_texto)
			ELSE
				IF ls_tipo_cob = "A" THEN
					this.SetItem(row, "cantidad", 1)
					IF gs_rezago <> "S" THEN
						if gs_base='O' then
							if dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') > 0 and dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pagadas_pie') < dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie')then
								ls_texto			= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+'BE'+'~t'+'0'
								openwithparm(w_ingreso_pago_pie_pactado,ls_texto)
								if Message.StringParm = 'N' then
									this.SetItem(row, "cantidad", 1)
	//								this.SetItem(row, "monto", dw_datos_ci.GetItemNumber(1,"c_valor_pie_pesos"))
									this.accepttext()
								else
	//								w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.accepttext()
	//								w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.setfocus()
	//								w_ingreso.tab_ingreso.tp_ci.dw_detalle_ci.triggerevent(itemchanged!)
								end if		
								
								
//								if long(data) > ( dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') - dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') )  then
//									this.SetItem(row, "cantidad", ( dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') - dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie') ))
//								end if
							end if
						end if
						this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_pie_pesos"))
					ELSE
						this.SetItem(row, "monto", 0)
					END IF
				ELSE
					IF ls_tipo_cob = "F" THEN
						this.SetItem(row, "cantidad", 1)
						IF gs_rezago <> "S" THEN
							this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
						ELSE 
							this.SetItem(row, "monto", 0)
						END IF
					ELSE
						this.SetItem(row, "monto", 0)
						this.SetItem(row, "cantidad", 1)
					END IF
				END IF
			END IF
		END IF
	END IF
	this.accepttext()
	dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
	fila						= row
	if is_columna='cantidad' and ls_tipo_cob = "E" then
		ll_cantidad			= this.GetItemNumber(row, "cantidad")
		if gs_base='O' then
			ll_plazo			= dw_datos_bl.getitemnumber(1,'pago_oferta_nro_cuotas')
		elseif gs_base='C' then
			ll_plazo			= dw_datos_bl.getitemnumber(1,'contrato_plazo')
		end if
		if ll_cantidad > ll_plazo then
			messagebox("Advertencia","Nº Cuotas es Superior al Plazo")
			wf_borrar_fila(row)
//			this.SetItem(row, "cantidad", 0)
//			this.SetItem(row, "monto", 0)
		else
			if gs_base='O' then
				ll_ctas_pactadas_pie	= dw_datos_bl.getitemnumber(1,'pago_oferta_ctas_pactadas_pie')
			elseif gs_base='C' then
				ll_ctas_pactadas_pie	= dw_datos_bl.getitemnumber(1,'contrato_pie')
			end if
			if isnull(ll_ctas_pactadas_pie) then ll_ctas_pactadas_pie=0
			ls_tipo_cob				= this.GetItemString(row, "tipo_cob")
			ll_plazo					= dw_datos_bl.getitemnumber(1,'pago_oferta_nro_cuotas')
			ll_ctas_pagadas		= dw_datos_bl.getitemnumber(1,'oferta_v_cta_pag_s')
			ll_resta					= ll_plazo - ll_ctas_pagadas
			if isnull(ll_ctas_pactadas_pie) then ll_ctas_pactadas_pie = 0
			if isnull(ll_ctas_pagadas) then ll_ctas_pagadas=0
			if ls_tipo_cob = "E" then
				IF ll_cantidad > 0 and ll_cantidad <= ll_resta AND gs_base='O' THEN //gs_rezago <> "S" and ll_ctas_pactadas_pie = 0 AND 
					this.SetItem(row, "monto", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_pesos"))
				else
					messagebox("Advertencia","Cantidad de Cuotas es Superior a Cuotas Pendientes")
					wf_borrar_fila(row)
//					this.SetItem(row, "cantidad", 0)
//					this.SetItem(row, "monto", 0)
				end if
			end if
		end if
	end if
	IF ls_tipo_cob = "E" AND this.GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" THEN //is_columna = "cantidad" AND 
		ii_cantidad			= GetItemNumber(row, "cantidad")
		gl_n_cuotas_pag 	= ii_cantidad 
		id_valor_cuota 	= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_pesos"), 0)
		ii_dmora 			= dw_datos_bl.GetItemNumber(1,"c_dias_mora")
	//	id_factor_gc		= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
		id_gc 				= 0
		id_im 				= 0
		ii_mora_cobro 		= 0
		ii_inc_gastos 		= 0
		FOR i = 1 TO ii_cantidad 
			IF (ii_dmora - (i - 1) * 30) > 5 THEN 
				ii_mora_cobro		= (ii_dmora - (i - 1) * 30)
				id_im 				= id_im + gf_int_mora(dw_datos_bl.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
				IF (ii_dmora - (i - 1) * 30) > 30 THEN 
					id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0)
					ii_inc_gastos 	= 1
				END IF
			ELSE
				// id_gc = 0
				// id_im = 0
				// ii_mora_cobro = 0
			END IF
		NEXT
		dw_gastos_bl.SetItem(1,"gastos_cob", id_gc) // J 10%
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.SetItem(1,"incluir_gastos", ii_inc_gastos)
	END IF
	IF is_columna = "cantidad" AND ls_tipo_cob = "F" AND GetItemNumber(row, "cantidad") > 0 AND gs_rezago <> "S" THEN
		ii_cantidad 		= GetItemNumber(row, "cantidad")
		gl_n_cuotas_pag 	= ii_cantidad 
		id_valor_cuota 	= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
		ii_dmora 			= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
	//	id_interes_gc		= double(dw_datos_bl.GetItemNumber(1, "tasa_gasto_cob_mora"))
		id_gc 				= 0
		id_im 				= 0
		ii_mora_cobro 		= 0
		ii_inc_gastos 		= 0
		FOR i = 1 TO ii_cantidad 
			IF (ii_dmora - (i - 1) * 365) > 5 THEN 
				ii_mora_cobro		= (ii_dmora - (i - 1) * 365)
				id_im 				= id_im + gf_int_mora(id_tasa_mant, ii_mora_cobro, id_valor_cuota)
				IF (ii_dmora - (i - 1) * 365) > 30 THEN 
					 id_gc 			= id_gc + Round(id_valor_cuota * id_interes_gc, 0) //005// CAMBIO DE 10 A 5%
					 ii_inc_gastos	= 1
				END IF
			END IF
		NEXT
		dw_gastos_bl.SetItem(1,"gastos_cob", id_gc)
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.accepttext()
		if isnull(dw_gastos_bl.getitemnumber(1,"gastos_cob")) then		dw_gastos_bl.SetItem(1,"gastos_cob", 0)
		if isnull(dw_gastos_bl.getitemnumber(1,"mora")) then 				dw_gastos_bl.SetItem(1,"mora", 0)
		if isnull(dw_gastos_bl.getitemnumber(1,"incluir_gastos")) then dw_gastos_bl.SetItem(1,"incluir_gastos", 0)
		dw_gastos_bl.SetItem(1, "Subtotal",this.GetItemNumber(1,"c_subtotal"))
		dw_gastos_bl.accepttext()
	END IF
end if
end event

type dw_datos_bl from datawindow within w_boletas_cuotas_bkp
integer x = 37
integer y = 708
integer width = 1001
integer height = 996
integer taborder = 20
string dataobject = "d_datos_cuenta_bl_oferta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_bl_insertar from commandbutton within w_boletas_cuotas_bkp
event clicked pbm_bnclicked
integer x = 1061
integer y = 684
integer width = 329
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Insertar"
end type

event clicked;long		fila,ll_indi,ll_tot_reg,ll_cantidad,ll_monto,ll_sw_pasa=0,ii_dmora,ii_mora_cobro,&
			ii_inc_gastos
String	ls_tipo_cob
Double	id_valor_cuota,id_im,id_gc
ll_tot_reg		= dw_detalle_bl.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_tipo_cob	= dw_detalle_bl.getitemstring(ll_indi,'tipo_cob')
	ll_cantidad	= dw_detalle_bl.getitemnumber(ll_indi,'cantidad')
	ll_monto		= dw_detalle_bl.getitemnumber(ll_indi,'monto')
	if ls_tipo_cob='' or isnull(ls_tipo_cob) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Tipo Cobro Inválido")
		dw_detalle_bl.setfocus()
		dw_detalle_bl.scrolltorow(ll_indi)
		dw_detalle_bl.setcolumn('tipo_cob')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	elseif ll_cantidad<=0 or isnull(ll_cantidad) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Cantidad Inválido")
		dw_detalle_bl.setfocus()
		dw_detalle_bl.scrolltorow(ll_indi)
		dw_detalle_bl.setcolumn('cantidad')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	elseif (ll_monto<=0 or isnull(ll_monto)) then
		messagebox("Advertencia","No es posible Insertar nuevo Item, en Fila Nº  "+string(ll_indi)+"  Monto Inválido")
		dw_detalle_bl.setfocus()
		dw_detalle_bl.scrolltorow(ll_indi)
		dw_detalle_bl.setcolumn('monto')
		ll_indi		= ll_tot_reg
		ll_sw_pasa	= 1
	end if
next
IF ll_sw_pasa=0 THEN
	gl_n_cuotas_pag			= 0 
	fila							= dw_detalle_bl.InsertRow(0)
	dw_detalle_bl.scrolltorow(fila)
	dw_detalle_bl.SetItem(fila, "folio", 0)
	dw_detalle_bl.SetItem(1,"cuota_mantencion", dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"))
	dw_detalle_bl.SetItem(fila, "moneda",'P')
	IF fila = 1 THEN
	  IF gs_rezago <> "S" THEN	 
		id_valor_cuota			= Round(dw_datos_bl.GetItemNumber(1,"c_valor_cuota_mantencion_pesos"), 0)
		ii_dmora 				= dw_datos_bl.GetItemNumber(1,"c_dias_mora_mant")
	//	id_interes_gc			= double(dw_datos_bl.GetItemNumber(1,"tasa_gasto_cob_mora"))
		IF ii_dmora > 5 THEN 
			ii_mora_cobro		= ii_dmora 
			id_im 				= gf_int_mora(dw_datos_bl.GetItemNumber(1,"c_tasa"), ii_mora_cobro, id_valor_cuota)
			IF ii_dmora > 30 THEN 
				id_gc 			= Round(id_valor_cuota * id_interes_gc, 0) //005// PASA DE .1 A .05 10/1/2000
				ii_inc_gastos	= 1
			END IF
			
		ELSE
			id_gc 				= 0
			id_im 				= 0
			ii_mora_cobro 		= 0
			ii_inc_gastos 		= 0
		END IF
		dw_gastos_bl.InsertRow(0)
		dw_gastos_bl.SetItem(1,"gastos_cob", id_gc) // J 10%
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.SetItem(1,"incluir_gastos", ii_inc_gastos)
		cb_bl_borrar_item.Enabled	= true
	  ELSE
		id_valor_cuota 		= 0
		ii_dmora 				= 0
		id_gc 					= 0
		id_im 					= 0
		ii_mora_cobro 			= 0
		ii_inc_gastos 			= 0
		dw_gastos_bl.InsertRow(0)
		dw_gastos_bl.SetItem(1,"gastos_cob", id_gc) // J 10%
		dw_gastos_bl.SetItem(1,"mora", id_im)
		dw_gastos_bl.SetItem(1,"incluir_gastos", ii_inc_gastos)
		cb_bl_borrar_item.Enabled	= true
	  END IF
	END IF
end if
end event

type cb_bl_borrar_item from commandbutton within w_boletas_cuotas_bkp
event clicked pbm_bnclicked
integer x = 1394
integer y = 684
integer width = 329
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "B&orrar Item"
end type

event clicked;IF dw_detalle_bl.RowCount() >0 Then
	dw_detalle_bl.DeleteRow(dw_detalle_bl.GetRow())
	if dw_detalle_bl.rowcount()=0 then
		cb_bl_borrar_item.Enabled= FALSE
		dw_gastos_bl.SetItem(1,"gastos_cob", 0)
		dw_gastos_bl.SetItem(1,"mora", 0)
		dw_gastos_bl.SetItem(1,"subtotal", 0)	
	end if
END IF
IF dw_detalle_bl.RowCount() =0 Then
	cb_bl_borrar_item.Enabled = FALSE
END IF
end event

type cb_bl_borrar from commandbutton within w_boletas_cuotas_bkp
event clicked pbm_bnclicked
integer x = 2437
integer y = 684
integer width = 329
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Borrar"
end type

event clicked;//dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", "")
//dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", "")
//dw_bl_buscar_cliente.SetItem(1,"rs_nombre", "")
//dw_bl_buscar_cliente.SetItem(1,"rn_contrato","") 
//dw_bl_buscar_cliente.SetItem(1,"rl_rut","")
//dw_bl_buscar_cliente.SetItem(1,"rs_bs","")
//cb_bl_insertar.Enabled 			= FALSE
//cb_bl_borrar_item.Enabled 		= FALSE
dw_detalle_bl.Reset()
dw_gastos_bl.Reset()
//dw_datos_bl.Reset()
//dw_bl_buscar_cliente.AcceptText()
//dw_encabezado_ingreso_cupon.Reset()
end event

type dw_bl_buscar_cliente from datawindow within w_boletas_cuotas_bkp
event itemchanged pbm_dwnitemchange
integer x = 229
integer y = 448
integer width = 2418
integer height = 208
string dataobject = "de_buscar_cliente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	is_base, is_serie
long 		 il_nenc, il_ndat, il_rut
integer	li_opcion
Double	il_numero
gs_tipo_cobro					= "BL"
gs_filtro 						= "cadena_codigo = 'O' OR cadena_codigo = 'C'"
dw_bl_buscar_cliente.AcceptText()
il_rut 							= long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut"))
IF il_rut = 0 THEN
	IF dw_bl_buscar_cliente.GetItemString(1,"rn_contrato") = "" THEN
		gi_tipo_busqueda 		= 2
		gs_apellido_paterno	= dw_bl_buscar_cliente.GetItemString(1,"rs_a_paterno")
	ELSE 
		gi_numero 				= Double(dw_bl_buscar_cliente.GetItemString(1,"rn_contrato"))
		gi_tipo_busqueda		= 0
	END IF	
ELSE 
	gi_rut 						= long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut"))
	gi_tipo_busqueda			= 1
END IF
Open(w_buscar_cliente)
IF gf_permitir_ingreso(gs_base, gs_serie, gi_numero) THEN
	gs_rezago 					= " "
	dw_bl_buscar_cliente.AcceptText()
END IF
IF gs_base <> ""	AND gs_serie <> "" AND gi_numero > 0 THEN
	il_nenc 						= dw_encabezado_ingreso_cupon.Retrieve(gs_base, gs_serie, gi_numero)
	IF il_nenc > 0 THEN 
		gi_rut 					= dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")
	ELSE
		gi_rut 					= 0
	END IF
	If gi_rut = 0 THEN
		gs_rezago 				= " "
		cb_bl_borrar.TriggerEvent(Clicked!)
		dw_bl_buscar_cliente.AcceptText()
		RETURN 0
	END IF
	CHOOSE CASE gs_base
		CASE "O"
			dw_datos_bl.DataObject	= 'd_datos_cuenta_bl_oferta'
		CASE "C"
			dw_datos_bl.DataObject	= 'd_datos_cuenta_bl_cto_isa'
	END CHOOSE
	dw_datos_bl.SetTransObject(SQLCA)
	il_ndat 								= dw_datos_bl.Retrieve(gs_serie,gi_numero)
	IF  il_nenc > 0 THEN
		dw_bl_buscar_cliente.SetItem(1,"rs_a_paterno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno"))
		dw_bl_buscar_cliente.SetItem(1,"rs_a_materno", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno"))
		dw_bl_buscar_cliente.SetItem(1,"rs_nombre", dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre"))
		dw_bl_buscar_cliente.SetItem(1,"rn_contrato",String(gi_numero)) 
		dw_bl_buscar_cliente.SetItem(1,"rl_rut",String(dw_encabezado_ingreso_cupon.GetItemNumber(1, "cliente_rut")))
		dw_bl_buscar_cliente.SetItem(1,"rs_bs",(gs_base+gs_serie))
		gs_nombre_completo 			= dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_nombre") + " "+ dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_paterno") + " " + dw_encabezado_ingreso_cupon.GetItemString(1, "cliente_a_materno") 
		gs_rezago 						= " "
	ELSE
		MessageBox("Ingreso de Boletas", "No se encontró información asociada a ese número de documento.")
		cb_bl_borrar.TriggerEvent(Clicked!)
	END IF	
ELSE
	IF Long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut")) > 0 THEN 
		//No se encuentra el cliente, preguntar si desea ingresar rezago
		li_opcion						= MessageBox("Ingreso de Boletas", "No se encontró el Cliente o el contrato no ha sido ingresado, desea ingresar Boleta en rezago ?", Exclamation!, YesNo!, 2)
		IF li_opcion = 1 THEN
			gs_rezago 					= "S"
			gs_base 						= "O"
			gs_serie 					= "I"
			gi_numero 					= 0
			gi_rut 						= long(dw_bl_buscar_cliente.GetItemString(1,"rl_rut"))
		ELSE
			gs_rezago 					= " "
			cb_bl_borrar.TriggerEvent(Clicked!)
			dw_bl_buscar_cliente.AcceptText()
		END IF
	ELSE
		cb_bl_borrar.TriggerEvent(Clicked!)
	END IF
END IF
end event

type st_n_caja from statictext within w_boletas_cuotas_bkp
integer x = 3488
integer y = 300
integer width = 402
integer height = 84
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_boletas_cuotas_bkp
integer x = 3223
integer y = 300
integer width = 247
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Caja:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_uf from statictext within w_boletas_cuotas_bkp
integer x = 2158
integer y = 40
integer width = 434
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

type st_4 from statictext within w_boletas_cuotas_bkp
integer x = 1897
integer y = 36
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "U.F.:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fecha from statictext within w_boletas_cuotas_bkp
integer x = 1120
integer y = 40
integer width = 430
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

type st_3 from statictext within w_boletas_cuotas_bkp
integer x = 841
integer y = 36
integer width = 261
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_encabezado_ingreso_cupon from datawindow within w_boletas_cuotas_bkp
integer x = 155
integer y = 132
integer width = 2528
integer height = 300
integer taborder = 10
string dataobject = "d_encabezado_ingreso_cupon"
boolean border = false
boolean livescroll = true
end type

