forward
global type w_ingreso_fecha_lapida from window
end type
type cb_cerrar from commandbutton within w_ingreso_fecha_lapida
end type
type cb_grabar from commandbutton within w_ingreso_fecha_lapida
end type
type dw_ingreso from datawindow within w_ingreso_fecha_lapida
end type
end forward

global type w_ingreso_fecha_lapida from window
integer width = 1998
integer height = 1484
boolean titlebar = true
string title = "Fecha Instalación de Lápida"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_ingreso_fecha_lapida w_ingreso_fecha_lapida

type variables
Long	il_grabar
end variables

on w_ingreso_fecha_lapida.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_ingreso}
end on

on w_ingreso_fecha_lapida.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;String		ls_sector,ls_sepultura,ls_usuario
Long		ll_corr

gf_centrar(w_ingreso_fecha_lapida)
dw_ingreso.settransobject(sqlca)
ls_sector  		= substr(1,1,Message.StringParm)
ls_sepultura  	= substr(1,2,Message.StringParm)
ll_corr			= Long(substr(1,3,Message.StringParm))
if dw_ingreso.retrieve(ls_sector,ls_sepultura,ll_corr)=0 then
	messagebox("Advertencia","No registra Dato")
	close(w_ingreso_fecha_lapida)
else
	ls_usuario	= dw_ingreso.getitemstring(1,'usuario_instalada')
	if isnull(ls_usuario) then
		dw_ingreso.setitem(1,'usuario_instalada',gs_user)
		dw_ingreso.accepttext()
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingreso_fecha_lapida
integer x = 1655
integer y = 1244
integer width = 297
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Long		ll_res
if il_grabar > 0 then
	ll_res		= messagebox("Advertencia","Desea Grabar los Cambios realizados",Exclamation!,YesNo!,2)
	if ll_res=1 then
		cb_grabar.triggerevent(clicked!)
	else
		close(w_ingreso_fecha_lapida)
	end if
else
	close(w_ingreso_fecha_lapida)
end if
end event

type cb_grabar from commandbutton within w_ingreso_fecha_lapida
integer x = 23
integer y = 1244
integer width = 297
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String		ls_estado_instal
datetime	ldt_fecha_instal

dw_ingreso.accepttext()
ls_estado_instal		= dw_ingreso.getitemstring(dw_ingreso.getrow(),'estado_instalada')
ldt_fecha_instal			= dw_ingreso.getitemdatetime(dw_ingreso.getrow(),'fecha_instalada')
if isnull(ls_estado_instal) then
	messagebox("Advertencia","Debe Seleccionar Estado")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('estado_instalada')
elseif isnull(ldt_fecha_instal) then
	messagebox("Advertencia","Debe Ingresar Fecha de Instalación de Lápida")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_instalada')
else
	if dw_ingreso.update()=1 then
		commit;
		w_solicitud_grabacion_lapida.dw_lista.setitem(w_solicitud_grabacion_lapida.dw_lista.getrow(),'estado_instalada',ls_estado_instal)
		w_solicitud_grabacion_lapida.dw_lista.setitem(w_solicitud_grabacion_lapida.dw_lista.getrow(),'fecha_instalada',ldt_fecha_instal)
		w_solicitud_grabacion_lapida.dw_lista.setitem(w_solicitud_grabacion_lapida.dw_lista.getrow(),'usuario_instalada',gs_user)
		w_solicitud_grabacion_lapida.dw_lista.accepttext()
		messagebox("Grabar","Grabación Exitosa")
		close(w_ingreso_fecha_lapida)
	else
		rollback;
		messagebox("Error Grabar","Error al Graba SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type dw_ingreso from datawindow within w_ingreso_fecha_lapida
integer x = 32
integer y = 56
integer width = 1920
integer height = 1136
integer taborder = 10
string title = "none"
string dataobject = "dw_ingresar_fecha_instalacion_lapida"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_estado_instal
datetime	ldt_fecha_instal

this.accepttext()
il_grabar ++
if ls_columna='estado_instalada' or ls_columna='fecha_instalada' then
	ls_estado_instal		= this.getitemstring(this.getrow(),'estado_instalada')
	ldt_fecha_instal			= this.getitemdatetime(this.getrow(),'fecha_instalada')
	if not isnull(ls_estado_instal) and not isnull(ldt_fecha_instal) then
		dw_ingreso.setitem(dw_ingreso.getrow(),'usuario_instalada',gs_user)
		dw_ingreso.accepttext()
	end if
	if not isnull(ls_estado_instal) and isnull(ldt_fecha_instal) then
		dw_ingreso.setitem(dw_ingreso.getrow(),'fecha_instalada',date(gdt_fec_sistema))
		dw_ingreso.setitem(dw_ingreso.getrow(),'usuario_instalada',gs_user)
		dw_ingreso.accepttext()
	end if
end if
end event

event clicked;String		ls_columna,ls_fecha,ls_estado_instal
datetime	ldt_fecha_instal

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		if dw_ingreso.getitemnumber(dw_ingreso.getrow(),'rut_titular') > 0 then
			ls_fecha	= string(date(dw_ingreso.getitemdatetime(dw_ingreso.getrow(),'fecha_instalada')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso.setitem(dw_ingreso.getrow(),'fecha_instalada',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha					= trim(Message.StringParm)
				dw_ingreso.setitem(dw_ingreso.getrow(),'fecha_instalada',date(ls_fecha))
				ls_estado_instal		= this.getitemstring(this.getrow(),'estado_instalada')
				ldt_fecha_instal			= this.getitemdatetime(this.getrow(),'fecha_instalada')
				if not isnull(ls_estado_instal) and not isnull(ldt_fecha_instal) then
					dw_ingreso.setitem(dw_ingreso.getrow(),'usuario_instalada',gs_user)
					dw_ingreso.accepttext()
					il_grabar ++
				end if
			End if
		end if	
END CHOOSE
dw_ingreso.accepttext()
end event

