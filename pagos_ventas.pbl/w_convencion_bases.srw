forward
global type w_convencion_bases from window
end type
type cb_cerrar from commandbutton within w_convencion_bases
end type
type dw_pond_uso from datawindow within w_convencion_bases
end type
type dw_pond_cierre from datawindow within w_convencion_bases
end type
end forward

global type w_convencion_bases from window
integer width = 2437
integer height = 1228
boolean titlebar = true
string title = "Bases Convención"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_pond_uso dw_pond_uso
dw_pond_cierre dw_pond_cierre
end type
global w_convencion_bases w_convencion_bases

type variables
long il_row
end variables

on w_convencion_bases.create
this.cb_cerrar=create cb_cerrar
this.dw_pond_uso=create dw_pond_uso
this.dw_pond_cierre=create dw_pond_cierre
this.Control[]={this.cb_cerrar,&
this.dw_pond_uso,&
this.dw_pond_cierre}
end on

on w_convencion_bases.destroy
destroy(this.cb_cerrar)
destroy(this.dw_pond_uso)
destroy(this.dw_pond_cierre)
end on

event open;string	ls_tipo_conven,ls_descrip
long		ll_tot_reg_1,ll_tot_reg_2,ll_tot_reg
datetime	ldt_fecha
date		ld_fecha

gf_centrar(w_convencion_bases)
ld_fecha									= date(substr(1,1,Message.StringParm))
ldt_fecha								= datetime(ld_fecha,time('00:00:00'))
ls_tipo_conven							= substr(1,2,Message.StringParm)

if ls_tipo_conven = 'N' then
	ls_descrip							= 'Nacional'
elseif ls_tipo_conven = 'I' then
	ls_descrip							= 'Internacional'
end if

dw_pond_cierre.dataobject			= 'dw_ponderado_cierre'
dw_pond_cierre.settransobject(sqlca)
ll_tot_reg_1							= dw_pond_cierre.retrieve(ldt_fecha,ls_tipo_conven)

dw_pond_uso.dataobject				= 'dw_ponderado_uso'
dw_pond_uso.settransobject(sqlca)
ll_tot_reg_2							= dw_pond_uso.retrieve(ldt_fecha,ls_tipo_conven)
ll_tot_reg								= ll_tot_reg_1 + ll_tot_reg_2

if ll_tot_reg = 0 then
	messagebox("Advertencia",'No Registra Puntaje Convención '+ls_descrip+' con Fecha '+string(ldt_fecha,'dd/mm/yyyy'))
	close(w_convencion_bases)
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_cerrar from commandbutton within w_convencion_bases
integer x = 2071
integer y = 960
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_convencion_bases)
end event

type dw_pond_uso from datawindow within w_convencion_bases
integer x = 1207
integer y = 32
integer width = 1175
integer height = 888
integer taborder = 20
string title = "none"
string dataobject = "dw_ponderado_uso"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pond_cierre from datawindow within w_convencion_bases
integer x = 37
integer y = 32
integer width = 1147
integer height = 888
integer taborder = 30
string title = "none"
string dataobject = "dw_ponderado_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

