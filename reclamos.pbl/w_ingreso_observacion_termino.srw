forward
global type w_ingreso_observacion_termino from window
end type
type cb_grabar from commandbutton within w_ingreso_observacion_termino
end type
type cb_cerrar from commandbutton within w_ingreso_observacion_termino
end type
type dw_titulo from datawindow within w_ingreso_observacion_termino
end type
type dw_observacion from datawindow within w_ingreso_observacion_termino
end type
end forward

global type w_ingreso_observacion_termino from window
integer width = 3168
integer height = 1864
boolean titlebar = true
string title = "Ingreso Observación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_titulo dw_titulo
dw_observacion dw_observacion
end type
global w_ingreso_observacion_termino w_ingreso_observacion_termino

type variables
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8
Long		il_veces, il_modif,il_folio,il_ult_gestion
end variables

on w_ingreso_observacion_termino.create
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_titulo=create dw_titulo
this.dw_observacion=create dw_observacion
this.Control[]={this.cb_grabar,&
this.cb_cerrar,&
this.dw_titulo,&
this.dw_observacion}
end on

on w_ingreso_observacion_termino.destroy
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_titulo)
destroy(this.dw_observacion)
end on

event open;Long		ll_new,ll_reclamo,ll_codigo_gestion,ll_rut_contacto,ll_cod_parque,ll_codigo_solucion,ll_codigo_notificacion,ll_notifica
String		ls_codigo_solicitud,ls_usuario_crea,ls_oservacion,ls_glosa_gestion,ls_usuario_asig,ls_depto_asig,ls_nivel,ls_codigo_sol,ls_tipo_solicitud,&
			ls_gerencia_asig
datetime	ldt_fecha_crea,ldt_fecha_gestion,ldt_fecha_compromiso

ll_notifica		= 3
gf_centrar(w_ingreso_observacion_termino)
il_folio			= long(substr(1,1,Message.StringParm))
il_ult_gestion	= long(substr(1,2,Message.StringParm))

dw_titulo.settransobject(sqlca)
if il_ult_gestion = 5 or il_ult_gestion = 3 then
	dw_observacion.dataobject	= 'dw_ingreso_observacion_reasignar'
	dw_observacion.settransobject(sqlca)
	if gs_conexion = "Parque El Prado" then
		ll_cod_parque	= 1
	else
		ll_cod_parque	= 11
	end if
	dw_titulo.retrieve(il_folio,il_ult_gestion)
	dw_observacion.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
	idw_detalle8.settransobject(sqlca)
	idw_detalle8.insertrow(0)
	
	dw_observacion.getchild('serie',idw_detalle6)  // base
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.insertrow(0)
	
	dw_observacion.getchild('codigo_reclamo',idw_detalle7)  // depto
	idw_detalle7.settransobject(sqlca)
	idw_detalle7.insertrow(0)
	
	dw_observacion.getchild('area',idw_detalle)
	idw_detalle.settransobject(sqlca)
	idw_detalle.retrieve(ll_cod_parque)
	
	dw_observacion.getchild('sector',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	idw_detalle2.retrieve(ll_cod_parque)
	
	dw_observacion.getchild('sepultura',idw_detalle3)  //Parque y Sector
	idw_detalle3.settransobject(sqlca)
	idw_detalle3.insertrow(0)
	
	dw_observacion.getchild('usuario_asignado',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP')
	
	dw_observacion.getchild('ult_estado_gestion',idw_detalle5)	// depto
	idw_detalle5.settransobject(sqlca)
	idw_detalle5.retrieve()
	if dw_observacion.retrieve(il_folio) = 0 then
		messagebox("Advertencia","No Registra Dato")
		close(w_ingreso_observacion_termino)
	else
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
		ls_tipo_solicitud	= dw_observacion.getitemstring(1,'tipo_solicitud')
		ls_usuario_asig		= dw_observacion.getitemstring(1,'usuario_asignado')
		SELECT	"ENCARGADOS"."DEPTO",   
					"ENCARGADOS"."RECLAMO_COG_GEREN",
					"ENCARGADOS"."NIVEL_RECLAMO"
		INTO		:ls_depto_asig,   
					:ls_gerencia_asig,
					:ls_nivel
		FROM 	"ENCARGADOS"  
		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
		USING	sqlca;
		if sqlca.sqlcode=0 then	
			if idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)=0 then
//				dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
			end if
		end if	
		dw_titulo.retrieve(il_folio,il_ult_gestion)
		dw_observacion.getchild('area',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ll_cod_parque)
		
		dw_observacion.getchild('sector',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.retrieve(ll_cod_parque)
		
		dw_observacion.getchild('usuario_asignado',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP')
		il_veces									= 0
		il_modif									= 0
		dw_observacion.accepttext()
		dw_observacion.setfocus()
	end if
else
	dw_observacion.dataobject	= 'dw_ingreso_observacion_termino'
	dw_observacion.settransobject(sqlca)
	if dw_titulo.retrieve(il_folio,il_ult_gestion)>0 then
		SELECT	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO", 	"RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLICITUD", 	"RECLAMO_SOLICITUD_DETALLE"."FECHA_CREA",		"RECLAMO_SOLICITUD_DETALLE"."USUARIO_CREA",		"RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION", 		"RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION",	"RECLAMO_SOLICITUD_DETALLE"."OBSERVACION",	"RECLAMO_SOLICITUD_DETALLE"."GLOSA_GESTION",	"RECLAMO_SOLICITUD_DETALLE"."RUT_CONTACTO",	"RECLAMO_SOLICITUD_DETALLE"."COD_PARQUE",	"RECLAMO_SOLICITUD_DETALLE"."USUARIO_ASIG",	"RECLAMO_SOLICITUD_DETALLE"."DEPTO_ASIG",		"RECLAMO_SOLICITUD_DETALLE"."NIVEL",	"RECLAMO_SOLICITUD_DETALLE"."FECHA_COMPROMISO",		"RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLUCION",	"RECLAMO_SOLICITUD_DETALLE"."CODIGO_NOTIFICACION",	sysdate
		INTO 		:ll_reclamo, 															:ls_codigo_solicitud,													:ldt_fecha_crea,												:ls_usuario_crea, 													:ll_codigo_gestion,														:ldt_fecha_gestion,   												:ls_oservacion,   												:ls_glosa_gestion,   												:ll_rut_contacto,   													:ll_cod_parque,   												:ls_usuario_asig,   											:ls_depto_asig,   												:ls_nivel,   											:ldt_fecha_compromiso,   												:ll_codigo_solucion,   													:ll_codigo_notificacion,													:gdt_fec_sistema
		FROM 	"RECLAMO_SOLICITUD_DETALLE"  
		WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :il_folio ) AND  
				  ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 10 ) AND  
				  ( "RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION" =  (  SELECT 	MAX("RECLAMO_SOLICITUD_DETALLE"."FECHA_GESTION") 
																								FROM 	"RECLAMO_SOLICITUD_DETALLE" 
																								WHERE  ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :il_folio ) AND ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_GESTION" = 10 ) ) )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			ll_new		= dw_observacion.insertrow(0)
			dw_observacion.setitem(ll_new,'numero_reclamo',il_folio)
			dw_observacion.setitem(ll_new,'codigo_solicitud',ls_codigo_solicitud)
			dw_observacion.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
			dw_observacion.setitem(ll_new,'usuario_crea',gs_user)
			//dw_observacion.setitem(ll_new,'codigo_gestion',ll_codigo_gestion)
			dw_observacion.setitem(ll_new,'fecha_gestion',gdt_fec_sistema)
			dw_observacion.setitem(ll_new,'glosa_gestion',ls_glosa_gestion)
			dw_observacion.setitem(ll_new,'rut_contacto',ll_rut_contacto)
			dw_observacion.setitem(ll_new,'cod_parque',ll_cod_parque)
			dw_observacion.setitem(ll_new,'usuario_asig',ls_usuario_asig)
			dw_observacion.setitem(ll_new,'depto_asig',ls_depto_asig)
			dw_observacion.setitem(ll_new,'nivel',ls_nivel)
			dw_observacion.setitem(ll_new,'fecha_compromiso',ldt_fecha_compromiso)
			dw_observacion.setitem(ll_new,'codigo_solucion',ll_codigo_solucion)
			dw_observacion.setitem(ll_new,'codigo_notificacion',ll_notifica)
			dw_observacion.accepttext()
			dw_observacion.setfocus()
		end if
	else
		messagebox("Advertencia","No Existe Gestión Asociada, recuerde Requerimiento debe estar en Estado 10-SE ACEPTA RESPUESTA")
	end if
end if
end event

type cb_grabar from commandbutton within w_ingreso_observacion_termino
integer x = 50
integer y = 1632
integer width = 279
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String		ls_observacion,ls_base,ls_serie,ls_estado='50',ls_codigo_solicitud,ls_glosa_gestion,ls_usuario_asig,ls_depto_asig,ls_nivel
Long		ll_ult_estado_gestion,ll_fila,ll_cod_notificacion,ll_rut,ll_cod_gestion,ll_count_grabar,ll_codigo_gestion,ll_rut_contacto,ll_cod_parque,ll_codigo_reclamo,&
			ll_dias_compr
Double	ll_numero
datetime	ldt_fecha_compromiso,ldt_fecha_gestion,ldt_fec_ini,ldt_fec_fin,ldt_fecha_crea,ldt_fec_compr

SELECT sysdate   INTO :gdt_fec_sistema  FROM "TASA"  WHERE "TASA"."LOOK" = 1   ;

if dw_observacion.dataobject = 'dw_ingreso_observacion_reasignar' and il_modif > 0 then
	ldt_fecha_gestion				= gdt_fec_sistema
	ls_codigo_solicitud				= dw_observacion.getitemstring(1,'codigo_solicitud')
	ll_codigo_gestion				= dw_observacion.getitemnumber(1,'ult_estado_gestion')
	ls_observacion					= dw_observacion.getitemstring(1,'glosa_reclamo_original')
	ls_glosa_gestion				= dw_observacion.getitemstring(1,'ult_glosa_gestion')
	dw_observacion.setitem(1,'ult_fecha_gestion',ldt_fecha_gestion)
	ll_rut_contacto					= dw_observacion.getitemnumber(1,'rut_contacto')
	ll_cod_parque					= dw_observacion.getitemnumber(1,'cod_parque')
	ls_usuario_asig					= dw_observacion.getitemstring(1,'usuario_asignado')
	ls_depto_asig					= dw_observacion.getitemstring(1,'depto_asig')
	ls_nivel							= dw_observacion.getitemstring(1,'nivel')
	ll_codigo_reclamo				= dw_observacion.getitemnumber(1,'codigo_reclamo')
	ldt_fecha_crea					= datetime(date(dw_observacion.getitemdatetime(1,'fecha_crea')),time('00:00:00'))
//	ldt_fecha_compromiso		= ldt_fecha_gestion
	if isnull(ls_codigo_solicitud) or ls_codigo_solicitud='' then 
		messagebox("Advertencia","Debe Ingresar Codigo Solicitud")
		dw_observacion.setcolumn('codigo_solicitud')
		dw_observacion.setfocus()
	elseif isnull(ll_codigo_gestion) or ll_codigo_gestion=0 then 
		messagebox("Advertencia","Debe Ingresar Codigo gestión")
		dw_observacion.setcolumn('codigo_gestion')
		dw_observacion.setfocus()
		
	elseif isnull(ls_observacion) or ls_observacion='' then 
		messagebox("Advertencia","Debe Ingresar Observación")
		dw_observacion.setcolumn('observacion')
		dw_observacion.setfocus()
	elseif isnull(ls_glosa_gestion) or ls_glosa_gestion='' then 
		messagebox("Advertencia","Debe Ingresar Glosa Gestión")
		dw_observacion.setcolumn('glosa_gestion')
		dw_observacion.setfocus()
	elseif isnull(ldt_fecha_gestion) then
		messagebox("Advertencia","Debe Ingresar Fecha Gestión")
		dw_observacion.setcolumn('fecha_gestion')
		dw_observacion.setfocus()
	elseif isnull(ll_rut_contacto) or ll_rut_contacto=0 then 
		messagebox("Advertencia","Debe Ingresar Rut Contacto")
		dw_observacion.setcolumn('rut_contacto')
		dw_observacion.setfocus()
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then 
		messagebox("Advertencia","Debe Ingresar Codigo Parque")
		dw_observacion.setcolumn('cod_parque')
		dw_observacion.setfocus()
	elseif isnull(ls_usuario_asig) or ls_usuario_asig='' then 
		messagebox("Advertencia","Debe Ingresar usuario Asigna")
		dw_observacion.setcolumn('usuario_asig')
		dw_observacion.setfocus()
	elseif isnull(ls_depto_asig) or ls_depto_asig='' then 
		messagebox("Advertencia","Debe Ingresar Departamento Asigna")
		dw_observacion.setcolumn('depto_asig')
		dw_observacion.setfocus()
	elseif isnull(ls_nivel) or ls_nivel='' then 
		messagebox("Advertencia","Debe Ingresar Nivel")
		dw_observacion.setcolumn('nivel')
		dw_observacion.setfocus()
//	elseif isnull(ldt_fecha_compromiso) then 
//		messagebox("Advertencia","Debe Ingresar Fecha Compromiso")
//		dw_observacion.setcolumn('fecha_compromiso')
//		dw_observacion.setfocus()
	else	
		dw_observacion.setitem(1,'cod_estado_reg','V')
		if ls_glosa_gestion <> ls_observacion then
			dw_observacion.setitem(1,'glosa_reclamo_original',ls_glosa_gestion)
		end if
		dw_observacion.accepttext()
		if dw_observacion.update() = 1 then
			commit;
			ldt_fecha_gestion		= gdt_fec_sistema
			SELECT 		"RECLAMO_CODIGO_RECLAMO"."DIAS_GESTION"  
			INTO 			:ll_dias_compr  
			FROM 		"RECLAMO_CODIGO_RECLAMO"  
			WHERE 		"RECLAMO_CODIGO_RECLAMO"."CODIGO" = :ll_codigo_reclamo 
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_dias_compr) and ll_dias_compr>0 then
					ll_dias_compr																			= ll_dias_compr
				else
					ll_dias_compr																			= 0
				end if
			else
				ll_dias_compr																				= 0
			end if
			ldt_fec_compr																					= f_retorna_fecha_vcto_requerimiento(ldt_fecha_crea,ll_dias_compr)
			INSERT INTO "RECLAMO_SOLICITUD_DETALLE"  
						( "NUMERO_RECLAMO",  	"CODIGO_SOLICITUD",   	"FECHA_CREA",   	"USUARIO_CREA",   	"CODIGO_GESTION",  	"FECHA_GESTION",  	"OBSERVACION", 	"GLOSA_GESTION",  	"RUT_CONTACTO",  	"COD_PARQUE",  	"USUARIO_ASIG",  	"DEPTO_ASIG",  	"NIVEL",  	"FECHA_COMPROMISO",  	"CODIGO_SOLUCION",  	"CODIGO_NOTIFICACION",  	"REASIGNACION" )  
			VALUES 	( :il_folio,   						:ls_codigo_solicitud,   	:gdt_fec_sistema,  :gs_user,   				:ll_codigo_gestion,   		:ldt_fecha_gestion,   	:ls_observacion,  	:ls_glosa_gestion,   	:ll_rut_contacto,   		:ll_cod_parque,   	:ls_usuario_asig,   	:ls_depto_asig,   	:ls_nivel,   	:ldt_fec_compr,   				null,   						null,   							null )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				messagebox("Grabar Requerimiento","Grabación Exitosa")
				if isvalid(w_ver_todos_reclamos) then
					w_ver_todos_reclamos.pb_ok.triggerevent(clicked!)
				end if
				if isvalid(w_administrar_reclamos) then
					w_administrar_reclamos.pb_ok.triggerevent(clicked!)
				end if
				close(w_ingreso_observacion_termino)
			else
				rollback;
				messagebox("Error al Grabar","Error al Grabar Requerimiento Detalle SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error al Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	ll_count_grabar				= 0
	dw_observacion.accepttext()
	ls_observacion				= dw_observacion.getitemstring(1,'observacion')
	ll_cod_notificacion			= dw_observacion.getitemnumber(1,'codigo_notificacion')
	ll_cod_gestion				= dw_observacion.getitemnumber(1, 'codigo_gestion')
	ls_base						= dw_titulo.getitemstring(1,'reclamo_solicitud_base')
	ls_serie						= dw_titulo.getitemstring(1,'reclamo_solicitud_serie')
	ll_numero					= dw_titulo.getitemnumber(1,'reclamo_solicitud_numero')
	ll_rut							= dw_titulo.getitemnumber(1,'reclamo_solicitud_rut_titular')
	ll_ult_estado_gestion		= ll_cod_gestion
	if isnull(ls_observacion) or ls_observacion='' or ls_observacion='-' then
		messagebox("Advertencia","Debe Ingresar Observación")
		dw_observacion.setfocus()
		dw_observacion.setcolumn('observacion')
	elseif isnull(ll_cod_gestion) or ll_cod_gestion=0 then
		messagebox("Advertencia","Debe Ingresar Estado Gestión")
		dw_observacion.setfocus()
		dw_observacion.setcolumn('codigo_gestion')
	elseif isnull(ll_cod_notificacion) or ll_cod_notificacion=0 then
		messagebox("Advertencia","Debe Ingresar Notificación")
		dw_observacion.setfocus()
		dw_observacion.setcolumn('codigo_notificacion')
	else
		if dw_observacion.update() = 1 then
			commit;
			if isvalid(w_ver_todos_reclamos) then
				ll_fila								= w_ver_todos_reclamos.dw_lista.getrow()
				w_ver_todos_reclamos.dw_lista.setitem(ll_fila,'ult_estado_gestion',ll_ult_estado_gestion)
				w_ver_todos_reclamos.dw_lista.setitem(ll_fila,'ult_fecha_gestion',gdt_fec_sistema)
				w_ver_todos_reclamos.dw_lista.setitem(ll_fila,'ult_glosa_gestion',ls_observacion)
				w_ver_todos_reclamos.dw_lista.accepttext()
			end if
			if isvalid(w_administrar_reclamos) then
				ll_cod_parque							= w_administrar_reclamos.dw_parque.getitemnumber(1,'parque')
				ldt_fec_ini								= datetime(date(w_administrar_reclamos.em_inicio.text),time('00:00:00'))
				ldt_fec_fin								= datetime(date(w_administrar_reclamos.em_termino.text),time('23:59:59'))
				w_administrar_reclamos.tab_1.tabpage_2.dw_reclamos_rechazo.retrieve(ll_cod_parque,ldt_fec_ini,ldt_fec_fin,gs_depto,gs_user)
			end if
			UPDATE 	"RECLAMO_SOLICITUD"  
			SET		"USUARIO_CREA" =  :gs_user,
						"ULT_ESTADO_GESTION" = :ll_ult_estado_gestion,
						"COD_ESTADO_REG"	= 'G',
						"ULT_FECHA_GESTION" = :gdt_fec_sistema,   
						"ULT_GLOSA_GESTION" = :ls_observacion  
			WHERE 	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :il_folio   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				ll_count_grabar ++
			else
				rollback;
				messagebox("Error Grabar","Error Grabación Ultima Gestión SQL: "+sqlca.sqlerrtext)
			end if
			if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
				INSERT INTO "ATENCION_LOG"  
								( "RUT",  	"ESTADO",  		"FECHA", 				"GLOSA", 			"USUARIO", 		"BASE", 		"SERIE", 		"NUMERO" )  
				VALUES 		( :ll_rut, 		:ls_estado,  		:gdt_fec_sistema, 		:ls_observacion, 	:gs_user, 		:ls_base, 	:ls_serie, 	:ll_numero ) 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ll_count_grabar ++
				else
					rollback;
					messagebox("Error Grabar","Error Grabación Gestión en ATENCION_LOG SQL: "+sqlca.sqlerrtext)
				end if
			end if
			if ll_count_grabar > 0 then messagebox("Grabar","Grabación Exitosa")
			close(w_ingreso_observacion_termino)
		else
			rollback;
			messagebox("Error Grabar","Error Grabación Observación SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingreso_observacion_termino
integer x = 2825
integer y = 1632
integer width = 279
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_observacion_termino)
end event

type dw_titulo from datawindow within w_ingreso_observacion_termino
integer x = 50
integer y = 40
integer width = 3081
integer height = 620
string title = "none"
string dataobject = "dw_consultar_folio_reclamo_titulo"
boolean border = false
boolean livescroll = true
end type

type dw_observacion from datawindow within w_ingreso_observacion_termino
integer x = 50
integer y = 664
integer width = 3081
integer height = 948
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_observacion_reasignar"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_base,ls_depto,ls_sector,ls_cod_gerencia,ls_nulo,ls_serie,ls_estado,ls_nombre,ls_codigo_sol,ls_area,ls_sepultura,ls_descrip,&
			ls_usuario_asig,ls_depto_asig,ls_gerencia_asig,ls_anexo,ls_fono,ls_celular,ls_email,ls_ap_pat,ls_ap_mat,ls_fono_p,ls_fono_c,ls_nombre_usu,&
			ls_resto_nom,ls_nivel,ls_string,ls_cod_gerencia_select,ls_tipo_solicitud,ls_usu_asignado,ls_estado_titular
long		ll_cod_parque,ll_nulo,ll_estado,ll_rut,ll_mora_cred,ll_mora_mant,ll_cod_parque_usuario,ll_folio_asoc,ll_count_req,ll_cod_parque_cadena,ll_tipo_cliente 
Double	ll_numero
this.accepttext()
if dw_observacion.dataobject = 'dw_ingreso_observacion_reasignar' then
	il_modif ++
	Setnull(ls_nulo);setnull(ll_nulo)
	ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
//	if ls_codigo_sol <> '5' then ll_cod_parque=9999
	//if ls_codigo_sol <> '7' then ll_cod_parque=9999
	ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
	ls_tipo_solicitud	= dw_observacion.getitemstring(1,'tipo_solicitud')
	ls_usuario_asig		= dw_observacion.getitemstring(1,'usuario_asignado')
	
	if ls_usuario_asig = gs_user and (ls_tipo_solicitud <> 'F' and ls_tipo_solicitud <> 'T') then
		dw_observacion.setitem(1,'ult_estado_gestion',4)
	//elseif (ls_tipo_solicitud = 'F'	 or ls_tipo_solicitud = 'T') then
		//dw_observacion.setitem(1,'ult_estado_gestion',10)
	elseif ls_tipo_solicitud = 'F' then
		dw_observacion.setitem(1,'ult_estado_gestion',14)
	elseif ls_tipo_solicitud = 'T' then
		dw_observacion.setitem(1,'ult_estado_gestion',15)
	else
		dw_observacion.setitem(1,'ult_estado_gestion',1)
	end if
	
	SELECT	"ENCARGADOS"."DEPTO",   
				"ENCARGADOS"."RECLAMO_COG_GEREN",
				"ENCARGADOS"."NIVEL_RECLAMO"
	INTO		:ls_depto_asig,   
				:ls_gerencia_asig,
				:ls_nivel
	FROM 	"ENCARGADOS"  
	WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
	USING	sqlca;
	if sqlca.sqlcode=0 then	
		dw_observacion.setitem(1,'cod_parque',ll_cod_parque)
		//-- juan
		if ls_codigo_sol = '5' and ls_usuario_asig = gs_user then
			ls_depto_asig = 'Q'
		end if	
		//--fin
		if idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)=0 then
			dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
		end if
	end if	
	dw_observacion.accepttext()
	SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia_select  
	FROM 	"RECLAMO_CODIGO_TIPO"  
	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
	if ll_cod_parque > 0 and ls_cod_gerencia_select <> 'GQ' then
		SELECT	"ENCARGADOS"."COD_PARQUE"  
		INTO 		:ll_cod_parque_usuario
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
	end if
	ls_columna				= dwo.name
	if ls_columna='cod_parque' then
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
	
		SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
		INTO 		:ls_cod_gerencia_select  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
		idw_detalle.retrieve(ll_cod_parque)
		idw_detalle2.retrieve(ll_cod_parque)
		if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
			idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
		else
			idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
		end if
		
	elseif ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
		ls_base				= dw_observacion.getitemstring(1,'base')
		ls_serie				= dw_observacion.getitemstring(1,'serie')
		ll_numero			= dw_observacion.getitemnumber(1,'numero')
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		if not isnull(ls_base) then idw_detalle6.retrieve(ls_base)
		if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
			SELECT		"CADENA"."ESTADO" ,
							"CADENA"."RUT",
							"CADENA"."COD_PARQUE",
							"CADENA_MORA"."MORA_CRED",
							"CADENA_MORA"."MORA_MANT"
			INTO 			:ls_estado,
							:ll_rut,
							:ll_cod_parque_cadena,
							:ll_mora_cred,
							:ll_mora_mant
			FROM 		"CADENA",
							"CADENA_MORA"
			WHERE 	  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) AND  
						  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
						  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )  AND
						  ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero )  
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				SELECT 		"CD_FOLIO"."ULT_ESTADO"  
				INTO 			:ll_estado  
				FROM 		"CD_FOLIO"  
				WHERE 	  ( "CD_FOLIO"."BASE" = :ls_base ) AND  
							  ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
							  ( "CD_FOLIO"."NUMERO" = :ll_numero ) 
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","No Existe Nº Contrato "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,##0'))
				end if
			else
				ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
				if ls_codigo_sol = '5' or ls_codigo_sol = '7' then 	//if ll_cod_parque_cadena <> ll_cod_parque and ls_codigo_sol = '5' then 
					ll_cod_parque	= ll_cod_parque_cadena
				else
					ll_cod_parque	= 9999
				end if
				SELECT	"ESTADO"."NOMBRE_ESTADO"  
				INTO		:ls_descrip  
				FROM		"ESTADO"  
				WHERE	"ESTADO"."COD_ESTADO" = :ls_estado   ;
				ls_estado								= 'Estado Contrato:  '+ls_descrip
				dw_observacion.object.t_estado.text	= ls_estado
				
				dw_observacion.object.t_mora_cred.text	= 'Mora Crédito ('+string(ll_mora_cred,'###,##0')+')'
				dw_observacion.object.t_mora_mant.text	= 'Mora Mantención ('+string(ll_mora_mant,'###,##0')+')'
				if ls_base='O' then
					SELECT 		"PAGO_OFERTA"."AREA", 	"PAGO_OFERTA"."SECTOR", 	"PAGO_OFERTA"."SEPULTURA"  
					INTO 			:ls_area, 						:ls_sector,  							:ls_sepultura  
					FROM 		"OFERTA_V", 	"CADENA", 	"PAGO_OFERTA"  
					WHERE 	  ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
								  ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
								  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
								  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
								  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
								  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
								  ( "CADENA"."SERIE" = :ls_serie ) AND  
								  ( "CADENA"."NUMERO" = :ll_numero ) )  
					USING		sqlca;
				elseif ls_base='C' then
					SELECT	"CONTRATO"."ZONA", 	"CONTRATO"."SECTOR",  	"CONTRATO"."SEPULTURA"  
					INTO 		:ls_area,   					:ls_sector,   					:ls_sepultura  
					FROM 	"CADENA",  	"CONTRATO"  
					WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
							  ( "CADENA"."SERIE" = :ls_serie ) AND  
							  ( "CADENA"."NUMERO" = :ll_numero ) )  
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					idw_detalle.retrieve(ll_cod_parque)
					idw_detalle2.retrieve(ll_cod_parque)
					idw_detalle3.retrieve(ll_cod_parque,ls_sector)
					dw_observacion.setitem(1,'area',ls_area)
					dw_observacion.setitem(1,'sector',ls_sector)
					dw_observacion.setitem(1,'sepultura',ls_sepultura)
				end if
				ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
	
				SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
				INTO 		:ls_cod_gerencia_select  
				FROM 	"RECLAMO_CODIGO_TIPO"  
				WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
				if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
					idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
				else
					idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
				end if
				//--
				SELECT 		"CLIENTE"."ESTADO_TITULAR","CLIENTE"."TIPO_CLIENTE"  
				INTO 			:ls_estado_titular, :ll_tipo_cliente  
				FROM 		"CLIENTE"  
				WHERE 		"CLIENTE"."RUT" = :ll_rut  
				USING		sqlca;
				//--
				dw_observacion.setitem(1,'rut_titular',ll_rut)
				if not isnull(ll_tipo_cliente) then
					dw_observacion.setitem(1,'cliente_estado_titular',ls_estado_titular)
				end if
				if not isnull(ll_tipo_cliente) then
					dw_observacion.setitem(1,'cliente_tipo_cliente',ll_tipo_cliente)
				end if	
				dw_observacion.setitem(1,'cod_parque',ll_cod_parque)
				dw_observacion.setcolumn('depto_asig')
			end if
		end if
	elseif ls_columna='usuario_asignado' then
		ls_usuario_asig			= dw_observacion.getitemstring(1,'usuario_asignado')
		SELECT	"ENCARGADOS"."DEPTO",   
					"ENCARGADOS"."RECLAMO_COG_GEREN",
					"ENCARGADOS"."NIVEL_RECLAMO"
		INTO		:ls_depto_asig,   
					:ls_gerencia_asig,
					:ls_nivel
		FROM 	"ENCARGADOS"  
		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
		USING	sqlca;
		il_modif ++
		//-- juan
		if ls_codigo_sol = '5' and ls_usuario_asig = gs_user then
			ls_depto_asig = 'Q'
			idw_detalle8.retrieve(ls_depto_asig)
			idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		else
			idw_detalle8.retrieve(ls_depto_asig)
			idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		end if	
		//--fin
	//	idw_detalle8.retrieve(ls_depto_asig)
	//	idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		dw_observacion.setitem(1,'cod_gerencia_asignado',ls_gerencia_asig)
		dw_observacion.setitem(1,'depto_asig',ls_depto_asig)
		dw_observacion.setitem(1,'nivel',ls_nivel)
	//	if ls_usuario_asig = gs_user then
	//		dw_observacion.setitem(1,'ult_estado_gestion',4)
	//	else
	//		dw_observacion.setitem(1,'ult_estado_gestion',1)
	//	end if
		if ls_usuario_asig = gs_user and (ls_tipo_solicitud <> 'F' and ls_tipo_solicitud <> 'T') then
			dw_observacion.setitem(1,'ult_estado_gestion',4)
		//elseif (ls_tipo_solicitud = 'F'	 or ls_tipo_solicitud = 'T') then
			//dw_observacion.setitem(1,'ult_estado_gestion',10)
		elseif ls_tipo_solicitud = 'F' then
			dw_observacion.setitem(1,'ult_estado_gestion',14)
		elseif ls_tipo_solicitud = 'T' then
			dw_observacion.setitem(1,'ult_estado_gestion',15)
		else
			dw_observacion.setitem(1,'ult_estado_gestion',1)
		end if
		dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
		dw_observacion.accepttext()
	elseif ls_columna='numero_reclamo_original' then
		ll_folio_asoc		= dw_observacion.getitemnumber(1,'numero_reclamo_original')
		if ll_folio_asoc > 0 then
			SELECT 	Count("RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO")
			INTO 		:ll_count_req  
			FROM 	"RECLAMO_SOLICITUD_DETALLE"  
			WHERE 	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_folio_asoc  
			USING	sqlca;
			if ll_count_req = 0 or isnull(ll_count_req) then
				messagebox("Advertencia","Requerimiento ORIGINAL Ingresado NO Existe")
				dw_observacion.setitem(1,'numero_reclamo_original',ll_nulo)
			end if
		end if
	
	elseif ls_columna='depto_asig' then
		ls_depto				= dw_observacion.getitemstring(1,'depto_asig')
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		//-- juan
		if ls_codigo_sol = '5' and ls_usuario_asig = gs_user then
			ls_depto_asig = 'Q'
			idw_detalle8.retrieve(ls_depto_asig)
			idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		else
			idw_detalle8.retrieve(ls_depto_asig)
			idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		end if	
	//	//--fin
	//	idw_detalle7.retrieve(ls_depto,ls_tipo_solicitud)
	//	idw_detalle8.retrieve(ls_depto)
		SELECT	"RECLAMO_NIVEL"."CODIGO_GERENCIA"  
		INTO 		:ls_cod_gerencia  
		FROM 	"RECLAMO_NIVEL"  
		WHERE ( "RECLAMO_NIVEL"."CODIGO_DEPTO" = :ls_depto ) AND  
				  ( "RECLAMO_NIVEL"."NIVEL" = '2' )   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
			SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
			INTO 		:ls_cod_gerencia_select  
			FROM 	"RECLAMO_CODIGO_TIPO"  
			WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
			if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
				idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
			else
				idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
			end if
			dw_observacion.setitem(1,'cod_gerencia_asignado',ls_cod_gerencia)
		else
			dw_observacion.setitem(1,'cod_gerencia_asignado',ls_nulo)
		end if
	elseif ls_columna='sector' then
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		ls_sector				= dw_observacion.getitemstring(1,'sector')
		idw_detalle3.retrieve(ll_cod_parque,ls_sector)
	elseif ls_columna='tipo_solicitud' then
		dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
		dw_observacion.accepttext()
	elseif ls_columna='cod_gerencia_asignado' then
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		ls_cod_gerencia	= dw_observacion.getitemstring(1,'cod_gerencia_asignado')
		ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
		SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
		INTO 		:ls_cod_gerencia_select  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
		if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
			idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
		else
			idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
		end if
	elseif ls_columna='codigo_solicitud' then
		dw_observacion.setitem(1,'usuario_asignado',ls_nulo)
		dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
		dw_observacion.accepttext()
		ls_codigo_sol		= dw_observacion.getitemstring(1,'codigo_solicitud')
		ls_depto				= dw_observacion.getitemstring(1,'depto_asig')
		ll_cod_parque		= dw_observacion.getitemnumber(1,'cod_parque')
		ls_usu_asignado	= dw_observacion.getitemstring(1,'usuario_asignado')
		ll_numero			= dw_observacion.getitemnumber(1,'numero')
		ls_tipo_solicitud	= dw_observacion.getitemstring(1,'tipo_solicitud')
		if not isnull(ls_usu_asignado) or ll_numero > 0 then
//			cb_limpiar.triggerevent(clicked!)
			dw_observacion.setitem(1,'codigo_solicitud',ls_codigo_sol)
			dw_observacion.accepttext()
		end if
		SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
		INTO 		:ls_cod_gerencia_select  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
		
		//-- juan
		if ls_codigo_sol = '5' and ls_usuario_asig = gs_user then
			ls_depto_asig = 'Q'
		end if	
		//--fin
		if idw_detalle7.retrieve(ls_depto,ls_tipo_solicitud)=0 then
			dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
		end if
	
		if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
			idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
			dw_observacion.setitem(1,'cod_parque',ll_cod_parque_usuario)
			dw_observacion.accepttext()
		else
			idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
		end if
		
	end if	
	ls_usuario_asig			= dw_observacion.getitemstring(1,'usuario_asignado')
	if not isnull(ls_usuario_asig) then
		SELECT	"ENCARGADOS"."DEPTO",   
					"ENCARGADOS"."RECLAMO_COG_GEREN",
					"ENCARGADOS"."NIVEL_RECLAMO"
		INTO		:ls_depto_asig,   
					:ls_gerencia_asig,
					:ls_nivel
		FROM 	"ENCARGADOS"  
		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
		USING	sqlca;
		il_modif ++
		//-- juan
		if ls_codigo_sol = '5' and ls_usuario_asig = gs_user then
			ls_depto_asig = 'Q'
			idw_detalle8.retrieve(ls_depto_asig)
			idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		else
			idw_detalle8.retrieve(ls_depto_asig)
			idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		end if	
		//--fin
//	//	idw_detalle8.retrieve(ls_depto_asig)
//	//	idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
//		dw_observacion.setitem(1,'cod_gerencia_asignado',ls_gerencia_asig)
//		dw_observacion.setitem(1,'depto_asig',ls_depto_asig)
//		dw_observacion.setitem(1,'nivel',ls_nivel)
//	//	if ls_usuario_asig = gs_user then
//	//		dw_observacion.setitem(1,'ult_estado_gestion',4)
//	//	else
//	//		dw_observacion.setitem(1,'ult_estado_gestion',1)
//	//	end if
//		if ls_usuario_asig = gs_user and (ls_tipo_solicitud <> 'F' and ls_tipo_solicitud <> 'T') then
//			dw_observacion.setitem(1,'ult_estado_gestion',4)
//		//elseif (ls_tipo_solicitud = 'F'	 or ls_tipo_solicitud = 'T') then
//			//dw_observacion.setitem(1,'ult_estado_gestion',10)
//		elseif ls_tipo_solicitud = 'F' then
//			dw_observacion.setitem(1,'ult_estado_gestion',14)
//		elseif ls_tipo_solicitud = 'T' then
//			dw_observacion.setitem(1,'ult_estado_gestion',15)
//		else
//			dw_observacion.setitem(1,'ult_estado_gestion',1)
//		end if
//		dw_observacion.setitem(1,'codigo_reclamo',ll_nulo)
		dw_observacion.accepttext()
	end if
	this.accepttext()	
end if
end event

