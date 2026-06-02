forward
global type w_modifica_usuario from window
end type
type cb_guardar from commandbutton within w_modifica_usuario
end type
type cb_cerrar from commandbutton within w_modifica_usuario
end type
type st_1 from statictext within w_modifica_usuario
end type
type dw_modificar from datawindow within w_modifica_usuario
end type
end forward

global type w_modifica_usuario from window
integer width = 1897
integer height = 944
boolean titlebar = true
string title = "Modificar Datos Usuario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_guardar cb_guardar
cb_cerrar cb_cerrar
st_1 st_1
dw_modificar dw_modificar
end type
global w_modifica_usuario w_modifica_usuario

on w_modifica_usuario.create
this.cb_guardar=create cb_guardar
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.dw_modificar=create dw_modificar
this.Control[]={this.cb_guardar,&
this.cb_cerrar,&
this.st_1,&
this.dw_modificar}
end on

on w_modifica_usuario.destroy
destroy(this.cb_guardar)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.dw_modificar)
end on

event open;long		ll_new
datetime ldt_fecha_hoy

gf_centrar(w_modifica_usuario)
dw_modificar.settransobject(sqlca)
ll_new					= dw_modificar.insertrow(0)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
dw_modificar.setitem(ll_new,'fecha_expiracion',ldt_fecha_hoy)
end event

type cb_guardar from commandbutton within w_modifica_usuario
integer x = 64
integer y = 656
integer width = 315
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;long ret
ret	= MessageBox('Actualizar', "Desea Grabar Usuario", Question!, YesNo!, 2)
IF ret = 1 THEN
	if dw_modificar.update()=1 then
		commit;
		w_lista_usuario.dw_lista.reset()
		w_lista_usuario.dw_lista.retrieve()
		messagebox("Grabar","Grabación Exitosa")
		close(w_modifica_usuario)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
	end if
end if

end event

type cb_cerrar from commandbutton within w_modifica_usuario
integer x = 1463
integer y = 656
integer width = 315
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_modifica_usuario)
end event

type st_1 from statictext within w_modifica_usuario
integer x = 78
integer y = 48
integer width = 855
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Modificar Datos Usuario"
boolean focusrectangle = false
end type

type dw_modificar from datawindow within w_modifica_usuario
integer x = 55
integer y = 168
integer width = 1746
integer height = 420
integer taborder = 10
string title = "none"
string dataobject = "dw_modifica_usuario"
boolean border = false
boolean livescroll = true
end type

event clicked;String	ls_estado,ls_columna,ls_fecha
Datetime	ldt_fecha_fall
ls_columna	= dwo.name
if ls_columna = 'p_1' then
 		ls_fecha	= string(date(dw_modificar.getitemdatetime(dw_modificar.getrow(),'fecha_termino')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_modificar.setitem(dw_modificar.getrow(),'fecha_termino',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_modificar.setitem(dw_modificar.getrow(),'fecha_termino',date(ls_fecha))
		END IF
	end if
	
if ls_columna = 'p_2' then
 		ls_fecha	= string(date(dw_modificar.getitemdatetime(dw_modificar.getrow(),'fecha_expiracion')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_modificar.setitem(dw_modificar.getrow(),'fecha_expiracion',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_modificar.setitem(dw_modificar.getrow(),'fecha_expiracion',date(ls_fecha))
		END IF
	end if
end event

