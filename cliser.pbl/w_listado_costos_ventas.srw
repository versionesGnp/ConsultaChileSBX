forward
global type w_listado_costos_ventas from window
end type
type cb_limpiar from commandbutton within w_listado_costos_ventas
end type
type st_2 from statictext within w_listado_costos_ventas
end type
type em_anno from editmask within w_listado_costos_ventas
end type
type pb_consultar from picturebutton within w_listado_costos_ventas
end type
type cb_imprimir from commandbutton within w_listado_costos_ventas
end type
type dw_lista from datawindow within w_listado_costos_ventas
end type
type cb_cerrar from commandbutton within w_listado_costos_ventas
end type
end forward

global type w_listado_costos_ventas from window
integer width = 2295
integer height = 1980
boolean titlebar = true
string title = "Listado Costos de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_limpiar cb_limpiar
st_2 st_2
em_anno em_anno
pb_consultar pb_consultar
cb_imprimir cb_imprimir
dw_lista dw_lista
cb_cerrar cb_cerrar
end type
global w_listado_costos_ventas w_listado_costos_ventas

on w_listado_costos_ventas.create
this.cb_limpiar=create cb_limpiar
this.st_2=create st_2
this.em_anno=create em_anno
this.pb_consultar=create pb_consultar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_limpiar,&
this.st_2,&
this.em_anno,&
this.pb_consultar,&
this.cb_imprimir,&
this.dw_lista,&
this.cb_cerrar}
end on

on w_listado_costos_ventas.destroy
destroy(this.cb_limpiar)
destroy(this.st_2)
destroy(this.em_anno)
destroy(this.pb_consultar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
end on

event open;gf_centrar(w_listado_costos_ventas)
dw_lista.settransobject(sqlca)
end event

type cb_limpiar from commandbutton within w_listado_costos_ventas
integer x = 974
integer y = 1768
integer width = 315
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_lista.reset()
em_anno.text	= ''
end event

type st_2 from statictext within w_listado_costos_ventas
integer x = 27
integer y = 60
integer width = 123
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_anno from editmask within w_listado_costos_ventas
integer x = 165
integer y = 44
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
end type

type pb_consultar from picturebutton within w_listado_costos_ventas
integer x = 594
integer y = 20
integer width = 151
integer height = 140
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_fecha_ini,ls_fecha_fin
long 		ll_anno
datetime	ldt_fech_ini,ldt_fech_fin

ll_anno		= Long(em_anno.text)

if isnull(ll_anno) or ll_anno=0 then
	messagebox("Advertencia","Debe Ingresar Año a Consultar")
	em_anno.setfocus()
else
	ls_fecha_ini						= string('01/01/'+string(ll_anno,'0000'))
	ldt_fech_ini						= datetime(date(ls_fecha_ini),time('00:00:00'))
	ls_fecha_fin						= string('31/12/'+string(ll_anno,'0000'))
	ldt_fech_fin						= datetime(date(ls_fecha_fin),time('00:00:00'))
	if dw_lista.retrieve(ldt_fech_ini,ldt_fech_fin) =0 then
		messagebox("Advertencia","No Hay Pegistros Para el Año Consultado")
	end if	
end if	


end event

type cb_imprimir from commandbutton within w_listado_costos_ventas
integer x = 23
integer y = 1768
integer width = 315
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_listado_costos_ventas
integer x = 23
integer y = 180
integer width = 2213
integer height = 1552
integer taborder = 10
string title = "none"
string dataobject = "dw_historico_costo_ventas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_listado_costos_ventas
integer x = 1920
integer y = 1768
integer width = 315
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_costos_ventas)
end event

