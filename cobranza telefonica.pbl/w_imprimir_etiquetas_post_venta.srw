forward
global type w_imprimir_etiquetas_post_venta from window
end type
type cb_exportar from commandbutton within w_imprimir_etiquetas_post_venta
end type
type cb_ordenar from commandbutton within w_imprimir_etiquetas_post_venta
end type
type cb_setup from commandbutton within w_imprimir_etiquetas_post_venta
end type
type cb_limpiar from commandbutton within w_imprimir_etiquetas_post_venta
end type
type cb_imprimir from commandbutton within w_imprimir_etiquetas_post_venta
end type
type cb_cerrar from commandbutton within w_imprimir_etiquetas_post_venta
end type
type dw_etiqueta from datawindow within w_imprimir_etiquetas_post_venta
end type
type gb_1 from groupbox within w_imprimir_etiquetas_post_venta
end type
end forward

global type w_imprimir_etiquetas_post_venta from window
integer width = 3936
integer height = 1956
boolean titlebar = true
string title = "Imprimir Etiquetas Post-Venta"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_setup cb_setup
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_etiqueta dw_etiqueta
gb_1 gb_1
end type
global w_imprimir_etiquetas_post_venta w_imprimir_etiquetas_post_venta

on w_imprimir_etiquetas_post_venta.create
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_setup=create cb_setup
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_etiqueta=create dw_etiqueta
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_ordenar,&
this.cb_setup,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_etiqueta,&
this.gb_1}
end on

on w_imprimir_etiquetas_post_venta.destroy
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_setup)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_etiqueta)
destroy(this.gb_1)
end on

event open;Long		ll_tot_reg,ll_indi,ll_new,ll_rut
double	ldb_numero
String	ls_base,ls_serie,ls_obs,ls_parque,ls_sexo_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,&
			ls_tipo_via_tit,ls_direc_p_tit,ls_nro_part_tit,ls_depto_part_tit,ls_block_part_tit,&
			ls_poblacion_tit,ls_comuna_tit,ls_nombre_cont,ls_ap_pat_cont,ls_ap_mat_cont,ls_direc_p_cont,&
			ls_poblacion_cont,ls_comuna_cont,ls_sexo_cont,ls_nom_comp,ls_dir_comp,ls_pob

SetPointer(HourGlass!)
if isvalid(w_llamados_postventa) or isvalid(w_llamados_postventa_fecha_digitacion) then
	gf_centrar(w_imprimir_etiquetas_post_venta)
	dw_etiqueta.settransobject(sqlca)
	dw_etiqueta.reset()
	if isvalid(w_llamados_postventa) then
		ll_tot_reg					= w_llamados_postventa.dw_lista.rowcount()
	elseif isvalid(w_llamados_postventa_fecha_digitacion) then
		ll_tot_reg					= w_llamados_postventa_fecha_digitacion.dw_lista.rowcount()
	end if
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			if isvalid(w_llamados_postventa) then
				ls_base				= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'codigo')
				ls_serie				= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'serie')
				ldb_numero			= w_llamados_postventa.dw_lista.getitemnumber(ll_indi,'numero')
				ls_obs				= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'glosa_cob_postventa')
				ls_parque			= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'cod_parq_nombre')
				ll_rut				= w_llamados_postventa.dw_lista.getitemnumber(ll_indi,'rut')
				ls_nom_comp			= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'nombre')+' '+w_llamados_postventa.dw_lista.getitemstring(ll_indi,'a_paterno')+' '+w_llamados_postventa.dw_lista.getitemstring(ll_indi,'a_materno')
				ls_dir_comp			= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'direccion_p')
				ls_pob				= w_llamados_postventa.dw_lista.getitemstring(ll_indi,'comuna')
			elseif isvalid(w_llamados_postventa_fecha_digitacion) then
				ls_base				= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'codigo')
				ls_serie				= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'serie')
				ldb_numero			= w_llamados_postventa_fecha_digitacion.dw_lista.getitemnumber(ll_indi,'numero')
				ls_obs				= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'glosa_cob_postventa')
				ls_parque			= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'cod_parq_nombre')
				ll_rut				= w_llamados_postventa_fecha_digitacion.dw_lista.getitemnumber(ll_indi,'rut')
				ls_nom_comp			= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'nombre')+' '+w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'a_paterno')+' '+w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'a_materno')
				ls_dir_comp			= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'direccion_p')
				ls_pob				= w_llamados_postventa_fecha_digitacion.dw_lista.getitemstring(ll_indi,'comuna')
			end if
			//////////////
			SELECT 	"CLIENTE"."SEXO",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"COMUNA"."COMUNA",	"CLIENTE_CONTACTO"."NOMBRE",	"CLIENTE_CONTACTO"."A_PATERNO",	"CLIENTE_CONTACTO"."A_MATERNO",	"CLIENTE_CONTACTO"."DIRECCION_P",	"CLIENTE_CONTACTO"."POBLACION",	"CLIENTE_CONTACTO"."COMUNA",	"CLIENTE_CONTACTO"."SEXO"  
			INTO 		:ls_sexo_tit,		:ls_nombre_tit,		:ls_ap_pat_tit,			:ls_ap_mat_tit,			:ls_tipo_via_tit,				:ls_direc_p_tit,				:ls_nro_part_tit,						:ls_depto_part_tit,				:ls_block_part_tit,				:ls_poblacion_tit,		:ls_comuna_tit,		:ls_nombre_cont,					:ls_ap_pat_cont,						:ls_ap_mat_cont,						:ls_direc_p_cont,							:ls_poblacion_cont,					:ls_comuna_cont,					:ls_sexo_cont
			FROM 		"CLIENTE",   
						"CLIENTE_CONTACTO",   
						"COMUNA",   
						"TIPO_VIA"  
			WHERE  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( cliente.rut_contacto = cliente_contacto.rut (+)) and  
					 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
					 (("CLIENTE"."RUT" = :ll_rut ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ls_nombre_cont) then
					ls_nom_comp		= ls_nombre_cont+' '+ls_ap_pat_cont+' '+ls_ap_mat_cont
					if ls_sexo_cont='M' then
						ls_nom_comp	= 'Sr.'+ls_nom_comp
					else
						ls_nom_comp	= 'Sra.'+ls_nom_comp
					end if
					ls_dir_comp		= ls_direc_p_cont
					if not isnull(ls_poblacion_cont) and ls_poblacion_cont<>'-' then
						ls_pob		= ls_poblacion_cont+' - '+ls_comuna_cont
					else
						ls_pob		= ls_comuna_cont
					end if
				else
					ls_nom_comp		= ls_nombre_tit+' '+ls_ap_pat_tit+' '+ls_ap_mat_tit
					if ls_sexo_tit='M' then
						ls_nom_comp	= 'Sr.'+ls_nom_comp
					else
						ls_nom_comp	= 'Sra.'+ls_nom_comp
					end if
					if not isnull(ls_tipo_via_tit) and ls_tipo_via_tit<>'' and ls_tipo_via_tit<>'-' then
						ls_dir_comp	= ls_tipo_via_tit+' '+ls_direc_p_tit
					else
						ls_dir_comp	= ls_direc_p_tit
					end if
					if not isnull(ls_nro_part_tit) and ls_nro_part_tit<>'' and ls_nro_part_tit<>'-' then
						ls_dir_comp	= ls_dir_comp+' Nº: '+ls_nro_part_tit
					end if
					if not isnull(ls_depto_part_tit) and ls_depto_part_tit<>'' and ls_depto_part_tit<>'-' then
						ls_dir_comp	= ls_dir_comp+' Depto: '+ls_depto_part_tit
					end if
					if not isnull(ls_block_part_tit) and ls_block_part_tit<>'' and ls_block_part_tit<>'-' then
						ls_dir_comp	= ls_dir_comp+' Block: '+ls_block_part_tit
					end if
					if not isnull(ls_poblacion_tit) then
						ls_pob		= ls_poblacion_tit+' - '+ls_comuna_tit
					else
						ls_pob		= ls_comuna_tit
					end if
				end if
				ll_new				= dw_etiqueta.insertrow(0)
				dw_etiqueta.scrolltorow(ll_new)
				dw_etiqueta.setitem(ll_new,'correlativo',ll_indi)
				dw_etiqueta.setitem(ll_new,'base',ls_base)
				dw_etiqueta.setitem(ll_new,'serie',ls_serie)
				dw_etiqueta.setitem(ll_new,'numero',ldb_numero)
				dw_etiqueta.setitem(ll_new,'trato_nombre_completo',ls_nom_comp)
				dw_etiqueta.setitem(ll_new,'direccion_completa',ls_dir_comp)
				dw_etiqueta.setitem(ll_new,'villa_poblacion_comuna',ls_pob)
				dw_etiqueta.setitem(ll_new,'glosa',ls_obs)
				dw_etiqueta.setitem(ll_new,'parque',ls_parque)
			else
				ll_new				= dw_etiqueta.insertrow(0)
				dw_etiqueta.scrolltorow(ll_new)
				dw_etiqueta.setitem(ll_new,'correlativo',ll_indi)
				dw_etiqueta.setitem(ll_new,'base',ls_base)
				dw_etiqueta.setitem(ll_new,'serie',ls_serie)
				dw_etiqueta.setitem(ll_new,'numero',ldb_numero)
				dw_etiqueta.setitem(ll_new,'observacion',ls_obs)
				dw_etiqueta.setitem(ll_new,'parque',ls_parque)
				dw_etiqueta.setitem(ll_new,'trato_nombre_completo',ls_nom_comp)
				dw_etiqueta.setitem(ll_new,'direccion_completa',ls_dir_comp)
				dw_etiqueta.setitem(ll_new,'villa_poblacion_comuna',ls_pob)
			end if
		next
		dw_etiqueta.ScrollToRow ( 1 )
	end if
else
	close(w_imprimir_etiquetas_post_venta)
end if
SetPointer(Arrow!)
end event

type cb_exportar from commandbutton within w_imprimir_etiquetas_post_venta
event ue_mousemove pbm_mousemove
integer x = 814
integer y = 1708
integer width = 238
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_etiqueta
if dw_etiqueta.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_imprimir_etiquetas_post_venta
event ue_mousemove pbm_dwnmousemove
integer x = 571
integer y = 1708
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_etiqueta.SETSORT(NULO)
dw_etiqueta.SORT()

end event

type cb_setup from commandbutton within w_imprimir_etiquetas_post_venta
event ue_mousemove pbm_mousemove
integer x = 1106
integer y = 1708
integer width = 293
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print &Setup"
end type

event clicked;PrintSetup()
end event

type cb_limpiar from commandbutton within w_imprimir_etiquetas_post_venta
integer x = 1477
integer y = 1704
integer width = 315
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_etiqueta.reset()
end event

type cb_imprimir from commandbutton within w_imprimir_etiquetas_post_venta
integer x = 41
integer y = 1704
integer width = 457
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Etiquetas"
end type

event clicked;if dw_etiqueta.rowcount()>0 then
	f_Print( dw_etiqueta )
//	f_printdlg(dw_etiqueta,gstr_print,w_imprimir_etiquetas_post_venta)
else
	messagebox("Advertencia","No Registra Etiquetas para Imprimir")
end if
end event

type cb_cerrar from commandbutton within w_imprimir_etiquetas_post_venta
integer x = 3525
integer y = 1704
integer width = 343
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprimir_etiquetas_post_venta)
end event

type dw_etiqueta from datawindow within w_imprimir_etiquetas_post_venta
integer x = 41
integer y = 36
integer width = 3826
integer height = 1620
integer taborder = 10
string title = "none"
string dataobject = "dwe_imprimir_etiqueta_post_venta"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_imprimir_etiquetas_post_venta
event ue_mousemove pbm_mousemove
integer x = 549
integer y = 1656
integer width = 873
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

