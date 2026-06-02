forward
global type w_datos_contrato_liberador from window
end type
type dw_seguro from datawindow within w_datos_contrato_liberador
end type
type st_1 from statictext within w_datos_contrato_liberador
end type
type dw_datos_contrato from datawindow within w_datos_contrato_liberador
end type
type cb_cerrar from commandbutton within w_datos_contrato_liberador
end type
type ln_1 from line within w_datos_contrato_liberador
end type
type ln_2 from line within w_datos_contrato_liberador
end type
end forward

global type w_datos_contrato_liberador from window
integer x = 1637
integer y = 1048
integer width = 2674
integer height = 1740
boolean titlebar = true
string title = "Datos Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_seguro dw_seguro
st_1 st_1
dw_datos_contrato dw_datos_contrato
cb_cerrar cb_cerrar
ln_1 ln_1
ln_2 ln_2
end type
global w_datos_contrato_liberador w_datos_contrato_liberador

on w_datos_contrato_liberador.create
this.dw_seguro=create dw_seguro
this.st_1=create st_1
this.dw_datos_contrato=create dw_datos_contrato
this.cb_cerrar=create cb_cerrar
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.dw_seguro,&
this.st_1,&
this.dw_datos_contrato,&
this.cb_cerrar,&
this.ln_1,&
this.ln_2}
end on

on w_datos_contrato_liberador.destroy
destroy(this.dw_seguro)
destroy(this.st_1)
destroy(this.dw_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;gf_centrar(w_datos_contrato_liberador)
dw_datos_contrato.SetTransObject(SQLCA)
dw_datos_contrato.Retrieve(gs_serie, gi_numero)
dw_seguro.SetTransObject(SQLCA)
dw_seguro.retrieve('L',gs_serie, gi_numero)
end event

type dw_seguro from datawindow within w_datos_contrato_liberador
integer x = 1646
integer y = 140
integer width = 1019
integer height = 1316
integer taborder = 20
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_datos_contrato_liberador
integer x = 41
integer y = 28
integer width = 1111
integer height = 96
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
string text = "Datos del Contrato Liberador"
boolean focusrectangle = false
end type

type dw_datos_contrato from datawindow within w_datos_contrato_liberador
integer x = 23
integer y = 144
integer width = 1550
integer height = 1364
integer taborder = 10
string dataobject = "d_datos_contrato_liberador"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_datos_contrato_liberador
integer x = 2304
integer y = 1516
integer width = 315
integer height = 96
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
Close(w_datos_contrato_liberador)
end event

type ln_1 from line within w_datos_contrato_liberador
long linecolor = 8421504
integer linethickness = 4
integer beginx = 1591
integer beginy = 116
integer endx = 1591
integer endy = 1504
end type

type ln_2 from line within w_datos_contrato_liberador
long linecolor = 16777215
integer linethickness = 4
integer beginx = 1595
integer beginy = 116
integer endx = 1595
integer endy = 1504
end type

