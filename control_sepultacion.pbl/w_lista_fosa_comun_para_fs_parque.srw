forward
global type w_lista_fosa_comun_para_fs_parque from window
end type
type cb_imprimir from commandbutton within w_lista_fosa_comun_para_fs_parque
end type
type cb_3 from commandbutton within w_lista_fosa_comun_para_fs_parque
end type
type cb_2 from commandbutton within w_lista_fosa_comun_para_fs_parque
end type
type cb_1 from commandbutton within w_lista_fosa_comun_para_fs_parque
end type
type pb_buscar from picturebutton within w_lista_fosa_comun_para_fs_parque
end type
type em_ap_pat from editmask within w_lista_fosa_comun_para_fs_parque
end type
type st_2 from statictext within w_lista_fosa_comun_para_fs_parque
end type
type st_1 from statictext within w_lista_fosa_comun_para_fs_parque
end type
type cb_cerrar from commandbutton within w_lista_fosa_comun_para_fs_parque
end type
type cb_aceptar from commandbutton within w_lista_fosa_comun_para_fs_parque
end type
type dw_lista from datawindow within w_lista_fosa_comun_para_fs_parque
end type
type gb_1 from groupbox within w_lista_fosa_comun_para_fs_parque
end type
end forward

global type w_lista_fosa_comun_para_fs_parque from window
integer width = 4919
integer height = 1712
boolean titlebar = true
string title = "Lista Fosa Común"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
pb_buscar pb_buscar
em_ap_pat em_ap_pat
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_fosa_comun_para_fs_parque w_lista_fosa_comun_para_fs_parque

type variables
Long		il_parque
String		is_sector, is_sepultura
end variables

on w_lista_fosa_comun_para_fs_parque.create
this.cb_imprimir=create cb_imprimir
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.pb_buscar=create pb_buscar
this.em_ap_pat=create em_ap_pat
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.pb_buscar,&
this.em_ap_pat,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_fosa_comun_para_fs_parque.destroy
destroy(this.cb_imprimir)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.pb_buscar)
destroy(this.em_ap_pat)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_lista_fosa_comun_para_fs_parque)
dw_lista.settransobject(sqlca)
Setnull(gl_llave_fallecido_fc);Setnull(gl_cod_parque_origen_fc);Setnull(gl_numero_fc);Setnull(gl_rut_titular_fc);Setnull(gl_capacidad_fc);Setnull(gl_rut_fall_fc);Setnull(gl_edad_fc)
Setnull(gs_nombre_fallecido_fc);Setnull(gs_ap_paterno_fallecido_fc);Setnull(gs_ap_materno_fallecido_fc);Setnull(gs_area_origen_fc);Setnull(gs_sector_origen_fc);Setnull(gs_sepultura_origen_fc)
Setnull(gs_nro_resolucion_fc);Setnull(gs_nro_acta_fc);Setnull(gs_base_fc);Setnull(gs_serie_fc);Setnull(gs_cod_registro_fc);Setnull(gs_observacion_fc);Setnull(gs_area_fc)
Setnull(gs_sector_fc);Setnull(gs_sepultura_fc);Setnull(gs_nivel_fc);Setnull(gs_estado_ctto_fc);Setnull(gs_nom_titular_fc);Setnull(gs_ap_pat_titular_fc)
Setnull(gs_ap_mat_titular_fc);Setnull(gs_tipo_via_titular_fc);Setnull(gs_direc_titular_fc);Setnull(gs_nro_direc_titular_fc);Setnull(gs_depto_titular_fc);Setnull(gs_block_titular_fc)
Setnull(gs_ciudad_titular_fc);Setnull(gs_comuna_titular_fc);Setnull(gs_fono_p_titular_fc);Setnull(gs_estado_titular_fc);Setnull(gs_nro_tecnico_fc);Setnull(gs_dv_titular_fc)
Setnull(gs_dv_fall_fc);Setnull(gs_sexo_fc);Setnull(gdt_fecha_traslado_fc);Setnull(gdt_fecha_resolucion_fc);Setnull(gdt_fecha_ctto_fc);Setnull(gdt_fec_nac_fc);Setnull(gdt_fec_fall_fc)
il_parque				= Long(trim(substr(1,1,Message.StringParm)))
if dw_lista.retrieve(il_parque) = 0 then
	messagebox("Advertencia","No Registra Datos Fosa Común")
	close(w_lista_fosa_comun_para_fs_parque)
end if
end event

type cb_imprimir from commandbutton within w_lista_fosa_comun_para_fs_parque
integer x = 1591
integer y = 1480
integer width = 219
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom        = 55
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview  = False
	dw_lista.object.datawindow.zoom           = 100
end if
end event

type cb_3 from commandbutton within w_lista_fosa_comun_para_fs_parque
integer x = 1129
integer y = 1480
integer width = 219
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_lista_fosa_comun_para_fs_parque
integer x = 1353
integer y = 1480
integer width = 219
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_1 from commandbutton within w_lista_fosa_comun_para_fs_parque
integer x = 887
integer y = 1480
integer width = 238
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_buscar from picturebutton within w_lista_fosa_comun_para_fs_parque
integer x = 3534
integer y = 1476
integer width = 105
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar3.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_fila,ll_tot_reg

ll_tot_reg		= dw_lista.RowCount()
if ll_tot_reg > 0 then
	ll_fila	= dw_lista.Find("ap_paterno_fallecido = '"+trim(em_ap_pat.text)+"'",1, ll_tot_reg)
	if ll_fila > 0 then
		dw_lista.setfocus()
		dw_lista.scrolltorow(ll_fila)
	else
		messagebox("Advertencia","Apellido Paterno de Fallecido "+trim(em_ap_pat.text)+" No fue encontrado")
	end if
end if

end event

type em_ap_pat from editmask within w_lista_fosa_comun_para_fs_parque
integer x = 2875
integer y = 1480
integer width = 654
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!"
end type

event modified;if not isnull(em_ap_pat.text) and em_ap_pat.text<>'' then pb_buscar.triggerevent(clicked!)
end event

type st_2 from statictext within w_lista_fosa_comun_para_fs_parque
integer x = 2226
integer y = 1492
integer width = 626
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar  Apellido Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_lista_fosa_comun_para_fs_parque
integer x = 41
integer y = 24
integer width = 869
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Fallecidos en Fosa Común"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_lista_fosa_comun_para_fs_parque
integer x = 4521
integer y = 1476
integer width = 338
integer height = 108
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_fosa_comun_para_fs_parque)
end event

type cb_aceptar from commandbutton within w_lista_fosa_comun_para_fs_parque
integer x = 41
integer y = 1476
integer width = 338
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;String		ls_sector_fc,ls_sepultura_fc
Long		ll_fila

if isvalid(w_ingreso_ficha_traslado) then
	ll_fila		= dw_lista.getrow()
	if ll_fila > 0 then
		//gl_llave_fallecido_fc
		f_cargar_fallecido_fc_ficha()
		ls_sector_fc					= dw_lista.getitemstring(ll_fila,'sector')
		ls_sepultura_fc				= dw_lista.getitemstring(ll_fila,'sepultura')
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sector_origen',ls_sector_fc)
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sepultura_origen',ls_sepultura_fc)
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.accepttext()
		close(w_lista_fosa_comun_para_fs_parque)
	end if
end if






//Long		ll_fila,ll_llave_fallecido,ll_cod_parque_origen,ll_capacidad,ll_edad
//String		ls_nombre_fallecido,ls_ap_paterno_fallecido,ls_ap_materno_fallecido,ls_area_origen,ls_sector_origen,ls_sepultura_origen,ls_nro_resolucion,&
//			ls_nro_acta,ls_base,ls_serie,ls_cod_registro,ls_observacion,ls_area,ls_nivel,ls_estado_ctto,ls_dv_titular,ls_nom_titular,ls_ap_pat_titular,ls_ap_mat_titular,&
//			ls_tipo_via_titular,ls_direc_titular,ls_nro_direc_titular,ls_depto_titular,ls_block_titular,ls_ciudad_titular,ls_comuna_titular,ls_fono_p_titular,ls_estado_titular,&
//			ls_nro_tecnico,ls_dv_fall,ls_sexo,ls_sector_fc,ls_sepultura_fc
//Datetime	ldt_fecha_traslado,ldt_fecha_resolucion,ldt_fecha_ctto,ldt_fec_nac,ldt_fec_fall
//Double	ll_numero,ll_rut_titular,ll_rut_fall
//
//if isvalid(w_ingreso_ficha_traslado) then
//	ll_fila		= dw_lista.getrow()
//	if ll_fila > 0 then
//		ll_llave_fallecido			= dw_lista.getitemnumber(ll_fila,'llave_fallecido')
//		ls_nombre_fallecido		= dw_lista.getitemstring(ll_fila,'nombre_fallecido')
//		ls_ap_paterno_fallecido	= dw_lista.getitemstring(ll_fila,'ap_paterno_fallecido')
//		ls_ap_materno_fallecido	= dw_lista.getitemstring(ll_fila,'ap_materno_fallecido')
//		ldt_fecha_traslado			= dw_lista.getitemdatetime(ll_fila,'fecha_traslado')
//		ll_cod_parque_origen		= dw_lista.getitemnumber(ll_fila,'cod_parque_origen')
//		ls_area_origen				= dw_lista.getitemstring(ll_fila,'area_origen')
//		ls_sector_origen			= dw_lista.getitemstring(ll_fila,'sector_origen')
//		ls_sepultura_origen		= dw_lista.getitemstring(ll_fila,'sepultura_origen')
//		ls_nro_resolucion			= dw_lista.getitemstring(ll_fila,'nro_resolucion')
//		ldt_fecha_resolucion		= dw_lista.getitemdatetime(ll_fila,'fecha_resolucion')
//		ls_nro_acta					= dw_lista.getitemstring(ll_fila,'nro_acta')
//		ls_base						= dw_lista.getitemstring(ll_fila,'base')
//		ls_serie						= dw_lista.getitemstring(ll_fila,'serie')
//		ll_numero					= dw_lista.getitemnumber(ll_fila, 'numero')
//		ls_cod_registro				= dw_lista.getitemstring(ll_fila,'cod_registro')
//		ls_observacion				= dw_lista.getitemstring(ll_fila,'observacion')
//		ls_area						= dw_lista.getitemstring(ll_fila,'area')
//		ls_sector_fc					= dw_lista.getitemstring(ll_fila,'sector')
//		ls_sepultura_fc				= dw_lista.getitemstring(ll_fila,'sepultura')
//		SELECT 	"FOSA_COMUN"."NIVELES"  
//		INTO 		:ls_nivel 
//		FROM 	"FOSA_COMUN"  
//		WHERE ( "FOSA_COMUN"."COD_PARQUE_ORIGEN" = :ll_cod_parque_origen ) AND  
//				  ( "FOSA_COMUN"."AREA_ORIGEN" = :ls_area_origen ) AND  
//				  ( "FOSA_COMUN"."SECTOR_ORIGEN" = :ls_sector_origen ) AND  
//				  ( "FOSA_COMUN"."SEPULTURA_ORIGEN" = :ls_sepultura_origen ) AND  
//				  ( "FOSA_COMUN"."NOMBRE_FALLECIDO" = :ls_nombre_fallecido ) AND  
// 				  ( "FOSA_COMUN"."AP_PATERNO_FALLECIDO" = :ls_ap_paterno_fallecido ) AND  
//				  ( "FOSA_COMUN"."AP_MATERNO_FALLECIDO" = :ls_ap_materno_fallecido ) AND  
//				  ( "FOSA_COMUN"."FECHA_TRASLADO" = :ldt_fecha_traslado ) AND  
//				  ( "FOSA_COMUN"."CORRELATIVO" = ( 	SELECT 	MIN("FOSA_COMUN"."CORRELATIVO") 
//				  													FROM 	"FOSA_COMUN" 
//																	WHERE 	( "FOSA_COMUN"."COD_PARQUE_ORIGEN" = :ll_cod_parque_origen ) AND
//																				( "FOSA_COMUN"."AREA_ORIGEN" = :ls_area_origen ) AND 
//																				( "FOSA_COMUN"."SECTOR_ORIGEN" = :ls_sector_origen ) AND 
//																				( "FOSA_COMUN"."SEPULTURA_ORIGEN" = :ls_sepultura_origen )  AND
//																				( "FOSA_COMUN"."NOMBRE_FALLECIDO" = :ls_nombre_fallecido ) AND  
//																			    ( "FOSA_COMUN"."AP_PATERNO_FALLECIDO" = :ls_ap_paterno_fallecido ) AND  
//																			    ( "FOSA_COMUN"."AP_MATERNO_FALLECIDO" = :ls_ap_materno_fallecido ) AND  
//																			    ( "FOSA_COMUN"."FECHA_TRASLADO" = :ldt_fecha_traslado )   )  )
//		USING	sqlca;
//		if sqlca.sqlcode=0 then
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'nivel_sepultura_origen',ls_nivel)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_parque_origen',ll_cod_parque_origen)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'nombre_fallecido',ls_nombre_fallecido)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'apellido_paterno_fall',ls_ap_paterno_fallecido)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'apellido_materno_fall',ls_ap_materno_fallecido)
//			SELECT 	"CADENA"."ESTADO",  	"OFERTA_V"."FECHA",   	"OFERTA_V"."RUT",   	"CLIENTE"."DV",   	"CLIENTE"."NOMBRE",   	"CLIENTE"."A_PATERNO",   	"CLIENTE"."A_MATERNO",   	"CLIENTE"."TIPO_VIA",   	"CLIENTE"."DIRECCION_P",   	"CLIENTE"."NUMERO_PARTICULAR",   	"CLIENTE"."DEPTO_PARTICULAR",   	"CLIENTE"."BLOCK_PARTICULAR",   	"CLIENTE"."CIUDAD",   	"CLIENTE"."COMUNA",   	"CLIENTE"."FONO_P",   	"CLIENTE"."ESTADO_TITULAR",   	"PAGO_OFERTA"."CAPACIDAD",   	"PAGO_OFERTA"."NRO_TECNICO"  	
//			INTO 		:ls_estado_ctto,   			:ldt_fecha_ctto,   			:ll_rut_titular,   			:ls_dv_titular,   	:ls_nom_titular,   			:ls_ap_pat_titular,   			:ls_ap_mat_titular,   			:ls_tipo_via_titular,   		:ls_direc_titular,   					:ls_nro_direc_titular,   						:ls_depto_titular,   						:ls_block_titular,   							:ls_ciudad_titular,   		:ls_comuna_titular,   		:ls_fono_p_titular,   		:ls_estado_titular,   					:ll_capacidad,   						:ls_nro_tecnico 
//			FROM 	"CADENA",   "CLIENTE",   "OFERTA_V",   "PAGO_OFERTA"  
//			WHERE	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//						( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
//						( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
//						( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
//						( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
//						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
//						( "CADENA"."CODIGO" = "OFERTA_V"."BASE" ) and  
//						( ( "CADENA"."CODIGO" = :ls_base ) AND  
//						( "CADENA"."SERIE" = :ls_serie ) AND  
//						( "CADENA"."NUMERO" = :ll_numero ) AND  
//						( "CADENA"."COD_PARQUE" = :ll_cod_parque_origen ) )
//			UNION
//			SELECT 	"CADENA"."ESTADO",  	"CONTRATO"."FECHA",   "CONTRATO"."RUT",   	"CLIENTE"."DV",   	"CLIENTE"."NOMBRE",   	"CLIENTE"."A_PATERNO",   	"CLIENTE"."A_MATERNO",   	"CLIENTE"."TIPO_VIA",   	"CLIENTE"."DIRECCION_P",   	"CLIENTE"."NUMERO_PARTICULAR",   	"CLIENTE"."DEPTO_PARTICULAR",   	"CLIENTE"."BLOCK_PARTICULAR",   	"CLIENTE"."CIUDAD",   	"CLIENTE"."COMUNA",   	"CLIENTE"."FONO_P",   	"CLIENTE"."ESTADO_TITULAR",   	"CONTRATO"."CAPACIDAD",   	to_char("CONTRATO"."NRO_TEC")
//			FROM 	"CADENA",   "CLIENTE",   "CONTRATO"
//			WHERE	( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
//						( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
//						( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
//						( "CADENA"."CODIGO" = :ls_base ) and  
//						( ( "CADENA"."SERIE" = :ls_serie ) AND  
//						( "CADENA"."NUMERO" = :ll_numero ) AND  
//						( "CADENA"."COD_PARQUE" = :ll_cod_parque_origen ) )
//			USING	sqlca;
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'rut_titular_origen',ll_rut_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'dv_titular_origen',ls_dv_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'nombre_titular_origen',ls_nom_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'apellido_pat_titular_origen',ls_ap_pat_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'apellido_mat_titular_origen',ls_ap_mat_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'tipo_via_origen_titular',ls_tipo_via_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'direccion_titular_origen',ls_direc_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'nro_direc_titular_origen',ls_nro_direc_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'dpto_direc_titular_origen',ls_depto_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'block_direc_titular_origen',ls_block_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_ciudad_titular_origen',ls_ciudad_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'cod_comuna_titular_origen',ls_comuna_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fono_titular_origen',ls_fono_p_titular)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_contrato_origen',ldt_fecha_ctto)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'capacidad_origen',ll_capacidad)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'estado_contrato_origen',ls_estado_ctto)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'numero_tecnico_origen',ls_nro_tecnico)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'base_origen',ls_base)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'serie_origen',ls_serie)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'numero_origen',ll_numero)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sector_origen',ls_sector_fc)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sepultura_origen',ls_sepultura_fc)
//			
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getrow(),'fecha_traslado',datetime(date(gdt_fec_sistema),time('00:00:00')))
//			
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'nombre_fallecido',ls_nombre_fallecido)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'apellido_paterno_fall',ls_ap_paterno_fallecido)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'apellido_materno_fall',ls_ap_materno_fallecido)
//			
//			SELECT 	"FALLECIDOS"."RUT",  	"FALLECIDOS"."DV",  		"FALLECIDOS"."FEC_NAC", 	"FALLECIDOS"."FEC_FALL",  	"FALLECIDOS"."EDAD",  	"FALLECIDOS"."SEXO"  
//			INTO 		:ll_rut_fall,   				:ls_dv_fall,   				:ldt_fec_nac,   					:ldt_fec_fall,   						:ll_edad,   					:ls_sexo  
//			FROM 	"FALLECIDOS"  
//			WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave_fallecido   ;
//
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'fecha_defuncion',ldt_fec_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'fecha_nacimiento_fallecido',ldt_fec_nac)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'rut_fallecido',ll_rut_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'dv_fallecido',ls_dv_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'sexo_fallecido',ls_sexo)
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(1,'edad_fallecido',ll_edad)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_defuncion',ldt_fec_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_nacimiento_fallecido',ldt_fec_nac)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'rut_fallecido',ll_rut_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'dv_fallecido',ls_dv_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sexo_fallecido',ls_sexo)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'edad_fallecido',ll_edad)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_defuncion',ldt_fec_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'fecha_nacimiento_fallecido',ldt_fec_nac)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'rut_fallecido',ll_rut_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'dv_fallecido',ls_dv_fall)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'sexo_fallecido',ls_sexo)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(1,'edad_fallecido',ll_edad)
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.accepttext()
//			w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.accepttext()
//			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.triggerevent(itemchanged!)
//			close(w_lista_fosa_comun_para_fs_parque)
//		end if
//	end if
//end if
end event

type dw_lista from datawindow within w_lista_fosa_comun_para_fs_parque
integer x = 41
integer y = 112
integer width = 4818
integer height = 1316
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_fosa_comun_para_ficha_parque"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

event doubleclicked;if row > 0 then
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_lista_fosa_comun_para_fs_parque
integer x = 859
integer y = 1428
integer width = 978
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

