forward
global type w_consulta_ofertas from window
end type
type cb_4 from commandbutton within w_consulta_ofertas
end type
type cb_3 from commandbutton within w_consulta_ofertas
end type
type em_nro_oferta from editmask within w_consulta_ofertas
end type
type cb_2 from commandbutton within w_consulta_ofertas
end type
type dw_1 from uo_datawindow within w_consulta_ofertas
end type
type cb_1 from commandbutton within w_consulta_ofertas
end type
end forward

global type w_consulta_ofertas from window
integer x = 5
integer y = 4
integer width = 3657
integer height = 2400
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_4 cb_4
cb_3 cb_3
em_nro_oferta em_nro_oferta
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
end type
global w_consulta_ofertas w_consulta_ofertas

type variables
string base,estado
end variables

on w_consulta_ofertas.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.em_nro_oferta=create em_nro_oferta
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.em_nro_oferta,&
this.cb_2,&
this.dw_1,&
this.cb_1}
end on

on w_consulta_ofertas.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.em_nro_oferta)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;date fecha

this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
fecha = date(Message.StringParm)
dw_1.settransobject(sqlca)
if dw_1.retrieve(fecha,'O') > 0 then
	
end if
end event

type cb_4 from commandbutton within w_consulta_ofertas
integer x = 2533
integer y = 2168
integer width = 343
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Cte."
end type

event clicked;dw_1.TriggerEvent(DoubleClicked!)
end event

type cb_3 from commandbutton within w_consulta_ofertas
event clicked pbm_bnclicked
integer x = 2885
integer y = 2168
integer width = 343
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Modificar"
end type

event clicked;gs_serie  = dw_1.getitemstring(dw_1.getrow(),'factura_oferta_serie')
gi_numero = dw_1.getitemnumber(dw_1.getrow(),'factura_oferta_numero')
gs_base	 = 'O'
open(w_modifica_oferta)
end event

type em_nro_oferta from editmask within w_consulta_ofertas
integer x = 69
integer y = 2172
integer width = 361
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "x-xxxxxxxx"
boolean autoskip = true
string displaydata = "Ä"
end type

type cb_2 from commandbutton within w_consulta_ofertas
integer x = 457
integer y = 2176
integer width = 114
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "?"
end type

event clicked;long i,oferta,a
string serie//factura_oferta_serie
a = 0
oferta = long( mid(em_nro_oferta.text,3) )
serie  = mid( em_nro_oferta.text,1,1 )
for i  = 1 to dw_1.rowcount()
	if oferta = dw_1.getitemnumber(i,'factura_oferta_numero') and serie = dw_1.getitemstring(i,'factura_oferta_serie') then
		dw_1.ScrollToRow( i )
		a ++
		exit
	end if	
next
if a = 0 then messagebox(gs_app_name,'No fue encontrado.',information!)
end event

type dw_1 from uo_datawindow within w_consulta_ofertas
integer x = 59
integer y = 40
integer width = 3511
integer height = 2088
integer taborder = 10
string dataobject = "dw_consulta_ofertas"
boolean border = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;call super::rowfocuschanged;SelectRow(0, FALSE)
SelectRow(getrow(), TRUE)
end event

event constructor;call super::constructor;sql_original = this.GetSqlSelect()
MenuHabilitado = "1011011"
end event

event doubleclicked;call super::doubleclicked;gs_serie  = getitemstring(getrow(),'factura_oferta_serie')
gi_numero = getitemnumber(getrow(),'factura_oferta_numero')
gs_base	 = 'O'
open(w_cuenta_corriente_oferta)
end event

type cb_1 from commandbutton within w_consulta_ofertas
integer x = 3237
integer y = 2168
integer width = 343
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consulta_ofertas)
end event

