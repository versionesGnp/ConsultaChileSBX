forward
global type w_mantencion_tasas from window
end type
type cb_grabar from commandbutton within w_mantencion_tasas
end type
type cb_cerrar from commandbutton within w_mantencion_tasas
end type
type dw_mant from datawindow within w_mantencion_tasas
end type
end forward

global type w_mantencion_tasas from window
integer width = 1536
integer height = 1320
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_mant dw_mant
end type
global w_mantencion_tasas w_mantencion_tasas

event open;this.title	= 'Mantendor Tasa Interes '+gs_conexion
gf_centrar(w_mantencion_tasas)
dw_mant.settransobject(sqlca)
if dw_mant.retrieve(gs_depto)=0 then
	messagebox("Advertencia","No Registra Datos Tabla TASA")
	close(w_mantencion_tasas)
else
	if gs_depto<>'I' then
		cb_grabar.enabled	= false
		cb_cerrar.setfocus()
	else
		cb_grabar.enabled	= true
		dw_mant.setfocus()
	end if
end if
end event

on w_mantencion_tasas.create
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_mant=create dw_mant
this.Control[]={this.cb_grabar,&
this.cb_cerrar,&
this.dw_mant}
end on

on w_mantencion_tasas.destroy
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_mant)
end on

type cb_grabar from commandbutton within w_mantencion_tasas
integer x = 50
integer y = 1088
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

event clicked;if dw_mant.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
else
	rollback;
	messagebox("Error Grabar","Error al Grabar Tabla TASA, SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_cerrar from commandbutton within w_mantencion_tasas
integer x = 1170
integer y = 1088
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

event clicked;close(w_mantencion_tasas)
end event

type dw_mant from datawindow within w_mantencion_tasas
integer x = 50
integer y = 56
integer width = 1449
integer height = 1012
integer taborder = 10
string title = "none"
string dataobject = "dw_mantencion_tabla_tasas"
boolean border = false
end type

