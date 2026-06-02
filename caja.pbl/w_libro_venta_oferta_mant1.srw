forward
global type w_libro_venta_oferta_mant1 from window
end type
type dw_cajas from datawindow within w_libro_venta_oferta_mant1
end type
type st_2 from statictext within w_libro_venta_oferta_mant1
end type
type st_1 from statictext within w_libro_venta_oferta_mant1
end type
type cb_3 from commandbutton within w_libro_venta_oferta_mant1
end type
type cb_2 from commandbutton within w_libro_venta_oferta_mant1
end type
type em_ini from editmask within w_libro_venta_oferta_mant1
end type
type em_fin from editmask within w_libro_venta_oferta_mant1
end type
type cb_1 from commandbutton within w_libro_venta_oferta_mant1
end type
type dw_1 from datawindow within w_libro_venta_oferta_mant1
end type
end forward

global type w_libro_venta_oferta_mant1 from window
integer width = 3694
integer height = 1900
boolean titlebar = true
string title = "Libro de Ventas para Ofertas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_cajas dw_cajas
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_2 cb_2
em_ini em_ini
em_fin em_fin
cb_1 cb_1
dw_1 dw_1
end type
global w_libro_venta_oferta_mant1 w_libro_venta_oferta_mant1

event open;gf_centrar(w_libro_venta_oferta_mant1)
dw_1.settransobject(sqlca)
em_ini.text = string(today (),'dd/mm/yyyy')
em_fin.text = string(today (),'dd/mm/yyyy')
if gs_depto='T' or gs_depto='I' or gs_depto='C' then
	dw_cajas.visible	= true
	dw_cajas.settransobject(sqlca)
	dw_cajas.insertrow(0)
	dw_cajas.setfocus()
else
	dw_cajas.visible	= false
	em_fin.setfocus()
end if

end event

on w_libro_venta_oferta_mant1.create
this.dw_cajas=create dw_cajas
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.em_ini=create em_ini
this.em_fin=create em_fin
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.dw_cajas,&
this.st_2,&
this.st_1,&
this.cb_3,&
this.cb_2,&
this.em_ini,&
this.em_fin,&
this.cb_1,&
this.dw_1}
end on

on w_libro_venta_oferta_mant1.destroy
destroy(this.dw_cajas)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.em_ini)
destroy(this.em_fin)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type dw_cajas from datawindow within w_libro_venta_oferta_mant1
integer x = 558
integer y = 1668
integer width = 480
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_de_cajas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_1.reset()

end event

type st_2 from statictext within w_libro_venta_oferta_mant1
integer x = 1079
integer y = 1692
integer width = 197
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type st_1 from statictext within w_libro_venta_oferta_mant1
integer x = 1755
integer y = 1692
integer width = 160
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_libro_venta_oferta_mant1
integer x = 3319
integer y = 1672
integer width = 306
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_libro_venta_oferta_mant1)
end event

type cb_2 from commandbutton within w_libro_venta_oferta_mant1
integer x = 2437
integer y = 1672
integer width = 329
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;date 		fecha,fecha1
Long		ll_indi, ll_tot_reg, ll_folio_aux, ll_item,ll_folio
String	ls_caja
fecha 								= date(em_ini.text)
fecha1 								= date(em_fin.text)
if date(em_fin.text) > date(em_ini.text) then
	messagebox('Error','Fecha Inicial debe ser menor a la fecha final',stopsign!)
	em_fin.text 					= string(today (),'dd/mm/yyyy')
	em_ini.text 					= string(today (),'dd/mm/yyyy')
	em_fin.setfocus()
	return
end if
dw_1.settransobject(sqlca)
if dw_cajas.visible= true then
	ls_caja		= dw_cajas.getitemstring(1,'caja')
	if not isnull(ls_caja) then
		ll_tot_reg						= dw_1.retrieve(fecha,fecha1,ls_caja)
	else
		messagebox("Advertencia","Debe Seleccionar CAJA")
		dw_cajas.setfocus()
	end if
else
	ll_tot_reg							= dw_1.retrieve(fecha,fecha1,gs_caja)
end if
if ll_tot_reg = 0 then
	messagebox('Caja','No existen Información.',information!)
else
	dw_1.object.titulo4.text	= 'Administradora del Prado y La Foresta SpA'
	dw_1.object.titulo1.text 	= 'Rut : 96.885.180 - 2'
	if dw_cajas.visible= true then
		dw_1.object.titulo2.text 	= 'Libro de Ventas de Caja: '+ls_caja+' .'
	else
		dw_1.object.titulo2.text 	= 'Libro de Ventas de Caja: '+gs_caja+' .'
	end if
	dw_1.object.titulo3.text 	= '( Fecha de Corte : '+string( fecha1,'dd/mm/yyyy' )+' hasta '+string( fecha,'dd/mm/yyyy' )+ ' ).'
	ll_folio_aux					= 0
	ll_item							= 0
	for ll_indi = 1 to ll_tot_reg
		ll_folio	= dw_1.getitemnumber(ll_indi,'ingreso_folio')
		if ll_folio <> ll_folio_aux then 
			ll_folio_aux			= ll_folio
			ll_item ++
		end if
		dw_1.setitem(ll_indi,'item',ll_item)
	next
	dw_1.accepttext()
end if
end event

type em_ini from editmask within w_libro_venta_oferta_mant1
integer x = 1947
integer y = 1676
integer width = 430
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

event modified;dw_1.reset()
end event

type em_fin from editmask within w_libro_venta_oferta_mant1
integer x = 1275
integer y = 1676
integer width = 430
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

event modified;dw_1.reset()
end event

type cb_1 from commandbutton within w_libro_venta_oferta_mant1
integer x = 50
integer y = 1672
integer width = 274
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

event clicked;if dw_1.rowcount() > 0 then f_printdlg(dw_1,gstr_print,w_libro_venta_oferta_mant1)
end event

type dw_1 from datawindow within w_libro_venta_oferta_mant1
integer x = 50
integer y = 48
integer width = 3575
integer height = 1584
integer taborder = 50
string title = "none"
string dataobject = "dw_libro_venta_oferta_mant"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

