forward
global type w_log_reservas from window
end type
type dw_1 from datawindow within w_log_reservas
end type
type cb_2 from commandbutton within w_log_reservas
end type
type cb_1 from commandbutton within w_log_reservas
end type
end forward

global type w_log_reservas from window
integer width = 3168
integer height = 1976
boolean titlebar = true
string title = "Historico de Reserva por Sepultura"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_log_reservas w_log_reservas

type variables
integer id_parque
end variables

on w_log_reservas.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_log_reservas.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;w_plano_sector_parque.dw_plano_sector_parque.enabled = false

id_parque 	= integer(w_plano_sector_parque.st_parque.text)	//Multiempresa 13-11-2006
gf_centrar(w_log_reservas)
dw_1.settransobject(sqlca)
if dw_1.retrieve(gs_sector,gs_sepultura,id_parque) > 0 then
	
else
	messagebox('No hay registros','No existen registros historicos para esta sepultura.',stopsign!)
	close(w_log_reservas)
end if
end event

event close;if isvalid(w_plano_sector_parque) then
	w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end if
end event

type dw_1 from datawindow within w_log_reservas
integer x = 69
integer y = 60
integer width = 3008
integer height = 1592
integer taborder = 10
string title = "none"
string dataobject = "dw_log_reserva"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_log_reservas
integer x = 2679
integer y = 1696
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_log_reservas)
end event

type cb_1 from commandbutton within w_log_reservas
integer x = 64
integer y = 1692
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if	
end event

