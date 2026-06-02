forward
global type w_actualizar_estado_envio_carta from window
end type
type cb_1 from commandbutton within w_actualizar_estado_envio_carta
end type
type dw_lista from datawindow within w_actualizar_estado_envio_carta
end type
type cb_buscar from commandbutton within w_actualizar_estado_envio_carta
end type
type cb_grabar from commandbutton within w_actualizar_estado_envio_carta
end type
type rb_contrato from radiobutton within w_actualizar_estado_envio_carta
end type
type em_rut from editmask within w_actualizar_estado_envio_carta
end type
type st_1 from statictext within w_actualizar_estado_envio_carta
end type
type rb_rut from radiobutton within w_actualizar_estado_envio_carta
end type
type cb_cerrar from commandbutton within w_actualizar_estado_envio_carta
end type
type dw_carta from datawindow within w_actualizar_estado_envio_carta
end type
type dw_ctto from datawindow within w_actualizar_estado_envio_carta
end type
type gb_1 from groupbox within w_actualizar_estado_envio_carta
end type
type gb_2 from groupbox within w_actualizar_estado_envio_carta
end type
end forward

global type w_actualizar_estado_envio_carta from window
integer width = 2121
integer height = 2004
boolean titlebar = true
string title = "Actualizar Estado Envio Carta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
dw_lista dw_lista
cb_buscar cb_buscar
cb_grabar cb_grabar
rb_contrato rb_contrato
em_rut em_rut
st_1 st_1
rb_rut rb_rut
cb_cerrar cb_cerrar
dw_carta dw_carta
dw_ctto dw_ctto
gb_1 gb_1
gb_2 gb_2
end type
global w_actualizar_estado_envio_carta w_actualizar_estado_envio_carta

type variables
String		is_base,is_serie
Long		il_rut
Double	il_numero
end variables

event open;gf_centrar(w_actualizar_estado_envio_carta)
dw_carta.settransobject(sqlca)
dw_lista.settransobject(sqlca)
dw_ctto.SetTransObject(SQLCA)
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_ctto.insertrow(0)
dw_carta.insertrow(0)
dw_carta.enabled	= false
rb_rut.checked		= true
em_rut.text			= ''
dw_ctto.enabled	= false
em_rut.enabled		= true
end event

on w_actualizar_estado_envio_carta.create
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.cb_buscar=create cb_buscar
this.cb_grabar=create cb_grabar
this.rb_contrato=create rb_contrato
this.em_rut=create em_rut
this.st_1=create st_1
this.rb_rut=create rb_rut
this.cb_cerrar=create cb_cerrar
this.dw_carta=create dw_carta
this.dw_ctto=create dw_ctto
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.dw_lista,&
this.cb_buscar,&
this.cb_grabar,&
this.rb_contrato,&
this.em_rut,&
this.st_1,&
this.rb_rut,&
this.cb_cerrar,&
this.dw_carta,&
this.dw_ctto,&
this.gb_1,&
this.gb_2}
end on

on w_actualizar_estado_envio_carta.destroy
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.cb_buscar)
destroy(this.cb_grabar)
destroy(this.rb_contrato)
destroy(this.em_rut)
destroy(this.st_1)
destroy(this.rb_rut)
destroy(this.cb_cerrar)
destroy(this.dw_carta)
destroy(this.dw_ctto)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_1 from commandbutton within w_actualizar_estado_envio_carta
integer x = 914
integer y = 1784
integer width = 270
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
dw_carta.reset()
dw_ctto.reset()
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_ctto.insertrow(0)
dw_carta.insertrow(0)
dw_carta.enabled		= false
//rb_rut.checked		= true
em_rut.text				= ''
if rb_rut.checked=true then
	dw_ctto.enabled	= false
	em_rut.enabled		= true
	em_rut.setfocus()
else
	dw_ctto.enabled	= true
	em_rut.enabled		= false
	dw_ctto.setfocus()
end if
end event

type dw_lista from datawindow within w_actualizar_estado_envio_carta
integer x = 73
integer y = 388
integer width = 1947
integer height = 716
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_por_cliente_carta_log"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Datetime	ld_fecha
String		ls_base,ls_serie,ls_cod_envio
Long		ll_cod_accion,ll_correlativo
Double	ll_numero
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ld_fecha			= dw_lista.getitemdatetime(row,'fecha_carta')
	ls_base			= dw_lista.getitemstring(row,'base')
	ls_serie			= dw_lista.getitemstring(row,'serie')
	ll_numero		= dw_lista.getitemnumber(row,'numero')
	ls_cod_envio	= dw_lista.getitemstring(row,'cod_envio')
	ll_cod_accion	= dw_lista.getitemnumber(row,'cod_accion')
	ll_correlativo	= dw_lista.getitemnumber(row,'correlativo')
	if dw_carta.retrieve(ls_base,ls_serie,ll_numero,ld_fecha,ls_cod_envio,ll_cod_accion,ll_correlativo)=0 then
		dw_carta.enabled	= false
		messagebox("Advertencia","No Registra Información")
	end if
end if
end event

event rowfocuschanged;Datetime	ld_fecha
String		ls_base,ls_serie,ls_cod_envio
Long		ll_cod_accion,ll_correlativo
Double	ll_numero
if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	ld_fecha			= dw_lista.getitemdatetime(getrow(),'fecha_carta')
	ls_base			= dw_lista.getitemstring(getrow(),'base')
	ls_serie			= dw_lista.getitemstring(getrow(),'serie')
	ll_numero		= dw_lista.getitemnumber(getrow(),'numero')
	ls_cod_envio	= dw_lista.getitemstring(getrow(),'cod_envio')
	ll_cod_accion	= dw_lista.getitemnumber(getrow(),'cod_accion')
	ll_correlativo	= dw_lista.getitemnumber(getrow(),'correlativo')
	if dw_carta.retrieve(ls_base,ls_serie,ll_numero,ld_fecha,ls_cod_envio,ll_cod_accion,ll_correlativo)=0 then
		dw_carta.enabled	= false
		messagebox("Advertencia","No Registra Información")
	end if
end if
end event

type cb_buscar from commandbutton within w_actualizar_estado_envio_carta
integer x = 1646
integer y = 76
integer width = 375
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;Datetime	ld_fecha
String		ls_base,ls_serie,ls_cod_envio
Long		ll_cod_accion,ll_correlativo
Double	ll_numero
Setnull(il_rut);setnull(is_base);setnull(is_serie);setnull(il_numero)
if rb_rut.checked = true then
	il_rut					= long(trim(em_rut.text))
	if il_rut>0 and not isnull(il_rut) then
		if dw_lista.retrieve(is_base,is_serie,il_numero,il_rut)>0 then
			dw_lista.scrolltorow(1)
			ld_fecha			= dw_lista.getitemdatetime(1,'fecha_carta')
			ls_base			= dw_lista.getitemstring(1,'base')
			ls_serie			= dw_lista.getitemstring(1,'serie')
			ll_numero		= dw_lista.getitemnumber(1,'numero')
			ls_cod_envio	= dw_lista.getitemstring(1,'cod_envio')
			ll_cod_accion	= dw_lista.getitemnumber(1,'cod_accion')
			ll_correlativo	= dw_lista.getitemnumber(1,'correlativo')
			if dw_carta.retrieve(ls_base,ls_serie,ll_numero,ld_fecha,ls_cod_envio,ll_cod_accion,ll_correlativo)=0 then
				dw_carta.insertrow(0)
				dw_carta.enabled	= false
				messagebox("Advertencia","No Existe Información con Rut: "+string(il_rut,"###,###,###"))
				em_rut.text			= ''
				em_rut.setfocus()
			end if
			dw_carta.enabled	= true
			dw_carta.setfocus()
		else
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		if not isnull(il_rut) and il_rut<>0 then
			messagebox("Advertencia","Debe Ingresar Rut Válido")
			em_rut.setfocus()
		end if
	end if
elseif rb_contrato.checked = true then
	is_base						= dw_ctto.getitemstring(1,'base')
	is_serie						= dw_ctto.getitemstring(1,'serie')
	il_numero					= dw_ctto.getitemnumber(1,'numero')
	if not isnull(is_base) and not isnull(is_serie) and il_numero>0 then
		if dw_lista.retrieve(is_base,is_serie,il_numero,il_rut)>0 then
			dw_lista.scrolltorow(1)
			ld_fecha			= dw_lista.getitemdatetime(1,'fecha_carta')
			ls_base			= dw_lista.getitemstring(1,'base')
			ls_serie			= dw_lista.getitemstring(1,'serie')
			ll_numero		= dw_lista.getitemnumber(1,'numero')
			ls_cod_envio	= dw_lista.getitemstring(1,'cod_envio')
			ll_cod_accion	= dw_lista.getitemnumber(1,'cod_accion')
			ll_correlativo	= dw_lista.getitemnumber(1,'correlativo')
			if dw_carta.retrieve(ls_base,ls_serie,ll_numero,ld_fecha,ls_cod_envio,ll_cod_accion,ll_correlativo)=0 then
				dw_carta.insertrow(0)
				dw_carta.enabled	= false
				messagebox("Advertencia","No Existe Información con Nº Contrato: "+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###"))
				dw_ctto.reset()
				dw_ctto.getchild('serie',idw_detalle)
				idw_detalle.settransobject(sqlca)
				if idw_detalle.rowcount()=0 then
					idw_detalle.insertrow(0)
				end if
				dw_ctto.insertrow(0)
				dw_ctto.setfocus()
			end if
			dw_carta.enabled	= true
			dw_carta.setfocus()			
		end if
	else
		if not isnull(is_base) and not isnull(is_serie) and not isnull(il_numero) and il_numero<>0  then
			messagebox("Advertencia","Debe Ingresar Contrato Válido")
			dw_ctto.setfocus()
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_actualizar_estado_envio_carta
integer x = 32
integer y = 1784
integer width = 270
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_carta.getitemnumber(1,'rut')>0 then
	if dw_carta.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		dw_lista.reset()
		dw_carta.reset()
		dw_carta.insertrow(0)
		dw_carta.enabled			= false
		if rb_rut.checked=true then
			rb_rut.checked			= true
			rb_rut.triggerevent(clicked!)
		else 
			rb_contrato.checked	= true
			rb_contrato.triggerevent(clicked!)
		end if
	else
		rollback;
		messagebox("Error Grabar","Error SQL "+sqlca.sqlerrtext)
	end if
end if
end event

type rb_contrato from radiobutton within w_actualizar_estado_envio_carta
integer x = 741
integer y = 80
integer width = 411
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Contrato"
end type

event clicked;dw_ctto.reset() //SetTransObject(SQLCA)
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_ctto.insertrow(0)
em_rut.text			= ''
em_rut.enabled		= false
dw_ctto.enabled	= true
dw_carta.reset()
dw_carta.insertrow(0)
dw_carta.enabled	= false
dw_ctto.setfocus()

end event

type em_rut from editmask within w_actualizar_estado_envio_carta
integer x = 174
integer y = 180
integer width = 347
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;setnull(il_rut)
il_rut	= long(this.text)
dw_lista.reset()
if il_rut>0 and not isnull(il_rut) then
	cb_buscar.triggerevent(clicked!)
else
	if not isnull(il_rut) and il_rut<>0 then
		messagebox("Advertencia","Rut Inválido")
		em_rut.setfocus()
	end if
end if
end event

type st_1 from statictext within w_actualizar_estado_envio_carta
integer x = 64
integer y = 196
integer width = 110
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut:"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_rut from radiobutton within w_actualizar_estado_envio_carta
integer x = 78
integer y = 84
integer width = 402
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Por Rut"
end type

event clicked;dw_ctto.reset()
dw_ctto.SetTransObject(SQLCA)
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_ctto.insertrow(0)
dw_ctto.enabled	= false
em_rut.text			= ''
em_rut.enabled		= true
dw_carta.reset()
dw_carta.insertrow(0)
dw_carta.enabled	= false
dw_lista.reset()
em_rut.setfocus()

end event

type cb_cerrar from commandbutton within w_actualizar_estado_envio_carta
integer x = 1792
integer y = 1784
integer width = 270
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualizar_estado_envio_carta)
end event

type dw_carta from datawindow within w_actualizar_estado_envio_carta
integer x = 18
integer y = 1160
integer width = 2062
integer height = 580
integer taborder = 50
string title = "none"
string dataobject = "dw_actualizar_carta_log_por_contrato"
boolean border = false
end type

type dw_ctto from datawindow within w_actualizar_estado_envio_carta
integer x = 741
integer y = 176
integer width = 1289
integer height = 108
integer taborder = 20
string title = "none"
string dataobject = "dwe_ingresar_base_serie_nro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna

ls_columna	= dwo.name
this.accepttext()
dw_lista.reset()
is_base		= dw_ctto.getitemstring(1,'base')
is_serie		= dw_ctto.getitemstring(1,'serie')
il_numero	= dw_ctto.getitemnumber(1,'numero')
if ls_columna='base' then
	is_base	= this.getitemstring(1,'base')
	dw_ctto.getchild('serie',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(is_base)
end if
if not isnull(is_base) and not isnull(is_serie) and il_numero>0 then
	cb_buscar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_actualizar_estado_envio_carta
integer x = 32
integer y = 16
integer width = 2030
integer height = 284
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opción de Busqueda"
end type

type gb_2 from groupbox within w_actualizar_estado_envio_carta
integer x = 32
integer y = 312
integer width = 2030
integer height = 832
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Envio Carta"
end type

