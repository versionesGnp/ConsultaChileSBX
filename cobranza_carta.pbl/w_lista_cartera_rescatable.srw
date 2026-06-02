forward
global type w_lista_cartera_rescatable from window
end type
type em_titulo from editmask within w_lista_cartera_rescatable
end type
type pb_ok from picturebutton within w_lista_cartera_rescatable
end type
type st_1 from statictext within w_lista_cartera_rescatable
end type
type cb_3 from commandbutton within w_lista_cartera_rescatable
end type
type cb_2 from commandbutton within w_lista_cartera_rescatable
end type
type cb_1 from commandbutton within w_lista_cartera_rescatable
end type
type dw_lista from datawindow within w_lista_cartera_rescatable
end type
end forward

global type w_lista_cartera_rescatable from window
integer width = 3589
integer height = 1844
boolean titlebar = true
string title = "Listar"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_titulo em_titulo
pb_ok pb_ok
st_1 st_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_lista dw_lista
end type
global w_lista_cartera_rescatable w_lista_cartera_rescatable

on w_lista_cartera_rescatable.create
this.em_titulo=create em_titulo
this.pb_ok=create pb_ok
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.Control[]={this.em_titulo,&
this.pb_ok,&
this.st_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_lista}
end on

on w_lista_cartera_rescatable.destroy
destroy(this.em_titulo)
destroy(this.pb_ok)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_lista_cartera_rescatable)
dw_lista.settransobject(sqlca)
if gs_depto<>'I' then
	messagebox("Advertencia","Ud. No Tiene Acceso")
	close(w_lista_cartera_rescatable)
end if
end event

type em_titulo from editmask within w_lista_cartera_rescatable
integer x = 1134
integer y = 1612
integer width = 1902
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type pb_ok from picturebutton within w_lista_cartera_rescatable
integer x = 3058
integer y = 1612
integer width = 110
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_parque,ls_uso,ls_etapa
Long		ll_cod_parque
if len(em_titulo.text)>0 then
	dw_lista.object.t_titulo.text	= trim(em_titulo.text)
else
	ll_cod_parque						= dw_lista.getitemnumber(1,'parque')
	if ll_cod_parque=1 then
		ls_parque						= 'El Prado'
	elseif ll_cod_parque=102 then
		ls_parque						= 'El Manantial'
	elseif ll_cod_parque=11 then
		ls_parque						= 'La Foresta'
	elseif ll_cod_parque=801 then
		ls_parque						= 'Concepción'
	end if
	ls_uso								= dw_lista.getitemstring(1,'uso')
	ls_etapa								= dw_lista.getitemstring(1,'etapa')
	dw_lista.object.t_titulo.text	= 'Listado de Cartera Rescatable '+ ls_uso +' '+ls_parque+' '+ ls_etapa 
end if
end event

type st_1 from statictext within w_lista_cartera_rescatable
integer x = 722
integer y = 1628
integer width = 398
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Titulo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_lista_cartera_rescatable
integer x = 3250
integer y = 1608
integer width = 279
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

event clicked;close(w_lista_cartera_rescatable)
end event

type cb_2 from commandbutton within w_lista_cartera_rescatable
integer x = 457
integer y = 1608
integer width = 233
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_1 from commandbutton within w_lista_cartera_rescatable
integer x = 50
integer y = 1608
integer width = 389
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Archivo"
end type

event clicked;String	ls_archivo

dw_lista.reset()
dw_lista.accepttext()
SetNull(ls_archivo)
dw_lista.ImportFile(ls_archivo)
dw_lista.accepttext()
pb_ok.triggerevent(clicked!)
end event

type dw_lista from datawindow within w_lista_cartera_rescatable
integer x = 41
integer y = 40
integer width = 3488
integer height = 1528
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_cristian"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

