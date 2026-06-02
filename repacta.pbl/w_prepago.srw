forward
global type w_prepago from window
end type
type cb_pagare from commandbutton within w_prepago
end type
type cb_3 from commandbutton within w_prepago
end type
type dw_3 from datawindow within w_prepago
end type
type dw_4 from datawindow within w_prepago
end type
type dw_2 from datawindow within w_prepago
end type
type dw_1 from datawindow within w_prepago
end type
type cb_1 from commandbutton within w_prepago
end type
type gb_1 from groupbox within w_prepago
end type
end forward

global type w_prepago from window
integer x = 832
integer y = 360
integer width = 3301
integer height = 1832
boolean titlebar = true
string title = "Prepagos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_pagare cb_pagare
cb_3 cb_3
dw_3 dw_3
dw_4 dw_4
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
gb_1 gb_1
end type
global w_prepago w_prepago

type variables
Double	id_factor_gc,id_gc,id_im,id_factor_gc_nuevo,id_factor_gc_peso
Date		idt_fecha_hoy
end variables

on w_prepago.create
this.cb_pagare=create cb_pagare
this.cb_3=create cb_3
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_pagare,&
this.cb_3,&
this.dw_3,&
this.dw_4,&
this.dw_2,&
this.dw_1,&
this.cb_1,&
this.gb_1}
end on

on w_prepago.destroy
destroy(this.cb_pagare)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;double 	nro,valor,valor_uf,ldb_precio,ldb_pie,ll_pie_pagado_peso,ldb_valor_cuota,&
			ldb_tasa,ldb_valor_cuotas_mora,ldb_gasto_adb,ldb_uf_promesa,ldb_precio_uf,&
			ldb_pie_uf,ldb_valor_ctas_mora_uf,ldb_uf_dia,ldb_monto_pagado_en_uf,ldb_pie_pagado,&
			ldb_gc,ldb_valor_presente,ldb_interes,ldb_capital,ldb_desa_capital,ldb_sum_gc,&
			ldb_sum_interes,ldb_sum_capital,ldb_sum_cuota,ldb_capital_pagado,ldb_cap_pag,&
			ldb_capital_total_pagado,ldb_interes_mora,ld_gasto,ldb_vp
string 	fecha,moneda,ls_moneda
integer 	cuotas,cuota,i,dmora
long 		gc_cuota,ll_dias_mora,ll_plazo,ll_ctas_mora,ll_ctas_pag,ll_valor_cuota_peso,&
			ll_monto_pagado,ll_indi,ii_dmora,ll_interes_mora,ii_mora_cobro,ii_inc_gastos,&
			ll_mora,ll_saldo
Datetime	ldt_fecha_promesa,ldt_fecha_pago

idt_fecha_hoy	= date(gdt_fec_sistema)
gf_centrar(w_prepago)
id_factor_gc_nuevo	= f_factor_gasto_cobranza()
SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
id_factor_gc_peso		= f_factor_gasto_cobranza_peso()
fecha 			= string(idt_fecha_hoy,gs_formato_fecha)
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve(gs_serie,gi_numero)
dw_3.SetTransObject(SQLCA)
dw_3.Retrieve(gs_serie,gi_numero)
gs_ventana		= 'w_prepago'
f_valida_objeto()
CHOOSE CASE gs_base
	CASE "O"
		dw_2.DataObject	= 'd_datos_cuenta_ci_oferta_1'
		dw_2.SetTransObject(SQLCA)
		dw_2.Retrieve(gs_serie,gi_numero)
		nro 					= dw_2.getitemnumber(1,'pago_oferta_nro_cuotas')
		valor 				= dw_2.getitemnumber(1,'pago_oferta_pie')
		dw_1.setitem(1,'nro_cuotas',nro)
		dw_1.setitem(1,'pie',valor)
	CASE "L"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_liberador_1'
		dw_2.SetTransObject(SQLCA)
		dw_2.Retrieve(gs_serie,gi_numero)
		nro 					= dw_2.getitemnumber(1,'pago_liberador_valor_cuota')
		valor 				= dw_2.getitemnumber(1,'pago_liberador_pie')
		dw_1.setitem(1,'nro_cuotas',nro)
		dw_1.setitem(1,'pie',valor)
	CASE "P"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_pagare_1'
		dw_2.SetTransObject(SQLCA)
		dw_2.Retrieve(gs_serie,gi_numero)
		nro 					= dw_2.getitemnumber(1,'pagare_valor_cuo')
		valor 				= dw_2.getitemnumber(1,'pagare_pie')
		dw_1.setitem(1,'nro_cuotas',nro)
		dw_1.setitem(1,'pie',valor)
	CASE "D"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_derecho_1'
		dw_2.SetTransObject(SQLCA)
		dw_2.Retrieve(gs_serie,gi_numero)
		nro 					= dw_2.getitemnumber(1,'derecho_valor_cuo')
		valor 				= dw_2.getitemnumber(1,'derecho_pie')
		dw_1.setitem(1,'nro_cuotas',nro)
		dw_1.setitem(1,'pie',valor)
END CHOOSE
dw_3.setitem(1,'nro_cuotas',nro)
dw_3.setitem(1,'pie',valor)
dw_4.DataObject 			= 'dw_uf'
dw_4.SetTransObject(SQLCA)
dw_4.Retrieve(date(fecha))
if dw_4.rowcount() > 0 then
	valor_uf 				= dw_4.getitemnumber(1,'valor_uf')
	dw_1.setitem(1,'ufs',valor_uf)
	dw_3.setitem(1,'ufs',valor_uf)
	cuotas 					= dw_1.getitemnumber(1,'nro_cuotas')
//	select factor_gc into :factor from interes_cuotas where nro_cuotas = :cuotas;
	dw_1.setitem(1,'int_cuota',id_factor_gc) //factor)
	dw_3.setitem(1,'int_cuota',id_factor_gc) //factor)
	moneda = dw_2.getitemstring(1,'pago_oferta_moneda')
	if moneda = '2' then
		dw_1.setitem(1,'tipo_calculo',0)
		dw_3.setitem(1,'tipo_calculo',0)		
		dw_1.Object.pie2.TabSequence 				= 20
		dw_1.Object.pie.TabSequence 				= 0
		dw_1.Object.saldo22.TabSequence 			= 30
		dw_1.Object.saldo2.TabSequence 			= 0
		ld_gasto											= id_factor_gc_nuevo
		dw_1.Object.pie.Background.Color 		= RGB(255,255,0)
		dw_1.Object.saldo2.Background.Color 	= RGB(255,255,0)
	elseif moneda = '1' then
		dw_1.setitem(1,'tipo_calculo',1)		
		dw_3.setitem(1,'tipo_calculo',1)		
		dw_1.Object.pie.TabSequence 				= 20
		dw_1.Object.pie2.TabSequence 				= 0
		dw_1.Object.saldo22.TabSequence 			= 0
		dw_1.Object.saldo2.TabSequence 			= 30
		ld_gasto											= id_factor_gc_peso
		dw_1.Object.pie2.Background.Color 		= RGB(255,255,0)
		dw_1.Object.saldo22.Background.Color	= RGB(255,255,0)
	end if	
	dw_1.setitem(1,'int_cuota',ld_gasto)
end if
dw_1.setitem(1,'pie',0)
dw_3.setitem(1,'pie',0)
cuota 			= dw_1.GetItemNumber(1,"c_cuotas_mora")
dmora 			= dw_1.GetItemNumber(1,"c_dias_mora")
for i=1 to cuota
	IF (dmora - (i - 1) * 30) > 30 THEN 
		gc_cuota 				= Round(dw_1.GetItemNumber(1,"gc_cuotas"), 0)
		id_gc    				= id_gc + Round(gc_cuota * id_factor_gc, 0)
	end if	
next
//dw_1.setitem(1,'gastos_cobranza',id_gc)
//dw_3.setitem(1,'gastos_cobranza',id_gc)
//dw_3.setitem(1,'vp',dw_1.GetItemNumber(1,'vp'))
ll_dias_mora					= dw_1.getitemnumber(1,'c_dias_mora')
ldb_precio						= double(dw_1.getitemnumber(1,'pago_oferta_precio'))
ldb_pie							= double(dw_1.getitemnumber(1,'pago_oferta_pie'))
ll_pie_pagado_peso			= double(dw_1.getitemnumber(1,'pago_oferta_pie_pagado'))
ls_moneda						= dw_1.getitemstring(1,'moneda')
ll_plazo							= dw_1.getitemnumber(1,'pago_oferta_nro_cuotas')
ll_ctas_mora					= dw_1.getitemnumber(1,'c_cuotas_mora')
ll_ctas_pag						= dw_1.getitemnumber(1,'oferta_v_cta_pag_s')
ldb_valor_cuota				= round(double(dw_1.getitemnumber(1,'pago_oferta_valor_cuota')),4)
ldb_tasa							= (double(dw_1.getitemnumber(1,'pago_oferta_tasa')) / 100)
ldt_fecha_promesa				= dw_1.getitemdatetime(1,'pago_oferta_fecha')
ldb_valor_cuotas_mora		= round((ll_ctas_mora * ldb_valor_cuota),4)
ll_valor_cuota_peso			= dw_1.getitemnumber(1,'c_valor_cuota_pesos')
ldb_gasto_adb					= dw_1.getitemnumber(1,'pago_oferta_gastos_adm')
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_uf_promesa  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_promesa   
USING		sqlca;
if sqlca.sqlcode=0 and ldb_uf_promesa>0 then
	if ls_moneda='1' then //peso
		ldb_precio_uf				= round((ldb_precio / ldb_uf_promesa),4)
		ldb_pie_uf					= round((ldb_pie / ldb_uf_promesa),4)
		ldb_precio					= ldb_precio_uf
		ldb_pie						= ldb_pie_uf
		ldb_valor_ctas_mora_uf	= round((ldb_valor_cuotas_mora / gd_uf),4)
		ldb_valor_cuotas_mora	= ldb_valor_ctas_mora_uf
	end if
end if
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
ll_saldo							= ll_plazo - (ll_ctas_pag + ll_ctas_mora)

ldb_valor_presente			= round(f_valor_presente(ldb_tasa,ll_plazo,ldb_valor_cuota),2)
//ldb_valor_presente			= round(f_valor_presente(ldb_tasa,ll_saldo,ldb_valor_cuota),2)
if ldb_valor_presente<0 then ldb_valor_presente=0
ldb_vp							= ldb_valor_presente
if ls_moneda='1' then //peso 
	ldb_gc						= round((ldb_gc / gd_uf),4)
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
	elseif ll_indi <= ll_ctas_pag then
		ldb_cap_pag				= ldb_cap_pag + ldb_desa_capital
	end if
next
ldb_cap_pag						= double(ldb_cap_pag + ldb_pie_pagado)
dw_2.object.t_cap_pag.text	= string(ldb_cap_pag,"###,###,###,###,###,##0.0###")
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
		id_im 					= id_im + gf_int_mora(dw_1.GetItemNumber(1,"c_tasa"), ii_mora_cobro, ll_valor_cuota_peso)
		IF (ii_dmora - (i - 1) * 30) > 30 THEN 
			id_gc 				= id_gc + Round(ll_valor_cuota_peso * id_factor_gc, 0) // PASA .1 A .05
			ii_inc_gastos		= 1
		END IF
	ELSE
		// id_gc = 0
		// id_im = 0
		// ii_mora_cobro 		= 0
	END IF
NEXT
ll_mora							= ll_mora + id_im
ll_interes_mora				= (id_gc + id_im)// * ii_inc_gastos//ll_gasto_cob + ll_mora
ldb_interes_mora				= round((ll_interes_mora / gd_uf),4)
ldb_valor_presente			= round((ldb_capital_total_pagado),4)//round((ldb_precio - ldb_capital_total_pagado),4)
		if ldb_valor_presente<=0 or isnull(ldb_valor_presente) 			then ldb_valor_presente=0
		if ldb_valor_cuotas_mora<=0 or isnull(ldb_valor_cuotas_mora) 	then ldb_valor_cuotas_mora=0
		if ldb_interes_mora<=0 or isnull(ldb_interes_mora) 				then ldb_interes_mora=0
		
dw_1.setitem(1,'vp',ldb_valor_presente)//ldb_vp)
if ls_moneda='1' then //peso 
	dw_1.setitem(1,'mora',round(ldb_valor_ctas_mora_uf * gd_uf,0))
else
	dw_1.setitem(1,'mora',round(ldb_valor_cuotas_mora * gd_uf,0))
end if
dw_1.setitem(1,'gastos_cobranza',id_gc)
dw_1.setitem(1,'interes_mora',id_im)
dw_3.setitem(1,'vp',ldb_valor_presente)//ldb_vp)
if ls_moneda='1' then //peso 
	dw_3.setitem(1,'mora',round(ldb_valor_ctas_mora_uf * gd_uf,0))
else
	dw_3.setitem(1,'mora',round(ldb_valor_cuotas_mora * gd_uf,0))
end if
dw_3.setitem(1,'gastos_cobranza',id_gc)
dw_3.setitem(1,'interes_mora',id_im)
dw_1.setitem(1,'s_g_m',1)
dw_3.setitem(1,'s_g_m',1)
dw_1.accepttext()
dw_3.accepttext()
dw_1.setfocus()
end event

type cb_pagare from commandbutton within w_prepago
event clicked pbm_bnclicked
integer x = 64
integer y = 1584
integer width = 347
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Pagaré"
end type

event clicked;open(w_ver_pagare)
end event

type cb_3 from commandbutton within w_prepago
integer x = 416
integer y = 1584
integer width = 347
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_3.rowcount() > 0 then
	f_Print( dw_3 )
else
	messagebox(gs_app_name,'No existen datos.',stopsign!)
end if	
end event

type dw_3 from datawindow within w_prepago
boolean visible = false
integer x = 1627
integer y = 1704
integer width = 517
integer height = 348
boolean titlebar = true
string dataobject = "dw_imprime_prepago_oferta"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_4 from datawindow within w_prepago
boolean visible = false
integer x = 901
integer y = 1696
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "dw_uf"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_2 from datawindow within w_prepago
integer x = 334
integer y = 108
integer width = 2501
integer height = 460
integer taborder = 10
string dataobject = "d_datos_cuenta_ci_oferta_1"
boolean border = false
boolean livescroll = true
end type

type dw_1 from datawindow within w_prepago
integer x = 119
integer y = 560
integer width = 3045
integer height = 964
integer taborder = 20
string dataobject = "d_encabezado_cuenta_cte_oferta_pre"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer 	interes,i
long		gc_cuota,cuota,dmora,ii_dmora,ll_ctas_mora,ll_valor_cuota_peso,ll_dias_mora,&
			ll_interes_mora,ii_mora_cobro,ii_inc_gastos
String	ls_columna

this.AcceptText()
ls_columna								= dwo.name
if ls_columna='s_g_m' then
	SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
	interes 								= long(data)
	if interes = 1 then
		dw_1.setitem(1,'gastos_cobranza',id_gc)
		dw_3.setitem(1,'gastos_cobranza',id_gc)
		dw_3.setitem(1,'interes_mora',id_im)
		dw_1.setitem(1,'interes_mora',id_im)
		dw_3.setitem(1,'s_g_m',1)
	else
		dw_1.setitem(1,'gastos_cobranza',0)
		dw_1.setitem(1,'interes_mora',0)
		dw_3.setitem(1,'gastos_cobranza',0)
		dw_3.setitem(1,'interes_mora',0)
		dw_3.setitem(1,'s_g_m',0)
	end if
	dw_1.accepttext()
	dw_3.accepttext()
end if
end event

type cb_1 from commandbutton within w_prepago
integer x = 2871
integer y = 1584
integer width = 347
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_prepago)
end event

type gb_1 from groupbox within w_prepago
integer x = 50
integer y = 44
integer width = 3177
integer height = 1492
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

