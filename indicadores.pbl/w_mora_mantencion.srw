forward
global type w_mora_mantencion from window
end type
type cb_3 from commandbutton within w_mora_mantencion
end type
type dw_1 from datawindow within w_mora_mantencion
end type
type cb_2 from commandbutton within w_mora_mantencion
end type
type cb_1 from commandbutton within w_mora_mantencion
end type
end forward

global type w_mora_mantencion from window
integer x = 530
integer y = 248
integer width = 2592
integer height = 1896
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
global w_mora_mantencion w_mora_mantencion

type variables
string titulo1
end variables

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

on w_mora_mantencion.create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_mora_mantencion.destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string sql

setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
dw_1.settransobject (sqlca)
if gstr_param.tipo = 'Promesa' then
	sql = 'SELECT 	"HISTORICO_MANT"."AÑO",  '+&
			'"HISTORICO_MANT"."BASE",   '+&
         '"HISTORICO_MANT"."SERIE",   '+&
         '"HISTORICO_MANT"."NUMERO",   '+&
         '"HISTORICO_MANT"."MES_'+gstr_param.fecha_2+'" ,  '+&
         '"HISTORICO_MANT"."VALOR_CUOTA_M"   '+&
    		'FROM "HISTORICO_MANT",   '+&
         '"CADENA"  '+&
   		'WHERE ( "HISTORICO_MANT"."BASE" = "CADENA"."CODIGO" ) and  '+&
         '( "HISTORICO_MANT"."SERIE" = "CADENA"."SERIE" ) and  '+&
         '( "HISTORICO_MANT"."NUMERO" = "CADENA"."NUMERO" ) and  '+&
         '( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
         '( "HISTORICO_MANT"."BASE" = '+"'"+'O'+"' ) and "+&
			'( "CADENA"."COD_PARQUE" = '+string(gi_parque_select)+' ) '+&
			'ORDER BY '+'"HISTORICO_MANT"."MES_'+gstr_param.fecha_2+'" '+' ASC '
			titulo1 = 'Mora Mensual de Mantención de Promesas'
else
	sql = 'SELECT 	"HISTORICO_MANT"."AÑO",  '+&
			'"HISTORICO_MANT"."BASE",   '+&
         '"HISTORICO_MANT"."SERIE",   '+&
         '"HISTORICO_MANT"."NUMERO",   '+&
         '"HISTORICO_MANT"."MES_'+gstr_param.fecha_2+'" ,  '+&
         '"HISTORICO_MANT"."VALOR_CUOTA_M"   '+&
    		'FROM "HISTORICO_MANT",   '+&
         '"CADENA"  '+&
   		'WHERE ( "HISTORICO_MANT"."BASE" = "CADENA"."CODIGO" ) and  '+&
         '( "HISTORICO_MANT"."SERIE" = "CADENA"."SERIE" ) and  '+&
         '( "HISTORICO_MANT"."NUMERO" = "CADENA"."NUMERO" ) and  '+&
         '( "HISTORICO_MANT"."AÑO" = '+gstr_param.fecha_1+" ) AND  "+&
         '( "HISTORICO_MANT"."BASE" = '+"'"+'C'+"' ) and "+&
			'( "CADENA"."COD_PARQUE" = '+string(gi_parque_select)+' ) '+&
			'ORDER BY '+'"HISTORICO_MANT"."MES_'+gstr_param.fecha_2+'" '+' ASC '
			titulo1 = 'Mora Mensual de Mantención de Contratos'
end if
f_matenciones(sql,dw_1)

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
dw_1.object.titulo2.text = 'Fecha de Corte: '+&
                           wf_numero_mes(integer(gstr_param.fecha_2))+&
									' de '+gstr_param.fecha_1
end event

type cb_3 from commandbutton within w_mora_mantencion
integer x = 361
integer y = 1652
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Gráfico"
end type

event clicked;string s_parametro
datawindow	dw_paso

s_parametro = gs_empresa+'~t'+mid(titulo1,1,4)+mid(titulo1,16)+'~t'+wf_numero_mes(integer(gstr_param.fecha_2))+&
				  ' de '+gstr_param.fecha_1//dw_1.object.titulo2.text

dw_paso 		= dw_1
OpenWithParm(w_mora_mantencion_grafico,s_parametro)
//open(w_mora_mantencion_grafico)
end event

type dw_1 from datawindow within w_mora_mantencion
integer x = 46
integer y = 48
integer width = 2482
integer height = 1556
string dataobject = "dw_mora_mant_mes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mora_mantencion
integer x = 2217
integer y = 1652
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

event clicked;close(w_mora_mantencion)
end event

type cb_1 from commandbutton within w_mora_mantencion
integer x = 50
integer y = 1652
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

