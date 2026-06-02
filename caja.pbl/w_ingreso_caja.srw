forward
global type w_ingreso_caja from window
end type
type dw_cajas from datawindow within w_ingreso_caja
end type
type st_3 from statictext within w_ingreso_caja
end type
type cb_exportar from commandbutton within w_ingreso_caja
end type
type cb_imprimir from commandbutton within w_ingreso_caja
end type
type cb_consultar from commandbutton within w_ingreso_caja
end type
type st_2 from statictext within w_ingreso_caja
end type
type st_1 from statictext within w_ingreso_caja
end type
type em_hasta from editmask within w_ingreso_caja
end type
type em_de from editmask within w_ingreso_caja
end type
type cb_cerrar from commandbutton within w_ingreso_caja
end type
type dw_ingreso_item from datawindow within w_ingreso_caja
end type
type p_1 from picture within w_ingreso_caja
end type
end forward

global type w_ingreso_caja from window
integer x = 46
integer y = 60
integer width = 2853
integer height = 1896
boolean titlebar = true
string title = "Informe de Ingreso"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_cajas dw_cajas
st_3 st_3
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_consultar cb_consultar
st_2 st_2
st_1 st_1
em_hasta em_hasta
em_de em_de
cb_cerrar cb_cerrar
dw_ingreso_item dw_ingreso_item
p_1 p_1
end type
global w_ingreso_caja w_ingreso_caja

on w_ingreso_caja.create
this.dw_cajas=create dw_cajas
this.st_3=create st_3
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_consultar=create cb_consultar
this.st_2=create st_2
this.st_1=create st_1
this.em_hasta=create em_hasta
this.em_de=create em_de
this.cb_cerrar=create cb_cerrar
this.dw_ingreso_item=create dw_ingreso_item
this.p_1=create p_1
this.Control[]={this.dw_cajas,&
this.st_3,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_consultar,&
this.st_2,&
this.st_1,&
this.em_hasta,&
this.em_de,&
this.cb_cerrar,&
this.dw_ingreso_item,&
this.p_1}
end on

on w_ingreso_caja.destroy
destroy(this.dw_cajas)
destroy(this.st_3)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_consultar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_hasta)
destroy(this.em_de)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso_item)
destroy(this.p_1)
end on

event open;gf_centrar(w_ingreso_caja)
dw_ingreso_item.SetTransObject(SQLCA)
em_de.text				= String(Today(), "dd/mm/yyyy")
em_hasta.text 			= String(Today(), "dd/mm/yyyy")
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

type dw_cajas from datawindow within w_ingreso_caja
integer x = 489
integer y = 228
integer width = 521
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_ingreso_item.reset()

end event

type st_3 from statictext within w_ingreso_caja
integer x = 512
integer y = 64
integer width = 1751
integer height = 128
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Informe Ingresos por Contratos"
boolean focusrectangle = false
end type

type cb_exportar from commandbutton within w_ingreso_caja
integer x = 343
integer y = 1660
integer width = 302
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
dw_paso	= dw_ingreso_item
if dw_ingreso_item.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ingreso_caja
integer x = 37
integer y = 1660
integer width = 302
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

event clicked;if dw_ingreso_item.rowcount() > 0 then f_printdlg(dw_ingreso_item,gstr_print,w_ingreso_caja)
end event

type cb_consultar from commandbutton within w_ingreso_caja
integer x = 1920
integer y = 352
integer width = 389
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&onsultar"
end type

event clicked;String	ls_caja
if dw_cajas.visible= true then
	ls_caja							= dw_cajas.getitemstring(1,'caja')
	if not isnull(ls_caja) then
		dw_ingreso_item.Retrieve(Date(em_de.text),Date(em_hasta.text),ls_caja)
	else
		messagebox("Advertencia","Debe Seleccionar CAJA")
		dw_cajas.setfocus()
	end if
else
	if dw_ingreso_item.Retrieve(Date(em_de.text),Date(em_hasta.text),gs_caja)=0 then
		MESSAGEBOX("Informacion","No Registra Dato")
	end if
end if
end event

type st_2 from statictext within w_ingreso_caja
integer x = 1097
integer y = 352
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Hasta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_caja
integer x = 1097
integer y = 248
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "De:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_hasta from editmask within w_ingreso_caja
integer x = 1362
integer y = 348
integer width = 430
integer height = 100
integer taborder = 30
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

type em_de from editmask within w_ingreso_caja
integer x = 1362
integer y = 232
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
string displaydata = ""
end type

type cb_cerrar from commandbutton within w_ingreso_caja
integer x = 2437
integer y = 1660
integer width = 361
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_ingreso_caja)
end event

type dw_ingreso_item from datawindow within w_ingreso_caja
integer x = 37
integer y = 476
integer width = 2761
integer height = 1128
integer taborder = 50
string dataobject = "dw_ingreso_item"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_ingreso_caja
integer x = 37
integer y = 32
integer width = 411
integer height = 400
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

