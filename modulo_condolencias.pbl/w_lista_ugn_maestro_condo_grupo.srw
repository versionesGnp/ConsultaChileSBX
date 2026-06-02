forward
global type w_lista_ugn_maestro_condo_grupo from window
end type
type cb_1 from commandbutton within w_lista_ugn_maestro_condo_grupo
end type
type cb_grabar from commandbutton within w_lista_ugn_maestro_condo_grupo
end type
type dw_lista from datawindow within w_lista_ugn_maestro_condo_grupo
end type
end forward

global type w_lista_ugn_maestro_condo_grupo from window
integer width = 3109
integer height = 1624
boolean titlebar = true
string title = "Asignar Fallecido"
boolean controlmenu = true
long backcolor = 67108864
cb_1 cb_1
cb_grabar cb_grabar
dw_lista dw_lista
end type
global w_lista_ugn_maestro_condo_grupo w_lista_ugn_maestro_condo_grupo

type variables
Long		il_modif,il_folio_ficha
String		is_tipo_ficha, is_area_sep,is_sector_sep,is_sepultura_sep
Double	il_rut_sep
end variables

forward prototypes
public function long wf_grabar_ficha_implementacion ()
end prototypes

public function long wf_grabar_ficha_implementacion ();Long		ll_parque	,ll_rut_f,ll_count,ll_grupo,ll_rut_titular,ll_max,ll_count_det
String		ls_base,ls_serie,ls_nombre_f,ls_a_pat_f,ls_a_mat_f,ls_cod_maestro,ls_area,ls_sector,ls_sepultura,ls_cod_grupo,ls_cod_item
Double	ll_numero
Datetime	ldt_fec_ingr,ldt_fec_sepul

dw_lista.accepttext()
ll_grupo				= dw_lista.getitemnumber(1,'grupo')
ll_parque				= dw_lista.getitemnumber(1,'parque')
ls_base				= dw_lista.getitemstring(1,'base')
ls_serie				= dw_lista.getitemstring(1,'serie')
ll_numero			= dw_lista.getitemnumber(1,'numero')
ll_rut_f				= dw_lista.getitemnumber(1,'rut_fallecido')
ls_nombre_f			= dw_lista.getitemstring(1,'nombre_fallecido')
ls_a_pat_f			= dw_lista.getitemstring(1,'a_paterno_fallecido')
ls_a_mat_f			= dw_lista.getitemstring(1,'a_materno_fallecido')
ldt_fec_ingr			= dw_lista.getitemdatetime(1,'fecha_ingreso')
ldt_fec_sepul		= dw_lista.getitemdatetime(1,'fecha_sepultacion')
ls_cod_maestro	= dw_lista.getitemstring(1,'usuario_creador')

if ls_base='O' then
	SELECT 	"OFERTA_V"."RUT", 	"PAGO_OFERTA"."AREA", 	"PAGO_OFERTA"."SECTOR", 	"PAGO_OFERTA"."SEPULTURA"  
	INTO 		:ll_rut_titular,   		:ls_area,   						:ls_sector,   						:ls_sepultura  
	FROM 	"OFERTA_V",   	"PAGO_OFERTA",   	"CADENA"  
	WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
			  ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
			  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
			  ( "CADENA"."SERIE" = :ls_serie ) AND  
			  ( "CADENA"."NUMERO" = :ll_numero ) )   ;
elseif ls_base='C' then
	SELECT	"CADENA"."RUT",		"CONTRATO"."ZONA", 	"CONTRATO"."SECTOR", 	"CONTRATO"."SEPULTURA"  
	INTO 		:ll_rut_titular,   		:ls_area,   					:ls_sector,   					:ls_sepultura  
	FROM 	"CADENA",   "CONTRATO"  
	WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
			  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
			  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
			  ( "CADENA"."SERIE" = :ls_serie ) AND  
			  ( "CADENA"."NUMERO" = :ll_numero ) )   ;
end if
if isnull(ls_area) or ls_area='' then
	ls_area			= is_area_sep
	ls_sector			= is_sector_sep
	ls_sepultura		= is_sepultura_sep
	ll_rut_titular		= il_rut_sep
end if
SELECT 	"FICHA_IMPLEMENTACION"."FOLIO"
INTO 		:ll_max  
FROM 	"FICHA_IMPLEMENTACION"  
WHERE ( "FICHA_IMPLEMENTACION"."TIPO_FICHA_SEPULTACION" = :is_tipo_ficha ) AND  
		  ( "FICHA_IMPLEMENTACION"."FOLIO_FICHA_SEPULTACION" = :il_folio_ficha ) AND
		  ( "FICHA_IMPLEMENTACION"."RUT_FALLECIDO" = :ll_rut_f ) 
USING	sqlca;
if sqlca.sqlcode <> 0 then
	SELECT 	MAX("FICHA_IMPLEMENTACION"."FOLIO")
	INTO 		:ll_max  
	FROM 	"FICHA_IMPLEMENTACION"  ;
	if isnull(ll_max) then ll_max=0
	ll_max ++

	INSERT INTO "FICHA_IMPLEMENTACION"  
					( "FOLIO",	"CODIGO_MAESTRO", 	"FECHA_INSPECCION", 	"HORA_INSPECCION",  	"COD_PARQUE", 	"AREA", 	"SECTOR", 	"SEPULTURA", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO", 	"COD_ASISTENTE_1",  	"COD_ASISTENTE_2", 	"FECHA_INGRESO", 	"ESTADO_REG", 	"FECHA_SISTEMA", 	"TIPO_FICHA_SEPULTACION", 	"FOLIO_FICHA_SEPULTACION", 	"FECHA_FICHA_SEPULTACION", 	"FOLIO_CONDOLENCIA", 		"FOLIO_ENCUESTA", 	"RUT_FALLECIDO", 	"BASE",  		"SERIE", 		"NUMERO", 		"RUT_TITULAR", 	"USUARIO_CREA" )  
	VALUES 		( :ll_max, 	:ls_cod_maestro,   		null,   						null,   						:ll_parque,  			:ls_area,	:ls_sector, 	:ls_sepultura,   :ls_nombre_f,   			:ls_a_pat_f,   						:ls_a_mat_f,   						null,   						null,   						:ldt_fec_ingr,   			'0',   					:gdt_fec_sistema,   	:is_tipo_ficha,   					:il_folio_ficha,   						:ldt_fec_sepul,   						:ll_grupo,   						null,   					:ll_rut_f,   				:ls_base,   	:ls_serie,   	:ll_numero,   	:ll_rut_titular,   	:gs_user )  
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
		DECLARE x1 CURSOR FOR  
		SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
		FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
		WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
					  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :ll_parque ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
		ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
						"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
		USING	Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			do while Trans_1.sqlcode=0
				fetch x1 into :ls_cod_grupo, :ls_cod_item;
				if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
					INSERT INTO "FICHA_IMPLEMENTACION_DETALLE"  
									( "FOLIO",	"CODIGO_ITEM", 	"CODIGO_GESTION", 	"OBSERVACION", 	"FECHA_MODIFICA",	"USUARIO_MODIFICA", 	"CODIGO_GRUPO" )  
					VALUES 		( :ll_max,  	:ls_cod_item, 		null,   					null,   				:gdt_fec_sistema,   	:gs_user,   					:ls_cod_grupo )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Grabar Tabla FICHA_IMPLEMENTACION_DETALLE Sql: "+sqlca.sqlerrtext)
					end if
				end if
				Setnull(ls_cod_grupo); Setnull(ls_cod_item)
			loop
		end if
		close x1;
	else
		rollback;
		messagebox("Error Grabar","Error Grabar Tabla FICHA_IMPLEMENTACION Sql: "+sqlca.sqlerrtext)
	end if
else
	SELECT 	Count("FICHA_IMPLEMENTACION_DETALLE"."FOLIO")
	INTO 		:ll_count_det  
	FROM 	"FICHA_IMPLEMENTACION",  	"FICHA_IMPLEMENTACION_DETALLE"  
	WHERE ( "FICHA_IMPLEMENTACION"."FOLIO" = "FICHA_IMPLEMENTACION_DETALLE"."FOLIO" ) and  
			  ( "FICHA_IMPLEMENTACION"."TIPO_FICHA_SEPULTACION" = :is_tipo_ficha ) AND  
			  ( "FICHA_IMPLEMENTACION"."FOLIO_FICHA_SEPULTACION" = :il_folio_ficha ) AND
			  ( "FICHA_IMPLEMENTACION"."RUT_FALLECIDO" = :ll_rut_f ) ;
	if ll_count_det = 0 then
		DECLARE x2 CURSOR FOR  
		SELECT		"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO", 	"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" 
		FROM 		"FICHA_IMPLEMENTACION_GRUPO",  	"FICHA_IMPLEMENTACION_ITEM"  
		WHERE 	  ( "FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" = "FICHA_IMPLEMENTACION_ITEM"."CODIGO_GRUPO" ) and  
					  ( ( "FICHA_IMPLEMENTACION_ITEM"."COD_PARQUE" = :ll_parque ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."APLICA" = 'S' ) AND  
					  ( "FICHA_IMPLEMENTACION_ITEM"."ESTADO_REG" = 'V' ) )   
		ORDER BY 	"FICHA_IMPLEMENTACION_GRUPO"."CODIGO_GRUPO" ASC,   
						"FICHA_IMPLEMENTACION_ITEM"."CODIGO_ITEM" ASC  
		USING	Trans_1;
		open x2;
		if Trans_1.sqlcode=0 then
			do while Trans_1.sqlcode=0
				fetch x2 into :ls_cod_grupo, :ls_cod_item;
				if not isnull(ls_cod_grupo) and not isnull(ls_cod_item) then
					INSERT INTO "FICHA_IMPLEMENTACION_DETALLE"  
									( "FOLIO",	"CODIGO_ITEM", 	"CODIGO_GESTION", 	"OBSERVACION", 	"FECHA_MODIFICA",	"USUARIO_MODIFICA", 	"CODIGO_GRUPO" )  
					VALUES 		( :ll_max,  	:ls_cod_item, 		null,   					null,   				:gdt_fec_sistema,   	:gs_user,   					:ls_cod_grupo )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error Grabar Tabla FICHA_IMPLEMENTACION_DETALLE Sql: "+sqlca.sqlerrtext)
					end if
				end if
				Setnull(ls_cod_grupo); Setnull(ls_cod_item)
			loop
		end if
		close x2;
	end if
end if
Return ll_max
end function

on w_lista_ugn_maestro_condo_grupo.create
this.cb_1=create cb_1
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.Control[]={this.cb_1,&
this.cb_grabar,&
this.dw_lista}
end on

on w_lista_ugn_maestro_condo_grupo.destroy
destroy(this.cb_1)
destroy(this.cb_grabar)
destroy(this.dw_lista)
end on

event open;long 		ll_grupo,ll_rut_c,ll_row,ll_cod_parque,ll_convenio
string	ls_dv_c,ls_null,ls_superv,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_base,ls_serie
datetime	ldt_fecha_sepult
Double	ll_numero

CONNECT USING Trans_1; 
Setnull(ls_null)
il_modif					= 0
gf_centrar(w_lista_ugn_maestro_condo_grupo)
dw_lista.settransobject(sqlca)
dw_lista.getchild('cod_age',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('')=0 then idw_detalle.insertrow(0)
dw_lista.insertrow(0)
dw_lista.accepttext()
if w_lista_ugn_maestro_condo_2.dw_ugn_lista_fallecidos.getrow()>0 then
	ll_rut_c				= LONG(substr(1,1,Message.StringParm))
	ls_dv_c 				= substr(1,2,Message.StringParm)
	ls_nom_fall			= substr(1,3,Message.StringParm)
	ls_ap_pat_fall		= substr(1,4,Message.StringParm)
	ls_ap_mat_fall		= substr(1,5,Message.StringParm)
	ls_base				= substr(1,6,Message.StringParm)
	ls_serie				= substr(1,7,Message.StringParm)
	ll_numero			= Double(substr(1,8,Message.StringParm))
	ldt_fecha_sepult	= Datetime(date(substr(1,9,Message.StringParm)),time('00:00:00'))
	ll_cod_parque		= Long(substr(1,10,Message.StringParm))
	is_tipo_ficha			= substr(1,11,Message.StringParm)
	il_folio_ficha			= Long(substr(1,12,Message.StringParm))
	is_sector_sep		= substr(1,13,Message.StringParm)
	is_sepultura_sep	= substr(1,14,Message.StringParm)
	il_rut_sep			= Double(substr(1,15,Message.StringParm))
	SELECT DISTINCT "BASE_PLANI"."AREA"  
	INTO			:is_area_sep
	FROM 		"BASE_PLANI"  
	WHERE		( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque ) AND  
					( "BASE_PLANI"."SECTOR" = :is_sector_sep )   ;
	dw_lista.setitem(1,'rut_fallecido',ll_rut_c)
	dw_lista.setitem(1,'dv',ls_dv_c)
	dw_lista.setitem(1,'base',ls_base)
	dw_lista.setitem(1,'serie',ls_serie)
	dw_lista.setitem(1,'numero',ll_numero)
	dw_lista.setitem(1,'fecha_ingreso',date(gdt_fec_sistema))
	dw_lista.setitem(1,'nombre_fallecido',ls_nom_fall)
	dw_lista.setitem(1,'a_paterno_fallecido',ls_ap_pat_fall)
	dw_lista.setitem(1,'a_materno_fallecido',ls_ap_mat_fall)
	dw_lista.setitem(1,'fecha_sepultacion',ldt_fecha_sepult)
	dw_lista.setitem(1,'estado_registro','P')
	dw_lista.setitem(1,'parque',ll_cod_parque)
	if w_lista_ugn_maestro_condo_2.rb_convenio.checked=true then
		ll_convenio		= w_lista_ugn_maestro_condo_2.dw_convenio.getitemnumber(1,'codigo')
	else
		setnull(ll_convenio)
	end if
	dw_lista.setitem(1,'codigo_convenio',ll_convenio)
	dw_lista.accepttext()
	dw_lista.setfocus()
end if	 
	

end event

event close;DISCONNECT USING Trans_1; 
end event

type cb_1 from commandbutton within w_lista_ugn_maestro_condo_grupo
integer x = 2702
integer y = 1384
integer width = 338
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Long	ll_res
if il_modif > 0 THEN
	ll_res	= messagebox('Advertencia','Desea Salir sin Grabar',Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		close(w_lista_ugn_maestro_condo_grupo)
	end if	
else
	close(w_lista_ugn_maestro_condo_grupo)
end if

end event

type cb_grabar from commandbutton within w_lista_ugn_maestro_condo_grupo
integer x = 41
integer y = 1384
integer width = 283
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_nombre_f,ls_a_pat_f,ls_a_mat_f,ls_superv,ls_agente,ls_pasa='S',ls_ult_est_gestion,ls_ult_glosa,ls_est_registro,ls_usuario_cre,ls_obs,ls_tipo_origen,&
			ls_string
long 		ll_grupo,ll_parque,ll_rut_f,ll_tot_reg,ll_indi,ll_res,ll_implementacion,ll_count_f
datetime	ldt_fec_sepul,ldt_fec_ingr,ldt_ult_fec_gestion
Double	ll_numero
dw_lista.accepttext()
ll_parque			= dw_lista.getitemnumber(1,'parque')
ls_base				= dw_lista.getitemstring(1,'base')
ls_serie				= dw_lista.getitemstring(1,'serie')
ll_numero			= dw_lista.getitemnumber(1,'numero')
ll_rut_f				= dw_lista.getitemnumber(1,'rut_fallecido')
ls_nombre_f			= dw_lista.getitemstring(1,'nombre_fallecido')
ls_a_pat_f			= dw_lista.getitemstring(1,'a_paterno_fallecido')
ls_a_mat_f			= dw_lista.getitemstring(1,'a_materno_fallecido')
ldt_fec_ingr			= dw_lista.getitemdatetime(1,'fecha_ingreso')
ldt_fec_sepul		= dw_lista.getitemdatetime(1,'fecha_sepultacion')
ls_superv			= dw_lista.getitemstring(1,'cod_sup')
ls_agente			= dw_lista.getitemstring(1,'cod_age')
ls_obs				= dw_lista.getitemstring(1,'observacion')
ls_tipo_origen		= dw_lista.getitemstring(1,'tipo_origen')
ls_pasa				= 'S'
if isnull(ls_base) or ls_base=''then
	messagebox("Advertencia","Falta ingresar Base del Fallecido ")
	ls_pasa			= 'N'
	dw_lista.setfocus()
	dw_lista.setcolumn('base')
elseif isnull(ls_serie) or ls_serie=''then
	messagebox("Advertencia","Falta ingresar Serie del Fallecido ")
	ls_pasa			= 'N'
	dw_lista.setfocus()
	dw_lista.setcolumn('serie')
elseif isnull(ll_numero) or ll_numero=0 then
	messagebox("Advertencia","Falta ingresar Número del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('numero')
elseif isnull(ll_rut_f) or ll_rut_f=0 then
	messagebox("Advertencia","Falta ingresar Rut del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('rut_fallecido')
elseif isnull(ls_nombre_f) or ls_nombre_f=''then
	messagebox("Advertencia","Falta ingresar Nombre del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('nombre_fallecido')
elseif isnull(ls_tipo_origen) or ls_tipo_origen=''then
	messagebox("Advertencia","Falta ingresar Tipo Origen de la Venta")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('tipo_origen')
elseif isnull(ls_a_pat_f) or ls_a_pat_f=''then
	messagebox("Advertencia","Falta ingresar Apellido Paterno del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('a_paterno_fallecido')
elseif isnull(ls_a_mat_f) or ls_a_mat_f=''then
	messagebox("Advertencia","Falta ingresar Apellido Materno del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('a_materno_fallecido')
elseif isnull(ldt_fec_ingr) then
	messagebox("Advertencia","Falta ingresar Fecha Ingreso del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('fecha_ingreso')
elseif isnull(ls_superv) or ls_superv=''then
	messagebox("Advertencia","Falta ingresar Supervisor del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('cod_sup')
elseif isnull(ls_agente) or ls_agente=''then
	messagebox("Advertencia","Falta ingresar Agente del Fallecido ")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('cod_age')
elseif isnull(ls_obs) then
	messagebox("Advertencia","Falta ingresar Observación")
	dw_lista.setfocus()
	ls_pasa			= 'N'
	dw_lista.setcolumn('observacion')
end if
if ll_rut_f >0 then
	SELECT 	count("UGN_CLIENTE_ASIGNAR_FALLE"."NUMERO")
	INTO		:ll_count_f
	FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
	WHERE 	( "UGN_CLIENTE_ASIGNAR_FALLE"."RUT_FALLECIDO" = :ll_rut_f ) AND  
				( "UGN_CLIENTE_ASIGNAR_FALLE"."FECHA_SEPULTACION" = :ldt_fec_sepul )
	USING sqlca;
	if ll_count_f > 0 then
		 ls_pasa = 'N'
		 messagebox('Adverencia','Ya se Ingreso Registro para este Fallecido')
	end if			
end if
if ls_pasa = 'S' then
	SELECT 	MAX("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO")  
	INTO 		:ll_grupo  
	FROM 		"UGN_CLIENTE_ASIGNAR_FALLE"  
	USING 	sqlca;
	if ll_grupo > 0 then
		ll_grupo ++
	else
		ll_grupo		= 1
	end if
	dw_lista.setitem(1,'grupo',ll_grupo)
	ls_usuario_cre					= gs_user
	dw_lista.setitem(1,'usuario_creador',ls_usuario_cre)
	dw_lista.accepttext()
	if dw_lista.update()=1 then
		commit;
		il_modif		= 0
		ll_tot_reg	= w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.rowcount()
		if ll_tot_reg > 0 then
			ls_ult_est_gestion 	= '0'
			ldt_ult_fec_gestion	= gdt_fec_sistema
			ls_ult_glosa			= 'SE ASIGNA CARTERA EL '+string(gdt_fec_sistema,'dd/mm/yyyy')+', POR EL USUARIO '+gs_user
		//	ls_est_registro		= 'B'
			ls_est_registro		= 'A'
			for ll_indi=1 to ll_tot_reg
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'grupo',ll_grupo)
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'correlativo',ll_indi)
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'ult_estado_gestion',ls_ult_est_gestion)
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'ult_fecha_gestion',ldt_ult_fec_gestion)
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'ult_glosa_gestion',ls_ult_glosa)
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'estado_registro',ls_est_registro)
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.setitem(ll_indi,'estado_grupo','P')
				INSERT INTO 	"UGN_GESTION_SUP"  
								 ( "GRUPO",		"CORRELATIVO",	"ESTADO_GESTION",		"FECHA_GESTION",			"GLOSA_GESTION",	"FECHA_PROX_LLAMADO",	"USUARIO_GESTOR" )  
				VALUES 		 ( :ll_grupo,	:ll_indi,		:ls_ult_est_gestion,	:ldt_ult_fec_gestion,	:ls_ult_glosa,		null,							:gs_user )
				USING				sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
					messagebox("Error","Error al Grabar detalle UGN_GESTION_SUP "+SQLCA.SQLErrText)
				end if
			next
			w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.accepttext()
			if w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.update()=1 then
				commit;
				
				w_lista_ugn_maestro_condo_2.dw_lista_ugn_mc.reset()
				w_lista_ugn_maestro_condo_2.dw_ugn_lista_fallecidos.reset()
				w_lista_ugn_maestro_condo_2.pb_aceptar.TriggerEvent(Clicked!)
				ll_implementacion	= wf_grabar_ficha_implementacion()
				ll_res			= messagebox("Grabar","Grabación Exitosa, desea ahora Ingresar Ficha Implemetación N° "+string(ll_implementacion,'###,###,###,###,##0'),Exclamation!,YesNo!,2)
				if ll_res=1 then
					ls_string	= 'M'+'~t'+string(ll_implementacion)
					if isvalid(w_mantenedor_ficha_implementacion) then close(w_mantenedor_ficha_implementacion)
					OpenWithParm(w_mantenedor_ficha_implementacion,ls_string)
				end if
				close(w_lista_ugn_maestro_condo_grupo)
			else
				rollback;
				messagebox("Error","Error al Grabar Detalle_asignación "+SQLCA.SQLErrText)
			end if
		end if
		
	else
		rollback;
		messagebox("Error","Error al Grabar Grupo_asignación "+SQLCA.SQLErrText)
	end if	
end if
end event

type dw_lista from datawindow within w_lista_ugn_maestro_condo_grupo
integer x = 41
integer y = 28
integer width = 3003
integer height = 1328
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_cliente_mc_grupo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna,ls_null,ls_nombre_f,ls_base,ls_serie,ls_ap_pat_f,ls_ap_mat_f,ls_dv,ls_superv,ls_cod_age,ls_nulo
Date		ld_null
Long		ll_null,ll_rut,ll_parque
datetime	ldt_fec_sepult
Double	ll_numero
Setnull(ls_nulo)
ls_columna											= dwo.name
dw_lista.accepttext()
il_modif ++
if dw_lista.getrow()>0 then
	CHOOSE CASE ls_columna
		CASE 'dv'
			SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
			ll_rut									= dw_lista.getitemnumber(1,"rut_fallecido")
			ls_dv										= dw_lista.getitemstring(1,'dv')
			dw_lista.accepttext()
			if ll_rut > 0 and not isnull(ls_dv) then
				if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
					messagebox('Error','Rut Inválido',stopsign!)
					dw_lista.setfocus()
					dw_lista.setcolumn('dv')
				else	
					SELECT	"FICHA_SEPULTACION"."BASE",   
								"FICHA_SEPULTACION"."SERIE",   
								"FICHA_SEPULTACION"."NUMERO",   
								"FICHA_SEPULTACION"."COD_PARQUE",   
								"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",   
								"FICHA_SEPULTACION"."AP_PATERNO_FALL",   
								"FICHA_SEPULTACION"."AP_MATERNO_FALL",
								"FICHA_SEPULTACION"."FECHA_SEPULTACION",
								"FICHA_SEPULTACION"."COD_PARQUE"
					INTO 		:ls_base,   
								:ls_serie,   
								:ll_numero,   
								:ll_parque,   
								:ls_nombre_f,   
								:ls_ap_pat_f,   
								:ls_ap_mat_f,
								:ldt_fec_sepult,
								:ll_parque
					FROM 		"FICHA_SEPULTACION"  
					WHERE 	"FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut
					USING 	sqlca;
					if sqlca.sqlcode = 0 then
						dw_lista.setitem(1,'base',ls_base)
						dw_lista.setitem(1,'serie',ls_serie)
						dw_lista.setitem(1,'numero',ll_numero)
						dw_lista.setitem(1,'parque',ll_parque)
						dw_lista.setitem(1,'nombre_fallecido',ls_nombre_f)
						dw_lista.setitem(1,'a_paterno_fallecido',ls_ap_pat_f)
						dw_lista.setitem(1,'a_materno_fallecido',ls_ap_mat_f)
						dw_lista.setitem(1,'fecha_sepultacion',ldt_fec_sepult)
						dw_lista.setitem(1,'parque',ll_parque)
						dw_lista.setitem(1,'fecha_ingreso',gdt_fec_sistema)
						dw_lista.accepttext()	
						dw_lista.setfocus()
						dw_lista.setcolumn('cod_sup')
					end if	
				end if
			end if
		CASE 'cod_sup'
			dw_lista.setitem(1,'cod_age',ls_nulo)
			dw_lista.accepttext()
			ls_superv								= dw_lista.getitemstring(1,'cod_sup')
			idw_detalle.retrieve(ls_superv)
	END CHOOSE	
end if	
end event

event itemfocuschanged;Long		ll_rut,ls_columna
String		ls_dv,ls_nulo,ls_superv

dw_lista.accepttext()
Setnull(ls_nulo)
ll_rut										= dw_lista.getitemnumber(1,"rut_fallecido")
ls_dv										= dw_lista.getitemstring(1,'dv')
if ll_rut > 0 then
	if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
		dw_lista.setitem(1,'dv',ls_nulo)
		dw_lista.accepttext()
		dw_lista.setfocus()
		dw_lista.setcolumn('dv')
	end if
end if
//ls_superv								= dw_lista.getitemstring(1,'cod_sup')
//if not isnull(ls_superv) then
//	dw_lista.setitem(1,'cod_age',ls_nulo)
//end if
dw_lista.accepttext()
end event

