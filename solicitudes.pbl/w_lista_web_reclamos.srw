forward
global type w_lista_web_reclamos from window
end type
type dw_detalle from datawindow within w_lista_web_reclamos
end type
type cb_exportar from commandbutton within w_lista_web_reclamos
end type
type cb_2 from commandbutton within w_lista_web_reclamos
end type
type cb_3 from commandbutton within w_lista_web_reclamos
end type
type cb_4 from commandbutton within w_lista_web_reclamos
end type
type pb_4 from picturebutton within w_lista_web_reclamos
end type
type pb_3 from picturebutton within w_lista_web_reclamos
end type
type pb_2 from picturebutton within w_lista_web_reclamos
end type
type pb_1 from picturebutton within w_lista_web_reclamos
end type
type st_1 from statictext within w_lista_web_reclamos
end type
type cb_cerrar from commandbutton within w_lista_web_reclamos
end type
type dw_lista from datawindow within w_lista_web_reclamos
end type
type gb_1 from groupbox within w_lista_web_reclamos
end type
type gb_2 from groupbox within w_lista_web_reclamos
end type
type st_no_registra from statictext within w_lista_web_reclamos
end type
end forward

global type w_lista_web_reclamos from window
integer width = 3607
integer height = 2384
boolean titlebar = true
string title = "Lista Reclamos"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
dw_detalle dw_detalle
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
st_no_registra st_no_registra
end type
global w_lista_web_reclamos w_lista_web_reclamos

on w_lista_web_reclamos.create
this.dw_detalle=create dw_detalle
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.st_no_registra=create st_no_registra
this.Control[]={this.dw_detalle,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.st_no_registra}
end on

on w_lista_web_reclamos.destroy
destroy(this.dw_detalle)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.st_no_registra)
end on

event open;String	ls_base,ls_serie,ls_sector,ls_sepult,ls_nombre
Long		ll_cod_parque
Double	ll_numero
gf_centrar(w_lista_web_reclamos)
ls_base												= trim(substr(1,1,Message.StringParm))
ls_serie												= trim(substr(1,2,Message.StringParm))
ll_numero											= Double(substr(1,3,Message.StringParm))
ls_sector											= trim(substr(1,4,Message.StringParm))
ls_sepult											= trim(substr(1,5,Message.StringParm))
ls_nombre											= trim(substr(1,6,Message.StringParm))
ll_cod_parque										= long(substr(1,7,Message.StringParm))
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
st_no_registra.visible							= false
dw_detalle.visible								= true
if dw_lista.retrieve(ls_sector,ls_sepult,ll_cod_parque)>0 then
	dw_lista.object.t_base.text				= ls_base
	dw_lista.object.t_serie.text				= ls_serie
	dw_lista.object.t_numero.text				= string(ll_numero,"###,###,###,###,###")
	dw_lista.object.t_nombre_cliente.text	= ls_nombre
else
	messagebox("Advertencia","No Registra Dato")
	close(w_lista_web_reclamos)
end if
end event

type dw_detalle from datawindow within w_lista_web_reclamos
integer x = 41
integer y = 1076
integer width = 3465
integer height = 1012
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_detalle_web_reclamos"
boolean border = false
end type

type cb_exportar from commandbutton within w_lista_web_reclamos
integer x = 55
integer y = 2136
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel( dw_lista)
end if
end event

type cb_2 from commandbutton within w_lista_web_reclamos
integer x = 306
integer y = 2136
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_3 from commandbutton within w_lista_web_reclamos
integer x = 558
integer y = 2136
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_4 from commandbutton within w_lista_web_reclamos
integer x = 837
integer y = 2136
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then 
	f_Print( dw_detalle )
end if
end event

type pb_4 from picturebutton within w_lista_web_reclamos
integer x = 2807
integer y = 2136
integer width = 114
integer height = 84
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle.ScrollToRow(dw_detalle.rowcount() )
end event

type pb_3 from picturebutton within w_lista_web_reclamos
integer x = 2688
integer y = 2136
integer width = 114
integer height = 84
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "flec_de.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle.ScrollNextPage( )
end event

type pb_2 from picturebutton within w_lista_web_reclamos
integer x = 2569
integer y = 2136
integer width = 114
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "flec_iz.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle.ScrollPriorPage( )
end event

type pb_1 from picturebutton within w_lista_web_reclamos
integer x = 2450
integer y = 2136
integer width = 114
integer height = 84
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_detalle.ScrollToRow(1)
end event

type st_1 from statictext within w_lista_web_reclamos
integer x = 46
integer y = 12
integer width = 1280
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Reclamos Realizado IntraNet"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_lista_web_reclamos
integer x = 3177
integer y = 2128
integer width = 325
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_web_reclamos)
end event

type dw_lista from datawindow within w_lista_web_reclamos
integer x = 32
integer y = 96
integer width = 3470
integer height = 956
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_web_reclamo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_id
if row>0 then
	dw_lista.SelectRow(0, FALSE)
	dw_lista.SelectRow(row, TRUE)
	ls_id								= dw_lista.getitemstring(row,'id_reclamo')
	if dw_detalle.retrieve(ls_id)=0 then
		st_no_registra.visible	= true
		dw_detalle.visible		= false
	else
		st_no_registra.visible	= false
		dw_detalle.visible		= true
	end if
end if
end event

event rowfocuschanged;String	ls_id
if getrow()>0 then
	dw_lista.SelectRow(0, FALSE)
	dw_lista.SelectRow(getrow(), TRUE)
	ls_id								= dw_lista.getitemstring(getrow(),'id_reclamo')
	if dw_detalle.retrieve(ls_id)=0 then
		st_no_registra.visible	= true
		dw_detalle.visible		= false
	else
		st_no_registra.visible	= false
		dw_detalle.visible		= true
	end if
end if
end event

event doubleclicked;String	ls_id
if row>0 then
	dw_lista.SelectRow(0, FALSE)
	dw_lista.SelectRow(row, TRUE)
	ls_id								= dw_lista.getitemstring(row,'id_reclamo')
	if dw_detalle.retrieve(ls_id)=0 then
		st_no_registra.visible	= true
		dw_detalle.visible		= false
	else
		st_no_registra.visible	= false
		dw_detalle.visible		= true
	end if
end if
end event

type gb_1 from groupbox within w_lista_web_reclamos
integer x = 2427
integer y = 2084
integer width = 521
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_lista_web_reclamos
integer x = 32
integer y = 2084
integer width = 1079
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_no_registra from statictext within w_lista_web_reclamos
boolean visible = false
integer x = 78
integer y = 1132
integer width = 3429
integer height = 936
integer textsize = -72
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "No Registra Gestión"
alignment alignment = center!
boolean focusrectangle = false
end type

