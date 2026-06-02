forward
global type w_cuotas_antigua from window
end type
type cb_est_cheque from commandbutton within w_cuotas_antigua
end type
type st_castigado from statictext within w_cuotas_antigua
end type
type st_protesto from statictext within w_cuotas_antigua
end type
type st_1 from statictext within w_cuotas_antigua
end type
type rb_peso from radiobutton within w_cuotas_antigua
end type
type rb_uf from radiobutton within w_cuotas_antigua
end type
type cb_pagare from commandbutton within w_cuotas_antigua
end type
type cb_8 from commandbutton within w_cuotas_antigua
end type
type cb_7 from commandbutton within w_cuotas_antigua
end type
type cb_6 from commandbutton within w_cuotas_antigua
end type
type cb_5 from commandbutton within w_cuotas_antigua
end type
type cb_4 from commandbutton within w_cuotas_antigua
end type
type cb_3 from commandbutton within w_cuotas_antigua
end type
type dw_2 from datawindow within w_cuotas_antigua
end type
type cb_ver_cuenta from commandbutton within w_cuotas_antigua
end type
type cb_2 from commandbutton within w_cuotas_antigua
end type
type cb_1 from commandbutton within w_cuotas_antigua
end type
type ln_1 from line within w_cuotas_antigua
end type
type dw_3 from datawindow within w_cuotas_antigua
end type
type dw_4 from datawindow within w_cuotas_antigua
end type
type dw_1 from datawindow within w_cuotas_antigua
end type
type gb_1 from groupbox within w_cuotas_antigua
end type
end forward

global type w_cuotas_antigua from window
integer x = 183
integer y = 48
integer width = 3296
integer height = 2360
boolean titlebar = true
string title = "Reprogramar Promesa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_est_cheque cb_est_cheque
st_castigado st_castigado
st_protesto st_protesto
st_1 st_1
rb_peso rb_peso
rb_uf rb_uf
cb_pagare cb_pagare
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
dw_2 dw_2
cb_ver_cuenta cb_ver_cuenta
cb_2 cb_2
cb_1 cb_1
ln_1 ln_1
dw_3 dw_3
dw_4 dw_4
dw_1 dw_1
gb_1 gb_1
end type
global w_cuotas_antigua w_cuotas_antigua

type variables
double 	id_vp,id_gto_cobranza,id_c_total_mora,id_vp_deuda,id_factor_gc,id_factor_gc_peso,&
			id_factor_gc_nuevo
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_dw ()
end prototypes

public subroutine wf_dw ();double pie,pie2


dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
end subroutine

on w_cuotas_antigua.create
this.cb_est_cheque=create cb_est_cheque
this.st_castigado=create st_castigado
this.st_protesto=create st_protesto
this.st_1=create st_1
this.rb_peso=create rb_peso
this.rb_uf=create rb_uf
this.cb_pagare=create cb_pagare
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_2=create dw_2
this.cb_ver_cuenta=create cb_ver_cuenta
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ln_1=create ln_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_est_cheque,&
this.st_castigado,&
this.st_protesto,&
this.st_1,&
this.rb_peso,&
this.rb_uf,&
this.cb_pagare,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.dw_2,&
this.cb_ver_cuenta,&
this.cb_2,&
this.cb_1,&
this.ln_1,&
this.dw_3,&
this.dw_4,&
this.dw_1,&
this.gb_1}
end on

on w_cuotas_antigua.destroy
destroy(this.cb_est_cheque)
destroy(this.st_castigado)
destroy(this.st_protesto)
destroy(this.st_1)
destroy(this.rb_peso)
destroy(this.rb_uf)
destroy(this.cb_pagare)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.cb_ver_cuenta)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ln_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;double 	nro,valor,valor_uf,id_im,valor_cuota,ld_gasto,pesos,uf,ldb_gc,&
			ldb_valor_cuota,ldb_precio,ldb_pie_pagado,ldb_gasto_cobranza,ldb_saldo_financiar,&
			ldb_tasa,ldb_valor_presente,ldb_interes,ldb_capital,ldb_desa_capital,&
			ldb_sum_gc,ldb_sum_interes,ldb_sum_capital,ldb_sum_cuota,&
			ldb_valor_cuotas_mora,ldb_capital_total_pagado,ldb_capital_pagado,ldb_uf_dia,&
			ldb_monto_pagado_en_uf,ldb_uf_promesa,ldb_pie,ldb_precio_uf,ldb_pie_uf,ldb_interes_mora,&
			ldb_valor_ctas_mora_uf,ldb_gasto_adb,ldb_cap_pag
string 	fecha,moneda,ls_moneda,ls_tipo_cob
integer 	cuotas
long 		cuota,dmora,i,gc_cuota,id_gc,ll_plazo,ll_indi,ll_ctas_mora,ll_ctas_pag,&
			ll_dias_mora,ii_dmora,ii_mora_cobro,ii_inc_gastos,ll_gasto_cob,ll_mora,&
			ll_interes_mora,ll_monto_pagado,ll_pie_pagado_peso,ll_valor_cuota_peso,&
			ll_count,ll_folio,ll_serie,ll_monto
Datetime	ldt_fecha_pago,ldt_fecha_promesa,ldt_fecha_venc


st_protesto.text	= ''
st_castigado.text	= ''
gf_centrar(w_cuotas)
idt_fecha_hoy						= date(gdt_fec_sistema)
id_factor_gc_nuevo				= f_factor_gasto_cobranza()
SELECT "TASA"."GASTO_COB_MORA" INTO :id_factor_gc FROM "TASA" WHERE "TASA"."LOOK" = 1 ;
id_factor_gc_peso					= f_factor_gasto_cobranza_peso()
fecha 								= string(idt_fecha_hoy,gs_formato_fecha)
gs_ventana							= 'w_cuotas'
f_valida_objeto()
st_1.visible						= false
dw_1.SetTransObject(SQLCA)
CHOOSE CASE gs_base
	CASE "O"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_oferta_1'
		dw_2.SetTransObject(SQLCA)
		if dw_2.Retrieve(gs_serie,gi_numero)>0 then
			nro 				= dw_2.getitemnumber(1,'pago_oferta_nro_cuotas')
			valor 			= dw_2.getitemnumber(1,'pago_oferta_pie')
			dw_1.setitem(1,'pie',valor)
		end if
	CASE "L"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_liberador_1'
		dw_2.SetTransObject(SQLCA)
		if dw_2.Retrieve(gs_serie,gi_numero)>0 then
			nro 				= dw_2.getitemnumber(1,'pago_liberador_valor_cuota')
			valor 			= dw_2.getitemnumber(1,'pago_liberador_pie')
			dw_1.setitem(1,'pie',valor)
		end if
	CASE "P"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_pagare_1'
		dw_2.SetTransObject(SQLCA)
		if dw_2.Retrieve(gs_serie,gi_numero)>0 then
			nro 				= dw_2.getitemnumber(1,'pagare_valor_cuo')
			valor 			= dw_2.getitemnumber(1,'pagare_pie')
			dw_1.setitem(1,'pie',valor)
		end if
	CASE "D"
		dw_2.DataObject 	= 'd_datos_cuenta_ci_derecho_1'
		dw_2.SetTransObject(SQLCA)
		if dw_2.Retrieve(gs_serie,gi_numero)>0 then
			nro 				= dw_2.getitemnumber(1,'derecho_valor_cuo')
			valor 			= dw_2.getitemnumber(1,'derecho_pie')
			dw_1.setitem(1,'pie',valor)
		end if
END CHOOSE
dw_2.accepttext()
if dw_1.Retrieve(gs_serie,gi_numero)>0 then
	dw_1.accepttext()
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
	ll_valor_cuota_peso			= dw_2.getitemnumber(1,'c_valor_cuota_pesos')
	ldb_gasto_adb					= dw_1.getitemnumber(1,'pago_oferta_gastos_adm')
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_promesa  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_promesa   
	USING		sqlca;
	if sqlca.sqlcode=0 and ldb_uf_promesa>0 then
		if ls_moneda='1' then //peso
//			ldb_precio					= round((ldb_precio / ldb_uf_promesa),4)
//			ldb_pie						= round((ldb_pie / ldb_uf_promesa),4)
//			ll_pie_pagado_peso		= round((ll_pie_pagado_peso / ldb_uf_promesa),4)
//			ldb_valor_cuota			= round((ldb_valor_cuota / ldb_uf_promesa),4)
//			ldb_valor_cuotas_mora	= round((ldb_valor_cuotas_mora / ldb_uf_promesa),4)
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
		dw_2.object.t_cap_pag.text	= string(round(ldb_cap_pag * gd_uf,4),"###,###,###,###,###,##0")
	else
		dw_2.object.t_cap_pag.text	= string(round(ldb_cap_pag * gd_uf,4),"###,###,###,###,###,##0")
		//string(ldb_cap_pag,"###,###,###,###,###,##0.0###")
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
			id_im 					= id_im + gf_int_mora(dw_1.GetItemNumber(1,"c_tasa"), ii_mora_cobro, ll_valor_cuota_peso)
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
	if ldb_valor_presente<=0 or isnull(ldb_valor_presente) 			then ldb_valor_presente=0
	if ldb_valor_cuotas_mora<=0 or isnull(ldb_valor_cuotas_mora) 	then ldb_valor_cuotas_mora=0
	if ldb_interes_mora<=0 or isnull(ldb_interes_mora) 				then ldb_interes_mora=0
	dw_1.setitem(1,'vp',ldb_valor_presente)
	dw_1.setitem(1,'gto_cobranza',ldb_valor_cuotas_mora)
	dw_1.setitem(1,'c_total_mora',ldb_interes_mora)
end if
dw_1.setitem(1,'nro_cuotas',12)
dw_4.DataObject 									= 'dw_uf'
dw_4.SetTransObject(SQLCA)
dw_4.Retrieve(date(fecha))
if dw_4.rowcount() > 0 then
	valor_uf 										= dw_4.getitemnumber(1,'valor_uf')
	dw_1.setitem(1,'ufs',valor_uf)
	cuotas 											= dw_1.getitemnumber(1,'nro_cuotas')
	select	factor_pesos,factor_uf into :pesos,:uf 
	from 		interes_cuotas 
	where 	nro_cuotas = :cuotas;
	dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
	dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
	moneda 											= dw_2.getitemstring(1,'pago_oferta_moneda')
	if moneda = '2' then //UF
		dw_1.setitem(1,'tipo_calculo',0)
		dw_1.Object.pie2.TabSequence 			= 20
		dw_1.Object.pie.TabSequence 			= 0
		dw_1.Object.saldo22.TabSequence 		= 30
		dw_1.Object.saldo2.TabSequence 		= 0
		dw_1.Object.pie.Background.Color 	= RGB(255,255,0)
		dw_1.Object.saldo2.Background.Color = RGB(255,255,0)
		ld_gasto										= id_factor_gc_nuevo
		rb_peso.checked							= false
		rb_uf.checked								= true
		dw_1.setitem(1,'tipo_calculo',0)
	elseif moneda = '1' then //Peso
		dw_1.setitem(1,'tipo_calculo',1)		
		dw_1.Object.pie.TabSequence 			= 20
		dw_1.Object.pie2.TabSequence 			= 0
		dw_1.Object.saldo22.TabSequence 		= 0
		dw_1.Object.saldo2.TabSequence 		= 30
		dw_1.Object.pie2.Background.Color 	= RGB(255,255,0)
		dw_1.Object.saldo22.Background.Color= RGB(255,255,0)
		ld_gasto										= id_factor_gc_peso
		rb_peso.checked							= true
		rb_uf.checked								= false
	end if	
	dw_1.setitem(1,'int_cuota',ld_gasto)
	dw_1.AcceptText()
end if
valor_cuota		= dw_1.GetItemNumber(1,"pago_oferta_valor_cuota")
cuota 			= dw_1.GetItemNumber(1,"c_cuotas_mora")
dmora 			= dw_1.GetItemNumber(1,"c_dias_mora")
for i=1 to cuota
	IF (dmora - (i - 1) * 30) > 30 THEN 
		id_im 	= id_im + gf_int_mora(dw_1.GetItemNumber(1,"tasa"), cuota,valor_cuota )
		gc_cuota = Round(dw_1.GetItemNumber(1,"gc_cuotas"), 0)
		id_gc    = id_gc + Round(gc_cuota * ld_gasto, 0)
	end if	
next
dw_1.setitem(1,'int',id_im)
dw_1.setitem(1,'pie',0)

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
				if ll_count>1 then
					st_protesto.text	= 'Tiene Cheque(s) PROTESTADO el Primero es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
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
				if ll_count>1 then
					st_castigado.text	= 'Tiene Cheque(s) CASTIGADO el Primero es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
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
dw_1.setitem(1,'moneda','2')
dw_1.accepttext()
dw_1.setfocus()
end event

event mousemove;st_1.visible						= false
end event

type cb_est_cheque from commandbutton within w_cuotas_antigua
integer x = 1134
integer y = 2016
integer width = 357
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Estado C&heque"
end type

event clicked;String	ls_string
if gi_rut>0 then
	ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)
	if isvalid(w_consultar_estado_de_cheques) then close(w_consultar_estado_de_cheques)
	openwithparm(w_consultar_estado_de_cheques,ls_string)
end if
end event

type st_castigado from statictext within w_cuotas_antigua
integer x = 1902
integer y = 2124
integer width = 910
integer height = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_protesto from statictext within w_cuotas_antigua
integer x = 1902
integer y = 2008
integer width = 910
integer height = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_1 from statictext within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 1920
integer y = 12
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

type rb_peso from radiobutton within w_cuotas_antigua
integer x = 155
integer y = 1476
integer width = 475
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calculo Pesos"
end type

event clicked;double 	factor,uf,pesos,pie,pp,ld_gasto
string 	oferta,tipo_moneda,ls_columna
long 		cuotas
dw_1.AcceptText()
cuotas 	= dw_1.getitemnumber(1,'nro_cuotas')
select	factor_pesos,factor_uf into :pesos,:uf 
from 		interes_cuotas 
where 	nro_cuotas = :cuotas;
dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
dw_1.setitem(1,'int_cuota',id_factor_gc_peso)//factor
dw_1.setitem(1,'tipo_calculo',1)
dw_1.AcceptText()
end event

type rb_uf from radiobutton within w_cuotas_antigua
integer x = 155
integer y = 1400
integer width = 439
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calculo U.F."
end type

event clicked;double 	factor,uf,pesos,pie,pp,ld_gasto
string 	oferta,tipo_moneda,ls_columna
long 		cuotas
dw_1.AcceptText()
cuotas 	= dw_1.getitemnumber(1,'nro_cuotas')
select	factor_pesos,factor_uf into :pesos,:uf 
from 		interes_cuotas 
where 	nro_cuotas = :cuotas;
dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
dw_1.setitem(1,'int_cuota',id_factor_gc_nuevo)//factor
dw_1.setitem(1,'tipo_calculo',0)
dw_1.AcceptText()
end event

type cb_pagare from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 1495
integer y = 2128
integer width = 357
integer height = 104
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Pagaré"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_ver_pagare) then close(w_ver_pagare)
open(w_ver_pagare)
end event

type cb_8 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 773
integer y = 2128
integer width = 357
integer height = 104
integer taborder = 80
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

type cb_7 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 411
integer y = 2128
integer width = 357
integer height = 104
integer taborder = 70
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

type cb_6 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 2128
integer width = 357
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Repacta"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_listado_repacta) then close(w_listado_repacta)
open(w_listado_repacta)
end event

type cb_5 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 773
integer y = 2016
integer width = 357
integer height = 104
integer taborder = 40
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

type cb_4 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 411
integer y = 2016
integer width = 357
integer height = 104
integer taborder = 30
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

event clicked;if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)
open(w_datos_contrato_oferta)
end event

type cb_3 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 50
integer y = 2016
integer width = 357
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Interes Cuota"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;if isvalid(w_interes_cuota) then close(w_interes_cuota)
open(w_interes_cuota)
end event

type dw_2 from datawindow within w_cuotas_antigua
event ue_mousemove pbm_dwnmousemove
integer x = 334
integer y = 80
integer width = 2459
integer height = 452
string dataobject = "d_datos_cuenta_ci_oferta_1"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_1.visible	= true
end event

event doubleclicked;Double	ldb_der_esp

ldb_der_esp	= round((dw_2.getitemnumber(1,'pago_oferta_des_esp') * gd_uf),2)
if ldb_der_esp>0 then
	dw_1.setitem(1,'saldo22',ldb_der_esp)
	dw_1.setitem(1,'saldo2',dw_2.getitemnumber(1,'pago_oferta_des_esp'))
//	if(moneda='2', saldo2  *  ufs ,saldo2  / ufs)
	dw_1.accepttext()
end if
end event

type cb_ver_cuenta from commandbutton within w_cuotas_antigua
event clicked pbm_bnclicked
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 64
integer y = 2400
integer width = 357
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Ctte."
end type

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

event ue_mousemove;st_1.visible	= false
end event

type cb_2 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 1134
integer y = 2128
integer width = 357
integer height = 104
integer taborder = 90
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

event clicked;integer	cuotas,tipo_c,moneda
double 	uf,pesos,i_uf,i_peso,ldb_cap_pag
string	oferta,mone
long 		pie,cuota,saldo
integer	tipo

SetPointer(HourGlass!)
cuota	= dw_1.getitemnumber(1,'nro_cuotas')
pie   = dw_1.getitemnumber(1,'pie')
saldo = dw_1.getitemnumber(1,'saldo2')
tipo 	= dw_1.getitemnumber(1,'tipo_calculo')
if not isnull(cuota) or cuota = 0 then
	dw_3.SetTransObject(SQLCA)
	ldb_cap_pag	= double(dw_2.object.t_cap_pag.text)
	if dw_3.Retrieve(gs_serie, gi_numero,ldb_cap_pag) > 0 then
		dw_3.setitem(1,'nro_cuotas',cuota)
		dw_3.setitem(1,'pie',pie)
		dw_3.setitem(1,'saldo2',saldo)
		dw_3.setitem(1,'tipo_calculo',tipo)
		dw_3.setitem(1,'ufs',dw_4.getitemnumber(1,'valor_uf'))
		dw_3.setitem(1,'int_cuota',dw_1.getitemnumber(1,'int_cuota'))
		dw_3.setitem(1,'nueva_cuota',dw_1.getitemnumber(1,'nueva_cuota'))
		dw_3.setitem(1,'nueva_cuota1',dw_1.getitemnumber(1,'nueva_cuota1'))
		dw_3.setitem(1,'vp',dw_1.getitemnumber(1,'vp'))
		dw_3.setitem(1,'gto_cobranza',dw_1.getitemnumber(1,'gto_cobranza'))
		dw_3.setitem(1,'c_total_mora',dw_1.getitemnumber(1,'c_total_mora'))
		dw_3.AcceptText()
		cuotas = dw_3.getitemnumber(1,'nro_cuotas')
		select factor_pesos,factor_uf into :pesos,:uf from interes_cuotas where nro_cuotas = :cuotas;
//		factor	= dw_1.getitemnumber(1,'tasa_gasto_cob_mora')
		if rb_uf.checked= true then
			dw_3.setitem(1,'int_cuota',id_factor_gc_nuevo)
		elseif rb_peso.checked= true then
			dw_3.setitem(1,'int_cuota',id_factor_gc_peso)
		end if
		dw_3.setitem(1,'moneda','2')
		dw_3.setitem(1,'interes_cuotas_factor_pesos',pesos)
		dw_3.setitem(1,'interes_cuotas_factor_uf',uf)
		dw_3.setitem(1,'pie',dw_1.getitemnumber(1,'pie'))
		dw_3.setitem(1,'pie2',dw_1.getitemnumber(1,'pie2'))
		dw_3.setitem(1,'saldo2',dw_1.getitemnumber(1,'saldo2'))
		dw_3.setitem(1,'saldo22',dw_1.getitemnumber(1,'saldo22'))
		select interes_pesos,interes_uf into :i_peso,:i_uf from interes_cuotas where nro_cuotas = :cuotas;
		dw_3.object.tasapeso.text	= string(i_peso,'###,###,##0.0###')
		dw_3.object.tasauf.text 	= string(i_uf,'###,###,##0.0###')
		dw_3.object.usuario.text 	= gs_nom_comp_usuario
		dw_3.AcceptText()
		
//		gs_datawindow_a_imprimir = 'd_encabezado_cuenta_cte_oferta_111'
//		Open(w_impresion_previa_de_ctta_ctes)
		
		f_Print( dw_3 )
//		dw_3.print()
	else
		messagebox('Error','No existen datos para esta oferta.',information!)
	end if	
else
	messagebox('Falta dato','Deeb ingresar el numero de cuotas.',information!)
end if
SetPointer(Arrow!)
end event

type cb_1 from commandbutton within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 2871
integer y = 2016
integer width = 357
integer height = 104
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_1.visible	= false
end event

event clicked;close(w_cuotas)
end event

type ln_1 from line within w_cuotas_antigua
integer linethickness = 5
integer beginx = 590
integer beginy = 692
integer endx = 919
integer endy = 980
end type

type dw_3 from datawindow within w_cuotas_antigua
boolean visible = false
integer x = 2341
integer y = 2056
integer width = 814
integer height = 540
boolean titlebar = true
string dataobject = "d_encabezado_cuenta_cte_oferta_111"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_4 from datawindow within w_cuotas_antigua
boolean visible = false
integer x = 1632
integer y = 2060
integer width = 658
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

type dw_1 from datawindow within w_cuotas_antigua
event keydown pbm_dwnkey
event ue_mousemove pbm_mousemove
integer x = 114
integer y = 532
integer width = 3040
integer height = 1436
integer taborder = 10
string dataobject = "d_encabezado_cuenta_cte_oferta_11"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_1.visible	= false
end event

event itemchanged;Long	 	pie,tipo_c,moneda,cuotas,saldo2
Double	ld_gasto,pesos,uf,ldb_uf
String	ls_columna

dw_1.AcceptText()
ls_columna	= dwo.name
moneda 		= dw_1.getitemnumber(1,'tipo_calculo')
cuotas 		= dw_1.getitemnumber(1,'nro_cuotas')
ldb_uf		= dw_1.getitemnumber(1,'ufs')
select	factor_pesos,factor_uf into :pesos,:uf 
from 		interes_cuotas 
where 	nro_cuotas = :cuotas
Using		sqlca;
if sqlca.sqlcode=0 then
	dw_1.setitem(1,'interes_cuotas_factor_pesos',pesos)
	dw_1.setitem(1,'interes_cuotas_factor_uf',uf)
	if moneda=0 then // calculo UF
		dw_1.setitem(1,'int_cuota',id_factor_gc_nuevo)//factor
		dw_1.setitem(1,'tipo_calculo',0)
	else
		dw_1.setitem(1,'int_cuota',id_factor_gc_peso)//factor
		dw_1.setitem(1,'tipo_calculo',1)
	end if
end if
dw_1.accepttext()


////////

if ls_columna = 'pie' then
	pie = getitemnumber(1,'pie')
	if pie > 100 and moneda = 0 then
	else
		dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
	end if	
elseif ls_columna = 'pie2' then
	dw_1.setitem(1,'pie',dw_1.getitemnumber(1,'pp1'))
elseif ls_columna = 'pie' then
	dw_1.setitem(1,'pie2',dw_1.getitemnumber(1,'pp'))
elseif ls_columna = 'saldo22' then
	dw_1.setitem(1,'saldo2',dw_1.getitemnumber(1,'ss1'))
elseif ls_columna = 'saldo2' then
	dw_1.setitem(1,'saldo22',dw_1.getitemnumber(1,'ss'))
end if	



////////


//if moneda=1 then //peso
//	if ls_columna = 'pie' then
//		pie = getitemnumber(1,'pie')
//		dw_1.setitem(1,'pie2', round(pie / ldb_uf,4))
//	elseif ls_columna = 'saldo2' then
//		saldo2 = getitemnumber(1,'saldo2')
//		dw_1.setitem(1,'saldo22', round(saldo2 / ldb_uf,4))
//	end if	
//elseif moneda=0 then //uf
//	if ls_columna = 'pie2' then
//		pie = getitemnumber(1,'pie2')
//		dw_1.setitem(1,'pie', round(pie * ldb_uf,4))
//	elseif ls_columna = 'saldo22' then
//		saldo2 = getitemnumber(1,'saldo22')
//		dw_1.setitem(1,'saldo2', round(saldo2 * ldb_uf,4))
//	end if	
//end if
dw_1.accepttext()
end event

event dberror;return 0
end event

event itemerror;return 0
end event

type gb_1 from groupbox within w_cuotas_antigua
event ue_mousemove pbm_mousemove
integer x = 55
integer y = 20
integer width = 3173
integer height = 1960
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = styleraised!
end type

event ue_mousemove;st_1.visible	= false
end event

