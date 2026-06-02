forward
global type w_ingreso_folio from window
end type
type dw_cajas from datawindow within w_ingreso_folio
end type
type st_3 from statictext within w_ingreso_folio
end type
type cb_copiar from commandbutton within w_ingreso_folio
end type
type cb_exportar from commandbutton within w_ingreso_folio
end type
type cb_imprimir from commandbutton within w_ingreso_folio
end type
type cb_consultar from commandbutton within w_ingreso_folio
end type
type st_2 from statictext within w_ingreso_folio
end type
type st_1 from statictext within w_ingreso_folio
end type
type em_hasta from editmask within w_ingreso_folio
end type
type em_de from editmask within w_ingreso_folio
end type
type cb_cerrar from commandbutton within w_ingreso_folio
end type
type dw_ingreso_folio from datawindow within w_ingreso_folio
end type
type p_1 from picture within w_ingreso_folio
end type
end forward

global type w_ingreso_folio from window
integer x = 46
integer y = 60
integer width = 2807
integer height = 2032
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
dw_ingreso_folio dw_ingreso_folio
p_1 p_1
end type
global w_ingreso_folio w_ingreso_folio

on w_ingreso_folio.create
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
this.dw_ingreso_folio=create dw_ingreso_folio
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
this.dw_ingreso_folio,&
this.p_1}
end on

on w_ingreso_folio.destroy
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
destroy(this.dw_ingreso_folio)
destroy(this.p_1)
end on

event open;gf_centrar(w_ingreso_folio)
dw_ingreso_folio.SetTransObject(SQLCA)
em_de.text 				= String(Today(), "dd/mm/yyyy")
em_hasta.text			= String(Today(), "dd/mm/yyyy")
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

type dw_cajas from datawindow within w_ingreso_folio
integer x = 713
integer y = 160
integer width = 480
integer height = 108
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_ingreso_folio.reset()

end event

type st_3 from statictext within w_ingreso_folio
integer x = 366
integer y = 20
integer width = 1289
integer height = 116
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Informe de Ingresos por Folios"
boolean focusrectangle = false
end type

type cb_copiar from commandbutton within w_ingreso_folio
integer x = 361
integer y = 172
integer width = 247
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copiar"
end type

event clicked;

dw_ingreso_folio.SaveAs("", Clipboard!, FALSE)
end event

type cb_exportar from commandbutton within w_ingreso_folio
integer x = 311
integer y = 1808
integer width = 274
integer height = 108
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
dw_paso	= dw_ingreso_folio
if dw_ingreso_folio.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ingreso_folio
integer x = 32
integer y = 1808
integer width = 274
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_ingreso_folio.rowcount() > 0 then f_printdlg(dw_ingreso_folio,gstr_print,w_ingreso_folio)
end event

type cb_consultar from commandbutton within w_ingreso_folio
integer x = 2418
integer y = 160
integer width = 325
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;String	ls_caja
if dw_cajas.visible= true then
	ls_caja							= dw_cajas.getitemstring(1,'caja')
	if not isnull(ls_caja) then
		dw_ingreso_folio.Retrieve(Date(em_de.text),Date(em_hasta.text),ls_caja)
	else
		messagebox("Advertencia","Debe Seleccionar CAJA")
		dw_cajas.setfocus()
	end if
else
	if dw_ingreso_folio.Retrieve(Date(em_de.text),Date(em_hasta.text),gs_caja)=0 then
		MESSAGEBOX("Informacion","No Registra Dato")
	end if
end if
end event

type st_2 from statictext within w_ingreso_folio
integer x = 1751
integer y = 176
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

type st_1 from statictext within w_ingreso_folio
integer x = 1211
integer y = 176
integer width = 105
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

type em_hasta from editmask within w_ingreso_folio
integer x = 1952
integer y = 164
integer width = 430
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

type em_de from editmask within w_ingreso_folio
integer x = 1321
integer y = 164
integer width = 430
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

type cb_cerrar from commandbutton within w_ingreso_folio
integer x = 2441
integer y = 1808
integer width = 311
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_ingreso_folio)
end event

type dw_ingreso_folio from datawindow within w_ingreso_folio
integer x = 32
integer y = 300
integer width = 2720
integer height = 1476
integer taborder = 50
string dataobject = "dw_ingreso_folio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_ingreso_folio
integer x = 32
integer y = 28
integer width = 302
integer height = 240
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

