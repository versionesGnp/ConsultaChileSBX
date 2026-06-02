forward
global type w_verificar_contrato from window
end type
type st_3 from statictext within w_verificar_contrato
end type
type st_2 from statictext within w_verificar_contrato
end type
type cb_no from commandbutton within w_verificar_contrato
end type
type cb_si from commandbutton within w_verificar_contrato
end type
type st_1 from statictext within w_verificar_contrato
end type
type st_numero from statictext within w_verificar_contrato
end type
type st_serie from statictext within w_verificar_contrato
end type
type st_base from statictext within w_verificar_contrato
end type
type gb_1 from groupbox within w_verificar_contrato
end type
end forward

global type w_verificar_contrato from window
integer width = 3131
integer height = 1532
boolean titlebar = true
string title = "Verificar Contrato"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_3 st_3
st_2 st_2
cb_no cb_no
cb_si cb_si
st_1 st_1
st_numero st_numero
st_serie st_serie
st_base st_base
gb_1 gb_1
end type
global w_verificar_contrato w_verificar_contrato

event open;String			ls_base,ls_serie
Double		ll_numero

gf_centrar(w_verificar_contrato)
ls_base			= trim(substr(1,1,Message.StringParm))
ls_serie			= trim(substr(1,2,Message.StringParm))
ll_numero		= Double(substr(1,3,Message.StringParm))
st_base.text		= ls_base
st_serie.text		= ls_serie
st_numero.text	= string(ll_numero,"###,###,###,###,###")
end event

on w_verificar_contrato.create
this.st_3=create st_3
this.st_2=create st_2
this.cb_no=create cb_no
this.cb_si=create cb_si
this.st_1=create st_1
this.st_numero=create st_numero
this.st_serie=create st_serie
this.st_base=create st_base
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.st_2,&
this.cb_no,&
this.cb_si,&
this.st_1,&
this.st_numero,&
this.st_serie,&
this.st_base,&
this.gb_1}
end on

on w_verificar_contrato.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_no)
destroy(this.cb_si)
destroy(this.st_1)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.st_base)
destroy(this.gb_1)
end on

type st_3 from statictext within w_verificar_contrato
integer x = 978
integer y = 260
integer width = 137
integer height = 236
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
string text = "-"
boolean focusrectangle = false
end type

type st_2 from statictext within w_verificar_contrato
integer x = 457
integer y = 260
integer width = 137
integer height = 236
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
string text = "-"
boolean focusrectangle = false
end type

type cb_no from commandbutton within w_verificar_contrato
integer x = 1184
integer y = 1096
integer width = 745
integer height = 176
integer taborder = 20
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Aceptar"
end type

event clicked;if isvalid(w_ingresar_oferta) then CloseWithReturn(w_verificar_contrato, 'N')
if isvalid(w_ingresar_aumento_capacidad) then CloseWithReturn(w_verificar_contrato, 'N')
if isvalid(w_ingresar_liberador) then CloseWithReturn(w_verificar_contrato, 'N')

end event

type cb_si from commandbutton within w_verificar_contrato
boolean visible = false
integer x = 334
integer y = 1064
integer width = 745
integer height = 176
integer taborder = 10
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Si"
end type

event clicked;if isvalid(w_ingresar_oferta) then CloseWithReturn(w_verificar_contrato, 'S')
if isvalid(w_ingresar_aumento_capacidad) then CloseWithReturn(w_verificar_contrato, 'S')
if isvalid(w_ingresar_liberador) then CloseWithReturn(w_verificar_contrato, 'S')
end event

type st_1 from statictext within w_verificar_contrato
integer x = 41
integer y = 704
integer width = 3026
integer height = 700
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "Verifique si el Contrato a Digitar está Correcto, ya que No existe en Control Documentario"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_numero from statictext within w_verificar_contrato
integer x = 1143
integer y = 280
integer width = 1870
integer height = 292
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28573695
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_serie from statictext within w_verificar_contrato
integer x = 622
integer y = 276
integer width = 329
integer height = 292
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28573695
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_base from statictext within w_verificar_contrato
integer x = 101
integer y = 276
integer width = 329
integer height = 292
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28573695
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_verificar_contrato
integer x = 41
integer y = 64
integer width = 3026
integer height = 572
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Nº Contrato debe ser Igual al Folio que está Ingresando"
end type

