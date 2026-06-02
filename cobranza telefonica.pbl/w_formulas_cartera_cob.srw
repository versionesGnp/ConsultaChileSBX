forward
global type w_formulas_cartera_cob from window
end type
type mle_filtro from multilineedit within w_formulas_cartera_cob
end type
type st_5 from statictext within w_formulas_cartera_cob
end type
type cb_liberar from commandbutton within w_formulas_cartera_cob
end type
type st_1 from statictext within w_formulas_cartera_cob
end type
type cb_aceptar from commandbutton within w_formulas_cartera_cob
end type
type dw_muestra from datawindow within w_formulas_cartera_cob
end type
type cb_cerrar from commandbutton within w_formulas_cartera_cob
end type
end forward

global type w_formulas_cartera_cob from window
integer width = 3017
integer height = 1776
boolean titlebar = true
string title = "Filtros Cartera Cobranza"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
mle_filtro mle_filtro
st_5 st_5
cb_liberar cb_liberar
st_1 st_1
cb_aceptar cb_aceptar
dw_muestra dw_muestra
cb_cerrar cb_cerrar
end type
global w_formulas_cartera_cob w_formulas_cartera_cob

type variables
long il_new, il_row
string	is_origen_inf
end variables

on w_formulas_cartera_cob.create
this.mle_filtro=create mle_filtro
this.st_5=create st_5
this.cb_liberar=create cb_liberar
this.st_1=create st_1
this.cb_aceptar=create cb_aceptar
this.dw_muestra=create dw_muestra
this.cb_cerrar=create cb_cerrar
this.Control[]={this.mle_filtro,&
this.st_5,&
this.cb_liberar,&
this.st_1,&
this.cb_aceptar,&
this.dw_muestra,&
this.cb_cerrar}
end on

on w_formulas_cartera_cob.destroy
destroy(this.mle_filtro)
destroy(this.st_5)
destroy(this.cb_liberar)
destroy(this.st_1)
destroy(this.cb_aceptar)
destroy(this.dw_muestra)
destroy(this.cb_cerrar)
end on

event open;
long	ll_tot_reg

gf_centrar(w_formulas_cartera_cob)
dw_muestra.settransobject(sqlca)

is_origen_inf					= substr(1,1,Message.StringParm)
if not isnull(is_origen_inf) then
	if is_origen_inf = 'M' then
		cb_aceptar.enabled		= false
		cb_liberar.enabled			= true
	elseif is_origen_inf = 'V' then
		cb_aceptar.enabled		= true
		cb_liberar.enabled			= false
	end if
	ll_tot_reg						= dw_muestra.retrieve()
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Lista Cartera Cobranza")
	end if
end if
end event

type mle_filtro from multilineedit within w_formulas_cartera_cob
integer x = 430
integer y = 1244
integer width = 2523
integer height = 256
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_5 from statictext within w_formulas_cartera_cob
integer x = 50
integer y = 1256
integer width = 352
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Filtro Cartera:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_liberar from commandbutton within w_formulas_cartera_cob
integer x = 1271
integer y = 1524
integer width = 585
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Liberar Asignación"
end type

event clicked;string	ls_string

if il_row > 0 then 
	gs_cartera		= dw_muestra.getitemstring(il_row,'cartera_cobranza')
	gl_ind_cart		= dw_muestra.getitemnumber(il_row,'indice_cartera')
	ls_string			= gs_cartera+'~t'+string(gl_ind_cart)
	if isvalid(w_liberar_cartera_cob) then close(w_liberar_cartera_cob)
	OpenWithParm (w_liberar_cartera_cob,ls_string)
end if
end event

type st_1 from statictext within w_formulas_cartera_cob
integer x = 59
integer y = 28
integer width = 782
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Listado Carteras Cobranza"
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_formulas_cartera_cob
integer x = 41
integer y = 1520
integer width = 347
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string	ls_formula
if il_row > 0 then 
	if isvalid(w_general_cobranza_telefonica) then
		gs_cartera						= dw_muestra.getitemstring(il_row,'cartera_cobranza')
		gl_ind_cart						= dw_muestra.getitemnumber(il_row,'indice_cartera')
		ls_formula						= dw_muestra.getitemstring(il_row,'filtro_asignacion')
		w_general_cobranza_telefonica.dw_lista.SETfilter(ls_formula)
		w_general_cobranza_telefonica.dw_lista.filter()
		w_general_cobranza_telefonica.dw_lista.accepttext()
	end if
end if
cb_cerrar.triggerevent(clicked!)
end event

type dw_muestra from datawindow within w_formulas_cartera_cob
integer x = 41
integer y = 120
integer width = 2912
integer height = 1112
integer taborder = 10
string title = "none"
string dataobject = "dw_cartera_cobranza"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_filtro
il_row					= row
if il_row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_filtro			= dw_muestra.getitemstring(il_row,'filtro_asignacion')
	mle_filtro.text	= ls_filtro
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if is_origen_inf='M' then
	cb_liberar.TriggerEvent(Clicked!)
else
	cb_aceptar.TriggerEvent(Clicked!)
end if
end event

event losefocus;this.accepttext()
end event

type cb_cerrar from commandbutton within w_formulas_cartera_cob
integer x = 2606
integer y = 1520
integer width = 347
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_formulas_cartera_cob)
end event

