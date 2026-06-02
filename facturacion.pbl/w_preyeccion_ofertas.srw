forward
global type w_preyeccion_ofertas from window
end type
type dw_3 from uo_datawindow within w_preyeccion_ofertas
end type
type dw_2 from datawindow within w_preyeccion_ofertas
end type
type st_3 from statictext within w_preyeccion_ofertas
end type
type st_2 from statictext within w_preyeccion_ofertas
end type
type dw_1 from datawindow within w_preyeccion_ofertas
end type
type cb_3 from commandbutton within w_preyeccion_ofertas
end type
type st_1 from statictext within w_preyeccion_ofertas
end type
type ole_meter from uo_meter_control within w_preyeccion_ofertas
end type
type cb_2 from commandbutton within w_preyeccion_ofertas
end type
type cb_1 from commandbutton within w_preyeccion_ofertas
end type
type p_1 from picture within w_preyeccion_ofertas
end type
type em_fecha_cierre from editmask within w_preyeccion_ofertas
end type
type gb_1 from groupbox within w_preyeccion_ofertas
end type
end forward

global type w_preyeccion_ofertas from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2400
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_3 dw_3
dw_2 dw_2
st_3 st_3
st_2 st_2
dw_1 dw_1
cb_3 cb_3
st_1 st_1
ole_meter ole_meter
cb_2 cb_2
cb_1 cb_1
p_1 p_1
em_fecha_cierre em_fecha_cierre
gb_1 gb_1
end type
global w_preyeccion_ofertas w_preyeccion_ofertas

type variables

end variables

forward prototypes
public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie, ref datetime fecha_pago)
end prototypes

public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie, ref datetime fecha_pago);long monto1,cuota1

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
		(("FACTURA_OFERTA_INGRESO"."ESTADO" ) ='S' or ("FACTURA_OFERTA_INGRESO"."ESTADO" ) ='N');
		
SELECT sum("INGRESO"."MONTO"),
		 sum("INGRESO"."CUOTAS_PAG")   
INTO :monto1,:cuota1  
FROM "INGRESO"  
WHERE ( "INGRESO"."SERIE" =:serie  ) AND  
      ( "INGRESO"."CONTRATO" = :numero )   ;
if cuota1 > cuota then	cuota = cuota1
if monto1 > monto then	monto = monto1

SELECT "INGRESO"."FECHA_PAGO"  
INTO :fecha_pago  
FROM "INGRESO"  
WHERE ( "INGRESO"."TIPO_MOV" = 'A' ) AND  
      ( "INGRESO"."SERIE" = :serie ) AND  
      ( "INGRESO"."CONTRATO" = :numero )   ;
Return 1
end function

on w_preyeccion_ofertas.create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.cb_3=create cb_3
this.st_1=create st_1
this.ole_meter=create ole_meter
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.dw_2,&
this.st_3,&
this.st_2,&
this.dw_1,&
this.cb_3,&
this.st_1,&
this.ole_meter,&
this.cb_2,&
this.cb_1,&
this.p_1,&
this.em_fecha_cierre,&
this.gb_1}
end on

on w_preyeccion_ofertas.destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.ole_meter)
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
ole_meter.object.minvalue = 1
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_1.retrieve()
dw_1.setsort('serie A,nro_oferta A')
dw_1.sort()

end event

type dw_3 from uo_datawindow within w_preyeccion_ofertas
integer x = 69
integer y = 208
integer width = 3511
integer height = 2036
integer taborder = 70
string dataobject = "dw_exportar"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado = "1011001"
end event

event rowfocuschanged;call super::rowfocuschanged;this.SelectRow(0, FALSE)
this.SelectRow(getrow(), TRUE)
end event

type dw_2 from datawindow within w_preyeccion_ofertas
boolean visible = false
integer x = 5
integer y = 1016
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

type st_3 from statictext within w_preyeccion_ofertas
integer x = 1449
integer y = 88
integer width = 306
integer height = 76
integer textsize = -8
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

type st_2 from statictext within w_preyeccion_ofertas
integer x = 1015
integer y = 88
integer width = 439
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "N° de Registros  :"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_preyeccion_ofertas
boolean visible = false
integer x = 9
integer y = 1388
integer width = 494
integer height = 360
integer taborder = 50
boolean titlebar = true
string dataobject = "dw_calculo"
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

type cb_3 from commandbutton within w_preyeccion_ofertas
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

type st_1 from statictext within w_preyeccion_ofertas
integer x = 165
integer y = 88
integer width = 434
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Fecha de Cierre :"
boolean focusrectangle = false
end type

type ole_meter from uo_meter_control within w_preyeccion_ofertas
integer x = 1787
integer y = 88
integer width = 951
integer height = 76
integer taborder = 60
boolean border = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_preyeccion_ofertas.win"
integer textsize = -8
integer weight = 700
end type

event constructor;call super::constructor;ole_meter.object.value = 0
end event

type cb_2 from commandbutton within w_preyeccion_ofertas
integer x = 3186
integer y = 88
integer width = 311
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_preyeccion_ofertas)
end event

type cb_1 from commandbutton within w_preyeccion_ofertas
integer x = 2798
integer y = 88
integer width = 311
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Calcular"
end type

event clicked;long     i,nro_oferta,cont,malos,ctas_pag_s,nro_cuotas,&
			cuotas_mora,periodo,p1,p2,count,a,facturado,rut,ll_ctas_pie_parc
double	gastos_adm,factor_gc,g_cobranza,valor_presente,&
			tasa,valor_cuota,saldo_insoluto,uf_dia,capital,&
			interes,uf_cierre,saldo_total,saldo_12,saldo_12_mas,&
			kcp,klp,icp,ilp,gccp,gclp,monto_mora,pie,monto,&
			cuota,pie_pac,pie_pag,precio,porce_venta,porce_sup,&
			comision,comprueba_saldo,existe,ldb_saldo_pie
datetime fecha_prim,fecha_ult,fecha_pago
datetime fecha_cierre,fecha_vto,fecha_oferta
date		fecha,fecha_pie
string   serie,moneda,base,fecha_of,estado_comi,cod_age,cod_sup
integer  ret

setpointer(HourGlass!)
fecha_cierre = datetime(date(em_fecha_cierre.text),time('00:00:00'))
fecha			 = date(em_fecha_cierre.text)	
dw_2.retrieve(fecha)
uf_cierre = dw_2.getitemnumber(1,'valor_uf')
ret = messagebox(gs_app_name,'¿ Esta seguro que desea procesar saldos ?~n~r~n~r~n~r   El proceso tardará algunos minutos.~n~r'&
		,Question!,YesNoCancel! ,3)
if ret = 3 then 
	return
elseif ret = 2 then
	close(w_preyeccion_ofertas)
	return
end if
dw_3.reset()
if dw_1.rowcount() > 0 then
	ole_meter.object.minvalue = 1
	ole_meter.object.maxvalue = dw_1.rowcount()/4
	for i = 1 to dw_1.rowcount()
		setnull(facturado)
		serie       = dw_1.getitemstring(i,'serie')
		nro_oferta  = dw_1.getitemnumber(i,'nro_oferta')
		wf_ingreso(date(fecha_cierre),serie,nro_oferta,monto,cuota,pie,fecha_pago)
		pie_pag = pie
		//----- calculo pie parcelado ---//
		SELECT 	"PAGO_OFERTA"."CTAS_PACTADAS_PIE"  
		INTO 		:ll_ctas_pie_parc  
		FROM 	"PAGO_OFERTA"  
		WHERE 	"PAGO_OFERTA"."SERIE" = :serie AND  
					"PAGO_OFERTA"."NRO_OFERTA" = :nro_oferta;
		if isnull(ll_ctas_pie_parc) or ll_ctas_pie_parc = 0 then
			ldb_saldo_pie			= 0
		else
			ldb_saldo_pie			= f_calculo_pie_parce_fac('O', serie,nro_oferta,date(fecha_cierre))
		end if	
		//----//
		if not isnull(cuota) then 
			pie_pac 			= dw_1.getitemnumber(i,'pie')
			moneda			= dw_1.getitemstring(i,'moneda')
			uf_dia			= dw_1.getitemnumber(i,'uf_dia')
			estado_comi		= dw_1.getitemstring(i,'estado_comi')
//			if estado_comi = 'N' then
//				precio			= dw_1.getitemnumber(i,'precio')
//				porce_venta		= dw_1.getitemnumber(i,'porce_venta')
//				porce_sup		= dw_1.getitemnumber(i,'porce_sup')
//				comision			= (( precio * porce_venta ) / 100 ) + ((( precio * porce_sup ) / 100 ) * 2)
//			elseif estado_comi = 'C'  or estado_comi = 'U' then
//				precio			= dw_1.getitemnumber(i,'precio')
//				porce_venta		= dw_1.getitemnumber(i,'porce_venta')
//				porce_sup		= dw_1.getitemnumber(i,'porce_sup')
//				comision			= (( precio * porce_sup ) / 100 ) * 2
//			elseif estado_comi = 'P' then
//				comision			= 0
//			end if
			precio			= dw_1.getitemnumber(i,'precio')
			porce_venta		= dw_1.getitemnumber(i,'porce_venta')
			porce_sup		= dw_1.getitemnumber(i,'porce_sup')
			fecha_of		   = string(dw_1.getitemdatetime(i,'fecha_of'),gs_formato_fecha)
			fecha_prim     = dw_1.getitemdatetime(i,'fecha_prim')
			fecha_ult      = dw_1.getitemdatetime(i,'fecha_ult')
			rut      		= dw_1.getitemnumber(i,'rut')
			ctas_pag_s     = cuota
			nro_cuotas     = dw_1.getitemnumber(i,'nro_cuotas')
			cuotas_mora    = funcion_mora_fac( fecha_prim,ctas_pag_s,nro_cuotas,fecha )
			if cuotas_mora < 0 then cuotas_mora = 0
			periodo        = nro_cuotas - ctas_pag_s //+ cuotas_mora )// <--------OJO-----<<
			if periodo < 0 then periodo = 0
			if periodo     = 0 then periodo = nro_cuotas - ctas_pag_s
			gastos_adm     = dw_1.getitemnumber(i,'gastos_adm')
			cod_age	      = dw_1.getitemstring(i,'cod_age')
			cod_sup	      = dw_1.getitemstring(i,'cod_sup')
			fecha_pie	   = date(dw_1.getitemdatetime(i,'fecha_pie'))
			factor_gc      = gastos_adm / nro_cuotas
			g_cobranza     = periodo * factor_gc
			tasa				= dw_1.getitemnumber(i,'tasa')
			valor_cuota		= dw_1.getitemnumber(i,'valor_cuota')
			pie				= dw_1.getitemnumber(i,'pie')
			valor_presente = f_vp( periodo, tasa, valor_cuota )
			capital        = valor_presente - g_cobranza
			interes			= ( valor_cuota * periodo ) - valor_presente
			saldo_total		= ( valor_presente + interes ) + ldb_saldo_pie
			if nro_cuotas <=  ctas_pag_s then
				fecha_vto   = datetime(fecha_ult)
			else
				fecha_vto   = datetime(funcion_venc( fecha_prim , ctas_pag_s ))
			end if
			monto_mora  = cuotas_mora * valor_cuota
			if moneda = '2' then
				saldo_total = saldo_total * uf_cierre
				capital     = capital * uf_cierre
				interes     = interes * uf_cierre
				g_cobranza  = g_cobranza * uf_cierre
				monto_mora  = cuotas_mora * valor_cuota * uf_cierre
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
			facturado = long(( valor_cuota * nro_cuotas ) + pie)
			fecha_oferta = datetime(date(fecha_of),time('00:00:00'))
			pie = long(pie_pac - pie_pag)
			if pie <= 10000 then pie = 0
			saldo_total     = long(saldo_total)
			capital         = long(capital)
			interes         = long(interes)
			g_cobranza      = long(g_cobranza)
			monto_mora      = long(monto_mora)
			valor_cuota	    = long(valor_cuota)
			pie_pac		    = long(pie_pac)
			comision		    = long(comision)
			monto			    = long(monto)
			comprueba_saldo = long(( saldo_total - ( facturado - monto )) + ( pie + monto_mora ))
			select distinct sysdate into :gdt_tiempo_servidor from agentes;
			dw_3.insertrow(0)
			dw_3.setitem(dw_3.rowcount(),'base','O')
			dw_3.setitem(dw_3.rowcount(),'serie',serie)
			dw_3.setitem(dw_3.rowcount(),'numero',nro_oferta)
			dw_3.setitem(dw_3.rowcount(),'rut',rut)
			dw_3.setitem(dw_3.rowcount(),'cod_age',cod_age)
			dw_3.setitem(dw_3.rowcount(),'cod_sup',cod_sup)
			dw_3.setitem(dw_3.rowcount(),'fec_ofe',date(fecha_oferta))
			dw_3.setitem(dw_3.rowcount(),'precio',precio)
			dw_3.setitem(dw_3.rowcount(),'plazo',nro_cuotas)
			dw_3.setitem(dw_3.rowcount(),'pie_pagado',pie_pag)
			dw_3.setitem(dw_3.rowcount(),'fecha_pie',date(fecha_pago))
			dw_3.setitem(dw_3.rowcount(),'fecha_prim',date(fecha_prim))
			dw_3.setitem(dw_3.rowcount(),'ctas_pag',ctas_pag_s)
			dw_3.setitem(dw_3.rowcount(),'mora',cuotas_mora)
			dw_3.setitem(dw_3.rowcount(),'saldo_total',saldo_total)
			dw_3.setitem(dw_3.rowcount(),'capital',capital)
			dw_3.setitem(dw_3.rowcount(),'interes',interes)
			dw_3.setitem(dw_3.rowcount(),'gc',g_cobranza)			
			cont ++
		end if	
		a = i
		ole_meter.object.value = a/4
		st_3.text = string(i,'###,###,###,##0')+' '
	next
	messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito.~r~n',information!)
end if
setpointer(Arrow!)
end event

type p_1 from picture within w_preyeccion_ofertas
event clicked pbm_bnclicked
integer x = 919
integer y = 88
integer width = 82
integer height = 76
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

type em_fecha_cierre from editmask within w_preyeccion_ofertas
event modified pbm_enmodified
integer x = 603
integer y = 88
integer width = 311
integer height = 76
integer taborder = 80
integer textsize = -8
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

type gb_1 from groupbox within w_preyeccion_ofertas
integer x = 69
integer y = 28
integer width = 3511
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Proyección de Saldos de Ofertas"
end type

