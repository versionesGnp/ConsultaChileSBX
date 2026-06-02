forward
global type w_consultar_copropietario from window
end type
type sle_amaterno from singlelineedit within w_consultar_copropietario
end type
type sle_apaterno from singlelineedit within w_consultar_copropietario
end type
type sle_nombres from singlelineedit within w_consultar_copropietario
end type
type em_rut from editmask within w_consultar_copropietario
end type
type st_4 from statictext within w_consultar_copropietario
end type
type st_3 from statictext within w_consultar_copropietario
end type
type st_2 from statictext within w_consultar_copropietario
end type
type st_1 from statictext within w_consultar_copropietario
end type
type cb_cancelar from commandbutton within w_consultar_copropietario
end type
type cb_buscar from commandbutton within w_consultar_copropietario
end type
type gb_1 from groupbox within w_consultar_copropietario
end type
type gb_2 from groupbox within w_consultar_copropietario
end type
end forward

global type w_consultar_copropietario from window
integer x = 832
integer y = 360
integer width = 1454
integer height = 912
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
sle_amaterno sle_amaterno
sle_apaterno sle_apaterno
sle_nombres sle_nombres
em_rut em_rut
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_cancelar cb_cancelar
cb_buscar cb_buscar
gb_1 gb_1
gb_2 gb_2
end type
global w_consultar_copropietario w_consultar_copropietario

on w_consultar_copropietario.create
this.sle_amaterno=create sle_amaterno
this.sle_apaterno=create sle_apaterno
this.sle_nombres=create sle_nombres
this.em_rut=create em_rut
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_buscar=create cb_buscar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.sle_amaterno,&
this.sle_apaterno,&
this.sle_nombres,&
this.em_rut,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_cancelar,&
this.cb_buscar,&
this.gb_1,&
this.gb_2}
end on

on w_consultar_copropietario.destroy
destroy(this.sle_amaterno)
destroy(this.sle_apaterno)
destroy(this.sle_nombres)
destroy(this.em_rut)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_buscar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;if gi_busqueda_cop=1 then this.title = 'Buscar CoPropietario Promesa'
if gi_busqueda_cop=2 then this.title = 'Buscar CoPropietario IsaCruz'
if gi_busqueda_cop=3 then this.title = 'Buscar CoPropietario Promesa / IsaCruz'
setnull(gi_rut_buscar)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
setnull(gs_nombres)
gf_centrar(w_consultar_copropietario)
end event

type sle_amaterno from singlelineedit within w_consultar_copropietario
integer x = 453
integer y = 480
integer width = 882
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_apaterno from singlelineedit within w_consultar_copropietario
integer x = 453
integer y = 372
integer width = 882
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_nombres from singlelineedit within w_consultar_copropietario
integer x = 453
integer y = 264
integer width = 882
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type em_rut from editmask within w_consultar_copropietario
integer x = 453
integer y = 92
integer width = 571
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = "~r"
end type

type st_4 from statictext within w_consultar_copropietario
integer x = 78
integer y = 480
integer width = 366
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "A. Materno:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_consultar_copropietario
integer x = 78
integer y = 372
integer width = 366
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "A. Paterno:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_consultar_copropietario
integer x = 78
integer y = 264
integer width = 366
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Nombres:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_consultar_copropietario
integer x = 78
integer y = 92
integer width = 366
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "R.U.T.:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_consultar_copropietario
integer x = 997
integer y = 664
integer width = 366
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;close(w_consultar_copropietario)
end event

type cb_buscar from commandbutton within w_consultar_copropietario
integer x = 50
integer y = 664
integer width = 366
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;IF trim(em_rut.text) = "" THEN
	if trim(sle_nombres.text) <> '' then
		gs_nombres = trim(sle_nombres.text)
	end if
	if trim(sle_apaterno.text) <> '' then
		gs_apellido_paterno = trim(sle_apaterno.text)
	end if
	if trim(sle_amaterno.text) <> '' then
		gs_apellido_materno = trim(sle_amaterno.text)
	end if
	setnull(gi_rut_buscar)
ELSE
	gi_rut_buscar	= long(trim(em_rut.text))
	setnull(gs_apellido_paterno)
	setnull(gs_apellido_materno)
	setnull(gs_nombres)
END IF
if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
Open(w_listado_datos_copropietarios)
sle_apaterno.text	= ''
sle_amaterno.text = '' 
sle_nombres.text 	= ''
em_rut.text 		= ''
end event

type gb_1 from groupbox within w_consultar_copropietario
integer x = 50
integer y = 24
integer width = 1317
integer height = 188
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_consultar_copropietario
integer x = 50
integer y = 204
integer width = 1317
integer height = 404
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

