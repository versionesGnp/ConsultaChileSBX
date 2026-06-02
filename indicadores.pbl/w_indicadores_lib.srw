forward
global type w_indicadores_lib from window
end type
type cb_1 from commandbutton within w_indicadores_lib
end type
type dw_2 from datawindow within w_indicadores_lib
end type
type cb_2 from commandbutton within w_indicadores_lib
end type
end forward

global type w_indicadores_lib from window
integer x = 5
integer y = 4
integer width = 3653
integer height = 2448
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_1 cb_1
dw_2 dw_2
cb_2 cb_2
end type
global w_indicadores_lib w_indicadores_lib

on w_indicadores_lib.create
this.cb_1=create cb_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.Control[]={this.cb_1,&
this.dw_2,&
this.cb_2}
end on

on w_indicadores_lib.destroy
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.cb_2)
end on

event open;datetime fecha_prim
long cta_pag_s,plazo,mora,i
setpointer (HourGlass!)
gf_centrar(w_indicadores_lib)
dw_2.settransobject (sqlca)
if dw_2.retrieve(gd_fecha_1,gd_fecha_2,gi_parque_select) > 0 then
	dw_2.object.titulo1.text = 'Usuario : ' + gs_user
	dw_2.object.titulo2.text = 'Nombre  : ' + gs_us
	if gi_parque_select = 1 then
		dw_2.object.titulo3.text = 'El Prado'
	elseif gi_parque_select = 102 then
		dw_2.object.titulo3.text = 'El Manatial'
	elseif gi_parque_select = 11 then
		dw_2.object.titulo3.text = 'La Foresta'
	end if
	dw_2.accepttext ()
	this.title = gs_app_name
else
	messagebox('No hay datos','No se encuemtrar datos Asociados.',stopsign!)
	close(w_indicadores)	
end if
end event

type cb_1 from commandbutton within w_indicadores_lib
integer x = 46
integer y = 2220
integer width = 297
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprime"
end type

event clicked;if dw_2.rowcount() >0 then 
	f_Print( dw_2 )
end if
end event

type dw_2 from datawindow within w_indicadores_lib
integer x = 46
integer y = 40
integer width = 3557
integer height = 2144
string dataobject = "dw_composit_indicadores_lib"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_indicadores_lib
integer x = 3296
integer y = 2220
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_indicadores_lib)
end event

