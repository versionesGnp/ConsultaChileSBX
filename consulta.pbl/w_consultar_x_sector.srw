forward
global type w_consultar_x_sector from window
end type
type ddlb_sector from dropdownlistbox within w_consultar_x_sector
end type
type cb_buscar2 from commandbutton within w_consultar_x_sector
end type
type st_7 from statictext within w_consultar_x_sector
end type
type sle_tecnico from singlelineedit within w_consultar_x_sector
end type
type st_6 from statictext within w_consultar_x_sector
end type
type sle_area from singlelineedit within w_consultar_x_sector
end type
type cb_cancelar from commandbutton within w_consultar_x_sector
end type
type cb_buscar from commandbutton within w_consultar_x_sector
end type
type sle_sepultura from singlelineedit within w_consultar_x_sector
end type
type st_2 from statictext within w_consultar_x_sector
end type
type ddlb_base from dropdownlistbox within w_consultar_x_sector
end type
type st_1 from statictext within w_consultar_x_sector
end type
type st_5 from statictext within w_consultar_x_sector
end type
type st_3 from statictext within w_consultar_x_sector
end type
type gb_1 from groupbox within w_consultar_x_sector
end type
end forward

global type w_consultar_x_sector from window
integer x = 832
integer y = 356
integer width = 1979
integer height = 836
boolean titlebar = true
string title = "Buscar Contrato por Ubicación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
ddlb_sector ddlb_sector
cb_buscar2 cb_buscar2
st_7 st_7
sle_tecnico sle_tecnico
st_6 st_6
sle_area sle_area
cb_cancelar cb_cancelar
cb_buscar cb_buscar
sle_sepultura sle_sepultura
st_2 st_2
ddlb_base ddlb_base
st_1 st_1
st_5 st_5
st_3 st_3
gb_1 gb_1
end type
global w_consultar_x_sector w_consultar_x_sector

on w_consultar_x_sector.create
this.ddlb_sector=create ddlb_sector
this.cb_buscar2=create cb_buscar2
this.st_7=create st_7
this.sle_tecnico=create sle_tecnico
this.st_6=create st_6
this.sle_area=create sle_area
this.cb_cancelar=create cb_cancelar
this.cb_buscar=create cb_buscar
this.sle_sepultura=create sle_sepultura
this.st_2=create st_2
this.ddlb_base=create ddlb_base
this.st_1=create st_1
this.st_5=create st_5
this.st_3=create st_3
this.gb_1=create gb_1
this.Control[]={this.ddlb_sector,&
this.cb_buscar2,&
this.st_7,&
this.sle_tecnico,&
this.st_6,&
this.sle_area,&
this.cb_cancelar,&
this.cb_buscar,&
this.sle_sepultura,&
this.st_2,&
this.ddlb_base,&
this.st_1,&
this.st_5,&
this.st_3,&
this.gb_1}
end on

on w_consultar_x_sector.destroy
destroy(this.ddlb_sector)
destroy(this.cb_buscar2)
destroy(this.st_7)
destroy(this.sle_tecnico)
destroy(this.st_6)
destroy(this.sle_area)
destroy(this.cb_cancelar)
destroy(this.cb_buscar)
destroy(this.sle_sepultura)
destroy(this.st_2)
destroy(this.ddlb_base)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.gb_1)
end on

event open;string ls_sql

gs_base	= ""
gi_rut	= 0
gs_serie	= ""
gi_numero= 0
rutx		= 0
sle_tecnico.text =""
ls_sql 	= 'SELECT DISTINCT PLANIMETRIA.SECTOR FROM PLANIMETRIA ORDER BY PLANIMETRIA.SECTOR ASC  '
f_ddlb_all(ddlb_sector,ls_sql)
gf_centrar(w_consultar_x_sector)
end event

event close;Setnull(gs_base_sepult)
end event

type ddlb_sector from dropdownlistbox within w_consultar_x_sector
integer x = 713
integer y = 180
integer width = 585
integer height = 560
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_buscar2 from commandbutton within w_consultar_x_sector
event clicked pbm_bnclicked
integer x = 1376
integer y = 564
integer width = 485
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Nº Tecnico"
end type

event clicked;CHOOSE CASE MID(ddlb_base.text, 1,1)
	CASE "C"
		gi_tipo_busqueda = 7
END CHOOSE

IF sle_tecnico.text = "" THEN
	gi_tecnico = long(sle_tecnico.text)
ELSE
	gi_tecnico = long(sle_tecnico.text )
END IF
if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
Open(w_listado_contratos)
//close(w_consultar_x_sector)
end event

type st_7 from statictext within w_consultar_x_sector
integer x = 78
integer y = 572
integer width = 617
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Nº Técnico:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_tecnico from singlelineedit within w_consultar_x_sector
integer x = 713
integer y = 572
integer width = 585
integer height = 92
integer taborder = 50
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

type st_6 from statictext within w_consultar_x_sector
integer x = 78
integer y = 388
integer width = 617
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Area:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_area from singlelineedit within w_consultar_x_sector
integer x = 713
integer y = 388
integer width = 585
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

type cb_cancelar from commandbutton within w_consultar_x_sector
integer x = 1376
integer y = 268
integer width = 485
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Setnull(gs_base_sepult)
ddlb_sector.text =""
sle_sepultura.text = ""
sle_area.text =""
sle_tecnico.text =""


close(w_consultar_x_sector)
end event

type cb_buscar from commandbutton within w_consultar_x_sector
integer x = 1376
integer y = 156
integer width = 485
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;CHOOSE CASE MID(ddlb_base.text, 1,1)
	CASE "O"
		gi_tipo_busqueda	= 5
		gs_base_sepult		= 'O'
		gs_base				= 'O'
	CASE "U"
		gi_tipo_busqueda	= 5
		gs_base_sepult		= 'U'
		gs_base				= 'U'
	CASE "C"
		gi_tipo_busqueda 	= 5
		gs_base_sepult		= 'C'
		gs_base				= 'C'
END CHOOSE

if MID(ddlb_base.text, 1,1)='' or isnull(MID(ddlb_base.text, 1,1)) then
	gi_tipo_busqueda 		= 5
	gs_base_sepult			= '%'
end if
IF ddlb_sector.text = "" THEN
	gs_sector = ddlb_sector.text 
ELSE
	gs_sector = ddlb_sector.text
END IF

IF sle_sepultura.text = "" THEN
	gs_sepultura = sle_sepultura.text 
ELSE
	gs_sepultura = sle_sepultura.text
END IF

IF sle_area.text = "" THEN
	gs_area = sle_area.text
ELSE
	gs_area = sle_area.text 
END IF
if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
Open(w_listado_contratos)
ddlb_sector.SelectItem(0)
//close(w_consultar_x_sector)
end event

type sle_sepultura from singlelineedit within w_consultar_x_sector
integer x = 713
integer y = 284
integer width = 585
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

type st_2 from statictext within w_consultar_x_sector
integer x = 78
integer y = 180
integer width = 617
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
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

type ddlb_base from dropdownlistbox within w_consultar_x_sector
integer x = 713
integer y = 76
integer width = 585
integer height = 324
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"O - Promesas","C - Contrato ISA"}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_consultar_x_sector
integer x = 78
integer y = 76
integer width = 617
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Tipo de Contrato:"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_consultar_x_sector
integer x = 110
integer y = 284
integer width = 142
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "+ %"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_consultar_x_sector
integer x = 78
integer y = 284
integer width = 617
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
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

type gb_1 from groupbox within w_consultar_x_sector
integer x = 32
integer y = 4
integer width = 1888
integer height = 524
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

