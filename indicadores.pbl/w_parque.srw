forward
global type w_parque from window
end type
type cb_2 from commandbutton within w_parque
end type
type st_1 from statictext within w_parque
end type
type ddlb_1 from dropdownlistbox within w_parque
end type
type gb_1 from groupbox within w_parque
end type
end forward

global type w_parque from window
integer width = 1312
integer height = 556
windowtype windowtype = response!
long backcolor = 67108864
cb_2 cb_2
st_1 st_1
ddlb_1 ddlb_1
gb_1 gb_1
end type
global w_parque w_parque

on w_parque.create
this.cb_2=create cb_2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.st_1,&
this.ddlb_1,&
this.gb_1}
end on

on w_parque.destroy
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.gb_1)
end on

event open;string sql,codigo_param
STRING ls_codigo,ls_nombre,ls_item, ls_item_buscado
STRING Blancos,Ceros,dato_1,dato_2
INT li_pos //posición buscada

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
sql = "SELECT CODIGO||"+"'  - '"+'|| NOMBRE FROM COD_PARQ WHERE GRUPO = 1'
PREPARE sqlsa FROM :sql;
DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
OPEN DYNAMIC dyn_cursor;  
IF sqlca.sqlcode < 0 THEN
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_ddlb_all()")
	Return -1
END IF
ddlb_1.SetRedraw(FALSE)
ddlb_1.Reset( )
Do While sqlca.sqlcode = 0
	Fetch dyn_cursor into :ls_nombre;
	If sqlca.sqlcode = 0 Then
		IF not isnull(ls_nombre) THEN
			ls_item = RightTrim(ls_nombre)
			ddlb_1.AddItem(ls_item)
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
ddlb_1.SetRedraw(TRUE)
li_pos = ddlb_1.FindItem(ls_item_buscado, 0)
Close dyn_cursor;
ddlb_1.SelectItem(1)
gi_parque_select = integer(trim(mid(ddlb_1.text,1,pos(ddlb_1.text,'-') - 1)))

end event

type cb_2 from commandbutton within w_parque
integer x = 55
integer y = 388
integer width = 306
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Close(w_parque)
end event

type st_1 from statictext within w_parque
integer x = 119
integer y = 92
integer width = 795
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Selección de Parque"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_parque
integer x = 119
integer y = 180
integer width = 1047
integer height = 352
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;gi_parque_select = integer(trim(mid(ddlb_1.text,1,pos(ddlb_1.text,'-') - 1)))

end event

type gb_1 from groupbox within w_parque
integer x = 55
integer y = 32
integer width = 1184
integer height = 320
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

