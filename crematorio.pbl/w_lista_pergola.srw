forward
global type w_lista_pergola from window
end type
type cb_inactivar from commandbutton within w_lista_pergola
end type
type st_16 from statictext within w_lista_pergola
end type
type dw_parque from datawindow within w_lista_pergola
end type
type st_1 from statictext within w_lista_pergola
end type
type pb_ok from picturebutton within w_lista_pergola
end type
type dp_fecha from datepicker within w_lista_pergola
end type
type cb_exportar from commandbutton within w_lista_pergola
end type
type cb_imprimir from commandbutton within w_lista_pergola
end type
type cb_agregar from commandbutton within w_lista_pergola
end type
type cb_cerrar from commandbutton within w_lista_pergola
end type
type dw_lista from datawindow within w_lista_pergola
end type
type gb_1 from groupbox within w_lista_pergola
end type
end forward

global type w_lista_pergola from window
integer width = 3630
integer height = 2360
boolean titlebar = true
string title = "Calendario Crematorio"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_inactivar cb_inactivar
st_16 st_16
dw_parque dw_parque
st_1 st_1
pb_ok pb_ok
dp_fecha dp_fecha
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_agregar cb_agregar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_pergola w_lista_pergola

type variables
Long		il_cod_parque,il_row,il_hora_ini,il_min_ini,il_hora_fin,il_min_fin,il_intervalo,il_veces,il_hora_ini_templo,il_min_ini_templo,il_hora_fin_templo,&
			il_min_fin_templo,il_intervalo_templo,il_veces_templo,il_hora,il_min,il_folio,il_grabar=0
String		is_nombre,is_ap_pat,is_ap_mat,is_ejecutivo,is_obs,is_tipo,is_uso_visualiza,is_uso_capilla,is_uso_pergola
datetime	idt_fecha_cremacion
end variables

on w_lista_pergola.create
this.cb_inactivar=create cb_inactivar
this.st_16=create st_16
this.dw_parque=create dw_parque
this.st_1=create st_1
this.pb_ok=create pb_ok
this.dp_fecha=create dp_fecha
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_agregar=create cb_agregar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_inactivar,&
this.st_16,&
this.dw_parque,&
this.st_1,&
this.pb_ok,&
this.dp_fecha,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_agregar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_pergola.destroy
destroy(this.cb_inactivar)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.st_1)
destroy(this.pb_ok)
destroy(this.dp_fecha)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_agregar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_nulo,ll_hora_cineracion,ll_minuto_cineracion,ll_parque,ll_hora,ll_min,ll_indi,ll_new,ll_tot_reg,ll_duracion_crematorio
String		ls_fecha,ls_parque

connect using Trans_1;
il_grabar									= 0
gf_centrar(w_lista_pergola)
Setnull(ll_nulo)
il_cod_parque							= long(substr(1,1,Message.StringParm))
ls_fecha									= mid(substr(1,2,Message.StringParm),1,10)
idt_fecha_cremacion					= datetime(date(ls_fecha))
is_nombre								= substr(1,3,Message.StringParm)
is_ap_pat								= substr(1,4,Message.StringParm)
is_ap_mat								= substr(1,5,Message.StringParm)
is_obs									= substr(1,6,Message.StringParm)
il_hora									= long(substr(1,7,Message.StringParm))
il_min										= long(substr(1,8,Message.StringParm))
il_folio									= long(substr(1,9,Message.StringParm))
is_tipo									= substr(1,10,Message.StringParm)
is_uso_visualiza						= substr(1,11,Message.StringParm)
is_uso_capilla							= substr(1,12,Message.StringParm)
is_uso_pergola							= substr(1,13,Message.StringParm)
ll_hora_cineracion						= il_hora
ll_minuto_cineracion					= il_min
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dp_fecha.value							= idt_fecha_cremacion
if il_cod_parque = 142 then
	ll_parque								= il_cod_parque
else
	ll_parque								= 142
end if
if il_folio>0 then
	cb_agregar.visible					= true
	cb_agregar.text					= 'Grabar'
else
	cb_agregar.visible					= false
	cb_agregar.text					= 'Aceptar'
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
if il_cod_parque>0 then
	if is_tipo = 'C' then	// Resumen Pergola
		pb_ok.triggerevent(clicked!)
	end if
	gs_ventana	= 'w_lista_pergola'
	f_valida_objeto2()
else
	messagebox("Advertencia","Debe Seleccionar Parque")
end if
end event

event close;Long		ll_res

if il_grabar=0 and il_folio > 0 then 
	ll_res		= messagebox("Advertencia","Recuerde Actualizar Agenda antes de Salir, desea Grabar",Exclamation!,YesNo!,2)
	if ll_res=1 then cb_agregar.triggerevent(clicked!)
end if
Disconnect using Trans_1;
end event

type cb_inactivar from commandbutton within w_lista_pergola
integer x = 681
integer y = 2136
integer width = 302
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inactivar"
end type

event clicked;datetime		ldt_fec_ini
Long			ll_fila,ll_res
String			ls_ag_externa,ls_nom,ls_pat,ls_mat,ls_dv_falle
Double		ll_rut_falle

ldt_fec_ini			= datetime(date(dp_fecha.text),time('00:00:00'))
ll_fila					= dw_lista.getrow()
if ll_fila > 0 then
	ls_ag_externa	= dw_lista.getitemstring(ll_fila,'agenda_externa')
	ls_nom			= dw_lista.getitemstring(ll_fila,'nombre')
	ls_pat				= dw_lista.getitemstring(ll_fila,'ap_paterno')
	ls_mat			= dw_lista.getitemstring(ll_fila,'ap_materno')
	ll_rut_falle		= dw_lista.getitemnumber(ll_fila,'rut_fallecido')
	ls_dv_falle		= dw_lista.getitemstring(ll_fila,'dv_fallecido')
	if ls_ag_externa='S' then
		ll_res			= messagebox("Inactivar","Esta Seguro Inactivar Fallecido Rut "+string(ll_rut_falle,'###,###,###,###')+' Nombre '+ls_nom+' '+ls_pat+' '+ls_mat,Exclamation!,YesNo!,2)
		if ll_res=1 then
			UPDATE 	"FC_AGENDA_PERGOLA"  
			SET 		"ESTADO_REG" = 'I',   
						"FECHA_INACTIVA" = :gdt_fec_sistema,   
						"USUARIO_INACTIVA" = :gs_user  
			WHERE ( "FC_AGENDA_PERGOLA"."RUT_FALLECIDO" = :ll_rut_falle ) AND  
					  ( "FC_AGENDA_PERGOLA"."ESTADO_REG" = 'P' )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				pb_ok.triggerevent(clicked!)
				messagebox("Inactivar","Inactivación Exitosa")
			else
				rollback;
				messagebox("Error Inactivar","Error Inactivación SQL: "+sqlca.sqlerrtext)
			end if

		end if
	else
		messagebox("Advertencia","No Es posible Inactivar Agenda, debe hacer cambios en Ficha")
	end if
end if
end event

type st_16 from statictext within w_lista_pergola
integer x = 686
integer y = 52
integer width = 210
integer height = 72
integer textsize = -9
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

type dw_parque from datawindow within w_lista_pergola
integer x = 905
integer y = 36
integer width = 791
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_crematorio"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

type st_1 from statictext within w_lista_pergola
integer x = 32
integer y = 52
integer width = 187
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_lista_pergola
integer x = 1760
integer y = 16
integer width = 155
integer height = 128
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Long		ll_nulo,ll_hora,ll_min,ll_indi,ll_new,ll_tot_reg,ll_sw_orador,ll_cod_religion,ll_cod_diacono,ll_hora_cineracion,ll_minuto_cineracion,ll_estado_gestion,ll_sw_covid19,&
			ll_protocolo_covid,ll_reg,ll_reg_otro,ll_hora_ins,ll_minuto_ins,ll_new_reg,ll_duracion_crematorio,ll_fin,ll_fila,ll_hora_ing_cinera,ll_min_ing_cinera,ll_folio_c,&
			ll_hora_c,ll_min_c,ll_estado_gestion_c,ll_cod_parque_c,ll_religion_c,ll_sw_orado_c, ll_sw_covid_c, ll_hora_fin_c,ll_min_fin_c,ll_hora_ini_pergola_c,&
			ll_min_ini_pergola_c,ll_hora_fin_pergola_c,ll_min_fin_pergola_c,ll_hora_ini_capilla_c,ll_min_ini_capilla_c,ll_hora_fin_capilla_c,ll_min_fin_capilla_c,&
			ll_hora_ini_visual_c,ll_min_ini_visual_c,ll_hora_fin_visual_c,ll_min_fin_visual_c,ll_indi_c,ll_parque
String		ls_fecha,ls_parque,ls_base,ls_serie,ls_dv_titular,ls_nom_titular,ls_pat_titular,ls_mat_titular,ls_email,ls_celular,ls_obs_ceremonia,ls_cod_maestro,ls_dv_fall,&
			ls_nombre_fall,ls_pat_fall,ls_mat_fall,ls_string,ls_usuario_crea,ls_nombre,ls_string_otro,ls_nom_fall_c,ls_pat_fall_c,ls_mat_fall_c,ls_ejecutivo_c,ls_obs_c,&
			ls_sw_protocolo_c,ls_base_c,ls_serie_c,ls_ag_pergola_c,ls_ag_capilla_c,ls_ag_visual_c,ls_uso_visualiza, ls_uso_capilla, ls_uso_pergola,ls_obs_datos,&
			ls_ag_externa
Double	ll_numero,ll_rut_titular,ll_rut_fall,ll_rut_titular_c,ll_rut_fall_c,ll_numero_c
datetime	ldt_fecha_defuncion,ldt_fecha_cineracion,ldt_fecha_ing_cinera,ldt_fecha_c,ldt_fec_defun_c,ldt_fecha_pergola_c,ldt_fecha_capilla_c,ldt_fecha_visual_c,&
			ldt_fec_ini,ldt_fecha_cabecera

ldt_fec_ini		= datetime(date(dp_fecha.text),time('00:00:00'))
if isnull(ldt_fec_ini) then
	messagebox("Advertencia","Debe Ingresar Fecha Inicio")
	dp_fecha.setfocus()
else
	dw_lista.reset()
	Setnull(ll_nulo)
	il_cod_parque							= long(substr(1,1,Message.StringParm))
	ls_fecha									= mid(substr(1,2,Message.StringParm),1,10)
	idt_fecha_cremacion					= ldt_fec_ini		//datetime(date(ls_fecha))
	is_nombre								= substr(1,3,Message.StringParm)
	is_ap_pat								= substr(1,4,Message.StringParm)
	is_ap_mat								= substr(1,5,Message.StringParm)
	is_obs									= substr(1,6,Message.StringParm)
	il_hora									= long(substr(1,7,Message.StringParm))
	il_min										= long(substr(1,8,Message.StringParm))
	il_folio									= long(substr(1,9,Message.StringParm))
	is_tipo									= substr(1,10,Message.StringParm)
	is_uso_visualiza						= substr(1,11,Message.StringParm)
	is_uso_capilla							= substr(1,12,Message.StringParm)
	is_uso_pergola							= substr(1,13,Message.StringParm)
	ll_hora_cineracion						= il_hora
	ll_minuto_cineracion					= il_min
	
	idt_fecha_cremacion					= ldt_fec_ini
	SELECT 	"FC_CABECERA"."FECHA_INGRESO_CINERARIO"  
	INTO 		:ldt_fecha_cabecera  
	FROM 	"FC_CABECERA"  
	WHERE 	"FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio   ;
	if il_cod_parque = 142 then
		ll_parque								= il_cod_parque
	else
		ll_parque								= 142
	end if
	ll_parque									= dw_parque.getitemnumber(1,'cod_parque')
	dw_lista.settransobject(sqlca)
	if il_cod_parque>0 then
		if is_tipo = 'C' then	// Resumen Crematorio
			dw_lista.setredraw(false)
			w_lista_pergola.title			= 'Resumen de Uso Pergola día '+string(idt_fecha_cremacion,'dd/mm/yyyy')
			dw_lista.object.t_titulo.text	= 'Resumen de Uso Pergola día '+string(idt_fecha_cremacion,'dd/mm/yyyy')
			
			SELECT 	"COD_PARQ"."NOMBRE"  
			INTO 		:ls_parque  
			FROM 	"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :il_cod_parque
			USING	sqlca;	
			ls_parque						= 'Parque '+ls_parque
			dw_lista.object.t_parque.text	= ls_parque
			SELECT	"FC_HORAS_CREMATORIO"."HORA_INICIO",   
						"FC_HORAS_CREMATORIO"."MINUTO_INICIO",   
						"FC_HORAS_CREMATORIO"."HORA_FINAL",   
						"FC_HORAS_CREMATORIO"."MINUTO_FINAL",   
						"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO",   
						"FC_HORAS_CREMATORIO"."VECES_USO"  
			INTO		:il_hora_ini_templo,   
						:il_min_ini_templo,   
						:il_hora_fin_templo,   
						:il_min_fin_templo,   
						:il_intervalo_templo,   
						:il_veces_templo  
			FROM 	"FC_HORAS_CREMATORIO"  
			WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :il_cod_parque   
			USING	sqlca;
			if sqlca.sqlcode<>0 then
				SELECT	"FC_HORAS_CREMATORIO"."HORA_INICIO",   
							"FC_HORAS_CREMATORIO"."MINUTO_INICIO",   
							"FC_HORAS_CREMATORIO"."HORA_FINAL",   
							"FC_HORAS_CREMATORIO"."MINUTO_FINAL",   
							"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO",   
							"FC_HORAS_CREMATORIO"."VECES_USO"  
				INTO		:il_hora_ini_templo,   
							:il_min_ini_templo,   
							:il_hora_fin_templo,   
							:il_min_fin_templo,   
							:il_intervalo_templo,   
							:il_veces_templo  
				FROM 	"FC_HORAS_CREMATORIO"  
				WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = 102   
				USING	sqlca;
			end if
			ll_hora								= il_hora_ini_templo
			ll_min									= il_min_ini_templo
			for ll_indi=1 to 37
				ll_new							= dw_lista.insertrow(0)
				dw_lista.setitem(ll_new,'hora',ll_hora)
				dw_lista.setitem(ll_new,'minuto',ll_min)
				dw_lista.setitem(ll_new,'modif_adm','N')
				dw_lista.setitem(ll_new,'veces',il_intervalo_templo)
				dw_lista.setitem(ll_new,'fecha_dia',idt_fecha_cremacion)
				dw_lista.setitem(ll_new,'cod_parque',il_cod_parque)
				dw_lista.setitem(ll_new,'tipo_ficha',is_tipo)
				dw_lista.setitem(ll_new,'contar_servi',0)
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
			ll_duracion_crematorio			= 90 / il_intervalo_templo
			if isvalid(w_ficha_crematorio) or isnull(is_nombre) or is_nombre='' then
				DECLARE x0 CURSOR FOR  
				SELECT 	"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO", 	"FC_AGENDA_PERGOLA"."FECHA_CREMACION",	"FC_AGENDA_PERGOLA"."HORA_CINERACION", 	"FC_AGENDA_PERGOLA"."MINUTO_CINERACION", 	"FC_AGENDA_PERGOLA"."RUT_TITULAR", 	"FC_AGENDA_PERGOLA"."RUT_FALLECIDO", 	"FC_AGENDA_PERGOLA"."NOMBRE_FALLECIDO",	"FC_AGENDA_PERGOLA"."AP_PATERNO_FALLECIDO",	"FC_AGENDA_PERGOLA"."AP_MATERNO_FALLECIDO",	"FC_AGENDA_PERGOLA"."FECHA_DEFUNCION",	"FC_AGENDA_PERGOLA"."ESTADO_GESTION", 	"FC_AGENDA_PERGOLA"."EJECUTIVO",	"FC_AGENDA_PERGOLA"."OBSERVACION", 	"FC_AGENDA_PERGOLA"."COD_PARQUE",	"FC_AGENDA_PERGOLA"."CODIGO_RELIGION",	"FC_AGENDA_PERGOLA"."SW_ORADOR",	"FC_AGENDA_PERGOLA"."SW_COVID",	"FC_AGENDA_PERGOLA"."SW_PROTOCOLO",	"FC_AGENDA_PERGOLA"."BASE",	"FC_AGENDA_PERGOLA"."SERIE",	"FC_AGENDA_PERGOLA"."NUMERO",	"FC_AGENDA_PERGOLA"."HORA_CINERACION_FIN",	"FC_AGENDA_PERGOLA"."MINUTO_CINERACION_FIN",	"FC_AGENDA_PERGOLA"."AGENDA_PERGOLA",	"FC_AGENDA_PERGOLA"."FECHA_PERGOLA",	"FC_AGENDA_PERGOLA"."HORA_INI_PERGOLA",	"FC_AGENDA_PERGOLA"."MINUTO_INI_PERGOLA",	"FC_AGENDA_PERGOLA"."HORA_FIN_PERGOLA",	"FC_AGENDA_PERGOLA"."MINUTO_FIN_PERGOLA",	"FC_AGENDA_PERGOLA"."AGENDA_CAPILLA",	"FC_AGENDA_PERGOLA"."FECHA_CAPILLA",	"FC_AGENDA_PERGOLA"."HORA_INI_CAPILLA",	"FC_AGENDA_PERGOLA"."MINUTO_INI_CAPILLA",	"FC_AGENDA_PERGOLA"."HORA_FIN_CAPILLA",	"FC_AGENDA_PERGOLA"."MINUTO_FIN_CAPILLA",	"FC_AGENDA_PERGOLA"."AGENDA_VISUALIZA",	"FC_AGENDA_PERGOLA"."FECHA_VISUALIZA",	"FC_AGENDA_PERGOLA"."HORA_INI_VISUALIZA",	"FC_AGENDA_PERGOLA"."MINUTO_INI_VISUALIZA",	"FC_AGENDA_PERGOLA"."HORA_FIN_VISUALIZA",	"FC_AGENDA_PERGOLA"."MINUTO_FIN_VISUALIZA",	"FC_AGENDA_PERGOLA"."AGENDA_EXTERNA"  
				FROM 	"FC_AGENDA_PERGOLA"  
				WHERE ( "FC_AGENDA_PERGOLA"."FECHA_CREMACION" = :idt_fecha_cremacion ) AND  
//						  ( "FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" <> :il_folio )  AND
						  ( "FC_AGENDA_PERGOLA"."ESTADO_REG" <> 'I' )
				ORDER BY 	"FC_AGENDA_PERGOLA"."HORA_CINERACION" ASC,
								"FC_AGENDA_PERGOLA"."MINUTO_CINERACION" ASC,
								"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" ASC
				USING	Trans_1;
				open x0;
				if Trans_1.sqlcode=0 then
					DO WHILE Trans_1.sqlcode=0
						FETCH x0 INTO :ll_folio_c, :ldt_fecha_c, :ll_hora_c, :ll_min_c, :ll_rut_titular_c, :ll_rut_fall_c, :ls_nom_fall_c, :ls_pat_fall_c, :ls_mat_fall_c, :ldt_fec_defun_c, :ll_estado_gestion_c, :ls_ejecutivo_c, :ls_obs_c, :ll_cod_parque_c, :ll_religion_c, :ll_sw_orado_c, :ll_sw_covid_c, :ls_sw_protocolo_c,:ls_base_c, :ls_serie_c,:ll_numero_c,:ll_hora_fin_c,:ll_min_fin_c,:ls_ag_pergola_c,:ldt_fecha_pergola_c,:ll_hora_ini_pergola_c, :ll_min_ini_pergola_c,:ll_hora_fin_pergola_c, :ll_min_fin_pergola_c,:ls_ag_capilla_c,:ldt_fecha_capilla_c,:ll_hora_ini_capilla_c,:ll_min_ini_capilla_c,:ll_hora_fin_capilla_c,:ll_min_fin_capilla_c,:ls_ag_visual_c,:ldt_fecha_visual_c,:ll_hora_ini_visual_c,:ll_min_ini_visual_c,:ll_hora_fin_visual_c,:ll_min_fin_visual_c, :ls_ag_externa;
						if not isnull(ls_nombre_fall) and ll_folio_c > 0 then
							ls_string	= 'hora='+string(ll_hora_c)+' and minuto='+string(ll_min_c)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								dw_lista.setitem(ll_reg,'nombre',ls_nom_fall_c)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_fall_c)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_fall_c)
								dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecutivo_c)
								dw_lista.setitem(ll_reg,'observacion',ls_obs_c)
								dw_lista.setitem(ll_reg,'tipo_ficha',is_tipo)
								dw_lista.setitem(ll_reg,'religion',ll_religion_c)
								dw_lista.setitem(ll_reg,'sw_orador',ll_sw_orado_c)
								dw_lista.setitem(ll_reg,'estado_gestion',ll_estado_gestion_c)
								dw_lista.setitem(ll_reg,'veces',il_intervalo_templo)
								dw_lista.setitem(ll_reg,'fecha_dia',ldt_fecha_c)
								dw_lista.setitem(ll_reg,'hora_cineracion',ll_hora_c)
								dw_lista.setitem(ll_reg,'minuto_cineracion',ll_min_c)
								dw_lista.setitem(ll_reg,'cod_parque',ll_cod_parque_c)
								dw_lista.setitem(ll_reg,'base',ls_base_c)
								dw_lista.setitem(ll_reg,'serie',ls_serie_c)
								dw_lista.setitem(ll_reg,'numero',ll_numero_c)
								dw_lista.setitem(ll_reg,'sw_protocolo',ls_sw_protocolo_c)
								dw_lista.setitem(ll_reg,'sw_covid',ll_sw_covid_c)
								dw_lista.setitem(ll_reg,'fecha_defuncion',ldt_fec_defun_c)
								dw_lista.setitem(ll_reg,'rut_titular',ll_rut_titular_c)
								dw_lista.setitem(ll_reg,'dv_titular',ls_dv_titular)
								dw_lista.setitem(ll_reg,'rut_fallecido',ll_rut_fall_c)
								dw_lista.setitem(ll_reg,'dv_fallecido',ls_dv_fall)
								dw_lista.setitem(ll_reg,'contar_servi',1)
								dw_lista.setitem(ll_reg,'agenda_externa',ls_ag_externa)
//								dw_lista.setitem(ll_reg,'observacion',is_obs)
								for ll_indi_c=1 to 2 
									ll_reg ++
									dw_lista.setitem(ll_reg,'nombre',ls_nom_fall_c)
									dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_fall_c)
									dw_lista.setitem(ll_reg,'ap_materno',ls_mat_fall_c)
									dw_lista.setitem(ll_reg,'ejecutivo',ls_ejecutivo_c)
									dw_lista.setitem(ll_reg,'observacion',ls_obs_c)
									dw_lista.setitem(ll_reg,'tipo_ficha',is_tipo)
									dw_lista.setitem(ll_reg,'religion',ll_religion_c)
									dw_lista.setitem(ll_reg,'sw_orador',ll_sw_orado_c)
									dw_lista.setitem(ll_reg,'estado_gestion',ll_estado_gestion_c)
									dw_lista.setitem(ll_reg,'veces',il_intervalo_templo)
									dw_lista.setitem(ll_reg,'fecha_dia',ldt_fecha_c)
									dw_lista.setitem(ll_reg,'hora_cineracion',ll_hora_c)
									dw_lista.setitem(ll_reg,'minuto_cineracion',ll_min_c)
									dw_lista.setitem(ll_reg,'cod_parque',ll_cod_parque_c)
									dw_lista.setitem(ll_reg,'base',ls_base_c)
									dw_lista.setitem(ll_reg,'serie',ls_serie_c)
									dw_lista.setitem(ll_reg,'numero',ll_numero_c)
									dw_lista.setitem(ll_reg,'sw_protocolo',ls_sw_protocolo_c)
									dw_lista.setitem(ll_reg,'sw_covid',ll_sw_covid_c)
									dw_lista.setitem(ll_reg,'fecha_defuncion',ldt_fec_defun_c)
									dw_lista.setitem(ll_reg,'rut_titular',ll_rut_titular_c)
									dw_lista.setitem(ll_reg,'dv_titular',ls_dv_titular)
									dw_lista.setitem(ll_reg,'rut_fallecido',ll_rut_fall_c)
									dw_lista.setitem(ll_reg,'dv_fallecido',ls_dv_fall)
									dw_lista.setitem(ll_reg,'agenda_externa',ls_ag_externa)
//									dw_lista.setitem(ll_reg,'observacion',is_obs)
								next
								dw_lista.accepttext()
							end if
						end if
					LOOP
				end if
				close x0;		
				DECLARE x1 CURSOR FOR 
				SELECT 	"FC_CABECERA"."BASE",   "FC_CABECERA"."SERIE",   "FC_CABECERA"."NUMERO",   "FC_CABECERA"."RUT_TITULAR",   "FC_TITULAR"."DV_TITULAR",   "FC_TITULAR"."NOMBRES",   "FC_TITULAR"."APELLIDO_PATERNO",   "FC_TITULAR"."APELLIDO_MATERNO",   "FC_TITULAR"."EMAIL",   "FC_TITULAR"."CELULAR",   "FC_CEREMONIA"."SW_ORADOR",   "FC_CEREMONIA"."OBSERVACION",   "FC_CEREMONIA"."CODIGO_RELIGION",   "FC_FALLECIDO"."RUT_FALLECIDO",   "FC_FALLECIDO"."DV_FALLECIDO",   "FC_FALLECIDO"."NOMBRES",   "FC_FALLECIDO"."APELLIDO_PATERNO",   "FC_FALLECIDO"."APELLIDO_MATERNO",   "FC_FALLECIDO"."FECHA_DEFUNCION",  "FC_CABECERA"."ESTADO_GESTION",	"FC_CABECERA"."SW_COVID_19",		"FC_CABECERA"."SW_PROTOCOLO_COVID",	"FC_CABECERA"."USUARIO_CREA",	"FC_CABECERA"."FECHA_INGRESO_CINERARIO",	"FC_CABECERA"."HORA_INGRESO_CINERARIO",	"FC_CABECERA"."MINUTO_INGRESO_CINERARIO",	"FC_RESPONSABLE_RETIRO"."VISUALIZAR_SERVICIO",	"FC_RESPONSABLE_RETIRO"."USO_CAPILLA",	"FC_RESPONSABLE_RETIRO"."USO_PERGOLA"
				FROM 	"FC_CABECERA",   "FC_CEREMONIA",   "FC_FALLECIDO",   "FC_TITULAR",	"FC_RESPONSABLE_RETIRO"  
				WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_CEREMONIA"."FOLIO_CREMATORIO" ) and  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_RESPONSABLE_RETIRO"."FOLIO_CREMATORIO" ) and  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_TITULAR"."FOLIO_CREMATORIO" ) and  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
							( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) and 
							( "FC_CABECERA"."FECHA_INGRESO_CINERARIO" = :ldt_fecha_cabecera )  AND
							( "FC_CABECERA"."ESTADO_REG" <> 'I' )) 
				ORDER BY 1 ASC,   
							2 ASC,
							3 ASC
				USING		sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
						FETCH x1 INTO :ls_base,:ls_serie,:ll_numero,:ll_rut_titular,:ls_dv_titular,:ls_nom_titular,:ls_pat_titular,:ls_mat_titular,:ls_email,:ls_celular,:ll_sw_orador,:ls_obs_ceremonia,:ll_cod_religion,:ll_rut_fall,:ls_dv_fall,:ls_nombre_fall,:ls_pat_fall,:ls_mat_fall,:ldt_fecha_defuncion,:ll_estado_gestion,:ll_sw_covid19,:ll_protocolo_covid, :ls_usuario_crea, :ldt_fecha_ing_cinera, :ll_hora_ing_cinera, :ll_min_ing_cinera, :ls_uso_visualiza, :ls_uso_capilla, :ls_uso_pergola  ;
						if not isnull(ls_nombre_fall) then
							dw_lista.accepttext()
							ls_string	= 'hora='+string(ll_hora_cineracion)+' and minuto='+string(ll_minuto_cineracion)
							ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
							if ll_reg > 0  then
								ls_nombre	= dw_lista.getitemstring(ll_reg,'nombre')
								if ls_nombre <> ls_nombre_fall then
									ll_reg	= ll_reg + 1
									dw_lista.insertrow(ll_reg)
									dw_lista.setitem(ll_reg,'hora',ll_hora_cineracion)
									dw_lista.setitem(ll_reg,'minuto',ll_minuto_cineracion)
								end if	
								dw_lista.setitem(ll_reg,'nombre',ls_nombre_fall)
								dw_lista.setitem(ll_reg,'ap_paterno',ls_pat_fall)
								dw_lista.setitem(ll_reg,'ap_materno',ls_mat_fall)
								is_ejecutivo					= ls_usuario_crea
								dw_lista.setitem(ll_reg,'ejecutivo',ls_usuario_crea)
								if isnull(ls_obs_ceremonia) then ls_obs_ceremonia=''
								ls_obs_ceremonia			= is_obs+ ' / ' + ls_obs_ceremonia 
								if ls_uso_visualiza='S' then
									ls_obs_ceremonia		= ls_obs_ceremonia + ', USO SALA VISUALIZACION '
								end if
								if ls_uso_pergola='S' then
									ls_obs_ceremonia		= ls_obs_ceremonia + ', USO PERGOLA '
								end if
								if ls_uso_capilla='S' then
									ls_obs_ceremonia		= ls_obs_ceremonia + '- USO CAPILLA '
								end if
								ls_obs_datos				= ls_obs_ceremonia
								dw_lista.setitem(ll_reg,'observacion',ls_obs_ceremonia)
								dw_lista.setitem(ll_reg,'tipo_ficha',is_tipo)
								dw_lista.setitem(ll_reg,'religion',ll_cod_religion)
								dw_lista.setitem(ll_reg,'sw_orador',ll_sw_orador)
								dw_lista.setitem(ll_reg,'estado_gestion',ll_estado_gestion)
								dw_lista.setitem(ll_reg,'veces',il_intervalo_templo)
								dw_lista.setitem(ll_reg,'fecha_dia',ldt_fecha_ing_cinera)
								dw_lista.setitem(ll_reg,'hora_cineracion',ll_hora_ing_cinera)
								dw_lista.setitem(ll_reg,'minuto_cineracion',ll_min_ing_cinera)
								dw_lista.setitem(ll_reg,'cod_parque',il_cod_parque)
								dw_lista.setitem(ll_reg,'base',ls_base)
								dw_lista.setitem(ll_reg,'serie',ls_serie)
								dw_lista.setitem(ll_reg,'numero',ll_numero)
								dw_lista.setitem(ll_reg,'sw_protocolo',ll_protocolo_covid)
								dw_lista.setitem(ll_reg,'sw_covid',ll_sw_covid19)
								dw_lista.setitem(ll_reg,'fecha_defuncion',ldt_fecha_defuncion)
								
								dw_lista.setitem(ll_reg,'rut_titular',ll_rut_titular)
								dw_lista.setitem(ll_reg,'dv_titular',ls_dv_titular)
								dw_lista.setitem(ll_reg,'rut_fallecido',ll_rut_fall)
								dw_lista.setitem(ll_reg,'dv_fallecido',ls_dv_fall)
								dw_lista.setitem(ll_reg,'contar_servi',1)
								dw_lista.setitem(ll_reg,'agenda_externa','N')
								dw_lista.accepttext()
//								dw_lista.setitem(ll_reg,'observacion',is_obs)
								if ll_duracion_crematorio > 1 then
									ll_fin			= ll_duracion_crematorio - 1
									ll_fila 			= ll_reg + 1
									for ll_indi=1 to ll_fin
										if ll_fila > 0  then
											dw_lista.setitem(ll_fila,'nombre',ls_nombre_fall)
											dw_lista.setitem(ll_fila,'ap_paterno',ls_pat_fall)
											dw_lista.setitem(ll_fila,'ap_materno',ls_mat_fall)
											dw_lista.setitem(ll_fila,'ejecutivo',ls_usuario_crea)
//											ls_obs_ceremonia			= is_obs+ ' / ' + ls_obs_ceremonia 
//											if ls_uso_visualiza='S' then
//												ls_obs_ceremonia		= ls_obs_ceremonia + ', USO SALA VISUALIZACION '
//											end if
//											if ls_uso_pergola='S' then
//												ls_obs_ceremonia		= ls_obs_ceremonia + ', USO PERGOLA '
//											end if
//											if ls_uso_capilla='S' then
//												ls_obs_ceremonia		= ls_obs_ceremonia + '- USO CAPILLA '
//											end if
											dw_lista.setitem(ll_fila,'observacion',ls_obs_datos)
											dw_lista.setitem(ll_fila,'tipo_ficha',is_tipo)
											dw_lista.setitem(ll_fila,'religion',ll_cod_religion)
											dw_lista.setitem(ll_fila,'sw_orador',ll_sw_orador)
											dw_lista.setitem(ll_fila,'estado_gestion',ll_estado_gestion)
											dw_lista.setitem(ll_fila,'veces',il_intervalo_templo)
											dw_lista.setitem(ll_fila,'fecha_dia',ldt_fecha_ing_cinera)
											dw_lista.setitem(ll_fila,'hora_cineracion',ll_hora_ing_cinera)
											dw_lista.setitem(ll_fila,'minuto_cineracion',ll_min_ing_cinera)
											dw_lista.setitem(ll_fila,'cod_parque',il_cod_parque)
											dw_lista.setitem(ll_fila,'base',ls_base)
											dw_lista.setitem(ll_fila,'serie',ls_serie)
											dw_lista.setitem(ll_fila,'numero',ll_numero)
											dw_lista.setitem(ll_fila,'sw_protocolo',ll_protocolo_covid)
											dw_lista.setitem(ll_fila,'sw_covid',ll_sw_covid19)
											dw_lista.setitem(ll_fila,'fecha_defuncion',ldt_fecha_defuncion)
											dw_lista.setitem(ll_fila,'rut_titular',ll_rut_titular)
											dw_lista.setitem(ll_fila,'dv_titular',ls_dv_titular)
											dw_lista.setitem(ll_fila,'rut_fallecido',ll_rut_fall)
											dw_lista.setitem(ll_fila,'dv_fallecido',ls_dv_fall)
											dw_lista.setitem(ll_fila,'agenda_externa','N')
//											dw_lista.setitem(ll_fila,'observacion',is_obs)
											ll_fila ++
										end if
									next
									dw_lista.accepttext()
								end if
							else
								ls_string_otro				= 'hora='+string(ll_hora_cineracion)+ ' and minuto='+string(ll_minuto_cineracion)
								ll_reg_otro					= dw_lista.Find(ls_string_otro, 1, ll_tot_reg)
								if ll_reg_otro > 0 then
									for ll_indi = ll_reg_otro to ll_tot_reg
										ll_hora_ins			= dw_lista.getitemnumber(ll_indi,'hora')
										ll_minuto_ins		= dw_lista.getitemnumber(ll_indi,'minuto')
										if ll_hora_ins = ll_hora_cineracion and ll_minuto_ins = ll_minuto_cineracion then
											if ll_minuto_cineracion <= ll_minuto_ins then
												ll_new_reg	= dw_lista.insertrow(ll_indi)
												dw_lista.setitem(ll_new_reg,'hora',ll_hora_cineracion)
												dw_lista.setitem(ll_new_reg,'minuto',ll_minuto_cineracion)
												dw_lista.setitem(ll_new_reg,'nombre',ls_nombre_fall)
												dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_fall)
												dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_fall)
												dw_lista.setitem(ll_new_reg,'religion',ll_cod_religion)
												dw_lista.setitem(ll_new_reg,'sw_orador',ll_sw_orador)
												dw_lista.setitem(ll_new_reg,'estado_gestion',ll_estado_gestion)
												dw_lista.setitem(ll_new_reg,'ejecutivo',ls_usuario_crea)
												if isnull(ls_obs_ceremonia) then ls_obs_ceremonia=''
												ls_obs_ceremonia			= is_obs + ' / ' + ls_obs_ceremonia 
												if ls_uso_visualiza='S' then
													ls_obs_ceremonia		= ls_obs_ceremonia + ', USO SALA VISUALIZACION '
												end if
												if ls_uso_pergola='S' then
													ls_obs_ceremonia		= ls_obs_ceremonia + ', USO PERGOLA '
												end if
												if ls_uso_capilla='S' then
													ls_obs_ceremonia		= ls_obs_ceremonia + '- USO CAPILLA '
												end if
												dw_lista.setitem(ll_new_reg,'observacion',ls_obs_ceremonia)
												dw_lista.setitem(ll_new_reg,'tipo_ficha',is_tipo)
												dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
												dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha_ing_cinera)
												dw_lista.setitem(ll_new_reg,'hora_cineracion',ll_hora_ing_cinera)
												dw_lista.setitem(ll_new_reg,'minuto_cineracion',ll_min_ing_cinera)
												dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
												dw_lista.setitem(ll_new_reg,'base',ls_base)
												dw_lista.setitem(ll_new_reg,'serie',ls_serie)
												dw_lista.setitem(ll_new_reg,'numero',ll_numero)
												dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
												dw_lista.setitem(ll_new_reg,'sw_covid',ll_sw_covid19)
												dw_lista.setitem(ll_new_reg,'fecha_defuncion',ldt_fecha_defuncion)
												dw_lista.setitem(ll_new_reg,'rut_titular',ll_rut_titular)
												dw_lista.setitem(ll_new_reg,'dv_titular',ls_dv_titular)
												dw_lista.setitem(ll_new_reg,'rut_fallecido',ll_rut_fall)
												dw_lista.setitem(ll_new_reg,'dv_fallecido',ls_dv_fall)
												dw_lista.setitem(ll_new_reg,'agenda_externa','N')
//												dw_lista.setitem(ll_new_reg,'observacion',is_obs)
												dw_lista.accepttext()
												ll_tot_reg	= dw_lista.rowcount()
												exit
											end if
										end if
									next
									dw_lista.accepttext()
								else
									if ll_hora_cineracion < il_hora_ini then
										ll_new_reg	= dw_lista.insertrow(1)
									elseif ll_hora_cineracion > il_hora_fin then
										ll_new_reg	= dw_lista.insertrow(0)
									end if
									dw_lista.setitem(ll_new_reg,'hora',ll_hora_cineracion)
									dw_lista.setitem(ll_new_reg,'minuto',ll_minuto_cineracion)
									dw_lista.setitem(ll_new_reg,'nombre',ls_nombre_fall)
									dw_lista.setitem(ll_new_reg,'ap_paterno',ls_pat_fall)
									dw_lista.setitem(ll_new_reg,'ap_materno',ls_mat_fall)
									dw_lista.setitem(ll_new_reg,'religion',ll_cod_religion)
									dw_lista.setitem(ll_new_reg,'sw_orador',ll_sw_orador)
									dw_lista.setitem(ll_new_reg,'estado_gestion',ll_estado_gestion)
									dw_lista.setitem(ll_new_reg,'ejecutivo',ls_usuario_crea)
									if isnull(ls_obs_ceremonia) then ls_obs_ceremonia=''
									ls_obs_ceremonia	= is_obs + ' / ' + ls_obs_ceremonia 
									if ls_uso_visualiza='S' then
										ls_obs_ceremonia		= ls_obs_ceremonia + ', USO SALA VISUALIZACION '
									end if
									if ls_uso_pergola='S' then
										ls_obs_ceremonia		= ls_obs_ceremonia + ', USO PERGOLA '
									end if
									if ls_uso_capilla='S' then
										ls_obs_ceremonia		= ls_obs_ceremonia + '- USO CAPILLA '
									end if
									dw_lista.setitem(ll_new_reg,'observacion',ls_obs_ceremonia)
									dw_lista.setitem(ll_new_reg,'tipo_ficha',is_tipo)
									dw_lista.setitem(ll_new_reg,'veces',il_intervalo)
									dw_lista.setitem(ll_new_reg,'fecha_dia',ldt_fecha_ing_cinera)
									dw_lista.setitem(ll_new_reg,'hora_cineracion',ll_hora_ing_cinera)
									dw_lista.setitem(ll_new_reg,'minuto_cineracion',ll_min_ing_cinera)
									dw_lista.setitem(ll_new_reg,'cod_parque',il_cod_parque)
									dw_lista.setitem(ll_new_reg,'base',ls_base)
									dw_lista.setitem(ll_new_reg,'serie',ls_serie)
									dw_lista.setitem(ll_new_reg,'numero',ll_numero)
									dw_lista.setitem(ll_new_reg,'sw_protocolo',ll_protocolo_covid)
									dw_lista.setitem(ll_new_reg,'sw_covid',ll_sw_covid19)
									dw_lista.setitem(ll_new_reg,'fecha_defuncion',ldt_fecha_defuncion)
									dw_lista.setitem(ll_new_reg,'rut_titular',ll_rut_titular)
									dw_lista.setitem(ll_new_reg,'dv_titular',ls_dv_titular)
									dw_lista.setitem(ll_new_reg,'rut_fallecido',ll_rut_fall)
									dw_lista.setitem(ll_new_reg,'dv_fallecido',ls_dv_fall)
									dw_lista.setitem(ll_new_reg,'agenda_externa','N')
//									dw_lista.setitem(ll_new_reg,'observacion',is_obs)
									dw_lista.accepttext()
									ll_tot_reg		= dw_lista.rowcount()
								end if
							end if
							
							ll_tot_reg				= dw_lista.rowcount()
						end if
						Setnull(ls_nombre_fall)
					LOOP
				end if
				close x1;
				dw_lista.accepttext()
				dw_lista.GROUPCALC() 
				dw_lista.setredraw(true)
			end if
			ls_string	= 'hora='+string(il_hora)+' and minuto='+string(il_min)
			ll_reg		= dw_lista.Find(ls_string, 1, ll_tot_reg)
			if ll_tot_reg > 0 then
				if ll_reg > 0 then
					dw_lista.scrolltorow(ll_reg)
				else
					dw_lista.scrolltorow(ll_reg)
				end if
			end if
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if

end if
end event

type dp_fecha from datepicker within w_lista_pergola
integer x = 219
integer y = 36
integer width = 448
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-05-17"), Time("21:09:45.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;datetime		ldt_fec_ini

ldt_fec_ini		= datetime(date(dp_fecha.text),time('00:00:00'))
if not isnull(ldt_fec_ini) then pb_ok.triggerevent(clicked!)
end event

type cb_exportar from commandbutton within w_lista_pergola
integer x = 1893
integer y = 2136
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
if dw_lista.rowcount() > 0 then OpenWithParm(w_exportar, dw_paso)

end event

type cb_imprimir from commandbutton within w_lista_pergola
integer x = 1550
integer y = 2136
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
	f_printdlg(dw_lista,gstr_print,w_lista_crematorio)
	dw_lista.object.datawindow.zoom				= 100
	dw_lista.object.datawindow.print.preview	= false
end if

end event

type cb_agregar from commandbutton within w_lista_pergola
integer x = 41
integer y = 2136
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

event clicked;String		ls_string,ls_nom,ls_nombre_fall,ls_pat_fall,ls_mat_fall,ls_obs_ceremonia,ls_base,ls_serie,ls_dv_titular,ls_dv_fall,ls_agenda_pergola,ls_agenda_capilla,&
			ls_agenda_visualiza,ls_nom1,ls_nom2,ls_nom3
Long		ll_reg,ll_reg_hora,ll_tot_reg,ll_new,ll_min_new,ll_reg_hora_otra,ll_tot_reg_ant,ll_indi,ll_hora_sel,ll_min_sel,ll_hora_cineracion,ll_minuto_cineracion,&
			ll_cod_religion,ll_sw_orador,ll_estado_gestion,ll_hora_ing_cinera,ll_min_ing_cinera,ll_numero,ll_protocolo_covid,ll_sw_covid19,ll_rut_titular,ll_rut_fall,&
			ll_count_agenda,ll_count_capilla,ll_hora_cineracion_fin,ll_min_cineracion_fin,ll_count_pergola,ll_hora_ini_capilla,ll_min_ini_capilla,ll_hora_fin_capilla,&
			ll_min_fin_capilla,ll_hora_ini_pergola,ll_minuto_ini_pergola,ll_hora_fin_pergola,ll_minuto_fin_pergola,ll_minuto_ini_capilla,ll_minuto_fin_capilla,&
			ll_hora_ini_visual,ll_min_ini_visual,ll_hora_fin_visual,ll_min_fin_visual,ll_hora_ini_visualiza,ll_min_ini_visualiza,ll_hora_fin_visualiza,ll_min_fin_visualiza,&
			ll_fila,ll_hora_ini,ll_min_ini,ll_hora_fin,ll_min_fin
datetime	ldt_fecha_ing_cinera,ldt_fecha_defuncion,ldt_fecha_pergola,ldt_fecha_capilla,ldt_fecha_visualiza,ldt_fec_ini

ldt_fec_ini									= datetime(date(dp_fecha.text),time('00:00:00'))
ll_tot_reg									= dw_lista.rowcount()
ls_string										= 'hora='+string(il_hora)+' and minuto='+string(il_min)
ll_reg											= dw_lista.Find(ls_string, 1, ll_tot_reg)
if ll_tot_reg > 0 and il_folio > 0 then
	if ll_reg > 0 then
		dw_lista.scrolltorow(ll_reg)
	else
		dw_lista.scrolltorow(ll_reg)
	end if
end if
if il_hora > 0 and  not isnull(il_hora) then
	ls_nom									= dw_lista.getitemstring(il_row,'nombre')
	if not isnull(ls_nom) and ls_nom<>'' then
		il_grabar ++
		ll_hora_sel							= dw_lista.getitemnumber(il_row,'hora')
		ll_min_sel							= dw_lista.getitemnumber(il_row,'minuto')
		dw_lista.setitem(il_row,'nombre',is_nombre)
		dw_lista.setitem(il_row,'ap_paterno',is_ap_pat)
		dw_lista.setitem(il_row,'ap_materno',is_ap_mat)
//		dw_lista.setitem(il_row,'sector',is_sector)
//		dw_lista.setitem(il_row,'sepultura',is_sepultura)
		dw_lista.setitem(il_row,'ejecutivo',is_ejecutivo)
		dw_lista.setitem(il_row,'observacion',is_obs)
		dw_lista.setitem(il_row,'tipo_ficha',is_tipo)
		if isvalid(w_ficha_crematorio) or isnull(is_nombre) or is_nombre='' then
			ls_nombre_fall					= dw_lista.getitemstring(il_row,'nombre')
			ll_hora_cineracion				= dw_lista.getitemnumber(il_row,'hora')
			ll_minuto_cineracion			= dw_lista.getitemnumber(il_row,'minuto')
			ls_pat_fall						= dw_lista.getitemstring(il_row,'ap_paterno')
			ls_mat_fall						= dw_lista.getitemstring(il_row,'ap_materno')
	//		is_ejecutivo						= ls_usuario_crea
	//		dw_lista.setitem(ll_reg,'ejecutivo',ls_usuario_crea)
			ls_obs_ceremonia				= dw_lista.getitemstring(il_row,'observacion')
			ll_cod_religion					= dw_lista.getitemnumber(il_row,'religion')
			ll_sw_orador					= dw_lista.getitemnumber(il_row,'sw_orador')
			ll_estado_gestion				= dw_lista.getitemnumber(il_row,'estado_gestion')
			ldt_fecha_ing_cinera			= dw_lista.getitemdatetime(il_row,'fecha_dia')
			ll_hora_ing_cinera				= dw_lista.getitemnumber(il_row,'hora_cineracion')
			ll_min_ing_cinera				= dw_lista.getitemnumber(il_row,'minuto_cineracion')
//			il_cod_parque					= dw_lista.setitem(ll_reg,'cod_parque')
			ls_base							= dw_lista.getitemstring(il_row,'base')
			ls_serie							= dw_lista.getitemstring(il_row,'serie')
			ll_numero						= dw_lista.getitemnumber(il_row,'numero')
			ll_protocolo_covid				= dw_lista.getitemnumber(il_row,'sw_protocolo')
			ll_sw_covid19					= dw_lista.getitemnumber(il_row,'sw_covid')
			ldt_fecha_defuncion			= dw_lista.getitemdatetime(il_row,'fecha_defuncion')
			ll_rut_titular						= dw_lista.getitemnumber(il_row,'rut_titular')
			ls_dv_titular						= dw_lista.getitemstring(il_row,'dv_titular')
			ll_rut_fall							= dw_lista.getitemnumber(il_row,'rut_fallecido')
			ls_dv_fall							= dw_lista.getitemstring(il_row,'dv_fallecido')
			//hora cineracion
			ll_hora_cineracion_fin			= ll_hora_ing_cinera + 1
			ll_min_cineracion_fin			= ll_min_ing_cinera + 30
			if ll_min_cineracion_fin >= 60 then
				ll_min_cineracion_fin 		= 0
				ll_hora_cineracion_fin		= ll_hora_cineracion_fin + 1
			end if
			// hora capilla o pergola
			ll_hora_ini_capilla				= ll_hora_ing_cinera
			if ll_min_ing_cinera = 0 then
				ll_hora_ini_capilla			= ll_hora_ing_cinera - 1
			end if
			ll_min_ini_capilla				= (60 - ll_min_ing_cinera) - 30
			if ll_min_ini_capilla = 60 then ll_min_ini_capilla=0
			
//			if ll_minuto_cineracion >= 30 then
			ll_hora_fin_capilla				= ll_hora_ini_capilla + 1
//			end if
			ll_min_fin_capilla				= ll_min_ini_capilla
			if ll_min_fin_capilla = 60 then ll_min_fin_capilla=0
			//Hora visualizacion
			ll_hora_ini_visual				= ll_hora_ing_cinera
			ll_min_ini_visual				= ll_min_ing_cinera
			
			ll_min_fin_visual				= ll_min_ini_visual + 30
			if ll_min_fin_visual >= 60 then
				ll_hora_fin_visual			= ll_hora_ini_visual + 1
				ll_min_fin_visual			= 0
			end if
			
			ll_hora_ini_visualiza			= ll_hora_ing_cinera
			ll_min_ini_visualiza			= ll_minuto_cineracion
			ll_hora_fin_visualiza			= ll_hora_ing_cinera
			ll_min_fin_visualiza			= ll_minuto_cineracion + 30
			if ll_min_fin_visualiza	>= 60 then
				ll_hora_fin_visualiza		= ll_hora_fin_visualiza + 1
				ll_min_fin_visualiza		= 0
			end if
//			ls_agenda_capilla				= is_uso_capilla
//			ls_agenda_pergola			= is_uso_pergola
//			ls_agenda_visualiza			= is_uso_visualiza
			
			SELECT 	COUNT("FC_AGENDA_CAPILLA"."EJECUTIVO")  
			INTO 		:ll_count_capilla  
			FROM 	"FC_AGENDA_CAPILLA" 
			WHERE ( "FC_AGENDA_CAPILLA"."FECHA_CREMACION" = :ldt_fecha_ing_cinera ) AND  
					  ( "FC_AGENDA_CAPILLA"."HORA_CINERACION" >= :ll_hora_cineracion ) AND  
					  ( "FC_AGENDA_CAPILLA"."MINUTO_CINERACION" >= :ll_minuto_cineracion ) AND  
					  ( "FC_AGENDA_CAPILLA"."HORA_CINERACION_FIN" <= :ll_hora_cineracion_fin ) AND  
					  ( "FC_AGENDA_CAPILLA"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin ) AND
					  ( "FC_AGENDA_CAPILLA"."RUT_TITULAR" <> :ll_rut_titular)  AND
					  ( "FC_AGENDA_CAPILLA"."RUT_FALLECIDO" <> :ll_rut_fall)
			USING	sqlca;
			if ll_count_capilla > 0 then
				SELECT 	COUNT("FC_AGENDA_PERGOLA"."EJECUTIVO")  
				INTO 		:ll_count_pergola  
				FROM 	"FC_AGENDA_PERGOLA" 
				WHERE ( "FC_AGENDA_PERGOLA"."FECHA_CREMACION" = :ldt_fecha_ing_cinera ) AND  
						  ( "FC_AGENDA_PERGOLA"."HORA_CINERACION" >= :ll_hora_cineracion ) AND  
						  ( "FC_AGENDA_PERGOLA"."MINUTO_CINERACION" >= :ll_minuto_cineracion ) AND  
						  ( "FC_AGENDA_PERGOLA"."HORA_CINERACION_FIN" <= :ll_hora_cineracion_fin ) AND  
						  ( "FC_AGENDA_PERGOLA"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin )  AND
						  ( "FC_AGENDA_PERGOLA"."RUT_TITULAR" <> :ll_rut_titular)  AND
							( "FC_AGENDA_PERGOLA"."RUT_FALLECIDO" <> :ll_rut_fall)
				USING	sqlca;
				if ll_count_pergola > 0 then
					messagebox("Advertencia","No es Posible Agendar Capilla / Pergola, No hay Disponibilidad")
				else
					ls_agenda_pergola	= 'S'
					ldt_fecha_pergola		= ldt_fecha_ing_cinera
					ll_hora_ini_pergola	= ll_hora_ini_capilla
					ll_minuto_ini_pergola	= ll_min_ini_capilla
					ll_hora_fin_pergola	= ll_hora_fin_capilla
					ll_minuto_fin_pergola	= ll_min_fin_capilla
					ls_agenda_capilla		= 'N'
					setnull(ldt_fecha_capilla)
					ll_hora_ini_capilla		= 0
					ll_minuto_ini_capilla	= 0
					ll_hora_fin_capilla		= 0
					ll_minuto_fin_capilla	= 0
				end if
			else
				ls_agenda_pergola	= 'N'
				setnull(ldt_fecha_pergola)
				ll_hora_ini_pergola	= 0
				ll_minuto_ini_pergola	= 0
				ll_hora_fin_pergola	= 0
				ll_minuto_fin_pergola	= 0
				ls_agenda_capilla		= 'S'
				ldt_fecha_capilla		= ldt_fecha_ing_cinera
				ll_hora_ini_capilla		= ll_hora_ini_capilla
				ll_minuto_ini_capilla	= ll_min_ini_capilla
				ll_hora_fin_capilla		= ll_hora_fin_capilla
				ll_minuto_fin_capilla	= ll_min_fin_capilla
			end if
			if is_uso_visualiza<>'S' then
				ll_hora_ini_visualiza	= 0
				ll_min_ini_visualiza	= 0
				ll_hora_fin_visualiza	= 0
				ll_min_fin_visualiza	= 0
				setnull(ldt_fecha_visualiza)
				ls_agenda_visualiza	= 'N'
			else
				ls_agenda_visualiza	= 'S'
				ldt_fecha_visualiza		= ldt_fecha_ing_cinera
				ll_hora_ini_visualiza	= ll_hora_ini_visual
				ll_min_ini_visualiza	= ll_min_ini_visual
				ll_hora_fin_visualiza	= ll_hora_fin_visual
				ll_min_fin_visualiza	= ll_min_fin_visual
			end if
			if is_uso_capilla<>'S' then
				ll_hora_ini_capilla		= 0
				ll_min_ini_capilla		= 0
				ll_hora_fin_capilla		= 0
				ll_min_fin_capilla		= 0
				setnull(ldt_fecha_capilla)
				ls_agenda_capilla		= 'N'
			end if
			if is_uso_pergola<>'S' then
				ll_hora_ini_pergola	= 0
				ll_minuto_ini_pergola	= 0
				ll_hora_fin_pergola	= 0
				ll_minuto_fin_pergola	= 0
				setnull(ldt_fecha_pergola)
				ls_agenda_pergola	= 'N'
			end if
				
			SELECT 	Count("FC_AGENDA_PERGOLA"."NOMBRE_FALLECIDO" ) 
			INTO 		:ll_count_agenda  
			FROM 	"FC_AGENDA_PERGOLA"  
			WHERE 	"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :il_folio   ;
			if ll_count_agenda=0 or isnull(ll_count_agenda) then	
				
//				INSERT INTO "FC_AGENDA_CREMATORIO"  
//							( "FOLIO_CREMATORIO",  	"FECHA_CREMACION",	"HORA_CINERACION", 	"MINUTO_CINERACION", 	"RUT_TITULAR", 	"RUT_FALLECIDO", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO",	"FECHA_DEFUNCION", 	"ESTADO_GESTION", 		"EJECUTIVO", 	"OBSERVACION", 		"COD_PARQUE", 	"CODIGO_RELIGION", 		"SW_ORADOR", 	"SW_COVID", 	"SW_PROTOCOLO", 	"BASE", 	"SERIE", 		"NUMERO", 		"HORA_CINERACION_FIN", 		"MINUTO_CINERACION_FIN", 	"AGENDA_PERGOLA", 		"FECHA_PERGOLA", 		"HORA_INI_PERGOLA", 	"MINUTO_INI_PERGOLA", 	"HORA_FIN_PERGOLA", 	"MINUTO_FIN_PERGOLA", 	"AGENDA_CAPILLA", 	"FECHA_CAPILLA", 	"HORA_INI_CAPILLA", 	"MINUTO_INI_CAPILLA", 		"HORA_FIN_CAPILLA", 	"MINUTO_FIN_CAPILLA",		"AGENDA_VISUALIZA", 	"FECHA_VISUALIZA", 	"HORA_INI_VISUALIZA", 	"MINUTO_INI_VISUALIZA", 		"HORA_FIN_VISUALIZA", 	"MINUTO_FIN_VISUALIZA",	"AGENDA_EXTERNA",		"ESTADO_REG" )  
//				VALUES 	( :il_folio,   						:ldt_fecha_ing_cinera,	:ll_hora_cineracion,		:ll_minuto_cineracion,		:ll_rut_titular,		:ll_rut_fall,				:ls_nombre_fall,			:ls_pat_fall,							:ls_mat_fall,							:ldt_fecha_defuncion,		:ll_estado_gestion,		:gs_user,		:ls_obs_ceremonia,	:il_cod_parque,		:ll_cod_religion,			:ll_sw_orador,		:ll_sw_covid19,	:ll_protocolo_covid,	:ls_base,	:ls_serie,		:ll_numero,		:ll_hora_cineracion_fin,			:ll_min_cineracion_fin,			:ls_agenda_pergola,		:ldt_fecha_pergola,		:ll_hora_ini_pergola,		:ll_minuto_ini_pergola,		:ll_hora_fin_pergola,		:ll_minuto_fin_pergola,		:ls_agenda_capilla,	:ldt_fecha_capilla,		:ll_hora_ini_capilla,		:ll_minuto_ini_capilla,			:ll_hora_fin_capilla,		:ll_minuto_fin_capilla,			:ls_agenda_visualiza,		:ldt_fecha_visualiza,	:ll_hora_ini_visualiza,		:ll_min_ini_visualiza,				:ll_hora_fin_visualiza,			:ll_min_fin_visualiza,			'N',							'P'	)
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					commit;
//					if ll_count_capilla = 0 and ls_agenda_capilla='S' then
//						INSERT INTO "FC_AGENDA_CAPILLA"  
//									( "FOLIO_CREMATORIO",  	"FECHA_CREMACION",	"HORA_CINERACION", 	"MINUTO_CINERACION", 	"RUT_TITULAR", 	"RUT_FALLECIDO", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO",	"FECHA_DEFUNCION", 	"ESTADO_GESTION", 		"EJECUTIVO", 	"OBSERVACION", 		"COD_PARQUE", 	"CODIGO_RELIGION", 		"SW_ORADOR", 	"SW_COVID", 	"SW_PROTOCOLO", 	"BASE", 	"SERIE", 		"NUMERO", 		"HORA_CINERACION_FIN", 		"MINUTO_CINERACION_FIN", 	"AGENDA_PERGOLA", 		"FECHA_PERGOLA", 		"HORA_INI_PERGOLA", 	"MINUTO_INI_PERGOLA", 	"HORA_FIN_PERGOLA", 	"MINUTO_FIN_PERGOLA", 	"AGENDA_CAPILLA", 	"FECHA_CAPILLA", 	"HORA_INI_CAPILLA", 	"MINUTO_INI_CAPILLA", 		"HORA_FIN_CAPILLA", 	"MINUTO_FIN_CAPILLA",		"AGENDA_VISUALIZA", 	"FECHA_VISUALIZA", 	"HORA_INI_VISUALIZA", 	"MINUTO_INI_VISUALIZA", 		"HORA_FIN_VISUALIZA", 	"MINUTO_FIN_VISUALIZA",	"AGENDA_EXTERNA",		"ESTADO_REG" )  
//						VALUES 	( :il_folio,   						:ldt_fecha_ing_cinera,	:ll_hora_cineracion,		:ll_minuto_cineracion,		:ll_rut_titular,		:ll_rut_fall,				:ls_nombre_fall,			:ls_pat_fall,							:ls_mat_fall,							:ldt_fecha_defuncion,		:ll_estado_gestion,		:gs_user,		:ls_obs_ceremonia,	:il_cod_parque,		:ll_cod_religion,			:ll_sw_orador,		:ll_sw_covid19,	:ll_protocolo_covid,	:ls_base,	:ls_serie,		:ll_numero,		:ll_hora_cineracion_fin,			:ll_min_cineracion_fin,			:ls_agenda_pergola,		:ldt_fecha_pergola,		:ll_hora_ini_pergola,		:ll_minuto_ini_pergola,		:ll_hora_fin_pergola,		:ll_minuto_fin_pergola,		:ls_agenda_capilla,	:ldt_fecha_capilla,		:ll_hora_ini_capilla,		:ll_minuto_ini_capilla,			:ll_hora_fin_capilla,		:ll_minuto_fin_capilla,			:ls_agenda_visualiza,		:ldt_fecha_visualiza,	:ll_hora_ini_visualiza,		:ll_min_ini_visualiza,				:ll_hora_fin_visualiza,			:ll_min_fin_visualiza,			'N',							'P'	)
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if
					if ll_count_agenda = 0 and ls_agenda_pergola='S' then
						INSERT INTO "FC_AGENDA_PERGOLA"  
									( "FOLIO_CREMATORIO",  	"FECHA_CREMACION",	"HORA_CINERACION", 	"MINUTO_CINERACION", 	"RUT_TITULAR", 	"RUT_FALLECIDO", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO",	"FECHA_DEFUNCION", 	"ESTADO_GESTION", 		"EJECUTIVO", 	"OBSERVACION", 		"COD_PARQUE", 	"CODIGO_RELIGION", 		"SW_ORADOR", 	"SW_COVID", 	"SW_PROTOCOLO", 	"BASE", 	"SERIE", 		"NUMERO", 		"HORA_CINERACION_FIN", 		"MINUTO_CINERACION_FIN", 	"AGENDA_PERGOLA", 		"FECHA_PERGOLA", 		"HORA_INI_PERGOLA", 	"MINUTO_INI_PERGOLA", 	"HORA_FIN_PERGOLA", 	"MINUTO_FIN_PERGOLA", 	"AGENDA_CAPILLA", 	"FECHA_CAPILLA", 	"HORA_INI_CAPILLA", 	"MINUTO_INI_CAPILLA", 		"HORA_FIN_CAPILLA", 	"MINUTO_FIN_CAPILLA",		"AGENDA_VISUALIZA", 	"FECHA_VISUALIZA", 	"HORA_INI_VISUALIZA", 	"MINUTO_INI_VISUALIZA", 		"HORA_FIN_VISUALIZA", 	"MINUTO_FIN_VISUALIZA",	"AGENDA_EXTERNA",		"ESTADO_REG"  )  
						VALUES 	( :il_folio,   						:ldt_fecha_ing_cinera,	:ll_hora_cineracion,		:ll_minuto_cineracion,		:ll_rut_titular,		:ll_rut_fall,				:ls_nombre_fall,			:ls_pat_fall,							:ls_mat_fall,							:ldt_fecha_defuncion,		:ll_estado_gestion,		:gs_user,		:ls_obs_ceremonia,	:il_cod_parque,		:ll_cod_religion,			:ll_sw_orador,		:ll_sw_covid19,	:ll_protocolo_covid,	:ls_base,	:ls_serie,		:ll_numero,		:ll_hora_cineracion_fin,			:ll_min_cineracion_fin,			:ls_agenda_pergola,		:ldt_fecha_pergola,		:ll_hora_ini_pergola,		:ll_minuto_ini_pergola,		:ll_hora_fin_pergola,		:ll_minuto_fin_pergola,		:ls_agenda_capilla,	:ldt_fecha_capilla,		:ll_hora_ini_capilla,		:ll_minuto_ini_capilla,			:ll_hora_fin_capilla,		:ll_minuto_fin_capilla,			:ls_agenda_visualiza,		:ldt_fecha_visualiza,	:ll_hora_ini_visualiza,		:ll_min_ini_visualiza,				:ll_hora_fin_visualiza,			:ll_min_fin_visualiza,			'N',							'P'	)
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
//					if is_uso_visualiza='S' then
//						INSERT INTO "FC_AGENDA_VISUALIZA"  
//									( "FOLIO_CREMATORIO",  	"FECHA_CREMACION",	"HORA_CINERACION", 	"MINUTO_CINERACION", 	"RUT_TITULAR", 	"RUT_FALLECIDO", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO",	"FECHA_DEFUNCION", 	"ESTADO_GESTION", 		"EJECUTIVO", 	"OBSERVACION", 		"COD_PARQUE", 	"CODIGO_RELIGION", 		"SW_ORADOR", 	"SW_COVID", 	"SW_PROTOCOLO", 	"BASE", 	"SERIE", 		"NUMERO", 		"HORA_CINERACION_FIN", 		"MINUTO_CINERACION_FIN", 	"AGENDA_PERGOLA", 		"FECHA_PERGOLA", 		"HORA_INI_PERGOLA", 	"MINUTO_INI_PERGOLA", 	"HORA_FIN_PERGOLA", 	"MINUTO_FIN_PERGOLA", 	"AGENDA_CAPILLA", 	"FECHA_CAPILLA", 	"HORA_INI_CAPILLA", 	"MINUTO_INI_CAPILLA", 		"HORA_FIN_CAPILLA", 	"MINUTO_FIN_CAPILLA",		"AGENDA_VISUALIZA", 	"FECHA_VISUALIZA", 	"HORA_INI_VISUALIZA", 	"MINUTO_INI_VISUALIZA", 		"HORA_FIN_VISUALIZA", 	"MINUTO_FIN_VISUALIZA",	"AGENDA_EXTERNA",		"ESTADO_REG"  )  
//						VALUES 	( :il_folio,   						:ldt_fecha_ing_cinera,	:ll_hora_cineracion,		:ll_minuto_cineracion,		:ll_rut_titular,		:ll_rut_fall,				:ls_nombre_fall,			:ls_pat_fall,							:ls_mat_fall,							:ldt_fecha_defuncion,		:ll_estado_gestion,		:gs_user,		:ls_obs_ceremonia,	:il_cod_parque,		:ll_cod_religion,			:ll_sw_orador,		:ll_sw_covid19,	:ll_protocolo_covid,	:ls_base,	:ls_serie,		:ll_numero,		:ll_hora_cineracion_fin,			:ll_min_cineracion_fin,			:ls_agenda_pergola,		:ldt_fecha_pergola,		:ll_hora_ini_pergola,		:ll_minuto_ini_pergola,		:ll_hora_fin_pergola,		:ll_minuto_fin_pergola,		:ls_agenda_capilla,	:ldt_fecha_capilla,		:ll_hora_ini_capilla,		:ll_minuto_ini_capilla,			:ll_hora_fin_capilla,		:ll_minuto_fin_capilla,			:ls_agenda_visualiza,		:ldt_fecha_visualiza,	:ll_hora_ini_visualiza,		:ll_min_ini_visualiza,				:ll_hora_fin_visualiza,			:ll_min_fin_visualiza,			'N',							'P'	)
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if
//					end if
					
					Messagebox("Grabar","Grabación Exitosa Agenda Pergola Ficha Cremación Folio N° "+string(il_folio))
//				else
//					rollback;
//					Messagebox("Error Grabar","Error Grabar Ficha Cremación N° "+string(il_folio)+" SQL: "+sqlca.sqlerrtext)
//				end if
			else
//				UPDATE 	"FC_AGENDA_CREMATORIO"  
//				SET 		"FECHA_CREMACION" = :ldt_fecha_ing_cinera,   
//							"HORA_CINERACION" = :ll_hora_cineracion,   
//							"MINUTO_CINERACION" = :ll_minuto_cineracion,   
//							"RUT_TITULAR" = :ll_rut_titular,   
//							"RUT_FALLECIDO" = :ll_rut_fall,   
//							"NOMBRE_FALLECIDO" = :ls_nombre_fall,   
//							"AP_PATERNO_FALLECIDO" = :ls_pat_fall,   
//							"AP_MATERNO_FALLECIDO" = :ls_mat_fall,   
//							"FECHA_DEFUNCION" = :ldt_fecha_defuncion,   
//							"ESTADO_GESTION" = :ll_estado_gestion,   
//							"OBSERVACION" = :ls_obs_ceremonia,   
//							"COD_PARQUE" = :il_cod_parque,   
//							"CODIGO_RELIGION" = :ll_cod_religion,   
//							"SW_ORADOR" = :ll_sw_orador,   
//							"SW_COVID" = :ll_sw_covid19,   
//							"SW_PROTOCOLO" = :ll_protocolo_covid,   
//							"BASE" = :ls_base,   
//							"SERIE" = :ls_serie,   
//							"NUMERO" = :ll_numero,
//							"HORA_CINERACION_FIN" = :ll_hora_cineracion_fin,
//							"MINUTO_CINERACION_FIN" = :ll_min_cineracion_fin,
//							"AGENDA_PERGOLA" = :ls_agenda_pergola,
//							"FECHA_PERGOLA" = :ldt_fecha_pergola ,
//							"HORA_INI_PERGOLA" = :ll_hora_ini_pergola,
//							"MINUTO_INI_PERGOLA" = :ll_minuto_ini_pergola,
//							"HORA_FIN_PERGOLA" = :ll_hora_fin_pergola,
//							"MINUTO_FIN_PERGOLA" = :ll_minuto_fin_pergola,
//							"AGENDA_CAPILLA" = :ls_agenda_capilla,
//							"FECHA_CAPILLA" = :ldt_fecha_capilla,
//							"HORA_INI_CAPILLA" = :ll_hora_ini_capilla,
//							"MINUTO_INI_CAPILLA" = :ll_minuto_ini_capilla,
//							"HORA_FIN_CAPILLA" = :ll_hora_fin_capilla,
//							"MINUTO_FIN_CAPILLA" = :ll_minuto_fin_capilla,
//							"AGENDA_VISUALIZA" = :ls_agenda_visualiza,
//							"FECHA_VISUALIZA" = :ldt_fecha_visualiza,
//							"HORA_INI_VISUALIZA" = :ll_hora_ini_visualiza,
//							"MINUTO_INI_VISUALIZA" = :ll_min_ini_visualiza,
//							"HORA_FIN_VISUALIZA" = :ll_hora_fin_visualiza,
//							"MINUTO_FIN_VISUALIZA" = :ll_min_fin_visualiza
//				WHERE 	"FC_AGENDA_CREMATORIO"."FOLIO_CREMATORIO" = :il_folio
//				USING	sqlca;
//				if sqlca.sqlcode=0 then
//					commit;
//					if is_uso_capilla='S' then
//						UPDATE 	"FC_AGENDA_CAPILLA"  
//						SET 		"FECHA_CREMACION" = :ldt_fecha_ing_cinera,   
//									"HORA_CINERACION" = :ll_hora_cineracion,   
//									"MINUTO_CINERACION" = :ll_minuto_cineracion,   
//									"RUT_TITULAR" = :ll_rut_titular,   
//									"RUT_FALLECIDO" = :ll_rut_fall,   
//									"NOMBRE_FALLECIDO" = :ls_nombre_fall,   
//									"AP_PATERNO_FALLECIDO" = :ls_pat_fall,   
//									"AP_MATERNO_FALLECIDO" = :ls_mat_fall,   
//									"FECHA_DEFUNCION" = :ldt_fecha_defuncion,   
//									"ESTADO_GESTION" = :ll_estado_gestion,   
//									"OBSERVACION" = :ls_obs_ceremonia,   
//									"COD_PARQUE" = :il_cod_parque,   
//									"CODIGO_RELIGION" = :ll_cod_religion,   
//									"SW_ORADOR" = :ll_sw_orador,   
//									"SW_COVID" = :ll_sw_covid19,   
//									"SW_PROTOCOLO" = :ll_protocolo_covid,   
//									"BASE" = :ls_base,   
//									"SERIE" = :ls_serie,   
//									"NUMERO" = :ll_numero,
//									"HORA_CINERACION_FIN" = :ll_hora_cineracion_fin,
//									"MINUTO_CINERACION_FIN" = :ll_min_cineracion_fin,
//									"AGENDA_PERGOLA" = :ls_agenda_pergola,
//									"FECHA_PERGOLA" = :ldt_fecha_pergola ,
//									"HORA_INI_PERGOLA" = :ll_hora_ini_pergola,
//									"MINUTO_INI_PERGOLA" = :ll_minuto_ini_pergola,
//									"HORA_FIN_PERGOLA" = :ll_hora_fin_pergola,
//									"MINUTO_FIN_PERGOLA" = :ll_minuto_fin_pergola,
//									"AGENDA_CAPILLA" = :ls_agenda_capilla,
//									"FECHA_CAPILLA" = :ldt_fecha_capilla,
//									"HORA_INI_CAPILLA" = :ll_hora_ini_capilla,
//									"MINUTO_INI_CAPILLA" = :ll_minuto_ini_capilla,
//									"HORA_FIN_CAPILLA" = :ll_hora_fin_capilla,
//									"MINUTO_FIN_CAPILLA" = :ll_minuto_fin_capilla,
//									"AGENDA_VISUALIZA" = :ls_agenda_visualiza,
//									"FECHA_VISUALIZA" = :ldt_fecha_visualiza,
//									"HORA_INI_VISUALIZA" = :ll_hora_ini_visualiza,
//									"MINUTO_INI_VISUALIZA" = :ll_min_ini_visualiza,
//									"HORA_FIN_VISUALIZA" = :ll_hora_fin_visualiza,
//									"MINUTO_FIN_VISUALIZA" = :ll_min_fin_visualiza
//						WHERE 	"FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :il_folio
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if;
//					end if
					if is_uso_pergola='S' then
						SELECT 	Count("FC_AGENDA_PERGOLA"."NOMBRE_FALLECIDO" ) 
						INTO 		:ll_count_agenda  
						FROM 	"FC_AGENDA_PERGOLA"  
						WHERE 	"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :il_folio   ;
						if ll_count_agenda=0 or isnull(ll_count_agenda) then	
							INSERT INTO "FC_AGENDA_PERGOLA"  
										( "FOLIO_CREMATORIO",  	"FECHA_CREMACION",	"HORA_CINERACION", 	"MINUTO_CINERACION", 	"RUT_TITULAR", 	"RUT_FALLECIDO", 	"NOMBRE_FALLECIDO", 	"AP_PATERNO_FALLECIDO", 	"AP_MATERNO_FALLECIDO",	"FECHA_DEFUNCION", 	"ESTADO_GESTION", 		"EJECUTIVO", 	"OBSERVACION", 		"COD_PARQUE", 	"CODIGO_RELIGION", 		"SW_ORADOR", 	"SW_COVID", 	"SW_PROTOCOLO", 	"BASE", 	"SERIE", 		"NUMERO", 		"HORA_CINERACION_FIN", 		"MINUTO_CINERACION_FIN", 	"AGENDA_PERGOLA", 		"FECHA_PERGOLA", 		"HORA_INI_PERGOLA", 	"MINUTO_INI_PERGOLA", 	"HORA_FIN_PERGOLA", 	"MINUTO_FIN_PERGOLA", 	"AGENDA_CAPILLA", 	"FECHA_CAPILLA", 	"HORA_INI_CAPILLA", 	"MINUTO_INI_CAPILLA", 		"HORA_FIN_CAPILLA", 	"MINUTO_FIN_CAPILLA",		"AGENDA_VISUALIZA", 	"FECHA_VISUALIZA", 	"HORA_INI_VISUALIZA", 	"MINUTO_INI_VISUALIZA", 		"HORA_FIN_VISUALIZA", 	"MINUTO_FIN_VISUALIZA",	"AGENDA_EXTERNA",		"ESTADO_REG"  )  
							VALUES 	( :il_folio,   						:ldt_fecha_ing_cinera,	:ll_hora_cineracion,		:ll_minuto_cineracion,		:ll_rut_titular,		:ll_rut_fall,				:ls_nombre_fall,			:ls_pat_fall,							:ls_mat_fall,							:ldt_fecha_defuncion,		:ll_estado_gestion,		:gs_user,		:ls_obs_ceremonia,	:il_cod_parque,		:ll_cod_religion,			:ll_sw_orador,		:ll_sw_covid19,	:ll_protocolo_covid,	:ls_base,	:ls_serie,		:ll_numero,		:ll_hora_cineracion_fin,			:ll_min_cineracion_fin,			:ls_agenda_pergola,		:ldt_fecha_pergola,		:ll_hora_ini_pergola,		:ll_minuto_ini_pergola,		:ll_hora_fin_pergola,		:ll_minuto_fin_pergola,		:ls_agenda_capilla,	:ldt_fecha_capilla,		:ll_hora_ini_capilla,		:ll_minuto_ini_capilla,			:ll_hora_fin_capilla,		:ll_minuto_fin_capilla,			:ls_agenda_visualiza,		:ldt_fecha_visualiza,	:ll_hora_ini_visualiza,		:ll_min_ini_visualiza,				:ll_hora_fin_visualiza,			:ll_min_fin_visualiza,			'N',							'P'	)
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						else
							UPDATE 	"FC_AGENDA_PERGOLA"  
							SET 		"FECHA_CREMACION" = :ldt_fecha_ing_cinera,   
										"HORA_CINERACION" = :ll_hora_cineracion,   
										"MINUTO_CINERACION" = :ll_minuto_cineracion,   
										"RUT_TITULAR" = :ll_rut_titular,   
										"RUT_FALLECIDO" = :ll_rut_fall,   
										"NOMBRE_FALLECIDO" = :ls_nombre_fall,   
										"AP_PATERNO_FALLECIDO" = :ls_pat_fall,   
										"AP_MATERNO_FALLECIDO" = :ls_mat_fall,   
										"FECHA_DEFUNCION" = :ldt_fecha_defuncion,   
										"ESTADO_GESTION" = :ll_estado_gestion,   
										"OBSERVACION" = :ls_obs_ceremonia,   
										"COD_PARQUE" = :il_cod_parque,   
										"CODIGO_RELIGION" = :ll_cod_religion,   
										"SW_ORADOR" = :ll_sw_orador,   
										"SW_COVID" = :ll_sw_covid19,   
										"SW_PROTOCOLO" = :ll_protocolo_covid,   
										"BASE" = :ls_base,   
										"SERIE" = :ls_serie,   
										"NUMERO" = :ll_numero,
										"HORA_CINERACION_FIN" = :ll_hora_cineracion_fin,
										"MINUTO_CINERACION_FIN" = :ll_min_cineracion_fin,
										"AGENDA_PERGOLA" = :ls_agenda_pergola,
										"FECHA_PERGOLA" = :ldt_fecha_pergola ,
										"HORA_INI_PERGOLA" = :ll_hora_ini_pergola,
										"MINUTO_INI_PERGOLA" = :ll_minuto_ini_pergola,
										"HORA_FIN_PERGOLA" = :ll_hora_fin_pergola,
										"MINUTO_FIN_PERGOLA" = :ll_minuto_fin_pergola,
										"AGENDA_CAPILLA" = :ls_agenda_capilla,
										"FECHA_CAPILLA" = :ldt_fecha_capilla,
										"HORA_INI_CAPILLA" = :ll_hora_ini_capilla,
										"MINUTO_INI_CAPILLA" = :ll_minuto_ini_capilla,
										"HORA_FIN_CAPILLA" = :ll_hora_fin_capilla,
										"MINUTO_FIN_CAPILLA" = :ll_minuto_fin_capilla,
										"AGENDA_VISUALIZA" = :ls_agenda_visualiza,
										"FECHA_VISUALIZA" = :ldt_fecha_visualiza,
										"HORA_INI_VISUALIZA" = :ll_hora_ini_visualiza,
										"MINUTO_INI_VISUALIZA" = :ll_min_ini_visualiza,
										"HORA_FIN_VISUALIZA" = :ll_hora_fin_visualiza,
										"MINUTO_FIN_VISUALIZA" = :ll_min_fin_visualiza
							WHERE 	"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :il_folio
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if;
						end if
					end if
//					if is_uso_visualiza='S' then
//						UPDATE 	"FC_AGENDA_VISUALIZA"  
//						SET 		"FECHA_CREMACION" = :ldt_fecha_ing_cinera,   
//									"HORA_CINERACION" = :ll_hora_cineracion,   
//									"MINUTO_CINERACION" = :ll_minuto_cineracion,   
//									"RUT_TITULAR" = :ll_rut_titular,   
//									"RUT_FALLECIDO" = :ll_rut_fall,   
//									"NOMBRE_FALLECIDO" = :ls_nombre_fall,   
//									"AP_PATERNO_FALLECIDO" = :ls_pat_fall,   
//									"AP_MATERNO_FALLECIDO" = :ls_mat_fall,   
//									"FECHA_DEFUNCION" = :ldt_fecha_defuncion,   
//									"ESTADO_GESTION" = :ll_estado_gestion,   
//									"OBSERVACION" = :ls_obs_ceremonia,   
//									"COD_PARQUE" = :il_cod_parque,   
//									"CODIGO_RELIGION" = :ll_cod_religion,   
//									"SW_ORADOR" = :ll_sw_orador,   
//									"SW_COVID" = :ll_sw_covid19,   
//									"SW_PROTOCOLO" = :ll_protocolo_covid,   
//									"BASE" = :ls_base,   
//									"SERIE" = :ls_serie,   
//									"NUMERO" = :ll_numero,
//									"HORA_CINERACION_FIN" = :ll_hora_cineracion_fin,
//									"MINUTO_CINERACION_FIN" = :ll_min_cineracion_fin,
//									"AGENDA_PERGOLA" = :ls_agenda_pergola,
//									"FECHA_PERGOLA" = :ldt_fecha_pergola ,
//									"HORA_INI_PERGOLA" = :ll_hora_ini_pergola,
//									"MINUTO_INI_PERGOLA" = :ll_minuto_ini_pergola,
//									"HORA_FIN_PERGOLA" = :ll_hora_fin_pergola,
//									"MINUTO_FIN_PERGOLA" = :ll_minuto_fin_pergola,
//									"AGENDA_CAPILLA" = :ls_agenda_capilla,
//									"FECHA_CAPILLA" = :ldt_fecha_capilla,
//									"HORA_INI_CAPILLA" = :ll_hora_ini_capilla,
//									"MINUTO_INI_CAPILLA" = :ll_minuto_ini_capilla,
//									"HORA_FIN_CAPILLA" = :ll_hora_fin_capilla,
//									"MINUTO_FIN_CAPILLA" = :ll_minuto_fin_capilla,
//									"AGENDA_VISUALIZA" = :ls_agenda_visualiza,
//									"FECHA_VISUALIZA" = :ldt_fecha_visualiza,
//									"HORA_INI_VISUALIZA" = :ll_hora_ini_visualiza,
//									"MINUTO_INI_VISUALIZA" = :ll_min_ini_visualiza,
//									"HORA_FIN_VISUALIZA" = :ll_hora_fin_visualiza,
//									"MINUTO_FIN_VISUALIZA" = :ll_min_fin_visualiza
//						WHERE 	"FC_AGENDA_VISUALIZA"."FOLIO_CREMATORIO" = :il_folio
//						USING	sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if;
//					end if
					Messagebox("Actualizar","Grabación Exitosa Agenda Ficha cremación Folio N° "+string(il_folio))
//				else
//					rollback;
//					Messagebox("Error Actualizar","Error Actualizar Ficha Cremación N° "+string(il_folio)+" SQL: "+sqlca.sqlerrtext)
//				end if;
			end if
			if isvalid(w_ficha_crematorio) then
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_cineracion',idt_fecha_cremacion)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_cineracion',ll_hora_sel)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_cineracion',ll_min_sel)
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.accepttext()
				if w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.update()=1 then
					commit;
				else
					rollback;
				end if
				
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'visualizar_servicio',ls_agenda_visualiza)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla',ls_agenda_capilla)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_fecha_capilla)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',ll_hora_ini_capilla)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',ll_minuto_ini_capilla)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola',ls_agenda_pergola)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_fecha_pergola)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',ll_hora_ini_pergola)
				w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',ll_minuto_ini_pergola)
				if w_ficha_crematorio.tab_crematorio.tabpage_8.dw_cenizas.update() = 1 then
					commit;
				else
					rollback;
				end if
				
	//			messagebox("Advertencia","Recuerde Grabar Ficha de Cremación, Se Actualizó Horario de Cremación")
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setfocus()
				w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setcolumn('rut_titular')
			end if
			close(w_lista_pergola)
		end if
	else
		messagebox("Advertencia","No es Posible Asignar Hora Crematorio")
	end if
else
	ll_fila			= dw_lista.getrow()
	ls_nom1		= dw_lista.getitemstring(ll_fila,'nombre')
	ll_hora_ini	= dw_lista.getitemnumber(ll_fila,'hora')
	ll_min_ini	= dw_lista.getitemnumber(ll_fila,'minuto')
	ls_nom2		= dw_lista.getitemstring(ll_fila+1,'nombre')
	ls_nom3		= dw_lista.getitemstring(ll_fila+2,'nombre')
	ll_hora_fin	= dw_lista.getitemnumber(ll_fila+2,'hora')
	ll_min_fin	= dw_lista.getitemnumber(ll_fila+2,'minuto')
	ll_rut_fall		= dw_lista.getitemnumber(ll_fila,'rut_fallecido')
	if isnull(ll_rut_fall) then ll_rut_fall=0
	if isnull(ls_nom1) and isnull(ls_nom2) and isnull(ls_nom3) then
		if isvalid(w_agenda_crematorio_individual) then close(w_agenda_crematorio_individual)
		ls_string								= string(ldt_fec_ini)+'~t'+string(ll_hora_ini)+'~t'+string(ll_min_ini)+'~t'+string(ll_hora_fin)+'~t'+string(ll_min_fin)+'~t'+string(ll_rut_fall)+'~t'+'P'
		OpenWithParm(w_agenda_crematorio_individual, ls_string)
	else
		messagebox("Advertencia","No es Posible Agendar Crematorio, Horario No Disponible")
	end if
end if
end event

type cb_cerrar from commandbutton within w_lista_pergola
integer x = 3264
integer y = 2136
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

event clicked;close(w_lista_pergola)
end event

type dw_lista from datawindow within w_lista_pergola
integer x = 41
integer y = 164
integer width = 3525
integer height = 1928
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_resumen_horario_crematorio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String		ls_ag_externa
if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_ag_externa				= dw_lista.getitemstring(il_row,'agenda_externa')
	if ls_ag_externa='S' then
		cb_inactivar.enabled	= true
	else
		cb_inactivar.enabled	= false
	end if
end if
end event

event rowfocuschanged;String		ls_ag_externa

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_ag_externa				= dw_lista.getitemstring(il_row,'agenda_externa')
	if ls_ag_externa='S' then
		cb_inactivar.enabled	= true
	else
		cb_inactivar.enabled	= false
	end if
end if
end event

event doubleclicked;String		ls_nom1,ls_ag_ex,ls_string
Long		ll_hora_ini,ll_min_ini,ll_hora_fin,ll_min_fin
Double	ll_rut_fall
datetime	ldt_fec_ini

if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_nom1		= dw_lista.getitemstring(il_row,'nombre')
	ll_hora_ini	= dw_lista.getitemnumber(il_row,'hora')
	ll_min_ini	= dw_lista.getitemnumber(il_row,'minuto')
	ll_hora_fin	= dw_lista.getitemnumber(il_row,'hora')
	ll_min_fin	= dw_lista.getitemnumber(il_row,'minuto')
	ll_rut_fall		= dw_lista.getitemnumber(il_row,'rut_fallecido')
	ls_ag_ex		= dw_lista.getitemstring(il_row,'agenda_externa')
	ldt_fec_ini	= datetime(date(dp_fecha.text),time('00:00:00'))
	if isnull(ll_rut_fall) then ll_rut_fall=0
	if ls_ag_ex = 'S' then
		if not isnull(ls_nom1) then
			if isvalid(w_agenda_crematorio_individual) then close(w_agenda_crematorio_individual)
			ls_string								= string(ldt_fec_ini)+'~t'+string(ll_hora_ini)+'~t'+string(ll_min_ini)+'~t'+string(ll_hora_fin)+'~t'+string(ll_min_fin)+'~t'+string(ll_rut_fall)+'~t'+'P'
			OpenWithParm(w_agenda_crematorio_individual, ls_string)
		else
			messagebox("Advertencia","No es Posible Agendar Crematorio, Horario No Disponible")
		end if
	else
		messagebox("Advertencia","Esta Opción es Posible Solo para Agendas Crematorio Externo")
	end if
	
	
end if
end event

type gb_1 from groupbox within w_lista_pergola
integer x = 1527
integer y = 2088
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

