forward
global type w_print_vista_cupones_masiva from window
end type
type cb_setup from commandbutton within w_print_vista_cupones_masiva
end type
type cb_macanizado from commandbutton within w_print_vista_cupones_masiva
end type
type cb_print_et from commandbutton within w_print_vista_cupones_masiva
end type
type dw_etiqueta from datawindow within w_print_vista_cupones_masiva
end type
type cb_proceso from commandbutton within w_print_vista_cupones_masiva
end type
type dw_lista from datawindow within w_print_vista_cupones_masiva
end type
type cb_cancelar from commandbutton within w_print_vista_cupones_masiva
end type
type cb_imprimir from commandbutton within w_print_vista_cupones_masiva
end type
type dw_cuponeras from datawindow within w_print_vista_cupones_masiva
end type
end forward

global type w_print_vista_cupones_masiva from window
integer width = 3936
integer height = 2224
boolean titlebar = true
string title = "Vista Previa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_envio_proceso ( )
cb_setup cb_setup
cb_macanizado cb_macanizado
cb_print_et cb_print_et
dw_etiqueta dw_etiqueta
cb_proceso cb_proceso
dw_lista dw_lista
cb_cancelar cb_cancelar
cb_imprimir cb_imprimir
dw_cuponeras dw_cuponeras
end type
global w_print_vista_cupones_masiva w_print_vista_cupones_masiva

event ue_envio_proceso();cb_proceso.triggerevent(clicked!)
end event

on w_print_vista_cupones_masiva.create
this.cb_setup=create cb_setup
this.cb_macanizado=create cb_macanizado
this.cb_print_et=create cb_print_et
this.dw_etiqueta=create dw_etiqueta
this.cb_proceso=create cb_proceso
this.dw_lista=create dw_lista
this.cb_cancelar=create cb_cancelar
this.cb_imprimir=create cb_imprimir
this.dw_cuponeras=create dw_cuponeras
this.Control[]={this.cb_setup,&
this.cb_macanizado,&
this.cb_print_et,&
this.dw_etiqueta,&
this.cb_proceso,&
this.dw_lista,&
this.cb_cancelar,&
this.cb_imprimir,&
this.dw_cuponeras}
end on

on w_print_vista_cupones_masiva.destroy
destroy(this.cb_setup)
destroy(this.cb_macanizado)
destroy(this.cb_print_et)
destroy(this.dw_etiqueta)
destroy(this.cb_proceso)
destroy(this.dw_lista)
destroy(this.cb_cancelar)
destroy(this.cb_imprimir)
destroy(this.dw_cuponeras)
end on

event open;connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
dw_lista.settransobject(sqlca)
dw_cuponeras.settransobject(sqlca)
dw_etiqueta.settransobject(sqlca)
UPDATE	"CUPONERAS_DETALLE"  
SET 		"IP_PRINT" = null,   
			"USUARIO_PRINT" = null  
WHERE  ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
		 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
DELETE FROM   "TEM_CUPON"  
WHERE 		( "TEM_CUPON"."USUARIO" = :gs_user ) AND  
				( "TEM_CUPON"."IP_PRINT" = :gs_tcp_ip )   
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
gf_centrar(w_print_vista_cupones_masiva)
w_print_vista_cupones_masiva.triggerevent('ue_envio_proceso')
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;

end event

type cb_setup from commandbutton within w_print_vista_cupones_masiva
integer x = 2341
integer y = 1996
integer width = 402
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print Setup"
end type

event clicked;PrintSetup ( )
end event

type cb_macanizado from commandbutton within w_print_vista_cupones_masiva
boolean visible = false
integer x = 485
integer y = 1988
integer width = 498
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Archivo Mecanizado"
end type

event clicked;string 	ls_nombres,ls_direc_p,ls_pob,ls_base,ls_serie,ls_ap_pat,ls_ap_mat,&
			ls_sexo,ls_nro_p,ls_depto_p,ls_block_p,ls_tipo_via,ls_comuna,ls_ciudad,ls_nom_comp,&
			ls_dir_comp,ls_trato
Long		ll_rut,ll_new,ll_resp
Double	ll_numero

dw_etiqueta.reset()
DECLARE x100 CURSOR FOR  
SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO",	"CUPONERAS_DETALLE"."RUT"  
FROM 					"CUPONERAS_DETALLE"  
WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
					 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
USING					sqlca;
open x100;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode = 0
		fetch x100 into :ls_base, :ls_serie, :ll_numero, :ll_rut;
		if ll_numero > 0 then
			dw_etiqueta.reset()
			SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SEXO",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"TIPO_VIA"."DESCRIPCION",	"COMUNA"."SIGLA_COMUNA",	"CIUDAD"."SIGLA_CIUDAD"
			INTO 		:ls_nombres,			:ls_ap_pat,					:ls_ap_mat,					:ls_direc_p,					:ls_pob,						:ls_sexo,			:ls_nro_p,								:ls_depto_p,						:ls_block_p,						:ls_tipo_via,					:ls_comuna,						:ls_ciudad
			FROM 		"CLIENTE",   
						"CIUDAD",   
						"COMUNA",   
						"TIPO_VIA"  
			WHERE  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
					 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
					 (("CLIENTE"."RUT" = :ll_rut ) )   
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				ls_nom_comp	= ls_nombres+' '+ls_ap_pat+' '+ls_ap_mat
				if not isnull(ls_tipo_via) and ls_tipo_via<>'' and ls_tipo_via<>'-' then
					ls_dir_comp	= ls_tipo_via+' '+ls_direc_p
				else
					ls_dir_comp	= ls_direc_p
				end if
				if not isnull(ls_nro_p) and ls_nro_p<>'' and ls_nro_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Nº: '+ls_nro_p
				end if
				if not isnull(ls_depto_p) and ls_depto_p<>'' and ls_depto_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Depto: '+ls_depto_p
				end if
				if not isnull(ls_block_p) and ls_block_p<>'' and ls_block_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Block: '+ls_block_p
				end if
				if ls_sexo='M' then
					ls_trato	= 'Sr.'
				else
					ls_trato	= 'Sra.'
				end if
				ll_new	= dw_etiqueta.insertrow(0)
				dw_etiqueta.scrolltorow(ll_new)
				dw_etiqueta.setitem(ll_new,'base',ls_base)
				dw_etiqueta.setitem(ll_new,'serie',ls_serie)
				dw_etiqueta.setitem(ll_new,'numero',ll_numero)
				dw_etiqueta.setitem(ll_new,'trato',ls_trato)
				dw_etiqueta.setitem(ll_new,'nombre_completo',ls_nom_comp)
				dw_etiqueta.setitem(ll_new,'direccion_completa',ls_dir_comp)
				dw_etiqueta.setitem(ll_new,'villa_poblacion',ls_pob)
				dw_etiqueta.setitem(ll_new,'ciudad',upper(ls_ciudad))
				dw_etiqueta.setitem(ll_new,'comuna',upper(ls_comuna))
			end if
		end if
	LOOP
end if
close x100;
if dw_etiqueta.rowcount() > 0 then
	f_DWToExcel(dw_etiqueta)
end if
end event

type cb_print_et from commandbutton within w_print_vista_cupones_masiva
boolean visible = false
integer x = 46
integer y = 1992
integer width = 434
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir Etiquetas"
end type

event clicked;string 	ls_nombres,ls_direc_p,ls_pob,ls_base,ls_serie,ls_ap_pat,ls_ap_mat,&
			ls_sexo,ls_nro_p,ls_depto_p,ls_block_p,ls_tipo_via,ls_comuna,ls_ciudad,ls_nom_comp,&
			ls_dir_comp,ls_trato
Long		ll_rut,ll_new,ll_resp,ll_max_corr
Datetime	ldt_fecha_hoy
time		lt_ini=time('00:00:00')
Double	ll_numero

dw_etiqueta.reset()
ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),lt_ini)
DECLARE x100 CURSOR FOR  
SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO",	"CUPONERAS_DETALLE"."RUT"  
FROM 					"CUPONERAS_DETALLE"  
WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
					 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
USING					sqlca;
open x100;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode = 0
		fetch x100 into :ls_base, :ls_serie, :ll_numero, :ll_rut;
		if ll_numero > 0 then
			dw_etiqueta.reset()
			SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SEXO",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"TIPO_VIA"."DESCRIPCION",	"COMUNA"."SIGLA_COMUNA",	"CIUDAD"."SIGLA_CIUDAD"
			INTO 		:ls_nombres,			:ls_ap_pat,					:ls_ap_mat,					:ls_direc_p,					:ls_pob,						:ls_sexo,			:ls_nro_p,								:ls_depto_p,						:ls_block_p,						:ls_tipo_via,					:ls_comuna,						:ls_ciudad
			FROM 		"CLIENTE",   
						"CIUDAD",   
						"COMUNA",   
						"TIPO_VIA"  
			WHERE  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
					 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
					 (("CLIENTE"."RUT" = :ll_rut ) )   
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				ls_nom_comp	= ls_nombres+' '+ls_ap_pat+' '+ls_ap_mat
				if not isnull(ls_tipo_via) and ls_tipo_via<>'' and ls_tipo_via<>'-' then
					ls_dir_comp	= ls_tipo_via+' '+ls_direc_p
				else
					ls_dir_comp	= ls_direc_p
				end if
				if not isnull(ls_nro_p) and ls_nro_p<>'' and ls_nro_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Nº: '+ls_nro_p
				end if
				if not isnull(ls_depto_p) and ls_depto_p<>'' and ls_depto_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Depto: '+ls_depto_p
				end if
				if not isnull(ls_block_p) and ls_block_p<>'' and ls_block_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Block: '+ls_block_p
				end if
				if ls_sexo='M' then
					ls_trato	= 'Sr.'
				else
					ls_trato	= 'Sra.'
				end if
				ll_new	= dw_etiqueta.insertrow(0)
				dw_etiqueta.scrolltorow(ll_new)
				dw_etiqueta.setitem(ll_new,'base',ls_base)
				dw_etiqueta.setitem(ll_new,'serie',ls_serie)
				dw_etiqueta.setitem(ll_new,'numero',ll_numero)
				dw_etiqueta.setitem(ll_new,'trato',ls_trato)
				dw_etiqueta.setitem(ll_new,'nombre_completo',ls_nom_comp)
				dw_etiqueta.setitem(ll_new,'direccion_completa',ls_dir_comp)
				dw_etiqueta.setitem(ll_new,'villa_poblacion',ls_pob)
				dw_etiqueta.setitem(ll_new,'ciudad',upper(ls_ciudad))
				dw_etiqueta.setitem(ll_new,'comuna',upper(ls_comuna))
	
				INSERT INTO "CARTA_LOG"  
							( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  "COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
				VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,		'0',				:ldt_fecha_hoy,	0,			6,					0,						0,					'',					:gs_user )  
				USING		Trans_4;
				if Trans_4.sqlcode=0 then
					commit using Trans_4;
				else
					rollback using Trans_4;
				end if
			end if
		end if
	LOOP
end if
close x100;
if dw_etiqueta.rowcount() > 0 then
	f_Print( dw_etiqueta )
end if
end event

type dw_etiqueta from datawindow within w_print_vista_cupones_masiva
boolean visible = false
integer x = 2807
integer y = 1980
integer width = 402
integer height = 572
string title = "none"
string dataobject = "dwe_imprimir_etiqueta_externa"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_proceso from commandbutton within w_print_vista_cupones_masiva
boolean visible = false
integer x = 1403
integer y = 1988
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Proceso"
end type

event clicked;LONG   	il_job,i,j,ll_tot_reg,ll_fila,ll_indi,ll_estado,ll_min_cup,ll_cupon_termino,ll_buscar_cup_termino,ll_max_cup,ll_cod_parque,ll_rut_aux,ll_max_nro,ll_cup_max,&
			ll_cup_final,ll_rut,ll_cup_ini,ll_cup_fin,ll_num_cuponera,ll_pasa,ll_cant_cupones,ll_calculo_orden,ll_uno,ll_div_24,ll_otro,&
			ll_contador_tope,ll_mes,ll_year,ll_mes_sgte,ll_tot_porc_aux,ll_tot_porc=0,ll_num_cupon,ll_nro_cuota,ll_aux,ll_indi_aux,ll_lugar,ll_plazo,ll_contar_ctto,ll_indi_reg,ll_count_reg,&
			ll_indicador,ll_inicial,ll_final,ll_cant,ll_max_corr,ll_new,ll_resp,ll_count_print,ll_contar_5,	ll_total_insertar_0,ll_cant_mant,ll_cant_cred,ll_count,ll_count2
string 	codigo,serie,ls_string,ls_base,ls_serie,ls_print_mant,ls_dv,ls_base_aux,ls_serie_aux,&
			ls_fec_inicial,ls_fec_final,ls_barra,ls_nom_cliente,ls_moneda,ls_estado_cupon,&
			ls_tipo_mov,ls_ap_pat,ls_ap_mat,ls_cod_parque,ls_barra_aux,ls_nombres,ls_direc_p,ls_pob,&
			ls_sexo,ls_nro_p,ls_depto_p,ls_block_p,ls_tipo_via,ls_comuna,ls_ciudad,ls_nom_comp,&
			ls_dir_comp,ls_trato,ls_base_valid,ls_serie_valid
Double	ll_valor_cta_mant,ll_div,ldb_valor_cuota,ll_numero,ll_numero_aux,numero_pro,ll_numero_valid
datetime	ldt_fec_venc,ldt_fecha_venc_min,ldt_fecha_venc_max,ldt_fecha_ini_mes,ldt_fecha_fin_mes,&
			ldt_fecha_pago,ldt_fecha_prim,ldt_max_venc_cred_print,ldt_fecha_hoy
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),lt_ini)
UPDATE	"CUPONERAS_DETALLE"  
SET 		"IP_PRINT" = null,   
			"USUARIO_PRINT" = null  
WHERE  ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
		 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if

DELETE FROM   "TEM_CUPON"  
WHERE 		( "TEM_CUPON"."USUARIO" = :gs_user ) AND  
				( "TEM_CUPON"."IP_PRINT" = :gs_tcp_ip )   
USING		sqlca;
if sqlca.sqlcode=0 then
	commit;
else
	rollback;
end if
gf_centrar(w_print_vista_cupones_masiva)
if isvalid(w_administrar_cuponera) then
	w_administrar_cuponera.dw_parque.accepttext()
	ll_cod_parque							= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
	ls_cod_parque							= trim(string(ll_cod_parque))
	if gs_cuponera_aviso = '0' then//Cuponera ==> 0
		CHOOSE CASE w_administrar_cuponera.tab_1.SelectedTab
			CASE 1
				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.rowcount()
				ll_fila							= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.Find("estado = 0", 1, ll_tot_reg)
				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(1,'c_sum_estado')
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado					= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'estado')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'base')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'numero')
						
						ls_base_valid		= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'base')
						ls_serie_valid		= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'serie')
						ll_numero_valid	= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'numero')
						
						SELECT 	count("SOL_ESTATUS"."NUMERO")
						INTO 		:ll_count  
						FROM 	"SOL_ESTATUS"  
						WHERE	( "SOL_ESTATUS"."BASE" = :ls_base_valid ) AND  
									( "SOL_ESTATUS"."SERIE" = :ls_serie_valid ) AND  
									( "SOL_ESTATUS"."NUMERO" = :ll_numero_valid ) AND  
									("SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' OR  
									"SOL_ESTATUS"."CODIGO_SOLICITUD" = '20') AND  
									"SOL_ESTATUS"."ESTADO_REG" = 'A'
						USING sqlca;
						
						SELECT 	count("CONVENIO"."NUMERO")
						INTO 		:ll_count2 
						FROM 	"CONVENIO"  
						WHERE 	( "CONVENIO"."SERIE" = :ls_serie_valid ) AND  
									( "CONVENIO"."NUMERO" = :ll_numero_valid )
						USING sqlca;
						
						if ll_count = 0 and ll_count2 = 0 then
							SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
							INTO   	:ll_cant_mant,                              						:ll_cant_cred
							FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
							WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
									( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
									(("CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) )   ;
									
							ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'nro_cuponera')
							ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cupon_inicial')
							ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cupon_final')
							SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
							INTO 		:ldt_fecha_venc_min  
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_base='O' or ls_base='C' then
									SELECT	"CADENA"."RUT"  
									INTO 		:ll_rut_aux  
									FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
									WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
											 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											 (("CADENA"."CODIGO" = 'L' ) AND  
											 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
											 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
												"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
												"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										ls_print_mant		= 'N'
	//									ll_cant_cupones	= gi_cant_cup - 1
										ll_cant_cupones	= gi_cant_cup
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x1 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x1;
										FETCH x1 into :ldt_fecha_venc_max ;
									else
										ls_print_mant		= 'S'
										ll_cant_cupones	= gi_cant_cup - 3
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
	//									ll_cant_cupones	= gi_cant_cup + 1
										DECLARE x2 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x2;
										FETCH x2 into :ldt_fecha_venc_max ;
									end if
								else
	//								ll_cant_cupones		= gi_cant_cup + 1
									ll_cant_cupones		= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x3 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x3;
									FETCH x3 into :ldt_fecha_venc_max ;
								end if
								SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
								INTO 		:ll_buscar_cup_termino
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
								if sqlca.sqlcode<>0 then
									SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
									INTO 		:ldt_fecha_venc_max  
									FROM 		"CUPONERAS_DETALLE"  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
								end if
								UPDATE	"CUPONERAS_DETALLE"  
								SET 		"IP_PRINT" = :gs_tcp_ip,   
											"USUARIO_PRINT" = :gs_user  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND 
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  AND
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									if ls_print_mant = 'S' then
										SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
										INTO 		:ldt_fecha_venc_min  
										FROM 		"CUPONERAS_DETALLE"  
										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
												 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											DECLARE x4 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
											execute x4;
											FETCH x4 into :ldt_fecha_venc_max ;
											UPDATE	"CUPONERAS_DETALLE"  
											SET 		"IP_PRINT" = :gs_tcp_ip,   
														"USUARIO_PRINT" = :gs_user  
											WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
													 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
													 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
													 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
													 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
													 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
								else
									rollback;
								end if
							end if
						end if	
					end if
				next
			CASE 3
				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.rowcount()
				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(1,'c_sum_estado')
				ll_fila							= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.Find("genera = 0", 1, ll_tot_reg)
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado					= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'genera')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_codigo')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cadena_numero')
						
						ls_base_valid		= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_codigo')
						ls_serie_valid		= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_serie')
						ll_numero_valid	= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cadena_numero')
						
						SELECT 	count("SOL_ESTATUS"."NUMERO")
						INTO 		:ll_count  
						FROM 	"SOL_ESTATUS"  
						WHERE	( "SOL_ESTATUS"."BASE" = :ls_base_valid ) AND  
									( "SOL_ESTATUS"."SERIE" = :ls_serie_valid ) AND  
									( "SOL_ESTATUS"."NUMERO" = :ll_numero_valid ) AND  
									("SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' OR  
									"SOL_ESTATUS"."CODIGO_SOLICITUD" = '20') AND  
									"SOL_ESTATUS"."ESTADO_REG" = 'A'
						USING sqlca;
						
						SELECT 	count("CONVENIO"."NUMERO")
						INTO 		:ll_count2 
						FROM 	"CONVENIO"  
						WHERE 	( "CONVENIO"."SERIE" = :ls_serie_valid ) AND  
									( "CONVENIO"."NUMERO" = :ll_numero_valid )
						USING sqlca;
						
						if ll_count = 0 and ll_count2 = 0 then
						
							SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
							INTO   	:ll_cant_mant,                              						:ll_cant_cred
							FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
							WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
									( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
									(("CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) )   ;
	
							ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_nro_cuponera')
							ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_cupon_inicial')
							ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_cupon_final')
							SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
							INTO 		:ldt_fecha_venc_min  
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_base='O' or ls_base='C' then
									SELECT	"CADENA"."RUT"  
									INTO 		:ll_rut_aux  
									FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
									WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
											 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											 (("CADENA"."CODIGO" = 'L' ) AND  
											 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
											 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
												"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
												"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										ls_print_mant		= 'N'
										ll_cant_cupones	= gi_cant_cup
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x11 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x11;
										FETCH x11 into :ldt_fecha_venc_max ;
									else
										ls_print_mant		= 'S'
										ll_cant_cupones	= gi_cant_cup - 3
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x12 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x12;
										FETCH x12 into :ldt_fecha_venc_max ;
									end if
								else
									ll_cant_cupones		= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x13 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x13;
									FETCH x13 into :ldt_fecha_venc_max ;
								end if
								SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
								INTO 		:ll_buscar_cup_termino
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
								if sqlca.sqlcode<>0 then
									SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
									INTO 		:ldt_fecha_venc_max  
									FROM 		"CUPONERAS_DETALLE"  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
								end if
								UPDATE	"CUPONERAS_DETALLE"  
								SET 		"IP_PRINT" = :gs_tcp_ip,   
											"USUARIO_PRINT" = :gs_user  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  AND
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									if ls_print_mant = 'S' then
										SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
										INTO 		:ldt_fecha_venc_min  
										FROM 		"CUPONERAS_DETALLE"  
										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
												 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											DECLARE x14 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
											execute x14;
											FETCH x14 into :ldt_fecha_venc_max ;
										
											UPDATE	"CUPONERAS_DETALLE"  
											SET 		"IP_PRINT" = :gs_tcp_ip,   
														"USUARIO_PRINT" = :gs_user  
											WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
													 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
													 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
													 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
													 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
													 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
								else
									rollback;
								end if
							end if
						end if	
					end if
				next
				
			CASE 4
				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.rowcount()
				ll_fila							= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.Find("genera = 0", 1, ll_tot_reg)
				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(1,'c_sum_estado')
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado					= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'genera')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_codigo')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cadena_numero')
						
						ls_base_valid		= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_codigo')
						ls_serie_valid		= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_serie')
						ll_numero_valid	= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cadena_numero')
						
						SELECT 	count("SOL_ESTATUS"."NUMERO")
						INTO 		:ll_count  
						FROM 	"SOL_ESTATUS"  
						WHERE	( "SOL_ESTATUS"."BASE" = :ls_base_valid ) AND  
									( "SOL_ESTATUS"."SERIE" = :ls_serie_valid ) AND  
									( "SOL_ESTATUS"."NUMERO" = :ll_numero_valid ) AND  
									("SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' OR "SOL_ESTATUS"."CODIGO_SOLICITUD" = '20') AND  
									"SOL_ESTATUS"."ESTADO_REG" = 'A'
						USING sqlca;
						
						SELECT 	count("CONVENIO"."NUMERO")
						INTO 		:ll_count2 
						FROM 	"CONVENIO"  
						WHERE 	( "CONVENIO"."SERIE" = :ls_serie_valid ) AND  
									( "CONVENIO"."NUMERO" = :ll_numero_valid )
						USING sqlca;
						
						if ll_count = 0 and ll_count2 = 0 then
						
							SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
							INTO   	:ll_cant_mant,                              						:ll_cant_cred
							FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
							WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
									( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
									(("CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) )   ;
	
							ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_nro_cuponera')
							ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_cupon_inicial')
							ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_cupon_final')
							
							SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
							INTO 		:ldt_fecha_venc_min  
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_base='O' or ls_base='C' then
									SELECT	"CADENA"."RUT"  
									INTO 		:ll_rut_aux  
									FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
									WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
											 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											 (("CADENA"."CODIGO" = 'L' ) AND  
											 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
											 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
												"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
												"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										ls_print_mant	= 'N'
										ll_cant_cupones	= gi_cant_cup
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x21 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x21;
										FETCH x21 into :ldt_fecha_venc_max ;
									else
										ls_print_mant	= 'S'
										ll_cant_cupones	= gi_cant_cup - 3
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x22 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x22;
										FETCH x22 into :ldt_fecha_venc_max ;
									end if
								else
									ll_cant_cupones	= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x23 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x23;
									FETCH x23 into :ldt_fecha_venc_max ;
								end if
								SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
								INTO 		:ll_buscar_cup_termino
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
								if sqlca.sqlcode<>0 then
									SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
									INTO 		:ldt_fecha_venc_max  
									FROM 		"CUPONERAS_DETALLE"  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
								end if
								UPDATE	"CUPONERAS_DETALLE"  
								SET 		"IP_PRINT" = :gs_tcp_ip,   
											"USUARIO_PRINT" = :gs_user  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   AND 
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									
									if ls_print_mant = 'S' then
										SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
										INTO 		:ldt_fecha_venc_min  
										FROM 		"CUPONERAS_DETALLE"  
										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
												 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											DECLARE x24 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
											execute x24;
											FETCH x24 into :ldt_fecha_venc_max ;
										
											UPDATE	"CUPONERAS_DETALLE"  
											SET 		"IP_PRINT" = :gs_tcp_ip,   
														"USUARIO_PRINT" = :gs_user  
											WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
													 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
													 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
													 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" =  :ll_num_cuponera ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
													 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
													 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
								else
									rollback;
								end if
							end if
							INSERT INTO "CARTA_LOG"  
										( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  	"COD_ACCION",  	"CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
							VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,			'0',						:ldt_fecha_hoy,		0,				6,						0,							0,						'',						:gs_user )  
							USING		Trans_4;
							if Trans_4.sqlcode=0 then
								commit using Trans_4;
							else
								rollback using Trans_4;
							end if
							
						end if	
					end if
				next
				
			CASE 6
				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.rowcount()
				ll_fila							= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.Find("estado = 0", 1, ll_tot_reg)
				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(1,'c_sum_estado')
				for ll_indi=ll_fila to ll_tot_reg
					ll_estado					= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'estado')
					if ll_estado=0 then
						ls_base				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'base')
						ls_serie				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'serie')
						ll_numero			= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'numero')
						
						ls_base_valid		= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'base')
						ls_serie_valid		= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'serie')
						ll_numero_valid	= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'numero')
						
						SELECT 	count("SOL_ESTATUS"."NUMERO")
						INTO 		:ll_count  
						FROM 	"SOL_ESTATUS"  
						WHERE	( "SOL_ESTATUS"."BASE" = :ls_base_valid ) AND  
									( "SOL_ESTATUS"."SERIE" = :ls_serie_valid ) AND  
									( "SOL_ESTATUS"."NUMERO" = :ll_numero_valid ) AND  
									("SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' OR  
									"SOL_ESTATUS"."CODIGO_SOLICITUD" = '20') AND  
									"SOL_ESTATUS"."ESTADO_REG" = 'A'
						USING sqlca;
						
						SELECT 	count("CONVENIO"."NUMERO")
						INTO 		:ll_count2 
						FROM 	"CONVENIO"  
						WHERE 	( "CONVENIO"."SERIE" = :ls_serie_valid ) AND  
									( "CONVENIO"."NUMERO" = :ll_numero_valid )
						USING sqlca;
						
						if ll_count = 0 and ll_count2 = 0 then
						
							SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
							INTO   	:ll_cant_mant,                              						:ll_cant_cred
							FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
							WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
									( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
									(("CADENA"."CODIGO" = :ls_base ) AND  
									( "CADENA"."SERIE" = :ls_serie ) AND  
									( "CADENA"."NUMERO" = :ll_numero ) )   ;
	
							SELECT	"CUPONERAS"."NRO_CUPONERA",	"CUPONERAS"."CUPON_INICIAL",	"CUPONERAS"."CUPON_FINAL"  
							INTO 		:ll_num_cuponera,					:ll_cup_ini,						:ll_cup_fin
							FROM 		"CUPONERAS"  
							WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   ;
									 
							SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
							INTO 		:ldt_fecha_venc_min  
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								if ls_base='O' or ls_base='C' then
									SELECT	"CADENA"."RUT"  
									INTO 		:ll_rut_aux  
									FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
									WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
											 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											 (("CADENA"."CODIGO" = 'L' ) AND  
											 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
											 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
												"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
												"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										ls_print_mant	= 'N'
										ll_cant_cupones	= gi_cant_cup
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x31 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x31;
										FETCH x31 into :ldt_fecha_venc_max ;
									else
										ls_print_mant		= 'S'
										ll_cant_cupones	= gi_cant_cup - 3
										if ll_cant_cred > 1 then
											ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
										end if
										DECLARE x32 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
										execute x32;
										FETCH x32 into :ldt_fecha_venc_max ;
									end if
								else
									ll_cant_cupones	= gi_cant_cup
									if ll_cant_cred > 1 then
										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
									end if
									DECLARE x33 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
									execute x33;
									FETCH x33 into :ldt_fecha_venc_max ;
								end if
								SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
								INTO 		:ll_buscar_cup_termino
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
								USING		sqlca;
								if sqlca.sqlcode<>0 then
									SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
									INTO 		:ldt_fecha_venc_max  
									FROM 		"CUPONERAS_DETALLE"  
									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
											 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
									USING		sqlca;
								end if
								UPDATE	"CUPONERAS_DETALLE"  
								SET 		"IP_PRINT" = :gs_tcp_ip,   
											"USUARIO_PRINT" = :gs_user  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   AND
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
										 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									if ls_print_mant = 'S' then
										SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
										INTO 		:ldt_fecha_venc_min  
										FROM 		"CUPONERAS_DETALLE"  
										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
												 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											DECLARE x34 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
											execute x34;
											FETCH x34 into :ldt_fecha_venc_max ;
										
											UPDATE	"CUPONERAS_DETALLE"  
											SET 		"IP_PRINT" = :gs_tcp_ip,   
														"USUARIO_PRINT" = :gs_user  
											WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
													 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
													 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
													 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
													 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
													 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
													 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												commit;
											else
												rollback;
											end if
										end if
									end if
								else
									rollback;
								end if
							end if
						end if	
					end if
				next
		END CHOOSE
		if dw_lista.Retrieve(ll_cod_parque,gs_user,gs_tcp_ip)=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			ll_tot_reg						= dw_lista.rowcount()
			if ll_tot_reg > 0 then
				ll_uno							= 1
				ll_otro						= 1
				ll_contador_tope			= 1
				ll_contar_ctto				= 1
				ls_base_aux					= dw_lista.getitemstring(1,'cuponeras_detalle_base')
				ls_serie_aux					= dw_lista.getitemstring(1,'cuponeras_detalle_serie')
				ll_numero_aux				= dw_lista.getitemnumber(1,'cuponeras_detalle_numero')
				ll_rut_aux					= dw_lista.getitemnumber(1,'cuponeras_detalle_rut')
				for ll_indi=1 to ll_tot_reg
					ll_lugar					= ll_contar_ctto
					ls_base					= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_base')
					ls_serie					= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_serie')
					ll_numero				= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_numero')
					ls_barra					= ls_base+ls_serie+string(ll_numero)
					ll_num_cupon			= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_nro_cupon')
					ls_nom_cliente			= dw_lista.getitemstring(ll_indi,'cliente_nombre')
					ls_ap_pat				= dw_lista.getitemstring(ll_indi,'cliente_a_paterno')
					ls_ap_mat				= dw_lista.getitemstring(ll_indi,'cliente_a_materno')
					ls_nom_cliente			= ls_nom_cliente+' '+ls_ap_pat+' '+ls_ap_mat
					ll_rut						= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_rut')
					ll_nro_cuota				= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_nro_cuota')
					ll_plazo					= dw_lista.getitemnumber(ll_indi,'cuponeras_plazo')
					ldt_fecha_pago			= dw_lista.getitemdatetime(ll_indi,'cuponeras_detalle_fecha_venc')
					ldb_valor_cuota		= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_monto_cuota_contrato')
					ls_moneda				= dw_lista.getitemstring(ll_indi,'cuponeras_moneda_ctto')
					ls_dv						= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_dv')
					ls_tipo_mov				= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_tipo_mov')
					ls_estado_cupon		= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_estado_pago_cupon')
					ll_aux						= ll_uno
				
					ls_base_valid			= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_base')
					ls_serie_valid			= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_serie')
					ll_numero_valid		= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_numero')
					
					SELECT 	count("SOL_ESTATUS"."NUMERO")
					INTO 		:ll_count  
					FROM 	"SOL_ESTATUS"  
					WHERE	( "SOL_ESTATUS"."BASE" = :ls_base_valid ) AND  
								( "SOL_ESTATUS"."SERIE" = :ls_serie_valid ) AND  
								( "SOL_ESTATUS"."NUMERO" = :ll_numero_valid ) AND  
								("SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' OR  
								"SOL_ESTATUS"."CODIGO_SOLICITUD" = '20') AND  
								"SOL_ESTATUS"."ESTADO_REG" = 'A'
					USING sqlca;
					
					SELECT 	count("CONVENIO"."NUMERO")
					INTO 		:ll_count2 
					FROM 	"CONVENIO"  
					WHERE 	( "CONVENIO"."SERIE" = :ls_serie_valid ) AND  
								( "CONVENIO"."NUMERO" = :ll_numero_valid )   ;
					
					if ll_count = 0 and ll_count2 = 0 then
						if ll_contador_tope <= gi_cant_cup and ls_base=ls_base_aux and ls_serie=ls_serie_aux and ll_numero=ll_numero_aux then
							if ll_lugar = 1 and ll_contador_tope = gi_cant_cup then
								INSERT INTO "TEM_CUPON"  
											( "CODIGO",   "SERIE",   "NUMERO",   "BARRA",   "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",   	"ESTADO",   		"TIPO_MOV",   	"IP_PRINT" )  
								VALUES 	( :ls_base,   :ls_serie, :ll_numero, :ls_barra, :ll_num_cupon,	:ls_nom_cliente,  :ll_rut,	:ll_nro_cuota,	:ll_plazo, 		:ldt_fecha_pago,	:ldb_valor_cuota,	:ldb_valor_cuota,	:ls_moneda,	:ls_dv,	:ll_aux,	:ll_lugar,	:ls_cod_parque,	:gs_user,	:ldt_fecha_prim,	:ls_estado_cupon,	:ls_tipo_mov,	:gs_tcp_ip )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
							if ll_contador_tope < gi_cant_cup then
								INSERT INTO "TEM_CUPON"  
											( "CODIGO",   "SERIE",   "NUMERO",   "BARRA",   "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",   	"ESTADO",   		"TIPO_MOV",   	"IP_PRINT" )  
								VALUES 	( :ls_base,   :ls_serie, :ll_numero, :ls_barra, :ll_num_cupon,	:ls_nom_cliente,  :ll_rut,	:ll_nro_cuota,	:ll_plazo, 		:ldt_fecha_pago,	:ldb_valor_cuota,	:ldb_valor_cuota,	:ls_moneda,	:ls_dv,	:ll_aux,	:ll_lugar,	:ls_cod_parque,	:gs_user,	:ldt_fecha_prim,	:ls_estado_cupon,	:ls_tipo_mov,	:gs_tcp_ip )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
							ll_uno					= ll_uno + 5
						end if
						if ls_base_aux <> ls_base or ls_serie_aux <> ls_serie or ll_numero <> ll_numero_aux then
							if ll_contador_tope < gi_cant_cup then //<
								if ll_lugar > 1 then
									ll_contador_tope ++
								end if
								for ll_indi_aux	= ll_contador_tope to gi_cant_cup
									ls_barra_aux	= ls_base_aux+ls_serie_aux+string(ll_numero_aux)
									INSERT INTO "TEM_CUPON"  
												( "CODIGO",   	"SERIE", 	"NUMERO",   "BARRA", 	"NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
									VALUES 	( '',   			'', 			0, 			'', 			0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_aux,	:ll_lugar,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
									ll_aux				= ll_aux + 5
								next
							end if
							ls_base_aux				= ls_base
							ls_serie_aux				= ls_serie
							ll_numero_aux			= ll_numero
							ll_uno						= 1
							ll_contador_tope		= 0
							ll_contar_ctto ++
							ls_barra					= ls_base+ls_serie+string(ll_numero)
							if ll_contador_tope < gi_cant_cup then
								INSERT INTO "TEM_CUPON"  
											( "CODIGO",   "SERIE",   "NUMERO",   "BARRA",   "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",   	"ESTADO",   		"TIPO_MOV",   	"IP_PRINT" )  
								VALUES 	( :ls_base,   :ls_serie, :ll_numero, :ls_barra, :ll_num_cupon,	:ls_nom_cliente,  :ll_rut,	:ll_nro_cuota,	:ll_plazo, 		:ldt_fecha_pago,	:ldb_valor_cuota,	:ldb_valor_cuota,	:ls_moneda,	:ls_dv,	:ll_uno,	:ll_contar_ctto,	:ls_cod_parque,	:gs_user,	:ldt_fecha_prim,	:ls_estado_cupon,	:ls_tipo_mov,	:gs_tcp_ip )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
							ll_uno				= ll_uno + 5
						end if
					end if	
					ll_contador_tope ++
				next
				if ll_contador_tope < gi_cant_cup then
					ll_contador_tope ++
					for ll_indi = ll_contador_tope to gi_cant_cup
						INSERT INTO "TEM_CUPON"  
									( "CODIGO", 	"SERIE", 	"NUMERO",  	"BARRA", 	"NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
						VALUES 	( '',    		'', 			0,				'', 			0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_uno,	:ll_contar_ctto,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
						ll_uno				= ll_uno + 5
					next
				end if				

				//ultima validacion
				ll_contar_5					= (int(ll_count_print / 5) * 5)
				ll_total_insertar_0			= 5 - (ll_contar_ctto - ll_contar_5)
				ll_contar_ctto				= (ll_contar_ctto - ll_contar_5) + 1
				if ll_contar_ctto > 1 and ll_contar_ctto <= 5 then
					for ll_indi = 1 to ll_total_insertar_0
						ll_count_print		= ll_count_print + 1// ll_contar_ctto + 1
						ll_uno					= 1
//						ll_indi_reg			= ll_contar_ctto
						for ll_indi_reg = 1 to gi_cant_cup + 1
							INSERT INTO "TEM_CUPON"  
										 ( "CODIGO",   	"SERIE", "NUMERO",   "BARRA", "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",  	"LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
							VALUES 	 ( '',   			'', 		0, 			'', 		0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_uno,	:ll_count_print,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
							USING		 sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
							ll_uno				= ll_uno + 5
						next
					next
				end if
				// Fin
				SELECT	Count("TEM_CUPON"."CODIGO")  
				INTO 		:ll_count_reg  
				FROM 		"TEM_CUPON"  
				WHERE  ( "TEM_CUPON"."USUARIO" = :gs_user ) AND  
						 ( "TEM_CUPON"."IP_PRINT" = :gs_tcp_ip )  AND
						 ( "TEM_CUPON"."EMPRESA" = :ls_cod_parque )  
				Using		sqlca;
				if ll_count_reg > 0 then
					if dw_cuponeras.Retrieve(ls_cod_parque,gs_user,gs_tcp_ip)>0 then
						ll_indicador		= ll_count_reg / 5
						ll_indicador ++
						ll_inicial			= 1
						ll_final			= 5
						for ll_indi=1 to ll_indicador
							dw_cuponeras.SETfilter('tem_cupon_lugar >= '+string(ll_inicial) +' and tem_cupon_lugar <= '+string(ll_final))
							dw_cuponeras.filter()
							if dw_cuponeras.rowcount()>0 then
								dw_cuponeras.object.datawindow.Print.Preview	= true
//								PrintSetup ( )
//								f_printdlg(dw_cuponeras,gstr_print,w_print_vista_cupones_masiva)
								dw_cuponeras.print()
							end if
							ll_inicial		= ll_inicial + 5
							ll_final		= ll_final + 5
						next
					end if
					DECLARE x100 CURSOR FOR  
					SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO",	"CUPONERAS_DETALLE"."RUT"  
					FROM 					"CUPONERAS_DETALLE"  
					WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
										 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
					ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
					USING					sqlca;
					open x100;
					if sqlca.sqlcode=0 then
						DO WHILE sqlca.sqlcode = 0
							fetch x100 into :ls_base, :ls_serie, :ll_numero, :ll_rut;
							if ll_numero > 0 then
								SELECT	"CUPONERAS"."CANT_PRINT"  
								INTO 		:ll_cant  
								FROM 		"CUPONERAS"  
								WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :ll_numero )   
								USING		Trans_1;
								if isnull(ll_cant) then ll_cant=0
								ll_cant ++
								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
								INTO 		:ldt_max_venc_cred_print  
								FROM 		"CUPONERAS_DETALLE"  
								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
										 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
										 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user ) AND  
										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
								USING		Trans_1;
								if Trans_1.sqlcode<>0 then
									setnull(ldt_max_venc_cred_print)
								end if
								UPDATE	"CUPONERAS"  
								SET 		"CANT_PRINT" = :ll_cant,
											"ULT_FECHA_VENC_CRED_PRINT" = :ldt_max_venc_cred_print
								WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
										 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
										 ( "CUPONERAS"."NUMERO" = :ll_numero )   
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
									commit using Trans_2;
								else
									rollback using Trans_2;
								end if
								INSERT INTO "CARTA_LOG"  
											( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  "COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
								VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,		'0',				:ldt_fecha_hoy,	0,			6,					0,						0,					'',					:gs_user )  
								USING		Trans_4;
								if Trans_4.sqlcode=0 then
									commit using Trans_4;
								else
									rollback using Trans_4;
								end if
							end if
						LOOP
					end if
					close x100;
				end if
				dw_cuponeras.SETfilter('')
				dw_cuponeras.filter()
			end if
		end if
		
	elseif gs_cuponera_aviso = '1' THEN//Aviso Mantencion ==> 1
		ll_pasa							= 0
		dw_cuponeras.dataobject	= "dw_print_cupon_aviso_mantencion"
		dw_cuponeras.SetTransObject(SQLCA)
		ll_mes							= month(date(gdt_fec_sistema))
		ll_year							= year(date(gdt_fec_sistema))
		ll_mes_sgte						= ll_mes + 1
		if ll_mes_sgte>12 then
			ll_year ++
		end if
		ls_fec_inicial					= '01/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		if ll_mes_sgte=1 or ll_mes_sgte=3 or ll_mes_sgte=5 or ll_mes_sgte=7 or ll_mes_sgte=8 or &
			ll_mes_sgte=10 or ll_mes_sgte=12 then
			ls_fec_final				= '31/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		elseif ll_mes_sgte=2 then
			ls_fec_final				= '28/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		elseif ll_mes_sgte=4 or ll_mes_sgte=6 or ll_mes_sgte=9 or ll_mes_sgte=11 then
			ls_fec_final				= '30/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
		end if
		ldt_fecha_ini_mes				= datetime(date(ls_fec_inicial),lt_ini)
		ldt_fecha_fin_mes				= datetime(date(ls_fec_final),lt_fin)
		ll_cod_parque					= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
		if dw_cuponeras.retrieve(ldt_fecha_ini_mes,ldt_fecha_fin_mes,ll_cod_parque)=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			dw_cuponeras.object.datawindow.Print.Preview	= true
		end if
	end if
else
	close(w_print_vista_cupones_masiva)
end if



//LONG   	il_job,i,j,ll_tot_reg,ll_fila,ll_indi,ll_estado,ll_min_cup,ll_cupon_termino,ll_buscar_cup_termino,ll_max_cup,ll_cod_parque,ll_rut_aux,ll_max_nro,ll_cup_max,&
//			ll_cup_final,ll_rut,ll_cup_ini,ll_cup_fin,ll_num_cuponera,ll_pasa,ll_cant_cupones,ll_calculo_orden,ll_uno,ll_div_24,ll_otro,&
//			ll_contador_tope,ll_mes,ll_year,ll_mes_sgte,ll_tot_porc_aux,ll_tot_porc=0,ll_num_cupon,ll_nro_cuota,ll_aux,ll_indi_aux,ll_lugar,ll_plazo,ll_contar_ctto,ll_indi_reg,ll_count_reg,&
//			ll_indicador,ll_inicial,ll_final,ll_cant,ll_max_corr,ll_new,ll_resp,ll_count_print,ll_contar_5,	ll_total_insertar_0,ll_cant_mant,ll_cant_cred
//string 	codigo,serie,ls_string,ls_base,ls_serie,ls_print_mant,ls_dv,ls_base_aux,ls_serie_aux,&
//			ls_fec_inicial,ls_fec_final,ls_barra,ls_nom_cliente,ls_moneda,ls_estado_cupon,&
//			ls_tipo_mov,ls_ap_pat,ls_ap_mat,ls_cod_parque,ls_barra_aux,ls_nombres,ls_direc_p,ls_pob,&
//			ls_sexo,ls_nro_p,ls_depto_p,ls_block_p,ls_tipo_via,ls_comuna,ls_ciudad,ls_nom_comp,&
//			ls_dir_comp,ls_trato
//Double	ll_valor_cta_mant,ll_div,ldb_valor_cuota,ll_numero,ll_numero_aux,numero_pro
//datetime	ldt_fec_venc,ldt_fecha_venc_min,ldt_fecha_venc_max,ldt_fecha_ini_mes,ldt_fecha_fin_mes,&
//			ldt_fecha_pago,ldt_fecha_prim,ldt_max_venc_cred_print,ldt_fecha_hoy
//time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
//
//ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),lt_ini)
//UPDATE	"CUPONERAS_DETALLE"  
//SET 		"IP_PRINT" = null,   
//			"USUARIO_PRINT" = null  
//WHERE  ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
//		 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
//USING		sqlca;
//if sqlca.sqlcode=0 then
//	commit;
//else
//	rollback;
//end if
//
//DELETE FROM   "TEM_CUPON"  
//WHERE 		( "TEM_CUPON"."USUARIO" = :gs_user ) AND  
//				( "TEM_CUPON"."IP_PRINT" = :gs_tcp_ip )   
//USING		sqlca;
//if sqlca.sqlcode=0 then
//	commit;
//else
//	rollback;
//end if
//gf_centrar(w_print_vista_cupones_masiva)
//if isvalid(w_administrar_cuponera) then
//	w_administrar_cuponera.dw_parque.accepttext()
//	ll_cod_parque							= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
//	ls_cod_parque							= trim(string(ll_cod_parque))
//	if gs_cuponera_aviso = '0' then//Cuponera ==> 0
//		CHOOSE CASE w_administrar_cuponera.tab_1.SelectedTab
//			CASE 1
//				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.rowcount()
//				ll_fila							= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.Find("estado = 0", 1, ll_tot_reg)
//				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(1,'c_sum_estado')
//				for ll_indi=ll_fila to ll_tot_reg
//					ll_estado					= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'estado')
//					if ll_estado=0 then
//						ls_base				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'base')
//						ls_serie				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'serie')
//						ll_numero			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'numero')
//						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
//						INTO   	:ll_cant_mant,                              						:ll_cant_cred
//						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
//						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
//								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
//								(("CADENA"."CODIGO" = :ls_base ) AND  
//								( "CADENA"."SERIE" = :ls_serie ) AND  
//								( "CADENA"."NUMERO" = :ll_numero ) )   ;
//								
//						ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'nro_cuponera')
//						ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cupon_inicial')
//						ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cupon_final')
//						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//						INTO 		:ldt_fecha_venc_min  
//						FROM 		"CUPONERAS_DETALLE"  
//						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							if ls_base='O' or ls_base='C' then
//								SELECT	"CADENA"."RUT"  
//								INTO 		:ll_rut_aux  
//								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
//								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
//										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//										 (("CADENA"."CODIGO" = 'L' ) AND  
//										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
//										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
//											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
//											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									ls_print_mant		= 'N'
////									ll_cant_cupones	= gi_cant_cup - 1
//									ll_cant_cupones	= gi_cant_cup
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x1 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x1;
//									FETCH x1 into :ldt_fecha_venc_max ;
//								else
//									ls_print_mant		= 'S'
//									ll_cant_cupones	= gi_cant_cup - 3
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
////									ll_cant_cupones	= gi_cant_cup + 1
//									DECLARE x2 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x2;
//									FETCH x2 into :ldt_fecha_venc_max ;
//								end if
//							else
////								ll_cant_cupones		= gi_cant_cup + 1
//								ll_cant_cupones		= gi_cant_cup
//								if ll_cant_cred > 1 then
//									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//								end if
//								DECLARE x3 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//								execute x3;
//								FETCH x3 into :ldt_fecha_venc_max ;
//							end if
//							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
//							INTO 		:ll_buscar_cup_termino
//							FROM 		"CUPONERAS_DETALLE"  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//							USING		sqlca;
//							if sqlca.sqlcode<>0 then
//								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//								INTO 		:ldt_fecha_venc_max  
//								FROM 		"CUPONERAS_DETALLE"  
//								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//								USING		sqlca;
//							end if
//							UPDATE	"CUPONERAS_DETALLE"  
//							SET 		"IP_PRINT" = :gs_tcp_ip,   
//										"USUARIO_PRINT" = :gs_user  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND 
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  AND
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//								if ls_print_mant = 'S' then
//									SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//									INTO 		:ldt_fecha_venc_min  
//									FROM 		"CUPONERAS_DETALLE"  
//									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//									USING		sqlca;
//									if sqlca.sqlcode=0 then
//										DECLARE x4 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
//										execute x4;
//										FETCH x4 into :ldt_fecha_venc_max ;
//										UPDATE	"CUPONERAS_DETALLE"  
//										SET 		"IP_PRINT" = :gs_tcp_ip,   
//													"USUARIO_PRINT" = :gs_user  
//										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
//												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//										USING		sqlca;
//										if sqlca.sqlcode=0 then
//											commit;
//										else
//											rollback;
//										end if
//									end if
//								end if
//							else
//								rollback;
//							end if
//						end if
//					end if
//				next
//				
//			CASE 3
//				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.rowcount()
//				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(1,'c_sum_estado')
//				ll_fila							= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.Find("genera = 0", 1, ll_tot_reg)
//				for ll_indi=ll_fila to ll_tot_reg
//					ll_estado					= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'genera')
//					if ll_estado=0 then
//						//insertar carta log
//						ls_base				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_codigo')
//						ls_serie				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemstring(ll_indi,'cadena_serie')
//						ll_numero			= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cadena_numero')
//						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
//						INTO   	:ll_cant_mant,                              						:ll_cant_cred
//						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
//						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
//								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
//								(("CADENA"."CODIGO" = :ls_base ) AND  
//								( "CADENA"."SERIE" = :ls_serie ) AND  
//								( "CADENA"."NUMERO" = :ll_numero ) )   ;
//
//						ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_nro_cuponera')
//						ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_cupon_inicial')
//						ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_3.dw_genera.getitemnumber(ll_indi,'cuponeras_cupon_final')
//						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//						INTO 		:ldt_fecha_venc_min  
//						FROM 		"CUPONERAS_DETALLE"  
//						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							if ls_base='O' or ls_base='C' then
//								SELECT	"CADENA"."RUT"  
//								INTO 		:ll_rut_aux  
//								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
//								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
//										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//										 (("CADENA"."CODIGO" = 'L' ) AND  
//										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
//										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
//											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
//											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									ls_print_mant		= 'N'
//									ll_cant_cupones	= gi_cant_cup
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x11 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x11;
//									FETCH x11 into :ldt_fecha_venc_max ;
//								else
//									ls_print_mant		= 'S'
//									ll_cant_cupones	= gi_cant_cup - 3
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x12 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x12;
//									FETCH x12 into :ldt_fecha_venc_max ;
//								end if
//							else
//								ll_cant_cupones		= gi_cant_cup
//								if ll_cant_cred > 1 then
//									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//								end if
//								DECLARE x13 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//								execute x13;
//								FETCH x13 into :ldt_fecha_venc_max ;
//							end if
//							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
//							INTO 		:ll_buscar_cup_termino
//							FROM 		"CUPONERAS_DETALLE"  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//							USING		sqlca;
//							if sqlca.sqlcode<>0 then
//								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//								INTO 		:ldt_fecha_venc_max  
//								FROM 		"CUPONERAS_DETALLE"  
//								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//								USING		sqlca;
//							end if
//							UPDATE	"CUPONERAS_DETALLE"  
//							SET 		"IP_PRINT" = :gs_tcp_ip,   
//										"USUARIO_PRINT" = :gs_user  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )  AND
//									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//								if ls_print_mant = 'S' then
//									SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//									INTO 		:ldt_fecha_venc_min  
//									FROM 		"CUPONERAS_DETALLE"  
//									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//									USING		sqlca;
//									if sqlca.sqlcode=0 then
//										DECLARE x14 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
//										execute x14;
//										FETCH x14 into :ldt_fecha_venc_max ;
//									
//										UPDATE	"CUPONERAS_DETALLE"  
//										SET 		"IP_PRINT" = :gs_tcp_ip,   
//													"USUARIO_PRINT" = :gs_user  
//										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
//												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//										USING		sqlca;
//										if sqlca.sqlcode=0 then
//											commit;
//										else
//											rollback;
//										end if
//									end if
//								end if
//							else
//								rollback;
//							end if
//						end if
//					end if
//				next
//				
//			CASE 4
//				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.rowcount()
//				ll_fila							= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.Find("genera = 0", 1, ll_tot_reg)
//				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(1,'c_sum_estado')
//				for ll_indi=ll_fila to ll_tot_reg
//					ll_estado					= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'genera')
//					if ll_estado=0 then
//						ls_base				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_codigo')
//						ls_serie				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_serie')
//						ll_numero			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cadena_numero')
//						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
//						INTO   	:ll_cant_mant,                              						:ll_cant_cred
//						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
//						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
//								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
//								(("CADENA"."CODIGO" = :ls_base ) AND  
//								( "CADENA"."SERIE" = :ls_serie ) AND  
//								( "CADENA"."NUMERO" = :ll_numero ) )   ;
//
//						ll_num_cuponera	= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_nro_cuponera')
//						ll_cup_ini				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_cupon_inicial')
//						ll_cup_fin			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cuponeras_cupon_final')
//						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//						INTO 		:ldt_fecha_venc_min  
//						FROM 		"CUPONERAS_DETALLE"  
//						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							if ls_base='O' or ls_base='C' then
//								SELECT	"CADENA"."RUT"  
//								INTO 		:ll_rut_aux  
//								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
//								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
//										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//										 (("CADENA"."CODIGO" = 'L' ) AND  
//										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
//										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
//											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
//											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									ls_print_mant	= 'N'
//									ll_cant_cupones	= gi_cant_cup
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x21 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x21;
//									FETCH x21 into :ldt_fecha_venc_max ;
//								else
//									ls_print_mant	= 'S'
//									ll_cant_cupones	= gi_cant_cup - 3
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x22 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x22;
//									FETCH x22 into :ldt_fecha_venc_max ;
//								end if
//							else
//								ll_cant_cupones	= gi_cant_cup
//								if ll_cant_cred > 1 then
//									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//								end if
//								DECLARE x23 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//								execute x23;
//								FETCH x23 into :ldt_fecha_venc_max ;
//							end if
//							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
//							INTO 		:ll_buscar_cup_termino
//							FROM 		"CUPONERAS_DETALLE"  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//							USING		sqlca;
//							if sqlca.sqlcode<>0 then
//								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//								INTO 		:ldt_fecha_venc_max  
//								FROM 		"CUPONERAS_DETALLE"  
//								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//								USING		sqlca;
//							end if
//							UPDATE	"CUPONERAS_DETALLE"  
//							SET 		"IP_PRINT" = :gs_tcp_ip,   
//										"USUARIO_PRINT" = :gs_user  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   AND 
//									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//								if ls_print_mant = 'S' then
//									SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//									INTO 		:ldt_fecha_venc_min  
//									FROM 		"CUPONERAS_DETALLE"  
//									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//									USING		sqlca;
//									if sqlca.sqlcode=0 then
//										DECLARE x24 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
//										execute x24;
//										FETCH x24 into :ldt_fecha_venc_max ;
//									
//										UPDATE	"CUPONERAS_DETALLE"  
//										SET 		"IP_PRINT" = :gs_tcp_ip,   
//													"USUARIO_PRINT" = :gs_user  
//										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
//												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//										USING		sqlca;
//										if sqlca.sqlcode=0 then
//											commit;
//										else
//											rollback;
//										end if
//									end if
//								end if
//							else
//								rollback;
//							end if
//						end if
//					end if
//				next
//				
//			CASE 6
//				ll_tot_reg					= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.rowcount()
//				ll_fila							= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.Find("estado = 0", 1, ll_tot_reg)
//				ll_count_print				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(1,'c_sum_estado')
//				for ll_indi=ll_fila to ll_tot_reg
//					ll_estado					= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'estado')
//					if ll_estado=0 then
//						ls_base				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'base')
//						ls_serie				= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemstring(ll_indi,'serie')
//						ll_numero			= w_administrar_cuponera.tab_1.tabpage_6.dw_lista_modif.getitemnumber(ll_indi,'numero')
//						SELECT "ESTADO_MORA_MANTENCION"."CANTIDAD_MESES", "ESTADO_MORA_CREDITO"."CANTIDAD_MESES"  
//						INTO   	:ll_cant_mant,                              						:ll_cant_cred
//						FROM   "CADENA", "ESTADO_MORA_CREDITO", "ESTADO_MORA_MANTENCION"  
//						WHERE ("CADENA"."ESTADO_MORA_CREDITO" = "ESTADO_MORA_CREDITO"."ESTADO_MORA_CREDITO" ) and  
//								( "CADENA"."ESTADO_MORA_MANTENCION" = "ESTADO_MORA_MANTENCION"."ESTADO_MORA_MANTENCION" ) and  
//								(("CADENA"."CODIGO" = :ls_base ) AND  
//								( "CADENA"."SERIE" = :ls_serie ) AND  
//								( "CADENA"."NUMERO" = :ll_numero ) )   ;
//
//						SELECT	"CUPONERAS"."NRO_CUPONERA",	"CUPONERAS"."CUPON_INICIAL",	"CUPONERAS"."CUPON_FINAL"  
//						INTO 		:ll_num_cuponera,					:ll_cup_ini,						:ll_cup_fin
//						FROM 		"CUPONERAS"  
//						WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//								 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//								 ( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
//								 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )   ;
//								 
//						SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//						INTO 		:ldt_fecha_venc_min  
//						FROM 		"CUPONERAS_DETALLE"  
//						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							if ls_base='O' or ls_base='C' then
//								SELECT	"CADENA"."RUT"  
//								INTO 		:ll_rut_aux  
//								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
//								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
//										 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
//										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
//										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
//										 (("CADENA"."CODIGO" = 'L' ) AND  
//										 ( "CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
//										 ( "ANEXO_LIBERADOR"."BASE" = :ls_base AND  
//											"ANEXO_LIBERADOR"."SERIE" = :ls_serie AND  
//											"ANEXO_LIBERADOR"."NRO_OFERTA" = :ll_numero ))   
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									ls_print_mant	= 'N'
//									ll_cant_cupones	= gi_cant_cup
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x31 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x31;
//									FETCH x31 into :ldt_fecha_venc_max ;
//								else
//									ls_print_mant		= 'S'
//									ll_cant_cupones	= gi_cant_cup - 3
//									if ll_cant_cred > 1 then
//										ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//									end if
//									DECLARE x32 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//									execute x32;
//									FETCH x32 into :ldt_fecha_venc_max ;
//								end if
//							else
//								ll_cant_cupones	= gi_cant_cup
//								if ll_cant_cred > 1 then
//									ll_cant_cupones	= ((ll_cant_cupones - 1) * ll_cant_cred)
//								end if
//								DECLARE x33 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, :ll_cant_cupones);
//								execute x33;
//								FETCH x33 into :ldt_fecha_venc_max ;
//							end if
//							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
//							INTO 		:ll_buscar_cup_termino
//							FROM 		"CUPONERAS_DETALLE"  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fecha_venc_max ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//							USING		sqlca;
//							if sqlca.sqlcode<>0 then
//								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//								INTO 		:ldt_fecha_venc_max  
//								FROM 		"CUPONERAS_DETALLE"  
//								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//										 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//								USING		sqlca;
//							end if
//							UPDATE	"CUPONERAS_DETALLE"  
//							SET 		"IP_PRINT" = :gs_tcp_ip,   
//										"USUARIO_PRINT" = :gs_user  
//							WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//									 ( "CUPONERAS_DETALLE"."NRO_CUPONERA" = :ll_num_cuponera ) AND  
//									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
//									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   AND
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND  
//									 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max )   
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//								if ls_print_mant = 'S' then
//									SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC")  
//									INTO 		:ldt_fecha_venc_min  
//									FROM 		"CUPONERAS_DETALLE"  
//									WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//											 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//											 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//											 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//											 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//									USING		sqlca;
//									if sqlca.sqlcode=0 then
//										DECLARE x34 PROCEDURE FOR sp_fecha_venc_cupon(:ldt_fecha_venc_min, 12);
//										execute x34;
//										FETCH x34 into :ldt_fecha_venc_max ;
//									
//										UPDATE	"CUPONERAS_DETALLE"  
//										SET 		"IP_PRINT" = :gs_tcp_ip,   
//													"USUARIO_PRINT" = :gs_user  
//										WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//												 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//												 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" >= :ldt_fecha_venc_min ) AND
//												 ( "CUPONERAS_DETALLE"."FECHA_VENC" <= :ldt_fecha_venc_max ) AND
//												 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
//												 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
//										USING		sqlca;
//										if sqlca.sqlcode=0 then
//											commit;
//										else
//											rollback;
//										end if
//									end if
//								end if
//							else
//								rollback;
//							end if
//						end if
//					end if
//				next
//		END CHOOSE
//		if dw_lista.Retrieve(ll_cod_parque,gs_user,gs_tcp_ip)=0 then
//			messagebox("Advertencia","No Registra Datos")
//		else
//			ll_tot_reg						= dw_lista.rowcount()
//			if ll_tot_reg > 0 then
//				ll_uno							= 1
//				ll_otro						= 1
//				ll_contador_tope			= 1
//				ll_contar_ctto				= 1
//				ls_base_aux					= dw_lista.getitemstring(1,'cuponeras_detalle_base')
//				ls_serie_aux					= dw_lista.getitemstring(1,'cuponeras_detalle_serie')
//				ll_numero_aux				= dw_lista.getitemnumber(1,'cuponeras_detalle_numero')
//				ll_rut_aux					= dw_lista.getitemnumber(1,'cuponeras_detalle_rut')
//				for ll_indi=1 to ll_tot_reg
//					ll_lugar					= ll_contar_ctto
//					ls_base					= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_base')
//					ls_serie					= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_serie')
//					ll_numero				= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_numero')
//					ls_barra					= ls_base+ls_serie+string(ll_numero)
//					ll_num_cupon			= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_nro_cupon')
//					ls_nom_cliente			= dw_lista.getitemstring(ll_indi,'cliente_nombre')
//					ls_ap_pat				= dw_lista.getitemstring(ll_indi,'cliente_a_paterno')
//					ls_ap_mat				= dw_lista.getitemstring(ll_indi,'cliente_a_materno')
//					ls_nom_cliente			= ls_nom_cliente+' '+ls_ap_pat+' '+ls_ap_mat
//					ll_rut						= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_rut')
//					ll_nro_cuota				= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_nro_cuota')
//					ll_plazo					= dw_lista.getitemnumber(ll_indi,'cuponeras_plazo')
//					ldt_fecha_pago			= dw_lista.getitemdatetime(ll_indi,'cuponeras_detalle_fecha_venc')
//					ldb_valor_cuota		= dw_lista.getitemnumber(ll_indi,'cuponeras_detalle_monto_cuota_contrato')
//					ls_moneda				= dw_lista.getitemstring(ll_indi,'cuponeras_moneda_ctto')
//					ls_dv						= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_dv')
//					ls_tipo_mov				= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_tipo_mov')
//					ls_estado_cupon		= dw_lista.getitemstring(ll_indi,'cuponeras_detalle_estado_pago_cupon')
//					ll_aux						= ll_uno
//					if ll_contador_tope <= gi_cant_cup and ls_base=ls_base_aux and ls_serie=ls_serie_aux and ll_numero=ll_numero_aux then
//						if ll_lugar = 1 and ll_contador_tope = gi_cant_cup then
//							INSERT INTO "TEM_CUPON"  
//										( "CODIGO",   "SERIE",   "NUMERO",   "BARRA",   "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",   	"ESTADO",   		"TIPO_MOV",   	"IP_PRINT" )  
//							VALUES 	( :ls_base,   :ls_serie, :ll_numero, :ls_barra, :ll_num_cupon,	:ls_nom_cliente,  :ll_rut,	:ll_nro_cuota,	:ll_plazo, 		:ldt_fecha_pago,	:ldb_valor_cuota,	:ldb_valor_cuota,	:ls_moneda,	:ls_dv,	:ll_aux,	:ll_lugar,	:ls_cod_parque,	:gs_user,	:ldt_fecha_prim,	:ls_estado_cupon,	:ls_tipo_mov,	:gs_tcp_ip )  
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//							end if
//						end if
//						if ll_contador_tope < gi_cant_cup then
//							INSERT INTO "TEM_CUPON"  
//										( "CODIGO",   "SERIE",   "NUMERO",   "BARRA",   "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",   	"ESTADO",   		"TIPO_MOV",   	"IP_PRINT" )  
//							VALUES 	( :ls_base,   :ls_serie, :ll_numero, :ls_barra, :ll_num_cupon,	:ls_nom_cliente,  :ll_rut,	:ll_nro_cuota,	:ll_plazo, 		:ldt_fecha_pago,	:ldb_valor_cuota,	:ldb_valor_cuota,	:ls_moneda,	:ls_dv,	:ll_aux,	:ll_lugar,	:ls_cod_parque,	:gs_user,	:ldt_fecha_prim,	:ls_estado_cupon,	:ls_tipo_mov,	:gs_tcp_ip )  
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//							end if
//						end if
//						ll_uno					= ll_uno + 5
//					end if
//					if ls_base_aux <> ls_base or ls_serie_aux <> ls_serie or ll_numero <> ll_numero_aux then
//						if ll_contador_tope < gi_cant_cup then //<
//							if ll_lugar > 1 then
//								ll_contador_tope ++
//							end if
//							for ll_indi_aux	= ll_contador_tope to gi_cant_cup
//								ls_barra_aux	= ls_base_aux+ls_serie_aux+string(ll_numero_aux)
//								INSERT INTO "TEM_CUPON"  
//											( "CODIGO",   	"SERIE", 	"NUMERO",   "BARRA", 	"NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
//								VALUES 	( '',   			'', 			0, 			'', 			0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_aux,	:ll_lugar,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
//								USING		sqlca;
//								if sqlca.sqlcode=0 then
//									commit;
//								else
//									rollback;
//								end if
//								ll_aux				= ll_aux + 5
//							next
//						end if
//						ls_base_aux				= ls_base
//						ls_serie_aux				= ls_serie
//						ll_numero_aux			= ll_numero
//						ll_uno						= 1
//						ll_contador_tope		= 0
//						ll_contar_ctto ++
//						ls_barra					= ls_base+ls_serie+string(ll_numero)
//						if ll_contador_tope < gi_cant_cup then
//							INSERT INTO "TEM_CUPON"  
//										( "CODIGO",   "SERIE",   "NUMERO",   "BARRA",   "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",   	"ESTADO",   		"TIPO_MOV",   	"IP_PRINT" )  
//							VALUES 	( :ls_base,   :ls_serie, :ll_numero, :ls_barra, :ll_num_cupon,	:ls_nom_cliente,  :ll_rut,	:ll_nro_cuota,	:ll_plazo, 		:ldt_fecha_pago,	:ldb_valor_cuota,	:ldb_valor_cuota,	:ls_moneda,	:ls_dv,	:ll_uno,	:ll_contar_ctto,	:ls_cod_parque,	:gs_user,	:ldt_fecha_prim,	:ls_estado_cupon,	:ls_tipo_mov,	:gs_tcp_ip )  
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//							end if
//						end if
//						ll_uno				= ll_uno + 5
//					end if
//					ll_contador_tope ++
//				next
//				if ll_contador_tope < gi_cant_cup then
//					ll_contador_tope ++
//					for ll_indi = ll_contador_tope to gi_cant_cup
//						INSERT INTO "TEM_CUPON"  
//									( "CODIGO", 	"SERIE", 	"NUMERO",  	"BARRA", 	"NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
//						VALUES 	( '',    		'', 			0,				'', 			0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_uno,	:ll_contar_ctto,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
//						USING		sqlca;
//						if sqlca.sqlcode=0 then
//							commit;
//						else
//							rollback;
//						end if
//						ll_uno				= ll_uno + 5
//					next
//				end if				
////				if ll_contar_ctto < 5 and ll_contador_tope < gi_cant_cup then
////					ll_contador_tope ++
////					for ll_indi = ll_contador_tope to gi_cant_cup
////						INSERT INTO "TEM_CUPON"  
////									( "CODIGO", 	"SERIE", 	"NUMERO",  	"BARRA", 	"NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",   "LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
////						VALUES 	( '',    		'', 			0,				'', 			0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_uno,	:ll_contar_ctto,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
////						USING		sqlca;
////						if sqlca.sqlcode=0 then
////							commit;
////						else
////							rollback;
////						end if
////						ll_uno				= ll_uno + 5
////					next
////				end if
//				//if ll_contar_ctto < 5 and ll_contar_ctto < ll_count_print then
////				if ll_contar_ctto < 116 then //ll_count_print
////					ll_contar_ctto	= ll_contar_ctto + 1
////					for ll_indi = ll_contar_ctto to 5
////						ll_uno			= 1
////						for ll_indi_reg = 1 to gi_cant_cup
////							INSERT INTO "TEM_CUPON"  
////										( "CODIGO",   	"SERIE", "NUMERO",   "BARRA", "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",  	"LUGAR",   	"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
////							VALUES 	( '',   			'', 		0, 			'', 		0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_uno,	:ll_indi,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
////							USING		sqlca;
////							if sqlca.sqlcode=0 then
////								commit;
////							else
////								rollback;
////							end if
////							ll_uno	= ll_uno + 5
////						next
////					next
////				end if
//				//ultima validacion
//				ll_contar_5					= (int(ll_count_print / 5) * 5)
//				ll_total_insertar_0			= 5 - (ll_contar_ctto - ll_contar_5)
//				ll_contar_ctto				= (ll_contar_ctto - ll_contar_5) + 1
//				if ll_contar_ctto > 1 and ll_contar_ctto <= 5 then
//					for ll_indi = 1 to ll_total_insertar_0
//						ll_count_print		= ll_count_print + 1// ll_contar_ctto + 1
//						ll_uno					= 1
////						ll_indi_reg			= ll_contar_ctto
//						for ll_indi_reg = 1 to gi_cant_cup + 1
//							INSERT INTO "TEM_CUPON"  
//										 ( "CODIGO",   	"SERIE", "NUMERO",   "BARRA", "NUM_CUP",   	"NOMBRE",   		"RUT",   "NRO_CUOTA",   "TOT_CUOTA",   "FECHA_PAGO",   	"VALOR_CUOTA",   	"MANTENCION",   	"MONEDA",   "DV",   	"AUX",  	"LUGAR",   			"EMPRESA",   		"USUARIO",  "FECHA_PRIM",  "ESTADO",   "TIPO_MOV", "IP_PRINT" )  
//							VALUES 	 ( '',   			'', 		0, 			'', 		0,					'',  					0,			0,					0, 				null,					0,						0,						'',			'',		:ll_uno,	:ll_count_print,	:ls_cod_parque,	:gs_user,	null,				null,			'',			:gs_tcp_ip )  
//							USING		 sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//							end if
//							ll_uno				= ll_uno + 5
//						next
//					next
//				end if
//				// Fin
//				SELECT	Count("TEM_CUPON"."CODIGO")  
//				INTO 		:ll_count_reg  
//				FROM 		"TEM_CUPON"  
//				WHERE  ( "TEM_CUPON"."USUARIO" = :gs_user ) AND  
//						 ( "TEM_CUPON"."IP_PRINT" = :gs_tcp_ip )  AND
//						 ( "TEM_CUPON"."EMPRESA" = :ls_cod_parque )  
//				Using		sqlca;
//				if ll_count_reg > 0 then
//					if dw_cuponeras.Retrieve(ls_cod_parque,gs_user,gs_tcp_ip)>0 then
//						ll_indicador		= ll_count_reg / 5
//						ll_indicador ++
//						ll_inicial			= 1
//						ll_final			= 5
//						for ll_indi=1 to ll_indicador
//							dw_cuponeras.SETfilter('tem_cupon_lugar >= '+string(ll_inicial) +' and tem_cupon_lugar <= '+string(ll_final))
//							dw_cuponeras.filter()
//							if dw_cuponeras.rowcount()>0 then
//								dw_cuponeras.object.datawindow.Print.Preview	= true
////								PrintSetup ( )
////								f_printdlg(dw_cuponeras,gstr_print,w_print_vista_cupones_masiva)
//								dw_cuponeras.print()
//							end if
//							ll_inicial		= ll_inicial + 5
//							ll_final		= ll_final + 5
//						next
//					end if
//					DECLARE x100 CURSOR FOR  
//					SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO",	"CUPONERAS_DETALLE"."RUT"  
//					FROM 					"CUPONERAS_DETALLE"  
//					WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
//										 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
//					ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
//					USING					sqlca;
//					open x100;
//					if sqlca.sqlcode=0 then
//						DO WHILE sqlca.sqlcode = 0
//							fetch x100 into :ls_base, :ls_serie, :ll_numero, :ll_rut;
//							if ll_numero > 0 then
//								SELECT	"CUPONERAS"."CANT_PRINT"  
//								INTO 		:ll_cant  
//								FROM 		"CUPONERAS"  
//								WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS"."NUMERO" = :ll_numero )   
//								USING		Trans_1;
//								if isnull(ll_cant) then ll_cant=0
//								ll_cant ++
//								SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//								INTO 		:ldt_max_venc_cred_print  
//								FROM 		"CUPONERAS_DETALLE"  
//								WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//										 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
//										 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user ) AND  
//										 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
//								USING		Trans_1;
//								if Trans_1.sqlcode <> 0 then
//									setnull(ldt_max_venc_cred_print)
//								end if
//								UPDATE	"CUPONERAS"  
//								SET 		"CANT_PRINT" = :ll_cant,
//											"ULT_FECHA_VENC_CRED_PRINT" = :ldt_max_venc_cred_print
//								WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//										 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//										 ( "CUPONERAS"."NUMERO" = :ll_numero )   
//								USING		Trans_2;
//								if Trans_2.sqlcode=0 then
//									commit using Trans_2;
//								else
//									rollback using Trans_2;
//								end if
//								INSERT INTO "CARTA_LOG"  
//											( "BASE",   "SERIE",   	"NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",  "FECHA_CARTA",   	"MORA",  "COD_ACCION",  "CORRELATIVO",   	"MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
//								VALUES 	( :ls_base,	:ls_serie,	:ll_numero,	:ll_rut,	:ls_base,			'0',						:ldt_fecha_hoy,		0,			6,						0,						0,						'',						:gs_user )  
//								USING		Trans_4;
//								if Trans_4.sqlcode=0 then
//									commit using Trans_4;
//								else
//									rollback using Trans_4;
//								end if
//							end if
//						LOOP
//					end if
//					close x100;
//				end if
//				dw_cuponeras.SETfilter('')
//				dw_cuponeras.filter()
//			end if
//		end if
//		
//	elseif gs_cuponera_aviso = '1' THEN//Aviso Mantencion ==> 1
//		ll_pasa							= 0
//		dw_cuponeras.dataobject	= "dw_print_cupon_aviso_mantencion"
//		dw_cuponeras.SetTransObject(SQLCA)
//		ll_mes							= month(date(gdt_fec_sistema))
//		ll_year							= year(date(gdt_fec_sistema))
//		ll_mes_sgte						= ll_mes + 1
//		if ll_mes_sgte>12 then
//			ll_year ++
//		end if
//		ls_fec_inicial					= '01/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
//		if ll_mes_sgte=1 or ll_mes_sgte=3 or ll_mes_sgte=5 or ll_mes_sgte=7 or ll_mes_sgte=8 or &
//			ll_mes_sgte=10 or ll_mes_sgte=12 then
//			ls_fec_final				= '31/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
//		elseif ll_mes_sgte=2 then
//			ls_fec_final				= '28/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
//		elseif ll_mes_sgte=4 or ll_mes_sgte=6 or ll_mes_sgte=9 or ll_mes_sgte=11 then
//			ls_fec_final				= '30/'+string(ll_mes_sgte,'00')+'/'+string(ll_year,'0000')
//		end if
//		ldt_fecha_ini_mes				= datetime(date(ls_fec_inicial),lt_ini)
//		ldt_fecha_fin_mes				= datetime(date(ls_fec_final),lt_fin)
//		ll_cod_parque					= w_administrar_cuponera.dw_parque.getitemnumber(1,'cod_parque')
//		if dw_cuponeras.retrieve(ldt_fecha_ini_mes,ldt_fecha_fin_mes,ll_cod_parque)=0 then
//			messagebox("Advertencia","No Registra Datos")
//		else
//			dw_cuponeras.object.datawindow.Print.Preview	= true
//		end if
//	end if
//else
//	close(w_print_vista_cupones_masiva)
//end if
end event

type dw_lista from datawindow within w_print_vista_cupones_masiva
boolean visible = false
integer x = 1806
integer y = 2044
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_imprimir_cuponera"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_print_vista_cupones_masiva
integer x = 3534
integer y = 1992
integer width = 347
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_print_vista_cupones_masiva)
end event

type cb_imprimir from commandbutton within w_print_vista_cupones_masiva
boolean visible = false
integer x = 2011
integer y = 1996
integer width = 306
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//String	ls_base,ls_serie
//Long		ll_numero,ll_cant
//Datetime	ldt_max_venc_cred_print
//
//SetPointer(HourGlass!)
//if dw_cuponeras.rowcount() > 0 then
//	f_printdlg(dw_cuponeras,gstr_print,w_print_vista_cupones_masiva)
////	dw_cuponeras.print()
//	if gs_cuponera_aviso = '0' then
//		DECLARE x1 CURSOR FOR  
//		SELECT DISTINCT 	"CUPONERAS_DETALLE"."BASE", "CUPONERAS_DETALLE"."SERIE", "CUPONERAS_DETALLE"."NUMERO"  
//		FROM 					"CUPONERAS_DETALLE"  
//		WHERE 			 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND 
//							 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user )   
//		ORDER BY 			"CUPONERAS_DETALLE"."BASE" ASC,   "CUPONERAS_DETALLE"."SERIE" ASC,  "CUPONERAS_DETALLE"."NUMERO" ASC  
//		USING					sqlca;
//		open x1;
//		if sqlca.sqlcode=0 then
//			DO WHILE sqlca.sqlcode = 0
//				fetch x1 into :ls_base, :ls_serie, :ll_numero;
//				if ll_numero > 0 then
//					SELECT	"CUPONERAS"."CANT_PRINT"  
//					INTO 		:ll_cant  
//					FROM 		"CUPONERAS"  
//					WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//							 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//							 ( "CUPONERAS"."NUMERO" = :ll_numero )   
//					USING		Trans_1;
//					if isnull(ll_cant) then ll_cant=0
//					ll_cant ++
//					SELECT	MAX("CUPONERAS_DETALLE"."FECHA_VENC")  
//					INTO 		:ldt_max_venc_cred_print  
//					FROM 		"CUPONERAS_DETALLE"  
//					WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
//							 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
//							 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
//							 ( "CUPONERAS_DETALLE"."IP_PRINT" = :gs_tcp_ip ) AND  
//							 ( "CUPONERAS_DETALLE"."USUARIO_PRINT" = :gs_user ) AND  
//							 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
//					USING		Trans_1;
//					if Trans_1.sqlcode<>0 then
//						setnull(ldt_max_venc_cred_print)
//					end if
//					UPDATE	"CUPONERAS"  
//					SET 		"CANT_PRINT" = :ll_cant,
//								"ULT_FECHA_VENC_CRED_PRINT" = :ldt_max_venc_cred_print
//					WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//							 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//							 ( "CUPONERAS"."NUMERO" = :ll_numero )   
//					USING		Trans_2;
//					if Trans_2.sqlcode=0 then
//						commit using Trans_2;
//					else
//						rollback using Trans_2;
//					end if
//				end if
//			LOOP
//		end if
//		close x1;
//	end if
//end if
//SetPointer(Arrow!)
//Close(w_print_vista_cupones_masiva)
end event

type dw_cuponeras from datawindow within w_print_vista_cupones_masiva
integer x = 46
integer y = 36
integer width = 3835
integer height = 1920
integer taborder = 10
string dataobject = "d_datos_cupon"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

