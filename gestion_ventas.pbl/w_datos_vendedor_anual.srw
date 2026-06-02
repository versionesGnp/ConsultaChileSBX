forward
global type w_datos_vendedor_anual from window
end type
type cb_2 from commandbutton within w_datos_vendedor_anual
end type
type cb_1 from commandbutton within w_datos_vendedor_anual
end type
type dw_1 from datawindow within w_datos_vendedor_anual
end type
end forward

global type w_datos_vendedor_anual from window
integer x = 832
integer y = 368
integer width = 3579
integer height = 1772
boolean titlebar = true
string title = "Ofertas por Agente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_datos_vendedor_anual w_datos_vendedor_anual

type variables
string is_banda_new,is_campo,is_banda_old
end variables

forward prototypes
public subroutine wf_sort (string as_banda)
end prototypes

public subroutine wf_sort (string as_banda);is_banda_new			=	as_banda
CHOOSE CASE as_banda
	CASE "a_agentes_cod_age"
		is_campo	=	'agentes_cod_age'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_agentes_estado"
		is_campo	=	'agentes_estado'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_agentes_a_paterno"
		is_campo	=	'agentes_a_paterno'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_agentes_fecha_fin"
		is_campo	=	'agentes_fecha_fin'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_agentes_fecha_ini"
		is_campo	=	'agentes_fecha_ini'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_meta_super_tipo_canal"
		is_campo	=	'agentes_fecha_ini'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new		
	CASE "a_supervisor_cod_sup"
		is_campo	=	'supervisor_cod_sup'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
END CHOOSE
end subroutine

on w_datos_vendedor_anual.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_datos_vendedor_anual.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;gf_centrar(w_datos_vendedor_anual)
dw_1.settransobject(sqlca)
dw_1.retrieve()
gs_ventana	= 'w_datos_vendedor_anual'
f_valida_objeto_1()
//wf_sort('a_agentes_cod_age')
end event

type cb_2 from commandbutton within w_datos_vendedor_anual
integer x = 2821
integer y = 1540
integer width = 338
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if dw_1.getrow() > 0 then dw_1.TriggerEvent(doubleclicked!)
end event

type cb_1 from commandbutton within w_datos_vendedor_anual
integer x = 3168
integer y = 1540
integer width = 338
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_datos_vendedor_anual)
end event

type dw_1 from datawindow within w_datos_vendedor_anual
integer x = 64
integer y = 56
integer width = 3442
integer height = 1440
integer taborder = 10
string dataobject = "dw_datos_vendedor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() > 0 then
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(getrow(), TRUE)
end if 
end event

event clicked;this.accepttext()
IF row > 0 THEN
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(row, TRUE)
ELSE
	wf_sort(STRING(dwo.name))
END IF
end event

event doubleclicked;if this.getrow() > 0 then OpenWithParm(w_agentes_anual_print,getitemstring(this.getrow(),'agentes_cod_age'))
end event

