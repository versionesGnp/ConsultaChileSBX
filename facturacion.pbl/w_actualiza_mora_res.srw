forward
global type w_actualiza_mora_res from window
end type
type dw_1 from datawindow within w_actualiza_mora_res
end type
type cb_4 from commandbutton within w_actualiza_mora_res
end type
type cb_3 from commandbutton within w_actualiza_mora_res
end type
type st_1 from statictext within w_actualiza_mora_res
end type
type cb_2 from commandbutton within w_actualiza_mora_res
end type
type cb_1 from commandbutton within w_actualiza_mora_res
end type
type p_1 from picture within w_actualiza_mora_res
end type
type em_fecha_cierre from editmask within w_actualiza_mora_res
end type
type gb_1 from groupbox within w_actualiza_mora_res
end type
end forward

global type w_actualiza_mora_res from window
integer x = 832
integer y = 360
integer width = 1294
integer height = 648
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_1 dw_1
cb_4 cb_4
cb_3 cb_3
st_1 st_1
cb_2 cb_2
cb_1 cb_1
p_1 p_1
em_fecha_cierre em_fecha_cierre
gb_1 gb_1
end type
global w_actualiza_mora_res w_actualiza_mora_res

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

on w_actualiza_mora_res.create
this.dw_1=create dw_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.cb_4,&
this.cb_3,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.p_1,&
this.em_fecha_cierre,&
this.gb_1}
end on

on w_actualiza_mora_res.destroy
destroy(this.dw_1)
destroy(this.cb_4)
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
dw_1.retrieve()
end event

type dw_1 from datawindow within w_actualiza_mora_res
integer x = 1879
integer y = 48
integer width = 928
integer height = 600
integer taborder = 60
boolean titlebar = true
string title = "none"
string dataobject = "dw_codigo_parque"
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

type cb_4 from commandbutton within w_actualiza_mora_res
integer x = 425
integer y = 856
integer width = 247
integer height = 108
integer taborder = 30
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

type cb_3 from commandbutton within w_actualiza_mora_res
boolean visible = false
integer x = 489
integer y = 636
integer width = 311
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;OpenWithParm(w_imprime_saldo, em_fecha_cierre.text)
end event

type st_1 from statictext within w_actualiza_mora_res
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

type cb_2 from commandbutton within w_actualiza_mora_res
integer x = 896
integer y = 368
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

event clicked;close(w_actualiza_mora_res)
end event

type cb_1 from commandbutton within w_actualiza_mora_res
integer x = 69
integer y = 368
integer width = 311
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Calcular"
end type

event clicked;date mes
string base
long mora_cero,mora_uno,mora_dos,mora_tres_cuatro,mora_cinco_doce,mora_trece,capital_uno,&
	  capital_dos,capital_tres_cuatro,capital_cinco_doce,capital_trece,i,parque

mes = date(em_fecha_cierre.text)  

for i = 1 to dw_1.rowcount()
	parque = dw_1.getitemnumber(i,'codigo')
	SELECT count("FACTURA_OFERTA"."MORA")  
	INTO :mora_cero
	FROM "FACTURA_OFERTA"  
	WHERE ( "FACTURA_OFERTA"."MORA" = 0 ) AND  
			(("FACTURA_OFERTA"."ESTADO" = 'N' ) OR  
			( "FACTURA_OFERTA"."ESTADO" = 'S' )) and 
			( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
			( "FACTURA_OFERTA"."FECHA_CIERRE" = :mes ) and 
			( "FACTURA_OFERTA"."COD_PARQUE" = :parque )   ;
	if sqlca.sqlcode > -1 then
		SELECT count("FACTURA_OFERTA"."MORA"),SUM("FACTURA_OFERTA"."CAPITAL")
		INTO :mora_uno,:capital_uno
		 FROM "FACTURA_OFERTA"  
		WHERE ( "FACTURA_OFERTA"."MORA" = 1 ) AND  
				(("FACTURA_OFERTA"."ESTADO" = 'N' ) OR  
				( "FACTURA_OFERTA"."ESTADO" = 'S' )) and 
				( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
				( "FACTURA_OFERTA"."FECHA_CIERRE" = :mes ) and 
   			( "FACTURA_OFERTA"."COD_PARQUE" = :parque )   ;
		if sqlca.sqlcode > -1 then
			SELECT count("FACTURA_OFERTA"."MORA"),SUM("FACTURA_OFERTA"."CAPITAL")
			INTO :mora_dos,:capital_dos
			 FROM "FACTURA_OFERTA"  
			WHERE ( "FACTURA_OFERTA"."MORA" = 2 ) AND  
					(("FACTURA_OFERTA"."ESTADO" = 'N' ) OR  
					( "FACTURA_OFERTA"."ESTADO" = 'S' )) and 
					( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
					( "FACTURA_OFERTA"."FECHA_CIERRE" = :mes ) and 
       			( "FACTURA_OFERTA"."COD_PARQUE" = :parque )   ;
			if sqlca.sqlcode > -1 then
				SELECT count("FACTURA_OFERTA"."MORA"),SUM("FACTURA_OFERTA"."CAPITAL")
				INTO :mora_tres_cuatro,:capital_tres_cuatro
				 FROM "FACTURA_OFERTA"  
				WHERE (("FACTURA_OFERTA"."ESTADO" = 'N' ) OR  
						( "FACTURA_OFERTA"."ESTADO" = 'S' )) and 
						(( "FACTURA_OFERTA"."MORA" >= 3 ) AND  
						( "FACTURA_OFERTA"."MORA" <= 4 )) AND  
						( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
						( "FACTURA_OFERTA"."FECHA_CIERRE" = :mes ) and 
          			( "FACTURA_OFERTA"."COD_PARQUE" = :parque )   ;
				if sqlca.sqlcode > -1 then
					SELECT count("FACTURA_OFERTA"."MORA"),SUM("FACTURA_OFERTA"."CAPITAL")
					INTO :mora_cinco_doce,:capital_cinco_doce
					 FROM "FACTURA_OFERTA"  
					WHERE (("FACTURA_OFERTA"."ESTADO" = 'N' ) OR  
							( "FACTURA_OFERTA"."ESTADO" = 'S' )) and 
							(( "FACTURA_OFERTA"."MORA" >= 5 ) AND  
							( "FACTURA_OFERTA"."MORA" <= 12 )) AND  
							( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
							( "FACTURA_OFERTA"."FECHA_CIERRE" = :mes ) and 
            			( "FACTURA_OFERTA"."COD_PARQUE" = :parque )   ;
					if sqlca.sqlcode > -1 then
						SELECT count("FACTURA_OFERTA"."MORA"),SUM("FACTURA_OFERTA"."CAPITAL")
						INTO :mora_trece,:capital_trece
						 FROM "FACTURA_OFERTA"  
						WHERE (("FACTURA_OFERTA"."ESTADO" = 'N' ) OR  
								( "FACTURA_OFERTA"."ESTADO" = 'S' )) and 
								( "FACTURA_OFERTA"."MORA" >= 13 ) AND  
								( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
								( "FACTURA_OFERTA"."FECHA_CIERRE" = :mes ) and 
               			( "FACTURA_OFERTA"."COD_PARQUE" = :parque )   ;
					end if			
				end if
			end if
		end if
	end if
	
	INSERT INTO "RES_MORA_FACT" ( "MES","BASE","MORA_CERO","MORA_UNO","MORA_DOS","MORA_TRES_CUATRO","MORA_CINCO_DOCE","MORA_TRECE","CAPITAL_UNO","CAPITAL_DOS","CAPITAL_TRES_CUATRO","CAPITAL_CINCO_DOCE","CAPITAL_TRECE","COD_PARQUE" )  
								VALUES (:mes  ,'O'   ,:mora_cero ,:mora_uno ,:mora_dos ,:mora_tres_cuatro ,:mora_cinco_doce ,:mora_trece ,:capital_uno ,:capital_dos ,:capital_tres_cuatro ,:capital_cinco_doce ,:capital_trece ,:parque      )  ;
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox('Error','Error al grabar la información ( '+sqlca.SQLErrText	+' )',stopsign!)
		close(w_actualiza_mora_res)
	else
		commit;
		messagebox('Proceso Terminado','Se ha grabado con exito la información.',information!)
		close(w_actualiza_mora_res)
	end if
next
setpointer(Arrow!)
end event

type p_1 from picture within w_actualiza_mora_res
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

type em_fecha_cierre from editmask within w_actualiza_mora_res
event modified pbm_enmodified
integer x = 667
integer y = 164
integer width = 361
integer height = 100
integer taborder = 50
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

type gb_1 from groupbox within w_actualiza_mora_res
integer x = 69
integer y = 44
integer width = 1138
integer height = 292
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Resumen de Mora de Promesas"
end type

