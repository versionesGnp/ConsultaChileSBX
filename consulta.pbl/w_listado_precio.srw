forward
global type w_listado_precio from window
end type
type pb_ok from picturebutton within w_listado_precio
end type
type dw_parque from datawindow within w_listado_precio
end type
type st_1 from statictext within w_listado_precio
end type
type cb_22 from commandbutton within w_listado_precio
end type
type cb_3 from commandbutton within w_listado_precio
end type
type cb_11 from commandbutton within w_listado_precio
end type
type rb_3 from radiobutton within w_listado_precio
end type
type rb_2 from radiobutton within w_listado_precio
end type
type rb_1 from radiobutton within w_listado_precio
end type
type cb_2 from commandbutton within w_listado_precio
end type
type cb_1 from commandbutton within w_listado_precio
end type
type dw_1 from datawindow within w_listado_precio
end type
type gb_1 from groupbox within w_listado_precio
end type
end forward

global type w_listado_precio from window
integer x = 1189
integer y = 884
integer width = 2962
integer height = 1592
boolean titlebar = true
string title = "Lista de Precios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
pb_ok pb_ok
dw_parque dw_parque
st_1 st_1
cb_22 cb_22
cb_3 cb_3
cb_11 cb_11
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_listado_precio w_listado_precio

on w_listado_precio.create
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_1=create st_1
this.cb_22=create cb_22
this.cb_3=create cb_3
this.cb_11=create cb_11
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_ok,&
this.dw_parque,&
this.st_1,&
this.cb_22,&
this.cb_3,&
this.cb_11,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_listado_precio.destroy
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_1)
destroy(this.cb_22)
destroy(this.cb_3)
destroy(this.cb_11)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;gf_centrar (w_listado_precio)
dw_1.SetTransObject(SQLCA)
dw_parque.SetTransObject(SQLCA)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
elseif gs_conexion = "Parque Concepción" then
	dw_parque.setitem(1,'cod_parque',801)
end if
dw_parque.accepttext()
pb_ok.triggerevent(clicked!)
gs_ventana	= 'w_listado_precio'
f_valida_objeto()
end event

type pb_ok from picturebutton within w_listado_precio
integer x = 1943
integer y = 24
integer width = 178
integer height = 156
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_cod_parque
String	ls_filtro
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ll_cod_parque) then
	dw_1.Retrieve(ll_cod_parque)
	if rb_1.checked=true then
		ls_filtro		= ''
	elseif rb_2.checked=true then
		ls_filtro		= "canal = '"+ "NI" +" '"
	elseif rb_3.checked=true then
		ls_filtro		= "canal = '"+ "NF" +" '"
	end if
	dw_1.setfilter(ls_filtro)
	dw_1.filter()
	dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
	dw_1.sort()
end if

end event

type dw_parque from datawindow within w_listado_precio
integer x = 311
integer y = 56
integer width = 599
integer height = 104
integer taborder = 60
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_1.reset()
pb_ok.triggerevent(clicked!)
end event

type st_1 from statictext within w_listado_precio
integer x = 64
integer y = 68
integer width = 242
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
boolean focusrectangle = false
end type

type cb_22 from commandbutton within w_listado_precio
integer x = 800
integer y = 1380
integer width = 261
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;SaveAsType TipoArchivo

datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )


end event

type cb_3 from commandbutton within w_listado_precio
integer x = 535
integer y = 1380
integer width = 261
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_1.SETfilter(NULO)
dw_1.filter()
dw_1.filter()
end event

type cb_11 from commandbutton within w_listado_precio
integer x = 270
integer y = 1380
integer width = 261
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_1.SETSORT(NULO)
dw_1.SORT()
dw_1.sort()
end event

type rb_3 from radiobutton within w_listado_precio
integer x = 1641
integer y = 64
integer width = 183
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NF"
end type

event clicked;//dw_1.setfilter(("canal = '"+ "NF" +" '"))
//dw_1.filter()
//dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
//dw_1.sort()
dw_1.reset()
pb_ok.triggerevent(clicked!)
end event

type rb_2 from radiobutton within w_listado_precio
integer x = 1399
integer y = 64
integer width = 169
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NI"
end type

event clicked;dw_1.reset()
//dw_1.setfilter(("canal = '"+ "NI" +" '"))
//dw_1.filter()
//dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
//dw_1.sort()
pb_ok.triggerevent(clicked!)
end event

type rb_1 from radiobutton within w_listado_precio
integer x = 1051
integer y = 64
integer width = 274
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;////dw_1.reset()
////dw_1.Retrieve()
////dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
////dw_1.sort()
//
////dw_1.SetTransObject(SQLCA)
////dw_1.Retrieve()
//dw_1.setfilter("")
//dw_1.filter()
//dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
//dw_1.sort()
dw_1.reset()
pb_ok.triggerevent(clicked!)
end event

type cb_2 from commandbutton within w_listado_precio
integer x = 41
integer y = 1380
integer width = 224
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount()>0 then dw_1.print()
end event

type cb_1 from commandbutton within w_listado_precio
integer x = 2610
integer y = 1380
integer width = 297
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_precio)
end event

type dw_1 from datawindow within w_listado_precio
integer x = 32
integer y = 196
integer width = 2875
integer height = 1148
integer taborder = 10
string title = "Lista de Precio"
string dataobject = "d_listado_precio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_listado_precio
integer x = 1010
integer y = 12
integer width = 859
integer height = 148
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

