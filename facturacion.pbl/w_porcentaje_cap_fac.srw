forward
global type w_porcentaje_cap_fac from window
end type
type hpb_1 from hprogressbar within w_porcentaje_cap_fac
end type
type dw_2 from datawindow within w_porcentaje_cap_fac
end type
type st_3 from statictext within w_porcentaje_cap_fac
end type
type st_2 from statictext within w_porcentaje_cap_fac
end type
type dw_1 from datawindow within w_porcentaje_cap_fac
end type
type cb_3 from commandbutton within w_porcentaje_cap_fac
end type
type st_1 from statictext within w_porcentaje_cap_fac
end type
type cb_2 from commandbutton within w_porcentaje_cap_fac
end type
type cb_1 from commandbutton within w_porcentaje_cap_fac
end type
type p_1 from picture within w_porcentaje_cap_fac
end type
type em_fecha_cierre from editmask within w_porcentaje_cap_fac
end type
type gb_1 from groupbox within w_porcentaje_cap_fac
end type
end forward

global type w_porcentaje_cap_fac from window
integer x = 832
integer y = 360
integer width = 1298
integer height = 936
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
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
global w_porcentaje_cap_fac w_porcentaje_cap_fac

type variables

end variables

forward prototypes
public function integer wf_ingreso (date fecha, string serie, long numero, ref double monto, ref double cuota, ref double pie)
public function integer wf_facturado (string base, string serie, long numero)
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
		("FACTURA_OFERTA_INGRESO"."ESTADO" ) ='S';
Return 1
end function

public function integer wf_facturado (string base, string serie, long numero);integer factura
if base ='O' then
	SELECT "PAGO_OFERTA"."FACTURA"  
	INTO :factura  
	FROM "OFERTA_V",   
	"PAGO_OFERTA"  
	WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
	( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
	( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
	( ( "OFERTA_V"."SERIE" = :serie ) AND  
	( "OFERTA_V"."NRO_OFERTA" = :numero ) )   ;
elseif base ='L' then
	SELECT "ANEXO_LIBERADOR"."NRO_RESC"  
	INTO :factura  
	FROM "ANEXO_LIBERADOR"  
	WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = :serie ) AND  
	( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :numero )   ;
end if
return factura
end function

on w_porcentaje_cap_fac.create
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
this.Control[]={this.hpb_1,&
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

on w_porcentaje_cap_fac.destroy
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

type hpb_1 from hprogressbar within w_porcentaje_cap_fac
integer x = 96
integer y = 432
integer width = 1079
integer height = 120
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_2 from datawindow within w_porcentaje_cap_fac
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

type st_3 from statictext within w_porcentaje_cap_fac
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

type st_2 from statictext within w_porcentaje_cap_fac
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

type dw_1 from datawindow within w_porcentaje_cap_fac
integer x = 2016
integer y = 88
integer width = 494
integer height = 360
integer taborder = 50
boolean titlebar = true
string dataobject = "dw_porcentaje_cap_fac"
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

type cb_3 from commandbutton within w_porcentaje_cap_fac
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

type st_1 from statictext within w_porcentaje_cap_fac
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

type cb_2 from commandbutton within w_porcentaje_cap_fac
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

event clicked;close(w_porcentaje_cap_fac)
end event

type cb_1 from commandbutton within w_porcentaje_cap_fac
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

event clicked;long i
double porcentaje,tot_pagado,  numero,capital,facturado,count_factura,factura,pagado
string base,serie
date fecha_cierre

fecha_cierre = date(em_fecha_cierre.text)
dw_2.settransobject( sqlca)
if dw_2.retrieve(date(em_fecha_cierre.text))> 0 then
	dw_1.settransobject( sqlca)
	if dw_1.retrieve()> 0 then
		hpb_1.minposition = 0
		hpb_1.maxposition = dw_1.rowcount()/2
		hpb_1.position = 0
		for i = 1 to dw_1.rowcount()
			base   = dw_1.getitemstring(i,'base')
			serie  = dw_1.getitemstring(i,'serie')
			numero = dw_1.getitemnumber(i,'numero')
			setnull(tot_pagado)
			capital = 0;facturado = 0;porcentaje = 0;count_factura = 0;tot_pagado = 0;pagado = 0;factura    = 0
			if base = 'O'	then
				SELECT "OFERTA_V"."TOT_PAGADO"  into :tot_pagado
				FROM "OFERTA_V","PAGO_OFERTA"  
				WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				( ( "OFERTA_V"."SERIE" = :serie ) AND  
				( "OFERTA_V"."NRO_OFERTA" = :numero ) )   ;
				pagado = tot_pagado
				SELECT count("FACTURA_OFERTA"."CAPITAL")
				into :count_factura
				FROM "FACTURA_OFERTA"  
				WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
				( "FACTURA_OFERTA"."SERIE" = :serie ) AND  
				( "FACTURA_OFERTA"."NUMERO" = :numero ) AND  
				( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND 
				("FACTURA_OFERTA"."ESTADO" = 'V');
				if count_factura > 0 AND tot_pagado > 0 then
					SELECT  DISTINCT "FACTURA_OFERTA"."CAPITAL","FACTURA_OFERTA"."FACTURADO"  
					into :capital, :facturado
					FROM "FACTURA_OFERTA"  
					WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
					( "FACTURA_OFERTA"."SERIE" = :serie ) AND  
					( "FACTURA_OFERTA"."NUMERO" = :numero ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND 
					("FACTURA_OFERTA"."ESTADO" = 'V');
					porcentaje = (tot_pagado*100)/facturado;
					factura = wf_facturado(base,serie,numero)
				else
					capital    = 0
					facturado  = 0
					porcentaje = 0
//					tot_pagado = 0
					factura    = 0
				end if;
			elseif base = 'L'	then
				SELECT "ANEXO_LIBERADOR"."TOT_PAGADO" into :tot_pagado 
				FROM "ANEXO_LIBERADOR", "PAGO_LIBERADOR"  
				WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				( ( "ANEXO_LIBERADOR"."SERIE_M" = 'L' ) AND  
				( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :numero )     )   ;
				pagado = tot_pagado
				SELECT count("FACTURA_OFERTA"."CAPITAL")
				into :count_factura
				FROM "FACTURA_OFERTA"  
				WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
				( "FACTURA_OFERTA"."SERIE" = :serie ) AND  
				( "FACTURA_OFERTA"."NUMERO" = :numero ) AND  
				( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND 
				("FACTURA_OFERTA"."ESTADO" = 'V');
				if count_factura > 0 AND tot_pagado > 0 then
					SELECT DISTINCT "FACTURA_OFERTA"."CAPITAL","FACTURA_OFERTA"."FACTURADO"  
					into :capital, :facturado
					FROM "FACTURA_OFERTA"  
					WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
					( "FACTURA_OFERTA"."SERIE" = :serie ) AND  
					( "FACTURA_OFERTA"."NUMERO" = :numero ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND 
					("FACTURA_OFERTA"."ESTADO" = 'V');
					porcentaje = (tot_pagado*100)/facturado;
					setnull(factura)
					factura = wf_facturado(base,serie,numero)
				else
					capital    = 0
					facturado  = 0
					porcentaje = 0
//					tot_pagado = 0
					factura    = 0
				end if
			end if
//			if facturado > 0	then
				if isnull(capital)    then capital    = 0
				if isnull(porcentaje) then porcentaje = 0
				if isnull(facturado)  then facturado  = 0
				if isnull(tot_pagado) then tot_pagado = 0
				if isnull(pagado)     then pagado     = 0
				if isnull(factura)    then factura    = 0
				UPDATE "CADENA_MORA"  
				SET "CAPITAL" = :capital,"FACTURADO" = :facturado,"PORCENTAJE" = :porcentaje ,"ESTADO_FACTURACION" =: factura, "TOTAL_PAGADO" =:pagado
				WHERE ( "CADENA_MORA"."BASE" = :base ) AND ( "CADENA_MORA"."SERIE" = :serie ) AND  
				( "CADENA_MORA"."NUMERO" = :numero ) ;
				IF SQLCA.SQLCode = 0 THEN 
					commit;
				else
					ROLLBACK;
				end if
//			end if
		hpb_1.position = round(i/2,0)
		st_3.text = string(i,'###,###,###,##0')+' '
		next
		cb_2.enabled= true
	end if
end if

end event

type p_1 from picture within w_porcentaje_cap_fac
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

type em_fecha_cierre from editmask within w_porcentaje_cap_fac
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

type gb_1 from groupbox within w_porcentaje_cap_fac
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
string text = "Porcentaje Mora"
end type

