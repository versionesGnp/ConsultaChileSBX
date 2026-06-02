forward
global type w_lista_documentos_rechazados_pendientes from window
end type
type cb_grabar from commandbutton within w_lista_documentos_rechazados_pendientes
end type
type cb_imprimir from commandbutton within w_lista_documentos_rechazados_pendientes
end type
type cb_cerrar from commandbutton within w_lista_documentos_rechazados_pendientes
end type
type dw_lista from datawindow within w_lista_documentos_rechazados_pendientes
end type
end forward

global type w_lista_documentos_rechazados_pendientes from window
integer width = 3296
integer height = 1664
boolean titlebar = true
string title = "Lista Documentos Rechazados ~"Pendientes~""
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_grabar cb_grabar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_lista_documentos_rechazados_pendientes w_lista_documentos_rechazados_pendientes

on w_lista_documentos_rechazados_pendientes.create
this.cb_grabar=create cb_grabar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_grabar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_lista_documentos_rechazados_pendientes.destroy
destroy(this.cb_grabar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String		ls_base,ls_serie
Double	ll_numero
gf_centrar(w_lista_documentos_rechazados_pendientes)
if gs_depto='V' or gs_depto='I' or gs_depto='E' then
	cb_grabar.enabled	= true
	cb_grabar.visible	= true
else
	cb_grabar.enabled	= false
	cb_grabar.visible	= false
end if
dw_lista.settransobject(sqlca)
ls_base		= trim(substr(1,1,Message.StringParm))
ls_serie		= trim(substr(1,2,Message.StringParm))
ll_numero	= Double(substr(1,3,Message.StringParm))
if dw_lista.retrieve(ls_base,ls_serie,ll_numero,gs_depto)=0 then
	messagebox("Advertencia","No Registra Datos")
	cb_cerrar.triggerevent(clicked!)
else
	dw_lista.object.t_titulo.text	= 'Documentos Rechazados en Estado P-Pendiente~rContrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,##0")
end if


end event

type cb_grabar from commandbutton within w_lista_documentos_rechazados_pendientes
integer x = 1458
integer y = 1424
integer width = 347
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
else
	rollback;
	messagebox("Error al Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_imprimir from commandbutton within w_lista_documentos_rechazados_pendientes
integer x = 37
integer y = 1424
integer width = 347
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then f_Print( dw_lista )
end event

type cb_cerrar from commandbutton within w_lista_documentos_rechazados_pendientes
integer x = 2885
integer y = 1424
integer width = 347
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_documentos_rechazados_pendientes)
end event

type dw_lista from datawindow within w_lista_documentos_rechazados_pendientes
integer x = 37
integer y = 40
integer width = 3195
integer height = 1340
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_rechazos_pendientes"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro
ls_columna	= dwo.name
if ls_columna='t_pendientes' then
	ls_filtro	= 'cd_folio_detalle_rechazo_estado="P"'
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_recepcionados' then
	ls_filtro	= 'cd_folio_detalle_rechazo_estado="R"'
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
elseif ls_columna='t_todos' then
	ls_filtro	= ''
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
end if
if dw_lista.rowcount()=0 then messagebox("Advertencia","No Registra Dato")
end event

