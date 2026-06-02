forward
global type w_ultimos_procesos_cartas from window
end type
type cb_2 from commandbutton within w_ultimos_procesos_cartas
end type
type dw_1 from datawindow within w_ultimos_procesos_cartas
end type
type cb_1 from commandbutton within w_ultimos_procesos_cartas
end type
end forward

global type w_ultimos_procesos_cartas from window
integer width = 2981
integer height = 1856
boolean titlebar = true
string title = "                                                        Último Proceso de Carta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
end type
global w_ultimos_procesos_cartas w_ultimos_procesos_cartas

on w_ultimos_procesos_cartas.create
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_1,&
this.cb_1}
end on

on w_ultimos_procesos_cartas.destroy
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;string 	fecha,ls_clasi
long		ll_cod_accion

gf_centrar(w_ultimos_procesos_cartas)

fecha 								= substr(1,1,Message.StringParm)
ls_clasi								= substr(1,2,Message.StringParm)
ll_cod_accion						= long(substr(1,3,Message.StringParm))	

gs_ventana							= 'w_ultimos_procesos_cartas'
f_valida_objeto()
if fecha = 'NO' then
	dw_1.dataobject 				='dw_ultimos_procesos_cartas'
	dw_1.settransobject(sqlca)
	this.title 						= 'Proceso de Carta'
	IF dw_1.retrieve(gs_base,gs_serie,gi_numero,gi_rut,ls_clasi,ll_cod_accion) = 0 THEN
		MESSAGEBOX('No hay Datos.','No existen procesos de cartas para este contrato.',STOPSIGN!)
		close(w_ultimos_procesos_cartas)
	end if
else
	dw_1.dataobject 				='dw_ultimos_procesos_cartas_doble'
	dw_1.settransobject(sqlca)
	this.title 						= 'Proceso de Carta'
	IF dw_1.retrieve(gs_base,gs_serie,gi_numero,gi_rut,date(fecha),ls_clasi,ll_cod_accion) = 0 THEN
		MESSAGEBOX('No hay Datos.','No existen procesos de cartas para este contrato.',STOPSIGN!)
		close(w_ultimos_procesos_cartas)
	else
		dw_1.object.titulo.text	= 'Usuario : '+gs_us
	end if
end if
end event

type cb_2 from commandbutton within w_ultimos_procesos_cartas
integer x = 37
integer y = 1616
integer width = 334
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_1.rowcount()>0 then
	dw_1.print()
end if
end event

type dw_1 from datawindow within w_ultimos_procesos_cartas
integer x = 37
integer y = 44
integer width = 2880
integer height = 1532
integer taborder = 10
string title = "none"
string dataobject = "dw_ultimos_procesos_cartas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ultimos_procesos_cartas
integer x = 2583
integer y = 1616
integer width = 334
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean default = true
end type

event clicked;close(w_ultimos_procesos_cartas)
end event

