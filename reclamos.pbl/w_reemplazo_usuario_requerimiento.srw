forward
global type w_reemplazo_usuario_requerimiento from window
end type
type cb_cerrar from commandbutton within w_reemplazo_usuario_requerimiento
end type
type cb_limpiar from commandbutton within w_reemplazo_usuario_requerimiento
end type
type cb_grabar from commandbutton within w_reemplazo_usuario_requerimiento
end type
type dw_ingreso from datawindow within w_reemplazo_usuario_requerimiento
end type
end forward

global type w_reemplazo_usuario_requerimiento from window
integer width = 3136
integer height = 876
boolean titlebar = true
string title = "Mantenedor - Reemplazar Usuario Requerimiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar cb_cerrar
cb_limpiar cb_limpiar
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_reemplazo_usuario_requerimiento w_reemplazo_usuario_requerimiento

on w_reemplazo_usuario_requerimiento.create
this.cb_cerrar=create cb_cerrar
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_cerrar,&
this.cb_limpiar,&
this.cb_grabar,&
this.dw_ingreso}
end on

on w_reemplazo_usuario_requerimiento.destroy
destroy(this.cb_cerrar)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;String		ls_depto

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_reemplazo_usuario_requerimiento)
ls_depto		= Message.StringParm
dw_ingreso.settransobject(sqlca)
dw_ingreso.getchild('usuario_origen',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ls_depto)=0 then
	idw_detalle.insertrow(0)
end if
dw_ingreso.getchild('usuario_destino',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
dw_ingreso.insertrow(0)
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_cerrar from commandbutton within w_reemplazo_usuario_requerimiento
integer x = 2679
integer y = 624
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_reemplazo_usuario_requerimiento)
end event

type cb_limpiar from commandbutton within w_reemplazo_usuario_requerimiento
integer x = 1367
integer y = 624
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_ingreso.reset()
dw_ingreso.settransobject(sqlca)
dw_ingreso.getchild('usuario_origen',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(gs_depto)=0 then
	idw_detalle.insertrow(0)
end if
dw_ingreso.getchild('usuario_destino',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
dw_ingreso.insertrow(0)
end event

type cb_grabar from commandbutton within w_reemplazo_usuario_requerimiento
integer x = 55
integer y = 624
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_res,ll_folio
String		ls_usu_origen,ls_usu_destino,ls_nivel_origen,ls_nivel_destino

dw_ingreso.accepttext()
ls_usu_origen	= dw_ingreso.getitemstring(1,'usuario_origen')
ls_usu_destino	= dw_ingreso.getitemstring(1,'usuario_destino')

SELECT 	"ENCARGADOS"."NIVEL_RECLAMO"  
INTO 		:ls_nivel_origen  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usu_origen   ;

SELECT 	"ENCARGADOS"."NIVEL_RECLAMO"  
INTO 		:ls_nivel_destino  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usu_destino   ;
if isnull(ls_usu_origen) then
	messagebox("Advertencia","Debe Selecciona Usuario Origen")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('usuario_origen')
elseif isnull(ls_usu_destino) then
	messagebox("Advertencia","Debe Selecciona Usuario Destino")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('usuario_destino')
elseif ls_nivel_origen <> ls_nivel_destino then
	messagebox("Advertencia","No realizar cambio de asignación es Obligatorio que tengan el mismo Nivel de Requerimiento ambos Usuarios, Usuario Origen "+ls_usu_origen + " tiene Nivel "+ls_nivel_origen+ " y Usuario Destino "+ls_usu_destino+ " tiene Nivel "+ls_nivel_destino)
	dw_ingreso.setfocus()
else
	ll_res		= messagebox("Grabar Cambios","Está Seguro Modificar Todos los Requerimiento de Usuario "+ls_usu_origen+" por Usario "+ls_usu_destino,Exclamation!,YesNo!,2)
	if ll_res=1 then
		SetPointer(HourGlass!)
		DECLARE x1 CURSOR FOR  
		SELECT 	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO"  
		FROM 	"RECLAMO_SOLICITUD"  
		WHERE ( "RECLAMO_SOLICITUD"."USUARIO_ASIGNADO" = :ls_usu_origen ) AND  
				  ( "RECLAMO_SOLICITUD"."COD_ESTADO_REG" = 'V' )  
		USING	sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0 
				fetch x1 into :ll_folio;
				if not isnull(ll_folio) and ll_folio > 0 then
					UPDATE 	"RECLAMO_SOLICITUD"  
					SET 		"USUARIO_ASIGNADO" = :ls_usu_destino  
					WHERE ( "RECLAMO_SOLICITUD"."USUARIO_ASIGNADO" = :ls_usu_origen ) AND  
							  ( "RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :ll_folio ) AND  
							  ( "RECLAMO_SOLICITUD"."COD_ESTADO_REG" = 'V' ) 
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
						UPDATE 	"RECLAMO_SOLICITUD"  
						SET 		"USUARIO_CREA" = :ls_usu_destino  
						WHERE ( "RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :ll_folio ) AND  
								  ( "RECLAMO_SOLICITUD"."USUARIO_CREA" = :ls_usu_origen )  
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
						else
							rollback using Trans_1;
							messagebox("Error Grabar","Error al Grabar RECLAMO_SOLICITUD Sql: "+Trans_1.sqlerrtext)
						end if
						UPDATE 	"RECLAMO_SOLICITUD_DETALLE"  
						SET 		"USUARIO_ASIG" = :ls_usu_destino  
						WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_folio ) AND  
								  ( "RECLAMO_SOLICITUD_DETALLE"."USUARIO_ASIG" = :ls_usu_origen ) 
						USING	Trans_2;
						if Trans_1.sqlcode=0 then
							commit using Trans_2;
//							messagebox("Grabar","Grabación Exitosa")
						else
							rollback using Trans_2;
							messagebox("Error Grabar","Error al Grabar RECLAMO_SOLICITUD_DETALLE Sql: "+Trans_2.sqlerrtext)
						end if
					else
						rollback using Trans_1;
						messagebox("Error Grabar","Error al Grabar RECLAMO_SOLICITUD Sql: "+Trans_1.sqlerrtext)
					end if
				end if
				Setnull(ll_folio)
			loop
		end if
		close x1;
		SetPointer(Arrow!)
		messagebox("Grabar","Grabación Exitosa")
		// Pasar a Procedure
	end if
end if
end event

type dw_ingreso from datawindow within w_reemplazo_usuario_requerimiento
integer x = 64
integer y = 172
integer width = 3022
integer height = 284
integer taborder = 10
string title = "none"
string dataobject = "dwe_reemplazo_usuario_reclamo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_depto,ls_reclamo,ls_nivel,ls_usu_origen,ls_columna,ls_nulo,ls_usu_destino

dw_ingreso.accepttext()
Setnull(ls_nulo)
ls_columna		= dwo.name
if ls_columna = 'usuario_origen' then
	ls_usu_origen	= dw_ingreso.getitemstring(1,'usuario_origen')
	SELECT	"ENCARGADOS"."DEPTO",  	"ENCARGADOS"."RECLAMO", 	"ENCARGADOS"."NIVEL_RECLAMO"  
	INTO 		:ls_depto,   						:ls_reclamo,   						:ls_nivel  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usu_origen  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if idw_detalle2.retrieve(ls_depto,ls_reclamo,ls_nivel )=0 then messagebox("Advertencia","No Registra Usuario para Reemplazar")
	end if
elseif ls_columna = 'usuario_destino' then
	ls_usu_origen	= dw_ingreso.getitemstring(1,'usuario_origen')
	ls_usu_destino	= dw_ingreso.getitemstring(1,'usuario_destino')
	if ls_usu_origen = ls_usu_destino then
		messagebox("Advertencia","No es Posible Seleccionar Usuario Origen")
		 dw_ingreso.Setitem(1,'usuario_destino',ls_nulo)
	end if
end if
This.accepttext()
end event

event itemfocuschanged;String		ls_usu_origen,ls_usu_destino,ls_nulo

this.accepttext()
ls_usu_origen	= dw_ingreso.getitemstring(1,'usuario_origen')
ls_usu_destino	= dw_ingreso.getitemstring(1,'usuario_destino')
if not isnull(ls_usu_origen) and not isnull(ls_usu_destino) then
	if ls_usu_origen = ls_usu_destino then
		 dw_ingreso.Setitem(1,'usuario_destino',ls_nulo)
	end if
end if
this.accepttext()
end event

