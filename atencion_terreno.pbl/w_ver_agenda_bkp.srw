forward
global type w_ver_agenda_bkp from window
end type
type pb_buscar from picturebutton within w_ver_agenda_bkp
end type
type em_ctto from editmask within w_ver_agenda_bkp
end type
type st_3 from statictext within w_ver_agenda_bkp
end type
type dw_evaluacion from datawindow within w_ver_agenda_bkp
end type
type dw_notificacion from datawindow within w_ver_agenda_bkp
end type
type dw_ruta from datawindow within w_ver_agenda_bkp
end type
type cb_ruta from commandbutton within w_ver_agenda_bkp
end type
type cb_grabar_formula from commandbutton within w_ver_agenda_bkp
end type
type cb_geo from commandbutton within w_ver_agenda_bkp
end type
type cb_historico from commandbutton within w_ver_agenda_bkp
end type
type cb_ctacte from commandbutton within w_ver_agenda_bkp
end type
type cb_imprimir from commandbutton within w_ver_agenda_bkp
end type
type cb_exportar from commandbutton within w_ver_agenda_bkp
end type
type cb_filtrar from commandbutton within w_ver_agenda_bkp
end type
type cb_ordenar from commandbutton within w_ver_agenda_bkp
end type
type st_1 from statictext within w_ver_agenda_bkp
end type
type st_2 from statictext within w_ver_agenda_bkp
end type
type em_fec_ini from editmask within w_ver_agenda_bkp
end type
type em_fec_fin from editmask within w_ver_agenda_bkp
end type
type pb_aceptar from picturebutton within w_ver_agenda_bkp
end type
type p_1 from picture within w_ver_agenda_bkp
end type
type p_2 from picture within w_ver_agenda_bkp
end type
type cb_cerrar from commandbutton within w_ver_agenda_bkp
end type
type dw_lista from datawindow within w_ver_agenda_bkp
end type
type gb_1 from groupbox within w_ver_agenda_bkp
end type
end forward

global type w_ver_agenda_bkp from window
integer width = 3497
integer height = 1964
boolean titlebar = true
string title = "Ver Agenda"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_buscar pb_buscar
em_ctto em_ctto
st_3 st_3
dw_evaluacion dw_evaluacion
dw_notificacion dw_notificacion
dw_ruta dw_ruta
cb_ruta cb_ruta
cb_grabar_formula cb_grabar_formula
cb_geo cb_geo
cb_historico cb_historico
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
st_1 st_1
st_2 st_2
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
pb_aceptar pb_aceptar
p_1 p_1
p_2 p_2
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_ver_agenda_bkp w_ver_agenda_bkp

type variables
String		is_opcion,is_estado
Long		il_row
end variables

forward prototypes
public function string wf_fecha_palabra (date ad_fecha)
end prototypes

public function string wf_fecha_palabra (date ad_fecha);string	ls_fec_comp,ls_fecha
Long		ll_dia_fec,ll_mes_fec,ll_anno_fec
ls_fecha							= string(ad_fecha,"dd/mm/yyyy")
CHOOSE CASE UPPER(DayName(date(ls_fecha)))
	CASE 'LUNES','MONDAY'
		ls_fec_comp				= 'Lunes'
	CASE 'MARTES','TUESDAY'
		ls_fec_comp				= 'Martes'
	CASE 'MIERCOLES','WEDNESDAY'
		ls_fec_comp				= 'Miércoles'
	CASE 'JUEVES','THURSDAY'
		ls_fec_comp				= 'Jueves'
	CASE 'VIERNES','FRIDAY'
		ls_fec_comp				= 'Viernes'
	CASE 'SABADO','SATURDAY'
		ls_fec_comp				= 'Sábado'
	CASE 'DOMINGO','SUNDAY'
		ls_fec_comp				= 'Domingo'
END CHOOSE
ll_dia_fec						= day(ad_fecha)
ll_mes_fec						= month(ad_fecha)
ll_anno_fec						= year(ad_fecha)
if ll_mes_fec=1 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Enero de '+string(ll_anno_fec)
elseif ll_mes_fec=2 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Febrero de '+string(ll_anno_fec)
elseif ll_mes_fec=3 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Marzo de '+string(ll_anno_fec)
elseif ll_mes_fec=4 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Abril de '+string(ll_anno_fec)
elseif ll_mes_fec=5 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Mayo de '+string(ll_anno_fec)
elseif ll_mes_fec=6 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Junio de '+string(ll_anno_fec)
elseif ll_mes_fec=7 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Julio de '+string(ll_anno_fec)
elseif ll_mes_fec=8 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Agosto de '+string(ll_anno_fec)
elseif ll_mes_fec=9 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Septiembre de '+string(ll_anno_fec)
elseif ll_mes_fec=10 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Octubre de '+string(ll_anno_fec)
elseif ll_mes_fec=11 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Noviembre de '+string(ll_anno_fec)
elseif ll_mes_fec=12 then
	ls_fec_comp					= ls_fec_comp+', '+string(ll_dia_fec)+' de Diciembre de '+string(ll_anno_fec)
end if
Return ls_fec_comp
end function

on w_ver_agenda_bkp.create
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_3=create st_3
this.dw_evaluacion=create dw_evaluacion
this.dw_notificacion=create dw_notificacion
this.dw_ruta=create dw_ruta
this.cb_ruta=create cb_ruta
this.cb_grabar_formula=create cb_grabar_formula
this.cb_geo=create cb_geo
this.cb_historico=create cb_historico
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.st_1=create st_1
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.pb_aceptar=create pb_aceptar
this.p_1=create p_1
this.p_2=create p_2
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_buscar,&
this.em_ctto,&
this.st_3,&
this.dw_evaluacion,&
this.dw_notificacion,&
this.dw_ruta,&
this.cb_ruta,&
this.cb_grabar_formula,&
this.cb_geo,&
this.cb_historico,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.st_1,&
this.st_2,&
this.em_fec_ini,&
this.em_fec_fin,&
this.pb_aceptar,&
this.p_1,&
this.p_2,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_ver_agenda_bkp.destroy
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_3)
destroy(this.dw_evaluacion)
destroy(this.dw_notificacion)
destroy(this.dw_ruta)
destroy(this.cb_ruta)
destroy(this.cb_grabar_formula)
destroy(this.cb_geo)
destroy(this.cb_historico)
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.pb_aceptar)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;String	ls_usuario,ls_nombre,ls_titulo
gf_centrar(w_ver_agenda)
dw_ruta.settransobject(sqlca)
dw_notificacion.settransobject(sqlca)
dw_evaluacion.settransobject(sqlca)
connect using Trans_1;
is_opcion										= Message.StringParm
SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"
INTO 		:ls_usuario
FROM 		"SOL_PERMISOS_USUARIO"  
WHERE  ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'AT' ) AND  
		 ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING		sqlca;
if sqlca.sqlcode=0 or gs_depto='I' then
	if is_opcion='T' then
		ls_titulo	= 'Ver Agenda Telefónica por Rango de Fecha'
	elseif is_opcion='V' then
		ls_titulo	= 'Ver Agenda Visita Terreno por Rango de Fecha'
	end if
else
	ls_usuario	= gs_user
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if is_opcion='T' then
			ls_titulo	= 'Ver Agenda Telefónica por Rango de Fecha  Ejecutivo:  '+ls_nombre
		elseif is_opcion='V' then
			ls_titulo	= 'Ver Agenda Visita Terreno por Rango de Fecha  Ejecutivo:  '+ls_nombre
		end if
	end if
end if
CHOOSE CASE is_opcion
	CASE 'T' //Telefono
		dw_lista.dataobject					= 'dw_lista_agenda_telefonica'
//		dw_lista_estado.dataobject			= 'dw_ayuda_lista_estado_cobranza'
	CASE 'V' //Visita Terreno
		dw_lista.dataobject					= 'dw_lista_agenda_visita_terreno'
//		dw_lista_estado.dataobject			= 'dw_ayuda_estado_cobranza_postventa'
END CHOOSE
this.title										= ls_titulo
dw_lista.settransobject(sqlca)
em_fec_ini.text								= string(date(gdt_fec_sistema),"dd/mm/yyyy")
em_fec_fin.text								= string(date(gdt_fec_sistema),"dd/mm/yyyy")
em_fec_ini.setfocus()

end event

event close;disconnect using Trans_1;
end event

type pb_buscar from picturebutton within w_ver_agenda_bkp
integer x = 2839
integer y = 1752
integer width = 110
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
Double	ll_numero
ll_numero							= Double(em_ctto.text)
ll_tot_reg							= dw_lista.rowcount()
if ll_numero>0 and ll_tot_reg>0 then
	ls_string							= "at_gestion_numero = "+string(ll_numero)
	ll_fila 								= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
		dw_lista.setitem(ll_fila,'estado_reg',1)
		dw_lista.accepttext()
	else
		messagebox("Advertencia","Nº Contrato No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
end if

end event

type em_ctto from editmask within w_ver_agenda_bkp
integer x = 2400
integer y = 1752
integer width = 425
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_3 from statictext within w_ver_agenda_bkp
integer x = 2098
integer y = 1768
integer width = 293
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Ctto:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_evaluacion from datawindow within w_ver_agenda_bkp
boolean visible = false
integer x = 1865
integer y = 1864
integer width = 411
integer height = 432
integer taborder = 80
string dataobject = "dw_imprimir_evaluacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_notificacion from datawindow within w_ver_agenda_bkp
boolean visible = false
integer x = 2368
integer y = 1872
integer width = 411
integer height = 432
integer taborder = 80
string title = "none"
string dataobject = "dw_imprimir_notificacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_ruta from datawindow within w_ver_agenda_bkp
boolean visible = false
integer x = 2843
integer y = 1868
integer width = 411
integer height = 432
integer taborder = 70
string dataobject = "dw_imprimir_ruta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ruta from commandbutton within w_ver_agenda_bkp
integer x = 1719
integer y = 1752
integer width = 338
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir &Ruta"
end type

event clicked;Long		ll_rut,ll_indi,ll_tot_reg,ll_new,ll_cod_parque,ll_cod_par_not,&
			ll_new_not,ll_new_eva,ll_estado,ll_pasa,ll_fila
String	ls_base,ls_serie,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_dir,ls_nro_p,&
			ls_depto_p,ls_block_p,ls_pob,ls_sec,ls_fono_p,&
			ls_fono_c,ls_nom_comp,ls_dir_comp,ls_descrip_comuna,ls_fec_palabra,&
			ls_nom_usuario,ls_tipo_via_descrip,ls_area,ls_sector,ls_sepultura,ls_glosa_tele,&
			ls_glosa_pub,ls_celular
Date		ld_fecha_hoy
Double	ll_numero
SetPointer(HourGlass!)
ll_pasa										= 0
ll_tot_reg									= dw_lista.rowcount()
ll_fila 											= dw_lista.Find("estado_reg = 0", 1, ll_tot_reg)
if ll_fila>0 then
	dw_ruta.reset()
	dw_notificacion.reset()
	dw_evaluacion.reset()
	if ll_tot_reg>0 then
		ld_fecha_hoy						= date(gdt_fec_sistema)
		ls_fec_palabra						= wf_fecha_palabra(ld_fecha_hoy)
		ll_cod_parque						= dw_lista.getitemnumber(1,'cadena_cod_parque')
		SELECT	"ENCARGADOS"."NOMBRE"  
		INTO 		:ls_nom_usuario  
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
		for ll_indi=1 to ll_tot_reg
			ll_estado							= dw_lista.getitemnumber(ll_indi,'estado_reg')
			if ll_estado=0 then
				ls_base						= dw_lista.getitemstring(ll_indi,'at_gestion_base')
				ls_serie						= dw_lista.getitemstring(ll_indi,'at_gestion_serie')
				ll_numero					= dw_lista.getitemnumber(ll_indi,'at_gestion_numero')
				ll_rut							= dw_lista.getitemnumber(ll_indi,'at_gestion_rut_cliente')
				ll_cod_par_not				= dw_lista.getitemnumber(ll_indi,'cadena_cod_parque')
				
				SELECT	"CLIENTE"."DV",
							"CLIENTE"."NOMBRE",
							"CLIENTE"."A_PATERNO",
							"CLIENTE"."A_MATERNO",
							"TIPO_VIA"."DESCRIPCION",
							"CLIENTE"."DIRECCION_P",
							"CLIENTE"."NUMERO_PARTICULAR",
							"CLIENTE"."DEPTO_PARTICULAR",
							"CLIENTE"."BLOCK_PARTICULAR",
							"CLIENTE"."POBLACION",	
							"CLIENTE"."SECTOR",
							"CLIENTE"."FONO_P",
							"CLIENTE"."FONO_C",
							"COMUNA"."SIGLA_COMUNA",	
							(	SELECT 	"BASE_PLANI"."AREA" FROM "BASE_PLANI" 	WHERE	"INVENTARIO_PLANI"."SECTOR" = "BASE_PLANI"."SECTOR" AND "INVENTARIO_PLANI"."COD_PARQUE" = "BASE_PLANI"."COD_PARQUE" ),
							"INVENTARIO_PLANI"."SECTOR",
							"INVENTARIO_PLANI"."SEPULTURA",
							"CLIENTE"."CELULAR"
				INTO 		:ls_dv,				:ls_nom,					:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via_descrip,				:ls_dir,							:ls_nro_p,									:ls_depto_p,								:ls_block_p,								:ls_pob,						:ls_sec,					:ls_fono_p,				:ls_fono_c,				:ls_descrip_comuna,				
							:ls_area,
							:ls_sector,							:ls_sepultura,							:ls_celular
				FROM 	"AT_GESTION",	"CLIENTE",	"COMUNA",	"TIPO_VIA",	"CADENA",	"INVENTARIO_PLANI"
				WHERE	"AT_GESTION"."BASE" = "CADENA"."CODIGO" and  
							"AT_GESTION"."SERIE" = "CADENA"."SERIE" and  
							"AT_GESTION"."NUMERO" = "CADENA"."NUMERO" and 
							
							"CADENA"."RUT" = "CLIENTE"."RUT" and  
							"CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" and  
							"CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" and  
							 
							( cadena.codigo = inventario_plani.base (+)) and  
							( cadena.serie = inventario_plani.serie (+)) and  
							( cadena.numero = inventario_plani.numero (+)) and  
							( cadena.cod_parque = inventario_plani.cod_parque (+)) and  
							
							"AT_GESTION"."BASE" = :ls_base AND  
							"AT_GESTION"."SERIE" = :ls_serie AND  
							"AT_GESTION"."NUMERO" = :ll_numero   
				USING	Trans_1;
//				elseif ls_base='A' then
//					SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C",	"COMUNA"."SIGLA_COMUNA",	'',			'',				'',					"CLIENTE"."CELULAR"
//					INTO 		:ls_dv,				:ls_nom,					:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via_descrip,				:ls_dir,							:ls_nro_p,									:ls_depto_p,								:ls_block_p,								:ls_pob,						:ls_sec,					:ls_fono_p,				:ls_fono_c,				:ls_descrip_comuna,				:ls_area,	:ls_sector,	:ls_sepultura,	:ls_celular
//					FROM 	"AT_GESTION",	"CLIENTE",	"COMUNA",	"TIPO_VIA",	"ANEXO_AUMENTO",	"PAGO_AUMENTO"
//					WHERE	"AT_GESTION"."RUT_CLIENTE" = "CLIENTE"."RUT" and  
//								"CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" and  
//								"CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" and  
//								"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
//							 	"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
//								"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
//							 	"AT_GESTION"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" and  
//							 	"AT_GESTION"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" and  
//							 	"AT_GESTION"."BASE" = :ls_base AND  
//							 	"AT_GESTION"."SERIE" = :ls_serie AND  
//							 	"AT_GESTION"."NUMERO" = :ll_numero   
//					USING	Trans_1;
//				elseif ls_base='L' then
//					SELECT	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."FONO_P",	"CLIENTE"."FONO_C",	"COMUNA"."SIGLA_COMUNA",	'',			'',				'',					"CLIENTE"."CELULAR"
//					INTO 		:ls_dv,				:ls_nom,					:ls_ap_pat,						:ls_ap_mat,						:ls_tipo_via_descrip,				:ls_dir,							:ls_nro_p,									:ls_depto_p,								:ls_block_p,								:ls_pob,						:ls_sec,					:ls_fono_p,				:ls_fono_c,				:ls_descrip_comuna,				:ls_area,	:ls_sector,	:ls_sepultura,	:ls_celular
//					FROM 	"AT_GESTION",	"CLIENTE",	"COMUNA",	"TIPO_VIA",	"ANEXO_LIBERADOR",	"PAGO_LIBERADOR"
//					WHERE	"AT_GESTION"."RUT_CLIENTE" = "CLIENTE"."RUT" and  
//								"CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" and  
//								"CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" and  
//								"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and  
//							 	"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
//								"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" and  
//							 	"AT_GESTION"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" and  
//							 	"AT_GESTION"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" and  
//							 	"AT_GESTION"."BASE" = :ls_base AND  
//							 	"AT_GESTION"."SERIE" = :ls_serie AND  
//							 	"AT_GESTION"."NUMERO" = :ll_numero   
//					USING	Trans_1;	
//				end if
				if Trans_1.sqlcode=0 then
					ll_pasa ++
					ll_new	= dw_ruta.insertrow(0)
					dw_ruta.scrolltorow(ll_new)
					dw_ruta.setitem(ll_new,'base',ls_base)
					dw_ruta.setitem(ll_new,'serie',ls_serie)
					dw_ruta.setitem(ll_new,'numero',ll_numero)
					ls_nom_comp	= trim(ls_nom)+' '+trim(ls_ap_pat)+' '+trim(ls_ap_mat)
					dw_ruta.setitem(ll_new,'nombre',ls_nom_comp)
					ls_dir_comp	= trim(ls_tipo_via_descrip)+' '+trim(ls_dir)+' Nº: '+trim(ls_nro_p)
					if not isnull(ls_depto_p) and ls_depto_p<>'-' then
						ls_dir_comp	= ls_dir_comp + ' D:/ '+trim(ls_depto_p)
					end if
					if not isnull(ls_block_p) and ls_block_p<>'-' then
						ls_dir_comp	= ls_dir_comp + ' B:/ '+trim(ls_block_p)
					end if
					if not isnull(ls_descrip_comuna) and ls_descrip_comuna<>'-' and ls_descrip_comuna<>'0' then
						ls_dir_comp	= ls_dir_comp + ', COMUNA: '+trim(ls_descrip_comuna)
					end if
					if not isnull(ls_pob) and ls_pob<>'-' then
						ls_dir_comp	= ls_dir_comp + ', POBL.: '+trim(ls_pob)
					end if
					if not isnull(ls_sec) and ls_sec<>'-' then
						ls_dir_comp	= ls_dir_comp + ', SECTOR: '+trim(ls_sec)
					end if
					dw_ruta.setitem(ll_new,'direccion_particular',UPPER(ls_dir_comp))
					dw_ruta.setitem(ll_new,'fono_p',ls_fono_p)
					dw_ruta.setitem(ll_new,'fono_c',ls_fono_c)
					dw_ruta.setitem(ll_new,'celular',ls_celular)
					dw_ruta.setitem(ll_new,'fecha_impresion',ls_fec_palabra)
					dw_ruta.setitem(ll_new,'ejecutivo',ls_nom_usuario)
					dw_ruta.setitem(ll_new,'cod_parque',ll_cod_parque)
					dw_ruta.setitem(ll_new,'area',ls_area)
					dw_ruta.setitem(ll_new,'sector',ls_sector)
					dw_ruta.setitem(ll_new,'sepultura',ls_sepultura)
					SELECT	"TELE_LOG"."GLOSA"  
					INTO 		:ls_glosa_tele  
					FROM 	"TELE_LOG"  
					WHERE	"TELE_LOG"."BASE" = :ls_base AND  
							 	"TELE_LOG"."SERIE" = :ls_serie AND  
							 	"TELE_LOG"."NUMERO" = :ll_numero AND  
							 	"TELE_LOG"."USUARIO" = :gs_user AND  
							 	"TELE_LOG"."FECHA" =	(	SELECT	MAX("TELE_LOG"."FECHA") 
																	FROM 	"TELE_LOG" 
																	WHERE	"TELE_LOG"."BASE" = :ls_base AND 
																		 		"TELE_LOG"."SERIE" = :ls_serie AND 
																		 		"TELE_LOG"."NUMERO" = :ll_numero AND 
																		 		"TELE_LOG"."USUARIO" = :gs_user )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_ruta.setitem(ll_new,'ult_glosa_tele',ls_glosa_tele)
					end if
					SELECT	"ATENCION_LOG"."GLOSA"  
					INTO 		:ls_glosa_pub  
					FROM 	"ATENCION_LOG"  
					WHERE	"ATENCION_LOG"."BASE" = :ls_base AND  
								"ATENCION_LOG"."SERIE" = :ls_serie AND  
							 	"ATENCION_LOG"."NUMERO" = :ll_numero AND  
							 	"ATENCION_LOG"."USUARIO" = :gs_user AND  
							 	"ATENCION_LOG"."FECHA" = (	SELECT 	MAX("ATENCION_LOG"."FECHA") 
																		FROM 	"ATENCION_LOG" 
																		WHERE	"ATENCION_LOG"."BASE" = :ls_base AND 
																			 		"ATENCION_LOG"."SERIE" = :ls_serie AND 
																			 		"ATENCION_LOG"."NUMERO" = :ll_numero AND 
																			 		"ATENCION_LOG"."USUARIO" = :gs_user )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						dw_ruta.setitem(ll_new,'ult_glosa_pub',ls_glosa_pub)
					end if				
					ll_new_not	= dw_notificacion.insertrow(0)
					dw_notificacion.scrolltorow(ll_new_not)
					dw_notificacion.setitem(ll_new_not,'base',ls_base)
					dw_notificacion.setitem(ll_new_not,'serie',ls_serie)
					dw_notificacion.setitem(ll_new_not,'numero',ll_numero)
					dw_notificacion.setitem(ll_new_not,'nombre',ls_nom_comp)
					dw_notificacion.setitem(ll_new_not,'direccion_particular',ls_dir_comp)
					dw_notificacion.setitem(ll_new_not,'fono_p',ls_fono_p)
					dw_notificacion.setitem(ll_new_not,'fono_c',ls_fono_c)
					dw_notificacion.setitem(ll_new_not,'fecha_impresion',ls_fec_palabra)
					dw_notificacion.setitem(ll_new_not,'ejecutivo',ls_nom_usuario)
					dw_notificacion.setitem(ll_new_not,'cod_parque',ll_cod_par_not)
					dw_notificacion.setitem(ll_new_not,'rut',ll_rut)
					dw_notificacion.setitem(ll_new_not,'dv',ls_dv)
					
					ll_new_eva	= dw_evaluacion.insertrow(0)
					dw_evaluacion.scrolltorow(ll_new_eva)
					dw_evaluacion.setitem(ll_new_eva,'base',ls_base)
					dw_evaluacion.setitem(ll_new_eva,'serie',ls_serie)
					dw_evaluacion.setitem(ll_new_eva,'numero',ll_numero)
					dw_evaluacion.setitem(ll_new_eva,'nombre',ls_nom_comp)
					dw_evaluacion.setitem(ll_new_eva,'direccion_particular',ls_dir_comp)
					dw_evaluacion.setitem(ll_new_eva,'fono_p',ls_fono_p)
					dw_evaluacion.setitem(ll_new_eva,'fono_c',ls_fono_c)
					dw_evaluacion.setitem(ll_new_eva,'fecha_impresion',ls_fec_palabra)
					dw_evaluacion.setitem(ll_new_eva,'ejecutivo',ls_nom_usuario)
					dw_evaluacion.setitem(ll_new_eva,'cod_parque',ll_cod_par_not)
					dw_evaluacion.setitem(ll_new_eva,'rut',ll_rut)
					dw_evaluacion.setitem(ll_new_eva,'dv',ls_dv)
				end if
			end if
		next
		dw_ruta.accepttext()
		dw_notificacion.accepttext()
		dw_evaluacion.accepttext()
		if dw_ruta.rowcount()>0 and ll_pasa>0 then
			f_Print( dw_ruta )
//			f_printdlg(dw_ruta,gstr_print,parent)
			dw_notificacion.print()
			dw_evaluacion.print()
		end if
	else
		messagebox("Advertencia","No Registra Dato")
	end if
else
	messagebox("Advertencia","Debe Marcar Contrato Para Imprimir Ruta")
end if
SetPointer(Arrow!)
end event

type cb_grabar_formula from commandbutton within w_ver_agenda_bkp
event ue_mousemove pbm_mousemove
integer x = 2734
integer y = 52
integer width = 695
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar/Gra&bar Formula"
end type

event clicked;if isvalid(w_formulas) then close(w_formulas)
open(w_formulas)
end event

type cb_geo from commandbutton within w_ver_agenda_bkp
integer x = 1431
integer y = 1752
integer width = 256
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Geo-Ref."
end type

event clicked;long ret
Inet  iinet_base
if dw_lista.rowcount()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie		= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	is_estado	= dw_lista.getitemstring(il_row, 'at_gestion_estado_gestion')
	ret = GetContextService("Internet", iinet_base)
	if ret = -1 then
		messagebox('No hay servicio','No hay servidor disponible de internet',stopsign!)
		return
	end if
	if gs_conexion	= "Parque El Prado" then
		ret = iinet_base.HyperlinkToURL("http://intra.elprado.cl/geomod/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
	else
		ret = iinet_base.HyperlinkToURL("http://intra.elprado.cl/geoforesta/dbutil/pw1.php?barra="+gs_base+gs_serie+string(gi_numero))
	end if
	if ret = -1 then
		messagebox('No Existe','No existe el plano del sector buscado.',stopsign!)
		return
	end if
end if
end event

type cb_historico from commandbutton within w_ver_agenda_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 1161
integer y = 1752
integer width = 265
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie		= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_ctacte from commandbutton within w_ver_agenda_bkp
integer x = 923
integer y = 1752
integer width = 233
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&ta Cte"
end type

event clicked;string 	ls_base,ls_serie,param
long 	 	ll_rut
Double	ll_numero

if il_row > 0 and dw_lista.rowcount()>0 then
	gi_rut 		= dw_lista.GetItemNumber(il_row, "at_gestion_rut_cliente")
	gs_base		= dw_lista.getitemstring(il_row, "at_gestion_base")
	gs_serie		= dw_lista.getitemstring(il_row, "at_gestion_serie")
	gi_numero	= dw_lista.getitemnumber(il_row, "at_gestion_numero")
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
else
	messagebox('Seleción','Debe Seleccionar un Contrato.',information!)
end if

end event

type cb_imprimir from commandbutton within w_ver_agenda_bkp
event ue_mousemove pbm_mousemove
integer x = 667
integer y = 1752
integer width = 210
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type cb_exportar from commandbutton within w_ver_agenda_bkp
event ue_mousemove pbm_mousemove
integer x = 443
integer y = 1752
integer width = 224
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_ver_agenda_bkp
event ue_mousemove pbm_mousemove
integer x = 270
integer y = 1752
integer width = 174
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto,ll_filas
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_ordenar from commandbutton within w_ver_agenda_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 55
integer y = 1752
integer width = 215
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type st_1 from statictext within w_ver_agenda_bkp
integer x = 37
integer y = 72
integer width = 521
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha Desde:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ver_agenda_bkp
integer x = 1010
integer y = 76
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_ver_agenda_bkp
integer x = 571
integer y = 60
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type em_fec_fin from editmask within w_ver_agenda_bkp
integer x = 1230
integer y = 60
integer width = 343
integer height = 88
integer taborder = 20
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type pb_aceptar from picturebutton within w_ver_agenda_bkp
integer x = 1742
integer y = 28
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;date		ld_fec_ini,ld_fec_fin,ld_fecha_hoy
String	ls_usuario
Long		ll_tot_reg, ll_indi

SetPointer(HourGlass!)
ld_fec_ini		= date(em_fec_ini.text)
ld_fec_fin		= date(em_fec_fin.text)
ld_fecha_hoy	= date(gdt_fec_sistema)
SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO 		:ls_usuario  
FROM 		"SOL_PERMISOS_USUARIO"  
WHERE  ( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'AT' ) AND  
		 ( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 ( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING		sqlca;
if sqlca.sqlcode=0 or gs_depto='I' then
	ls_usuario	= '%'
else
	ls_usuario	= gs_user
end if
if ld_fec_ini>ld_fec_fin or isnull(ld_fec_ini) or isnull(ld_fec_fin) then
	messagebox("Advertencia","Rango de Fecha Inválida")
else
	if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_usuario,ld_fecha_hoy)=0 then 
		messagebox("Advertencia","No registra datos")
	else
		ll_tot_reg	= dw_lista.rowcount()
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'estado_reg',1)
		next
		dw_lista.accepttext()
	end if
end if
SetPointer(Arrow!)
end event

type p_1 from picture within w_ver_agenda_bkp
integer x = 919
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_ini.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_ini.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
dw_lista.reset()
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_ini.text	= string(ls_fecha)
END IF
em_fec_ini.setfocus()
end event

type p_2 from picture within w_ver_agenda_bkp
integer x = 1577
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_fin.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_fin.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
dw_lista.reset()
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_fin.text	= string(ls_fecha)
END IF
em_fec_fin.setfocus()
end event

type cb_cerrar from commandbutton within w_ver_agenda_bkp
integer x = 3150
integer y = 1752
integer width = 279
integer height = 92
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ver_agenda)
end event

type dw_lista from datawindow within w_ver_agenda_bkp
integer x = 32
integer y = 200
integer width = 3397
integer height = 1500
integer taborder = 50
string dataobject = "dw_lista_agenda_telefonica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_filtro,ls_columna
Long		ll_status
Double	ldb_lat_geo,ldb_lon_geo
ls_columna					= dwo.name
if row>0 then
	il_row					= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ldb_lat_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lat_geo"))
	ldb_lon_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lon_geo"))
	ll_status				= dw_lista.GetItemNumber(il_row, "cliente_status_geo")
	if ll_status>0 then
		cb_geo.enabled		= true
	else
		cb_geo.enabled		= false
	end if
else
	if ls_columna='t_pendiente1' or ls_columna='t_pendiente2' then
		ls_filtro	= 'fecha_hoy < ante5_llamada and fecha_hoy < ante5_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_vencidos1' or ls_columna='t_vencidos2' then
		ls_filtro	= 'fecha_hoy >=  at_gestion_fecha_prox_llamada OR fecha_hoy >=  at_gestion_fecha_prox_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta1_1' or ls_columna='t_falta1_2' then
		ls_filtro	= 'fecha_hoy = ante1_llamada or  fecha_hoy = ante1_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta2_1' or ls_columna='t_falta2_2' then
		ls_filtro	= 'fecha_hoy = ante2_llamada or  fecha_hoy = ante2_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta3_1' or ls_columna='t_falta3_2' then
		ls_filtro	= 'fecha_hoy = ante3_llamada or  fecha_hoy = ante3_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta4_1' or ls_columna='t_falta4_2' then
		ls_filtro	= 'fecha_hoy = ante4_llamada or  fecha_hoy = ante4_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_falta5_1' or ls_columna='t_falta5_2' then
		ls_filtro	= 'fecha_hoy = ante5_llamada or  fecha_hoy = ante5_visita'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_mostrar_todo' then
		ls_filtro	= ''
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	elseif ls_columna='t_mayor_12' or ls_columna='t_mayor_12_2' then
		ls_filtro	= 'fecha_hoy >=  mayor_12'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
	end if
	dw_lista.SORT()
	if dw_lista.rowcount()>0 then dw_lista.scrolltorow(1)
end if
end event

event rowfocuschanged;Long		ll_status
Double	ldb_lat_geo,ldb_lon_geo

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ldb_lat_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lat_geo"))
	ldb_lon_geo				= double(dw_lista.GetItemNumber(il_row,"cliente_lon_geo"))
	ll_status				= dw_lista.GetItemNumber(il_row, "cliente_status_geo")
	if ll_status>0 then
		cb_geo.enabled		= true
	else
		cb_geo.enabled		= false
	end if
end if
end event

type gb_1 from groupbox within w_ver_agenda_bkp
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 1704
integer width = 869
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

