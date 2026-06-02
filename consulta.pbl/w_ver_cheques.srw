forward
global type w_ver_cheques from window
end type
type cb_ordenar from commandbutton within w_ver_cheques
end type
type cb_2 from commandbutton within w_ver_cheques
end type
type cb_1 from commandbutton within w_ver_cheques
end type
type dw_d_listado_cuenta_cte_ch from datawindow within w_ver_cheques
end type
end forward

global type w_ver_cheques from window
integer x = 1189
integer y = 548
integer width = 2880
integer height = 1424
boolean titlebar = true
string title = "VER CHEQUES"
boolean controlmenu = true
boolean minbox = true
long backcolor = 77571519
cb_ordenar cb_ordenar
cb_2 cb_2
cb_1 cb_1
dw_d_listado_cuenta_cte_ch dw_d_listado_cuenta_cte_ch
end type
global w_ver_cheques w_ver_cheques

on w_ver_cheques.create
this.cb_ordenar=create cb_ordenar
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_d_listado_cuenta_cte_ch=create dw_d_listado_cuenta_cte_ch
this.Control[]={this.cb_ordenar,&
this.cb_2,&
this.cb_1,&
this.dw_d_listado_cuenta_cte_ch}
end on

on w_ver_cheques.destroy
destroy(this.cb_ordenar)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_d_listado_cuenta_cte_ch)
end on

event open;gf_centrar(w_ver_cheques)

dw_d_listado_cuenta_cte_ch.SetTransObject(SQLCA)
if dw_d_listado_cuenta_cte_ch.Retrieve(gs_serie, gi_numero,gs_base) = 0 then
	messagebox('No Hay Información','No existen pagos con documentos para este contrato.',stopsign!)
	close(w_ver_cheques)
else
	dw_d_listado_cuenta_cte_ch.visible=true
	gs_ventana	= 'w_ver_cheques'
	f_valida_objeto()
end if

end event

type cb_ordenar from commandbutton within w_ver_cheques
integer x = 1275
integer y = 1192
integer width = 306
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_d_listado_cuenta_cte_ch.SETSORT(NULO)
dw_d_listado_cuenta_cte_ch.SORT()
end event

type cb_2 from commandbutton within w_ver_cheques
integer x = 37
integer y = 1192
integer width = 306
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;dw_d_listado_cuenta_cte_ch.print()
end event

type cb_1 from commandbutton within w_ver_cheques
integer x = 2514
integer y = 1192
integer width = 306
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
close(w_ver_cheques)
end event

type dw_d_listado_cuenta_cte_ch from datawindow within w_ver_cheques
integer x = 37
integer y = 32
integer width = 2784
integer height = 1120
integer taborder = 10
string dataobject = "d_listado_cuenta_cte_ch"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end event

event doubleclicked;st_param_dcto.rut        = this.getitemnumber(row,'ingreso_rut')
st_param_dcto.folio      = this.getitemnumber(row,'folio')
st_param_dcto.num_cheque = this.getitemnumber(row,'documentos_n_cheque')
open(w_cambio_doc_est)
end event

