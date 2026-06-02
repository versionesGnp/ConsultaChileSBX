forward
global type w_imprimir_lista_funerales from window
end type
type p_fin from picture within w_imprimir_lista_funerales
end type
type st_3 from statictext within w_imprimir_lista_funerales
end type
type em_fec_fin from editmask within w_imprimir_lista_funerales
end type
type pb_ok from picturebutton within w_imprimir_lista_funerales
end type
type st_16 from statictext within w_imprimir_lista_funerales
end type
type dw_parque from datawindow within w_imprimir_lista_funerales
end type
type cb_exportar from commandbutton within w_imprimir_lista_funerales
end type
type cb_imprimir from commandbutton within w_imprimir_lista_funerales
end type
type cb_cerrar from commandbutton within w_imprimir_lista_funerales
end type
type dw_lista from datawindow within w_imprimir_lista_funerales
end type
type gb_1 from groupbox within w_imprimir_lista_funerales
end type
end forward

global type w_imprimir_lista_funerales from window
integer width = 3639
integer height = 2268
boolean titlebar = true
string title = "Calendario Funerales "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_fin p_fin
st_3 st_3
em_fec_fin em_fec_fin
pb_ok pb_ok
st_16 st_16
dw_parque dw_parque
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_imprimir_lista_funerales w_imprimir_lista_funerales

type variables
Long		il_cod_parque,il_row,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,il_intervalo,il_veces,l_hora,il_min,il_hora_ini_templo,il_min_ini_templo,&
			il_hora_fin_templo,il_min_fin_templo,il_intervalo_templo,il_veces_templo
String		is_sector,is_sepultura,is_nombre,is_ap_pat,is_ap_mat,is_ejecutivo,is_obs,is_tipo_ficha,is_tipo
datetime	idt_fecha_sepult


end variables

on w_imprimir_lista_funerales.create
this.p_fin=create p_fin
this.st_3=create st_3
this.em_fec_fin=create em_fec_fin
this.pb_ok=create pb_ok
this.st_16=create st_16
this.dw_parque=create dw_parque
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.p_fin,&
this.st_3,&
this.em_fec_fin,&
this.pb_ok,&
this.st_16,&
this.dw_parque,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_imprimir_lista_funerales.destroy
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.em_fec_fin)
destroy(this.pb_ok)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_indi,ll_hora,ll_min,ll_new,ll_hora_f,ll_min_f,ll_parque_f,ll_reg,ll_tot_reg,ll_reg_otro,&
			ll_hora_ins,ll_minuto_ins,ll_new_reg,ll_cod_parque
String	ls_nom_f,ls_pat_f,ls_mat_f,ls_sector_f,ls_sepult_f,ls_ejecu_f,ls_string,ls_fecha,ls_obs_f,&
			ls_string_otro,ls_tipo_f 
datetime	ldt_fecha

is_tipo							= String(Message.StringParm)
ldt_fecha							= datetime(today(),time('00:00:00'))
gf_centrar(w_imprimir_lista_funerales)
em_fec_fin.text					= string(ldt_fecha,'dd/mm/yyyy')
if is_tipo = 'F' or is_tipo = 'C' then			//FS
	st_16.text					= 'Parque'
	dw_parque.dataobject	= 'dwe_lista_codigo_parque_nuestro'
elseif is_tipo = 'T' then	//Templo
	st_16.text					= 'Sala'
	dw_parque.dataobject	= 'dwe_lista_codigo_parque_nuestro_t'
elseif is_tipo = 'V' then	//Velatorio
	st_16.text					= 'Sala'
	dw_parque.dataobject	= 'dwe_lista_codigo_parque_nuestro_v'
end if
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque				= 1
elseif gs_conexion	= "Parque La Foresta" then
	ll_cod_parque				= 11
end if
if is_tipo = 'F' or is_tipo = 'C' then	 
	dw_parque.setitem(1,'cod_parque',ll_cod_parque)
else
	dw_parque.setitem(1,'cod_parque',1)
end if
dw_lista.settransobject(sqlca)
if is_tipo = 'F' or is_tipo = 'C' then
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
	WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
	
	ll_hora						= il_hora_ini
	ll_min							= il_min_ini
	for ll_indi=1 to 37
		ll_new					= dw_lista.insertrow(0)
		dw_lista.setitem(ll_new,'hora',ll_hora)
		dw_lista.setitem(ll_new,'minuto',ll_min)
		dw_lista.setitem(ll_new,'modif_adm','N')
		dw_lista.setitem(ll_new,'veces',il_intervalo)
		dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
		dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
		ll_min						= ll_min + il_intervalo
		if ll_min > 45 then
			ll_hora				= ll_hora + 1
			ll_min					= 0
		end if
		if ll_hora>il_hora_fin then
			exit
		end if
	next
elseif is_tipo = 'T' then
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
	WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque   ;
	
	ll_hora						= il_hora_ini_templo
	ll_min							= il_min_ini_templo
	for ll_indi=1 to 37
		ll_new					= dw_lista.insertrow(0)
		dw_lista.setitem(ll_new,'hora',ll_hora)
		dw_lista.setitem(ll_new,'minuto',ll_min)
		dw_lista.setitem(ll_new,'modif_adm','N')
		dw_lista.setitem(ll_new,'veces',il_intervalo_templo)
		dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
		dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
		ll_min						= ll_min + il_intervalo_templo
		if ll_min > 45 then
			ll_hora				= ll_hora + 1
			ll_min					= 0
		end if
		if ll_hora>il_hora_fin_templo then
			exit
		end if
	next
elseif is_tipo = 'V' then
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
	WHERE 	"FICHA_HORAS_VELATORIO"."COD_PARQUE" = :ll_cod_parque   ;
	
	ll_hora							= il_hora_ini_templo
	ll_min								= il_min_ini_templo
	for ll_indi=1 to 37
		ll_new						= dw_lista.insertrow(0)
		dw_lista.setitem(ll_new,'hora',ll_hora)
		dw_lista.setitem(ll_new,'minuto',ll_min)
		dw_lista.setitem(ll_new,'modif_adm','N')
		dw_lista.setitem(ll_new,'veces',il_intervalo_templo)
		dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
		dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
		ll_min							= ll_min + il_intervalo_templo
		if ll_min > 45 then
			ll_hora					= ll_hora + 1
			ll_min						= 0
		end if
		if ll_hora>il_hora_fin_templo then
			exit
		end if
	next
end if
dw_lista.accepttext()
gs_ventana							= 'w_imprimir_lista_funerales'
f_valida_objeto2()
pb_ok.triggerevent(clicked!)
end event

type p_fin from picture within w_imprimir_lista_funerales
integer x = 827
integer y = 44
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha,fech
datetime	ldt_fecha
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fec_fin.text = Message.StringParm
END IF
ldt_fecha	= datetime(date(em_fec_fin.text),time('00:00:00'))
if not isnull(ldt_fecha) then pb_ok.triggerevent(clicked!)
end event

type st_3 from statictext within w_imprimir_lista_funerales
integer x = 37
integer y = 52
integer width = 411
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_imprimir_lista_funerales
integer x = 466
integer y = 44
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;if not isnull(this.text) then pb_ok.triggerevent(clicked!)
end event

type pb_ok from picturebutton within w_imprimir_lista_funerales
integer x = 1851
integer y = 24
integer width = 151
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;Datetime	ldt_fecha,ldt_fecha_inivela,ldt_fecha_finvela
time		lt_ini=time('00:00:00')
Long		ll_indi,ll_hora,ll_min,ll_new,ll_hora_f,ll_min_f,ll_parque_f,ll_reg,ll_tot_reg,ll_reg_otro,ll_hora_ins,ll_minuto_ins,ll_new_reg,ll_cod_parque,ll_nulo,ll_corr,ll_hora_uso_cap,&
			ll_min_uso_cap,ll_sw_impacto,ll_largo,ll_covid_19,ll_protocolo_covid,ll_ficha_telefonica,ll_hora_inivela,ll_minuto_inivela,ll_hora_finvela,ll_minuto_finvela,ll_cod_parque_tv,&
			ll_hora_horario,ll_minuto_horario,ll_sw_perfil_homenaje
String		ls_nom_f,ls_pat_f,ls_mat_f,ls_sector_f,ls_sepult_f,ls_ejecu_f,ls_string,ls_fecha,ls_obs_f,ls_string_otro,ls_tipo_f,ls_parque,ls_modif_adm_f,ls_n,ls_base_f,ls_serie_f,ls_nombre,ls_ap_pat,&
			ls_ap_mat,ls_uso_capilla,ls_sector_des,ls_sepult_des,ls_base_des,ls_serie_des,ls_nivel_des,ls_pregrabado,ls_usar_vela;
Double	ll_numero_f,ll_numero_des

ls_n											= 'N'
ldt_fecha										= datetime(date(em_fec_fin.text),lt_ini)
Setnull(ll_nulo)
if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
	messagebox("Advertencia","Fecha Inválida")
	em_fec_fin.setfocus()
else
	ll_cod_parque								= dw_parque.getitemnumber(1,'cod_parque')
	if ll_cod_parque>0 then
		dw_lista.reset()
		dw_lista.setredraw(false)
		if is_tipo='F' then
			w_imprimir_lista_funerales.title	= 'Resumen de Funerales día '+string(ldt_fecha,'dd/mm/yyyy')
			dw_lista.object.t_titulo.text			= 'Resumen de Funerales día '+string(ldt_fecha,'dd/mm/yyyy')
			SELECT 	"COD_PARQ"."NOMBRE"  
			INTO 		:ls_parque  
			FROM		"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
			USING	sqlca;
			ls_parque	= 'Parque '+ls_parque
			dw_lista.object.t_parque.text		= ls_parque
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
			WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
			ll_hora									= il_hora_ini
			ll_min									= il_min_ini
			for ll_indi=1 to 37
				ll_new								= dw_lista.insertrow(0)
				dw_lista.setitem(ll_new,'hora',ll_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min)
				dw_lista.setitem(ll_new,'modif_adm',ls_n)
				dw_lista.setitem(ll_new,'veces',il_intervalo)
				dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
				dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
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
			dw_lista.accepttext()
			ll_tot_reg			= dw_lista.rowcount()
			dw_lista.accepttext()

			DECLARE x1 CURSOR FOR 
			SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA",	  "FICHA_SEPULTACION"."SW_PERFIL_HOMENAJE"
			FROM 	"FICHA_SEPULTACION"  
			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_SEPULTACION"."BASE" <> 'U' AND
	//					"FICHA_SEPULTACION"."SW_REDUCCION" = 1 AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
	//		union
	//		SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//		FROM 	"FICHA_SEPULTACION"  
	//		WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha  AND
	//					"FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque AND
	//					"FICHA_SEPULTACION"."SW_PREGRABADO" = 0 AND
	//					"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."CODIGO_EJECUTIVO",	"FICHA_TRASLADO"."OBSERVACIONES_ORIGEN", 'FT',	"FICHA_TRASLADO"."MODIF_ADM",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",			'N',											0,														0,															1,														"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO",1,1,1, 1
			FROM 		"FICHA_TRASLADO"  
			WHERE 	"FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha  AND
						"FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_TRASLADO"."BASE_DESTINO" <> 'U' AND
//						"FICHA_TRASLADO"."SW_REDUCCION" = 1 AND
						"FICHA_TRASLADO"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_REDUCCION"."HORA",	"FICHA_REDUCCION"."MINUTOS",	"FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"FICHA_REDUCCION"."AP_PATERNO_FALL",	"FICHA_REDUCCION"."AP_MATERNO_FALL",	"FICHA_REDUCCION"."SECTOR",	"FICHA_REDUCCION"."SEPULTURA",	"FICHA_REDUCCION"."COD_PARQUE",	"FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA", 'FR',	"FICHA_REDUCCION"."MODIF_ADM",	"FICHA_REDUCCION"."BASE",	"FICHA_REDUCCION"."SERIE",	"FICHA_REDUCCION"."NUMERO",	"FICHA_REDUCCION"."USAR_CAPILLA",	"FICHA_REDUCCION"."HORA_UTIL_CAPILLA",	"FICHA_REDUCCION"."MINUTO_UTIL_CAPILLA",	"FICHA_REDUCCION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'',	1,	1,	1, 1
			FROM 	"FICHA_REDUCCION"  
			WHERE 	"FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_REDUCCION"."BASE" <> 'U' AND
						"FICHA_REDUCCION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRANSITO"."HORA",	"FICHA_TRANSITO"."MINUTOS",	"FICHA_TRANSITO"."CORRELATIVO_INTERNO",	"FICHA_TRANSITO"."NOMBRE_FALLECIDO",	"FICHA_TRANSITO"."AP_PATERNO_FALL",	"FICHA_TRANSITO"."AP_MATERNO_FALL",	"FICHA_TRANSITO"."SECTOR",	"FICHA_TRANSITO"."SEPULTURA",	"FICHA_TRANSITO"."COD_PARQUE",	"FICHA_TRANSITO"."CODIGO_EJECUTIVO",	"FICHA_TRANSITO"."OBSERVACION_SEPULTURA_COMPLETA", 'CT',	"FICHA_TRANSITO"."MODIF_ADM",	"FICHA_TRANSITO"."BASE",	"FICHA_TRANSITO"."SERIE",	"FICHA_TRANSITO"."NUMERO",	"FICHA_TRANSITO"."USAR_CAPILLA",	"FICHA_TRANSITO"."HORA_UTIL_CAPILLA",	"FICHA_TRANSITO"."MINUTO_UTIL_CAPILLA",	"FICHA_TRANSITO"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'',	1,	1,	1, 1
			FROM 		"FICHA_TRANSITO"  
			WHERE 	"FICHA_TRANSITO"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_TRANSITO"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_TRANSITO"."BASE" <> 'U' AND
						"FICHA_TRANSITO"."ESTADO_REG" <> 'A'
			union
			SELECT	"FC_CABECERA"."HORA_CINERACION",	"FC_CABECERA"."MINUTO_CINERACION",	"FC_CABECERA"."CORRELATIVO_FC",	"FC_FALLECIDO"."NOMBRES",	"FC_FALLECIDO"."APELLIDO_PATERNO",	"FC_FALLECIDO"."APELLIDO_MATERNO",	'0' as SECTOR,	'0' as SEPULTURA,	"FC_CABECERA"."COD_PARQUE_DESTINO",	"FC_CABECERA"."USUARIO_CREA",	"FC_FALLECIDO"."OBSERVACIONES", 'FC',	'N' as MODIF_ADM,	"FC_CABECERA"."BASE",	"FC_CABECERA"."SERIE",	"FC_CABECERA"."NUMERO","FC_RESPONSABLE_RETIRO"."USO_CAPILLA",	"FC_RESPONSABLE_RETIRO"."HORA_USO_CAPILLA",	 "FC_RESPONSABLE_RETIRO"."MINUTOS_USO_CAPILLA",	1 as SW_ALTO_IMPACTO,		'',											'',												'',										'',											0,												'',	1,	1,	1, 1
			FROM 	"FC_CABECERA" ,	 "FC_FALLECIDO",  "FC_RESPONSABLE_RETIRO"
			WHERE 	"FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" AND
						"FC_CABECERA"."FOLIO_CREMATORIO" =  "FC_RESPONSABLE_RETIRO"."FOLIO_CREMATORIO" AND
						"FC_CABECERA"."FECHA_CINERACION" = :ldt_fecha  AND
						"FC_CABECERA"."COD_PARQUE_DESTINO" = :ll_cod_parque AND
						"FC_CABECERA"."BASE" <> 'U' AND
						"FC_CABECERA"."ESTADO_REG" <> 'A'
						
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1 into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f,:ls_uso_capilla,:ll_hora_uso_cap,:ll_min_uso_cap,:ll_sw_impacto, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des,:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica, :ll_sw_perfil_homenaje ;
					if not isnull(ls_nom_f) or not isnull(ls_sector_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						if ll_hora_f > 0 then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_f)+' and minuto='+string(ll_min_f)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								ls_ap_pat	= dw_lista.getitemstring(ll_reg,'ap_paterno')
								ls_ap_mat	= dw_lista.getitemstring(ll_reg,'ap_materno')
								
	//							if ls_tipo_f = 'FS' then
	//								SELECT 	 "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//    								INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//    								FROM 	"FICHA_SEPULTACION"  
	//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//											( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha )	;
	//							end if
								if ls_uso_capilla='S' then
									ll_largo	= len(ls_obs_f)
									if mid(ls_obs_f,(ll_largo - 1),1) = '.' then
										ls_obs_f	= ls_obs_f + '   HORA USO DE CAPILLA A LAS '+string(ll_hora_uso_cap,'00')+':'+string(ll_min_uso_cap,'00')+' HRS.'
									else
										ls_obs_f	= ls_obs_f + ', HORA USO DE CAPILLA A LAS '+string(ll_hora_uso_cap,'00')+':'+string(ll_min_uso_cap,'00')+' HRS.'
									end if
								end if
								if ll_sw_impacto=0 then
									ll_largo	= len(ls_obs_f)
									if mid(ls_obs_f,(ll_largo - 1),1) = '.' then
										ls_obs_f	= ls_obs_f+'   ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									else
										ls_obs_f	= ls_obs_f+', ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									end if
								end if
								if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) and (ls_nombre <> ls_nom_f or ls_ap_pat <> ls_pat_f or ls_ap_mat <> ls_mat_f) then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_f) //ll_nulo)
									dw_lista.setitem(ll_reg,'minuto',ll_min_f) //ll_nulo)
								end if							
								dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
								dw_lista.setitem(ll_reg,'sector',ls_sector_f)
								dw_lista.setitem(ll_reg,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
								dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_reg,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_reg,'veces',il_intervalo)
								dw_lista.setitem(ll_reg,'fecha_dia',ldt_fecha)
								dw_lista.setitem(ll_reg,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base_f)
								dw_lista.setitem(ll_reg,'serie',ls_serie_f)
								dw_lista.setitem(ll_reg,'numero',ll_numero_f)
								dw_lista.setitem(ll_reg,'tipo_uso',is_tipo)
								dw_lista.setitem(ll_reg,'base_des',ls_base_des)
								dw_lista.setitem(ll_reg,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_reg,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_reg,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_reg,'sepultura_des',ls_sepult_des)
								dw_lista.setitem(ll_reg,'sw_homenaje',ll_sw_perfil_homenaje)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
								end if	
							else
								ls_string_otro				= 'hora='+string(ll_hora_f)+ ' and minuto='+string(ll_min_f)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_f and ll_minuto_ins = ll_min_f then
											if ll_min_f <= ll_minuto_ins then
	//											if ls_tipo_f = 'FS' then
	//												SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//												INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//												FROM 	"FICHA_SEPULTACION"  
	//												WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//															( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//															( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//															( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//															( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha );
	//											end if
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
												dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha)
												dw_lista.setitem(ll_new_reg,'cod_parque',ll_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base_f)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
												dw_lista.setitem(ll_new_reg,'tipo_uso',is_tipo)
												dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
												dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
												dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
												dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
												dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
												dw_lista.setitem(ll_new_reg,'sw_homenaje',ll_sw_perfil_homenaje)
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
	//								if ls_tipo_f = 'FS' then
	//									SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//									INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//									FROM 	"FICHA_SEPULTACION"  
	//									WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//												( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//												( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//												( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//												( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha ) AND
	//												( "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = :ll_corr )	;
	//								end if
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
									dw_lista.setitem(ll_new_reg,'tipo_uso',is_tipo)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha)
									dw_lista.setitem(ll_new_reg,'cod_parque',ll_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base_f)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
									dw_lista.setitem(ll_new_reg,'sw_homenaje',ll_sw_perfil_homenaje)
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
					Setnull(ls_nom_f);	Setnull(ls_sector_f)
				LOOP
			end if
			close x1;
			
		elseif is_tipo='C' then 	//Columbario
			w_imprimir_lista_funerales.title	= 'Resumen de Columbario día '+string(ldt_fecha,'dd/mm/yyyy')
			dw_lista.object.t_titulo.text			= 'Resumen de Columbario día '+string(ldt_fecha,'dd/mm/yyyy')
			SELECT 	"COD_PARQ"."NOMBRE"  
			INTO 		:ls_parque  
			FROM		"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque
			USING	sqlca;
			ls_parque	= 'Parque '+ls_parque
			dw_lista.object.t_parque.text		= ls_parque
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
			WHERE 	"FICHA_HORAS"."COD_PARQUE" = :ll_cod_parque   ;
			ll_hora									= il_hora_ini
			ll_min									= il_min_ini
			for ll_indi=1 to 37
				ll_new								= dw_lista.insertrow(0)
				dw_lista.setitem(ll_new,'hora',ll_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min)
				dw_lista.setitem(ll_new,'modif_adm',ls_n)
				dw_lista.setitem(ll_new,'veces',il_intervalo)
				dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
				dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
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
			dw_lista.accepttext()
			ll_tot_reg			= dw_lista.rowcount()
			dw_lista.accepttext()

			DECLARE x1_col CURSOR FOR 
			SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA",	"FICHA_SEPULTACION"."SW_PERFIL_HOMENAJE"  
			FROM 	"FICHA_SEPULTACION"  
			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_SEPULTACION"."BASE" = 'U' AND
	//					"FICHA_SEPULTACION"."SW_REDUCCION" = 1 AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
	//		union
	//		SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//		FROM 	"FICHA_SEPULTACION"  
	//		WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha  AND
	//					"FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque AND
	//					"FICHA_SEPULTACION"."SW_PREGRABADO" = 0 AND
	//					"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."CODIGO_EJECUTIVO",	"FICHA_TRASLADO"."OBSERVACIONES_ORIGEN", 'FT',	"FICHA_TRASLADO"."MODIF_ADM",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",			'N',											0,														0,															1,														"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO",1,1,1, 1
			FROM 		"FICHA_TRASLADO"  
			WHERE 	"FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha  AND
						"FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque AND
						("FICHA_TRASLADO"."BASE_DESTINO" = 'U' ) AND
//						"FICHA_TRASLADO"."SW_REDUCCION" = 1 AND
						"FICHA_TRASLADO"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_REDUCCION"."HORA",	"FICHA_REDUCCION"."MINUTOS",	"FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"FICHA_REDUCCION"."AP_PATERNO_FALL",	"FICHA_REDUCCION"."AP_MATERNO_FALL",	"FICHA_REDUCCION"."SECTOR",	"FICHA_REDUCCION"."SEPULTURA",	"FICHA_REDUCCION"."COD_PARQUE",	"FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA", 'FR',	"FICHA_REDUCCION"."MODIF_ADM",	"FICHA_REDUCCION"."BASE",	"FICHA_REDUCCION"."SERIE",	"FICHA_REDUCCION"."NUMERO",	"FICHA_REDUCCION"."USAR_CAPILLA",	"FICHA_REDUCCION"."HORA_UTIL_CAPILLA",	"FICHA_REDUCCION"."MINUTO_UTIL_CAPILLA",	"FICHA_REDUCCION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'',	1,	1,	1, 1
			FROM 	"FICHA_REDUCCION"  
			WHERE 	"FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_REDUCCION"."BASE" = 'U' AND
						"FICHA_REDUCCION"."ESTADO_REG" <> 'A'
			union
			SELECT	"FICHA_TRANSITO"."HORA",	"FICHA_TRANSITO"."MINUTOS",	"FICHA_TRANSITO"."CORRELATIVO_INTERNO",	"FICHA_TRANSITO"."NOMBRE_FALLECIDO",	"FICHA_TRANSITO"."AP_PATERNO_FALL",	"FICHA_TRANSITO"."AP_MATERNO_FALL",	"FICHA_TRANSITO"."SECTOR",	"FICHA_TRANSITO"."SEPULTURA",	"FICHA_TRANSITO"."COD_PARQUE",	"FICHA_TRANSITO"."CODIGO_EJECUTIVO",	"FICHA_TRANSITO"."OBSERVACION_SEPULTURA_COMPLETA", 'CT',	"FICHA_TRANSITO"."MODIF_ADM",	"FICHA_TRANSITO"."BASE",	"FICHA_TRANSITO"."SERIE",	"FICHA_TRANSITO"."NUMERO",	"FICHA_TRANSITO"."USAR_CAPILLA",	"FICHA_TRANSITO"."HORA_UTIL_CAPILLA",	"FICHA_TRANSITO"."MINUTO_UTIL_CAPILLA",	"FICHA_TRANSITO"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'',	1,	1,	1, 1
			FROM 		"FICHA_TRANSITO"  
			WHERE 	"FICHA_TRANSITO"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_TRANSITO"."COD_PARQUE" = :ll_cod_parque AND
						"FICHA_TRANSITO"."BASE" = 'U' AND
						"FICHA_TRANSITO"."ESTADO_REG" <> 'A'
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x1_col;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x1_col into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f,:ls_uso_capilla,:ll_hora_uso_cap,:ll_min_uso_cap,:ll_sw_impacto, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des,:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica, :ll_sw_perfil_homenaje ;
					if not isnull(ls_nom_f) or not isnull(ls_sector_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						if ll_hora_f > 0 then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_f)+' and minuto='+string(ll_min_f)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								ls_ap_pat	= dw_lista.getitemstring(ll_reg,'ap_paterno')
								ls_ap_mat	= dw_lista.getitemstring(ll_reg,'ap_materno')
								
	//							if ls_tipo_f = 'FS' then
	//								SELECT 	 "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//    								INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//    								FROM 	"FICHA_SEPULTACION"  
	//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//											( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha )	;
	//							end if
								if ls_uso_capilla='S' then
									ll_largo	= len(ls_obs_f)
									if mid(ls_obs_f,(ll_largo - 1),1) = '.' then
										ls_obs_f	= ls_obs_f + '   HORA USO DE CAPILLA A LAS '+string(ll_hora_uso_cap,'00')+':'+string(ll_min_uso_cap,'00')+' HRS.'
									else
										ls_obs_f	= ls_obs_f + ', HORA USO DE CAPILLA A LAS '+string(ll_hora_uso_cap,'00')+':'+string(ll_min_uso_cap,'00')+' HRS.'
									end if
								end if
								if ll_sw_impacto=0 then
									ll_largo	= len(ls_obs_f)
									if mid(ls_obs_f,(ll_largo - 1),1) = '.' then
										ls_obs_f	= ls_obs_f+'   ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									else
										ls_obs_f	= ls_obs_f+', ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									end if
								end if
								if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) and (ls_nombre <> ls_nom_f or ls_ap_pat <> ls_pat_f or ls_ap_mat <> ls_mat_f) then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_f) //ll_nulo)
									dw_lista.setitem(ll_reg,'minuto',ll_min_f) //ll_nulo)
								end if							
								dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
								dw_lista.setitem(ll_reg,'sector',ls_sector_f)
								dw_lista.setitem(ll_reg,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
								dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_reg,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_reg,'veces',il_intervalo)
								dw_lista.setitem(ll_reg,'fecha_dia',ldt_fecha)
								dw_lista.setitem(ll_reg,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base_f)
								dw_lista.setitem(ll_reg,'serie',ls_serie_f)
								dw_lista.setitem(ll_reg,'numero',ll_numero_f)
								dw_lista.setitem(ll_reg,'tipo_uso',is_tipo)
								dw_lista.setitem(ll_reg,'base_des',ls_base_des)
								dw_lista.setitem(ll_reg,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_reg,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_reg,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_reg,'sepultura_des',ls_sepult_des)
								dw_lista.setitem(ll_reg,'sw_homenaje',ll_sw_perfil_homenaje)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
								end if	
							else
								ls_string_otro				= 'hora='+string(ll_hora_f)+ ' and minuto='+string(ll_min_f)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_f and ll_minuto_ins = ll_min_f then
											if ll_min_f <= ll_minuto_ins then
	//											if ls_tipo_f = 'FS' then
	//												SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//												INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//												FROM 	"FICHA_SEPULTACION"  
	//												WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//															( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//															( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//															( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//															( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha );
	//											end if
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
												dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha)
												dw_lista.setitem(ll_new_reg,'cod_parque',ll_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base_f)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
												dw_lista.setitem(ll_new_reg,'tipo_uso',is_tipo)
												dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
												dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
												dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
												dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
												dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
												dw_lista.setitem(ll_new_reg,'sw_homenaje',ll_sw_perfil_homenaje)
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
	//								if ls_tipo_f = 'FS' then
	//									SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//									INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//									FROM 	"FICHA_SEPULTACION"  
	//									WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//												( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//												( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//												( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//												( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha ) AND
	//												( "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = :ll_corr )	;
	//								end if
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
									dw_lista.setitem(ll_new_reg,'tipo_uso',is_tipo)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha)
									dw_lista.setitem(ll_new_reg,'cod_parque',ll_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base_f)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
									dw_lista.setitem(ll_new_reg,'sw_homenaje',ll_sw_perfil_homenaje)
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
					Setnull(ls_nom_f);	Setnull(ls_sector_f)
				LOOP
			end if
			close x1_col;
			
			
		elseif is_tipo='T' then		//Templo
			w_imprimir_lista_funerales.title	= 'Resumen de Uso Templo día '+string(ldt_fecha,'dd/mm/yyyy')
			dw_lista.object.t_titulo.text			= 'Resumen de Uso Templo día '+string(ldt_fecha,'dd/mm/yyyy')
			
			SELECT 	"FICHA_SALA_TEMPLO"."DESCRIPCION"  
			INTO 		:ls_parque  
			FROM 	"FICHA_SALA_TEMPLO"  
			WHERE 	"FICHA_SALA_TEMPLO"."NRO_SALA" = :ll_cod_parque 
			USING	sqlca;
//			ls_parque	= ls_parque
			dw_lista.object.t_parque.text		= ls_parque
			ll_cod_parque_tv						= 1
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
			WHERE 	"FICHA_HORAS_TEMPLO"."COD_PARQUE" = :ll_cod_parque_tv   ;
			ll_hora								= il_hora_ini_templo
			ll_min									= il_min_ini_templo
			for ll_indi=1 to 37
				ll_new							= dw_lista.insertrow(0)
				dw_lista.setitem(ll_new,'hora',ll_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min)
				dw_lista.setitem(ll_new,'modif_adm',ls_n)
				dw_lista.setitem(ll_new,'veces',il_intervalo_templo)
				dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
				dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
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
			dw_lista.accepttext()
			ll_tot_reg			= dw_lista.rowcount()
			dw_lista.accepttext()
			DECLARE x2 CURSOR FOR 
//			SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"
			SELECT	"FICHA_SEPULTACION"."HORA_UTIL_TEMPLO",	"FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA",		"FICHA_SEPULTACION"."SW_PERFIL_HOMENAJE"
			FROM 	"FICHA_SEPULTACION"  
			WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha  AND
						"FICHA_SEPULTACION"."SALA_TEMPLO" = :ll_cod_parque AND
	//					"FICHA_SEPULTACION"."SW_REDUCCION" = 1 AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
	//		union
	//		SELECT	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'', "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//		FROM 	"FICHA_SEPULTACION"  
	//		WHERE 	"FICHA_SEPULTACION"."FECHA_SEPULTACION" = :ldt_fecha  AND
	//					"FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque AND
	//					"FICHA_SEPULTACION"."SW_PREGRABADO" = 0 AND
	//					"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
//			union
//			SELECT	"FICHA_TRASLADO"."HORA_FIJADA",	"FICHA_TRASLADO"."MINUTO_FIJADA",	"FICHA_TRASLADO"."FOLIO",	"FICHA_TRASLADO"."NOMBRE_FALLECIDO",	"FICHA_TRASLADO"."APELLIDO_PATERNO_FALL",	"FICHA_TRASLADO"."APELLIDO_MATERNO_FALL",	"FICHA_TRASLADO"."SECTOR_ORIGEN",	"FICHA_TRASLADO"."SEPULTURA_ORIGEN",	"FICHA_TRASLADO"."COD_PARQUE",	"FICHA_TRASLADO"."CODIGO_EJECUTIVO",	"FICHA_TRASLADO"."OBSERVACIONES_ORIGEN", 'FT',	"FICHA_TRASLADO"."MODIF_ADM",	"FICHA_TRASLADO"."BASE_ORIGEN",	"FICHA_TRASLADO"."SERIE_ORIGEN",	"FICHA_TRASLADO"."NUMERO_ORIGEN",			'N',											0,														0,															1,														"FICHA_TRASLADO"."SECTOR_DESTINO",	"FICHA_TRASLADO"."SEPULTURA_DESTINO",	"FICHA_TRASLADO"."BASE_DESTINO",	"FICHA_TRASLADO"."SERIE_DESTINO",	"FICHA_TRASLADO"."NUMERO_DESTINO",	"FICHA_TRASLADO"."NIVEL_SEPULTURA_DESTINO",1,1,1
//			FROM 		"FICHA_TRASLADO"  
//			WHERE 	"FICHA_TRASLADO"."FECHA_TRASLADO" = :ldt_fecha  AND
//						"FICHA_TRASLADO"."COD_PARQUE" = :ll_cod_parque AND
//						"FICHA_TRASLADO"."SW_REDUCCION" = 1 AND
//						"FICHA_TRASLADO"."ESTADO_REG" <> 'A'
//			union
//			SELECT	"FICHA_REDUCCION"."HORA",	"FICHA_REDUCCION"."MINUTOS",	"FICHA_REDUCCION"."CORRELATIVO_INTERNO",	"FICHA_REDUCCION"."NOMBRE_FALLECIDO",	"FICHA_REDUCCION"."AP_PATERNO_FALL",	"FICHA_REDUCCION"."AP_MATERNO_FALL",	"FICHA_REDUCCION"."SECTOR",	"FICHA_REDUCCION"."SEPULTURA",	"FICHA_REDUCCION"."COD_PARQUE",	"FICHA_REDUCCION"."CODIGO_EJECUTIVO",	"FICHA_REDUCCION"."OBSERVACION_SEPULTURA_COMPLETA", 'FR',	"FICHA_REDUCCION"."MODIF_ADM",	"FICHA_REDUCCION"."BASE",	"FICHA_REDUCCION"."SERIE",	"FICHA_REDUCCION"."NUMERO",	"FICHA_REDUCCION"."USAR_CAPILLA",	"FICHA_REDUCCION"."HORA_UTIL_CAPILLA",	"FICHA_REDUCCION"."MINUTO_UTIL_CAPILLA",	"FICHA_REDUCCION"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'',	1,	1,	1
//			FROM 	"FICHA_REDUCCION"  
//			WHERE 	"FICHA_REDUCCION"."FECHA_SEPULTACION" = :ldt_fecha  AND
//						"FICHA_REDUCCION"."COD_PARQUE" = :ll_cod_parque AND
//						"FICHA_REDUCCION"."ESTADO_REG" <> 'A'
//			union
//			SELECT	"FICHA_TRANSITO"."HORA",	"FICHA_TRANSITO"."MINUTOS",	"FICHA_TRANSITO"."CORRELATIVO_INTERNO",	"FICHA_TRANSITO"."NOMBRE_FALLECIDO",	"FICHA_TRANSITO"."AP_PATERNO_FALL",	"FICHA_TRANSITO"."AP_MATERNO_FALL",	"FICHA_TRANSITO"."SECTOR",	"FICHA_TRANSITO"."SEPULTURA",	"FICHA_TRANSITO"."COD_PARQUE",	"FICHA_TRANSITO"."CODIGO_EJECUTIVO",	"FICHA_TRANSITO"."OBSERVACION_SEPULTURA_COMPLETA", 'CT',	"FICHA_TRANSITO"."MODIF_ADM",	"FICHA_TRANSITO"."BASE",	"FICHA_TRANSITO"."SERIE",	"FICHA_TRANSITO"."NUMERO",	"FICHA_TRANSITO"."USAR_CAPILLA",	"FICHA_TRANSITO"."HORA_UTIL_CAPILLA",	"FICHA_TRANSITO"."MINUTO_UTIL_CAPILLA",	"FICHA_TRANSITO"."SW_ALTO_IMPACTO",		'',											'',												'',										'',											0,												'',	1,	1,	1
//			FROM 		"FICHA_TRANSITO"  
//			WHERE 	"FICHA_TRANSITO"."FECHA_SEPULTACION" = :ldt_fecha  AND
//						"FICHA_TRANSITO"."COD_PARQUE" = :ll_cod_parque AND
//						"FICHA_TRANSITO"."ESTADO_REG" <> 'A'
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x2;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x2 into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f,:ls_uso_capilla,:ll_hora_uso_cap,:ll_min_uso_cap,:ll_sw_impacto, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des,:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica, :ll_sw_perfil_homenaje ;
					if not isnull(ls_nom_f) or not isnull(ls_sector_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						if ll_hora_f > 0 then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_f)+' and minuto='+string(ll_min_f)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								ls_ap_pat	= dw_lista.getitemstring(ll_reg,'ap_paterno')
								ls_ap_mat	= dw_lista.getitemstring(ll_reg,'ap_materno')
								
	//							if ls_tipo_f = 'FS' then
	//								SELECT 	 "FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//    								INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//    								FROM 	"FICHA_SEPULTACION"  
	//   								WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//         								  	( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//											( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//											( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//											( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha )	;
	//							end if
								if ls_uso_capilla='S' then
									ll_largo	= len(ls_obs_f)
									if mid(ls_obs_f,(ll_largo - 1),1) = '.' then
										ls_obs_f	= ls_obs_f + '   HORA USO DE CAPILLA HASTA LAS '+string(ll_hora_uso_cap,'00')+':'+string(ll_min_uso_cap,'00')+' HRS.'
									else
										ls_obs_f	= ls_obs_f + ', HORA USO DE CAPILLA HASTA LAS '+string(ll_hora_uso_cap,'00')+':'+string(ll_min_uso_cap,'00')+' HRS.'
									end if
								end if
								if ll_sw_impacto=0 then
									ll_largo	= len(ls_obs_f)
									if mid(ls_obs_f,(ll_largo - 1),1) = '.' then
										ls_obs_f	= ls_obs_f+'   ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									else
										ls_obs_f	= ls_obs_f+', ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									end if
								end if
								if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) and (ls_nombre <> ls_nom_f or ls_ap_pat <> ls_pat_f or ls_ap_mat <> ls_mat_f) then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_f) //ll_nulo)
									dw_lista.setitem(ll_reg,'minuto',ll_min_f) //ll_nulo)
								end if							
								dw_lista.setitem(ll_reg,'nombre',ls_nom_f)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_f)
								dw_lista.setitem(ll_reg,'sector',ls_sector_f)
								dw_lista.setitem(ll_reg,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_f)
								dw_lista.setitem(ll_reg,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_reg,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_reg,'veces',il_intervalo_templo)
								dw_lista.setitem(ll_reg,'fecha_dia',ldt_fecha)
								dw_lista.setitem(ll_reg,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base_f)
								dw_lista.setitem(ll_reg,'serie',ls_serie_f)
								dw_lista.setitem(ll_reg,'numero',ll_numero_f)
								dw_lista.setitem(ll_reg,'tipo_uso',is_tipo)
								dw_lista.setitem(ll_reg,'base_des',ls_base_des)
								dw_lista.setitem(ll_reg,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_reg,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_reg,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_reg,'sepultura_des',ls_sepult_des)
								dw_lista.setitem(ll_reg,'sw_homenaje',ll_sw_perfil_homenaje)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_reg,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_reg,'sw_covid',ll_covid_19)
								end if	
							else
								ls_string_otro				= 'hora='+string(ll_hora_f)+ ' and minuto='+string(ll_min_f)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_f and ll_minuto_ins = ll_min_f then
											if ll_min_f <= ll_minuto_ins then
	//											if ls_tipo_f = 'FS' then
	//												SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//												INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//												FROM 	"FICHA_SEPULTACION"  
	//												WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//															( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//															( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//															( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//															( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha );
	//											end if
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
												dw_lista.setitem(ll_new_reg,'veces',il_intervalo_templo)
												dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha)
												dw_lista.setitem(ll_new_reg,'cod_parque',ll_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base_f)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
												dw_lista.setitem(ll_new_reg,'tipo_uso',is_tipo)
												dw_lista.setitem(ll_new_reg,'base_des',ls_base_des)
												dw_lista.setitem(ll_new_reg,'serie_des',ls_serie_des)
												dw_lista.setitem(ll_new_reg,'numero_des',ll_numero_des)
												dw_lista.setitem(ll_new_reg,'sector_des',ls_sector_des)
												dw_lista.setitem(ll_new_reg,'sepultura_des',ls_sepult_des)
												dw_lista.setitem(ll_new_reg,'sw_homenaje',ll_sw_perfil_homenaje)
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
									if ll_hora_f < il_hora_ini_templo then
										ll_new_reg	= dw_lista.insertrow(1)
									elseif ll_hora_f > il_hora_fin_templo then
										ll_new_reg	= dw_lista.insertrow(0)
									end if
	//								if ls_tipo_f = 'FS' then
	//									SELECT 	"FICHA_SEPULTACION"."SW_COVID_19",  "FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", "FICHA_SEPULTACION"."SW_TIPO_FICHA"  
	//									INTO 		:ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica  
	//									FROM 	"FICHA_SEPULTACION"  
	//									WHERE 	( "FICHA_SEPULTACION"."BASE" = :ls_base_f ) AND  
	//												( "FICHA_SEPULTACION"."SERIE" = :ls_serie_f ) AND  
	//												( "FICHA_SEPULTACION"."NUMERO" = :ll_numero_f ) AND
	//												( "FICHA_SEPULTACION"."COD_PARQUE" = :ll_cod_parque ) AND
	//												( "FICHA_SEPULTACION"."FECHA_SEPULTACION" =:ldt_fecha ) AND
	//												( "FICHA_SEPULTACION"."CORRELATIVO_INTERNO" = :ll_corr )	;
	//								end if
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
									dw_lista.setitem(ll_new_reg,'tipo_uso',is_tipo)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo_templo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha)
									dw_lista.setitem(ll_new_reg,'cod_parque',ll_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base_f)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie_f)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero_f)
									dw_lista.setitem(ll_new_reg,'sw_homenaje',ll_sw_perfil_homenaje)
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
					Setnull(ls_nom_f);	Setnull(ls_sector_f)
				LOOP
			end if
			close x2;
			
		elseif is_tipo='V' then		//Velatorio
			w_imprimir_lista_funerales.title	= 'Resumen de Velatorio día '+string(ldt_fecha,'dd/mm/yyyy')
			dw_lista.object.t_titulo.text			= 'Resumen de Velatorio día '+string(ldt_fecha,'dd/mm/yyyy')
			SELECT 	"FICHA_SALA_VELATORIO"."DESCRIPCION"  
			INTO 		:ls_parque  
			FROM 	"FICHA_SALA_VELATORIO"  
			WHERE 	"FICHA_SALA_VELATORIO"."NRO_SALA" = :ll_cod_parque 
			USING	sqlca;
			dw_lista.object.t_parque.text		= ls_parque
			
			dw_lista.object.t_parque.text		= ls_parque
			ll_cod_parque_tv						= 1
			SELECT	"FICHA_HORAS_VELATORIO"."HORA_INICIO",   
						"FICHA_HORAS_VELATORIO"."MINUTO_INICIO",   
						"FICHA_HORAS_VELATORIO"."HORA_FINAL",   
						"FICHA_HORAS_VELATORIO"."MINUTO_FINAL",   
						"FICHA_HORAS_VELATORIO"."INTERVALO_MINUTO",   
						"FICHA_HORAS_VELATORIO"."VECES_USO"  
			INTO		:il_hora_ini,   
						:il_min_ini,   
						:il_hora_fin,   
						:il_min_fin,   
						:il_intervalo,   
						:il_veces  
			FROM 	"FICHA_HORAS_VELATORIO"  
			WHERE 	"FICHA_HORAS_VELATORIO"."COD_PARQUE" = :ll_cod_parque_tv   ;
			ll_hora									= il_hora_ini
			ll_min										= il_min_ini
			for ll_indi=1 to 37
				ll_new								= dw_lista.insertrow(0)
				dw_lista.setitem(ll_new,'hora',ll_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min)
				dw_lista.setitem(ll_new,'modif_adm',ls_n)
				dw_lista.setitem(ll_new,'veces',il_intervalo)
				dw_lista.setitem(ll_new,'fecha_dia',ldt_fecha)
				dw_lista.setitem(ll_new,'cod_parque',ll_cod_parque)
				dw_lista.setitem(ll_new,'tipo_uso',is_tipo)
				ll_min									= ll_min + il_intervalo
				if ll_min > 45 then
					ll_hora							= ll_hora + 1
					ll_min								= 0
				end if
				if ll_hora>il_hora_fin then
					exit
				end if
			next
			dw_lista.accepttext()
			ll_tot_reg								= dw_lista.rowcount()
			dw_lista.accepttext()
			DECLARE x3 CURSOR FOR 
			SELECT	"FICHA_SEPULTACION"."HORA_UTIL_TEMPLO",	"FICHA_SEPULTACION"."MINUTO_UTIL_TEMPLO",	"FICHA_SEPULTACION"."CORRELATIVO_INTERNO",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",	"FICHA_SEPULTACION"."SECTOR",	"FICHA_SEPULTACION"."SEPULTURA",	"FICHA_SEPULTACION"."COD_PARQUE",	"FICHA_SEPULTACION"."CODIGO_EJECUTIVO",	"FICHA_SEPULTACION"."OBSERVACION_SEPULTURA_COMPLETA", 'FS',	"FICHA_SEPULTACION"."MODIF_ADM",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",		'',											'',												'',										'',											0,												'',	"FICHA_SEPULTACION"."SW_COVID_19",  	"FICHA_SEPULTACION"."SW_PROTOCOLO_COVID", 	"FICHA_SEPULTACION"."SW_TIPO_FICHA",	"FICHA_SEPULTACION"."FECHA_INI_VELATORIO", 	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA",	"FICHA_SEPULTACION"."USAR_CAPILLA",	"FICHA_SEPULTACION"."FECHA_FIN_VELATORIO",	"FICHA_SEPULTACION"."HORA_UTIL_CAPILLA_FIN",	"FICHA_SEPULTACION"."MINUTO_UTIL_CAPILLA_FIN"  ,	"FICHA_SEPULTACION"."SW_ALTO_IMPACTO",	"FICHA_SEPULTACION"."SW_PERFIL_HOMENAJE"
			FROM 	"FICHA_SEPULTACION"  
			WHERE ( "FICHA_SEPULTACION"."FECHA_INI_VELATORIO" = :ldt_fecha  OR
						"FICHA_SEPULTACION"."FECHA_FIN_VELATORIO" = :ldt_fecha ) AND
						"FICHA_SEPULTACION"."SALA_VELATORIO" = :ll_cod_parque AND
						"FICHA_SEPULTACION"."USAR_CAPILLA" = 'S' AND
						"FICHA_SEPULTACION"."ESTADO_REG" <> 'A'
			ORDER BY 1 ASC,   
						2 ASC,
						3 ASC
			USING		sqlca;
			open x3;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
					fetch x3 into :ll_hora_f,:ll_min_f,:ll_corr,:ls_nom_f,:ls_pat_f,:ls_mat_f,:ls_sector_f,:ls_sepult_f,:ll_parque_f,:ls_ejecu_f,:ls_obs_f,:ls_tipo_f,:ls_modif_adm_f,:ls_base_f,:ls_serie_f,:ll_numero_f, :ls_sector_des, :ls_sepult_des, :ls_base_des, :ls_serie_des, :ll_numero_des, :ls_nivel_des, :ll_covid_19, :ll_protocolo_covid, :ll_ficha_telefonica,:ldt_fecha_inivela, :ll_hora_inivela, :ll_minuto_inivela, :ls_usar_vela, :ldt_fecha_finvela, :ll_hora_finvela, :ll_minuto_finvela, :ll_sw_impacto, :ll_sw_perfil_homenaje  ;
					if not isnull(ls_nom_f) or not isnull(ls_sector_f) then
						if isnull(ls_modif_adm_f) or ls_modif_adm_f='' then 
							ls_modif_adm_f	= 'N'
						end if
						ll_tot_reg			= dw_lista.rowcount()
						for ll_indi=1 to ll_tot_reg
							ll_hora_horario		= dw_lista.getitemnumber(ll_indi,'hora')
							ll_minuto_horario	=  dw_lista.getitemnumber(ll_indi,'minuto')
							if (ldt_fecha_inivela = ldt_fecha and ll_hora_horario >= ll_hora_inivela ) or &
								(ldt_fecha_finvela = ldt_fecha and ll_hora_horario < ll_hora_finvela ) or &
								( ldt_fecha_finvela = ldt_fecha and ll_hora_horario = ll_hora_finvela and ll_minuto_horario <= ll_minuto_finvela ) then
								dw_lista.setitem(ll_indi,'fecha_ini_vela',ldt_fecha_inivela)
								dw_lista.setitem(ll_indi,'hora_ini_vela',ll_hora_inivela)
								dw_lista.setitem(ll_indi,'minuto_ini_vela',ll_minuto_inivela)
								dw_lista.setitem(ll_indi,'fecha_fin_vela',ldt_fecha_finvela)
								dw_lista.setitem(ll_indi,'hora_fin_vela',ll_hora_finvela)
								dw_lista.setitem(ll_indi,'minuto_fin_vela',ll_minuto_finvela)
//								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
//								ls_ap_pat	= dw_lista.getitemstring(ll_reg,'ap_paterno')
//								ls_ap_mat	= dw_lista.getitemstring(ll_reg,'ap_materno')
								
								if ls_uso_capilla='S' then
									ll_largo	= len(ls_obs_f)
									if ll_largo > 0 then
										if mid(ls_obs_f,(ll_largo - 1),1) = '.' and ll_indi=1 then
											ls_obs_f	= ls_obs_f + '   HORA USO DE CAPILLA A LAS '+string(ll_hora_inivela,'00')+':'+string(ll_minuto_inivela,'00')+' HRS.'
										elseif ll_indi=1 then
											ls_obs_f	= ls_obs_f + ', HORA USO DE CAPILLA A LAS '+string(ll_hora_inivela,'00')+':'+string(ll_minuto_inivela,'00')+' HRS.'
										end if
									else
										ls_obs_f	= 'HORA USO DE CAPILLA A LAS '+string(ll_hora_inivela,'00')+':'+string(ll_minuto_inivela,'00')+' HRS.'
									end if
								end if
								if ll_sw_impacto=0 then
									ll_largo	= len(ls_obs_f)
									if ll_largo > 0 then
										if mid(ls_obs_f,(ll_largo - 1),1) = '.' and ll_indi=1 then
											ls_obs_f	= ls_obs_f+'   ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
										elseif ll_indi=1 then
											ls_obs_f	= ls_obs_f+', ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
										end if
									else
										ls_obs_f		= 'ADEMAS ES DE ALTA CONCURRENCIA (IMPACTO NOTICIOSO)'
									end if
								end if

								dw_lista.setitem(ll_indi,'nombre',ls_nom_f)
								dw_lista.setitem(ll_indi,'ap_paterno',ls_pat_f)
								dw_lista.setitem(ll_indi,'ap_materno',ls_mat_f)
								dw_lista.setitem(ll_indi,'sector',ls_sector_f)
								dw_lista.setitem(ll_indi,'sepultura',ls_sepult_f)
								dw_lista.setitem(ll_indi,'ejecutivo',ls_ejecu_f)
								dw_lista.setitem(ll_indi,'observacion',ls_obs_f)
								dw_lista.setitem(ll_indi,'tipo_ficha',ls_tipo_f)
								dw_lista.setitem(ll_indi,'modif_adm',ls_modif_adm_f)
								dw_lista.setitem(ll_indi,'veces',il_intervalo)
								dw_lista.setitem(ll_indi,'fecha_dia',ldt_fecha_inivela) //ldt_fecha)
								dw_lista.setitem(ll_indi,'cod_parque',ll_cod_parque)
								dw_lista.setitem(ll_indi,'base',ls_base_f)
								dw_lista.setitem(ll_indi,'serie',ls_serie_f)
								dw_lista.setitem(ll_indi,'numero',ll_numero_f)
								dw_lista.setitem(ll_indi,'tipo_uso',is_tipo)
								dw_lista.setitem(ll_indi,'base_des',ls_base_des)
								dw_lista.setitem(ll_indi,'serie_des',ls_serie_des)
								dw_lista.setitem(ll_indi,'numero_des',ll_numero_des)
								dw_lista.setitem(ll_indi,'sector_des',ls_sector_des)
								dw_lista.setitem(ll_indi,'sepultura_des',ls_sepult_des)
								dw_lista.setitem(ll_indi,'sw_homenaje',ll_sw_perfil_homenaje)
								if ls_tipo_f = 'FS' then
									dw_lista.setitem(ll_indi,'sw_ficha_telefonica',ll_ficha_telefonica)
									dw_lista.setitem(ll_indi,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_indi,'sw_covid',ll_covid_19)
								end if
							end if
							
						next
						ll_tot_reg				= dw_lista.rowcount()
					end if
					Setnull(ls_nom_f);	Setnull(ls_sector_f)
				LOOP
			end if
			close x3;
		end if
		dw_lista.accepttext()
		dw_lista.GROUPCALC() 
		dw_lista.setredraw(true)
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type st_16 from statictext within w_imprimir_lista_funerales
integer x = 983
integer y = 52
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_imprimir_lista_funerales
integer x = 1216
integer y = 44
integer width = 594
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 then pb_ok.triggerevent(clicked!)
end event

type cb_exportar from commandbutton within w_imprimir_lista_funerales
integer x = 521
integer y = 2012
integer width = 302
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 and dw_lista.getitemnumber(1,'c_sumar')>0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_imprimir_lista_funerales
integer x = 64
integer y = 2012
integer width = 297
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 and dw_lista.getitemnumber(1,'c_sumar')>0 then 
	dw_lista.object.datawindow.print.preview	= true
	dw_lista.object.datawindow.zoom				= 80
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom				= 100
	dw_lista.object.datawindow.print.preview	= false
end if

end event

type cb_cerrar from commandbutton within w_imprimir_lista_funerales
integer x = 3214
integer y = 2004
integer width = 352
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprimir_lista_funerales)
end event

type dw_lista from datawindow within w_imprimir_lista_funerales
integer x = 41
integer y = 176
integer width = 3525
integer height = 1792
integer taborder = 40
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

type gb_1 from groupbox within w_imprimir_lista_funerales
integer x = 37
integer y = 1964
integer width = 814
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

