forward
global type w_politica_premios from window
end type
type cb_imprimir from commandbutton within w_politica_premios
end type
type dw_politica from datawindow within w_politica_premios
end type
type cb_cerrar from commandbutton within w_politica_premios
end type
end forward

global type w_politica_premios from window
integer width = 3355
integer height = 1904
boolean titlebar = true
string title = "Resumen Cierre Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_imprimir cb_imprimir
dw_politica dw_politica
cb_cerrar cb_cerrar
end type
global w_politica_premios w_politica_premios

type variables
Long	il_mes,il_ano,il_row
end variables

on w_politica_premios.create
this.cb_imprimir=create cb_imprimir
this.dw_politica=create dw_politica
this.cb_cerrar=create cb_cerrar
this.Control[]={this.cb_imprimir,&
this.dw_politica,&
this.cb_cerrar}
end on

on w_politica_premios.destroy
destroy(this.cb_imprimir)
destroy(this.dw_politica)
destroy(this.cb_cerrar)
end on

event close;disconnect using Trans_1;
end event

event open;string	ls_cod_contab,ls_cargo
long		ll_tipo_prem,ll_tot_reg,ll_cod_parque
connect using Trans_1;

gf_centrar(w_politica_premios)
ll_tipo_prem							= long(substr(1,1,Message.StringParm))
ls_cod_contab							= substr(1,2,Message.StringParm)
ls_cargo									= substr(1,3,Message.StringParm)
ll_cod_parque							= long(substr(1,4,Message.StringParm))
if ll_tipo_prem=8 and ls_cargo='A'then
	dw_politica.dataobject = 'dw_premio_tipo_8_age'
	dw_politica.settransobject(sqlca)
elseif ll_tipo_prem=8 and ls_cargo='S'then
	dw_politica.dataobject = 'dw_premio_tipo_8_sup'
	dw_politica.settransobject(sqlca)	
end if
ll_tot_reg								= dw_politica.retrieve(ll_tipo_prem,ls_cod_contab,ls_cargo,ll_cod_parque)
end event

type cb_imprimir from commandbutton within w_politica_premios
integer x = 37
integer y = 1656
integer width = 297
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_politica.rowcount() >0 then 
	f_Print( dw_politica )
end if
end event

type dw_politica from datawindow within w_politica_premios
integer x = 37
integer y = 32
integer width = 3259
integer height = 1600
integer taborder = 40
string title = "none"
string dataobject = "dw_premio_tipo_8_sup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_politica_premios
integer x = 2999
integer y = 1656
integer width = 297
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_politica_premios)
end event

