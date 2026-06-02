forward
global type w_calculo_dv from window
end type
type hpb_1 from hprogressbar within w_calculo_dv
end type
type cb_4 from commandbutton within w_calculo_dv
end type
type dw_2 from datawindow within w_calculo_dv
end type
type st_3 from statictext within w_calculo_dv
end type
type st_2 from statictext within w_calculo_dv
end type
type dw_1 from datawindow within w_calculo_dv
end type
type cb_3 from commandbutton within w_calculo_dv
end type
type st_1 from statictext within w_calculo_dv
end type
type cb_2 from commandbutton within w_calculo_dv
end type
type cb_1 from commandbutton within w_calculo_dv
end type
type p_1 from picture within w_calculo_dv
end type
type em_fecha_cierre from editmask within w_calculo_dv
end type
type gb_1 from groupbox within w_calculo_dv
end type
end forward

global type w_calculo_dv from window
integer x = 832
integer y = 360
integer width = 1271
integer height = 888
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
hpb_1 hpb_1
cb_4 cb_4
dw_2 dw_2
st_3 st_3
st_2 st_2
dw_1 dw_1
cb_3 cb_3
st_1 st_1
cb_2 cb_2
cb_1 cb_1
p_1 p_1
em_fecha_cierre em_fecha_cierre
gb_1 gb_1
end type
global w_calculo_dv w_calculo_dv

type variables
DataStore ids_1
end variables

forward prototypes
public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie)
end prototypes

public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie);//SELECT sum(MONTO),sum(CUOTAS_PAG)    
//	into :monto,:cuota
//FROM INGRESO       
//WHERE ( FECHA_PAGO <= :fecha) AND  
//		( SERIE = :serie ) AND  
//		( CONTRATO = :numero ) AND  
//		( BASE = 'O' ) AND       
//		(( TIPO_COB = 'CI' ) OR  
//		( TIPO_COB = 'CU' )) AND 
//		(( TIPO_MOV = 'E' ) OR   
//		( TIPO_MOV = 'A' ) OR    
//		( TIPO_MOV = 'K' ) OR    
//		( TIPO_MOV = 'S' )) AND  
//		( PAGO_HIST <> 'R' )     ;
//Return 1
setnull(monto)
setnull(cuota)
SELECT "FACTURA_OFERTA_INGRESO"."TOT_PAG"  ,
	    "FACTURA_OFERTA_INGRESO"."CTAS_PAG"  ,
	    "FACTURA_OFERTA_INGRESO"."PIE_PAG"
INTO :monto,:cuota,:pie 
FROM "FACTURA_OFERTA_INGRESO"  
WHERE ( "FACTURA_OFERTA_INGRESO"."BASE" ='O'  ) AND  
      ( "FACTURA_OFERTA_INGRESO"."SERIE" =:serie  ) AND  
      ( "FACTURA_OFERTA_INGRESO"."NUMERO" = :numero )  AND
      (( "FACTURA_OFERTA_INGRESO"."ESTADO" = 'N' )  OR
      ( "FACTURA_OFERTA_INGRESO"."ESTADO" = 'S' ))  ;
Return 1
end function

on w_calculo_dv.create
this.hpb_1=create hpb_1
this.cb_4=create cb_4
this.dw_2=create dw_2
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.gb_1=create gb_1
this.Control[]={this.hpb_1,&
this.cb_4,&
this.dw_2,&
this.st_3,&
this.st_2,&
this.dw_1,&
this.cb_3,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.p_1,&
this.em_fecha_cierre,&
this.gb_1}
end on

on w_calculo_dv.destroy
destroy(this.hpb_1)
destroy(this.cb_4)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.p_1)
destroy(this.em_fecha_cierre)
destroy(this.gb_1)
end on

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
select distinct sysdate into :gdt_tiempo_servidor from agentes;
em_fecha_cierre.text = string(date(gdt_tiempo_servidor),gs_formato_fecha)
this.title = gs_app_name
//dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
//dw_1.retrieve()
//dw_1.setsort('serie A,nro_oferta A')
//dw_1.sort()


ids_1 = Create DataStore
ids_1.DataObject = "dw_calculo_dv"
ids_1.SetTransObject(sqlca)
ids_1.retrieve()
ids_1.setsort('serie A,nro_oferta A')
ids_1.sort()
end event

type hpb_1 from hprogressbar within w_calculo_dv
integer x = 123
integer y = 432
integer width = 1047
integer height = 120
unsignedinteger maxposition = 100
integer setstep = 10
end type

type cb_4 from commandbutton within w_calculo_dv
integer x = 425
integer y = 856
integer width = 247
integer height = 108
integer taborder = 31
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;date fecha,fecha1


fecha = date('31/12/1999')
fecha1 = date('31/10/1999')
UPDATE "FACTURA_OFERTA"  
SET "FECHA_CIERRE" = :fecha
WHERE "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha1 ;
if sqlca.sqlcode=0 then
	commit ;
	
else
	messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
	ROLLBACK;

end if	
end event

type dw_2 from datawindow within w_calculo_dv
integer x = 1513
integer y = 88
integer width = 494
integer height = 360
integer taborder = 20
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

type st_3 from statictext within w_calculo_dv
integer x = 667
integer y = 296
integer width = 361
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_calculo_dv
integer x = 123
integer y = 308
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "N° de Registros  :"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_calculo_dv
integer x = 2016
integer y = 88
integer width = 878
integer height = 640
integer taborder = 50
boolean titlebar = true
string dataobject = "dw_calculo_p"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event doubleclicked;print()
end event

type cb_3 from commandbutton within w_calculo_dv
boolean visible = false
integer x = 489
integer y = 636
integer width = 311
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;OpenWithParm(w_imprime_saldo_dv, em_fecha_cierre.text)
end event

type st_1 from statictext within w_calculo_dv
integer x = 123
integer y = 176
integer width = 535
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Fecha de Cierre :"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_calculo_dv
integer x = 896
integer y = 636
integer width = 311
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_calculo_dv)
end event

type cb_1 from commandbutton within w_calculo_dv
integer x = 69
integer y = 636
integer width = 311
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Calcular"
end type

event clicked;long     	ll_indi,ll_nro_oferta,ll_cont,ll_malos,ll_ctas_pag_s,ll_nro_cuotas,&
			ll_cuotas_mora,ll_periodo,ll_p1,ll_p2,ll_count,ll_aux,ll_facturado,ll_ctas_pie_parc
double	gastos_adm,factor_gc,g_cobranza,valor_presente,&
			tasa,valor_cuota,saldo_insoluto,uf_dia,capital,&
			interes,uf_cierre,saldo_total,saldo_12,saldo_12_mas,&
			kcp,klp,icp,ilp,gccp,gclp,monto_mora,pie,monto,&
			cuota,pie_pac,pie_pag,precio,porce_venta,porce_sup,&
			comision,comprueba_saldo,existe,ldb_saldo_pie
datetime ldt_fecha_prim,ldt_fecha_ult
datetime ldt_fecha_cierre,ldt_fecha_vto,ldt_fecha_oferta
date		fecha
string   serie,moneda,base,fecha_of,estado_comi,age,estado_cadena
integer  ret, parque

setpointer(HourGlass!)
ldt_fecha_cierre = datetime(date(em_fecha_cierre.text),time('00:00:00'))
fecha			 = date(em_fecha_cierre.text)	
SELECT	count("FACTURA_OFERTA_DV"."NUMERO")  
INTO 		:existe  
FROM 		"FACTURA_OFERTA_DV"  
WHERE  ( "FACTURA_OFERTA_DV"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
       ( "FACTURA_OFERTA_DV"."BASE" = 'O' ) AND  
       ( "FACTURA_OFERTA_DV"."ESTADO" = 'D' )   ;
//if existe > 0 then
//	messagebox(gs_app_name,'No es posible procesar datos.~n~r~n~r~n~rDebe eliminar registros para hacerlo.',stopsign!)
//	return
//end if	
dw_2.retrieve(fecha)
uf_cierre 	= dw_2.getitemnumber(1,'valor_uf')
ret 			= messagebox(gs_app_name,'¿ Esta seguro que desea procesar saldos ?~n~r~n~r~n~r   El proceso tardará algunos minutos.~n~r'&
		,Question!,YesNoCancel! ,3)
if ret = 3 then 
	return
elseif ret = 2 then
	close(w_calculo)
	return
end if
if ids_1.rowcount() > 0 then
	hpb_1.minposition = 0
	hpb_1.maxposition = ids_1.rowcount()
	hpb_1.position = 0
	for ll_indi = 1 to ids_1.rowcount()
		setnull(ll_facturado)
		serie         = ids_1.getitemstring(ll_indi,'serie')
		ll_nro_oferta    = ids_1.getitemnumber(ll_indi,'nro_oferta')
		estado_cadena = f_estado_cadena('O', serie,ll_nro_oferta)
		wf_ingreso(date(ldt_fecha_cierre),serie,ll_nro_oferta,monto,cuota,pie)//-------------------------------------------------------------------------
		pie_pag = pie
		//----- calculo pie parcelado ---//
		SELECT 	"PAGO_OFERTA"."CTAS_PACTADAS_PIE"  
		INTO 		:ll_ctas_pie_parc  
		FROM 	"PAGO_OFERTA"  
		WHERE 	"PAGO_OFERTA"."SERIE" = :serie AND  
					"PAGO_OFERTA"."NRO_OFERTA" = :ll_nro_oferta;
		if isnull(ll_ctas_pie_parc) or ll_ctas_pie_parc = 0 then
			ldb_saldo_pie			= 0
		else
			ldb_saldo_pie			= f_calculo_pie_parce_fac('O', serie,ll_nro_oferta,date(ldt_fecha_cierre))
		end if	
		//----//
		if not isnull(cuota) then 
			pie_pac 				= ids_1.getitemnumber(ll_indi,'pie')
			moneda				= ids_1.getitemstring(ll_indi,'moneda')
			uf_dia				= ids_1.getitemnumber(ll_indi,'uf_dia')
			estado_comi			= ids_1.getitemstring(ll_indi,'estado_comi')
			precio				= ids_1.getitemnumber(ll_indi,'precio')
			if estado_comi = 'N' then
				porce_venta		= ids_1.getitemnumber(ll_indi,'porce_venta')
				porce_sup		= ids_1.getitemnumber(ll_indi,'porce_sup')
				comision			= (( precio * porce_venta ) / 100 ) + ((( precio * porce_sup ) / 100 ) * 2)
			elseif estado_comi = 'C'  or estado_comi = 'U' then
				porce_venta		= ids_1.getitemnumber(ll_indi,'porce_venta')
				porce_sup		= ids_1.getitemnumber(ll_indi,'porce_sup')
				comision			= (( precio * porce_sup ) / 100 ) * 2
			elseif estado_comi = 'P' OR estado_comi = 'S' then
				comision			= 0
			end if	
			fecha_of		   = string(ids_1.getitemdatetime(ll_indi,'fecha_of'),gs_formato_fecha)
			ldt_fecha_prim     = ids_1.getitemdatetime(ll_indi,'fecha_prim')
			ldt_fecha_ult      = ids_1.getitemdatetime(ll_indi,'fecha_ult')
			ll_ctas_pag_s     = cuota
			ll_nro_cuotas     = ids_1.getitemnumber(ll_indi,'nro_cuotas')
			ll_cuotas_mora    = funcion_mora_fac( ldt_fecha_prim,ll_ctas_pag_s,ll_nro_cuotas,fecha )
			if ll_cuotas_mora < 0 then ll_cuotas_mora = 0
			if estado_cadena = 'S' then ll_cuotas_mora = 0
			ll_periodo        = ll_nro_cuotas - ( ll_ctas_pag_s + ll_cuotas_mora )// <--------OJO-----<<
			if ll_periodo < 0 then ll_periodo = 0
//			if periodo     = 0 then periodo = nro_cuotas - ctas_pag_s// (?)
			gastos_adm     = ids_1.getitemnumber(ll_indi,'gastos_adm')
			factor_gc      = gastos_adm / ll_nro_cuotas
			g_cobranza     = ll_periodo * factor_gc
			tasa				= ids_1.getitemnumber(ll_indi,'tasa')
//-----------------------------------------dv-----------------------------------------------------
			if tasa > 0 then
				valor_cuota		= ids_1.getitemnumber(ll_indi,'valor_cuota')
				pie				= ids_1.getitemnumber(ll_indi,'pie')
				if ll_periodo > 0 then
					valor_presente = f_vp( ll_periodo, tasa, valor_cuota )
					capital        = valor_presente - g_cobranza
					interes			= ( valor_cuota * ll_periodo ) - valor_presente
					saldo_total		= ( valor_presente + interes ) +ldb_saldo_pie
					if moneda = '2' then
						saldo_total = saldo_total * uf_cierre
						capital     = capital * uf_cierre
						interes     = interes * uf_cierre
					end if
				else
					capital        = 0
					interes			= 0
					saldo_total		= 0
					g_cobranza     = 0
				end if
			else
				valor_cuota		= ids_1.getitemnumber(ll_indi,'valor_cuota')
				pie				= ids_1.getitemnumber(ll_indi,'pie')
				interes			= 0
				g_cobranza     = 0
				if moneda = '2' then
					saldo_total		= ((precio * uf_cierre) - monto) + ldb_saldo_pie
					capital        = (precio * uf_cierre) - monto
				else
					saldo_total		= (precio - monto) +ldb_saldo_pie
					capital        = precio - monto
				end if
			end if
//--------------------------------------------------------------------------------------------------------
			if ll_nro_cuotas <=  ll_ctas_pag_s then
				ldt_fecha_vto   = datetime(ldt_fecha_ult)
			else
				ldt_fecha_vto   = datetime(funcion_venc( ldt_fecha_prim , ll_ctas_pag_s ))
			end if
			if - daysafter (fecha,date(ldt_fecha_vto)) <= 5 then ll_cuotas_mora = 0
			monto_mora  = ll_cuotas_mora * valor_cuota
			if moneda = '2' then
				g_cobranza  = g_cobranza * uf_cierre
				monto_mora  = ll_cuotas_mora * valor_cuota * uf_cierre
				valor_cuota	= valor_cuota * uf_cierre
				pie_pac		= pie_pac * uf_dia
				comision		= comision * uf_cierre
				pie			= pie * uf_cierre
			end if
			if valor_presente <= 0 then
				capital     = 0
				interes     = 0
				g_cobranza  = 0
			end if
			if valor_presente <= 0 then
				saldo_total = 0;capital = 0;interes = 0;g_cobranza = 0
			end if	
			if ll_periodo > 12 then 
	//-------------------> largo plazo hasta 12 meses <-------------------
				saldo_12 = long((saldo_total/ll_periodo)*12)
				kcp		= long((capital/ll_periodo)*12)
				icp 		= long((interes/ll_periodo)*12)
				gccp 		= long((g_cobranza/ll_periodo)*12)
				if valor_presente <= 0 then
					saldo_12 = 0;kcp = 0;icp = 0;gccp = 0
				end if	
	//------------------- > largo plazo mas de 12 meses <-------------------
				saldo_12_mas = long((saldo_total/ll_periodo)*(ll_periodo -12))
				klp 			 = long((capital/ll_periodo)*(ll_periodo -12))
				ilp 			 = long((interes/ll_periodo)*(ll_periodo -12))
				gclp 			 = long((g_cobranza/ll_periodo)*(ll_periodo -12))
				if valor_presente <= 0 then
					saldo_12_mas = 0;klp = 0;ilp = 0;gclp = 0
				end if	
			elseif ll_periodo <= 12 then 
				saldo_12     = long(saldo_total)
				kcp          = long(capital)
				icp          = long(interes)
				gccp         = long(g_cobranza)
				saldo_12_mas = 0
				klp          = 0
				ilp          = 0
				gclp         = 0
			end if

//			Double	ldb_interes,ldb_capital,ldb_desa_capital,ldb_sum_gc,ldb_sum_interes,&
//						ldb_sum_capital,ldb_sum_cuota,ldb_capital_pagado,ldb_cap_pag
//			Long		ll_indi
//			for ll_indi=1 to nro_cuotas
//				ldb_interes					= round((valor_presente * tasa),4)
//				ldb_capital					= round((valor_presente + ldb_interes),4)
//				valor_presente				= round((ldb_capital - valor_cuota),4)
//				ldb_desa_capital			= round((valor_cuota - ldb_interes - g_cobranza),4)
//				ldb_sum_gc					= round((ldb_sum_gc + g_cobranza),4)
//				ldb_sum_interes			= round((ldb_sum_interes + ldb_interes),4)
//				ldb_sum_capital			= round((ldb_sum_capital + ldb_desa_capital),4)
//				ldb_sum_cuota				= round((ldb_sum_cuota + valor_cuota),4)
//				if ll_indi > (ctas_pag_s + cuotas_mora) then
//					ldb_capital_pagado	= round((ldb_capital_pagado + ldb_desa_capital),4)
//				elseif ll_indi<=ctas_pag_s then
//					ldb_cap_pag				= ldb_cap_pag + ldb_desa_capital
//				end if
//			next
			
			ll_facturado = long(( valor_cuota * ll_nro_cuotas ) + pie)
			ldt_fecha_oferta = datetime(date(fecha_of),time('00:00:00'))
			pie = long(pie_pac - pie_pag)
			if pie <= 10000 then pie = 0
			saldo_total     = long(saldo_total)
			capital         = long(capital)
			interes         = long(interes)
			g_cobranza      = long(g_cobranza)
			monto_mora      = long(monto_mora)
			valor_cuota	    = long(valor_cuota)
			pie_pac		    = long(pie_pac)
			saldo_total		 = ( capital + interes + g_cobranza) //nuevo
			SELECT "OFERTA_V"."COD_AGE"  
         INTO :age
         FROM "OFERTA_V"  
         WHERE ( "OFERTA_V"."SERIE" = :serie ) AND ( "OFERTA_V"."NRO_OFERTA" = nro_oferta ) ; 
			if age = 'C' then
				comision		    = 0
			else
				comision		    = long(comision)
			end if
			if ll_nro_cuotas  <=  ll_ctas_pag_s then
				saldo_total  = 0; saldo_12 = 0; saldo_12_mas = 0
				capital      = 0; kcp      = 0; klp          = 0
				interes      = 0; icp      = 0; ilp          = 0
				g_cobranza   = 0; gccp     = 0; gclp         = 0
			end if
			monto			    = long(monto)
			comprueba_saldo = long(( saldo_total - ( ll_facturado - monto )) + ( pie + monto_mora ))
			select distinct sysdate into :gdt_tiempo_servidor from agentes;
			parque = f_cadena_parque('O',serie,ll_nro_oferta)
			INSERT INTO "FACTURA_OFERTA_DV"  
					 ( "BASE","SERIE","NUMERO"   ,"FEC_OFE"    ,"MORA"      ,"SALDO_TOTAL" ,"SALDO_CP" ,"SALDO_LP"   ,"CAPITAL" ,"CAPITAL_CP" ,"CAPITAL_LP" ,"INTERES" ,"INTERES_CP" ,"INTERES_LP" ,"GC"       ,"GC_CP" ,"GC_LP" ,"FECHA_PRIM" ,"CTAS_PAG" ,"PLAZO"    ,"MONTO_MORA" ,"PIE"     ,"VALOR_CTA" ,"FACTURADO" ,"FECHA_UF","FECHA_CIERRE","MONEDA","VALOR_UF","ESTADO","FECHA_PROCESO"     ,"MORA_PIE","PIE_PAGADO","COMISIONES","TOTAL_PAGADO","COMPRUEBA_SALDO" ,"COD_PARQUE")  
			VALUES ( 'O'   ,:serie ,:ll_nro_oferta,:ldt_fecha_oferta,:ll_cuotas_mora,:saldo_total  ,:saldo_12  ,:saldo_12_mas,:capital  ,:kcp         ,:klp         ,:interes  ,:icp         ,:ilp         ,:g_cobranza,:gccp   ,:gclp   ,:ldt_fecha_prim  ,:ll_ctas_pag_s,:ll_nro_cuotas,:monto_mora  ,:pie_pac  ,:valor_cuota,:ll_facturado  ,NULL      ,:ldt_fecha_cierre ,:moneda ,:uf_cierre,'D'     ,:gdt_tiempo_servidor,:pie     ,:pie_pag     ,:comision   ,:monto        ,:comprueba_saldo  ,:parque     );
			if sqlca.sqlcode = 0 then
				commit;
				ll_cont ++
			else
				messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
				ROLLBACK;
				ll_malos ++
			end if	
		end if	
		ll_aux = ll_indi
		hpb_1.position = ll_aux
		st_3.text = string(ll_indi,'###,###,###,##0')+' '
	next
end if
setpointer(Arrow!)

//---------------------------------------------------------------------------
ll_cont  = 0
ll_malos = 0
setpointer(HourGlass!)
ldt_fecha_cierre = datetime(date(em_fecha_cierre.text),time('00:00:00'))
fecha			 = date(em_fecha_cierre.text)	
SELECT count("FACTURA_OFERTA_DV_M"."NUMERO")  
INTO :existe  
FROM "FACTURA_OFERTA_DV_M"  
WHERE ( "FACTURA_OFERTA_DV_M"."FECHA_CIERRE" = :ldt_fecha_cierre ) AND  
      ( "FACTURA_OFERTA_DV_M"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA_DV_M"."ESTADO" = 'D' )   ;
//if existe > 0 then
//	messagebox(gs_app_name,'No es posible procesar datos.~n~r~n~r~n~rDebe eliminar registros para hacerlo.',stopsign!)
//	return
//end if	
uf_cierre = dw_2.getitemnumber(1,'valor_uf')
if ids_1.rowcount() > 0 then
	hpb_1.minposition = 0
	hpb_1.maxposition = ids_1.rowcount()
	hpb_1.position = 0
	for ll_indi = 1 to ids_1.rowcount()
		setnull(ll_facturado)
		serie       = ids_1.getitemstring(ll_indi,'serie')
		ll_nro_oferta  = ids_1.getitemnumber(ll_indi,'nro_oferta')
		estado_cadena = f_estado_cadena('O', serie,ll_nro_oferta)
		wf_ingreso(date(ldt_fecha_cierre),serie,ll_nro_oferta,monto,cuota,pie)
		pie_pag = pie
		if not isnull(cuota) then 
			pie_pac 			= ids_1.getitemnumber(ll_indi,'pie')
			moneda			= ids_1.getitemstring(ll_indi,'moneda')
			uf_dia			= ids_1.getitemnumber(ll_indi,'uf_dia')
			estado_comi		= ids_1.getitemstring(ll_indi,'estado_comi')
			precio			= ids_1.getitemnumber(ll_indi,'precio')
			if estado_comi = 'N' then
				porce_venta		= ids_1.getitemnumber(ll_indi,'porce_venta')
				porce_sup		= ids_1.getitemnumber(ll_indi,'porce_sup')
				comision			= (( precio * porce_venta ) / 100 ) + ((( precio * porce_sup ) / 100 ) * 2)
			elseif estado_comi = 'C'  or estado_comi = 'U' then
				porce_venta		= ids_1.getitemnumber(ll_indi,'porce_venta')
				porce_sup		= ids_1.getitemnumber(ll_indi,'porce_sup')
				comision			= (( precio * porce_sup ) / 100 ) * 2
			elseif estado_comi = 'P' then
				comision			= 0
			end if	
			fecha_of		   = string(ids_1.getitemdatetime(ll_indi,'fecha_of'),gs_formato_fecha)
			ldt_fecha_prim     = ids_1.getitemdatetime(ll_indi,'fecha_prim')
			ldt_fecha_ult      = ids_1.getitemdatetime(ll_indi,'fecha_ult')
			ll_ctas_pag_s     = cuota
			ll_nro_cuotas     = ids_1.getitemnumber(ll_indi,'nro_cuotas')
			ll_cuotas_mora    = funcion_mora_fac( ldt_fecha_prim,ll_ctas_pag_s,ll_nro_cuotas,fecha )
			if ll_cuotas_mora < 0 then ll_cuotas_mora = 0
			if estado_cadena = 'S' then ll_cuotas_mora = 0
	 		ll_periodo        = ll_nro_cuotas
			gastos_adm     = ids_1.getitemnumber(ll_indi,'gastos_adm')
			factor_gc      = gastos_adm / ll_nro_cuotas
			g_cobranza     = ll_periodo * factor_gc
			tasa				= ids_1.getitemnumber(ll_indi,'tasa')
//-----------------------------------------dv_m-----------------------------------------------------
			if tasa > 0 then
				valor_cuota		= ids_1.getitemnumber(ll_indi,'valor_cuota')
				pie				= ids_1.getitemnumber(ll_indi,'pie')
				valor_presente = f_vp( ll_periodo, tasa, valor_cuota )
				capital        = valor_presente - g_cobranza
				interes			= ( valor_cuota * ll_periodo ) - valor_presente
				saldo_total		= ( valor_presente + interes )
				if moneda = '2' then
					saldo_total = (saldo_total * uf_cierre)
					capital     = capital * uf_cierre
					interes     = interes * uf_cierre
				end if
				saldo_total		= saldo_total + pie_pag
				capital		   = capital + pie_pag
			else
				valor_cuota		= ids_1.getitemnumber(ll_indi,'valor_cuota')
				pie				= ids_1.getitemnumber(ll_indi,'pie')
				interes			= 0
				g_cobranza     = 0
				if moneda = '2' then
					saldo_total		= (precio * uf_cierre)// - monto
					capital        = (precio * uf_cierre)// - monto
				else
					saldo_total		= precio// - monto
					capital        = precio// - monto
				end if
			end if
//--------------------------------------------------------------------------------------------------------
			if ll_nro_cuotas <=  ll_ctas_pag_s then
				ldt_fecha_vto   = datetime(ldt_fecha_ult)
			else
				ldt_fecha_vto   = datetime(funcion_venc( ldt_fecha_prim , ll_ctas_pag_s ))
			end if
			monto_mora  = ll_cuotas_mora * valor_cuota
			if moneda = '2' then
				g_cobranza  = g_cobranza * uf_cierre
				monto_mora  = ll_cuotas_mora * valor_cuota * uf_cierre
				valor_cuota	= valor_cuota * uf_cierre
				pie_pac		= pie_pac * uf_dia
				comision		= comision * uf_cierre
				pie			= pie * uf_cierre
			end if
			if valor_presente <= 0 then
				capital     = 0
				interes     = 0
				g_cobranza  = 0
			end if
			if valor_presente <= 0 then
					saldo_total = 0;capital = 0;interes = 0;g_cobranza = 0
			end if	
			if ll_periodo > 12 then 
	//-------------------> largo plazo hasta 12 meses <-------------------
				saldo_12 = long((saldo_total/ll_periodo)*12)
				kcp		= long((capital/ll_periodo)*12)
				icp 		= long((interes/ll_periodo)*12)
				gccp 		= long((g_cobranza/ll_periodo)*12)
				if valor_presente <= 0 then
					saldo_12 = 0;kcp = 0;icp = 0;gccp = 0
				end if	
	//------------------- > largo plazo mas de 12 meses <-------------------
				saldo_12_mas = long((saldo_total/ll_periodo)*(ll_periodo -12))
				klp 			 = long((capital/ll_periodo)*(ll_periodo -12))
				ilp 			 = long((interes/ll_periodo)*(ll_periodo -12))
				gclp 			 = long((g_cobranza/ll_periodo)*(ll_periodo -12))
				if valor_presente <= 0 then
					saldo_12_mas = 0;klp = 0;ilp = 0;gclp = 0
				end if	
			elseif ll_periodo <= 12 then 
				saldo_12     = long(saldo_total)
				kcp          = long(capital)
				icp          = long(interes)
				gccp         = long(g_cobranza)
				saldo_12_mas = 0
				klp          = 0
				ilp          = 0
				gclp         = 0
			end if
			ll_facturado = long(( valor_cuota * ll_nro_cuotas ) + pie)
			ldt_fecha_oferta = datetime(date(fecha_of),time('00:00:00'))
			pie = long(pie_pac - pie_pag)
			if pie <= 10000 then pie = 0
			saldo_total     = long(saldo_total)
			capital         = long(capital)
			interes         = long(interes)
			g_cobranza      = long(g_cobranza)
			monto_mora      = long(monto_mora)
			valor_cuota	    = long(valor_cuota)
			pie_pac		    = long(pie_pac)
			SELECT "OFERTA_V"."COD_AGE"  
         INTO :age
         FROM "OFERTA_V"  
         WHERE ( "OFERTA_V"."SERIE" = :serie ) AND ( "OFERTA_V"."NRO_OFERTA" = nro_oferta ) ; 
			if age = 'C' then
				comision		    = 0
			else
				comision		    = long(comision)
			end if
			monto			    = long(monto)
			comprueba_saldo = long(( saldo_total - ( ll_facturado - monto )) + ( pie + monto_mora ))
			select distinct sysdate into :gdt_tiempo_servidor from agentes;
			parque = f_cadena_parque('O',serie,ll_nro_oferta)
			INSERT INTO "FACTURA_OFERTA_DV_M"  
					 ( "BASE","SERIE","NUMERO"   ,"FEC_OFE"    ,"MORA"      ,"SALDO_TOTAL" ,"SALDO_CP" ,"SALDO_LP"   ,"CAPITAL" ,"CAPITAL_CP" ,"CAPITAL_LP" ,"INTERES" ,"INTERES_CP" ,"INTERES_LP" ,"GC"       ,"GC_CP" ,"GC_LP" ,"FECHA_PRIM" ,"CTAS_PAG" ,"PLAZO"    ,"MONTO_MORA" ,"PIE"     ,"VALOR_CTA" ,"FACTURADO" ,"FECHA_UF","FECHA_CIERRE","MONEDA","VALOR_UF","ESTADO","FECHA_PROCESO"     ,"MORA_PIE","PIE_PAGADO","COMISIONES","TOTAL_PAGADO","COMPRUEBA_SALDO","COD_PARQUE") 
			VALUES ( 'O'   ,:serie ,:ll_nro_oferta,:ldt_fecha_oferta,:ll_cuotas_mora,:saldo_total  ,:saldo_12  ,:saldo_12_mas,:capital  ,:kcp         ,:klp         ,:interes  ,:icp         ,:ilp         ,:g_cobranza,:gccp   ,:gclp   ,:ldt_fecha_prim  ,:ll_ctas_pag_s,:ll_nro_cuotas,:monto_mora  ,:pie_pac  ,:valor_cuota,:ll_facturado  ,NULL      ,:ldt_fecha_cierre ,:moneda ,:uf_cierre,'D'     ,:gdt_tiempo_servidor,:pie     ,:pie_pag     ,:comision   ,:monto        ,:comprueba_saldo ,:parque);
			if sqlca.sqlcode = 0 then
				commit;
				ll_cont ++
			else
				messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
				ROLLBACK;
				ll_malos ++
			end if	
		end if	
		ll_aux = ll_indi
		hpb_1.position = ll_aux
		st_3.text = string(ll_indi,'###,###,###,##0')+' '
	next
	messagebox(gs_app_name,'Proceso terminado :~r~n'+string(ll_cont,'###,###,##0')+' registros grabados con exito~r~n'+&
					'y '+string(ll_malos,'###,###,##0')+' registros con problemas.',information!)
end if
setpointer(Arrow!)
end event

type p_1 from picture within w_calculo_dv
event clicked pbm_bnclicked
integer x = 1038
integer y = 168
integer width = 82
integer height = 88
string picturename = "c:boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fecha_cierre.text)=-1 then 
	em_fecha_cierre.text=string(today(),gs_formato_fecha)
	em_fecha_cierre.setfocus()
	return
end if	
if em_fecha_cierre.text<>'00/00/0000' then
	ls_fecha = em_fecha_cierre.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fecha_cierre.text = Message.StringParm
end if	
end event

type em_fecha_cierre from editmask within w_calculo_dv
event modified pbm_enmodified
integer x = 667
integer y = 164
integer width = 361
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

event modified;//string fech
//long uf
//datetime fecha
//
//fech = em_fecha_cierre.text
//fecha = datetime(date(fech),time('23:59:59'))
//select valor_uf into :uf from tab_uf where fecha_uf=:fecha;
//CHOOSE CASE sqlca.sqlcode
//	case -1
//		messagebox(gs_app_name,sqlca.SQLErrText,information!)
//		RETURN
//	case 100	
//		messagebox(gs_app_name,'No existe valor de U.F. al dia '+em_fecha_cierre.text+'.~n~rFavor de avisar al administrador del sistemas',stopsign!)
//		RETURN
//END CHOOSE
end event

type gb_1 from groupbox within w_calculo_dv
integer x = 69
integer y = 48
integer width = 1138
integer height = 552
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Ofertas Devengadas"
end type

