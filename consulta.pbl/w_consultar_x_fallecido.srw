forward
global type w_consultar_x_fallecido from window
end type
type ddlb_sepultura from dropdownlistbox within w_consultar_x_fallecido
end type
type ddlb_sector from dropdownlistbox within w_consultar_x_fallecido
end type
type st_7 from statictext within w_consultar_x_fallecido
end type
type st_6 from statictext within w_consultar_x_fallecido
end type
type sle_amaterno from singlelineedit within w_consultar_x_fallecido
end type
type sle_apaterno from singlelineedit within w_consultar_x_fallecido
end type
type sle_nombres from singlelineedit within w_consultar_x_fallecido
end type
type em_rut from editmask within w_consultar_x_fallecido
end type
type st_4 from statictext within w_consultar_x_fallecido
end type
type st_3 from statictext within w_consultar_x_fallecido
end type
type st_2 from statictext within w_consultar_x_fallecido
end type
type st_1 from statictext within w_consultar_x_fallecido
end type
type cb_cancelar from commandbutton within w_consultar_x_fallecido
end type
type cb_buscar from commandbutton within w_consultar_x_fallecido
end type
type gb_1 from groupbox within w_consultar_x_fallecido
end type
type gb_2 from groupbox within w_consultar_x_fallecido
end type
type gb_3 from groupbox within w_consultar_x_fallecido
end type
end forward

global type w_consultar_x_fallecido from window
integer x = 832
integer y = 360
integer width = 1431
integer height = 1176
boolean titlebar = true
string title = "Buscar contrato por persona Fallecida"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
ddlb_sepultura ddlb_sepultura
ddlb_sector ddlb_sector
st_7 st_7
st_6 st_6
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
gb_3 gb_3
end type
global w_consultar_x_fallecido w_consultar_x_fallecido

on w_consultar_x_fallecido.create
this.ddlb_sepultura=create ddlb_sepultura
this.ddlb_sector=create ddlb_sector
this.st_7=create st_7
this.st_6=create st_6
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
this.gb_3=create gb_3
this.Control[]={this.ddlb_sepultura,&
this.ddlb_sector,&
this.st_7,&
this.st_6,&
this.sle_amaterno,&
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
this.gb_2,&
this.gb_3}
end on

on w_consultar_x_fallecido.destroy
destroy(this.ddlb_sepultura)
destroy(this.ddlb_sector)
destroy(this.st_7)
destroy(this.st_6)
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
destroy(this.gb_3)
end on

event open;string ls_sql

setnull(gi_tipo_busqueda)
setnull(gi_rut)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
setnull(gs_nombres)
setnull(gs_sector)
setnull(gs_sepultura)
ls_sql = 'SELECT DISTINCT INVENTARIO_PLANI.SECTOR FROM INVENTARIO_PLANI ORDER BY INVENTARIO_PLANI.SECTOR ASC  '
f_ddlb_all(ddlb_sector,ls_sql)
gf_centrar(w_consultar_x_fallecido)
end event

type ddlb_sepultura from dropdownlistbox within w_consultar_x_fallecido
integer x = 453
integer y = 772
integer width = 571
integer height = 964
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_sector from dropdownlistbox within w_consultar_x_fallecido
integer x = 453
integer y = 664
integer width = 571
integer height = 964
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_sql

setnull(gi_tipo_busqueda)
setnull(gi_rut)
setnull(gs_apellido_paterno)
setnull(gs_apellido_materno)
setnull(gs_nombres)
setnull(gs_sepultura)
ls_sql = 'SELECT DISTINCT "FALLECIDOS"."N_SEP" FROM "FALLECIDOS" WHERE "FALLECIDOS"."SECTOR" = '+"'"+this.text+"'"+' ORDER BY "FALLECIDOS"."N_SEP"  ASC  '
f_ddlb_all(ddlb_sepultura,ls_sql)
gf_centrar(w_consultar_x_fallecido)
end event

type st_7 from statictext within w_consultar_x_fallecido
integer x = 78
integer y = 772
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
string text = "Sepultura:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_consultar_x_fallecido
integer x = 78
integer y = 664
integer width = 366
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Sector:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_amaterno from singlelineedit within w_consultar_x_fallecido
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

type sle_apaterno from singlelineedit within w_consultar_x_fallecido
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

type sle_nombres from singlelineedit within w_consultar_x_fallecido
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

type em_rut from editmask within w_consultar_x_fallecido
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
string mask = "###,###,###"
string displaydata = "~r"
end type

type st_4 from statictext within w_consultar_x_fallecido
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

type st_3 from statictext within w_consultar_x_fallecido
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

type st_2 from statictext within w_consultar_x_fallecido
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

type st_1 from statictext within w_consultar_x_fallecido
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

type cb_cancelar from commandbutton within w_consultar_x_fallecido
integer x = 997
integer y = 936
integer width = 366
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;
close(w_consultar_x_fallecido)
end event

type cb_buscar from commandbutton within w_consultar_x_fallecido
integer x = 50
integer y = 936
integer width = 366
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;if trim(em_rut.text)<>'' or not isnull(em_rut.text) or trim(sle_nombres.text)<>'' or not isnull(sle_nombres.text) or &
	trim(sle_apaterno.text)<>'' or not isnull(sle_apaterno.text) or trim(sle_amaterno.text)<>'' or not isnull(sle_amaterno.text) or &
	trim(ddlb_sector.text)<>'' or not isnull(ddlb_sector.text) or trim(ddlb_sepultura.text)<>'' or not isnull(ddlb_sepultura.text) then

	IF em_rut.text = "" THEN
		gi_tipo_busqueda 		= 4
		gs_apellido_paterno	= TRIM(sle_apaterno.text)
		gs_apellido_materno	= TRIM(sle_amaterno.text)
		gs_nombres 				= TRIM(sle_nombres.text)
		gs_sector 				= TRIM(ddlb_sector.text)
		gs_sepultura 			= TRIM(ddlb_sepultura.text)
		setnull(gi_rut)
	ELSE
		gi_tipo_busqueda 		= 4
		gi_rut 					= Long(TRIM(em_rut.text))
		gs_apellido_paterno	= ''
		gs_apellido_materno	= ''
		gs_nombres				= ''
		gs_sector				= ''
		gs_sepultura			= ''
	END IF
	//close(w_consultar_x_fallecido)
	if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
	if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
	if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
	if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
	if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
	if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
	if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
	if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
	Open(w_listado_contratos)
	sle_apaterno.text 		= ''
	sle_amaterno.text 		= '' 
	sle_nombres.text 			= ''
	ddlb_sector.SelectItem(0)
	ddlb_sepultura.reset()
	em_rut.text 				= ''
else
	messagebox("Advertencia","Debe Ingresar Datos a Buscar")
end if
end event

type gb_1 from groupbox within w_consultar_x_fallecido
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

type gb_2 from groupbox within w_consultar_x_fallecido
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

type gb_3 from groupbox within w_consultar_x_fallecido
integer x = 50
integer y = 600
integer width = 1317
integer height = 300
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

