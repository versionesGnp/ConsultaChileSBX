forward
global type w_datos_contrato_aumento_capacidad from window
end type
type dw_seguro from datawindow within w_datos_contrato_aumento_capacidad
end type
type st_1 from statictext within w_datos_contrato_aumento_capacidad
end type
type dw_datos_contrato from datawindow within w_datos_contrato_aumento_capacidad
end type
type cb_cerrar from commandbutton within w_datos_contrato_aumento_capacidad
end type
type ln_1 from line within w_datos_contrato_aumento_capacidad
end type
type ln_2 from line within w_datos_contrato_aumento_capacidad
end type
end forward

global type w_datos_contrato_aumento_capacidad from window
integer x = 1637
integer y = 1048
integer width = 2702
integer height = 1684
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
global w_datos_contrato_aumento_capacidad w_datos_contrato_aumento_capacidad

on w_datos_contrato_aumento_capacidad.create
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

on w_datos_contrato_aumento_capacidad.destroy
destroy(this.dw_seguro)
destroy(this.st_1)
destroy(this.dw_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;gf_centrar(w_datos_contrato_aumento_capacidad)
dw_datos_contrato.SetTransObject(SQLCA)
dw_datos_contrato.Retrieve(gs_serie, gi_numero)
dw_seguro.SetTransObject(SQLCA)
dw_seguro.retrieve('A',gs_serie, gi_numero)
end event

type dw_seguro from datawindow within w_datos_contrato_aumento_capacidad
integer x = 1646
integer y = 140
integer width = 1019
integer height = 1296
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_datos_contrato_aumento_capacidad
integer x = 41
integer y = 28
integer width = 1422
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
string text = "Datos del Contrato Aumento Capacidad"
boolean focusrectangle = false
end type

type dw_datos_contrato from datawindow within w_datos_contrato_aumento_capacidad
integer x = 37
integer y = 144
integer width = 1550
integer height = 1300
integer taborder = 10
string dataobject = "d_datos_contrato_aumento_capacidad"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_datos_contrato_aumento_capacidad
integer x = 2331
integer y = 1460
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_datos_contrato_aumento_capacidad)
end event

type ln_1 from line within w_datos_contrato_aumento_capacidad
long linecolor = 8421504
integer linethickness = 4
integer beginx = 1591
integer beginy = 116
integer endx = 1591
integer endy = 1452
end type

type ln_2 from line within w_datos_contrato_aumento_capacidad
long linecolor = 16777215
integer linethickness = 4
integer beginx = 1595
integer beginy = 116
integer endx = 1595
integer endy = 1452
end type

