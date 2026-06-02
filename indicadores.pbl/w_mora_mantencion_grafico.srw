forward
global type w_mora_mantencion_grafico from window
end type
type dw_1 from datawindow within w_mora_mantencion_grafico
end type
type cb_2 from commandbutton within w_mora_mantencion_grafico
end type
type cb_1 from commandbutton within w_mora_mantencion_grafico
end type
end forward

global type w_mora_mantencion_grafico from window
integer x = 530
integer y = 248
integer width = 2592
integer height = 1884
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_mora_mantencion_grafico w_mora_mantencion_grafico

type variables
datawindow	dw_paso
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

on w_mora_mantencion_grafico.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_mora_mantencion_grafico.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string sql,titulo1,s_parametro
integer i
setpointer (HourGlass!)

s_parametro = substr(1,1,message.stringparm)
s_parametro = s_parametro + ' ( '+ substr(1,2,message.stringparm)
s_parametro = s_parametro + ', '+substr(1,3,message.stringparm)+' )'
this.x 		= ( gl_width - this.width)/2
this.y 		= ( gl_height - this.height)/2
this.title 	= gs_app_name
for i = 1 to dw_paso.rowcount()
	dw_1.insertrow(0)
	dw_1.setitem(dw_1.rowcount(),1,dw_paso.getitemnumber(i,1))
	dw_1.setitem(dw_1.rowcount(),2,dw_paso.getitemnumber(i,2))
	dw_1.setitem(dw_1.rowcount(),3,'Mora '+dw_paso.getitemstring(i,3))
next
if gi_parque_select = 1 then
	dw_1.object.titulo.text  = 'El Prado'
elseif gi_parque_select = 102 then
	dw_1.object.titulo.text  = 'El Manantial'
elseif gi_parque_select = 11 then
	dw_1.object.titulo.text  = 'La Foresta'
elseif gi_parque_select = 801 then
	dw_1.object.titulo.text  = 'Concepción'
end if
dw_1.object.titulo1.text 	= titulo1
dw_1.object.titulo2.text 	= 'Fecha de Corte: '+&
                             wf_numero_mes(integer(gstr_param.fecha_2))+&
									  ' de '+gstr_param.fecha_1
dw_1.object.grafico_1.title	= s_parametro//gs_empresa +' ('+ dw_paso.object.titulo1.text +' '+ dw_paso.object.titulo2.text+' )'
//dw_1.object.grafico1.elevation = -60
end event

type dw_1 from datawindow within w_mora_mantencion_grafico
integer x = 46
integer y = 48
integer width = 2482
integer height = 1556
string dataobject = "dw_mora_mant_mes_grafico"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_mora_mantencion_grafico
integer x = 2217
integer y = 1644
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mora_mantencion_grafico)
end event

type cb_1 from commandbutton within w_mora_mantencion_grafico
integer x = 50
integer y = 1644
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

