forward
global type w_informe_fe_ingreso from window
end type
type dw_detalle from datawindow within w_informe_fe_ingreso
end type
type cb_cerrar from commandbutton within w_informe_fe_ingreso
end type
type em_de from editmask within w_informe_fe_ingreso
end type
type em_hasta from editmask within w_informe_fe_ingreso
end type
type st_1 from statictext within w_informe_fe_ingreso
end type
type st_2 from statictext within w_informe_fe_ingreso
end type
type cb_consultar from commandbutton within w_informe_fe_ingreso
end type
type st_3 from statictext within w_informe_fe_ingreso
end type
type dw_cajas from datawindow within w_informe_fe_ingreso
end type
type dw_ingreso_folio from datawindow within w_informe_fe_ingreso
end type
end forward

global type w_informe_fe_ingreso from window
integer width = 3369
integer height = 1636
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_detalle dw_detalle
cb_cerrar cb_cerrar
em_de em_de
em_hasta em_hasta
st_1 st_1
st_2 st_2
cb_consultar cb_consultar
st_3 st_3
dw_cajas dw_cajas
dw_ingreso_folio dw_ingreso_folio
end type
global w_informe_fe_ingreso w_informe_fe_ingreso

event open;gf_centrar(w_informe_fe_ingreso)
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

on w_informe_fe_ingreso.create
this.dw_detalle=create dw_detalle
this.cb_cerrar=create cb_cerrar
this.em_de=create em_de
this.em_hasta=create em_hasta
this.st_1=create st_1
this.st_2=create st_2
this.cb_consultar=create cb_consultar
this.st_3=create st_3
this.dw_cajas=create dw_cajas
this.dw_ingreso_folio=create dw_ingreso_folio
this.Control[]={this.dw_detalle,&
this.cb_cerrar,&
this.em_de,&
this.em_hasta,&
this.st_1,&
this.st_2,&
this.cb_consultar,&
this.st_3,&
this.dw_cajas,&
this.dw_ingreso_folio}
end on

on w_informe_fe_ingreso.destroy
destroy(this.dw_detalle)
destroy(this.cb_cerrar)
destroy(this.em_de)
destroy(this.em_hasta)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_consultar)
destroy(this.st_3)
destroy(this.dw_cajas)
destroy(this.dw_ingreso_folio)
end on

type dw_detalle from datawindow within w_informe_fe_ingreso
integer x = 2569
integer y = 52
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_informe_facturas_exentas_detalle_pago"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_informe_fe_ingreso
integer x = 2935
integer y = 1388
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_informe_fe_ingreso)
end event

type em_de from editmask within w_informe_fe_ingreso
integer x = 663
integer y = 164
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
string displaydata = ""
end type

type em_hasta from editmask within w_informe_fe_ingreso
integer x = 1294
integer y = 164
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

type st_1 from statictext within w_informe_fe_ingreso
integer x = 553
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

type st_2 from statictext within w_informe_fe_ingreso
integer x = 1093
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

type cb_consultar from commandbutton within w_informe_fe_ingreso
integer x = 1851
integer y = 160
integer width = 325
integer height = 104
integer taborder = 20
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

type st_3 from statictext within w_informe_fe_ingreso
integer x = 55
integer y = 20
integer width = 1751
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
string text = "Informe de Ingresos por Facturas Exentas"
boolean focusrectangle = false
end type

type dw_cajas from datawindow within w_informe_fe_ingreso
integer x = 55
integer y = 160
integer width = 480
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_ingreso_folio.reset()

end event

type dw_ingreso_folio from datawindow within w_informe_fe_ingreso
integer x = 59
integer y = 296
integer width = 3218
integer height = 1052
integer taborder = 10
string title = "none"
string dataobject = "dw_informe_facturas_exentas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

