forward
global type w_mantenciones_por_periodo_vigentes_cred from window
end type
type cb_3 from commandbutton within w_mantenciones_por_periodo_vigentes_cred
end type
type cb_2 from commandbutton within w_mantenciones_por_periodo_vigentes_cred
end type
type cb_1 from commandbutton within w_mantenciones_por_periodo_vigentes_cred
end type
type uo_reg from uo_registros within w_mantenciones_por_periodo_vigentes_cred
end type
type dw_2 from uo_datawindow within w_mantenciones_por_periodo_vigentes_cred
end type
end forward

global type w_mantenciones_por_periodo_vigentes_cred from window
integer x = 553
integer y = 688
integer width = 3895
integer height = 2240
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
global w_mantenciones_por_periodo_vigentes_cred w_mantenciones_por_periodo_vigentes_cred

type variables
Date	idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_count_reg (ref long count_p, ref long count_c)
public function string wf_fecha (date fecha)
public subroutine wf_inserta_mora (double valor_cuota, double mora_mant, double mora_cuota, double fall)
public function integer wf_mantencion (date fecha)
end prototypes

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
			( CADENA.COD_PARQUE = :gi_parque_select );




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

public subroutine wf_inserta_mora (double valor_cuota, double mora_mant, double mora_cuota, double fall);integer i

if MORA_CUOTA  = 0  then i = 1
if MORA_CUOTA  = 1  then i = 2
if MORA_CUOTA  = 2  then i = 3
if MORA_CUOTA  = 3  or   MORA_CUOTA  =  4 then i = 4
if MORA_CUOTA >= 5  and  MORA_CUOTA <= 12 then i = 5
if MORA_CUOTA >= 13 then i = 6

if mora_mant = 0 then
	dw_2.setitem(i,'cero',dw_2.getitemnumber(i,'cero') + 1)
	dw_2.setitem(i,'uf_cero',dw_2.getitemnumber(i,'uf_cero') + ( VALOR_CUOTA * mora_cuota ) )
	if fall = 0 then
		dw_2.setitem(i,'s_f_cero',dw_2.getitemnumber(i,'s_f_cero') + 1 )
	elseif fall = 1 then
		dw_2.setitem(i,'c_f_cero',dw_2.getitemnumber(i,'c_f_cero') + 1 )
	end if
elseif mora_mant = 1 then
	dw_2.setitem(i,'uno',dw_2.getitemnumber(i,'uno') + 1)
	dw_2.setitem(i,'uf_uno',dw_2.getitemnumber(i,'uf_uno') + ( VALOR_CUOTA * mora_cuota ) )
	if fall = 0 then
		dw_2.setitem(i,'s_f_uno',dw_2.getitemnumber(i,'s_f_uno') + 1 )
	elseif fall = 1 then
		dw_2.setitem(i,'c_f_uno',dw_2.getitemnumber(i,'c_f_uno') + 1 )
	end if
elseif mora_mant = 2 then
	dw_2.setitem(i,'dos',dw_2.getitemnumber(i,'dos') + 1)
	dw_2.setitem(i,'uf_dos',dw_2.getitemnumber(i,'uf_dos') + ( VALOR_CUOTA * mora_cuota ) )
	if fall = 0 then
		dw_2.setitem(i,'s_f_dos',dw_2.getitemnumber(i,'s_f_dos') + 1 )
	elseif fall = 1 then
		dw_2.setitem(i,'c_f_dos',dw_2.getitemnumber(i,'c_f_dos') + 1 )
	end if
elseif mora_mant = 3 then
	dw_2.setitem(i,'tres',dw_2.getitemnumber(i,'tres') + 1)
	dw_2.setitem(i,'uf_tres',dw_2.getitemnumber(i,'uf_tres') + ( VALOR_CUOTA * mora_cuota ) )
	if fall = 0 then
		dw_2.setitem(i,'s_f_tres',dw_2.getitemnumber(i,'s_f_tres') + 1 )
	elseif fall = 1 then
		dw_2.setitem(i,'c_f_tres',dw_2.getitemnumber(i,'c_f_tres') + 1 )
	end if
elseif mora_mant = 4 then
	dw_2.setitem(i,'cuatro',dw_2.getitemnumber(i,'cuatro') + 1)
	dw_2.setitem(i,'uf_cuatro',dw_2.getitemnumber(i,'uf_cuatro') + ( VALOR_CUOTA * mora_cuota ) )
	if fall = 0 then
		dw_2.setitem(i,'s_f_cuatro',dw_2.getitemnumber(i,'s_f_cuatro') + 1 )
	elseif fall = 1 then
		dw_2.setitem(i,'c_f_cuatro',dw_2.getitemnumber(i,'c_f_cuatro') + 1 )
	end if
elseif mora_mant >= 5 then
	dw_2.setitem(i,'cinco',dw_2.getitemnumber(i,'cinco') + 1)
	dw_2.setitem(i,'uf_cinco',dw_2.getitemnumber(i,'uf_cinco') + ( VALOR_CUOTA * mora_cuota ) )
	if fall = 0 then
		dw_2.setitem(i,'s_f_cinco',dw_2.getitemnumber(i,'s_f_cinco') + 1 )
	elseif fall = 1 then
		dw_2.setitem(i,'c_f_cinco',dw_2.getitemnumber(i,'c_f_cinco') + 1 )
	end if
//elseif mora_mant = 6 then
//	dw_2.setitem(i,'seis',dw_2.getitemnumber(i,'seis') + 1)
//	dw_2.setitem(i,'uf_seis',dw_2.getitemnumber(i,'uf_seis') + ( VALOR_CUOTA * mora_mant ) )
//	if fall = 0 then
//		dw_2.setitem(i,'s_f_seis',dw_2.getitemnumber(i,'s_f_seis') + 1 )
//	elseif fall = 1 then
//		dw_2.setitem(i,'c_f_seis',dw_2.getitemnumber(i,'c_f_seis') + 1 )
//	end if
//elseif mora_mant = 7 then
//	dw_2.setitem(i,'siete',dw_2.getitemnumber(i,'siete') + 1)
//	dw_2.setitem(i,'uf_siete',dw_2.getitemnumber(i,'uf_siete') + ( VALOR_CUOTA * mora_cuota ) )
//	if fall = 0 then
//		dw_2.setitem(i,'s_f_siete',dw_2.getitemnumber(i,'s_f_siete') + 1 )
//	elseif fall = 1 then
//		dw_2.setitem(i,'c_f_siete',dw_2.getitemnumber(i,'c_f_siete') + 1 )
//	end if
end if
end subroutine

public function integer wf_mantencion (date fecha);string 	select_string,fecha_s,CODIGO,SERIE,ESTADO,MONEDA
datetime FECHA_PRIM,FECHA_M,fecha_vto
DATE     FECHA_UF
long 	 	reg,vigentes,canceladas,nulas,con_lib,sin_lib,mant_c,mant_v,&
		 	mant_v1,NUMERO,total_reg,count_p,count_c,NRO_CUOTAS,A,dias
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
					 '	      ( OFERTA_V.CTA_PAG_M < 90  ) and '+&
					 '       ( CADENA.COD_PARQUE =	'+string(gi_parque_select)+' )'


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
			if MONEDA = '1' then VALOR_CUOTA = VALOR_CUOTA / UF_DIA
			MORA_CUOTA = funcion_mora_mant ( FECHA_PRIM , CTA_PAG_S , NRO_CUOTAS )
			
			fecha_vto   = datetime(funcion_venc( fecha_prim , cta_pag_s ))//<------------------------
			dias = - daysafter (fecha,date(fecha_vto))
			if dias <= 5 then mora_cuota = 0//<------------------------
			
			
			FALL = f_fallecido (SERIE,NUMERO,CODIGO)
			wf_inserta_mora( VALOR_CUOTA , mora_mant , MORA_CUOTA , fall )		
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

on w_mantenciones_por_periodo_vigentes_cred.create
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

on w_mantenciones_por_periodo_vigentes_cred.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_reg)
destroy(this.dw_2)
end on

event open;integer i

gf_centrar(w_mantenciones_por_periodo_vigentes_cred)
idt_fecha_hoy	= date(gdt_fec_sistema)
this.title = gs_app_name
uo_reg.visible = false
uo_reg.x = this.width/2 - uo_reg.width/2
uo_reg.y = this.height/2 - uo_reg.height/2
end event

type cb_3 from commandbutton within w_mantenciones_por_periodo_vigentes_cred
integer x = 384
integer y = 2020
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
for i = 1 to 6
	dw_2.insertrow(0)
	dw_2.setitem(i,'cero',0)
	dw_2.setitem(i,'uf_cero',0)
	dw_2.setitem(i,'s_f_cero',0)
	dw_2.setitem(i,'c_f_cero',0)
	dw_2.setitem(i,'uno',0)
	dw_2.setitem(i,'uf_uno',0)
	dw_2.setitem(i,'s_f_uno',0)
	dw_2.setitem(i,'c_f_uno',0)
	dw_2.setitem(i,'dos',0)
	dw_2.setitem(i,'uf_dos',0)
	dw_2.setitem(i,'s_f_dos',0)
	dw_2.setitem(i,'c_f_dos',0)
	dw_2.setitem(i,'tres',0)
	dw_2.setitem(i,'uf_tres',0)
	dw_2.setitem(i,'s_f_tres',0)
	dw_2.setitem(i,'c_f_tres',0)
	dw_2.setitem(i,'cuatro',0)
	dw_2.setitem(i,'uf_cuatro',0)
	dw_2.setitem(i,'s_f_cuatro',0)
	dw_2.setitem(i,'c_f_cuatro',0)
	dw_2.setitem(i,'cinco',0)
	dw_2.setitem(i,'uf_cinco',0)
	dw_2.setitem(i,'s_f_cinco',0)
	dw_2.setitem(i,'c_f_cinco',0)
//	dw_2.setitem(i,'seis',0)
//	dw_2.setitem(i,'uf_seis',0)
//	dw_2.setitem(i,'s_f_seis',0)
//	dw_2.setitem(i,'c_f_seis',0)
//	dw_2.setitem(i,'siete',0)
//	dw_2.setitem(i,'uf_siete',0)
//	dw_2.setitem(i,'s_f_siete',0)
//	dw_2.setitem(i,'c_f_siete',0)
	if i = 1 then	dw_2.setitem(i,'mora','0')
	if i = 2 then	dw_2.setitem(i,'mora','1')
	if i = 3 then	dw_2.setitem(i,'mora','2')
	if i = 4 then	dw_2.setitem(i,'mora','3 - 4')
	if i = 5 then	dw_2.setitem(i,'mora','5 - 12')
	if i = 6 then	dw_2.setitem(i,'mora','13 +')
next
//uo_reg.ole_1.object.value = 0
uo_reg.st_reg.text = ''
uo_reg.visible = true
fecha = today ()
wf_mantencion(fecha)
uo_reg.visible = false

if gi_parque_select = 1 then
	dw_2.object.titulo.text = 'Promesas Vigentes Inmobiliaria Crédito ( El Prado )'
elseif gi_parque_select = 102 then
	dw_2.object.titulo.text = 'Promesas Vigentes Inmobiliaria Crédito ( El Manantial )'
elseif gi_parque_select = 11 then
	dw_2.object.titulo.text = 'Promesas Vigentes Inmobiliaria Crédito ( La Foresta )'
elseif gi_parque_select = 801 then
	dw_2.object.titulo.text = 'Promesas Vigentes Inmobiliaria Crédito ( Concepción )'
end if
dw_2.object.titulo1.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
end event

type cb_2 from commandbutton within w_mantenciones_por_periodo_vigentes_cred
integer x = 3506
integer y = 2020
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

event clicked;close(w_mantenciones_por_periodo_vigentes_cred)
end event

type cb_1 from commandbutton within w_mantenciones_por_periodo_vigentes_cred
integer x = 59
integer y = 2020
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

type uo_reg from uo_registros within w_mantenciones_por_periodo_vigentes_cred
boolean visible = false
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_reg.destroy
call uo_registros::destroy
end on

type dw_2 from uo_datawindow within w_mantenciones_por_periodo_vigentes_cred
integer x = 50
integer y = 56
integer width = 3776
integer height = 1920
integer taborder = 0
string dataobject = "dw_moras_credito"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado='0011101'
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(This.GetRow(), TRUE)
end event

