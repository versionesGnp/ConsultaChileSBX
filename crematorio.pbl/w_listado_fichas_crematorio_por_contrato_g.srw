forward
global type w_listado_fichas_crematorio_por_contrato_g from window
end type
type cb_aceptar from commandbutton within w_listado_fichas_crematorio_por_contrato_g
end type
type cb_1 from commandbutton within w_listado_fichas_crematorio_por_contrato_g
end type
type cb_2 from commandbutton within w_listado_fichas_crematorio_por_contrato_g
end type
type cb_3 from commandbutton within w_listado_fichas_crematorio_por_contrato_g
end type
type cb_imprimir from commandbutton within w_listado_fichas_crematorio_por_contrato_g
end type
type cb_cerrar from commandbutton within w_listado_fichas_crematorio_por_contrato_g
end type
type dw_lista from datawindow within w_listado_fichas_crematorio_por_contrato_g
end type
type gb_1 from groupbox within w_listado_fichas_crematorio_por_contrato_g
end type
end forward

global type w_listado_fichas_crematorio_por_contrato_g from window
integer width = 3799
integer height = 1644
boolean titlebar = true
string title = "Listado Fichas de Cremación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_aceptar cb_aceptar
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_listado_fichas_crematorio_por_contrato_g w_listado_fichas_crematorio_por_contrato_g

type variables
String		is_base, is_serie
Double	il_numero
end variables

on w_listado_fichas_crematorio_por_contrato_g.create
this.cb_aceptar=create cb_aceptar
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_aceptar,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_listado_fichas_crematorio_por_contrato_g.destroy
destroy(this.cb_aceptar)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_listado_fichas_crematorio_por_contrato_g)
dw_lista.settransobject(sqlca)

is_base 										= trim(substr(1,1,Message.StringParm))
is_serie										= trim(substr(1,2,Message.StringParm))
il_numero									= Double(substr(1,3,Message.StringParm))
this.title										= 'Listado Fichas de Cremación Asociado Contrato '+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###')
if dw_lista.retrieve(is_base, is_serie, il_numero)=0 then 
	messagebox("Advertencia","No Registra Ficha Crematorio Cotrato "+is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###'))
	close(w_listado_fichas_crematorio_por_contrato_g)
end if
end event

event close;if isvalid(w_ficha_crematorio) then close(w_ficha_crematorio)
end event

type cb_aceptar from commandbutton within w_listado_fichas_crematorio_por_contrato_g
integer x = 32
integer y = 1408
integer width = 297
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_fila
Double	ll_folio

ll_fila																									= dw_lista.getrow()
if ll_fila > 0 then
	ll_folio																							= dw_lista.getitemnumber(ll_fila,'fc_cabecera_folio_crematorio')
	if ll_folio>0 then
		if isvalid(w_ficha_crematorio) then close(w_ficha_crematorio)
		open(w_ficha_crematorio)
		w_ficha_crematorio.rb_buscar_folio.checked										= true
		w_ficha_crematorio.em_folio.text														= string(ll_folio)
		w_ficha_crematorio.pb_aceptar.triggerevent(clicked!)
		if w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.rowcount() > 0 and w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio') > 0 then
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.enabled			= false
			w_ficha_crematorio.tab_crematorio.tabpage_2.dw_fallecido.enabled		= false
			w_ficha_crematorio.tab_crematorio.tabpage_3.dw_titular.enabled		= false
			w_ficha_crematorio.tab_crematorio.tabpage_4.dw_prelacion.enabled	= false
			w_ficha_crematorio.tab_crematorio.tabpage_5.dw_aranceles.enabled	= false
			w_ficha_crematorio.tab_crematorio.tabpage_6.dw_archivos.enabled		= false
			w_ficha_crematorio.tab_crematorio.tabpage_7.dw_ceremonia.enabled	= false
			w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.enabled		= false
			w_ficha_crematorio.ddplb_tipo_venta.enabled									= false
			w_ficha_crematorio.rb_buscar_ctto.enabled										= false
			w_ficha_crematorio.dw_ctto.enabled												= false
			w_ficha_crematorio.rb_buscar_folio.enabled									= false
			w_ficha_crematorio.em_folio.enabled												= false
			w_ficha_crematorio.pb_aceptar.enabled											= false
			w_ficha_crematorio.cb_nuevo.enabled											= false
			w_ficha_crematorio.cb_grabar.enabled											= false
			w_ficha_crematorio.cb_buscar.enabled											= false
			w_ficha_crematorio.cb_inactivar.enabled										= false
			w_ficha_crematorio.cb_limpiar.enabled											= false
			w_ficha_crematorio.cb_ficga_traslado.enabled									= false
			w_ficha_crematorio.cb_ctacte.enabled											= false
			w_ficha_crematorio.cb_2.enabled													= false
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setfocus()
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_listado_fichas_crematorio_por_contrato_g
integer x = 1431
integer y = 1412
integer width = 169
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_listado_fichas_crematorio_por_contrato_g
integer x = 1778
integer y = 1412
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_listado_fichas_crematorio_por_contrato_g
integer x = 1605
integer y = 1412
integer width = 169
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo

setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_imprimir from commandbutton within w_listado_fichas_crematorio_por_contrato_g
integer x = 2002
integer y = 1412
integer width = 219
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.print()
end if
end event

type cb_cerrar from commandbutton within w_listado_fichas_crematorio_por_contrato_g
integer x = 3442
integer y = 1408
integer width = 297
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_listado_fichas_crematorio_por_contrato_g)
end event

type dw_lista from datawindow within w_listado_fichas_crematorio_por_contrato_g
integer x = 32
integer y = 84
integer width = 3703
integer height = 1256
integer taborder = 10
string title = "none"
string dataobject = "dw_listado_fichas_crematorio_por_contrato"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type gb_1 from groupbox within w_listado_fichas_crematorio_por_contrato_g
integer x = 1403
integer y = 1348
integer width = 841
integer height = 188
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilitarios"
end type

