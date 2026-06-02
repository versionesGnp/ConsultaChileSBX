forward
global type w_ingreso_funeraria from window
end type
type cb_grabar from commandbutton within w_ingreso_funeraria
end type
type dw_1 from datawindow within w_ingreso_funeraria
end type
type cb_2 from commandbutton within w_ingreso_funeraria
end type
end forward

global type w_ingreso_funeraria from window
integer x = 832
integer y = 360
integer width = 1742
integer height = 1116
boolean titlebar = true
string title = "Datos Funeraria"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_grabar cb_grabar
dw_1 dw_1
cb_2 cb_2
end type
global w_ingreso_funeraria w_ingreso_funeraria

on w_ingreso_funeraria.create
this.cb_grabar=create cb_grabar
this.dw_1=create dw_1
this.cb_2=create cb_2
this.Control[]={this.cb_grabar,&
this.dw_1,&
this.cb_2}
end on

on w_ingreso_funeraria.destroy
destroy(this.cb_grabar)
destroy(this.dw_1)
destroy(this.cb_2)
end on

event open;string 	ls_dv
Long		ll_new,rut

gf_centrar(w_ingreso_funeraria)
dw_1.settransobject (sqlca)
rut 				= long(trim(substr(1,1,Message.StringParm)))
ls_dv				= trim(substr(1,2,Message.StringParm))
if long(rut)>0 then
	if dw_1.retrieve(rut)=0 then
		ll_new	= dw_1.insertrow(0)
		dw_1.scrolltorow(ll_new)
		dw_1.setitem(ll_new,'rut',rut)
		dw_1.setitem(ll_new,'compute_0011',ls_dv)
	else
		dw_1.setitem(1,'compute_0011',ls_dv)
	end if
	dw_1.accepttext()
else
	messagebox("Advertencia","Rut Inválido")
	close(w_ingreso_funeraria)	
end if
end event

type cb_grabar from commandbutton within w_ingreso_funeraria
integer x = 41
integer y = 884
integer width = 265
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

event clicked;if dw_1.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	cb_2.triggerevent(clicked!)
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type dw_1 from datawindow within w_ingreso_funeraria
integer x = 32
integer y = 36
integer width = 1669
integer height = 812
integer taborder = 10
string dataobject = "dw_funeraria"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_ingreso_funeraria
integer x = 1408
integer y = 884
integer width = 265
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;CLOSE(w_ingreso_funeraria)
end event

