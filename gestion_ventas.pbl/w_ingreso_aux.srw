forward
global type w_ingreso_aux from window
end type
type dw_2 from datawindow within w_ingreso_aux
end type
type cb_imprimir from commandbutton within w_ingreso_aux
end type
type st_4 from statictext within w_ingreso_aux
end type
type st_3 from statictext within w_ingreso_aux
end type
type ole_1 from uo_meter_control within w_ingreso_aux
end type
type st_2 from statictext within w_ingreso_aux
end type
type st_1 from statictext within w_ingreso_aux
end type
type p_2 from picture within w_ingreso_aux
end type
type em_2 from editmask within w_ingreso_aux
end type
type p_1 from picture within w_ingreso_aux
end type
type em_1 from editmask within w_ingreso_aux
end type
type cb_2 from commandbutton within w_ingreso_aux
end type
type cb_1 from commandbutton within w_ingreso_aux
end type
type gb_1 from groupbox within w_ingreso_aux
end type
end forward

global type w_ingreso_aux from window
integer x = 837
integer y = 588
integer width = 1426
integer height = 1184
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
dw_2 dw_2
cb_imprimir cb_imprimir
st_4 st_4
st_3 st_3
ole_1 ole_1
st_2 st_2
st_1 st_1
p_2 p_2
em_2 em_2
p_1 p_1
em_1 em_1
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_ingreso_aux w_ingreso_aux

type variables
datetime fecha_ingreso
end variables

forward prototypes
public function integer wf_trae_datos (string sql, datetime fecha_1, datetime fecha_2)
end prototypes

public function integer wf_trae_datos (string sql, datetime fecha_1, datetime fecha_2);datetime fecha
string serie
long contrato

PREPARE sqlsa FROM :sql;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_inserta_valor()")
	Return -1
END IF
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :serie,:contrato,:fecha;
	If sqlca.sqlcode = 0 Then
	
	END IF
Loop
Close dyn_cursor;
return 1
end function

on w_ingreso_aux.create
this.dw_2=create dw_2
this.cb_imprimir=create cb_imprimir
this.st_4=create st_4
this.st_3=create st_3
this.ole_1=create ole_1
this.st_2=create st_2
this.st_1=create st_1
this.p_2=create p_2
this.em_2=create em_2
this.p_1=create p_1
this.em_1=create em_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.dw_2,&
this.cb_imprimir,&
this.st_4,&
this.st_3,&
this.ole_1,&
this.st_2,&
this.st_1,&
this.p_2,&
this.em_2,&
this.p_1,&
this.em_1,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_ingreso_aux.destroy
destroy(this.dw_2)
destroy(this.cb_imprimir)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ole_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_2)
destroy(this.em_2)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_ingreso_aux)
this.title	= mid(gs_app_name,1,pos(gs_app_name,' ',15))
em_1.text 	= string(today(),gs_formato_fecha)
em_2.text 	= string(today(),gs_formato_fecha)
gs_ventana	= 'w_ingreso_aux'
f_valida_objeto_1()
end event

type dw_2 from datawindow within w_ingreso_aux
integer x = 1458
integer y = 184
integer width = 494
integer height = 360
boolean titlebar = true
string dataobject = "dw_resultado_ingreso"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type cb_imprimir from commandbutton within w_ingreso_aux
boolean visible = false
integer x = 361
integer y = 924
integer width = 306
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//cb_1.enabled = false
//cb_2.enabled = false
//open(w_seleccion_impresion)
//cb_1.enabled = true
//cb_2.enabled = true
end event

type st_4 from statictext within w_ingreso_aux
integer x = 626
integer y = 528
integer width = 375
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingreso_aux
integer x = 165
integer y = 540
integer width = 503
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Registro N°"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_1 from uo_meter_control within w_ingreso_aux
integer x = 183
integer y = 928
integer width = 1317
integer height = 768
integer taborder = 0
boolean border = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_ingreso_aux.win"
end type

event constructor;call super::constructor;ole_1.object.value = 0
end event

type st_2 from statictext within w_ingreso_aux
integer x = 366
integer y = 312
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha final del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_aux
integer x = 361
integer y = 120
integer width = 722
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha inicio del periodo"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_2 from picture within w_ingreso_aux
integer x = 928
integer y = 400
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
	end if	
END IF
end event

type em_2 from editmask within w_ingreso_aux
integer x = 480
integer y = 392
integer width = 425
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type p_1 from picture within w_ingreso_aux
integer x = 928
integer y = 208
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(EM_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
	end if	
END IF
end event

type em_1 from editmask within w_ingreso_aux
integer x = 480
integer y = 200
integer width = 425
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type cb_2 from commandbutton within w_ingreso_aux
integer x = 1051
integer y = 924
integer width = 302
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_aux)
end event

type cb_1 from commandbutton within w_ingreso_aux
integer x = 55
integer y = 924
integer width = 302
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;datetime fecha1,fecha2,fecha,fecha_pago,fecha_venc,fecha_ant,fcha_ant,fecha_dw
integer i,j = 1
long contrato,folio,cuotas_pag,monto,valor_uf,rut
string serie,tipo_cob,tipo_mov,cod_caja,rezago,pago_hist,base,usuario,&
		 cod_age,pago_externo,lugar_externo,viene_de,t_cob,t_mov

SetPointer(HourGlass!)
cb_1.enabled = false
cb_2.enabled = false
fecha1 = datetime(date(em_1.text),time('00:00:00'))
fecha2 = datetime(date(em_2.text),time('23:59:59'))
dw_2.settransobject(sqlca)
if dw_2.retrieve(fecha1,fecha2) > 0 then
	ole_1.object.minvalue = j
	ole_1.object.maxvalue = dw_2.rowcount()
	for i = 1 to dw_2.rowcount()
		serie    = dw_2.getitemstring(i,'ingreso_serie')
		contrato = dw_2.getitemnumber(i,'ingreso_contrato')
		base     = dw_2.getitemstring(i,'ingreso_base')
		t_cob    = dw_2.getitemstring(i,'ingreso_tipo_cob')
		t_mov    = dw_2.getitemstring(i,'ingreso_tipo_mov')		
		fecha    = f_busca_inicio(serie,contrato,base,t_cob,t_mov)
		if fecha >= fecha1 and fecha <= fecha2 then
				  SELECT "INGRESO"."FOLIO","INGRESO"."TIPO_COB",   
					"INGRESO"."FECHA_PAGO","INGRESO"."TIPO_MOV",   
					"INGRESO"."MONTO","INGRESO"."CUOTAS_PAG",   
					"INGRESO"."SERIE","INGRESO"."CONTRATO",   
					"INGRESO"."COD_CAJA","INGRESO"."REZAGO",   
					"INGRESO"."VALOR_UF","INGRESO"."PAGO_HIST",   
					"INGRESO"."BASE","INGRESO"."RUT",   
					"INGRESO"."USUARIO","INGRESO"."COD_AGE",   
					"INGRESO"."FECHA_VENC","INGRESO"."PAGO_EXTERNO",   
					"INGRESO"."LUGAR_EXTERNO","INGRESO"."VIENE_DE",   
					"INGRESO"."FECHA_ANT","INGRESO"."FCHA_ANT"  
				 INTO :folio,:tipo_cob,   
					:fecha_pago,:tipo_mov,   
					:monto,:cuotas_pag,   
					:serie,:contrato,   
					:cod_caja,:rezago,   
					:valor_uf,:pago_hist,   
					:base,:rut,   
					:usuario,:cod_age,   
					:fecha_venc,:pago_externo,   
					:lugar_externo,:viene_de,   
					:fecha_ant,:fcha_ant  
				 FROM "INGRESO"  
				WHERE ( "INGRESO"."BASE" = :base ) AND  
       			   ( "INGRESO"."SERIE" = :serie ) AND  
                  ( "INGRESO"."CONTRATO" = :contrato ) AND  
                  ( "INGRESO"."TIPO_COB" = :t_cob )AND  
                  ( "INGRESO"."TIPO_MOV" = :t_mov )  AND
						( "INGRESO"."FECHA_PAGO" = :FECHA );
			if sqlca.sqlcode = 0 then			
				  INSERT INTO "INGRESO_AUX"  
							( "FOLIO","TIPO_COB","FECHA_PAGO","TIPO_MOV","MONTO","CUOTAS_PAG","SERIE","CONTRATO","COD_CAJA","REZAGO","VALOR_UF","PAGO_HIST","BASE","RUT","USUARIO","COD_AGE","FECHA_VENC","PAGO_EXTERNO","LUGAR_EXTERNO","VIENE_DE","FECHA_ANT","FCHA_ANT" )  
				  VALUES ( :folio ,:tipo_cob ,:fecha_pago ,:tipo_mov ,:monto ,:cuotas_pag ,:serie ,:contrato ,:cod_caja ,:rezago ,:valor_uf ,:pago_hist ,:base ,:rut ,:usuario ,:cod_age ,:fecha_venc ,:pago_externo ,:lugar_externo ,:viene_de ,:fecha_ant ,:fcha_ant  )  ;
	
				if sqlca.sqlcode <> 0 then
					ROLLBACK;
				else
					COMMIT;		
				end if
			end if	
		end if
		ole_1.object.value = j
		st_4.text = string(j)+' '
		j ++
   next
end if	
cb_1.enabled = true
cb_2.enabled = true
SetPointer(Arrow!)

end event

event dragenter;//SELECT INGRESO.SERIE,                                   
//     INGRESO.CONTRATO,                                       
//     MIN(INGRESO.FECHA_PAGO)                                 
//	  FROM INGRESO,OFERTA_V                                   
//	  WHERE ( INGRESO.SERIE    = OFERTA_V.SERIE ) and         
//	  ( INGRESO.CONTRATO       = OFERTA_V.NRO_OFERTA ) and    
//	  (INGRESO.TIPO_MOV        = A OR                 
//	  INGRESO.TIPO_MOV         = E OR                 
//	  INGRESO.TIPO_MOV        = I OR                  
//	  INGRESO.TIPO_MOV        = K) AND                
//	  (INGRESO.FECHA_PAGO >= fecha) AND             
//	  INGRESO.FECHA_PAGO <= fecha_1) AND           	  
//	  (INGRESO.PAGO_HIST      <> R) OR                
//	  (OFERTA_V.ULT_FOLIO      = 0)                           
//	  GROUP BY INGRESO.SERIE,                                 
//	  INGRESO.CONTRATO,                                       
//	  INGRESO.FECHA_PAGO                                      
//	  HAVING ( INGRESO.FECHA_PAGO = min(INGRESO.FECHA_PAGO) )
end event

type gb_1 from groupbox within w_ingreso_aux
integer x = 55
integer y = 56
integer width = 1298
integer height = 804
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = styleraised!
end type

