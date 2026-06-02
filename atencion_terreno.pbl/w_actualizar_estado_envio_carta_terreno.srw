forward
global type w_actualizar_estado_envio_carta_terreno from window
end type
type cb_1 from commandbutton within w_actualizar_estado_envio_carta_terreno
end type
type dw_lista from datawindow within w_actualizar_estado_envio_carta_terreno
end type
type cb_grabar from commandbutton within w_actualizar_estado_envio_carta_terreno
end type
type cb_cerrar from commandbutton within w_actualizar_estado_envio_carta_terreno
end type
type dw_carta from datawindow within w_actualizar_estado_envio_carta_terreno
end type
type gb_2 from groupbox within w_actualizar_estado_envio_carta_terreno
end type
end forward

global type w_actualizar_estado_envio_carta_terreno from window
integer width = 2121
integer height = 1712
boolean titlebar = true
string title = "Actualizar Estado Envio Carta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
dw_lista dw_lista
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_carta dw_carta
gb_2 gb_2
end type
global w_actualizar_estado_envio_carta_terreno w_actualizar_estado_envio_carta_terreno

type variables
String		is_base,is_serie
Long		il_rut
Double	il_numero
end variables

event open;Datetime	ld_fecha
String		ls_base,ls_serie,ls_cod_envio
Long		ll_cod_accion,ll_correlativo,ll_indi
Double	ll_numero



gf_centrar(w_actualizar_estado_envio_carta_terreno)
dw_carta.settransobject(sqlca)
dw_lista.settransobject(sqlca)
//is_base				= substr(1,1,Message.StringParm)
//is_serie				= substr(1,2,Message.StringParm)
//il_numero			= double(substr(1,3,Message.StringParm))

//dw_ctto.SetTransObject(SQLCA)
//dw_ctto.getchild('serie',idw_detalle)
//idw_detalle.settransobject(sqlca)
//if idw_detalle.rowcount()=0 then
//	idw_detalle.insertrow(0)
//end if
//dw_ctto.insertrow(0)
dw_carta.insertrow(0)
//dw_carta.enabled	= false
//rb_rut.checked		= true
//em_rut.text			= ''
//dw_ctto.enabled	= false
//em_rut.enabled		= true
//

Setnull(il_rut);setnull(is_base);setnull(is_serie);setnull(il_numero)

is_base		= gs_base
is_serie		= gs_serie
il_numero	= gi_numero


//is_base					= w_ingreso_gestion_ejecutivo_terreno.dw_lista.getitemstring(ll_indi,'at_gestion_base')
//is_serie					= w_ingreso_gestion_ejecutivo_terreno.dw_lista.getitemstring(ll_indi,'at_gestion_serie')
//il_numero				= w_ingreso_gestion_ejecutivo_terreno.dw_lista.getitemnumber(ll_indi,'at_gestion_numero')
//	is_base						= dw_ctto.getitemstring(1,'base')
//	is_serie						= dw_ctto.getitemstring(1,'serie')
//	il_numero					= dw_ctto.getitemnumber(1,'numero')
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
//				dw_ctto.reset()
//				dw_ctto.getchild('serie',idw_detalle)
//				idw_detalle.settransobject(sqlca)
//				if idw_detalle.rowcount()=0 then
//					idw_detalle.insertrow(0)
//				end if
//				dw_ctto.insertrow(0)
//				dw_ctto.setfocus()
			end if
			dw_carta.enabled	= true
			dw_carta.setfocus()			
		end if
	else
		if not isnull(is_base) and not isnull(is_serie) and not isnull(il_numero) and il_numero<>0  then
			messagebox("Advertencia","Debe Ingresar Contrato Válido")
//			dw_ctto.setfocus()
		end if
	end if
//end if
end event

on w_actualizar_estado_envio_carta_terreno.create
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_carta=create dw_carta
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.dw_lista,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_carta,&
this.gb_2}
end on

on w_actualizar_estado_envio_carta_terreno.destroy
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_carta)
destroy(this.gb_2)
end on

type cb_1 from commandbutton within w_actualizar_estado_envio_carta_terreno
boolean visible = false
integer x = 914
integer y = 1500
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

event clicked;//dw_lista.reset()
//dw_carta.reset()
////dw_ctto.reset()
////dw_ctto.getchild('serie',idw_detalle)
////idw_detalle.settransobject(sqlca)
////if idw_detalle.rowcount()=0 then
////	idw_detalle.insertrow(0)
////end if
////dw_ctto.insertrow(0)
//dw_carta.insertrow(0)
//dw_carta.enabled		= false
////rb_rut.checked		= true
////em_rut.text				= ''
////if rb_rut.checked=true then
////	dw_ctto.enabled	= false
////	em_rut.enabled		= true
////	em_rut.setfocus()
////else
////	dw_ctto.enabled	= true
////	em_rut.enabled		= false
////	dw_ctto.setfocus()
////end if
end event

type dw_lista from datawindow within w_actualizar_estado_envio_carta_terreno
integer x = 73
integer y = 104
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

type cb_grabar from commandbutton within w_actualizar_estado_envio_carta_terreno
integer x = 32
integer y = 1500
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
//		if rb_rut.checked=true then
//			rb_rut.checked			= true
//			rb_rut.triggerevent(clicked!)
//		else 
//			rb_contrato.checked	= true
//			rb_contrato.triggerevent(clicked!)
////		end if
	else
		rollback;
		messagebox("Error Grabar","Error SQL "+sqlca.sqlerrtext)
	end if
//	w_generar_filtro_at_terreno.tab_cobranza.tabpage_2.cb_cerrar_2.triggerEvent(Clicked!)

	cb_cerrar.triggerEvent(Clicked!)
end if
end event

type cb_cerrar from commandbutton within w_actualizar_estado_envio_carta_terreno
integer x = 1792
integer y = 1500
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

event clicked;close(w_actualizar_estado_envio_carta_terreno)
end event

type dw_carta from datawindow within w_actualizar_estado_envio_carta_terreno
integer x = 18
integer y = 876
integer width = 2062
integer height = 580
integer taborder = 50
string title = "none"
string dataobject = "dw_actualizar_carta_log_por_contrato"
boolean border = false
end type

type gb_2 from groupbox within w_actualizar_estado_envio_carta_terreno
integer x = 32
integer y = 28
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

