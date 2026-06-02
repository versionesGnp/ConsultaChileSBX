forward
global type w_update_documento from window
end type
type cb_3 from commandbutton within w_update_documento
end type
type cb_2 from commandbutton within w_update_documento
end type
type cb_1 from commandbutton within w_update_documento
end type
type dw_1 from datawindow within w_update_documento
end type
end forward

global type w_update_documento from window
integer x = 1189
integer y = 556
integer width = 2249
integer height = 1000
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_update_documento w_update_documento

on w_update_documento.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_update_documento.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve(st_param_dcto.folio,st_param_dcto.rut,st_param_dcto.num_cheque)
end event

type cb_3 from commandbutton within w_update_documento
integer x = 370
integer y = 776
integer width = 311
integer height = 108
integer taborder = 4
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

type cb_2 from commandbutton within w_update_documento
integer x = 1888
integer y = 776
integer width = 302
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

type cb_1 from commandbutton within w_update_documento
integer x = 59
integer y = 776
integer width = 311
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

type dw_1 from datawindow within w_update_documento
integer x = 59
integer y = 36
integer width = 2130
integer height = 696
integer taborder = 20
string dataobject = "dw_documentos_x_fecha_up"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

