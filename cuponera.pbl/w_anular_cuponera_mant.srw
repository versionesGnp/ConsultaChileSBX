forward
global type w_anular_cuponera_mant from window
end type
type cb_guardar from commandbutton within w_anular_cuponera_mant
end type
type cb_limpiar from commandbutton within w_anular_cuponera_mant
end type
type cb_filtrar from commandbutton within w_anular_cuponera_mant
end type
type cb_ordenar from commandbutton within w_anular_cuponera_mant
end type
type cb_exportar from commandbutton within w_anular_cuponera_mant
end type
type cb_cerrar from commandbutton within w_anular_cuponera_mant
end type
type cb_buscar from commandbutton within w_anular_cuponera_mant
end type
type st_1 from statictext within w_anular_cuponera_mant
end type
type sle_numero from singlelineedit within w_anular_cuponera_mant
end type
type dw_base from datawindow within w_anular_cuponera_mant
end type
type dw_lista_cupones from datawindow within w_anular_cuponera_mant
end type
end forward

global type w_anular_cuponera_mant from window
integer width = 3950
integer height = 1856
boolean titlebar = true
string title = "Anular Cuponera Mantención"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 134217750
string icon = "AppIcon!"
boolean center = true
cb_guardar cb_guardar
cb_limpiar cb_limpiar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_cerrar cb_cerrar
cb_buscar cb_buscar
st_1 st_1
sle_numero sle_numero
dw_base dw_base
dw_lista_cupones dw_lista_cupones
end type
global w_anular_cuponera_mant w_anular_cuponera_mant

type variables
Long	il_mod_cupones, il_mod_cliente_rez, il_mod_agentes,il_row
end variables

on w_anular_cuponera_mant.create
this.cb_guardar=create cb_guardar
this.cb_limpiar=create cb_limpiar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.cb_buscar=create cb_buscar
this.st_1=create st_1
this.sle_numero=create sle_numero
this.dw_base=create dw_base
this.dw_lista_cupones=create dw_lista_cupones
this.Control[]={this.cb_guardar,&
this.cb_limpiar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_cerrar,&
this.cb_buscar,&
this.st_1,&
this.sle_numero,&
this.dw_base,&
this.dw_lista_cupones}
end on

on w_anular_cuponera_mant.destroy
destroy(this.cb_guardar)
destroy(this.cb_limpiar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.cb_buscar)
destroy(this.st_1)
destroy(this.sle_numero)
destroy(this.dw_base)
destroy(this.dw_lista_cupones)
end on

event open;dw_lista_cupones.settransobject(sqlca)
dw_base.getchild('base',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve()=0 then
		idw_detalle.insertrow(0)
	end if
	dw_base.getchild('serie',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve('O')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_base.insertrow(0)
	dw_base.accepttext()
	dw_base.setfocus()
end event

type cb_guardar from commandbutton within w_anular_cuponera_mant
integer x = 46
integer y = 1640
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;if il_mod_cupones > 0 then
	if dw_lista_cupones.update()=1 then
		commit;
		messagebox("Grabar","Modificacion exitosa tabla cuponera")
		//cb_limpiar.TriggerEvent(clicked!)
	else
		rollback;
		messageBox("Error","Error al modificar")
	end if
end if



end event

type cb_limpiar from commandbutton within w_anular_cuponera_mant
integer x = 2272
integer y = 1640
integer width = 247
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_parque
dw_base.reset()
sle_numero.text								= ''
//em_final.text									= ''
dw_lista_cupones.reset()
dw_base.setfocus()
end event

type cb_filtrar from commandbutton within w_anular_cuponera_mant
integer x = 2007
integer y = 1640
integer width = 247
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista_cupones.SETfilter(NULO)
dw_lista_cupones.filter()
end event

type cb_ordenar from commandbutton within w_anular_cuponera_mant
integer x = 1742
integer y = 1640
integer width = 247
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ordenar"
end type

event clicked;if dw_lista_cupones.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista_cupones.SETSORT(NULO)
	dw_lista_cupones.SORT()
end if
end event

type cb_exportar from commandbutton within w_anular_cuponera_mant
integer x = 1477
integer y = 1640
integer width = 247
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;//datawindow dw_lista_cupones
//dw_paso	= dw_lista_cupones
//if dw_lista_cupones.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_cerrar from commandbutton within w_anular_cuponera_mant
integer x = 3502
integer y = 1632
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_anular_cuponera_mant)
end event

type cb_buscar from commandbutton within w_anular_cuponera_mant
integer x = 1915
integer y = 72
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;String ls_base,ls_serie
Long ll_numero

ls_base									= dw_base.getitemstring(1,'base')
ls_serie									= dw_base.getitemstring(1,'serie')
ll_numero								= long(sle_numero.text)

dw_lista_cupones.retrieve(ls_base,ls_serie,ll_numero)



end event

type st_1 from statictext within w_anular_cuponera_mant
integer x = 1010
integer y = 88
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217750
string text = "Numero"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_anular_cuponera_mant
integer x = 1271
integer y = 76
integer width = 581
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string placeholder = "Numero"
end type

type dw_base from datawindow within w_anular_cuponera_mant
integer x = 73
integer y = 64
integer width = 891
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "dwe_base_serie"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_base

this.accepttext()
ls_columna				= dwo.name
if ls_columna='base' then	
	ls_base				= dw_base.getitemstring(1,'base')
	dw_base.getchild('serie',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ls_base)=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_base.accepttext()
end if
end event

type dw_lista_cupones from datawindow within w_anular_cuponera_mant
integer x = 37
integer y = 264
integer width = 3867
integer height = 1336
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_cupones_mant"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;il_mod_cupones++
end event

