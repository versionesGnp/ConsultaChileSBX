forward
global type w_actualiza_ci from window
end type
type cb_2 from commandbutton within w_actualiza_ci
end type
type dw_4 from datawindow within w_actualiza_ci
end type
type dw_3 from datawindow within w_actualiza_ci
end type
type dw_2 from datawindow within w_actualiza_ci
end type
type em_1 from editmask within w_actualiza_ci
end type
type dw_1 from datawindow within w_actualiza_ci
end type
type st_2 from statictext within w_actualiza_ci
end type
type st_1 from statictext within w_actualiza_ci
end type
type ddlb_docto from dropdownlistbox within w_actualiza_ci
end type
type cb_1 from commandbutton within w_actualiza_ci
end type
end forward

global type w_actualiza_ci from window
integer x = 270
integer y = 136
integer width = 3099
integer height = 2112
boolean titlebar = true
string title = "Actualiza C.I."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_2 cb_2
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
em_1 em_1
dw_1 dw_1
st_2 st_2
st_1 st_1
ddlb_docto ddlb_docto
cb_1 cb_1
end type
global w_actualiza_ci w_actualiza_ci

on w_actualiza_ci.create
this.cb_2=create cb_2
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.em_1=create em_1
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_docto=create ddlb_docto
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.em_1,&
this.dw_1,&
this.st_2,&
this.st_1,&
this.ddlb_docto,&
this.cb_1}
end on

on w_actualiza_ci.destroy
destroy(this.cb_2)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_docto)
destroy(this.cb_1)
end on

event open;f_ddlb_all(ddlb_docto,'SELECT DISTINCT TIPO_COB FROM INGRESO')
//ddlb_docto.SelectItem(li_pos)


  
end event

type cb_2 from commandbutton within w_actualiza_ci
integer x = 2423
integer y = 1900
integer width = 302
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;integer i,rtn1,rtn2,rtn3,rtn4

dw_1.AcceptText()
dw_2.AcceptText()
dw_3.AcceptText()
dw_4.AcceptText()
i = dw_1.ModifiedCount( ) + dw_2.ModifiedCount( ) + dw_3.ModifiedCount( ) + dw_4.ModifiedCount( )
if i > 0 then
	rtn1 = dw_1.Update( )
	rtn2 = dw_2.Update( )
	rtn3 = dw_3.Update( )
	rtn4 = dw_4.Update( )
	IF rtn1 = 1 and rtn2 = 1 and rtn3 = 1 and rtn4 = 1 then// AND SQLCA.SQLNRows > 0 THEN
		COMMIT USING SQLCA;
	ELSE
		ROLLBACK USING SQLCA;
	END IF
end if
end event

type dw_4 from datawindow within w_actualiza_ci
integer x = 59
integer y = 1448
integer width = 2976
integer height = 432
integer taborder = 60
boolean titlebar = true
string title = "Tabla : Documentos"
string dataobject = "dw_documentos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_actualiza_ci
integer x = 59
integer y = 1016
integer width = 2976
integer height = 432
integer taborder = 50
boolean titlebar = true
string title = "Tabla : Doc_cob"
string dataobject = "dw_doc_cob"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_actualiza_ci
integer x = 59
integer y = 568
integer width = 2976
integer height = 448
integer taborder = 40
boolean titlebar = true
string title = "Tabla : Ingre"
string dataobject = "dw_ingre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_actualiza_ci
integer x = 247
integer y = 16
integer width = 571
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
string displaydata = ""
end type

type dw_1 from datawindow within w_actualiza_ci
integer x = 59
integer y = 120
integer width = 2976
integer height = 448
integer taborder = 30
boolean titlebar = true
string title = "Tabla : Ingreso"
string dataobject = "dw_ingreso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_actualiza_ci
integer x = 827
integer y = 28
integer width = 379
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Tipo Docto. :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_actualiza_ci
integer x = 59
integer y = 28
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Folio :"
boolean focusrectangle = false
end type

type ddlb_docto from dropdownlistbox within w_actualiza_ci
integer x = 1243
integer y = 16
integer width = 411
integer height = 844
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_1.retrieve(long(em_1.text),this.text)
dw_2.retrieve(long(em_1.text),this.text)
dw_3.retrieve(long(em_1.text),this.text)
dw_4.retrieve(long(em_1.text),this.text)
end event

type cb_1 from commandbutton within w_actualiza_ci
integer x = 2734
integer y = 1900
integer width = 302
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualiza_ci)
end event

