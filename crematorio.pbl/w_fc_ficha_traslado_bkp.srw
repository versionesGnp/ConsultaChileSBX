forward
global type w_fc_ficha_traslado_bkp from window
end type
type dw_print from datawindow within w_fc_ficha_traslado_bkp
end type
type cb_limpiar from commandbutton within w_fc_ficha_traslado_bkp
end type
type cb_nuevo from commandbutton within w_fc_ficha_traslado_bkp
end type
type cb_buscar from commandbutton within w_fc_ficha_traslado_bkp
end type
type pb_aceptar from picturebutton within w_fc_ficha_traslado_bkp
end type
type em_folio from editmask within w_fc_ficha_traslado_bkp
end type
type st_1 from statictext within w_fc_ficha_traslado_bkp
end type
type cb_imprimir from commandbutton within w_fc_ficha_traslado_bkp
end type
type cb_eliminar from commandbutton within w_fc_ficha_traslado_bkp
end type
type cb_cerrar from commandbutton within w_fc_ficha_traslado_bkp
end type
type cb_grabar from commandbutton within w_fc_ficha_traslado_bkp
end type
type tab_1 from tab within w_fc_ficha_traslado_bkp
end type
type tabpage_1 from userobject within tab_1
end type
type st_2 from statictext within tabpage_1
end type
type ddplb_contratos from dropdownpicturelistbox within tabpage_1
end type
type dw_ficha from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_2 st_2
ddplb_contratos ddplb_contratos
dw_ficha dw_ficha
end type
type tabpage_2 from userobject within tab_1
end type
type dw_fallecido from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_fallecido dw_fallecido
end type
type tab_1 from tab within w_fc_ficha_traslado_bkp
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_fc_ficha_traslado_bkp from window
integer width = 3575
integer height = 2152
boolean titlebar = true
string title = "Ficha Traslado Crematorio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_print dw_print
cb_limpiar cb_limpiar
cb_nuevo cb_nuevo
cb_buscar cb_buscar
pb_aceptar pb_aceptar
em_folio em_folio
st_1 st_1
cb_imprimir cb_imprimir
cb_eliminar cb_eliminar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
tab_1 tab_1
end type
global w_fc_ficha_traslado_bkp w_fc_ficha_traslado_bkp

type variables
Double	il_rut_titular,il_rut_fallecido
Long		il_folio_fc,il_grabar
String		is_opcion

end variables

on w_fc_ficha_traslado_bkp.create
this.dw_print=create dw_print
this.cb_limpiar=create cb_limpiar
this.cb_nuevo=create cb_nuevo
this.cb_buscar=create cb_buscar
this.pb_aceptar=create pb_aceptar
this.em_folio=create em_folio
this.st_1=create st_1
this.cb_imprimir=create cb_imprimir
this.cb_eliminar=create cb_eliminar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.tab_1=create tab_1
this.Control[]={this.dw_print,&
this.cb_limpiar,&
this.cb_nuevo,&
this.cb_buscar,&
this.pb_aceptar,&
this.em_folio,&
this.st_1,&
this.cb_imprimir,&
this.cb_eliminar,&
this.cb_cerrar,&
this.cb_grabar,&
this.tab_1}
end on

on w_fc_ficha_traslado_bkp.destroy
destroy(this.dw_print)
destroy(this.cb_limpiar)
destroy(this.cb_nuevo)
destroy(this.cb_buscar)
destroy(this.pb_aceptar)
destroy(this.em_folio)
destroy(this.st_1)
destroy(this.cb_imprimir)
destroy(this.cb_eliminar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.tab_1)
end on

event open;String		ls_tipo_venta

gf_centrar(w_fc_ficha_traslado)
il_grabar													= 0
il_rut_titular												= Double(substr(1,1, Message.StringParm))
il_folio_fc												= Long(substr(1,2, Message.StringParm))
il_rut_fallecido											= Double(substr(1,3, Message.StringParm))
is_opcion													= substr(1,4, Message.StringParm)
cb_limpiar.triggerevent(clicked!)
if is_opcion='N' then 
	cb_nuevo.triggerevent(clicked!)
	cb_nuevo.visible									= false
else
	cb_nuevo.visible									= true
end if
em_folio.text											= string(il_folio_fc)
tab_1.tabpage_1.dw_ficha.settransobject(sqlca)
tab_1.tabpage_2.dw_fallecido.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_print.getchild('tipo_venta_cineracion',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ls_tipo_venta)=0 then
	idw_detalle.insertrow(0)
end if

tab_1.tabpage_2.dw_fallecido.getchild('comuna_fallecido',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve('130')=0 then
	idw_detalle2.insertrow(0)
end if

tab_1.tabpage_1.dw_ficha.enabled				= false
tab_1.tabpage_2.dw_fallecido.enabled			= false
tab_1.tabpage_1.ddplb_contratos.enabled		= false
if is_opcion='N' then 
	em_folio.enabled									= false
	pb_aceptar.enabled								= false
	pb_aceptar.triggerevent(clicked!)
else
	em_folio.enabled									= true
	pb_aceptar.enabled								= true
end if

end event

type dw_print from datawindow within w_fc_ficha_traslado_bkp
integer x = 1353
integer y = 2128
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_imprimir_ficha_traslado_crematorio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from commandbutton within w_fc_ficha_traslado_bkp
integer x = 1061
integer y = 1908
integer width = 293
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;String		ls_tipo_venta,ls_ciudad
Long		ll_rut

tab_1.tabpage_1.dw_ficha.getchild('tipo_venta_cineracion',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(ls_tipo_venta)=0 then
	idw_detalle2.insertrow(0)
end if

tab_1.tabpage_2.dw_fallecido.getchild('comuna_fallecido',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(ls_ciudad)=0 then
	idw_detalle3.insertrow(0)
end if

tab_1.tabpage_1.dw_ficha.getchild('folio_crematorio',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve(ll_rut)=0 then
	idw_detalle4.insertrow(0)
end if
em_folio.text							= ''
tab_1.tabpage_1.dw_ficha.reset()
tab_1.tabpage_2.dw_fallecido.reset()
tab_1.tabpage_1.dw_ficha.insertrow(0)
tab_1.tabpage_2.dw_fallecido.insertrow(0)
tab_1.tabpage_1.ddplb_contratos.reset()
tab_1.tabpage_2.dw_fallecido.accepttext()
 tab_1.SelectedTab					= 1
tab_1.tabpage_1.dw_ficha.accepttext()
tab_1.tabpage_1.dw_ficha.setfocus()
end event

type cb_nuevo from commandbutton within w_fc_ficha_traslado_bkp
integer x = 32
integer y = 1908
integer width = 293
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new_ficha,ll_new_falle
tab_1.tabpage_1.dw_ficha.reset()
tab_1.tabpage_2.dw_fallecido.reset()

ll_new_ficha		= tab_1.tabpage_1.dw_ficha.insertrow(0)
ll_new_falle		= tab_1.tabpage_2.dw_fallecido.insertrow(0)
tab_1.tabpage_1.ddplb_contratos.reset()
tab_1.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_nuevo','S')
tab_1.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_reg','P')
tab_1.tabpage_1.dw_ficha.setitem(ll_new_ficha,'usuario_crea',gs_user)
tab_1.tabpage_1.dw_ficha.setitem(ll_new_ficha,'tipo_traslado','T')
tab_1.tabpage_1.dw_ficha.setitem(ll_new_ficha,'hora_traslado',0)
tab_1.tabpage_1.dw_ficha.setitem(ll_new_ficha,'minuto_traslado',0)
tab_1.tabpage_2.dw_fallecido.setitem(ll_new_falle,'estado_nuevo','S')

tab_1.tabpage_1.dw_ficha.enabled			= true
tab_1.tabpage_2.dw_fallecido.enabled		= true
tab_1.tabpage_2.dw_fallecido.accepttext()
tab_1.tabpage_1.dw_ficha.accepttext()
tab_1.tabpage_1.dw_ficha.setfocus()
tab_1.tabpage_1.dw_ficha.setcolumn('tipo_traslado')

end event

type cb_buscar from commandbutton within w_fc_ficha_traslado_bkp
integer x = 3200
integer y = 44
integer width = 293
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;if isvalid(w_buscar_ficha_ing_parque) then close(w_buscar_ficha_ing_parque)
open(w_buscar_ficha_ing_parque)
end event

type pb_aceptar from picturebutton within w_fc_ficha_traslado_bkp
integer x = 1358
integer y = 20
integer width = 169
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_folio, ll_numero,ll_count_fc,ll_rut,ll_count_ag,ll_parque_origen,ll_parque_destino,ll_hora_defuncion,ll_minuto_defuncion,ll_destino_cuerpo,ll_estado_gestion,&
			ll_count_tras
String		ls_base,ls_serie,ls_ciudad,ls_nombre,ls_estado,ls_string,ls_base_crem,ls_serie_crem,ls_tipo_origen,ls_forma_venta,ls_origen_contrato,&
			ls_base_origen,ls_serie_origen,ls_dv_falle,ls_nom_falle,ls_ap_pat_falle,ls_ap_mat_falle,ls_sexo_falle,ls_causa_falle,ls_estado_cuerpo,ls_estado_civil_falle,&
			ls_cuidad_falle,ls_comuna_falle,ls_tipo_via_falle,ls_direc_falle,ls_nro_falle,ls_depto_falle,ls_block_falle,ls_tamano_cuerpo,ls_dv_titular,ls_estado_titular,&
			ls_nom_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_estado_contrato,ls_sector,ls_area,ls_sepultura,ls_nivel
Datetime	ldt_nulo,ldt_fecha_nac_falle,ldt_fecha_defuncion
Double	ll_numero_crem,ll_numero_origen,ll_rut_falle,ll_valor_tras_crema,ll_arancel

Setnull(ldt_nulo)
il_grabar														= 0
ll_folio														= Long(em_folio.text)
if tab_1.tabpage_1.dw_ficha.retrieve(ll_folio)=0 then
//	tab_1.tabpage_1.dw_ficha.Object.arancel_traslado.Protect	= 1
	tab_1.tabpage_2.dw_fallecido.reset()
	tab_1.tabpage_1.ddplb_contratos.reset()
	tab_1.tabpage_1.dw_ficha.insertrow(0)
	tab_1.tabpage_2.dw_fallecido.insertrow(0)
	tab_1.tabpage_1.dw_ficha.enabled				= false
	tab_1.tabpage_2.dw_fallecido.enabled			= false
	tab_1.tabpage_1.ddplb_contratos.enabled		= false
	if is_opcion='N' then
		tab_1.tabpage_1.dw_ficha.enabled			= true
		tab_1.tabpage_2.dw_fallecido.enabled		= true
		tab_1.tabpage_1.ddplb_contratos.enabled	= true
		il_grabar ++
		ls_tipo_origen										= tab_1.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen_crematorio')
		idw_detalle2.retrieve(ls_tipo_origen)
//		tab_1.tabpage_2.dw_fallecido.retrieve(ll_folio)
		ls_ciudad												= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'ciudad_fallecido')
		idw_detalle2.retrieve(ls_ciudad)
		tab_1.tabpage_1.dw_ficha.setitem(1,'estado_nuevo','N')
		tab_1.tabpage_2.dw_fallecido.setitem(1,'estado_nuevo','N')
		if is_opcion='N' then
			tab_1.tabpage_1.ddplb_contratos.reset()
			tab_1.tabpage_1.ddplb_contratos.enabled	= true
			DECLARE x1 CURSOR FOR  
			SELECT		"CADENA"."CODIGO",   
							"CADENA"."SERIE",   
							"CADENA"."NUMERO",
							"CADENA"."ESTADO"
			FROM 		"CADENA"  
			WHERE 		"CADENA"."RUT" = :il_rut_titular  
			ORDER BY	"CADENA"."NUMERO" ASC
			USING	sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				do while sqlca.sqlcode=0
					fetch x1 into :ls_base, :ls_serie, :ll_numero, :ls_estado;
					if not isnull(ll_numero) then
						if ls_estado='V' or ls_estado='C' then
							ls_string		= ls_base+'-'+ls_serie+'-'+string(ll_numero)
						else
							ls_string		= '[ '+ls_base+'-'+ls_serie+'-'+string(ll_numero)+' ]'
						end if
						tab_1.tabpage_1.ddplb_contratos.additem(ls_string)
					end if
					Setnull(ll_numero)
				loop
			end if
			close x1;
			
			SELECT 	"FC_CABECERA"."BASE",  	"FC_CABECERA"."SERIE",   	"FC_CABECERA"."NUMERO",   	"FC_CABECERA"."TIPO_ORIGEN",   	"FC_CABECERA"."FORMA_VENTA",   	"FC_CABECERA"."ORIGEN_CONTRATO",   	"FC_CABECERA"."COD_PARQUE_ORIGEN",   	"FC_CABECERA"."COD_PARQUE_DESTINO",   	"FC_CABECERA"."BASE_ORIGEN",   	"FC_CABECERA"."SERIE_ORIGEN",   	"FC_CABECERA"."NUMERO_ORIGEN",   	"FC_FALLECIDO"."RUT_FALLECIDO",   	"FC_FALLECIDO"."DV_FALLECIDO",   	"FC_FALLECIDO"."NOMBRES",   	"FC_FALLECIDO"."APELLIDO_PATERNO",   	"FC_FALLECIDO"."APELLIDO_MATERNO",   	"FC_FALLECIDO"."FECHA_NACIMIENTO",   	"FC_FALLECIDO"."SEXO",   	"FC_FALLECIDO"."FECHA_DEFUNCION",   	"FC_FALLECIDO"."CAUSA_FALLECIMIENTO",   	"FC_FALLECIDO"."ESTADO_CUERPO",   	"FC_FALLECIDO"."HORA_DEFUNCION",   	"FC_FALLECIDO"."MINUTO_DEFUNCION",   	"FC_FALLECIDO"."ESTADO_CIVIL",   	"FC_FALLECIDO"."CIUDAD_FALLECIMIENTO",   	"FC_FALLECIDO"."COMUNA_FALLECIMIENTO",   	"FC_FALLECIDO"."TIPO_VIA_FALLECIDO",   	"FC_FALLECIDO"."DIRECCION_FALLECIDO",   	"FC_FALLECIDO"."NUMERO_FALLECIDO",   	"FC_FALLECIDO"."DEPTO_FALLECIDO",   	"FC_FALLECIDO"."BLOCK_FALLECIDO",   	"FC_FALLECIDO"."TAMANO_CUERPO",	"FC_TITULAR"."DV_TITULAR",		"FC_TITULAR"."NOMBRES",		"FC_TITULAR"."APELLIDO_PATERNO",	"FC_TITULAR"."APELLIDO_MATERNO",	"FC_CABECERA"."ESTADO_CONTRATO",		"FC_CABECERA"."DESTINO_CUERPO",		"FC_CABECERA"."ESTADO_GESTION"	
			INTO 		:ls_base_crem,   				:ls_serie_crem,   				:ll_numero_crem,   				:ls_tipo_origen,   							:ls_forma_venta,   						:ls_origen_contrato,   							:ll_parque_origen,   									:ll_parque_destino,   									:ls_base_origen,   							:ls_serie_origen,   						:ll_numero_origen,   							:ll_rut_falle,   									:ls_dv_falle,   								:ls_nom_falle,   						:ls_ap_pat_falle,   									:ls_ap_mat_falle,   								:ldt_fecha_nac_falle,   							:ls_sexo_falle,   				:ldt_fecha_defuncion,   							:ls_causa_falle,   										:ls_estado_cuerpo,   							:ll_hora_defuncion,   							:ll_minuto_defuncion,   							:ls_estado_civil_falle,   					:ls_cuidad_falle,   										:ls_comuna_falle,   										:ls_tipo_via_falle,   								:ls_direc_falle,   										:ls_nro_falle,   										:ls_depto_falle,   									:ls_block_falle,   								:ls_tamano_cuerpo,							:ls_dv_titular  ,							:ls_nom_tit,							:ls_ap_pat_tit,									:ls_ap_mat_tit,									:ls_estado_contrato,								:ll_destino_cuerpo,								:ll_estado_gestion
			FROM 	"FC_CABECERA",   "FC_FALLECIDO",	"FC_TITULAR"  
			WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_TITULAR"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio_fc )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				tab_1.tabpage_1.dw_ficha.setitem(1,'tipo_traslado','T')
				tab_1.tabpage_1.dw_ficha.setitem(1,'estado_nuevo','S')
				tab_1.tabpage_1.dw_ficha.setitem(1,'estado_reg','P')
				tab_1.tabpage_1.dw_ficha.setitem(1,'usuario_crea',gs_user)
				tab_1.tabpage_1.dw_ficha.setitem(1,'rut_titular_origen',il_rut_titular)
				tab_1.tabpage_1.dw_ficha.setitem(1,'rut_titular_destino',il_rut_titular)
				idw_detalle4.retrieve(il_rut_titular)
				tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_destino',ls_dv_titular)
				tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_origen',ls_dv_titular)
				tab_1.tabpage_1.dw_ficha.setitem(1,'nombre_titular_origen',ls_nom_tit)
				tab_1.tabpage_1.dw_ficha.setitem(1,'ap_pat_titular_origen',ls_ap_pat_tit)
				tab_1.tabpage_1.dw_ficha.setitem(1,'ap_mat_titular_origen',ls_ap_mat_tit)
				tab_1.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_parque_origen)
				tab_1.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_origen)
				tab_1.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_origen)
				tab_1.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_origen)
				
				SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
				INTO 		:ll_valor_tras_crema
				FROM 	"CUENTA_CONTABLE_OTROS"  
				WHERE 	( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
							( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '24' ) AND  
							( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'CI' )   ;
							
				tab_1.tabpage_1.dw_ficha.setitem(1,'arancel_traslado',ll_valor_tras_crema)
				tab_1.tabpage_1.dw_ficha.setitem(1,'estado_contrato_origen',ls_estado_contrato)
				tab_1.tabpage_1.dw_ficha.setitem(1,'folio_crematorio',il_folio_fc)
				idw_detalle2.retrieve(ls_forma_venta)
				tab_1.tabpage_1.dw_ficha.setitem(1,'tipo_origen_crematorio',ls_tipo_origen)
				idw_detalle.retrieve(ls_tipo_origen)
				tab_1.tabpage_1.dw_ficha.setitem(1,'tipo_venta_cineracion',ls_forma_venta)
				tab_1.tabpage_1.dw_ficha.setitem(1,'tipo_contrato_cineracion',ls_origen_contrato)
				tab_1.tabpage_1.dw_ficha.setitem(1,'base_crematorio',ls_base_crem)
				tab_1.tabpage_1.dw_ficha.setitem(1,'serie_crematorio',ls_serie_crem)
				tab_1.tabpage_1.dw_ficha.setitem(1,'numero_crematorio',ll_numero_crem)
				tab_1.tabpage_1.dw_ficha.setitem(1,'parque_destino',ll_parque_destino)
				tab_1.tabpage_1.dw_ficha.setitem(1,'destino_cuerpo',ll_destino_cuerpo)
				tab_1.tabpage_1.dw_ficha.setitem(1,'estado_gestion_crematorio',ll_estado_gestion)
				if ls_base='O' then
					SELECT	"PAGO_OFERTA"."SECTOR",
								"PAGO_OFERTA"."AREA",
								"PAGO_OFERTA"."SEPULTURA"
					INTO 		:ls_sector,
								:ls_area,
								:ls_sepultura
					FROM 	"OFERTA_V",   
								"PAGO_OFERTA",   
								"CADENA"  
					WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
							  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
							  ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
							  ( ( "CADENA"."CODIGO" = :ls_base_origen ) AND  
							  ( "CADENA"."SERIE" = :ls_serie_origen ) AND  
							  ( "CADENA"."NUMERO" = :ll_numero_origen ) )   
					USING	sqlca;
	
				elseif ls_base='C' then
					SELECT	"CONTRATO"."SECTOR",
								"CONTRATO"."ZONA",
								"CONTRATO"."SEPULTURA"
					INTO 		:ls_sector,
								:ls_area,
								:ls_sepultura
					FROM 	"CADENA",   
								"CONTRATO"  
					WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
							  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
							  ( ( "CADENA"."CODIGO" = :ls_base_origen ) AND  
							  ( "CADENA"."SERIE" = :ls_serie_origen ) AND  
							  ( "CADENA"."NUMERO" = :ll_numero_origen ) ) 
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					tab_1.tabpage_1.dw_ficha.setitem(1,'sector_origen',ls_sector)
					tab_1.tabpage_1.dw_ficha.setitem(1,'sepultura_origen',ls_sepultura)
				end if
				SELECT 	"FALLECIDOS"."NIVEL"  
				INTO 		:ls_nivel  
				FROM 	"FALLECIDOS"  
				WHERE 	"FALLECIDOS"."RUT" = :il_rut_fallecido
				USING	sqlca;
				if sqlca.sqlcode=0 then
					tab_1.tabpage_1.dw_ficha.setitem(1,'nivel_origen',ls_nivel)
				end if
				SELECT 	"CLIENTE"."DV",  	"CLIENTE"."ESTADO_TITULAR"  
				INTO 		:ls_dv_titular,   	:ls_estado_titular  
				FROM 	"CLIENTE"  
				WHERE 	"CLIENTE"."RUT" = :il_rut_titular 
				USING	sqlca;
				if sqlca.sqlcode=0 then
					tab_1.tabpage_1.dw_ficha.setitem(1,'estado_titular_origen',ls_estado_titular)
				end if
				
				tab_1.tabpage_2.dw_fallecido.setitem(1,'folio_crematorio',il_folio_fc)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'estado_reg','P')
				tab_1.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',il_rut_fallecido)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_dv_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'nombre_fallecido',ls_nom_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'ap_paterno_fallecido',ls_ap_pat_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'ap_materno_fallecido',ls_ap_mat_falle)
				if isnull(ls_tipo_via_falle) then ls_tipo_via_falle='-'
				if isnull(ls_direc_falle) then ls_direc_falle='-'
				if isnull(ls_nro_falle) then ls_nro_falle='-'
				if isnull(ls_depto_falle) then ls_depto_falle='-'
				if isnull(ls_block_falle) then ls_block_falle='-'
				if isnull(ls_cuidad_falle) then ls_cuidad_falle='0'
				if isnull(ls_comuna_falle) then ls_comuna_falle='0'
				tab_1.tabpage_2.dw_fallecido.setitem(1,'tipo_via_fallecido',ls_tipo_via_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'direccion_fallecido',ls_direc_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'nro_direc_fallecido',ls_nro_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'dpto_direc_fallecido',ls_depto_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'block_direc_fallecido',ls_block_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'ciudad_fallecido',ls_cuidad_falle)
				idw_detalle3.retrieve(ls_cuidad_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'comuna_fallecido',ls_comuna_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'estado_civil_fallecido',ls_estado_civil_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'fecha_nacimiento',ldt_fecha_nac_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'fecha_defuncion',ldt_fecha_defuncion)
				if isnull(ll_hora_defuncion) then ll_hora_defuncion=0
				if isnull(ll_minuto_defuncion) then ll_minuto_defuncion=0
				tab_1.tabpage_2.dw_fallecido.setitem(1,'hora_defuncion',ll_hora_defuncion)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'minuto_defuncion',ll_minuto_defuncion)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'cod_estado_cuerpo',ls_estado_cuerpo)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'tamano_cuerpo',ls_tamano_cuerpo)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'sexo',ls_sexo_falle)
				tab_1.tabpage_2.dw_fallecido.setitem(1,'causa_fallecimiento',ls_causa_falle)
			end if
	
			tab_1.tabpage_1.ddplb_contratos.setfocus()
		end if
		tab_1.tabpage_1.dw_ficha.accepttext()
		tab_1.tabpage_2.dw_fallecido.accepttext()
		tab_1.tabpage_1.dw_ficha.enabled			= true
		tab_1.tabpage_2.dw_fallecido.enabled		= true
		tab_1.tabpage_1.dw_ficha.setfocus()
	else
		messagebox("Advertencia","Ficha Traslado Crematorio NO Existe")
	end if
else
//	il_grabar ++
	ls_tipo_origen										= tab_1.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen_crematorio')
	ll_hora_defuncion									= tab_1.tabpage_2.dw_fallecido.getitemnumber(1,'hora_defuncion')
	ll_minuto_defuncion								= tab_1.tabpage_2.dw_fallecido.getitemnumber(1,'minuto_defuncion')
	ls_base_origen										= tab_1.tabpage_1.dw_ficha.getitemstring(1,'base_origen')
	ls_serie_origen										= tab_1.tabpage_1.dw_ficha.getitemstring(1,'serie_origen')
	ll_numero_origen									= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'numero_origen')
	ll_arancel											= Double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'arancel_traslado'))
	if ll_arancel=0 or isnull(ll_arancel) then
		SELECT 	"CUENTA_CONTABLE_OTROS"."VALOR"  
		INTO 		:ll_valor_tras_crema
		FROM 	"CUENTA_CONTABLE_OTROS"  
		WHERE 	( "CUENTA_CONTABLE_OTROS"."TIPO_COB" = 'L' ) AND  
					( "CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '24' ) AND  
					( "CUENTA_CONTABLE_OTROS"."TIPO_COMPROBANTE" = 'CI' )   ;
					
		tab_1.tabpage_1.dw_ficha.setitem(1,'arancel_traslado',ll_valor_tras_crema)
	end if
//	SELECT 	COUNT("INGRESO"."TIPO_COB")  
//	INTO 		:ll_count_tras  
//	FROM 	"INGRESO"  
//	WHERE 	( "INGRESO"."BASE" = :ls_base_origen ) AND  
//				( "INGRESO"."SERIE" = :ls_serie_origen ) AND  
//				( "INGRESO"."CONTRATO" = :ll_numero_origen ) AND  
//				( "INGRESO"."PAGO_HIST" = 'A' ) AND  
//				( "INGRESO"."TIPO_MOV" = 'L' ) AND  
//				( "INGRESO"."CODIGO_OTRO" = '24' )   ;
//	if ll_count_tras > 0 then
//		tab_1.tabpage_1.dw_ficha.Object.arancel_traslado.Protect	= 0
//	else
//		tab_1.tabpage_1.dw_ficha.Object.arancel_traslado.Protect	= 1
//	end if
	if isnull(ll_hora_defuncion) then ll_hora_defuncion=0
	if isnull(ll_minuto_defuncion) then ll_minuto_defuncion=0
	tab_1.tabpage_2.dw_fallecido.setitem(1,'hora_defuncion',ll_hora_defuncion)
	tab_1.tabpage_2.dw_fallecido.setitem(1,'minuto_defuncion',ll_minuto_defuncion)
	idw_detalle.retrieve(ls_tipo_origen)
	idw_detalle2.retrieve('130')
	tab_1.tabpage_2.dw_fallecido.retrieve(ll_folio)
	ls_ciudad												= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'ciudad_fallecido')
	if isnull(ls_ciudad) then ls_ciudad='130'
	idw_detalle2.retrieve(ls_ciudad)
	tab_1.tabpage_1.dw_ficha.setitem(1,'estado_nuevo','N')
	tab_1.tabpage_2.dw_fallecido.setitem(1,'estado_nuevo','N')
	if is_opcion='N' then
		tab_1.tabpage_1.ddplb_contratos.reset()
		tab_1.tabpage_1.ddplb_contratos.enabled	= false
		DECLARE x2 CURSOR FOR  
		SELECT		"CADENA"."CODIGO",   
						"CADENA"."SERIE",   
						"CADENA"."NUMERO",
						"CADENA"."ESTADO"
		FROM 		"CADENA"  
		WHERE 		"CADENA"."RUT" = :il_rut_titular  
		ORDER BY	"CADENA"."NUMERO" ASC
		USING	sqlca;
		open x2;
		if sqlca.sqlcode=0 then
			do while sqlca.sqlcode=0
				fetch x2 into :ls_base, :ls_serie, :ll_numero, :ls_estado;
				if not isnull(ll_numero) then
					if ls_estado='V' or ls_estado='C' then
						ls_string		= ls_base+'-'+ls_serie+'-'+string(ll_numero)
					else
						ls_string		= '[ '+ls_base+'-'+ls_serie+'-'+string(ll_numero)+' ]'
					end if
					tab_1.tabpage_1.ddplb_contratos.additem(ls_string)
				end if
				Setnull(ll_numero)
			loop
		end if
		close x2;
		
		tab_1.tabpage_1.ddplb_contratos.setfocus()
	end if
	tab_1.tabpage_1.dw_ficha.accepttext()
	tab_1.tabpage_2.dw_fallecido.accepttext()
	tab_1.tabpage_1.dw_ficha.enabled			= true
	tab_1.tabpage_2.dw_fallecido.enabled		= true
	tab_1.tabpage_1.dw_ficha.setfocus()
end if

end event

type em_folio from editmask within w_fc_ficha_traslado_bkp
integer x = 763
integer y = 60
integer width = 512
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Long		ll_folio,ll_new,ll_rut
String		ls_tipo_venta,ls_ciudad

ll_folio	= long(this.text)
if ll_folio > 0 then
	tab_1.tabpage_1.dw_ficha.getchild('tipo_venta_cineracion',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ls_tipo_venta)=0 then
		idw_detalle2.insertrow(0)
	end if
	
	tab_1.tabpage_2.dw_fallecido.getchild('comuna_fallecido',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(ls_ciudad)=0 then
		idw_detalle3.insertrow(0)
	end if
	
	tab_1.tabpage_1.dw_ficha.getchild('folio_crematorio',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	if idw_detalle4.retrieve(ll_rut)=0 then
		idw_detalle4.insertrow(0)
	end if
	tab_1.tabpage_1.dw_ficha.reset()
	tab_1.tabpage_2.dw_fallecido.reset()
	tab_1.tabpage_1.dw_ficha.insertrow(0)
	tab_1.tabpage_2.dw_fallecido.insertrow(0)
	tab_1.tabpage_1.ddplb_contratos.reset()
	tab_1.tabpage_2.dw_fallecido.accepttext()
	 tab_1.SelectedTab					= 1
	tab_1.tabpage_1.dw_ficha.accepttext()
	pb_aceptar.setfocus()
	
	
	
	
//	pb_aceptar.triggerevent(clicked!)
//	tab_crematorio.tabpage_1.dw_ficha.reset()
//	tab_crematorio.tabpage_2.dw_fallecido.reset()
//	tab_crematorio.tabpage_3.dw_titular.reset()
//	tab_crematorio.tabpage_4.dw_prelacion.reset()
//	tab_crematorio.tabpage_5.dw_aranceles.reset()
//	tab_crematorio.tabpage_6.dw_archivos.reset()
//	tab_crematorio.tabpage_7.dw_ceremonia.reset()
//	tab_crematorio.tabpage_8.dw_cenizas.reset()
//	idw_detalle.retrieve(is_base)
//	idw_detalle2.retrieve(is_tipo_venta)
//	idw_detalle3.retrieve(is_tipo_venta)
//	idw_detalle4.insertrow(0)
//	idw_detalle12.insertrow(0)
//	idw_detalle13.insertrow(0)
//	idw_detalle14.insertrow(0)
//	idw_detalle15.retrieve()
//	idw_detalle16.reset()
//	idw_detalle16.insertrow(0)
//	tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
//	tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
//	tab_crematorio.tabpage_3.dw_titular.insertrow(0)
//	tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
//	tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
//	tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
//	tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
//	tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
//	if rb_buscar_ctto.checked=true then
//		dw_ctto.reset()
//		ll_new				= dw_ctto.insertrow(0)
//		dw_ctto.enabled	= true
////		em_folio.text		= ''
//		em_folio.enabled	= false
//		dw_ctto.setfocus()
//	elseif rb_buscar_folio.checked=true then
//		dw_ctto.reset()
//		ll_new				= dw_ctto.insertrow(0)
//		dw_ctto.enabled	= false
////		em_folio.text		= ''
//		em_folio.enabled	= true
//		em_folio.setfocus()
//	end if
//	tab_crematorio.tabpage_1.dw_ficha.enabled			= false
//	tab_crematorio.tabpage_2.dw_fallecido.enabled		= false
//	tab_crematorio.tabpage_3.dw_titular.enabled			= false
//	tab_crematorio.tabpage_4.dw_prelacion.enabled		= false
//	tab_crematorio.tabpage_5.dw_aranceles.enabled		= false
//	tab_crematorio.tabpage_6.dw_archivos.enabled		= false
//	tab_crematorio.tabpage_7.dw_ceremonia.enabled	= false
//	tab_crematorio.tabpage_8.dw_cenizas.enabled		= false
end if
end event

type st_1 from statictext within w_fc_ficha_traslado_bkp
integer x = 78
integer y = 68
integer width = 663
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Ficha Cremación Asociada"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_fc_ficha_traslado_bkp
integer x = 1605
integer y = 1908
integer width = 293
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;Long 		ll_folio_fc
String		ls_tiene_marcapasos,ls_tipo_venta

ll_folio_fc 				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
//ls_tipo_venta			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen_crematorio')
if ll_folio_fc > 0 then
	if dw_print.retrieve(ll_folio_fc) > 0 then
		ls_tipo_venta	= dw_print.getitemstring(1,'tipo_origen_crematorio')
		idw_detalle.retrieve(ls_tipo_venta)
		f_printdlg(dw_print,gstr_print,w_fc_ficha_traslado)
	else
		messagebox("Advertencia","Debe Grabar Antes de Imprimir Ficha de Traslado Crematorio")
	end if
end if
end event

type cb_eliminar from commandbutton within w_fc_ficha_traslado_bkp
integer x = 718
integer y = 1908
integer width = 293
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
end type

type cb_cerrar from commandbutton within w_fc_ficha_traslado_bkp
integer x = 3195
integer y = 1908
integer width = 293
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;if il_grabar > 0 and il_folio_fc > 0 then
	messagebox("Advertencia","Debe Grabar Ficha de Traslado")
else
	close(w_fc_ficha_traslado)
end if
end event

type cb_grabar from commandbutton within w_fc_ficha_traslado_bkp
integer x = 375
integer y = 1908
integer width = 293
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;String		ls_dv_fallecido,ls_nombre_fallecido,ls_ap_paterno_fallecido,ls_ap_materno_fallecido,ls_tipo_via_fallecido,ls_direccion_fallecido,ls_nro_direc_fallecido,&
			ls_dpto_direc_fallecido,ls_block_direc_fallecido,ls_ciudad_fallecido,ls_comuna_fallecido,ls_estado_civil_fallecido,ls_cod_estado_cuerpo,ls_tamano_cuerpo,&
			ls_sexo,ls_causa_fallecimiento,ls_observacion,ls_tipo_origen,ls_cod_otro,ls_base_f,ls_serie_f,ls_moneda,ls_base_ori,ls_serie_ori,ls_tipo_traslado,&
			ls_destino_cuerpo,ls_tipo_venta_cineracion,ls_tipo_contrato_cineracion,	ls_enfermedad_obligatoria,ls_dv_titular_origen,ls_nombre_titular_origen,&
			ls_ap_pat_titular_origen,ls_ap_mat_titular_origen,ls_sector_origen,ls_sepultura_origen,ls_base_origen,ls_serie_origen,ls_nivel_oigen,ls_estado_contrato_origen,&
			ls_estado_titular_origen,ls_base_crematorio,ls_serie_crematorio,ls_estado_reg,ls_dv_titular_destino,ls_tipo_origen_crematorio,ls_base_funeraria,ls_serie_funeraria,&
			ls_rut_empresa,ls_nombre,ls_hora
Double	ll_rut_fallecido,ll_rut_titular_origen,ll_rut_titular_destino,ll_funeraria,ll_folio_crematorio,ll_numero_f,ll_rut_cli,ll_monto_uf,ll_numero_ori,ll_folio_contrato_f,&
			ll_folio_traslado,ll_numero_origen,ll_numero_crematorio,ll_numero_funeraria,ll_rut_titular_funeraria,ll_folio_ci,ll_total,ll_arancel_traslado,ll_arancel_traslado_uf
datetime	ldt_fecha_pago,ldt_fecha_crem_ori,ldt_fecha_traslado,ldt_fecha_nacimiento,ldt_fecha_defuncion
Long		ll_hora_defuncion,ll_minuto_defuncion,ll_hora_traslado,ll_minuto_traslado,ll_max_folio,ll_consulta_folio,ll_cod_servicio,ll_count,ll_count_cd,ll_cod_parque,&
			ll_return,ll_cod_parque_origen,ll_edad,ll_annos_difunto,ll_cod_funeraria,ll_parque_destino,ll_estado_gestion_crematorio,ll_cod_religion,ll_covid_19,&
			ll_protocolo_covid,ll_sw_orador,ll_parque_origen,ll_suma_hora,ll_count_tras,ll_grupo,ll_hora_pago,ll_minuto_pago,ll_arancel_traslado_d

SELECT sysdate INTO :gdt_fec_sistema FROM dual;
ldt_fecha_pago					= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_tipo_origen					= tab_1.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen_crematorio')
ll_parque_origen				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_origen')
if ll_parque_origen <> 102 then
	ll_suma_hora				= 2
else
	ll_suma_hora				= 1
end if
ll_rut_fallecido					= Double(tab_1.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido'))
ls_dv_fallecido					= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
ls_nombre_fallecido			= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'nombre_fallecido')
ls_ap_paterno_fallecido		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'ap_paterno_fallecido')
ls_ap_materno_fallecido		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'ap_materno_fallecido')
ls_tipo_via_fallecido			= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'tipo_via_fallecido')
ls_direccion_fallecido			= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'direccion_fallecido')
ls_nro_direc_fallecido			= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'nro_direc_fallecido')
ls_dpto_direc_fallecido		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'dpto_direc_fallecido')
ls_block_direc_fallecido		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'block_direc_fallecido')
ls_ciudad_fallecido				= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'ciudad_fallecido')
ls_comuna_fallecido			= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'comuna_fallecido')
ls_estado_civil_fallecido		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'estado_civil_fallecido')
if isnull(ls_estado_civil_fallecido) then
	ls_estado_civil_fallecido	= 'S'
	tab_1.tabpage_2.dw_fallecido.setitem(1,'estado_civil_fallecido',ls_estado_civil_fallecido)
end if
ldt_fecha_nacimiento			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
ldt_fecha_defuncion			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
ll_hora_defuncion				= tab_1.tabpage_2.dw_fallecido.getitemnumber(1,'hora_defuncion')
ll_minuto_defuncion			= tab_1.tabpage_2.dw_fallecido.getitemnumber(1,'minuto_defuncion')
ls_cod_estado_cuerpo		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'cod_estado_cuerpo')
ls_tamano_cuerpo				= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'tamano_cuerpo')
ls_sexo							= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'sexo')
ls_causa_fallecimiento		= tab_1.tabpage_2.dw_fallecido.getitemstring(1,'causa_fallecimiento')

ls_tipo_traslado				= tab_1.tabpage_1.dw_ficha.getitemstring(1,'tipo_traslado')
ll_rut_titular_origen			= Double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_origen'))
ll_rut_titular_destino			= Double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_destino'))

ls_base_ori						= tab_1.tabpage_1.dw_ficha.getitemstring(1,'base_origen')
ls_serie_ori						= tab_1.tabpage_1.dw_ficha.getitemstring(1,'serie_origen')
ll_numero_ori					= Double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'numero_origen'))
ls_nombre_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'nombre_titular_origen')
ls_ap_pat_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'ap_pat_titular_origen')
ls_ap_mat_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'ap_mat_titular_origen')
ls_nombre						= ls_nombre_titular_origen +' '+ ls_ap_pat_titular_origen +' '+ ls_ap_mat_titular_origen

if ls_tipo_origen='SV' then
	ll_rut_titular_origen		= 96844000
	ll_rut_cli						= double(ll_rut_titular_origen)
else
	ll_rut_cli						= double(ll_rut_titular_origen)
end if
ldt_fecha_traslado				= tab_1.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_traslado')
ll_hora_traslado				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'hora_traslado')
ll_minuto_traslado				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'minuto_traslado')
if isnull(ll_minuto_traslado) then 
	ll_minuto_traslado = 0
	tab_1.tabpage_1.dw_ficha.setitem(1,'minuto_traslado',ll_minuto_traslado)
	tab_1.tabpage_1.dw_ficha.accepttext()
end if
ll_folio_crematorio				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
ll_funeraria						= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'cod_funeraria')
ls_observacion					= tab_1.tabpage_1.dw_ficha.getitemstring(1,'observacion')
if isnull(ls_tipo_traslado) then
	messagebox("Advertencia","Debe Ingresar Tipo Traslado")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('tipo_traslado')
elseif isnull(ll_rut_titular_origen) then
	messagebox("Advertencia","Debe Ingresar Rut Titular Origen")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('rut_titular_origen')
elseif isnull(ll_rut_titular_destino) then
	messagebox("Advertencia","Debe Ingresar Rut Titular Destino")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('rut_titular_destino')
elseif isnull(ldt_fecha_traslado) then
	messagebox("Advertencia","Debe Ingresar Fecha Traslado")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('fecha_traslado')
elseif isnull(ll_hora_traslado) then
	messagebox("Advertencia","Debe Ingresar Hora Traslado")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('hora_traslado')
elseif isnull(ll_minuto_traslado) then
	messagebox("Advertencia","Debe Ingresar Minuto Traslado")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('minuto_traslado')
elseif isnull(ll_folio_crematorio) then
	messagebox("Advertencia","Debe Ingresar Folio Crematorio")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('folio_crematorio')
elseif isnull(ll_funeraria) then
	messagebox("Advertencia","Debe Ingresar Funeraria")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('cod_funeraria')
elseif isnull(ls_observacion) then
	messagebox("Advertencia","Debe Ingresar Observación")
	tab_1.SelectedTab			= 1
	tab_1.tabpage_1.dw_ficha.setfocus() 
	tab_1.tabpage_1.dw_ficha.setcolumn('observacion')

elseif isnull(ll_rut_fallecido) then
	messagebox("Advertencia","Debe Ingresar Rut Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('rut_fallecido')
elseif isnull(ls_dv_fallecido) then
	messagebox("Advertencia","Debe Ingresar Digito verificador Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('dv_fallecido')
elseif isnull(ls_nombre_fallecido) then
	messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('nombre_fallecido')
elseif isnull(ls_ap_paterno_fallecido) then
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('ap_paterno_fallecido')
elseif isnull(ls_ap_materno_fallecido) then
	messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('ap_materno_fallecido')
elseif isnull(ls_tipo_via_fallecido) then
	messagebox("Advertencia","Debe Ingresar Tipo Via Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('tipo_via_fallecido')
elseif isnull(ls_direccion_fallecido) then
	messagebox("Advertencia","Debe Ingresar Dirección Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('direccion_fallecido')
elseif isnull(ls_nro_direc_fallecido) then
	messagebox("Advertencia","Debe Ingresar N° Dirección Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('nro_direc_fallecido')
elseif isnull(ls_dpto_direc_fallecido) then
	messagebox("Advertencia","Debe Ingresar Depto.Dirección Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('dpto_direc_fallecido')
elseif isnull(ls_block_direc_fallecido) then
	messagebox("Advertencia","Debe Ingresar Block Dirección Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('block_direc_fallecido')
elseif isnull(ls_ciudad_fallecido) then
	messagebox("Advertencia","Debe Ingresar Ciudad Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('ciudad_fallecido')
elseif isnull(ls_comuna_fallecido) then
	messagebox("Advertencia","Debe Ingresar Comuna Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('comuna_fallecido')
elseif isnull(ls_estado_civil_fallecido) then
	messagebox("Advertencia","Debe Ingresar Estado Civil Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('estado_civil_fallecido')
elseif isnull(ldt_fecha_nacimiento) then
	messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('fecha_nacimiento')
elseif isnull(ldt_fecha_defuncion) then
	messagebox("Advertencia","Debe Ingresar Fecha Defunción")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
elseif isnull(ll_hora_defuncion) then
	messagebox("Advertencia","Debe Ingresar Hora Defunción")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('hora_defuncion')
elseif isnull(ll_minuto_defuncion) then
	messagebox("Advertencia","Debe Ingresar Minuto Defunción")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('minuto_defuncion')
elseif isnull(ls_cod_estado_cuerpo) then
	messagebox("Advertencia","Debe Ingresar Estado Cuerpo Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('cod_estado_cuerpo')
elseif isnull(ls_tamano_cuerpo) then
	messagebox("Advertencia","Debe Ingresar Tamaño Cuerpo Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('tamano_cuerpo')
elseif isnull(ls_sexo) then
	messagebox("Advertencia","Debe Ingresar Sexo Fallecido")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('sexo')
elseif isnull(ls_causa_fallecimiento) then
	messagebox("Advertencia","Debe Ingresar Causa Fallecimiento")
	tab_1.SelectedTab			= 2
	tab_1.tabpage_2.dw_fallecido.setfocus() 
	tab_1.tabpage_2.dw_fallecido.setcolumn('causa_fallecimiento')
else
	tab_1.tabpage_1.dw_ficha.setitem(1,'rut_fallecido',ll_rut_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'dv_fallecido',ls_dv_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'nombre_fallecido',ls_nombre_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'ap_paterno_fallecido',ls_ap_paterno_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'ap_materno_fallecido',ls_ap_materno_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'tipo_via_fallecido',ls_tipo_via_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'direccion_fallecido',ls_direccion_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'nro_direc_fallecido',ls_nro_direc_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'dpto_direc_fallecido',ls_dpto_direc_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'block_direc_fallecido',ls_block_direc_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'ciudad_fallecido',ls_ciudad_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'comuna_fallecido',ls_comuna_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'estado_civil_fallecido',ls_estado_civil_fallecido)
	tab_1.tabpage_1.dw_ficha.setitem(1,'fecha_nacimiento',ldt_fecha_nacimiento)
	tab_1.tabpage_1.dw_ficha.setitem(1,'fecha_defuncion',ldt_fecha_defuncion)
	tab_1.tabpage_1.dw_ficha.setitem(1,'hora_defuncion',ll_hora_defuncion)
	tab_1.tabpage_1.dw_ficha.setitem(1,'minuto_defuncion',ll_minuto_defuncion)
	tab_1.tabpage_1.dw_ficha.setitem(1,'cod_estado_cuerpo',ls_cod_estado_cuerpo)
	tab_1.tabpage_1.dw_ficha.setitem(1,'tamano_cuerpo',ls_tamano_cuerpo)
	tab_1.tabpage_1.dw_ficha.setitem(1,'sexo',ls_sexo)
	tab_1.tabpage_1.dw_ficha.setitem(1,'causa_fallecimiento',ls_causa_fallecimiento)
	ll_consulta_folio		= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'folio_traslado')
	ll_folio_contrato_f		= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'numero_funeraria')
	ll_cod_parque			= 142		//130
	ls_base_f				= 'F'
	ls_serie_f				= 'F'
	if isnull(ll_consulta_folio) or ll_consulta_folio=0 then
		SELECT 	MAX("FC_FICHA_TRASLADO"."FOLIO_TRASLADO")  
		INTO 		:ll_max_folio  
		FROM 	"FC_FICHA_TRASLADO"  ;
		if isnull(ll_max_folio) then ll_max_folio=0
		ll_max_folio ++
		tab_1.tabpage_1.dw_ficha.setitem(1,'folio_traslado',ll_max_folio)
		tab_1.tabpage_2.dw_fallecido.setitem(1,'folio_traslado',ll_max_folio)
	end if
	if ll_folio_contrato_f=0 or isnull(ll_folio_contrato_f) then
		SELECT	MIN("CD_FOLIO"."NUMERO")
		INTO 		:ll_numero_f
		FROM 	"CD_FOLIO"
		WHERE 	"CD_FOLIO"."BASE" = 'F' AND	"CD_FOLIO"."SERIE" = 'F' AND
				  ( "CD_FOLIO"."ULT_ESTADO" = 2 OR "CD_FOLIO"."ULT_ESTADO" = 3 OR "CD_FOLIO"."ULT_ESTADO" = 14)
		USING sqlca;
		if isnull(ll_numero_f) then ll_numero_f = 0
		//debe existir proceso automatico para asignar - falta validar
		tab_1.tabpage_1.dw_ficha.setitem(1,'base_funeraria',ls_base_f)
		tab_1.tabpage_1.dw_ficha.setitem(1,'serie_funeraria',ls_serie_f)
		tab_1.tabpage_1.dw_ficha.setitem(1,'numero_funeraria',ll_numero_f)
		tab_1.tabpage_1.dw_ficha.setitem(1,'rut_titular_funeraria',ll_rut_cli)
		
		ls_cod_otro			= '91'
		SELECT DISTINCT "PRODUCTO_LISTA_PRECIO"."VALOR", 	"PRODUCTO_LISTA_PRECIO"."MONEDA"
		INTO            		:ll_monto_uf,                  					:ls_moneda
		FROM      "PRODUCTO_LISTA_PRECIO", "PRODUCTO_TIPO_SERVICIO"
		WHERE   ( "PRODUCTO_LISTA_PRECIO"."CODIGO_SERVICIO" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and
				    ( "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO" = :ls_cod_otro ) ;
				  
		SELECT 	"PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO"  
		INTO 		:ll_cod_servicio  
		FROM 	"PRODUCTO_TIPO_SERVICIO"  
//		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque ) AND  
		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = 142 ) AND  //130
					( "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO" = :ls_cod_otro )  
		USING	sqlca;
		
		SELECT 	Count("CADENA"."CODIGO")  
		INTO 		:ll_count  
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :ls_base_f ) AND  
					( "CADENA"."SERIE" = :ls_serie_f ) AND  
					( "CADENA"."NUMERO" = :ll_numero_f )   ;

		
		if ll_count = 0 then
			SELECT 	Count("CD_FOLIO"."BASE")  
			INTO 		:ll_count_cd  
			FROM 	"CD_FOLIO"  
			WHERE 	( "CD_FOLIO"."BASE" = :ls_base_f ) AND  
						( "CD_FOLIO"."SERIE" = :ls_serie_f ) AND  
						( "CD_FOLIO"."NUMERO" = :ll_numero_f )   ;
			if ll_count_cd > 0 then
				DECLARE sp_crear_funeraria PROCEDURE FOR F_CREA_CTTO_NUEVOS (:ls_base_f, :ls_serie_f, :ll_numero_f, :ll_rut_cli, :ll_monto_uf, 1, :ls_moneda, :ldt_fecha_pago, :ldt_fecha_pago, 0.0001, 1, :ll_cod_servicio, :ll_cod_parque, :gs_user, :ls_base_ori, :ls_serie_ori, :ll_numero_ori, :gdt_fec_sistema );
				EXECUTE sp_crear_funeraria;
				if sqlca.sqlcode=0 then
					fetch sp_crear_funeraria into :ll_return;
					close sp_crear_funeraria;						
				end if
			else
				messagebox("Advertencia","Folio Contrato Funerario, NO Existe en Control Documentario es Obligatorio Asignar Contratos")	//Generar N° "+ls_base_f+'-'+ls_serie_f+'-'+string(ll_numero_f,'###,###,###,###'))
				ll_numero_f		= 0	
			end if
		end if
		
	end if
	tab_1.tabpage_1.dw_ficha.accepttext()
	tab_1.tabpage_2.dw_fallecido.accepttext()
	if tab_1.tabpage_1.dw_ficha.update()=1 then
		commit;
		
		if isvalid(w_ficha_crematorio)  then 	// ll_numero_f > 0 then
			ldt_fecha_crem_ori			= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
			if ldt_fecha_crem_ori <> ldt_fecha_traslado and not isnull(ldt_fecha_crem_ori) then 	messagebox("Advertencia","Se Actualizará Fecha Ingreso Parque")
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_cineracion',ldt_fecha_traslado)
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_cineracion', ll_hora_traslado)
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_cineracion', ll_minuto_traslado)
			w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.accepttext()
			UPDATE 	"FC_CABECERA"  
			SET 		"FECHA_CINERACION" = :ldt_fecha_traslado,   
						"HORA_CINERACION" = :ll_hora_traslado,   
						"MINUTO_CINERACION" = :ll_minuto_traslado  
			WHERE 	"FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio_crematorio  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
//				Mirko comentar 27/06/2022
/*				if isnull(ldt_fecha_crem_ori) then
					ll_folio_traslado				= ll_max_folio
					ll_cod_parque_origen			= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_origen')
					ls_destino_cuerpo				= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'destino_cuerpo')
					ls_tipo_venta_cineracion		= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'forma_venta')
					ls_tipo_contrato_cineracion	= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'origen_contrato')
					ll_covid_19						= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'sw_covid_19')
					ll_protocolo_covid				= w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'sw_protocolo_covid')
					ll_edad							= w_ficha_crematorio.tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'edad_numero')
					ll_annos_difunto				= w_ficha_crematorio.tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'annos_difunto')
					ls_enfermedad_obligatoria	= w_ficha_crematorio.tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'enfermedad_obligatoria')
					ll_cod_religion					= w_ficha_crematorio.tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
					ll_sw_orador					= w_ficha_crematorio.tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'sw_orador')
					ll_cod_funeraria				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'cod_funeraria')
					ls_dv_titular_origen			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'dv_titular_origen')
					ls_nombre_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'nombre_titular_origen')
					ls_ap_pat_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'ap_pat_titular_origen')
					ls_ap_mat_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'ap_mat_titular_origen')
					ll_parque_destino				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'parque_destino')
					
					ls_sector_origen				= tab_1.tabpage_1.dw_ficha.getitemstring(1,'sector_origen')
					ls_sepultura_origen			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'sepultura_origen')
					ls_base_origen					= tab_1.tabpage_1.dw_ficha.getitemstring(1,'base_origen')
					ls_serie_origen					= tab_1.tabpage_1.dw_ficha.getitemstring(1,'serie_origen')
					ll_numero_origen				= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'numero_origen')
					ls_nivel_oigen					= tab_1.tabpage_1.dw_ficha.getitemstring(1,'nivel_origen')
					ls_estado_contrato_origen	= tab_1.tabpage_1.dw_ficha.getitemstring(1,'estado_contrato_origen')
					ls_estado_titular_origen		= tab_1.tabpage_1.dw_ficha.getitemstring(1,'estado_titular_origen')
					ls_base_crematorio			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'base_crematorio')
					ls_serie_crematorio			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'serie_crematorio')
					ll_numero_crematorio		= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'numero_crematorio')
					ll_estado_gestion_crematorio	= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'estado_gestion_crematorio')
					ls_estado_reg					= 'P'
					ls_dv_titular_destino			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'dv_titular_destino')
					ls_tipo_origen_crematorio	= tab_1.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen_crematorio')
					ls_base_funeraria				= tab_1.tabpage_1.dw_ficha.getitemstring(1,'base_funeraria')
					ls_serie_funeraria				= tab_1.tabpage_1.dw_ficha.getitemstring(1,'serie_funeraria')
					ll_numero_funeraria			= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'numero_funeraria')
					ll_rut_titular_funeraria		= tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_funeraria')

					ls_observacion					= ls_observacion + '  HORA INGRESO A PARQUE '+string((ll_hora_traslado + ll_suma_hora),'00') + ':'+string(ll_minuto_traslado,'00')

					INSERT INTO 	"FC_AGENDA_CAPILLA"  
									( "FOLIO_CREMATORIO",   	"FECHA_CREMACION",   	"HORA_CINERACION",   	"MINUTO_CINERACION",   	"RUT_TITULAR",   			"RUT_FALLECIDO",   	"NOMBRE_FALLECIDO",   	"AP_PATERNO_FALLECIDO",   	"AP_MATERNO_FALLECIDO",   	"FECHA_DEFUNCION",   	"ESTADO_GESTION",   				"EJECUTIVO",   	"OBSERVACION",   	"COD_PARQUE",   			"CODIGO_RELIGION",   	"SW_ORADOR",   	"SW_COVID",   	"SW_PROTOCOLO",   	"BASE",   					"SERIE",   						"NUMERO",   				"HORA_CINERACION_FIN",   	"MINUTO_CINERACION_FIN",   	"AGENDA_PERGOLA",   	"FECHA_PERGOLA",   	"HORA_INI_PERGOLA",   	"MINUTO_INI_PERGOLA",   	"HORA_FIN_PERGOLA",   	"MINUTO_FIN_PERGOLA",   	"AGENDA_CAPILLA",   	"FECHA_CAPILLA",   	"HORA_INI_CAPILLA",   	"MINUTO_INI_CAPILLA",   	"HORA_FIN_CAPILLA",   						"MINUTO_FIN_CAPILLA",   	"AGENDA_VISUALIZA",   	"FECHA_VISUALIZA",   	"HORA_INI_VISUALIZA",   	"MINUTO_INI_VISUALIZA",   	"HORA_FIN_VISUALIZA",   	"MINUTO_FIN_VISUALIZA",   	"AGENDA_EXTERNA",   	"ESTADO_REG",   	"FECHA_INACTIVA",   	"USUARIO_INACTIVA",   	"SW_INGRESO_PARQUE" )  
					VALUES		( :ll_folio_crematorio,			:ldt_fecha_traslado,		:ll_hora_traslado,   		:ll_minuto_traslado,			:ll_rut_titular_destino,	:ll_rut_fallecido	,		:ls_nombre_fallecido,   		:ls_ap_paterno_fallecido,   		:ls_ap_materno_fallecido,		:ldt_fecha_defuncion,		:ll_estado_gestion_crematorio,		:gs_user,			:ls_observacion,		:ll_parque_destino,		:ll_cod_religion,			:ll_sw_orador,		:ll_covid_19,		:ll_protocolo_covid,		:ls_base_crematorio,   	:ls_serie_crematorio,   		:ll_numero_crematorio,	:ll_hora_traslado,   				:ll_minuto_traslado,				'N',							null,						null,							null,								null,								null,								'S',							:ldt_fecha_traslado,	:ll_hora_traslado,   		:ll_minuto_traslado,			:ll_hora_traslado + :ll_suma_hora,		:ll_minuto_traslado,			'N',							null,							null,								null,									null,								null,									'N',							'P',						null,							null,							'S')
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if		

					
//					INSERT INTO 	  "FC_FICHA_TRASLADO"  
//										( "TIPO_TRASLADO",  	"FOLIO_TRASLADO",  	"FOLIO_CREMATORIO",   	"COD_PARQUE_ORIGEN",   	"DESTINO_CUERPO",   	"TIPO_VENTA_CINERACION",   	"TIPO_CONTRATO_CINERACION",   	"FECHA_TRASLADO",   	"HORA_TRASLADO",   	"MINUTO_TRASLADO",   	"RUT_FALLECIDO",   	"DV_FALLECIDO",   	"NOMBRE_FALLECIDO",   	"AP_PATERNO_FALLECIDO",   	"AP_MATERNO_FALLECIDO",   	"FECHA_NACIMIENTO",   	"EDAD",   	"SEXO",   	"FECHA_DEFUNCION",   	"HORA_DEFUNCION",   	"MINUTO_DEFUNCION",   	"ANNOS_DIFUNTO",   	"CAUSA_FALLECIMIENTO",   	"COD_ESTADO_CUERPO",   	"TAMANO_CUERPO",   	"ENFERMEDAD_OBLIGATORIA",   	"ESTADO_CIVIL_FALLECIDO",   	"TIPO_VIA_FALLECIDO",   	"DIRECCION_FALLECIDO",   	"NRO_DIREC_FALLECIDO",   	"DPTO_DIREC_FALLECIDO",   	"BLOCK_DIREC_FALLECIDO",   	"CIUDAD_FALLECIDO",   	"COMUNA_FALLECIDO",   	"COD_FUNERARIA",   	"OBSERVACION",   	"RUT_TITULAR_ORIGEN",   	"DV_TITULAR_ORIGEN",   	"NOMBRE_TITULAR_ORIGEN",   	"AP_PAT_TITULAR_ORIGEN",   	"AP_MAT_TITULAR_ORIGEN",   	"PARQUE_DESTINO",   	"SECTOR_ORIGEN",   	"SEPULTURA_ORIGEN",   	"BASE_ORIGEN",   	"SERIE_ORIGEN",   	"NUMERO_ORIGEN",   	"NIVEL_ORIGEN",   	"ESTADO_CONTRATO_ORIGEN",   	"ESTADO_TITULAR_ORIGEN",   	"BASE_CREMATORIO",   	"SERIE_CREMATORIO",   	"NUMERO_CREMATORIO",   	"ESTADO_GESTION_CREMATORIO",   	"ESTADO_REG",   	"USUARIO_CREA",   	"RUT_TITULAR_DESTINO",   	"DV_TITULAR_DESTINO",   	"TIPO_ORIGEN_CREMATORIO",   	"BASE_FUNERARIA",   	"SERIE_FUNERARIA",   	"NUMERO_FUNERARIA",   	"RUT_TITULAR_FUNERARIA" )  	
//					VALUES 			( :ls_tipo_traslado,   		:ll_folio_traslado,   		:ll_folio_crematorio,   		:ll_cod_parque_origen,   	:ls_destino_cuerpo,   		:ls_tipo_venta_cineracion,   		:ls_tipo_contrato_cineracion,   			:ldt_fecha_traslado,   	:ll_hora_traslado,   		:ll_minuto_traslado,   	:ll_rut_fallecido,   		:ls_dv_fallecido,   		:ls_nombre_fallecido,   		:ls_ap_paterno_fallecido,   		:ls_ap_materno_fallecido,   		:ldt_fecha_nacimiento,   		:ll_edad,   	:ls_sexo,   	:ldt_fecha_defuncion,   	:ll_hora_defuncion,   		:ll_minuto_defuncion,   		:ll_annos_difunto,   		:ls_causa_fallecimiento,   		:ls_cod_estado_cuerpo,   	:ls_tamano_cuerpo,   	:ls_enfermedad_obligatoria,   		:ls_estado_civil_fallecido,   			:ls_tipo_via_fallecido,   		:ls_direccion_fallecido,   		:ls_nro_direc_fallecido,   		:ls_dpto_direc_fallecido,   		:ls_block_direc_fallecido,   		:ls_ciudad_fallecido,   	:ls_comuna_fallecido,   		:ll_cod_funeraria,   	:ls_observacion,   		:ll_rut_titular_origen,   		:ls_dv_titular_origen,   		:ls_nombre_titular_origen,   		:ls_ap_pat_titular_origen,   		:ls_ap_mat_titular_origen,   		:ll_parque_destino,   		:ls_sector_origen,   	:ls_sepultura_origen,   		:ls_base_origen,   :ls_serie_origen,   		:ll_numero_origen,   		:ls_nivel_oigen,   		:ls_estado_contrato_origen,   			:ls_estado_titular_origen,   			:ls_base_crematorio,   	:ls_serie_crematorio,   		:ll_numero_crematorio,   		:ll_estado_gestion_crematorio,   			:ls_estado_reg,   	:gs_user,   				:ll_rut_titular_destino,   			:ls_dv_titular_destino,   		:ls_tipo_origen_crematorio,   		:ls_base_funeraria,   		:ls_serie_funeraria,   		:ll_numero_funeraria,   		:ll_rut_titular_funeraria )  
//					USING		sqlca;
//					if sqlca.sqlcode=0 then
//						commit;
//					else
//						rollback;
//					end if
				else
					SELECT 	Count("FC_AGENDA_CAPILLA"."NOMBRE_FALLECIDO"  )
					INTO 		:ll_count  
					FROM 	"FC_AGENDA_CAPILLA"  
					WHERE	( "FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :il_folio_fc ) AND  
								( "FC_AGENDA_CAPILLA"."SW_INGRESO_PARQUE" = 'S' )   ;
					if ll_count > 0 then
						ls_observacion					= ls_observacion + '  HORA INGRESO A PARQUE '+string((ll_hora_traslado + ll_suma_hora),'00') + ':'+string(ll_minuto_traslado,'00')
						UPDATE 	"FC_AGENDA_CAPILLA"  
						SET 		"FECHA_CREMACION" = :ldt_fecha_traslado,   
									"HORA_CINERACION" = :ll_hora_traslado,   	
									"MINUTO_CINERACION" = :ll_minuto_traslado ,
									"RUT_TITULAR" = :ll_rut_titular_destino,   			
									"RUT_FALLECIDO" = :ll_rut_fallecido,   	
									"NOMBRE_FALLECIDO" = :ls_nombre_fallecido,   	
									"AP_PATERNO_FALLECIDO" = :ls_ap_paterno_fallecido,   	
									"AP_MATERNO_FALLECIDO" = :ls_ap_materno_fallecido,   	
									"FECHA_DEFUNCION" = :ldt_fecha_defuncion,   	
									"ESTADO_GESTION" = :ll_estado_gestion_crematorio,   				
									"EJECUTIVO" = :gs_user,   	
									"OBSERVACION" = :ls_observacion,   	
									"COD_PARQUE" = :ll_parque_destino,   			
									"CODIGO_RELIGION" = :ll_cod_religion,   	
									"SW_ORADOR" = :ll_sw_orador,   	
									"SW_COVID" = :ll_covid_19,   	
									"SW_PROTOCOLO" = :ll_protocolo_covid,   	
									"BASE" = :ls_base_crematorio,   
									"SERIE" = :ls_serie_crematorio,   						
									"NUMERO" = :ll_numero_crematorio,   				
									"HORA_CINERACION_FIN" = :ll_hora_traslado,   	
									"MINUTO_CINERACION_FIN" = :ll_minuto_traslado,   
									"AGENDA_PERGOLA" = 'N',   	
									"FECHA_PERGOLA" = null,   	
									"HORA_INI_PERGOLA" = null,   	
									"MINUTO_INI_PERGOLA" = null,   	
									"HORA_FIN_PERGOLA" = null,   	
									"MINUTO_FIN_PERGOLA" = null,   	
									"AGENDA_CAPILLA" = 'S',   	
									"FECHA_CAPILLA" = :ldt_fecha_traslado,   	
									"HORA_INI_CAPILLA" = :ll_hora_traslado,   	
									"MINUTO_INI_CAPILLA" = :ll_minuto_traslado,   	
									"HORA_FIN_CAPILLA" = :ll_hora_traslado + :ll_suma_hora,   	
									"MINUTO_FIN_CAPILLA" = :ll_minuto_traslado,   	
									"AGENDA_VISUALIZA" = 'N',   	
									"FECHA_VISUALIZA" = null,   	
									"HORA_INI_VISUALIZA" = null,   	
									"MINUTO_INI_VISUALIZA" = null,   	
									"HORA_FIN_VISUALIZA" = null,   	
									"MINUTO_FIN_VISUALIZA" = null,   	
									"AGENDA_EXTERNA" = 'N',   	
									"ESTADO_REG" = 'P',   	
									"FECHA_INACTIVA" = null,   	
									"USUARIO_INACTIVA" = null,   	
									"SW_INGRESO_PARQUE" = 'S'
						WHERE 	"FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :il_folio_fc   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					else
						INSERT INTO 	"FC_AGENDA_CAPILLA"  
										( "FOLIO_CREMATORIO",   	"FECHA_CREMACION",   	"HORA_CINERACION",   	"MINUTO_CINERACION",   	"RUT_TITULAR",   			"RUT_FALLECIDO",   	"NOMBRE_FALLECIDO",   	"AP_PATERNO_FALLECIDO",   	"AP_MATERNO_FALLECIDO",   	"FECHA_DEFUNCION",   	"ESTADO_GESTION",   				"EJECUTIVO",   	"OBSERVACION",   	"COD_PARQUE",   			"CODIGO_RELIGION",   	"SW_ORADOR",   	"SW_COVID",   	"SW_PROTOCOLO",   	"BASE",   					"SERIE",   						"NUMERO",   				"HORA_CINERACION_FIN",   	"MINUTO_CINERACION_FIN",   	"AGENDA_PERGOLA",   	"FECHA_PERGOLA",   	"HORA_INI_PERGOLA",   	"MINUTO_INI_PERGOLA",   	"HORA_FIN_PERGOLA",   	"MINUTO_FIN_PERGOLA",   	"AGENDA_CAPILLA",   	"FECHA_CAPILLA",   	"HORA_INI_CAPILLA",   	"MINUTO_INI_CAPILLA",   	"HORA_FIN_CAPILLA",   						"MINUTO_FIN_CAPILLA",   	"AGENDA_VISUALIZA",   	"FECHA_VISUALIZA",   	"HORA_INI_VISUALIZA",   	"MINUTO_INI_VISUALIZA",   	"HORA_FIN_VISUALIZA",   	"MINUTO_FIN_VISUALIZA",   	"AGENDA_EXTERNA",   	"ESTADO_REG",   	"FECHA_INACTIVA",   	"USUARIO_INACTIVA",   	"SW_INGRESO_PARQUE" )  
						VALUES		( :ll_folio_crematorio,			:ldt_fecha_traslado,		:ll_hora_traslado,   		:ll_minuto_traslado,			:ll_rut_titular_destino,	:ll_rut_fallecido	,		:ls_nombre_fallecido,   		:ls_ap_paterno_fallecido,   		:ls_ap_materno_fallecido,		:ldt_fecha_defuncion,		:ll_estado_gestion_crematorio,		:gs_user,			:ls_observacion,		:ll_parque_destino,		:ll_cod_religion,			:ll_sw_orador,		:ll_covid_19,		:ll_protocolo_covid,		:ls_base_crematorio,   	:ls_serie_crematorio,   		:ll_numero_crematorio,	:ll_hora_traslado,   				:ll_minuto_traslado,				'N',							null,						null,							null,								null,								null,								'S',							:ldt_fecha_traslado,	:ll_hora_traslado,   		:ll_minuto_traslado,			:ll_hora_traslado + :ll_suma_hora,		:ll_minuto_traslado,			'N',							null,							null,								null,									null,								null,									'N',							'P',						null,							null,							'S')
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if

				end if
				
				*/
//				Fin Mirko
				SELECT 	COUNT("INGRESO"."TIPO_COB")  
				INTO 		:ll_count_tras  
				FROM 	"INGRESO"  
				WHERE 	( "INGRESO"."BASE" = :ls_base_ori ) AND  
							( "INGRESO"."SERIE" = :ls_serie_ori ) AND  
							( "INGRESO"."CONTRATO" = :ll_numero_ori ) AND  
							( "INGRESO"."COD_CAJA" = 'CC' ) AND  
							( "INGRESO"."PAGO_HIST" = 'A' ) AND  
							( "INGRESO"."TIPO_MOV" = 'L' ) AND  
							( "INGRESO"."CODIGO_OTRO" = '24' )   ;		//Descuento 124
				if ll_count_tras=0 or isnull(ll_count_tras) then ll_count_tras=0
				if ll_count_tras = 0 then
					ll_arancel_traslado_uf			= Double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'arancel_traslado')) 
					ll_arancel_traslado				= round(ll_arancel_traslado_uf * gd_uf_dia,0)
					SELECT	"MEMBRETE_EMPRESA"."STRING_RUT"
					INTO 		:ls_rut_empresa
					FROM 	"MEMBRETE_EMPRESA"  
					WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque_origen   ;
					
					SELECT	"ELECTRONICA_FB"."GRUPO"  
					INTO 		:ll_grupo  
					FROM 	"ELECTRONICA_FB"  
					WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = 'CI' ) AND  
							  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
							  ( "ELECTRONICA_FB"."ESTADO" = 'P' )   ;
										  
					SELECT	MIN("ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO") 
					INTO		:ll_folio_ci
					FROM 	"ELECTRONICA_FB",   
								"ELECTRONICA_FB_DETALLE"  
					WHERE ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" ) and  
							  ( "ELECTRONICA_FB"."GRUPO" = "ELECTRONICA_FB_DETALLE"."GRUPO" ) and  
							  ( "ELECTRONICA_FB"."ESTADO" = 'P' ) AND  
							  ( "ELECTRONICA_FB"."TIPO_DOCUMENTO" = 'CI' ) AND 
							  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = 'CC' )   AND
							  ( "ELECTRONICA_FB"."RUT_EMPRESA" = :ls_rut_empresa ) AND 
							  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' );
					if ll_folio_ci > 0 then
						UPDATE		"ELECTRONICA_FB_DETALLE"  
						SET 			"FECHA_PAGO" = :ldt_fecha_pago,   
										"RUT" = :gi_rut,   
										"ESTADO_REG" = 'G',   
										"DV" = :gs_dv,   
										"NOMBRE_CLIENTE" = :ls_nombre,   
										"USUARIO_CREA" = :gs_user,
										"BASE"  = :ls_base_ori,
										"SERIE" = :ls_serie_ori,
										"NUMERO" = :ll_numero_ori,
										"IP_EQUIPO" = '0',
										"MONTO_AFECTO" = 0,   
										"MONTO_EXENTO" = :ll_total,   
										"MONTO_IVA" = 0,   
										"MONTO_TOTAL" = :ll_total,   
										"TIPO_DTE" = '38' ,
										"ESTADO_DOCUMENTO" = '' ,
										"TASA_IVA" = 0
						WHERE 	  ( "ELECTRONICA_FB_DETALLE"."GRUPO" = :ll_grupo ) AND  
									  ( "ELECTRONICA_FB_DETALLE"."TIPO_DOCUMENTO" = :gs_tipo_cobro ) AND  
									  ( "ELECTRONICA_FB_DETALLE"."ESTADO_REG" = 'P' )   AND
									  ( "ELECTRONICA_FB_DETALLE"."COD_CAJA" = :gs_caja )   AND
									  ( "ELECTRONICA_FB_DETALLE"."NRO_DOCUMENTO" = :ll_folio_ci )
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							INSERT INTO "INGRESO"  
										( "FOLIO",  		"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",   	"MONTO",   				"CUOTAS_PAG",   	"SERIE",   		"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   		"RUT",   					"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   		"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   		"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   			"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO" )  
							VALUES 	( :ll_folio_ci,   	'CI',   				:ldt_fecha_pago,   'L',   				:ll_arancel_traslado,  0,   					:ls_serie_ori,	:ll_numero_ori,   	'CC',   			' ',   				:gd_uf_dia,   	'A',   					:ls_base_ori,   :ll_rut_titular_origen,  	:gs_user,   		null,   			null,   				null,   					null,   						null,   			null,   				null,   			:ldt_fecha_pago,   '24',   					null,   				null,   									:ll_parque_origen,  	0,   					99,   							0,   							'2',   					:ll_arancel_traslado_uf, 	'N',   					:ldt_fecha_pago,   		'0',   							'N' )  
							USING	sqlca;
							ll_arancel_traslado_d		= ((ll_arancel_traslado - 1 ) * -1)
							INSERT INTO "INGRESO"  
										( "FOLIO",  		"TIPO_COB",   	"FECHA_PAGO",   	"TIPO_MOV",   	"MONTO",   					"CUOTAS_PAG",   	"SERIE",   		"CONTRATO",   	"COD_CAJA",   	"REZAGO",   	"VALOR_UF",   	"PAGO_HIST",   	"BASE",   		"RUT",   					"USUARIO",   	"COD_AGE",   	"FECHA_VENC",   	"PAGO_EXTERNO",   	"LUGAR_EXTERNO",   	"VIENE_DE",   	"FECHA_ANT",   	"FCHA_ANT",   	"SERVIPAG",   		"CODIGO_OTRO",   	"TRASPASO_E",   	"FECHA_TRASPASO_REZAGO",   	"COD_PARQUE",   		"ESTADO_SAP",   	"ESTADO_PAGO_SAP",   	"CTAS_PAG_CTTO",   	"MONEDA_SAP",   	"MONTO_UF",   			"REZAGO_SAP",   	"FECHA_DEPOSITO",   	"CONVENIO_BANCO",   	"REINGRESO" )  
							VALUES 	( :ll_folio_ci,   	'CI',   				:ldt_fecha_pago,   'S',   				:ll_arancel_traslado_d,  0,   					:ls_serie_ori,	:ll_numero_ori,   	'CC',   			' ',   				:gd_uf_dia,   	'A',   					:ls_base_ori,   :ll_rut_titular_origen,  	:gs_user,   		null,   			null,   				null,   					null,   						null,   			null,   				null,   			:ldt_fecha_pago,   '124',   					null,   				null,   									:ll_parque_origen,  	0,   					99,   							0,   							'1',   					:ll_arancel_traslado_d, 	'N',   					:ldt_fecha_pago,   		'0',   							'N' )  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								commit;
								ls_hora							= string(gdt_fec_sistema,"hh:mm")
								ll_hora_pago					= long(mid(ls_hora,1,2))
								ll_minuto_pago					= long(mid(ls_hora,4,2))
								INSERT INTO	"DOCUMENTOS"  
											 ( "FOLIO"  , 	"TIPO_COB"    , "N_CHEQUE" , 	"COD_BANCO", 	"MONTO"  ,	"FECHA_VENC", 	"COD_PAGO", 	"NUM_CHEQUES", 	"REZAGO" , 	"FECHA_PAGO", 	"COD_CAJA",	"DOCUMENTOS"."ESTADO_CH",   	"DOCUMENTOS"."GLOSA_CH",   	"DOCUMENTOS"."FECHA_ESTADO_CH",		"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",	"COD_BANCO_DEBITO", 	"TRASPADO_PAGO",	"TIPO_PAGO_TARJETA_CREDITO",	"HORA_PAGO",		"MINUTO_PAGO",	"TARJETA_EMPRESA",	"TIPO_COB_AUX",		"FECHA_DEPOSITO",	"MONTO_UF",	"REINGRESO"	)  
								VALUES 	 ( :ll_folio_ci, 	'CI',				999, 				999 , 					1, 				:ldt_fecha_pago, 	'EF', 				999 , 					' ', 			:ldt_fecha_pago, 	'CC',				'C',										Null,										Null,													0,										0,									'0',											0,										0,									'0',											0,								Null,						1,												:ll_hora_pago,		:ll_minuto_pago,	Null,							'BE',						:ldt_fecha_pago,		1,					'N')
								USING		sqlca ;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							else
								rollback;
							end if
						else
							rollback;
							messagebox("Error al Grabar CI","Error al Grabar CI - SQL Tabla ELECTRONICA_FB_DETALLE "+sqlca.sqlerrtext)
						end if
					end if
				
				end if	
				
			else
				rollback;
			end if
			
		end if
		messagebox("Grabar","Grabación Exitosa")
		il_grabar	= 0
		if ll_numero_ori > 0 then
			Close(w_fc_ficha_traslado)
		else
			cb_limpiar.triggerevent(clicked!)
		end if
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type tab_1 from tab within w_fc_ficha_traslado_bkp
integer x = 32
integer y = 200
integer width = 3470
integer height = 1684
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3433
integer height = 1564
long backcolor = 67108864
string text = "Ficha Traslado"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_2 st_2
ddplb_contratos ddplb_contratos
dw_ficha dw_ficha
end type

on tabpage_1.create
this.st_2=create st_2
this.ddplb_contratos=create ddplb_contratos
this.dw_ficha=create dw_ficha
this.Control[]={this.st_2,&
this.ddplb_contratos,&
this.dw_ficha}
end on

on tabpage_1.destroy
destroy(this.st_2)
destroy(this.ddplb_contratos)
destroy(this.dw_ficha)
end on

type st_2 from statictext within tabpage_1
boolean visible = false
integer x = 41
integer y = 76
integer width = 562
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Copiar Rut Titular Origen"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type ddplb_contratos from dropdownpicturelistbox within tabpage_1
boolean visible = false
integer x = 1723
integer y = 292
integer width = 530
integer height = 376
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
boolean enabled = false
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
end type

event selectionchanged;String		ls_nom_cliente,ls_ap_pat_cliente,ls_ap_mat_cliente,ls_tipo_via,ls_direc,ls_nro_part,ls_depto_part,ls_block_part,ls_ciudad,ls_comuna,ls_estado_civil,ls_sexo,&
			ls_estado_titular,ls_string,ls_base,ls_serie,ls_estado,ls_sector,ls_area,ls_sepultura
Datetime	ldt_fec_nac_cliente
Long		ll_largo,ll_cod_parque,ll_mora_cred,ll_mora_mant
Double	ll_numero,ll_rut

ls_string					= trim(ddplb_contratos.text)
if not isnull(ls_string) then
	if mid(ls_string,1,1) = '[' then
		ll_largo			= len(ls_string)
		ls_string			= mid(ls_string,1,(ll_largo - 2))
		ls_string			= mid(ls_string,3)
		ls_base			= mid(ls_string,1,1)
		ls_serie			= mid(ls_string,3,1)
		ll_numero		= Double(mid(ls_string,5))
	else
		ls_base			= mid(ls_string,1,1)
		ls_serie			= mid(ls_string,3,1)
		ll_numero		= Double(mid(ls_string,5))
	end if
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
		idw_detalle.retrieve(ls_base)
		SELECT		"CADENA"."ESTADO" ,
						"CADENA"."RUT",
						"CADENA"."COD_PARQUE",
						"CADENA_MORA"."MORA_CRED",
						"CADENA_MORA"."MORA_MANT",
						"CLIENTE"."NOMBRE",
						"CLIENTE"."A_PATERNO",
						"CLIENTE"."A_MATERNO",
						"CLIENTE"."TIPO_VIA",
						"CLIENTE"."DIRECCION_P",
						"CLIENTE"."NUMERO_PARTICULAR",
						"CLIENTE"."DEPTO_PARTICULAR",
						"CLIENTE"."BLOCK_PARTICULAR",
						"CLIENTE"."CIUDAD",
						"CLIENTE"."COMUNA",
						"CLIENTE"."FECHA_NAC",
						"CLIENTE"."ESTA_CIVIL",
						"CLIENTE"."SEXO",
						"CLIENTE"."ESTADO_TITULAR"
		INTO 			:ls_estado,
						:ll_rut,
						:ll_cod_parque,
						:ll_mora_cred,
						:ll_mora_mant,
						:ls_nom_cliente,
						:ls_ap_pat_cliente,
						:ls_ap_mat_cliente,
						:ls_tipo_via,
						:ls_direc,
						:ls_nro_part,
						:ls_depto_part,
						:ls_block_part,
						:ls_ciudad,
						:ls_comuna,
						:ldt_fec_nac_cliente,
						:ls_estado_civil,
						:ls_sexo,
						:ls_estado_titular
		FROM 		"CADENA",
						"CADENA_MORA",
						"CLIENTE"
		WHERE 	  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND
					  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) AND  
					  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
					  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )  AND
					  ( "CADENA"."CODIGO" = :ls_base ) AND  
					  ( "CADENA"."SERIE" = :ls_serie ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero )  
		USING		sqlca;
		if sqlca.sqlcode= 0 then
			if ls_base='O' then
				SELECT	"PAGO_OFERTA"."SECTOR",
							"PAGO_OFERTA"."AREA",
							"PAGO_OFERTA"."SEPULTURA"
				INTO 		:ls_sector,
							:ls_area,
							:ls_sepultura
				FROM 	"OFERTA_V",   
							"PAGO_OFERTA",   
							"CADENA"  
				WHERE ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
						  ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
						  ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
						  ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
						  ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
						  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero ) )   
				USING	sqlca;

			elseif ls_base='C' then
				SELECT	"CONTRATO"."SECTOR",
							"CONTRATO"."ZONA",
							"CONTRATO"."SEPULTURA"
				INTO 		:ls_sector,
							:ls_area,
							:ls_sepultura
				FROM 	"CADENA",   
							"CONTRATO"  
				WHERE ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
						  ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
						  ( ( "CADENA"."CODIGO" = :ls_base ) AND  
						  ( "CADENA"."SERIE" = :ls_serie ) AND  
						  ( "CADENA"."NUMERO" = :ll_numero ) ) 
				USING	sqlca;
			end if
			tab_1.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base)
			tab_1.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie)
			tab_1.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero)
			tab_1.tabpage_1.dw_ficha.setitem(1,'nombre_titular_origen',ls_nom_cliente)
			tab_1.tabpage_1.dw_ficha.setitem(1,'ap_pat_titular_origen',ls_ap_pat_cliente)
			tab_1.tabpage_1.dw_ficha.setitem(1,'ap_mat_titular_origen',ls_ap_mat_cliente)
			tab_1.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque)
			tab_1.tabpage_1.dw_ficha.setitem(1,'estado_titular_origen',ls_estado_titular)
			tab_1.tabpage_1.dw_ficha.setitem(1,'sector_origen',ls_sector)
			tab_1.tabpage_1.dw_ficha.setitem(1,'sepultura_origen',ls_sepultura)
			tab_1.tabpage_1.dw_ficha.setitem(1,'nivel_origen','0')
			tab_1.tabpage_1.dw_ficha.setitem(1,'estado_contrato_origen',ls_estado)
			tab_1.tabpage_1.dw_ficha.accepttext()
		end if
	else
		idw_detalle2.reset()
		idw_detalle2.insertrow(0)
	end if

end if
end event

type dw_ficha from datawindow within tabpage_1
event ue_mousemove pbm_dwnmousemove
integer x = 32
integer y = 28
integer width = 3387
integer height = 1488
integer taborder = 10
string title = "none"
string dataobject = "dw_fc_ingreso_ficha_traslado"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;string	ls_columna
ls_columna				= dwo.name
if ls_columna='t_4' then
	st_2.visible			= true
else
	st_2.visible			= false
end if
end event

event itemchanged;String		ls_columna,ls_dv,ls_nulo,ls_nombre,ls_base,ls_serie,ls_estado,ls_string,ls_dv_crema
Double	ll_rut,ll_numero,ll_rut_crema,ll_rut_titular
Long		ll_nulo,ll_folio
datetime	ldt_fecha_traslado,ldt_fec_nac,ldt_fec_def,ldt_nulo

Setnull(ldt_nulo)
tab_1.tabpage_1.dw_ficha.AcceptText ()
il_grabar++
SetNull(ls_dv);Setnull(ll_nulo)
ls_columna		= dwo.name
if ls_columna='rut_titular_origen' or ls_columna='dv_titular_origen' then
	ll_rut			= double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_origen'))
	ls_dv			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'dv_titular_origen')
	if ll_rut > 0 and not isnull(ls_dv) then
		if f_valida_rut(string(ll_rut)) <> ls_dv then
			messagebox("Advertencia","Rut Inválido Titular Origen")
			tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_origen',ls_nulo)
		else
			ddplb_contratos.reset()
			tab_1.tabpage_1.ddplb_contratos.enabled	= true
			SELECT 		"CLIENTE"."NOMBRE"
			INTO 			:ls_nombre  
			FROM 		"CLIENTE"  
			WHERE 		"CLIENTE"."RUT" = :ll_rut  
			USING		sqlca;
			if sqlca.sqlcode <> 0 then
				messagebox("Advertencia","Rut Cliente Inexistente")
				tab_1.tabpage_1.dw_ficha.setitem(1,'rut_titular_origen',ll_nulo)
				tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_origen',ls_nulo)
				tab_1.tabpage_1.dw_ficha.accepttext()
			else
				DECLARE x1 CURSOR FOR  
				SELECT		"CADENA"."CODIGO",   
								"CADENA"."SERIE",   
								"CADENA"."NUMERO",
								"CADENA"."ESTADO"
				FROM 		"CADENA"  
				WHERE 		"CADENA"."RUT" = :ll_rut  
				ORDER BY	"CADENA"."NUMERO" ASC
				USING	sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						fetch x1 into :ls_base, :ls_serie, :ll_numero, :ls_estado;
						if not isnull(ll_numero) then
							if ls_estado='V' or ls_estado='C' then
								ls_string		= ls_base+'-'+ls_serie+'-'+string(ll_numero)
							else
								ls_string		= '[ '+ls_base+'-'+ls_serie+'-'+string(ll_numero)+' ]'
							end if
							ddplb_contratos.additem(ls_string)
						end if
						Setnull(ll_numero)
					loop
				end if
				close x1;
				ddplb_contratos.setfocus()
			end if
		end if
	end if
elseif ls_columna='rut_titular_destino' or ls_columna='dv_titular_destino' then
	ll_rut_crema	= double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_destino'))
	ls_dv_crema	= tab_1.tabpage_1.dw_ficha.getitemstring(1,'dv_titular_destino')
	if ll_rut_crema > 0 and not isnull(ls_dv_crema) then
		if f_valida_rut(string(ll_rut_crema)) <> ls_dv_crema then
			messagebox("Advertencia","Rut Inválido Destino")
			tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_destino',ls_nulo)
		else
			idw_detalle4.retrieve(ll_rut_crema)
		end if
	end if
elseif ls_columna='folio_crematorio' then
	ll_folio		= Long(data)
	
elseif ls_columna='fecha_traslado' then
	ldt_fecha_traslado	= this.getitemdatetime(1,'fecha_traslado')
	ll_rut_titular      	= Double(this.getitemnumber(1,'rut_titular_origen'))
	ldt_fec_nac			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
	ldt_fec_def			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
	if not isnull(ll_rut_titular) and ll_rut_titular > 0 then
		if ldt_fecha_traslado < ldt_fec_def and not isnull(ldt_fecha_traslado) and not isnull(ldt_fec_def) then
			messagebox("dvertencia","Fecha de Traslado NO puede ser Menor a Fecha Defunción o Fecha Inválida")
			this.setitem(1,'fecha_traslado',ldt_nulo)
		elseif not isnull(ldt_fecha_traslado) and not isnull(ldt_fec_def) and ldt_fecha_traslado < gdt_fec_sistema then
			messagebox("dvertencia","Fecha de Traslado Inválida")
			this.setitem(1,'fecha_traslado',ldt_nulo)
		end if
	end if
end if
tab_1.tabpage_1.dw_ficha.AcceptText ()
end event

event itemfocuschanged;Double		ll_rut_crema,ll_rut_titular
String			ls_dv,ls_nulo,ls_dv_crema
datetime		ldt_fecha_traslado,ldt_fec_nac,ldt_fec_def,ldt_nulo

SetNull(ls_nulo);Setnull(ldt_nulo)
ll_rut_titular      	= Double(this.getitemnumber(1,'rut_titular_origen'))
if ll_rut_titular > 0 then
//	ll_rut			= double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_origen'))
	ls_dv			= tab_1.tabpage_1.dw_ficha.getitemstring(1,'dv_titular_origen')
	if ll_rut_titular > 0 and not isnull(ls_dv) then
		if f_valida_rut(string(ll_rut_titular)) <> ls_dv then
	//		messagebox("Advertencia","Rut Inválido")
			tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_origen',ls_nulo)
			tab_1.tabpage_1.dw_ficha.setfocus()
			tab_1.tabpage_1.dw_ficha.setcolumn('dv_titular_origen')
		end if
	end if
	ll_rut_crema	= double(tab_1.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular_destino'))
	ls_dv_crema	= tab_1.tabpage_1.dw_ficha.getitemstring(1,'dv_titular_destino')
	if ll_rut_crema > 0 and not isnull(ls_dv_crema) then
		if f_valida_rut(string(ll_rut_crema)) <> ls_dv_crema then
	//		messagebox("Advertencia","Rut Inválido Destino")
			tab_1.tabpage_1.dw_ficha.setitem(1,'dv_titular_destino',ls_nulo)
			tab_1.tabpage_1.dw_ficha.setfocus()
			tab_1.tabpage_1.dw_ficha.setcolumn('dv_titular_destino')
		end if
	end if
	ldt_fecha_traslado	= this.getitemdatetime(1,'fecha_traslado')
	ldt_fec_nac			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
	ldt_fec_def			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
	if not isnull(ll_rut_titular) and ll_rut_titular > 0 then
		if ldt_fecha_traslado < ldt_fec_def and not isnull(ldt_fecha_traslado) and not isnull(ldt_fec_def) then	//
	//		messagebox("dvertencia","Fecha de Traslado NO puede ser Mayor a Fecha Defunción o Fecha Inválida")
			this.setitem(1,'fecha_traslado',ldt_nulo)
//		elseif not isnull(ldt_fecha_traslado) and not isnull(ldt_fec_def) then	//
//	//		messagebox("dvertencia","Fecha de Traslado NO puede ser Mayor a Fecha Defunción o Fecha Inválida")
//			this.setitem(1,'fecha_traslado',ldt_nulo)
		end if
	end if
end if
tab_1.tabpage_1.dw_ficha.accepttext()
end event

event clicked;String			ls_columna,ls_dv,ls_fecha
Double		ll_rut,ll_rut_titular
datetime		ldt_fecha_traslado,ldt_fec_nac,ldt_fec_def,ldt_nulo

Setnull(ldt_nulo)
ls_columna		= dwo.name
if ls_columna='t_4' then
	ll_rut			= this.getitemnumber(1,'rut_titular_origen')
	ls_dv			= this.getitemstring(1,'dv_titular_origen')
	if ll_rut > 0 and not isnull(ls_dv) then
		this.setitem(1,'rut_titular_destino',ll_rut)
		this.setitem(1,'dv_titular_destino',ls_dv)
		this.accepttext()
		idw_detalle4.retrieve(ll_rut)
	end if
elseif ls_columna='p_1' then
	ldt_fecha_traslado	=  this.getitemdatetime(1,'fecha_traslado')
	ll_rut_titular      	= this.getitemnumber(1,'rut_titular_origen')
	ldt_fec_nac			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
	ldt_fec_def			= tab_1.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
	if not isnull(ll_rut_titular) and ll_rut_titular > 0 then
		ls_fecha			= string(date(this.getitemdatetime(this.getrow(),'fecha_traslado')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			this.setitem(this.getrow(),'fecha_traslado',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			if ldt_fecha_traslado > ldt_fec_def and not isnull(ldt_fecha_traslado) and not isnull(ldt_fec_def) and ldt_fecha_traslado > gdt_fec_sistema then
				messagebox("dvertencia","Fecha de Traslado NO puede ser Mayor a Fecha Defunción o Fecha Inválida")
				this.setitem(1,'fecha_traslado',ldt_nulo)
			else
				ls_fecha		= trim(Message.StringParm)
				ldt_fec_nac	= datetime(date(ls_fecha),time('00:00:00'))
				this.setitem(this.getrow(),'fecha_traslado',date(ls_fecha))
	
			end if
		END IF
	end if
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 3433
integer height = 1564
long backcolor = 67108864
string text = "Antecedentes Fallecido"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_fallecido dw_fallecido
end type

on tabpage_2.create
this.dw_fallecido=create dw_fallecido
this.Control[]={this.dw_fallecido}
end on

on tabpage_2.destroy
destroy(this.dw_fallecido)
end on

type dw_fallecido from datawindow within tabpage_2
integer x = 27
integer y = 28
integer width = 3470
integer height = 1248
integer taborder = 20
string title = "none"
string dataobject = "dw_fc_ingreso_ft_fallecido"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_ciudad

il_grabar++
ls_columna		= dwo.name
if ls_columna='ciudad_fallecido' then
	ls_ciudad		= data
	idw_detalle2.retrieve(ls_ciudad)
end if
end event

