forward
global type w_mantenciones_por_periodo from window
end type
type sle_1 from uo_convierte_numero within w_mantenciones_por_periodo
end type
type cb_7 from commandbutton within w_mantenciones_por_periodo
end type
type cb_6 from commandbutton within w_mantenciones_por_periodo
end type
type dw_2 from uo_datawindow within w_mantenciones_por_periodo
end type
type cb_5 from commandbutton within w_mantenciones_por_periodo
end type
type cb_4 from commandbutton within w_mantenciones_por_periodo
end type
type cb_3 from commandbutton within w_mantenciones_por_periodo
end type
type dw_1 from uo_datawindow within w_mantenciones_por_periodo
end type
type cb_2 from commandbutton within w_mantenciones_por_periodo
end type
type cb_1 from commandbutton within w_mantenciones_por_periodo
end type
type uo_reg from uo_registros within w_mantenciones_por_periodo
end type
end forward

global type w_mantenciones_por_periodo from window
integer x = 553
integer y = 688
integer width = 3575
integer height = 2320
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
sle_1 sle_1
cb_7 cb_7
cb_6 cb_6
dw_2 dw_2
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
uo_reg uo_reg
end type
global w_mantenciones_por_periodo w_mantenciones_por_periodo

type variables
double 	casos_mant [6,16],casos_mant_isa [6,16]
Date		idt_fecha_hoy
end variables

forward prototypes
public function integer wf_mora_mantencion_isa (string tipo_cont)
public subroutine wf_count_reg (ref long count_p, ref long count_c)
public function string wf_fecha (date fecha)
public function integer wf_mora_mantencion (string tipo_cont)
public subroutine wf_mora_mantencion_calc (string tipo_cont, integer mora, double valor, integer fall)
public subroutine wf_mora_mantencion_calc_isa (string tipo_cont, integer mora, double valor, integer fall)
end prototypes

public function integer wf_mora_mantencion_isa (string tipo_cont);string 	select_string,fecha_s,CODIGO,SERIE,ESTADO,MONEDA,DUENO
datetime FECHA_M
long 	 	reg,vigentes,canceladas,nulas,con_lib,sin_lib,mant_c,mant_v,&
		 	CTA_PAG_M,CTA_PAG_S,PRECIO,VALOR_CUOTA,UF_DIA,&
		 	reg1,vigentes1,canceladas1,nulas1,con_lib1,sin_lib1,mant_c1,&
		 	mant_v1,NUMERO,FALL,total_reg,count_p,count_c
double 	CUOTA_PAG_M,mora_mant,VALOR_CUOTA_M

wf_count_reg(count_p,count_c)
uo_reg.hpb_1.minposition = 1
uo_reg.hpb_1.maxposition = count_c 
uo_reg.hpb_1.setstep = 10
//uo_reg.ole_1.object.minvalue = 1
//uo_reg.ole_1.object.maxvalue = count_c
select_string = ' SELECT DISTINCT CADENA.CODIGO,   '+&
					 '			CADENA.SERIE,   '+&
					 '			CADENA.NUMERO,   '+&
					 '			CADENA.ESTADO,   '+&
					 '			CONTRATO.CTA_PAG_M, '+&  
					 '			CONTRATO.CTA_PAG_LA+CONTRATO.CTA_PAG_ISA,   '+&
					 '			CONTRATO.KAPITAL,   '+&
					 '			CONTRATO.VALOR_CUO,   '+&
					 '			CONTRATO.MONEDA,   '+&
					 '			CONTRATO.VALOR_CUOTA_M,  '+&
					 '			CONTRATO.FECHA_M,  '+&
					 '			CONTRATO.CTA_PAG_M,  '+&
					 '			CONTRATO.DUENO  '+&
					 '	 FROM CADENA,   '+&
					 '			CONTRATO  '+&
					 '	WHERE ( CADENA.SERIE = CONTRATO.SERIE_C ) and  '+&
					 '			( CADENA.NUMERO = CONTRATO.NRO_CONTRATO ) and  '+&
					 "			( CADENA.CODIGO = '"+'C'+"' )  "+&
					 "			( CADENA.COD_PARQUE = '"+STRING(gi_parque_select)+"' ) "
					 

PREPARE sqlsa FROM :select_string;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_mora_mantencion()")
	Return -1
END IF
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :CODIGO,:SERIE,:NUMERO,:ESTADO,:CTA_PAG_M,:CTA_PAG_S,:PRECIO,:VALOR_CUOTA,:MONEDA,:VALOR_CUOTA_M,:FECHA_M,:CUOTA_PAG_M,:DUENO;
	select_string = ''
	If sqlca.sqlcode = 0 Then
		if ESTADO = 'V' and CTA_PAG_M < 98 and tipo_cont = 'V' then
			mora_mant = f_mant(FECHA_M,CUOTA_PAG_M)
			FALL = f_fallecido (SERIE,NUMERO,CODIGO)
			wf_mora_mantencion_calc_isa(DUENO,mora_mant,VALOR_CUOTA_M,FALL)
		end if
		if estado = 'C' then
			canceladas1 ++
			if  CTA_PAG_M < 98 then
				mant_c1 ++
			end if
		elseif estado = 'V' then
			vigentes1 ++
			if  CTA_PAG_M < 98 then
				mant_v1 ++
			end if
		elseif estado = 'N' or estado = 'R' or estado = 'P' then
			nulas1 ++
		end if
		if CTA_PAG_M >= 98 then
			con_lib1 ++
		else
			if estado = 'V' or estado = 'C' then
				sin_lib1 ++
			end if
		end if
		reg1 ++			
	ElseIf sqlca.sqlcode < 0 Then
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_mora_mantencion()")
		Return -1
	Else
		Exit
	End If
	total_reg ++
	uo_reg.st_reg.text = 'Reg. N° : '+string(total_reg,'###,###,###,##0')+' de '+string(count_c,'###,###,###,##0')
   uo_reg.hpb_1.position = total_reg / 2
//	uo_reg.ole_1.object.value = total_reg
Loop
dw_1.insertrow(0)
dw_1.setitem(1,'reg',reg1)
dw_1.setitem(1,'c',canceladas1)
dw_1.setitem(1,'v',vigentes1)
dw_1.setitem(1,'n',nulas1)
dw_1.setitem(1,'cdl',con_lib1)
dw_1.setitem(1,'sdl',sin_lib1)
dw_1.setitem(1,'mantc',mant_c1)
dw_1.setitem(1,'mantv',mant_v1)
dw_1.setitem(1,'titulo','Contratos I.S.A.')
Close dyn_cursor;
Return 1
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
			( CADENA.CODIGO = 'O' ) and
			( CADENA.COD_PARQUE = :gi_parque_select ) ;
			
			


SELECT DISTINCT count(*)   
		into : count_c
	 FROM CADENA,   
			CONTRATO  
	WHERE ( CADENA.SERIE = CONTRATO.SERIE_C ) and  
			( CADENA.NUMERO = CONTRATO.NRO_CONTRATO ) and  
			( CADENA.CODIGO = 'C' )  and
			( CADENA.COD_PARQUE = :gi_parque_select ) ;
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

public function integer wf_mora_mantencion (string tipo_cont);string 	select_string,fecha_s,CODIGO,SERIE,ESTADO,MONEDA,dueno
datetime FECHA_M
long 	 	reg,vigentes,canceladas,nulas,con_lib,sin_lib,mant_c,mant_v,&
		 	CTA_PAG_M,CTA_PAG_S,PRECIO,VALOR_CUOTA,UF_DIA,&
		 	reg1,vigentes1,canceladas1,nulas1,con_lib1,sin_lib1,mant_c1,&
		 	mant_v1,NUMERO,FALL,total_reg,count_p,count_c,i
double 	CUOTA_PAG_M,mora_mant,VALOR_CUOTA_M

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
					 '	PAGO_OFERTA.MONEDA,   '+&
					 '	OFERTA_V.VALOR_CUOTA_M,  '+&
					 '	OFERTA_V.FECHA_M,  '+&
					 '	OFERTA_V.CTA_PAG_M,  '+&
				 	 "	'' "+&
					 ' FROM CADENA,   '+&
					 '		OFERTA_V,   '+&
					 '		PAGO_OFERTA  '+&
					 '	WHERE ( OFERTA_V.SERIE = PAGO_OFERTA.SERIE ) and  '+&
					 '			( OFERTA_V.NRO_OFERTA = PAGO_OFERTA.NRO_OFERTA ) and  '+&
					 '			( OFERTA_V.ULT_FOLIO = PAGO_OFERTA.FOLIO ) and  '+&
					 '			( CADENA.SERIE = OFERTA_V.SERIE ) and  '+&
					 '			( CADENA.NUMERO = OFERTA_V.NRO_OFERTA ) and  '+&
					 "			( CADENA.CODIGO = '"+"O"+"' ) and "+&
 					 "			( CADENA.COD_PARQUE = '"+STRING(gi_parque_select)+"' ) "+&
					 ' union '+&
					 ' SELECT CADENA.CODIGO,   '+&
					 '			CADENA.SERIE,   '+&
					 '			CADENA.NUMERO,   '+&
					 '			CADENA.ESTADO,   '+&
					 '			CONTRATO.CTA_PAG_M, '+&  
					 '			CONTRATO.CTA_PAG_LA+CONTRATO.CTA_PAG_ISA,   '+&
					 '			CONTRATO.KAPITAL,   '+&
					 '			CONTRATO.VALOR_CUO,   '+&
					 '			CONTRATO.MONEDA,   '+&
					 '			CONTRATO.VALOR_CUOTA_M,  '+&
					 '			CONTRATO.FECHA_M,  '+&
					 '			CONTRATO.CTA_PAG_M,  '+&
					 '			CONTRATO.DUENO  '+&
					 '	 FROM CADENA,   '+&
					 '			CONTRATO  '+&
					 '	WHERE ( CADENA.SERIE = CONTRATO.SERIE_C ) and  '+&
					 '			( CADENA.NUMERO = CONTRATO.NRO_CONTRATO ) and  '+&
					 "			( CADENA.CODIGO = '"+'C'+"' ) and "+&
 					 "			( CADENA.COD_PARQUE = '"+STRING(gi_parque_select)+"' ) "

PREPARE sqlsa FROM :select_string;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_mora_mantencion()")
	Return -1
END IF
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :CODIGO,:SERIE,:NUMERO,:ESTADO,:CTA_PAG_M,:CTA_PAG_S,:PRECIO,:VALOR_CUOTA,:MONEDA,:VALOR_CUOTA_M,:FECHA_M,:CUOTA_PAG_M,:DUENO;
	If sqlca.sqlcode = 0 Then
	select_string = ''
	if codigo = 'C' then
		if ESTADO = 'V' and CTA_PAG_M < 98 then
			mora_mant  = f_mant( FECHA_M , CUOTA_PAG_M )
			if -daysafter(idt_fecha_hoy,funcion_venc_ano( FECHA_M , CUOTA_PAG_M  )) < 0 then 
				mora_mant = 0
			end if
			FALL = f_fallecido (SERIE,NUMERO,CODIGO)
			wf_mora_mantencion_calc_isa(DUENO,mora_mant,VALOR_CUOTA_M,FALL)
		end if
	end if
	if ESTADO = 'C' and CTA_PAG_M < 98 then
		mora_mant  = f_mant( FECHA_M , CUOTA_PAG_M )
		if -daysafter(idt_fecha_hoy,funcion_venc_ano( FECHA_M , CUOTA_PAG_M  )) < 0 then 
			mora_mant = 0
		end if
		FALL = f_fallecido (SERIE,NUMERO,CODIGO)
		wf_mora_mantencion_calc(CODIGO,mora_mant,VALOR_CUOTA_M,FALL)
	else
		i++
	end if
		IF codigo = 'O' then
			if estado = 'C' then
				canceladas ++
				if  CTA_PAG_M < 98 then
					mant_c ++
				end if
			elseif estado = 'V' then
				vigentes ++
				if  CTA_PAG_M < 98 then
					mant_v ++
				end if
			elseif estado = 'N' or estado = 'R' or estado = 'P' then
				nulas ++
			end if
			if CTA_PAG_M >= 98 then
				con_lib ++
			else
				if estado = 'V' or estado = 'C' then
					sin_lib ++
				end if
			end if
			reg ++
		else
			if moneda = '1' then
	//			precio = round((precio / uf_dia),0)
			end if
			if estado = 'C' then
				canceladas1 ++
				if  CTA_PAG_M < 98 then
					mant_c1 ++
				end if
			elseif estado = 'V' then
				vigentes1 ++
				if  CTA_PAG_M < 98 then
					mant_v1 ++
				end if
			elseif estado = 'N' or estado = 'R' or estado = 'P' then
				nulas1 ++
			end if
			if CTA_PAG_M >= 98 then
				con_lib1 ++
			else
				if estado = 'V' or estado = 'C' then
					sin_lib1 ++
				end if
			end if
			reg1 ++			
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
dw_1.insertrow(0)
dw_1.setitem(1,'reg',reg1)
dw_1.setitem(1,'c',canceladas1)
dw_1.setitem(1,'v',vigentes1)
dw_1.setitem(1,'n',nulas1)
dw_1.setitem(1,'cdl',con_lib1)
dw_1.setitem(1,'sdl',sin_lib1)
dw_1.setitem(1,'mantc',mant_c1)
dw_1.setitem(1,'mantv',mant_v1)
dw_1.setitem(1,'titulo','Contratos I.S.A.')
dw_1.insertrow(0)
dw_1.setitem(2,'reg',reg)
dw_1.setitem(2,'c',canceladas)
dw_1.setitem(2,'v',vigentes)
dw_1.setitem(2,'n',nulas)
dw_1.setitem(2,'cdl',con_lib)
dw_1.setitem(2,'sdl',sin_lib)
dw_1.setitem(2,'mantc',mant_c)
dw_1.setitem(2,'mantv',mant_v)
dw_1.setitem(2,'titulo','Promesas')

Close dyn_cursor;
Return 1
end function

public subroutine wf_mora_mantencion_calc (string tipo_cont, integer mora, double valor, integer fall);if tipo_cont='C' then
	if mora = 0 then
		casos_mant[1,1] = casos_mant[1,1] + 1
		casos_mant[2,1] = casos_mant[2,1] + ( valor * mora )
		casos_mant[3,1] = casos_mant[3,1] + fall
//		dw_2.setitem(1,'isa_casos',(dw_2.getitemnumber(1,'isa_casos') + 1))
//		dw_2.setitem(1,'isa_uf',(dw_2.getitemnumber(1,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(1,'isa_sep',(dw_2.getitemnumber(1,'isa_sep') + fall))
	elseif mora = 1 then
		casos_mant[1,2] = casos_mant[1,2] + 1
		casos_mant[2,2] = casos_mant[2,2] + ( valor * mora )
		casos_mant[3,2] = casos_mant[3,2] + fall
//		dw_2.setitem(2,'isa_casos',(dw_2.getitemnumber(2,'isa_casos') + 1))
//		dw_2.setitem(2,'isa_uf',(dw_2.getitemnumber(2,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(2,'isa_sep',(dw_2.getitemnumber(2,'isa_sep') + fall))
	elseif mora = 2 then
		casos_mant[1,3] = casos_mant[1,3] + 1
		casos_mant[2,3] = casos_mant[2,3] + ( valor * mora )
		casos_mant[3,3] = casos_mant[3,3] + fall
//		dw_2.setitem(3,'isa_casos',(dw_2.getitemnumber(3,'isa_casos') + 1))
//		dw_2.setitem(3,'isa_uf',(dw_2.getitemnumber(3,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(3,'isa_sep',(dw_2.getitemnumber(3,'isa_sep') + fall))
	elseif mora = 3 then
		casos_mant[1,4] = casos_mant[1,4] + 1
		casos_mant[2,4] = casos_mant[2,4] + ( valor * mora )
		casos_mant[3,4] = casos_mant[3,4] + fall
//		dw_2.setitem(4,'isa_casos',(dw_2.getitemnumber(4,'isa_casos') + 1))
//		dw_2.setitem(4,'isa_uf',(dw_2.getitemnumber(4,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(4,'isa_sep',(dw_2.getitemnumber(4,'isa_sep') + fall))
	elseif mora = 4 then
		casos_mant[1,5] = casos_mant[1,5] + 1
		casos_mant[2,5] = casos_mant[2,5] + ( valor * mora )
		casos_mant[3,5] = casos_mant[3,5] + fall
//		dw_2.setitem(5,'isa_casos',(dw_2.getitemnumber(5,'isa_casos') + 1))
//		dw_2.setitem(5,'isa_uf',(dw_2.getitemnumber(5,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(5,'isa_sep',(dw_2.getitemnumber(5,'isa_sep') + fall))
	elseif mora = 5 then
		casos_mant[1,6] = casos_mant[1,6] + 1
		casos_mant[2,6] = casos_mant[2,6] + ( valor * mora )
		casos_mant[3,6] = casos_mant[3,6] + fall
//		dw_2.setitem(6,'isa_casos',(dw_2.getitemnumber(6,'isa_casos') + 1))
//		dw_2.setitem(6,'isa_uf',(dw_2.getitemnumber(6,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(6,'isa_sep',(dw_2.getitemnumber(6,'isa_sep') + fall))
	elseif mora = 6 then
		casos_mant[1,7] = casos_mant[1,7] + 1
		casos_mant[2,7] = casos_mant[2,7] + ( valor * mora )
		casos_mant[3,7] = casos_mant[3,7] + fall
//		dw_2.setitem(7,'isa_casos',(dw_2.getitemnumber(7,'isa_casos') + 1))
//		dw_2.setitem(7,'isa_uf',(dw_2.getitemnumber(7,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(7,'isa_sep',(dw_2.getitemnumber(7,'isa_sep') + fall))
	elseif mora = 7 then
		casos_mant[1,8] = casos_mant[1,8] + 1
		casos_mant[2,8] = casos_mant[2,8] + ( valor * mora )
		casos_mant[3,8] = casos_mant[3,8] + fall
//		dw_2.setitem(8,'isa_casos',(dw_2.getitemnumber(8,'isa_casos') + 1))
//		dw_2.setitem(8,'isa_uf',(dw_2.getitemnumber(8,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(8,'isa_sep',(dw_2.getitemnumber(8,'isa_sep') + fall))
	elseif mora = 8 then
		casos_mant[1,9] = casos_mant[1,9] + 1
		casos_mant[2,9] = casos_mant[2,9] + ( valor * mora )
		casos_mant[3,9] = casos_mant[3,9] + fall
//		dw_2.setitem(9,'isa_casos',(dw_2.getitemnumber(9,'isa_casos') + 1))
//		dw_2.setitem(9,'isa_uf',(dw_2.getitemnumber(9,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(9,'isa_sep',(dw_2.getitemnumber(9,'isa_sep') + fall))
	elseif mora = 9 then
		casos_mant[1,10] = casos_mant[1,10] + 1
		casos_mant[2,10] = casos_mant[2,10] + ( valor * mora )
		casos_mant[3,10] = casos_mant[3,10] + fall
//		dw_2.setitem(10,'isa_casos',(dw_2.getitemnumber(10,'isa_casos') + 1))
//		dw_2.setitem(10,'isa_uf',(dw_2.getitemnumber(10,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(10,'isa_sep',(dw_2.getitemnumber(10,'isa_sep') + fall))
	elseif mora = 10 then
		casos_mant[1,11] = casos_mant[1,11] + 1
		casos_mant[2,11] = casos_mant[2,11] + ( valor * mora )
		casos_mant[3,11] = casos_mant[3,11] + fall
//		dw_2.setitem(11,'isa_casos',(dw_2.getitemnumber(11,'isa_casos') + 1))
//		dw_2.setitem(11,'isa_uf',(dw_2.getitemnumber(11,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(11,'isa_sep',(dw_2.getitemnumber(11,'isa_sep') + fall))
	elseif mora = 11 then
		casos_mant[1,12] = casos_mant[1,12] + 1
		casos_mant[2,12] = casos_mant[2,12] + ( valor * mora )
		casos_mant[3,12] = casos_mant[3,12] + fall
//		dw_2.setitem(12,'isa_casos',(dw_2.getitemnumber(12,'isa_casos') + 1))
//		dw_2.setitem(12,'isa_uf',(dw_2.getitemnumber(12,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(12,'isa_sep',(dw_2.getitemnumber(12,'isa_sep') + fall))
	elseif mora = 12 then
		casos_mant[1,13] = casos_mant[1,13] + 1
		casos_mant[2,13] = casos_mant[2,13] + ( valor * mora )
		casos_mant[3,13] = casos_mant[3,13] + fall
//		dw_2.setitem(13,'isa_casos',(dw_2.getitemnumber(13,'isa_casos') + 1))
//		dw_2.setitem(13,'isa_uf',(dw_2.getitemnumber(13,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(13,'isa_sep',(dw_2.getitemnumber(13,'isa_sep') + fall))
	elseif mora = 13 then
		casos_mant[1,14] = casos_mant[1,14] + 1
		casos_mant[2,14] = casos_mant[2,14] + ( valor * mora )
		casos_mant[3,14] = casos_mant[3,14] + fall
//		dw_2.setitem(14,'isa_casos',(dw_2.getitemnumber(14,'isa_casos') + 1))
//		dw_2.setitem(14,'isa_uf',(dw_2.getitemnumber(14,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(14,'isa_sep',(dw_2.getitemnumber(14,'isa_sep') + fall))
	elseif mora = 14 then
		casos_mant[1,15] = casos_mant[1,15] + 1
		casos_mant[2,15] = casos_mant[2,15] + ( valor * mora )
		casos_mant[3,15] = casos_mant[3,15] + fall
//		dw_2.setitem(15,'isa_casos',(dw_2.getitemnumber(15,'isa_casos') + 1))
//		dw_2.setitem(15,'isa_uf',(dw_2.getitemnumber(15,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(15,'isa_sep',(dw_2.getitemnumber(15,'isa_sep') + fall))
	elseif mora >= 15 then
		casos_mant[1,16] = casos_mant[1,16] + 1
		casos_mant[2,16] = casos_mant[2,16] + ( valor * mora )
		casos_mant[3,16] = casos_mant[3,16] + fall
//		dw_2.setitem(16,'isa_casos',(dw_2.getitemnumber(16,'isa_casos') + 1))
//		dw_2.setitem(16,'isa_uf',(dw_2.getitemnumber(16,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(16,'isa_sep',(dw_2.getitemnumber(16,'isa_sep') + fall))
	end if
elseif tipo_cont = 'O' then
	if mora = 0 then
		casos_mant[4,1] = casos_mant[4,1] + 1
		casos_mant[5,1] = casos_mant[5,1] + ( valor * mora )
		casos_mant[6,1] = casos_mant[6,1] + fall
//		dw_2.setitem(1,'casos',(dw_2.getitemnumber(1,'casos') + 1))
//		dw_2.setitem(1,'uf',(dw_2.getitemnumber(1,'uf') + ( valor * mora )))
//		dw_2.setitem(1,'sep',(dw_2.getitemnumber(1,'sep') + fall))
	elseif mora = 1 then
		casos_mant[4,2] = casos_mant[4,2] + 1
		casos_mant[5,2] = casos_mant[5,2] + ( valor * mora )
		casos_mant[6,2] = casos_mant[6,2] + fall
//		dw_2.setitem(2,'casos',(dw_2.getitemnumber(2,'casos') + 1))
//		dw_2.setitem(2,'uf',(dw_2.getitemnumber(2,'uf') + ( valor * mora )))
//		dw_2.setitem(2,'sep',(dw_2.getitemnumber(2,'sep') + fall))
	elseif mora = 2 then
		casos_mant[4,3] = casos_mant[4,3] + 1
		casos_mant[5,3] = casos_mant[5,3] + ( valor * mora )
		casos_mant[6,3] = casos_mant[6,3] + fall
//		dw_2.setitem(3,'casos',(dw_2.getitemnumber(3,'casos') + 1))
//		dw_2.setitem(3,'uf',(dw_2.getitemnumber(3,'uf') + ( valor * mora )))
//		dw_2.setitem(3,'sep',(dw_2.getitemnumber(3,'sep') + fall))
	elseif mora = 3 then
		casos_mant[4,4] = casos_mant[4,4] + 1
		casos_mant[5,4] = casos_mant[5,4] + ( valor * mora )
		casos_mant[6,4] = casos_mant[6,4] + fall
//		dw_2.setitem(4,'casos',(dw_2.getitemnumber(4,'casos') + 1))
//		dw_2.setitem(4,'uf',(dw_2.getitemnumber(4,'uf') + ( valor * mora )))
//		dw_2.setitem(4,'sep',(dw_2.getitemnumber(4,'sep') + fall))
	elseif mora = 4 then
		casos_mant[4,5] = casos_mant[4,5] + 1
		casos_mant[5,5] = casos_mant[5,5] + ( valor * mora )
		casos_mant[6,5] = casos_mant[6,5] + fall
//		dw_2.setitem(5,'casos',(dw_2.getitemnumber(5,'casos') + 1))
//		dw_2.setitem(5,'uf',(dw_2.getitemnumber(5,'uf') + ( valor * mora )))
//		dw_2.setitem(5,'sep',(dw_2.getitemnumber(5,'sep') + fall))
	elseif mora = 5 then
		casos_mant[4,6] = casos_mant[4,6] + 1
		casos_mant[5,6] = casos_mant[5,6] + ( valor * mora )
		casos_mant[6,6] = casos_mant[6,6] + fall
//		dw_2.setitem(6,'casos',(dw_2.getitemnumber(6,'casos') + 1))
//		dw_2.setitem(6,'uf',(dw_2.getitemnumber(6,'uf') + ( valor * mora )))
//		dw_2.setitem(6,'sep',(dw_2.getitemnumber(6,'sep') + fall))
	elseif mora = 6 then
		casos_mant[4,7] = casos_mant[4,7] + 1
		casos_mant[5,7] = casos_mant[5,7] + ( valor * mora )
		casos_mant[6,7] = casos_mant[6,7] + fall
//		dw_2.setitem(7,'casos',(dw_2.getitemnumber(7,'casos') + 1))
//		dw_2.setitem(7,'uf',(dw_2.getitemnumber(7,'uf') + ( valor * mora )))
//		dw_2.setitem(7,'sep',(dw_2.getitemnumber(7,'sep') + fall))
	elseif mora = 7 then
		casos_mant[4,8] = casos_mant[4,8] + 1
		casos_mant[5,8] = casos_mant[5,8] + ( valor * mora )
		casos_mant[6,8] = casos_mant[6,8] + fall
//		dw_2.setitem(8,'casos',(dw_2.getitemnumber(8,'casos') + 1))
//		dw_2.setitem(8,'uf',(dw_2.getitemnumber(8,'uf') + ( valor * mora )))
//		dw_2.setitem(8,'sep',(dw_2.getitemnumber(8,'sep') + fall))
	elseif mora = 8 then
		casos_mant[4,9] = casos_mant[4,9] + 1
		casos_mant[5,9] = casos_mant[5,9] + ( valor * mora )
		casos_mant[6,9] = casos_mant[6,9] + fall
//		dw_2.setitem(9,'casos',(dw_2.getitemnumber(9,'casos') + 1))
//		dw_2.setitem(9,'uf',(dw_2.getitemnumber(9,'uf') + ( valor * mora )))
//		dw_2.setitem(9,'sep',(dw_2.getitemnumber(9,'sep') + fall))
	elseif mora = 9 then
		casos_mant[4,10] = casos_mant[4,10] + 1
		casos_mant[5,10] = casos_mant[5,10] + ( valor * mora )
		casos_mant[6,10] = casos_mant[6,10] + fall
//		dw_2.setitem(10,'casos',(dw_2.getitemnumber(10,'casos') + 1))
//		dw_2.setitem(10,'uf',(dw_2.getitemnumber(10,'uf') + ( valor * mora )))
//		dw_2.setitem(10,'sep',(dw_2.getitemnumber(10,'sep') + fall))
	elseif mora = 10 then
		casos_mant[4,11] = casos_mant[4,11] + 1
		casos_mant[5,11] = casos_mant[5,11] + ( valor * mora )
		casos_mant[6,11] = casos_mant[6,11] + fall
//		dw_2.setitem(11,'casos',(dw_2.getitemnumber(11,'casos') + 1))
//		dw_2.setitem(11,'uf',(dw_2.getitemnumber(11,'uf') + ( valor * mora )))
//		dw_2.setitem(11,'sep',(dw_2.getitemnumber(11,'sep') + fall))
	elseif mora = 11 then
		casos_mant[4,12] = casos_mant[4,12] + 1
		casos_mant[5,12] = casos_mant[5,12] + ( valor * mora )
		casos_mant[6,12] = casos_mant[6,12] + fall
//		dw_2.setitem(12,'casos',(dw_2.getitemnumber(12,'casos') + 1))
//		dw_2.setitem(12,'uf',(dw_2.getitemnumber(12,'uf') + ( valor * mora )))
//		dw_2.setitem(12,'sep',(dw_2.getitemnumber(12,'sep') + fall))
	elseif mora = 12 then
		casos_mant[4,13] = casos_mant[4,13] + 1
		casos_mant[5,13] = casos_mant[5,13] + ( valor * mora )
		casos_mant[6,13] = casos_mant[6,13] + fall
//		dw_2.setitem(13,'casos',(dw_2.getitemnumber(13,'casos') + 1))
//		dw_2.setitem(13,'uf',(dw_2.getitemnumber(13,'uf') + ( valor * mora )))
//		dw_2.setitem(13,'sep',(dw_2.getitemnumber(13,'sep') + fall))
	elseif mora = 13 then
		casos_mant[4,14] = casos_mant[4,14] + 1
		casos_mant[5,14] = casos_mant[5,14] + ( valor * mora )
		casos_mant[6,14] = casos_mant[6,14] + fall
//		dw_2.setitem(14,'casos',(dw_2.getitemnumber(14,'casos') + 1))
//		dw_2.setitem(14,'uf',(dw_2.getitemnumber(14,'uf') + ( valor * mora )))
//		dw_2.setitem(14,'sep',(dw_2.getitemnumber(14,'sep') + fall))
	elseif mora = 14 then
		casos_mant[4,15] = casos_mant[4,15] + 1
		casos_mant[5,15] = casos_mant[5,15] + ( valor * mora )
		casos_mant[6,15] = casos_mant[6,15] + fall
//		dw_2.setitem(15,'casos',(dw_2.getitemnumber(15,'casos') + 1))
//		dw_2.setitem(15,'uf',(dw_2.getitemnumber(15,'uf') + ( valor * mora )))
//		dw_2.setitem(15,'sep',(dw_2.getitemnumber(15,'sep') + fall))
	elseif mora >= 15 then
		casos_mant[4,16] = casos_mant[4,16] + 1
		casos_mant[5,16] = casos_mant[5,16] + ( valor * mora )
		casos_mant[6,16] = casos_mant[6,16] + fall
//		dw_2.setitem(16,'casos',(dw_2.getitemnumber(16,'casos') + 1))
//		dw_2.setitem(16,'uf',(dw_2.getitemnumber(16,'uf') + ( valor * mora )))
//		dw_2.setitem(16,'sep',(dw_2.getitemnumber(16,'sep') + fall))
	end if
end if
//dw_2.accepttext ()
end subroutine

public subroutine wf_mora_mantencion_calc_isa (string tipo_cont, integer mora, double valor, integer fall);if tipo_cont = 'I' or tipo_cont = 'F' then
	if mora = 0 then
		casos_mant_isa[1,1] = casos_mant_isa[1,1] + 1
		casos_mant_isa[2,1] = casos_mant_isa[2,1] + ( valor * mora )
		casos_mant_isa[3,1] = casos_mant_isa[3,1] + fall
//		dw_2.setitem(1,'isa_casos',(dw_2.getitemnumber(1,'isa_casos') + 1))
//		dw_2.setitem(1,'isa_uf',(dw_2.getitemnumber(1,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(1,'isa_sep',(dw_2.getitemnumber(1,'isa_sep') + fall))
	elseif mora = 1 then
		casos_mant_isa[1,2] = casos_mant_isa[1,2] + 1
		casos_mant_isa[2,2] = casos_mant_isa[2,2] + ( valor * mora )
		casos_mant_isa[3,2] = casos_mant_isa[3,2] + fall
//		dw_2.setitem(2,'isa_casos',(dw_2.getitemnumber(2,'isa_casos') + 1))
//		dw_2.setitem(2,'isa_uf',(dw_2.getitemnumber(2,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(2,'isa_sep',(dw_2.getitemnumber(2,'isa_sep') + fall))
	elseif mora = 2 then
		casos_mant_isa[1,3] = casos_mant_isa[1,3] + 1
		casos_mant_isa[2,3] = casos_mant_isa[2,3] + ( valor * mora )
		casos_mant_isa[3,3] = casos_mant_isa[3,3] + fall
//		dw_2.setitem(3,'isa_casos',(dw_2.getitemnumber(3,'isa_casos') + 1))
//		dw_2.setitem(3,'isa_uf',(dw_2.getitemnumber(3,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(3,'isa_sep',(dw_2.getitemnumber(3,'isa_sep') + fall))
	elseif mora = 3 then
		casos_mant_isa[1,4] = casos_mant_isa[1,4] + 1
		casos_mant_isa[2,4] = casos_mant_isa[2,4] + ( valor * mora )
		casos_mant_isa[3,4] = casos_mant_isa[3,4] + fall
//		dw_2.setitem(4,'isa_casos',(dw_2.getitemnumber(4,'isa_casos') + 1))
//		dw_2.setitem(4,'isa_uf',(dw_2.getitemnumber(4,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(4,'isa_sep',(dw_2.getitemnumber(4,'isa_sep') + fall))
	elseif mora = 4 then
		casos_mant_isa[1,5] = casos_mant_isa[1,5] + 1
		casos_mant_isa[2,5] = casos_mant_isa[2,5] + ( valor * mora )
		casos_mant_isa[3,5] = casos_mant_isa[3,5] + fall
//		dw_2.setitem(5,'isa_casos',(dw_2.getitemnumber(5,'isa_casos') + 1))
//		dw_2.setitem(5,'isa_uf',(dw_2.getitemnumber(5,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(5,'isa_sep',(dw_2.getitemnumber(5,'isa_sep') + fall))
	elseif mora = 5 then
		casos_mant_isa[1,6] = casos_mant_isa[1,6] + 1
		casos_mant_isa[2,6] = casos_mant_isa[2,6] + ( valor * mora )
		casos_mant_isa[3,6] = casos_mant_isa[3,6] + fall
//		dw_2.setitem(6,'isa_casos',(dw_2.getitemnumber(6,'isa_casos') + 1))
//		dw_2.setitem(6,'isa_uf',(dw_2.getitemnumber(6,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(6,'isa_sep',(dw_2.getitemnumber(6,'isa_sep') + fall))
	elseif mora = 6 then
		casos_mant_isa[1,7] = casos_mant_isa[1,7] + 1
		casos_mant_isa[2,7] = casos_mant_isa[2,7] + ( valor * mora )
		casos_mant_isa[3,7] = casos_mant_isa[3,7] + fall
//		dw_2.setitem(7,'isa_casos',(dw_2.getitemnumber(7,'isa_casos') + 1))
//		dw_2.setitem(7,'isa_uf',(dw_2.getitemnumber(7,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(7,'isa_sep',(dw_2.getitemnumber(7,'isa_sep') + fall))
	elseif mora = 7 then
		casos_mant_isa[1,8] = casos_mant_isa[1,8] + 1
		casos_mant_isa[2,8] = casos_mant_isa[2,8] + ( valor * mora )
		casos_mant_isa[3,8] = casos_mant_isa[3,8] + fall
//		dw_2.setitem(8,'isa_casos',(dw_2.getitemnumber(8,'isa_casos') + 1))
//		dw_2.setitem(8,'isa_uf',(dw_2.getitemnumber(8,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(8,'isa_sep',(dw_2.getitemnumber(8,'isa_sep') + fall))
	elseif mora = 8 then
		casos_mant_isa[1,9] = casos_mant_isa[1,9] + 1
		casos_mant_isa[2,9] = casos_mant_isa[2,9] + ( valor * mora )
		casos_mant_isa[3,9] = casos_mant_isa[3,9] + fall
//		dw_2.setitem(9,'isa_casos',(dw_2.getitemnumber(9,'isa_casos') + 1))
//		dw_2.setitem(9,'isa_uf',(dw_2.getitemnumber(9,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(9,'isa_sep',(dw_2.getitemnumber(9,'isa_sep') + fall))
	elseif mora = 9 then
		casos_mant_isa[1,10] = casos_mant_isa[1,10] + 1
		casos_mant_isa[2,10] = casos_mant_isa[2,10] + ( valor * mora )
		casos_mant_isa[3,10] = casos_mant_isa[3,10] + fall
//		dw_2.setitem(10,'isa_casos',(dw_2.getitemnumber(10,'isa_casos') + 1))
//		dw_2.setitem(10,'isa_uf',(dw_2.getitemnumber(10,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(10,'isa_sep',(dw_2.getitemnumber(10,'isa_sep') + fall))
	elseif mora = 10 then
		casos_mant_isa[1,11] = casos_mant_isa[1,11] + 1
		casos_mant_isa[2,11] = casos_mant_isa[2,11] + ( valor * mora )
		casos_mant_isa[3,11] = casos_mant_isa[3,11] + fall
//		dw_2.setitem(11,'isa_casos',(dw_2.getitemnumber(11,'isa_casos') + 1))
//		dw_2.setitem(11,'isa_uf',(dw_2.getitemnumber(11,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(11,'isa_sep',(dw_2.getitemnumber(11,'isa_sep') + fall))
	elseif mora = 11 then
		casos_mant_isa[1,12] = casos_mant_isa[1,12] + 1
		casos_mant_isa[2,12] = casos_mant_isa[2,12] + ( valor * mora )
		casos_mant_isa[3,12] = casos_mant_isa[3,12] + fall
//		dw_2.setitem(12,'isa_casos',(dw_2.getitemnumber(12,'isa_casos') + 1))
//		dw_2.setitem(12,'isa_uf',(dw_2.getitemnumber(12,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(12,'isa_sep',(dw_2.getitemnumber(12,'isa_sep') + fall))
	elseif mora = 12 then
		casos_mant_isa[1,13] = casos_mant_isa[1,13] + 1
		casos_mant_isa[2,13] = casos_mant_isa[2,13] + ( valor * mora )
		casos_mant_isa[3,13] = casos_mant_isa[3,13] + fall
//		dw_2.setitem(13,'isa_casos',(dw_2.getitemnumber(13,'isa_casos') + 1))
//		dw_2.setitem(13,'isa_uf',(dw_2.getitemnumber(13,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(13,'isa_sep',(dw_2.getitemnumber(13,'isa_sep') + fall))
	elseif mora = 13 then
		casos_mant_isa[1,14] = casos_mant_isa[1,14] + 1
		casos_mant_isa[2,14] = casos_mant_isa[2,14] + ( valor * mora )
		casos_mant_isa[3,14] = casos_mant_isa[3,14] + fall
//		dw_2.setitem(14,'isa_casos',(dw_2.getitemnumber(14,'isa_casos') + 1))
//		dw_2.setitem(14,'isa_uf',(dw_2.getitemnumber(14,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(14,'isa_sep',(dw_2.getitemnumber(14,'isa_sep') + fall))
	elseif mora = 14 then
		casos_mant_isa[1,15] = casos_mant_isa[1,15] + 1
		casos_mant_isa[2,15] = casos_mant_isa[2,15] + ( valor * mora )
		casos_mant_isa[3,15] = casos_mant_isa[3,15] + fall
//		dw_2.setitem(15,'isa_casos',(dw_2.getitemnumber(15,'isa_casos') + 1))
//		dw_2.setitem(15,'isa_uf',(dw_2.getitemnumber(15,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(15,'isa_sep',(dw_2.getitemnumber(15,'isa_sep') + fall))
	elseif mora >= 15 then
		casos_mant_isa[1,16] = casos_mant_isa[1,16] + 1
		casos_mant_isa[2,16] = casos_mant_isa[2,16] + ( valor * mora )
		casos_mant_isa[3,16] = casos_mant_isa[3,16] + fall
//		dw_2.setitem(16,'isa_casos',(dw_2.getitemnumber(16,'isa_casos') + 1))
//		dw_2.setitem(16,'isa_uf',(dw_2.getitemnumber(16,'isa_uf') + ( valor * mora )))
//		dw_2.setitem(16,'isa_sep',(dw_2.getitemnumber(16,'isa_sep') + fall))
	end if
else
	if mora = 0 then
		casos_mant_isa[4,1] = casos_mant_isa[4,1] + 1
		casos_mant_isa[5,1] = casos_mant_isa[5,1] + ( valor * mora )
		casos_mant_isa[6,1] = casos_mant_isa[6,1] + fall
//		dw_2.setitem(1,'casos',(dw_2.getitemnumber(1,'casos') + 1))
//		dw_2.setitem(1,'uf',(dw_2.getitemnumber(1,'uf') + ( valor * mora )))
//		dw_2.setitem(1,'sep',(dw_2.getitemnumber(1,'sep') + fall))
	elseif mora = 1 then
		casos_mant_isa[4,2] = casos_mant_isa[4,2] + 1
		casos_mant_isa[5,2] = casos_mant_isa[5,2] + ( valor * mora )
		casos_mant_isa[6,2] = casos_mant_isa[6,2] + fall
//		dw_2.setitem(2,'casos',(dw_2.getitemnumber(2,'casos') + 1))
//		dw_2.setitem(2,'uf',(dw_2.getitemnumber(2,'uf') + ( valor * mora )))
//		dw_2.setitem(2,'sep',(dw_2.getitemnumber(2,'sep') + fall))
	elseif mora = 2 then
		casos_mant_isa[4,3] = casos_mant_isa[4,3] + 1
		casos_mant_isa[5,3] = casos_mant_isa[5,3] + ( valor * mora )
		casos_mant_isa[6,3] = casos_mant_isa[6,3] + fall
//		dw_2.setitem(3,'casos',(dw_2.getitemnumber(3,'casos') + 1))
//		dw_2.setitem(3,'uf',(dw_2.getitemnumber(3,'uf') + ( valor * mora )))
//		dw_2.setitem(3,'sep',(dw_2.getitemnumber(3,'sep') + fall))
	elseif mora = 3 then
		casos_mant_isa[4,4] = casos_mant_isa[4,4] + 1
		casos_mant_isa[5,4] = casos_mant_isa[5,4] + ( valor * mora )
		casos_mant_isa[6,4] = casos_mant_isa[6,4] + fall
//		dw_2.setitem(4,'casos',(dw_2.getitemnumber(4,'casos') + 1))
//		dw_2.setitem(4,'uf',(dw_2.getitemnumber(4,'uf') + ( valor * mora )))
//		dw_2.setitem(4,'sep',(dw_2.getitemnumber(4,'sep') + fall))
	elseif mora = 4 then
		casos_mant_isa[4,5] = casos_mant_isa[4,5] + 1
		casos_mant_isa[5,5] = casos_mant_isa[5,5] + ( valor * mora )
		casos_mant_isa[6,5] = casos_mant_isa[6,5] + fall
//		dw_2.setitem(5,'casos',(dw_2.getitemnumber(5,'casos') + 1))
//		dw_2.setitem(5,'uf',(dw_2.getitemnumber(5,'uf') + ( valor * mora )))
//		dw_2.setitem(5,'sep',(dw_2.getitemnumber(5,'sep') + fall))
	elseif mora = 5 then
		casos_mant_isa[4,6] = casos_mant_isa[4,6] + 1
		casos_mant_isa[5,6] = casos_mant_isa[5,6] + ( valor * mora )
		casos_mant_isa[6,6] = casos_mant_isa[6,6] + fall
//		dw_2.setitem(6,'casos',(dw_2.getitemnumber(6,'casos') + 1))
//		dw_2.setitem(6,'uf',(dw_2.getitemnumber(6,'uf') + ( valor * mora )))
//		dw_2.setitem(6,'sep',(dw_2.getitemnumber(6,'sep') + fall))
	elseif mora = 6 then
		casos_mant_isa[4,7] = casos_mant_isa[4,7] + 1
		casos_mant_isa[5,7] = casos_mant_isa[5,7] + ( valor * mora )
		casos_mant_isa[6,7] = casos_mant_isa[6,7] + fall
//		dw_2.setitem(7,'casos',(dw_2.getitemnumber(7,'casos') + 1))
//		dw_2.setitem(7,'uf',(dw_2.getitemnumber(7,'uf') + ( valor * mora )))
//		dw_2.setitem(7,'sep',(dw_2.getitemnumber(7,'sep') + fall))
	elseif mora = 7 then
		casos_mant_isa[4,8] = casos_mant_isa[4,8] + 1
		casos_mant_isa[5,8] = casos_mant_isa[5,8] + ( valor * mora )
		casos_mant_isa[6,8] = casos_mant_isa[6,8] + fall
//		dw_2.setitem(8,'casos',(dw_2.getitemnumber(8,'casos') + 1))
//		dw_2.setitem(8,'uf',(dw_2.getitemnumber(8,'uf') + ( valor * mora )))
//		dw_2.setitem(8,'sep',(dw_2.getitemnumber(8,'sep') + fall))
	elseif mora = 8 then
		casos_mant_isa[4,9] = casos_mant_isa[4,9] + 1
		casos_mant_isa[5,9] = casos_mant_isa[5,9] + ( valor * mora )
		casos_mant_isa[6,9] = casos_mant_isa[6,9] + fall
//		dw_2.setitem(9,'casos',(dw_2.getitemnumber(9,'casos') + 1))
//		dw_2.setitem(9,'uf',(dw_2.getitemnumber(9,'uf') + ( valor * mora )))
//		dw_2.setitem(9,'sep',(dw_2.getitemnumber(9,'sep') + fall))
	elseif mora = 9 then
		casos_mant_isa[4,10] = casos_mant_isa[4,10] + 1
		casos_mant_isa[5,10] = casos_mant_isa[5,10] + ( valor * mora )
		casos_mant_isa[6,10] = casos_mant_isa[6,10] + fall
//		dw_2.setitem(10,'casos',(dw_2.getitemnumber(10,'casos') + 1))
//		dw_2.setitem(10,'uf',(dw_2.getitemnumber(10,'uf') + ( valor * mora )))
//		dw_2.setitem(10,'sep',(dw_2.getitemnumber(10,'sep') + fall))
	elseif mora = 10 then
		casos_mant_isa[4,11] = casos_mant_isa[4,11] + 1
		casos_mant_isa[5,11] = casos_mant_isa[5,11] + ( valor * mora )
		casos_mant_isa[6,11] = casos_mant_isa[6,11] + fall
//		dw_2.setitem(11,'casos',(dw_2.getitemnumber(11,'casos') + 1))
//		dw_2.setitem(11,'uf',(dw_2.getitemnumber(11,'uf') + ( valor * mora )))
//		dw_2.setitem(11,'sep',(dw_2.getitemnumber(11,'sep') + fall))
	elseif mora = 11 then
		casos_mant_isa[4,12] = casos_mant_isa[4,12] + 1
		casos_mant_isa[5,12] = casos_mant_isa[5,12] + ( valor * mora )
		casos_mant_isa[6,12] = casos_mant_isa[6,12] + fall
//		dw_2.setitem(12,'casos',(dw_2.getitemnumber(12,'casos') + 1))
//		dw_2.setitem(12,'uf',(dw_2.getitemnumber(12,'uf') + ( valor * mora )))
//		dw_2.setitem(12,'sep',(dw_2.getitemnumber(12,'sep') + fall))
	elseif mora = 12 then
		casos_mant_isa[4,13] = casos_mant_isa[4,13] + 1
		casos_mant_isa[5,13] = casos_mant_isa[5,13] + ( valor * mora )
		casos_mant_isa[6,13] = casos_mant_isa[6,13] + fall
//		dw_2.setitem(13,'casos',(dw_2.getitemnumber(13,'casos') + 1))
//		dw_2.setitem(13,'uf',(dw_2.getitemnumber(13,'uf') + ( valor * mora )))
//		dw_2.setitem(13,'sep',(dw_2.getitemnumber(13,'sep') + fall))
	elseif mora = 13 then
		casos_mant_isa[4,14] = casos_mant_isa[4,14] + 1
		casos_mant_isa[5,14] = casos_mant_isa[5,14] + ( valor * mora )
		casos_mant_isa[6,14] = casos_mant_isa[6,14] + fall
//		dw_2.setitem(14,'casos',(dw_2.getitemnumber(14,'casos') + 1))
//		dw_2.setitem(14,'uf',(dw_2.getitemnumber(14,'uf') + ( valor * mora )))
//		dw_2.setitem(14,'sep',(dw_2.getitemnumber(14,'sep') + fall))
	elseif mora = 14 then
		casos_mant_isa[4,15] = casos_mant_isa[4,15] + 1
		casos_mant_isa[5,15] = casos_mant_isa[5,15] + ( valor * mora )
		casos_mant_isa[6,15] = casos_mant_isa[6,15] + fall
//		dw_2.setitem(15,'casos',(dw_2.getitemnumber(15,'casos') + 1))
//		dw_2.setitem(15,'uf',(dw_2.getitemnumber(15,'uf') + ( valor * mora )))
//		dw_2.setitem(15,'sep',(dw_2.getitemnumber(15,'sep') + fall))
	elseif mora >= 15 then
		casos_mant_isa[4,16] = casos_mant_isa[4,16] + 1
		casos_mant_isa[5,16] = casos_mant_isa[5,16] + ( valor * mora )
		casos_mant_isa[6,16] = casos_mant_isa[6,16] + fall
//		dw_2.setitem(16,'casos',(dw_2.getitemnumber(16,'casos') + 1))
//		dw_2.setitem(16,'uf',(dw_2.getitemnumber(16,'uf') + ( valor * mora )))
//		dw_2.setitem(16,'sep',(dw_2.getitemnumber(16,'sep') + fall))
	end if
end if
//dw_2.accepttext ()
end subroutine

on w_mantenciones_por_periodo.create
this.sle_1=create sle_1
this.cb_7=create cb_7
this.cb_6=create cb_6
this.dw_2=create dw_2
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.uo_reg=create uo_reg
this.Control[]={this.sle_1,&
this.cb_7,&
this.cb_6,&
this.dw_2,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.uo_reg}
end on

on w_mantenciones_por_periodo.destroy
destroy(this.sle_1)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.dw_2)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_reg)
end on

event open;integer i

gf_centrar(w_mantenciones_por_periodo)
idt_fecha_hoy	= date(gdt_fec_sistema)
this.title = gs_app_name
uo_reg.visible = false
uo_reg.x = this.width/2 - uo_reg.width/2
uo_reg.y = this.height/2 - uo_reg.height/2
end event

type sle_1 from uo_convierte_numero within w_mantenciones_por_periodo
boolean visible = false
integer x = 55
integer y = 2284
integer width = 3456
integer taborder = 30
borderstyle borderstyle = stylelowered!
end type

type cb_7 from commandbutton within w_mantenciones_por_periodo
integer x = 1463
integer y = 2088
integer width = 768
integer height = 96
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Vigentes Isacruz"
end type

event clicked;integer i

dw_2.reset()
dw_2.dataobject = 'dw_cacelados_prado_isa'
for i = 1 to 16
	dw_2.insertrow(0)
	dw_2.setitem(i,'casos',0)
	dw_2.setitem(i,'uf',0)
	dw_2.setitem(i,'isa_casos',0)
	dw_2.setitem(i,'isa_uf',0)
	dw_2.setitem(i,'isa_sep',0)
	dw_2.setitem(i,'sep',0)
	dw_2.setitem(i,'mora',i - 1)
	dw_2.setitem(i,'isa_casos',casos_mant_isa[1,i])
	dw_2.setitem(i,'isa_uf',   casos_mant_isa[2,i])
	dw_2.setitem(i,'isa_sep',  casos_mant_isa[3,i])
	dw_2.setitem(i,'casos',    casos_mant_isa[4,i])
	dw_2.setitem(i,'uf',       casos_mant_isa[5,i])
	dw_2.setitem(i,'sep',      casos_mant_isa[6,i])
next
dw_2.object.isa_casos_t.text = 'Propios'
dw_2.object.isa_uf_t.text = 'U.F.'
dw_2.object.fall_isacruz_t.text = 'Fallecidos'
dw_2.object.casos_t.text = 'Ajenos.'
dw_2.object.uf_t.text = 'U.F.'
dw_2.object.fall_t.text = 'Fallecidos'
dw_2.object.total_casos_t.text = 'Total Casos'
dw_2.object.total_uf_t.text = 'Total U.F.'
dw_2.object.total_fall_t.text = 'Total Fall.'
if gi_parque_select = 1 then
	dw_2.object.titulo.text = 'Mantención Isacruz Vigentes ( El,Prado )'
elseif gi_parque_select = 102 then
	dw_2.object.titulo.text = 'Mantención Isacruz Vigentes ( El Manantial )'
elseif gi_parque_select = 11 then
		dw_2.object.titulo.text = 'Mantención Isacruz Vigentes ( La Foresta )'
end if
dw_2.object.titulo1.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
dw_2.accepttext ()
end event

type cb_6 from commandbutton within w_mantenciones_por_periodo
integer x = 690
integer y = 2088
integer width = 768
integer height = 96
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Canceladas El Prado / Isacruz"
end type

event clicked;integer i

dw_2.reset()
dw_2.dataobject = 'dw_cacelados_prado'
//for i = 1 to 17
//	if casos_mant[1,i] <=0 then casos_mant[1,i] = 0
//	if casos_mant[2,i] <=0 then casos_mant[2,i] = 0
//	if casos_mant[3,i] <=0 then casos_mant[3,i] = 0
//	if casos_mant[4,i] <=0 then casos_mant[4,i] = 0
//	if casos_mant[5,i] <=0 then casos_mant[5,i] = 0
//	if casos_mant[6,i] <=0 then casos_mant[6,i] = 0
//	if isnull(casos_mant[1,i]) then casos_mant[1,i] = 0
//	if isnull(casos_mant[2,i]) then casos_mant[2,i] = 0
//	if isnull(casos_mant[3,i]) then casos_mant[3,i] = 0
//	if isnull(casos_mant[4,i]) then casos_mant[4,i] = 0
//	if isnull(casos_mant[5,i]) then casos_mant[5,i] = 0
//	if isnull(casos_mant[6,i]) then casos_mant[6,i] = 0
//next
for i = 1 to 16
	dw_2.insertrow(0)
	dw_2.setitem(i,'casos',0)
	dw_2.setitem(i,'uf',0)
	dw_2.setitem(i,'isa_casos',0)
	dw_2.setitem(i,'isa_uf',0)
	dw_2.setitem(i,'isa_sep',0)
	dw_2.setitem(i,'sep',0)
	dw_2.setitem(i,'mora',i - 1)
	dw_2.setitem(i,'isa_casos',casos_mant[1,i])
	dw_2.setitem(i,'isa_uf',   casos_mant[2,i])
	dw_2.setitem(i,'isa_sep',  casos_mant[3,i])
	dw_2.setitem(i,'casos',    casos_mant[4,i])
	dw_2.setitem(i,'uf',       casos_mant[5,i])
	dw_2.setitem(i,'sep',      casos_mant[6,i])
next
dw_2.object.isa_casos_t.text = 'Casos Isacruz'
dw_2.object.isa_uf_t.text = 'U.F. Isacruz'
dw_2.object.fall_isacruz_t.text = 'Fall. Isacruz'
dw_2.object.casos_t.text = 'Casos Prom.'
dw_2.object.uf_t.text = 'U.F. Prom.'
dw_2.object.fall_t.text = 'Fall  Prom.'
dw_2.object.total_casos_t.text = 'Total Casos'
dw_2.object.total_uf_t.text = 'Total U.F.'
dw_2.object.total_fall_t.text = 'Total Fall.'

if gi_parque_select = 1 then
	dw_2.object.titulo.text = 'Mantención Contratos Cancelados ( El,Prado )'
elseif gi_parque_select = 102 then
	dw_2.object.titulo.text = 'Mantención Contratos Cancelados ( El Manantial )'
elseif gi_parque_select = 11 then
	dw_2.object.titulo.text = 'Mantención Contratos Cancelados ( La Foresta )'
end if
dw_2.object.titulo1.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
//dw_2.object.isa_casos_0.text = 
//dw_2.object.isa_uf_0.text = 
//dw_2.object.isa_sep_0.text = 
//dw_2.object.v_c_isa_0.text = 
dw_2.accepttext ()
end event

type dw_2 from uo_datawindow within w_mantenciones_por_periodo
integer x = 50
integer y = 728
integer width = 3461
integer height = 1320
integer taborder = 0
string dataobject = "dw_cacelados_prado"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(This.GetRow(), TRUE)
end event

event constructor;call super::constructor;MenuHabilitado='0011101'
end event

type cb_5 from commandbutton within w_mantenciones_por_periodo
boolean visible = false
integer x = 1147
integer y = 2372
integer width = 773
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Vigentes Isacruz"
end type

event clicked;integer i
date fecha

setpointer (HourGlass!)
dw_1.reset()
dw_2.reset()
//dw_2.dataobject = 'dw_cacelados_prado_isa'
for i = 1 to 16
	dw_2.insertrow(0)
	dw_2.setitem(i,'casos',0)
	dw_2.setitem(i,'uf',0)
	dw_2.setitem(i,'isa_casos',0)
	dw_2.setitem(i,'isa_uf',0)
	dw_2.setitem(i,'isa_sep',0)
	dw_2.setitem(i,'sep',0)
	dw_2.setitem(i,'mora',i - 1)
next
dw_2.object.isa_casos_t.text = 'Propios'
dw_2.object.isa_uf_t.text = 'U.F.'
dw_2.object.fall_isacruz_t.text = 'Fallecidos'
dw_2.object.casos_t.text = 'Ajenos'
dw_2.object.uf_t.text = 'U.F.'
dw_2.object.fall_t.text = 'Fallecidos'
dw_2.object.total_casos_t.text = 'Total Casos'
dw_2.object.total_uf_t.text = 'Total U.F.'
dw_2.object.total_fall_t.text = 'Total Fall.'
//s_fall_prom_t

//uo_reg.ole_1.object.value = 0
uo_reg.st_reg.text = ''
uo_reg.visible = true

wf_mora_mantencion_isa('V')
dw_1.object.titulo1.text = 'Mantención por Producto ( '+gs_empresa+' )'
dw_1.object.titulo2.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
dw_2.object.titulo.text = 'Mantención Isacruz Vigentes ( '+gs_empresa+' )'
dw_2.object.titulo1.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
uo_reg.visible = false
end event

type cb_4 from commandbutton within w_mantenciones_por_periodo
boolean visible = false
integer x = 1929
integer y = 2372
integer width = 315
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Vigentes"
end type

event clicked;integer i
date fecha

setpointer (HourGlass!)
dw_1.reset()
dw_2.reset()
for i = 1 to 14
	dw_2.insertrow(0)
	dw_2.setitem(i,'casos',0)
	dw_2.setitem(i,'uf',0)
	dw_2.setitem(i,'isa_casos',0)
	dw_2.setitem(i,'isa_uf',0)
	dw_2.setitem(i,'isa_sep',0)
	dw_2.setitem(i,'sep',0)
	dw_2.setitem(i,'mora',i - 1)
next
dw_2.object.isa_casos_t.text = 'Casos Isacruz'
dw_2.object.isa_uf_t.text = 'U.F. Isacruz'
dw_2.object.fall_isacruz_t.text = 'Fall. Isacruz'
dw_2.object.casos_t.text = 'Casos Prom.'
dw_2.object.uf_t.text = 'U.F. Prom.'
dw_2.object.fall_t.text = 'Fall  Prom.'
dw_2.object.total_casos_t.text = 'Total Casos'
dw_2.object.total_uf_t.text = 'Total U.F.'
dw_2.object.total_fall_t.text = 'Total Fall.'
//uo_reg.ole_1.object.value = 0
uo_reg.st_reg.text = ''
uo_reg.visible = true
wf_mora_mantencion('V')
dw_1.object.titulo1.text = 'Mantención por Producto ( '+gs_empresa+' )'
dw_1.object.titulo2.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
dw_2.object.titulo.text = 'Mantención Contratos Vigentes ( '+gs_empresa+' )'
dw_2.object.titulo1.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
uo_reg.visible = false
end event

type cb_3 from commandbutton within w_mantenciones_por_periodo
integer x = 370
integer y = 2088
integer width = 315
integer height = 96
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Calcular"
end type

event clicked;integer i
date fecha

setpointer (HourGlass!)

for i = 1 to 16
	casos_mant_isa[1,i] = 0
	casos_mant_isa[2,i] = 0
	casos_mant_isa[3,i] = 0
	casos_mant_isa[4,i] = 0
	casos_mant_isa[5,i] = 0
	casos_mant_isa[6,i] = 0
	casos_mant[1,i] = 0
	casos_mant[2,i] = 0
	casos_mant[3,i] = 0
	casos_mant[4,i] = 0
	casos_mant[5,i] = 0
	casos_mant[6,i] = 0
next
//uo_reg.ole_1.object.value = 0
uo_reg.st_reg.text = ''
uo_reg.visible = true
wf_mora_mantencion('C')
uo_reg.visible = false
cb_6.enabled = true
cb_7.enabled = true
this.enabled = false
if gi_parque_select = 1 then
	dw_1.object.titulo1.text = 'Mantención por Producto ( El,Prado )'	
elseif gi_parque_select = 102 then
	dw_1.object.titulo1.text = 'Mantención por Producto ( El Manantial )'	
elseif gi_parque_select = 11 then
	dw_1.object.titulo1.text = 'Mantención por Producto ( La Foresta )'	
end if
dw_1.object.titulo2.text = 'Fecha de Corte : '+string(today (),'dd/mm/yyyy')
cb_6.triggerevent (clicked!)
end event

type dw_1 from uo_datawindow within w_mantenciones_por_periodo
integer x = 50
integer y = 40
integer width = 3461
integer height = 668
integer taborder = 0
string dataobject = "dw_resultado_mantencion"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;MenuHabilitado='0011101' 
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(This.GetRow(), TRUE)
end event

type cb_2 from commandbutton within w_mantenciones_por_periodo
integer x = 3195
integer y = 2088
integer width = 315
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenciones_por_periodo)
end event

type cb_1 from commandbutton within w_mantenciones_por_periodo
integer x = 50
integer y = 2088
integer width = 315
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
	if dw_2.rowcount() > 0 then
		f_Print( dw_2 )
	end if
end if

end event

type uo_reg from uo_registros within w_mantenciones_por_periodo
boolean visible = false
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_reg.destroy
call uo_registros::destroy
end on

event dragdrop;call super::dragdrop;//ole_1.object.value = 0
end event

