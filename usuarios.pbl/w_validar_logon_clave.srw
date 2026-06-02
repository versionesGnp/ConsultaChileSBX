forward
global type w_validar_logon_clave from window
end type
type cb_retrieve from commandbutton within w_validar_logon_clave
end type
type cb_grabar from commandbutton within w_validar_logon_clave
end type
type cb_cerrar from commandbutton within w_validar_logon_clave
end type
type dw_validar from datawindow within w_validar_logon_clave
end type
end forward

global type w_validar_logon_clave from window
integer width = 3579
integer height = 1396
boolean titlebar = true
string title = "Validación Logon / Clave de Acceso"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_retrieve cb_retrieve
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_validar dw_validar
end type
global w_validar_logon_clave w_validar_logon_clave

event open;gf_centrar(w_validar_logon_clave)
dw_validar.settransobject(sqlca)
dw_validar.retrieve()
if gs_depto='I' then
	dw_validar.enabled	= true
	cb_grabar.enabled		= true
else
	dw_validar.enabled	= false
	cb_grabar.enabled		= false
end if
end event

on w_validar_logon_clave.create
this.cb_retrieve=create cb_retrieve
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_validar=create dw_validar
this.Control[]={this.cb_retrieve,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_validar}
end on

on w_validar_logon_clave.destroy
destroy(this.cb_retrieve)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_validar)
end on

type cb_retrieve from commandbutton within w_validar_logon_clave
integer x = 1490
integer y = 1168
integer width = 603
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Restablecer Registro"
end type

event clicked;dw_validar.retrieve()
end event

type cb_grabar from commandbutton within w_validar_logon_clave
integer x = 37
integer y = 1168
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_veces_logon, ll_dias_aviso_expirar,ll_largo_usuario,ll_largo_clave,ll_dias_fecha_expirar,ll_veces_no_coincidir_clave

ll_veces_logon						= dw_validar.getitemnumber(1,'veces_logon')
ll_dias_aviso_expirar				= dw_validar.getitemnumber(1,'dias_aviso_expirar')
ll_largo_usuario					= dw_validar.getitemnumber(1,'largo_usuario')
ll_largo_clave						= dw_validar.getitemnumber(1,'largo_clave')
ll_dias_fecha_expirar				= dw_validar.getitemnumber(1,'dias_fecha_expirar')
ll_veces_no_coincidir_clave		= dw_validar.getitemnumber(1,'veces_no_coincidir_clave')
if ll_veces_logon=0 or isnull(ll_veces_logon) then
	messagebox("Advertencia","Debe Indicar Cantidad de Veces el Ingreso de Usuario al Sistema")
	dw_validar.setcolumn('veces_logon')
elseif ll_dias_aviso_expirar=0 or isnull(ll_dias_aviso_expirar) then
	messagebox("Advertencia","Debe Indicar Cantidad de dias para dar Inicio el Aviso de Expiración de Clave")
	dw_validar.setcolumn('dias_aviso_expirar')
elseif ll_largo_usuario=0 or isnull(ll_largo_usuario) or ll_largo_clave=0 or isnull(ll_largo_clave) then
	messagebox("Advertencia","Comunicarse Departamento Informática")
	dw_validar.Setfocus()
elseif ll_dias_fecha_expirar=0 or isnull(ll_dias_fecha_expirar) then
	messagebox("Advertencia","Debe Indicar Cantidad de dias a Expiración Clave al Instante de Actualizar")
	dw_validar.setcolumn('dias_fecha_expirar')
elseif ll_veces_no_coincidir_clave=0 or isnull(ll_veces_no_coincidir_clave) then
	messagebox("Advertencia","Debe Indicar Cantidad de Veces que No debe Coincidir con las Ultimas Claves Actualizadas")
	dw_validar.setcolumn('veces_no_coincidir_clave')
else
	if dw_validar.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Validación SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_validar_logon_clave
integer x = 3227
integer y = 1168
integer width = 306
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

event clicked;close(w_validar_logon_clave)
end event

type dw_validar from datawindow within w_validar_logon_clave
integer x = 32
integer y = 32
integer width = 3525
integer height = 1092
integer taborder = 10
string title = "none"
string dataobject = "dw_validar_logon_clave"
boolean border = false
boolean livescroll = true
end type

