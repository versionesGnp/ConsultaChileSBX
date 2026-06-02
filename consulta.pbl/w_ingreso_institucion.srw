forward
global type w_ingreso_institucion from window
end type
type cb_grabar from commandbutton within w_ingreso_institucion
end type
type dw_1 from datawindow within w_ingreso_institucion
end type
type cb_2 from commandbutton within w_ingreso_institucion
end type
end forward

global type w_ingreso_institucion from window
integer x = 832
integer y = 360
integer width = 1746
integer height = 1116
boolean titlebar = true
string title = "Datos Institución"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_grabar cb_grabar
dw_1 dw_1
cb_2 cb_2
end type
global w_ingreso_institucion w_ingreso_institucion

on w_ingreso_institucion.create
this.cb_grabar=create cb_grabar
this.dw_1=create dw_1
this.cb_2=create cb_2
this.Control[]={this.cb_grabar,&
this.dw_1,&
this.cb_2}
end on

on w_ingreso_institucion.destroy
destroy(this.cb_grabar)
destroy(this.dw_1)
destroy(this.cb_2)
end on

event open;Long		ll_rut_institucional,ll_new
String	ls_dv
gf_centrar(w_ingreso_institucion)
dw_1.settransobject (sqlca)
ll_rut_institucional	= long(substr(1,1,Message.StringParm))
ls_dv						= substr(1,2,Message.StringParm)
if dw_1.retrieve(ll_rut_institucional)=0 then
	ll_new	= dw_1.insertrow(0)
	dw_1.scrolltorow(ll_new)
	dw_1.setitem(ll_new,'rut',ll_rut_institucional)
	dw_1.setitem(ll_new,'compute_0011',ls_dv)
	dw_1.accepttext()
end if
end event

type cb_grabar from commandbutton within w_ingreso_institucion
integer x = 50
integer y = 888
integer width = 270
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if isnull(trim(dw_1.getitemstring(1,'nombre'))) then
	messagebox("Advertencia","Debe Ingresar Nombre")
	dw_1.setfocus()
	dw_1.setcolumn('nombre')
elseif isnull(trim(dw_1.getitemstring(1,'direccion'))) then
	messagebox("Advertencia","Debe Ingresar Dirección")
	dw_1.setfocus()
	dw_1.setcolumn('direccion')
else
	if dw_1.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		close(w_ingreso_institucion)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type dw_1 from datawindow within w_ingreso_institucion
integer x = 32
integer y = 44
integer width = 1646
integer height = 800
integer taborder = 10
string dataobject = "dw_institucional"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_ingreso_institucion
integer x = 1408
integer y = 888
integer width = 270
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;CLOSE(w_ingreso_institucion)
end event

