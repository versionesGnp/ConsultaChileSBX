forward
global type w_listado_inf_21_sepulturas from window
end type
type cb_1 from commandbutton within w_listado_inf_21_sepulturas
end type
type cb_exportar from commandbutton within w_listado_inf_21_sepulturas
end type
type cb_ordenar from commandbutton within w_listado_inf_21_sepulturas
end type
type cb_filtrar from commandbutton within w_listado_inf_21_sepulturas
end type
type cb_imprimir from commandbutton within w_listado_inf_21_sepulturas
end type
type dw_lista from datawindow within w_listado_inf_21_sepulturas
end type
type gb_2 from groupbox within w_listado_inf_21_sepulturas
end type
end forward

global type w_listado_inf_21_sepulturas from window
integer width = 3374
integer height = 2084
boolean titlebar = true
string title = "Listado Reservas Tenicas por Sepulturas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_2 gb_2
end type
global w_listado_inf_21_sepulturas w_listado_inf_21_sepulturas

on w_listado_inf_21_sepulturas.create
this.cb_1=create cb_1
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_1,&
this.cb_exportar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_2}
end on

on w_listado_inf_21_sepulturas.destroy
destroy(this.cb_1)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;string ls_parque,ls_descrip_parque,ls_string
double ll_parque,ll_pos

gf_centrar(w_listado_inf_21_sepulturas)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
//ls_parque									= substr(1,1,Message.StringParm)
ll_parque					= Double(substr(1,1,Message.StringParm))
ll_pos						= pos(w_plano_sector_parque.ddlb_parque.text,'-')
ls_descrip_parque		= trim(mid(w_plano_sector_parque.ddlb_parque.text,(ll_pos + 1)))
if ll_parque > 0 then
	if ll_parque <> 103 then
		dw_lista.dataobject = 'dw_detalle_inf_21'
		dw_lista.settransobject(sqlca)
		dw_lista.insertrow(0)
		dw_lista.retrieve(ll_parque)
	else
		dw_lista.dataobject = 'dw_detalle_inf_21_santiago'
		dw_lista.settransobject(sqlca)
		dw_lista.insertrow(0)
		if ls_descrip_parque = 'SANTIAGO 2' then
			ls_string = 'P%'
			dw_lista.retrieve(ll_parque,ls_string)
		else
			ls_string = 'A%'
			dw_lista.retrieve(ll_parque,ls_string)
		end if	
	end if	
end if	
end event

type cb_1 from commandbutton within w_listado_inf_21_sepulturas
integer x = 3003
integer y = 1812
integer width = 297
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_inf_21_sepulturas)
end event

type cb_exportar from commandbutton within w_listado_inf_21_sepulturas
integer x = 50
integer y = 1824
integer width = 219
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

type cb_ordenar from commandbutton within w_listado_inf_21_sepulturas
integer x = 270
integer y = 1824
integer width = 210
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string 	nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_filtrar from commandbutton within w_listado_inf_21_sepulturas
integer x = 480
integer y = 1824
integer width = 178
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.setfilter(ls_texto)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_listado_inf_21_sepulturas
integer x = 658
integer y = 1824
integer width = 201
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_listado_inf_21_sepulturas
integer x = 27
integer width = 3278
integer height = 1780
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_inf_21"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_listado_inf_21_sepulturas
integer x = 32
integer y = 1780
integer width = 850
integer height = 148
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

