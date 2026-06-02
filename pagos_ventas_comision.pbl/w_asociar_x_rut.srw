forward
global type w_asociar_x_rut from window
end type
type cb_grabar from commandbutton within w_asociar_x_rut
end type
type rb_nuevo from radiobutton within w_asociar_x_rut
end type
type cb_cerrar_cambio from commandbutton within w_asociar_x_rut
end type
type dw_solicitud_nue from datawindow within w_asociar_x_rut
end type
type dw_solicitud_ant from datawindow within w_asociar_x_rut
end type
type cb_limpiar from commandbutton within w_asociar_x_rut
end type
type cb_cambio_promesa from commandbutton within w_asociar_x_rut
end type
type fecha_t from statictext within w_asociar_x_rut
end type
type em_fecha_actual from editmask within w_asociar_x_rut
end type
type usuario_t from statictext within w_asociar_x_rut
end type
type st_usuario from statictext within w_asociar_x_rut
end type
type dw_promesa_nue from datawindow within w_asociar_x_rut
end type
type dw_promesa_ant from datawindow within w_asociar_x_rut
end type
type cb_cta_cte from commandbutton within w_asociar_x_rut
end type
type cb_cerrar from commandbutton within w_asociar_x_rut
end type
type dw_lista_promesa from datawindow within w_asociar_x_rut
end type
type gb_1 from groupbox within w_asociar_x_rut
end type
end forward

global type w_asociar_x_rut from window
integer width = 2213
integer height = 1796
boolean titlebar = true
string title = "Promesas Asociadas por Rut"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_grabar cb_grabar
rb_nuevo rb_nuevo
cb_cerrar_cambio cb_cerrar_cambio
dw_solicitud_nue dw_solicitud_nue
dw_solicitud_ant dw_solicitud_ant
cb_limpiar cb_limpiar
cb_cambio_promesa cb_cambio_promesa
fecha_t fecha_t
em_fecha_actual em_fecha_actual
usuario_t usuario_t
st_usuario st_usuario
dw_promesa_nue dw_promesa_nue
dw_promesa_ant dw_promesa_ant
cb_cta_cte cb_cta_cte
cb_cerrar cb_cerrar
dw_lista_promesa dw_lista_promesa
gb_1 gb_1
end type
global w_asociar_x_rut w_asociar_x_rut

type variables
Long		il_row
end variables

on w_asociar_x_rut.create
this.cb_grabar=create cb_grabar
this.rb_nuevo=create rb_nuevo
this.cb_cerrar_cambio=create cb_cerrar_cambio
this.dw_solicitud_nue=create dw_solicitud_nue
this.dw_solicitud_ant=create dw_solicitud_ant
this.cb_limpiar=create cb_limpiar
this.cb_cambio_promesa=create cb_cambio_promesa
this.fecha_t=create fecha_t
this.em_fecha_actual=create em_fecha_actual
this.usuario_t=create usuario_t
this.st_usuario=create st_usuario
this.dw_promesa_nue=create dw_promesa_nue
this.dw_promesa_ant=create dw_promesa_ant
this.cb_cta_cte=create cb_cta_cte
this.cb_cerrar=create cb_cerrar
this.dw_lista_promesa=create dw_lista_promesa
this.gb_1=create gb_1
this.Control[]={this.cb_grabar,&
this.rb_nuevo,&
this.cb_cerrar_cambio,&
this.dw_solicitud_nue,&
this.dw_solicitud_ant,&
this.cb_limpiar,&
this.cb_cambio_promesa,&
this.fecha_t,&
this.em_fecha_actual,&
this.usuario_t,&
this.st_usuario,&
this.dw_promesa_nue,&
this.dw_promesa_ant,&
this.cb_cta_cte,&
this.cb_cerrar,&
this.dw_lista_promesa,&
this.gb_1}
end on

on w_asociar_x_rut.destroy
destroy(this.cb_grabar)
destroy(this.rb_nuevo)
destroy(this.cb_cerrar_cambio)
destroy(this.dw_solicitud_nue)
destroy(this.dw_solicitud_ant)
destroy(this.cb_limpiar)
destroy(this.cb_cambio_promesa)
destroy(this.fecha_t)
destroy(this.em_fecha_actual)
destroy(this.usuario_t)
destroy(this.st_usuario)
destroy(this.dw_promesa_nue)
destroy(this.dw_promesa_ant)
destroy(this.cb_cta_cte)
destroy(this.cb_cerrar)
destroy(this.dw_lista_promesa)
destroy(this.gb_1)
end on

event open;string	ls_base,ls_serie
long		ll_tot_reg,ll_rut,ll_new
datetime	ldt_fecha_actual
double	ldb_numero

connect using Trans_1;
connect using Trans_1;
w_asociar_x_rut.height			= 876
gf_centrar(w_asociar_x_rut)
dw_promesa_nue.settransobject(sqlca)
dw_lista_promesa.settransobject(sqlca)
dw_promesa_ant.settransobject(sqlca)
dw_solicitud_ant.settransobject(sqlca)
dw_solicitud_nue.settransobject(sqlca)
if gl_proceso>= 4 then
	cb_cambio_promesa.visible	= true
else
	cb_cambio_promesa.visible	= false
end if
ll_rut								= long(substr(1,1,Message.StringParm))
ls_base								= substr(1,2,Message.StringParm)
ls_serie								= substr(1,3,Message.StringParm)
ldb_numero							= double(substr(1,4,Message.StringParm))
ll_tot_reg							= dw_lista_promesa.retrieve(ll_rut)
if ll_tot_reg=0 then
	messagebox("Advertencia","No Existe Promesas Digitadas al Rut :"+'  '+string(ll_rut,"###,###,###,##0"))
	close(w_asociar_x_rut)
else
	SELECT	sysdate	INTO :gdt_fec_sistema FROM	"TASA" WHERE "TASA"."LOOK" = 1  USING sqlca ;
	em_fecha_actual.text			= string(gdt_fec_sistema)
	ldt_fecha_actual				= datetime(date(em_fecha_actual.text),time('00:00:00'))
	st_usuario.text				= string(gs_user)
	dw_promesa_ant.reset()
	ll_new							= dw_promesa_ant.insertrow(0)
	dw_promesa_ant.setitem(ll_new,'base',ls_base)
	dw_promesa_ant.setitem(ll_new,'serie',ls_serie)
	dw_promesa_ant.setitem(ll_new,'numero',ldb_numero)
	dw_promesa_ant.enabled		= false
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_grabar from commandbutton within w_asociar_x_rut
integer x = 41
integer y = 1584
integer width = 270
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string	ls_base,ls_serie,ls_glosa,ls_glosa_detalle,ls_base_nuevo,ls_serie_nuevo,ls_usuario_crea,ls_cod_agente,&
			ls_cod_superv,ls_estado_modif,ls_glosa_orig,ls_usuario
long		ll_res,ll_folio,ll_grabar,ll_numero_nuevo,ll_numero_antig,ll_promesa,ll_cod_estado,ll_cod_parque,&
			ll_mes,ll_ano,ll_numero_nue,ll_fila,ll_esta_orig
datetime	ldt_fecha_actual,ldt_fecha_crea,ldt_fecha_orig
double	ldb_numero

dw_promesa_ant.accepttext()
dw_solicitud_ant.accepttext()
dw_promesa_nue.accepttext()
dw_solicitud_nue.accepttext()
ll_numero_nue			= dw_promesa_nue.getitemnumber(1,'numero')
if not isnull(ll_numero_nue) or ll_numero_nue = 0 then
	ls_base				= dw_solicitud_ant.getitemstring(1,'base')
	ls_serie				= dw_solicitud_ant.getitemstring(1,'serie')
	ldb_numero			= dw_solicitud_ant.getitemnumber(1,'numero')
	
	ll_folio				= dw_solicitud_ant.getitemnumber(1,'folio')
	ls_base_nuevo		= dw_promesa_nue.getitemstring(1,'base')
	ls_serie_nuevo		= dw_promesa_nue.getitemstring(1,'serie')
	ll_numero_nuevo	= dw_promesa_nue.getitemnumber(1,'numero')
	ldt_fecha_actual	= gdt_fec_sistema
	ll_cod_estado 		= 99
	ll_grabar				= 0
	ll_res					= MessageBox("Advertencia", 'Esta seguro de Grabar Registro', Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		SELECT	"FUNERARIA_ESTADO"."GLOSA"
		INTO		:ls_glosa
		FROM		"FUNERARIA_ESTADO"  
		WHERE		"FUNERARIA_ESTADO"."CODIGO" = :ll_cod_estado
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ls_glosa_detalle = 'SE INGRESA GESTION USUARIO: '+ gs_user +', CON FECHA: '+string(ldt_fecha_actual,'dd/mm/yyyy')+', GLOSA: '+ls_glosa+' Nº '+ls_base+'-'+ls_serie+'-'+string(ldb_numero)+' POR PROMESA Nº '+ls_base_nuevo+'-'+ls_serie_nuevo+'-'+string(ll_numero_nuevo)
		end if
		
		SELECT 	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",		"FECHA_ESTADO",	"GLOSA",			"COD_AGENTE",	"COD_SUPERVISOR",	"COD_PARQUE",		"ESTADO_MODIFICACION",	"MES_CIERRE",	"ANO_CIERRE",	"USUARIO_GESTOR"  
    		INTO		:ldt_fecha_crea,	:ls_usuario_crea,	:ll_esta_orig,	:ldt_fecha_orig,	:ls_glosa_orig,	:ls_cod_agente,	:ls_cod_superv,	:ll_cod_parque,	:ls_estado_modif,			:ll_mes,			:ll_ano,			:ls_usuario   
		FROM		"FUNERARIA_FOLIO_DETALLE"  
		WHERE	( "FUNERARIA_FOLIO_DETALLE"."BASE" = :ls_base ) AND
					( "FUNERARIA_FOLIO_DETALLE"."SERIE" = :ls_serie ) AND 
					( "FUNERARIA_FOLIO_DETALLE"."NUMERO" = :ldb_numero ) AND
					( "FUNERARIA_FOLIO_DETALLE"."ESTADO" = 4 )   
		USING sqlca;
		if sqlca.sqlcode = 0 then
			INSERT INTO "FUNERARIA_FOLIO_DETALLE"  
         				( "BASE",			"SERIE",				"NUMERO",			"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",		"FECHA_ESTADO",	"GLOSA",				"COD_AGENTE",		"COD_SUPERVISOR",	"COD_PARQUE",		"ESTADO_MODIFICACION",	"MES_CIERRE",	"ANO_CIERRE",	"USUARIO_GESTOR" )  
			VALUES 	( :ls_base_nuevo,	:ls_serie_nuevo,	:ll_numero_nuevo,	:ldt_fecha_crea,	:ls_usuario_crea,	:ll_esta_orig,	:ldt_fecha_orig,	:ls_glosa_orig,	:ls_cod_agente,	:ls_cod_superv,	:ll_cod_parque,	:ls_estado_modif,			:ll_mes,			:ll_ano,			:ls_usuario    ) ;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Funeraria Detalle Original SQL: "+sqlca.sqlerrtext)
			end if
						
			INSERT INTO	"FUNERARIA_FOLIO_DETALLE"  
						( "BASE",			"SERIE",				"NUMERO",			"FECHA_CREA",		"USUARIO_CREA",	"ESTADO",			"FECHA_ESTADO",		"GLOSA",					"COD_AGENTE",		"COD_SUPERVISOR",	"COD_PARQUE",		"ESTADO_MODIFICACION",	"MES_CIERRE",	"ANO_CIERRE",	"USUARIO_GESTOR" )  
			VALUES 	( :ls_base_nuevo,	:ls_serie_nuevo,	:ll_numero_nuevo,	:ldt_fecha_crea,	:ls_usuario_crea,	:ll_cod_estado,	:ldt_fecha_actual,	:ls_glosa_detalle,	:ls_cod_agente,	:ls_cod_superv,	:ll_cod_parque,	:ls_estado_modif,			:ll_mes,			:ll_ano,			:gs_user    ) ;
			if sqlca.sqlcode = 0 then
				commit using sqlca;
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error Grabar Funeraria Detalle Modificación SQL: "+sqlca.sqlerrtext)
			end if
				
		end if
		DELETE FROM	"FUNERARIA_FOLIO_DETALLE"  
   	WHERE 		( "FUNERARIA_FOLIO_DETALLE"."BASE" = :ls_base) AND  
      	   		( "FUNERARIA_FOLIO_DETALLE"."SERIE" = :ls_serie ) AND  
         			( "FUNERARIA_FOLIO_DETALLE"."NUMERO" = :ldb_numero ) AND  
         			( "FUNERARIA_FOLIO_DETALLE"."ESTADO" = 4 )   
      USING sqlca;
		if sqlca.sqlcode = 0 then 
			commit using sqlca;
		else
			rollback using sqlca;
		end if
		UPDATE	"FUNERARIA_FOLIO_DETALLE"  
		SET		"BASE" = :ls_base_nuevo, 
					"SERIE" = :ls_serie_nuevo,
					"NUMERO" = :ll_numero_nuevo  
		WHERE		( "FUNERARIA_FOLIO_DETALLE"."BASE" = :ls_base ) AND
					( "FUNERARIA_FOLIO_DETALLE"."SERIE" = :ls_serie ) AND 
					( "FUNERARIA_FOLIO_DETALLE"."NUMERO" = :ldb_numero )   
		USING sqlca;
		if sqlca.sqlcode = 0 then 
			commit using sqlca;
		else
			rollback using sqlca;
		end if
		DELETE FROM	"FUNERARIA_PAGO_COMISION"  
		WHERE			( "FUNERARIA_PAGO_COMISION"."FOLIO" = :ll_folio ) AND  
						( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base ) AND  
						( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie ) AND  
						( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_numero )
		USING sqlca;
		if sqlca.sqlcode = 0 then 
			commit using sqlca;
			ll_grabar ++
			if dw_solicitud_ant.update() = 1 then
				commit using sqlca;
				ll_grabar ++
			else
				rollback using sqlca;
			end if
			if dw_solicitud_nue.update() = 1 then
				commit using sqlca;
				ll_grabar ++
			else
				rollback using sqlca;
			end if
		else
			rollback using sqlca;
		end if
		if ll_grabar=3 then
			messagebox("Grabar","Grabación Exitosa")
			w_asociar_x_rut.height			= 1008
			gf_centrar(w_asociar_x_rut)
			dw_solicitud_ant.reset()
			dw_promesa_nue.reset()
			dw_solicitud_nue.visible	= false
			rb_nuevo.checked				= false
			if isvalid(w_solicitud_gestion_funeraria) then
				ll_fila	= w_solicitud_gestion_funeraria.dw_lista_solicitud.getrow()
				w_solicitud_gestion_funeraria.dw_lista_solicitud.retrieve()
				if ll_fila>0 then
					w_solicitud_gestion_funeraria.dw_lista_solicitud.scrolltorow(ll_fila)
					w_solicitud_gestion_funeraria.dw_lista_solicitud.setfocus()
				end if
			end if
		else
			messagebox("Error Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
		end if
	end if
	close(w_asociar_x_rut)
else
	messagebox("Advertencia", "Debe Ingresar Nuevo Número de Promesa")
	dw_promesa_nue.setfocus()
	dw_promesa_nue.setcolumn('numero')
end if
end event

type rb_nuevo from radiobutton within w_asociar_x_rut
integer x = 1161
integer y = 1212
integer width = 946
integer height = 76
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
string text = "Ingresar Nuevo Numero Promesa"
end type

event clicked;string	ls_cod_agte,ls_base,ls_serie,ls_area,ls_moneda,ls_monbre_repres,ls_a_paterno_repres,ls_serie_nue,&
			ls_a_materno_repres,ls_dv_repres,ls_direcc_repres,ls_direcc_numero_repres,ls_direcc_block_repres,ls_direcc_depto_repres,&
			ls_comuna_repres,ls_ciudad_repres,ls_nombre_contac,ls_a_paterno_contac,ls_a_materno_contac,ls_fono_contac,ls_nombre_titular,&
			ls_a_paterno_titular,ls_a_materno_titular,ls_dv_titular,ls_direcc_titular,ls_direcc_numero_titular,ls_direcc_block_titular,&
			ls_direcc_depto_titular,ls_nombre_fallec,ls_a_paterno_fallec,ls_a_materno_fallec,ls_dv_fallec,ls_comuna_titular,ls_ciudad_titular,&
			ls_plani_sector,ls_plani_sepultura,ls_fono_titular,ls_fono_repres,ls_cod_superv,ls_uso,ls_tipo_const,ls_tipo_sepult,ls_usuario
long		ll_tot_reg,ll_folio_consul,ll_cod_funer,ll_folio,ll_nun_dato,ll_rut_repres,ll_total_comi,ll_cod_parque,&
			ll_neto_comi,ll_retecion,ll_rut_titular,ll_rut_fallec,ll_cod_estado,ll_mes_cierre,ll_ano_cierre,ll_hora_cierre,ll_minuto_cierre,&
			ll_capacidad,ll_new,ll_nulo,ll_new_promesa
datetime	ldt_fecha_cierre,ldt_fecha_ctto,ldt_fecha_estado,ldt_fecha_crea
double	ldb_numero,ldb_precio_ctto,ldb_uf_dia,ldb_porce_comi,ldb_precio_lista,ldb_porce_descto

Setnull(ll_nulo)
dw_solicitud_ant.accepttext()
dw_promesa_nue.enabled				= true
ll_new_promesa							= dw_promesa_nue.insertrow(0)
ls_serie_nue							= dw_solicitud_ant.getitemstring(1,'serie')
dw_promesa_nue.setitem(ll_new_promesa,'base','O')
dw_promesa_nue.setitem(ll_new_promesa,'serie',ls_serie_nue)
dw_solicitud_nue.visible			= true
ll_folio_consul						= dw_solicitud_ant.getitemnumber(1,'folio')
if not isnull(ll_folio_consul) and ll_folio_consul > 0 then
	SELECT	"FECHA_CREA",		"COD_FUNERARIA",	"FOLIO",		"NUMERO_DATO",	"COD_AGENTE",	"FECHA_CIERRE",		"BASE",		"SERIE",		"NUMERO",	"FECHA_CTTO",		"AREA",		"PRECIO_CTTO",		"MONEDA",	"UF_DIA",		"NOMBRE_REPRESENTANTE",	"A_PATERNO_REPRESENTANTE",	"A_MATERNO_REPRESENTANTE",	"RUT_REPRESENTANTE",	"DV_REPRESENTENTE",	"PORCE_COMISION",	"TOTAL_PAGO",		"DIRECCION_REPRESENTANTE",	"NUMERO_REPRESENTANTE",		"BLOCK_REPRESENTANTE",		"DEPTO_REPRESENTANTE",		"COMUNA_REPRESENTANTE",	"CIUDAD_REPRESENTANTE",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"FONO_CONTACTO",	"COD_PARQUE",		"NETO_COMISION",	"RETENCION",	"NOMBRE_TITULAR",		"A_PATERNO_TITULAR",		"A_MATERNO_TITULAR",		"RUT_TITULAR",		"DV_TITULAR",		"DIRECCION_TITULAR",	"DIRECCION_NUMERO_TITULAR",	"DIRECCION_BLOCK_TITULAR",	"DIRECCION_DEPTO_TITULAR",	"NOMBRE_FALLECIDO",	"A_PATERNO_FALLECIDO",	"A_MATERNO_FALLECIDO",	"RUT_FALLECIDO",	"DV_FALLECIDO",	"COMUNA_TITULAR",		"CIUDAD_TITULAR",		"COD_ESTADO",		"PLANI_SECTOR",	"PLANI_SEPULTURA",	"MES_CIERRE",		"ANO_CIERRE",		"HORA_CIERRE",		"MINUTO_CIERRE",		"FONO_TITULAR",	"FONO_REPRESENT",	"FECHA_ESTADO",		"COD_SUPERVISOR",	"CAPACIDAD",	"USO",	"T_CONST",			"T_SEPULT",			"PRECIO_LISTA",		"PORCE_DESCTO"
	INTO 		:ldt_fecha_crea,	:ll_cod_funer,		:ll_folio,	:ll_nun_dato,	:ls_cod_agte,	:ldt_fecha_cierre,	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_ctto,	:ls_area,	:ldb_precio_ctto,	:ls_moneda,	:ldb_uf_dia,	:ls_monbre_repres,		:ls_a_paterno_repres,		:ls_a_materno_repres,		:ll_rut_repres,		:ls_dv_repres,			:ldb_porce_comi,	:ll_total_comi,	:ls_direcc_repres,			:ls_direcc_numero_repres,	:ls_direcc_block_repres,	:ls_direcc_depto_repres,	:ls_comuna_repres,		:ls_ciudad_repres,		:ls_nombre_contac,	:ls_a_paterno_contac,	:ls_a_materno_contac,	:ls_fono_contac,	:ll_cod_parque,	:ll_neto_comi,		:ll_retecion,	:ls_nombre_titular,	:ls_a_paterno_titular,	:ls_a_materno_titular,	:ll_rut_titular,	:ls_dv_titular,	:ls_direcc_titular,	:ls_direcc_numero_titular,		:ls_direcc_block_titular,	:ls_direcc_depto_titular,	:ls_nombre_fallec,	:ls_a_paterno_fallec,	:ls_a_materno_fallec,	:ll_rut_fallec,	:ls_dv_fallec,		:ls_comuna_titular,	:ls_ciudad_titular,	:ll_cod_estado,	:ls_plani_sector,	:ls_plani_sepultura,	:ll_mes_cierre,	:ll_ano_cierre,	:ll_hora_cierre,	:ll_minuto_cierre,	:ls_fono_titular,	:ls_fono_repres,	:ldt_fecha_estado,	:ls_cod_superv,	:ll_capacidad,	:ls_uso,	:ls_tipo_const,	:ls_tipo_sepult,	:ldb_precio_lista,	:ldb_porce_descto  
	FROM		"FUNERARIA_PAGO_COMISION"  
	WHERE		"FUNERARIA_PAGO_COMISION"."FOLIO" = :ll_folio_consul
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		dw_solicitud_nue.reset()
		ll_new				= dw_solicitud_nue.insertrow(0)
		dw_solicitud_nue.setitem(ll_new,'fecha_crea',ldt_fecha_crea)
		dw_solicitud_nue.setitem(ll_new,'cod_funeraria',ll_cod_funer)
		dw_solicitud_nue.setitem(ll_new,'folio',ll_folio)		
		dw_solicitud_nue.setitem(ll_new,'numero_dato',ll_nun_dato)
		dw_solicitud_nue.setitem(ll_new,'cod_agente',ls_cod_agte)
		dw_solicitud_nue.setitem(ll_new,'fecha_cierre',ldt_fecha_cierre)
		dw_solicitud_nue.setitem(ll_new,'base',ls_base)
		dw_solicitud_nue.setitem(ll_new,'serie',ls_serie)
		dw_solicitud_nue.setitem(ll_new,'numero',ll_nulo)
		dw_solicitud_nue.setitem(ll_new,'fecha_ctto',ldt_fecha_ctto)
		dw_solicitud_nue.setitem(ll_new,'area',ls_area)
		dw_solicitud_nue.setitem(ll_new,'precio_ctto',ldb_precio_ctto)
		dw_solicitud_nue.setitem(ll_new,'moneda',ls_moneda)
		dw_solicitud_nue.setitem(ll_new,'uf_dia',ldb_uf_dia)
		dw_solicitud_nue.setitem(ll_new,'nombre_representante',ls_monbre_repres)
		dw_solicitud_nue.setitem(ll_new,'a_paterno_representante',ls_a_paterno_repres)
		dw_solicitud_nue.setitem(ll_new,'a_materno_representante',ls_a_materno_repres)
		dw_solicitud_nue.setitem(ll_new,'rut_representante',ll_rut_repres)
		dw_solicitud_nue.setitem(ll_new,'dv_representente',ls_dv_repres)
		dw_solicitud_nue.setitem(ll_new,'porce_comision',ldb_porce_comi)
		dw_solicitud_nue.setitem(ll_new,'total_pago',ll_total_comi)
		dw_solicitud_nue.setitem(ll_new,'direccion_representante',ls_direcc_repres)
		dw_solicitud_nue.setitem(ll_new,'numero_representante',ls_direcc_numero_repres)
		dw_solicitud_nue.setitem(ll_new,'block_representante',ls_direcc_block_repres)
		dw_solicitud_nue.setitem(ll_new,'depto_representante',ls_direcc_depto_repres)
		dw_solicitud_nue.setitem(ll_new,'comuna_representante',ls_comuna_repres)
		dw_solicitud_nue.setitem(ll_new,'ciudad_representante',ls_ciudad_repres)
		dw_solicitud_nue.setitem(ll_new,'nombre_contacto',ls_nombre_contac)
		dw_solicitud_nue.setitem(ll_new,'a_paterno_contacto',ls_a_paterno_contac)
		dw_solicitud_nue.setitem(ll_new,'a_materno_contacto',ls_a_materno_contac)
		dw_solicitud_nue.setitem(ll_new,'fono_contacto',ls_fono_contac)
		dw_solicitud_nue.setitem(ll_new,'cod_parque',ll_cod_parque)
		dw_solicitud_nue.setitem(ll_new,'neto_comision',ll_neto_comi)
		dw_solicitud_nue.setitem(ll_new,'retencion',ll_retecion)
		dw_solicitud_nue.setitem(ll_new,'nombre_titular',ls_nombre_titular)
		dw_solicitud_nue.setitem(ll_new,'a_paterno_titular',ls_a_paterno_titular)
		dw_solicitud_nue.setitem(ll_new,'a_materno_titular',ls_a_materno_titular)
		dw_solicitud_nue.setitem(ll_new,'rut_titular',ll_rut_titular)
		dw_solicitud_nue.setitem(ll_new,'dv_titular',ls_dv_titular)
		dw_solicitud_nue.setitem(ll_new,'direccion_titular',ls_direcc_titular)
		dw_solicitud_nue.setitem(ll_new,'direccion_numero_titular',ls_direcc_numero_titular)
		dw_solicitud_nue.setitem(ll_new,'direccion_block_titular',ls_direcc_block_titular)
		dw_solicitud_nue.setitem(ll_new,'direccion_depto_titular',ls_direcc_depto_titular)
		dw_solicitud_nue.setitem(ll_new,'nombre_fallecido',ls_nombre_fallec)
		dw_solicitud_nue.setitem(ll_new,'a_paterno_fallecido',ls_a_paterno_fallec)
		dw_solicitud_nue.setitem(ll_new,'a_materno_fallecido',ls_a_materno_fallec)
		dw_solicitud_nue.setitem(ll_new,'rut_fallecido',ll_rut_fallec)
		dw_solicitud_nue.setitem(ll_new,'dv_fallecido',ls_dv_fallec)
		dw_solicitud_nue.setitem(ll_new,'comuna_titular',ls_comuna_titular)
		dw_solicitud_nue.setitem(ll_new,'ciudad_titular',ls_ciudad_titular)
		dw_solicitud_nue.setitem(ll_new,'cod_estado',ll_cod_estado)
		dw_solicitud_nue.setitem(ll_new,'plani_sector',ls_plani_sector)
		dw_solicitud_nue.setitem(ll_new,'plani_sepultura',ls_plani_sepultura)
		dw_solicitud_nue.setitem(ll_new,'mes_cierre',ll_mes_cierre)
		dw_solicitud_nue.setitem(ll_new,'ano_cierre',ll_ano_cierre)
		dw_solicitud_nue.setitem(ll_new,'hora_cierre',ll_hora_cierre)
		dw_solicitud_nue.setitem(ll_new,'minuto_cierre',ll_minuto_cierre)
		dw_solicitud_nue.setitem(ll_new,'fono_titular',ls_fono_titular)
		dw_solicitud_nue.setitem(ll_new,'fono_represent',ls_fono_repres)
		dw_solicitud_nue.setitem(ll_new,'fecha_estado',ldt_fecha_estado)
		dw_solicitud_nue.setitem(ll_new,'cod_supervisor',ls_cod_superv)
		dw_solicitud_nue.setitem(ll_new,'capacidad',ll_capacidad)
		dw_solicitud_nue.setitem(ll_new,'uso',ls_uso)
		dw_solicitud_nue.setitem(ll_new,'t_const',ls_tipo_const)
		dw_solicitud_nue.setitem(ll_new,'t_sepult',ls_tipo_sepult)
		dw_solicitud_nue.setitem(ll_new,'precio_lista',ldb_precio_lista)
		dw_solicitud_nue.setitem(ll_new,'porce_descto',ldb_porce_descto)
		dw_promesa_ant.setfocus()
		dw_promesa_ant.setcolumn('numero')
	else
		messagebox("Advertencia","No Registra Solicitud Pago Funeraria")
	end if
end if
end event

type cb_cerrar_cambio from commandbutton within w_asociar_x_rut
integer x = 1879
integer y = 1584
integer width = 270
integer height = 96
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;w_asociar_x_rut.height		= 876
gf_centrar(w_asociar_x_rut)
dw_solicitud_ant.reset()
dw_promesa_nue.reset()
dw_solicitud_nue.visible	= false
rb_nuevo.checked				= false

end event

type dw_solicitud_nue from datawindow within w_asociar_x_rut
integer x = 87
integer y = 1332
integer width = 2048
integer height = 188
integer taborder = 100
string title = "none"
string dataobject = "dw_lista_solicitud_funeraria_nueva"
boolean border = false
boolean livescroll = true
end type

type dw_solicitud_ant from datawindow within w_asociar_x_rut
integer x = 87
integer y = 996
integer width = 2048
integer height = 188
integer taborder = 70
string title = "none"
string dataobject = "dw_lista_solicitud_funeraria_antigua"
boolean border = false
boolean livescroll = true
end type

type cb_limpiar from commandbutton within w_asociar_x_rut
integer x = 1618
integer y = 1584
integer width = 256
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;
dw_solicitud_ant.reset()
dw_solicitud_ant.insertrow(0)
dw_promesa_nue.reset()
dw_solicitud_nue.visible	= false
rb_nuevo.checked				= false

end event

type cb_cambio_promesa from commandbutton within w_asociar_x_rut
integer x = 494
integer y = 636
integer width = 745
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cambiar Numero Promesa"
end type

event clicked;string	ls_base_consul,ls_serie_consul,ls_cod_agte,ls_base,ls_serie,ls_area,ls_moneda,ls_monbre_repres,ls_a_paterno_repres,&
			ls_a_materno_repres,ls_dv_repres,ls_direcc_repres,ls_direcc_numero_repres,ls_direcc_block_repres,ls_direcc_depto_repres,&
			ls_comuna_repres,ls_ciudad_repres,ls_nombre_contac,ls_a_paterno_contac,ls_a_materno_contac,ls_fono_contac,ls_nombre_titular,&
			ls_a_paterno_titular,ls_a_materno_titular,ls_dv_titular,ls_direcc_titular,ls_direcc_numero_titular,ls_direcc_block_titular,&
			ls_direcc_depto_titular,ls_nombre_fallec,ls_a_paterno_fallec,ls_a_materno_fallec,ls_dv_fallec,ls_comuna_titular,ls_ciudad_titular,&
			ls_plani_sector,ls_plani_sepultura,ls_fono_titular,ls_fono_repres,ls_cod_superv,ls_uso,ls_tipo_const,ls_tipo_sepult,ls_usuario
long		ll_tot_reg,ll_cod_funer,ll_folio,ll_nun_dato,ll_rut_repres,ll_total_comi,ll_cod_parque,ll_neto_comi,ll_retecion,ll_rut_titular,ll_rut_fallec,&
			ll_cod_estado,ll_mes_cierre,ll_ano_cierre,ll_hora_cierre,ll_minuto_cierre,ll_capacidad,ll_new
datetime	ldt_fecha_cierre,ldt_fecha_ctto,ldt_fecha_estado
double	ldb_numero,ldb_numero_consul,ldb_precio_ctto,ldb_uf_dia,ldb_porce_comi,ldb_precio_lista,ldb_porce_descto

w_asociar_x_rut.height		= 1816
gf_centrar(w_asociar_x_rut)
dw_solicitud_nue.visible	= false
dw_promesa_ant.accepttext()
ls_base_consul					= dw_promesa_ant.getitemstring(1,'base')
ls_serie_consul					= dw_promesa_ant.getitemstring(1,'serie')
ldb_numero_consul			= dw_promesa_ant.getitemnumber(1,'numero')
if not isnull(ls_base_consul) and ls_base_consul<>'' and not isnull(ls_serie_consul) and ls_serie_consul<>'' and ldb_numero_consul>0 then
	SELECT	"COD_FUNERARIA",	"FOLIO",		"NUMERO_DATO",	"COD_AGENTE",	"FECHA_CIERRE",		"BASE",		"SERIE",		"NUMERO",	"FECHA_CTTO",		"AREA",		"PRECIO_CTTO",		"MONEDA",	"UF_DIA",		"NOMBRE_REPRESENTANTE",	"A_PATERNO_REPRESENTANTE",	"A_MATERNO_REPRESENTANTE",	"RUT_REPRESENTANTE",	"DV_REPRESENTENTE",	"PORCE_COMISION",	"TOTAL_PAGO",		"DIRECCION_REPRESENTANTE",	"NUMERO_REPRESENTANTE",		"BLOCK_REPRESENTANTE",		"DEPTO_REPRESENTANTE",		"COMUNA_REPRESENTANTE",	"CIUDAD_REPRESENTANTE",	"NOMBRE_CONTACTO",	"A_PATERNO_CONTACTO",	"A_MATERNO_CONTACTO",	"FONO_CONTACTO",	"COD_PARQUE",		"NETO_COMISION",	"RETENCION",	"NOMBRE_TITULAR",		"A_PATERNO_TITULAR",		"A_MATERNO_TITULAR",		"RUT_TITULAR",		"DV_TITULAR",		"DIRECCION_TITULAR",	"DIRECCION_NUMERO_TITULAR",	"DIRECCION_BLOCK_TITULAR",	"DIRECCION_DEPTO_TITULAR",	"NOMBRE_FALLECIDO",	"A_PATERNO_FALLECIDO",	"A_MATERNO_FALLECIDO",	"RUT_FALLECIDO",	"DV_FALLECIDO",	"COMUNA_TITULAR",		"CIUDAD_TITULAR",		"COD_ESTADO",		"PLANI_SECTOR",	"PLANI_SEPULTURA",	"MES_CIERRE",		"ANO_CIERRE",		"HORA_CIERRE",		"MINUTO_CIERRE",		"FONO_TITULAR",	"FONO_REPRESENT",	"FECHA_ESTADO",		"COD_SUPERVISOR",	"CAPACIDAD",	"USO",	"T_CONST",			"T_SEPULT",			"PRECIO_LISTA",		"PORCE_DESCTO"
	INTO 		:ll_cod_funer,		:ll_folio,	:ll_nun_dato,	:ls_cod_agte,	:ldt_fecha_cierre,	:ls_base,	:ls_serie,	:ldb_numero,	:ldt_fecha_ctto,	:ls_area,	:ldb_precio_ctto,	:ls_moneda,	:ldb_uf_dia,	:ls_monbre_repres,		:ls_a_paterno_repres,		:ls_a_materno_repres,		:ll_rut_repres,		:ls_dv_repres,			:ldb_porce_comi,	:ll_total_comi,	:ls_direcc_repres,			:ls_direcc_numero_repres,	:ls_direcc_block_repres,	:ls_direcc_depto_repres,	:ls_comuna_repres,		:ls_ciudad_repres,		:ls_nombre_contac,	:ls_a_paterno_contac,	:ls_a_materno_contac,	:ls_fono_contac,	:ll_cod_parque,	:ll_neto_comi,		:ll_retecion,	:ls_nombre_titular,	:ls_a_paterno_titular,	:ls_a_materno_titular,	:ll_rut_titular,	:ls_dv_titular,	:ls_direcc_titular,	:ls_direcc_numero_titular,		:ls_direcc_block_titular,	:ls_direcc_depto_titular,	:ls_nombre_fallec,	:ls_a_paterno_fallec,	:ls_a_materno_fallec,	:ll_rut_fallec,	:ls_dv_fallec,		:ls_comuna_titular,	:ls_ciudad_titular,	:ll_cod_estado,	:ls_plani_sector,	:ls_plani_sepultura,	:ll_mes_cierre,	:ll_ano_cierre,	:ll_hora_cierre,	:ll_minuto_cierre,	:ls_fono_titular,	:ls_fono_repres,	:ldt_fecha_estado,	:ls_cod_superv,	:ll_capacidad,	:ls_uso,	:ls_tipo_const,	:ls_tipo_sepult,	:ldb_precio_lista,	:ldb_porce_descto  
	FROM		"FUNERARIA_PAGO_COMISION"  
	WHERE		( "FUNERARIA_PAGO_COMISION"."BASE" = :ls_base_consul ) AND  
				( "FUNERARIA_PAGO_COMISION"."SERIE" = :ls_serie_consul ) AND  
				( "FUNERARIA_PAGO_COMISION"."NUMERO" = :ldb_numero_consul )
	USING		sqlca;
	if sqlca.sqlcode = 0 then
		ls_usuario		= gs_user
		dw_solicitud_ant.reset()
		ll_new				= dw_solicitud_ant.insertrow(0)
		dw_solicitud_ant.setitem(ll_new,'cod_funeraria',ll_cod_funer)
		dw_solicitud_ant.setitem(ll_new,'folio',ll_folio)		
		dw_solicitud_ant.setitem(ll_new,'numero_dato',ll_nun_dato)
		dw_solicitud_ant.setitem(ll_new,'cod_agente',ls_cod_agte)
		dw_solicitud_ant.setitem(ll_new,'fecha_cierre',ldt_fecha_cierre)
		dw_solicitud_ant.setitem(ll_new,'base',ls_base)
		dw_solicitud_ant.setitem(ll_new,'serie',ls_serie)
		dw_solicitud_ant.setitem(ll_new,'numero',ldb_numero)
		dw_solicitud_ant.setitem(ll_new,'fecha_ctto',ldt_fecha_ctto)
		dw_solicitud_ant.setitem(ll_new,'area',ls_area)
		dw_solicitud_ant.setitem(ll_new,'precio_ctto',ldb_precio_ctto)
		dw_solicitud_ant.setitem(ll_new,'moneda',ls_moneda)
		dw_solicitud_ant.setitem(ll_new,'uf_dia',ldb_uf_dia)
		dw_solicitud_ant.setitem(ll_new,'nombre_representante',ls_monbre_repres)
		dw_solicitud_ant.setitem(ll_new,'a_paterno_representante',ls_a_paterno_repres)
		dw_solicitud_ant.setitem(ll_new,'a_materno_representante',ls_a_materno_repres)
		dw_solicitud_ant.setitem(ll_new,'rut_representante',ll_rut_repres)
		dw_solicitud_ant.setitem(ll_new,'dv_representente',ls_dv_repres)
		dw_solicitud_ant.setitem(ll_new,'porce_comision',ldb_porce_comi)
		dw_solicitud_ant.setitem(ll_new,'total_pago',ll_total_comi)
		dw_solicitud_ant.setitem(ll_new,'direccion_representante',ls_direcc_repres)
		dw_solicitud_ant.setitem(ll_new,'numero_representante',ls_direcc_numero_repres)
		dw_solicitud_ant.setitem(ll_new,'block_representante',ls_direcc_block_repres)
		dw_solicitud_ant.setitem(ll_new,'depto_representante',ls_direcc_depto_repres)
		dw_solicitud_ant.setitem(ll_new,'comuna_representante',ls_comuna_repres)
		dw_solicitud_ant.setitem(ll_new,'ciudad_representante',ls_ciudad_repres)
		dw_solicitud_ant.setitem(ll_new,'nombre_contacto',ls_nombre_contac)
		dw_solicitud_ant.setitem(ll_new,'a_paterno_contacto',ls_a_paterno_contac)
		dw_solicitud_ant.setitem(ll_new,'a_materno_contacto',ls_a_materno_contac)
		dw_solicitud_ant.setitem(ll_new,'fono_contacto',ls_fono_contac)
		dw_solicitud_ant.setitem(ll_new,'cod_parque',ll_cod_parque)
		dw_solicitud_ant.setitem(ll_new,'neto_comision',ll_neto_comi)
		dw_solicitud_ant.setitem(ll_new,'retencion',ll_retecion)
		dw_solicitud_ant.setitem(ll_new,'nombre_titular',ls_nombre_titular)
		dw_solicitud_ant.setitem(ll_new,'a_paterno_titular',ls_a_paterno_titular)
		dw_solicitud_ant.setitem(ll_new,'a_materno_titular',ls_a_materno_titular)
		dw_solicitud_ant.setitem(ll_new,'rut_titular',ll_rut_titular)
		dw_solicitud_ant.setitem(ll_new,'dv_titular',ls_dv_titular)
		dw_solicitud_ant.setitem(ll_new,'direccion_titular',ls_direcc_titular)
		dw_solicitud_ant.setitem(ll_new,'direccion_numero_titular',ls_direcc_numero_titular)
		dw_solicitud_ant.setitem(ll_new,'direccion_block_titular',ls_direcc_block_titular)
		dw_solicitud_ant.setitem(ll_new,'direccion_depto_titular',ls_direcc_depto_titular)
		dw_solicitud_ant.setitem(ll_new,'nombre_fallecido',ls_nombre_fallec)
		dw_solicitud_ant.setitem(ll_new,'a_paterno_fallecido',ls_a_paterno_fallec)
		dw_solicitud_ant.setitem(ll_new,'a_materno_fallecido',ls_a_materno_fallec)
		dw_solicitud_ant.setitem(ll_new,'rut_fallecido',ll_rut_fallec)
		dw_solicitud_ant.setitem(ll_new,'dv_fallecido',ls_dv_fallec)
		dw_solicitud_ant.setitem(ll_new,'comuna_titular',ls_comuna_titular)
		dw_solicitud_ant.setitem(ll_new,'ciudad_titular',ls_ciudad_titular)
		dw_solicitud_ant.setitem(ll_new,'cod_estado',ll_cod_estado)
		dw_solicitud_ant.setitem(ll_new,'plani_sector',ls_plani_sector)
		dw_solicitud_ant.setitem(ll_new,'plani_sepultura',ls_plani_sepultura)
		dw_solicitud_ant.setitem(ll_new,'mes_cierre',ll_mes_cierre)
		dw_solicitud_ant.setitem(ll_new,'ano_cierre',ll_ano_cierre)
		dw_solicitud_ant.setitem(ll_new,'hora_cierre',ll_hora_cierre)
		dw_solicitud_ant.setitem(ll_new,'minuto_cierre',ll_minuto_cierre)
		dw_solicitud_ant.setitem(ll_new,'fono_titular',ls_fono_titular)
		dw_solicitud_ant.setitem(ll_new,'fono_represent',ls_fono_repres)
		dw_solicitud_ant.setitem(ll_new,'fecha_estado',ldt_fecha_estado)
		dw_solicitud_ant.setitem(ll_new,'cod_supervisor',ls_cod_superv)
		dw_solicitud_ant.setitem(ll_new,'capacidad',ll_capacidad)
		dw_solicitud_ant.setitem(ll_new,'uso',ls_uso)
		dw_solicitud_ant.setitem(ll_new,'t_const',ls_tipo_const)
		dw_solicitud_ant.setitem(ll_new,'t_sepult',ls_tipo_sepult)
		dw_solicitud_ant.setitem(ll_new,'precio_lista',ldb_precio_lista)
		dw_solicitud_ant.setitem(ll_new,'porce_descto',ldb_porce_descto)
		dw_solicitud_ant.setitem(ll_new,'usuario_modifica',ls_usuario)
		dw_solicitud_ant.accepttext()
	else
		messagebox("Advertencia","No Registra Solicitud Pago Funeraria")
	end if
else
	if isnull(ls_base_consul) or ls_base_consul='' then
		messagebox("Advertencia", "Debe Ingresar Base")
		dw_promesa_ant.setfocus()
		dw_promesa_ant.setcolumn('base')
	elseif isnull(ls_serie_consul) or ls_serie_consul='' then
		messagebox("Advertencia", "Debe Ingresar Serie")
		dw_promesa_ant.setfocus()
		dw_promesa_ant.setcolumn('serie')
	elseif isnull(ldb_numero_consul) or ldb_numero_consul=0 then
		messagebox("Advertencia", "Debe Ingresar Número")
		dw_promesa_ant.setfocus()
		dw_promesa_ant.setcolumn('numero')
	end if
end if
end event

type fecha_t from statictext within w_asociar_x_rut
integer x = 1563
integer y = 840
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fecha_actual from editmask within w_asociar_x_rut
integer x = 1801
integer y = 840
integer width = 302
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "none"
boolean border = false
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type usuario_t from statictext within w_asociar_x_rut
integer x = 1563
integer y = 908
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_usuario from statictext within w_asociar_x_rut
integer x = 1801
integer y = 908
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

type dw_promesa_nue from datawindow within w_asociar_x_rut
integer x = 101
integer y = 1228
integer width = 914
integer height = 108
integer taborder = 90
string title = "none"
string dataobject = "dwe_promesa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_base,ls_serie
long		ll_rev_promesa,ll_nulo,ll_new
double	ldb_numero

setnull(ll_nulo)
dw_promesa_nue.accepttext()
dw_solicitud_nue.accepttext()		
ls_columna			= dwo.name
if ls_columna='numero' then
	ls_base			= dw_promesa_ant.getitemstring(1,'base')
	ls_serie			= dw_promesa_ant.getitemstring(1,'serie')
	ldb_numero		= double(data)
	SELECT	"CD_FOLIO"."NUMERO"  
   INTO		:ll_rev_promesa  
   FROM		"CD_FOLIO"  
   WHERE		( "CD_FOLIO"."BASE" = :ls_base ) AND
				( "CD_FOLIO"."SERIE" = :ls_serie ) AND
				( "CD_FOLIO"."NUMERO" = :ldb_numero )
	USING	sqlca;
	if sqlca.sqlcode = 100 then
		if isnull(ll_rev_promesa) or ll_rev_promesa = 0 then
			messagebox("Advertencia","Folio No Se encuentra Asignado En Control Documentario")
			dw_promesa_nue.reset()
			ll_new	= dw_promesa_nue.insertrow(0)
			dw_promesa_nue.setitem(ll_new,'base',ls_base)
			dw_promesa_nue.setitem(ll_new,'serie',ls_serie)
			dw_promesa_nue.setfocus()
			dw_promesa_nue.setcolumn('numero')
			dw_solicitud_nue.setitem(1,'numero',ll_nulo)
		end if
	else
		dw_solicitud_nue.setitem(1,'numero',ldb_numero)
	end if
end if
dw_promesa_nue.accepttext()
dw_solicitud_nue.accepttext()		
end event

type dw_promesa_ant from datawindow within w_asociar_x_rut
integer x = 78
integer y = 892
integer width = 882
integer height = 108
integer taborder = 60
string title = "none"
string dataobject = "dwe_promesa"
boolean border = false
boolean livescroll = true
end type

type cb_cta_cte from commandbutton within w_asociar_x_rut
integer x = 37
integer y = 636
integer width = 453
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;long		ll_cd_estado_promesa


if il_row>0 then
	gs_base						= dw_lista_promesa.getitemstring(il_row,'cadena_codigo')
	gs_serie						= dw_lista_promesa.getitemstring(il_row,'oferta_v_serie')
	gi_numero 					= dw_lista_promesa.getitemnumber(il_row,'oferta_v_nro_oferta')
	gi_rut						= dw_lista_promesa.getitemnumber(il_row,'oferta_v_rut')
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
	END CHOOSE
else
	messagebox("Advertencia","Debe Selecionar Promesa")
end if
	
end event

type cb_cerrar from commandbutton within w_asociar_x_rut
integer x = 1879
integer y = 636
integer width = 270
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_asociar_x_rut)
end event

type dw_lista_promesa from datawindow within w_asociar_x_rut
integer x = 41
integer y = 48
integer width = 2107
integer height = 568
integer taborder = 20
string title = "none"
string dataobject = "dw_asocia_x_rut"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
this.accepttext()
end event

type gb_1 from groupbox within w_asociar_x_rut
integer x = 41
integer y = 784
integer width = 2107
integer height = 760
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

