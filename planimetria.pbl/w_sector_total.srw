forward
global type w_sector_total from window
end type
type st_1 from statictext within w_sector_total
end type
type cb_4 from commandbutton within w_sector_total
end type
type cb_3 from commandbutton within w_sector_total
end type
type cb_2 from commandbutton within w_sector_total
end type
type dw_1 from datawindow within w_sector_total
end type
type cb_1 from commandbutton within w_sector_total
end type
end forward

global type w_sector_total from window
integer x = 1563
integer y = 884
integer width = 2437
integer height = 1688
boolean titlebar = true
string title = "Buscar por Sector"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_1 st_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
end type
global w_sector_total w_sector_total

on w_sector_total.create
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.dw_1,&
this.cb_1}
end on

on w_sector_total.destroy
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;string ls_sector

gf_centrar(w_sector_total)
ls_sector = Message.StringParm
dw_1.settransobject (sqlca)
if dw_1.retrieve(ls_sector) > 0 then
	st_1.text = ' '+string(dw_1.rowcount(),'###,###,###,##0')+' Registros'
else
	messagebox('No hay Registros','No esxiste información disponible',stopsign!)
	close(w_sector_total)
end if

end event

type st_1 from statictext within w_sector_total
integer x = 50
integer y = 1456
integer width = 718
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_sector_total
integer x = 1394
integer y = 1460
integer width = 320
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;f_DWToExcel( dw_1)
end event

type cb_3 from commandbutton within w_sector_total
integer x = 1083
integer y = 1460
integer width = 306
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_1.setsort(nulo)
dw_1.sort()
st_1.text = ' '+string(dw_1.rowcount(),'###,###,###,##0')+' Registros'
end event

type cb_2 from commandbutton within w_sector_total
integer x = 805
integer y = 1460
integer width = 279
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull(nulo)
dw_1.setfilter(nulo)
dw_1.filter()
st_1.text = ' '+string(dw_1.rowcount(),'###,###,###,##0')+' Registros'
end event

type dw_1 from datawindow within w_sector_total
integer x = 37
integer y = 36
integer width = 2304
integer height = 1376
integer taborder = 10
string dataobject = "a_sector_total"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(getrow(), TRUE)
end event

event doubleclicked;gs_base = getitemstring(row,'cadena_codigo')
gs_serie = getitemstring(row,'cadena_serie')
gi_numero = getitemnumber(row,'cadena_numero')
CHOOSE CASE gs_base
	CASE 'O'
		open(w_cuenta_corriente_oferta)
	CASE 'C'
		open(w_cuenta_corriente_contrato_isa)
//	CASE 'P'
//		open(w_cuenta_corriente_pagare)
//	CASE 'L'
//		open(w_cuenta_corriente_liberador)
//	CASE 'D'
//		open(w_cuenta_corriente_derecho)
END CHOOSE

end event

type cb_1 from commandbutton within w_sector_total
integer x = 2075
integer y = 1460
integer width = 279
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_sector_total)
end event

