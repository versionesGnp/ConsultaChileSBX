forward
global type w_cd_anular_documento from window
end type
type cb_cerrar from commandbutton within w_cd_anular_documento
end type
type cb_grabar from commandbutton within w_cd_anular_documento
end type
type dw_anular from datawindow within w_cd_anular_documento
end type
end forward

global type w_cd_anular_documento from window
integer width = 2309
integer height = 1404
boolean titlebar = true
string title = "Anular Documento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_anular dw_anular
end type
global w_cd_anular_documento w_cd_anular_documento

type variables
String	is_base,is_serie,is_glosa
Long		il_estado,il_row
Double	il_numero
Datetime	idt_fec_sistema
end variables

on w_cd_anular_documento.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_anular=create dw_anular
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_anular}
end on

on w_cd_anular_documento.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_anular)
end on

event open;Long		ll_new
String	ls_fecha
gf_centrar(w_cd_anular_documento)
dw_anular.settransobject(sqlca)
is_base				= trim(substr(1,1,Message.StringParm))
is_serie				= trim(substr(1,2,Message.StringParm))
il_numero			= Double(trim(substr(1,3,Message.StringParm)))
ls_fecha				= trim(substr(1,4,Message.StringParm))
is_glosa				= trim(substr(1,5,Message.StringParm))
il_estado				= long(trim(substr(1,6,Message.StringParm)))
il_row					= long(trim(substr(1,7,Message.StringParm)))
ll_new				= dw_anular.insertrow(0)
dw_anular.scrolltorow(ll_new)
dw_anular.setitem(ll_new,'base',is_base)
dw_anular.setitem(ll_new,'serie',is_serie)
dw_anular.setitem(ll_new,'numero',il_numero)
dw_anular.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
dw_anular.setitem(ll_new,'fecha_estado',gdt_fec_sistema)
dw_anular.setitem(ll_new,'usuario_crea',gs_user)
dw_anular.setitem(ll_new,'estado',il_estado)
dw_anular.setitem(ll_new,'glosa',is_glosa)
dw_anular.setitem(ll_new,'memo','-')
dw_anular.setitem(ll_new,'referencia_memo','-')
dw_anular.accepttext()
dw_anular.setfocus()
end event

type cb_cerrar from commandbutton within w_cd_anular_documento
integer x = 1929
integer y = 1168
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_anular_documento)
end event

type cb_grabar from commandbutton within w_cd_anular_documento
integer x = 46
integer y = 1168
integer width = 302
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_glosa
dw_anular.accepttext()
if dw_anular.update()=1 then
	commit;
	if isvalid(w_cd_gestion_asignacion_agente) then
		ls_glosa		= dw_anular.getitemstring(1,'glosa')
		w_cd_gestion_asignacion_agente.dw_lista.setitem(il_row,'ult_estado',il_estado)
		w_cd_gestion_asignacion_agente.dw_lista.setitem(il_row,'ult_fecha_estado',gdt_fec_sistema)
		w_cd_gestion_asignacion_agente.dw_lista.setitem(il_row,'ult_glosa_estado',ls_glosa)
		w_cd_gestion_asignacion_agente.dw_lista.setitem(il_row,'ult_usuario_gestion',gs_user)
		w_cd_gestion_asignacion_agente.dw_lista.accepttext()
		if w_cd_gestion_asignacion_agente.dw_lista.update()=1 then
			commit;
			messagebox("Grabar Anulación","Anulación Exitosa")
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
		end if
	elseif isvalid(w_cd_gestion_folio) then
		ls_glosa		= dw_anular.getitemstring(1,'glosa')
		w_cd_gestion_folio.dw_lista.setitem(il_row,'ult_estado',il_estado)
		w_cd_gestion_folio.dw_lista.setitem(il_row,'ult_fecha_estado',gdt_fec_sistema)
		w_cd_gestion_folio.dw_lista.setitem(il_row,'ult_glosa_estado',ls_glosa)
		w_cd_gestion_folio.dw_lista.setitem(il_row,'ult_usuario_gestion',gs_user)
		w_cd_gestion_folio.dw_lista.accepttext()
		if w_cd_gestion_folio.dw_lista.update()=1 then
			commit;
			messagebox("Grabar Anulación","Anulación Exitosa")
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
		end if
	elseif isvalid(w_documentos_pendientes) then
		ls_glosa		= dw_anular.getitemstring(1,'glosa')
		w_documentos_pendientes.dw_lista.setitem(il_row,'ult_estado',il_estado)
		w_documentos_pendientes.dw_lista.setitem(il_row,'ult_fecha_estado',gdt_fec_sistema)
		w_documentos_pendientes.dw_lista.setitem(il_row,'ult_glosa_estado',ls_glosa)
		w_documentos_pendientes.dw_lista.setitem(il_row,'ult_usuario_gestion',gs_user)
		w_documentos_pendientes.dw_lista.accepttext()
		if w_documentos_pendientes.dw_lista.update()=1 then
			commit;
			messagebox("Grabar Anulación","Anulación Exitosa")
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
		end if
	end if
	if isvalid(w_cd_ingresar_control_documentacion) then close(w_cd_ingresar_control_documentacion)
else
	rollback;
	messagebox("Error Grabar","Error Grabar Anulación SQL: "+sqlca.sqlerrtext)
end if
end event

type dw_anular from datawindow within w_cd_anular_documento
integer x = 46
integer y = 28
integer width = 2217
integer height = 1120
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_anular_documento"
boolean border = false
boolean livescroll = true
end type

