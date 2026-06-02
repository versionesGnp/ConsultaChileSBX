forward
global type w_mantenedor_gestion_servicios from window
end type
type cb_nuevo from commandbutton within w_mantenedor_gestion_servicios
end type
type cb_inactivar from commandbutton within w_mantenedor_gestion_servicios
end type
type cb_grabar from commandbutton within w_mantenedor_gestion_servicios
end type
type cb_cerrar from commandbutton within w_mantenedor_gestion_servicios
end type
type dw_lista from datawindow within w_mantenedor_gestion_servicios
end type
end forward

global type w_mantenedor_gestion_servicios from window
integer width = 3794
integer height = 1320
boolean titlebar = true
string title = "Mantenedor Gestión Servicios"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_nuevo cb_nuevo
cb_inactivar cb_inactivar
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_mantenedor_gestion_servicios w_mantenedor_gestion_servicios

type variables
Long	il_row,il_fila_validar,il_fila_ok,il_modif
String	is_limpiar
end variables

on w_mantenedor_gestion_servicios.create
this.cb_nuevo=create cb_nuevo
this.cb_inactivar=create cb_inactivar
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_nuevo,&
this.cb_inactivar,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_mantenedor_gestion_servicios.destroy
destroy(this.cb_nuevo)
destroy(this.cb_inactivar)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;Long		ll_count

gf_centrar(w_mantenedor_gestion_servicios)
dw_lista.settransobject(sqlca)
cb_inactivar.visible			= false
cb_nuevo.visible			= false
if dw_lista.retrieve(gs_base,gs_serie,gi_numero)=0 then
	messagebox("Advertencia","No registra Datos")
	close(w_mantenedor_gestion_servicios)
else
	il_modif					= 0
	if isvalid(w_validar_promesa_operaciones) then
		dw_lista.enabled	= true
	else
		dw_lista.enabled	= false
	end if
//	SELECT 	Count("PRODUCTO_USUARIO_INACTIVA_SERV"."CODIGO_USUARIO"  )
//	INTO 		:ll_count  
//	FROM 	"PRODUCTO_USUARIO_INACTIVA_SERV"  
//	WHERE 	( "PRODUCTO_USUARIO_INACTIVA_SERV"."CODIGO_USUARIO" = :gs_user ) AND  
//				( "PRODUCTO_USUARIO_INACTIVA_SERV"."ESTADO_REG" = 'A' )   ;
//	if isnull(ll_count) then ll_count=0
//	if ll_count > 0 then
//		cb_inactivar.visible		= true
//	else
		
//	end if
end if
end event

type cb_nuevo from commandbutton within w_mantenedor_gestion_servicios
integer x = 489
integer y = 1332
integer width = 302
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new,ll_cod_serv,ll_nulo
String		ls_nulo
datetime	ldt_nulo

Setnull(ll_nulo);setnull(ls_nulo);setnull(ldt_nulo)
ll_new		= dw_lista.insertrow(0)
ll_cod_serv	= dw_lista.getitemnumber(1,'codigo_servicio')
dw_lista.setitem(ll_new,'correlativo',dw_lista.rowcount())
dw_lista.setitem(ll_new,'estado_registro','A')
dw_lista.setitem(ll_new,'rut_beneficiario',ll_nulo)
dw_lista.setitem(ll_new,'dv_beneficiario',ls_nulo)
dw_lista.setitem(ll_new,'sw_activacion',1)
dw_lista.setitem(ll_new,'fecha_activacion',ldt_nulo)
dw_lista.setitem(ll_new,'usuario_activacion',ls_nulo)
dw_lista.setitem(ll_new,'codigo_servicio',ll_cod_serv)
dw_lista.setitem(ll_new,'base',gs_base)
dw_lista.setitem(ll_new,'serie',gs_serie)
dw_lista.setitem(ll_new,'numero',gi_numero)
dw_lista.accepttext()
end event

type cb_inactivar from commandbutton within w_mantenedor_gestion_servicios
boolean visible = false
integer x = 942
integer y = 1332
integer width = 302
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

event clicked;Long		ll_res,ll_fila,ll_corre,ll_sw,ll_cod_serv
Double	ll_rut,ll_numero,ll_rut_benef
String		ls_base,ls_serie,ls_est_reg,ls_dv_benef,ls_usuario_act
Datetime	ldt_fec_act

SELECT sysdate INTO :gdt_fec_sistema FROM dual;
ll_fila						= dw_lista.getrow()
ll_res						= messagebox("Eliminar","Está Seguro Eliminar Servicio Fila N° "+string(ll_fila),Exclamation!,YesNo!,2)
if ll_res=1 then
	ll_corre				= dw_lista.getitemnumber(ll_fila, 'correlativo')
	ls_base				= dw_lista.getitemString(ll_fila,'base')
	ls_serie				= dw_lista.getitemString(ll_fila,'serie')
	ll_cod_serv			= dw_lista.getitemnumber(ll_fila,'codigo_servicio')
	ll_numero			= dw_lista.getitemnumber(ll_fila,'numero')
	ls_est_reg			= dw_lista.getitemString(ll_fila,'estado_registro')
	ll_rut_benef			= dw_lista.getitemnumber(ll_fila,'rut_beneficiario')
	ls_dv_benef			= dw_lista.getitemString(ll_fila,'dv_beneficiario')
	ll_sw					= dw_lista.getitemnumber(ll_fila,'sw_activacion')
	ldt_fec_act			= dw_lista.getitemdatetime(ll_fila,'fecha_activacion')
	ls_usuario_act		= dw_lista.getitemString(ll_fila,'usuario_activacion')
	INSERT INTO 	"LOG_PRODUCTO_GESTION_SERVICIO"  
						( "BASE",  	"SERIE",   	"NUMERO",   	"CODIGO_SERVICIO",   	"CORRELATIVO",   	"ESTADO_REGISTRO",   	"RUT_BENEFICIARIO",   	"DV_BENEFICIARIO",   	"SW_ACTIVACION",   	"FECHA_ACTIVACION",   	"USUARIO_ACTIVACION",	"USUARIO_ELIMINA" )  
	VALUES			( :ls_base,	:ls_serie,   	:ll_numero,   	:ll_cod_serv,   				:ll_corre,   				:ls_est_reg,   				:ll_rut_benef,   				:ls_dv_benef,   				:ll_sw,   						:ldt_fec_act,   					:ls_usuario_act,				:gs_user )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
		il_modif ++
		dw_lista.accepttext()
	
		Long		ll_capacidad,ll_tot_reg,ll_indi,ll_sum
		String		ls_estado
		
		ll_sum			= 0
		SELECT 	"PRODUCTO_PAGO"."CAPACIDAD"  
		INTO 		:ll_capacidad  
		FROM 	"PRODUCTO_ANEXO",  	"PRODUCTO_PAGO"  
		WHERE 	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
					( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
					( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
					( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
					( ( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
					( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
					( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )   ;
		
		dw_lista.deleterow(ll_fila)
		dw_lista.accepttext()
		if dw_lista.update() = 1 then
			commit;
		else
			rollback;
		end if
		ll_tot_reg		= dw_lista.rowcount()
		for ll_indi=1 to ll_tot_reg
			ls_estado	= dw_lista.getitemstring(ll_indi,'estado_registro')
			if ls_estado='A' then ll_sum++
		next
		if ll_capacidad = ll_sum then
			if il_modif > 0 then
				if dw_lista.update()=1 then
					commit;
					messagebox("Eliminar","Eliminación Exitosa")
					
	//				cb_cerrar.triggerevent(clicked!)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Tabla PRODUCTO_GESTION_SERVICIO Sql: "+sqlca.sqlerrtext)
				end if
			end if
		else
			messagebox("Advertencia","Existe Difencia con Cantidad de Servicios, Contrato tiene "+string(ll_capacidad) + " Capacidades y Tabla de Gestión tiene "+string(ll_sum) + " Activos")
		end if
	else
		rollback;
	end if
//	dw_lista.setitem(ll_fila,'estado_registro','I')
//	dw_lista.setitem(ll_fila,'fecha_activacion',gdt_fec_sistema)
//	dw_lista.setitem(ll_fila,'usuario_activacion',gs_user)

//	messagebox("Advertencia","Eliminación Exitosa, Recuerde Grabar Cambios antes de Salir")
end if
end event

type cb_grabar from commandbutton within w_mantenedor_gestion_servicios
integer x = 55
integer y = 1088
integer width = 302
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_capacidad,ll_tot_reg,ll_indi,ll_sum
String		ls_estado

ll_sum			= 0
SELECT 	"PRODUCTO_PAGO"."CAPACIDAD"  
INTO 		:ll_capacidad  
FROM 	"PRODUCTO_ANEXO",  	"PRODUCTO_PAGO"  
WHERE 	( "PRODUCTO_ANEXO"."BASE" = "PRODUCTO_PAGO"."BASE" ) and  
			( "PRODUCTO_ANEXO"."SERIE" = "PRODUCTO_PAGO"."SERIE" ) and  
			( "PRODUCTO_ANEXO"."NUMERO" = "PRODUCTO_PAGO"."NUMERO" ) and  
			( "PRODUCTO_ANEXO"."ULT_FOLIO" = "PRODUCTO_PAGO"."FOLIO" ) and  
			( ( "PRODUCTO_ANEXO"."BASE" = :gs_base ) AND  
			( "PRODUCTO_ANEXO"."SERIE" = :gs_serie ) AND  
			( "PRODUCTO_ANEXO"."NUMERO" = :gi_numero ) )   ;

ll_tot_reg		= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_estado	= dw_lista.getitemstring(ll_indi,'estado_registro')
	if ls_estado='A' then ll_sum++
next
if ll_capacidad = ll_sum then
	if il_modif > 0 then
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			cb_cerrar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Tabla PRODUCTO_GESTION_SERVICIO Sql: "+sqlca.sqlerrtext)
		end if
	end if
else
	messagebox("Advertencia","Existe Difencia con Cantidad de Servicios, Contrato tiene "+string(ll_capacidad) + " Capacidades y Tabla de Gestión tiene "+string(ll_sum) + " Activos")
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_gestion_servicios
integer x = 3433
integer y = 1088
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_gestion_servicios)
end event

type dw_lista from datawindow within w_mantenedor_gestion_servicios
integer x = 55
integer y = 40
integer width = 3680
integer height = 1012
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_gestion_servicios"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_nulo,ls_dv,ls_base,ls_serie,ls_string
Double	ll_rut,ll_numero,ll_rut_3ro
Long		ll_sw,ll_quien_paga
datetime	ldt_nulo

select sysdate into :gdt_fec_sistema from dual;
this.accepttext()
Setnull(ldt_nulo)
ls_columna											= dwo.name
il_row													= row
CHOOSE CASE ls_columna
		CASE 'dv_beneficiario' , 'rut_beneficiario'
			SetNull(ls_nulo)
			ll_rut										= round(dw_lista.getitemnumber(il_row,'rut_beneficiario'),0)
			ls_dv										= dw_lista.getitemstring(il_row,'dv_beneficiario')
			if not isnull(ll_rut) and ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
					messagebox('Error','Rut no es valido',stopsign!)
					cb_grabar.enabled				= false
					dw_lista.setfocus()
					dw_lista.scrolltorow(il_row)
					dw_lista.setcolumn('dv_beneficiario')
				else
					il_modif ++
					dw_lista.setfocus()
					dw_lista.scrolltorow(il_row)
					cb_grabar.enabled				= true
					dw_lista.setcolumn('sw_activacion')
				end if
			end if
			
		CASE 'sw_activacion' 
			if isvalid(w_validar_promesa_operaciones) then
				ll_sw																	= dw_lista.getitemnumber(il_row,'sw_activacion')
				ll_rut																	= round(dw_lista.getitemnumber(il_row,'rut_beneficiario'),0)
				ls_base																= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'base')
				ls_serie																= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'serie')
				ll_numero															= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'numero')
	
				dw_lista.setitem(il_row,'fecha_activacion',gdt_fec_sistema)
				dw_lista.setitem(il_row,'usuario_activacion',gs_user)
				if isvalid(w_validar_promesa_operaciones) then
					if ls_base=gs_base and ls_serie=gs_serie and ll_numero=gi_numero then
						if ll_sw = 2 then
							w_validar_promesa_operaciones.dw_revision.setitem(1,'sw_activa_servicio', ll_sw)
							w_validar_promesa_operaciones.dw_revision.setitem(1,'sw_activa_servicio_1', ll_rut)
							w_validar_promesa_operaciones.dw_revision.setitem(1,'fecha_activacion',gdt_fec_sistema )
						else
							w_validar_promesa_operaciones.dw_revision.setitem(1,'sw_activa_servicio', ll_sw)
							w_validar_promesa_operaciones.dw_revision.setitem(1,'sw_activa_servicio_1', ll_rut)
							w_validar_promesa_operaciones.dw_revision.setitem(1,'fecha_activacion',ldt_nulo )
						end if
	//					w_validar_promesa_operaciones.dw_revision.object.sw_activa_servicio.visible			= true
	//					w_validar_promesa_operaciones.dw_revision.object.sw_activa_servicio_1.visible		= false
						w_validar_promesa_operaciones.dw_revision.accepttext()
					end if
				end if
			end if
			il_modif ++
			
		CASE 'quien_paga' 
			if isvalid(w_validar_promesa_operaciones) then
				il_modif ++
				ll_quien_paga			= dw_lista.getitemnumber(row,'quien_paga')
				ll_rut_3ro															= dw_lista.getitemnumber(il_row,'rut_3ro')
				ls_base																= dw_lista.getitemstring(il_row,'base')
				ls_serie																= dw_lista.getitemstring(il_row,'serie')
				ll_numero															= dw_lista.getitemnumber(il_row,'numero')
				if isnull(ll_rut_3ro) then ll_rut_3ro=0
				
				if ll_quien_paga=1 then
					
				elseif ll_quien_paga=2 then
					ls_string				= string(ls_base)+'~t'+string(ls_serie)+'~t'+string(ll_numero)+'~t'+string(ll_rut_3ro)+'~t'+string(il_row)
					if not isnull(ls_base) and not isnull(ls_serie) and ll_numero>0 then
						openwithparm(w_ingreso_funeraria_cliente_tercero,ls_string)
					end if
				elseif ll_quien_paga=3 then
					
				end if
			end if
END CHOOSE
this.accepttext()
end event

event itemfocuschanged;String		ls_columna,ls_nulo,ls_dv
Double	ll_rut
Long		ll_nulo

this.accepttext()
SetNull(ls_nulo);Setnull(ll_nulo)
if il_row > 0 then
	ll_rut										= dw_lista.getitemnumber(il_row,'rut_beneficiario')
	ls_dv										= dw_lista.getitemstring(il_row,'dv_beneficiario')
	if not isnull(ll_rut) and ll_rut>0 and not isnull(ls_dv) and ls_dv<>'' then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			cb_grabar.enabled				= false
			dw_lista.setfocus()
			dw_lista.scrolltorow(il_row)
			dw_lista.setcolumn('dv_beneficiario')
//		else
//			dw_lista.setfocus()
//			dw_lista.scrolltorow(il_row)
//			cb_grabar.enabled				= true
//			dw_lista.setcolumn('sw_activacion')
		end if
	end if
	if il_fila_validar > 0 and il_fila_ok > 0 and is_limpiar='S' then
		ll_rut		= dw_lista.getitemnumber(il_row,'rut_beneficiario')
		ls_dv		= dw_lista.getitemstring(il_row,'dv_beneficiario')
		if isnull(ll_rut) or isnull(ls_dv) then
			dw_lista.setitem(il_row,'rut_beneficiario',ll_nulo)
			dw_lista.setitem(il_row,'dv_beneficiario',ls_nulo)
		end if
		dw_lista.accepttext()
	end if
end if
end event

event clicked;il_row		= row
end event

event editchanged;String		ls_columna,ls_dv,ls_nulo
Long		ll_fila, ll_nulo,ll_fila_nulo
Double	ll_rut

is_limpiar				= 'N'
Setnull(ls_nulo);Setnull(ll_nulo)
ls_columna				= dwo.name
ll_fila						= row
il_fila_validar			= ll_fila - 1
if ls_columna='rut_beneficiario' or ls_columna='dv_beneficiario' or ls_columna='sw_activacion' then
	if il_fila_validar > 0 then
		ll_rut				= dw_lista.getitemnumber(il_fila_validar,'rut_beneficiario')
		ls_dv				= dw_lista.getitemstring(il_fila_validar,'dv_beneficiario')
		if isnull(ll_rut) or isnull(ls_dv) then
			messagebox("Advertencia","Debe Seguir Correlativo Beneficiario")	
			dw_lista.setitem(ll_fila,'rut_beneficiario',ll_nulo)
			dw_lista.setitem(ll_fila,'dv_beneficiario',ls_nulo)
			is_limpiar	= 'S'
		end if
		dw_lista.accepttext()
		ll_fila_nulo		= dw_lista.find('isnull(rut_beneficiario)',1,dw_lista.rowcount())
		if ll_fila_nulo > 0 then
			dw_lista.scrolltorow(ll_fila_nulo)
			dw_lista.setcolumn('rut_beneficiario')
			il_row			= ll_fila_nulo
		end if
		dw_lista.accepttext()
	end if
end if

end event

