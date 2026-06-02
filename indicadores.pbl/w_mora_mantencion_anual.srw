forward
global type w_mora_mantencion_anual from window
end type
type cb_3 from commandbutton within w_mora_mantencion_anual
end type
type dw_1 from datawindow within w_mora_mantencion_anual
end type
type cb_2 from commandbutton within w_mora_mantencion_anual
end type
type cb_1 from commandbutton within w_mora_mantencion_anual
end type
end forward

global type w_mora_mantencion_anual from window
integer x = 270
integer y = 36
integer width = 3022
integer height = 2376
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_mora_mantencion_anual w_mora_mantencion_anual

forward prototypes
public function string wf_numero_mes (integer numero)
end prototypes

public function string wf_numero_mes (integer numero);CHOOSE CASE NUMERO
	CASE 1
		RETURN 'Enero'
	CASE 2
		RETURN 'Febrero'
	CASE 3
		RETURN 'Marzo'
	CASE 4
		RETURN 'Abril'
	CASE 5
		RETURN 'Mayo'
	CASE 6
		RETURN 'Junio'
	CASE 7
		RETURN 'Julio'
	CASE 8
		RETURN 'Agosto'
	CASE 9
		RETURN 'Septiembre'
	CASE 10
		RETURN 'Octubre'
	CASE 11
		RETURN 'Noviembre'
	CASE 12
		RETURN 'Diciembre'
END CHOOSE

end function

on w_mora_mantencion_anual.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_mora_mantencion_anual.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string sql,titulo1
integer i,j
setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name+' ( Mora Anual )'
for i = 1 to 12
	dw_1.insertrow(0)
next	
if gstr_param.tipo = 'Promesa' then
		for i = 1 to 12
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 13 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and  '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 13 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,7,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 5 )  and  '+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 12 )  '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" ) and  '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 5 )  and  '+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 12 ) and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,6,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 3 )  and  '+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 4 )  '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 3 )  and  '+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 4 ) and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,5,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 2 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 2 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,4,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 1 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 1 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,3,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 0 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 0 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,2,i)		
			titulo1 = 'Mora Anual de Mantención de Promesas'
		next
else
		for i = 1 to 12
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 13 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 13 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,7,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 5 )  and  '+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 12 )  '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 5 )  and  '+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 12 ) and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,6,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 3 )  and  '+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 4 )  '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" >= 3 )  and  '+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" <= 4 ) and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,5,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 2 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 2 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,4,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 1 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 1 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,3,i)		
//			sql =	'SELECT count("HISTORICO_MANT"."BASE")  '+&
//					'FROM "HISTORICO_MANT"  '+&
//					'WHERE ( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
//					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
//					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 0 )   '
			sql =	'SELECT  count("HISTORICO_MANT"."BASE")  '+&
					'FROM "CADENA",   '+&
					'"HISTORICO_MANT"  '+&
					'WHERE ( "CADENA"."CODIGO" = "HISTORICO_MANT"."BASE" ) and  '+&
					'( "CADENA"."SERIE" = "HISTORICO_MANT"."SERIE" ) and  '+&
					'( "CADENA"."NUMERO" = "HISTORICO_MANT"."NUMERO" )  and '+&
					'( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
					'( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' )  and "+&
					'( "HISTORICO_MANT"."MES_'+string(i)+'" = 0 )  and '+&
					'( "CADENA"."COD_PARQUE" = '+STRING(gi_parque_select)+' )   '
			f_matenciones_anual(sql,dw_1,2,i)		
			titulo1 = 'Mora Anual de Mantención de Contratos ISA'
		next
end if
if gi_parque_select = 1 then
	dw_1.object.titulo.text  = 'El Prado'
elseif gi_parque_select = 102 then 
	dw_1.object.titulo.text  = 'El Manantial'
elseif gi_parque_select = 11 then
	dw_1.object.titulo.text  = 'La Foresta'
elseif gi_parque_select = 801 then
	dw_1.object.titulo.text  = 'Concepción'
end if
dw_1.object.titulo1.text = titulo1
dw_1.object.titulo2.text = 'Año de Corte: '+gstr_param.fecha_1
end event

type cb_3 from commandbutton within w_mora_mantencion_anual
integer x = 366
integer y = 2132
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Gráfico"
end type

event clicked;datawindow	dw_paso
dw_paso = dw_1

open(w_mora_mantencion_anual_grafico)
end event

type dw_1 from datawindow within w_mora_mantencion_anual
integer x = 46
integer y = 48
integer width = 2903
integer height = 2032
string dataobject = "dw_mora_mant_anual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mora_mantencion_anual
integer x = 2642
integer y = 2132
integer width = 306
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_mantencion_anual)
end event

type cb_1 from commandbutton within w_mora_mantencion_anual
integer x = 50
integer y = 2132
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() >0 then 
	f_Print( dw_1 )
end if
end event

