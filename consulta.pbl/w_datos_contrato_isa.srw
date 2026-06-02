forward
global type w_datos_contrato_isa from window
end type
type st_1 from statictext within w_datos_contrato_isa
end type
type cb_cerrar from commandbutton within w_datos_contrato_isa
end type
type dw_datos_contrato_oferta from datawindow within w_datos_contrato_isa
end type
end forward

global type w_datos_contrato_isa from window
integer x = 1298
integer y = 1136
integer width = 2409
integer height = 2220
boolean titlebar = true
string title = "Listado de Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_1 st_1
cb_cerrar cb_cerrar
dw_datos_contrato_oferta dw_datos_contrato_oferta
end type
global w_datos_contrato_isa w_datos_contrato_isa

on w_datos_contrato_isa.create
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_datos_contrato_oferta=create dw_datos_contrato_oferta
this.Control[]={this.st_1,&
this.cb_cerrar,&
this.dw_datos_contrato_oferta}
end on

on w_datos_contrato_isa.destroy
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_datos_contrato_oferta)
end on

event open;gf_centrar(w_datos_contrato_isa)
dw_datos_contrato_oferta.SetTransObject(SQLCA)
dw_datos_contrato_oferta.Retrieve(gs_serie,gi_numero)

end event

event close;if isvalid(w_plano_sector_parque) then w_plano_sector_parque.dw_plano_sector_parque.enabled	= true
end event

type st_1 from statictext within w_datos_contrato_isa
integer x = 41
integer y = 16
integer width = 1042
integer height = 92
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos de Contrato"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_datos_contrato_isa
integer x = 2016
integer y = 1996
integer width = 329
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

event clicked;Close(w_datos_contrato_isa)
end event

type dw_datos_contrato_oferta from datawindow within w_datos_contrato_isa
integer x = 46
integer y = 116
integer width = 2318
integer height = 1856
integer taborder = 10
string dataobject = "d_datos_contrato_isa"
boolean border = false
boolean livescroll = true
end type

