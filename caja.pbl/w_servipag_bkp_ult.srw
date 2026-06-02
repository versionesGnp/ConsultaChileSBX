forward
global type w_servipag_bkp_ult from window
end type
type dw_baestado from datawindow within w_servipag_bkp_ult
end type
type dw_pagos_stgo from datawindow within w_servipag_bkp_ult
end type
type dw_pagos from datawindow within w_servipag_bkp_ult
end type
type dw_no_existe from datawindow within w_servipag_bkp_ult
end type
type dw_lista_cupon_existe from datawindow within w_servipag_bkp_ult
end type
type tab_1 from tab within w_servipag_bkp_ult
end type
type tabpage_1 from userobject within tab_1
end type
type pb_retiro from picturebutton within tabpage_1
end type
type st_ultimo from statictext within tabpage_1
end type
type cb_proceso from picturebutton within tabpage_1
end type
type p_1 from picture within tabpage_1
end type
type em_desde from editmask within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type cb_expor from commandbutton within tabpage_1
end type
type dw_lista from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_retiro pb_retiro
st_ultimo st_ultimo
cb_proceso cb_proceso
p_1 p_1
em_desde em_desde
st_2 st_2
cb_expor cb_expor
dw_lista dw_lista
end type
type tabpage_2 from userobject within tab_1
end type
type pb_grabar_ver from picturebutton within tabpage_2
end type
type cb_exp from commandbutton within tabpage_2
end type
type cb_filtrar from commandbutton within tabpage_2
end type
type cb_limpiar from commandbutton within tabpage_2
end type
type cb_ver from commandbutton within tabpage_2
end type
type rb_portal from radiobutton within tabpage_2
end type
type rb_express from radiobutton within tabpage_2
end type
type cb_print_cupones from commandbutton within tabpage_2
end type
type cb_eliminar from commandbutton within tabpage_2
end type
type dw_log_servipag from datawindow within tabpage_2
end type
type cb_grabar from commandbutton within tabpage_2
end type
type cb_recuperar from commandbutton within tabpage_2
end type
type dw_cargar from datawindow within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
pb_grabar_ver pb_grabar_ver
cb_exp cb_exp
cb_filtrar cb_filtrar
cb_limpiar cb_limpiar
cb_ver cb_ver
rb_portal rb_portal
rb_express rb_express
cb_print_cupones cb_print_cupones
cb_eliminar cb_eliminar
dw_log_servipag dw_log_servipag
cb_grabar cb_grabar
cb_recuperar cb_recuperar
dw_cargar dw_cargar
gb_2 gb_2
end type
type tabpage_3 from userobject within tab_1
end type
type cb_filtrar_det from commandbutton within tabpage_3
end type
type cb_exportar_det from commandbutton within tabpage_3
end type
type cb_print_det from commandbutton within tabpage_3
end type
type p_3 from picture within tabpage_3
end type
type em_fecha_final from editmask within tabpage_3
end type
type pb_proceso_archivos from picturebutton within tabpage_3
end type
type st_8 from statictext within tabpage_3
end type
type p_2 from picture within tabpage_3
end type
type em_fecha_inicial from editmask within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type st_6 from statictext within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type dw_detalle_archivos from datawindow within tabpage_3
end type
type dw_lista_archivos from datawindow within tabpage_3
end type
type gb_1 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_filtrar_det cb_filtrar_det
cb_exportar_det cb_exportar_det
cb_print_det cb_print_det
p_3 p_3
em_fecha_final em_fecha_final
pb_proceso_archivos pb_proceso_archivos
st_8 st_8
p_2 p_2
em_fecha_inicial em_fecha_inicial
st_7 st_7
st_6 st_6
st_5 st_5
dw_detalle_archivos dw_detalle_archivos
dw_lista_archivos dw_lista_archivos
gb_1 gb_1
end type
type tabpage_4 from userobject within tab_1
end type
type cb_exportar_res from commandbutton within tabpage_4
end type
type cb_print_res from commandbutton within tabpage_4
end type
type st_10 from statictext within tabpage_4
end type
type p_13 from picture within tabpage_4
end type
type em_fecha_final_2 from editmask within tabpage_4
end type
type st_18 from statictext within tabpage_4
end type
type p_12 from picture within tabpage_4
end type
type em_fecha_inicial_2 from editmask within tabpage_4
end type
type st_17 from statictext within tabpage_4
end type
type pb_ok from picturebutton within tabpage_4
end type
type dw_parque from datawindow within tabpage_4
end type
type st_9 from statictext within tabpage_4
end type
type dw_caja_resumen from datawindow within tabpage_4
end type
type gb_11 from groupbox within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_exportar_res cb_exportar_res
cb_print_res cb_print_res
st_10 st_10
p_13 p_13
em_fecha_final_2 em_fecha_final_2
st_18 st_18
p_12 p_12
em_fecha_inicial_2 em_fecha_inicial_2
st_17 st_17
pb_ok pb_ok
dw_parque dw_parque
st_9 st_9
dw_caja_resumen dw_caja_resumen
gb_11 gb_11
end type
type tabpage_5 from userobject within tab_1
end type
type cb_print_pr from commandbutton within tabpage_5
end type
type cb_exportar_pr from commandbutton within tabpage_5
end type
type cb_filtrar_pr from commandbutton within tabpage_5
end type
type cb_1 from commandbutton within tabpage_5
end type
type dw_problemas from datawindow within tabpage_5
end type
type gb_pr from groupbox within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_print_pr cb_print_pr
cb_exportar_pr cb_exportar_pr
cb_filtrar_pr cb_filtrar_pr
cb_1 cb_1
dw_problemas dw_problemas
gb_pr gb_pr
end type
type tab_1 from tab within w_servipag_bkp_ult
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type dw_servipag from datawindow within w_servipag_bkp_ult
end type
type st_1 from statictext within w_servipag_bkp_ult
end type
type cb_cerrar from commandbutton within w_servipag_bkp_ult
end type
end forward

global type w_servipag_bkp_ult from window
integer width = 3378
integer height = 1884
boolean titlebar = true
string title = "Generar Archivo Envio SERVIPAG o SERVIESTADO"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_baestado dw_baestado
dw_pagos_stgo dw_pagos_stgo
dw_pagos dw_pagos
dw_no_existe dw_no_existe
dw_lista_cupon_existe dw_lista_cupon_existe
tab_1 tab_1
dw_servipag dw_servipag
st_1 st_1
cb_cerrar cb_cerrar
end type
global w_servipag_bkp_ult w_servipag_bkp_ult

type variables
String		named
Date		id_fecha_log
Long		il_row, il_corr
end variables

on w_servipag_bkp_ult.create
this.dw_baestado=create dw_baestado
this.dw_pagos_stgo=create dw_pagos_stgo
this.dw_pagos=create dw_pagos
this.dw_no_existe=create dw_no_existe
this.dw_lista_cupon_existe=create dw_lista_cupon_existe
this.tab_1=create tab_1
this.dw_servipag=create dw_servipag
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.Control[]={this.dw_baestado,&
this.dw_pagos_stgo,&
this.dw_pagos,&
this.dw_no_existe,&
this.dw_lista_cupon_existe,&
this.tab_1,&
this.dw_servipag,&
this.st_1,&
this.cb_cerrar}
end on

on w_servipag_bkp_ult.destroy
destroy(this.dw_baestado)
destroy(this.dw_pagos_stgo)
destroy(this.dw_pagos)
destroy(this.dw_no_existe)
destroy(this.dw_lista_cupon_existe)
destroy(this.tab_1)
destroy(this.dw_servipag)
destroy(this.st_1)
destroy(this.cb_cerrar)
end on

event open;Date		ld_fecha,ld_fecha_proc,ld_fecha_inicial,ld_fecha_log
String	ls_dia
Long		ll_parque

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
gf_centrar(w_servipag)
tab_1.tabpage_1.st_ultimo.text					= ''
dw_lista_cupon_existe.settransobject(sqlca)
dw_no_existe.settransobject(sqlca)
dw_pagos_stgo.settransobject(sqlca)
dw_pagos.settransobject(sqlca)
dw_servipag.settransobject(sqlca)
dw_baestado.settransobject(sqlca)
tab_1.tabpage_5.dw_problemas.settransobject(sqlca)
tab_1.tabpage_1.pb_retiro.visible				= false
tab_1.tabpage_2.cb_print_cupones.enabled	= false
tab_1.tabpage_1.dw_lista.settransobject(sqlca)
tab_1.tabpage_2.dw_cargar.settransobject(sqlca)
tab_1.tabpage_2.dw_log_servipag.settransobject(sqlca)
tab_1.tabpage_3.dw_lista_archivos.settransobject(sqlca)
tab_1.tabpage_3.dw_detalle_archivos.settransobject(sqlca)
tab_1.tabpage_4.dw_caja_resumen.settransobject(sqlca)
tab_1.tabpage_4.dw_parque.settransobject(sqlca)
tab_1.tabpage_4.dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque	= 11
elseif gs_conexion = "Parque Santiago" then
	tab_1.tabpage_1.pb_retiro.visible			= true
	ll_parque	= 103
elseif gs_conexion = "Parque Concepción" then
	tab_1.tabpage_1.pb_retiro.visible			= true
	ll_parque	= 801
end if
tab_1.tabpage_4.dw_parque.setitem(1,'cod_parque',ll_parque)
tab_1.tabpage_4.dw_parque.accepttext()
if gs_depto='I' then
	tab_1.tabpage_2.pb_grabar_ver.visible	= true
else
	tab_1.tabpage_2.pb_grabar_ver.visible	= false
end if
if gs_depto<>'I' and gs_depto<>'T' then
	messagebox("Advertencia","Ud. No tiene Acceso")
	close(w_servipag)
else
	tab_1.tabpage_2.cb_eliminar.visible		= true
	ld_fecha											= date(gdt_fec_sistema)
	id_fecha_log									= RelativeDate(ld_fecha,  - 20)
	if tab_1.tabpage_2.dw_log_servipag.retrieve(id_fecha_log)>0 then
		tab_1.tabpage_2.rb_express.triggerevent(clicked!)
	end if
	ld_fecha_proc									= RelativeDate(ld_fecha, 1)
	tab_1.tabpage_1.em_desde.text			= string(ld_fecha_proc,"dd/mm/yyyy")
	ls_dia												= UPPER(DayName(ld_fecha_proc))
	CHOOSE CASE ls_dia
		CASE 'SABADO','SATURDAY'
			ld_fecha_proc							= RelativeDate(ld_fecha, 3)
			tab_1.tabpage_1.em_desde.text		= string(ld_fecha_proc,"dd/mm/yyyy")
	END CHOOSE
	ld_fecha_inicial									= RelativeDate(ld_fecha, -5)
	tab_1.tabpage_3.em_fecha_inicial.text	= string(ld_fecha_inicial,"dd/mm/yyyy")
	tab_1.tabpage_3.em_fecha_final.text		= string(ld_fecha,"dd/mm/yyyy")
	if gs_depto='T' then
		tab_1.tabpage_1.enabled				= false
		tab_1.tabpage_2.cb_eliminar.visible	= false
		tab_1.tabpage_2.cb_grabar.visible		= false
		tab_1.tabpage_2.cb_recuperar.visible	= false
		tab_1.tabpage_2.pb_grabar_ver.visible	= false
		tab_1.tabpage_3.em_fecha_inicial.setfocus()
		tab_1.SelectedTab							= 2
	end if
	tab_1.tabpage_4.em_fecha_inicial_2.text= string(gdt_fec_sistema,"dd/mm/yyyy")
	tab_1.tabpage_4.em_fecha_final_2.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;

end event

type dw_baestado from datawindow within w_servipag_bkp_ult
boolean visible = false
integer x = 2510
integer y = 1756
integer width = 398
integer height = 284
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_exportar_bestado_string"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_pagos_stgo from datawindow within w_servipag_bkp_ult
boolean visible = false
integer x = 1097
integer y = 1760
integer width = 398
integer height = 284
string title = "none"
string dataobject = "dw_servipag_santiago_pagos_por_fecha"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_pagos from datawindow within w_servipag_bkp_ult
boolean visible = false
integer x = 2039
integer y = 1760
integer width = 398
integer height = 284
string title = "none"
string dataobject = "dwe_genera_archivo_pagos_retiro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_no_existe from datawindow within w_servipag_bkp_ult
boolean visible = false
integer x = 155
integer y = 1760
integer width = 398
integer height = 284
string dataobject = "dw_imprimir_servipag_cupon_existentes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista_cupon_existe from datawindow within w_servipag_bkp_ult
boolean visible = false
integer x = 1568
integer y = 1760
integer width = 398
integer height = 284
string title = "none"
string dataobject = "dw_lista_servipag_cupon_existentes"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_servipag_bkp_ult
event create ( )
event destroy ( )
integer x = 37
integer y = 28
integer width = 3291
integer height = 1580
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3255
integer height = 1452
long backcolor = 67108864
string text = " Generar Archivo"
long tabtextcolor = 33554432
string picturename = "SaveAs!"
long picturemaskcolor = 536870912
string powertiptext = "Exportar"
pb_retiro pb_retiro
st_ultimo st_ultimo
cb_proceso cb_proceso
p_1 p_1
em_desde em_desde
st_2 st_2
cb_expor cb_expor
dw_lista dw_lista
end type

on tabpage_1.create
this.pb_retiro=create pb_retiro
this.st_ultimo=create st_ultimo
this.cb_proceso=create cb_proceso
this.p_1=create p_1
this.em_desde=create em_desde
this.st_2=create st_2
this.cb_expor=create cb_expor
this.dw_lista=create dw_lista
this.Control[]={this.pb_retiro,&
this.st_ultimo,&
this.cb_proceso,&
this.p_1,&
this.em_desde,&
this.st_2,&
this.cb_expor,&
this.dw_lista}
end on

on tabpage_1.destroy
destroy(this.pb_retiro)
destroy(this.st_ultimo)
destroy(this.cb_proceso)
destroy(this.p_1)
destroy(this.em_desde)
destroy(this.st_2)
destroy(this.cb_expor)
destroy(this.dw_lista)
end on

type pb_retiro from picturebutton within tabpage_1
boolean visible = false
integer x = 2373
integer y = 1308
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "logo_parque_stgo.bmp"
string disabledname = "logo_parque_stgo.bmp"
alignment htextalign = left!
end type

event clicked;datetime		ldt_fecha_pago,ldt_fecha_m,ldt_fecha_vcto
Long			ll_rut,  ll_folio, ll_monto, ll_cuotas_pag,ll_new,ll_largo,ll_blanco,&
				ll_max_nro_cuota,ll_nro_cupon,ll_monto_pagar,ll_cta_pag_la, ll_cta_pag_isa,ll_anno,&
				ll_nro_cuota_mant,ll_indi,ll_nro_cuota,Ret,ll_year,ll_tot_reg,ll_fila
String			ls_dv, ls_base, ls_serie, ls_tipo_mov, ls_caja, ls_tipo_cob, ls_linea,ls_fecha,ls_cod_otro,&
				ls_cod_retiro_otros,ls_linea_bkp,ls_serie_corr,ls_year,ls_rezago
Double		ll_numero
Datawindow	dw_paso

ldt_fecha_pago					= datetime(date(em_desde.text),time('00:00:00'))
if not isnull(ldt_fecha_pago) then
	
	dw_pagos.dataobject		= 'dwe_genera_archivo_pagos_retiro'
	dw_pagos.settransobject(sqlca)
	dw_pagos.reset()
	ll_tot_reg					= dw_pagos_stgo.retrieve(ldt_fecha_pago)
	if ll_tot_reg > 0 then
		for ll_fila=1 to ll_tot_reg
			ll_rut					= dw_pagos_stgo.getitemnumber(ll_fila,'rut')
			ls_dv					= dw_pagos_stgo.getitemstring(ll_fila,'cliente_dv')
			ls_base				= dw_pagos_stgo.getitemstring(ll_fila,'base')
			ls_serie				= dw_pagos_stgo.getitemstring(ll_fila,'serie')
			ll_numero			= dw_pagos_stgo.getitemnumber(ll_fila,'contrato')
			ls_tipo_mov			= dw_pagos_stgo.getitemstring(ll_fila,'tipo_mov')
			ls_caja				= dw_pagos_stgo.getitemstring(ll_fila,'cod_caja')
			ls_tipo_cob			= dw_pagos_stgo.getitemstring(ll_fila,'tipo_cob')
			ll_folio				= dw_pagos_stgo.getitemnumber(ll_fila,'folio')
			ll_monto				= dw_pagos_stgo.getitemnumber(ll_fila,'c_monto_final')
			ll_cuotas_pag		= dw_pagos_stgo.getitemnumber(ll_fila,'cuotas_pag')
			ls_cod_otro			= dw_pagos_stgo.getitemstring(ll_fila,'codigo_otro')
			ls_rezago			= dw_pagos_stgo.getitemstring(ll_fila,'rezago')
			if not isnull(ll_rut) and ll_rut > 0 and ll_monto > 0 and not isnull(ll_monto) then
				ls_fecha						= string(ldt_fecha_pago,'ddmmyyyy')
				ls_linea						= ls_linea+ls_fecha
				ll_largo						= len(String(ll_rut))
				if ll_largo < 8 then
					ll_blanco					= 8 - ll_largo
				else
					ll_blanco					= 0
				end if
				ls_linea						= ls_linea+fill('0',ll_blanco)+string(ll_rut)+ls_dv
				if ls_rezago='S' then
					ls_linea					= ls_linea+'0'
				elseif ls_base='C' then
					ls_linea					= ls_linea+ls_serie
				elseif ls_base='P' then
					SELECT	"PAGARE"."SERIE"  
					INTO 		:ls_serie_corr  
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ls_linea				= ls_linea+ls_serie_corr
					else
						ls_linea				= ls_linea+'X'
					end if
				end if
				
				ll_largo						= len(String(ll_numero))
				if ll_largo < 6 then
					ll_blanco					= 6 - ll_largo
				else
					ll_blanco					= 0
				end if
				ls_linea						= ls_linea+fill('0',ll_blanco)+string(ll_numero)
				if ls_tipo_mov='L' then
					SELECT	"RETIRO_PAGOS_OTROS"."CODIGO_OTRO_SANTIAGO"  
					INTO 		:ls_cod_retiro_otros  
					FROM 	"RETIRO_PAGOS_OTROS"  
					WHERE  ( "RETIRO_PAGOS_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
							 ( "RETIRO_PAGOS_OTROS"."CODIGO_OTRO" = :ls_cod_otro ) AND
							 ( "RETIRO_PAGOS_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob )
					USING		Trans_2 ;
				else
					SELECT	"RETIRO_PAGOS_OTROS"."CODIGO_OTRO_SANTIAGO"  
					INTO 		:ls_cod_retiro_otros  
					FROM 	"RETIRO_PAGOS_OTROS"  
					WHERE  ( "RETIRO_PAGOS_OTROS"."TIPO_COB" = :ls_tipo_mov ) AND  
							 ( "RETIRO_PAGOS_OTROS"."TIPO_COMPROBANTE" = :ls_tipo_cob )
					USING		Trans_2 ;
				end if
				ls_linea					= ls_linea+ls_cod_retiro_otros
				ls_linea_bkp				= ls_linea
				if ll_cuotas_pag = 1 and ls_tipo_mov='E' then
					if ls_tipo_cob='CU' then
						SELECT	"CUPONERAS_DETALLE"."NRO_CUOTA"  
						INTO 		:ll_max_nro_cuota  
						FROM 		"CUPONERAS_DETALLE"  
						WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_folio   
						USING		Trans_1;
					else
						SELECT	"PAGARE"."CTA_PAG_LA",   
									"PAGARE"."CTA_PAG_ISA"  
						INTO 		:ll_cta_pag_la,   
									:ll_cta_pag_isa  
						FROM 		"PAGARE"  
						WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
								 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
						USING		Trans_1;
						if isnull(ll_cta_pag_la) then ll_cta_pag_la=0
						if isnull(ll_cta_pag_isa) then ll_cta_pag_isa=0
						ll_max_nro_cuota		= ll_cta_pag_la + ll_cta_pag_isa
					end if

					SELECT	"CUPONERAS_DETALLE"."NRO_CUPON", "CUPONERAS_DETALLE"."MONTO_CUOTA_PESO"
					INTO 		:ll_nro_cupon,							:ll_monto_pagar  
					FROM 		"CUPONERAS",   
								"CUPONERAS_DETALLE"  
					WHERE  ( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
							 ( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
							 ( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
							 ( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
							 (("CUPONERAS"."BASE" = :ls_base ) AND  
							 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
							 ( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
							 ( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov ) AND  
							 ( "CUPONERAS_DETALLE"."NRO_CUOTA" = :ll_max_nro_cuota ) AND
							 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
							 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) )   
					USING		Trans_2;
					if ll_monto_pagar=0 or isnull(ll_monto_pagar) then
						ll_nro_cupon			= ll_folio
						ll_monto_pagar			= ll_monto
					end if
					if isnull(ll_nro_cuota) or ll_nro_cuota=0 then ll_nro_cuota=ll_max_nro_cuota
					ll_largo						= len(String(ll_nro_cuota))
					if ll_largo < 4 then
						ll_blanco				= 4 - ll_largo
					else
						ll_blanco				= 0
					end if
					if ls_rezago='S' then
						ls_linea					= ls_linea+'0000'
					else
						ls_linea					= ls_linea+fill('0',ll_blanco)+string(ll_nro_cuota)
					end if
					ll_largo						= len(String(ll_nro_cupon))
					if ll_largo < 8 then
						ll_blanco				= 8 - ll_largo
					else
						ll_blanco				= 0
					end if
					if ls_rezago='S' then
						ls_linea					= ls_linea+'00000000'
					else
						ls_linea					= ls_linea+fill('0',ll_blanco)+string(ll_nro_cupon)
					end if
					
					ll_largo						= len(String(ll_monto_pagar))
					if ll_largo < 8 then
						ll_blanco				= 8 - ll_largo
					else
						ll_blanco				= 0
					end if
					ls_linea						= ls_linea+fill('0',ll_blanco)+string(ll_monto_pagar)
					ll_new						= dw_pagos.insertrow(0)
					dw_pagos.setitem(ll_new,'linea',ls_linea)

				elseif ll_cuotas_pag = 1 and ls_tipo_mov='F' then
					SELECT	"CONTRATO"."CTA_PAG_M",	"CONTRATO"."FECHA_M"  
					INTO 		:ll_max_nro_cuota,		:ldt_fecha_m
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ll_anno						= year(date(ldt_fecha_m))
						ll_nro_cuota_mant			= ( ll_anno + ll_max_nro_cuota ) - 1
						if ls_rezago='S' then
							ls_linea					= ls_linea+'0000'
						else
							ls_linea					= ls_linea+string(ll_nro_cuota_mant)
						end if
						ls_year						= string(ll_nro_cuota_mant)
						SELECT	"CUPONERAS_DETALLE"."NRO_CUPON",		"CUPONERAS_DETALLE"."MONTO_CUOTA_PESO"
						INTO 		:ll_nro_cupon,								:ll_monto_pagar
						FROM 		"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."RUT" = :ll_rut ) AND  
								 ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) AND  
								 ( substr(to_char("CUPONERAS_DETALLE"."FECHA_VENC",'dd/mm/yyyy'),7,4) = :ls_year ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
						USING		Trans_2 ;
						if ll_monto_pagar=0 or isnull(ll_monto_pagar) then
							ll_nro_cupon			= ll_folio
							ll_monto_pagar			= ll_monto
						end if
						ll_largo						= len(String(ll_nro_cupon))
						if ll_largo < 8 then
							ll_blanco				= 8 - ll_largo
						else
							ll_blanco				= 0
						end if
						if ls_rezago='S' then
							ls_linea					= ls_linea+'00000000'
						else
							ls_linea					= ls_linea+fill('0',ll_blanco)+string(ll_nro_cupon)
						end if
						ll_largo						= len(String(ll_monto_pagar))
						if ll_largo < 8 then
							ll_blanco				= 8 - ll_largo
						else
							ll_blanco				= 0
						end if
						ls_linea						= ls_linea+fill('0',ll_blanco)+string(ll_monto_pagar)
					end if
					ll_new							= dw_pagos.insertrow(0)
					dw_pagos.setitem(ll_new,'linea',ls_linea)
					
				elseif ls_tipo_mov<>'E' and ls_tipo_mov<>'F' then
					if ls_rezago='S' then
						ls_linea					= ls_linea+'0000'
						ls_linea					= ls_linea+'00000000'
					elseif ls_base='C' then
						SELECT	"CONTRATO"."CTA_PAG_M",	"CONTRATO"."FECHA_M"  
						INTO 		:ll_max_nro_cuota,		:ldt_fecha_m
						FROM 		"CONTRATO"  
						WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
								 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							ll_anno						= year(date(ldt_fecha_m))
							ll_nro_cuota_mant			= ( ll_anno + ll_max_nro_cuota ) - 1
							if ls_rezago='S' then
								ls_linea					= ls_linea+'0000'
							else
								ls_linea					= ls_linea+string(ll_nro_cuota_mant)
							end if
							ls_year						= string(ll_nro_cuota_mant)
							
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON",		"CUPONERAS_DETALLE"."MONTO_CUOTA_PESO"
							INTO 		:ll_nro_cupon,								:ll_monto_pagar
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."RUT" = :ll_rut ) AND  
									 ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) AND  
									 ( substr(to_char("CUPONERAS_DETALLE"."FECHA_VENC",'dd/mm/yyyy'),7,4) = :ls_year ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
							USING		Trans_2 ;
							if ll_monto_pagar=0 or isnull(ll_monto_pagar) then
								ll_nro_cupon			= ll_folio
							end if
							ll_largo						= len(String(ll_nro_cupon))
							if ll_largo < 8 then
								ll_blanco				= 8 - ll_largo
							else
								ll_blanco				= 0
							end if
							if ls_rezago='S' then
								ls_linea					= ls_linea+'00000000'
							else
								ls_linea					= ls_linea+fill('0',ll_blanco)+string(ll_nro_cupon)
							end if
						end if

					elseif ls_base='P' then
						if ls_tipo_cob='CU' then
							SELECT	"CUPONERAS_DETALLE"."NRO_CUOTA"  
							INTO 		:ll_max_nro_cuota  
							FROM 		"CUPONERAS_DETALLE"  
							WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_folio   
							USING		Trans_1;
						else
							SELECT	"PAGARE"."CTA_PAG_LA",   
										"PAGARE"."CTA_PAG_ISA"  
							INTO 		:ll_cta_pag_la,   
										:ll_cta_pag_isa  
							FROM 		"PAGARE"  
							WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
									 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
							USING		Trans_1;
							if isnull(ll_cta_pag_la) then ll_cta_pag_la=0
							if isnull(ll_cta_pag_isa) then ll_cta_pag_isa=0
							ll_max_nro_cuota		= ll_cta_pag_la + ll_cta_pag_isa
						end if
						if isnull(ll_nro_cuota) or ll_nro_cuota=0 then ll_nro_cuota=ll_max_nro_cuota
						SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
						INTO 		:ll_nro_cupon  
						FROM 		"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."NRO_CUOTA" = :ll_nro_cuota ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
						USING		Trans_2;
						if Trans_2.sqlcode=0 then
							ll_largo						= len(String(ll_nro_cuota))
							if ll_largo < 4 then
								ll_blanco				= 4 - ll_largo
							else
								ll_blanco				= 0
							end if
							if ls_rezago='S' then
								ls_linea					= ls_linea+'0000'
							else
								ls_linea					= ls_linea+fill('0',ll_blanco)+string(ll_nro_cuota)
							end if
							ll_largo						= len(String(ll_folio))
							if ll_largo < 8 then
								ll_blanco				= 8 - ll_largo
							else
								ll_blanco				= 0
							end if
							if ls_rezago='S' then
								ls_linea					= ls_linea+'00000000'
							else
								ls_linea					= ls_linea+fill('0',ll_blanco)+string(ll_folio)
							end if
						else
							ls_linea						= ls_linea+'0000'+'00000000'
						end if
					end if
					ll_largo								= len(String(ll_monto))
					if ll_largo < 8 then
						ll_blanco						= 8 - ll_largo
					else
						ll_blanco						= 0
					end if
					ls_linea								= ls_linea+fill('0',ll_blanco)+string(ll_monto)
					ll_new								= dw_pagos.insertrow(0)
					dw_pagos.setitem(ll_new,'linea',ls_linea)
					
				elseif ll_cuotas_pag > 1 and ls_tipo_mov = 'E' then
					SELECT	"PAGARE"."CTA_PAG_LA",   
								"PAGARE"."CTA_PAG_ISA"  
					INTO 		:ll_cta_pag_la,   
								:ll_cta_pag_isa  
					FROM 		"PAGARE"  
					WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
							 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
					USING		Trans_1 ;
					if isnull(ll_cta_pag_la) then ll_cta_pag_la=0
					if isnull(ll_cta_pag_isa) then ll_cta_pag_isa=0
					ll_max_nro_cuota					= ll_cta_pag_la + ll_cta_pag_isa
					ll_nro_cuota						= ll_max_nro_cuota
					ll_monto_pagar						= round(ll_monto / ll_cuotas_pag,0)
					for ll_indi = 1 to ll_cuotas_pag
						SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
						INTO 		:ll_nro_cupon
						FROM 		"CUPONERAS",   
									"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS"."BASE" = "CUPONERAS_DETALLE"."BASE" ) and  
								 ( "CUPONERAS"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
								 ( "CUPONERAS"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
								 ( "CUPONERAS"."NRO_CUPONERA" = "CUPONERAS_DETALLE"."NRO_CUPONERA" ) and  
								 (("CUPONERAS"."BASE" = :ls_base ) AND  
								 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
								 ( "CUPONERAS"."NUMERO" = :ll_numero ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov ) AND  
								 ( "CUPONERAS_DETALLE"."NRO_CUOTA" = :ll_nro_cuota ) AND
								 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' ) AND  
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) )   
						USING		Trans_2;
						ll_largo						= len(String(ll_nro_cuota))
						if ll_largo < 4 then
							ll_blanco				= 4 - ll_largo
						else
							ll_blanco				= 0
						end if
						if ls_rezago='S' then
							ls_linea_bkp			= ls_linea+'0000'
						else
							ls_linea_bkp			= ls_linea+fill('0',ll_blanco)+string(ll_nro_cuota)
						end if
						ll_largo						= len(String(ll_folio))
						if ll_largo < 8 then
							ll_blanco				= 8 - ll_largo
						else
							ll_blanco				= 0
						end if
						if ls_rezago='S' then
							ls_linea_bkp			= ls_linea_bkp+'00000000'
						else
							ls_linea_bkp			= ls_linea_bkp+fill('0',ll_blanco)+string(ll_folio)
						end if
						ll_largo						= len(String(ll_monto_pagar))
						if ll_largo < 8 then
							ll_blanco				= 8 - ll_largo
						else
							ll_blanco				= 0
						end if
						ls_linea_bkp				= ls_linea_bkp+fill('0',ll_blanco)+string(ll_monto_pagar)
						ll_nro_cuota				= ll_nro_cuota - 1
						ll_new						= dw_pagos.insertrow(0)
						dw_pagos.setitem(ll_new,'linea',ls_linea_bkp)
						ls_linea_bkp				= ''
					next
					
				elseif ll_cuotas_pag > 1 and ls_tipo_mov = 'F' then
					SELECT	"CONTRATO"."CTA_PAG_M",	"CONTRATO"."FECHA_M"  
					INTO 		:ll_max_nro_cuota,		:ldt_fecha_m
					FROM 		"CONTRATO"  
					WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
							 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						ll_anno							= year(date(ldt_fecha_m))
						ll_nro_cuota_mant				= ( ll_anno + ll_max_nro_cuota ) - 1
						ll_monto_pagar					= round(ll_monto / ll_cuotas_pag,0)
						for ll_indi=1 to ll_cuotas_pag
							ls_year						= String(ll_nro_cuota_mant)
							if ls_rezago='S' then
								ls_linea_bkp			= ls_linea+'0000'
							else
								ls_linea_bkp			= ls_linea + string(ll_nro_cuota_mant)
							end if
							SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		:ll_nro_cupon
							FROM 		"CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."RUT" = :ll_rut ) AND  
									 ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
									 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
									 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
									 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'C' ) AND  
									 ( substr(to_char("CUPONERAS_DETALLE"."FECHA_VENC",'dd/mm/yyyy'),7,4) = :ls_year ) AND  
									 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
							USING		Trans_2 ;
							ll_largo						= len(String(ll_folio))
							if ll_largo < 8 then
								ll_blanco				= 8 - ll_largo
							else
								ll_blanco				= 0
							end if
							if ls_rezago='S' then
								ls_linea_bkp			= ls_linea_bkp+'00000000'
							else
								ls_linea_bkp			= ls_linea_bkp+fill('0',ll_blanco)+string(ll_folio)
							end if
							ll_largo						= len(String(ll_monto_pagar))
							if ll_largo < 8 then
								ll_blanco				= 8 - ll_largo
							else
								ll_blanco				= 0
							end if
							ls_linea_bkp				= ls_linea_bkp + fill('0',ll_blanco)+string(ll_monto_pagar)
							ll_new						= dw_pagos.insertrow(0)
							dw_pagos.setitem(ll_new,'linea',ls_linea_bkp)
							ll_nro_cuota_mant			= ll_nro_cuota_mant - 1
							ls_linea_bkp				= ''
						next
					end if
				end if
			end if
			Setnull(ll_rut);Setnull(ls_base);Setnull(ls_serie);Setnull(ll_numero);Setnull(ll_folio);Setnull(ll_monto)
			Setnull(ll_nro_cuota)
			ls_linea										= ''
			ls_linea_bkp								= ''
		next
	end if

	if dw_pagos.rowcount()>0 then
		dw_paso				= dw_pagos
		f_DWToExcel( dw_paso )
	end if
end if
end event

type st_ultimo from statictext within tabpage_1
integer x = 1106
integer y = 1344
integer width = 631
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_proceso from picturebutton within tabpage_1
integer x = 910
integer y = 1308
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_hoy
String	ls_fecha_hoy,ls_string,ls_monto_total,ls_numero_cliente,ls_rut,ls_referencia,ls_tipo_documento,ls_numero_documento,ls_fecha_emision,ls_saldo_anterior,&
			ls_fecha_vencimiento,ls_interes,ls_cobranza_externa,ls_cuota,ls_base,ls_serie,ls_string_estado
Long		ll_tot_reg,ll_rut,ll_cant_reg,ll_largo,ll_blanco,ll_new,ll_indi,ll_new_estado
DateTime	ldt_fecha_hoy
Double	ldb_uf_dia,ldb_tasa_peso,ldb_tasa_uf,id_factor_gc,ldb_interes_gc,ll_numero

SetPointer(HourGlass!)
st_ultimo.text							= ''

tab_1.tabpage_1.dw_lista.reset()
tab_1.SelectedTab						= 1
ldt_fecha_hoy							= datetime(date(em_desde.text),time('00:00:00'))

SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_uf_dia
FROM 	"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
USING	sqlca;
if sqlca.sqlcode = 0 then
	SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
	
	SELECT	"TASA"."TASA_INT_P",		"TASA"."TASA_INT_UF",		"TASA"."GASTO_COB_MORA",		"TASA"."GASTO_COB_MORA"
   	INTO    	:ldb_tasa_peso, 				:ldb_tasa_uf,					:id_factor_gc,							:ldb_interes_gc
   	FROM    "TASA"  
   	WHERE   "TASA"."LOOK" = 1  ;
	
	DECLARE sp_proc_cadena_mora_servipag PROCEDURE FOR sp_cadena_mora_servipag2(:ldt_fecha_hoy);
	EXECUTE sp_proc_cadena_mora_servipag;
	
	DECLARE sp_proc_servipag PROCEDURE FOR sp_crear_archivo_servipag(	:ldt_fecha_hoy, :ldb_uf_dia, :ldb_tasa_peso, :ldb_tasa_uf, :id_factor_gc, :ldb_interes_gc );
	EXECUTE sp_proc_servipag;
	
//	DECLARE sp_proc_servipag2 PROCEDURE FOR sp_crear_archivo_servipag2(	:ldt_fecha_hoy, :ldb_uf_dia, :ldb_tasa_peso, :ldb_tasa_uf, :id_factor_gc, :ldb_interes_gc );
//	EXECUTE sp_proc_servipag2;
	ld_fecha_hoy						= date(em_desde.text)
	ls_fecha_hoy						= string(year(ld_fecha_hoy),"0000")+string(month(ld_fecha_hoy),"00")+string(day(ld_fecha_hoy),"00")
	ll_tot_reg							= tab_1.tabpage_1.dw_lista.retrieve()
	dw_servipag.retrieve()
	dw_baestado.retrieve()
	if ll_tot_reg>0 then
		SELECT 	SUM("SERVIPAG_STRING_SERVIPAG"."MONTO_TOTAL" )
		INTO 		:ls_monto_total  
		FROM 	"SERVIPAG_STRING_SERVIPAG"  ;

		if gs_conexion = "Parque El Prado" then
			ll_rut							= 968440004
		else
			ll_rut							= 968359703
		end if
		ls_string							= '0'+string(ll_rut)+ls_fecha_hoy+'SERVIPAG'
		ls_string_estado				= '0'+string(ll_rut)+ls_fecha_hoy+'BAESTADO'
		
		ll_cant_reg						= tab_1.tabpage_1.dw_lista.rowcount()
		ll_largo							= len(string(ll_cant_reg))
		if ll_largo<6 then
			ll_blanco						= 6 - ll_largo
		end if
		ls_string							= ls_string+fill('0',ll_blanco)+string(ll_cant_reg)
		ls_string_estado				= ls_string_estado+fill('0',ll_blanco)+string(ll_cant_reg)
		
//		ls_monto_total					= string(tab_1.tabpage_1.dw_lista.getitemnumber(1,'c_suma_total'))
		ll_largo							= len(ls_monto_total)
		if ll_largo<14 then
			ll_blanco						= 14 - ll_largo
		end if
		ls_string							= ls_string+fill('0',ll_blanco)+string(ls_monto_total)
		ls_string							= ls_string+fill(' ',91)				//83)
		ls_string_estado				= ls_string_estado+fill('0',ll_blanco)+string(ls_monto_total)
		ls_string_estado				= ls_string_estado+fill(' ',91)	//83)
		
		ll_new							= dw_servipag.insertrow(1)
		ll_new_estado					= dw_baestado.insertrow(1)
		
		dw_servipag.setitem(ll_new,'string',ls_string)
		dw_baestado.setitem(ll_new_estado,'string',ls_string_estado)
	
//		for ll_indi=1 to ll_tot_reg
//			ls_numero_cliente			= trim(tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'numero_cliente'))
//			ll_largo						= len(ls_numero_cliente)
//			if ll_largo<10 then
//				ll_blanco					= 10 - ll_largo
//				ls_string					= fill('0',ll_blanco)+ls_numero_cliente
//				ls_string_estado		= fill('0',ll_blanco)+ls_numero_cliente
//			else
//				ls_string					= ls_numero_cliente
//				ls_string_estado		= ls_numero_cliente
//			end if
//	
//			ls_rut							= trim(tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'rut'))
//			ll_largo						= len(ls_rut)
//			if ll_largo<10 then
//				ll_blanco					= 10 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_rut
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_rut
//			else
//				ls_string					= ls_string+ls_rut
//				ls_string_estado		= ls_string_estado+ls_rut
//			end if
//	
//			ls_referencia				= tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'referencia')
//			ll_largo						= len(ls_referencia)
//			if ll_largo<55 then
//				ll_blanco					= 55 - ll_largo
//				ls_string					= ls_string+ls_referencia+fill(' ',ll_blanco)
//				ls_string_estado		= ls_string_estado+ls_referencia+fill(' ',ll_blanco)
//			else
//				ls_string					= ls_string+ls_referencia
//				ls_string_estado		= ls_string_estado+ls_referencia
//			end if
//			ls_tipo_documento			= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'tipo_documento'))
//			ls_string						= ls_string+ls_tipo_documento
//			ls_string_estado			= ls_string_estado+ls_tipo_documento
//			
//			ls_numero_documento	= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'numero_documento'))
//			ll_largo						= len(ls_numero_documento)
//			if ll_largo<10 then
//				ll_blanco					= 10 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_numero_documento
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_numero_documento
//			else
//				ls_string					= ls_string+ls_numero_documento
//				ls_string_estado		= ls_string_estado+ls_numero_documento
//			end if
//	
//			ls_fecha_emision			= trim(tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'fecha_emision'))
//			ls_string						= ls_string+ls_fecha_emision
//			ls_string_estado			= ls_string_estado+ls_fecha_emision
//	
//			ls_monto_total				= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'monto_total'))
//			ll_largo						= len(ls_monto_total)
//			if ll_largo<8 then
//				ll_blanco					= 8 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_monto_total
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_monto_total
//			else
//				ls_string					= ls_string+ls_monto_total
//				ls_string_estado		= ls_string_estado+ls_monto_total
//			end if
//	
//			ls_saldo_anterior			= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'saldo_anterior'))
//			ll_largo						= len(ls_saldo_anterior)
//			if ll_largo<8 then
//				ll_blanco					= 8 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_saldo_anterior
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_saldo_anterior
//			else
//				ls_string					= ls_string+ls_saldo_anterior
//				ls_string_estado		= ls_string_estado+ls_saldo_anterior
//			end if
//			
//			ls_fecha_vencimiento		= trim(tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'fecha_vencimiento'))
//			ls_string						= ls_string+ls_fecha_vencimiento
//			ls_string_estado			= ls_string_estado+ls_fecha_vencimiento
//			
//			ls_interes					= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'interes'))
//			ll_largo						= len(ls_interes)
//			if ll_largo<8 then
//				ll_blanco					= 8 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_interes
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_interes
//			else
//				ls_string					= ls_string+ls_interes
//				ls_string_estado		= ls_string_estado+ls_interes
//			end if
//			
//			ls_cobranza_externa	= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cobranza_externa'))
//			ll_largo						= len(ls_cobranza_externa)
//			if ll_largo<8 then
//				ll_blanco					= 8 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_cobranza_externa
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_cobranza_externa
//			else
//				ls_string					= ls_string+ls_cobranza_externa
//				ls_string_estado		= ls_string_estado+ls_cobranza_externa
//			end if
//			
//			ls_cuota						= string(tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'cuota'))
//			ll_largo						= len(ls_cuota)
//			if ll_largo<3 then
//				ll_blanco					= 3 - ll_largo
//				ls_string					= ls_string+fill('0',ll_blanco)+ls_cuota
//				ls_string_estado		= ls_string_estado+fill('0',ll_blanco)+ls_cuota
//			else
//				ls_string					= ls_string+ls_cuota
//				ls_string_estado		= ls_string_estado+ls_cuota
//			end if
//			ll_new						= dw_servipag.insertrow(0)
//			ll_new_estado				= dw_baestado.insertrow(0)
//			
//			dw_servipag.scrolltorow(ll_new)
//			dw_baestado.scrolltorow(ll_new_estado)
//			dw_servipag.setitem(ll_new,'linea',ls_string)
//			dw_baestado.setitem(ll_new_estado,'linea',ls_string_estado)
//		next
		dw_servipag.accepttext()
		dw_baestado.accepttext()
		SELECT 	"SERVIPAG_ULTIMO"."BASE",	"SERVIPAG_ULTIMO"."SERIE",	"SERVIPAG_ULTIMO"."NUMERO"  
		INTO 		:ls_base,   					:ls_serie,   					:ll_numero  
		FROM 		"SERVIPAG_ULTIMO"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			st_ultimo.text			= 'Ultimo Ctto '+ls_base+'-'+ls_serie+'-'+string(ll_numero)
		else
			st_ultimo.text			= ''
		end if
	end if
	SELECT sysdate  INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
	messagebox("Advertencia","Proceso Terminado")
else
	messagebox("Advertencia","Debe Ingresar U.F. del dia "+string(ldt_fecha_hoy,"dd/mm/yyyy"))
end if
SetPointer(Arrow!)
end event

type p_1 from picture within tabpage_1
integer x = 809
integer y = 1332
integer width = 78
integer height = 88
boolean originalsize = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type em_desde from editmask within tabpage_1
integer x = 434
integer y = 1336
integer width = 366
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;tab_1.tabpage_1.dw_lista.reset()
end event

type st_2 from statictext within tabpage_1
integer x = 18
integer y = 1348
integer width = 407
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Proceso:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_expor from commandbutton within tabpage_1
integer x = 2784
integer y = 1320
integer width = 434
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Archivo"
end type

event clicked;Datawindow	dw_paso
if dw_servipag.rowcount()>0 then
	dw_servipag.accepttext()
	dw_paso				= dw_servipag
//	OpenWithParm(w_exportar_archivo_servipag, dw_paso)
	f_DWToExcel( dw_paso )
end if
end event

type dw_lista from datawindow within tabpage_1
integer x = 32
integer y = 36
integer width = 3191
integer height = 1248
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_servipag"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3255
integer height = 1452
long backcolor = 67108864
string text = " Recuperar Archivo"
long tabtextcolor = 33554432
string picturename = "Continue!"
long picturemaskcolor = 536870912
pb_grabar_ver pb_grabar_ver
cb_exp cb_exp
cb_filtrar cb_filtrar
cb_limpiar cb_limpiar
cb_ver cb_ver
rb_portal rb_portal
rb_express rb_express
cb_print_cupones cb_print_cupones
cb_eliminar cb_eliminar
dw_log_servipag dw_log_servipag
cb_grabar cb_grabar
cb_recuperar cb_recuperar
dw_cargar dw_cargar
gb_2 gb_2
end type

on tabpage_2.create
this.pb_grabar_ver=create pb_grabar_ver
this.cb_exp=create cb_exp
this.cb_filtrar=create cb_filtrar
this.cb_limpiar=create cb_limpiar
this.cb_ver=create cb_ver
this.rb_portal=create rb_portal
this.rb_express=create rb_express
this.cb_print_cupones=create cb_print_cupones
this.cb_eliminar=create cb_eliminar
this.dw_log_servipag=create dw_log_servipag
this.cb_grabar=create cb_grabar
this.cb_recuperar=create cb_recuperar
this.dw_cargar=create dw_cargar
this.gb_2=create gb_2
this.Control[]={this.pb_grabar_ver,&
this.cb_exp,&
this.cb_filtrar,&
this.cb_limpiar,&
this.cb_ver,&
this.rb_portal,&
this.rb_express,&
this.cb_print_cupones,&
this.cb_eliminar,&
this.dw_log_servipag,&
this.cb_grabar,&
this.cb_recuperar,&
this.dw_cargar,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.pb_grabar_ver)
destroy(this.cb_exp)
destroy(this.cb_filtrar)
destroy(this.cb_limpiar)
destroy(this.cb_ver)
destroy(this.rb_portal)
destroy(this.rb_express)
destroy(this.cb_print_cupones)
destroy(this.cb_eliminar)
destroy(this.dw_log_servipag)
destroy(this.cb_grabar)
destroy(this.cb_recuperar)
destroy(this.dw_cargar)
destroy(this.gb_2)
end on

type pb_grabar_ver from picturebutton within tabpage_2
integer x = 2478
integer y = 1304
integer width = 155
integer height = 132
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_num_cupon,ll_count_reg, ll_fila,ll_tot_reg

ll_tot_reg			= dw_cargar.rowcount()
if ll_tot_reg > 0 then
	ll_fila			= dw_cargar.Find("numero = 0", 1, ll_tot_reg)
	if ll_fila > 0 then
		messagebox("Advertencia","No es Posible Grabar, Existe(n) Contrato(s) Inválido(s)")
	else
		ll_num_cupon	= dw_cargar.getitemnumber(1,'nro_cupon')
		SELECT	Count("SERVIPAG_RECUPERA"."NRO_CUPON")
		INTO 		:ll_count_reg  
		FROM 		"SERVIPAG_RECUPERA"  
		WHERE 	"SERVIPAG_RECUPERA"."NRO_CUPON" = :ll_num_cupon   
		USING		sqlca;
		if ll_count_reg = 0 then
			if dw_cargar.update() = 1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		elseif ll_count_reg > 0 then
			messagebox("Advertencia","No es Posible Grabar PAGOS, ya existe(n) en Tabla SERVIPAG_RECUPERA")
		end if
	end if
end if
end event

type cb_exp from commandbutton within tabpage_2
integer x = 960
integer y = 1332
integer width = 219
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_cargar
if dw_cargar.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_filtrar from commandbutton within tabpage_2
integer x = 768
integer y = 1332
integer width = 187
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_cargar.SETfilter(NULO)
dw_cargar.filter()
end event

type cb_limpiar from commandbutton within tabpage_2
integer x = 539
integer y = 1332
integer width = 224
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_cargar.reset()
dw_log_servipag.reset()
cb_print_cupones.enabled	= false
dw_lista_cupon_existe.reset()
end event

type cb_ver from commandbutton within tabpage_2
integer x = 2139
integer y = 1320
integer width = 320
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ver Archivo"
end type

event clicked;integer 	value
Long		ll_indi,ll_tot_reg,ll_numero_cupon,ll_rut,ll_interes,ll_cobranza_externa,&
			ll_cuota,ll_monto_cuota,ll_new,ll_cod_parque,ll_existe,&
			ll_ctas_pag_m,ll_nro_cuota,ll_corr
String		docname,ls_linea,ls_rut,ls_dv,ls_tipo_documento,ls_fecha_archivo,&
			ls_numero_cupon,ls_interes,ls_cobranza_externa,ls_cuota,ls_fecha_pago,&
			ls_servipag,ls_tipo_mov,ls_monto_cuota,ls_base,ls_serie,ls_forma_pago,&
			ls_cod_caja,ls_caja,ls_numero_pagare
Date		ld_fecha_pago,ld_fecha_archivo
Double	ll_numero,ll_numero_pagare

cb_limpiar.triggerevent(clicked!)
if gs_conexion	<> "Parque Santiago" then
	dw_servipag.dataobject			= 'dwe_recuperar_servipag'
else
	dw_servipag.dataobject			= 'dwe_recuperar_servipag_stgo'
end if
dw_cargar.dataobject					= 'dw_lista_cargar_servipag_recupera'//dw_ver_archivo_servipag' //dw_lista_cargar_servipag_recupera
dw_servipag.settransobject(sqlca)
dw_cargar.settransobject(sqlca)
dw_servipag.reset()
dw_lista_cupon_existe.reset()
cb_print_cupones.enabled			= false
value 										= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
If value = 1 Then
	SetPointer(HourGlass!)
	dw_servipag.ImportFile(docname)
	ll_tot_reg							= dw_servipag.rowcount()
	if ll_tot_reg > 1 then
		ls_fecha_archivo							= mid(ls_linea,7,2)+'/'+mid(ls_linea,5,2)+'/'+mid(ls_linea,1,4)
		ld_fecha_archivo							= date(ls_fecha_archivo)
		ls_servipag									= mid(ls_linea,9,8)
		if  ls_servipag='BAESTADO' then
//			ls_nom_arch							= 'BE'+mid(ls_nom_arch,3)
			named									= 'BE'+mid(named,3)
		end if
		SELECT	"LOG_SERVIPAG"."CORRELATIVO"  
		INTO 		:ll_corr  
		FROM 		"LOG_SERVIPAG"  
		WHERE 	"LOG_SERVIPAG"."NOMBRE_ARCHIVO" = :named   
		USING		sqlca;

		cb_grabar.enabled					= FALSE
		cb_eliminar.enabled				= FALSE
		if gs_conexion <> "Parque Santiago" then
			ls_linea							= dw_servipag.getitemstring(1,'linea')
			ls_fecha_archivo				= mid(ls_linea,7,2)+'/'+mid(ls_linea,5,2)+'/'+mid(ls_linea,1,4)
			ld_fecha_archivo				= date(ls_fecha_archivo)
			ls_servipag						= mid(ls_linea,9,8)
			if ls_servipag='SERVIPAG' or ls_servipag='BAESTADO' then
				for ll_indi=2 to ll_tot_reg
					ls_linea					= dw_servipag.getitemstring(ll_indi,'linea')
					ls_numero_cupon		= TRIM(mid(ls_linea,27,10))
					ll_numero_cupon		= long(ls_numero_cupon)
					ls_tipo_documento		= TRIM(mid(ls_linea,37,1))
					if ls_tipo_documento='1' then ls_tipo_mov='E'
					if ls_tipo_documento='2' then ls_tipo_mov='F'
					ls_rut					= TRIM(mid(ls_linea,38,10))
					ll_rut					= long(ls_rut)
					ls_dv						= TRIM(mid(ls_linea,48,1))
					ls_interes				= TRIM(mid(ls_linea,49,8))
					ll_interes				= long(ls_interes)
					ls_cobranza_externa	= TRIM(mid(ls_linea,57,8))
					ll_cobranza_externa	= long(ls_cobranza_externa)
					ls_cuota					= TRIM(mid(ls_linea,65,3))
					ll_cuota					= long(ls_cuota)
					if  ls_servipag='SERVIPAG' then
						ls_fecha_pago		= TRIM(mid(ls_linea,165,2))+'/'+TRIM(mid(ls_linea,163,2))+'/'+TRIM(mid(ls_linea,159,4))
					elseif ls_servipag='BAESTADO'  then
						ls_fecha_pago		= TRIM(mid(ls_linea,165,2))+'/'+TRIM(mid(ls_linea,163,2))+'/'+TRIM(mid(ls_linea,159,4))
					end if
					ld_fecha_pago			= date(ls_fecha_pago)
					ls_monto_cuota			= TRIM(mid(ls_linea,118,8))
					ll_monto_cuota			= long(ls_monto_cuota)
					ls_forma_pago			= TRIM(mid(ls_linea,126,2))
					ls_cod_caja				= trim(mid(ls_linea,4,3))
					if ls_cod_caja='051' then
						ls_caja				= 'XZ'
					elseif ls_cod_caja='075' then
						ls_caja				= 'XX'
					else
						ls_caja				= 'XY'
					end if
					if ll_numero_cupon>0 and not isnull(ld_fecha_pago) and (ls_tipo_mov='E' or ls_tipo_mov='F') then
						SELECT	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE"  
						INTO 		:ls_base,				:ls_serie,			:ll_numero,   			:ll_cod_parque  
						FROM 		"CADENA",   "CUPONERAS_DETALLE"  
						WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
								 ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
								 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon ) AND
								 ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
						USING		sqlca;
						if sqlca.sqlcode<>0 then
							ls_base				= ''
							ls_serie				= ''
							ll_numero			= 0
							ll_cod_parque  	= 0
						end if
						ll_new				= dw_cargar.insertrow(0)
						dw_cargar.scrolltorow(ll_new)
						dw_cargar.setitem(ll_new,'correlativo',ll_corr)
						dw_cargar.setitem(ll_new,'nro_cupon',ll_numero_cupon)
						dw_cargar.setitem(ll_new,'tipo_mov',ls_tipo_mov)
						dw_cargar.setitem(ll_new,'rut',ll_rut)
						dw_cargar.setitem(ll_new,'nro_cuota',ll_cuota)
						if ll_interes>0 then
							ll_monto_cuota	= ll_monto_cuota - ll_interes
						end if
						if ll_cobranza_externa>0 then
							ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
						end if
						dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
						dw_cargar.setitem(ll_new,'interes',ll_interes)
						dw_cargar.setitem(ll_new,'gasto_cob',ll_cobranza_externa)
						dw_cargar.setitem(ll_new,'fecha_pago',ld_fecha_pago)
						dw_cargar.setitem(ll_new,'forma_pago',ls_forma_pago)
						dw_cargar.setitem(ll_new,'cod_caja',ls_caja)
						dw_cargar.setitem(ll_new,'base',ls_base)
						dw_cargar.setitem(ll_new,'serie',ls_serie)
						dw_cargar.setitem(ll_new,'numero',ll_numero)
						dw_cargar.setitem(ll_new,'cod_parque',ll_cod_parque)
						dw_cargar.setitem(ll_new,'nombre_archivo',named)
					end if
				next
				
			else
				messagebox("Advertencia","Archivo a Cargar No Corresponde a Servipag")
			end if

		elseif gs_conexion = "Parque Santiago" then
			ld_fecha_pago				= DATE(mid(named,7,2)+'/'+mid(named,5,2)+'/'+mid(named,1,4))
			ld_fecha_archivo			= DATE(gdt_fec_sistema)
			ls_caja						= 'X5'
			ls_forma_pago				= 'EF'
			for ll_indi=1 to ll_tot_reg
				ls_linea					= dw_servipag.getitemstring(ll_indi,'linea')
				ls_numero_pagare		= TRIM(mid(ls_linea,12,4))
				ll_numero_pagare		= long(ls_numero_pagare)
				ls_tipo_documento		= TRIM(mid(ls_linea,16,2))
				if ls_tipo_documento='01' then ls_tipo_mov='E'
				if ls_tipo_documento='30' then ls_tipo_mov='F'
				ls_rut					= TRIM(mid(ls_linea,1,11))
				ll_rut					= long(ls_rut)
				ls_dv						= TRIM(mid(ls_linea,20,1))
				ls_cuota					= TRIM(mid(ls_linea,18,2))
				ll_cuota					= long(ls_cuota)
				ls_monto_cuota			= TRIM(mid(ls_linea,21,8))
				ll_monto_cuota			= long(ls_monto_cuota)
				ll_interes				= 0
				ll_cobranza_externa	= 0
				Setnull(ls_base);Setnull(ls_serie);Setnull(ll_numero);Setnull(ll_cod_parque);Setnull(ll_numero_cupon)
				if not isnull(ld_fecha_pago) and (ls_tipo_mov='E' or ls_tipo_mov='F') then
					if ls_tipo_mov='E' then
						SELECT	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE",	"CUPONERAS_DETALLE"."NRO_CUPON"
						INTO 		:ls_base,				:ls_serie,			:ll_numero,   			:ll_cod_parque,			:ll_numero_cupon  
						FROM 		"CADENA",   "CUPONERAS_DETALLE"  
						WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
								 ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
								 ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
								 ( "CUPONERAS_DETALLE"."NRO_CUOTA" = :ll_cuota ) AND 
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov ) AND
								 ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
						USING		sqlca;
					elseif ls_tipo_mov='F' then
						SELECT	MIN("CUPONERAS_DETALLE"."NRO_CUPON")  
						INTO 		:ll_numero_cupon  
						FROM 		"CUPONERAS_DETALLE"  
						WHERE  ( "CUPONERAS_DETALLE"."RUT" = :ll_rut ) AND  
								 ( "CUPONERAS_DETALLE"."SERIE" = '0' ) AND  
								 ( "CUPONERAS_DETALLE"."BASE" = 'C' ) AND  
								 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND
								 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
						USING		sqlca;
						if ll_numero_cupon > 0 then
							SELECT	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE",	"CONTRATO"."CTA_PAG_M"  
							INTO		:ls_base,				:ls_serie,			:ll_numero,				:ll_cod_parque,			:ll_ctas_pag_m  
							FROM		"CADENA",	"CONTRATO",	"CUPONERAS_DETALLE"  
							WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
									 ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
									 ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
									 ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
									 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
									 ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon ) AND
								 	 ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
							USING		sqlca;
							if ll_ctas_pag_m > 0 then
								ll_cuota	= ll_ctas_pag_m + 1
							else
								ll_cuota	= 1
							end if
						end if
					end if
					if sqlca.sqlcode<>0 then
						ls_base				= ''
						ls_serie				= ''
						ll_numero			= 0
						ll_cod_parque  	= 0
					end if
					
					ll_new				= dw_cargar.insertrow(0)
					dw_cargar.scrolltorow(ll_new)
					dw_cargar.setitem(ll_new,'correlativo',ll_corr)
					dw_cargar.setitem(ll_new,'nro_cupon',ll_numero_cupon)
					dw_cargar.setitem(ll_new,'tipo_mov',ls_tipo_mov)
					dw_cargar.setitem(ll_new,'rut',ll_rut)
					dw_cargar.setitem(ll_new,'nro_cuota',ll_cuota)
					if ll_interes>0 then
						ll_monto_cuota	= ll_monto_cuota - ll_interes
					end if
					if ll_cobranza_externa>0 then
						ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
					end if
					dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
					dw_cargar.setitem(ll_new,'interes',ll_interes)
					dw_cargar.setitem(ll_new,'gasto_cob',ll_cobranza_externa)
					dw_cargar.setitem(ll_new,'fecha_pago',ld_fecha_pago)
					dw_cargar.setitem(ll_new,'forma_pago',ls_forma_pago)
					dw_cargar.setitem(ll_new,'cod_caja',ls_caja)
					dw_cargar.setitem(ll_new,'base',ls_base)
					dw_cargar.setitem(ll_new,'serie',ls_serie)
					dw_cargar.setitem(ll_new,'numero',ll_numero)
					dw_cargar.setitem(ll_new,'cod_parque',ll_cod_parque)
					dw_cargar.setitem(ll_new,'nombre_archivo',named)
				end if
			next
		end if
	end if
	SetPointer(Arrow!)
end if
end event

type rb_portal from radiobutton within tabpage_2
integer x = 2839
integer y = 1204
integer width = 384
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Portal y Caja"
end type

event clicked;String	ls_string
if gs_conexion	= "Parque El Prado" then
	ls_string	= 'mid(nombre_archivo,1,8) = "PDOCPREN"'
else
	ls_string	= 'mid(nombre_archivo,1,8) = "FORCPREN"'
end if
dw_log_servipag.SetFilter(ls_string)
dw_log_servipag.Filter( )
end event

type rb_express from radiobutton within tabpage_2
integer x = 2491
integer y = 1204
integer width = 306
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Express"
boolean checked = true
end type

event clicked;String	ls_string
if gs_conexion	= "Parque El Prado" then
	ls_string	= 'mid(nombre_archivo,1,8) = "PDOSEREN"'
else
	ls_string	= 'mid(nombre_archivo,1,8) = "FORSEREN"'
end if
dw_log_servipag.SetFilter(ls_string)
dw_log_servipag.Filter( )
end event

type cb_print_cupones from commandbutton within tabpage_2
integer x = 1454
integer y = 1320
integer width = 672
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Pagos NO Cargados"
end type

event clicked;if dw_lista_cupon_existe.rowcount()>0 then
	f_printdlg(dw_lista_cupon_existe,gstr_print,w_servipag)
end if
end event

type cb_eliminar from commandbutton within tabpage_2
integer x = 1216
integer y = 1320
integer width = 219
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;if il_row>0 then
	dw_cargar.deleterow(il_row)
end if
end event

type dw_log_servipag from datawindow within tabpage_2
integer x = 2487
integer y = 36
integer width = 745
integer height = 1144
integer taborder = 30
string dataobject = "dw_lista_log_servipag"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_grabar from commandbutton within tabpage_2
integer x = 2784
integer y = 1320
integer width = 434
integer height = 100
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_max_corr,ll_count_reg,ll_numero_cupon,ll_monto_cuota,ll_interes,ll_gasto_cob,ll_rut,ll_ctas_pag_s,ll_ctas_pag_m,&
			ll_tot_pagado_s,ll_tot_pagado_m,ll_nro_cuota,ll_count_seg,ll_monto_seg=0,ll_cod_seguro,ll_monto,ll_cod_parque
String	ls_fecha_archivo,ls_linea,ls_servipag,ls_tipo_mov,ls_serie,ls_base,ls_caja,ls_nombre_archivo,ls_moneda_seg,ls_moneda,ls_tipo_mov_seg
Date		ld_fecha_archivo
Datetime	ld_fecha_pago
Double	ldb_uf_dia,ll_suma_seg,ldb_prima,ll_numero

ll_tot_reg							= dw_cargar.rowcount()
if ll_tot_reg > 0 then
	SetPointer(HourGlass!)
	if gs_conexion <> "Parque Santiago" then
		if dw_cargar.getitemnumber(1,'numero') > 0 then
			ls_linea					= dw_servipag.getitemstring(1,'linea')
			ls_servipag				= mid(ls_linea,9,8)
			if ls_servipag='SERVIPAG' or ls_servipag='BAESTADO' then
				ls_fecha_archivo	= mid(ls_linea,7,2)+'/'+mid(ls_linea,5,2)+'/'+mid(ls_linea,1,4)
				ld_fecha_archivo	= date(ls_fecha_archivo)
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO 		:ldb_uf_dia  
				FROM 		"TAB_UF"  
				WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha_archivo   ;
		
				SELECT	COUNT("LOG_SERVIPAG"."CORRELATIVO")  
				INTO 		:ll_count_reg  
				FROM 		"LOG_SERVIPAG"  
				WHERE 	"LOG_SERVIPAG"."NOMBRE_ARCHIVO" = :named   ;
		
				if ll_count_reg>0 then
					messagebox("Advertencia","No es Posible Cargar, Ya fue Recuperado Archivo "+named)
				else
					SELECT	MAX("LOG_SERVIPAG"."CORRELATIVO")  
					INTO 		:ll_max_corr  
					FROM 	"LOG_SERVIPAG"  ;
					if ll_max_corr > 0 then
						ll_max_corr ++
					else
						ll_max_corr		= 1
					end if
					INSERT INTO "LOG_SERVIPAG"  
								 ( "CORRELATIVO",	"FECHA_ARCHIVO",		"FECHA_CREA",	"USUARIO_CREADOR",	"NOMBRE_ARCHIVO" )  
					VALUES 	 ( :ll_max_corr,			:ld_fecha_archivo,			:gdt_fec_sistema,	:gs_user,					:named )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						for ll_indi=1 to ll_tot_reg
							dw_cargar.setitem(ll_indi,'correlativo',ll_max_corr)
							ll_numero_cupon		= dw_cargar.getitemnumber(ll_indi,'nro_cupon')
							ld_fecha_pago			= dw_cargar.getitemdatetime(ll_indi,'fecha_pago')
							ls_tipo_mov				= dw_cargar.getitemstring(ll_indi,'tipo_mov')
							ll_monto_cuota			= dw_cargar.getitemnumber(ll_indi,'monto_cuota')
							ll_interes					= dw_cargar.getitemnumber(ll_indi,'interes')
							ll_gasto_cob				= dw_cargar.getitemnumber(ll_indi,'gasto_cob')
							ls_serie					= dw_cargar.getitemstring(ll_indi,'serie')
							ll_numero				= dw_cargar.getitemnumber(ll_indi,'numero')
							ls_base					= dw_cargar.getitemstring(ll_indi,'base')
							ll_rut						= dw_cargar.getitemnumber(ll_indi,'rut')
							ls_caja					= trim(dw_cargar.getitemstring(ll_indi,'cod_caja'))
							ll_nro_cuota				= dw_cargar.getitemnumber(ll_indi,'nro_cuota')
							ls_nombre_archivo	= dw_cargar.getitemstring(ll_indi,'nombre_archivo')
							ll_cod_parque			= dw_cargar.getitemnumber(ll_indi,'cod_parque')
							if ls_base <> 'F' then
								if ls_tipo_mov='E' then
									SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
									INTO		:ll_count_seg,												:ll_suma_seg
									FROM 	"SEGURO_ASOCIADOS"  
									WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
											  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
											  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
											  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
											  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
											  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
									USING	sqlca;
									if ll_count_seg > 0 then
										SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
										INTO		:ls_moneda_seg
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
												  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
										USING		sqlca;
										if ls_moneda_seg = '2' then
											ll_monto_seg	= round(ll_suma_seg * gd_uf_dia,0)
										else
											ll_monto_seg	= ll_suma_seg
										end if
										
										DECLARE x1 CURSOR FOR  
										SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",
													"SEGURO_ASOCIADOS"."MONTO_PRIMA",
													"SEGURO_ASOCIADOS"."MONEDA"
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND
												  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
										USING	Trans_1;
										open x1;
										if Trans_1.sqlcode=0 then
											do while Trans_1.sqlcode=0
												fetch x1 into :ll_cod_seguro, :ldb_prima, :ls_moneda;
												if not isnull(ll_cod_seguro) then
													ls_tipo_mov_seg	= string(ll_cod_seguro)
													if ls_moneda='2' then
														ll_monto			= round(ldb_prima * gd_uf_dia,0)
													else
														ll_monto			= ldb_prima
													end if
													INSERT INTO "INGRESO"  
																 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",		"MONTO",	"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST",	"BASE",	"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE" )
													VALUES 	 ( :ll_numero_cupon,	'CU',				:ld_fecha_pago,	:ls_tipo_mov_seg,	:ll_monto,	1,						:ls_serie,		:ll_numero,		:ls_caja,			' ',				:ldb_uf_dia,		'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ld_fecha_pago,	'0',						'N',					null,									:ll_cod_parque )  
													USING		Trans_2;
													if Trans_2.sqlcode=0 then
														commit using Trans_2;
													else
														rollback using Trans_2;
													end if
													
													INSERT INTO "INGRE"  
																 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",		"MONTO",	"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST",	"BASE",	"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"COD_PARQUE")
													VALUES 	 ( :ll_numero_cupon,	'CU',				:ld_fecha_pago,	:ls_tipo_mov_seg,	:ll_monto,	1,						:ls_serie,		:ll_numero,		:ls_caja,			' ',				:ldb_uf_dia,		'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				:ld_fecha_pago,	'0',						'N',					:ll_cod_parque)  
													USING		Trans_2;
													if Trans_2.sqlcode=0 then
														commit using Trans_2;
													else
														rollback using Trans_2;
													end if
												end if
												setnull(ll_cod_seguro)
											loop
										end if
										close x1;
									end if
								end if
//								if ll_monto_seg > 0 then 
//									ll_monto_cuota 	= ll_monto_cuota - ll_monto_seg
//								end if
							
								INSERT INTO "INGRESO"  
											 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",	"TIPO_MOV",	"MONTO",			"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",	"PAGO_HIST",	"BASE",	"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",		"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE" )
								VALUES 	 ( :ll_numero_cupon,	'CU',				:ld_fecha_pago,	:ls_tipo_mov,	:ll_monto_cuota,	1,						:ls_serie,		:ll_numero,		:ls_caja,			' ',				:ldb_uf_dia,		'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,					null,						null,						null,			null,				null,				:ld_fecha_pago,	'0',						'N',					null,									:ll_cod_parque )  
								USING		sqlca;
								if sqlca.sqlcode=0 then
									commit;
									CHOOSE CASE ls_base
										CASE 'O'
											SELECT	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."TOT_PAGADO",	"OFERTA_V"."TOT_PAGADO_M"  
											INTO 		:ll_ctas_pag_s, 			:ll_ctas_pag_m,			:ll_tot_pagado_s, 			:ll_tot_pagado_m  
											FROM 		"OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
											WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
													 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
													 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
													 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
													 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												if ls_tipo_mov='E' then
													ll_ctas_pag_s ++
													ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_cuota
													UPDATE	"OFERTA_V"  
													SET 		"CTA_PAG_S" = :ll_ctas_pag_s,   
																"TOT_PAGADO" = :ll_tot_pagado_s
													WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												elseif ls_tipo_mov='F' then
													ll_ctas_pag_m++
													ll_tot_pagado_m	= ll_tot_pagado_m + ll_monto_cuota
													UPDATE	"OFERTA_V"  
													SET 		"CTA_PAG_M" = :ll_ctas_pag_m,   
																"TOT_PAGADO_M" = :ll_tot_pagado_m  
													WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
															 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											end if
										CASE 'L'
											SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",	"ANEXO_LIBERADOR"."CTA_PAG_M"  
											INTO 		:ll_tot_pagado_s,						:ll_ctas_pag_s  
											FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
											WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
													 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
													 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
													 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ll_ctas_pag_s ++
												ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_cuota
												if ls_tipo_mov='E' then
													UPDATE	"ANEXO_LIBERADOR"  
													SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
																"CTA_PAG_M" = :ll_ctas_pag_s  
													WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
															 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											end if
											
										CASE 'P'
											SELECT	"PAGARE"."TOT_PAGADO",	"PAGARE"."CTA_PAG_LA"   
											INTO 		:ll_tot_pagado_s,			:ll_ctas_pag_s  
											FROM		"CADENA",	"PAGARE"  
											WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
													 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ll_ctas_pag_s ++
												ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_cuota
												if ls_tipo_mov='E' then
													UPDATE	"PAGARE"  
													SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
																"CTA_PAG_LA" = :ll_ctas_pag_s  
													WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
															 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											end if
											
										CASE 'R'
											SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",	"REPACTA_MANTENCION"."TOTAL_PAGADO"  
											INTO 		:ll_ctas_pag_s,								:ll_tot_pagado_s  
											FROM 		"CADENA",	"REPACTA_MANTENCION"  
											WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
													 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
													 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ll_ctas_pag_s ++
												ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_cuota
												if ls_tipo_mov='E' then
													UPDATE	"REPACTA_MANTENCION"  
													SET 		"CTAS_PAGADAS" = :ll_ctas_pag_s,   
																"TOTAL_PAGADO" = :ll_tot_pagado_s  
													WHERE  ( "REPACTA_MANTENCION"."BASE" = :ls_base ) AND  
															 ( "REPACTA_MANTENCION"."SERIE" = :ls_serie ) AND  
															 ( "REPACTA_MANTENCION"."NUMERO" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if	
											end if
											
										CASE 'D'
											SELECT	"DERECHO"."TOT_PAGADO",	"DERECHO"."CTA_PAG_LA"  
											INTO 		:ll_tot_pagado_s,			:ll_ctas_pag_s  
											FROM 		"CADENA",	"DERECHO"  
											WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
													 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ll_ctas_pag_s ++
												ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_cuota
												if ls_tipo_mov='E' then
													UPDATE	"DERECHO"  
													SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
																"CTA_PAG_LA" = :ll_ctas_pag_s  
													WHERE  ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
															 ( "DERECHO"."NRO_PAGARE" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if
											end if
											
										CASE 'A'
											SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",	"ANEXO_AUMENTO"."CTA_PAG_M"  
											INTO 		:ll_tot_pagado_s,					:ll_ctas_pag_s  
											FROM 		"ANEXO_AUMENTO",	"CADENA",	"PAGO_AUMENTO"  
											WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
													 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
													 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
													 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ll_ctas_pag_s ++
												ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_cuota
												if ls_tipo_mov='E' then
													UPDATE	"ANEXO_AUMENTO"  
													SET 		"CTA_PAG_M" = :ll_ctas_pag_s,   
																"TOT_PAGADO" = :ll_tot_pagado_s  
													WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
															 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if	
											end if
											
										CASE 'C'
											SELECT	"CONTRATO"."CTA_PAG_M"  
											INTO 		:ll_ctas_pag_m  
											FROM 		"CADENA",	"CONTRATO"  
											WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
													 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
													 (("CADENA"."CODIGO" = :ls_base ) AND  
													 ( "CADENA"."SERIE" = :ls_serie ) AND  
													 ( "CADENA"."NUMERO" = :ll_numero ) )   
											USING		sqlca;
											if sqlca.sqlcode=0 then
												ll_ctas_pag_m ++
												if ls_tipo_mov='F' then
													UPDATE	"CONTRATO"  
													SET 		"CTA_PAG_M" = :ll_ctas_pag_m  
													WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
															 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
													USING		sqlca;
													if sqlca.sqlcode=0 then
														commit;
													else
														rollback;
													end if
												end if	
											end if
									END CHOOSE
									DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:ls_serie,:ll_numero,'M');
									EXECUTE sp_nuevo_cadena_mora;
									if isnull(ll_interes) then ll_interes=0
									if isnull(ll_gasto_cob) then ll_gasto_cob=0
									if ll_interes > 0 then
										INSERT INTO "INGRESO"  
													 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE" )
										VALUES 	 ( :ll_numero_cupon,	'CU',			:ld_fecha_pago,	'G',				:ll_interes,		0,					:ls_serie,	:ll_numero,	:ls_caja,	' ',			:ldb_uf_dia,	'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,				null,					null,					null,			null,				null,			:ld_fecha_pago,	'0',				'N',				null ,		:ll_cod_parque)  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
									if ll_gasto_cob > 0 then
										INSERT INTO "INGRESO"  
													 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO",	"COD_PARQUE" )
										VALUES 	 ( :ll_numero_cupon,	'CU',			:ld_fecha_pago,	'J',				:ll_gasto_cob,		0,					:ls_serie,	:ll_numero,	:ls_caja,	' ',			:ldb_uf_dia,	'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,				null,					null,					null,			null,				null,			:ld_fecha_pago,	'0',				'N',				null ,	:ll_cod_parque)  
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
									UPDATE	"CUPONERAS_DETALLE"  
									SET 		"ESTADO_PAGO_CUPON" = 'C',   
												"TIPO_COB_PAGO" = 'CU',   
												"FOLIO_PAGO" = :ll_numero_cupon,   
												"FECHA_PAGO" = :ld_fecha_pago,
												"MONTO_CUOTA_PESO" = :ll_monto_cuota,
												"MONTO_INTERES_MORA" = :ll_interes,
												"MONTO_GASTO_COBRANZA" = :ll_gasto_cob
									WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon   
									USING		sqlca;
									if sqlca.sqlcode=0 then
										commit;
									else
										rollback;
									end if
								else
									rollback;
								end if
							end if
						next
						dw_cargar.accepttext()
						if dw_cargar.update()=1 then
							commit;
							messagebox("Grabar","Grabación Exitosa")
							
							tab_1.tabpage_2.dw_log_servipag.retrieve(id_fecha_log)
							dw_cargar.reset()
						else
							rollback;
							messagebox("Error Grabar","Error al Carga SERVIPAG & BANCOESTADO SQL: "+sqlca.sqlerrtext)
						end if
						if dw_lista_cupon_existe.rowcount()>0 then
							cb_print_cupones.enabled	= true
							if dw_lista_cupon_existe.update()=1 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar Cupones Existentes SQL: "+sqlca.sqlerrtext)
							end if
						end if
					else
						rollback;
					end if
				end if
			end if
		else
			messagebox("Advertencia","Debe Verificar Nº Contrato")
		end if
	end if
	tab_1.tabpage_2.dw_log_servipag.retrieve(id_fecha_log)
	SetPointer(Arrow!)
end if
end event

type cb_recuperar from commandbutton within tabpage_2
integer x = 32
integer y = 1320
integer width = 457
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar Archivo"
end type

event clicked;integer 	value
Long		ll_indi,ll_tot_reg,ll_numero_cupon,ll_rut,ll_interes,ll_cobranza_externa,ll_cuota,ll_monto_cuota,ll_new,ll_cod_parque,ll_existe,&
			ll_ctas_pag_m,ll_nro_cuota,ll_count_seg,ll_monto_seg,ll_cod_seguro,ll_monto
String		docname,ls_linea,ls_rut,ls_dv,ls_tipo_documento,ls_fecha_archivo,ls_numero_cupon,ls_interes,ls_cobranza_externa,ls_cuota,ls_fecha_pago,&
			ls_servipag,ls_tipo_mov,ls_monto_cuota,ls_base,ls_serie,ls_forma_pago,ls_cod_caja,ls_caja,ls_numero_pagare,ls_nom_arch,ls_moneda_seg,&
			ls_moneda,ls_tipo_mov_seg
Date		ld_fecha_pago,ld_fecha_archivo,ld_fecha
Double	ll_suma_seg,ldb_prima,ll_numero,ll_numero_pagare
Datetime	ldt_fecha_crea

dw_cargar.dataobject							= 'dw_lista_cargar_servipag_recupera'
dw_cargar.settransobject(sqlca)
cb_limpiar.triggerevent(clicked!)
if gs_conexion	<> "Parque Santiago" then
	dw_servipag.dataobject					= 'dwe_recuperar_servipag'
else
	dw_servipag.dataobject					= 'dwe_recuperar_servipag_stgo'
end if
dw_servipag.settransobject(sqlca)
dw_servipag.reset()
dw_lista_cupon_existe.reset()
cb_print_cupones.enabled					= false
value 												= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
If value = 1 Then
	SetPointer(HourGlass!)
	dw_servipag.ImportFile(docname)
	ls_nom_arch								= UPPER(named)
	ls_linea										= dw_servipag.getitemstring(1,'linea')
	ls_fecha_archivo							= mid(ls_linea,7,2)+'/'+mid(ls_linea,5,2)+'/'+mid(ls_linea,1,4)
	ld_fecha_archivo							= date(ls_fecha_archivo)
	ls_servipag									= mid(ls_linea,9,8)
	if  ls_servipag='BAESTADO' then
		ls_nom_arch							= 'BE'+mid(ls_nom_arch,3)
		named									= 'BE'+mid(named,3)
	end if
	SELECT	"LOG_SERVIPAG"."FECHA_CREA"  
	INTO 		:ldt_fecha_crea  
	FROM 		"LOG_SERVIPAG"  
	WHERE 	"LOG_SERVIPAG"."NOMBRE_ARCHIVO" = :named   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","No Es Posible Cargar Archivo "+named+" ya Fue Realizado Ejecutado el día "+string(ldt_fecha_crea,'dd/mm/yyyy hh:mm'))
		dw_servipag.reset()
	else
		ll_tot_reg								= dw_servipag.rowcount()
		if ll_tot_reg > 1 then
			cb_grabar.enabled					= true
			cb_eliminar.enabled				= true
			if gs_conexion <> "Parque Santiago" then
				ls_linea							= dw_servipag.getitemstring(1,'linea')
				ls_fecha_archivo				= mid(ls_linea,7,2)+'/'+mid(ls_linea,5,2)+'/'+mid(ls_linea,1,4)
				ld_fecha_archivo				= date(ls_fecha_archivo)
				ls_servipag						= mid(ls_linea,9,8)
				
				if ls_servipag='SERVIPAG' then
					for ll_indi=2 to ll_tot_reg
						ls_linea					= dw_servipag.getitemstring(ll_indi,'linea')
						ls_numero_cupon		= TRIM(mid(ls_linea,27,10))
						ll_numero_cupon		= Long(ls_numero_cupon)
						ls_tipo_documento		= TRIM(mid(ls_linea,37,1))
						if ls_tipo_documento='1' then ls_tipo_mov='E'
						if ls_tipo_documento='2' then ls_tipo_mov='F'
						ls_rut						= TRIM(mid(ls_linea,38,10))
						ll_rut						= long(ls_rut)
						ls_dv						= TRIM(mid(ls_linea,48,1))
						ls_interes				= TRIM(mid(ls_linea,49,8))
						ll_interes					= long(ls_interes)
						ls_cobranza_externa	= TRIM(mid(ls_linea,57,8))
						ll_cobranza_externa	= long(ls_cobranza_externa)
						ls_cuota					= TRIM(mid(ls_linea,65,3))
						ll_cuota					= long(ls_cuota)
						ls_fecha_pago			= TRIM(mid(ls_linea,165,2))+'/'+TRIM(mid(ls_linea,163,2))+'/'+TRIM(mid(ls_linea,159,4))
						ld_fecha_pago			= date(ls_fecha_pago)
						ls_monto_cuota		= TRIM(mid(ls_linea,118,8))
						ll_monto_cuota			= long(ls_monto_cuota)
						ls_forma_pago			= TRIM(mid(ls_linea,126,2))
						ls_cod_caja				= trim(mid(ls_linea,4,3))
						if ls_cod_caja='051' then
							ls_caja				= 'XZ'
						elseif ls_cod_caja='075' then
							ls_caja				= 'XX'
						else
							ls_caja				= 'XY'
						end if
						if ll_numero_cupon>0 and not isnull(ld_fecha_pago) and (ls_tipo_mov='E' or ls_tipo_mov='F') then
							SELECT	"CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE"  
							INTO 		:ls_base,					:ls_serie,					:ll_numero,   			:ll_cod_parque  
							FROM 	 "CADENA",   "CUPONERAS_DETALLE"  
							WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
									   ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
									   ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
									   ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon ) AND
									   ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								ls_base				= ''
								ls_serie				= ''
								ll_numero			= 0
								ll_cod_parque  		= 0
							end if
							IF gf_existe_cupon(ll_numero_cupon) = True THEN
								MessageBox("Ingreso Cupón", "El Número de cupón "+string(ll_numero_cupon)+" ya existe")
								ll_existe			= dw_lista_cupon_existe.insertrow(0)
								dw_lista_cupon_existe.setitem(ll_existe,'base',ls_base)
								dw_lista_cupon_existe.setitem(ll_existe,'serie',ls_serie)
								dw_lista_cupon_existe.setitem(ll_existe,'numero',ll_numero)
								dw_lista_cupon_existe.setitem(ll_existe,'nro_cupon',ll_numero_cupon)
								dw_lista_cupon_existe.setitem(ll_existe,'fecha_pago',ld_fecha_pago)
								dw_lista_cupon_existe.setitem(ll_existe,'tipo_mov',ls_tipo_mov)
								if ll_interes>0 then
									ll_monto_cuota	= ll_monto_cuota - ll_interes
								end if
								if ll_cobranza_externa>0 then
									ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
								end if
								dw_lista_cupon_existe.setitem(ll_existe,'monto_cuota',ll_monto_cuota)
								dw_lista_cupon_existe.setitem(ll_existe,'monto_interes',ll_interes)
								dw_lista_cupon_existe.setitem(ll_existe,'monto_gc',ll_cobranza_externa)
								dw_lista_cupon_existe.setitem(ll_existe,'fecha_archivo',ld_fecha_archivo)
							else
								if ll_numero > 0 then
									ll_new				= dw_cargar.insertrow(0)
									dw_cargar.scrolltorow(ll_new)
									dw_cargar.setitem(ll_new,'correlativo',0)
									dw_cargar.setitem(ll_new,'nro_cupon',ll_numero_cupon)
									dw_cargar.setitem(ll_new,'tipo_mov',ls_tipo_mov)
									dw_cargar.setitem(ll_new,'rut',ll_rut)
									dw_cargar.setitem(ll_new,'nro_cuota',ll_cuota)
									if ll_interes>0 then
										ll_monto_cuota	= ll_monto_cuota - ll_interes
									end if
									if ll_cobranza_externa>0 then
										ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
									end if
									dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
									dw_cargar.setitem(ll_new,'interes',ll_interes)
									dw_cargar.setitem(ll_new,'gasto_cob',ll_cobranza_externa)
									dw_cargar.setitem(ll_new,'fecha_pago',ld_fecha_pago)
									dw_cargar.setitem(ll_new,'forma_pago',ls_forma_pago)
									dw_cargar.setitem(ll_new,'cod_caja',ls_caja)
									dw_cargar.setitem(ll_new,'base',ls_base)
									dw_cargar.setitem(ll_new,'serie',ls_serie)
									dw_cargar.setitem(ll_new,'numero',ll_numero)
									dw_cargar.setitem(ll_new,'cod_parque',ll_cod_parque)
									dw_cargar.setitem(ll_new,'nombre_archivo',named)
									
									SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
									INTO		:ll_count_seg,												:ll_suma_seg
									FROM 	"SEGURO_ASOCIADOS"  
									WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
											  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
											  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
											  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
											  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
											  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
									USING	sqlca;
									if ll_count_seg > 0 then
										SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
										INTO		:ls_moneda_seg
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
												  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
										USING		sqlca;
										if ls_moneda_seg = '2' then
											ll_monto_seg	= round(ll_suma_seg * gd_uf_dia,0)
										else
											ll_monto_seg	= ll_suma_seg
										end if
										ll_monto_cuota		= ll_monto_cuota - ll_monto_seg
										dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
										DECLARE x1 CURSOR FOR  
										SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",
													"SEGURO_ASOCIADOS"."MONTO_PRIMA",
													"SEGURO_ASOCIADOS"."MONEDA"
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND
												  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
										USING	Trans_1;
										open x1;
										if Trans_1.sqlcode=0 then
											do while Trans_1.sqlcode=0
												fetch x1 into :ll_cod_seguro, :ldb_prima, :ls_moneda;
												if not isnull(ll_cod_seguro) then
													ls_tipo_mov_seg	= string(ll_cod_seguro)
													if ls_moneda='2' then
														ll_monto			= round(ldb_prima * gd_uf_dia,0)
													else
														ll_monto			= ldb_prima
													end if
													if ls_tipo_mov_seg='1' then
														dw_cargar.setitem(ll_new,'monto_seg_renta',ll_monto)
													elseif ls_tipo_mov_seg='2' then
														dw_cargar.setitem(ll_new,'monto_seg_colectivo',ll_monto)
													elseif ls_tipo_mov_seg='3' then
														dw_cargar.setitem(ll_new,'monto_segundo_aseg',ll_monto)
													elseif ls_tipo_mov_seg='4' then
														dw_cargar.setitem(ll_new,'monto_seg_desgravamen',ll_monto)
													elseif ls_tipo_mov_seg='5' then
														dw_cargar.setitem(ll_new,'monto_asist_funeraria',ll_monto)
													elseif ls_tipo_mov_seg='6' then
														dw_cargar.setitem(ll_new,'monto_gasto_adm',ll_monto)
													end if
												end if
												setnull(ll_cod_seguro)
											loop
										end if
										close x1;
									end if
								end if
							end if
						end if
					next
					
				elseif ls_servipag='BAESTADO' then
					for ll_indi=2 to ll_tot_reg
						ls_linea					= dw_servipag.getitemstring(ll_indi,'linea')
						ls_numero_cupon		= TRIM(mid(ls_linea,27,10))
						ll_numero_cupon		= long(ls_numero_cupon)
						ls_tipo_documento		= TRIM(mid(ls_linea,37,1))
						if ls_tipo_documento='1' then ls_tipo_mov='E'
						if ls_tipo_documento='2' then ls_tipo_mov='F'
						ls_rut						= TRIM(mid(ls_linea,38,10))
						ll_rut						= long(ls_rut)
						ls_dv						= TRIM(mid(ls_linea,48,1))
						ls_interes				= TRIM(mid(ls_linea,49,8))
						ll_interes					= long(ls_interes)
						ls_cobranza_externa	= TRIM(mid(ls_linea,57,8))
						ll_cobranza_externa	= long(ls_cobranza_externa)
						ls_cuota					= TRIM(mid(ls_linea,65,3))
						ll_cuota					= long(ls_cuota)
						ls_fecha_pago			= TRIM(mid(ls_linea,165,2))+'/'+TRIM(mid(ls_linea,163,2))+'/'+TRIM(mid(ls_linea,159,4))
//						ls_fecha_pago			= TRIM(mid(ls_linea,171,2))+'/'+TRIM(mid(ls_linea,169,2))+'/'+TRIM(mid(ls_linea,165,4))
						ld_fecha_pago			= date(ls_fecha_pago)
						ls_monto_cuota		= TRIM(mid(ls_linea,118,8))
						ll_monto_cuota			= long(ls_monto_cuota)
						ls_forma_pago			= TRIM(mid(ls_linea,126,2))
						//ls_cod_caja			= trim(mid(ls_linea,4,3))
						ls_cod_caja				= trim(mid(named,4,2))
						if ls_cod_caja='IT' then
							ls_caja				= 'IT'
						elseif ls_cod_caja='CV' then
							ls_caja				= 'CV'
						elseif ls_cod_caja='SE' then
							ls_caja				= 'SE'
						else
							ls_caja				= 'XY'
						end if
						if ll_numero_cupon>0 and not isnull(ld_fecha_pago) and (ls_tipo_mov='E' or ls_tipo_mov='F') then
							SELECT	 "CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE"  
							INTO 		 :ls_base,				:ls_serie,					:ll_numero,   			:ll_cod_parque  
							FROM 	 "CADENA",   "CUPONERAS_DETALLE"  
							WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
									   ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
									   ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
									   ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon ) AND
									   ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
							USING		sqlca;
							if sqlca.sqlcode<>0 then
								ls_base				= ''
								ls_serie				= ''
								ll_numero			= 0
								ll_cod_parque  		= 0
							end if
							IF gf_existe_cupon(ll_numero_cupon) = True THEN
								MessageBox("Ingreso Cupón", "El Número de cupón "+string(ll_numero_cupon)+" ya existe")
								ll_existe			= dw_lista_cupon_existe.insertrow(0)
								dw_lista_cupon_existe.setitem(ll_existe,'base',ls_base)
								dw_lista_cupon_existe.setitem(ll_existe,'serie',ls_serie)
								dw_lista_cupon_existe.setitem(ll_existe,'numero',ll_numero)
								dw_lista_cupon_existe.setitem(ll_existe,'nro_cupon',ll_numero_cupon)
								dw_lista_cupon_existe.setitem(ll_existe,'fecha_pago',ld_fecha_pago)
								dw_lista_cupon_existe.setitem(ll_existe,'tipo_mov',ls_tipo_mov)
								if ll_interes>0 then
									ll_monto_cuota	= ll_monto_cuota - ll_interes
								end if
								if ll_cobranza_externa>0 then
									ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
								end if
								dw_lista_cupon_existe.setitem(ll_existe,'monto_cuota',ll_monto_cuota)
								dw_lista_cupon_existe.setitem(ll_existe,'monto_interes',ll_interes)
								dw_lista_cupon_existe.setitem(ll_existe,'monto_gc',ll_cobranza_externa)
								dw_lista_cupon_existe.setitem(ll_existe,'fecha_archivo',ld_fecha_archivo)
							else
								if ll_numero > 0 then
									ll_new				= dw_cargar.insertrow(0)
									dw_cargar.scrolltorow(ll_new)
									dw_cargar.setitem(ll_new,'correlativo',0)
									dw_cargar.setitem(ll_new,'nro_cupon',ll_numero_cupon)
									dw_cargar.setitem(ll_new,'tipo_mov',ls_tipo_mov)
									dw_cargar.setitem(ll_new,'rut',ll_rut)
									dw_cargar.setitem(ll_new,'nro_cuota',ll_cuota)
									if ll_interes>0 then
										ll_monto_cuota	= ll_monto_cuota - ll_interes
									end if
									if ll_cobranza_externa>0 then
										ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
									end if
									dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
									dw_cargar.setitem(ll_new,'interes',ll_interes)
									dw_cargar.setitem(ll_new,'gasto_cob',ll_cobranza_externa)
									dw_cargar.setitem(ll_new,'fecha_pago',ld_fecha_pago)
									dw_cargar.setitem(ll_new,'forma_pago',ls_forma_pago)
									dw_cargar.setitem(ll_new,'cod_caja',ls_caja)
									dw_cargar.setitem(ll_new,'base',ls_base)
									dw_cargar.setitem(ll_new,'serie',ls_serie)
									dw_cargar.setitem(ll_new,'numero',ll_numero)
									dw_cargar.setitem(ll_new,'cod_parque',ll_cod_parque)
									dw_cargar.setitem(ll_new,'nombre_archivo',named)
									
									SELECT	COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
									INTO		:ll_count_seg,												:ll_suma_seg
									FROM 	"SEGURO_ASOCIADOS"  
									WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
											  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
											  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
											  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
											  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
											  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
									USING	sqlca;
									if ll_count_seg > 0 then
										SELECT	DISTINCT ("SEGURO_ASOCIADOS"."MONEDA")
										INTO		:ls_moneda_seg
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   AND 
												  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
										USING		sqlca;
										if ls_moneda_seg = '2' then
											ll_monto_seg	= round(ll_suma_seg * gd_uf_dia,0)
										else
											ll_monto_seg	= ll_suma_seg
										end if
										ll_monto_cuota		= ll_monto_cuota - ll_monto_seg
										dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
										DECLARE x2 CURSOR FOR  
										SELECT	"SEGURO_ASOCIADOS"."COD_SEGURO",
													"SEGURO_ASOCIADOS"."MONTO_PRIMA",
													"SEGURO_ASOCIADOS"."MONEDA"
										FROM 	"SEGURO_ASOCIADOS"  
										WHERE ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
												  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
												  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
												  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' ) AND
												  ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
										USING	Trans_1;
										open x2;
										if Trans_1.sqlcode=0 then
											do while Trans_1.sqlcode=0
												fetch x2 into :ll_cod_seguro, :ldb_prima, :ls_moneda;
												if not isnull(ll_cod_seguro) then
													ls_tipo_mov_seg	= string(ll_cod_seguro)
													if ls_moneda='2' then
														ll_monto			= round(ldb_prima * gd_uf_dia,0)
													else
														ll_monto			= ldb_prima
													end if
													if ls_tipo_mov_seg='1' then
														dw_cargar.setitem(ll_new,'monto_seg_renta',ll_monto)
													elseif ls_tipo_mov_seg='2' then
														dw_cargar.setitem(ll_new,'monto_seg_colectivo',ll_monto)
													elseif ls_tipo_mov_seg='3' then
														dw_cargar.setitem(ll_new,'monto_segundo_aseg',ll_monto)
													elseif ls_tipo_mov_seg='4' then
														dw_cargar.setitem(ll_new,'monto_seg_desgravamen',ll_monto)
													elseif ls_tipo_mov_seg='5' then
														dw_cargar.setitem(ll_new,'monto_asist_funeraria',ll_monto)
													elseif ls_tipo_mov_seg='6' then
														dw_cargar.setitem(ll_new,'monto_gasto_adm',ll_monto)
													end if
												end if
												setnull(ll_cod_seguro)
											loop
										end if
										close x2;
									end if
								end if
							end if
						end if
					next
					
				else
					messagebox("Advertencia","Archivo a Cargar No Corresponde a Servipag ni BancoEstado")
				end if
	
			elseif gs_conexion = "Parque Santiago" then
				ld_fecha_pago				= DATE(mid(named,7,2)+'/'+mid(named,5,2)+'/'+mid(named,1,4))
				ld_fecha_archivo			= DATE(gdt_fec_sistema)
				ls_caja						= 'X5'
				ls_forma_pago				= 'EF'
				for ll_indi=1 to ll_tot_reg
					ls_linea					= dw_servipag.getitemstring(ll_indi,'linea')
					ls_numero_pagare		= TRIM(mid(ls_linea,12,4))
					ll_numero_pagare		= Double(ls_numero_pagare)
					ls_tipo_documento		= TRIM(mid(ls_linea,16,2))
					if ls_tipo_documento='01' then ls_tipo_mov='E'
					if ls_tipo_documento='30' then ls_tipo_mov='F'
					ls_rut						= TRIM(mid(ls_linea,1,11))
					ll_rut						= long(ls_rut)
					ls_dv						= TRIM(mid(ls_linea,20,1))
					ls_cuota					= TRIM(mid(ls_linea,18,2))
					ll_cuota					= long(ls_cuota)
					ls_monto_cuota			= TRIM(mid(ls_linea,21,8))
					ll_monto_cuota			= long(ls_monto_cuota)
					ll_interes				= 0
					ll_cobranza_externa	= 0
					Setnull(ls_base);Setnull(ls_serie);Setnull(ll_numero);Setnull(ll_cod_parque);Setnull(ll_numero_cupon)
					if not isnull(ld_fecha_pago) and (ls_tipo_mov='E' or ls_tipo_mov='F') then
						if ls_tipo_mov='E' then
							SELECT	 "CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE",	"CUPONERAS_DETALLE"."NRO_CUPON"
							INTO 		 :ls_base,				:ls_serie,			:ll_numero,   			:ll_cod_parque,			:ll_numero_cupon  
							FROM 	 "CADENA",   "CUPONERAS_DETALLE"  
							WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
									   ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
									   ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
									   ( "CUPONERAS_DETALLE"."NRO_CUOTA" = :ll_cuota ) AND 
									   ( "CUPONERAS_DETALLE"."TIPO_MOV" = :ls_tipo_mov ) AND
									   ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
							USING		sqlca;
						elseif ls_tipo_mov='F' then
							SELECT	 MIN("CUPONERAS_DETALLE"."NRO_CUPON")  
							INTO 		 :ll_numero_cupon  
							FROM 	 "CUPONERAS_DETALLE"  
							WHERE  ( "CUPONERAS_DETALLE"."RUT" = :ll_rut ) AND  
									   ( "CUPONERAS_DETALLE"."SERIE" = '0' ) AND  
									   ( "CUPONERAS_DETALLE"."BASE" = 'C' ) AND  
									   ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
									   ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' )   
							USING		sqlca;
							if ll_numero_cupon > 0 then
								SELECT 	 "CADENA"."CODIGO",	"CADENA"."SERIE",	"CADENA"."NUMERO",	"CADENA"."COD_PARQUE",	"CONTRATO"."CTA_PAG_M"  
								INTO		 :ls_base,				:ls_serie,			:ll_numero,				:ll_cod_parque,			:ll_ctas_pag_m  
								FROM		 "CADENA",	"CONTRATO",	"CUPONERAS_DETALLE"  
								WHERE  ( "CADENA"."CODIGO" = "CUPONERAS_DETALLE"."BASE" ) and  
										   ( "CADENA"."SERIE" = "CUPONERAS_DETALLE"."SERIE" ) and  
										   ( "CADENA"."NUMERO" = "CUPONERAS_DETALLE"."NUMERO" ) and  
										   ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
										   ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
										   ( "CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon ) AND
										   ( "CUPONERAS_DETALLE"."RUT" = :ll_rut )
								USING		sqlca;
								if ll_ctas_pag_m > 0 then
									ll_cuota		= ll_ctas_pag_m + 1
								else
									ll_cuota		= 1
								end if
							end if
						end if
						if sqlca.sqlcode<>0 then
							ls_base				= ''
							ls_serie				= ''
							ll_numero			= 0
							ll_cod_parque  		= 0
						end if
						IF gf_existe_cupon(ll_numero_cupon) = True THEN
							MessageBox("Ingreso Cupón", "El Número de cupón "+string(ll_numero_cupon)+" ya existe")
							ll_existe				= dw_lista_cupon_existe.insertrow(0)
							dw_lista_cupon_existe.setitem(ll_existe,'base',ls_base)
							dw_lista_cupon_existe.setitem(ll_existe,'serie',ls_serie)
							dw_lista_cupon_existe.setitem(ll_existe,'numero',ll_numero)
							dw_lista_cupon_existe.setitem(ll_existe,'nro_cupon',ll_numero_cupon)
							dw_lista_cupon_existe.setitem(ll_existe,'fecha_pago',ld_fecha_pago)
							dw_lista_cupon_existe.setitem(ll_existe,'tipo_mov',ls_tipo_mov)
							if ll_interes>0 then
								ll_monto_cuota	= ll_monto_cuota - ll_interes
							end if
							if ll_cobranza_externa>0 then
								ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
							end if
							dw_lista_cupon_existe.setitem(ll_existe,'monto_cuota',ll_monto_cuota)
							dw_lista_cupon_existe.setitem(ll_existe,'monto_interes',ll_interes)
							dw_lista_cupon_existe.setitem(ll_existe,'monto_gc',ll_cobranza_externa)
							dw_lista_cupon_existe.setitem(ll_existe,'fecha_archivo',ld_fecha_archivo)
						elseif isnull(ll_numero_cupon) or ll_numero_cupon=0 or isnull(ll_cod_parque) or ll_cod_parque=0 or &
								 isnull(ll_numero) or ll_numero=0 or isnull(ll_monto_cuota) or ll_monto_cuota=0 then
								 
							MessageBox("Ingreso Cupón", "Error en el Fila Nº "+string(ll_indi)+" del Archivo Plano es posible que Falte: Nº Cupón, Cod_parque, Nº Contrato o Monto")
							if isnull(ls_base) or ls_base='' then ls_base='X'
							if isnull(ls_serie) or ls_serie='' then ls_serie='X'
							if isnull(ld_fecha_pago) then ld_fecha_pago = date(String('01/01/1900','dd/mm/yyyy'))
							if isnull(ll_numero) or ll_numero=0 then ll_numero=0
							if isnull(ll_numero_cupon) or ll_numero_cupon=0 then ll_numero_cupon=0
							if isnull(ls_tipo_mov) or ls_tipo_mov='' then ls_tipo_mov='X'
							if isnull(ll_monto_cuota) or ll_monto_cuota=0 then ll_monto_cuota=0
							if isnull(ll_rut) or ll_rut=0 then ll_rut=0
							if isnull(ll_nro_cuota) or ll_nro_cuota=0 then ll_nro_cuota=0
							ll_existe			= dw_lista_cupon_existe.insertrow(0)
							dw_lista_cupon_existe.setitem(ll_existe,'base',ls_base)
							dw_lista_cupon_existe.setitem(ll_existe,'serie',ls_serie)
							dw_lista_cupon_existe.setitem(ll_existe,'numero',ll_numero)
							dw_lista_cupon_existe.setitem(ll_existe,'nro_cupon',ll_numero_cupon)
							dw_lista_cupon_existe.setitem(ll_existe,'fecha_pago',ld_fecha_pago)
							dw_lista_cupon_existe.setitem(ll_existe,'tipo_mov',ls_tipo_mov)
							dw_lista_cupon_existe.setitem(ll_existe,'rut',ll_rut)
							dw_lista_cupon_existe.setitem(ll_existe,'nro_documento',ll_cuota)
							dw_lista_cupon_existe.setitem(ll_existe,'nombre_archivo',named)
							
							if ll_interes>0 then
								ll_monto_cuota	= ll_monto_cuota - ll_interes
							end if
							if ll_cobranza_externa>0 then
								ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
							end if
							dw_lista_cupon_existe.setitem(ll_existe,'monto_cuota',ll_monto_cuota)
							dw_lista_cupon_existe.setitem(ll_existe,'monto_interes',ll_interes)
							dw_lista_cupon_existe.setitem(ll_existe,'monto_gc',ll_cobranza_externa)
							dw_lista_cupon_existe.setitem(ll_existe,'fecha_archivo',ld_fecha_archivo)
						else
							ll_new				= dw_cargar.insertrow(0)
							dw_cargar.scrolltorow(ll_new)
							dw_cargar.setitem(ll_new,'correlativo',0)
							dw_cargar.setitem(ll_new,'nro_cupon',ll_numero_cupon)
							dw_cargar.setitem(ll_new,'tipo_mov',ls_tipo_mov)
							dw_cargar.setitem(ll_new,'rut',ll_rut)
							dw_cargar.setitem(ll_new,'nro_cuota',ll_cuota)
							if ll_interes>0 then
								ll_monto_cuota	= ll_monto_cuota - ll_interes
							end if
							if ll_cobranza_externa>0 then
								ll_monto_cuota	= ll_monto_cuota - ll_cobranza_externa
							end if
							dw_cargar.setitem(ll_new,'monto_cuota',ll_monto_cuota)
							dw_cargar.setitem(ll_new,'interes',ll_interes)
							dw_cargar.setitem(ll_new,'gasto_cob',ll_cobranza_externa)
							dw_cargar.setitem(ll_new,'fecha_pago',ld_fecha_pago)
							dw_cargar.setitem(ll_new,'forma_pago',ls_forma_pago)
							dw_cargar.setitem(ll_new,'cod_caja',ls_caja)
							dw_cargar.setitem(ll_new,'base',ls_base)
							dw_cargar.setitem(ll_new,'serie',ls_serie)
							dw_cargar.setitem(ll_new,'numero',ll_numero)
							dw_cargar.setitem(ll_new,'cod_parque',ll_cod_parque)
							dw_cargar.setitem(ll_new,'nombre_archivo',named)
						end if
					end if
				next
			end if
		end if
	end if
	tab_1.tabpage_2.dw_log_servipag.retrieve(id_fecha_log)
	SetPointer(Arrow!)
End If
end event

type dw_cargar from datawindow within tabpage_2
integer x = 32
integer y = 36
integer width = 2427
integer height = 1248
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_cargar_servipag_recupera"
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

type gb_2 from groupbox within tabpage_2
integer x = 517
integer y = 1284
integer width = 690
integer height = 156
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3255
integer height = 1452
long backcolor = 67108864
string text = " Archivos Recuperados"
long tabtextcolor = 33554432
string picturename = "Custom050!"
long picturemaskcolor = 536870912
cb_filtrar_det cb_filtrar_det
cb_exportar_det cb_exportar_det
cb_print_det cb_print_det
p_3 p_3
em_fecha_final em_fecha_final
pb_proceso_archivos pb_proceso_archivos
st_8 st_8
p_2 p_2
em_fecha_inicial em_fecha_inicial
st_7 st_7
st_6 st_6
st_5 st_5
dw_detalle_archivos dw_detalle_archivos
dw_lista_archivos dw_lista_archivos
gb_1 gb_1
end type

on tabpage_3.create
this.cb_filtrar_det=create cb_filtrar_det
this.cb_exportar_det=create cb_exportar_det
this.cb_print_det=create cb_print_det
this.p_3=create p_3
this.em_fecha_final=create em_fecha_final
this.pb_proceso_archivos=create pb_proceso_archivos
this.st_8=create st_8
this.p_2=create p_2
this.em_fecha_inicial=create em_fecha_inicial
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.dw_detalle_archivos=create dw_detalle_archivos
this.dw_lista_archivos=create dw_lista_archivos
this.gb_1=create gb_1
this.Control[]={this.cb_filtrar_det,&
this.cb_exportar_det,&
this.cb_print_det,&
this.p_3,&
this.em_fecha_final,&
this.pb_proceso_archivos,&
this.st_8,&
this.p_2,&
this.em_fecha_inicial,&
this.st_7,&
this.st_6,&
this.st_5,&
this.dw_detalle_archivos,&
this.dw_lista_archivos,&
this.gb_1}
end on

on tabpage_3.destroy
destroy(this.cb_filtrar_det)
destroy(this.cb_exportar_det)
destroy(this.cb_print_det)
destroy(this.p_3)
destroy(this.em_fecha_final)
destroy(this.pb_proceso_archivos)
destroy(this.st_8)
destroy(this.p_2)
destroy(this.em_fecha_inicial)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.dw_detalle_archivos)
destroy(this.dw_lista_archivos)
destroy(this.gb_1)
end on

type cb_filtrar_det from commandbutton within tabpage_3
integer x = 2917
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle_archivos.SETfilter(NULO)
dw_detalle_archivos.filter()
end event

type cb_exportar_det from commandbutton within tabpage_3
integer x = 2638
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle_archivos
if dw_detalle_archivos.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_print_det from commandbutton within tabpage_3
integer x = 2318
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Date	ld_fec_ini,ld_fec_fin
if dw_detalle_archivos.rowcount()>0 then
	ld_fec_ini	= date(em_fecha_inicial.text)
	ld_fec_fin	= date(em_fecha_final.text)
	f_printdlg(dw_detalle_archivos,gstr_print,w_servipag)
	if dw_no_existe.retrieve(ld_fec_ini,ld_fec_fin)>0 then
		dw_no_existe.print()
	end if
end if
end event

type p_3 from picture within tabpage_3
integer x = 1481
integer y = 1328
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista_archivos.reset()
dw_detalle_archivos.reset()
if f_valida_fecha(em_fecha_final.text)=-1 then 
	em_fecha_final.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fecha_final.setfocus()
	return
end if	
if em_fecha_final.text<>'00/00/0000' then
	ls_fecha 			= em_fecha_final.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fecha_final.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fecha_final.setfocus()
		return
	else	
		em_fecha_final.text = Message.StringParm
	end if	
END IF
end event

type em_fecha_final from editmask within tabpage_3
integer x = 1097
integer y = 1328
integer width = 375
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista_archivos.reset()
dw_detalle_archivos.reset()
end event

type pb_proceso_archivos from picturebutton within tabpage_3
integer x = 1605
integer y = 1308
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date	ld_fec_ini,ld_fec_fin
Long	ll_tot_reg,ll_corr_ini,ll_corr_fin

SetPointer(HourGlass!)
dw_lista_archivos.reset()
dw_detalle_archivos.reset()
ld_fec_ini						= date(em_fecha_inicial.text)
ld_fec_fin						= date(em_fecha_final.text)
if trim(em_fecha_inicial.text)='00/00/0000' or isnull(em_fecha_inicial.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fecha_inicial.setfocus()
else
	if trim(em_fecha_final.text)='00/00/0000' or isnull(em_fecha_final.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fecha_final.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fecha_inicial.setfocus()
		else
			ll_tot_reg	= dw_lista_archivos.retrieve(ld_fec_ini,ld_fec_fin)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Dato")
			else
				dw_lista_archivos.scrolltorow(1)
				il_corr		= dw_lista_archivos.getitemnumber(1,'correlativo')
				dw_detalle_archivos.retrieve(il_corr)
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type st_8 from statictext within tabpage_3
integer x = 891
integer y = 1340
integer width = 197
integer height = 64
integer textsize = -10
integer weight = 400
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

type p_2 from picture within tabpage_3
integer x = 800
integer y = 1328
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista_archivos.reset()
dw_detalle_archivos.reset()
if f_valida_fecha(em_fecha_inicial.text)=-1 then 
	em_fecha_inicial.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fecha_inicial.setfocus()
	return
end if	
if em_fecha_inicial.text<>'00/00/0000' then
	ls_fecha = em_fecha_inicial.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fecha_inicial.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fecha_inicial.setfocus()
		return
	else	
		em_fecha_inicial.text = Message.StringParm
	end if	
END IF
end event

type em_fecha_inicial from editmask within tabpage_3
integer x = 416
integer y = 1328
integer width = 375
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista_archivos.reset()
dw_detalle_archivos.reset()
end event

type st_7 from statictext within tabpage_3
integer x = 23
integer y = 1336
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_3
integer x = 1353
integer y = 24
integer width = 1111
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Detalle Pagos Servipag"
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_3
integer x = 32
integer y = 24
integer width = 1111
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Archivos Recuperados Servipag"
boolean focusrectangle = false
end type

type dw_detalle_archivos from datawindow within tabpage_3
integer x = 1353
integer y = 104
integer width = 1865
integer height = 1176
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_detalle_pagos_servipag_recupera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type dw_lista_archivos from datawindow within tabpage_3
integer x = 32
integer y = 104
integer width = 1248
integer height = 1176
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_archivos_servipag_cargados"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna
datawindow dw_paso
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	il_corr		= this.getitemnumber(row,'correlativo')
	dw_detalle_archivos.retrieve(il_corr)
else
	ls_columna	= dwo.name
	if ls_columna='t_exportar' then
		dw_paso	= dw_lista_archivos
		if dw_lista_archivos.rowcount() > 0 then f_DWToExcel( dw_paso )
	elseif ls_columna='t_imprimir' then
		if dw_lista_archivos.rowcount()>0 then
			f_printdlg(dw_lista_archivos,gstr_print,w_servipag)
		end if
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	il_corr		= this.getitemnumber(getrow(),'correlativo')
	dw_detalle_archivos.retrieve(il_corr)
end if
end event

type gb_1 from groupbox within tabpage_3
integer x = 2295
integer y = 1272
integer width = 919
integer height = 164
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3255
integer height = 1452
long backcolor = 67108864
string text = " Resumen"
long tabtextcolor = 33554432
string picturename = "Cascade!"
long picturemaskcolor = 536870912
cb_exportar_res cb_exportar_res
cb_print_res cb_print_res
st_10 st_10
p_13 p_13
em_fecha_final_2 em_fecha_final_2
st_18 st_18
p_12 p_12
em_fecha_inicial_2 em_fecha_inicial_2
st_17 st_17
pb_ok pb_ok
dw_parque dw_parque
st_9 st_9
dw_caja_resumen dw_caja_resumen
gb_11 gb_11
end type

on tabpage_4.create
this.cb_exportar_res=create cb_exportar_res
this.cb_print_res=create cb_print_res
this.st_10=create st_10
this.p_13=create p_13
this.em_fecha_final_2=create em_fecha_final_2
this.st_18=create st_18
this.p_12=create p_12
this.em_fecha_inicial_2=create em_fecha_inicial_2
this.st_17=create st_17
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_9=create st_9
this.dw_caja_resumen=create dw_caja_resumen
this.gb_11=create gb_11
this.Control[]={this.cb_exportar_res,&
this.cb_print_res,&
this.st_10,&
this.p_13,&
this.em_fecha_final_2,&
this.st_18,&
this.p_12,&
this.em_fecha_inicial_2,&
this.st_17,&
this.pb_ok,&
this.dw_parque,&
this.st_9,&
this.dw_caja_resumen,&
this.gb_11}
end on

on tabpage_4.destroy
destroy(this.cb_exportar_res)
destroy(this.cb_print_res)
destroy(this.st_10)
destroy(this.p_13)
destroy(this.em_fecha_final_2)
destroy(this.st_18)
destroy(this.p_12)
destroy(this.em_fecha_inicial_2)
destroy(this.st_17)
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_9)
destroy(this.dw_caja_resumen)
destroy(this.gb_11)
end on

type cb_exportar_res from commandbutton within tabpage_4
integer x = 2921
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_caja_resumen
if dw_caja_resumen.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_print_res from commandbutton within tabpage_4
integer x = 2633
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_caja_resumen.rowcount()>0 then
	f_printdlg(dw_caja_resumen,gstr_print,w_servipag)
end if
end event

type st_10 from statictext within tabpage_4
integer x = 32
integer y = 24
integer width = 1111
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen Servipag"
boolean focusrectangle = false
end type

type p_13 from picture within tabpage_4
integer x = 1413
integer y = 1328
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_caja_resumen.reset()
if f_valida_fecha(em_fecha_final_2.text)=-1 then 
	em_fecha_final_2.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fecha_final_2.setfocus()
	return
end if	
if em_fecha_final_2.text<>'00/00/0000' then
	ls_fecha 			= em_fecha_final_2.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fecha_final_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fecha_final_2.setfocus()
		return
	else	
		em_fecha_final_2.text = Message.StringParm
	end if	
END IF
end event

type em_fecha_final_2 from editmask within tabpage_4
integer x = 1047
integer y = 1328
integer width = 357
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_caja_resumen.reset()
end event

type st_18 from statictext within tabpage_4
integer x = 855
integer y = 1340
integer width = 197
integer height = 64
integer textsize = -10
integer weight = 400
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

type p_12 from picture within tabpage_4
integer x = 768
integer y = 1328
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_caja_resumen.reset()
if f_valida_fecha(em_fecha_inicial_2.text)=-1 then 
	em_fecha_inicial_2.text	=string(gdt_fec_sistema,gs_formato_fecha)
	em_fecha_inicial_2.setfocus()
	return
end if	
if em_fecha_inicial_2.text<>'00/00/0000' then
	ls_fecha = em_fecha_inicial_2.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fecha_inicial_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fecha_inicial_2.setfocus()
		return
	else	
		em_fecha_inicial_2.text = Message.StringParm
	end if	
END IF
end event

type em_fecha_inicial_2 from editmask within tabpage_4
integer x = 402
integer y = 1328
integer width = 357
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_caja_resumen.reset()
end event

type st_17 from statictext within tabpage_4
integer x = 23
integer y = 1336
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within tabpage_4
integer x = 2345
integer y = 1300
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Date	ld_fec_ini,ld_fec_fin
Long	ll_tot_reg,ll_corr_ini,ll_corr_fin,ll_cod_parque

SetPointer(HourGlass!)
dw_caja_resumen.reset()
ld_fec_ini						= date(em_fecha_inicial_2.text)
ld_fec_fin						= date(em_fecha_final_2.text)
if trim(em_fecha_inicial_2.text)='00/00/0000' or isnull(em_fecha_inicial_2.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fecha_inicial_2.setfocus()
else
	if trim(em_fecha_final_2.text)='00/00/0000' or isnull(em_fecha_final_2.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fecha_final_2.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fecha_inicial_2.setfocus()
		else
			ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 then
				ll_tot_reg	= dw_caja_resumen.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque)
				if ll_tot_reg=0 then
					messagebox("Advertencia","No Registra Dato")
				end if
			else
				messagebox("Advertencia","Debe Seleccionar Parque")
			end if
		end if
	end if
end if
SetPointer(Arrow!)
end event

type dw_parque from datawindow within tabpage_4
integer x = 1733
integer y = 1324
integer width = 608
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

type st_9 from statictext within tabpage_4
integer x = 1522
integer y = 1336
integer width = 215
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
boolean focusrectangle = false
end type

type dw_caja_resumen from datawindow within tabpage_4
integer x = 32
integer y = 104
integer width = 3177
integer height = 1176
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_detalle_servipag_resumen_caja"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_11 from groupbox within tabpage_4
integer x = 2610
integer y = 1272
integer width = 603
integer height = 164
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3255
integer height = 1452
long backcolor = 67108864
string text = " Pagos con Problemas"
long tabtextcolor = 33554432
string picturename = "CreateLibrary!"
long picturemaskcolor = 536870912
cb_print_pr cb_print_pr
cb_exportar_pr cb_exportar_pr
cb_filtrar_pr cb_filtrar_pr
cb_1 cb_1
dw_problemas dw_problemas
gb_pr gb_pr
end type

on tabpage_5.create
this.cb_print_pr=create cb_print_pr
this.cb_exportar_pr=create cb_exportar_pr
this.cb_filtrar_pr=create cb_filtrar_pr
this.cb_1=create cb_1
this.dw_problemas=create dw_problemas
this.gb_pr=create gb_pr
this.Control[]={this.cb_print_pr,&
this.cb_exportar_pr,&
this.cb_filtrar_pr,&
this.cb_1,&
this.dw_problemas,&
this.gb_pr}
end on

on tabpage_5.destroy
destroy(this.cb_print_pr)
destroy(this.cb_exportar_pr)
destroy(this.cb_filtrar_pr)
destroy(this.cb_1)
destroy(this.dw_problemas)
destroy(this.gb_pr)
end on

type cb_print_pr from commandbutton within tabpage_5
integer x = 2318
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_problemas.rowcount() > 0 then f_printdlg(dw_problemas,gstr_print,w_servipag)

end event

type cb_exportar_pr from commandbutton within tabpage_5
integer x = 2638
integer y = 1324
integer width = 270
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_problemas
if dw_problemas.rowcount() > 0 then OpenWithParm(w_exportar, dw_paso)
end event

type cb_filtrar_pr from commandbutton within tabpage_5
integer x = 2917
integer y = 1324
integer width = 270
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

event clicked;string nulo
setnull (nulo)
dw_problemas.SETfilter(NULO)
dw_problemas.filter()
end event

type cb_1 from commandbutton within tabpage_5
integer x = 37
integer y = 1320
integer width = 338
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mostrar"
end type

event clicked;dw_problemas.reset()
if dw_problemas.retrieve()=0 then
	messagebox("Advertencia","No Registra Dato")
end if
end event

type dw_problemas from datawindow within tabpage_5
integer x = 32
integer y = 36
integer width = 3191
integer height = 1248
integer taborder = 50
string dataobject = "dw_servipag_existente_problemas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_pr from groupbox within tabpage_5
integer x = 2295
integer y = 1272
integer width = 919
integer height = 164
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_servipag from datawindow within w_servipag_bkp_ult
boolean visible = false
integer x = 626
integer y = 1760
integer width = 398
integer height = 284
boolean enabled = false
string title = "none"
string dataobject = "dw_exportar_servipag_string"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_servipag_bkp_ult
integer x = 41
integer y = 16
integer width = 987
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo Envio Servipag"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_servipag_bkp_ult
integer x = 3003
integer y = 1660
integer width = 320
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_servipag)
end event

