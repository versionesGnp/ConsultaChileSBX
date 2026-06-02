forward
global type w_consultar_historico_retiro from window
end type
type cb_imprimir from commandbutton within w_consultar_historico_retiro
end type
type cb_1 from commandbutton within w_consultar_historico_retiro
end type
type cb_2 from commandbutton within w_consultar_historico_retiro
end type
type cb_3 from commandbutton within w_consultar_historico_retiro
end type
type st_1 from statictext within w_consultar_historico_retiro
end type
type cb_cerrar from commandbutton within w_consultar_historico_retiro
end type
type dw_detalle from datawindow within w_consultar_historico_retiro
end type
type gb_1 from groupbox within w_consultar_historico_retiro
end type
end forward

global type w_consultar_historico_retiro from window
integer width = 3351
integer height = 1704
boolean titlebar = true
string title = "Detalle Pagos Históricos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_imprimir cb_imprimir
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
st_1 st_1
cb_cerrar cb_cerrar
dw_detalle dw_detalle
gb_1 gb_1
end type
global w_consultar_historico_retiro w_consultar_historico_retiro

on w_consultar_historico_retiro.create
this.cb_imprimir=create cb_imprimir
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.st_1,&
this.cb_cerrar,&
this.dw_detalle,&
this.gb_1}
end on

on w_consultar_historico_retiro.destroy
destroy(this.cb_imprimir)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.gb_1)
end on

event open;String		ls_base,ls_serie
Double	ll_numero
Long		ll_cod_parque

gf_centrar(w_consultar_historico_retiro)
ls_base 							= trim(substr(1,1,Message.StringParm))
ls_serie							= trim(substr(1,2,Message.StringParm))
ll_numero						= Double(trim(substr(1,3,Message.StringParm)))
ll_cod_parque					= long(trim(substr(1,4,Message.StringParm)))
if ll_cod_parque=103 then
	if ls_base='C' then
		dw_detalle.dataobject	= 'dw_lista_detalle_pago_histrorico_retiro1'
		dw_detalle.settransobject(sqlca)
		if dw_detalle.retrieve(gi_rut, ls_serie)=0 then
			messagebox("Advertencia","No Registra Pago")
			close(w_consultar_historico_retiro)
		end if
	elseif ls_base='P' then
		dw_detalle.dataobject	= 'dw_lista_detalle_pago_histrorico_retiro2'
		dw_detalle.settransobject(sqlca)
		if dw_detalle.retrieve(gi_rut, ls_serie)=0 then
			messagebox("Advertencia","No Registra Pago")
			close(w_consultar_historico_retiro)
		end if
	end if
elseif ll_cod_parque=101 then
	dw_detalle.dataobject	= 'dw_consulta_pago_hist_canaan'
	dw_detalle.settransobject(sqlca)
	if dw_detalle.retrieve(ls_base, ls_serie, ll_numero)=0 then
		messagebox("Advertencia","No Registra Pago")
		close(w_consultar_historico_retiro)
	end if
end if	


end event

type cb_imprimir from commandbutton within w_consultar_historico_retiro
integer x = 896
integer y = 1456
integer width = 261
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then f_Print( dw_detalle )		//f_printdlg(dw_detalle,gstr_print,w_consultar_historico_retiro)
end event

type cb_1 from commandbutton within w_consultar_historico_retiro
integer x = 59
integer y = 1456
integer width = 261
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_detalle.rowcount() > 0 then
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_2 from commandbutton within w_consultar_historico_retiro
integer x = 549
integer y = 1456
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_consultar_historico_retiro
integer x = 325
integer y = 1456
integer width = 219
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type st_1 from statictext within w_consultar_historico_retiro
integer x = 46
integer y = 32
integer width = 823
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Pagos Históricos"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_consultar_historico_retiro
integer x = 2962
integer y = 1456
integer width = 338
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_historico_retiro)
end event

type dw_detalle from datawindow within w_consultar_historico_retiro
integer x = 32
integer y = 112
integer width = 3269
integer height = 1288
integer taborder = 10
string title = "none"
string dataobject = "dw_consulta_pago_hist_canaan"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_consultar_historico_retiro
integer x = 37
integer y = 1408
integer width = 1147
integer height = 168
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

