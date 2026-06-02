forward
global type w_calculo_nuevas_liberadores from window
end type
type cb_primera_fact from commandbutton within w_calculo_nuevas_liberadores
end type
type hpb_1 from hprogressbar within w_calculo_nuevas_liberadores
end type
type dw_2 from datawindow within w_calculo_nuevas_liberadores
end type
type st_3 from statictext within w_calculo_nuevas_liberadores
end type
type st_2 from statictext within w_calculo_nuevas_liberadores
end type
type dw_1 from datawindow within w_calculo_nuevas_liberadores
end type
type cb_3 from commandbutton within w_calculo_nuevas_liberadores
end type
type st_1 from statictext within w_calculo_nuevas_liberadores
end type
type cb_2 from commandbutton within w_calculo_nuevas_liberadores
end type
type cb_1 from commandbutton within w_calculo_nuevas_liberadores
end type
type p_1 from picture within w_calculo_nuevas_liberadores
end type
type em_fecha_cierre from editmask within w_calculo_nuevas_liberadores
end type
type gb_1 from groupbox within w_calculo_nuevas_liberadores
end type
end forward

global type w_calculo_nuevas_liberadores from window
integer x = 832
integer y = 360
integer width = 1294
integer height = 948
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_primera_fact cb_primera_fact
hpb_1 hpb_1
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
global w_calculo_nuevas_liberadores w_calculo_nuevas_liberadores

type variables

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
	    "FACTURA_OFERTA_INGRESO"."CTAS_PAG" ,
	    "FACTURA_OFERTA_INGRESO"."PIE_PAG"     
INTO :monto,:cuota ,:pie
FROM "FACTURA_OFERTA_INGRESO"  
WHERE ( "FACTURA_OFERTA_INGRESO"."BASE" ='L'  ) AND  
      ( "FACTURA_OFERTA_INGRESO"."SERIE" =:serie  ) AND  
      ( "FACTURA_OFERTA_INGRESO"."NUMERO" = :numero )  AND  
		("FACTURA_OFERTA_INGRESO"."ESTADO" ) ='N' ;
Return 1
end function

on w_calculo_nuevas_liberadores.create
this.cb_primera_fact=create cb_primera_fact
this.hpb_1=create hpb_1
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
this.Control[]={this.cb_primera_fact,&
this.hpb_1,&
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

on w_calculo_nuevas_liberadores.destroy
destroy(this.cb_primera_fact)
destroy(this.hpb_1)
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
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_1.retrieve()
dw_1.setsort('serie A,nro_oferta A')
dw_1.sort()
end event

type cb_primera_fact from commandbutton within w_calculo_nuevas_liberadores
integer x = 1673
integer y = 992
integer width = 590
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Fecha Factura"
end type

event clicked;string	ls_base,ls_serie
long		ll_numero,ll_new
datetime	ldt_fecha_cierre
double	ldb_porcentaje

ldt_fecha_cierre										= datetime(date(em_fecha_cierre.text),time('00:00:00'))
DECLARE x1 CURSOR FOR
SELECT	"FACTURA_OFERTA"."BASE",	"FACTURA_OFERTA"."SERIE",	"FACTURA_OFERTA"."NUMERO",	"FACTURA_OFERTA"."PORCENTAJE_PAGO"  
FROM		"FACTURA_OFERTA",	"CADENA"  
WHERE 	( "FACTURA_OFERTA"."BASE" = "CADENA"."CODIGO" ) and  
			( "FACTURA_OFERTA"."NUMERO" = "CADENA"."NUMERO" ) and  
			( "FACTURA_OFERTA"."SERIE" = "CADENA"."SERIE" ) and 
			( "FACTURA_OFERTA"."BASE" = 'L' ) AND  
			( "FACTURA_OFERTA"."ESTADO" = 'N' ) AND
			( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fecha_cierre) AND
			( "CADENA"."FECHA_PRIM_FACTURA" is null)
ORDER BY	"FACTURA_OFERTA"."NUMERO" DESC
USING		sqlca;
open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ldb_porcentaje;
			if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 then
				UPDATE	"CADENA"  
				SET		"FECHA_PRIM_FACTURA" = :ldt_fecha_cierre  
				WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
							( "CADENA"."SERIE" = :ls_serie ) AND  
							( "CADENA"."NUMERO" = :ll_numero )
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					commit using Trans_1;
				else
					rollback using Trans_1;
					messagebox("Error Grabar","Error al Grabar SQL: "+Trans_1.sqlerrtext)
				end if
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ll_numero)
		LOOP
	end if
close x1;

DECLARE x2 CURSOR FOR
SELECT	"FACTURA_OFERTA"."BASE",	"FACTURA_OFERTA"."SERIE",	"FACTURA_OFERTA"."NUMERO",	"FACTURA_OFERTA"."PORCENTAJE_PAGO"  
FROM		"FACTURA_OFERTA",	"CADENA"  
WHERE 	( "FACTURA_OFERTA"."BASE" = "CADENA"."CODIGO" ) and  
			( "FACTURA_OFERTA"."NUMERO" = "CADENA"."NUMERO" ) and  
			( "FACTURA_OFERTA"."SERIE" = "CADENA"."SERIE" ) and 
			( "FACTURA_OFERTA"."BASE" = 'L' ) AND  
			( "FACTURA_OFERTA"."ESTADO" = 'N' ) AND
			( "FACTURA_OFERTA"."SALDO_TOTAL" = 0 ) AND
			( "FACTURA_OFERTA"."FECHA_CIERRE" = :ldt_fecha_cierre) AND
			( "CADENA"."FECHA_TERMINO_PAGO" is null)
ORDER BY	"FACTURA_OFERTA"."NUMERO" DESC
USING		sqlca;
open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x2 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ldb_porcentaje;
			if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 then
				UPDATE	"CADENA"  
				SET		"FECHA_TERMINO_PAGO" = :ldt_fecha_cierre  
				WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
							( "CADENA"."SERIE" = :ls_serie ) AND  
							( "CADENA"."NUMERO" = :ll_numero )
				USING		Trans_1;
				if Trans_1.sqlcode=0 then
					commit using Trans_1;
				else
					rollback using Trans_1;
					messagebox("Error Grabar","Error al Grabar SQL: "+Trans_1.sqlerrtext)
				end if
			end if
			setnull(ls_base);setnull(ls_serie);setnull(ll_numero)
		LOOP
	end if
close x2;
end event

type hpb_1 from hprogressbar within w_calculo_nuevas_liberadores
integer x = 110
integer y = 436
integer width = 1061
integer height = 116
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_2 from datawindow within w_calculo_nuevas_liberadores
integer x = 1321
integer y = 856
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

type st_3 from statictext within w_calculo_nuevas_liberadores
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

type st_2 from statictext within w_calculo_nuevas_liberadores
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

type dw_1 from datawindow within w_calculo_nuevas_liberadores
integer x = 1289
integer y = 84
integer width = 1385
integer height = 656
integer taborder = 50
boolean titlebar = true
string dataobject = "dw_calculo_nuevos_liberador"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;print()
end event

type cb_3 from commandbutton within w_calculo_nuevas_liberadores
boolean visible = false
integer x = 489
integer y = 628
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

event clicked;OpenWithParm(w_imprime_saldo_nueva_liberadores, em_fecha_cierre.text)
end event

type st_1 from statictext within w_calculo_nuevas_liberadores
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

type cb_2 from commandbutton within w_calculo_nuevas_liberadores
integer x = 896
integer y = 628
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

event clicked;close(w_calculo_nuevas_liberadores)
end event

type cb_1 from commandbutton within w_calculo_nuevas_liberadores
integer x = 69
integer y = 628
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

event clicked;long     	i,nro_oferta,cont,malos,ctas_pag_s,nro_cuotas,&
			cuotas_mora,periodo,p1,p2,count,a,facturado,ll_ctas_pie_parc
double   	gastos_adm,factor_gc,g_cobranza,valor_presente,&
			tasa,valor_cuota,saldo_insoluto,uf_dia,capital,&
			interes,uf_cierre,saldo_total,saldo_12,saldo_12_mas,&
			kcp,klp,icp,ilp,gccp,gclp,monto_mora,pie,monto,&
			cuota,pie_pac,pie_pag,precio,porce_venta,porce_sup,&
			comision,comprueba_saldo,existe,capital_inicial,gc_inicial,interes_inicial,ldb_saldo_pie
datetime fecha_prim,fecha_ult
datetime fecha_cierre,fecha_vto,fecha_oferta
date		fecha
string   	serie,moneda,base,fecha_of,estado_comi,age,sup,jefe,&
         	estado_age,estado_sup,estado_jefe,estado_comi_sup,estado_cadena
integer  ret,parque

setpointer(HourGlass!)
fecha_cierre = datetime(date(em_fecha_cierre.text),time('00:00:00'))
fecha			 = date(em_fecha_cierre.text)	
SELECT count("FACTURA_OFERTA"."NUMERO")  
INTO :existe  
FROM "FACTURA_OFERTA"  
WHERE ( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND  
      ( "FACTURA_OFERTA"."BASE" = 'L' ) AND  
      ( "FACTURA_OFERTA"."ESTADO" = 'N' )   ;
if existe > 0 then
	messagebox(gs_app_name,'No es posible procesar datos.~n~r~n~r~n~rDebe eliminar registros para hacerlo.',stopsign!)
	return
end if	
dw_2.retrieve(fecha)
uf_cierre = dw_2.getitemnumber(1,'valor_uf')
ret = messagebox(gs_app_name,'¿ Esta seguro que desea procesar saldos ?~n~r~n~r~n~r   El proceso tardará algunos minutos.~n~r'&
		,Question!,YesNoCancel! ,3)
if ret = 3 then 
	return
elseif ret = 2 then
	close(w_calculo)
	return
end if
if dw_1.rowcount() > 0 then
	hpb_1.minposition = 0
	hpb_1.maxposition = dw_1.rowcount()
	hpb_1.position = 0
	for i = 1 to dw_1.rowcount()
		setnull(facturado)
		serie         = dw_1.getitemstring(i,'serie')
		nro_oferta    = dw_1.getitemnumber(i,'nro_liberador')
		estado_cadena = f_estado_cadena('L', serie,nro_oferta) 
		wf_ingreso(date(fecha_cierre),serie,nro_oferta,monto,cuota,pie)
		pie_pag = pie
		//----- calculo pie parcelado ---//
		SELECT 	"PAGO_LIBERADOR"."CTAS_PACTADAS_PIE"  
		INTO 		:ll_ctas_pie_parc  
		FROM 	"PAGO_LIBERADOR"  
		WHERE 	"PAGO_LIBERADOR"."SERIE_M" = :serie AND  
					"PAGO_LIBERADOR"."NRO_LIBERADOR" = :nro_oferta;
		if isnull(ll_ctas_pie_parc) or ll_ctas_pie_parc = 0 then
			ldb_saldo_pie			= 0
		else
			ldb_saldo_pie			= f_calculo_pie_parce_fac_lib('L', serie,nro_oferta,date(fecha_cierre))
		end if	
		//----//
		if not isnull(cuota) then
			pie_pac 				 = dw_1.getitemnumber(i,'pie')
			moneda			    = dw_1.getitemstring(i,'moneda')
			uf_dia			    = dw_1.getitemnumber(i,'uf_dia')
			estado_comi		    = dw_1.getitemstring(i,'estado_comi')
			estado_comi_sup    = dw_1.getitemstring(i,'estado_comi_sup')
			precio			 	= dw_1.getitemnumber(i,'precio')
			if estado_comi     = 'N' then
				porce_venta		 = dw_1.getitemnumber(i,'porce_age')
				porce_sup		 = dw_1.getitemnumber(i,'porce_sup')
				comision			 = (( precio * porce_venta ) / 100 ) + ((( precio * porce_sup ) / 100 ) * 2)
			elseif estado_comi = 'C'  or estado_comi = 'U' then
				porce_venta		 = dw_1.getitemnumber(i,'porce_age')
				porce_sup		 = dw_1.getitemnumber(i,'porce_sup')
				comision			 = (( precio * porce_sup ) / 100 ) * 2
			elseif estado_comi = 'P' OR estado_comi = 'S' then
				comision			 = 0
			end if	
			fecha_of		   = string(dw_1.getitemdatetime(i,'fecha_lib'),gs_formato_fecha)
			fecha_prim     = dw_1.getitemdatetime(i,'fecha_prim')
			fecha_ult      = dw_1.getitemdatetime(i,'fecha_ult')
			ctas_pag_s     = cuota
			nro_cuotas     = dw_1.getitemnumber(i,'nro_cuotas')
			cuotas_mora    = funcion_mora_fac( fecha_prim,ctas_pag_s,nro_cuotas,fecha )
			if estado_cadena = 'S' then cuotas_mora = 0
			if cuotas_mora < 0 then cuotas_mora = 0
			periodo        = nro_cuotas - ctas_pag_s//( ctas_pag_s + cuotas_mora )
			if periodo     < 0 then periodo = 0
			gastos_adm     = dw_1.getitemnumber(i,'gastos_adm')
			factor_gc      = gastos_adm / nro_cuotas
			g_cobranza     = periodo * factor_gc
			tasa				= dw_1.getitemnumber(i,'tasa')
//-----------------------------------------08-05-2006-----------------------------------------------------
			if tasa > 0 then
				valor_cuota		= dw_1.getitemnumber(i,'valor_cuota')
				pie				= dw_1.getitemnumber(i,'pie')
				valor_presente = f_vp( periodo, tasa, valor_cuota )
				capital        = valor_presente - g_cobranza
				interes			= ( valor_cuota * periodo ) - valor_presente
				saldo_total		= ( valor_presente + interes ) + ldb_saldo_pie
				if moneda = '2' then
					saldo_total = saldo_total * uf_cierre
					capital     = capital * uf_cierre
					interes     = interes * uf_cierre
				end if
			else
				valor_cuota		= dw_1.getitemnumber(i,'valor_cuota')
				pie				= dw_1.getitemnumber(i,'pie')
				interes			= 0
				g_cobranza     = 0
				if moneda = '2' then
					saldo_total		= ((precio * uf_cierre) - monto) + ldb_saldo_pie
					capital        = (precio * uf_cierre) - monto
				else
					saldo_total		= (precio - monto) + ldb_saldo_pie
					capital        = precio - monto
				end if
			end if
			if saldo_total <= 0 then 
				saldo_total = 0 ; ldb_saldo_pie = 0
			end if	
			if capital <= 0 then capital = 0
//--------------------------------------------------------------------------------------------------------
			sup  = dw_1.getitemstring(i,'cod_super')
			jefe = dw_1.getitemstring(i,'cod_jef')
			if nro_cuotas <=  ctas_pag_s then
				fecha_vto   = datetime(fecha_ult)
			else
				fecha_vto   = datetime(funcion_venc( fecha_prim , ctas_pag_s ))
			end if
			if - daysafter (fecha,date(fecha_vto)) <= 5 then cuotas_mora = 0
			monto_mora  = long(cuotas_mora * valor_cuota)
			if moneda = '2' then
				g_cobranza  = long(g_cobranza * uf_cierre)
				monto_mora  = long(cuotas_mora * valor_cuota * uf_cierre)
				valor_cuota	= long(valor_cuota * uf_cierre)
				pie_pac		= long(pie_pac * uf_dia)
				comision		= long(comision * uf_cierre)
				pie			= long(pie * uf_cierre)
			end if
			if valor_presente <= 0 then
					interes = 0;g_cobranza = 0
			end if	
			if periodo > 12 then 
	//-------------------> largo plazo hasta 12 meses <-------------------
				saldo_12 = long((saldo_total/periodo)*12)
				kcp		= long((capital/periodo)*12)
				icp 		= long((interes/periodo)*12)
				gccp 		= long((g_cobranza/periodo)*12)
				if valor_presente <= 0 then
					saldo_12 = 0;kcp = 0;icp = 0;gccp = 0
				end if	
	//------------------- > largo plazo mas de 12 meses <-------------------
				saldo_12_mas = long((saldo_total/periodo)*(periodo -12))
				klp 			 = long((capital/periodo)*(periodo -12))
				ilp 			 = long((interes/periodo)*(periodo -12))
				gclp 			 = long((g_cobranza/periodo)*(periodo -12))
				if valor_presente <= 0 then
					saldo_12_mas = 0;klp = 0;ilp = 0;gclp = 0
				end if	
			elseif periodo <= 12 then 
				saldo_12     = long(saldo_total)
				kcp          = long(capital)
				icp          = long(interes)
				gccp         = long(g_cobranza)
				saldo_12_mas = 0
				klp          = 0
				ilp          = 0
				gclp         = 0
			end if
			facturado = ( valor_cuota * nro_cuotas ) + pie
			fecha_oferta = datetime(date(fecha_of),time('00:00:00'))
			pie = long(pie_pac - pie_pag)
			if pie <= 10000 then pie = 0
			saldo_total  = long(saldo_total)
			capital      = long(capital)
			interes      = long(interes)
			g_cobranza   = long(g_cobranza)
			monto_mora   = long(monto_mora)
			valor_cuota	 	= long(valor_cuota)
			pie_pac		 	= long(pie_pac)
			saldo_total		 = ( capital + interes + g_cobranza + ldb_saldo_pie) //nuevo
			SELECT "ANEXO_LIBERADOR"."COD_AGENTE"  
			INTO :age  
			FROM "ANEXO_LIBERADOR"  
			WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = :serie ) AND ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :nro_oferta ) ;
			if age = 'C' then
				comision		    = 0
			else
				comision		    = long(comision)
			end if
			monto	       = long(monto)
			comprueba_saldo = long(( saldo_total - ( facturado - monto )) + ( pie + monto_mora ))
			select distinct sysdate into :gdt_tiempo_servidor from agentes;
			estado_age  = f_estado_age_sup_jef(age,1)
			estado_sup  = f_estado_age_sup_jef(sup,2)
			estado_jefe = f_estado_age_sup_jef(jefe,3)
///////////////////////////////////////////////26-12-2006///////////////////////////////////////////////////////////////////////
		if  tasa = 0 then
			gc_inicial         = 0
			interes_inicial    = 0
			if moneda = '2' then
				capital_inicial = precio * uf_cierre
			else
				capital_inicial = precio
			end if
		else
			if moneda = '2' then						
				gc_inicial      = (nro_cuotas * factor_gc) * uf_cierre//g_cobranza
				capital_inicial = precio * uf_cierre
				interes_inicial = facturado - ( capital_inicial + gc_inicial )
			else						
				gc_inicial      = nro_cuotas * factor_gc//g_cobranza
				capital_inicial = precio
				interes_inicial = facturado - ( capital_inicial + gc_inicial )
			end if
		end if
///////////////////////////////////////////////26-12-2006///////////////////////////////////////////////////////////////////////
			parque = f_cadena_parque('L',serie,nro_oferta)
			INSERT INTO "FACTURA_OFERTA"  
					 ( "BASE","SERIE","NUMERO"   ,"FEC_OFE"    ,"MORA"      ,"SALDO_TOTAL" ,"SALDO_CP" ,"SALDO_LP"   ,"CAPITAL" ,"CAPITAL_CP" ,"CAPITAL_LP" ,"INTERES" ,"INTERES_CP" ,"INTERES_LP" ,"GC"       ,"GC_CP" ,"GC_LP" ,"FECHA_PRIM" ,"CTAS_PAG" ,"PLAZO"    ,"MONTO_MORA" ,"PIE"     ,"VALOR_CTA" ,"FACTURADO" ,"FECHA_UF","FECHA_CIERRE","MONEDA","VALOR_UF","ESTADO","FECHA_PROCESO"     ,"MORA_PIE","PIE_PAGADO","COMISIONES","TOTAL_PAGADO","COMPRUEBA_SALDO","ESTADO_COMI","ESTADO_AGE","ESTADO_SUP","ESTADO_JEFE","PORCE_VENTA","PORCE_SUP","ESTADO_COMI_SUP","CAPITAL_INICIAL","INTERES_INICIAL","GC_INICIAL","COD_PARQUE","ESTADO_CADENA" ) 
			VALUES ( 'L'   ,:serie ,:nro_oferta,:fecha_oferta,:cuotas_mora,:saldo_total  ,:saldo_12  ,:saldo_12_mas,:capital  ,:kcp         ,:klp         ,:interes  ,:icp         ,:ilp         ,:g_cobranza,:gccp   ,:gclp   ,:fecha_prim  ,:ctas_pag_s,:nro_cuotas,:monto_mora  ,:pie_pac  ,:valor_cuota,:facturado  ,NULL      ,:fecha_cierre ,:moneda ,:uf_cierre,'N'     ,:gdt_tiempo_servidor,:pie      ,:pie_pag    ,:comision   ,:monto        ,:comprueba_saldo ,:estado_comi ,:estado_age ,:estado_sup ,:estado_jefe ,:porce_venta ,:porce_sup ,:estado_comi_sup ,:capital_inicial ,:interes_inicial ,:gc_inicial ,:parque     ,:estado_cadena ) ;
			if sqlca.sqlcode = 0 then
				commit;
				cont ++
			else
				
				messagebox("Advertencia",'Liber Nº'+string(nro_oferta))
				
				messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
				ROLLBACK;
				malos ++
			end if	
		end if	
		a = i
		hpb_1.position = a
		st_3.text = string(i,'###,###,###,##0')+' '
	next
	messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
end if
cb_primera_fact.triggerevent(clicked!)
setpointer(Arrow!)
end event

type p_1 from picture within w_calculo_nuevas_liberadores
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

type em_fecha_cierre from editmask within w_calculo_nuevas_liberadores
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

type gb_1 from groupbox within w_calculo_nuevas_liberadores
integer x = 73
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
string text = "Liberadores Nuevos"
end type

