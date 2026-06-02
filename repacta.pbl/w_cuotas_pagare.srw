forward
global type w_cuotas_pagare from window
end type
type dw_seguro from datawindow within w_cuotas_pagare
end type
type rb_normal from radiobutton within w_cuotas_pagare
end type
type cb_aceptar from commandbutton within w_cuotas_pagare
end type
type em_numero from editmask within w_cuotas_pagare
end type
type dw_print from datawindow within w_cuotas_pagare
end type
type st_1 from statictext within w_cuotas_pagare
end type
type st_protesto from statictext within w_cuotas_pagare
end type
type st_castigado from statictext within w_cuotas_pagare
end type
type cb_2 from commandbutton within w_cuotas_pagare
end type
type cb_ver_cuenta from commandbutton within w_cuotas_pagare
end type
type cb_3 from commandbutton within w_cuotas_pagare
end type
type cb_4 from commandbutton within w_cuotas_pagare
end type
type cb_5 from commandbutton within w_cuotas_pagare
end type
type cb_6 from commandbutton within w_cuotas_pagare
end type
type cb_7 from commandbutton within w_cuotas_pagare
end type
type cb_8 from commandbutton within w_cuotas_pagare
end type
type cb_pagare from commandbutton within w_cuotas_pagare
end type
type cb_est_cheque from commandbutton within w_cuotas_pagare
end type
type dw_ctto from datawindow within w_cuotas_pagare
end type
type cb_cerrar from commandbutton within w_cuotas_pagare
end type
type em_saldo_peso from editmask within w_cuotas_pagare
end type
type em_pie_peso from editmask within w_cuotas_pagare
end type
type em_pie_uf from editmask within w_cuotas_pagare
end type
type dw_repacta from datawindow within w_cuotas_pagare
end type
type em_saldo_uf from editmask within w_cuotas_pagare
end type
end forward

global type w_cuotas_pagare from window
integer width = 3712
integer height = 2332
boolean titlebar = true
string title = "Reprogramación de Credito Pagaré"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_seguro dw_seguro
rb_normal rb_normal
cb_aceptar cb_aceptar
em_numero em_numero
dw_print dw_print
st_1 st_1
st_protesto st_protesto
st_castigado st_castigado
cb_2 cb_2
cb_ver_cuenta cb_ver_cuenta
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_pagare cb_pagare
cb_est_cheque cb_est_cheque
dw_ctto dw_ctto
cb_cerrar cb_cerrar
em_saldo_peso em_saldo_peso
em_pie_peso em_pie_peso
em_pie_uf em_pie_uf
dw_repacta dw_repacta
em_saldo_uf em_saldo_uf
end type
global w_cuotas_pagare w_cuotas_pagare

type variables
Date		idt_fecha_hoy
Double	id_factor_gc_nuevo,id_factor_gc,id_factor_gc_peso
end variables

forward prototypes
public subroutine wf_print_repro ()
end prototypes

public subroutine wf_print_repro ();Long		ll_new,ll_nulo
datetime	ldt_nulo

SetNull(ldt_nulo)
SetNull(ll_nulo)
dw_repacta.accepttext()
if dw_repacta.getitemnumber(1,'numero_original')>0 then
	dw_print.reset()
	ll_new		= dw_print.insertrow(0)
	//setea datos de la reprogramación
	if rb_normal.checked=true then
		dw_print.object.t_73.text	= 'Reprogramación'
		dw_print.setitem(ll_new,'tipo_reprog','N')
	end if
	dw_print.setitem(ll_new,'base_rep',dw_repacta.getitemstring(1,'base'))
	dw_print.setitem(ll_new,'serie_rep',dw_repacta.getitemstring(1,'serie'))
	dw_print.setitem(ll_new,'numero_rep',dw_repacta.getitemnumber(1,'numero'))
	dw_print.setitem(ll_new,'base',dw_repacta.getitemstring(1,'base_original'))
	dw_print.setitem(ll_new,'serie',dw_repacta.getitemstring(1,'serie_original'))
	dw_print.setitem(ll_new,'numero',dw_repacta.getitemnumber(1,'numero_original'))
	dw_print.setitem(ll_new,'nombre_usuario',gs_nom_comp_usuario)
	dw_print.setitem(ll_new,'agente',dw_repacta.getitemstring(1,'cod_age'))
	dw_print.setitem(ll_new,'supervisor',dw_repacta.getitemstring(1,'cod_sup'))
	dw_print.setitem(ll_new,'jefe_venta',dw_repacta.getitemstring(1,'cod_jefe'))
	dw_print.setitem(ll_new,'rut_cliente',dw_repacta.getitemnumber(1,'rut_ctto_original'))
	dw_print.setitem(ll_new,'dv_cliente',dw_repacta.getitemstring(1,'dv_ctto_original'))
	dw_print.setitem(ll_new,'nombre_cliente',dw_repacta.getitemstring(1,'c_nom_comp_cliente'))
	dw_print.setitem(ll_new,'capital_pagado',dw_repacta.getitemnumber(1,'capital_pagado'))
	dw_print.setitem(ll_new,'valor_presente_f',dw_repacta.getitemnumber(1,'valor_presente'))
	dw_print.setitem(ll_new,'cuota_mora_g',dw_repacta.getitemnumber(1,'valor_cuota_mora'))
	dw_print.setitem(ll_new,'interes_mora_h',dw_repacta.getitemnumber(1,'valor_interes_mora_total'))
	dw_print.setitem(ll_new,'saldo_precio_e',dw_repacta.getitemnumber(1,'saldo_precio'))
	dw_print.setitem(ll_new,'saldo_insoluto_b',dw_repacta.getitemnumber(1,'saldo_insoluto'))
	dw_print.setitem(ll_new,'new_moneda',dw_repacta.getitemstring(1,'moneda'))
	dw_print.setitem(ll_new,'new_plazo',dw_repacta.getitemnumber(1,'nvo_plazo'))
	dw_print.setitem(ll_new,'new_pie',double(dw_repacta.getitemnumber(1,'nvo_pie')))
	dw_print.setitem(ll_new,'new_saldo',double(dw_repacta.getitemnumber(1,'nvo_saldo')))
	dw_print.setitem(ll_new,'new_gasto_adm_7',dw_repacta.getitemnumber(1,'nvo_gasto_adm'))
	dw_print.setitem(ll_new,'new_saldo_insoluto_8',dw_repacta.getitemnumber(1,'nvo_saldo_insoluto'))
	dw_print.setitem(ll_new,'new_cuota_10',dw_repacta.getitemnumber(1,'nvo_valor_cuota'))
	dw_print.setitem(ll_new,'interes_cuota',dw_repacta.getitemnumber(1,'interes_cuota'))
	dw_print.setitem(ll_new,'factor_cuota',dw_repacta.getitemnumber(1,'tasa_interes'))
	dw_print.setitem(ll_new,'valor_uf',gd_uf)
	//setea datos del contrato
	dw_print.setitem(ll_new,'parque',dw_ctto.getitemnumber(1,'cadena_cod_parque'))
	dw_print.setitem(ll_new,'estado_cadena',dw_ctto.getitemstring(1,'cadena_estado'))
	dw_print.setitem(ll_new,'moneda_ori',dw_ctto.getitemstring(1,'pagare_moneda'))
	dw_print.setitem(ll_new,'valor_cuota',dw_ctto.getitemnumber(1,'pagare_valor_cuo'))
	dw_print.setitem(ll_new,'ctas_mora',dw_ctto.getitemnumber(1,'cadena_mora_mora_cred'))
	dw_print.setitem(ll_new,'dias_mora',dw_ctto.getitemnumber(1,'cadena_mora_dias_mora_cred'))
	dw_print.setitem(ll_new,'plazo',dw_ctto.getitemnumber(1,'pagare_plazo'))
	dw_print.setitem(ll_new,'ctas_pag_s',dw_ctto.getitemnumber(1,'c_cuotas_pagadas'))
	dw_print.setitem(ll_new,'tasa',dw_ctto.getitemnumber(1,'c_tasa'))
	dw_print.setitem(ll_new,'pie',dw_ctto.getitemnumber(1,'pagare_pie'))
	dw_print.setitem(ll_new,'total_pagado',dw_ctto.getitemnumber(1,'pagare_tot_pagado'))
	dw_print.setitem(ll_new,'fecha_prox_pago',dw_ctto.getitemdatetime(1,'c_prox_pago'))
	dw_print.setitem(ll_new,'pie_pag',dw_ctto.getitemnumber(1,'pagare_pie_pagado'))
	dw_print.setitem(ll_new,'fecha_pie',ldt_nulo)
	dw_print.setitem(ll_new,'tasa_contrato',dw_ctto.getitemnumber(1,'c_tasa'))
	dw_print.setitem(ll_new,'precio',dw_ctto.getitemnumber(1,'pagare_kapital'))
	dw_print.setitem(ll_new,'derecho_especial',ll_nulo)
	dw_print.accepttext()
	dw_print.print()
end if
end subroutine

on w_cuotas_pagare.create
this.dw_seguro=create dw_seguro
this.rb_normal=create rb_normal
this.cb_aceptar=create cb_aceptar
this.em_numero=create em_numero
this.dw_print=create dw_print
this.st_1=create st_1
this.st_protesto=create st_protesto
this.st_castigado=create st_castigado
this.cb_2=create cb_2
this.cb_ver_cuenta=create cb_ver_cuenta
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_pagare=create cb_pagare
this.cb_est_cheque=create cb_est_cheque
this.dw_ctto=create dw_ctto
this.cb_cerrar=create cb_cerrar
this.em_saldo_peso=create em_saldo_peso
this.em_pie_peso=create em_pie_peso
this.em_pie_uf=create em_pie_uf
this.dw_repacta=create dw_repacta
this.em_saldo_uf=create em_saldo_uf
this.Control[]={this.dw_seguro,&
this.rb_normal,&
this.cb_aceptar,&
this.em_numero,&
this.dw_print,&
this.st_1,&
this.st_protesto,&
this.st_castigado,&
this.cb_2,&
this.cb_ver_cuenta,&
this.cb_3,&
this.cb_4,&
this.cb_5,&
this.cb_6,&
this.cb_7,&
this.cb_8,&
this.cb_pagare,&
this.cb_est_cheque,&
this.dw_ctto,&
this.cb_cerrar,&
this.em_saldo_peso,&
this.em_pie_peso,&
this.em_pie_uf,&
this.dw_repacta,&
this.em_saldo_uf}
end on

on w_cuotas_pagare.destroy
destroy(this.dw_seguro)
destroy(this.rb_normal)
destroy(this.cb_aceptar)
destroy(this.em_numero)
destroy(this.dw_print)
destroy(this.st_1)
destroy(this.st_protesto)
destroy(this.st_castigado)
destroy(this.cb_2)
destroy(this.cb_ver_cuenta)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_pagare)
destroy(this.cb_est_cheque)
destroy(this.dw_ctto)
destroy(this.cb_cerrar)
destroy(this.em_saldo_peso)
destroy(this.em_pie_peso)
destroy(this.em_pie_uf)
destroy(this.dw_repacta)
destroy(this.em_saldo_uf)
end on

event open;Long		ll_new,ll_dias_mora,ll_plazo,ll_ctas_mora,ll_ctas_pag,ll_valor_cuota_peso,ll_monto_pagado,&
			ll_indi,ii_dmora,ll_interes_mora,ii_mora_cobro,ii_inc_gastos,i,ll_mora,ll_count,ll_tot_reg,&
			ll_folio,ll_serie,ll_monto,ll_saldo
Double	ldb_precio,ldb_pie,ll_pie_pagado_peso,ldb_valor_cuota,ldb_tasa,ldb_valor_cuotas_mora,&
			ldb_gasto_adb,ldb_uf_dia,ldb_monto_pagado_en_uf,ldb_pie_pagado,ldb_gc,ldb_valor_presente,&
			ldb_interes,ldb_capital,ldb_desa_capital,ldb_sum_gc,ldb_sum_interes,ldb_sum_capital,&
			ldb_sum_cuota,ldb_capital_pagado,ldb_cap_pag,ldb_capital_total_pagado,id_gc,id_im,&
			ldb_interes_mora,ldb_factor_pesos,ldb_factor_uf,ldb_tasa_peso,ldb_tasa_uf,ldb_tasa_int,&
			ldb_gasto_adm,ldb_saldo_precio,ldb_nva_valor_cuota,ldb_total_pagado,ldb_vp,ldb_valor_pres_unico
String	ls_moneda,ls_tipo_cob,ls_estado_comi,ls_estado_comi_sup
Datetime	ldt_fecha_promesa,ldt_fecha_pago,ldt_fecha_venc

gf_centrar(w_cuotas_pagare)
rb_normal.checked			= true
st_castigado.visible			= false
st_protesto.visible				= false
idt_fecha_hoy					= date(gdt_fec_sistema)
id_factor_gc_nuevo			= f_factor_gasto_cobranza()
SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
id_factor_gc_peso				= f_factor_gasto_cobranza_peso()
st_protesto.text				= ''
st_castigado.text				= ''
dw_ctto.settransobject(sqlca)
dw_repacta.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_ctto.retrieve(gs_serie,gi_numero)
ll_new							= dw_repacta.insertrow(0)
dw_repacta.scrolltorow(ll_new)
dw_repacta.setitem(ll_new,'base','O')
dw_repacta.setitem(ll_new,'serie','R')
dw_repacta.setitem(ll_new,'base_original',gs_base)
dw_repacta.setitem(ll_new,'serie_original',gs_serie)
dw_repacta.setitem(ll_new,'numero_original',gi_numero)
dw_repacta.setitem(ll_new,'uf_dia',gd_uf)
dw_repacta.setitem(ll_new,'fecha_crea',datetime(date(gdt_fec_sistema),time('00:00:00')))
dw_repacta.setitem(ll_new,'moneda','0')
em_pie_uf.enabled				= false
em_pie_peso.enabled			= false
em_pie_uf.visible				= true
em_pie_uf.text					= ''
em_pie_peso.visible			= true
em_pie_peso.text				= ''
em_saldo_uf.enabled			= false
em_saldo_peso.enabled		= false
em_saldo_uf.visible			= true
em_saldo_uf.text				= ''
em_saldo_peso.visible		= true
em_saldo_peso.text			= ''
if dw_ctto.rowcount()>0 then
	dw_repacta.setitem(ll_new,'cod_age',  dw_ctto.getitemstring(1,'contrato_agente'))
	dw_repacta.setitem(ll_new,'rut_ctto_original', dw_ctto.getitemnumber(1,'cliente_rut'))
	dw_repacta.setitem(ll_new,'dv_ctto_original' , dw_ctto.getitemstring(1,'cliente_dv'))
	ll_dias_mora				= dw_ctto.getitemnumber(1,'cadena_mora_dias_mora_cred')
	ldb_precio					= double(dw_ctto.getitemnumber(1,'pagare_kapital'))
	ldb_pie						= double(dw_ctto.getitemnumber(1,'pagare_pie'))
	ll_pie_pagado_peso		= double(dw_ctto.getitemnumber(1,'pagare_pie_pagado'))
	ls_moneda					= dw_ctto.getitemstring(1,'pagare_moneda')
	ll_plazo						= dw_ctto.getitemnumber(1,'pagare_plazo')
	ll_ctas_mora				= dw_ctto.getitemnumber(1,'cadena_mora_mora_cred')
	ll_ctas_pag					= dw_ctto.getitemnumber(1,'c_cuotas_pagadas')
	ldb_valor_cuota			= round(double(dw_ctto.getitemnumber(1,'pagare_valor_cuo')),4)
	ldb_tasa						= (double(dw_ctto.getitemnumber(1,'c_tasa_prepago')) / 100) //c_tasa
	ldt_fecha_promesa			= dw_ctto.getitemdatetime(1,'pagare_fecha')
	ldb_valor_cuotas_mora	= round((ll_ctas_mora * ldb_valor_cuota),4)
	ll_valor_cuota_peso		= dw_ctto.getitemnumber(1,'c_valor_cuota_pesos')
	ldb_gasto_adb				= 0//dw_ctto.getitemnumber(1,'pago_oferta_gastos_adm')
	ldb_total_pagado			= dw_ctto.getitemnumber(1,'pagare_tot_pagado')
	ls_estado_comi				= 'P'//dw_ctto.getitemstring(1,'oferta_v_estado_comi')
	ls_estado_comi_sup		= 'P'//dw_ctto.getitemstring(1,'oferta_v_estado_comi_sup')
	dw_repacta.setitem(ll_new,'estado','V')
	dw_repacta.setitem(ll_new,'moneda_original',ls_moneda)
	dw_repacta.setitem(ll_new,'dias_mora',ll_dias_mora)
	dw_repacta.setitem(ll_new,'cuotas_mora',ll_ctas_mora)
	dw_repacta.setitem(ll_new,'total_pagado_original',ldb_total_pagado)
	dw_repacta.setitem(ll_new,'estado_comi_age_original',ls_estado_comi)
	dw_repacta.setitem(ll_new,'estado_comi_sup_original',ls_estado_comi_sup)
	dw_repacta.setitem(ll_new,'usuario',gs_user)
	dw_repacta.setitem(ll_new,'precio_original',ldb_precio)
	dw_repacta.setitem(ll_new,'plazo_original',ll_plazo)
	dw_repacta.setitem(ll_new,'cuotas_pagadas_original',ll_ctas_pag)
	dw_repacta.setitem(ll_new,'valor_cuota_original',dw_ctto.getitemnumber(1,'pagare_valor_cuo'))
	if ll_pie_pagado_peso>0 then
		DECLARE	x1 CURSOR FOR  
		SELECT 	"INGRESO"."FECHA_PAGO",   
					"INGRESO"."MONTO"  
		FROM 		"INGRESO"  
		WHERE  ( "INGRESO"."BASE" = :gs_base AND "INGRESO"."SERIE" = :gs_serie AND "INGRESO"."CONTRATO" = :gi_numero AND "INGRESO"."TIPO_MOV" = 'A' AND "INGRESO"."PAGO_HIST" = 'A') OR  
				 ( "INGRESO"."BASE" = :gs_base AND "INGRESO"."SERIE" = :gs_serie AND "INGRESO"."CONTRATO" = :gi_numero AND "INGRESO"."TIPO_MOV" = 'Q' AND "INGRESO"."PAGO_HIST" = 'A')   
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				fetch x1 into :ldt_fecha_pago, :ll_monto_pagado;
				if not isnull(ldt_fecha_pago) and ll_monto_pagado>0 then
					SELECT	"TAB_UF"."VALOR_UF"  
					INTO 		:ldb_uf_dia  
					FROM 		"TAB_UF"  
					WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_pago   
					USING		sqlca ;
					if sqlca.sqlcode=0 and ldb_uf_dia>0 then
						ldb_monto_pagado_en_uf	= round((ll_monto_pagado / ldb_uf_dia),4)
						ldb_pie_pagado				= ldb_pie_pagado + ldb_monto_pagado_en_uf
					end if
				end if
				setnull(ldt_fecha_pago);setnull(ll_monto_pagado)
			LOOP
		end if
		close x1;
	else
		ldb_pie_pagado				= 0
	end if
	ldb_gc							= ldb_gasto_adb / ll_plazo
	if isnull(ldb_gc) then ldb_gc = 0
	ll_saldo							= ll_plazo - (ll_ctas_pag + ll_ctas_mora)
	if ll_saldo <= 0 then ll_saldo=0
	ldb_valor_presente			= round(f_valor_presente(ldb_tasa,ll_plazo,ldb_valor_cuota),2)
	ldb_valor_pres_unico			= round(f_valor_presente(ldb_tasa,ll_saldo,ldb_valor_cuota),2)
	ldb_vp							= ldb_valor_presente
	if ls_moneda='1' then //peso 
		ldb_gc						= round((ldb_gc / gd_uf),4)
		if isnull(ldb_gc) then ldb_gc = 0
		ldb_valor_presente		= round((ldb_valor_presente / gd_uf),4)
		ldb_valor_cuota			= round((ldb_valor_cuota / gd_uf),4)
		ldb_valor_cuotas_mora	= round((ldb_valor_cuotas_mora / gd_uf),4)
		ldb_vp						= round((ldb_vp / gd_uf),4)
	end if
	for ll_indi=1 to ll_plazo
		ldb_interes					= round((ldb_valor_presente * ldb_tasa),4)
		ldb_capital					= round((ldb_valor_presente + ldb_interes),4)
		ldb_valor_presente		= round((ldb_capital - ldb_valor_cuota),4)
		ldb_desa_capital			= round((ldb_valor_cuota - ldb_interes - ldb_gc),4)
		ldb_sum_gc					= round((ldb_sum_gc + ldb_gc),4)
		ldb_sum_interes			= round((ldb_sum_interes + ldb_interes),4)
		ldb_sum_capital			= round((ldb_sum_capital + ldb_desa_capital),4)
		ldb_sum_cuota				= round((ldb_sum_cuota + ldb_valor_cuota),4)
		if ll_indi > (ll_ctas_pag + ll_ctas_mora) then
			ldb_capital_pagado	= round((ldb_capital_pagado + ldb_desa_capital),4)
		elseif ll_indi<=ll_ctas_pag then
			ldb_cap_pag				= ldb_cap_pag + ldb_desa_capital
		end if
	next
	if isnull(ldb_cap_pag) then ldb_cap_pag=0
	if isnull(ldb_pie_pagado) then ldb_pie_pagado=0
	//ldb_tasa
	ldb_cap_pag						= double(ldb_cap_pag + ldb_pie_pagado)
	if ls_moneda='1' then
		dw_repacta.setitem(1,'capital_pagado',round(ldb_cap_pag * gd_uf,0))//,4
	else
		dw_repacta.setitem(1,'capital_pagado',ldb_cap_pag)
	end if
	SELECT	"TASA"."TASA_INT_P",   
				"TASA"."TASA_INT_UF"  
	INTO 		:ldb_tasa_peso,   
				:ldb_tasa_uf  
	FROM 		"TASA"  
	WHERE 	"TASA"."LOOK" = 1   
	USING		sqlca;
	if ls_moneda = "1" then //peso
		ldb_tasa_int				= ldb_tasa_peso
	else
		ldb_tasa_int				= ldb_tasa_uf
	end if
	ldb_capital_total_pagado	= ldb_cap_pag //ldb_capital_pagado 
	ii_dmora							= ll_dias_mora
	ll_interes_mora				= 0
	id_gc 							= 0
	id_im 							= 0
	ldb_interes_mora				= 0
	ii_mora_cobro 					= 1
	ii_inc_gastos 					= 1
	FOR i = 1 TO ll_ctas_mora 
		IF (ii_dmora - (i - 1) * 30) > 5 THEN 
			ii_mora_cobro			= (ii_dmora - (i - 1) * 30)
			id_im 					= id_im + gf_int_mora(ldb_tasa_int, ii_mora_cobro, ll_valor_cuota_peso)
			IF (ii_dmora - (i - 1) * 30) > 30 THEN 
				id_gc 				= id_gc + Round(ll_valor_cuota_peso * id_factor_gc, 0)
				ii_inc_gastos		= 1
			END IF
		END IF
	NEXT
	ll_mora							= ll_mora + id_im
	ll_interes_mora				= (id_gc + id_im)
	ldb_interes_mora				= round((ll_interes_mora / gd_uf),4)
//	ldb_valor_presente			= round((ldb_capital_total_pagado),4)
//	if ldb_valor_presente<=0 or isnull(ldb_valor_presente) 			then ldb_valor_presente=0
//	if ldb_valor_cuotas_mora<=0 or isnull(ldb_valor_cuotas_mora) 	then ldb_valor_cuotas_mora=0
//	if ldb_interes_mora<=0 or isnull(ldb_interes_mora) 				then ldb_interes_mora=0
//	dw_repacta.setitem(1,'valor_presente',ldb_valor_presente)
	ldb_valor_presente			= ldb_vp
	dw_repacta.setitem(1,'valor_presente',ldb_valor_pres_unico)//ldb_vp)
	dw_repacta.setitem(1,'valor_cuota_mora',ldb_valor_cuotas_mora)
	dw_repacta.setitem(1,'valor_interes_mora_total',ldb_interes_mora)
	dw_repacta.setitem(1,'valor_interes_mora_im',id_im)
	dw_repacta.setitem(1,'valor_interes_mora_gc',id_gc)
	dw_repacta.setitem(1,'nvo_plazo',12)
	dw_repacta.setitem(1,'nvo_pie',0)
	dw_repacta.setitem(1,'nvo_saldo',0)
	dw_repacta.object.t_34.text	= '(B)+(C)-(D)'
	dw_repacta.object.t_35.text	= '(B)+(C)-(D)'
	dw_repacta.setitem(1,'saldo_precio',ldb_valor_pres_unico + ldb_valor_cuotas_mora + ldb_interes_mora)
	dw_repacta.setitem(1,'saldo_insoluto',ldb_valor_pres_unico + ldb_valor_cuotas_mora + ldb_interes_mora)
	SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
	FROM 		interes_cuotas 
	WHERE 	nro_cuotas = 12;
	dw_repacta.accepttext()
	ls_moneda					= dw_repacta.getitemstring(1,'moneda')
	if ls_moneda = '0' then //UF
		dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
		dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
		ldb_gasto_adm			= 12 * id_factor_gc_nuevo
		dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
		ldb_saldo_precio		= dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm
		ldb_nva_valor_cuota	= ldb_saldo_precio * ldb_factor_uf
		dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
		dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
	else
		dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
		dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
		ldb_gasto_adm			= 12 * id_factor_gc_peso
		dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
		ldb_saldo_precio		= dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm
		ldb_nva_valor_cuota	= ldb_saldo_precio * ldb_factor_pesos
		dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
		dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
	end if
end if
SELECT	COUNT("DOCUMENTOS"."FOLIO")  
INTO 		:ll_count  
FROM 		"DOCUMENTOS",   
			"INGRESO"  
WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
		 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
		 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
		 ( "INGRESO"."BASE" = :gs_base ) AND  
		 ( "INGRESO"."SERIE" = :gs_serie ) AND  
		 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
		 ( "DOCUMENTOS"."ESTADO_CH" = 'P' ) ;
if ll_count>0 then
	DECLARE	x11 CURSOR FOR  	
	SELECT 	"DOCUMENTOS"."TIPO_COB",   
				"DOCUMENTOS"."FOLIO",   
				"DOCUMENTOS"."N_CHEQUE",   
				"DOCUMENTOS"."MONTO",   
				"DOCUMENTOS"."FECHA_VENC"  
	FROM 		"DOCUMENTOS",   
				"INGRESO"  
	WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
			 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
			 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
			 ( "INGRESO"."BASE" = :gs_base ) AND  
			 ( "INGRESO"."SERIE" = :gs_serie ) AND  
			 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
			 ( "DOCUMENTOS"."ESTADO_CH" = 'P' )   
	ORDER BY "DOCUMENTOS"."FECHA_PAGO" DESC,   
				"DOCUMENTOS"."FECHA_VENC" DESC  
	USING		SQLCA;
	open		x11;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			Fetch x11 into :ls_tipo_cob,:ll_folio,:ll_serie,:ll_monto,:ldt_fecha_venc;
			if ll_folio>0 then
				st_protesto.visible	= true
				if ll_count>1 then
					st_protesto.text	= 'Tiene Cheque(s) PROTESTADO 1º es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
				else
					st_protesto.text	= 'Tiene Cheque PROTESTADO el '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
				end if
				exit
			end if
			setnull(ll_folio)
		LOOP
	end if
	close x11;
end if

SELECT	COUNT("DOCUMENTOS"."FOLIO")  
INTO 		:ll_count  
FROM 		"DOCUMENTOS",   
			"INGRESO"  
WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
		 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
		 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
		 ( "INGRESO"."BASE" = :gs_base ) AND  
		 ( "INGRESO"."SERIE" = :gs_serie ) AND  
		 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
		 ( "DOCUMENTOS"."ESTADO_CH" = 'T' ) ;
if ll_count>0 then
	DECLARE	x22 CURSOR FOR  	
	SELECT 	"DOCUMENTOS"."TIPO_COB",   
				"DOCUMENTOS"."FOLIO",   
				"DOCUMENTOS"."N_CHEQUE",   
				"DOCUMENTOS"."MONTO",   
				"DOCUMENTOS"."FECHA_VENC"  
	FROM 		"DOCUMENTOS",   
				"INGRESO"  
	WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
			 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
			 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
			 ( "INGRESO"."BASE" = :gs_base ) AND  
			 ( "INGRESO"."SERIE" = :gs_serie ) AND  
			 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
			 ( "DOCUMENTOS"."ESTADO_CH" = 'T' )   
	ORDER BY "DOCUMENTOS"."FECHA_PAGO" DESC,   
				"DOCUMENTOS"."FECHA_VENC" DESC  
	USING		SQLCA;
	open		x22;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			Fetch x22 into :ls_tipo_cob,:ll_folio,:ll_serie,:ll_monto,:ldt_fecha_venc;
			if ll_folio>0 then
				st_castigado.visible	= True
				if ll_count>1 then
					st_castigado.text	= 'Tiene Cheque(s) CASTIGADO 1º es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
				else
					st_castigado.text	= 'Tiene Cheque CASTIGADO el '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
				end if
				exit
			end if
			setnull(ll_folio)
		LOOP
	end if
	close x22;
end if
dw_repacta.accepttext()
dw_seguro.settransobject(sqlca)
if gs_conexion = "Parque El Prado" then
	ll_tot_reg	= dw_seguro.retrieve(1,'P')
elseif gs_conexion = "Parque La Foresta" then
	ll_tot_reg	= dw_seguro.retrieve(11,'P')
elseif gs_conexion = "Parque Concepción" then
	ll_tot_reg	= dw_seguro.retrieve(801,'P')
end if
for ll_indi=1 to ll_tot_reg
	dw_seguro.setitem(ll_indi,'c_estado_reg',1)
next
dw_seguro.accepttext()
em_numero.triggerevent(modified!)
em_numero.setfocus()
end event

event mousemove;st_1.visible	= false
Double	ldb_suma
String		ls_moneda

dw_repacta.accepttext()
ls_moneda	= dw_repacta.getitemstring(1,'moneda')
if ls_moneda = '0' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total')
elseif ls_moneda='1' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total_peso')
end if
dw_repacta.setitem(1,'c_seg_adi',ldb_suma)
dw_repacta.accepttext()
end event

type dw_seguro from datawindow within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 2821
integer y = 28
integer width = 841
integer height = 396
integer taborder = 10
string dataobject = "dw_lista_seguro_seleccion_ctto"
boolean vscrollbar = true
boolean border = false
end type

event ue_mousemove;Double	ldb_suma
String		ls_moneda

dw_repacta.accepttext()
ls_moneda	= dw_repacta.getitemstring(1,'moneda')
if ls_moneda = '0' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total')
elseif ls_moneda='1' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total_peso')
end if
dw_repacta.setitem(1,'c_seg_adi',ldb_suma)
dw_repacta.accepttext()
end event

event itemchanged;Double	ldb_suma
String		ls_moneda

dw_repacta.accepttext()
ls_moneda	= dw_repacta.getitemstring(1,'moneda')
if ls_moneda = '0' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total')
elseif ls_moneda='1' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total_peso')
end if
dw_repacta.setitem(1,'c_seg_adi',ldb_suma)
dw_repacta.accepttext()
end event

event losefocus;Double	ldb_suma
String		ls_moneda

dw_repacta.accepttext()
ls_moneda	= dw_repacta.getitemstring(1,'moneda')
if ls_moneda = '0' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total')
elseif ls_moneda='1' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total_peso')
end if
dw_repacta.setitem(1,'c_seg_adi',ldb_suma)
dw_repacta.accepttext()
end event

type rb_normal from radiobutton within w_cuotas_pagare
boolean visible = false
integer x = 50
integer y = 64
integer width = 297
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Normal"
end type

event clicked;if this.checked=true then
	Long		ll_new,ll_dias_mora,ll_plazo,ll_ctas_mora,ll_ctas_pag,ll_valor_cuota_peso,ll_monto_pagado,&
				ll_indi,ii_dmora,ll_interes_mora,ii_mora_cobro,ii_inc_gastos,i,ll_mora,ll_count,&
				ll_folio,ll_serie,ll_monto
	Double	ldb_precio,ldb_pie,ll_pie_pagado_peso,ldb_valor_cuota,ldb_tasa,ldb_valor_cuotas_mora,&
				ldb_gasto_adb,ldb_uf_dia,ldb_monto_pagado_en_uf,ldb_pie_pagado,ldb_gc,ldb_valor_presente,&
				ldb_interes,ldb_capital,ldb_desa_capital,ldb_sum_gc,ldb_sum_interes,ldb_sum_capital,&
				ldb_sum_cuota,ldb_capital_pagado,ldb_cap_pag,ldb_capital_total_pagado,id_gc,id_im,&
				ldb_interes_mora,ldb_factor_pesos,ldb_factor_uf,ldb_tasa_peso,ldb_tasa_uf,ldb_tasa_int,&
				ldb_gasto_adm,ldb_saldo_precio,ldb_nva_valor_cuota,ldb_total_pagado
	String	ls_moneda,ls_tipo_cob,ls_estado_comi,ls_estado_comi_sup
	Datetime	ldt_fecha_promesa,ldt_fecha_pago,ldt_fecha_venc

	st_castigado.visible			= false
	st_protesto.visible			= false
	idt_fecha_hoy					= date(gdt_fec_sistema)
	id_factor_gc_nuevo			= f_factor_gasto_cobranza()
	SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
	id_factor_gc_peso				= f_factor_gasto_cobranza_peso()
	st_protesto.text				= ''
	st_castigado.text				= ''
	dw_ctto.reset()
	dw_repacta.reset()
	dw_ctto.retrieve(gs_serie,gi_numero)
	ll_new							= dw_repacta.insertrow(0)
	dw_repacta.scrolltorow(ll_new)
	dw_repacta.setitem(ll_new,'base','O')
	dw_repacta.setitem(ll_new,'serie','R')
	dw_repacta.setitem(ll_new,'base_original',gs_base)
	dw_repacta.setitem(ll_new,'serie_original',gs_serie)
	dw_repacta.setitem(ll_new,'numero_original',gi_numero)
	dw_repacta.setitem(ll_new,'uf_dia',gd_uf)
	dw_repacta.setitem(ll_new,'tipo_reprog','N')
	dw_repacta.setitem(ll_new,'fecha_crea',datetime(date(gdt_fec_sistema),time('00:00:00')))
	dw_repacta.setitem(ll_new,'moneda','0')
	em_pie_uf.enabled				= false
	em_pie_peso.enabled			= false
	em_pie_uf.visible				= true
	em_pie_uf.text					= ''
	em_pie_peso.visible			= true
	em_pie_peso.text				= ''
	em_saldo_uf.enabled			= false
	em_saldo_peso.enabled		= false
	em_saldo_uf.visible			= true
	em_saldo_uf.text				= ''
	em_saldo_peso.visible		= true
	em_saldo_peso.text			= ''
	if dw_ctto.rowcount()>0 then
		dw_repacta.setitem(ll_new,'cod_age',  dw_ctto.getitemstring(1,'oferta_v_cod_age'))
		dw_repacta.setitem(ll_new,'cod_sup',  dw_ctto.getitemstring(1,'oferta_v_cod_sup'))
		dw_repacta.setitem(ll_new,'cod_jefe', dw_ctto.getitemstring(1,'oferta_v_cod_jef'))
		dw_repacta.setitem(ll_new,'rut_ctto_original', dw_ctto.getitemnumber(1,'cliente_rut'))
		dw_repacta.setitem(ll_new,'dv_ctto_original' , dw_ctto.getitemstring(1,'cliente_dv'))
		ll_dias_mora				= dw_ctto.getitemnumber(1,'cadena_mora_dias_mora_cred')
		ldb_precio					= double(dw_ctto.getitemnumber(1,'pago_oferta_precio'))
		ldb_pie						= double(dw_ctto.getitemnumber(1,'pago_oferta_pie'))
		ll_pie_pagado_peso		= double(dw_ctto.getitemnumber(1,'pago_oferta_pie_pagado'))
		ls_moneda					= dw_ctto.getitemstring(1,'pago_oferta_moneda')
		ll_plazo						= dw_ctto.getitemnumber(1,'pago_oferta_nro_cuotas')
		ll_ctas_mora				= dw_ctto.getitemnumber(1,'cadena_mora_mora_cred')
		ll_ctas_pag					= dw_ctto.getitemnumber(1,'oferta_v_cta_pag_s')
		ldb_valor_cuota			= round(double(dw_ctto.getitemnumber(1,'pago_oferta_valor_cuota')),4)
		ldb_tasa						= (double(dw_ctto.getitemnumber(1,'pago_oferta_tasa')) / 100)
		ldt_fecha_promesa			= dw_ctto.getitemdatetime(1,'pago_oferta_fecha')
		ldb_valor_cuotas_mora	= round((ll_ctas_mora * ldb_valor_cuota),4)
		ll_valor_cuota_peso		= dw_ctto.getitemnumber(1,'c_valor_cuota_pesos')
		ldb_gasto_adb				= dw_ctto.getitemnumber(1,'pago_oferta_gastos_adm')
		ldb_total_pagado			= dw_ctto.getitemnumber(1,'oferta_v_tot_pagado')
		ls_estado_comi				= dw_ctto.getitemstring(1,'oferta_v_estado_comi')
		ls_estado_comi_sup		= dw_ctto.getitemstring(1,'oferta_v_estado_comi_sup')
		dw_repacta.setitem(ll_new,'estado','V')
		dw_repacta.setitem(ll_new,'moneda_original',ls_moneda)
		dw_repacta.setitem(ll_new,'dias_mora',ll_dias_mora)
		dw_repacta.setitem(ll_new,'cuotas_mora',ll_ctas_mora)
		dw_repacta.setitem(ll_new,'total_pagado_original',ldb_total_pagado)
		dw_repacta.setitem(ll_new,'estado_comi_age_original',ls_estado_comi)
		dw_repacta.setitem(ll_new,'estado_comi_sup_original',ls_estado_comi_sup)
		dw_repacta.setitem(ll_new,'usuario',gs_user)
		dw_repacta.setitem(ll_new,'precio_original',ldb_precio)
		dw_repacta.setitem(ll_new,'plazo_original',ll_plazo)
		dw_repacta.setitem(ll_new,'cuotas_pagadas_original',ll_ctas_pag)
		dw_repacta.setitem(ll_new,'valor_cuota_original',dw_ctto.getitemnumber(1,'pago_oferta_valor_cuota'))
		if ll_pie_pagado_peso>0 then
			DECLARE	x1 CURSOR FOR  
			SELECT 	"INGRESO"."FECHA_PAGO",   
						"INGRESO"."MONTO"  
			FROM 		"INGRESO"  
			WHERE  ( "INGRESO"."BASE" = :gs_base AND "INGRESO"."SERIE" = :gs_serie AND "INGRESO"."CONTRATO" = :gi_numero AND "INGRESO"."TIPO_MOV" = 'A' AND "INGRESO"."PAGO_HIST" = 'A') OR  
					 ( "INGRESO"."BASE" = :gs_base AND "INGRESO"."SERIE" = :gs_serie AND "INGRESO"."CONTRATO" = :gi_numero AND "INGRESO"."TIPO_MOV" = 'Q' AND "INGRESO"."PAGO_HIST" = 'A')   
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ldt_fecha_pago, :ll_monto_pagado;
					if not isnull(ldt_fecha_pago) and ll_monto_pagado>0 then
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_uf_dia  
						FROM 		"TAB_UF"  
						WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_pago   
						USING		sqlca ;
						if sqlca.sqlcode=0 and ldb_uf_dia>0 then
							ldb_monto_pagado_en_uf	= round((ll_monto_pagado / ldb_uf_dia),4)
							ldb_pie_pagado				= ldb_pie_pagado + ldb_monto_pagado_en_uf
						end if
					end if
					setnull(ldt_fecha_pago);setnull(ll_monto_pagado)
				LOOP
			end if
			close x1;
		else
			ldb_pie_pagado				= 0
		end if
		ldb_gc							= ldb_gasto_adb / ll_plazo
		ldb_valor_presente			= round(f_valor_presente(ldb_tasa,ll_plazo,ldb_valor_cuota),2)
		if ls_moneda='1' then //peso 
			ldb_gc						= round((ldb_gc / gd_uf),4)
			ldb_valor_presente		= round((ldb_valor_presente / gd_uf),4)
			ldb_valor_cuota			= round((ldb_valor_cuota / gd_uf),4)
			ldb_valor_cuotas_mora	= round((ldb_valor_cuotas_mora / gd_uf),4)
		end if
		for ll_indi=1 to ll_plazo
			ldb_interes					= round((ldb_valor_presente * ldb_tasa),4)
			ldb_capital					= round((ldb_valor_presente + ldb_interes),4)
			ldb_valor_presente		= round((ldb_capital - ldb_valor_cuota),4)
			ldb_desa_capital			= round((ldb_valor_cuota - ldb_interes - ldb_gc),4)
			ldb_sum_gc					= round((ldb_sum_gc + ldb_gc),4)
			ldb_sum_interes			= round((ldb_sum_interes + ldb_interes),4)
			ldb_sum_capital			= round((ldb_sum_capital + ldb_desa_capital),4)
			ldb_sum_cuota				= round((ldb_sum_cuota + ldb_valor_cuota),4)
			if ll_indi > (ll_ctas_pag + ll_ctas_mora) then
				ldb_capital_pagado	= round((ldb_capital_pagado + ldb_desa_capital),4)
			elseif ll_indi<=ll_ctas_pag then
				ldb_cap_pag				= ldb_cap_pag + ldb_desa_capital
			end if
		next
		ldb_cap_pag						= double(ldb_cap_pag + ldb_pie_pagado)
		if ls_moneda='1' then
			dw_repacta.setitem(1,'capital_pagado',round(ldb_cap_pag * gd_uf,0))//,4
		else
			dw_repacta.setitem(1,'capital_pagado',ldb_cap_pag)
		end if
		SELECT	"TASA"."TASA_INT_P",   
					"TASA"."TASA_INT_UF"  
		INTO 		:ldb_tasa_peso,   
					:ldb_tasa_uf  
		FROM 		"TASA"  
		WHERE 	"TASA"."LOOK" = 1   
		USING		sqlca;
		if ls_moneda = "1" then //peso
			ldb_tasa_int				= ldb_tasa_peso
		else
			ldb_tasa_int				= ldb_tasa_uf
		end if
		ldb_capital_total_pagado	= ldb_capital_pagado
		ii_dmora							= ll_dias_mora
		ll_interes_mora				= 0
		id_gc 							= 0
		id_im 							= 0
		ldb_interes_mora				= 0
		ii_mora_cobro 					= 1
		ii_inc_gastos 					= 1
		FOR i = 1 TO ll_ctas_mora 
			IF (ii_dmora - (i - 1) * 30) > 5 THEN 
				ii_mora_cobro			= (ii_dmora - (i - 1) * 30)
				id_im 					= id_im + gf_int_mora(ldb_tasa_int, ii_mora_cobro, ll_valor_cuota_peso)
				IF (ii_dmora - (i - 1) * 30) > 30 THEN 
					id_gc 				= id_gc + Round(ll_valor_cuota_peso * id_factor_gc, 0)
					ii_inc_gastos		= 1
				END IF
			END IF
		NEXT
		ll_mora							= ll_mora + id_im
		ll_interes_mora				= (id_gc + id_im)
		ldb_interes_mora				= round((ll_interes_mora / gd_uf),4)
		ldb_valor_presente			= round((ldb_capital_total_pagado),4)
//		if ldb_valor_presente<=0 or isnull(ldb_valor_presente) 			then ldb_valor_presente=0
//		if ldb_valor_cuotas_mora<=0 or isnull(ldb_valor_cuotas_mora) 	then ldb_valor_cuotas_mora=0
//		if ldb_interes_mora<=0 or isnull(ldb_interes_mora) 				then ldb_interes_mora=0
		dw_repacta.object.t_34.text	= '(B)+(C)-(D)'
		dw_repacta.object.t_35.text	= '(B)+(C)-(D)'
		dw_repacta.setitem(1,'valor_presente',ldb_valor_presente)
		dw_repacta.setitem(1,'valor_cuota_mora',ldb_valor_cuotas_mora)
		dw_repacta.setitem(1,'valor_interes_mora_total',ldb_interes_mora)
		dw_repacta.setitem(1,'valor_interes_mora_im',id_im)
		dw_repacta.setitem(1,'valor_interes_mora_gc',id_gc)
		dw_repacta.setitem(1,'nvo_plazo',12)
		dw_repacta.setitem(1,'nvo_pie',0)
		dw_repacta.setitem(1,'nvo_saldo',0)
		dw_repacta.setitem(1,'saldo_precio',ldb_valor_presente + ldb_valor_cuotas_mora + ldb_interes_mora)
		dw_repacta.setitem(1,'saldo_insoluto',ldb_valor_presente + ldb_valor_cuotas_mora + ldb_interes_mora)
		SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
		FROM 		interes_cuotas 
		WHERE 	nro_cuotas = 12;
		dw_repacta.accepttext()
		ls_moneda	= dw_repacta.getitemstring(1,'moneda')
		if ls_moneda = '0' then //UF
			dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
			dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
			ldb_gasto_adm			= 12 * id_factor_gc_nuevo
			dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
			ldb_saldo_precio		= dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm
			ldb_nva_valor_cuota	= ldb_saldo_precio * ldb_factor_uf
			dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
			dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
		else
			dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
			dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
			ldb_gasto_adm			= 12 * id_factor_gc_peso
			dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
			ldb_saldo_precio		= dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm
			ldb_nva_valor_cuota	= ldb_saldo_precio * ldb_factor_pesos
			dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
			dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
		end if
	end if
	SELECT	COUNT("DOCUMENTOS"."FOLIO")  
	INTO 		:ll_count  
	FROM 		"DOCUMENTOS",   
				"INGRESO"  
	WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
			 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
			 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
			 ( "INGRESO"."BASE" = :gs_base ) AND  
			 ( "INGRESO"."SERIE" = :gs_serie ) AND  
			 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
			 ( "DOCUMENTOS"."ESTADO_CH" = 'P' ) ;
	if ll_count>0 then
		DECLARE	x11 CURSOR FOR  	
		SELECT 	"DOCUMENTOS"."TIPO_COB",   
					"DOCUMENTOS"."FOLIO",   
					"DOCUMENTOS"."N_CHEQUE",   
					"DOCUMENTOS"."MONTO",   
					"DOCUMENTOS"."FECHA_VENC"  
		FROM 		"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :gs_base ) AND  
				 ( "INGRESO"."SERIE" = :gs_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'P' )   
		ORDER BY "DOCUMENTOS"."FECHA_PAGO" DESC,   
					"DOCUMENTOS"."FECHA_VENC" DESC  
		USING		SQLCA;
		open		x11;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				Fetch x11 into :ls_tipo_cob,:ll_folio,:ll_serie,:ll_monto,:ldt_fecha_venc;
				if ll_folio>0 then
					st_protesto.visible	= true
					if ll_count>1 then
						st_protesto.text	= 'Tiene Cheque(s) PROTESTADO 1º es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					else
						st_protesto.text	= 'Tiene Cheque PROTESTADO el '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					end if
					exit
				end if
				setnull(ll_folio)
			LOOP
		end if
		close x11;
	end if
	
	SELECT	COUNT("DOCUMENTOS"."FOLIO")  
	INTO 		:ll_count  
	FROM 		"DOCUMENTOS",   
				"INGRESO"  
	WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
			 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
			 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
			 ( "INGRESO"."BASE" = :gs_base ) AND  
			 ( "INGRESO"."SERIE" = :gs_serie ) AND  
			 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
			 ( "DOCUMENTOS"."ESTADO_CH" = 'T' ) ;
	if ll_count>0 then
		DECLARE	x22 CURSOR FOR  	
		SELECT 	"DOCUMENTOS"."TIPO_COB",   
					"DOCUMENTOS"."FOLIO",   
					"DOCUMENTOS"."N_CHEQUE",   
					"DOCUMENTOS"."MONTO",   
					"DOCUMENTOS"."FECHA_VENC"  
		FROM 		"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :gs_base ) AND  
				 ( "INGRESO"."SERIE" = :gs_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :gi_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'T' )   
		ORDER BY "DOCUMENTOS"."FECHA_PAGO" DESC,   
					"DOCUMENTOS"."FECHA_VENC" DESC  
		USING		SQLCA;
		open		x22;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				Fetch x22 into :ls_tipo_cob,:ll_folio,:ll_serie,:ll_monto,:ldt_fecha_venc;
				if ll_folio>0 then
					st_castigado.visible	= True
					if ll_count>1 then
						st_castigado.text	= 'Tiene Cheque(s) CASTIGADO 1º es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					else
						st_castigado.text	= 'Tiene Cheque CASTIGADO el '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					end if
					exit
				end if
				setnull(ll_folio)
			LOOP
		end if
		close x22;
	end if
	dw_repacta.accepttext()
	em_numero.triggerevent(modified!)
	em_numero.setfocus()
end if
end event

type cb_aceptar from commandbutton within w_cuotas_pagare
integer x = 27
integer y = 2044
integer width = 370
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reprogramar"
end type

event clicked;Long		ll_resp,ll_count,ll_max_corr,ll_res
String	ls_base,ls_serie,ls_cod_sol,ls_string,ls_base_rep,ls_serie_rep,ls_pasa,ls_modena,ls_pasa_10
Double	ldb_precio,ldb_der_esp,ldb_tot_pag,ldb_porce_10,ldb_nvo_pie,ldb_precio_calc,ldb_precio_ctto,&
			ldb_precio_calc_peso,ll_numero,ll_numero_rep

dw_repacta.setitem(1,'usuario',gs_user)
dw_repacta.accepttext()
if Double(em_numero.text) > 0 and em_numero.text <> '' and not isnull(em_numero.text) then
	ll_res					= 1
	ldb_precio_calc		= dw_repacta.getitemnumber(1,'saldo_precio')
	ldb_precio_ctto		= dw_ctto.getitemnumber(1,'pagare_kapital')
	ls_modena				= dw_ctto.getitemstring(1,'pagare_moneda')
	ldb_precio_calc_peso	= dw_repacta.getitemnumber(1,'saldo_precio_peso')
	if ls_modena='2' then //peso
		if ldb_precio_ctto <= ldb_precio_calc then
			ll_res				= messagebox("Advertencia","Recuerde SALDO PRECIO $ no debe ser Mayor al Precio ORIGINAL, desea Continuar ",exclamation!,YesNo!,2)
		end if
	else
		if ldb_precio_ctto <= ldb_precio_calc_peso then
			ll_res				= messagebox("Advertencia","Recuerde SALDO PRECIO U.F. no debe ser Mayor al Precio ORIGINAL, desea Continuar ",exclamation!,YesNo!,2)
		end if
	end if
	if ll_res = 1 then
		ls_pasa_10			= 'S'
		if ls_pasa_10='S' then
			ls_base		= dw_repacta.getitemstring(1,'base_original')
			ls_serie		= dw_repacta.getitemstring(1,'serie_original')
			ll_numero	= dw_repacta.getitemnumber(1,'numero_original')
			SELECT	max("SOL_RESCILIA_REPROG"."CORRELATIVO")  
			INTO 		:ll_max_corr  
			FROM 		"SOL_ESTATUS",   
						"SOL_RESCILIA_REPROG"  
			WHERE  ( "SOL_ESTATUS"."BASE" = "SOL_RESCILIA_REPROG"."BASE" ) and  
					 ( "SOL_ESTATUS"."SERIE" = "SOL_RESCILIA_REPROG"."SERIE" ) and  
					 ( "SOL_ESTATUS"."NUMERO" = "SOL_RESCILIA_REPROG"."NUMERO" ) and  
					 ( "SOL_ESTATUS"."CORRELATIVO" = "SOL_RESCILIA_REPROG"."CORRELATIVO" ) and  
					 ( "SOL_ESTATUS"."CODIGO_SOLICITUD" = '2' ) AND
					 ( "SOL_RESCILIA_REPROG"."BASE" = :ls_base ) AND  
					 ( "SOL_RESCILIA_REPROG"."SERIE" = :ls_serie ) AND  
					 ( "SOL_RESCILIA_REPROG"."NUMERO" = :ll_numero ) AND
					 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' )
			USING		sqlca;
			if ll_max_corr > 0 then
				ls_pasa 	= 'N'
			else
				ls_pasa 	= 'S'
			end if
			if ls_pasa='N' then
				messagebox("Advertencia","No es Posible Reprogramar por Encontrar ( "+string(ll_max_corr,"###,###")+ ' ) Solicitud de Resciliación por Reprogramación VIGENTE, asociada al Contrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###"))
			else
				if Double(em_numero.text) > 0 then
					dw_repacta.setitem(1,'numero',long(em_numero.text))
					dw_repacta.accepttext()
					if dw_repacta.update()=1 then
						commit;
						ls_cod_sol	= '2'
						ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+ls_cod_sol
						ll_resp		= messagebox("Grabar","Grabación Exitosa, desea Imprimir Reprogramación",Exclamation!,YesNo!,2)
						if ll_resp=1 then
							wf_print_repro()
							openwithparm(w_detalle_solicitudes,ls_string)
						else
							openwithparm(w_detalle_solicitudes,ls_string)
						end if
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				else
					messagebox("Advertencia","Para Reprogramar debe Ingresar Nº Promesa")
					em_numero.setfocus()
				end if
			end if
		end if
	end if
else
	messagebox("Advertencia","Para Reprogramar debe Ingresar Nº Promesa")
	em_numero.setfocus()
end if
end event

type em_numero from editmask within w_cuotas_pagare
integer x = 1234
integer y = 464
integer width = 389
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;Long		ll_cod_parque
String	ls_base,ls_serie,ls_estado,ls_moneda
Double	ll_numero
dw_repacta.accepttext()
ll_numero		= Double(This.text)
ls_base			= dw_repacta.getitemstring(1,'base')
ls_serie			= dw_repacta.getitemstring(1,'serie')
ls_moneda 		= dw_repacta.getitemstring(1,'moneda')
ll_cod_parque	= dw_ctto.getitemnumber(1,'cadena_cod_parque')
if ll_numero >= 0 then
	if dw_repacta.getitemnumber(1,'saldo_precio') = dw_repacta.getitemnumber(1,'saldo_insoluto') then
		if ls_moneda='1' then
			em_pie_peso.visible		= true
			em_pie_peso.enabled		= true
			em_pie_peso.text			= ''
			em_pie_uf.visible			= false
			em_pie_uf.enabled			= false
			em_pie_uf.text				= ''
			em_saldo_peso.visible	= true
			em_saldo_peso.enabled	= true
			em_saldo_peso.text		= ''
			em_saldo_uf.visible		= false
			em_saldo_uf.enabled		= false
			em_saldo_uf.text			= ''
		else
			em_pie_peso.visible		= false
			em_pie_peso.enabled		= false
			em_pie_peso.text			= ''
			em_pie_uf.visible			= true
			em_pie_uf.enabled			= true
			em_pie_uf.text				= ''
			em_saldo_peso.visible	= false
			em_saldo_peso.enabled	= false
			em_saldo_peso.text		= ''
			em_saldo_uf.visible		= true
			em_saldo_uf.enabled		= true
			em_saldo_uf.text			= ''
		end if
	end if
	SELECT	"ESTADO"."NOMBRE_ESTADO"  
	INTO 		:ls_estado  
	FROM 		"CADENA",   
				"ESTADO"  
	WHERE  ( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
			 (("CADENA"."CODIGO" = :ls_base ) AND  
			 ( "CADENA"."SERIE" = :ls_serie ) AND  
			 ( "CADENA"."NUMERO" = :ll_numero ) AND
			 ( "CADENA"."COD_PARQUE" = :ll_cod_parque ))   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_repacta.object.t_estado_dcto.text	= "Promesa DIGITADA, se encuentra en Estado "+ls_estado
		em_numero.text		= ''
		dw_repacta.setitem(1,'numero',0)
	else
		SELECT	"CD_ESTADO"."DESCRIPCION"  
		INTO 		:ls_estado  
		FROM 		"CD_FOLIO",   
					"CD_ESTADO"  
		WHERE  ( "CD_FOLIO"."ULT_ESTADO" = "CD_ESTADO"."CODIGO" ) and  
				 (("CD_FOLIO"."BASE" = :ls_base ) AND  
				 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
				 ( "CD_FOLIO"."NUMERO" = :ll_numero ) )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_repacta.object.t_estado_dcto.text	= ls_estado
		else
			dw_repacta.object.t_estado_dcto.text	= 'Promesa No Existe en Control Documentario'
			ll_numero										= 0
			em_numero.text									= ''
		end if
		dw_repacta.setitem(1,'numero',ll_numero)
	end if
	dw_repacta.accepttext()
end if
end event

type dw_print from datawindow within w_cuotas_pagare
boolean visible = false
integer x = 777
integer y = 2156
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_print_reprogramacion_credito"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 1838
integer y = 464
integer width = 1161
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "Doble Click para Asignar Valor Derecho Especial"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_1.visible	= false
end event

type st_protesto from statictext within w_cuotas_pagare
event ue_mousemoe pbm_mousemove
integer x = 27
integer y = 2132
integer width = 1810
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemoe;st_1.visible	= false
end event

type st_castigado from statictext within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 1865
integer y = 2132
integer width = 1810
integer height = 88
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_1.visible	= false
end event

type cb_2 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 2528
integer y = 2044
integer width = 219
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;String	ls_pasa_10,ls_modena
Double	ldb_precio,ldb_der_esp,ldb_tot_pag,ldb_porce_10,ldb_nvo_pie,ldb_precio_calc,ldb_precio_ctto,&
			ldb_precio_calc_peso
Long		ll_res

dw_repacta.accepttext()
ll_res					= 1
ldb_precio_calc		= dw_repacta.getitemnumber(1,'saldo_precio')
ldb_precio_ctto		= dw_ctto.getitemnumber(1,'pagare_kapital')
ls_modena				= dw_ctto.getitemstring(1,'pagare_moneda')
ldb_precio_calc_peso	= dw_repacta.getitemnumber(1,'saldo_precio_peso')
if ls_modena='2' then //peso
	if ldb_precio_ctto <= ldb_precio_calc then
		ll_res				= messagebox("Advertencia","Recuerde SALDO PRECIO $ no debe ser Mayor al Precio ORIGINAL, desea Continuar ",exclamation!,YesNo!,2)
	end if
else
	if ldb_precio_ctto <= ldb_precio_calc_peso then
		ll_res				= messagebox("Advertencia","Recuerde SALDO PRECIO U.F. no debe ser Mayor al Precio ORIGINAL, desea Continuar ",exclamation!,YesNo!,2)
	end if
end if
if ll_res = 1 then
	ls_pasa_10			= 'S'
	if ls_pasa_10='S' then
		if dw_repacta.getitemnumber(1,'numero_original')>0 then
			Open(w_vista_imprimir_reprogramacion)
		end if
	end if
end if
end event

type cb_ver_cuenta from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 421
integer y = 2372
integer width = 197
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta Ctte"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;IF gs_base <> "" AND gs_serie <> "" AND gi_numero > 0 THEN
	CHOOSE CASE gs_base
		CASE "O" 	// Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" 	// Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" 	// Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" 	// Contrato ISA
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" 	// Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" 	// Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria)
	END CHOOSE
END IF
end event

type cb_3 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 466
integer y = 2044
integer width = 187
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Interes"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_interes_cuota) then close(w_interes_cuota)
open(w_interes_cuota)
end event

type cb_4 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 658
integer y = 2044
integer width = 224
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&ntrato"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)
Open(w_datos_contrato_pagare)
end event

type cb_5 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 887
integer y = 2044
integer width = 325
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Beneficiarios"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_listado_beneficiarios) then close(w_listado_beneficiarios)
open(w_listado_beneficiarios)
end event

type cb_6 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 1445
integer y = 2044
integer width = 343
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Lista Repacta"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_listado_reprogramacion_credito_ctto) then close(w_listado_reprogramacion_credito_ctto)
open(w_listado_reprogramacion_credito_ctto)
end event

type cb_7 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 1792
integer y = 2044
integer width = 183
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cli&ente"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_datos_cliente) then close(w_datos_cliente)
open(w_datos_cliente)
end event

type cb_8 from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 1979
integer y = 2044
integer width = 265
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fallecidos"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_listado_fallecidos) then close(w_listado_fallecidos)
open(w_listado_fallecidos)
end event

type cb_pagare from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2249
integer y = 2044
integer width = 201
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Pagaré"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_ver_pagare) then close(w_ver_pagare)
open(w_ver_pagare)
end event

type cb_est_cheque from commandbutton within w_cuotas_pagare
integer x = 1216
integer y = 2044
integer width = 224
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&heques"
end type

event clicked;String	ls_string
if gi_rut>0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_consultar_estado_de_cheques) then close(w_consultar_estado_de_cheques)
	openwithparm(w_consultar_estado_de_cheques,ls_string)
end if
end event

type dw_ctto from datawindow within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 229
integer y = 28
integer width = 2587
integer height = 416
string title = "none"
string dataobject = "d_datos_cuenta_ci_pagare_1"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_1.visible	= true
Double	ldb_suma
String		ls_moneda

dw_repacta.accepttext()
ls_moneda	= dw_repacta.getitemstring(1,'moneda')
if ls_moneda = '0' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total')
elseif ls_moneda='1' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total_peso')
end if
dw_repacta.setitem(1,'c_seg_adi',ldb_suma)
dw_repacta.accepttext()
end event

type cb_cerrar from commandbutton within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 3429
integer y = 2044
integer width = 247
integer height = 84
integer taborder = 160
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;close(w_cuotas_pagare)
end event

type em_saldo_peso from editmask within w_cuotas_pagare
integer x = 2514
integer y = 1432
integer width = 475
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

event modified;Long		ll_plazo
String	ls_moneda
Double	ldb_nvo_pie,ldb_nvo_saldo,ldb_valor_presente,ldb_valor_mora,ldb_valor_interes_mora,&
			ldb_saldo_precio,ldb_factor_pesos,ldb_factor_uf,ldb_gasto_adm,ldb_nva_valor_cuota,&
			ldb_precio,ldb_der_esp,ldb_tot_pag,ldb_capital_new,ldb_calc_pie,ldb_pie_new

dw_repacta.AcceptText()
ll_plazo 					= dw_repacta.getitemnumber(1,'nvo_plazo')
ls_moneda 					= dw_repacta.getitemstring(1,'moneda')
ldb_nvo_pie					= dw_repacta.getitemnumber(1,'nvo_pie')
ldb_nvo_saldo				= Long(this.text)
if ls_moneda='0' and (ldb_nvo_saldo > 600 or ldb_nvo_saldo < -600) then
	messagebox("Advertencia","Recuerde que Valor Saldo debe Ingresarlo en UF")
	ldb_nvo_saldo			= 0
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
	this.text				= ''
else
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
end if
if ls_moneda='1' and (ldb_nvo_saldo > -600 and ldb_nvo_saldo < 600) then
	messagebox("Advertencia","Recuerde que Valor Saldo debe Ingresarlo en PESO")
	ldb_nvo_saldo			= 0
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
	this.text				= ''
else
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
end if
dw_repacta.accepttext()
if ls_moneda='1' then //peso
	ldb_nvo_pie				= round(ldb_nvo_pie / gd_uf,4)
	ldb_nvo_saldo			= round(ldb_nvo_saldo / gd_uf,4)
end if
ldb_valor_presente		= dw_repacta.getitemnumber(1,'valor_presente')
ldb_valor_mora				= dw_repacta.getitemnumber(1,'valor_cuota_mora')
ldb_valor_interes_mora	= dw_repacta.getitemnumber(1,'valor_interes_mora_total')
//if isnull(ldb_nvo_pie) or ldb_nvo_pie<=0  then ldb_nvo_pie=0
ldb_saldo_precio		= (ldb_valor_presente + ldb_valor_mora + ldb_valor_interes_mora + ldb_nvo_saldo) - ldb_nvo_pie
dw_repacta.setitem(1,'saldo_precio',ldb_saldo_precio)
dw_repacta.accepttext()
SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
FROM 		interes_cuotas 
WHERE 	nro_cuotas = :ll_plazo;
dw_repacta.accepttext()

if ls_moneda = '0' then //UF
	dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
	dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
	ldb_gasto_adm				= Round(ll_plazo * id_factor_gc_nuevo,4)
	dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
	ldb_saldo_precio		= Round(dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm,4)
	ldb_nva_valor_cuota		= Round(ldb_saldo_precio * ldb_factor_uf,4)
	dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
	dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
else
	dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
	dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
	ldb_gasto_adm				= Round(ll_plazo * id_factor_gc_peso,0)
	dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
	ldb_saldo_precio		= Round(dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm,0)
	ldb_nva_valor_cuota		= Round(ldb_saldo_precio * ldb_factor_pesos,0)
	dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
	dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
end if
dw_repacta.accepttext()
end event

type em_pie_peso from editmask within w_cuotas_pagare
integer x = 1568
integer y = 1432
integer width = 462
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0"
end type

event modified;Long		ll_plazo,ldb_porce_10,ll_resp
String	ls_moneda,ls_pasa,ls_moneda_ctto,ls_pasa_10
Double	ldb_nvo_pie,ldb_nvo_saldo,ldb_valor_presente,ldb_valor_mora,ldb_valor_interes_mora,&
			ldb_saldo_precio,ldb_factor_pesos,ldb_factor_uf,ldb_gasto_adm,ldb_nva_valor_cuota,&
			ldb_precio,ldb_der_esp,ldb_tot_pag,ldb_capital_new,ldb_calc_pie,ldb_pie_new

dw_repacta.AcceptText()
ls_pasa_10					= 'S'
ll_plazo 					= dw_repacta.getitemnumber(1,'nvo_plazo')
ls_moneda 					= dw_repacta.getitemstring(1,'moneda')
ldb_nvo_pie					= Long(this.text)
ldb_nvo_saldo				= dw_repacta.getitemnumber(1,'nvo_saldo')
if ldb_nvo_pie>0 then
	if ls_moneda='0' and ldb_nvo_pie > 600 then
		messagebox("Advertencia","Recuerde que Valor Pie debe Ingresarlo en UF")
		ldb_nvo_pie			= 0
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		this.text			= ''
		ls_pasa				= 'N'
	else
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		ls_pasa				= 'S'
	end if
	if ls_moneda='1' and ldb_nvo_pie < 600 then
		messagebox("Advertencia","Recuerde que Valor Pie debe Ingresarlo en PESO")
		ldb_nvo_pie			= 0
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		this.text			= ''
		ls_pasa				= 'N'
	else
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		ls_pasa				= 'S'
	end if
else
	ldb_nvo_pie			= 0
	dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
	this.text			= ''
	ls_pasa				= 'N'
end if
dw_repacta.accepttext()
if ls_pasa='S' then
	if ls_pasa_10='S' then
		if ls_moneda='1' then //peso
			ldb_nvo_pie			= round(ldb_nvo_pie / gd_uf,4)
			ldb_nvo_saldo		= round(ldb_nvo_saldo / gd_uf,4)
		end if
		ldb_valor_presente		= dw_repacta.getitemnumber(1,'valor_presente')
		ldb_valor_mora				= dw_repacta.getitemnumber(1,'valor_cuota_mora')
		ldb_valor_interes_mora	= dw_repacta.getitemnumber(1,'valor_interes_mora_total')
		ldb_saldo_precio			= (ldb_valor_presente + ldb_valor_mora + ldb_valor_interes_mora + ldb_nvo_saldo) - ldb_nvo_pie
		if rb_normal.checked=true then
			dw_repacta.setitem(1,'saldo_precio',ldb_saldo_precio)
		end if
		dw_repacta.accepttext()
		SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
		FROM 		interes_cuotas 
		WHERE 	nro_cuotas = :ll_plazo;
		dw_repacta.accepttext()
		
		if ls_moneda = '0' then //UF
			dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
			dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
			ldb_gasto_adm			= Round(ll_plazo * id_factor_gc_nuevo,4)
			dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
			ldb_saldo_precio	= Round(dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm,4)
			ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_uf,4)
			dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
			dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
		else
			dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
			dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
			ldb_gasto_adm	= Round(ll_plazo * id_factor_gc_peso,0)
			dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
			ldb_saldo_precio	= Round(dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm,0)
			ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_pesos,0)
			dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
			dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
		end if
	end if
	dw_repacta.accepttext()
end if
end event

type em_pie_uf from editmask within w_cuotas_pagare
integer x = 1568
integer y = 1432
integer width = 462
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0.0###"
end type

event modified;Long		ll_plazo,ll_resp
String	ls_moneda,ls_pasa,ls_moneda_ctto,ls_pasa_10
Double	ldb_nvo_pie,ldb_nvo_saldo,ldb_valor_presente,ldb_valor_mora,ldb_valor_interes_mora,&
			ldb_saldo_precio,ldb_factor_pesos,ldb_factor_uf,ldb_gasto_adm,	ldb_nva_valor_cuota,&
			ldb_porce_10,ldb_precio,ldb_der_esp,ldb_tot_pag,ldb_capital_new,ldb_calc_pie,ldb_pie_new

dw_repacta.AcceptText()
ls_pasa_10				= 'S'
ll_plazo 				= dw_repacta.getitemnumber(1,'nvo_plazo')
ls_moneda 				= dw_repacta.getitemstring(1,'moneda')
ldb_nvo_pie				= double(this.text)
ldb_nvo_saldo			= dw_repacta.getitemnumber(1,'nvo_saldo')
if ldb_nvo_pie>0 then
	if ls_moneda='0' and ldb_nvo_pie > 600 then
		messagebox("Advertencia","Recuerde que Valor Pie debe Ingresarlo en UF")
		ldb_nvo_pie		= 0
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		this.text		= ''
		ls_pasa			= 'N'
	else
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		ls_pasa			= 'S'
	end if
	if ls_moneda='1' and ldb_nvo_pie < 600 then
		messagebox("Advertencia","Recuerde que Valor Pie debe Ingresarlo en PESO")
		ldb_nvo_pie			= 0
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		this.text		= ''
		ls_pasa			= 'N'
	else
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		ls_pasa			= 'S'
	end if
else
	ldb_nvo_pie			= 0
	dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
	this.text			= ''
	ls_pasa				= 'S'
end if
dw_repacta.accepttext()
if ls_pasa='S' then

	if ls_pasa_10='S' then
		if ls_moneda='1' then //peso
			ldb_nvo_pie				= round(ldb_nvo_pie / gd_uf,4)
			ldb_nvo_saldo			= round(ldb_nvo_saldo / gd_uf,4)
		end if
		ldb_valor_presente		= dw_repacta.getitemnumber(1,'valor_presente')
		ldb_valor_mora				= dw_repacta.getitemnumber(1,'valor_cuota_mora')
		ldb_valor_interes_mora	= dw_repacta.getitemnumber(1,'valor_interes_mora_total')
		ldb_saldo_precio			= (ldb_valor_presente + ldb_valor_mora + ldb_valor_interes_mora + ldb_nvo_saldo) - ldb_nvo_pie
		if rb_normal.checked=true then
			dw_repacta.setitem(1,'saldo_precio',ldb_saldo_precio)
		end if
		dw_repacta.accepttext()
		SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
		FROM 		interes_cuotas 
		WHERE 	nro_cuotas = :ll_plazo;
		dw_repacta.accepttext()
		
		if ls_moneda = '0' then //UF
			dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
			dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
			ldb_gasto_adm	= Round(ll_plazo * id_factor_gc_nuevo,4)
			dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
			ldb_saldo_precio	= Round(dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm,4)
			ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_uf,4)
			dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
			dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
		else
			dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
			dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
			ldb_gasto_adm	= Round(ll_plazo * id_factor_gc_peso,0)
			dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
			ldb_saldo_precio	= Round(dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm,0)
			ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_pesos,0)
			dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
			dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
		end if
	end if
	dw_repacta.accepttext()
end if
end event

type dw_repacta from datawindow within w_cuotas_pagare
event ue_mousemove pbm_mousemove
integer x = 325
integer y = 464
integer width = 3054
integer height = 1556
integer taborder = 20
string title = "none"
string dataobject = "dw_repacta_credito"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_1.visible	= false
Double	ldb_suma
String		ls_moneda

dw_repacta.accepttext()
ls_moneda	= dw_repacta.getitemstring(1,'moneda')
if ls_moneda = '0' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total')
elseif ls_moneda='1' then
	ldb_suma	= dw_seguro.getitemnumber(1,'c_sum_total_peso')
end if
dw_repacta.setitem(1,'c_seg_adi',ldb_suma)
dw_repacta.accepttext()
end event

event itemchanged;String	ls_columna,ls_moneda,ls_moneda_ctto
Long		ll_plazo
Double	ll_numero
Double	ldb_factor_pesos,ldb_factor_uf,ldb_gasto_adm,ldb_saldo_precio,ldb_nva_valor_cuota,ldb_valor_cuota,&
			ldb_nvo_pie,ldb_nvo_saldo,ldb_valor_presente,ldb_valor_mora,ldb_valor_interes_mora,&
			ldb_der_esp,ldb_precio,ldb_pie_new,ldb_capital_new,ldb_calc_pie

dw_repacta.AcceptText()
ls_columna							= dwo.name
if ls_columna='moneda' or ls_columna='nvo_plazo' or ls_columna='nvo_pie' or &
	ls_columna='nvo_saldo' then
	if ls_columna='moneda' then
		ls_moneda 						= data
		if ls_moneda='1' then //peso
			em_pie_peso.visible		= true
			em_pie_peso.enabled		= true
			em_pie_peso.text			= ''
			em_pie_uf.visible			= false
			em_pie_uf.enabled			= false
			em_pie_uf.text				= ''
			em_saldo_peso.visible	= true
			em_saldo_peso.enabled	= true
			em_saldo_peso.text		= ''
			em_saldo_uf.visible		= false
			em_saldo_uf.enabled		= false
			em_saldo_uf.text			= ''
		else
			em_pie_peso.visible		= false
			em_pie_peso.enabled		= false
			em_pie_peso.text			= ''
			em_pie_uf.visible			= true
			em_pie_uf.enabled			= true
			em_pie_uf.text				= ''
			em_saldo_peso.visible	= false
			em_saldo_peso.enabled	= false
			em_saldo_peso.text		= ''
			em_saldo_uf.visible		= true
			em_saldo_uf.enabled		= true
			em_saldo_uf.text			= ''
		end if
		ll_plazo 						= dw_repacta.getitemnumber(1,'nvo_plazo')
		ldb_nvo_pie						= 0
		ldb_nvo_saldo					= 0
		dw_repacta.setitem(1,'nvo_pie',ldb_nvo_pie)
		dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
		dw_repacta.accepttext()
	elseif ls_columna='nvo_plazo' then
		ll_plazo 					= Long(data)
		ls_moneda 					= dw_repacta.getitemstring(1,'moneda')
		ldb_nvo_pie					= dw_repacta.getitemnumber(1,'nvo_pie')
		ldb_nvo_saldo				= dw_repacta.getitemnumber(1,'nvo_saldo')
	elseif ls_columna='nvo_pie' then
		ll_plazo 					= dw_repacta.getitemnumber(1,'nvo_plazo')
		ls_moneda 					= dw_repacta.getitemstring(1,'moneda')
		ldb_nvo_pie					= Long(data)
		ldb_nvo_saldo				= dw_repacta.getitemnumber(1,'nvo_saldo')
		if ls_moneda='0' and ldb_nvo_pie>600 then
			messagebox("Advertencia","Recuerde que Valor Pie debe Ingresarlo en UF")
			dw_repacta.setitem(1,'nvo_pie',0)
			dw_repacta.accepttext()
			dw_repacta.setfocus()
			dw_repacta.setcolumn('nvo_saldo')
		elseif ls_moneda='1' and ldb_nvo_pie<600 then
			messagebox("Advertencia","Recuerde que Valor Pie debe Ingresarlo en PESO")
			dw_repacta.setitem(1,'nvo_pie',0)
			dw_repacta.accepttext()
			dw_repacta.setfocus()
			dw_repacta.setcolumn('nvo_saldo')
		end if
	elseif ls_columna='nvo_saldo' then
		ll_plazo 					= dw_repacta.getitemnumber(1,'nvo_plazo')
		ls_moneda 					= dw_repacta.getitemstring(1,'moneda')
		ldb_nvo_pie					= dw_repacta.getitemnumber(1,'nvo_pie')
		ldb_nvo_saldo				= Long(data)
		if ls_moneda='0' and ldb_nvo_saldo>600 then
			messagebox("Advertencia","Recuerde que Valor Saldo2 debe Ingresarlo en UF")
			dw_repacta.setitem(1,'nvo_saldo',0)
			dw_repacta.accepttext()
			dw_repacta.setfocus()
			dw_repacta.setcolumn('nvo_pie')
		elseif ls_moneda='1' and ldb_nvo_saldo<600 then
			messagebox("Advertencia","Recuerde que Valor Saldo2 debe Ingresarlo en PESO")
			dw_repacta.setitem(1,'nvo_saldo',0)
			dw_repacta.accepttext()
			dw_repacta.setfocus()
			dw_repacta.setcolumn('nvo_pie')
		end if
	end if
	if ls_moneda='1' then //peso
		ldb_nvo_pie					= dw_repacta.getitemnumber(1,'c_valor_pie_contrario')
		ldb_nvo_saldo				= dw_repacta.getitemnumber(1,'c_valor_saldo_contrario')
	end if
	if rb_normal.checked=true then
		ldb_valor_presente			= dw_repacta.getitemnumber(1,'valor_presente')
		ldb_valor_mora					= dw_repacta.getitemnumber(1,'valor_cuota_mora')
		ldb_valor_interes_mora		= dw_repacta.getitemnumber(1,'valor_interes_mora_total')
		ldb_saldo_precio				= (ldb_valor_presente + ldb_valor_mora + ldb_valor_interes_mora + ldb_nvo_saldo) - ldb_nvo_pie
		dw_repacta.setitem(1,'saldo_precio',ldb_saldo_precio)
	end if
	dw_repacta.accepttext()
	SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
	FROM 		interes_cuotas 
	WHERE 	nro_cuotas = :ll_plazo;
	dw_repacta.accepttext()
	
	if ls_moneda = '0' then //UF
		dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
		dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
		ldb_gasto_adm			= Round(ll_plazo * id_factor_gc_nuevo,4)
		dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
		ldb_saldo_precio		= Round(dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm,4)
		ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_uf,4)
		dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
		dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
	else
		dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
		dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
		ldb_gasto_adm			= Round(ll_plazo * id_factor_gc_peso,0)
		dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
		ldb_saldo_precio		= Round(dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm,0)
		ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_pesos,0)
		dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
		dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
	end if
elseif ls_columna='numero' then
	ll_numero						= Double(data)
	ls_moneda 						= dw_repacta.getitemstring(1,'moneda')
	if ls_moneda='1' then
		em_pie_peso.visible		= true
		em_pie_peso.enabled		= true
		em_pie_peso.text			= ''
		em_pie_uf.visible			= false
		em_pie_uf.enabled			= false
		em_pie_uf.text				= ''
		em_saldo_peso.visible	= true
		em_saldo_peso.enabled	= true
		em_saldo_peso.text		= ''
		em_saldo_uf.visible		= false
		em_saldo_uf.enabled		= false
		em_saldo_uf.text			= ''
	else
		em_pie_peso.visible		= false
		em_pie_peso.enabled		= false
		em_pie_peso.text			= ''
		em_pie_uf.visible			= true
		em_pie_uf.enabled			= true
		em_pie_uf.text				= ''
		em_saldo_peso.visible	= false
		em_saldo_peso.enabled	= false
		em_saldo_peso.text		= ''
		em_saldo_uf.visible		= true
		em_saldo_uf.enabled		= true
		em_saldo_uf.text			= ''
	end if
end if
dw_repacta.accepttext()
end event

type em_saldo_uf from editmask within w_cuotas_pagare
integer x = 2514
integer y = 1432
integer width = 475
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,##0.0###"
end type

event modified;Long		ll_plazo
String	ls_moneda
Double	ldb_nvo_pie,ldb_nvo_saldo,ldb_valor_presente,ldb_valor_mora,ldb_valor_interes_mora,&
			ldb_saldo_precio,ldb_factor_pesos,ldb_factor_uf,ldb_gasto_adm,ldb_nva_valor_cuota,&
			ldb_precio,ldb_der_esp,ldb_tot_pag,ldb_capital_new,ldb_calc_pie,ldb_pie_new

dw_repacta.AcceptText()
ll_plazo 				= dw_repacta.getitemnumber(1,'nvo_plazo')
ls_moneda 				= dw_repacta.getitemstring(1,'moneda')
ldb_nvo_pie				= dw_repacta.getitemnumber(1,'nvo_pie')
ldb_nvo_saldo			= Double(this.text)
if ls_moneda='0' and (ldb_nvo_saldo > 600 or ldb_nvo_saldo < -600) then
	messagebox("Advertencia","Recuerde que Valor Saldo debe Ingresarlo en UF")
	ldb_nvo_saldo		= 0
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
	this.text			= ''
else
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
end if
if ls_moneda='1' and (ldb_nvo_saldo > -600 and ldb_nvo_saldo < 600) then
	messagebox("Advertencia","Recuerde que Valor Saldo debe Ingresarlo en PESO")
	ldb_nvo_saldo		= 0
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
	this.text			= ''
else
	dw_repacta.setitem(1,'nvo_saldo',ldb_nvo_saldo)
end if
dw_repacta.accepttext()
if ls_moneda='1' then //peso
	ldb_nvo_pie				= round(ldb_nvo_pie / gd_uf,4)
	ldb_nvo_saldo			= round(ldb_nvo_saldo / gd_uf,4)
end if
ldb_valor_presente		= dw_repacta.getitemnumber(1,'valor_presente')
ldb_valor_mora				= dw_repacta.getitemnumber(1,'valor_cuota_mora')
ldb_valor_interes_mora	= dw_repacta.getitemnumber(1,'valor_interes_mora_total')
//if isnull(ldb_nvo_pie) or ldb_nvo_pie<=0  then ldb_nvo_pie=0
ldb_saldo_precio		= (ldb_valor_presente + ldb_valor_mora + ldb_valor_interes_mora + ldb_nvo_saldo) - ldb_nvo_pie
dw_repacta.setitem(1,'saldo_precio',ldb_saldo_precio)
dw_repacta.accepttext()
SELECT	factor_pesos,factor_uf into :ldb_factor_pesos,:ldb_factor_uf 
FROM 		interes_cuotas 
WHERE 	nro_cuotas = :ll_plazo;
dw_repacta.accepttext()

if ls_moneda = '0' then //UF
	dw_repacta.setitem(1,'tasa_interes',ldb_factor_uf)
	dw_repacta.setitem(1,'interes_cuota',id_factor_gc_nuevo)//factor
	ldb_gasto_adm			= Round(ll_plazo * id_factor_gc_nuevo,4)
	dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
	ldb_saldo_precio	= Round(dw_repacta.getitemnumber(1,'saldo_precio') + ldb_gasto_adm,4)
	ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_uf,4)
	dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
	dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
else
	dw_repacta.setitem(1,'tasa_interes',ldb_factor_pesos)
	dw_repacta.setitem(1,'interes_cuota',id_factor_gc_peso)//factor
	ldb_gasto_adm		= Round(ll_plazo * id_factor_gc_peso,0)
	dw_repacta.setitem(1,'nvo_gasto_adm', ldb_gasto_adm)
	ldb_saldo_precio	= Round(dw_repacta.getitemnumber(1,'saldo_precio_peso') + ldb_gasto_adm,0)
	ldb_nva_valor_cuota	= Round(ldb_saldo_precio * ldb_factor_pesos,0)
	dw_repacta.setitem(1,'nvo_saldo_insoluto',ldb_saldo_precio)
	dw_repacta.setitem(1,'nvo_valor_cuota',ldb_nva_valor_cuota)
end if
dw_repacta.accepttext()

end event

