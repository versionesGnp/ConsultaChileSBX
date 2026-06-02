forward
global type w_mantenedor_fune_diac_parques from window
end type
type cb_filtrar from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_sort from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_imprimir from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_exportar from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_cerrar from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_limpiar from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_nuevo from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_eliminar from commandbutton within w_mantenedor_fune_diac_parques
end type
type cb_grabar from commandbutton within w_mantenedor_fune_diac_parques
end type
type rb_diacono from radiobutton within w_mantenedor_fune_diac_parques
end type
type rb_funeraria from radiobutton within w_mantenedor_fune_diac_parques
end type
type rb_parque from radiobutton within w_mantenedor_fune_diac_parques
end type
type dw_lista from datawindow within w_mantenedor_fune_diac_parques
end type
type gb_1 from groupbox within w_mantenedor_fune_diac_parques
end type
type gb_2 from groupbox within w_mantenedor_fune_diac_parques
end type
end forward

global type w_mantenedor_fune_diac_parques from window
integer width = 3077
integer height = 1808
boolean titlebar = true
string title = "Mantenedor de Tablas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
cb_nuevo cb_nuevo
cb_eliminar cb_eliminar
cb_grabar cb_grabar
rb_diacono rb_diacono
rb_funeraria rb_funeraria
rb_parque rb_parque
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_mantenedor_fune_diac_parques w_mantenedor_fune_diac_parques

event open;gf_centrar(w_mantenedor_fune_diac_parques)
if gs_depto='I' then
	cb_eliminar.enabled	= true
else
	cb_eliminar.enabled	= false
end if
rb_parque.triggerevent(clicked!)

end event

on w_mantenedor_fune_diac_parques.create
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.cb_nuevo=create cb_nuevo
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.rb_diacono=create rb_diacono
this.rb_funeraria=create rb_funeraria
this.rb_parque=create rb_parque
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_filtrar,&
this.cb_sort,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_cerrar,&
this.cb_limpiar,&
this.cb_nuevo,&
this.cb_eliminar,&
this.cb_grabar,&
this.rb_diacono,&
this.rb_funeraria,&
this.rb_parque,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_mantenedor_fune_diac_parques.destroy
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.cb_nuevo)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.rb_diacono)
destroy(this.rb_funeraria)
destroy(this.rb_parque)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_filtrar from commandbutton within w_mantenedor_fune_diac_parques
event ue_mousemove pbm_mousemove
integer x = 2318
integer y = 1560
integer width = 178
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_mantenedor_fune_diac_parques
event ue_mousemove pbm_mousemove
integer x = 2089
integer y = 1560
integer width = 224
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_imprimir from commandbutton within w_mantenedor_fune_diac_parques
event ue_mousemove pbm_mousemove
integer x = 1623
integer y = 1560
integer width = 219
integer height = 88
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
	dw_lista.object.datawindow.print.Preview	= true
	if dw_lista.dataobject='dw_mantenedor_funerarias' then
		dw_lista.object.datawindow.zoom			= 83
	end if
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if

end event

type cb_exportar from commandbutton within w_mantenedor_fune_diac_parques
event ue_mousemove pbm_mousemove
integer x = 1861
integer y = 1560
integer width = 224
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_cerrar from commandbutton within w_mantenedor_fune_diac_parques
integer x = 2715
integer y = 1560
integer width = 311
integer height = 92
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenedor_fune_diac_parques)
end event

type cb_limpiar from commandbutton within w_mantenedor_fune_diac_parques
integer x = 965
integer y = 1560
integer width = 270
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;rb_parque.triggerevent(clicked!)
end event

type cb_nuevo from commandbutton within w_mantenedor_fune_diac_parques
integer x = 361
integer y = 1560
integer width = 270
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long		ll_new,ll_indi,ll_tot_reg,ll_cod_parque,ll_grupo,ll_rut
String	ls_pasa,ls_nombre,ls_ciudad,ls_dv,ls_direccion,ls_comuna,ls_sigla,ls_contacto,&
			ls_fono,ls_fax,ls_email,ls_ap_pat,ls_ap_mat

ls_pasa		= 'S'
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		if rb_parque.checked=true then //dw_mantenedor_parques
			ll_cod_parque	= dw_lista.getitemnumber(ll_indi,'codigo')
			ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
			ls_ciudad		= dw_lista.getitemstring(ll_indi,'ciudad')
			ll_grupo			= dw_lista.getitemnumber(ll_indi,'grupo')
			if isnull(ll_cod_parque) or ll_cod_parque=0 then
				messagebox("Advertencia","Debe Ingresar Código de Parque en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('codigo')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre o Razón Social del Parque en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad de Ubicación del Parque en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ciudad')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ll_grupo) then
				messagebox("Advertencia","Debe Ingresar Si el Parque En Fila Nº  "+string(ll_indi,'###,###,###,###')+"  es Nuestro (Inmobiliaria Parque)")
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('grupo')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			end if
		elseif rb_funeraria.checked=true then //dw_mantenedor_funerarias
			ll_rut			= dw_lista.getitemnumber(ll_indi,'rut')
			ls_dv				= dw_lista.getitemstring(ll_indi,'dv')
			ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
			ls_direccion	= dw_lista.getitemstring(ll_indi,'direccion')
			ls_ciudad		= dw_lista.getitemstring(ll_indi,'ciudad')
			ls_comuna		= dw_lista.getitemstring(ll_indi,'comuna')
			ls_sigla			= dw_lista.getitemstring(ll_indi,'sigla')
			ls_contacto		= dw_lista.getitemstring(ll_indi,'contacto')
			ls_fono			= dw_lista.getitemstring(ll_indi,'fono')
			ls_fax			= dw_lista.getitemstring(ll_indi,'fax')
			ls_email			= dw_lista.getitemstring(ll_indi,'email')
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('rut')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('dv')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_direccion) or ls_direccion='' then
				messagebox("Advertencia","Debe Ingresar Dirección en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('direccion')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ciudad')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_comuna) or ls_comuna='' then
				messagebox("Advertencia","Debe Ingresar Comuna en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('comuna')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_sigla) or ls_sigla='' then
				messagebox("Advertencia","Debe Ingresar Sigla en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('sigla')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_contacto) or ls_contacto='' then
				messagebox("Advertencia","Debe Ingresar Contacto en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('contacto')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono) or ls_fono='' then
				messagebox("Advertencia","Debe Ingresar Fono en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fono')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fax) or ls_fax='' then
				messagebox("Advertencia","Debe Ingresar Fax en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fax')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_email) or ls_email='' then
				messagebox("Advertencia","Debe Ingresar E-Mail en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('email')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			end if

		elseif rb_diacono.checked=true then //dw_mantenedor_diaconos
			ll_rut			= dw_lista.getitemnumber(ll_indi,'rut_diacono')
			ls_dv				= dw_lista.getitemstring(ll_indi,'dv_diacono')
			ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
			ls_ap_pat		= dw_lista.getitemstring(ll_indi,'ap_paterno')
			ls_ap_mat		= dw_lista.getitemstring(ll_indi,'ap_materno')
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('rut_diacono')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('dv_diacono')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ap_paterno')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ap_materno')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			end if
		end if
	next
end if
if ls_pasa='S' then
	ll_new		= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new)
	if rb_parque.checked=true then
		dw_lista.setitem(ll_new,'porce_cierre',0)
		dw_lista.setitem(ll_new,'grupo',0)
		dw_lista.setcolumn('codigo')
	elseif rb_funeraria.checked=true then
		dw_lista.setcolumn('rut')
	elseif rb_diacono.checked=true then
		dw_lista.setcolumn('rut_diacono')
	end if
	dw_lista.accepttext()
	dw_lista.setfocus()
end if
end event

type cb_eliminar from commandbutton within w_mantenedor_fune_diac_parques
integer x = 635
integer y = 1560
integer width = 270
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_res,ll_cod_parque,ll_indi,ll_rut
String	ls_parque,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat

ll_indi					= dw_lista.getrow()
if ll_indi > 0 then
	if rb_parque.checked=true then //dw_mantenedor_parques
		ll_cod_parque	= dw_lista.getitemnumber(ll_indi,'codigo')
		ls_parque		= dw_lista.getitemstring(ll_indi,'nombre')
		ll_res			= messagebox("Advertencia","Está Seguro de Eliminar Parque "+string(ll_cod_parque)+' '+ls_parque)

	elseif rb_funeraria.checked=true then //dw_mantenedor_funerarias
		ll_rut			= dw_lista.getitemnumber(ll_indi,'rut')
		ls_dv				= dw_lista.getitemstring(ll_indi,'dv')
		ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
		ll_res			= messagebox("Advertencia","Está Seguro de Eliminar Funeraria "+string(ll_rut,'###,###,###,###')+'-'+ls_dv+'  '+ls_nombre)
		
	elseif rb_diacono.checked=true then //dw_mantenedor_diaconos
		ll_rut			= dw_lista.getitemnumber(ll_indi,'rut_diacono')
		ls_dv				= dw_lista.getitemstring(ll_indi,'dv_diacono')
		ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
		ls_ap_pat		= dw_lista.getitemstring(ll_indi,'ap_paterno')
		ls_ap_mat		= dw_lista.getitemstring(ll_indi,'ap_materno')
		ll_res			= messagebox("Advertencia","Está Seguro de Eliminar Diacono "+string(ll_rut,'###,###,###,###')+'-'+ls_dv+'  '+ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat)
	end if
	if ll_res=1 then
		dw_lista.deleterow(ll_indi)
		messagebox("Eliminar","Recuerde Grabar los Cambios")
	elseif isnull(ll_res) then
		dw_lista.deleterow(ll_indi)
		messagebox("Eliminar","Recuerde Grabar los Cambios")
	end if
	dw_lista.accepttext()
end if
end event

type cb_grabar from commandbutton within w_mantenedor_fune_diac_parques
integer x = 37
integer y = 1560
integer width = 270
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_new,ll_indi,ll_tot_reg,ll_cod_parque,ll_grupo,ll_rut
String	ls_pasa,ls_nombre,ls_ciudad,ls_dv,ls_direccion,ls_comuna,ls_sigla,ls_contacto,&
			ls_fono,ls_fax,ls_email,ls_ap_pat,ls_ap_mat
			
ls_pasa		= 'S'
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		if rb_parque.checked=true then //dw_mantenedor_parques
			ll_cod_parque	= dw_lista.getitemnumber(ll_indi,'codigo')
			ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
			ls_ciudad		= dw_lista.getitemstring(ll_indi,'ciudad')
			ll_grupo			= dw_lista.getitemnumber(ll_indi,'grupo')
			if isnull(ll_cod_parque) or ll_cod_parque=0 then
				messagebox("Advertencia","Debe Ingresar Código de Parque en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('codigo')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre o Razón Social del Parque en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad de Ubicación del Parque en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ciudad')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ll_grupo) then
				messagebox("Advertencia","Debe Ingresar Si el Parque En Fila Nº  "+string(ll_indi,'###,###,###,###')+"  es Nuestro (Inmobiliaria Parque)")
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('grupo')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			end if
		elseif rb_funeraria.checked=true then //dw_mantenedor_funerarias
			ll_rut			= dw_lista.getitemnumber(ll_indi,'rut')
			ls_dv				= dw_lista.getitemstring(ll_indi,'dv')
			ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
			ls_direccion	= dw_lista.getitemstring(ll_indi,'direccion')
			ls_ciudad		= dw_lista.getitemstring(ll_indi,'ciudad')
			ls_comuna		= dw_lista.getitemstring(ll_indi,'comuna')
			ls_sigla			= dw_lista.getitemstring(ll_indi,'sigla')
			ls_contacto		= dw_lista.getitemstring(ll_indi,'contacto')
			ls_fono			= dw_lista.getitemstring(ll_indi,'fono')
			ls_fax			= dw_lista.getitemstring(ll_indi,'fax')
			ls_email			= dw_lista.getitemstring(ll_indi,'email')
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('rut')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('dv')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_direccion) or ls_direccion='' then
				messagebox("Advertencia","Debe Ingresar Dirección en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('direccion')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ciudad')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_comuna) or ls_comuna='' then
				messagebox("Advertencia","Debe Ingresar Comuna en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('comuna')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_sigla) or ls_sigla='' then
				messagebox("Advertencia","Debe Ingresar Sigla en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('sigla')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_contacto) or ls_contacto='' then
				messagebox("Advertencia","Debe Ingresar Contacto en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('contacto')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fono) or ls_fono='' then
				messagebox("Advertencia","Debe Ingresar Fono en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fono')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_fax) or ls_fax='' then
				messagebox("Advertencia","Debe Ingresar Fax en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fax')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_email) or ls_email='' then
				messagebox("Advertencia","Debe Ingresar E-Mail en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('email')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			end if

		elseif rb_diacono.checked=true then //dw_mantenedor_diaconos
			ll_rut			= dw_lista.getitemnumber(ll_indi,'rut_diacono')
			ls_dv				= dw_lista.getitemstring(ll_indi,'dv_diacono')
			ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre')
			ls_ap_pat		= dw_lista.getitemstring(ll_indi,'ap_paterno')
			ls_ap_mat		= dw_lista.getitemstring(ll_indi,'ap_materno')
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('rut_diacono')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('dv_diacono')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ap_paterno')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila Nº "+string(ll_indi,'###,###,###,###'))
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ap_materno')
				dw_lista.setfocus()
				ls_pasa		= 'N'
				exit
			end if
		end if
	next
end if
if ls_pasa='S' then
	if dw_lista.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL:  "+sqlca.sqlerrtext)
	end if
end if
end event

type rb_diacono from radiobutton within w_mantenedor_fune_diac_parques
integer x = 2235
integer y = 92
integer width = 471
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Diacono"
end type

event clicked;dw_lista.dataobject	= 'dw_mantenedor_diaconos'
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No Registra Dato")
else
	dw_lista.setfocus()
end if
end event

type rb_funeraria from radiobutton within w_mantenedor_fune_diac_parques
integer x = 1230
integer y = 92
integer width = 471
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Funeraria"
end type

event clicked;String	ls_ciudad
dw_lista.dataobject	= 'dw_mantenedor_funerarias'
dw_lista.settransobject(sqlca)
dw_lista.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No Registra Dato")
else
	dw_lista.setfocus()
	ls_ciudad	= dw_lista.getitemstring(1,'ciudad')
	idw_detalle.retrieve(ls_ciudad)
end if
end event

type rb_parque from radiobutton within w_mantenedor_fune_diac_parques
integer x = 224
integer y = 92
integer width = 471
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Parque"
boolean checked = true
end type

event clicked;dw_lista.dataobject	= 'dw_mantenedor_parques'
dw_lista.settransobject(sqlca)
if dw_lista.retrieve()=0 then
	messagebox("Advertencia","No Registra Dato")
else
	dw_lista.setfocus()
end if
end event

type dw_lista from datawindow within w_mantenedor_fune_diac_parques
integer x = 41
integer y = 220
integer width = 2976
integer height = 1280
integer taborder = 10
string dataobject = "dw_mantenedor_funerarias"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event itemchanged;String	ls_columna,ls_ciudad

ls_columna		= dwo.name
if ls_columna='ciudad' and dw_lista.dataobject='dw_mantenedor_funerarias' then
	ls_ciudad	= dw_lista.getitemstring(row,'ciudad')
	idw_detalle.retrieve(ls_ciudad)
end if
end event

type gb_1 from groupbox within w_mantenedor_fune_diac_parques
integer x = 41
integer y = 16
integer width = 2976
integer height = 188
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

type gb_2 from groupbox within w_mantenedor_fune_diac_parques
event ue_mousemove pbm_mousemove
integer x = 1595
integer y = 1508
integer width = 928
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

