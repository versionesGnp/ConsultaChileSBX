forward
global type w_datos_supervisor_mora_agente from window
end type
type st_2 from statictext within w_datos_supervisor_mora_agente
end type
type ddlb_2 from dropdownlistbox within w_datos_supervisor_mora_agente
end type
type st_1 from statictext within w_datos_supervisor_mora_agente
end type
type ddlb_1 from dropdownlistbox within w_datos_supervisor_mora_agente
end type
type sle_1 from singlelineedit within w_datos_supervisor_mora_agente
end type
type pb_1 from picturebutton within w_datos_supervisor_mora_agente
end type
type cb_2 from commandbutton within w_datos_supervisor_mora_agente
end type
type cb_1 from commandbutton within w_datos_supervisor_mora_agente
end type
type dw_1 from datawindow within w_datos_supervisor_mora_agente
end type
type gb_1 from groupbox within w_datos_supervisor_mora_agente
end type
end forward

global type w_datos_supervisor_mora_agente from window
integer x = 832
integer y = 368
integer width = 3488
integer height = 2072
boolean titlebar = true
string title = "Supervisores por Jefe"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_2 st_2
ddlb_2 ddlb_2
st_1 st_1
ddlb_1 ddlb_1
sle_1 sle_1
pb_1 pb_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_datos_supervisor_mora_agente w_datos_supervisor_mora_agente

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
	CASE "a_supervisor_canal"
		is_campo	=	'supervisor_canal'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new		
	CASE "a_supervisor_estado"
		is_campo	=	'supervisor_estado'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new		
END CHOOSE
end subroutine

on w_datos_supervisor_mora_agente.create
this.st_2=create st_2
this.ddlb_2=create ddlb_2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.sle_1=create sle_1
this.pb_1=create pb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.ddlb_2,&
this.st_1,&
this.ddlb_1,&
this.sle_1,&
this.pb_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_datos_supervisor_mora_agente.destroy
destroy(this.st_2)
destroy(this.ddlb_2)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.sle_1)
destroy(this.pb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;string 	jefe,nombre,a_paterno,a_materno,sql,codigo_param,ls_codigo,ls_nombre,ls_item,&
			ls_item_buscado,Blancos,Ceros,dato_1,dato_2
Long		li_pos
gf_centrar(w_datos_supervisor_mora_agente)
f_ddlb_all_sup (ddlb_1,"SELECT JEFE_VENTAS,NOMBRE ,A_PATERNO , ESTADO FROM JEFE_VENTAS" ,0)
sql 		= "SELECT CODIGO||"+"'  - '"+'|| NOMBRE FROM COD_PARQ WHERE GRUPO = 1'
PREPARE sqlsa FROM :sql;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_ddlb_all()")
	Return -1
END IF
ddlb_2.SetRedraw(FALSE)
ddlb_2.Reset( )
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :ls_nombre;
	If sqlca.sqlcode = 0 Then
		IF not isnull(ls_nombre) THEN
			ls_item = RightTrim(ls_nombre)
			ddlb_2.AddItem(ls_item)
			dato_1 = codigo_param
			dato_2 = mid(RightTrim(ls_nombre),pos(RightTrim(ls_nombre),' - ') + 3)
			If upper(dato_1) = upper(dato_2) Then
				ls_item_buscado = ls_item
			End If
		END IF
	ElseIf sqlca.sqlcode < 0 Then
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_ddlb_all()")
		Return -1
	Else
		Exit
	End If
Loop
ddlb_2.SetRedraw(TRUE)
li_pos = ddlb_2.FindItem(ls_item_buscado, 0)
Close dyn_cursor;
ddlb_2.SelectItem(1)
gi_parque = integer(trim(mid(ddlb_2.text,1,pos(ddlb_2.text,'-') - 1)))
end event

type st_2 from statictext within w_datos_supervisor_mora_agente
integer x = 466
integer y = 80
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Parque:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_datos_supervisor_mora_agente
integer x = 882
integer y = 64
integer width = 2546
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;gi_parque = integer(trim(mid(ddlb_2.text,1,pos(ddlb_2.text,'-') - 1)))
end event

type st_1 from statictext within w_datos_supervisor_mora_agente
integer x = 114
integer y = 208
integer width = 754
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Seleccionar Jefe Venta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_datos_supervisor_mora_agente
integer x = 882
integer y = 192
integer width = 2546
integer height = 888
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string jefe,nombre,a_paterno,a_materno

dw_1.settransobject(sqlca)
jefe 		= Message.StringParm
cod_jefe = jefe
SELECT NOMBRE,A_PATERNO,A_MATERNO INTO :nombre,:a_paterno,:a_materno FROM JEFE_VENTAS WHERE JEFE_VENTAS = :jefe ;
dw_1.retrieve(mid(this.text,1,3))
cod_jefe 	= mid(this.text,1,3)
wf_sort('a_supervisor_cod_sup')
if gs_empresa = 'El Prado' then
	if cod_jefe <> 'CJ' then
		dw_1.insertrow(0)
		dw_1.setitem(dw_1.rowcount(),'supervisor_cod_sup','CS')
		dw_1.setitem(dw_1.rowcount(),'supervisor_cod_jefe',JEFE)
		dw_1.setitem(dw_1.rowcount(),'supervisor_nombre','SUPERVISOR EMPRESA')
		dw_1.setitem(dw_1.rowcount(),'supervisor_a_paterno',' ')
		dw_1.setitem(dw_1.rowcount(),'supervisor_a_materno',' ')
		dw_1.setitem(dw_1.rowcount(),'supervisor_estado','I')
		dw_1.setitem(dw_1.rowcount(),'supervisor_fecha_ing',' ')
		dw_1.setitem(dw_1.rowcount(),'supervisor_fecha_fin',' ')
	end if
else
	if cod_jefe <> 'CJ' then
		dw_1.insertrow(0)
		dw_1.setitem(dw_1.rowcount(),'supervisor_cod_sup','099')
		dw_1.setitem(dw_1.rowcount(),'supervisor_cod_jefe',JEFE)
		dw_1.setitem(dw_1.rowcount(),'supervisor_nombre','SUPERVISOR EMPRESA')
		dw_1.setitem(dw_1.rowcount(),'supervisor_a_paterno',' ')
		dw_1.setitem(dw_1.rowcount(),'supervisor_a_materno',' ')
		dw_1.setitem(dw_1.rowcount(),'supervisor_estado','I')
		dw_1.setitem(dw_1.rowcount(),'supervisor_fecha_ing',' ')
		dw_1.setitem(dw_1.rowcount(),'supervisor_fecha_fin',' ')
	end if
end if
end event

type sle_1 from singlelineedit within w_datos_supervisor_mora_agente
event modified pbm_enmodified
integer x = 119
integer y = 1828
integer width = 247
integer height = 92
integer taborder = 30
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

type pb_1 from picturebutton within w_datos_supervisor_mora_agente
event clicked pbm_bnclicked
integer x = 384
integer y = 1828
integer width = 119
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
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

type cb_2 from commandbutton within w_datos_supervisor_mora_agente
integer x = 2738
integer y = 1844
integer width = 338
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;if dw_1.getrow()>0 then OpenWithParm(w_mora_cliente,DW_1.getitemstring(dw_1.getrow(),'supervisor_cod_sup'))
end event

type cb_1 from commandbutton within w_datos_supervisor_mora_agente
integer x = 3086
integer y = 1844
integer width = 338
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;setnull(cod_jefe)
close(w_datos_supervisor_mora_agente)
end event

type dw_1 from datawindow within w_datos_supervisor_mora_agente
integer x = 64
integer y = 316
integer width = 3360
integer height = 1440
integer taborder = 40
string dataobject = "dw_datos_supervisor_codigo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event clicked;dw_1.Accepttext()
dw_1.SelectRow(0,FALSE) 
IF row > 0 THEN

ELSE
	wf_sort(STRING(dwo.name))
END IF
end event

event doubleclicked;cb_2.TRIGGEREVENT(clicked!)

end event

type gb_1 from groupbox within w_datos_supervisor_mora_agente
integer x = 64
integer y = 1764
integer width = 485
integer height = 192
integer taborder = 31
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
borderstyle borderstyle = stylelowered!
end type

