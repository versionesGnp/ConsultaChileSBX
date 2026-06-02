forward
global type w_actualizar_web_pagos from window
end type
type st_titulo from statictext within w_actualizar_web_pagos
end type
type cb_4 from commandbutton within w_actualizar_web_pagos
end type
type cb_3 from commandbutton within w_actualizar_web_pagos
end type
type cb_2 from commandbutton within w_actualizar_web_pagos
end type
type cb_exportar from commandbutton within w_actualizar_web_pagos
end type
type cb_actualizar from commandbutton within w_actualizar_web_pagos
end type
type cb_cerrar from commandbutton within w_actualizar_web_pagos
end type
type dw_lista from datawindow within w_actualizar_web_pagos
end type
type gb_2 from groupbox within w_actualizar_web_pagos
end type
end forward

global type w_actualizar_web_pagos from window
integer width = 3406
integer height = 1952
boolean titlebar = true
string title = "Actualizar WEB Pagos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_titulo st_titulo
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_exportar cb_exportar
cb_actualizar cb_actualizar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
end type
global w_actualizar_web_pagos w_actualizar_web_pagos

on w_actualizar_web_pagos.create
this.st_titulo=create st_titulo
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_exportar=create cb_exportar
this.cb_actualizar=create cb_actualizar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.st_titulo,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_exportar,&
this.cb_actualizar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2}
end on

on w_actualizar_web_pagos.destroy
destroy(this.st_titulo)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_exportar)
destroy(this.cb_actualizar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;Long	ll_tot_reg,ll_indi

gf_centrar(w_actualizar_web_pagos)
dw_lista.settransobject(sqlca)
ll_tot_reg	= dw_lista.retrieve()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'est_reg',1)
	next
	dw_lista.accepttext()
else
	messagebox("Advertencia","No Registra Dato")
	close(w_actualizar_web_pagos)
end if
end event

type st_titulo from statictext within w_actualizar_web_pagos
integer x = 37
integer y = 40
integer width = 3319
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 32896
long backcolor = 12639424
string text = "  Actualizar WEB Pagos"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_actualizar_web_pagos
integer x = 1806
integer y = 1704
integer width = 229
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type cb_3 from commandbutton within w_actualizar_web_pagos
integer x = 1595
integer y = 1704
integer width = 206
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string 	ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_actualizar_web_pagos
integer x = 1349
integer y = 1704
integer width = 242
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()

end event

type cb_exportar from commandbutton within w_actualizar_web_pagos
integer x = 1102
integer y = 1704
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_DWToExcel(dw_lista)
end if
end event

type cb_actualizar from commandbutton within w_actualizar_web_pagos
integer x = 37
integer y = 1688
integer width = 320
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;Long		ll_fila,ll_tot_reg,ll_indi,ll_est_reg,ll_cupon,ll_grupo,ll_count=0
String		ls_base,ls_serie
Double	ll_numero

ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ll_fila 		= dw_lista.Find("est_reg = 0", 1, ll_tot_reg)
	if ll_fila = 0 then
		messagebox("Advertencia","Debe Seleccionar por lo Menos UN Registro para Actualizar Pago")
	else
		for ll_indi=ll_fila to ll_tot_reg
			ll_est_reg	= dw_lista.getitemnumber(ll_indi,'est_reg')
			if ll_est_reg = 0 then
				ls_base		= dw_lista.getitemstring(ll_indi,'base')
				ls_serie		= dw_lista.getitemstring(ll_indi,'serie')
				ll_numero	= dw_lista.getitemnumber(ll_indi,'numero')
				ll_cupon		= dw_lista.getitemnumber(ll_indi,'numero_cupon')
				ll_grupo		= dw_lista.getitemnumber(ll_indi,'grupo')
				DECLARE sp_web_pago_actualizar PROCEDURE FOR sp_web_pago_actualizar( :ls_base, :ls_serie, :ll_numero, :ll_cupon, :ll_grupo);
    			EXECUTE sp_web_pago_actualizar;
				ll_count ++
			end if
		next
		if ll_count > 0 then
			messagebox("Actualizar","Se realizó "+string(ll_count)+" Actualización WEB Pagos")
			ll_tot_reg	= dw_lista.retrieve()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					dw_lista.setitem(ll_indi,'est_reg',1)
				next
				dw_lista.accepttext()
			else
				messagebox("Advetencia","No Registra Dato... para Actualizar Pago")
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_actualizar_web_pagos
integer x = 3035
integer y = 1688
integer width = 320
integer height = 112
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualizar_web_pagos)
end event

type dw_lista from datawindow within w_actualizar_web_pagos
integer x = 37
integer y = 136
integer width = 3319
integer height = 1508
integer taborder = 10
string title = "Actualizar WEB Pagos"
string dataobject = "dw_lista_detalle_web_pagos_actualizar"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_actualizar_web_pagos
integer x = 1079
integer y = 1656
integer width = 983
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

