forward
global type w_detalle_traspaso_empresa from window
end type
type cb_cerrar from commandbutton within w_detalle_traspaso_empresa
end type
type cb_imprimir from commandbutton within w_detalle_traspaso_empresa
end type
type st_2 from statictext within w_detalle_traspaso_empresa
end type
type em_fin from editmask within w_detalle_traspaso_empresa
end type
type p_hasta from picture within w_detalle_traspaso_empresa
end type
type cb_consultar from commandbutton within w_detalle_traspaso_empresa
end type
type p_desde from picture within w_detalle_traspaso_empresa
end type
type em_de from editmask within w_detalle_traspaso_empresa
end type
type st_1 from statictext within w_detalle_traspaso_empresa
end type
type dw_detalle from datawindow within w_detalle_traspaso_empresa
end type
end forward

global type w_detalle_traspaso_empresa from window
integer width = 2674
integer height = 1548
boolean titlebar = true
string title = "Traspaso Pagos a Empresas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
st_2 st_2
em_fin em_fin
p_hasta p_hasta
cb_consultar cb_consultar
p_desde p_desde
em_de em_de
st_1 st_1
dw_detalle dw_detalle
end type
global w_detalle_traspaso_empresa w_detalle_traspaso_empresa

type variables
String	is_opcion
end variables

on w_detalle_traspaso_empresa.create
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.st_2=create st_2
this.em_fin=create em_fin
this.p_hasta=create p_hasta
this.cb_consultar=create cb_consultar
this.p_desde=create p_desde
this.em_de=create em_de
this.st_1=create st_1
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_cerrar,&
this.cb_imprimir,&
this.st_2,&
this.em_fin,&
this.p_hasta,&
this.cb_consultar,&
this.p_desde,&
this.em_de,&
this.st_1,&
this.dw_detalle}
end on

on w_detalle_traspaso_empresa.destroy
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.st_2)
destroy(this.em_fin)
destroy(this.p_hasta)
destroy(this.cb_consultar)
destroy(this.p_desde)
destroy(this.em_de)
destroy(this.st_1)
destroy(this.dw_detalle)
end on

event open;gf_centrar(w_detalle_traspaso_empresa)
is_opcion	= Message.StringParm
dw_detalle.settransobject(sqlca)
end event

type cb_cerrar from commandbutton within w_detalle_traspaso_empresa
integer x = 2277
integer y = 1324
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_traspaso_empresa)
end event

type cb_imprimir from commandbutton within w_detalle_traspaso_empresa
integer x = 41
integer y = 1324
integer width = 325
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then f_printdlg(dw_detalle,gstr_print,w_detalle_traspaso_empresa)
end event

type st_2 from statictext within w_detalle_traspaso_empresa
integer x = 864
integer y = 56
integer width = 169
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fin from editmask within w_detalle_traspaso_empresa
integer x = 1047
integer y = 48
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;dw_detalle.reset()

end event

type p_hasta from picture within w_detalle_traspaso_empresa
integer x = 1390
integer y = 48
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date		ld_fecha

ld_fecha	= date(em_fin.text)
dw_detalle.reset()
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_fin.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_fin.text	= string(date(Message.StringParm))
END IF

end event

type cb_consultar from commandbutton within w_detalle_traspaso_empresa
integer x = 1509
integer y = 44
integer width = 357
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;date	ld_fecha_ini,ld_fecha_fin
SetPointer(HourGlass!)
ld_fecha_ini	= date(em_de.text)
ld_fecha_fin	= date(em_fin.text)
if ld_fecha_ini > ld_fecha_fin then
	messagebox("Advertencia","Error Rango de Fecha")
	em_fin.setfocus()
else
	if dw_detalle.retrieve(ld_fecha_ini,ld_fecha_fin,is_opcion)=0 then 
		messagebox("Advertencia","No Registra dato")
		em_fin.setfocus()
	end if
end if
SetPointer(Arrow!)
end event

type p_desde from picture within w_detalle_traspaso_empresa
integer x = 768
integer y = 48
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;date		ld_fecha

ld_fecha	= date(em_de.text)
dw_detalle.reset()
if f_valida_fecha(string(ld_fecha))=-1 then 
	em_de.text	= string(today(),gs_formato_fecha)
	return
end if
OpenWithParm(w_calendar,string(ld_fecha))
IF not isnull(Message.StringParm) THEN
	em_de.text	= string(date(Message.StringParm))
END IF

end event

type em_de from editmask within w_detalle_traspaso_empresa
integer x = 425
integer y = 48
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;dw_detalle.reset()

end event

type st_1 from statictext within w_detalle_traspaso_empresa
integer x = 64
integer y = 56
integer width = 325
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha Inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_detalle from datawindow within w_detalle_traspaso_empresa
integer x = 41
integer y = 176
integer width = 2578
integer height = 1116
integer taborder = 40
string title = "none"
string dataobject = "dw_informe_traspaso_pagos_a_empresa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

