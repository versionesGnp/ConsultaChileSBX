forward
global type w_datos_contrato_oferta_repa from window
end type
type st_1 from statictext within w_datos_contrato_oferta_repa
end type
type dw_datos_contrato from datawindow within w_datos_contrato_oferta_repa
end type
type cb_cerrar from commandbutton within w_datos_contrato_oferta_repa
end type
end forward

global type w_datos_contrato_oferta_repa from window
integer x = 169
integer y = 104
integer width = 2295
integer height = 2176
boolean titlebar = true
string title = "Datos Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_1 st_1
dw_datos_contrato dw_datos_contrato
cb_cerrar cb_cerrar
end type
global w_datos_contrato_oferta_repa w_datos_contrato_oferta_repa

on w_datos_contrato_oferta_repa.create
this.st_1=create st_1
this.dw_datos_contrato=create dw_datos_contrato
this.cb_cerrar=create cb_cerrar
this.Control[]={this.st_1,&
this.dw_datos_contrato,&
this.cb_cerrar}
end on

on w_datos_contrato_oferta_repa.destroy
destroy(this.st_1)
destroy(this.dw_datos_contrato)
destroy(this.cb_cerrar)
end on

event open;gf_centrar(w_datos_contrato_oferta_repa)
dw_datos_contrato.SetTransObject(SQLCA)
dw_datos_contrato.Retrieve(gs_serie, gi_numero)
end event

type st_1 from statictext within w_datos_contrato_oferta_repa
integer x = 46
integer y = 16
integer width = 923
integer height = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Datos del Contrato"
boolean focusrectangle = false
end type

type dw_datos_contrato from datawindow within w_datos_contrato_oferta_repa
integer x = 27
integer y = 116
integer width = 2240
integer height = 1820
integer taborder = 10
string dataobject = "d_datos_contrato_oferta"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_datos_contrato_oferta_repa
integer x = 1915
integer y = 1944
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_datos_contrato_oferta)
end event

