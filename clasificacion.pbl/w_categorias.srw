forward
global type w_categorias from window
end type
type st_1 from statictext within w_categorias
end type
type dw_1 from uo_datawindow within w_categorias
end type
type ddlb_1 from dropdownlistbox within w_categorias
end type
type cb_2 from commandbutton within w_categorias
end type
type dw_3 from datawindow within w_categorias
end type
type dw_2 from datawindow within w_categorias
end type
type cb_1 from commandbutton within w_categorias
end type
end forward

global type w_categorias from window
integer width = 3566
integer height = 2128
boolean titlebar = true
string title = "Clasificación Historica"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_1 st_1
dw_1 dw_1
ddlb_1 ddlb_1
cb_2 cb_2
dw_3 dw_3
dw_2 dw_2
cb_1 cb_1
end type
global w_categorias w_categorias

forward prototypes
public function string wf_mes (integer mes)
public function double wf_produccion (string cod)
end prototypes

public function string wf_mes (integer mes);
if      mes = 1 then
	return 'Enero'
elseif  mes = 2 then
	return 'Febrero'	
elseif  mes = 3 then
	return 'Marzo'
elseif  mes = 4 then
	return 'Abril'
elseif  mes = 5 then
	return 'Mayo'
elseif  mes = 6 then
	return 'Junio'
elseif  mes = 7 then
	return 'Julio'
elseif  mes = 8 then
	return 'Agosto'	
elseif  mes = 9 then
	return 'Septiembre'
elseif  mes = 10 then
	return 'Octubre'
elseif  mes = 11 then
	return 'Noviembre'
elseif  mes = 12 then
		return 'Diciembre'
end if
end function

public function double wf_produccion (string cod);double uno,dos,tres,cuatro,total


/****************** Promesas $ ******************/
SELECT round(sum( "PAGO_OFERTA"."PRECIO"/"PAGO_OFERTA"."UF_DIA"),2)  
into: uno
FROM "OFERTA_V", "PAGO_OFERTA"  
WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
	( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
	( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
	( ( "OFERTA_V"."CIERRE_VENTA" = (  SELECT DISTINCT max( "CIERRE_VENTA"."CIERRE_VENTA")  
													 FROM "CIERRE_VENTA" )) AND  
	( "PAGO_OFERTA"."MONEDA" = '1' ) )  and ("OFERTA_V"."COD_AGE" = :cod);
if isnull(uno) then uno = 0
/***************** Promesas UF *****************/
SELECT round(sum( "PAGO_OFERTA"."PRECIO"),2)  
into :dos
FROM "OFERTA_V", "PAGO_OFERTA"  
WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
	( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
	( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
	( ( "OFERTA_V"."CIERRE_VENTA" = (  SELECT DISTINCT max( "CIERRE_VENTA"."CIERRE_VENTA")  
													 FROM "CIERRE_VENTA" )) AND  
	( "PAGO_OFERTA"."MONEDA" = '2' ) )  and ("OFERTA_V"."COD_AGE" = :cod);
if isnull(dos) then dos = 0
/******************** Lib. $ ********************/
SELECT ROUND(SUM("PAGO_LIBERADOR"."PRECIO"/"PAGO_LIBERADOR"."UF_DIA"),2)  
into :tres
FROM "ANEXO_LIBERADOR",   
	"PAGO_LIBERADOR"  
WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
	( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
	( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
	( ( "ANEXO_LIBERADOR"."CIERRE_VENTA" = (  SELECT DISTINCT MAX("CIERRE_VENTA"."CIERRE_VENTA")  
															  FROM "CIERRE_VENTA" )) AND  
	( "PAGO_LIBERADOR"."MONEDA" = '1' ) AND  
	( "ANEXO_LIBERADOR"."COD_AGENTE" = :cod ) )   ;
if isnull(tres) then tres = 0
/******************* Lib. UF *******************/
SELECT SUM("PAGO_LIBERADOR"."PRECIO")  
into :cuatro
FROM "ANEXO_LIBERADOR",   
	"PAGO_LIBERADOR"  
WHERE ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
	( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
	( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
	( ( "ANEXO_LIBERADOR"."CIERRE_VENTA" = (  SELECT DISTINCT MAX("CIERRE_VENTA"."CIERRE_VENTA")  
															  FROM "CIERRE_VENTA" )) AND  
	( "PAGO_LIBERADOR"."MONEDA" = '2' ) AND  	( "ANEXO_LIBERADOR"."COD_AGENTE" = :cod ) )   ;
if isnull(cuatro) then cuatro = 0
/**********************************************/
total = uno + dos + tres + cuatro

return total
end function

on w_categorias.create
this.st_1=create st_1
this.dw_1=create dw_1
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.dw_1,&
this.ddlb_1,&
this.cb_2,&
this.dw_3,&
this.dw_2,&
this.cb_1}
end on

on w_categorias.destroy
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cb_1)
end on

event open;string ls_estado_aux

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
SELECT	"JEFE_VENTAS"."ESTADO"  
INTO 		:ls_estado_aux  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	ddlb_1.text				= gs_user
	ddlb_1.enabled			= false
	ddlb_1.triggerevent(modified!)
else
	SELECT	"SUPERVISOR"."ESTADO"  
	INTO 		:ls_estado_aux  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ddlb_1.text			= gs_user
		ddlb_1.enabled		= false
		ddlb_1.triggerevent(modified!)
	else
		ddlb_1.enabled	= true
	end if
end if
f_ddlb_all_clasificacion(ddlb_1,"SELECT cod_sup, nombre,a_paterno FROM supervisor where estado = 'A'" ,0)

end event

type st_1 from statictext within w_categorias
integer x = 69
integer y = 72
integer width = 722
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccionar Supervisor:"
boolean focusrectangle = false
end type

type dw_1 from uo_datawindow within w_categorias
integer x = 37
integer y = 208
integer width = 3474
integer height = 1636
integer taborder = 10
string dataobject = "dw_resultado_categorias"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)

end event

event constructor;call super::constructor;MenuHabilitado='1011011'
end event

type ddlb_1 from dropdownlistbox within w_categorias
integer x = 791
integer y = 56
integer width = 1829
integer height = 1448
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string cod_age,age,nombre,tipo_clas,mes1,mes2,mes3,mes4,mes5,mes6,mes7,mes8,mes9,mes10,mes11,mes12,&
		 clasifica,cod_sup,nombre_sup,clas_sup,canal_sup,ls_cod_jefe,nombre_jefe
date fecha_ini,fecha_clas,fecha
double i,j,filas,contratos,mora,porcentaje,vsp,vsp_clas,vsp_sup,meta,prod,porc_sup

dw_1.reset()
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
if dw_3.retrieve(mid(this.text,1,3)) > 0 then
	for i = 1 to dw_3.rowcount()
		cod_age = dw_3.getitemstring(i,1)
		meta = dw_3.getitemnumber(i,2)
		prod = wf_produccion(cod_age)
		if dw_2.retrieve(cod_age) > 0 then
			filas = dw_2.rowcount()
			age        = dw_2.getitemstring(filas,'age')
			nombre     = dw_2.getitemstring(filas,'nombre')
			fecha_ini  = date(dw_2.getitemdatetime(filas,'fecha_ini'))
			fecha_clas = date(dw_2.getitemdatetime(filas,'fecha_clas'))
			tipo_clas  = dw_2.getitemstring(filas,'tipo_clas')
			fecha      = date(dw_2.getitemdatetime(filas,'fecha'))
			setnull(mes1);setnull(mes2);setnull(mes3);setnull(mes4);setnull(mes5);setnull(mes6);setnull(mes7);setnull(mes8);setnull(mes9);setnull(mes10);setnull(mes11);setnull(mes12);
			if filas > 11 then mes1 =  dw_2.getitemstring(filas -11 ,'tipo_clas')
			if filas > 10 then 
				mes2 =  dw_2.getitemstring(filas -10 ,'tipo_clas')
				dw_1.object.mes2_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -10,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -10,'fecha_clas')))),3,2)
			end if
			if filas >  9 then 
				mes3 =  dw_2.getitemstring(filas - 9 ,'tipo_clas')
				dw_1.object.mes3_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -9,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -9,'fecha_clas')))),3,2)
			end if
			if filas >  8 then 
				mes4 =  dw_2.getitemstring(filas - 8 ,'tipo_clas')
				dw_1.object.mes4_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -8,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -8,'fecha_clas')))),3,2)
			end if
			if filas >  7 then 
				mes5 =  dw_2.getitemstring(filas - 7 ,'tipo_clas')
				dw_1.object.mes5_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -7,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -7,'fecha_clas')))),3,2)
			end if
			if filas >  6 then 
				mes6 =  dw_2.getitemstring(filas - 6 ,'tipo_clas')
				dw_1.object.mes6_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -6,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -6,'fecha_clas')))),3,2)
			end if
			if filas >  5 then 
				mes7 =  dw_2.getitemstring(filas - 5 ,'tipo_clas')
				dw_1.object.mes7_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -5,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -5,'fecha_clas')))),3,2)
			end if
			if filas >  4 then 
				mes8 =  dw_2.getitemstring(filas - 4 ,'tipo_clas')
				dw_1.object.mes8_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -4,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -4,'fecha_clas')))),3,2)
			end if
			if filas >  3 then 
				mes9 =  dw_2.getitemstring(filas - 3 ,'tipo_clas')
				dw_1.object.mes9_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -3,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -3,'fecha_clas')))),3,2)
			end if
			if filas >  2 then 
				mes10 = dw_2.getitemstring(filas - 2 ,'tipo_clas')
				dw_1.object.mes10_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas -2,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -2,'fecha_clas')))),3,2)
			end if
			if filas >  1 then 
				mes11 = dw_2.getitemstring(filas - 1 ,'tipo_clas')
				dw_1.object.mes11_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas  -1,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas -1,'fecha_clas')))),3,2)
			end if
			if filas >  0 then 
				mes12 = dw_2.getitemstring(filas     ,'tipo_clas')
				dw_1.object.t_3.text = 'Última Clas.: '+mid(wf_mes(Month(date(dw_2.getitemdatetime(filas,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas,'fecha_clas')))),3,2)
				dw_1.object.mes12_t.text = mid(wf_mes(Month(date(dw_2.getitemdatetime(filas,'fecha_clas')))),1,3)+'-'+mid(string(year(date(dw_2.getitemdatetime(filas,'fecha_clas')))),3,2)
			end if
			dw_1.insertrow(0)
			SELECT CONTRATOS_CLASIFICA,MORA_CLASIFICA,PORCE_CLASIFICA,VSP,TIPO_CLASIFICA  
			into :contratos,:mora,:porcentaje,:vsp_clas,:clasifica
			FROM CLASIFICA_HIST  
			WHERE ( COD_AGE = :age ) AND  
			( FECHA_CLASIFICA = (  SELECT max(FECHA_CLASIFICA) FROM CLASIFICA_HIST ))   ;
			dw_1.setitem(dw_1.rowcount(),'mes1',mes1)
			dw_1.setitem(dw_1.rowcount(),'mes2',mes2)
			dw_1.setitem(dw_1.rowcount(),'mes3',mes3)
			dw_1.setitem(dw_1.rowcount(),'mes4',mes4)
			dw_1.setitem(dw_1.rowcount(),'mes5',mes5)
			dw_1.setitem(dw_1.rowcount(),'mes6',mes6)
			dw_1.setitem(dw_1.rowcount(),'mes7',mes7)
			dw_1.setitem(dw_1.rowcount(),'mes8',mes8)
			dw_1.setitem(dw_1.rowcount(),'mes9',mes9)
			dw_1.setitem(dw_1.rowcount(),'mes10',mes10)
			dw_1.setitem(dw_1.rowcount(),'mes11',mes11)
			dw_1.setitem(dw_1.rowcount(),'mes12',mes12)
			dw_1.setitem(dw_1.rowcount(),'codigo',age)
			dw_1.setitem(dw_1.rowcount(),'nombre',nombre)
			dw_1.setitem(dw_1.rowcount(),'fecha_ini',fecha_ini)
			dw_1.setitem(dw_1.rowcount(),'cant_pro',contratos)
			dw_1.setitem(dw_1.rowcount(),'mora',mora)
			dw_1.setitem(dw_1.rowcount(),'porc',porcentaje)
			dw_1.setitem(dw_1.rowcount(),'vsp',vsp_clas)
			dw_1.setitem(dw_1.rowcount(),'clas_act',clasifica)
		end if
		dw_1.setitem(dw_1.rowcount(),'meta',meta)
		dw_1.setitem(dw_1.rowcount(),'prod',prod)
	next
	cod_sup = mid(this.text,1,3)
	
	SELECT NOMBRE||' '||A_PATERNO||' '||A_MATERNO as nombre,CLASIFICA,canal,VSP,cod_jefe  
	into :nombre_sup,:clas_sup,:canal_sup,:vsp_sup,:ls_cod_jefe
	FROM SUPERVISOR  
	WHERE COD_SUP = :cod_sup ;
	
	SELECT round(PORCE_CLASIFICA_SUP,2) 
	into   :porc_sup 
	FROM CLASIFICA_HIST_SUP  
	WHERE ( COD_SUP = :cod_sup ) AND ( FECHA_CLASIFICA_SUP = (  SELECT max(FECHA_CLASIFICA_SUP) FROM CLASIFICA_HIST_SUP ))   ;
	
	SELECT "JEFE_VENTAS"."NOMBRE"||' '||"JEFE_VENTAS"."A_PATERNO"||' '||"JEFE_VENTAS"."A_MATERNO"  
	into : nombre_jefe
	FROM "JEFE_VENTAS"  
	WHERE "JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe ;

	dw_1.object.t_2.text = 'Supervisor: '+mid(this.text,1,3)+' - Nombre: '+nombre_sup+' (Canal: '+canal_sup+')'
	dw_1.object.t_1.text = 'Clasificación: '+clas_sup+' - VSP: '+string(vsp_sup) +' - Pocentaje: '+string(porc_sup,'##0,##')+'%'
	dw_1.object.t_5.text = gs_conexion
	dw_1.object.t_6.text = 'Jefe de Venta : '+ls_cod_jefe+' - Nomnre: '+nombre_jefe
	
//	dw_1.setfilter("( mes12='A' and   mes11='A' and    mes10='A' and    mes9 ='A' and   mes8 ='A' and   mes7 ='A') and  ( prod > meta )")
//	dw_1.filter()
	
	
end if
end event

type cb_2 from commandbutton within w_categorias
integer x = 37
integer y = 1888
integer width = 329
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
//	f_printdlg(dw_1,gstr_print,parent)
end if
end event

type dw_3 from datawindow within w_categorias
integer x = 3762
integer y = 964
integer width = 571
integer height = 600
integer taborder = 30
string title = "none"
string dataobject = "dw_agetentes_categoria"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_categorias
integer x = 3712
integer y = 284
integer width = 571
integer height = 600
integer taborder = 20
boolean titlebar = true
string title = "none"
string dataobject = "w_clas_fecha_agente"
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

type cb_1 from commandbutton within w_categorias
integer x = 3150
integer y = 1888
integer width = 361
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_categorias)
end event

