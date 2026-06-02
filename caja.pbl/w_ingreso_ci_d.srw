forward
global type w_ingreso_ci_d from window
end type
type dw_cajas from datawindow within w_ingreso_ci_d
end type
type st_3 from statictext within w_ingreso_ci_d
end type
type cb_exportar from commandbutton within w_ingreso_ci_d
end type
type cb_imprimir from commandbutton within w_ingreso_ci_d
end type
type cb_consultar from commandbutton within w_ingreso_ci_d
end type
type st_2 from statictext within w_ingreso_ci_d
end type
type em_hasta from editmask within w_ingreso_ci_d
end type
type cb_cerrar from commandbutton within w_ingreso_ci_d
end type
type dw_ingreso_folio_ci_d from datawindow within w_ingreso_ci_d
end type
type p_1 from picture within w_ingreso_ci_d
end type
type em_de from editmask within w_ingreso_ci_d
end type
type st_1 from statictext within w_ingreso_ci_d
end type
end forward

global type w_ingreso_ci_d from window
integer x = 46
integer y = 60
integer width = 2674
integer height = 1896
boolean titlebar = true
string title = "Informe de Folios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_cajas dw_cajas
st_3 st_3
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_consultar cb_consultar
st_2 st_2
em_hasta em_hasta
cb_cerrar cb_cerrar
dw_ingreso_folio_ci_d dw_ingreso_folio_ci_d
p_1 p_1
em_de em_de
st_1 st_1
end type
global w_ingreso_ci_d w_ingreso_ci_d

on w_ingreso_ci_d.create
this.dw_cajas=create dw_cajas
this.st_3=create st_3
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_consultar=create cb_consultar
this.st_2=create st_2
this.em_hasta=create em_hasta
this.cb_cerrar=create cb_cerrar
this.dw_ingreso_folio_ci_d=create dw_ingreso_folio_ci_d
this.p_1=create p_1
this.em_de=create em_de
this.st_1=create st_1
this.Control[]={this.dw_cajas,&
this.st_3,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_consultar,&
this.st_2,&
this.em_hasta,&
this.cb_cerrar,&
this.dw_ingreso_folio_ci_d,&
this.p_1,&
this.em_de,&
this.st_1}
end on

on w_ingreso_ci_d.destroy
destroy(this.dw_cajas)
destroy(this.st_3)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_consultar)
destroy(this.st_2)
destroy(this.em_hasta)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso_folio_ci_d)
destroy(this.p_1)
destroy(this.em_de)
destroy(this.st_1)
end on

event open;gf_centrar(w_ingreso_ci_d)
dw_ingreso_folio_ci_d.SetTransObject(SQLCA)
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

type dw_cajas from datawindow within w_ingreso_ci_d
integer x = 475
integer y = 316
integer width = 480
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_ingreso_folio_ci_d.reset()

end event

type st_3 from statictext within w_ingreso_ci_d
integer x = 475
integer y = 44
integer width = 1824
integer height = 212
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Informe de Ingresos por Derechos (D) (CI/CU)"
boolean focusrectangle = false
end type

type cb_exportar from commandbutton within w_ingreso_ci_d
integer x = 325
integer y = 1664
integer width = 265
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_ingreso_folio_ci_d
if dw_ingreso_folio_ci_d.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ingreso_ci_d
integer x = 50
integer y = 1664
integer width = 265
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_ingreso_folio_ci_d.rowcount() > 0 then f_Print( dw_ingreso_folio_ci_d )	//f_printdlg(dw_ingreso_folio_ci_d,gstr_print,w_ingreso_ci_d)
end event

type cb_consultar from commandbutton within w_ingreso_ci_d
integer x = 2240
integer y = 320
integer width = 375
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&onsultar"
end type

event clicked;String	ls_caja
if dw_cajas.visible= true then
	ls_caja		= dw_cajas.getitemstring(1,'caja')
	if not isnull(ls_caja) then
		dw_ingreso_folio_ci_d.Retrieve(Date(em_de.text),Date(em_hasta.text),ls_caja)
	else
		messagebox("Advertencia","Debe Seleccionar CAJA")
		dw_cajas.setfocus()
	end if
else
	if dw_ingreso_folio_ci_d.Retrieve(Date(em_de.text),Date(em_hasta.text),gs_caja)=0 then
		MESSAGEBOX("Informacion","No Registra Dato")
	end if
end if
end event

type st_2 from statictext within w_ingreso_ci_d
integer x = 1559
integer y = 332
integer width = 197
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

type em_hasta from editmask within w_ingreso_ci_d
integer x = 1774
integer y = 320
integer width = 425
integer height = 96
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

event modified;dw_ingreso_folio_ci_d.reset()
end event

type cb_cerrar from commandbutton within w_ingreso_ci_d
integer x = 2277
integer y = 1664
integer width = 338
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_ingreso_ci_d)
end event

type dw_ingreso_folio_ci_d from datawindow within w_ingreso_ci_d
integer x = 32
integer y = 484
integer width = 2583
integer height = 1144
integer taborder = 40
string dataobject = "dw_ingreso_folio_ci_d"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_ingreso_ci_d
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

type em_de from editmask within w_ingreso_ci_d
integer x = 1106
integer y = 320
integer width = 425
integer height = 96
integer taborder = 10
boolean bringtotop = true
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

event modified;dw_ingreso_folio_ci_d.reset()
end event

type st_1 from statictext within w_ingreso_ci_d
integer x = 960
integer y = 332
integer width = 128
integer height = 76
boolean bringtotop = true
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

