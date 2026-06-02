forward
global type w_mantenedor_venta from window
end type
type st_inactivo from statictext within w_mantenedor_venta
end type
type cb_imprimir from commandbutton within w_mantenedor_venta
end type
type pb_buscar from picturebutton within w_mantenedor_venta
end type
type em_codigo from editmask within w_mantenedor_venta
end type
type st_buscar from statictext within w_mantenedor_venta
end type
type cb_limpiar from commandbutton within w_mantenedor_venta
end type
type cb_cerrar from commandbutton within w_mantenedor_venta
end type
type cb_eliminar from commandbutton within w_mantenedor_venta
end type
type cb_grabar from commandbutton within w_mantenedor_venta
end type
type dw_mantenedor from datawindow within w_mantenedor_venta
end type
end forward

global type w_mantenedor_venta from window
integer width = 2469
integer height = 1720
boolean titlebar = true
string title = "Mantendor"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_inactivo st_inactivo
cb_imprimir cb_imprimir
pb_buscar pb_buscar
em_codigo em_codigo
st_buscar st_buscar
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
dw_mantenedor dw_mantenedor
end type
global w_mantenedor_venta w_mantenedor_venta

type variables
String	is_opcion,is_codigo
Date		idt_fecha_hoy
end variables

forward prototypes
public function long wf_valida_todo (string as_opcion)
end prototypes

public function long wf_valida_todo (string as_opcion);Long		ll_pasa=0
Long		ll_rut,ll_meta,ll_cod_parque
Double	ll_porce
String		ls_estado,ls_nombre,ls_pat,ls_mat,ls_sup,ls_canal,ls_tipo_cont,ls_clasif,&
			ls_age,ls_jefe,ls_depto,ls_correo,ls_codigo
Date		ld_fecha_ini,ld_fecha_fin
CHOOSE CASE as_opcion
	CASE 'A'
		ls_estado		= dw_mantenedor.getitemstring(1,'estado')
		ll_rut				= dw_mantenedor.getitemnumber(1,'rut')
		ls_nombre		= dw_mantenedor.getitemstring(1,'nombre')
		ls_pat				= dw_mantenedor.getitemstring(1,'a_paterno')
		ls_mat			= dw_mantenedor.getitemstring(1,'a_materno')
		ls_sup			= dw_mantenedor.getitemstring(1,'cod_sup')
		ld_fecha_ini		= date(dw_mantenedor.getitemdatetime(1,'fecha_ini'))
		ld_fecha_fin		= date(dw_mantenedor.getitemdatetime(1,'fecha_fin'))
		ls_canal			= dw_mantenedor.getitemstring(1,'canal')
		ls_tipo_cont		= dw_mantenedor.getitemstring(1,'tipo_cont')
		ll_meta			= dw_mantenedor.getitemnumber(1,'meta')
		ls_clasif			= dw_mantenedor.getitemstring(1,'clasificacion')
		ls_age			= dw_mantenedor.getitemstring(1,'cod_age')
		ll_cod_parque	= dw_mantenedor.getitemnumber(1,'cod_parque')
		ls_depto			= dw_mantenedor.getitemstring(1,'depto')
		ls_correo			= dw_mantenedor.getitemstring(1,'correo')
		if isnull(ls_estado) or ls_estado='' then
			messagebox("Advertencia","Estado Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('estado')
			ll_pasa ++
		elseif ls_estado='I' and (isnull(ld_fecha_fin) or ld_fecha_fin=DATE("01-01-2099") ) then
			messagebox("Advertencia","Debe Ingresar Fecha de Término")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_fin')
			ll_pasa ++
		elseif isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Rut Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('rut')
			ll_pasa ++
		elseif isnull(ls_nombre) or ls_nombre='' then
			messagebox("Advertencia","Nombre Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('nombre')
			ll_pasa ++
		elseif isnull(ls_pat) or ls_pat='' then
			messagebox("Advertencia","Apellido Paterno Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('a_paterno')
			ll_pasa ++
		elseif isnull(ls_mat) or ls_mat='' then
			messagebox("Advertencia","Apellido Materno Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('a_materno')
			ll_pasa ++
		elseif isnull(ls_canal) or ls_canal='' then
			messagebox("Advertencia","Canal Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('canal')
			ll_pasa ++
		elseif isnull(ls_sup) or ls_sup='' then
			messagebox("Advertencia","Codigo Supervisor Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('cod_sup')
			ll_pasa ++
		elseif isnull(ld_fecha_ini) then
			messagebox("Advertencia","Fecha Ingreso Inválida")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_ini')
			ll_pasa ++
		elseif isnull(ls_tipo_cont) or ls_tipo_cont='' then
			messagebox("Advertencia","Tipo Contrato Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('tipo_cont')
			ll_pasa ++
		elseif isnull(ll_meta) or ll_meta=0 then
			messagebox("Advertencia","Meta Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('meta')
			ll_pasa ++
		elseif isnull(ls_clasif) or ls_clasif='' then
			messagebox("Advertencia","Clasificación Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('clasificacion')
			ll_pasa ++
		elseif isnull(ls_age) or ls_age='' then
			messagebox("Advertencia","Codigo Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('cod_age')
			ll_pasa ++
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Codigo Parque Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('cod_parque')
			ll_pasa ++
		elseif isnull(ls_depto) or ls_depto='' then
			messagebox("Advertencia","Departamento Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('depto')
			ll_pasa ++
		elseif isnull(ls_correo) or ls_correo='' then	
			messagebox("Advertencia","Ingresar Correo")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('depto')
			ll_pasa ++
		elseif isnull(ls_correo) or ls_correo='' then
		else
			if Match(ls_correo, '^[a-zA-Z0-9][a-zA-Z0-9\-_\.]*\@[a-zA-Z0-9][a-zA-Z0-9\-_\.]*\.[a-zA-Z0-9\-_\.]+[a-zA-Z0-9]+$') then
				ls_correo			= dw_mantenedor.getitemstring(1,'correo')
				ls_codigo			= dw_mantenedor.getitemstring(1,'cod_age')
				UPDATE 	"AGENTES"
				SET 		"CORREO" = TRIM(:ls_correo)
				WHERE 	"COD_AGE" = :ls_codigo AND
							"ESTADO" = 'A'
				USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
			else
				ll_pasa=1
				messagebox("Advertencia","Correo Invalido")
			end if
		end if
		
	CASE 'S'
		ls_estado		= dw_mantenedor.getitemstring(1,'estado')
		ll_rut				= dw_mantenedor.getitemnumber(1,'rut')
		ls_nombre		= dw_mantenedor.getitemstring(1,'nombre')
		ls_pat				= dw_mantenedor.getitemstring(1,'a_paterno')
		ls_mat			= dw_mantenedor.getitemstring(1,'a_materno')
		ls_jefe			= dw_mantenedor.getitemstring(1,'cod_jefe')
		ld_fecha_ini		= date(dw_mantenedor.getitemdatetime(1,'fecha_ing'))
		ld_fecha_fin		= date(dw_mantenedor.getitemdatetime(1,'fecha_fin'))
		ls_canal			= dw_mantenedor.getitemstring(1,'canal')
		ls_clasif			= dw_mantenedor.getitemstring(1,'clasifica')
		ll_cod_parque	= dw_mantenedor.getitemnumber(1,'cod_parque')
		if isnull(ls_estado) or ls_estado='' then
			messagebox("Advertencia","Estado Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('estado')
			ll_pasa ++
		elseif ls_estado='I' and (isnull(ld_fecha_fin) or ld_fecha_fin=DATE("01-01-2099") ) then
			messagebox("Advertencia","Debe Ingresar Fecha de Término")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_fin')
			ll_pasa ++
		elseif isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Rut Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('rut')
			ll_pasa ++
		elseif isnull(ls_nombre) or ls_nombre='' then
			messagebox("Advertencia","Nombre Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('nombre')
			ll_pasa ++
		elseif isnull(ls_pat) or ls_pat='' then
			messagebox("Advertencia","Apellido Paterno Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('a_paterno')
			ll_pasa ++
		elseif isnull(ls_mat) or ls_mat='' then
			messagebox("Advertencia","Apellido Materno Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('a_materno')
			ll_pasa ++
		elseif isnull(ls_canal) or ls_canal='' then
			messagebox("Advertencia","Canal Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('canal')
			ll_pasa ++
		elseif isnull(ls_jefe) or ls_jefe='' then
			messagebox("Advertencia","Codigo Jefe Venta Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('cod_jefe')
			ll_pasa ++
		elseif isnull(ld_fecha_ini) then
			messagebox("Advertencia","Fecha Ingreso Inválida")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_ing')
			ll_pasa ++
		elseif isnull(ls_clasif) or ls_clasif='' then
			messagebox("Advertencia","Clasificación Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('clasificacion')
			ll_pasa ++
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Codigo Parque Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('cod_parque')
			ll_pasa ++
		end if
	CASE 'J'
		ls_estado		= dw_mantenedor.getitemstring(1,'estado')
		ll_rut				= dw_mantenedor.getitemnumber(1,'rut')
		ls_nombre		= dw_mantenedor.getitemstring(1,'nombre')
		ls_pat				= dw_mantenedor.getitemstring(1,'a_paterno')
		ls_mat			= dw_mantenedor.getitemstring(1,'a_materno')
		ls_jefe			= dw_mantenedor.getitemstring(1,'jefe_ventas')
		ld_fecha_ini		= date(dw_mantenedor.getitemdatetime(1,'fecha_ing'))
		ld_fecha_fin		= date(dw_mantenedor.getitemdatetime(1,'fecha_fin'))
		ll_porce			= dw_mantenedor.getitemnumber(1,'porc_jefe_vta')
		ll_cod_parque	= dw_mantenedor.getitemnumber(1,'cod_parque')
		if isnull(ls_estado) or ls_estado='' then
			messagebox("Advertencia","Estado Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('estado')
			ll_pasa ++
		elseif ls_estado='I' and (isnull(ld_fecha_fin) or ld_fecha_fin=DATE("01-01-2099") ) then
			messagebox("Advertencia","Debe Ingresar Fecha de Término")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_fin')
			ll_pasa ++
		elseif isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Rut Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('rut')
			ll_pasa ++
		elseif isnull(ls_nombre) or ls_nombre='' then
			messagebox("Advertencia","Nombre Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('nombre')
			ll_pasa ++
		elseif isnull(ls_pat) or ls_pat='' then
			messagebox("Advertencia","Apellido Paterno Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('a_paterno')
			ll_pasa ++
		elseif isnull(ls_mat) or ls_mat='' then
			messagebox("Advertencia","Apellido Materno Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('a_materno')
			ll_pasa ++
		elseif isnull(ll_porce) or ll_porce=0 then
			messagebox("Advertencia","% de Venta Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('porc_jefe_vta')
			ll_pasa ++
		elseif isnull(ls_jefe) or ls_jefe='' then
			messagebox("Advertencia","Codigo Jefe Venta Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('jefe_ventas')
			ll_pasa ++
		elseif isnull(ld_fecha_ini) then
			messagebox("Advertencia","Fecha Ingreso Inválida")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_ing')
			ll_pasa ++
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia","Codigo Parque Inválido")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('cod_parque')
			ll_pasa ++
		end if
END CHOOSE
Return ll_pasa
end function

event open;gf_centrar(w_mantenedor_venta)

idt_fecha_hoy						= date(gdt_fec_sistema)
is_opcion								= Message.StringParm
st_inactivo.visible					= false
CHOOSE CASE is_opcion
	CASE 'A'
		dw_mantenedor.dataobject			= 'dw_mantenedor_agente'
		this.title							= 'Mantenedor de Agente'
		st_buscar.text						= 'Buscar Agente:'
		st_inactivo.text					= 'Agente Inactivo'
	CASE 'S'
		dw_mantenedor.dataobject			= 'dw_mantenedor_supervisor'
		this.title							= 'Mantenedor de Supervisor'
		st_buscar.text						= 'Buscar Supervisor:'
		st_inactivo.text					= 'Supervisor Inactivo'
	CASE 'J'
		dw_mantenedor.dataobject			= 'dw_mantenedor_jefe_venta'
		this.title							= 'Mantenedor de Jefe de Venta'
		st_buscar.text						= 'Buscar Jefe Venta:'
		st_inactivo.text					= 'Jefe Venta Inactivo'

END CHOOSE
dw_mantenedor.settransobject(sqlca)
dw_mantenedor.insertrow(0)
dw_mantenedor.enabled				= false
cb_eliminar.enabled					= false
cb_grabar.enabled						= false
cb_limpiar.enabled					= false
cb_imprimir.enabled					= false
end event

on w_mantenedor_venta.create
this.st_inactivo=create st_inactivo
this.cb_imprimir=create cb_imprimir
this.pb_buscar=create pb_buscar
this.em_codigo=create em_codigo
this.st_buscar=create st_buscar
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.dw_mantenedor=create dw_mantenedor
this.Control[]={this.st_inactivo,&
this.cb_imprimir,&
this.pb_buscar,&
this.em_codigo,&
this.st_buscar,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_eliminar,&
this.cb_grabar,&
this.dw_mantenedor}
end on

on w_mantenedor_venta.destroy
destroy(this.st_inactivo)
destroy(this.cb_imprimir)
destroy(this.pb_buscar)
destroy(this.em_codigo)
destroy(this.st_buscar)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.dw_mantenedor)
end on

type st_inactivo from statictext within w_mantenedor_venta
integer x = 1161
integer y = 36
integer width = 1079
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Century Gothic"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_mantenedor_venta
integer x = 1495
integer y = 1508
integer width = 274
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if not isnull(is_codigo) and is_codigo<>'' then
	dw_mantenedor.Modify("DataWindow.Header.height=160")
	dw_mantenedor.object.t_10.visible		= true
	if is_opcion='A' then dw_mantenedor.object.cod_age.visible=true
	if is_opcion='S' then dw_mantenedor.object.cod_sup.visible=true
	if is_opcion='J' then dw_mantenedor.object.jefe_ventas.visible=true
	f_Print( dw_mantenedor )
//	f_printdlg(dw_mantenedor,gstr_print,w_mantenedor_venta)
	dw_mantenedor.object.t_10.visible		= false
	if is_opcion='A' then dw_mantenedor.object.cod_age.visible=false
	if is_opcion='S' then dw_mantenedor.object.cod_sup.visible=false
	if is_opcion='J' then dw_mantenedor.object.jefe_ventas.visible=false
	dw_mantenedor.Modify("DataWindow.Header.height=0")
end if
end event

type pb_buscar from picturebutton within w_mantenedor_venta
integer x = 1024
integer y = 40
integer width = 119
integer height = 104
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;openwithparm(w_lista_codigos,is_opcion)

end event

type em_codigo from editmask within w_mantenedor_venta
integer x = 631
integer y = 36
integer width = 366
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
end type

event modified;Long		ll_resp,ll_new,ll_nro_contr
String		ls_letra,ls_tipo_contr
is_codigo									= trim(this.text)
if not isnull(is_codigo) and is_codigo<>'' then
	if is_opcion='S' then
		ls_letra									= mid(is_codigo,1,1)
		if ls_letra<>'0' then
			is_codigo							= '0'+is_codigo
			this.text							= is_codigo
		end if
	end if
	CHOOSE CASE is_opcion
		CASE 'A'
			if dw_mantenedor.retrieve(is_codigo)=0 then
				ll_new							= dw_mantenedor.insertrow(0)
				ll_resp							= messagebox("Advertencia","No Existe Agente, desea Ingresarlo",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					SELECT	MAX("TIPO_CONT")
					INTO		:ls_tipo_contr
    					FROM 	"AGENTES"
					USING	sqlca;
					ll_nro_contr					= long(ls_tipo_contr)
					dw_mantenedor.setitem(ll_new,'nuevo','S')
					dw_mantenedor.setitem(ll_new,'estado_rut','N')
					dw_mantenedor.setitem(ll_new,'cod_age',is_codigo)
					dw_mantenedor.setitem(ll_new,'estado','A')
					dw_mantenedor.setitem(ll_new,'nro_de_cont',ll_nro_contr)
					dw_mantenedor.setitem(ll_new,'clasificacion','C')
					dw_mantenedor.setitem(ll_new,'tipo_cont',ls_tipo_contr)
					dw_mantenedor.setitem(ll_new,'meta',180)
					dw_mantenedor.setitem(ll_new,'vsp',0)
					dw_mantenedor.setitem(ll_new,'fecha_fin',DATE("01-01-2099"))
					dw_mantenedor.enabled	= true
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					st_inactivo.visible			= false
					dw_mantenedor.accepttext()
					dw_mantenedor.setfocus()
					dw_mantenedor.setcolumn('rut')
				else
					dw_mantenedor.reset()
					em_codigo.text				= ''
					Setnull(is_codigo)
					dw_mantenedor.insertrow(0)
					dw_mantenedor.enabled	= false
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					st_inactivo.visible		= false
					dw_mantenedor.accepttext()
					em_codigo.setfocus()
				end if
			else
				dw_mantenedor.enabled		= true
				cb_eliminar.enabled			= true
				cb_grabar.enabled				= true
				cb_limpiar.enabled			= true
				cb_imprimir.enabled			= true
				st_inactivo.visible			= false
				if dw_mantenedor.getitemstring(1,'estado')='I' then 
					st_inactivo.visible		= true
					dw_mantenedor.enabled	= false
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					cb_cerrar.setfocus()
				else
					dw_mantenedor.setitem(1,'estado_rut','S')
					dw_mantenedor.setitem(1,'nuevo','N')
					dw_mantenedor.accepttext()
					dw_mantenedor.setfocus()
					dw_mantenedor.setcolumn('nombre')
				end if
			end if

		CASE 'S'
			if dw_mantenedor.retrieve(is_codigo)=0 then
				ll_new							= dw_mantenedor.insertrow(0)
				ll_resp							= messagebox("Advertencia","No Existe Supervisor, desea Ingresarlo",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					dw_mantenedor.setitem(ll_new,'nuevo','S')
					dw_mantenedor.setitem(ll_new,'estado_rut','N')
					dw_mantenedor.setitem(ll_new,'cod_sup',is_codigo)
					dw_mantenedor.setitem(ll_new,'estado','A')
					dw_mantenedor.setitem(ll_new,'clasifica','C')
					dw_mantenedor.setitem(ll_new,'vsp',0)
					dw_mantenedor.setitem(ll_new,'fecha_fin',DATE("01-01-2099"))
					dw_mantenedor.enabled	= true
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					st_inactivo.visible		= false
					dw_mantenedor.accepttext()
					dw_mantenedor.setfocus()
					dw_mantenedor.setcolumn('rut')
				else
					dw_mantenedor.reset()
					em_codigo.text				= ''
					Setnull(is_codigo)
					dw_mantenedor.insertrow(0)
					dw_mantenedor.enabled	= false
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					st_inactivo.visible		= false
					dw_mantenedor.accepttext()
					em_codigo.setfocus()
				end if
			else
				dw_mantenedor.enabled		= true
				cb_eliminar.enabled			= true
				cb_grabar.enabled				= true
				cb_limpiar.enabled			= true
				cb_imprimir.enabled			= true
				st_inactivo.visible			= false
				if dw_mantenedor.getitemstring(1,'estado')='I' then 
					st_inactivo.visible		= true
					dw_mantenedor.enabled	= false
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					cb_cerrar.setfocus()
				else
					dw_mantenedor.setitem(1,'estado_rut','S')
					dw_mantenedor.setitem(1,'nuevo','N')
					dw_mantenedor.accepttext()
					dw_mantenedor.setfocus()
					dw_mantenedor.setcolumn('nombre')
				end if
			end if
			
		CASE 'J'
			if dw_mantenedor.retrieve(is_codigo)=0 then
				ll_new							= dw_mantenedor.insertrow(0)
				ll_resp							= messagebox("Advertencia","No Existe Jefe Venta, desea Ingresarlo",Exclamation!,YesNo!,2)
				if ll_resp=1 then
					dw_mantenedor.setitem(ll_new,'nuevo','S')
					dw_mantenedor.setitem(ll_new,'estado_rut','N')
					dw_mantenedor.setitem(ll_new,'jefe_ventas',is_codigo)
					dw_mantenedor.setitem(ll_new,'estado','A')
					dw_mantenedor.setitem(ll_new,'fecha_fin',DATE("01-01-2099"))
					dw_mantenedor.enabled	= true
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					st_inactivo.visible		= false
					dw_mantenedor.accepttext()
					dw_mantenedor.setfocus()
					dw_mantenedor.setcolumn('rut')
				else
					dw_mantenedor.reset()
					em_codigo.text				= ''
					Setnull(is_codigo)
					dw_mantenedor.insertrow(0)
					dw_mantenedor.enabled	= false
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					st_inactivo.visible		= false
					dw_mantenedor.accepttext()
					em_codigo.setfocus()
				end if
			else
				dw_mantenedor.enabled		= true
				cb_eliminar.enabled			= true
				cb_grabar.enabled				= true
				cb_limpiar.enabled			= true
				cb_imprimir.enabled			= true
				st_inactivo.visible			= false
				if dw_mantenedor.getitemstring(1,'estado')='I' then 
					st_inactivo.visible		= true
					dw_mantenedor.enabled	= false
					cb_eliminar.enabled		= false
					cb_grabar.enabled			= false
					cb_limpiar.enabled		= false
					cb_imprimir.enabled		= false
					cb_cerrar.setfocus()
				else
					dw_mantenedor.setitem(1,'estado_rut','S')
					dw_mantenedor.setitem(1,'nuevo','N')
					dw_mantenedor.accepttext()
					dw_mantenedor.setfocus()
					dw_mantenedor.setcolumn('nombre')
				end if
			end if
	END CHOOSE
end if
end event

type st_buscar from statictext within w_mantenedor_venta
integer x = 59
integer y = 56
integer width = 530
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_mantenedor_venta
integer x = 1216
integer y = 1508
integer width = 274
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_mantenedor.reset()
dw_mantenedor.insertrow(0)
dw_mantenedor.enabled	= false
st_inactivo.visible		= false
em_codigo.text				= ''
Setnull(is_codigo)
em_codigo.setfocus()
end event

type cb_cerrar from commandbutton within w_mantenedor_venta
integer x = 2075
integer y = 1508
integer width = 343
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenedor_venta)
end event

event getfocus;String	ls_nuevo,ls_dv
Long		ll_rut
dw_mantenedor.accepttext()
ls_nuevo	= dw_mantenedor.getitemstring(1,'nuevo')
ls_dv		= dw_mantenedor.getitemstring(1,'dv')
ll_rut	= dw_mantenedor.getitemnumber(1,'rut') 
if trim(em_codigo.text)<>'' or not isnull(trim(em_codigo.text)) then
	if ls_nuevo='S' and ll_rut>0 and (ls_dv='' or isnull(ls_dv)) then 
		dw_mantenedor.accepttext()
		dw_mantenedor.setfocus()
		dw_mantenedor.setcolumn('dv')
	end if
end if
end event

type cb_eliminar from commandbutton within w_mantenedor_venta
integer x = 727
integer y = 1508
integer width = 320
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I&nactivo"
end type

event clicked;Long	ll_resp
if is_codigo<>'' and not isnull(is_codigo) then
	if dw_mantenedor.getitemstring(1,'estado')='A' then
		ll_resp						= messagebox("Advertencia","Está Seguro Cambiar a Estado Inactivo",Exclamation!,YesNo!,2)
		if ll_resp=1 then
			dw_mantenedor.setitem(1,'estado','I')
			st_inactivo.visible	= true
			dw_mantenedor.setitem(1,'fecha_fin',datetime(idt_fecha_hoy,time("00:00:00")))
			dw_mantenedor.accepttext()
			messagebox("Advertencia","Recuerde Antes de Salir, debe Ingresar Fecha de Término y Grabar")
			dw_mantenedor.setfocus()
			dw_mantenedor.setcolumn('fecha_fin')
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_mantenedor_venta
integer x = 50
integer y = 1508
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String	ls_canal,ls_tipo,ls_jefe,ls_tipo_canal,ls_jefe_aux,ls_correo,ls_codigo
Datetime	ldt_fecha
dw_mantenedor.accepttext()
if wf_valida_todo(is_opcion)=0 then
	if dw_mantenedor.update()=1 then
		commit;
		ldt_fecha	= datetime(date(gdt_fec_sistema),time("00:00:00"))
		CHOOSE CASE is_opcion
			CASE 'A'
			CASE 'S'
				ls_canal		= dw_mantenedor.getitemstring(1,'canal')
				ls_jefe		= dw_mantenedor.getitemstring(1,'cod_jefe')
				if ls_canal='NI' then
					ls_tipo	= 'NI'
				else
					ls_tipo	= 'VD'
				end if
				SELECT	"META_SUPER"."TIPO_CANAL"  
				INTO 		:ls_tipo_canal  
				FROM 		"META_SUPER"  
				WHERE 	"META_SUPER"."COD_SUP" = :is_codigo   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					UPDATE	"META_SUPER"  
					SET 		"TIPO_CANAL" = :ls_tipo,   
								"USUARIO" = :gs_user,   
								"JEFE_VENTA" = :ls_jefe   
					WHERE		"META_SUPER"."COD_SUP" = :is_codigo   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				else
					INSERT INTO "META_SUPER"  
						(	"COD_SUP",	"TIPO_CANAL",	"ABONO",		"TOTAL_UNIDAD",   "USUARIO",	"FECHA",   	"JEFE_VENTA",	"MONTO_SUP",	"FECHA_INGRESO",	"TOTAL_TOTAL" )  
					VALUES 
						( :is_codigo,  :ls_tipo,   	0,  			0,   					:gs_user,   :ldt_fecha, :ls_jefe,   	0, 				:ldt_fecha,			0 )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if

			CASE 'J'
				SELECT	"META_SUPERINT"."JEFE_VENTA"  
				INTO 		:ls_jefe_aux  
				FROM 		"META_SUPERINT"  
				WHERE 	"META_SUPERINT"."JEFE_VENTA" = :is_codigo   
				USING		sqlca;
				if sqlca.sqlcode=100 then
					INSERT INTO "META_SUPERINT"  
						(	"JEFE_VENTA",	"COD_SUP",	"TOTAL",	"FECHA",		"ABONO" )  
					VALUES 
						(	:is_codigo,   	'',			0,   		:ldt_fecha,	0 )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if

		END CHOOSE
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
	end if
	cb_limpiar.triggerevent(clicked!)
end if


end event

type dw_mantenedor from datawindow within w_mantenedor_venta
integer x = 46
integer y = 164
integer width = 2363
integer height = 1328
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_mantenedor_agente"
boolean border = false
end type

event clicked;String	ls_columna,ls_fecha,ls_estado, ls_estado_rut
if row>0 then
	ls_columna	= dwo.name
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_estado_rut	= dw_mantenedor.getitemstring(1,'estado_rut')
			if ls_estado_rut='S' then
				if is_opcion='A' then
					ls_fecha		= string(date(dw_mantenedor.getitemdatetime(1,'fecha_ini')))
					if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						dw_mantenedor.setitem(1,'fecha_ini',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						ls_fecha	= trim(Message.StringParm)
						dw_mantenedor.setitem(1,'fecha_ini',date(ls_fecha))
					END IF
					dw_mantenedor.setcolumn('fecha_ini')
				elseif is_opcion='S' or is_opcion='J' then
					ls_fecha		= string(date(dw_mantenedor.getitemdatetime(1,'fecha_ing')))
					if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						dw_mantenedor.setitem(1,'fecha_ing',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						ls_fecha	= trim(Message.StringParm)
						dw_mantenedor.setitem(1,'fecha_ing',date(ls_fecha))
					END IF
					dw_mantenedor.setcolumn('fecha_ing')
				end if
			end if

		CASE 'p_2'
			ls_estado		= dw_mantenedor.getitemstring(1,'estado')
			ls_estado_rut	= dw_mantenedor.getitemstring(1,'estado_rut')
			if ls_estado_rut='S' then
				if ls_estado='I' then
					ls_fecha		= string(date(dw_mantenedor.getitemdatetime(1,'fecha_fin')))
					if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						dw_mantenedor.setitem(1,'fecha_fin',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						ls_fecha	= trim(Message.StringParm)
						dw_mantenedor.setitem(1,'fecha_fin',date(ls_fecha))
					END IF
					dw_mantenedor.setcolumn('fecha_fin')
				end if
			end if
	END CHOOSE
end if
end event

event itemchanged;string		ls_columna,ls_dv,ls_dv_aux,ls_nuevo,ls_canal,ls_cod_sup,ls_cod_jefe,ls_email_contacto
Long		ll_rut,ll_new

ls_columna							= dwo.name
this.accepttext()
if ls_columna='rut' or ls_columna='dv' then
	ll_rut								= dw_mantenedor.getitemnumber(1,'rut')
	ls_dv								= dw_mantenedor.getitemstring(1,'dv')
	ls_dv_aux						= gf_obtener_dv( ll_rut )
	if ls_dv <> ls_dv_aux then
		messagebox("Advertencia","Rut Inválido")
		ls_nuevo						= dw_mantenedor.getitemstring(1,'nuevo')
		if ls_nuevo = 'S' then
			dw_mantenedor.reset()
			ll_new					= dw_mantenedor.insertrow(0)
			if is_opcion='A' then
				dw_mantenedor.setitem(ll_new,'cod_age',is_codigo)
				dw_mantenedor.setitem(ll_new,'nro_de_cont',5)
				dw_mantenedor.setitem(ll_new,'clasificacion','A')
				dw_mantenedor.setitem(ll_new,'tipo_cont','5')
				dw_mantenedor.setitem(ll_new,'meta',180)
			elseif is_opcion='S' then
				dw_mantenedor.setitem(ll_new,'cod_sup',is_codigo)
				dw_mantenedor.setitem(ll_new,'porc_supervisor',1.5)
				dw_mantenedor.setitem(ll_new,'clasifica','A')
			elseif is_opcion='J' then
				dw_mantenedor.setitem(ll_new,'jefe_ventas',is_codigo)
				dw_mantenedor.setitem(ll_new,'porc_jefe_vta',1)
			end if
			dw_mantenedor.setitem(ll_new,'rut',ll_rut)
			dw_mantenedor.setitem(ll_new,'nuevo','S')
			dw_mantenedor.setitem(ll_new,'estado_rut','N')
			dw_mantenedor.setitem(ll_new,'estado','A')
			dw_mantenedor.setitem(ll_new,'vsp',0)
			dw_mantenedor.setitem(ll_new,'fecha_fin',DATE("01-01-2099"))
		end if
		setnull(ll_rut)
		setnull(ls_dv)
		setnull(ls_dv_aux)
		dw_mantenedor.accepttext()
		dw_mantenedor.setfocus()
		dw_mantenedor.setcolumn('dv')
	elseif ls_dv = ls_dv_aux then
		dw_mantenedor.setitem(1,'estado_rut','S')
		if is_opcion='A' then
			dw_mantenedor.setitem(1,'clave',string(ll_rut))
		end if
		cb_eliminar.enabled		= true
		cb_grabar.enabled			= true
		cb_limpiar.enabled		= true
		cb_imprimir.enabled		= true
		dw_mantenedor.accepttext()
	end if
elseif ls_columna='canal' then
		if is_opcion='A' then
			ls_canal		= trim(dw_mantenedor.getitemstring(1,'canal'))
			ls_cod_sup	= trim(dw_mantenedor.getitemstring(1,'cod_sup'))
			if ls_canal = 'NF' then
				dw_mantenedor.setitem(1,'depto','K')
			elseif ls_canal = 'NI' then
				dw_mantenedor.setitem(1,'depto','M')
			end if
			
			dw_mantenedor.setitem(1,'cod_sup','')
		elseif is_opcion='S' then
			ls_canal		= trim(dw_mantenedor.getitemstring(1,'canal'))
			ls_cod_jefe	= trim(dw_mantenedor.getitemstring(1,'cod_jefe'))
			dw_mantenedor.setitem(1,'cod_jefe','')
		end if
end if

dw_mantenedor.accepttext()
end event

