forward
global type w_grabar_ocupacion_fosa_comun from window
end type
type cb_ctacte from commandbutton within w_grabar_ocupacion_fosa_comun
end type
type cb_grabar from commandbutton within w_grabar_ocupacion_fosa_comun
end type
type cb_cerrar from commandbutton within w_grabar_ocupacion_fosa_comun
end type
type dw_grabar from datawindow within w_grabar_ocupacion_fosa_comun
end type
end forward

global type w_grabar_ocupacion_fosa_comun from window
integer width = 3145
integer height = 1932
boolean titlebar = true
string title = "Grabar Ocupación Fosa Común"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_grabar dw_grabar
end type
global w_grabar_ocupacion_fosa_comun w_grabar_ocupacion_fosa_comun

type variables
String	is_nivel
end variables

on w_grabar_ocupacion_fosa_comun.create
this.cb_ctacte=create cb_ctacte
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_grabar=create dw_grabar
this.Control[]={this.cb_ctacte,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_grabar}
end on

on w_grabar_ocupacion_fosa_comun.destroy
destroy(this.cb_ctacte)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_grabar)
end on

event open;Long	ll_new

is_nivel		= Message.StringParm
gf_centrar(w_grabar_ocupacion_fosa_comun)
dw_grabar.settransobject(sqlca)
dw_grabar.getchild('sector_origen',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)

dw_grabar.getchild('sepultura_origen',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)

dw_grabar.getchild('serie',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)

dw_grabar.getchild('codigo_capataz',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.insertrow(0)

ll_new	= dw_grabar.insertrow(0)
dw_grabar.setitem(ll_new,'estado_reg','O')
end event

type cb_ctacte from commandbutton within w_grabar_ocupacion_fosa_comun
integer x = 1294
integer y = 1688
integer width = 539
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;gi_numero 	= dw_grabar.getitemnumber(1,'numero')
gs_base		= dw_grabar.getitemstring(1,'base')
gs_serie		= dw_grabar.getitemstring(1,'serie')
if	gi_numero > 0 then
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
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
		CASE "A" // Aumento Capacidad
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "F","G"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
	END CHOOSE
end if
end event

type cb_grabar from commandbutton within w_grabar_ocupacion_fosa_comun
integer x = 41
integer y = 1692
integer width = 343
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_llave,ll_cod_capataz,ll_cod_parque,ll_indi,ll_tot_reg,ll_parque_fosa,ll_corr_fosa,&
			ll_suma_graba,ll_suma,ll_rut,ll_count,ll_numero_ctto_sap
String		ls_nombre,ls_ap_pat,ls_ap_mat,ls_area,ls_sector,ls_sepultura,ls_base,ls_serie,ls_nro_resol,&
			ls_nro_acta,ls_pasa,ls_estado_reg,ls_sector_fosa,ls_sepult_fosa,ls_nivel_fosa,ls_area_fosa,&
			ls_cod_civil,ls_obs,ls_obs_aux,ls_estado_original,ls_estado_ctto
Datetime	ldt_fecha_tras,ldt_fecha_res,ldt_fecha_fin
Date		ld_fecha_hoy
Double	ll_numero,ll_numero_ctto_sap_c,ll_numero_ctto_sap_m

ll_llave							= dw_grabar.getitemnumber(1,'llave_fallecido')
if ll_llave > 0 then
	ld_fecha_hoy				= date(gdt_fec_sistema)
	ls_pasa						= 'S'
	ls_nombre					= dw_grabar.getitemstring(1,'nombre_fallecido')
	ls_ap_pat					= dw_grabar.getitemstring(1,'ap_paterno_fallecido')
	ls_ap_mat					= dw_grabar.getitemstring(1,'ap_materno_fallecido')
	ldt_fecha_tras				= dw_grabar.getitemdatetime(1,'fecha_traslado')
	ll_cod_parque				= dw_grabar.getitemnumber(1,'cod_parque_origen')
	ls_area						= dw_grabar.getitemstring(1,'area_origen')
	ls_sector					= dw_grabar.getitemstring(1,'sector_origen')
	ls_sepultura					= dw_grabar.getitemstring(1,'sepultura_origen')
	ldt_fecha_res				= dw_grabar.getitemdatetime(1,'fecha_resolucion')
	ls_base						= dw_grabar.getitemstring(1,'base')
	ls_serie						= dw_grabar.getitemstring(1,'serie')
	ll_numero					= dw_grabar.getitemnumber(1,'numero')
	ls_nro_resol					= dw_grabar.getitemstring(1,'nro_resolucion')
	ls_nro_acta					= dw_grabar.getitemstring(1,'nro_acta')
	ll_cod_capataz				= dw_grabar.getitemnumber(1,'codigo_capataz')
	ls_cod_civil					= dw_grabar.getitemstring(1,'cod_registro')
	ls_obs_aux					= dw_grabar.getitemstring(1,'observacion')
	if isnull(ll_llave) or ll_llave=0 then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar LLave")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('llave_fallecido')
	elseif isnull(ls_nombre) or ls_nombre='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('nombre_fallecido')
	elseif isnull(ls_ap_pat) or ls_ap_pat='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('ap_paterno_fallecido')
	elseif isnull(ls_ap_mat) or ls_ap_mat='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('ap_materno_fallecido')
	elseif isnull(ldt_fecha_tras) then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Fecha de Traslado")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('fecha_traslado')
	elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('cod_parque_origen')
	elseif isnull(ls_area) or ls_area='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Area")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('area_origen')
	elseif isnull(ls_sector) or ls_sector='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('sector_origen')
	elseif isnull(ls_sepultura) or ls_sepultura='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('sepultura_origen')
	elseif isnull(ldt_fecha_res) then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Fecha Resolución")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('fecha_resolucion')
	elseif isnull(ls_base) or ls_base='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Base")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('base')
	elseif isnull(ls_serie) or ls_serie='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Serie")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('serie')
	elseif isnull(ll_numero) or ll_numero=0 then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Número Contrato")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('numero')
	elseif isnull(ls_nro_resol) or ls_nro_resol='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Nº Resolución")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('nro_resolucion')
	elseif isnull(ls_nro_acta) or ls_nro_acta='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Nº Acta")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('nro_acta')
	elseif isnull(ll_cod_capataz) or ll_cod_capataz=0 then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Capataz")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('codigo_capataz')
	elseif isnull(ls_cod_civil) or ls_cod_civil='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Registro Civil")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('cod_registro')
	elseif isnull(ls_obs_aux) or ls_obs_aux='' then
		ls_pasa					= 'N'
		messagebox("Advertencia","Debe Ingresar Observación")
		dw_grabar.setfocus()
		dw_grabar.setcolumn('observacion')
	else
		SELECT "CADENA"."ESTADO"  
		INTO 		:ls_estado_ctto  
		FROM 	"CADENA"  
		WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
					( "CADENA"."SERIE" = :ls_serie ) AND  
					( "CADENA"."NUMERO" = :ll_numero )
		USING	sqlca;
		if ls_estado_ctto = 'B' then
			 ls_pasa = 'S'
		else
			 ls_pasa = 'N'
			 messagebox("Advertencia","Contrato debe Encontrarse en Estado B-SENTENCIA")
		end if
	end if
	
	if ls_pasa = 'S' then
		ll_tot_reg				= w_mantenedor_fosa_comun.dw_detalle.rowcount()
		ll_suma					= 0
		ll_suma_graba			= 0
		for ll_indi=1 to ll_tot_reg
			ls_estado_reg		= w_mantenedor_fosa_comun.dw_detalle.getitemstring(ll_indi,'estado_reg')
			if ls_estado_reg='A' then
				ll_parque_fosa	= w_mantenedor_fosa_comun.dw_detalle.getitemnumber(ll_indi,'cod_parque')
				ls_area_fosa	= w_mantenedor_fosa_comun.dw_detalle.getitemstring(ll_indi,'area')
				ls_sector_fosa	= w_mantenedor_fosa_comun.dw_detalle.getitemstring(ll_indi,'sector')
				ls_sepult_fosa	= w_mantenedor_fosa_comun.dw_detalle.getitemstring(ll_indi,'sepultura')
				ls_nivel_fosa	= w_mantenedor_fosa_comun.dw_detalle.getitemstring(ll_indi,'niveles')
				ll_corr_fosa	= w_mantenedor_fosa_comun.dw_detalle.getitemnumber(ll_indi,'correlativo')
				UPDATE	"FOSA_COMUN"  
				SET 		"LLAVE_FALLECIDO" = :ll_llave,   
							"NOMBRE_FALLECIDO" = :ls_nombre,   
							"AP_PATERNO_FALLECIDO" = :ls_ap_pat,   
							"AP_MATERNO_FALLECIDO" = :ls_ap_mat,   
							"FECHA_TRASLADO" = :ldt_fecha_tras,   
							"COD_PARQUE_ORIGEN" = :ll_cod_parque,   
							"AREA_ORIGEN" = :ls_area,   
							"SECTOR_ORIGEN" = :ls_sector,   
							"SEPULTURA_ORIGEN" = :ls_sepultura,   
							"NRO_RESOLUCION" = :ls_nro_resol,   
							"FECHA_RESOLUCION" = :ldt_fecha_res,   
							"NRO_ACTA" = :ls_nro_acta,   
							"CODIGO_CAPATAZ" = :ll_cod_capataz,   
							"BASE" = :ls_base,   
							"SERIE" = :ls_serie,   
							"NUMERO" = :ll_numero,  
							"COD_REGISTRO" = :ls_cod_civil,
							"ESTADO_REG" = 'O',
							"OBSERVACION" = :ls_obs_aux
				WHERE  ( "FOSA_COMUN"."COD_PARQUE" = :ll_parque_fosa ) AND  
						 ( "FOSA_COMUN"."AREA" = :ls_area_fosa ) AND  
						 ( "FOSA_COMUN"."SECTOR" = :ls_sector_fosa ) AND  
						 ( "FOSA_COMUN"."SEPULTURA" = :ls_sepult_fosa ) AND  
						 ( "FOSA_COMUN"."CORRELATIVO" = :ll_corr_fosa ) AND  
						 ( "FOSA_COMUN"."NIVELES" = :ls_nivel_fosa )   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ll_suma ++
					SELECT 	"CADENA"."ESTADO"  
					INTO 		:ls_estado_original  
					FROM 	"CADENA"  
					WHERE ( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ll_numero )   ;
					
					SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
					INTO 		:ll_numero_ctto_sap_c  
					FROM 	"SAP_CADENA"  
					WHERE ( "SAP_CADENA"."BASE" = :ls_base ) AND  
							  ( "SAP_CADENA"."SERIE" = :ls_serie ) AND  
							  ( "SAP_CADENA"."NUMERO" = :ll_numero ) AND  
							  ( "SAP_CADENA"."TIPO_DEUDA" = 'C' or "SAP_CADENA"."TIPO_DEUDA" = 'E' ) 
					USING	sqlca;
					
					SELECT	"SAP_CADENA"."NRO_CONTRATO_SAP"  
					INTO 		:ll_numero_ctto_sap_m  
					FROM 	"SAP_CADENA"  
					WHERE ( "SAP_CADENA"."BASE" = :ls_base ) AND  
							  ( "SAP_CADENA"."SERIE" = :ls_serie ) AND  
							  ( "SAP_CADENA"."NUMERO" = :ll_numero ) AND  
							  ( "SAP_CADENA"."TIPO_DEUDA" = 'M')
					USING	sqlca;		  
					
					INSERT INTO "LOG_CAMBIO_ESTADO_CTTO"  
							( "BASE", "SERIE","NUMERO", "FECHA_MODIFICACION", "FECHA_RES", "ESTADO_ANTERIOR", "ESTADO_NUEVO","USUARIO",  "NRO_CTTO_SAP",  "NRO_CTTO_SAP_M" )  
					VALUES 	( :ls_base, :ls_serie, :ll_numero, :gdt_fec_sistema, :ldt_fecha_res, :ls_estado_original,'F', :gs_user, :ll_numero_ctto_sap_c, :ll_numero_ctto_sap_m )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						Rollback;
					end if	
					
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Fosa Común Area: "+ls_area_fosa+" Sector: "+ls_sector_fosa+" Sepultura: "+ls_sepult_fosa+" Nivel: "+ls_nivel_fosa+" SQL: "+sqlca.sqlerrtext)
				end if
			end if
		next
		if ll_suma > 0 then
			UPDATE	"CADENA"  
			SET 		"ESTADO" = 'F',   
						"FECHA_RES" = :ld_fecha_hoy  
			WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
					 ( "CADENA"."SERIE" = :ls_serie ) AND  
					 ( "CADENA"."NUMERO" = :ll_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				SELECT DISTINCT	"FALLECIDOS"."OBSERVACIONES"  
				INTO 					:ls_obs  
				FROM 	"FALLECIDOS"  
				WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ls_obs) then
						ls_obs	= ls_obs+', SE TRASLADA A FOSA COMUN DESDE AREA: '+ls_area+' SECTOR: '+ls_sector+' SEPULTURA: '+ls_sepultura+' NIVEL: '+is_nivel+' FECHA TRASLADO: '+string(ldt_fecha_tras,'dd/mm/yyyy')
					else
						ls_obs	= 'SE TRASLADA A FOSA COMUN DESDE AREA: '+ls_area+' SECTOR: '+ls_sector+' SEPULTURA: '+ls_sepultura+' NIVEL: '+is_nivel+' FECHA TRASLADO: '+string(ldt_fecha_tras,'dd/mm/yyyy')
					end if
					UPDATE	"FALLECIDOS"  
					SET 		"SECTOR" = :ls_sector_fosa,   
								"N_SEP" = :ls_sepult_fosa,   
								"NIVEL" = :is_nivel,   
								"OBSERVACIONES" = :ls_obs  
					WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_suma_graba ++
					else
						rollback;
						messagebox("Error Grabar","Error al Actualizar FALLECIDO Llave Nº "+string(ll_llave)+" SQL: "+sqlca.sqlerrtext)
					end if
				end if
			else
				rollback;
			end if
			if ll_suma_graba > 0 and ll_suma > 0 then
				SELECT	"CADENA"."RUT",	sysdate  
				INTO 		:ll_rut,				:gdt_fec_sistema
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if ll_rut > 0 then
					SELECT	MAX("MENSAJES"."CORRELATIVO")  
					INTO 		:ll_count  
					FROM 		"MENSAJES"  ;
					if ll_count > 0 then
						ll_count ++
					else
						ll_count	= 1
					end if
					ldt_fecha_fin	= datetime(date('31/12/2099'),time('00:00:00'))
					INSERT INTO "MENSAJES"  
								( "RUT",		"FECHA_CREACION",	"FECHA_FIN",		"AUTOR",		"MENSAJE",																				"ESTADO",	"USUARIO_FIN",	"BASE",		"SERIE",		"NUMERO",	"CLASIFICACION_MENSAJE",	"SW_MENSAJE",	"CORRELATIVO",	"FECHA_GESTION",	"ESTADO_GESTION" ) 
					VALUES 	( :ll_rut,	:gdt_fec_sistema,	:ldt_fecha_fin,	:gs_user,	'Situación especial, sólo debe ser atendido por el Departamento Atención Cliente.',	'P',			null,				:ls_base,	:ls_serie,	:ll_numero,	null,								'R',				:ll_count,		null,					'A' )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
						messagebox("Error Grabar","Error al Crear MENSAJERIA SQL: "+sqlca.sqlerrtext)
					end if
				end if
				gs_grabar_fosa	= 'S'
				messagebox("Grabar","Grabación Exitosa")
				w_mantenedor_fosa_comun.dw_detalle.retrieve(ll_parque_fosa,ls_area_fosa,ls_sector_fosa,ls_sepult_fosa)
				w_mantenedor_fosa_comun.setfocus()
				close(w_grabar_ocupacion_fosa_comun)
			else
				messagebox("Error Grabar","Error al Grabar Fosa Común SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_grabar_ocupacion_fosa_comun
integer x = 2725
integer y = 1692
integer width = 343
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_grabar_ocupacion_fosa_comun)
end event

type dw_grabar from datawindow within w_grabar_ocupacion_fosa_comun
integer x = 37
integer y = 32
integer width = 3058
integer height = 1632
integer taborder = 10
string title = "none"
string dataobject = "dw_grabar_ocupacion_en_fosa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_base,ls_serie,ls_sector,ls_sepultura,ls_nombre,ls_ap_pat,ls_ap_mat,ls_area
Long		ll_llave,ll_cod_parque,ll_new
Double	ll_numero

ls_columna		= dwo.name
if ls_columna='llave_fallecido' then
	ll_llave		= long(data)
	SELECT DISTINCT	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO",	"FALLECIDOS"."SECTOR",	"FALLECIDOS"."N_SEP",	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO",	"FALLECIDOS"."COD_PARQUE"
	INTO 					:ls_base,				:ls_serie,				:ll_numero,						:ls_sector,					:ls_sepultura,				:ls_nombre,					:ls_ap_pat,						:ls_ap_mat,						:ll_cod_parque  
	FROM		"FALLECIDOS"  
	WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_grabar.setitem(1,'nombre_fallecido',ls_nombre)
		dw_grabar.setitem(1,'ap_paterno_fallecido',ls_ap_pat )
		dw_grabar.setitem(1,'ap_materno_fallecido',ls_ap_mat )
		dw_grabar.setitem(1,'cod_parque_origen',ll_cod_parque )
		SELECT	"BASE_PLANI"."AREA"  
		INTO 		:ls_area  
		FROM 	"BASE_PLANI"  
		WHERE  ( "BASE_PLANI"."SECTOR" = :ls_sector ) AND  
				 ( "BASE_PLANI"."COD_PARQUE" = :ll_cod_parque )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_grabar.setitem(1,'area_origen',ls_area )
		end if
		dw_grabar.setitem(1,'sector_origen',ls_sector )
		dw_grabar.setitem(1,'sepultura_origen',ls_sepultura )
		dw_grabar.setitem(1,'base',ls_base )
		dw_grabar.setitem(1,'serie',ls_serie )
		dw_grabar.setitem(1,'numero',ll_numero )
		if ll_cod_parque > 0 then
			idw_detalle.retrieve(ll_cod_parque)
			idw_detalle4.retrieve(ll_cod_parque)
		end if
		if ll_cod_parque > 0 and not isnull(ls_sector) then
			idw_detalle2.retrieve(ll_cod_parque,ls_sector)
		end if
		if not isnull(ls_base) then
			idw_detalle3.retrieve(ls_base)
		end if
	else
		dw_grabar.reset()
		dw_grabar.getchild('sector_origen',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.insertrow(0)
		
		dw_grabar.getchild('sepultura_origen',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.insertrow(0)
		
		dw_grabar.getchild('serie',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		idw_detalle3.insertrow(0)
		
		dw_grabar.getchild('codigo_capataz',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		idw_detalle4.insertrow(0)
		
		ll_new	= dw_grabar.insertrow(0)
		dw_grabar.setitem(ll_new,'estado_reg','O')
	end if

elseif ls_columna='cod_parque_origen' or ls_columna='sector_origen' then
	ll_cod_parque	= dw_grabar.getitemnumber(1,'cod_parque_origen')
	ls_sector		= dw_grabar.getitemstring(1,'sector_origen')
	if ll_cod_parque > 0 then
		idw_detalle.retrieve(ll_cod_parque)
		idw_detalle4.retrieve(ll_cod_parque)
	end if
	if ll_cod_parque > 0 and not isnull(ls_sector) then
		idw_detalle2.retrieve(ll_cod_parque,ls_sector)
	end if

elseif ls_columna='base' then
	ls_base			= dw_grabar.getitemstring(1,'base')
	if not isnull(ls_base) then
		idw_detalle3.retrieve(ls_base)
	end if

end if
dw_grabar.accepttext()
end event

event clicked;String	ls_columna,ls_fecha
Long		ll_llave

ls_columna		= dwo.name
if ls_columna='p_1' then
	ll_llave		= dw_grabar.getitemnumber(1,'llave_fallecido')
	if ll_llave > 0 then
		ls_fecha	= string(date(dw_grabar.getitemdatetime(1,'fecha_traslado')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_grabar.setitem(1,'fecha_traslado',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_grabar.setitem(1,'fecha_traslado',date(ls_fecha))
		END IF
	end if
elseif ls_columna='p_2' then
	ll_llave		= dw_grabar.getitemnumber(1,'llave_fallecido')
	if ll_llave > 0 then
		ls_fecha	= string(date(dw_grabar.getitemdatetime(1,'fecha_resolucion')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_grabar.setitem(1,'fecha_resolucion',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_grabar.setitem(1,'fecha_resolucion',date(ls_fecha))
		END IF
	end if
end if
end event

