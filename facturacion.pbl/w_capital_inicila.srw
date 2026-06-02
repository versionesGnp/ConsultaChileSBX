forward
global type w_capital_inicila from window
end type
type dw_3 from datawindow within w_capital_inicila
end type
type hpb_1 from hprogressbar within w_capital_inicila
end type
type dw_2 from datawindow within w_capital_inicila
end type
type st_3 from statictext within w_capital_inicila
end type
type st_2 from statictext within w_capital_inicila
end type
type dw_1 from datawindow within w_capital_inicila
end type
type st_1 from statictext within w_capital_inicila
end type
type cb_2 from commandbutton within w_capital_inicila
end type
type cb_1 from commandbutton within w_capital_inicila
end type
type p_1 from picture within w_capital_inicila
end type
type em_fecha_cierre from editmask within w_capital_inicila
end type
type gb_1 from groupbox within w_capital_inicila
end type
end forward

global type w_capital_inicila from window
integer x = 832
integer y = 360
integer width = 1298
integer height = 896
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_3 dw_3
hpb_1 hpb_1
dw_2 dw_2
st_3 st_3
st_2 st_2
dw_1 dw_1
st_1 st_1
cb_2 cb_2
cb_1 cb_1
p_1 p_1
em_fecha_cierre em_fecha_cierre
gb_1 gb_1
end type
global w_capital_inicila w_capital_inicila

type variables

end variables

forward prototypes
public subroutine wf_inicial (ref double capital_inicial, ref double interes_inicial, ref double gc_inicial, string base, string serie, long numero, string moneda)
public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie)
public subroutine wf_capital_inicio (string base, string serie, long numero)
end prototypes

public subroutine wf_inicial (ref double capital_inicial, ref double interes_inicial, ref double gc_inicial, string base, string serie, long numero, string moneda);datetime fecha_n
double uf_n

SELECT "FACTURA_OFERTA"."FECHA_CIERRE",   
       "FACTURA_OFERTA"."INTERES",   
       "FACTURA_OFERTA"."GC",   
       "FACTURA_OFERTA"."FACTURADO"-("FACTURA_OFERTA"."INTERES"+"FACTURA_OFERTA"."GC") as capital_inicial  
		 into :fecha_n,:interes_inicial,:gc_inicial,:capital_inicial
FROM "FACTURA_OFERTA"  
WHERE ( "FACTURA_OFERTA"."BASE"         = :base   ) AND  
      ( "FACTURA_OFERTA"."SERIE"        = :serie  ) AND  
      ( "FACTURA_OFERTA"."NUMERO"       = :numero ) AND  
      ( "FACTURA_OFERTA"."ESTADO"       = 'N'     ) AND  
      ( "FACTURA_OFERTA"."FECHA_CIERRE" = (SELECT MIN("FACTURA_OFERTA"."FECHA_CIERRE") FROM "FACTURA_OFERTA" WHERE 
												      ( "FACTURA_OFERTA"."BASE"   = :base   ) AND 
												      ( "FACTURA_OFERTA"."SERIE"  = :serie  ) AND 
												      ( "FACTURA_OFERTA"."NUMERO" = :numero ) AND 
												      ( "FACTURA_OFERTA"."ESTADO" = 'N'     ) ) );   

SELECT "TAB_UF"."VALOR_UF" INTO :uf_n FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :fecha_n   ;

if moneda = '2' then									
	interes_inicial = interes_inicial / uf_n
	gc_inicial      = gc_inicial      / uf_n
	capital_inicial = capital_inicial / uf_n
end if
end subroutine

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
		("FACTURA_OFERTA_INGRESO"."ESTADO" ) ='S';
Return 1
end function

public subroutine wf_capital_inicio (string base, string serie, long numero);datetime fecha_n,fecha_cierre
string  moneda
double  uf_n,uf_s
long  interes_inicial,gc_inicial,capital_inicial,count_reg,i
  
uf_s = dw_2.getitemnumber(1,'valor_uf')
if dw_3.retrieve(base,serie,numero) > 0 then

	for i = 1 to dw_3.rowcount()
		fecha_cierre = dw_3.getitemdatetime(i,'fecha_cierre')
		moneda       = dw_3.getitemstring(i,'moneda')
		
		SELECT "FACTURA_OFERTA"."FECHA_CIERRE",   
			  "FACTURA_OFERTA"."INTERES",   
			  "FACTURA_OFERTA"."GC",   
			  "FACTURA_OFERTA"."FACTURADO"-("FACTURA_OFERTA"."INTERES"+"FACTURA_OFERTA"."GC") 
		INTO    :fecha_n, :interes_inicial, :gc_inicial, :capital_inicial 
		FROM   "FACTURA_OFERTA"  
		WHERE ( "FACTURA_OFERTA"."BASE"       = :base   ) AND  
			 ( "FACTURA_OFERTA"."SERIE"        = :serie  ) AND  
			 ( "FACTURA_OFERTA"."NUMERO"       = :numero ) AND  
			 ( "FACTURA_OFERTA"."ESTADO"       = 'N'       ) AND  
			 ( "FACTURA_OFERTA"."FECHA_CIERRE" = (SELECT MIN( "FACTURA_OFERTA"."FECHA_CIERRE") FROM "FACTURA_OFERTA" WHERE 
															 ( "FACTURA_OFERTA"."BASE"   = :base   ) AND 
															 ( "FACTURA_OFERTA"."SERIE"  = :serie  ) AND 
															 ( "FACTURA_OFERTA"."NUMERO" = :numero ) AND 
															 ( "FACTURA_OFERTA"."ESTADO" = 'N'     ) ) );   
             
		SELECT "TAB_UF"."VALOR_UF" INTO :uf_n FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :fecha_n   ;
             
		SELECT "TAB_UF"."VALOR_UF" INTO :uf_s FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :fecha_cierre   ;
             
		if moneda = '2' then
			if interes_inicial = 0 or gc_inicial = 0 then
				interes_inicial = 0 
				gc_inicial      = 0
			else
				interes_inicial = ( interes_inicial / uf_n ) * uf_s
				gc_inicial      = ( gc_inicial      / uf_n ) * uf_s
				capital_inicial = ( capital_inicial / uf_n ) * uf_s
			end if
		end if
		
//		UPDATE  "FACTURA_OFERTA"  
//		SET     "CAPITAL_INICIAL" = :capital_inicial, "INTERES_INICIAL" = :interes_inicial, "GC_INICIAL" = :gc_inicial  
//		WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND ( "FACTURA_OFERTA"."SERIE" = :serie ) AND  
//				( "FACTURA_OFERTA"."NUMERO" = :numero ) AND ( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND  
//				( "FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S'  OR "FACTURA_OFERTA"."ESTADO" = 'R' )  ;
//		if sqlca.sqlcode = 0 then
//			commit;
//		else
//			rollback;
//		end if
	next
end if
end subroutine

on w_capital_inicila.create
this.dw_3=create dw_3
this.hpb_1=create hpb_1
this.dw_2=create dw_2
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.hpb_1,&
this.dw_2,&
this.st_3,&
this.st_2,&
this.dw_1,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.p_1,&
this.em_fecha_cierre,&
this.gb_1}
end on

on w_capital_inicila.destroy
destroy(this.dw_3)
destroy(this.hpb_1)
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
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
dw_3.settransobject(sqlca)
//dw_1.retrieve()
dw_1.setsort('serie A,nro_oferta A')
dw_1.sort()
end event

type dw_3 from datawindow within w_capital_inicila
integer x = 2519
integer y = 88
integer width = 494
integer height = 360
integer taborder = 80
boolean titlebar = true
string title = "none"
string dataobject = "dw_capital_inicial_cierre"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type hpb_1 from hprogressbar within w_capital_inicila
integer x = 96
integer y = 432
integer width = 1079
integer height = 120
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_2 from datawindow within w_capital_inicila
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

type st_3 from statictext within w_capital_inicila
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

type st_2 from statictext within w_capital_inicila
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

type dw_1 from datawindow within w_capital_inicila
integer x = 2016
integer y = 88
integer width = 494
integer height = 360
integer taborder = 50
boolean titlebar = true
string dataobject = "dw_capital_inicial"
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

type st_1 from statictext within w_capital_inicila
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

type cb_2 from commandbutton within w_capital_inicila
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
boolean enabled = false
string text = "&Cerrar"
end type

event clicked;close(w_capital_inicila)
end event

type cb_1 from commandbutton within w_capital_inicila
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

event clicked;string  base,serie,moneda,estado
long  numero,i
double capital_inicial,interes_inicial,gc_inicial,uf_anterior,uf_actual
date fecha_anterior,fecha_cierre

dw_2.retrieve(date(em_fecha_cierre.text))
fecha_cierre   = date(em_fecha_cierre.text)
uf_actual      = dw_2.getitemnumber(1,'valor_uf')

dw_2.reset()
fecha_anterior = RelativeDate(date('01'+mid(em_fecha_cierre.text,3,8)),-1)
dw_2.retrieve(fecha_anterior)
uf_anterior    = dw_2.getitemnumber(1,'valor_uf')


dw_1.retrieve(fecha_anterior)
dw_1.setsort('serie A,nro_oferta A')
dw_1.sort()
hpb_1.minposition = 0
hpb_1.maxposition = dw_1.rowcount()
hpb_1.position = 0
if dw_1.rowcount() > 0 then
	for i = 1 to dw_1.rowcount()
		base            = dw_1.getitemstring(i,'base')
		serie           = dw_1.getitemstring(i,'serie')
		numero          = dw_1.getitemnumber(i,'numero')
		capital_inicial = dw_1.getitemnumber(i,'capital_inicial')
		interes_inicial = dw_1.getitemnumber(i,'interes_inicial')
		gc_inicial      = dw_1.getitemnumber(i,'gc_inicial')
		moneda          = dw_1.getitemstring(i,'moneda')
		estado          = dw_1.getitemstring(i,'estado')
		if moneda = '2' then
			capital_inicial = round((capital_inicial/uf_anterior) * uf_actual,0)
			interes_inicial = round((interes_inicial/uf_anterior) * uf_actual,0)
			gc_inicial      = round((gc_inicial     /uf_anterior) * uf_actual,0)
		end if
		UPDATE "FACTURA_OFERTA"  
		SET "CAPITAL_INICIAL" = :capital_inicial,
		    "INTERES_INICIAL" = :interes_inicial,
			 "GC_INICIAL"      = :gc_inicial  
		WHERE ( "FACTURA_OFERTA"."BASE" = :base   ) AND ( "FACTURA_OFERTA"."SERIE"        = :serie ) AND  
		( "FACTURA_OFERTA"."NUMERO"     = :numero ) AND ( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) ;//AND  

		if sqlca.sqlcode = 0 then
			commit;
		else
			rollback;
		end if
		
//		wf_capital_inicio( base , serie , numero );   
		st_3.text = string(i,'###,###,###,###')
		hpb_1.position = i
	next
	cb_2.enabled = true
end if
end event

type p_1 from picture within w_capital_inicila
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

type em_fecha_cierre from editmask within w_capital_inicila
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

type gb_1 from groupbox within w_capital_inicila
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
string text = "Capital Inicial"
end type

