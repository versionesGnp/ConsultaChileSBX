forward
global type w_datos_fallecimiento from window
end type
type cb_cerrar from commandbutton within w_datos_fallecimiento
end type
type dw_datos_fallecimiento from datawindow within w_datos_fallecimiento
end type
end forward

global type w_datos_fallecimiento from window
integer x = 1074
integer y = 484
integer width = 2523
integer height = 1656
boolean titlebar = true
string title = "Datos del Fallecimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_cerrar cb_cerrar
dw_datos_fallecimiento dw_datos_fallecimiento
end type
global w_datos_fallecimiento w_datos_fallecimiento

on w_datos_fallecimiento.create
this.cb_cerrar=create cb_cerrar
this.dw_datos_fallecimiento=create dw_datos_fallecimiento
this.Control[]={this.cb_cerrar,&
this.dw_datos_fallecimiento}
end on

on w_datos_fallecimiento.destroy
destroy(this.cb_cerrar)
destroy(this.dw_datos_fallecimiento)
end on

event open;
gf_centrar(w_datos_fallecimiento)

dw_datos_fallecimiento.SetTransObject(SQLCA)
if dw_datos_fallecimiento.Retrieve(gi_llave_f)=0 then 
	close(w_datos_fallecimiento)
end if
end event

type cb_cerrar from commandbutton within w_datos_fallecimiento
integer x = 2139
integer y = 1432
integer width = 325
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;
close(w_datos_fallecimiento)
end event

type dw_datos_fallecimiento from datawindow within w_datos_fallecimiento
integer x = 18
integer y = 28
integer width = 2469
integer height = 1392
integer taborder = 10
string dataobject = "d_fallecido"
boolean border = false
boolean livescroll = true
end type

