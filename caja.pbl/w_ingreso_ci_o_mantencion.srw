forward
global type w_ingreso_ci_o_mantencion from window
end type
type dw_cajas from datawindow within w_ingreso_ci_o_mantencion
end type
type st_3 from statictext within w_ingreso_ci_o_mantencion
end type
type cb_copiar from commandbutton within w_ingreso_ci_o_mantencion
end type
type cb_exportar from commandbutton within w_ingreso_ci_o_mantencion
end type
type cb_imprimir from commandbutton within w_ingreso_ci_o_mantencion
end type
type cb_consultar from commandbutton within w_ingreso_ci_o_mantencion
end type
type st_2 from statictext within w_ingreso_ci_o_mantencion
end type
type st_1 from statictext within w_ingreso_ci_o_mantencion
end type
type em_hasta from editmask within w_ingreso_ci_o_mantencion
end type
type em_de from editmask within w_ingreso_ci_o_mantencion
end type
type cb_cerrar from commandbutton within w_ingreso_ci_o_mantencion
end type
type dw_ingreso_folio_ci_o from datawindow within w_ingreso_ci_o_mantencion
end type
type p_1 from picture within w_ingreso_ci_o_mantencion
end type
end forward

global type w_ingreso_ci_o_mantencion from window
integer x = 46
integer y = 60
integer width = 2706
integer height = 1896
boolean titlebar = true
string title = "Informe de Folios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_cajas dw_cajas
st_3 st_3
cb_copiar cb_copiar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_consultar cb_consultar
st_2 st_2
st_1 st_1
em_hasta em_hasta
em_de em_de
cb_cerrar cb_cerrar
dw_ingreso_folio_ci_o dw_ingreso_folio_ci_o
p_1 p_1
end type
global w_ingreso_ci_o_mantencion w_ingreso_ci_o_mantencion

on w_ingreso_ci_o_mantencion.create
this.dw_cajas=create dw_cajas
this.st_3=create st_3
this.cb_copiar=create cb_copiar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_consultar=create cb_consultar
this.st_2=create st_2
this.st_1=create st_1
this.em_hasta=create em_hasta
this.em_de=create em_de
this.cb_cerrar=create cb_cerrar
this.dw_ingreso_folio_ci_o=create dw_ingreso_folio_ci_o
this.p_1=create p_1
this.Control[]={this.dw_cajas,&
this.st_3,&
this.cb_copiar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_consultar,&
this.st_2,&
this.st_1,&
this.em_hasta,&
this.em_de,&
this.cb_cerrar,&
this.dw_ingreso_folio_ci_o,&
this.p_1}
end on

on w_ingreso_ci_o_mantencion.destroy
destroy(this.dw_cajas)
destroy(this.st_3)
destroy(this.cb_copiar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_consultar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_hasta)
destroy(this.em_de)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso_folio_ci_o)
destroy(this.p_1)
end on

event open;gf_centrar(w_ingreso_ci_o_mantencion)
dw_ingreso_folio_ci_o.SetTransObject(SQLCA)
em_de.text 		= String(Today(), "dd/mm/yyyy")
em_hasta.text 	= String(Today(), "dd/mm/yyyy")
if gs_depto='T' or gs_depto='I' or gs_depto='C' then
	dw_cajas.visible	= true
	dw_cajas.settransobject(sqlca)
	dw_cajas.insertrow(0)
	dw_cajas.setfocus()
else
	dw_cajas.visible	= false
	em_de.setfocus()
end if
end event

type dw_cajas from datawindow within w_ingreso_ci_o_mantencion
integer x = 942
integer y = 228
integer width = 480
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_ingreso_folio_ci_o.reset()

end event

type st_3 from statictext within w_ingreso_ci_o_mantencion
integer x = 457
integer y = 76
integer width = 2071
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Informe de Ingresos por Promesas -O (CI-CU)"
boolean focusrectangle = false
end type

type cb_copiar from commandbutton within w_ingreso_ci_o_mantencion
integer x = 471
integer y = 348
integer width = 274
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copiar"
end type

event clicked;dw_ingreso_folio_ci_o.SaveAs("", Clipboard!, FALSE)
end event

type cb_exportar from commandbutton within w_ingreso_ci_o_mantencion
integer x = 302
integer y = 1664
integer width = 251
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_ingreso_folio_ci_o
if dw_ingreso_folio_ci_o.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ingreso_ci_o_mantencion
integer x = 46
integer y = 1664
integer width = 251
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_ingreso_folio_ci_o.rowcount() > 0 then f_printdlg(dw_ingreso_folio_ci_o,gstr_print,w_ingreso_ci_o_mantencion)
end event

type cb_consultar from commandbutton within w_ingreso_ci_o_mantencion
integer x = 2231
integer y = 348
integer width = 411
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;String	ls_caja
if dw_cajas.visible= true then
	ls_caja		= dw_cajas.getitemstring(1,'caja')
	if not isnull(ls_caja) then
		dw_ingreso_folio_ci_o.Retrieve(Date(em_de.text),Date(em_hasta.text),ls_caja)
	else
		messagebox("Advertencia","Debe Seleccionar CAJA")
		dw_cajas.setfocus()
	end if
else
	if dw_ingreso_folio_ci_o.Retrieve(Date(em_de.text),Date(em_hasta.text),gs_caja)=0 then
		MESSAGEBOX("Informacion","No Registra Dato")
	end if
end if
end event

type st_2 from statictext within w_ingreso_ci_o_mantencion
integer x = 1472
integer y = 352
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Hasta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_ci_o_mantencion
integer x = 1472
integer y = 248
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "De:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_hasta from editmask within w_ingreso_ci_o_mantencion
integer x = 1737
integer y = 348
integer width = 439
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string displaydata = ""
end type

event modified;dw_ingreso_folio_ci_o.reset()
end event

type em_de from editmask within w_ingreso_ci_o_mantencion
integer x = 1737
integer y = 232
integer width = 439
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string displaydata = ""
end type

event modified;dw_ingreso_folio_ci_o.reset()
end event

type cb_cerrar from commandbutton within w_ingreso_ci_o_mantencion
integer x = 2304
integer y = 1664
integer width = 338
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_ingreso_ci_o_mantencion)
end event

type dw_ingreso_folio_ci_o from datawindow within w_ingreso_ci_o_mantencion
integer x = 46
integer y = 484
integer width = 2597
integer height = 1144
integer taborder = 50
string dataobject = "dw_ingreso_folio_ci_o_mant"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_ingreso_ci_o_mantencion
integer x = 32
integer y = 32
integer width = 389
integer height = 416
boolean originalsize = true
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

