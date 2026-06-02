forward
global type w_listado_fallecidos from window
end type
type st_1 from statictext within w_listado_fallecidos
end type
type cb_cerrar from commandbutton within w_listado_fallecidos
end type
type dw_listado_fallecidos from datawindow within w_listado_fallecidos
end type
end forward

global type w_listado_fallecidos from window
integer x = 133
integer y = 364
integer width = 3131
integer height = 1116
boolean titlebar = true
string title = "Listado de Fallecidos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_1 st_1
cb_cerrar cb_cerrar
dw_listado_fallecidos dw_listado_fallecidos
end type
global w_listado_fallecidos w_listado_fallecidos

on w_listado_fallecidos.create
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_listado_fallecidos=create dw_listado_fallecidos
this.Control[]={this.st_1,&
this.cb_cerrar,&
this.dw_listado_fallecidos}
end on

on w_listado_fallecidos.destroy
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_listado_fallecidos)
end on

event open;gf_centrar(w_listado_fallecidos)
dw_listado_fallecidos.SetTransObject(SQLCA)
dw_listado_fallecidos.Retrieve(gs_serie,gi_numero,gs_base)
end event

event close;if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type st_1 from statictext within w_listado_fallecidos
integer x = 709
integer y = 892
integer width = 1394
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "** doble Click muestra información del Sepultado **"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_listado_fallecidos
integer x = 2757
integer y = 868
integer width = 315
integer height = 100
integer taborder = 2
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean default = true
end type

event clicked;Close(w_listado_fallecidos)
end event

type dw_listado_fallecidos from datawindow within w_listado_fallecidos
integer x = 23
integer y = 24
integer width = 3049
integer height = 820
integer taborder = 1
boolean titlebar = true
string title = "Listado Fallecidos"
string dataobject = "d_listado_fallecidos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;IF row > 0 then
	gi_llave_f = This.GetItemNumber(row, "llave")
	if isvalid(w_datos_fallecimiento) then close(w_datos_fallecimiento)
	Open(w_datos_fallecimiento)
END IF
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

