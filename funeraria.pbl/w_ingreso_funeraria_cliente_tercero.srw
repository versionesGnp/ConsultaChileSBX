forward
global type w_ingreso_funeraria_cliente_tercero from window
end type
type cb_cerrar from commandbutton within w_ingreso_funeraria_cliente_tercero
end type
type cb_grabar from commandbutton within w_ingreso_funeraria_cliente_tercero
end type
type dw_lista from datawindow within w_ingreso_funeraria_cliente_tercero
end type
end forward

global type w_ingreso_funeraria_cliente_tercero from window
integer width = 3822
integer height = 1508
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_lista dw_lista
end type
global w_ingreso_funeraria_cliente_tercero w_ingreso_funeraria_cliente_tercero

type variables
String		is_base,is_serie
Double	il_numero,il_rut_3ro
Long		il_fila
end variables

on w_ingreso_funeraria_cliente_tercero.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_lista}
end on

on w_ingreso_funeraria_cliente_tercero.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
end on

event open;String		ls_ciudad
Long		ll_new

gf_centrar(w_ingreso_funeraria_cliente_tercero)
is_base		= substr(1,1,message.stringparm)
is_serie		= substr(1,2,message.stringparm)
il_numero	= long(substr(1,3,message.stringparm))
il_rut_3ro	= long(substr(1,4,message.stringparm))
il_fila			= long(substr(1,5,message.stringparm))
dw_lista.settransobject(sqlca)

dw_lista.getchild('comuna_3ro',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

if dw_lista.retrieve(is_base,is_serie,il_numero,il_rut_3ro)=0 then
	ll_new	= dw_lista.insertrow(0)
	dw_lista.setitem(ll_new,'base',is_base)
	dw_lista.setitem(ll_new,'serie',is_serie)
	dw_lista.setitem(ll_new,'numero',il_numero)
	dw_lista.accepttext()
else
	ls_ciudad	= dw_lista.getitemstring(1,'ciudad_3ro')
	if idw_detalle2.retrieve(ls_ciudad)=0 then idw_detalle2.insertrow(0)
end if
dw_lista.setfocus()
dw_lista.setcolumn('rut_3ro')

end event

type cb_cerrar from commandbutton within w_ingreso_funeraria_cliente_tercero
integer x = 2798
integer y = 1244
integer width = 942
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_funeraria_cliente_tercero)
end event

type cb_grabar from commandbutton within w_ingreso_funeraria_cliente_tercero
integer x = 55
integer y = 1244
integer width = 942
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Double		ll_rut_3ro
String			ls_dv_3ro,ls_nombre_3ro,ls_ap_paterno_3ro,ls_ap_materno_3ro,ls_tipo_via_3ro,ls_direccion_3ro,ls_nro_direc_3ro,ls_depto_3ro,ls_block_3ro,ls_ciudad_3ro,ls_comuna_3ro,&
				ls_fono_particular_3ro,ls_celular_3ro,ls_email_3ro,ls_nulo,ls_pasa,ls_pasa_grabar
Long			ll_fono_p_largo

Setnull(ls_nulo)
ls_pasa						= 'S'
ls_pasa_grabar				= 'S'
ll_rut_3ro					= dw_lista.getitemnumber(1,'rut_3ro')
ls_dv_3ro					= dw_lista.getitemstring(1,'dv_3ro')
ls_nombre_3ro				= dw_lista.getitemstring(1,'nombre_3ro')
ls_ap_paterno_3ro			= dw_lista.getitemstring(1,'ap_paterno_3ro')
ls_ap_materno_3ro		= dw_lista.getitemstring(1,'ap_materno_3ro')
ls_tipo_via_3ro				= dw_lista.getitemstring(1,'tipo_via_3ro')
ls_direccion_3ro			= dw_lista.getitemstring(1,'direccion_3ro')
ls_nro_direc_3ro			= dw_lista.getitemstring(1,'nro_direc_3ro')
ls_depto_3ro				= dw_lista.getitemstring(1,'depto_3ro')
ls_block_3ro					= dw_lista.getitemstring(1,'block_3ro')
ls_ciudad_3ro				= dw_lista.getitemstring(1,'ciudad_3ro')
ls_comuna_3ro				= dw_lista.getitemstring(1,'comuna_3ro')
ls_fono_particular_3ro	= dw_lista.getitemstring(1,'fono_particular_3ro')
ls_celular_3ro				= dw_lista.getitemstring(1,'celular_3ro')
ls_email_3ro				= dw_lista.getitemstring(1,'email_3ro')

if ll_rut_3ro > 0 and not isnull(ls_dv_3ro) and ls_dv_3ro<>'' then
	if String(ls_dv_3ro) <> String(gf_obtener_dv(ll_rut_3ro)) then
		messagebox('Advertencia','El Rut no es Válido',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('rut_3ro')
		ls_pasa				= 'N'
	end if
end if
if ls_pasa='S' then
	if isnull(ll_rut_3ro) or ll_rut_3ro = 0 then
		messagebox('Advertencia','El Rut no es Válido',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('rut_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_nombre_3ro) or 	ls_nombre_3ro='' then
		messagebox('Advertencia','Debe Ingresar Nombre',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('nombre_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_ap_paterno_3ro) or ls_ap_paterno_3ro='' then
		messagebox('Advertencia','Debe Ingresar Apellido Paterno',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('ap_paterno_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_ap_materno_3ro) or ls_ap_materno_3ro='' then
		messagebox('Advertencia','Debe Ingresar Apellido Materno',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('ap_materno_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_tipo_via_3ro) or ls_tipo_via_3ro='' then
		messagebox('Advertencia','Debe Ingresar Tipo Via',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('tipo_via_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_direccion_3ro) or ls_direccion_3ro='' then
		messagebox('Advertencia','Debe Ingresar Dirección',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('direccion_3ro')
	elseif isnull(ls_nro_direc_3ro) or ls_nro_direc_3ro='' then
		messagebox('Advertencia','Debe Ingresar Número Dirección',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('nro_direc_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_depto_3ro) or ls_depto_3ro='' then
		messagebox('Advertencia','Debe Ingresar Depto. Dirección',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('depto_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_block_3ro) or ls_block_3ro='' then
		messagebox('Advertencia','Debe Ingresar Block Dirección',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('block_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_ciudad_3ro) or ls_ciudad_3ro='' then
		messagebox('Advertencia','Debe Ingresar Ciudad',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('ciudad_3ro')
		ls_pasa_grabar		= 'N'
	elseif isnull(ls_comuna_3ro) or ls_comuna_3ro='' then
		messagebox('Advertencia','Debe Ingresar Comuna',stopsign!)
		dw_lista.scrolltorow(1)
		dw_lista.setfocus()
		dw_lista.setcolumn('comuna_3ro')
		ls_pasa_grabar		= 'N'
	elseif ls_fono_particular_3ro <> '' and not isnull(ls_fono_particular_3ro) then
		ll_fono_p_largo			= len(ls_fono_particular_3ro)
		if ll_fono_p_largo > 0 and ls_fono_particular_3ro <> '-' and ls_fono_particular_3ro <>'' and not isnull(ls_fono_particular_3ro) then 
			if ls_fono_particular_3ro <> '' and ls_fono_particular_3ro <> '-' then
				if	ll_fono_p_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono Particular, Ingrese solo números',stopsign!)
					dw_lista.setitem(1,'fono_particular_3ro',ls_nulo)
					dw_lista.setfocus()
					dw_lista.setcolumn('fono_particular_3ro')
					ls_pasa_grabar		= 'N'
				elseif Match(ls_fono_particular_3ro, "[A-Z]+") then
					messagebox('Advertencia','Solo debe Ingresar Números en Telefono Particular',stopsign!)
					dw_lista.setitem(1,'fono_particular_3ro',ls_nulo)
					dw_lista.setfocus()
					dw_lista.setcolumn('fono_particular_3ro')
					ls_pasa_grabar		= 'N'
				end if
			end if
		end if
	elseif ls_celular_3ro <> '' and not isnull(ls_celular_3ro) then
		ll_fono_p_largo			= len(ls_celular_3ro)
		if ll_fono_p_largo > 0 and ls_celular_3ro <> '-' and ls_celular_3ro <>'' and not isnull(ls_celular_3ro) then 
			if ls_celular_3ro <> '' and ls_celular_3ro <> '-' then
				if	ll_fono_p_largo < 9 then
					messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Celular, Ingrese solo números',stopsign!)
					dw_lista.setitem(1,'celular_3ro',ls_nulo)
					dw_lista.setfocus()
					dw_lista.setcolumn('celular_3ro')
					ls_pasa_grabar		= 'N'
				elseif Match(ls_celular_3ro, "[A-Z]+")  then
					messagebox('Advertencia','Solo debe Ingresar Números en Celular',stopsign!)
					dw_lista.setitem(1,'celular_3ro',ls_nulo)
					dw_lista.setfocus()
					dw_lista.setcolumn('celular_3ro')
					ls_pasa_grabar		= 'N'
				end if
			end if
		end if
	elseif ls_email_3ro <> '' and not isnull(ls_email_3ro) then
		if ls_email_3ro <> '' and ls_email_3ro <> '-' then
			if Match(ls_email_3ro, "@") then
			else
				messagebox('Error','El E-Mail no es Válido',stopsign!)
				dw_lista.scrolltorow(1)
				dw_lista.setitem(1,'email_3ro',ls_nulo)
				dw_lista.accepttext()
				dw_lista.setfocus()
				dw_lista.setcolumn('email_3ro')
				ls_pasa_grabar		= 'N'
			end if	
		end if	
	end if
	if ls_pasa_grabar='S' then
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'rut_3ro',ll_rut_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'dv_3ro',ls_dv_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'nombre_3ro',ls_nombre_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'ap_paterno_3ro',ls_ap_paterno_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'ap_materno_3ro',ls_ap_materno_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'tipo_via_3ro',ls_tipo_via_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'direccion_3ro',ls_direccion_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'nro_direc_3ro',ls_nro_direc_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'depto_3ro',ls_depto_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'block_3ro',ls_block_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'ciudad_3ro',ls_ciudad_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'comuna_3ro',ls_comuna_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'fono_particular_3ro',ls_fono_particular_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'celular_3ro',ls_celular_3ro)
		w_mantenedor_gestion_servicios.dw_lista.setitem(il_fila,'email_3ro',ls_email_3ro)
		w_mantenedor_gestion_servicios.dw_lista.accepttext()
		if w_mantenedor_gestion_servicios.dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa Cliente Tercero a Facturar ")
			w_mantenedor_gestion_servicios.dw_lista.setfocus()
			close(w_ingreso_funeraria_cliente_tercero)
		else
			rollback;
		end if
	end if
end if
end event

type dw_lista from datawindow within w_ingreso_funeraria_cliente_tercero
integer x = 46
integer y = 52
integer width = 3730
integer height = 1140
integer taborder = 10
string title = "none"
string dataobject = "dw_funeraria_ingreso_cliente_tercero"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_dv,ls_fono_p,ls_pasa_p,ls_nulo,ls_email,ls_ciudad
Double	ll_rut
Long		ll_fono_p_largo

dw_lista.accepttext()
ls_columna				= dwo.name
Setnull(ls_nulo)
if ls_columna='rut_3ro' or ls_columna='dv_3ro' then
	ll_rut					= dw_lista.getitemnumber(1,'rut_3ro')
	ls_dv					= dw_lista.getitemstring(1,'dv_3ro')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			Setnull(ls_dv)
//			dw_ant_titular.reset()
//			ll_new	= dw_ant_titular.insertrow(0)
			dw_lista.scrolltorow(1)
			dw_lista.setitem(1,'dv_3ro',ls_dv)
			dw_lista.accepttext()
			dw_lista.setfocus()
			dw_lista.setcolumn('dv_3ro')
		end if
	end if
elseif ls_columna = 'fono_particular_3ro' then
	ls_fono_p				= dw_lista.getitemstring(1,'fono_particular_3ro')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			if	ll_fono_p_largo < 9 then
				messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono Particular, Ingrese solo números',stopsign!)
				dw_lista.setitem(1,'fono_particular_3ro',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('fono_particular_3ro')
			elseif Match(ls_fono_p, "[A-Z]+") and ls_columna='fono_particular_3ro' then
				messagebox('Advertencia','Solo debe Ingresar Números en Telefono Particular',stopsign!)
				dw_lista.setitem(1,'fono_particular_3ro',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('fono_particular_3ro')
			end if
		end if
	end if
elseif ls_columna = 'celular_3ro' then
	ls_fono_p				= dw_lista.getitemstring(1,'celular_3ro')
	ll_fono_p_largo			= len(ls_fono_p)
	if ll_fono_p_largo > 0 and ls_fono_p <> '-' and ls_fono_p <>'' and not isnull(ls_fono_p) then 
		if ls_fono_p <> '' and ls_fono_p <> '-' then
			if	ll_fono_p_largo < 9 then
				messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Celular, Ingrese solo números',stopsign!)
				dw_lista.setitem(1,'celular_3ro',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('celular_3ro')
			elseif Match(ls_fono_p, "[A-Z]+") and ls_columna='celular_3ro' then
				messagebox('Advertencia','Solo debe Ingresar Números en Celular',stopsign!)
				dw_lista.setitem(1,'celular_3ro',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('celular_3ro')
			end if
		end if
	end if
elseif ls_columna = 'email_3ro' then
	ls_email			= dw_lista.getitemstring(1,'email_3ro')
	if ls_email <> '' and ls_email <> '-' then
		if Match(ls_email, "@") then
		else
			messagebox('Error','El E-Mail no es Válido',stopsign!)
			dw_lista.scrolltorow(1)
			dw_lista.setitem(1,'email_3ro',ls_nulo)
			dw_lista.accepttext()
			dw_lista.setfocus()
			dw_lista.setcolumn('email_3ro')
		end if	
	end if	
elseif ls_columna='ciudad_3ro' then
	ls_ciudad	= dw_lista.getitemstring(1,'ciudad_3ro')
	if idw_detalle2.retrieve(ls_ciudad)=0 then idw_detalle2.insertrow(0)
	
end if
end event

