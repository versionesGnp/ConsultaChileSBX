forward
global type w_documentos from window
end type
type dw_1 from datawindow within w_documentos
end type
type cb_2 from commandbutton within w_documentos
end type
end forward

global type w_documentos from window
integer x = 329
integer y = 728
integer width = 3424
integer height = 1108
boolean titlebar = true
string title = "Documentos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
dw_1 dw_1
cb_2 cb_2
end type
global w_documentos w_documentos

on w_documentos.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.Control[]={this.dw_1,&
this.cb_2}
end on

on w_documentos.destroy
destroy(this.dw_1)
destroy(this.cb_2)
end on

event open;string param
long folio

param = Message.StringParm
gf_centrar(w_documentos)
folio = long(param)
dw_1.SetTransObject(SQLCA)
this.title = 'Digitación ( Rezagos )'//'mid(gs_app_name,1,pos(gs_app_name,' ')-1)
if dw_1.Retrieve(folio) = 0 then
	messagebox('No hay Información','No existe información disponible',stopsign!)
	close(w_documentos)
end if
end event

type dw_1 from datawindow within w_documentos
integer x = 41
integer y = 36
integer width = 3328
integer height = 808
integer taborder = 10
string dataobject = "dw_documentos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_documentos
integer x = 3040
integer y = 884
integer width = 315
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_documentos)
end event

