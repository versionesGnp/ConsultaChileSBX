forward
global type w_validar_beneficiarios from window
end type
type cb_limpiar from commandbutton within w_validar_beneficiarios
end type
type cb_6 from commandbutton within w_validar_beneficiarios
end type
type cb_5 from commandbutton within w_validar_beneficiarios
end type
type cb_3 from commandbutton within w_validar_beneficiarios
end type
type cb_4 from commandbutton within w_validar_beneficiarios
end type
type cb_eliminar from commandbutton within w_validar_beneficiarios
end type
type cb_nuevo from commandbutton within w_validar_beneficiarios
end type
type cb_cerrar from commandbutton within w_validar_beneficiarios
end type
type cb_grabar from commandbutton within w_validar_beneficiarios
end type
type dw_lista from datawindow within w_validar_beneficiarios
end type
type gb_1 from groupbox within w_validar_beneficiarios
end type
end forward

global type w_validar_beneficiarios from window
integer width = 3461
integer height = 1856
boolean titlebar = true
string title = "Validar Beneficiarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cb_6 cb_6
cb_5 cb_5
cb_3 cb_3
cb_4 cb_4
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_lista dw_lista
gb_1 gb_1
end type
global w_validar_beneficiarios w_validar_beneficiarios

type variables
String		is_base,is_serie
Long		il_row
Double	il_numero
end variables

on w_validar_beneficiarios.create
this.cb_limpiar=create cb_limpiar
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_limpiar,&
this.cb_6,&
this.cb_5,&
this.cb_3,&
this.cb_4,&
this.cb_eliminar,&
this.cb_nuevo,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_lista,&
this.gb_1}
end on

on w_validar_beneficiarios.destroy
destroy(this.cb_limpiar)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_validar_beneficiarios)

is_base		= substr(1,1,Message.StringParm)
is_serie		= substr(1,2,Message.StringParm)
il_numero 	= Double(substr(1,3,Message.StringParm))
dw_lista.settransobject(sqlca)
if dw_lista.retrieve(is_base,is_serie,il_numero)=0 then
	cb_nuevo.triggerevent(clicked!)
end if


end event

type cb_limpiar from commandbutton within w_validar_beneficiarios
integer x = 2290
integer y = 1624
integer width = 261
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long	ll_res

if dw_lista.rowcount() > 0 then
	ll_res	= messagebox("Advertencia","Existe Dato(s) en Lista... Recuerde Grabar los Cambios!!!, Está seguro(a) de Limpiar",Exclamation!,YesNo!,2)
	if ll_res = 1 then
		dw_lista.reset()
	end if
else
	dw_lista.reset()
end if
end event

type cb_6 from commandbutton within w_validar_beneficiarios
integer x = 1221
integer y = 1624
integer width = 238
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )
end event

type cb_5 from commandbutton within w_validar_beneficiarios
integer x = 1966
integer y = 1624
integer width = 229
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_validar_beneficiarios
integer x = 1719
integer y = 1624
integer width = 238
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_4 from commandbutton within w_validar_beneficiarios
integer x = 1486
integer y = 1624
integer width = 224
integer height = 92
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
Setnull (nulo)
dw_lista.setsort(nulo)
dw_lista.sort()




end event

type cb_eliminar from commandbutton within w_validar_beneficiarios
integer x = 818
integer y = 1620
integer width = 306
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long	ll_resp
if il_row > 0 and dw_lista.rowcount() > 0 then
	ll_resp	= messagebox("Eliminar","Está Seguro Eliminar Beneficiario en Fila Nº "+string(il_row),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista.deleterow(il_row)
		if dw_lista.update()=1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_nuevo from commandbutton within w_validar_beneficiarios
integer x = 421
integer y = 1620
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long		ll_new,ll_indi,ll_tot_reg,ll_rut,ll_cod_seg_det
String	ls_pasa,ls_dv,ls_cod_parentesco
Date		ld_fecha

dw_lista.accepttext()
ll_tot_reg					= dw_lista.rowcount()
ls_pasa						= 'S'
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
		ls_dv					= dw_lista.getitemstring(ll_indi,'dv')
		ll_cod_seg_det		= dw_lista.getitemnumber(ll_indi,'tipo_seguro')
		ls_cod_parentesco	= dw_lista.getitemstring(ll_indi,'cod_parentesco')
		ld_fecha				= date(dw_lista.getitemdatetime(ll_indi,'fecha_nac'))
		if ll_rut = 0 or isnull(ll_rut) then
			messagebox("Advertencia","Debe Ingresar Rut Válido en Fila Nº "+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('rut')
			ls_pasa			= 'N'
			exit
		elseif ls_dv='' or isnull(ls_dv) then
			messagebox('Advertencia','Digito Verificador Inválido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('dv')
			ls_pasa			= 'N'
			exit
		elseif ll_cod_seg_det=0 or isnull(ll_cod_seg_det) then
			messagebox('Advertencia','Debe Ingresar Tipo Seguro Válido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('tipo_seguro')
			ls_pasa			= 'N'
			exit
		elseif (ls_cod_parentesco='' or isnull(ls_cod_parentesco)) and ll_cod_seg_det=1 then
			messagebox('Advertencia','Debe Ingresar Parentesco Válido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('cod_parentesco')
			ls_pasa			= 'N'
			exit
		elseif isnull(ld_fecha) and ll_cod_seg_det=1 then
			messagebox('Advertencia','Debe Ingresar Fecha Nacimiento Válido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('fecha_nac')
			ls_pasa			= 'N'
			exit
		end if
	next
end if
if ls_pasa='S' then
	ll_new					= dw_lista.insertrow(0)
	dw_lista.setitem(ll_new,'base',is_base)
	dw_lista.setitem(ll_new,'serie',is_serie)
	dw_lista.setitem(ll_new,'numero',il_numero)
	dw_lista.accepttext()
	dw_lista.setfocus()
	dw_lista.scrolltorow(ll_new)
	dw_lista.setcolumn('rut')
end if
end event

type cb_cerrar from commandbutton within w_validar_beneficiarios
integer x = 3086
integer y = 1620
integer width = 297
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_validar_beneficiarios)
end event

type cb_grabar from commandbutton within w_validar_beneficiarios
integer x = 32
integer y = 1620
integer width = 297
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_new,ll_indi,ll_tot_reg,ll_rut,ll_cod_seg_det,ll_res
String	ls_pasa,ls_dv,ls_cod_parentesco
Date		ld_fecha

dw_lista.accepttext()
ll_tot_reg					= dw_lista.rowcount()
ls_pasa						= 'S'
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
		ls_dv					= dw_lista.getitemstring(ll_indi,'dv')
		ll_cod_seg_det		= dw_lista.getitemnumber(ll_indi,'tipo_seguro')
		ls_cod_parentesco	= dw_lista.getitemstring(ll_indi,'cod_parentesco')
		ld_fecha				= date(dw_lista.getitemdatetime(ll_indi,'fecha_nac'))
		if ll_rut = 0 or isnull(ll_rut) then
			messagebox("Advertencia","Debe Ingresar Rut Válido en Fila Nº "+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('rut')
			ls_pasa			= 'N'
			exit
		elseif ls_dv='' or isnull(ls_dv) then
			messagebox('Advertencia','Digito Verificador Inválido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('dv')
			ls_pasa			= 'N'
			exit
		elseif ll_cod_seg_det=0 or isnull(ll_cod_seg_det) then
			messagebox('Advertencia','Debe Ingresar Tipo Seguro Válido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('tipo_seguro')
			ls_pasa			= 'N'
			exit
		elseif (ls_cod_parentesco='' or isnull(ls_cod_parentesco)) and ll_cod_seg_det=1 then
			messagebox('Advertencia','Debe Ingresar Parentesco Válido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('cod_parentesco')
			ls_pasa			= 'N'
			exit
		elseif isnull(ld_fecha) and ll_cod_seg_det=1 then
			messagebox('Advertencia','Debe Ingresar Fecha Nacimiento Válido en Fila Nº '+string(ll_indi))
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('fecha_nac')
			ls_pasa			= 'N'
			exit
		end if
	next
end if
if ls_pasa='S' then
	for ll_indi=1 to ll_tot_reg
		dw_lista.setitem(ll_indi,'orden',ll_indi)
	next
	dw_lista.accepttext()
	if dw_lista.update()=1 then
		commit;
		ll_res					= messagebox("Grabar","Grabación Exitosa, desea Cerrar Ventana",exclamation!,YesNo!,2)
		if ll_res=1 then
			close(w_validar_beneficiarios)
		end if
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type dw_lista from datawindow within w_validar_beneficiarios
integer x = 32
integer y = 44
integer width = 3374
integer height = 1532
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_validador_beneficiario"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
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

event itemchanged;String	ls_columna,ls_dv,ls_cod_parentesco
Long		ll_rut,ll_cod_seg_det,ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_ano_nac,ll_edad
Date		ld_fecha,ld_fecha_dia,ld_nulo

dw_lista.accepttext()
SetNull(ld_nulo)
ls_columna	= dwo.name
il_row		= row
if ls_columna='rut' or ls_columna='dv' then
	ll_rut	= dw_lista.getitemnumber(il_row,'rut')
	ls_dv		= dw_lista.getitemstring(il_row,'dv')
	if ll_rut > 0 and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido')
			dw_lista.setfocus()
			dw_lista.setcolumn('dv')
		end if
	end if
		
elseif ls_columna='fecha_nac' then
	ll_cod_seg_det		= dw_lista.getitemnumber(il_row,'tipo_seguro')
	ls_cod_parentesco	= dw_lista.getitemstring(il_row,'cod_parentesco')
	ld_fecha				= date(dw_lista.getitemdatetime(il_row,'fecha_nac'))
	if isvalid(w_validar_promesa_operaciones) then
		ld_fecha_dia	= date(w_validar_promesa_operaciones.dw_revision.getitemdatetime(1,'fecha_ctto'))
	else
		ld_fecha_dia	= date(gdt_fec_sistema)
	end if
	if not isnull(ld_fecha) then
		if isnull(ll_cod_seg_det) then
			messagebox("Advertencia","Debe Ingresar Tipo de Seguro")
			dw_lista.setfocus()
			dw_lista.setcolumn('tipo_seguro')
		elseif isnull(ls_cod_parentesco) then
			messagebox("Advertencia","Debe Ingresar Parentesco")
			dw_lista.setfocus()
			dw_lista.setcolumn('cod_parentesco')
		else
//			if ll_cod_seg_det=1 then
				ll_dia_hoy			= day(ld_fecha_dia)
				ll_dia_nac			= day(ld_fecha)
				ll_mes_hoy			= month(ld_fecha_dia)
				ll_mes_nac			= month(ld_fecha)
				ll_ano_hoy			= year(ld_fecha_dia)
				ll_ano_nac			= year(ld_fecha)
				ll_edad				= ll_ano_hoy - ll_ano_nac
				if ll_mes_hoy > ll_mes_nac then
					ll_edad ++
				elseif ll_mes_hoy = ll_mes_nac then
					if ll_dia_hoy >= ll_dia_nac then
						ll_edad ++
					end if
				end if
				if ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 76) then
					messagebox("Advertencia","Edad de Conyuge debe ser Mayor 18 y Menor 76 años")
					dw_lista.setitem(row,'fecha_nac',ld_nulo)
				elseif ls_cod_parentesco='3' and ll_edad > 24 then
					messagebox("Advertencia","Edad de Hijo(a) No debe ser Mayor a 24 años")
					dw_lista.setitem(row,'fecha_nac',ld_nulo)
				end if
//			end if
		end if
	else
		messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Válida")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_nac')
	end if
end if
end event

event itemfocuschanged;String	ls_columna,ls_dv,ls_cod_parentesco,ls_nulo
Long		ll_rut,ll_cod_seg_det,ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_ano_nac,ll_edad,ll_nulo
Date		ld_fecha,ld_fecha_dia,ld_nulo

dw_lista.accepttext()
SetNull(ld_nulo)
SetNull(ls_nulo)
ls_columna	= dwo.name
il_row		= row
if ls_columna<>'rut' and ls_columna<>'dv' then
	ll_rut	= dw_lista.getitemnumber(il_row,'rut')
	ls_dv		= dw_lista.getitemstring(il_row,'dv')
	if ll_rut > 0 and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			dw_lista.setfocus()
			dw_lista.setitem(il_row,'dv',ls_nulo)
			dw_lista.setcolumn('dv')
		end if
	else
		dw_lista.setfocus()
		dw_lista.setitem(il_row,'dv',ls_nulo)
		dw_lista.setcolumn('rut')
	end if
end if		
if ls_columna <> 'fecha_nac' then
	ll_cod_seg_det		= dw_lista.getitemnumber(il_row,'tipo_seguro')
	ls_cod_parentesco	= dw_lista.getitemstring(il_row,'cod_parentesco')
	ld_fecha				= date(dw_lista.getitemdatetime(il_row,'fecha_nac'))
	if isvalid(w_validar_promesa_operaciones) then
		ld_fecha_dia	= date(w_validar_promesa_operaciones.dw_revision.getitemdatetime(1,'fecha_ctto'))
	else
		ld_fecha_dia	= date(gdt_fec_sistema)
	end if
	if not isnull(ld_fecha) then
//		if ll_cod_seg_det=1 then
			ll_dia_hoy			= day(ld_fecha_dia)
			ll_dia_nac			= day(ld_fecha)
			ll_mes_hoy			= month(ld_fecha_dia)
			ll_mes_nac			= month(ld_fecha)
			ll_ano_hoy			= year(ld_fecha_dia)
			ll_ano_nac			= year(ld_fecha)
			ll_edad				= ll_ano_hoy - ll_ano_nac
			if ll_mes_hoy > ll_mes_nac then
				ll_edad ++
			elseif ll_mes_hoy = ll_mes_nac then
				if ll_dia_hoy >= ll_dia_nac then
					ll_edad ++
				end if
			end if
			if ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 76) then
				dw_lista.setitem(il_row,'fecha_nac',ld_nulo)
				dw_lista.setfocus()
				dw_lista.scrolltorow(il_row)
				dw_lista.setcolumn('fecha_nac')
			elseif ls_cod_parentesco='3' and ll_edad > 24 then
				dw_lista.setitem(il_row,'fecha_nac',ld_nulo)
				dw_lista.setfocus()
				dw_lista.scrolltorow(il_row)
				dw_lista.setcolumn('fecha_nac')
			end if
//		end if
	end if
end if
dw_lista.accepttext()
end event

type gb_1 from groupbox within w_validar_beneficiarios
integer x = 1198
integer y = 1576
integer width = 1019
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

