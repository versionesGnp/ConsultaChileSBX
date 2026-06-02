forward
global type w_mantenciones_por_periodo_vigentes from window
end type
type cb_3 from commandbutton within w_mantenciones_por_periodo_vigentes
end type
type cb_2 from commandbutton within w_mantenciones_por_periodo_vigentes
end type
type cb_1 from commandbutton within w_mantenciones_por_periodo_vigentes
end type
type uo_reg from uo_registros within w_mantenciones_por_periodo_vigentes
end type
type dw_2 from uo_datawindow within w_mantenciones_por_periodo_vigentes
end type
end forward

global type w_mantenciones_por_periodo_vigentes from window
integer x = 553
integer y = 688
integer width = 3895
integer height = 1428
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
uo_reg uo_reg
dw_2 dw_2
end type
global w_mantenciones_por_periodo_vigentes w_mantenciones_por_periodo_vigentes

type variables
Date	idt_fecha_hoy
end variables

forward prototypes
public function string wf_fecha (date fecha)
public subroutine wf_count_reg (ref long count_p, ref long count_c)
public subroutine wf_inserta_mora (double valor_cuota_m, double mora_mant, double mora_cuota, double fall)
public function integer wf_mantencion (date fecha)
end prototypes

public function string wf_fecha (date fecha);string dia,mes,año,fecha_s

dia = string(day (fecha))
año = string(year (fecha))

CHOOSE CASE  month (fecha)
	CASE 1
		fecha_s = dia+'-'+'Jan'+'-'+año
	CASE 2
		fecha_s = dia+'-'+'Feb'+'-'+año
	CASE 3
		fecha_s = dia+'-'+'Mar'+'-'+año
	CASE 4
		fecha_s = dia+'-'+'Apr'+'-'+año
	CASE 5
		fecha_s = dia+'-'+'May'+'-'+año
	CASE 6
		fecha_s = dia+'-'+'Jun'+'-'+año
	CASE 7
		fecha_s = dia+'-'+'Jul'+'-'+año
	CASE 8
		fecha_s = dia+'-'+'Aug'+'-'+año
	CASE 9
		fecha_s = dia+'-'+'Sep'+'-'+año
	CASE 10
		fecha_s = dia+'-'+'Oct'+'-'+año
	CASE 11
		fecha_s = dia+'-'+'Nov'+'-'+año
	CASE 12
		fecha_s = dia+'-'+'Dec'+'-'+año
END CHOOSE
return fecha_s
end function

public subroutine wf_count_reg (ref long count_p, ref long count_c);SELECT DISTINCT count(*)   
		into : count_p
	from CADENA,
		OFERTA_V,   
		PAGO_OFERTA  
	WHERE ( OFERTA_V.SERIE = PAGO_OFERTA.SERIE ) and  
			( OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA ) and  
			( OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO ) and  
			( CADENA.SERIE = OFERTA_V.SERIE ) and  
			( CADENA.NUMERO = OFERTA_V.NRO_OFERTA ) and  
			( CADENA.ESTADO = 'V' ) AND  
			( ( CADENA.CODIGO = 'O' ) ) and 
			(CADENA.COD_PARQUE = :gi_parque_select );


//SELECT DISTINCT count(*)   
//		into : count_c
//	 FROM CADENA,   
//			CONTRATO  
//	WHERE ( CADENA.SERIE = CONTRATO.SERIE_C ) and  
//			( CADENA.NUMERO = CONTRATO.NRO_CONTRATO ) and  
//			( ( CADENA.CODIGO = 'C' ) AND  
//			( CONTRATO.FECHA <= :fecha ) ) ;
count_c = 0
end subroutine

public subroutine wf_inserta_mora (double valor_cuota_m, double mora_mant, double mora_cuota, double fall);if mora_mant + 1 <= dw_2.rowcount() then
	if MORA_CUOTA = 0 then
		dw_2.setitem(mora_mant + 1,'cero',dw_2.getitemnumber(mora_mant + 1,'cero') + 1)
		dw_2.setitem(mora_mant + 1,'cero_uf',dw_2.getitemnumber(mora_mant + 1,'cero_uf') + ( VALOR_CUOTA_M * mora_mant ) )
	elseif MORA_CUOTA =  1 then
		dw_2.setitem(mora_mant + 1,'uno',dw_2.getitemnumber(mora_mant + 1,'uno') + 1)
		dw_2.setitem(mora_mant + 1,'uno_uf',dw_2.getitemnumber(mora_mant + 1,'uno_uf') + ( VALOR_CUOTA_M * mora_mant ) )
	elseif MORA_CUOTA =  2 then
		dw_2.setitem(mora_mant + 1,'dos',dw_2.getitemnumber(mora_mant + 1,'dos') + 1)
		dw_2.setitem(mora_mant + 1,'dos_uf',dw_2.getitemnumber(mora_mant + 1,'dos_uf') + ( VALOR_CUOTA_M * mora_mant ) )
	elseif MORA_CUOTA =  3 or  MORA_CUOTA  = 4 then
		dw_2.setitem(mora_mant + 1,'tres_cuatro',dw_2.getitemnumber(mora_mant + 1,'tres_cuatro') + 1)
		dw_2.setitem(mora_mant + 1,'tres_cuatro_uf',dw_2.getitemnumber(mora_mant + 1,'tres_cuatro_uf') + ( VALOR_CUOTA_M * mora_mant ) )
	elseif MORA_CUOTA >= 5 and MORA_CUOTA <= 12 then
		dw_2.setitem(mora_mant + 1,'cinco_doce',dw_2.getitemnumber(mora_mant + 1,'cinco_doce') + 1)
		dw_2.setitem(mora_mant + 1,'cinco_doce_uf',dw_2.getitemnumber(mora_mant + 1,'cinco_doce_uf') + ( VALOR_CUOTA_M * mora_mant ) )
	elseif MORA_CUOTA >= 13 then
		dw_2.setitem(mora_mant + 1,'trece_mas',dw_2.getitemnumber(mora_mant + 1,'trece_mas') + 1)
		dw_2.setitem(mora_mant + 1,'trece_mas_uf',dw_2.getitemnumber(mora_mant + 1,'trece_mas_uf') + ( VALOR_CUOTA_M * mora_mant ) )
	end if
	//if mora_mant >= 0 and mora_mant < 8 then
		if fall = 0 then
			dw_2.setitem(mora_mant + 1,'s_fall',dw_2.getitemnumber(mora_mant + 1,'s_fall') + 1 )
		elseif fall = 1 then
			dw_2.setitem(mora_mant + 1,'c_fall',dw_2.getitemnumber(mora_mant + 1,'c_fall') + 1 )
		end if
	//end if
end if
end subroutine

public function integer wf_mantencion (date fecha);string 	select_string,fecha_s,CODIGO,SERIE,ESTADO,MONEDA
datetime FECHA_PRIM,FECHA_M,fecha_vto
DATE     FECHA_UF
long 	 	reg,vigentes,canceladas,nulas,con_lib,sin_lib,mant_c,mant_v,&
		 	mant_v1,NUMERO,total_reg,count_p,count_c,NRO_CUOTAS,A
double 	CUOTA_PAG_M,mora_mant,CTA_PAG_S,UF_DIA,PRECIO,UF,VALOR_CUOTA_M,&
			VALOR_CUOTA,MORA_CUOTA,FALL,CTA_PAG_M

FECHA_UF = today ()
SELECT "TAB_UF"."VALOR_UF" INTO :UF FROM "TAB_UF" WHERE "TAB_UF"."FECHA_UF" = :FECHA_UF   ;
wf_count_reg(count_p,count_c)
uo_reg.hpb_1.minposition = 1
uo_reg.hpb_1.maxposition = ( count_p + count_c ) / 2
uo_reg.hpb_1.setstep = 10

//uo_reg.ole_1.object.minvalue = 1
//uo_reg.ole_1.object.maxvalue = ( count_p + count_c ) / 2
select_string = 'SELECT CADENA.CODIGO,   '+&
					 '	CADENA.SERIE,   '+&
					 '	CADENA.NUMERO,   '+&
					 '	CADENA.ESTADO,   '+&
					 '	OFERTA_V.CTA_PAG_M,   '+&
					 '	OFERTA_V.CTA_PAG_S,   '+&
					 '	PAGO_OFERTA.PRECIO,   '+&
					 '	PAGO_OFERTA.VALOR_CUOTA,   '+&
					 '	PAGO_OFERTA.FECHA_PRIM,   '+&
					 '	PAGO_OFERTA.PRECIO,   '+&
					 '	PAGO_OFERTA.UF_DIA,   '+&
					 '	PAGO_OFERTA.MONEDA,   '+&
					 '	PAGO_OFERTA.NRO_CUOTAS,   '+&
					 '	OFERTA_V.VALOR_CUOTA_M,  '+&
					 '	OFERTA_V.FECHA_M,  '+&
					 '	OFERTA_V.CTA_PAG_M  '+&
					 ' FROM CADENA,   '+&
					 '		OFERTA_V,   '+&
					 '		PAGO_OFERTA  '+&
					 '	WHERE ( OFERTA_V.SERIE = PAGO_OFERTA.SERIE ) and  '+&
					 '			( OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA ) and  '+&
					 '			( OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO ) and  '+&
					 '			( CADENA.SERIE = OFERTA_V.SERIE ) and  '+&
					 '			( CADENA.NUMERO = OFERTA_V.NRO_OFERTA ) and  '+&
					 "			( CADENA.ESTADO = '"+"V"+"' ) AND  "+&
					 "			( CADENA.CODIGO = '"+"O"+"' )  AND"+&
					 '	OFERTA_V.CTA_PAG_M < 90  and '+&
					 ' CADENA.COD_PARQUE = '+string(gi_parque_select)
					 

PREPARE sqlsa FROM :select_string;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  

IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_mora_mantencion()")
	Return -1
END IF
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :CODIGO,:SERIE,:NUMERO,:ESTADO,:CTA_PAG_M,:CTA_PAG_S,:PRECIO,:VALOR_CUOTA,:FECHA_PRIM,:PRECIO,:UF_DIA,:MONEDA,:NRO_CUOTAS,:VALOR_CUOTA_M,:FECHA_M,:CUOTA_PAG_M;
	select_string    = ''
	If sqlca.sqlcode = 0 Then
		if ESTADO     = 'V' then
			mora_mant  = f_mant( FECHA_M , CUOTA_PAG_M )
			if -daysafter(idt_fecha_hoy,funcion_venc_ano( FECHA_M , CUOTA_PAG_M  )) < 0 then 
				mora_mant = 0
			end if
			MORA_CUOTA = funcion_mora_mant ( FECHA_PRIM , CTA_PAG_S , NRO_CUOTAS )
			fecha_vto   = datetime(funcion_venc( fecha_prim , cta_pag_s ))
			if - daysafter (fecha,date(fecha_vto)) <= 5 then mora_cuota = 0
			FALL = f_fallecido (SERIE,NUMERO,CODIGO)
			wf_inserta_mora( VALOR_CUOTA_M , mora_mant , MORA_CUOTA , fall )		
		end if
	ElseIf sqlca.sqlcode < 0 Then
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_mora_mantencion()")
		Return -1
	Else
		Exit
	End If
	total_reg ++
	uo_reg.st_reg.text = 'Reg. N° : '+string(total_reg,'###,###,###,##0')+' de '+string(count_p + count_c,'###,###,###,##0')
   uo_reg.hpb_1.position = total_reg / 2
//	uo_reg.ole_1.object.value = total_reg / 2
Loop

Close dyn_cursor;
Return 1
end function

on w_mantenciones_por_periodo_vigentes.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.uo_reg=create uo_reg
this.dw_2=create dw_2
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.uo_reg,&
this.dw_2}
end on

on w_mantenciones_por_periodo_vigentes.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_reg)
destroy(this.dw_2)
end on

event open;integer i

gf_centrar(w_mantenciones_por_periodo_vigentes)
idt_fecha_hoy	= date(gdt_fec_sistema)
this.title 		= gs_app_name
uo_reg.visible = false
uo_reg.x 		= this.width/2 - uo_reg.width/2
uo_reg.y 		= this.height/2 - uo_reg.height/2
end event

type cb_3 from commandbutton within w_mantenciones_por_periodo_vigentes
integer x = 370
integer y = 1204
integer width = 315
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Calcular"
end type

event clicked;integer i
date fecha

setpointer (HourGlass!)

dw_2.reset()
for i = 1 to 8
	dw_2.insertrow(0)
	dw_2.setitem(i,'cero',0)
	dw_2.setitem(i,'cero_uf',0)
	dw_2.setitem(i,'uno',0)
	dw_2.setitem(i,'uno_uf',0)
	dw_2.setitem(i,'dos',0)
	dw_2.setitem(i,'dos_uf',0)
	dw_2.setitem(i,'tres_cuatro',0)
	dw_2.setitem(i,'tres_cuatro_uf',0)
	dw_2.setitem(i,'cinco_doce',0)
	dw_2.setitem(i,'cinco_doce_uf',0)
	dw_2.setitem(i,'trece_mas',0)
	dw_2.setitem(i,'trece_mas_uf',0)
	dw_2.setitem(i,'c_fall',0)
	dw_2.setitem(i,'s_fall',0)
	dw_2.setitem(i,'mora',i - 1)
next
//uo_reg.ole_1.object.value = 0
uo_reg.st_reg.text 	= ''
uo_reg.visible 		= true
fecha 					= today ()
wf_mantencion(fecha)
uo_reg.visible = false
if gi_parque_select = 1 then
	dw_2.object.titulo1.text = 'Promesas Vigentes Inmobiliaria Mant. ( El Prado )'	
elseif gi_parque_select = 102 then
	dw_2.object.titulo1.text = 'Promesas Vigentes Inmobiliaria Mant. ( El Manantial )'	
elseif gi_parque_select = 11 then
	dw_2.object.titulo1.text = 'Promesas Vigentes Inmobiliaria Mant. ( La Foresta )'	
elseif gi_parque_select = 801 then
	dw_2.object.titulo1.text = 'Promesas Vigentes Inmobiliaria Mant. ( Concepción )'	
end if
dw_2.object.titulo2.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
end event

type cb_2 from commandbutton within w_mantenciones_por_periodo_vigentes
integer x = 3511
integer y = 1204
integer width = 315
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenciones_por_periodo_vigentes)
end event

type cb_1 from commandbutton within w_mantenciones_por_periodo_vigentes
integer x = 50
integer y = 1204
integer width = 315
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_2.rowcount() > 0 then
	f_Print( dw_2 )
end if
end event

type uo_reg from uo_registros within w_mantenciones_por_periodo_vigentes
boolean visible = false
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_reg.destroy
call uo_registros::destroy
end on

type dw_2 from uo_datawindow within w_mantenciones_por_periodo_vigentes
integer x = 50
integer y = 52
integer width = 3776
integer height = 1112
integer taborder = 0
string dataobject = "dw_moras_credito_mant"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado='0011101'
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(This.GetRow(), TRUE)
end event

