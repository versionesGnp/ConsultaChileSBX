forward
global type w_ingreso_cliente_facturas_exentas from window
end type
type cb_buscar from commandbutton within w_ingreso_cliente_facturas_exentas
end type
type st_1 from statictext within w_ingreso_cliente_facturas_exentas
end type
type cb_cerrar from commandbutton within w_ingreso_cliente_facturas_exentas
end type
type cb_limpiar from commandbutton within w_ingreso_cliente_facturas_exentas
end type
type cb_eliminar from commandbutton within w_ingreso_cliente_facturas_exentas
end type
type cb_grabar from commandbutton within w_ingreso_cliente_facturas_exentas
end type
type cb_nuevo from commandbutton within w_ingreso_cliente_facturas_exentas
end type
type dw_lista from datawindow within w_ingreso_cliente_facturas_exentas
end type
end forward

global type w_ingreso_cliente_facturas_exentas from window
integer width = 3099
integer height = 1672
boolean titlebar = true
string title = "Ingreso Clientes facturas Exentas"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_buscar cb_buscar
st_1 st_1
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_nuevo cb_nuevo
dw_lista dw_lista
end type
global w_ingreso_cliente_facturas_exentas w_ingreso_cliente_facturas_exentas

on w_ingreso_cliente_facturas_exentas.create
this.cb_buscar=create cb_buscar
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.dw_lista=create dw_lista
this.Control[]={this.cb_buscar,&
this.st_1,&
this.cb_cerrar,&
this.cb_limpiar,&
this.cb_eliminar,&
this.cb_grabar,&
this.cb_nuevo,&
this.dw_lista}
end on

on w_ingreso_cliente_facturas_exentas.destroy
destroy(this.cb_buscar)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.dw_lista)
end on

event open;Long		ll_new

gf_centrar(w_ingreso_cliente_facturas_exentas)
dw_lista.settransobject(sqlca)
dw_lista.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_lista.getchild('comuna_comercial',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
ll_new	= dw_lista.insertrow(0)
dw_lista.setitem(ll_new,'usuario',gs_user)
dw_lista.setitem(ll_new,'fecha_ingr',date(gdt_fec_sistema))
dw_lista.accepttext()
end event

type cb_buscar from commandbutton within w_ingreso_cliente_facturas_exentas
integer x = 1614
integer y = 1416
integer width = 279
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;if isvalid(w_buscar_cliente_facturas_exenta) then close(w_buscar_cliente_facturas_exenta)
open(w_buscar_cliente_facturas_exenta)
end event

type st_1 from statictext within w_ingreso_cliente_facturas_exentas
integer x = 41
integer y = 20
integer width = 910
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes Cliente"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_cliente_facturas_exentas
integer x = 2720
integer y = 1416
integer width = 293
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;close(w_ingreso_cliente_facturas_exentas)
end event

type cb_limpiar from commandbutton within w_ingreso_cliente_facturas_exentas
integer x = 1111
integer y = 1416
integer width = 256
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_new

dw_lista.reset()
dw_lista.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_lista.getchild('comuna_comercial',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
ll_new	= dw_lista.insertrow(0)
dw_lista.setitem(ll_new,'usuario',gs_user)
dw_lista.setitem(ll_new,'fecha_ingr',date(gdt_fec_sistema))
dw_lista.accepttext()
end event

type cb_eliminar from commandbutton within w_ingreso_cliente_facturas_exentas
integer x = 608
integer y = 1416
integer width = 256
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

event clicked;Long		ll_rut,ll_res
String		ls_dv

ll_rut			= dw_lista.getitemnumber(1,'rut')
ls_dv			= dw_lista.getitemstring(1,'dv')
if ll_rut > 0 and not isnull(ls_dv) then
	ll_res		= messagebox("Eliminar Cliente","Está Seguro(a) Eliminar Cliente Rut "+string(ll_rut,'###,###,###,###,###')+'-'+ls_dv,Exclamation!,YesNo!,2)
	if ll_res=1 then
		dw_lista.deleterow(1)
		if dw_lista.update()=1 then
			commit;
			messagebox("Eliminar","Eliminación Exitosa")
		else
			rollback;
			messagebox("Error Eliminar","Error a Eliminación Rut "+string(ll_rut,'###,###,###,###,###')+'-'+ls_dv+" SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_ingreso_cliente_facturas_exentas
integer x = 325
integer y = 1416
integer width = 256
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_dir_particular,ls_ciudad,&
			ls_comuna,ls_sexo,ls_esta_civil,ls_auto_propio,ls_casa_propia,ls_ciudad_real,&
			ls_dir_comercial,ls_ciudad_comercial,ls_comuna_comercial,ls_age_aux,ls_tipo_via,ls_barra
Datetime	ldt_fecha_nac,ldt_fecha_ingreso
Double	ld_valor_uf
Long		ll_avaluo_auto,ll_avaluo_casa,ll_sw1=0,ll_sw2=0
String		ls_cod_age,ls_cod_sup,ls_cod_jefe,ls_descrip
Long		ll_estado,ll_rut,ll_count,ll_max,ll_cod_parque

dw_lista.accepttext()
ll_rut						= dw_lista.getitemnumber(1,'rut')
if ll_rut > 0 then
	ls_dv						= dw_lista.getitemstring(1,'dv')
	ls_nombre				= dw_lista.getitemstring(1,'nombre')
	ls_ap_pat				= dw_lista.getitemstring(1,'a_paterno')
	ls_ap_mat				= dw_lista.getitemstring(1,'a_materno')
	ls_dir_particular		= dw_lista.getitemstring(1,'direccion_p')
	ls_tipo_via				= dw_lista.getitemstring(1,'tipo_via')
	ls_ciudad					= dw_lista.getitemstring(1,'ciudad')
	ls_comuna				= dw_lista.getitemstring(1,'comuna')
	ldt_fecha_nac			= dw_lista.getitemdatetime(1,'fecha_nac')
	ldt_fecha_ingreso		= dw_lista.getitemdatetime(1,'fecha_ingr')
	ls_sexo					= dw_lista.getitemstring(1,'sexo')
	ls_esta_civil				= dw_lista.getitemstring(1,'esta_civil')
	ls_auto_propio			= dw_lista.getitemstring(1,'auto_propio')
	ls_casa_propia			= dw_lista.getitemstring(1,'casa_propia')
	ll_avaluo_auto			= dw_lista.getitemnumber(1,'avaluo_auto')
	ll_avaluo_casa			= dw_lista.getitemnumber(1,'avaluo_casa')
	ls_dir_comercial		= dw_lista.getitemstring(1,'domicilio_c')
	ls_ciudad_comercial	= dw_lista.getitemstring(1,'ciudad_comercial')
	ls_comuna_comercial	= dw_lista.getitemstring(1,'comuna_comercial')
	if isnull(dw_lista.getitemstring(1,'numero_particular')) or dw_lista.getitemstring(1,'numero_particular')='' then dw_lista.setitem(1,'numero_particular','-')
	if isnull(dw_lista.getitemstring(1,'depto_particular')) or dw_lista.getitemstring(1,'depto_particular')=''	then dw_lista.setitem(1,'depto_particular','-')
	if isnull(dw_lista.getitemstring(1,'block_particular')) or dw_lista.getitemstring(1,'block_particular')=''	then dw_lista.setitem(1,'block_particular','-')
	if isnull(dw_lista.getitemstring(1,'poblacion')) or dw_lista.getitemstring(1,'poblacion')='' 					then dw_lista.setitem(1,'poblacion','-')
	if isnull(dw_lista.getitemstring(1,'tipo_via')) or dw_lista.getitemstring(1,'tipo_via')='' 						then dw_lista.setitem(1,'tipo_via','-')
	if isnull(dw_lista.getitemstring(1,'sector')) or dw_lista.getitemstring(1,'sector')='' 							then dw_lista.setitem(1,'sector','-')
	if isnull(dw_lista.getitemstring(1,'fono_p')) or dw_lista.getitemstring(1,'fono_p')='' 							then dw_lista.setitem(1,'fono_p','-')
	if isnull(dw_lista.getitemstring(1,'actividad')) or dw_lista.getitemstring(1,'actividad')='' 					then dw_lista.setitem(1,'actividad','-')
	if isnull(dw_lista.getitemstring(1,'empleador')) or dw_lista.getitemstring(1,'empleador')='' 					then dw_lista.setitem(1,'empleador','-')
	if isnull(dw_lista.getitemstring(1,'numero_comercial')) or dw_lista.getitemstring(1,'numero_comercial')=''	then dw_lista.setitem(1,'numero_comercial','-')
	if isnull(dw_lista.getitemstring(1,'fono_c')) or dw_lista.getitemstring(1,'fono_c')='' 							then dw_lista.setitem(1,'fono_c','-')
	if isnull(dw_lista.getitemstring(1,'nombre')) or dw_lista.getitemstring(1,'nombre')='' 							then dw_lista.setitem(1,'nombre','-')
	if isnull(dw_lista.getitemstring(1,'a_paterno')) or dw_lista.getitemstring(1,'a_paterno')='' 					then dw_lista.setitem(1,'a_paterno','-')
	if isnull(dw_lista.getitemstring(1,'a_materno')) or dw_lista.getitemstring(1,'a_materno')='' 					then dw_lista.setitem(1,'a_materno','-')
	dw_lista.accepttext()
	if isnull(ls_dv) or len(trim(ls_dv))=0 then
		messagebox("Advertencia","Falta ingresar Dígito Verificador del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('dv')
	elseif isnull(ls_nombre) or len(trim(ls_nombre))=0 then
		messagebox("Advertencia","Falta ingresar Nombre del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('nombre')
	elseif isnull(ls_ap_pat) or len(trim(ls_ap_pat))=0 then
		messagebox("Advertencia","Falta ingresar Apellido Paterno del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('a_paterno')
	elseif isnull(ls_ap_mat) or len(trim(ls_ap_mat))=0 then
		messagebox("Advertencia","Falta ingresar Apellido Materno del Cliente")
		dw_lista.setitem(1,'a_materno','-')
		dw_lista.setfocus()
		dw_lista.setcolumn('a_materno')
	elseif isnull(ls_tipo_via) or len(trim(ls_tipo_via))=0 then
		messagebox("Advertencia","Falta ingresar Tipo Via")
		dw_lista.setitem(1,'tipo_via','-')
		dw_lista.setfocus()
		dw_lista.setcolumn('tipo_via')
	elseif isnull(ls_dir_particular) or len(trim(ls_dir_particular))=0 then
		messagebox("Advertencia","Falta ingresar Dirección Particular del Cliente")
		dw_lista.setitem(1,'direccion_p','-')
		dw_lista.setfocus()
		dw_lista.setcolumn('direccion_p')
	elseif isnull(ls_dir_comercial) or len(trim(ls_dir_comercial))=0 then
		messagebox("Advertencia","Falta ingresar Dirección Comercial del Cliente")
		dw_lista.setitem(1,'domicilio_c','-')
		dw_lista.setfocus()
		dw_lista.setcolumn('domicilio_c')
	elseif isnull(ls_ciudad) or len(trim(ls_ciudad))=0 then
		messagebox("Advertencia","Falta ingresar Ciudad del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('ciudad')
	elseif isnull(ls_ciudad_comercial) or len(trim(ls_ciudad_comercial))=0 then
		messagebox("Advertencia","Falta ingresar Ciudad Comercial del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('ciudad_comercial')
	elseif isnull(ls_comuna) or len(trim(ls_comuna))=0 then
		messagebox("Advertencia","Falta ingresar Comuna del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('comuna')
	elseif isnull(ls_comuna_comercial) or len(trim(ls_comuna_comercial))=0 then
		messagebox("Advertencia","Falta ingresar Comuna Comercial del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('comuna_comercial')
//	elseif isnull(ldt_fecha_nac) then
//		messagebox("Advertencia","Falta ingresar Fecha Nacimiento del Cliente")
//		dw_lista.setfocus()
//		dw_lista.setcolumn('fecha_nac')
	elseif isnull(ldt_fecha_ingreso) then
		messagebox("Advertencia","Falta ingresar Fecha Ingreso del Cliente")
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_ingr')
	else
		ls_ciudad				= dw_lista.getitemstring(1,'ciudad')
		ls_comuna			= dw_lista.getitemstring(1,'comuna')
		SELECT	"COMUNA"."CODIGO_CIUDAD"  
		INTO 		:ls_ciudad_real  
		FROM 	"COMUNA"  
		WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_ciudad<>ls_ciudad_real then
				messagebox("Advertencia","Comuna seleccionada en Domicilio Particular NO corresponde a Región Seleccionada")
				dw_lista.setfocus()
				dw_lista.setcolumn('comuna')
				ll_sw1		= 1
			else
				ls_ciudad			= dw_lista.getitemstring(1,'ciudad_comercial')
				ls_comuna		= dw_lista.getitemstring(1,'comuna_comercial')
				if not isnull(ls_ciudad) or not isnull(ls_comuna) then
					SELECT	"COMUNA"."CODIGO_CIUDAD"  
					INTO 		:ls_ciudad_real  
					FROM 	"COMUNA"  
					WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_comuna   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_ciudad<>ls_ciudad_real then
							messagebox("Advertencia","Comuna seleccionada en Domicilio Comercial NO corresponde a Región Seleccionada")
							dw_lista.setfocus()
							dw_lista.setcolumn('comuna_comercial')
							ll_sw2	= 1
						end if
					end if
				end if				
			end if
		end if
		if ll_sw1=0 and ll_sw2=0 then
			dw_lista.setitem(1,'avaluo_auto',0)
			dw_lista.setitem(1,'avaluo_casa',0)
			dw_lista.accepttext()
			if dw_lista.update()=1 then
				commit;
				SELECT	Count("FACTURAS_CADENA"."BARRA")
				INTO 		:ll_count  
				FROM 	"FACTURAS_CADENA"  
				WHERE 	"FACTURAS_CADENA"."RUT" = :ll_rut   ;
				if ll_count = 0 then
					SELECT	Max("FACTURAS_CADENA"."NUMERO")  
					INTO 		:ll_max  
					FROM 	"FACTURAS_CADENA"  ;
					if ll_max > 0 then
						ll_max ++
					else
						ll_max			= 1
					end if
					ls_barra				= 'BB'+string(ll_rut)
					if gs_conexion	= "Parque El Prado" then
						ll_cod_parque	= 1
					else
						ll_cod_parque	= 11
					end if
					INSERT INTO 	  "FACTURAS_CADENA"  
										( "BARRA", 	"RUT",	"CODIGO",	"SERIE",	"NUMERO",	"ESTADO",	"COD_PARQUE",	"MONEDA",	"MONTO",	"FECHA_PAGO",	"OBSERVACION" )  
					VALUES 			( :ls_barra, 	:ll_rut,	'B',				'B',			:ll_max,		'V',   			:ll_cod_parque,		'1',				null,   		null,   				null ) 
					USING			sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Grabar FACTURAS_CADENA Sql: "+sqlca.sqlerrtext)
					end if
				end if
				messagebox("Grabar","Grabación Exitosa")
				close(w_ingreso_cliente_facturas_exentas)
			else
				rollback;
				messagebox("Error","Error al Grabar "+SQLCA.SQLErrText)
			end if	
		end if
	end if
end if
end event

type cb_nuevo from commandbutton within w_ingreso_cliente_facturas_exentas
integer x = 46
integer y = 1416
integer width = 256
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;dw_lista.reset()
dw_lista.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_lista.getchild('comuna_comercial',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
dw_lista.insertrow(0)
dw_lista.setfocus()
dw_lista.setcolumn('rut')
end event

type dw_lista from datawindow within w_ingreso_cliente_facturas_exentas
integer x = 27
integer y = 120
integer width = 2999
integer height = 1272
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_cliente_facturas_exentas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_ciudad,ls_columna,ls_dv,ls_null,ls_estado
Date		ld_null
Double	ld_valor_uf
Long		ll_null,ll_avaluo,ll_rut,ll_res,ll_new

ls_columna		= dwo.name
dw_lista.accepttext()
if dw_lista.getrow()>0 then 
	SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
	CHOOSE CASE ls_columna
		CASE 'rut'
			ll_rut										= dw_lista.getitemnumber(1,'rut')
			ls_dv										= dw_lista.getitemstring(1,'dv')
			if ll_rut = 0 or isnull(ll_rut) then
				messagebox('Error','El Rut Inválido',stopsign!)
				cb_grabar.enabled					= false
				dw_lista.SetItem(1, "estado_rut",0)
				dw_lista.accepttext()
				dw_lista.setfocus()
				dw_lista.setcolumn('rut')
			elseif ll_rut > 0 then
				if dw_lista.retrieve(ll_rut)=0 then
					dw_lista.getchild('comuna',idw_detalle)
					idw_detalle.settransobject(sqlca)
					if idw_detalle.rowcount()=0 then
						idw_detalle.insertrow(0)
					end if
					dw_lista.getchild('comuna_comercial',idw_detalle2)
					idw_detalle2.settransobject(sqlca)
					if idw_detalle2.rowcount()=0 then
						idw_detalle2.insertrow(0)
					end if
					ll_new	= dw_lista.insertrow(0)
					dw_lista.setitem(ll_new,'usuario',gs_user)
					dw_lista.setitem(ll_new,'fecha_ingr',date(gdt_fec_sistema))
					dw_lista.setitem(ll_new,'rut',ll_rut)
					dw_lista.accepttext()
					
					ll_res								= messagebox("Advertencia","Está Seguro(a) Ingresar Cliente Rut:   "+string(ll_rut,'###,###,###,###'),Exclamation!,YesNo!,2)
					if ll_res <> 1 then
						cb_limpiar.triggerevent(clicked!)
					else
						dw_lista.setfocus()
						dw_lista.setcolumn('dv')
					end if
				end if
			end if

			if not isnull(ls_dv) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
					messagebox('Error','El Rut no es valido',stopsign!)
					cb_grabar.enabled					= false
					dw_lista.SetItem(1, "estado_rut",0)
					dw_lista.setfocus()
					dw_lista.setcolumn('dv')
				else
					cb_grabar.enabled					= true
					dw_lista.SetItem(1, "estado_rut",1)
					dw_lista.setcolumn('nombre')
				end if
			end if
			
		CASE 'dv'
			SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
			ll_rut										= dw_lista.getitemnumber(1,'rut')
			ls_dv										= dw_lista.getitemstring(1,'dv')
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				cb_grabar.enabled					= false
				dw_lista.SetItem(1, "estado_rut",0)
				dw_lista.setfocus()
				dw_lista.setcolumn('dv')
			else
				cb_grabar.enabled					= true
				dw_lista.SetItem(1, "estado_rut",1)
				dw_lista.setcolumn('nombre')
			end if

		CASE 'ciudad'
			ls_ciudad	= dw_lista.getitemstring(1,'ciudad')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_lista.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_lista.setitem(1,'comuna','0')
			end if

		CASE 'ciudad_comercial'
			ls_ciudad	= dw_lista.getitemstring(1,'ciudad_comercial')
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				idw_detalle2.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_lista.setitem(1,'comuna_comercial','999')
			end if
			if ls_ciudad='0' then
				dw_lista.setitem(1,'comuna_comercial','0')
			end if
	END CHOOSE
end if
end event

event dberror;return 1
end event

