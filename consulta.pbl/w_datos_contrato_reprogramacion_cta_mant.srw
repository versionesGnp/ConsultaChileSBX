forward
global type w_datos_contrato_reprogramacion_cta_mant from window
end type
type dw_seguro from datawindow within w_datos_contrato_reprogramacion_cta_mant
end type
type st_1 from statictext within w_datos_contrato_reprogramacion_cta_mant
end type
type dw_datos_contrato from datawindow within w_datos_contrato_reprogramacion_cta_mant
end type
type cb_cerrar from commandbutton within w_datos_contrato_reprogramacion_cta_mant
end type
type ln_1 from line within w_datos_contrato_reprogramacion_cta_mant
end type
type ln_2 from line within w_datos_contrato_reprogramacion_cta_mant
end type
end forward

global type w_datos_contrato_reprogramacion_cta_mant from window
integer x = 1637
integer y = 1048
integer width = 2866
integer height = 1524
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
global w_datos_contrato_reprogramacion_cta_mant w_datos_contrato_reprogramacion_cta_mant

on w_datos_contrato_reprogramacion_cta_mant.create
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

on w_datos_contrato_reprogramacion_cta_mant.destroy
destroy(this.dw_seguro)
destroy(this.st_1)
destroy(this.dw_datos_contrato)
destroy(this.cb_cerrar)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;gf_centrar(w_datos_contrato_reprogramacion_cta_mant)
dw_datos_contrato.SetTransObject(SQLCA)
dw_datos_contrato.Retrieve(gs_serie, gi_numero)
dw_seguro.SetTransObject(SQLCA)
dw_seguro.retrieve('R',gs_serie, gi_numero)
end event

type dw_seguro from datawindow within w_datos_contrato_reprogramacion_cta_mant
integer x = 1819
integer y = 140
integer width = 1019
integer height = 1096
integer taborder = 20
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_datos_contrato_reprogramacion_cta_mant
integer x = 32
integer y = 28
integer width = 1440
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
string text = "Datos Contrato Reprog. Cta. Mantención"
boolean focusrectangle = false
end type

type dw_datos_contrato from datawindow within w_datos_contrato_reprogramacion_cta_mant
integer x = 32
integer y = 140
integer width = 1705
integer height = 1180
integer taborder = 10
string dataobject = "dw_datos_reprogramacion_cta_mant"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_datos_contrato_reprogramacion_cta_mant
integer x = 2496
integer y = 1296
integer width = 325
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_datos_contrato_reprogramacion_cta_mant)
end event

type ln_1 from line within w_datos_contrato_reprogramacion_cta_mant
long linecolor = 8421504
integer linethickness = 4
integer beginx = 1765
integer beginy = 116
integer endx = 1765
integer endy = 1284
end type

type ln_2 from line within w_datos_contrato_reprogramacion_cta_mant
long linecolor = 16777215
integer linethickness = 4
integer beginx = 1769
integer beginy = 116
integer endx = 1769
integer endy = 1284
end type

