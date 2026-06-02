forward
global type w_lista_funerales from window
end type
type cb_exportar from commandbutton within w_lista_funerales
end type
type cb_imprimir from commandbutton within w_lista_funerales
end type
type cb_agregar from commandbutton within w_lista_funerales
end type
type cb_cerrar from commandbutton within w_lista_funerales
end type
type dw_lista from datawindow within w_lista_funerales
end type
type gb_1 from groupbox within w_lista_funerales
end type
end forward

global type w_lista_funerales from window
integer width = 3630
integer height = 2248
boolean titlebar = true
string title = "Calendario Funerales "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_agregar cb_agregar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_funerales w_lista_funerales

type variables
Long		il_cod_parque,il_row,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,il_intervalo,il_veces,il_hora_ini_templo,il_min_ini_templo,il_hora_fin_templo,&
			il_min_fin_templo,il_intervalo_templo,il_veces_templo,il_hora,il_min
Double	il_numero
String	is_sector,is_sepultura,is_nombre,is_ap_pat,is_ap_mat,is_ejecutivo,is_obs,is_tipo_ficha,&
			is_base,is_serie, is_tipo
datetime	idt_fecha_sepult
end variables

on w_lista_funerales.create
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_agregar=create cb_agregar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_imprimir,&
this.cb_agregar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_funerales.destroy
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_agregar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_indi,ll_hora,ll_min,ll_new,ll_hora_f,ll_min_f,ll_parque_f,ll_reg,ll_tot_reg,ll_reg_otro,ll_hora_ins,ll_minuto_ins,ll_new_reg,ll_corr,ll_nulo,ll_covid_19,ll_protocolo_covid,ll_ficha_telefonica,&
			ll_hora_inivela,ll_hora_finvela,ll_minuto_inivela,ll_minuto_finvela
String		ls_nom_f,ls_pat_f,ls_mat_f,ls_sector_f,ls_sepult_f,ls_ejecu_f,ls_string,ls_fecha,ls_obs_f,ls_string_otro,ls_tipo_f,ls_parque,ls_modif_adm_f,ls_base_f,ls_serie_f,ls_nombre,ls_sector_des, &
			ls_sepult_des, ls_base_des, ls_serie_des, ls_nivel_des,ls_usar_vela
Double	ll_numero_f,ll_numero_des
Datetime	ldt_fecha_inivela, ldt_fecha_finvela
gf_centrar(w_lista_funerales)
Setnull(ll_nulo)
il_cod_parque							= long(substr(1,1,Message.StringParm))
is_sector									= substr(1,2,Message.StringParm)
is_sepultura								= substr(1,3,Message.StringParm)
ls_fecha									= mid(substr(1,4,Message.StringParm),1,10)
idt_fecha_sepult						= datetime(date(ls_fecha))
is_nombre								= substr(1,5,Message.StringParm)
is_ap_pat								= substr(1,6,Message.StringParm)
is_ap_mat								= substr(1,7,Message.StringParm)
is_ejecutivo								= substr(1,8,Message.StringParm)
is_obs									= substr(1,9,Message.StringParm)
il_hora									= long(substr(1,10,Message.StringParm))
il_min										= long(substr(1,11,Message.StringParm))
is_tipo_ficha								= substr(1,12,Message.StringParm)
is_base									= substr(1,13,Message.StringParm)
is_serie									= substr(1,14,Message.StringParm)
il_numero								= Double(substr(1,15,Message.StringParm))
is_tipo									= substr(1,16,Message.StringParm)
dw_lista.settransobject(sqlca)
if il_cod_parque>0 then
	if is_tipo = 'T' then	// Resumen Templo
		dw_lista.setredraw(false)
		this.title							= 'Resumen de Uso Templo día '+string(idt_fecha_sepult,'dd/mm/yyyy')
		dw_lista.object.t_titulo.text	= 'Resumen de Uso Templo día '+string(idt_fecha_sepult,'dd/mm/yyyy')
		
		SELECT 	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_parque  
		FROM 	"COD_PARQ"  
		WHERE 	"COD_PARQ"."CODIGO" = :il_cod_parque
		USING	sqlca;	
		ls_parque						= 'Parque '+ls_parque
		dw_lista.object.t_parque.text	= ls_parque
		SELECT	"FICHA_HORAS_TEMPLO"."HORA_INICIO",   
					"FICHA_HORAS_TEMPLO"."MINUTO_INICIO",   
					"FICHA_HORAS_TEMPLO"."HORA_FINAL",   
					"FICHA_HORAS_TEMPLO"."MINUTO_FINAL",   
					"FICHA_HORAS_TEMPLO"."INTERVALO_MINUTO",   
					"FICHA_HORAS_TEMPLO"."VECES_USO"  
		INTO		:il_hora_ini_templo,   
					:il_min_ini_templo,   
					:il_hora_fin_templo,   
					:il_min_fin_templo,   
					:il_intervalo_templo,   
					:il_veces_templo  
		FROM 	"FICHA_HORAS_TEMPLO"  
		WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :il_cod_parque   ;
		
		ll_hora								= il_hora_ini_templo
		ll_min									= il_min_ini_templo
		for ll_indi=1 to 37
			ll_new								= dw_lista.insertrow(0)
			dw_lista.setitem(ll_new,'hora',ll_hora)
			dw_lista.setitem(ll_new,'minuto',ll_min)
			dw_lista.setitem(ll_new,'modif_adm','N')
			dw_lista.setitem(ll_new,'veces',il_intervalo_templo)
			dw_lista.setitem(ll_new,'fecha_dia',idt_fecha_sepult)
			dw_lista.setitem(ll_new,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new,'tipo_uso',is_tipo)
			ll_min								= ll_min + il_intervalo_templo
			if ll_min > 45 then
				ll_hora						= ll_hora + 1
				ll_min							= 0
			end if
			if ll_hora>il_hora_fin_templo then
				exit
			end if
		next
		ll_tot_reg							= dw_lista.rowcount()
		dw_lista.accepttext()
		if isvalid(w_ingreso_ficha_sepultacion) or isvalid(w_ingreso_ficha_traslado) or isvalid(w_ingreso_ficha_reduccion) or isvalid(w_ingreso_ficha_cadaver_transito) then
			DECLARE x1 CURSOR FOR 
			SELECT	"FICHA_SEPULTACION"."HORA_UTIL_TEMPLO",	"FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",		'',											'',												'',										'',											0,												'',	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
			FROM 	"FICHA_SEPULTACION"  
			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque AND
//						"FICHA_SEPULTACION"."SW_REDUCCION" = 1 AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
//			union
//			SELECT	"FICHA_SEPULTACION"."HORA_UTIL_TEMPLO",	"FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",		'',											'',												'',										'',											0,												'',	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//			FROM 	"FICHA_SEPULTACION"  
//			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
//						"FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque AND
//						"FICHA_SEPULTACION"."SW_PREGRABADO" = 0 AND
//						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'



			union
			SELECT	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."CODIGO_EJECUTIVO",	"FICHA_TRASLADO"."OBSERVACIONES_ORIGEN", 'FT',	"FICHA_TRASLADO"."MODIF_ADM",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",				"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO",	1,	1,	1
			FROM 	"FICHA_TRASLADO"  
			WHERE 	"FICHA_TRASLADO"."FECHA_TRASLADO" = :idt_fecha_sepult  AND
//						"FICHA_TRASLADO"."SW_REDUCCION" = 1 AND
						"FICHA_TRASLADO"."COD_PARQUE" = :il_cod_parque AND
						"FICHA_TRASLADO"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_REDUCCION"."HORA",	"FICHA_REDUCCION"."MINUTOS",	"FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"FICHA_REDUCCION"."AP_PATERNO_FALL",	"FICHA_REDUCCION"."AP_MATERNO_FALL",	"FICHA_REDUCCION"."SECTOR",	"FICHA_REDUCCION"."SEPULTURA",	"FICHA_REDUCCION"."COD_PARQUE",	"FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA", 'FR',	"FICHA_REDUCCION"."MODIF_ADM",	"FICHA_REDUCCION"."BASE",	"FICHA_REDUCCION"."SERIE",	"FICHA_REDUCCION"."NUMERO",		'',											'',												'',										'',											0,												'',	1,	1,	1
			FROM 	"FICHA_REDUCCION"  
			WHERE 	"FICHA_REDUCCION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_REDUCCION"."COD_PARQUE" = :il_cod_parque AND
						"FICHA_REDUCCION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRANSITO"."HORA",	"FICHA_TRANSITO"."MINUTOS",	"FICHA_TRANSITO"."CORRELATIVO_INTERNO",	"FICHA_TRANSITO"."NOMBRE_FALLECIDO",	"FICHA_TRANSITO"."AP_PATERNO_FALL",	"FICHA_TRANSITO"."AP_MATERNO_FALL",	"FICHA_TRANSITO"."SECTOR",	"FICHA_TRANSITO"."SEPULTURA",	"FICHA_TRANSITO"."COD_PARQUE",	"FICHA_TRANSITO"."CODIGO_EJECUTIVO",	"FICHA_TRANSITO"."OBSERVACION_SEPULTURA_COMPLETA", 'CT',	"FICHA_TRANSITO"."MODIF_ADM",	"FICHA_TRANSITO"."BASE",	"FICHA_TRANSITO"."SERIE",	"FICHA_TRANSITO"."NUMERO",		'',											'',												'',										'',											0,												'',	1,	1,	1
			FROM 	"FICHA_TRANSITO"  
			WHERE 	"FICHA_TRANSITO"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_TRANSITO"."COD_PARQUE" = :il_cod_parque AND
						"FICHA_TRANSITO"."ESTADO_REG" <> 'A'
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des, :ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica;
					if not isnull(ls_nom_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						if ll_hora_f > 0 then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_f)+' and minuto='+string(ll_min_f)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								if ls_nombre <> ls_nom_f then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_f)
									dw_lista.setitem(ll_reg,'minuto',ll_min_f)
								end if							
								dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
	//							if ls_tipo_f = 'FS' then
	//								SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//    								INTO 		:ll_covid_19, 										:ll_protocolo_covid, 											:ll_ficha_telefonica  
	//    								FROM 	"FICHA_SEPULTACION"  
	//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//											( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
	//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult )	;
	//							end if
								dw_lista.setitem(ll_reg,'sector',ls_sector_f)
								dw_lista.setitem(ll_reg,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
								dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_reg,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_reg,'veces',il_intervalo_templo)
								dw_lista.setitem(ll_reg,'fecha_dia',idt_fecha_sepult)
								dw_lista.setitem(ll_reg,'cod_parque',il_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base_f)
								dw_lista.setitem(ll_reg,'serie',ls_serie_f)
								dw_lista.setitem(ll_reg,'numero',ll_numero_f)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
								end if	
								dw_lista.setitem(ll_reg,'base_des',ls_base_des)
								dw_lista.setitem(ll_reg,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_reg,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_reg,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_reg,'sepultura_des',ls_sepult_des)
							else
								ls_string_otro				= 'hora='+string(ll_hora_f)+ ' and minuto='+string(ll_min_f)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_f and ll_minuto_ins = ll_min_f then
											if ll_min_f <= ll_minuto_ins then
//												if ls_tipo_f = 'FS' then
//													SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//													INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
//													FROM 	"FICHA_SEPULTACION"  
//													WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
//																( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
//																( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
//																( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
//																( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult );
//												end if
												ll_new_reg	= dw_lista.insertrow(ll_indi)
												dw_lista.setitem(ll_new_reg,'hora',ll_hora_f)
												dw_lista.setitem(ll_new_reg,'minuto',ll_min_f)
												dw_lista.setitem(ll_new_reg,'nombre',ls_nom_f)
												dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_f)
												dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_f)
												dw_lista.setitem(ll_new_reg,'sector',ls_sector_f)
												dw_lista.setitem(ll_new_reg,'sepultura',ls_sepult_f)
												dw_lista.setitem(ll_new_reg,'ejecutivo',ls_ejecu_f)
												dw_lista.setitem(ll_new_reg,'observacion',ls_obs_f)
												dw_lista.setitem(ll_new_reg,'tipo_ficha',ls_tipo_f)
												dw_lista.setitem(ll_new_reg,'modif_adm',ls_modif_adm_f)
												dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
												dw_lista.setitem(ll_new_reg,'fecha_dia',idt_fecha_sepult)
												dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base_f)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
												
												dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
												dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
												dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
												dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
												dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
												if ls_tipo_f = 'FS' then
													dw_lista.setitem(ll_new_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
													dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
													dw_lista.setitem(ll_new_reg,'sw_covid',ll_covid_19)
												end if	
												ll_tot_reg	= dw_lista.rowcount()
												exit
											end if
										end if
									next
								else
									if ll_hora_f < il_hora_ini then
										ll_new_reg	= dw_lista.insertrow(1)
									elseif ll_hora_f > il_hora_fin then
										ll_new_reg	= dw_lista.insertrow(0)
									end if
//									if ls_tipo_f = 'FS' then
//										SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//										INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
//										FROM 	"FICHA_SEPULTACION"  
//										WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
//													( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
//													( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
//													( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
//													( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult ) AND
//													( "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = :ll_corr )	;
//									end if
									dw_lista.setitem(ll_new_reg,'hora',ll_hora_f)
									dw_lista.setitem(ll_new_reg,'minuto',ll_min_f)
									dw_lista.setitem(ll_new_reg,'nombre',ls_nom_f)
									dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_f)
									dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_f)
									dw_lista.setitem(ll_new_reg,'sector',ls_sector_f)
									dw_lista.setitem(ll_new_reg,'sepultura',ls_sepult_f)
									dw_lista.setitem(ll_new_reg,'ejecutivo',ls_ejecu_f)
									dw_lista.setitem(ll_new_reg,'observacion',ls_obs_f)
									dw_lista.setitem(ll_new_reg,'tipo_ficha',ls_tipo_f)
									dw_lista.setitem(ll_new_reg,'modif_adm',ls_modif_adm_f)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',idt_fecha_sepult)
									dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base_f)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
									if ls_tipo_f = 'FS' then
										dw_lista.setitem(ll_new_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
										dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
										dw_lista.setitem(ll_new_reg,'sw_covid',ll_covid_19)
									end if	
									dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
									dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
									dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
									dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
									dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
									ll_tot_reg	= dw_lista.rowcount()
								end if
							end if
						end if
						ll_tot_reg				= dw_lista.rowcount()
					end if
					Setnull(ls_nom_f)
				LOOP
			end if
			close x1;
			dw_lista.accepttext()
			dw_lista.GROUPCALC() 
			dw_lista.setredraw(true)
		end if
	elseif is_tipo = 'V' then	// Resumen Velatorio
		dw_lista.setredraw(false)
		this.title							= 'Resumen de Uso Velatorio día '+string(idt_fecha_sepult,'dd/mm/yyyy')
		dw_lista.object.t_titulo.text	= 'Resumen de Uso Velatorio día '+string(idt_fecha_sepult,'dd/mm/yyyy')
		
		SELECT 	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_parque  
		FROM 	"COD_PARQ"  
		WHERE 	"COD_PARQ"."CODIGO" = :il_cod_parque
		USING	sqlca;	
		ls_parque						= 'Parque '+ls_parque
		dw_lista.object.t_parque.text	= ls_parque
		SELECT	"FICHA_HORAS_VELATORIO"."HORA_INICIO",   
					"FICHA_HORAS_VELATORIO"."MINUTO_INICIO",   
					"FICHA_HORAS_VELATORIO"."HORA_FINAL",   
					"FICHA_HORAS_VELATORIO"."MINUTO_FINAL",   
					"FICHA_HORAS_VELATORIO"."INTERVALO_MINUTO",   
					"FICHA_HORAS_VELATORIO"."VECES_USO"  
		INTO		:il_hora_ini_templo,   
					:il_min_ini_templo,   
					:il_hora_fin_templo,   
					:il_min_fin_templo,   
					:il_intervalo_templo,   
					:il_veces_templo  
		FROM 	"FICHA_HORAS_VELATORIO"  
		WHERE 	"FICHA_HORAS_VELATORIO"."COD_PARQUE" = :il_cod_parque   ;
		
		ll_hora								= il_hora_ini_templo
		ll_min									= il_min_ini_templo
		for ll_indi=1 to 37
			ll_new							= dw_lista.insertrow(0)
			dw_lista.setitem(ll_new,'hora',ll_hora)
			dw_lista.setitem(ll_new,'minuto',ll_min)
			dw_lista.setitem(ll_new,'modif_adm','N')
			dw_lista.setitem(ll_new,'veces',il_intervalo_templo)
			dw_lista.setitem(ll_new,'fecha_dia',idt_fecha_sepult)
			dw_lista.setitem(ll_new,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new,'tipo_uso',is_tipo)
			ll_min								= ll_min + il_intervalo_templo
			if ll_min > 45 then
				ll_hora						= ll_hora + 1
				ll_min							= 0
			end if
			if ll_hora>il_hora_fin_templo then
				exit
			end if
		next
		ll_tot_reg							= dw_lista.rowcount()
		dw_lista.accepttext()
		if isvalid(w_ingreso_ficha_sepultacion) or isvalid(w_ingreso_ficha_traslado) or isvalid(w_ingreso_ficha_reduccion) or isvalid(w_ingreso_ficha_cadaver_transito) then
			DECLARE x2 CURSOR FOR 
			SELECT	"FICHA_SEPULTACION"."HORA_UTIL_TEMPLO",	"FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",		'',											'',												'',										'',											0,												'',	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA",	"FICHA_SEPULTACION"."FECHA_INI_VELATORIO", 	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."FECHA_FIN_VELATORIO",	"FICHA_SEPULTACION"."HORA_UTIL_FIN_TEMPLO",	"FICHA_SEPULTACION"."MINUTO_UTIL_FIN_TEMPLO"  
			FROM 	"FICHA_SEPULTACION"  
			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque AND
//						"FICHA_SEPULTACION"."SW_REDUCCION" = 1 AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x2;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x2 into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des, :ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica,:ldt_fecha_inivela, :ll_hora_inivela, :ll_minuto_inivela, :ls_usar_vela, :ldt_fecha_finvela, :ll_hora_finvela, :ll_minuto_finvela  ;
					if not isnull(ls_nom_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						if ll_hora_f > 0 then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_f)+' and minuto='+string(ll_min_f)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								if ls_nombre <> ls_nom_f then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_f)
									dw_lista.setitem(ll_reg,'minuto',ll_min_f)
								end if							
								dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
	//							if ls_tipo_f = 'FS' then
	//								SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//    								INTO 		:ll_covid_19, 										:ll_protocolo_covid, 											:ll_ficha_telefonica  
	//    								FROM 	"FICHA_SEPULTACION"  
	//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//											( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
	//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult )	;
	//							end if
								dw_lista.setitem(ll_reg,'sector',ls_sector_f)
								dw_lista.setitem(ll_reg,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
								dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_reg,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_reg,'veces',il_intervalo_templo)
								dw_lista.setitem(ll_reg,'fecha_dia',idt_fecha_sepult)
								dw_lista.setitem(ll_reg,'cod_parque',il_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base_f)
								dw_lista.setitem(ll_reg,'serie',ls_serie_f)
								dw_lista.setitem(ll_reg,'numero',ll_numero_f)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
								end if	
								dw_lista.setitem(ll_reg,'base_des',ls_base_des)
								dw_lista.setitem(ll_reg,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_reg,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_reg,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_reg,'sepultura_des',ls_sepult_des)
							else
								ls_string_otro				= 'hora='+string(ll_hora_f)+ ' and minuto='+string(ll_min_f)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_f and ll_minuto_ins = ll_min_f then
											if ll_min_f <= ll_minuto_ins then
//												if ls_tipo_f = 'FS' then
//													SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//													INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
//													FROM 	"FICHA_SEPULTACION"  
//													WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
//																( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
//																( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
//																( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
//																( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult );
//												end if
												ll_new_reg	= dw_lista.insertrow(ll_indi)
												dw_lista.setitem(ll_new_reg,'hora',ll_hora_f)
												dw_lista.setitem(ll_new_reg,'minuto',ll_min_f)
												dw_lista.setitem(ll_new_reg,'nombre',ls_nom_f)
												dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_f)
												dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_f)
												dw_lista.setitem(ll_new_reg,'sector',ls_sector_f)
												dw_lista.setitem(ll_new_reg,'sepultura',ls_sepult_f)
												dw_lista.setitem(ll_new_reg,'ejecutivo',ls_ejecu_f)
												dw_lista.setitem(ll_new_reg,'observacion',ls_obs_f)
												dw_lista.setitem(ll_new_reg,'tipo_ficha',ls_tipo_f)
												dw_lista.setitem(ll_new_reg,'modif_adm',ls_modif_adm_f)
												dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
												dw_lista.setitem(ll_new_reg,'fecha_dia',idt_fecha_sepult)
												dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base_f)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
												
												dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
												dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
												dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
												dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
												dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
												if ls_tipo_f = 'FS' then
													dw_lista.setitem(ll_new_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
													dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
													dw_lista.setitem(ll_new_reg,'sw_covid',ll_covid_19)
												end if	
												ll_tot_reg	= dw_lista.rowcount()
												exit
											end if
										end if
									next
								else
									if ll_hora_f < il_hora_ini then
										ll_new_reg	= dw_lista.insertrow(1)
									elseif ll_hora_f > il_hora_fin then
										ll_new_reg	= dw_lista.insertrow(0)
									end if
//									if ls_tipo_f = 'FS' then
//										SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//										INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
//										FROM 	"FICHA_SEPULTACION"  
//										WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
//													( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
//													( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
//													( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
//													( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult ) AND
//													( "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = :ll_corr )	;
//									end if
									dw_lista.setitem(ll_new_reg,'hora',ll_hora_f)
									dw_lista.setitem(ll_new_reg,'minuto',ll_min_f)
									dw_lista.setitem(ll_new_reg,'nombre',ls_nom_f)
									dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_f)
									dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_f)
									dw_lista.setitem(ll_new_reg,'sector',ls_sector_f)
									dw_lista.setitem(ll_new_reg,'sepultura',ls_sepult_f)
									dw_lista.setitem(ll_new_reg,'ejecutivo',ls_ejecu_f)
									dw_lista.setitem(ll_new_reg,'observacion',ls_obs_f)
									dw_lista.setitem(ll_new_reg,'tipo_ficha',ls_tipo_f)
									dw_lista.setitem(ll_new_reg,'modif_adm',ls_modif_adm_f)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',idt_fecha_sepult)
									dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base_f)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
									if ls_tipo_f = 'FS' then
										dw_lista.setitem(ll_new_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
										dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
										dw_lista.setitem(ll_new_reg,'sw_covid',ll_covid_19)
									end if	
									dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
									dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
									dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
									dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
									dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
									ll_tot_reg	= dw_lista.rowcount()
								end if
							end if
						end if
						ll_tot_reg				= dw_lista.rowcount()
					end if
					Setnull(ls_nom_f)
				LOOP
			end if
			close x2;
			dw_lista.accepttext()
			dw_lista.GROUPCALC() 
			dw_lista.setredraw(true)
		end if
	else
		dw_lista.setredraw(false)
		this.title							= 'Resumen de Funerales día '+string(idt_fecha_sepult,'dd/mm/yyyy')
		dw_lista.object.t_titulo.text	= 'Resumen de Funerales día '+string(idt_fecha_sepult,'dd/mm/yyyy')
		
		SELECT 	"COD_PARQ"."NOMBRE"  
		INTO 		:ls_parque  
		FROM 	"COD_PARQ"  
		WHERE 	"COD_PARQ"."CODIGO" = :il_cod_parque
		USING	sqlca;	
		ls_parque						= 'Parque '+ls_parque
		dw_lista.object.t_parque.text	= ls_parque
		SELECT	"FICHA_HORAS"."HORA_INICIO",   
					"FICHA_HORAS"."MINUTO_INICIO",   
					"FICHA_HORAS"."HORA_FINAL",   
					"FICHA_HORAS"."MINUTO_FINAL",   
					"FICHA_HORAS"."INTERVALO_MINUTO",   
					"FICHA_HORAS"."VECES_SEPULTACION"  
		INTO		:il_hora_ini,   
					:il_min_ini,   
					:il_hora_fin,   
					:il_min_fin,   
					:il_intervalo,   
					:il_veces  
		FROM 		"FICHA_HORAS"  
		WHERE 	"FICHA_HORAS"."COD_PARQUE" = :il_cod_parque   ;
		
		ll_hora								= il_hora_ini
		ll_min									= il_min_ini
		for ll_indi=1 to 37
			ll_new							= dw_lista.insertrow(0)
			dw_lista.setitem(ll_new,'hora',ll_hora)
			dw_lista.setitem(ll_new,'minuto',ll_min)
			dw_lista.setitem(ll_new,'modif_adm','N')
			dw_lista.setitem(ll_new,'veces',il_intervalo)
			dw_lista.setitem(ll_new,'fecha_dia',idt_fecha_sepult)
			dw_lista.setitem(ll_new,'cod_parque',il_cod_parque)
			dw_lista.setitem(ll_new,'tipo_uso',is_tipo)
			ll_min								= ll_min + il_intervalo
			if ll_min > 45 then
				ll_hora							= ll_hora + 1
				ll_min							= 0
			end if
			if ll_hora>il_hora_fin then
				exit
			end if
		next
		ll_tot_reg								= dw_lista.rowcount()
		dw_lista.accepttext()
		if isvalid(w_ingreso_ficha_sepultacion) or isvalid(w_ingreso_ficha_traslado) or isvalid(w_ingreso_ficha_reduccion) or isvalid(w_ingreso_ficha_cadaver_transito) then
			DECLARE x3 CURSOR FOR 
			SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",		'',											'',												'',										'',											0,												'',	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
			FROM 	"FICHA_SEPULTACION"  
			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque AND
//						"FICHA_SEPULTACION"."SW_REDUCCION" = 1 AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
//			union
//			SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",		'',											'',												'',										'',											0,												'',	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//			FROM 	"FICHA_SEPULTACION"  
//			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
//						"FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque AND
//						"FICHA_SEPULTACION"."SW_PREGRABADO" = 0 AND
//						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."CODIGO_EJECUTIVO",	"FICHA_TRASLADO"."OBSERVACIONES_ORIGEN", 'FT',	"FICHA_TRASLADO"."MODIF_ADM",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",				"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO",	1,	1,	1
			FROM 	"FICHA_TRASLADO"  
			WHERE 	"FICHA_TRASLADO"."FECHA_TRASLADO" = :idt_fecha_sepult  AND
//						"FICHA_TRASLADO"."SW_REDUCCION" = 1 AND
						"FICHA_TRASLADO"."COD_PARQUE" = :il_cod_parque AND
						"FICHA_TRASLADO"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_REDUCCION"."HORA",	"FICHA_REDUCCION"."MINUTOS",	"FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"FICHA_REDUCCION"."AP_PATERNO_FALL",	"FICHA_REDUCCION"."AP_MATERNO_FALL",	"FICHA_REDUCCION"."SECTOR",	"FICHA_REDUCCION"."SEPULTURA",	"FICHA_REDUCCION"."COD_PARQUE",	"FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA", 'FR',	"FICHA_REDUCCION"."MODIF_ADM",	"FICHA_REDUCCION"."BASE",	"FICHA_REDUCCION"."SERIE",	"FICHA_REDUCCION"."NUMERO",		'',											'',												'',										'',											0,												'',	1,	1,	1
			FROM 	"FICHA_REDUCCION"  
			WHERE 	"FICHA_REDUCCION"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_REDUCCION"."COD_PARQUE" = :il_cod_parque AND
						"FICHA_REDUCCION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRANSITO"."HORA",	"FICHA_TRANSITO"."MINUTOS",	"FICHA_TRANSITO"."CORRELATIVO_INTERNO",	"FICHA_TRANSITO"."NOMBRE_FALLECIDO",	"FICHA_TRANSITO"."AP_PATERNO_FALL",	"FICHA_TRANSITO"."AP_MATERNO_FALL",	"FICHA_TRANSITO"."SECTOR",	"FICHA_TRANSITO"."SEPULTURA",	"FICHA_TRANSITO"."COD_PARQUE",	"FICHA_TRANSITO"."CODIGO_EJECUTIVO",	"FICHA_TRANSITO"."OBSERVACION_SEPULTURA_COMPLETA", 'CT',	"FICHA_TRANSITO"."MODIF_ADM",	"FICHA_TRANSITO"."BASE",	"FICHA_TRANSITO"."SERIE",	"FICHA_TRANSITO"."NUMERO",		'',											'',												'',										'',											0,												'',	1,	1,	1
			FROM 	"FICHA_TRANSITO"  
			WHERE 	"FICHA_TRANSITO"."FECHA_SEPULTACION" = :idt_fecha_sepult  AND
						"FICHA_TRANSITO"."COD_PARQUE" = :il_cod_parque AND
						"FICHA_TRANSITO"."ESTADO_REG" <> 'A'
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x3;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x3 into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des, :ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica;
					if not isnull(ls_nom_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						if ll_hora_f > 0 then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_f)+' and minuto='+string(ll_min_f)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								if ls_nombre <> ls_nom_f then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_f)	//ll_nulo)
									dw_lista.setitem(ll_reg,'minuto',ll_min_f)	//ll_nulo)
								end if							
								dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
	//							if ls_tipo_f = 'FS' then
	//								SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//    								INTO 		:ll_covid_19, 										:ll_protocolo_covid, 											:ll_ficha_telefonica  
	//    								FROM 	"FICHA_SEPULTACION"  
	//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//											( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
	//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult )	;
	//							end if
								dw_lista.setitem(ll_reg,'sector',ls_sector_f)
								dw_lista.setitem(ll_reg,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
								dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_reg,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_reg,'veces',il_intervalo)
								dw_lista.setitem(ll_reg,'fecha_dia',idt_fecha_sepult)
								dw_lista.setitem(ll_reg,'cod_parque',il_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base_f)
								dw_lista.setitem(ll_reg,'serie',ls_serie_f)
								dw_lista.setitem(ll_reg,'numero',ll_numero_f)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
								end if	
								dw_lista.setitem(ll_reg,'base_des',ls_base_des)
								dw_lista.setitem(ll_reg,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_reg,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_reg,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_reg,'sepultura_des',ls_sepult_des)
							else
								ls_string_otro				= 'hora='+string(ll_hora_f)+ ' and minuto='+string(ll_min_f)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_f and ll_minuto_ins = ll_min_f then
											if ll_min_f <= ll_minuto_ins then
//												if ls_tipo_f = 'FS' then
//													SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//													INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
//													FROM 	"FICHA_SEPULTACION"  
//													WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
//																( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
//																( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
//																( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
//																( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult );
//												end if
												ll_new_reg	= dw_lista.insertrow(ll_indi)
												dw_lista.setitem(ll_new_reg,'hora',ll_hora_f)
												dw_lista.setitem(ll_new_reg,'minuto',ll_min_f)
												dw_lista.setitem(ll_new_reg,'nombre',ls_nom_f)
												dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_f)
												dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_f)
												dw_lista.setitem(ll_new_reg,'sector',ls_sector_f)
												dw_lista.setitem(ll_new_reg,'sepultura',ls_sepult_f)
												dw_lista.setitem(ll_new_reg,'ejecutivo',ls_ejecu_f)
												dw_lista.setitem(ll_new_reg,'observacion',ls_obs_f)
												dw_lista.setitem(ll_new_reg,'tipo_ficha',ls_tipo_f)
												dw_lista.setitem(ll_new_reg,'modif_adm',ls_modif_adm_f)
												dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
												dw_lista.setitem(ll_new_reg,'fecha_dia',idt_fecha_sepult)
												dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base_f)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
												
												dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
												dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
												dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
												dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
												dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
												if ls_tipo_f = 'FS' then
													dw_lista.setitem(ll_new_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
													dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
													dw_lista.setitem(ll_new_reg,'sw_covid',ll_covid_19)
												end if	
												ll_tot_reg	= dw_lista.rowcount()
												exit
											end if
										end if
									next
								else
									if ll_hora_f < il_hora_ini then
										ll_new_reg	= dw_lista.insertrow(1)
									elseif ll_hora_f > il_hora_fin then
										ll_new_reg	= dw_lista.insertrow(0)
									end if
//									if ls_tipo_f = 'FS' then
//										SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
//										INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
//										FROM 	"FICHA_SEPULTACION"  
//										WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
//													( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
//													( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
//													( "FICHA_SEPULTACION"."COD_PARQUE" = :il_cod_parque ) AND
//													( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:idt_fecha_sepult ) AND
//													( "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = :ll_corr )	;
//									end if
									dw_lista.setitem(ll_new_reg,'hora',ll_hora_f)
									dw_lista.setitem(ll_new_reg,'minuto',ll_min_f)
									dw_lista.setitem(ll_new_reg,'nombre',ls_nom_f)
									dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_f)
									dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_f)
									dw_lista.setitem(ll_new_reg,'sector',ls_sector_f)
									dw_lista.setitem(ll_new_reg,'sepultura',ls_sepult_f)
									dw_lista.setitem(ll_new_reg,'ejecutivo',ls_ejecu_f)
									dw_lista.setitem(ll_new_reg,'observacion',ls_obs_f)
									dw_lista.setitem(ll_new_reg,'tipo_ficha',ls_tipo_f)
									dw_lista.setitem(ll_new_reg,'modif_adm',ls_modif_adm_f)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',idt_fecha_sepult)
									dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base_f)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
									if ls_tipo_f = 'FS' then
										dw_lista.setitem(ll_new_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
										dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
										dw_lista.setitem(ll_new_reg,'sw_covid',ll_covid_19)
									end if	
									dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
									dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
									dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
									dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
									dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
									ll_tot_reg	= dw_lista.rowcount()
								end if
							end if
						end if
						ll_tot_reg				= dw_lista.rowcount()
					end if
					Setnull(ls_nom_f)
				LOOP
			end if
			close x3;
			dw_lista.accepttext()
			dw_lista.GROUPCALC() 
			dw_lista.setredraw(true)
		end if
	end if
	gs_ventana	= 'w_lista_funerales'
	f_valida_objeto2()
else
	messagebox("Advertencia","Debe Seleccionar Parque")
	close(w_lista_funerales)
end if
end event

type cb_exportar from commandbutton within w_lista_funerales
integer x = 1893
integer y = 2012
integer width = 302
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_lista_funerales
integer x = 1550
integer y = 2012
integer width = 302
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.print.preview	= true
	dw_lista.object.datawindow.zoom				= 80
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom				= 100
	dw_lista.object.datawindow.print.preview	= false
end if

end event

type cb_agregar from commandbutton within w_lista_funerales
integer x = 41
integer y = 2012
integer width = 302
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agregar"
end type

event clicked;String	ls_string,ls_nom
Long		ll_reg,ll_reg_hora,ll_tot_reg,ll_new,ll_min_new,ll_reg_hora_otra,ll_tot_reg_ant,ll_indi,&
			ll_hora_sel,ll_min_sel

if il_hora=0 or isnull(il_hora) then
	ls_nom			= dw_lista.getitemstring(il_row,'nombre')
	if isnull(ls_nom) or ls_nom='' then
		ll_hora_sel	= dw_lista.getitemnumber(il_row,'hora')
		ll_min_sel	= dw_lista.getitemnumber(il_row,'minuto')
		dw_lista.setitem(il_row,'nombre',is_nombre)
		dw_lista.setitem(il_row,'ap_paterno',is_ap_pat)
		dw_lista.setitem(il_row,'ap_materno',is_ap_mat)
		dw_lista.setitem(il_row,'sector',is_sector)
		dw_lista.setitem(il_row,'sepultura',is_sepultura)
		dw_lista.setitem(il_row,'ejecutivo',is_ejecutivo)
		dw_lista.setitem(il_row,'observacion',is_obs)
		dw_lista.setitem(il_row,'tipo_ficha',is_tipo_ficha)
		if isvalid(w_ingreso_ficha_sepultacion) then
			ll_tot_reg_ant	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
			for ll_indi=1 to ll_tot_reg_ant
				if is_tipo = 'T' then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_templo',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_templo',ll_min_sel)
				elseif is_tipo = 'V' then
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'hora_util_capilla',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'minuto_util_capilla',ll_min_sel)
				else
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_min_sel)
					
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',ll_hora_sel)
					w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_sel)
				end if
			next
			messagebox("Advertencia","Recuerde Grabar Ficha de Sepultación, Se Actualizó Horario de Sepultación")
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
			close(w_lista_funerales)
		elseif isvalid(w_ingreso_ficha_traslado) then
			ll_tot_reg_ant	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
			for ll_indi=1 to ll_tot_reg_ant
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_fijada',ll_hora_sel)
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_fijada',ll_min_sel)
				
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',ll_hora_sel)
				w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_sel)
			next
			messagebox("Advertencia","Recuerde Grabar Ficha de Traslado, Se Actualizó Hora Fijada")
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('codigo_ejecutivo')
			close(w_lista_funerales)
		end if
	else
		messagebox("Advertencia","No es Posible Asignar Hora Reservada")
	end if
elseif il_hora>0 then
	ll_tot_reg	= dw_lista.rowcount()
	ls_string		= "nombre='"+is_nombre+"' and ap_paterno='"+is_ap_pat+"' and ap_materno='"+is_ap_mat+"'"
	ll_reg			= dw_lista.Find(ls_string, 1, ll_tot_reg)
	if ll_reg>0 then
		messagebox("Advertencia","NO es posible Agregar Fallecido, Ya está Asignado")
	else
		ls_string	= "hora="+string(il_hora)+" and minuto="+string(il_min)
		ll_reg_hora	= dw_lista.Find(ls_string, 1, ll_tot_reg)
		if ll_reg_hora>0 then
			ls_nom	= dw_lista.getitemstring(ll_reg_hora,'nombre')
			if ls_nom='' or isnull(ls_nom) then
				dw_lista.setitem(ll_reg_hora,'nombre',is_nombre)
				dw_lista.setitem(ll_reg_hora,'ap_paterno',is_ap_pat)
				dw_lista.setitem(ll_reg_hora,'ap_materno',is_ap_mat)
				dw_lista.setitem(ll_reg_hora,'sector',is_sector)
				dw_lista.setitem(ll_reg_hora,'sepultura',is_sepultura)
				dw_lista.setitem(ll_reg_hora,'ejecutivo',is_ejecutivo)
				dw_lista.setitem(ll_reg_hora,'observacion',is_obs)
				dw_lista.setitem(ll_reg_hora,'tipo_ficha',is_tipo_ficha)
			else
				ll_new						= ll_reg_hora + 1
				dw_lista.insertrow(ll_new)
				ll_min_new					= il_min + 5
				ls_string					= "hora="+string(il_hora)+" and minuto="+string(ll_min_new)
				ll_reg_hora_otra	= dw_lista.Find(ls_string, 1, ll_tot_reg)
				if ll_reg_hora_otra>0 then
					ll_min_new				= il_min + 10
					ls_string				= "hora="+string(il_hora)+" and minuto="+string(ll_min_new)
					ll_reg_hora_otra		= dw_lista.Find(ls_string, 1, ll_tot_reg)
					if ll_reg_hora_otra>0 then
						ll_min_new			= il_min + 15
						ls_string			= "hora="+string(il_hora)+" and minuto="+string(ll_min_new)
						ll_reg_hora_otra	= dw_lista.Find(ls_string, 1, ll_tot_reg)
						if ll_reg_hora_otra>0 then
							ll_min_new			= il_min + 20
						end if
					end if
				end if
				dw_lista.setitem(ll_new,'hora',il_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min_new)
				if isvalid(w_ingreso_ficha_sepultacion) then
					ll_tot_reg_ant	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					for ll_indi=1 to ll_tot_reg_ant
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora',il_hora)
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minutos',ll_min_new)
						
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',il_hora)
						w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_new)
					next
					messagebox("Advertencia","Recuerde Grabar Ficha de Sepultación, Se Actualizó Horario de Sepultación")
				elseif isvalid(w_ingreso_ficha_traslado) then
					ll_tot_reg_ant	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.rowcount()
					for ll_indi=1 to ll_tot_reg_ant
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_fijada',il_hora)
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_fijada',ll_min_new)
						
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'hora_def',il_hora)
						w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'minuto_def',ll_min_new)
					next
					messagebox("Advertencia","Recuerde Grabar Ficha de Traslado, Se Actualizó Hora Fijada")
				end if
				dw_lista.setitem(ll_new,'nombre',is_nombre)
				dw_lista.setitem(ll_new,'ap_paterno',is_ap_pat)
				dw_lista.setitem(ll_new,'ap_materno',is_ap_mat)
				dw_lista.setitem(ll_new,'sector',is_sector)
				dw_lista.setitem(ll_new,'sepultura',is_sepultura)
				dw_lista.setitem(ll_new,'ejecutivo',is_ejecutivo)
				dw_lista.setitem(ll_new,'observacion',is_obs)
				dw_lista.setitem(ll_new,'tipo_ficha',is_tipo_ficha)
			end if
		end if
		close(w_lista_funerales)
	end if
end if
end event

type cb_cerrar from commandbutton within w_lista_funerales
integer x = 3264
integer y = 2012
integer width = 302
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_funerales)
end event

type dw_lista from datawindow within w_lista_funerales
integer x = 41
integer y = 40
integer width = 3525
integer height = 1928
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_resumen_horario_funerales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_lista_funerales
integer x = 1527
integer y = 1964
integer width = 695
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

