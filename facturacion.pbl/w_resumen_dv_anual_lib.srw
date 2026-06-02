forward
global type w_resumen_dv_anual_lib from window
end type
type dw_5 from datawindow within w_resumen_dv_anual_lib
end type
type hpb_1 from hprogressbar within w_resumen_dv_anual_lib
end type
type cb_3 from commandbutton within w_resumen_dv_anual_lib
end type
type p_1 from picture within w_resumen_dv_anual_lib
end type
type st_1 from statictext within w_resumen_dv_anual_lib
end type
type st_2 from statictext within w_resumen_dv_anual_lib
end type
type st_3 from statictext within w_resumen_dv_anual_lib
end type
type em_fecha_cierre from editmask within w_resumen_dv_anual_lib
end type
type dw_3 from datawindow within w_resumen_dv_anual_lib
end type
type dw_2 from datawindow within w_resumen_dv_anual_lib
end type
type dw_1 from datawindow within w_resumen_dv_anual_lib
end type
type cb_2 from commandbutton within w_resumen_dv_anual_lib
end type
type cb_1 from commandbutton within w_resumen_dv_anual_lib
end type
type gb_1 from groupbox within w_resumen_dv_anual_lib
end type
end forward

global type w_resumen_dv_anual_lib from window
integer x = 832
integer y = 360
integer width = 1294
integer height = 892
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
event proceso pbm_custom01
dw_5 dw_5
hpb_1 hpb_1
cb_3 cb_3
p_1 p_1
st_1 st_1
st_2 st_2
st_3 st_3
em_fecha_cierre em_fecha_cierre
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_resumen_dv_anual_lib w_resumen_dv_anual_lib

type variables
date fecha
string c_fecha
end variables

forward prototypes
public subroutine wf_graba_dv (date fecha_cierre, long ctas_dv, long ingresos, integer parque)
end prototypes

event proceso;//integer i
//long monto = 0,numero,sum,dv,ingreso
//string serie,fecha1,fecha2
//date fech1,fech2,fecha_mes
//datetime fecha_cierre
//
//dw_1.settransobject(sqlca)
//fecha1 = '01/01/'+c_fecha
//fecha2 = '31/12/'+c_fecha
//fech1 = date(fecha1)
//fech2 = date(fecha2)
//if dw_2.retrieve(fech1,fech2)>0 then
//	for i = 1 to dw_2.rowcount()
//		serie         = dw_2.getitemstring(i,'serie')
//		numero        = dw_2.getitemnumber(i,'numero')
//		fecha_cierre  = dw_2.getitemdatetime(i,'fecha_cierre')
//		dv            = dw_2.getitemnumber(i,'sum_dv')
//		fecha_mes = date('1/'+string(month (date(fecha_cierre)))+'/'+string(year (date(fecha_cierre))))
//		if dw_3.retrieve(serie,numero,fecha_mes,date(fecha_cierre)) > 0 then
//			if isnull(dw_3.getitemnumber(1,'sum')) then
//				dw_2.setitem(i,'ingreso',0)
////				wf_graba_dv(date(fecha_cierre),dv,0)
//			else
//				dw_2.setitem(i,'ingreso',dw_3.getitemnumber(1,'sum'))
//			end if
//		end if
//		dw_2.accepttext ()
//		ingreso = dw_2.getitemnumber(i,'sum_ingreso')
//		wf_graba_dv(date(fecha_cierre),dv,ingreso)
//		w_proceso_reg.st_2.text = 'Reg n° ' + string(i,'###,###,###,###,###')+' de '+string(dw_2.rowcount(),'###,###,###,###,###')
//	next
//	dw_2.object.titulo.text = gs_empresa+' ( Promesas )'
//	dw_2.object.titulo1.text = 'Resumen Mensual de Cuotas Devengadas'
//	dw_2.object.titulo2.text = 'Fecha de Cierre '+string(fecha,'dd/mm/yyyy')
//	dw_2.accepttext ()
//	close(w_proceso_reg)
//end if
end event

public subroutine wf_graba_dv (date fecha_cierre, long ctas_dv, long ingresos, integer parque);INSERT INTO "CUOTAS_DEVENGADAS"  
          ( "FECHA_CIERRE","CTAS_DEVENGADAS","INGRESOS" ,"BASE","COD_PARQUE")  
  VALUES  (:fecha_cierre  ,:ctas_dv         ,:ingresos  ,'L'   ,:parque)  ;
if sqlca.sqlcode <> 0 then
	  UPDATE "CUOTAS_DEVENGADAS"  
     SET "FECHA_CIERRE" = :fecha_cierre,"CTAS_DEVENGADAS" = :ctas_dv,"INGRESOS" = :ingresos  
   WHERE ( "CUOTAS_DEVENGADAS"."FECHA_CIERRE" = :fecha_cierre ) AND 
			( "CUOTAS_DEVENGADAS"."BASE" = 'L')  and ("COD_PARQUE" = : parque)  ;
	if sqlca.sqlcode <> 0 then		
		messagebox('Error',sqlca.SQLErrText+' funcion wf_graba_dv ',stopsign!)		
		ROLLBACK;
	ELSE
		COMMIT;
	end if
ELSE
	COMMIT;
end if

end subroutine

on w_resumen_dv_anual_lib.create
this.dw_5=create dw_5
this.hpb_1=create hpb_1
this.cb_3=create cb_3
this.p_1=create p_1
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_fecha_cierre=create em_fecha_cierre
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_5,&
this.hpb_1,&
this.cb_3,&
this.p_1,&
this.st_1,&
this.st_2,&
this.st_3,&
this.em_fecha_cierre,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_resumen_dv_anual_lib.destroy
destroy(this.dw_5)
destroy(this.hpb_1)
destroy(this.cb_3)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_fecha_cierre)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;integer i
long monto = 0,numero,sum
string serie,fecha1,fecha2
date fech1,fech2,fecha_mes
datetime fecha_cierre

em_fecha_cierre.text = string(today(),'dd/mm/yyyy')
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
dw_2.settransobject (sqlca)
dw_3.settransobject (sqlca)
dw_5.settransobject (sqlca)
end event

type dw_5 from datawindow within w_resumen_dv_anual_lib
integer x = 3433
integer y = 1324
integer width = 571
integer height = 600
integer taborder = 40
string title = "none"
string dataobject = "dw_parque_dv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type hpb_1 from hprogressbar within w_resumen_dv_anual_lib
integer x = 110
integer y = 436
integer width = 1074
integer height = 112
unsignedinteger maxposition = 100
integer setstep = 10
end type

type cb_3 from commandbutton within w_resumen_dv_anual_lib
integer x = 73
integer y = 624
integer width = 311
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Calcular"
end type

event clicked;long monto = 0,numero,sum,dv,ingreso,i,j,ret,cod_parque
string serie,fecha1,fecha2
date fech1,fech2,fecha_mes
datetime fecha_cierre


ret = messagebox(gs_app_name,'¿ Esta seguro que desea procesar el resumen mensual ?~n~r~n~r~n~r   El proceso tardará algunos minutos.~n~r'&
		,Question!,YesNoCancel! ,3)
if ret = 3 then 
	return
elseif ret = 2 then
	close(w_resumen_dv_anual)
	return
end if
dw_1.settransobject(sqlca)
fecha1 = '01/'+string(month(date(em_fecha_cierre.text)))+'/'+&
			string(year (date(em_fecha_cierre.text)))
fecha2 = em_fecha_cierre.text
fech1 = date(fecha1)
fech2 = date(fecha2)
if dw_5.retrieve() > 0 then
	dv = 0;ingreso = 0;
	for j = 1 to dw_5.rowcount()
		cod_parque = dw_5.getitemnumber(j,'codigo')
		if dw_2.retrieve(fech1,fech2,cod_parque)>0 then	
			hpb_1.minposition = 0
			hpb_1.maxposition = dw_2.rowcount()
			hpb_1.position = 0	
			for i = 1 to dw_2.rowcount()
				serie         = dw_2.getitemstring(i,'serie')
				numero        = dw_2.getitemnumber(i,'numero')
//				cod_parque    = dw_2.getitemnumber(i,'cod_parque')
				fecha_cierre  = dw_2.getitemdatetime(i,'fecha_cierre')
				dv            = dw_2.getitemnumber(i,'sum_dv')
				fecha_mes = date('1/'+string(month (date(fecha_cierre)))+'/'+string(year (date(fecha_cierre))))
				if dw_3.retrieve(serie,numero,fecha_mes,date(fecha_cierre),cod_parque) > 0 then
					if isnull(dw_3.getitemnumber(1,'sum')) then
						dw_2.setitem(i,'ingreso',0)
					else
						dw_2.setitem(i,'ingreso',dw_3.getitemnumber(1,'sum'))
					end if
				end if
				dw_2.accepttext ()
				ingreso = dw_2.getitemnumber(i,'sum_ingreso')
				wf_graba_dv(date(fecha_cierre),dv,ingreso,cod_parque)
				hpb_1.position = i
				st_3.text = string(i,'###,###,###,##0')+' '
			next
			dw_2.object.titulo.text = gs_empresa+' ( Promesas )'
			dw_2.object.titulo1.text = 'Resumen Mensual de Cuotas Devengadas'
			dw_2.object.titulo2.text = 'Fecha de Cierre '+string(fecha,'dd/mm/yyyy')
			dw_2.accepttext ()
		end if
	next
end if
end event

type p_1 from picture within w_resumen_dv_anual_lib
event clicked pbm_bnclicked
integer x = 1065
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

type st_1 from statictext within w_resumen_dv_anual_lib
integer x = 151
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

type st_2 from statictext within w_resumen_dv_anual_lib
integer x = 151
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

type st_3 from statictext within w_resumen_dv_anual_lib
integer x = 695
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

type em_fecha_cierre from editmask within w_resumen_dv_anual_lib
event modified pbm_enmodified
integer x = 695
integer y = 164
integer width = 361
integer height = 100
integer taborder = 10
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

type dw_3 from datawindow within w_resumen_dv_anual_lib
integer x = 1696
integer y = 1224
integer width = 1499
integer height = 484
boolean titlebar = true
string dataobject = "dw_sum_promesa"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_2 from datawindow within w_resumen_dv_anual_lib
integer x = 1499
integer y = 56
integer width = 2048
integer height = 1140
string dataobject = "dw_resumen_dv_anual_lib"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_resumen_dv_anual_lib
integer x = 457
integer y = 1072
integer width = 1006
integer height = 572
boolean titlebar = true
string dataobject = "dw_resumen_imprime_dv"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_resumen_dv_anual_lib
integer x = 910
integer y = 620
integer width = 311
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resumen_dv_anual_lib)
end event

type cb_1 from commandbutton within w_resumen_dv_anual_lib
integer x = 59
integer y = 1256
integer width = 306
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprime"
end type

event clicked;if dw_2.rowcount() > 0 then
	f_Print( dw_2 )
end if
end event

type gb_1 from groupbox within w_resumen_dv_anual_lib
integer x = 73
integer y = 48
integer width = 1147
integer height = 544
integer taborder = 1
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Ctas. Mensuales Devengadas Lib."
end type

