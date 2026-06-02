forward
global type w_mant_reclamos_x_requerimiento from window
end type
type cb_agregar from commandbutton within w_mant_reclamos_x_requerimiento
end type
type dw_detalle_reclamos from datawindow within w_mant_reclamos_x_requerimiento
end type
type em_numero from editmask within w_mant_reclamos_x_requerimiento
end type
type cb_limpiar from commandbutton within w_mant_reclamos_x_requerimiento
end type
type cb_grabar from commandbutton within w_mant_reclamos_x_requerimiento
end type
type cb_1 from commandbutton within w_mant_reclamos_x_requerimiento
end type
type pb_aceptar from picturebutton within w_mant_reclamos_x_requerimiento
end type
type st_1 from statictext within w_mant_reclamos_x_requerimiento
end type
type dw_lista_reclamos from datawindow within w_mant_reclamos_x_requerimiento
end type
end forward

global type w_mant_reclamos_x_requerimiento from window
integer width = 4453
integer height = 1964
boolean titlebar = true
string title = "Mantenedor Reclamos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_agregar cb_agregar
dw_detalle_reclamos dw_detalle_reclamos
em_numero em_numero
cb_limpiar cb_limpiar
cb_grabar cb_grabar
cb_1 cb_1
pb_aceptar pb_aceptar
st_1 st_1
dw_lista_reclamos dw_lista_reclamos
end type
global w_mant_reclamos_x_requerimiento w_mant_reclamos_x_requerimiento

type variables
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9
long 		il_modif,il_cod_parque
String		is_codigo_sol,is_tipo_sol,is_depto,is_usu_asignado

end variables

on w_mant_reclamos_x_requerimiento.create
this.cb_agregar=create cb_agregar
this.dw_detalle_reclamos=create dw_detalle_reclamos
this.em_numero=create em_numero
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.cb_1=create cb_1
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_lista_reclamos=create dw_lista_reclamos
this.Control[]={this.cb_agregar,&
this.dw_detalle_reclamos,&
this.em_numero,&
this.cb_limpiar,&
this.cb_grabar,&
this.cb_1,&
this.pb_aceptar,&
this.st_1,&
this.dw_lista_reclamos}
end on

on w_mant_reclamos_x_requerimiento.destroy
destroy(this.cb_agregar)
destroy(this.dw_detalle_reclamos)
destroy(this.em_numero)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.cb_1)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_lista_reclamos)
end on

event open;Long		ll_new,ll_cod_parque,ll_num_req
string		ls_depto

ll_num_req		= long(em_numero.text)

if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
end if

il_modif	= 0

gf_centrar(w_mant_reclamos_x_requerimiento)
dw_lista_reclamos.settransobject(sqlca)
dw_detalle_reclamos.settransobject(sqlca)

dw_lista_reclamos.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

dw_lista_reclamos.getchild('serie',idw_detalle6)  // base
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_lista_reclamos.getchild('codigo_reclamo',idw_detalle7)  // depto
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

dw_lista_reclamos.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)

dw_lista_reclamos.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve(ll_cod_parque)

dw_lista_reclamos.getchild('sepultura',idw_detalle3)  //Parque y Sector
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

dw_lista_reclamos.getchild('usuario_asignado',idw_detalle4)
idw_detalle4.settransobject(sqlca)
//idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP')
idw_detalle4.retrieve(gs_user,'GP',gs_depto)
//idw_detalle4.retrieve(gs_depto,ll_cod_parque)

//dw_lista_reclamos.getchild('usuario_asignado',idw_detalle4)
//idw_detalle4.settransobject(sqlca)
////idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP','2')
////idw_detalle4.retrieve(ll_cod_parque,'GP','2')
////idw_detalle4.retrieve(gs_user,ll_cod_parque)
//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_depto)
//
dw_lista_reclamos.getchild('ult_estado_gestion',idw_detalle5)	// depto
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve()

dw_lista_reclamos.getchild('usuario_crea',idw_detalle9)
idw_detalle9.settransobject(sqlca)
idw_detalle9.retrieve(gs_user,'GP',gs_depto)
//
dw_lista_reclamos.insertrow(0)
em_numero.setfocus()
//
//ll_new				= dw_lista_reclamos.insertrow(0)
//dw_lista_reclamos.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
//dw_lista_reclamos.setitem(ll_new,'cod_parque',ll_cod_parque)
//dw_lista_reclamos.setitem(ll_new,'usuario_crea',gs_user)
//dw_lista_reclamos.setitem(ll_new,'ult_estado_gestion',0)
//dw_lista_reclamos.setitem(ll_new,'ult_fecha_gestion',date(gdt_fec_sistema))
////dw_lista_reclamos.setitem(ll_new,'cod_estado_reg','V')
//dw_lista_reclamos.setitem(ll_new,'depto_crea',gs_depto)
//dw_lista_reclamos.setitem(ll_new,'origen','0')
end event

type cb_agregar from commandbutton within w_mant_reclamos_x_requerimiento
boolean visible = false
integer x = 535
integer y = 1744
integer width = 288
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agregar"
end type

event clicked;string 		ls_estado,ls_base,ls_serie,ls_user_modif,ls_user_crea,ls_pasa,ls_descrip,ls_usuario_asig,ls_depto_asig,ls_observacion,ls_cod_solicitud,ls_glosa
long			ll_nro_reclamo,ll_cod_solicitud,ll_tot_reg,ll_row,ll_corr,ll_indi,ll_cod_gestion,ll_cod_parque,ll_nulo,ll_etapa
datetime		ldt_fec_modif,ldt_fec_sistema
Double		ll_numero
ll_tot_reg		= dw_detalle_reclamos.rowcount()
//ll_count			= ll_tot_reg
//ll_count++
if ll_tot_reg > 0 then
	ll_nro_reclamo		= dw_detalle_reclamos.getitemnumber(ll_tot_reg,'numero_reclamo')
	ls_cod_solicitud		= dw_detalle_reclamos.getitemstring(ll_tot_reg,'codigo_solicitud')
	ll_cod_gestion		= dw_detalle_reclamos.getitemnumber(ll_tot_reg,'codigo_gestion')
	ll_cod_parque		= dw_detalle_reclamos.getitemnumber(ll_tot_reg,'cod_parque')
	ls_usuario_asig		= dw_detalle_reclamos.getitemstring(ll_tot_reg,'usuario_asig')
	ls_depto_asig		= dw_detalle_reclamos.getitemstring(ll_tot_reg,'depto_asig')
	ls_observacion		= dw_detalle_reclamos.getitemstring(ll_tot_reg,'observacion')
	ls_glosa				= dw_detalle_reclamos.getitemstring(ll_tot_reg,'glosa_gestion')
	if ll_cod_gestion > 0 then
		dw_detalle_reclamos.insertrow(0)
		ll_row					= ll_tot_reg +1
//		dw_ingreso.setitem(ll_row,'correlativo',ll_corr)
		dw_detalle_reclamos.setitem(ll_row,'numero_reclamo',ll_nro_reclamo)
		dw_detalle_reclamos.setitem(ll_row,'codigo_solicitud',ls_cod_solicitud)
		dw_detalle_reclamos.setitem(ll_row,'codigo_gestion',ll_cod_gestion)
		dw_detalle_reclamos.setitem(ll_row,'cod_parque',ll_cod_parque)
		dw_detalle_reclamos.setitem(ll_row,'usuario_asig',ls_usuario_asig)
		dw_detalle_reclamos.setitem(ll_row,'depto_asig',ls_depto_asig)
		dw_detalle_reclamos.setitem(ll_row,'observacion',ls_observacion)
		dw_detalle_reclamos.setitem(ll_row,'glosa_gestion',ls_glosa)
		dw_detalle_reclamos.setitem(ll_row,'fecha_crea',gdt_fec_sistema)
		dw_detalle_reclamos.setitem(ll_row,'fecha_gestion',gdt_fec_sistema)
		if not isnull(ll_cod_gestion) and ll_cod_gestion > 0 then
			setnull(ll_nulo)
			SELECT 	"RECLAMO_ESTADO"."NIVEL"
			INTO		:ll_etapa
			FROM 	"RECLAMO_ESTADO" 
			WHERE 	"RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion
			USING 	sqlca;	
			//dw_detalle_reclamos.setitem(ll_row,'nivel',ll_nulo)
			dw_detalle_reclamos.setitem(ll_row,'nivel',ll_etapa)
			dw_detalle_reclamos.accepttext()
			dw_lista_reclamos.setitem(1,'ult_estado_gestion',ll_cod_gestion)
			if ll_cod_gestion >= 10 then
				dw_lista_reclamos.setitem(1,'cod_estado_reg','G')
			else
				dw_lista_reclamos.setitem(1,'cod_estado_reg','V')
			end if
			dw_lista_reclamos.accepttext()
			dw_detalle_reclamos.accepttext()
			il_modif ++	
		end if
		dw_detalle_reclamos.accepttext()
	else
		//messagebox('Advertencia','No Hay Beneficio Asignado')
	end if
end if
end event

type dw_detalle_reclamos from datawindow within w_mant_reclamos_x_requerimiento
integer x = 9
integer y = 800
integer width = 4379
integer height = 904
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_mantenedor_reclamo_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
end type

event itemchanged;string ls_columna
long	ll_etapa,ll_row,ll_cod_gestion,ll_nulo,ll_count

ls_columna				= dwo.name
ll_row						= getrow()
ll_count					= rowcount()
dw_detalle_reclamos.accepttext()
if ls_columna='codigo_gestion' then
	ll_cod_gestion			= dw_detalle_reclamos.getitemnumber(ll_row,'codigo_gestion')
	if not isnull(ll_cod_gestion) and ll_cod_gestion > 0 then
		setnull(ll_nulo)
		SELECT 	"RECLAMO_ESTADO"."NIVEL"
		INTO		:ll_etapa
		FROM 	"RECLAMO_ESTADO" 
		WHERE 	"RECLAMO_ESTADO"."CODIGO_ESTADO" = :ll_cod_gestion
		USING 	sqlca;	
		dw_detalle_reclamos.setitem(ll_row,'nivel',ll_nulo)
		dw_detalle_reclamos.setitem(ll_row,'nivel',ll_etapa)
		dw_detalle_reclamos.accepttext()
		if ll_count = ll_row then
			dw_lista_reclamos.setitem(1,'ult_estado_gestion',ll_cod_gestion)
			if ll_cod_gestion >= 10 then
				dw_lista_reclamos.setitem(1,'cod_estado_reg','G')
			else
				dw_lista_reclamos.setitem(1,'cod_estado_reg','V')
			end if
			dw_lista_reclamos.accepttext()
		end if	
		dw_lista_reclamos.accepttext()
		dw_detalle_reclamos.accepttext()
		il_modif ++	
	end if	
end if	

end event

type em_numero from editmask within w_mant_reclamos_x_requerimiento
integer x = 594
integer y = 64
integer width = 434
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

event modified;string ls_depto
long	ll_cod_parque

//dw_lista_reclamos.reset()
//dw_detalle_reclamos.reset()
//dw_detalle_reclamos.insertrow(0)
//dw_detalle_reclamos.enabled = false
//ll_cod_parque		= 1
//dw_lista_reclamos.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
//idw_detalle8.settransobject(sqlca)
//idw_detalle8.insertrow(0)
//
//dw_lista_reclamos.getchild('serie',idw_detalle6)  // base
//idw_detalle6.settransobject(sqlca)
//idw_detalle6.insertrow(0)
//
//dw_lista_reclamos.getchild('codigo_reclamo',idw_detalle7)  // depto
//idw_detalle7.settransobject(sqlca)
//idw_detalle7.insertrow(0)
//
//dw_lista_reclamos.getchild('area',idw_detalle)
//idw_detalle.settransobject(sqlca)
//idw_detalle.retrieve(ll_cod_parque)
//
//dw_lista_reclamos.getchild('sector',idw_detalle2)
//idw_detalle2.settransobject(sqlca)
//idw_detalle2.retrieve(ll_cod_parque)
//
//dw_lista_reclamos.getchild('sepultura',idw_detalle3)  //Parque y Sector
//idw_detalle3.settransobject(sqlca)
//idw_detalle3.insertrow(0)
//
//dw_lista_reclamos.getchild('usuario_asignado',idw_detalle4)
//idw_detalle4.settransobject(sqlca)
////idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP','2')
//idw_detalle4.retrieve(gs_user,'GP',ls_depto)
//
//dw_lista_reclamos.getchild('ult_estado_gestion',idw_detalle5)	// depto
//idw_detalle5.settransobject(sqlca)
//idw_detalle5.retrieve()
//
//dw_lista_reclamos.insertrow(0)
//dw_lista_reclamos.enabled = false
//
if long(em_numero.text) > 0 then 
	pb_aceptar.triggerevent(clicked!)
end if	
end event

type cb_limpiar from commandbutton within w_mant_reclamos_x_requerimiento
integer x = 2085
integer y = 1752
integer width = 233
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;string ls_depto
long	ll_cod_parque

dw_lista_reclamos.reset()
dw_detalle_reclamos.reset()
dw_detalle_reclamos.insertrow(0)
dw_detalle_reclamos.enabled = false
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
end if
dw_lista_reclamos.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

dw_lista_reclamos.getchild('serie',idw_detalle6)  // base
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_lista_reclamos.getchild('codigo_reclamo',idw_detalle7)  // depto
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

dw_lista_reclamos.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)

dw_lista_reclamos.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve(ll_cod_parque)

dw_lista_reclamos.getchild('sepultura',idw_detalle3)  //Parque y Sector
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

dw_lista_reclamos.getchild('usuario_asignado',idw_detalle4)
idw_detalle4.settransobject(sqlca)
//idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP','2')
idw_detalle4.retrieve(gs_user,'GP',ls_depto)

dw_lista_reclamos.getchild('ult_estado_gestion',idw_detalle5)	// depto
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve()
em_numero.text		= ''
setfocus(em_numero)

dw_lista_reclamos.insertrow(0)
dw_lista_reclamos.enabled = false
end event

type cb_grabar from commandbutton within w_mant_reclamos_x_requerimiento
integer x = 9
integer y = 1748
integer width = 325
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string	ls_codigo_sol,ls_tipo_sol,ls_depto,ls_usu_asignado,ls_nivel,ls_pasa='S',ls_graba='N',ls_usu_crea
long	ll_cod_parque,ll_requerimiento,ll_res,ll_count_det,ll_indi

if dw_lista_reclamos.rowcount()>0 then
	dw_lista_reclamos.accepttext()
	dw_detalle_reclamos.accepttext()
	if il_modif > 0 then
		ll_res						= 	messagebox("Grabar","Está seguro Grabar Modificaciones en Requerimiento N° "+em_numero.text,Exclamation!,YesNo!,2)
		if ll_res=1 then
			ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
			ls_tipo_sol			= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
			ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
			ll_cod_parque		= long(dw_lista_reclamos.getitemnumber(1,'cod_parque'))
			ls_usu_asignado	= dw_lista_reclamos.getitemstring(1,'usuario_asignado')
			ll_requerimiento	= dw_lista_reclamos.getitemnumber(1,'codigo_reclamo')
			ls_usu_crea			= dw_lista_reclamos.getitemstring(1,'usuario_crea')
			if isnull(ls_codigo_sol) or ls_codigo_sol = '' then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Ingresar Codigo de Solicitud')
			end if
			if isnull(ls_tipo_sol) or ls_tipo_sol = '' then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Ingresar Tipo de Solicitud')
			end if
			if isnull(ls_depto) or ls_depto = '' then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Ingresar Departamento Solicitante')
			end if
			if isnull(ll_cod_parque) or ll_cod_parque = 0 then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Ingresar Parque')
			end if
			if isnull(ll_requerimiento) or ll_requerimiento = 0 then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Codigo de Requerimiento')
			end if
			if isnull(ls_usu_asignado) or ls_usu_asignado = '' then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Usuario Asignado')
			end if
			if isnull(ls_usu_crea) or ls_usu_crea = '' then
				ls_pasa = 'N'
				messagebox('Advertencia','Falta Usuario Creador')
			end if
			if ls_pasa = 'S' then
				ls_graba	= 'N'
				dw_lista_reclamos.setitem(1,'usuario_modif',gs_user)
				dw_lista_reclamos.setitem(1,'fecha_modif',gdt_fec_sistema)
		//		dw_lista_reclamos.setitem(1,'ult_fecha_gestion',gdt_fec_sistema)
				dw_lista_reclamos.setitem(1,'usuario_crea',ls_usu_crea)
				dw_lista_reclamos.accepttext()
				if dw_lista_reclamos.update() = 1 then
					commit;
					SELECT 	"ENCARGADOS"."NIVEL_RECLAMO"  
					INTO 		:ls_nivel  
					FROM 	"ENCARGADOS"  
					WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usu_asignado
					USING	sqlca;
					ls_graba			= 'S'
					ll_count_det		= dw_detalle_reclamos.rowcount()
					if isnull(ll_count_det) then ll_count_det = 0
					if ll_count_det> 0 then
						if dw_detalle_reclamos.update() = 1 then
							ls_graba	= 'S'
							commit;
						else
							ls_graba='N'
						end if
					else
						ls_graba='N'
					end if	
					if ls_graba='S' then
						messagebox('Aviso','Grabación Cabecera Exitosa')
						cb_limpiar.triggerevent(clicked!)
					end if	
				end if
			end if
		end if	
	else
		messagebox('Aviso','No se Modificaron Datos')
	end if	
end if	

//					UPDATE 	"RECLAMO_SOLICITUD_DETALLE"  
//					SET 		"CODIGO_SOLICITUD" = :ls_codigo_sol  
//					WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_requerimiento ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLICITUD" = :is_codigo_sol ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."CODIGO_SOLICITUD" is not null )  
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit;
//					else
//						rollback;
//					end if
//					
//					UPDATE 	"RECLAMO_SOLICITUD_DETALLE"  
//					SET 		"DEPTO_ASIG" = :ls_depto  
//					WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_requerimiento ) AND  
//							   ( "RECLAMO_SOLICITUD_DETALLE"."DEPTO_ASIG" = :is_depto ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."DEPTO_ASIG" is not null )  
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit;
//					else
//						rollback;
//					end if
//					
//					UPDATE 	"RECLAMO_SOLICITUD_DETALLE"  
//					SET 		"COD_PARQUE" = :ll_cod_parque  
//					WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_requerimiento ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."COD_PARQUE" = :il_cod_parque ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."COD_PARQUE" is not null )  
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit;
//					else
//						rollback;
//					end if
//					
//					UPDATE 	"RECLAMO_SOLICITUD_DETALLE"  
//					SET 		"USUARIO_ASIG" = :ls_usu_asignado,
//								"NIVEL" = :ls_nivel
//					WHERE ( "RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_requerimiento ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."USUARIO_ASIG" = :is_usu_asignado ) AND  
//							  ( "RECLAMO_SOLICITUD_DETALLE"."USUARIO_ASIG" is not null )  
//					USING	sqlca;
//					if sqlca.sqlcode=0 then
//						commit;
//					else
//						rollback;
//					end if
end event

type cb_1 from commandbutton within w_mant_reclamos_x_requerimiento
integer x = 4064
integer y = 1748
integer width = 325
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mant_reclamos_x_requerimiento)
end event

type pb_aceptar from picturebutton within w_mant_reclamos_x_requerimiento
integer x = 1065
integer y = 36
integer width = 146
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string ls_reclamo,ls_tipo_solicitud,ls_depto,ls_usua_origen,ls_usuario,ls_gerencia
long	ll_reclamo,ll_cod_parque,ll_max_reclamo
datetime	ldt_fecha_crea

setnull(ll_reclamo)
ll_reclamo	= long(em_numero.text)
il_modif		= 0
dw_lista_reclamos.reset()
dw_detalle_reclamos.reset()
dw_detalle_reclamos.insertrow(0)
dw_detalle_reclamos.enabled = false
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
end if
dw_lista_reclamos.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
idw_detalle8.settransobject(sqlca)
idw_detalle8.insertrow(0)

dw_lista_reclamos.getchild('serie',idw_detalle6)  // base
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_lista_reclamos.getchild('codigo_reclamo',idw_detalle7)  // depto
idw_detalle7.settransobject(sqlca)
idw_detalle7.insertrow(0)

dw_lista_reclamos.getchild('area',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)

dw_lista_reclamos.getchild('sector',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.retrieve(ll_cod_parque)

dw_lista_reclamos.getchild('sepultura',idw_detalle3)  //Parque y Sector
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

dw_lista_reclamos.getchild('usuario_asignado',idw_detalle4)
idw_detalle4.settransobject(sqlca)
//idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP','2')
idw_detalle4.retrieve(gs_user,'GP',ls_depto)

dw_lista_reclamos.getchild('ult_estado_gestion',idw_detalle5)	// depto
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve()

dw_lista_reclamos.insertrow(0)
dw_lista_reclamos.enabled = false

if ll_reclamo > 0 then
	SELECT 	max("RECLAMO_SOLICITUD"."NUMERO_RECLAMO")
	INTO 		:ll_max_reclamo  
	FROM 	"RECLAMO_SOLICITUD";
	if ll_reclamo <= ll_max_reclamo then
		dw_lista_reclamos.enabled = true
		dw_detalle_reclamos.enabled = true
		SELECT 	"RECLAMO_SOLICITUD"."COD_PARQUE"  
		INTO 		:ll_cod_parque  
		FROM 	"RECLAMO_SOLICITUD"  
		WHERE 	"RECLAMO_SOLICITUD"."NUMERO_RECLAMO" = :ll_reclamo ;
		
	//	if ll_cod_parque = 9999 then ll_cod_parque = 1;
		
		dw_lista_reclamos.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.insertrow(0)
		
		dw_lista_reclamos.getchild('serie',idw_detalle6)  // base
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.insertrow(0)
		
		dw_lista_reclamos.getchild('codigo_reclamo',idw_detalle7)  // depto
		idw_detalle7.settransobject(sqlca)
		idw_detalle7.insertrow(0)
		
		dw_lista_reclamos.getchild('area',idw_detalle)
		idw_detalle.settransobject(sqlca)
	//	idw_detalle.retrieve(ll_cod_parque)
		
		dw_lista_reclamos.getchild('sector',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
	//	idw_detalle2.retrieve(ll_cod_parque)
		
		dw_lista_reclamos.getchild('sepultura',idw_detalle3)  //Parque y Sector
		idw_detalle3.settransobject(sqlca)
		idw_detalle3.insertrow(0)
		
		dw_lista_reclamos.getchild('usuario_asignado',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
	//	idw_detalle4.retrieve(gs_user,ll_cod_parque,'GP','2')
	//	idw_detalle4.retrieve(gs_user,ll_cod_parque)
	//	idw_detalle4.retrieve(gs_user,'GP',ls_depto)
		
		dw_lista_reclamos.getchild('usuario_crea',idw_detalle9) // USUARIO ASIGNA
		idw_detalle9.settransobject(sqlca)
//		idw_detalle9.retrieve(gs_user,'GP',gs_depto)
			
		dw_lista_reclamos.getchild('ult_estado_gestion',idw_detalle5)	// depto
		idw_detalle5.settransobject(sqlca)
		idw_detalle5.retrieve()
		setfocus(em_numero)
		
		if dw_lista_reclamos.retrieve(ll_reclamo) > 0 then
			dw_detalle_reclamos.retrieve(ll_reclamo)
			ls_tipo_solicitud	= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
			ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_crea')
			idw_detalle7.retrieve(ls_depto,ls_tipo_solicitud)
			is_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
			is_tipo_sol			= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
			is_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
			il_cod_parque		= long(dw_lista_reclamos.getitemnumber(1,'cod_parque'))
			ls_usuario			= dw_lista_reclamos.getitemstring(1,'usuario_asignado')
			ls_gerencia			= dw_lista_reclamos.getitemstring(1,'cod_gerencia_asignado')
			
			idw_detalle4.retrieve(ls_usuario,ls_gerencia,is_depto)
			
			ls_usua_origen		= dw_detalle_reclamos.getitemstring(1,'usuario_asig')
			ldt_fecha_crea		= dw_detalle_reclamos.getitemdatetime(1,'fecha_crea')
			dw_detalle_reclamos.accepttext()
						
			idw_detalle.retrieve(ll_cod_parque)
			idw_detalle2.retrieve(ll_cod_parque)
		//	idw_detalle4.retrieve(ls_usuario,'GP',ls_depto)
			idw_detalle9.retrieve(gs_user,'GP',ls_depto)			
			dw_lista_reclamos.setitem(1,'fecha_origen',ldt_fecha_crea)
			dw_lista_reclamos.setitem(1,'usuario_origen',ls_usua_origen)
		else
			cb_limpiar.triggerevent(clicked!)
			messagebox("Advertencia","No registra Dato")
			setfocus(em_numero)
		end if
	else
		messagebox('Advertencia','No Existe Requerimiento Numero '+string(ll_reclamo) )
		cb_limpiar.triggerevent(clicked!)
		setfocus(em_numero)
	end if
else
	cb_limpiar.triggerevent(clicked!)
	messagebox('Advertencia','Debe Ingresar Requerimiento ')
	setfocus(em_numero)
end if	
end event

type st_1 from statictext within w_mant_reclamos_x_requerimiento
integer x = 32
integer y = 68
integer width = 535
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Requerimiento"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista_reclamos from datawindow within w_mant_reclamos_x_requerimiento
integer x = 9
integer y = 172
integer width = 4379
integer height = 600
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_mantenedor_reclamos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_base,ls_depto,ls_sector,ls_cod_gerencia,ls_nulo,ls_serie,ls_estado,ls_nombre,ls_codigo_sol,ls_area,ls_sepultura,ls_descrip,&
			ls_usuario_asig,ls_depto_asig,ls_gerencia_asig,ls_anexo,ls_fono,ls_celular,ls_email,ls_ap_pat,ls_ap_mat,ls_fono_p,ls_fono_c,ls_nombre_usu,&
			ls_resto_nom,ls_nivel,ls_string,ls_cod_gerencia_select,ls_tipo_solicitud,ls_usu_asignado,ls_geren,ls_depto_r,ls_nivel_r,ls_nivel_detalle,&
			ls_usu_detalle,ls_usuario_crea,ls_usu_crea_detalle
long		ll_cod_parque,ll_nulo,ll_estado,ll_rut,ll_mora_cred,ll_mora_mant,ll_cod_parque_usuario,ll_folio_asoc,ll_count_req,ll_cod_parque_cadena,&
			ll_indi,ll_tot_reg
Double	ll_numero
Setnull(ls_nulo);setnull(ll_nulo)

dw_lista_reclamos.accepttext()
ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
//if ls_codigo_sol <> '5' then ll_cod_parque=9999
ls_tipo_solicitud	= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
ls_usuario_asig		= dw_lista_reclamos.getitemstring(1,'usuario_asignado')
ls_nivel				= dw_lista_reclamos.getitemstring(1,'nivel')

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
	dw_lista_reclamos.setitem(1,'cod_parque',ll_cod_parque)
	if idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)=0 then
		dw_lista_reclamos.setitem(1,'codigo_reclamo',ll_nulo)
	end if
end if	
dw_lista_reclamos.accepttext()
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
	ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
	ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
	ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
//	ls_usuario			= dw_lista_reclamos.getitemstring(1,'usuario_asignado')

	SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia_select  
	FROM 	"RECLAMO_CODIGO_TIPO"  
	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
	
	idw_detalle.retrieve(ll_cod_parque)
	idw_detalle2.retrieve(ll_cod_parque)
	if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
		//idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select,ls_nivel)
		idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
	//	idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario)
	//	idw_detalle4.retrieve(ls_depto,ll_cod_parque)
		ll_tot_reg	= dw_detalle_reclamos.rowcount()
		if ll_tot_reg>0 then
			for ll_indi =1 to ll_tot_reg
				dw_detalle_reclamos.setitem(ll_indi,'cod_parque',ll_cod_parque)
				dw_detalle_reclamos.accepttext()
			next	
		end if
	else
		//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select,ls_nivel)
		//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
		idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		//idw_detalle4.retrieve(gs_user,ll_cod_parque)
		//idw_detalle4.retrieve(ls_depto,ll_cod_parque)
		ll_tot_reg	= dw_detalle_reclamos.rowcount()
		if ll_tot_reg>0 then
			for ll_indi =1 to ll_tot_reg
				dw_detalle_reclamos.setitem(ll_indi,'cod_parque',ll_cod_parque)
				dw_detalle_reclamos.accepttext()
			next	
		end if
	end if
elseif ls_columna = 'tipo_solicitud'  then	
	ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
	dw_lista_reclamos.accepttext()
	ls_tipo_solicitud		= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
	ls_depto_asig			= dw_lista_reclamos.getitemstring(1,'depto_asig')
	SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia_select  
	FROM 	"RECLAMO_CODIGO_TIPO"  
	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
	
	if idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)=0 then
		dw_lista_reclamos.setitem(1,'codigo_reclamo',ll_nulo)
	end if
	idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto_asig)
	idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
	dw_lista_reclamos.setitem(1,'codigo_reclamo',ll_nulo) 
	dw_detalle_reclamos.accepttext()
	
elseif ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ls_base				= dw_lista_reclamos.getitemstring(1,'base')
	ls_serie				= dw_lista_reclamos.getitemstring(1,'serie')
	ll_numero			= dw_lista_reclamos.getitemnumber(1,'numero')
	ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
	ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
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
			ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
			if ll_cod_parque_cadena <> ll_cod_parque and ls_codigo_sol = '5' then 
				ll_cod_parque	= ll_cod_parque_cadena
			else
				ll_cod_parque	= 9999
			end if
			SELECT	"ESTADO"."NOMBRE_ESTADO"  
			INTO		:ls_descrip  
			FROM		"ESTADO"  
			WHERE	"ESTADO"."COD_ESTADO" = :ls_estado   ;
			ls_estado								= 'Estado Contrato:  '+ls_descrip
			dw_lista_reclamos.object.t_estado.text	= ls_estado
			
			dw_lista_reclamos.object.t_mora_cred.text	= 'Mora Crédito ('+string(ll_mora_cred,'###,##0')+')'
			dw_lista_reclamos.object.t_mora_mant.text	= 'Mora Mantención ('+string(ll_mora_mant,'###,##0')+')'
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
				dw_lista_reclamos.setitem(1,'area',ls_area)
				dw_lista_reclamos.setitem(1,'sector',ls_sector)
				dw_lista_reclamos.setitem(1,'sepultura',ls_sepultura)
			end if
			ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')

			SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
			INTO 		:ls_cod_gerencia_select  
			FROM 	"RECLAMO_CODIGO_TIPO"  
			WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
//			if ll_cod_parque_usuario = 9999 then 
			if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
				//idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select,ls_nivel)
				//idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
				idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
				idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
				//idw_detalle4.retrieve(gs_user,ll_cod_parque)
				//idw_detalle4.retrieve(ls_depto,ll_cod_parque)
			else
				//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select,ls_nivel)
				idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
				idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
				//idw_detalle4.retrieve(gs_user,ll_cod_parque)
				//idw_detalle4.retrieve(ls_depto,ll_cod_parque)
			end if
			dw_lista_reclamos.setitem(1,'rut_titular',ll_rut)
			dw_lista_reclamos.setitem(1,'cod_parque',ll_cod_parque)
			dw_lista_reclamos.setcolumn('depto_asig')
		end if
	end if
elseif ls_columna='usuario_asignado' then
	dw_lista_reclamos.accepttext()
	ls_usuario_asig			= dw_lista_reclamos.getitemstring(1,'usuario_asignado')
	ls_tipo_solicitud		= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
	ll_tot_reg	= dw_detalle_reclamos.rowcount()
	dw_detalle_reclamos.accepttext()
	SELECT	"ENCARGADOS"."DEPTO",   
				"ENCARGADOS"."RECLAMO_COG_GEREN",
				"ENCARGADOS"."NIVEL_RECLAMO"
	INTO		:ls_depto_asig,   
				:ls_gerencia_asig,
				:ls_nivel
	FROM 	"ENCARGADOS"  
	WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
	USING	sqlca;	
////	ls_depto_asig			= dw_lista_reclamos.getitemstring(1,'depto_asig')
////	idw_detalle8.retrieve(ls_depto_asig)
	idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
	dw_lista_reclamos.accepttext()
////	idw_detalle7.retrieve(ls_usuario_asig,ls_depto_asig,ls_tipo_solicitud)
	dw_lista_reclamos.setitem(1,'cod_gerencia_asignado',ls_gerencia_asig)
//	dw_lista_reclamos.setitem(1,'depto_asig',ls_depto_asig)
	dw_lista_reclamos.setitem(1,'nivel',ls_nivel)
	//	for ll_indi =1 to ll_tot_reg
			ls_usu_detalle	= dw_detalle_reclamos.getitemstring(ll_tot_reg,'usuario_asig')
			if not isnull(ls_usu_detalle)  then
				dw_detalle_reclamos.setitem(ll_indi,'usuario_asig',ls_usuario_asig)
			//	dw_detalle_reclamos.setitem(ll_indi,'nivel',ls_nivel_r)
			end if	
	//	next	
	if ls_usuario_asig = gs_user then
		dw_lista_reclamos.setitem(1,'ult_estado_gestion',4)
	else
		dw_lista_reclamos.setitem(1,'ult_estado_gestion',1)
	end if
	dw_lista_reclamos.setitem(1,'codigo_reclamo',ll_nulo)
	dw_lista_reclamos.accepttext()
	ll_tot_reg	= dw_detalle_reclamos.rowcount()
	dw_detalle_reclamos.setitem(ll_tot_reg,'usuario_asig',ls_usuario_asig)
	dw_detalle_reclamos.accepttext()
elseif ls_columna='usuario_crea' then
	ll_tot_reg	= dw_detalle_reclamos.rowcount()
	dw_lista_reclamos.accepttext()
	ls_usuario_crea			= dw_lista_reclamos.getitemstring(1,'usuario_crea')
	ls_tipo_solicitud			= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
	dw_detalle_reclamos.accepttext()
	SELECT	"ENCARGADOS"."DEPTO",   
				"ENCARGADOS"."RECLAMO_COG_GEREN",
				"ENCARGADOS"."NIVEL_RECLAMO"
	INTO		:ls_depto_asig,   
				:ls_gerencia_asig,
				:ls_nivel
	FROM 	"ENCARGADOS"  
	WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_crea   
	USING	sqlca;	
////	ls_depto_asig			= dw_lista_reclamos.getitemstring(1,'depto_asig')
////	idw_detalle8.retrieve(ls_depto_asig)
	idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
	dw_lista_reclamos.accepttext()
////	idw_detalle7.retrieve(ls_usuario_asig,ls_depto_asig,ls_tipo_solicitud)
//	dw_lista_reclamos.setitem(1,'cod_gerencia_asignado',ls_gerencia_asig)
//	dw_lista_reclamos.setitem(1,'depto_asig',ls_depto_asig)
//	dw_lista_reclamos.setitem(1,'nivel',ls_nivel)
//		for ll_indi =1 to ll_tot_reg
//			ls_usu_crea_detalle	= dw_detalle_reclamos.getitemstring(ll_tot_reg,'usuario_crea')
//			if not isnull(ls_usu_crea_detalle)  then
//				dw_detalle_reclamos.setitem(ll_tot_reg,'usuario_crea',ls_usuario_crea)
//				//dw_detalle_reclamos.setitem(ll_tot_reg,'nivel',ls_nivel_r)
//			end if	
//		next	
//	if ls_usuario_asig = gs_user then
//		dw_lista_reclamos.setitem(1,'ult_estado_gestion',4)
//	else
//		dw_lista_reclamos.setitem(1,'ult_estado_gestion',1)
//	end if
//	dw_lista_reclamos.setitem(1,'codigo_reclamo',ll_nulo)
	dw_lista_reclamos.accepttext()
	ll_tot_reg	= dw_detalle_reclamos.rowcount()
	dw_detalle_reclamos.setitem(ll_tot_reg,'usuario_crea',ls_usuario_crea)
	dw_detalle_reclamos.accepttext()	
elseif ls_columna='numero_reclamo_original' then
	ll_folio_asoc		= dw_lista_reclamos.getitemnumber(1,'numero_reclamo_original')
	if ll_folio_asoc > 0 then
		SELECT 	Count("RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO")
		INTO 		:ll_count_req  
		FROM 	"RECLAMO_SOLICITUD_DETALLE"  
		WHERE 	"RECLAMO_SOLICITUD_DETALLE"."NUMERO_RECLAMO" = :ll_folio_asoc  
		USING	sqlca;
		if ll_count_req = 0 or isnull(ll_count_req) then
			messagebox("Advertencia","Requerimiento ORIGINAL Ingresado NO Existe")
			dw_lista_reclamos.setitem(1,'numero_reclamo_original',ll_nulo)
		end if
	end if
elseif ls_columna='rut_titular' then
//	ddplb_contratos.reset()
	ll_rut					= dw_lista_reclamos.getitemnumber(1,'rut_titular')
	SELECT 		"CLIENTE"."NOMBRE"  
	INTO 			:ls_nombre  
	FROM 		"CLIENTE"  
	WHERE 		"CLIENTE"."RUT" = :ll_rut  
	USING		sqlca;
	if sqlca.sqlcode <> 0 then
		messagebox("Advertencia","Rut Cliente Inexistente")
		dw_lista_reclamos.setitem(1,'rut_titular',ll_nulo)
	else
		DECLARE x1 CURSOR FOR  
		SELECT		"CADENA"."CODIGO",   
						"CADENA"."SERIE",   
						"CADENA"."NUMERO",
						"CADENA"."ESTADO"
		FROM 		"CADENA"  
		WHERE 		"CADENA"."RUT" = :ll_rut  
		ORDER BY	"CADENA"."NUMERO" ASC
		USING	sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x1 into :ls_base, :ls_serie, :ll_numero, :ls_estado;
				if not isnull(ll_numero) then
					if ls_estado='V' or ls_estado='C' then
						ls_string		= ls_base+'-'+ls_serie+'-'+string(ll_numero)
					else
						ls_string		= '[ '+ls_base+'-'+ls_serie+'-'+string(ll_numero)+' ]'
					end if
//					ddplb_contratos.additem(ls_string)
				end if
				Setnull(ll_numero)
			loop
		end if
		close x1;
//		ddplb_contratos.setfocus()
	end if
elseif ls_columna='codigo_solicitud' then
	ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
	ls_tipo_solicitud	= dw_lista_reclamos.getitemstring(1,'tipo_solicitud')
	dw_detalle_reclamos.accepttext()
	if not isnull(ls_codigo_sol) then
		SELECT 	"RECLAMO_CODIGO_TIPO"."CODIGO_DEPTO","RECLAMO_CODIGO_TIPO"."NIVEL","RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
		INTO 		:ls_depto_r,:ls_nivel_r,:ls_geren  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol and
					"RECLAMO_CODIGO_TIPO"."ESTADO_REG" = 'V'
		USING	sqlca;
		
//		SELECT	"ENCARGADOS"."DEPTO",   
//					"ENCARGADOS"."RECLAMO_COG_GEREN",
//					"ENCARGADOS"."NIVEL_RECLAMO"
//		INTO		:ls_depto_asig,   
//					:ls_gerencia_asig,
//					:ls_nivel
//		FROM 	"ENCARGADOS"  
//		WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario_asig   
//		USING	sqlca;
		
//		
//		SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA", "RECLAMO_CODIGO_TIPO"."CODIGO_DEPTO"  
//		INTO 		:ls_gerencia_asig,:ls_depto_asig  
//		FROM 	"RECLAMO_CODIGO_TIPO"  
//		WHERE 	( "RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol ) AND
//					( "RECLAMO_CODIGO_TIPO"."ESTADO_REG" = 'V' )
//		USING sqlca;
//
	//	dw_detalle_reclamos.accepttext()
	//	idw_detalle8.retrieve(ls_usuario_asig,ls_gerencia_asig,ls_depto_asig)
		idw_detalle8.retrieve(ls_depto_asig)
		idw_detalle7.retrieve(ls_depto_asig,ls_tipo_solicitud)
		idw_detalle4.retrieve(gs_user,ls_geren,ls_depto_r)
//		idw_detalle7.retrieve(ls_depto_r,ls_nivel_r)
		
		//idw_detalle7.insertrow(0)
		dw_lista_reclamos.setitem(1,'cod_gerencia_asignado',ls_geren)
		dw_lista_reclamos.setitem(1,'depto_asig',ls_depto_r)
		dw_lista_reclamos.setitem(1,'nivel',ls_nivel_r)
		dw_lista_reclamos.setitem(1,'usuario_asignado',ls_nulo)
		dw_lista_reclamos.setitem(1,'codigo_reclamo',ll_nulo)
		dw_lista_reclamos.accepttext()
		ll_tot_reg	= dw_detalle_reclamos.rowcount()
		if ll_tot_reg>0 then
			for ll_indi =1 to ll_tot_reg
				dw_detalle_reclamos.setitem(ll_indi,'depto_asig',ls_depto_r)
				dw_detalle_reclamos.setitem(ll_indi,'codigo_solicitud',ls_codigo_sol)
				dw_detalle_reclamos.accepttext()
			next	
		end if
	else
	
	end if	
elseif ls_columna='depto_asig' then
	ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
	ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
	idw_detalle7.retrieve(ls_depto,ls_tipo_solicitud)
	idw_detalle8.retrieve(ls_depto)
	SELECT	"RECLAMO_NIVEL"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia  
	FROM 	"RECLAMO_NIVEL"  
	WHERE ( "RECLAMO_NIVEL"."CODIGO_DEPTO" = :ls_depto ) AND  
			  ( "RECLAMO_NIVEL"."NIVEL" = '2' )   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
		SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
		INTO 		:ls_cod_gerencia_select  
		FROM 	"RECLAMO_CODIGO_TIPO"  
		WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
//		if ll_cod_parque_usuario = 9999 then 
		if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
		//	idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select,ls_nivel)
		//	idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
		idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		//	idw_detalle4.retrieve(gs_user,ll_cod_parque)
		else
//			idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select,ls_nivel)
			//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
			idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
			idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
			//idw_detalle4.retrieve(gs_user,ll_cod_parque)
		end if
		dw_lista_reclamos.setitem(1,'cod_gerencia_asignado',ls_cod_gerencia)
	else
		dw_lista_reclamos.setitem(1,'cod_gerencia_asignado',ls_nulo)
	end if
elseif ls_columna='sector' then
	ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
	ls_sector				= dw_lista_reclamos.getitemstring(1,'sector')
	idw_detalle3.retrieve(ll_cod_parque,ls_sector)
elseif ls_columna='cod_gerencia_asignado' then
	ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
	ls_cod_gerencia	= dw_lista_reclamos.getitemstring(1,'cod_gerencia_asignado')
	ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
	ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
	SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia_select  
	FROM 	"RECLAMO_CODIGO_TIPO"  
	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
//	if ll_cod_parque_usuario = 9999 then 
	if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
	//	idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select,ls_nivel)
	//	idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
		idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		//idw_detalle4.retrieve(gs_user,ll_cod_parque)
	//	idw_detalle4.retrieve(ls_depto,ll_cod_parque)
	else
		//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select,ls_nivel)
		//idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
		idw_detalle4.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		idw_detalle9.retrieve(gs_user,ls_cod_gerencia_select,ls_depto)
		//idw_detalle4.retrieve(gs_user,ll_cod_parque)
		//	idw_detalle4.retrieve(ls_depto,ll_cod_parque)
	end if
//elseif ls_columna='codigo_solicitud' then
//	ls_codigo_sol		= dw_lista_reclamos.getitemstring(1,'codigo_solicitud')
//	ls_depto				= dw_lista_reclamos.getitemstring(1,'depto_asig')
//	ll_cod_parque		= dw_lista_reclamos.getitemnumber(1,'cod_parque')
//	ls_usu_asignado	= dw_lista_reclamos.getitemstring(1,'usuario_asignado')
//	ll_numero			= dw_lista_reclamos.getitemnumber(1,'numero')
//	if not isnull(ls_usu_asignado) or ll_numero > 0 then
//		cb_limpiar.triggerevent(clicked!)
//		dw_lista_reclamos.setitem(1,'codigo_solicitud',ls_codigo_sol)
//		dw_lista_reclamos.accepttext()
//	end if
//	SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
//	INTO 		:ls_cod_gerencia_select  
//	FROM 	"RECLAMO_CODIGO_TIPO"  
//	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
//
////	if ll_cod_parque_usuario = 9999 then 
//	if ll_cod_parque_usuario = 9999 and ls_cod_gerencia_select <> 'GQ' then 
//		idw_detalle4.retrieve(gs_user,ll_cod_parque_usuario,ls_cod_gerencia_select)
//		dw_lista_reclamos.setitem(1,'cod_parque',ll_cod_parque_usuario)
//		dw_lista_reclamos.accepttext()
//	else
//		idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)
//	end if
//	
////	if ls_codigo_sol='4' then
////		SELECT	"ENCARGADOS"."NOMBRE",		"ENCARGADOS"."ANEXOS",		"ENCARGADOS"."FONO",		"ENCARGADOS"."CELULAR",		"ENCARGADOS"."RUT",	"ENCARGADOS"."EMAIL" 
////		INTO 		:ls_nombre,							:ls_anexo,							:ls_fono,							:ls_celular,							:ll_rut,						:ls_email
////		FROM 	"ENCARGADOS"  
////		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
////		USING	sqlca;
////		if sqlca.sqlcode=0 then
////			dw_ingreso.setitem(1,'rut_contacto',ll_rut)
////			dw_ingreso.setitem(1,'rut_titular',ll_rut)
////			if len(ls_nombre) > 20 then
////				ls_nombre_usu	= mid(ls_nombre,1,20)
////				ls_resto_nom	= mid(ls_nombre,20)
////				if len(ls_resto_nom) > 20 then
////					ls_ap_pat	= mid(ls_resto_nom,1,20)
////					ls_resto_nom	= mid(ls_resto_nom,20)
////					if len(ls_resto_nom) > 20 then
////						ls_ap_mat	= mid(ls_resto_nom,1,20)
////					else
////						ls_ap_mat	= ls_resto_nom
////					end if
////				else
////					ls_ap_mat			= '-'
////				end if
////			else
////				ls_nombre_usu		= ls_nombre
////				ls_ap_pat			= '-'
////				ls_ap_mat			= '-'
////			end if
////		end if
////		if isnull(ls_nombre_usu) then ls_nombre_usu='-'
////		if isnull(ls_ap_pat) then ls_ap_pat='-'
////		if isnull(ls_ap_mat) then ls_ap_mat='-'
////		if isnull(ls_fono) then ls_fono='-'
////		if isnull(ls_anexo) then 
////			ls_anexo				= '-'
////		else
////			ls_anexo				= 'ANEXO - '+ls_anexo
////		end if
////		if isnull(ls_celular) then ls_celular='-'
////		if isnull(ls_email) then ls_email='-'
////		dw_ingreso.setitem(1,'nombre_contacto',ls_nombre_usu)
////		dw_ingreso.setitem(1,'a_paterno_contacto',ls_ap_pat)
////		dw_ingreso.setitem(1,'a_materno_contacto',ls_ap_mat)
////		dw_ingreso.setitem(1,'fono_particular',ls_fono)
////		dw_ingreso.setitem(1,'fono_comercial',ls_anexo)
////		dw_ingreso.setitem(1,'celular',ls_celular)
////		dw_ingreso.setitem(1,'email',ls_email)
////		idw_detalle8.retrieve(ls_depto)
////	elseif ls_codigo_sol='5' then
//	if ls_codigo_sol='' or ls_codigo_sol='5' then
//		idw_detalle8.retrieve(ls_codigo_sol)
//		dw_lista_reclamos.setitem(1,'rut_contacto',ll_nulo)
//		dw_lista_reclamos.setitem(1,'rut_titular',ll_nulo)
//		dw_lista_reclamos.setitem(1,'nombre_contacto',ls_nulo)
//		dw_lista_reclamos.setitem(1,'a_paterno_contacto',ls_nulo)
//		dw_lista_reclamos.setitem(1,'a_materno_contacto',ls_nulo)
//		dw_lista_reclamos.setitem(1,'fono_particular',ls_nulo)
//		dw_lista_reclamos.setitem(1,'fono_comercial',ls_nulo)
//		dw_lista_reclamos.setitem(1,'celular',ls_nulo)
//		dw_lista_reclamos.setitem(1,'email',ls_nulo)
//	else
//		dw_lista_reclamos.setitem(1,'rut_contacto',ll_nulo)
//		dw_lista_reclamos.setitem(1,'rut_titular',ll_nulo)
//		dw_lista_reclamos.setitem(1,'nombre_contacto',ls_nulo)
//		dw_lista_reclamos.setitem(1,'a_paterno_contacto',ls_nulo)
//		dw_lista_reclamos.setitem(1,'a_materno_contacto',ls_nulo)
//		dw_lista_reclamos.setitem(1,'fono_particular',ls_nulo)
//		dw_lista_reclamos.setitem(1,'fono_comercial',ls_nulo)
//		dw_lista_reclamos.setitem(1,'celular',ls_nulo)
//		dw_lista_reclamos.setitem(1,'email',ls_nulo)
//	end if
end if	
dw_lista_reclamos.accepttext()
il_modif ++
end event

