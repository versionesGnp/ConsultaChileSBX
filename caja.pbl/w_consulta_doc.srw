forward
global type w_consulta_doc from window
end type
type cb_1 from commandbutton within w_consulta_doc
end type
type dw_2 from datawindow within w_consulta_doc
end type
type dw_1 from datawindow within w_consulta_doc
end type
end forward

global type w_consulta_doc from window
integer x = 1074
integer y = 484
integer width = 2651
integer height = 1520
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_consulta_doc w_consulta_doc

on w_consulta_doc.create
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_2,&
this.dw_1}
end on

on w_consulta_doc.destroy
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;String	ls_tipo_cob2
gf_centrar(w_consulta_doc)
dw_1.SETTRANSOBJECT(SQLCA)
dw_2.SETTRANSOBJECT(SQLCA)
if gs_tipo_cobro='BE' then
	ls_tipo_cob2	= 'C1'
else
	ls_tipo_cob2	= 'BE'
end if
DW_1.RETRIEVE(gl_folio, gs_tipo_cobro,ls_tipo_cob2)
DW_2.RETRIEVE(gl_folio, gs_tipo_cobro,ls_tipo_cob2)

end event

type cb_1 from commandbutton within w_consulta_doc
integer x = 2245
integer y = 1276
integer width = 320
integer height = 100
integer taborder = 3
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close (w_consulta_doc)
end event

type dw_2 from datawindow within w_consulta_doc
integer x = 50
integer y = 880
integer width = 2514
integer height = 360
integer taborder = 20
string dataobject = "cons_docu_w"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_consulta_doc
integer x = 50
integer y = 44
integer width = 2514
integer height = 788
integer taborder = 10
string dataobject = "con_ing_pago_dw"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

