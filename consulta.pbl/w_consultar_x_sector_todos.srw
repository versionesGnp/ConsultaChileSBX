forward
global type w_consultar_x_sector_todos from window
end type
type st_1 from statictext within w_consultar_x_sector_todos
end type
type ddlb_sector from dropdownlistbox within w_consultar_x_sector_todos
end type
type cb_cancelar from commandbutton within w_consultar_x_sector_todos
end type
type cb_buscar from commandbutton within w_consultar_x_sector_todos
end type
type gb_1 from groupbox within w_consultar_x_sector_todos
end type
end forward

global type w_consultar_x_sector_todos from window
integer x = 832
integer y = 356
integer width = 1303
integer height = 624
boolean titlebar = true
string title = "Consultar Contratos por Ubicación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_1 st_1
ddlb_sector ddlb_sector
cb_cancelar cb_cancelar
cb_buscar cb_buscar
gb_1 gb_1
end type
global w_consultar_x_sector_todos w_consultar_x_sector_todos

on w_consultar_x_sector_todos.create
this.st_1=create st_1
this.ddlb_sector=create ddlb_sector
this.cb_cancelar=create cb_cancelar
this.cb_buscar=create cb_buscar
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.ddlb_sector,&
this.cb_cancelar,&
this.cb_buscar,&
this.gb_1}
end on

on w_consultar_x_sector_todos.destroy
destroy(this.st_1)
destroy(this.ddlb_sector)
destroy(this.cb_cancelar)
destroy(this.cb_buscar)
destroy(this.gb_1)
end on

event open;string ls_sql
gs_base		= ""
gi_rut		= 0
gs_serie		= ""
gi_numero	= 0
rutx			= 0
ls_sql 		= 'SELECT DISTINCT PLANIMETRIA.SECTOR FROM PLANIMETRIA ORDER BY PLANIMETRIA.SECTOR ASC  '
f_ddlb_all(ddlb_sector,ls_sql)
gf_centrar(w_consultar_x_sector_todos)
end event

type st_1 from statictext within w_consultar_x_sector_todos
integer x = 91
integer y = 36
integer width = 987
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
string text = "Buscar Contratos por SECTOR"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_sector from dropdownlistbox within w_consultar_x_sector_todos
integer x = 119
integer y = 200
integer width = 585
integer height = 900
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_consultar_x_sector_todos
integer x = 800
integer y = 300
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;
ddlb_sector.text =""


close(w_consultar_x_sector_todos)
end event

type cb_buscar from commandbutton within w_consultar_x_sector_todos
integer x = 800
integer y = 172
integer width = 329
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;//CHOOSE CASE MID(ddlb_base.text, 1,1)
//	CASE "O"
//		gi_tipo_busqueda = 5
//	CASE "C"
//		gi_tipo_busqueda = 6
//END CHOOSE
//

gi_tipo_busqueda = 9
IF ddlb_sector.text = "" THEN
	gs_sector = ddlb_sector.text 
ELSE
	gs_sector = ddlb_sector.text
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

type gb_1 from groupbox within w_consultar_x_sector_todos
integer x = 64
integer y = 44
integer width = 1170
integer height = 436
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

