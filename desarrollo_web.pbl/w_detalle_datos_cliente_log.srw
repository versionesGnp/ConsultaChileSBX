forward
global type w_detalle_datos_cliente_log from window
end type
type cb_mostrar from commandbutton within w_detalle_datos_cliente_log
end type
type pb_fin from picturebutton within w_detalle_datos_cliente_log
end type
type pb_antes from picturebutton within w_detalle_datos_cliente_log
end type
type pb_sigue from picturebutton within w_detalle_datos_cliente_log
end type
type pb_primer from picturebutton within w_detalle_datos_cliente_log
end type
type st_1 from statictext within w_detalle_datos_cliente_log
end type
type cb_cerrar from commandbutton within w_detalle_datos_cliente_log
end type
type cb_imprimir from commandbutton within w_detalle_datos_cliente_log
end type
type dw_cliente_detalle_log from datawindow within w_detalle_datos_cliente_log
end type
type gb_1 from groupbox within w_detalle_datos_cliente_log
end type
end forward

global type w_detalle_datos_cliente_log from window
integer width = 2907
integer height = 2404
boolean titlebar = true
string title = "Datos Cliente Original"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_mostrar cb_mostrar
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
st_1 st_1
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_cliente_detalle_log dw_cliente_detalle_log
gb_1 gb_1
end type
global w_detalle_datos_cliente_log w_detalle_datos_cliente_log

on w_detalle_datos_cliente_log.create
this.cb_mostrar=create cb_mostrar
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.pb_primer=create pb_primer
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_cliente_detalle_log=create dw_cliente_detalle_log
this.gb_1=create gb_1
this.Control[]={this.cb_mostrar,&
this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.pb_primer,&
this.st_1,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_cliente_detalle_log,&
this.gb_1}
end on

on w_detalle_datos_cliente_log.destroy
destroy(this.cb_mostrar)
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.pb_primer)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_cliente_detalle_log)
destroy(this.gb_1)
end on

event open;Long	ll_rut

ll_rut = Long(Message.StringParm)
dw_cliente_detalle_log.settransobject(sqlca)
if dw_cliente_detalle_log.retrieve(ll_rut)=0 then
	messagebox("Advertencia","No Registra Actualización Anterior")
	close(w_detalle_datos_cliente_log)
else
	dw_cliente_detalle_log.Modify("DataWindow.detail.height=1052")
	cb_mostrar.y			= 1304
	cb_imprimir.y			= 1304
	cb_cerrar.y				= 1304
	gb_1.y					= 1260
	pb_primer.y				= 1316
	pb_sigue.y				= 1316
	pb_antes.y				= 1316
	pb_fin.y					= 1316
	w_detalle_datos_cliente_log.height	= 1592
	dw_cliente_detalle_log.height			= 1080
	cb_mostrar.text		='Mostrar Antecedente Original'
	gf_centrar(w_detalle_datos_cliente_log)
end if

end event

type cb_mostrar from commandbutton within w_detalle_datos_cliente_log
integer x = 608
integer y = 2136
integer width = 809
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar Antecedente Original"
end type

event clicked;if cb_mostrar.text='Mostrar Antecedente Original' then
	dw_cliente_detalle_log.Modify("DataWindow.detail.height=1984")
	cb_mostrar.y			= 2136
	cb_imprimir.y			= 2136
	cb_cerrar.y				= 2136
	gb_1.y					= 2092
	pb_primer.y				= 2148
	pb_sigue.y				= 2148
	pb_antes.y				= 2148
	pb_fin.y					= 2148
	w_detalle_datos_cliente_log.height	= 2432
	dw_cliente_detalle_log.height			= 1960
	cb_mostrar.text		= 'NO Mostrar Antecedente Original'
elseif cb_mostrar.text='NO Mostrar Antecedente Original' then
	dw_cliente_detalle_log.Modify("DataWindow.detail.height=1052")
	cb_mostrar.y			= 1304
	cb_imprimir.y			= 1304
	cb_cerrar.y				= 1304
	gb_1.y					= 1260
	pb_primer.y				= 1316
	pb_sigue.y				= 1316
	pb_antes.y				= 1316
	pb_fin.y					= 1316
	w_detalle_datos_cliente_log.height	= 1592
	dw_cliente_detalle_log.height			= 1080
	cb_mostrar.text		='Mostrar Antecedente Original'
end if
gf_centrar(w_detalle_datos_cliente_log)
end event

type pb_fin from picturebutton within w_detalle_datos_cliente_log
integer x = 2039
integer y = 2148
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_cliente_detalle_log.ScrollToRow(dw_cliente_detalle_log.rowcount())
dw_cliente_detalle_log.setfocus()
end event

type pb_antes from picturebutton within w_detalle_datos_cliente_log
integer x = 1915
integer y = 2148
integer width = 119
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_cliente_detalle_log.ScrollNextPage( )
dw_cliente_detalle_log.setfocus()
end event

type pb_sigue from picturebutton within w_detalle_datos_cliente_log
integer x = 1792
integer y = 2148
integer width = 119
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_cliente_detalle_log.ScrollPriorPage( )
dw_cliente_detalle_log.setfocus()
end event

type pb_primer from picturebutton within w_detalle_datos_cliente_log
integer x = 1669
integer y = 2148
integer width = 119
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_cliente_detalle_log.ScrollToRow(1)
dw_cliente_detalle_log.setfocus()
end event

type st_1 from statictext within w_detalle_datos_cliente_log
integer x = 41
integer y = 32
integer width = 2021
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ultima Actualización de Antecedentes del Cliente"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_detalle_datos_cliente_log
integer x = 2423
integer y = 2136
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_datos_cliente_log)
end event

type cb_imprimir from commandbutton within w_detalle_datos_cliente_log
integer x = 55
integer y = 2136
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//f_printdlg(dw_cliente_detalle_log,gstr_print,w_detalle_datos_cliente_log)
f_Print( dw_cliente_detalle_log )
end event

type dw_cliente_detalle_log from datawindow within w_detalle_datos_cliente_log
integer x = 50
integer y = 132
integer width = 2807
integer height = 1960
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_datos_log"
boolean border = false
end type

type gb_1 from groupbox within w_detalle_datos_cliente_log
integer x = 1637
integer y = 2092
integer width = 553
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

