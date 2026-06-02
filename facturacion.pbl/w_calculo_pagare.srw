forward
global type w_calculo_pagare from window
end type
type hpb_1 from hprogressbar within w_calculo_pagare
end type
type cb_4 from commandbutton within w_calculo_pagare
end type
type dw_2 from datawindow within w_calculo_pagare
end type
type st_3 from statictext within w_calculo_pagare
end type
type st_2 from statictext within w_calculo_pagare
end type
type dw_1 from datawindow within w_calculo_pagare
end type
type cb_3 from commandbutton within w_calculo_pagare
end type
type st_1 from statictext within w_calculo_pagare
end type
type cb_2 from commandbutton within w_calculo_pagare
end type
type cb_1 from commandbutton within w_calculo_pagare
end type
type p_1 from picture within w_calculo_pagare
end type
type em_fecha_cierre from editmask within w_calculo_pagare
end type
type gb_1 from groupbox within w_calculo_pagare
end type
end forward

global type w_calculo_pagare from window
integer x = 832
integer y = 360
integer width = 1307
integer height = 872
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
global w_calculo_pagare w_calculo_pagare

type variables

end variables

forward prototypes
public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie)
end prototypes

public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie);setnull(monto)
setnull(cuota)
SELECT "FACTURA_PAGARE_INGRESO"."TOT_PAG"  ,
	    "FACTURA_PAGARE_INGRESO"."CTAS_PAG"  ,
	    "FACTURA_PAGARE_INGRESO"."PIE_PAG"
INTO :monto,:cuota,:pie 
FROM "FACTURA_PAGARE_INGRESO"  
WHERE ( "FACTURA_PAGARE_INGRESO"."BASE" ='P'  ) AND  
      ( "FACTURA_PAGARE_INGRESO"."SERIE" =:serie  ) AND  
      ( "FACTURA_PAGARE_INGRESO"."NUMERO" = :numero )  AND 
		("FACTURA_PAGARE_INGRESO"."ESTADO" ) ='S'  ;
Return 1
end function

on w_calculo_pagare.create
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

on w_calculo_pagare.destroy
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
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_1.retrieve()
dw_1.setsort('serie A,nro_oferta A')
dw_1.sort()
end event

type hpb_1 from hprogressbar within w_calculo_pagare
integer x = 114
integer y = 440
integer width = 1056
integer height = 116
unsignedinteger maxposition = 100
integer setstep = 10
end type

type cb_4 from commandbutton within w_calculo_pagare
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

event clicked;//date fecha,fecha1
//
//
//fecha = date('31/12/1999')
//fecha1 = date('31/10/1999')
//UPDATE "FACTURA_OFERTA"  
//SET "FECHA_CIERRE" = :fecha
//WHERE "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha1 ;
//if sqlca.sqlcode=0 then
//	commit ;
//	
//else
//	messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
//	ROLLBACK;
//
//end if	



DELETE FROM "FACTURA_OFERTA"  
WHERE "FACTURA_OFERTA"."FECHA_CIERRE" >= TO_DATE('31-Jan-2000 00:00:00','DD-MON-YYYY HH24:MI:SS')   ;


end event

type dw_2 from datawindow within w_calculo_pagare
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

type st_3 from statictext within w_calculo_pagare
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

type st_2 from statictext within w_calculo_pagare
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

type dw_1 from datawindow within w_calculo_pagare
integer x = 2016
integer y = 88
integer width = 1207
integer height = 564
integer taborder = 50
boolean titlebar = true
string dataobject = "dw_pagare"
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

type cb_3 from commandbutton within w_calculo_pagare
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

event clicked;OpenWithParm(w_imprime_saldo, em_fecha_cierre.text)
end event

type st_1 from statictext within w_calculo_pagare
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

type cb_2 from commandbutton within w_calculo_pagare
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

event clicked;close(w_calculo_pagare)
end event

type cb_1 from commandbutton within w_calculo_pagare
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

event clicked;long     	i,nro_oferta,cont,malos,ctas_pag_s,nro_cuotas,&
			cuotas_mora,periodo,p1,p2,count,a,facturado
double	gastos_adm,factor_gc,g_cobranza,valor_presente,&
			tasa,valor_cuota,saldo_insoluto,uf_dia,capital,&
			interes,uf_cierre,saldo_total,saldo_12,saldo_12_mas,&
			kcp,klp,icp,ilp,gccp,gclp,monto_mora,pie,monto,&
			cuota,pie_pac,pie_pag,precio,porce_venta,porce_sup,&
			comision,comprueba_saldo,existe
datetime fecha_prim,fecha_ult
datetime fecha_cierre,fecha_vto,fecha_oferta
date		fecha
string   serie,moneda,base,fecha_of,estado_comi,ESTADO
integer  ret,parque

setpointer(HourGlass!)
fecha_cierre 						= datetime(date(em_fecha_cierre.text),time('00:00:00'))
fecha			 						= date(em_fecha_cierre.text)	
SELECT	count("FACTURA_OFERTA"."NUMERO")  
INTO 		:existe  
FROM 		"FACTURA_OFERTA"  
WHERE 	( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND  
      	( "FACTURA_OFERTA"."BASE" = 'P' ) AND  
      	( "FACTURA_OFERTA"."ESTADO" = 'S' )   ;
if existe > 0 then
	messagebox(gs_app_name,'No es posible procesar datos.~n~r~n~r~n~rDebe eliminar registros para hacerlo.',stopsign!)
	return
end if	
dw_2.retrieve(fecha)
uf_cierre 							= dw_2.getitemnumber(1,'valor_uf')
ret 									= messagebox(gs_app_name,'¿ Esta seguro que desea procesar saldos ?~n~r~n~r~n~r   El proceso tardará algunos minutos.~n~r'&
		,Question!,YesNoCancel! ,3)
if ret = 3 then 
	return
elseif ret = 2 then
	close(w_calculo)
	return
end if
if dw_1.rowcount() > 0 then
	hpb_1.minposition 			= 0
	hpb_1.maxposition 			= dw_1.rowcount()
	hpb_1.position 				= 0
	for i = 1 to dw_1.rowcount()
		setnull(facturado)
		serie       				= dw_1.getitemstring(i,'serie')
		nro_oferta  				= dw_1.getitemnumber(i,'nro_oferta')
		wf_ingreso(date(fecha_cierre),serie,nro_oferta,monto,cuota,pie)
		pie_pag 						= pie /*peso*/
		if not isnull(cuota) then 
			moneda 					= dw_1.getitemstring(i,'moneda')
			parque 					= dw_1.getitemnumber(i,'parque')
			nro_cuotas     		= dw_1.getitemnumber(i,'nro_cuotas')
			ctas_pag_s     		= cuota
			IF dw_1.getitemSTRING(i,'ESTADO') <> 'C' THEN
				pie_pac 				= dw_1.getitemnumber(i,'pagare_pie') /*moneda*/
				if isnull(pie_pac)  then
					pie_pac			= 0
				else
					pie_pac			= pie_pac
				end if
				fecha_of		   	= string(dw_1.getitemdatetime(i,'fecha_of'),gs_formato_fecha)
				fecha_prim     	= dw_1.getitemdatetime(i,'fecha_prim')
				ctas_pag_s     	= cuota
				nro_cuotas     	= dw_1.getitemnumber(i,'nro_cuotas')
				cuotas_mora    	= funcion_mora_fac( fecha_prim,ctas_pag_s,nro_cuotas,fecha )
				if cuotas_mora < 0 then cuotas_mora = 0
				periodo        	= nro_cuotas - ctas_pag_s // <--------OJO-----<<
				if periodo < 0 then periodo = 0
				if periodo     	= 0 then periodo = nro_cuotas - ctas_pag_s
				tasa					= dw_1.getitemnumber(i,'tasa')
				valor_cuota			= dw_1.getitemnumber(i,'valor_cuota')
				pie					= dw_1.getitemnumber(i,'pagare_pie') /*moneda*/
				if isnull(pie)  then
					pie				= 0
				else
					pie				= pie
				end if
				valor_presente 	= f_vp( periodo, tasa, valor_cuota )
				capital        	= valor_presente
				interes				= ( valor_cuota * periodo ) - valor_presente
				saldo_total			= ( valor_presente + interes )
				if nro_cuotas <=  ctas_pag_s then
				else
					fecha_vto   	= datetime(funcion_venc( fecha_prim , ctas_pag_s ))
				end if
				if - daysafter (fecha,date(fecha_vto)) <= 5 then cuotas_mora = 0
				monto_mora  		= cuotas_mora * valor_cuota
				if moneda = '2' then
					saldo_total 	= saldo_total * uf_cierre
					capital     	= capital * uf_cierre
					interes     	= interes * uf_cierre
					monto_mora  	= cuotas_mora * valor_cuota * uf_cierre
					valor_cuota		= valor_cuota * uf_cierre
					pie				= pie * uf_cierre
				end if
				if valor_presente <= 0 then
					capital     	= 0
					interes     	= 0
				end if
				if valor_presente <= 0 then
						saldo_total = 0;capital = 0;interes = 0
				end if	
				if periodo > 12 then 
		//-------------------> largo plazo hasta 12 meses <-------------------
					saldo_12 		= long((saldo_total/periodo)*12)
					kcp				= long((capital/periodo)*12)
					icp 				= long((interes/periodo)*12)
					if valor_presente <= 0 then
						saldo_12 = 0;kcp = 0;icp = 0
					end if	
		//------------------- > largo plazo mas de 12 meses <-------------------
					saldo_12_mas 	= long((saldo_total/periodo)*(periodo -12))
					klp 			 	= long((capital/periodo)*(periodo -12))
					ilp 			 	= long((interes/periodo)*(periodo -12))
					if valor_presente <= 0 then
						saldo_12_mas = 0;klp = 0;ilp = 0
					end if	
				elseif periodo <= 12 then 
					saldo_12     	= long(saldo_total)
					kcp          	= long(capital)
					icp          	= long(interes)
					saldo_12_mas 	= 0
					klp          	= 0
					ilp          	= 0
				end if
				facturado = long(( valor_cuota * nro_cuotas ) + pie)
				fecha_oferta 		= datetime(date(fecha_of),time('00:00:00'))
				//pie 					= double(pie_pac - pie_pag)
				if pie <= 10000 then pie = 0
				saldo_total     	= long(saldo_total)
				capital         	= long(capital)
				interes         	= long(interes)
				monto_mora      	= long(monto_mora)
				valor_cuota	    	= long(valor_cuota)
				pie_pac		    	= double(pie_pac)
				comision		    	= long(comision)
				monto			    	= long(monto)
				saldo_total		 = ( capital + interes + g_cobranza) //nuevo
				comprueba_saldo 	= long(( saldo_total - ( facturado - monto )) + ( pie + monto_mora ))
			ELSE
				cuotas_mora = 0
				saldo_total = 0;saldo_12 = 0;saldo_12_mas = 0;capital    = 0;kcp       = 0;klp             = 0
				interes     = 0;icp      = 0;ilp          = 0;monto_mora = 0;facturado = 0;comprueba_saldo = 0
			END IF	
			if parque = 1 then
				estado 				= 'P'
			elseif parque = 11 then
				estado 				= 'F'
			elseif parque = 102 then
				estado 				= 'M'
			elseif parque = 103 then
				estado 				= 'S'	
			else
				estado 				= 'O'
			end if	
			select distinct sysdate into :gdt_tiempo_servidor from agentes;
			INSERT INTO "FACTURA_PAGARE"  
					 ( "BASE","SERIE","NUMERO"   ,"FEC_OFE"    ,"MORA"      ,"SALDO_TOTAL" ,"SALDO_CP" ,"SALDO_LP"   ,"CAPITAL" ,"CAPITAL_CP" ,"CAPITAL_LP" ,"INTERES" ,"INTERES_CP" ,"INTERES_LP" ,"GC"       ,"GC_CP" ,"GC_LP" ,"FECHA_PRIM" ,"CTAS_PAG" ,"PLAZO"    ,"MONTO_MORA" ,"PIE"     ,"VALOR_CTA" ,"FACTURADO" ,"FECHA_UF","FECHA_CIERRE","MONEDA","VALOR_UF","ESTADO","FECHA_PROCESO"     ,"MORA_PIE","PIE_PAGADO","COMISIONES","TOTAL_PAGADO","COMPRUEBA_SALDO","ESTADO_COMI" )  
			VALUES ( 'P'   ,:serie ,:nro_oferta,:fecha_oferta,:cuotas_mora,:saldo_total  ,:saldo_12  ,:saldo_12_mas,:capital  ,:kcp         ,:klp         ,:interes  ,:icp         ,:ilp         ,null       ,null    ,null    ,:fecha_prim  ,:ctas_pag_s,:nro_cuotas,:monto_mora  ,:pie,		:valor_cuota,:facturado  ,NULL      ,:fecha_cierre ,:moneda ,:uf_cierre,'S'     ,:gdt_tiempo_servidor,:pie      ,:pie_pag    ,null        ,:monto        ,:comprueba_saldo ,:estado);
			if sqlca.sqlcode = 0 then
				commit;
				cont ++
			else
				messagebox(gs_app_name,sqlca.SQLErrText,stopsign!)
				ROLLBACK;
				malos ++
			end if	
		end if	
		a = i
		hpb_1.position = a
		st_3.text 					= string(i,'###,###,###,##0')+' '
	next
	messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
					'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
end if
setpointer(Arrow!)
end event

type p_1 from picture within w_calculo_pagare
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

type em_fecha_cierre from editmask within w_calculo_pagare
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

type gb_1 from groupbox within w_calculo_pagare
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
string text = "Saldos de Pagarés"
end type

