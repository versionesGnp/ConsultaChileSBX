forward
global type w_datos_supervisor_resumen_aumento from window
end type
type pb_1 from picturebutton within w_datos_supervisor_resumen_aumento
end type
type sle_1 from singlelineedit within w_datos_supervisor_resumen_aumento
end type
type cb_2 from commandbutton within w_datos_supervisor_resumen_aumento
end type
type cb_1 from commandbutton within w_datos_supervisor_resumen_aumento
end type
type dw_1 from datawindow within w_datos_supervisor_resumen_aumento
end type
type gb_1 from groupbox within w_datos_supervisor_resumen_aumento
end type
end forward

global type w_datos_supervisor_resumen_aumento from window
integer x = 832
integer y = 368
integer width = 3520
integer height = 1840
boolean titlebar = true
string title = "Aumento Capacidad por Supervisor"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
pb_1 pb_1
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_datos_supervisor_resumen_aumento w_datos_supervisor_resumen_aumento

type variables
string is_banda_new,is_campo,is_banda_old
end variables

forward prototypes
public subroutine wf_sort (string as_banda)
end prototypes

public subroutine wf_sort (string as_banda);is_banda_new			=	as_banda
CHOOSE CASE as_banda
	CASE "a_supervisor_cod_sup"
		is_campo	=	'supervisor_cod_sup'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_supervisor_cod_jefe"
		is_campo	=	'supervisor_cod_jefe'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_supervisor_fecha_fin"
		is_campo	=	'supervisor_fecha_fin'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_supervisor_a_paterno"
		is_campo	=	'supervisor_a_paterno'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_supervisor_estado"
		is_campo	=	'supervisor_estado'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_supervisor_fecha_ing"
		is_campo	=	'supervisor_fecha_ing'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_meta_super_tipo_canal"
		is_campo	=	'supervisor_fecha_ing'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new		
END CHOOSE
end subroutine

on w_datos_supervisor_resumen_aumento.create
this.pb_1=create pb_1
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_datos_supervisor_resumen_aumento.destroy
destroy(this.pb_1)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_datos_supervisor_resumen_aumento)
dw_1.settransobject(sqlca)
dw_1.retrieve()
gs_ventana	= 'w_datos_supervisor_resumen_aumento'
f_valida_objeto_1()
//wf_sort('a_supervisor_cod_sup')
end event

type pb_1 from picturebutton within w_datos_supervisor_resumen_aumento
event clicked pbm_bnclicked
integer x = 384
integer y = 1580
integer width = 105
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
string disabledname = "lupa_no.bmp"
alignment htextalign = left!
end type

event clicked;integer i

for i = 1 to dw_1.rowcount()
	if dw_1.getitemstring(i,'supervisor_cod_sup') = trim(sle_1.text) then
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(i, TRUE)
		dw_1.ScrollToRow(i) 
		return
	end if
next
end event

type sle_1 from singlelineedit within w_datos_supervisor_resumen_aumento
event modified pbm_enmodified
integer x = 119
integer y = 1580
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;pb_1.triggerevent (clicked!)
end event

type cb_2 from commandbutton within w_datos_supervisor_resumen_aumento
integer x = 2738
integer y = 1584
integer width = 338
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if dw_1.getrow() > 0 then dw_1.TriggerEvent(doubleclicked!)
end event

type cb_1 from commandbutton within w_datos_supervisor_resumen_aumento
integer x = 3086
integer y = 1584
integer width = 338
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_datos_supervisor_resumen_aumento)
end event

type dw_1 from datawindow within w_datos_supervisor_resumen_aumento
integer x = 64
integer y = 76
integer width = 3360
integer height = 1440
integer taborder = 10
string dataobject = "dw_datos_supervisor"
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

event clicked;dw_1.Accepttext()
IF row > 0 THEN
	dw_1.SelectRow(0, FALSE)
	dw_1.SelectRow(row, TRUE)
ELSE
	wf_sort(STRING(dwo.name))
END IF
end event

event doubleclicked;if this.getrow() > 0 then
	setpointer(hourglass!)
	OpenWithParm(w_resumen_canal_aumento,getitemstring(this.getrow(),'supervisor_cod_sup'))
end if 
end event

type gb_1 from groupbox within w_datos_supervisor_resumen_aumento
integer x = 64
integer y = 1516
integer width = 485
integer height = 192
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = stylelowered!
end type

