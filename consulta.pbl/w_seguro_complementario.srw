forward
global type w_seguro_complementario from window
end type
type pb_5 from picturebutton within w_seguro_complementario
end type
type pb_4 from picturebutton within w_seguro_complementario
end type
type pb_3 from picturebutton within w_seguro_complementario
end type
type pb_2 from picturebutton within w_seguro_complementario
end type
type cb_3 from commandbutton within w_seguro_complementario
end type
type cb_filtrar from commandbutton within w_seguro_complementario
end type
type cb_ordenar from commandbutton within w_seguro_complementario
end type
type cb_imprimir from commandbutton within w_seguro_complementario
end type
type cb_cerrar from commandbutton within w_seguro_complementario
end type
type dw_lista from datawindow within w_seguro_complementario
end type
type gb_2 from groupbox within w_seguro_complementario
end type
end forward

global type w_seguro_complementario from window
integer width = 2953
integer height = 1304
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
cb_3 cb_3
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
end type
global w_seguro_complementario w_seguro_complementario

event open;Long	ll_cod_seguro
ll_cod_seguro		= long(Message.StringParm)
gf_centrar(w_seguro_complementario)
w_seguro_complementario.title	= 'Beneficiario(s) Seguro Renta y Deceso de la Promesa Nº '+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###")
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(gs_base,gs_serie,gi_numero,ll_cod_seguro)=0 then
	messagebox("Advertencia","No Registra Beneficiario Seguro Complementario")
	close(w_seguro_complementario)
ELSE
	pb_2.triggerevent(clicked!)
end if
end event

on w_seguro_complementario.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.cb_3=create cb_3
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.cb_3,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2}
end on

on w_seguro_complementario.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.cb_3)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

type pb_5 from picturebutton within w_seguro_complementario
event ue_mousemove pbm_mousemove
integer x = 1934
integer y = 1068
integer width = 123
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
dw_lista.ScrollToRow(ll_tot_reg)
end event

type pb_4 from picturebutton within w_seguro_complementario
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 1068
integer width = 123
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila,ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
ll_fila		= dw_lista.getrow() + 1
if ll_fila>ll_tot_reg then ll_fila=ll_tot_reg
dw_lista.Scrolltorow(ll_fila)
end event

type pb_3 from picturebutton within w_seguro_complementario
event ue_mousemove pbm_mousemove
integer x = 1678
integer y = 1068
integer width = 123
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila
ll_fila				= dw_lista.getrow() - 1
if ll_fila<1 then ll_fila=1
dw_lista.Scrolltorow(ll_fila)
end event

type pb_2 from picturebutton within w_seguro_complementario
event ue_mousemove pbm_mousemove
integer x = 1550
integer y = 1068
integer width = 123
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type cb_3 from commandbutton within w_seguro_complementario
integer x = 850
integer y = 1064
integer width = 265
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_filtrar from commandbutton within w_seguro_complementario
integer x = 41
integer y = 1064
integer width = 265
integer height = 96
integer taborder = 20
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

type cb_ordenar from commandbutton within w_seguro_complementario
integer x = 311
integer y = 1064
integer width = 265
integer height = 96
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

type cb_imprimir from commandbutton within w_seguro_complementario
integer x = 581
integer y = 1064
integer width = 265
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.Object.DataWindow.Zoom = 120
	IF PrintSetup( ) <> -1 THEN dw_lista.Print()
	dw_lista.Object.DataWindow.Zoom = 100
end if
end event

type cb_cerrar from commandbutton within w_seguro_complementario
integer x = 2578
integer y = 1064
integer width = 288
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

event clicked;close(w_seguro_complementario)
end event

type dw_lista from datawindow within w_seguro_complementario
integer x = 32
integer y = 32
integer width = 2843
integer height = 980
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_seguro_complementario"
end type

type gb_2 from groupbox within w_seguro_complementario
event ue_mousemove pbm_mousemove
integer x = 1522
integer y = 1020
integer width = 562
integer height = 156
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

