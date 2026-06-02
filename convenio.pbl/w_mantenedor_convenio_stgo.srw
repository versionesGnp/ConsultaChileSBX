forward
global type w_mantenedor_convenio_stgo from window
end type
type cb_5 from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_filtrar from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_ordenar from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_exportar from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_nuevo from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_cerrar from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_eliminar from commandbutton within w_mantenedor_convenio_stgo
end type
type cb_grabar from commandbutton within w_mantenedor_convenio_stgo
end type
type dw_lista from datawindow within w_mantenedor_convenio_stgo
end type
type gb_2 from groupbox within w_mantenedor_convenio_stgo
end type
end forward

global type w_mantenedor_convenio_stgo from window
integer width = 4178
integer height = 2716
boolean titlebar = true
string title = "Mantenedor Convenios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_5 cb_5
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_nuevo cb_nuevo
cb_cerrar cb_cerrar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
dw_lista dw_lista
gb_2 gb_2
end type
global w_mantenedor_convenio_stgo w_mantenedor_convenio_stgo

type variables
Long		il_row,il_tot_reg,il_mod
String	MenuHabilitado
end variables

on w_mantenedor_convenio_stgo.create
this.cb_5=create cb_5
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_nuevo=create cb_nuevo
this.cb_cerrar=create cb_cerrar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.Control[]={this.cb_5,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_nuevo,&
this.cb_cerrar,&
this.cb_eliminar,&
this.cb_grabar,&
this.dw_lista,&
this.gb_2}
end on

on w_mantenedor_convenio_stgo.destroy
destroy(this.cb_5)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_nuevo)
destroy(this.cb_cerrar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
destroy(this.gb_2)
end on

event open;gf_centrar(w_mantenedor_convenio_stgo)
il_mod		= 0
dw_lista.settransobject(sqlca)
il_tot_reg	= dw_lista.retrieve()
if il_tot_reg=0 then
	messagebox("Advertencia","No Registra Dato")
end if
end event

type cb_5 from commandbutton within w_mantenedor_convenio_stgo
integer x = 2971
integer y = 2464
integer width = 229
integer height = 84
integer taborder = 80
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

type cb_filtrar from commandbutton within w_mantenedor_convenio_stgo
integer x = 2761
integer y = 2464
integer width = 206
integer height = 84
integer taborder = 70
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
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_mantenedor_convenio_stgo
integer x = 2514
integer y = 2464
integer width = 242
integer height = 84
integer taborder = 60
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

type cb_exportar from commandbutton within w_mantenedor_convenio_stgo
integer x = 2267
integer y = 2464
integer width = 242
integer height = 84
integer taborder = 50
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

type cb_nuevo from commandbutton within w_mantenedor_convenio_stgo
integer x = 631
integer y = 2448
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long	ll_tot_reg,ll_fila,ll_new

ll_tot_reg	= dw_lista.rowcount()
ll_fila		= dw_lista.Find("isnull(cod_convenio)", 1, ll_tot_reg)
if ll_fila > 0 then
	messagebox("Advertencia","No es Posible Crear Nuevo Convenio debe Completar Convenio en Fila Nº "+string(ll_fila))
	dw_lista.scrolltorow(ll_fila)
	dw_lista.setfocus()
else
	ll_new	= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new)
	dw_lista.setfocus()
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_convenio_stgo
integer x = 3785
integer y = 2448
integer width = 343
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Long	ll_res
if il_tot_reg <> dw_lista.rowcount() or il_mod > 0  then
	ll_res	= messagebox("Advertencia","Antes de Cerrar, desea Grabar Cambios realizados",Exclamation!,YesNo!,2)
	if ll_res=1 then
		cb_grabar.triggerevent(clicked!)
	else
		close(w_mantenedor_convenio_stgo)
	end if
else
	close(w_mantenedor_convenio_stgo)
end if
end event

type cb_eliminar from commandbutton within w_mantenedor_convenio_stgo
integer x = 978
integer y = 2448
integer width = 343
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_codigo,ll_res

if il_row > 0 then
	ll_codigo	= dw_lista.getitemnumber(il_row,'cod_convenio')
	ll_res		= messagebox("Advertencia","Está Seguro de Eliminar Convenio Nº "+string(ll_codigo)+ ", recuerde Grabar los Cambios",Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_lista.deleterow(il_row)
		dw_lista.scrolltorow(1)
	end if
end if
end event

type cb_grabar from commandbutton within w_mantenedor_convenio_stgo
integer x = 32
integer y = 2448
integer width = 288
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_codigo,ll_error
Double	ldb_valor
String	ls_glosa,ls_estado,ls_moneda,ls_direc,ls_fono,ls_notas,ls_contacto
ll_tot_reg				= dw_lista.rowcount()
if ll_tot_reg > 0 then
	ll_error				= 0
	for ll_indi=1 to ll_tot_reg
		ll_codigo		= dw_lista.getitemnumber(ll_indi,'cod_convenio')
		ls_glosa			= dw_lista.getitemstring(ll_indi,'glosa')
		ls_estado		= dw_lista.getitemstring(ll_indi,'estado')
		ls_moneda		= dw_lista.getitemstring(ll_indi,'moneda')
		ldb_valor		= dw_lista.getitemnumber(ll_indi,'valor')
		ls_direc			= dw_lista.getitemstring(ll_indi,'direccion')
		ls_fono			= dw_lista.getitemstring(ll_indi,'fono')
		ls_notas			= dw_lista.getitemstring(ll_indi,'notas')
		ls_contacto	= dw_lista.getitemstring(ll_indi,'contacto')
		if isnull(ll_codigo) then
			messagebox("Advertencia","Debe Ingresar Codigo Convenio en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('cod_convenio')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_glosa) then
			messagebox("Advertencia","Debe Ingresar Glosa en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('glosa')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_estado) then
			messagebox("Advertencia","Debe Ingresar Estado en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('estado')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_moneda) then
			messagebox("Advertencia","Debe Ingresar Moneda en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('moneda')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ldb_valor) then
			messagebox("Advertencia","Debe Ingresar Valor en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('valor')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_direc) then
			messagebox("Advertencia","Debe Ingresar Dirección en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('direccion')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_fono) then
			messagebox("Advertencia","Debe Ingresar Fono en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('fono')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_notas) then
			messagebox("Advertencia","Debe Ingresar Nota en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('notas')
			dw_lista.setfocus()
			ll_error ++
			exit
		elseif isnull(ls_contacto) then
			messagebox("Advertencia","Debe Ingresar Contacto en Fila Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('contacto')
			dw_lista.setfocus()
			ll_error ++
			exit
		end if
	next
	if ll_error=0 then
		if dw_lista.update()=1 then
			commit;
			il_tot_reg	= dw_lista.rowcount()
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar CONVENIO SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type dw_lista from datawindow within w_mantenedor_convenio_stgo
integer x = 32
integer y = 36
integer width = 4096
integer height = 2368
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_convenio_stgo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rbuttondown;if row>0 then
	il_row		= row
	m_convenio Menu
	Menu 			= Create m_convenio
	Menu.m_opciones.m_insertar.Visible 		= (Mid(MenuHabilitado, 1, 1) = "0")
	Menu.m_opciones.m_eliminar.Visible 		= (Mid(MenuHabilitado, 2, 1) = "0")
	Menu.m_opciones.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
end if


//if row>0 then
//	il_row		= row
//	m_gestiones_popup Menu
//	Menu = Create m_gestiones_popup
//	Menu.m_popup.m_ingresargestiontelefonica.Visible 		= (Mid(MenuHabilitado, 1, 1) = "0")
//	Menu.m_popup.m_ingresarenviocarta.Visible 				= (Mid(MenuHabilitado, 2, 1) = "0")
//	Menu.m_popup.m_ingresargestionatencionpublico.Visible = (Mid(MenuHabilitado, 3, 1) = "0")
//	//menu.dw_paso = This
//	Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
//end if
end event

event constructor;MenuHabilitado	= '00'
end event

event itemchanged;il_mod ++
end event

type gb_2 from groupbox within w_mantenedor_convenio_stgo
integer x = 2245
integer y = 2412
integer width = 978
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

