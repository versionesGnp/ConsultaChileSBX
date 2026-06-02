forward
global type w_ficha_crematorio_2 from window
end type
type cb_4 from commandbutton within w_ficha_crematorio_2
end type
type cb_3 from commandbutton within w_ficha_crematorio_2
end type
type cb_act_doc from commandbutton within w_ficha_crematorio_2
end type
type cb_2 from commandbutton within w_ficha_crematorio_2
end type
type cb_ctacte from commandbutton within w_ficha_crematorio_2
end type
type cb_ficga_traslado from commandbutton within w_ficha_crematorio_2
end type
type dw_etiqueta_qr from datawindow within w_ficha_crematorio_2
end type
type cb_qr_etiqueta from commandbutton within w_ficha_crematorio_2
end type
type cb_imprimir_carta from commandbutton within w_ficha_crematorio_2
end type
type cb_1 from commandbutton within w_ficha_crematorio_2
end type
type st_2 from statictext within w_ficha_crematorio_2
end type
type ddplb_tipo_venta from dropdownpicturelistbox within w_ficha_crematorio_2
end type
type cb_crear_prelacion from commandbutton within w_ficha_crematorio_2
end type
type dw_print from datawindow within w_ficha_crematorio_2
end type
type cb_print from commandbutton within w_ficha_crematorio_2
end type
type sle_1 from uo_convierte_numero within w_ficha_crematorio_2
end type
type cb_inactivar from commandbutton within w_ficha_crematorio_2
end type
type cb_nuevo from commandbutton within w_ficha_crematorio_2
end type
type cb_limpiar from commandbutton within w_ficha_crematorio_2
end type
type em_folio from editmask within w_ficha_crematorio_2
end type
type st_1 from statictext within w_ficha_crematorio_2
end type
type rb_buscar_folio from radiobutton within w_ficha_crematorio_2
end type
type rb_buscar_ctto from radiobutton within w_ficha_crematorio_2
end type
type cb_buscar from commandbutton within w_ficha_crematorio_2
end type
type pb_aceptar from picturebutton within w_ficha_crematorio_2
end type
type dw_ctto from datawindow within w_ficha_crematorio_2
end type
type cb_grabar from commandbutton within w_ficha_crematorio_2
end type
type tab_crematorio from tab within w_ficha_crematorio_2
end type
type tabpage_1 from userobject within tab_crematorio
end type
type st_agenda_ingreso from statictext within tabpage_1
end type
type st_rut_dv from statictext within tabpage_1
end type
type dw_ficha from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_crematorio
st_agenda_ingreso st_agenda_ingreso
st_rut_dv st_rut_dv
dw_ficha dw_ficha
end type
type tabpage_2 from userobject within tab_crematorio
end type
type dw_fallecido from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_crematorio
dw_fallecido dw_fallecido
end type
type tabpage_3 from userobject within tab_crematorio
end type
type dw_titular from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_crematorio
dw_titular dw_titular
end type
type tabpage_4 from userobject within tab_crematorio
end type
type dw_prelacion from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_crematorio
dw_prelacion dw_prelacion
end type
type tabpage_6 from userobject within tab_crematorio
end type
type dw_archivos from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_crematorio
dw_archivos dw_archivos
end type
type tabpage_5 from userobject within tab_crematorio
end type
type dw_aranceles from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_crematorio
dw_aranceles dw_aranceles
end type
type tabpage_7 from userobject within tab_crematorio
end type
type dw_ceremonia from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_crematorio
dw_ceremonia dw_ceremonia
end type
type tabpage_8 from userobject within tab_crematorio
end type
type st_ag_pergola from statictext within tabpage_8
end type
type st_ag_capilla from statictext within tabpage_8
end type
type dw_cenizas from datawindow within tabpage_8
end type
type tabpage_8 from userobject within tab_crematorio
st_ag_pergola st_ag_pergola
st_ag_capilla st_ag_capilla
dw_cenizas dw_cenizas
end type
type tab_crematorio from tab within w_ficha_crematorio_2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_6 tabpage_6
tabpage_5 tabpage_5
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type
type cb_cerrar from commandbutton within w_ficha_crematorio_2
end type
type gb_1 from groupbox within w_ficha_crematorio_2
end type
type gb_2 from groupbox within w_ficha_crematorio_2
end type
end forward

global type w_ficha_crematorio_2 from window
integer width = 3378
integer height = 2892
boolean titlebar = true
string title = "Ficha Crematorio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_act_doc cb_act_doc
cb_2 cb_2
cb_ctacte cb_ctacte
cb_ficga_traslado cb_ficga_traslado
dw_etiqueta_qr dw_etiqueta_qr
cb_qr_etiqueta cb_qr_etiqueta
cb_imprimir_carta cb_imprimir_carta
cb_1 cb_1
st_2 st_2
ddplb_tipo_venta ddplb_tipo_venta
cb_crear_prelacion cb_crear_prelacion
dw_print dw_print
cb_print cb_print
sle_1 sle_1
cb_inactivar cb_inactivar
cb_nuevo cb_nuevo
cb_limpiar cb_limpiar
em_folio em_folio
st_1 st_1
rb_buscar_folio rb_buscar_folio
rb_buscar_ctto rb_buscar_ctto
cb_buscar cb_buscar
pb_aceptar pb_aceptar
dw_ctto dw_ctto
cb_grabar cb_grabar
tab_crematorio tab_crematorio
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
end type
global w_ficha_crematorio_2 w_ficha_crematorio_2

type variables
Double	il_rut_titular,il_rut_fallecido,il_monto_g
String		is_celular,is_base='G',is_serie='I',is_base_g,is_serie_g,is_moneda_g,is_cod_otro_g,is_tipo_venta
Long		il_sw,il_numero,il_folio,il_row_archivo,il_fila_arc,il_count_arc,il_numero_g,il_cod_parque,il_count_titular,il_sw_pregrabar,il_hora_ini, il_min_ini,&
			il_hora_fin,il_min_fin,il_intervalo,il_veces, il_sw_rut_fall,il_grabar,il_mod_archivo, il_carga_archivo
String		is_ag_crem,is_ag_capi,is_ag_pergo,is_ag_ing
datawindowchild	idw_detalle16
end variables

forward prototypes
public function string wf_valida_largo (long al_largo, string as_columna)
public function string wf_validar_letras (string as_letras, string as_columna)
public function string wf_validar_datos ()
public subroutine wf_documentos_gestionados ()
end prototypes

public function string wf_valida_largo (long al_largo, string as_columna);string ls_pasa='S'

//if il_sw > 0 then
	if al_largo > 9 and as_columna='celular' then
		//messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
		if tab_crematorio.SelectedTab = 3 then
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'celular',is_celular)
			tab_crematorio.tabpage_3.dw_titular.setfocus()
			tab_crematorio.tabpage_3.dw_titular.setcolumn('celular')
		elseif tab_crematorio.SelectedTab = 4 then
			tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'celular',is_celular)
			tab_crematorio.tabpage_4.dw_prelacion.setfocus()
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('celular')
		end if
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='celular' then
		//messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
		if tab_crematorio.SelectedTab = 3 then
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'celular',is_celular)
			tab_crematorio.tabpage_3.dw_titular.setfocus()
			tab_crematorio.tabpage_3.dw_titular.setcolumn('celular')
		elseif tab_crematorio.SelectedTab = 4 then
			tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'celular','')
			tab_crematorio.tabpage_4.dw_prelacion.setfocus()
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('celular')
		end if
		ls_pasa	= 'N'
		il_sw		= 0
	elseif al_largo > 9 and as_columna='telefono_particular' then
		tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'telefono_particular','')
		tab_crematorio.tabpage_4.dw_prelacion.setfocus()
		tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_particular')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='telefono_particular' then
		tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'telefono_particular','')
		tab_crematorio.tabpage_4.dw_prelacion.setfocus()
		tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_particular')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif al_largo > 9 and as_columna='telefono_comercial' then
		tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'telefono_comercial','')
		tab_crematorio.tabpage_4.dw_prelacion.setfocus()
		tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_comercial')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='telefono_comercial' then
		tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'telefono_comercial','')
		tab_crematorio.tabpage_4.dw_prelacion.setfocus()
		tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_comercial')
		ls_pasa	= 'N'
		il_sw		= 0
	
	end if	
	tab_crematorio.tabpage_3.dw_titular.accepttext()
	tab_crematorio.tabpage_4.dw_prelacion.accepttext()
//end if
return ls_pasa
end function

public function string wf_validar_letras (string as_letras, string as_columna);string ls_pasa='S'

//if il_sw > 0 then
	if Match(as_letras, "[A-Z]+") and as_columna='fono_contacto' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Telefono Contacto',stopsign!)
		tab_crematorio.tabpage_3.dw_titular.setitem(1,'celular',is_celular)
		ls_pasa	= 'N'
		il_sw		= 0
	elseif Match(as_letras, "[A-Z]+") and as_columna='celular' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Celular Contacto',stopsign!)
		if tab_crematorio.SelectedTab = 3 then
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'celular',is_celular)
		elseif tab_crematorio.SelectedTab = 4 then
			tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'celular','')
		end if
		ls_pasa	= 'N'
		il_sw		= 0
	elseif Match(as_letras, "[A-Z]+") and as_columna='telefono_particular' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Telefono Contacto',stopsign!)
		tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'telefono_particular','')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif Match(as_letras, "[A-Z]+") and as_columna='telefono_comercial' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Telefono Contacto',stopsign!)
		tab_crematorio.tabpage_4.dw_prelacion.setitem(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'telefono_comercial','')
		ls_pasa	= 'N'
		il_sw		= 0
	end if
	tab_crematorio.tabpage_3.dw_titular.accepttext()
	tab_crematorio.tabpage_4.dw_prelacion.accepttext()
//end if
return ls_pasa
end function

public function string wf_validar_datos ();String		ls_return='S',ls_tipo_origen,ls_tipo_solicitud_origen,ls_forma_venta,ls_origen_contrato,ls_responsable_retiro,ls_dv_fallecido,ls_nombres_fall,&
			ls_apellido_paterno_fall,ls_apellido_materno_fall,ls_sexo_fall,ls_estado_civil_fall,ls_estado_cuerpo_fall,ls_tamano_cuerpo_fall,ls_causa_fallecimiento_fall,&
			ls_ciudad_fallecimiento,ls_comuna_fallecimiento,ls_tipo_via_fallecido,ls_direccion_fallecido,ls_categoria,ls_url,ls_estado,&
			ls_numero_fallecido,ls_depto_fallecido,ls_block_fallecido,ls_existencia_elementos_fall,ls_estado_contrato_sepultura_fall,ls_observaciones_fall,ls_dv_tit,ls_nombre_tit,&
			ls_ap_pat_tit,ls_ap_mat_tit,ls_celular_tit,ls_email_tit,ls_tipo_cob_ara,ls_tipo_mov_ara,ls_codigo_otro_ara,ls_caja_ara,ls_tipo_moneda_ara,ls_parentesco_pre,&
			ls_dv_pre,ls_nombres_pre,ls_ap_pat_pre,ls_ap_mat_pre,ls_tipo_via_pre,ls_dire_pre,ls_num_pre,ls_depto_pre,ls_block_pre,ls_ciudad_pre,ls_comuna_pre,ls_fono_part_pre,&
			ls_fono_com_pre,ls_celular_pre,ls_correo_pre,ls_obs_pre,ls_estado_civil,ls_codigo_maestro,ls_obs_ceremonia,ls_visualizar_servicio,ls_dv_rsponsable,&
			ls_nombre_resp,ls_ap_pat_resp,ls_ap_mat_resp,ls_fono1_resp,ls_fono2_resp,ls_dv_responsable,ls_obs_resp,ls_participa_resp,ls_responsable_retiro_resp
Double	ll_rut_titular,ll_rut_fallecido,ll_rut_fallecido_fall,ll_rut_tit,ll_monto_paga_ara,ll_monto_ctto_ara,ll_rut_archivo,ll_rut_pre,ll_rut_responsable
Datetime	ldt_fecha_nacimiento_fall,ldt_fecha_defuncion_fall,ldt_fecha_pago_ara,ldt_fecha_retiro_resp
Long		ll_hora_defuncion_fall,ll_minuto_defuncion_fall,ll_cod_parque_fall,ll_codigo_funeraria_fall,ll_folio_ara,ll_tot_reg,ll_indi,ll_codigo,ll_destino_cuerpo,ll_codigo_origen_cuerpo_fall,&
			ll_nacionalidad,ll_codigo_religion,ll_sw_orador,ll_codigo_diacono,ll_destino_cuerpo_resp,ll_hora_retiro_resp,ll_minuto_retiro_resp,ll_horno,ll_archivo_nulo=0

ll_rut_titular								= Double(tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular'))
ll_rut_fallecido							= Double(tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_fallecido'))
ll_horno									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'horno')
ls_tipo_origen							= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen')
ls_tipo_solicitud_origen				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
ls_forma_venta							= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'forma_venta')
ls_origen_contrato						= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'origen_contrato')
ll_destino_cuerpo						= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'destino_cuerpo')
ls_responsable_retiro					= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'responsable_retiro')

ll_rut_fallecido_fall						= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
ls_dv_fallecido							= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
ls_nombres_fall						= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres')
ls_apellido_paterno_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno')
ls_apellido_materno_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno')
ldt_fecha_nacimiento_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
ls_sexo_fall								= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'sexo')
ldt_fecha_defuncion_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
ll_hora_defuncion_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'hora_defuncion')
ll_minuto_defuncion_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'minuto_defuncion')
ls_estado_civil_fall						= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'estado_civil')
ls_estado_cuerpo_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'estado_cuerpo')
ls_tamano_cuerpo_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'tamano_cuerpo')
ls_causa_fallecimiento_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'causa_fallecimiento')
ll_cod_parque_fall						= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'cod_parque')
ls_ciudad_fallecimiento				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'ciudad_fallecimiento')
ls_comuna_fallecimiento				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'comuna_fallecimiento')
ll_codigo_origen_cuerpo_fall		= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'codigo_origen_cuerpo')
ls_tipo_via_fallecido					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'tipo_via_fallecido')
ls_direccion_fallecido					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'direccion_fallecido')
ls_numero_fallecido					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'numero_fallecido')
ls_depto_fallecido						= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'depto_fallecido')
ls_block_fallecido						= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'block_fallecido')
ll_codigo_funeraria_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'codigo_funeraria')
ls_existencia_elementos_fall		= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'existencia_elementos')
//ls_estado_contrato_sepultura_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'estado_contrato_sepultura')
ls_observaciones_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')

ll_rut_tit									= tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular')
ls_dv_tit									= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'dv_titular')
ls_nombre_tit							= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'nombres')
ls_ap_pat_tit							= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_paterno')
ls_ap_mat_tit							= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_materno')
ls_celular_tit							= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'celular')
ls_email_tit								= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'email')

ls_tipo_cob_ara						= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'tipo_cob')
ll_folio_ara								= tab_crematorio.tabpage_5.dw_aranceles.getitemnumber(1,'folio_pago')
ls_tipo_mov_ara						= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'tipo_mov')
ll_monto_paga_ara					= tab_crematorio.tabpage_5.dw_aranceles.getitemnumber(1,'monto_pago')
ls_tipo_moneda_ara					= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'tipo_moneda')
ll_monto_ctto_ara						= tab_crematorio.tabpage_5.dw_aranceles.getitemnumber(1,'monto_contrato')
ldt_fecha_pago_ara					= tab_crematorio.tabpage_5.dw_aranceles.getitemdatetime(1,'fecha_pago')
ls_codigo_otro_ara					= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'codigo_otro')
ls_caja_ara								= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'cod_caja')

ll_codigo_religion						= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
ll_sw_orador							= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'sw_orador')
ll_codigo_diacono						= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_diacono')
ls_codigo_maestro						= tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'codigo_maestro')
ls_obs_ceremonia						= tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion')

ll_destino_cuerpo_resp				= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'destino_cuerpo')
ls_responsable_retiro_resp			= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'responsable_retiro')
ls_visualizar_servicio					= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
ll_rut_responsable						= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'rut_responsable')
ls_dv_responsable						= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'dv_responsable')
ls_nombre_resp						= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'nombre')
ls_ap_pat_resp							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'apellido_paterno')
ls_ap_mat_resp						= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'apellido_materno')
ls_fono1_resp							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'fono_1')
ls_fono2_resp							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'fono_2')
ls_participa_resp						= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'sw_participa_cremacion')
ldt_fecha_retiro_resp					= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_retiro_ceniza')
ll_hora_retiro_resp					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_retiro_ceniza')
ll_minuto_retiro_resp					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_retiro_ceniza')

//Ficha
if isnull(ll_rut_titular) or ll_rut_titular=0 then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Rut Titular")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('rut_titular')
	ls_return					= 'N'
elseif isnull(ll_rut_fallecido) or ll_rut_fallecido=0 then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Rut Fallecido")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('rut_fallecido')
	ls_return					= 'N'
//elseif isnull(ll_horno) or ll_horno=0 then
//	tab_crematorio.SelectedTab		= 1
//	messagebox("Advertencia","Debe Ingresar Horno")
//	tab_crematorio.tabpage_1.dw_ficha.setfocus()
//	tab_crematorio.tabpage_1.dw_ficha.setcolumn('horno')
//	ls_return					= 'N'
elseif (isnull(ls_tipo_origen) or ls_tipo_origen='') then	//and il_sw_pregrabar=1
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Tipo Origen")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_origen')
	ls_return					= 'N'
elseif (isnull(ls_tipo_solicitud_origen) or ls_tipo_solicitud_origen='') then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Tipo Solicitud Origen")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_solicitud_origen')
	ls_return					= 'N'
elseif (isnull(ls_forma_venta) or ls_forma_venta='') then		//and il_sw_pregrabar=1 
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Forma Venta")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('forma_venta')
	ls_return					= 'N'
elseif (isnull(ls_origen_contrato) or ls_origen_contrato='') then		//and il_sw_pregrabar=1
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Origen Contrato")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('origen_contrato')
	ls_return					= 'N'
elseif isnull(ll_destino_cuerpo) and ls_tipo_origen='CV' then	//and il_sw_pregrabar=1 
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Destino Cuerpo")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('destino_cuerpo')
	ls_return					= 'N'
elseif (isnull(ls_responsable_retiro) or ls_responsable_retiro='') and il_sw_pregrabar=1 and ls_tipo_origen='CV' then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Responsable Retiro")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('responsable_retiro')
	ls_return					= 'N'
// Fallecido	
elseif isnull(ll_rut_fallecido_fall) or ll_rut_fallecido_fall=0 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Rut Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('rut_fallecido')
	ls_return					= 'N'
elseif (isnull(ls_dv_fallecido) or ls_dv_fallecido='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Digito Verificador Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('dv_fallecido')
	ls_return					= 'N'
elseif isnull(ls_nombres_fall) or ls_nombres_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('nombres')
	ls_return					= 'N'
elseif isnull(ls_apellido_paterno_fall) or ls_apellido_paterno_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_paterno')
	ls_return					= 'N'
elseif isnull(ls_apellido_materno_fall) or ls_apellido_materno_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_materno')
	ls_return					= 'N'
elseif isnull(ldt_fecha_nacimiento_fall) and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_nacimiento')
	ls_return					= 'N'
elseif (isnull(ls_sexo_fall) or ls_sexo_fall = '') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Sexo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('sexo')
	ls_return					= 'N'
elseif isnull(ldt_fecha_defuncion_fall) and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Fecha Defunción Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
	ls_return					= 'N'
elseif ldt_fecha_defuncion_fall < ldt_fecha_nacimiento_fall and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Fecha Defunción No puede ser Menor a Fecha Nacimiento")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
	ls_return					= 'N'
elseif isnull(ll_hora_defuncion_fall) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Hora Defunción")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('hora_defuncion')
	ls_return					= 'N'
elseif isnull(ll_minuto_defuncion_fall) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Minutos Defunción")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('minuto_defuncion')
	ls_return					= 'N'
elseif (isnull(ls_estado_civil_fall) or ls_estado_civil_fall='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Estado Civil Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('estado_civil')
	ls_return					= 'N'
elseif (isnull(ls_estado_cuerpo_fall) or ls_estado_cuerpo_fall='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Estado Cuerpo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('estado_cuerpo')
	ls_return					= 'N'
//elseif (isnull(ls_tamano_cuerpo_fall) or ls_tamano_cuerpo_fall='') and il_sw_pregrabar=1 then
//	tab_crematorio.SelectedTab		= 2
//	messagebox("Advertencia","Debe Ingresar Tamaño Cuerpo Fallecido")
//	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
//	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('tamano_cuerpo')
//	ls_return					= 'N'
elseif (isnull(ls_causa_fallecimiento_fall) or ls_causa_fallecimiento_fall='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Causa Fallecimiento")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('causa_fallecimiento')
	ls_return					= 'N'
elseif (isnull(ll_cod_parque_fall) or ll_cod_parque_fall=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Parque Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('cod_parque')
	ls_return					= 'N'
elseif (isnull(ls_ciudad_fallecimiento) or ls_ciudad_fallecimiento='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Ciudad Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('ciudad_fallecimiento')
	ls_return					= 'N'
elseif (isnull(ls_comuna_fallecimiento) or ls_comuna_fallecimiento='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	messagebox("Advertencia","Debe Ingresar Comuna Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('comuna_fallecimiento')
	ls_return					= 'N'
elseif isnull(ll_codigo_origen_cuerpo_fall) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Origen Cuerpo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('codigo_origen_cuerpo')
	ls_return					= 'N'
elseif (isnull(ls_tipo_via_fallecido) or ls_tipo_via_fallecido='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Tipo Via Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('tipo_via_fallecido')
	ls_return					= 'N'
elseif (isnull(ls_direccion_fallecido) or ls_direccion_fallecido='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Dirección Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('direccion_fallecido')
	ls_return					= 'N'
elseif (isnull(ls_numero_fallecido) or ls_numero_fallecido='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Rut Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('numero_fallecido')
	ls_return					= 'N'
elseif (isnull(ls_depto_fallecido) or ls_depto_fallecido='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Depto. Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('depto_fallecido')
	ls_return					= 'N'
elseif (isnull(ls_block_fallecido) or ls_block_fallecido='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Block Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('block_fallecido')
	ls_return					= 'N'
elseif (isnull(ll_codigo_funeraria_fall) or ll_codigo_funeraria_fall=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Funeraria")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('codigo_funeraria')
	ls_return					= 'N'
elseif (isnull(ls_existencia_elementos_fall) or ls_existencia_elementos_fall='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Si tiene Existencia de Elementos Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('existencia_elementos')
	ls_return					= 'N'
//elseif (isnull(ls_estado_contrato_sepultura_fall) or ls_estado_contrato_sepultura_fall='') and ls_tipo_origen='CV' then
//	tab_crematorio.SelectedTab		= 2
//	messagebox("Advertencia","Debe Ingresar Estado Contrato")
//	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
//	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('estado_contrato_sepultura')
//	ls_return					= 'N'
elseif (isnull(ls_observaciones_fall) or ls_observaciones_fall='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Observaciones Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
	ls_return					= 'N'
// Titular
elseif isnull(ll_rut_tit) or ll_rut_tit=0 then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Rut Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('rut_titular')
	ls_return					= 'N'
elseif isnull(ls_dv_tit) or ls_dv_tit='' then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Digito Verificador Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('dv_titular')
	ls_return					= 'N'
elseif (isnull(ls_nombre_tit) or ls_nombre_tit='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Nombre Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('nombres')
	ls_return					= 'N'
elseif (isnull(ls_ap_pat_tit) or ls_ap_pat_tit='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_paterno')
	ls_return					= 'N'
elseif (isnull(ls_ap_mat_tit) or ls_ap_mat_tit='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_materno')
	ls_return					= 'N'
elseif (isnull(ls_celular_tit) or ls_celular_tit='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Celular Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('celular')
	ls_return					= 'N'
elseif (isnull(ls_email_tit) or ls_email_tit='') and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Correo Electrónico Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('email')
	ls_return					= 'N'

//Aranceles
elseif (isnull(ls_tipo_cob_ara) or ls_tipo_cob_ara='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 6
	messagebox("Advertencia","Debe Ingresar Tipo Cobro Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('tipo_cob')
	ls_return					= 'N'
elseif (isnull(ll_folio_ara) or ll_folio_ara=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 6
	messagebox("Advertencia","Debe Ingresar Folio Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('folio_pago')
	ls_return					= 'N'
//elseif isnull(ls_tipo_mov_ara) or ls_tipo_mov_ara='' then
//	tab_crematorio.SelectedTab		= 6
//	messagebox("Advertencia","Debe Ingresar Tipo Movimiento Pago Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('tipo_mov')
//	ls_return					= 'N'
elseif (isnull(ll_monto_paga_ara) or ll_monto_paga_ara=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 6
	messagebox("Advertencia","Debe Ingresar Monto Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('monto_pago')
	ls_return					= 'N'
//elseif isnull(ls_tipo_moneda_ara) or ls_tipo_moneda_ara='' then
//	tab_crematorio.SelectedTab		= 6
//	messagebox("Advertencia","Debe Ingresar Moneda Pago Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('tipo_moneda')
//	ls_return					= 'N'
//elseif isnull(ll_monto_ctto_ara) or ll_monto_ctto_ara=0 then
//	tab_crematorio.SelectedTab		= 6
//	messagebox("Advertencia","Debe Ingresar Monto Contrato Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('monto_contrato')
//	ls_return					= 'N'
elseif isnull(ldt_fecha_pago_ara) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 6
	messagebox("Advertencia","Debe Ingresar Fecha Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('fecha_pago')
	ls_return					= 'N'
//elseif isnull(ls_codigo_otro_ara) or ls_codigo_otro_ara='' then
//	tab_crematorio.SelectedTab		= 6
//	messagebox("Advertencia","Debe Ingresar Codigo Otro Pago Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('codigo_otro')
//	ls_return					= 'N'
elseif (isnull(ls_caja_ara) or ls_caja_ara='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 6
	messagebox("Advertencia","Debe Ingresar Caja Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('cod_caja')
	ls_return					= 'N'
	
//Prelación
elseif tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	ll_tot_reg				= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
	for ll_indi= 1 to ll_tot_reg
		ls_parentesco_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'parentesco')
		ll_rut_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'rut')
		ls_dv_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'dv')
		ls_nombres_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'nombres')
		ls_ap_pat_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_paterno')
		ls_ap_mat_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_materno')
		ls_tipo_via_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'tipo_via')
		ls_dire_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'direccion')
		ls_num_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'numero_direc')
		ls_depto_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'depto_direc')
		ls_block_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'block_direc')
		ls_ciudad_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'ciudad')
		ls_comuna_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'comuna')
		ls_fono_part_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'telefono_particular')
		ls_fono_com_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'telefono_comercial')
		ls_celular_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'celular')
		ls_correo_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'correo_electronico')
		ls_obs_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'observacion')
		ls_estado_civil		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'estado_civil')
		ll_nacionalidad		= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'nacionalidad')
		ls_return				= 'S'
		if isnull(ls_parentesco_pre) or ls_parentesco_pre=''  then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Parentesco en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('parentesco')
			ls_return					= 'N'
			exit
		elseif isnull(ll_rut_pre) or ll_rut_pre=0 then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('rut')
			ls_return					= 'N'
			exit
		elseif isnull(ls_dv_pre) or ls_dv_pre = '' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Digito Verificador en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('dv')
			ls_return					= 'N'
			exit
		elseif isnull(ls_nombres_pre) or ls_nombres_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Nombre Prelación en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('nombres')
			ls_return					= 'N'
			exit
		elseif isnull(ls_ap_pat_pre) or ls_ap_pat_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('apellido_paterno')
			ls_return					= 'N'
			exit
		elseif isnull(ls_ap_mat_pre) or ls_ap_mat_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('apellido_materno')
			ls_return					= 'N'
			exit
		elseif isnull(ls_tipo_via_pre) or ls_tipo_via_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Tipo Via en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('tipo_via')
			ls_return					= 'N'
			exit
		elseif isnull(ls_dire_pre) or ls_dire_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Dirección en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('direccion')
			ls_return					= 'N'
			exit
		elseif isnull(ls_num_pre) or ls_num_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Número Dirección en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('numero_direc')
			ls_return					= 'N'
			exit
		elseif isnull(ls_depto_pre) or ls_depto_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Depto Dirección en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('depto_direc')
			ls_return					= 'N'
			exit
		elseif isnull(ls_block_pre) or ls_block_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Block Dirección en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('block_direc')
			ls_return					= 'N'
			exit
		elseif isnull(ls_ciudad_pre) or ls_ciudad_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Ciudad en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('ciudad')
			ls_return					= 'N'
			exit
		elseif isnull(ls_comuna_pre) or ls_comuna_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Comuna en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('comuna')
			ls_return					= 'N'
			exit
		elseif isnull(ls_fono_part_pre) or ls_fono_part_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Telefono Particular en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_particular')
			ls_return					= 'N'
			exit
		elseif isnull(ls_fono_com_pre) or ls_fono_com_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Telefono Comercial en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_comercial')
			ls_return					= 'N'
			exit
		elseif isnull(ls_celular_pre) or ls_celular_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Celular en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('celular')
			ls_return					= 'N'
			exit
		elseif isnull(ls_correo_pre) or ls_correo_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Correo Electronico en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('correo_electronico')
			ls_return					= 'N'
			exit
		elseif isnull(ls_obs_pre) or ls_obs_pre='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Observaciones en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('observacion')
			ls_return					= 'N'
			exit
			
		elseif isnull(ls_estado_civil) or ls_estado_civil='' then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Estado Civil en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('estado_civil')
			ls_return					= 'N'
			exit
		elseif isnull(ll_nacionalidad) then
			tab_crematorio.SelectedTab		= 4
			messagebox("Advertencia","Debe Ingresar Nacionalidad en Fila "+string(ll_indi))
			tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
			tab_crematorio.tabpage_4.dw_prelacion.setcolumn('nacionalidad')
			ls_return					= 'N'
			exit
		end if
	next
//Archivos
elseif tab_crematorio.tabpage_6.dw_archivos.rowcount() > 0 and tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 then
	ll_tot_reg			= tab_crematorio.tabpage_6.dw_archivos.rowcount()
	for ll_indi=1 to ll_tot_reg
		ls_categoria		= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'categoria')
		ll_codigo			= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(ll_indi,'codigo_documento')
		ll_rut_archivo	= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(ll_indi,'rut_tercero')
		ls_url				= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'url')
		ls_estado		= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'estado_carga')
		ls_return			= 'S'
		if isnull(ls_categoria) then
			tab_crematorio.SelectedTab		= 5
//			messagebox("Advertencia","Debe Ingresar Categoria en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('categoria')
			ls_return					= 'N'
			ll_archivo_nulo ++
			exit
		elseif isnull(ll_codigo) then
			tab_crematorio.SelectedTab		= 5
			messagebox("Advertencia","Debe Ingresar Codigo Documento en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('codigo_documento')
			ls_return					= 'N'
			exit
		elseif isnull(ll_rut_archivo)  then
			tab_crematorio.SelectedTab		= 5
			messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('rut_tercero')
			ls_return					= 'N'
			exit
		elseif (isnull(ls_url) or ls_url='') and il_sw_pregrabar=1 then
			tab_crematorio.SelectedTab		= 5
			messagebox("Advertencia","Debe Realizar Carga Archivo en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('url')
			ls_return					= 'N'
			exit
		elseif (isnull(ls_estado) or ls_estado <> 'S') and il_sw_pregrabar=1 then
			tab_crematorio.SelectedTab		= 5
			messagebox("Advertencia","No esta Correctamente Cargado Archivo en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			ls_return					= 'N'
			exit
		end if
	next
	if ll_archivo_nulo > 0 then tab_crematorio.tabpage_6.dw_archivos.reset()
//////Ceremonia
elseif (isnull(ll_codigo_religion) or ll_codigo_religion=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Religion Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
	ls_return					= 'N'
elseif isnull(ll_sw_orador) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Estado Orador Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('sw_orador')
	ls_return					= 'N'
elseif (isnull(ll_codigo_diacono) or ll_codigo_diacono=0) and ll_sw_orador=1 and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Diacono Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_diacono')
	ls_return					= 'N'
elseif (isnull(ls_codigo_maestro) or ls_codigo_maestro='') and ll_sw_orador=2 and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Maestro Condolencia Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_maestro')
	ls_return					= 'N'
elseif (isnull(ls_obs_ceremonia) or ls_obs_ceremonia='') and ll_sw_orador=2 and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Otros Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
	ls_return					= 'N'
	
//////Cenizas
elseif (isnull(ll_destino_cuerpo_resp) or ll_destino_cuerpo_resp=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Destino Cuerpo Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('destino_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_responsable_retiro_resp) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar responsable Retiro Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('destino_cuerpo')
	ls_return					= 'N'
elseif (isnull(ls_visualizar_servicio) or ls_visualizar_servicio='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Visualizar Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('visualizar_servicio')
	ls_return					= 'N'
elseif (isnull(ll_rut_responsable) or ll_rut_responsable=0) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Rut Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('rut_responsable')
	ls_return					= 'N'
elseif (isnull(ls_dv_responsable) or ls_dv_responsable='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Digito Verificador Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('dv_responsable')
	ls_return					= 'N'
elseif (isnull(ls_nombre_resp) or ls_nombre_resp='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Nombre Responsable Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('nombre')
	ls_return					= 'N'
elseif (isnull(ls_ap_pat_resp) or ls_ap_pat_resp='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Responsable Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('apellido_paterno')
	ls_return					= 'N'
elseif (isnull(ls_ap_mat_resp) or ls_ap_mat_resp='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Apellido Materno Responsable Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('apellido_materno')
	ls_return					= 'N'
elseif (isnull(ls_fono1_resp) or ls_fono1_resp='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Telefono 1 Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fono_1')
	ls_return					= 'N'
elseif (isnull(ls_fono2_resp) or ls_fono2_resp='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Telefono 2 Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fono_2')
	ls_return					= 'N'
elseif (isnull(ls_participa_resp) or ls_participa_resp='') and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Participa Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('sw_participa_cremacion')
	ls_return					= 'N'
elseif isnull(ldt_fecha_retiro_resp) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Fecha Retito Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_retiro_ceniza')
	ls_return					= 'N'
elseif (not isnull(ldt_fecha_retiro_resp) and isnull(ll_hora_retiro_resp)) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Hora Retito Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_retiro_ceniza')
	ls_return					= 'N'
elseif not isnull(ldt_fecha_retiro_resp) and not isnull(ll_hora_retiro_resp) and isnull(ll_minuto_retiro_resp) and ls_tipo_origen='CV' and il_sw_pregrabar=1 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Minuto Retito Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('minuto_retiro_ceniza')
	ls_return					= 'N'
end if 

Return ls_return
end function

public subroutine wf_documentos_gestionados ();Long		ll_tot_reg,ll_indi,ll_contar_s
String		ls_estado

ll_tot_reg				= tab_crematorio.tabpage_6.dw_archivos.rowcount()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ls_estado		= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'estado_carga')
		if ls_estado='S' then
			ll_contar_s++
		end if
	next 
	if ll_tot_reg = ll_contar_s then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_documento',ll_tot_reg)
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'documentos',2)
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'prelacion',2)
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
end if
end subroutine

on w_ficha_crematorio_2.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_act_doc=create cb_act_doc
this.cb_2=create cb_2
this.cb_ctacte=create cb_ctacte
this.cb_ficga_traslado=create cb_ficga_traslado
this.dw_etiqueta_qr=create dw_etiqueta_qr
this.cb_qr_etiqueta=create cb_qr_etiqueta
this.cb_imprimir_carta=create cb_imprimir_carta
this.cb_1=create cb_1
this.st_2=create st_2
this.ddplb_tipo_venta=create ddplb_tipo_venta
this.cb_crear_prelacion=create cb_crear_prelacion
this.dw_print=create dw_print
this.cb_print=create cb_print
this.sle_1=create sle_1
this.cb_inactivar=create cb_inactivar
this.cb_nuevo=create cb_nuevo
this.cb_limpiar=create cb_limpiar
this.em_folio=create em_folio
this.st_1=create st_1
this.rb_buscar_folio=create rb_buscar_folio
this.rb_buscar_ctto=create rb_buscar_ctto
this.cb_buscar=create cb_buscar
this.pb_aceptar=create pb_aceptar
this.dw_ctto=create dw_ctto
this.cb_grabar=create cb_grabar
this.tab_crematorio=create tab_crematorio
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_act_doc,&
this.cb_2,&
this.cb_ctacte,&
this.cb_ficga_traslado,&
this.dw_etiqueta_qr,&
this.cb_qr_etiqueta,&
this.cb_imprimir_carta,&
this.cb_1,&
this.st_2,&
this.ddplb_tipo_venta,&
this.cb_crear_prelacion,&
this.dw_print,&
this.cb_print,&
this.sle_1,&
this.cb_inactivar,&
this.cb_nuevo,&
this.cb_limpiar,&
this.em_folio,&
this.st_1,&
this.rb_buscar_folio,&
this.rb_buscar_ctto,&
this.cb_buscar,&
this.pb_aceptar,&
this.dw_ctto,&
this.cb_grabar,&
this.tab_crematorio,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2}
end on

on w_ficha_crematorio_2.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_act_doc)
destroy(this.cb_2)
destroy(this.cb_ctacte)
destroy(this.cb_ficga_traslado)
destroy(this.dw_etiqueta_qr)
destroy(this.cb_qr_etiqueta)
destroy(this.cb_imprimir_carta)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.ddplb_tipo_venta)
destroy(this.cb_crear_prelacion)
destroy(this.dw_print)
destroy(this.cb_print)
destroy(this.sle_1)
destroy(this.cb_inactivar)
destroy(this.cb_nuevo)
destroy(this.cb_limpiar)
destroy(this.em_folio)
destroy(this.st_1)
destroy(this.rb_buscar_folio)
destroy(this.rb_buscar_ctto)
destroy(this.cb_buscar)
destroy(this.pb_aceptar)
destroy(this.dw_ctto)
destroy(this.cb_grabar)
destroy(this.tab_crematorio)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_ficha_crematorio)

connect using Trans_1;
dw_ctto.settransobject(sqlca)
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
tab_crematorio.tabpage_8.st_ag_capilla.visible			= false
tab_crematorio.tabpage_8.st_ag_pergola.visible		= false
if idw_detalle.retrieve(is_base)=0 then idw_detalle.insertrow(0)
dw_ctto.insertrow(0)
ddplb_tipo_venta.text		= 'CV - Con Venta'
tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio'
tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido'
tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular'
is_tipo_venta				= mid(ddplb_tipo_venta.text,1,2)
tab_crematorio.tabpage_1.dw_ficha.settransobject(sqlca)
tab_crematorio.tabpage_2.dw_fallecido.settransobject(sqlca)
tab_crematorio.tabpage_3.dw_titular.settransobject(sqlca)
tab_crematorio.tabpage_4.dw_prelacion.settransobject(sqlca)
tab_crematorio.tabpage_5.dw_aranceles.settransobject(sqlca)
tab_crematorio.tabpage_6.dw_archivos.settransobject(sqlca)
tab_crematorio.tabpage_7.dw_ceremonia.settransobject(sqlca)
tab_crematorio.tabpage_8.dw_cenizas.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_etiqueta_qr.settransobject(sqlca)
tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(is_tipo_venta)=0 then
	idw_detalle2.insertrow(0)
end if

tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(is_tipo_venta)=0 then
	idw_detalle3.insertrow(0)
end if

tab_crematorio.tabpage_2.dw_fallecido.getchild('rut_fallecido',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.insertrow(0)

tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
idw_detalle12.settransobject(sqlca)
idw_detalle12.insertrow(0)

tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
idw_detalle13.settransobject(sqlca)
idw_detalle13.insertrow(0)

tab_crematorio.tabpage_1.dw_ficha.getchild('rut_fallecido',idw_detalle14)
idw_detalle14.settransobject(sqlca)
idw_detalle14.insertrow(0)

tab_crematorio.tabpage_6.dw_archivos.getchild('codigo_documento',idw_detalle15)
idw_detalle15.settransobject(sqlca)
//if idw_detalle15.retrieve('PR')=0 then idw_detalle15.insertrow(0)
if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
tab_crematorio.tabpage_6.dw_archivos.getchild('rut_tercero',idw_detalle16)
idw_detalle16.settransobject(sqlca)
idw_detalle16.insertrow(0)
tab_crematorio.tabpage_1.dw_ficha.enabled			= false
tab_crematorio.tabpage_2.dw_fallecido.enabled		= false
tab_crematorio.tabpage_3.dw_titular.enabled			= false
tab_crematorio.tabpage_4.dw_prelacion.enabled		= false
tab_crematorio.tabpage_5.dw_aranceles.enabled		= false
tab_crematorio.tabpage_6.dw_archivos.enabled		= false
tab_crematorio.tabpage_7.dw_ceremonia.enabled	= false
tab_crematorio.tabpage_8.dw_cenizas.enabled		= false
ddplb_tipo_venta.triggerevent(selectionchanged!)
end event

event close;disconnect using Trans_1;
end event

type cb_4 from commandbutton within w_ficha_crematorio_2
boolean visible = false
integer x = 2208
integer y = 2304
integer width = 343
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= tab_crematorio.tabpage_6.dw_archivos
if tab_crematorio.tabpage_6.dw_archivos.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_ficha_crematorio_2
boolean visible = false
integer x = 2158
integer y = 2156
integer width = 343
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Ordenar"
end type

event clicked;string nulo
if tab_crematorio.tabpage_6.dw_archivos.rowcount() > 0 then
	setnull (nulo)
	tab_crematorio.tabpage_6.dw_archivos.SETSORT(NULO)
	tab_crematorio.tabpage_6.dw_archivos.SORT()
end if
end event

type cb_act_doc from commandbutton within w_ficha_crematorio_2
boolean visible = false
integer x = 3086
integer y = 2076
integer width = 352
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Doc"
end type

event clicked;if il_carga_archivo > 0 then
	Long		ll_folio_fc
	String		ls_url
	tab_crematorio.tabpage_6.dw_archivos.accepttext()
	ls_url				= tab_crematorio.tabpage_6.dw_archivos.getitemstring(il_row_archivo,'url')
	if isnull(ls_url) or ls_url='' then f_reg_x_segundo('CTTO',15000000)
	ll_folio_fc					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
	if ll_folio_fc > 0 then
//		if tab_crematorio.tabpage_6.dw_archivos.update()=1 then
//			commit;
//		else
//			rollback;
//		end if
		tab_crematorio.tabpage_6.dw_archivos.retrieve(ll_folio_fc)
		tab_crematorio.tabpage_6.dw_archivos.sort()
		tab_crematorio.tabpage_6.dw_archivos.accepttext()
		tab_crematorio.tabpage_6.dw_archivos.scrolltorow(il_row_archivo)
		tab_crematorio.tabpage_6.dw_archivos.setfocus()
		if not isnull(ls_url) or ls_url<>'' then
			il_carga_archivo			= 0
		end if
	end if
end if
end event

type cb_2 from commandbutton within w_ficha_crematorio_2
integer x = 2382
integer y = 1936
integer width = 375
integer height = 96
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta.Cte.Origen"
end type

event clicked;if tab_crematorio.tabpage_1.dw_ficha.rowcount()>0 then
	gs_base 									= tab_crematorio.tabpage_1.dw_ficha.GetItemString(1, "base_origen")
	gs_serie 									= tab_crematorio.tabpage_1.dw_ficha.GetItemString(1, "serie_origen")
	gi_numero 								= tab_crematorio.tabpage_1.dw_ficha.GetItemNumber(1, "numero_origen")
	gi_rut 									= tab_crematorio.tabpage_1.dw_ficha.GetItemNumber(1, "rut_titular")
	gs_apellido_paterno					= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "apellido_paterno")
	gs_apellido_materno					= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "apellido_materno")
	gs_nombres								= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "nombres")
	gs_dv										= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "dv_titular")
	gs_estado								= tab_crematorio.tabpage_1.dw_ficha.GetItemString(1, "estado_contrato")
	gl_cod_parque_cta					= tab_crematorio.tabpage_1.dw_ficha.GetItemNumber(1, "cod_parque_origen")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type cb_ctacte from commandbutton within w_ficha_crematorio_2
integer x = 2171
integer y = 1936
integer width = 206
integer height = 96
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta.Cte."
end type

event clicked;if tab_crematorio.tabpage_1.dw_ficha.rowcount()>0 then
	gs_base 									= tab_crematorio.tabpage_1.dw_ficha.GetItemString(1, "base")
	gs_serie 									= tab_crematorio.tabpage_1.dw_ficha.GetItemString(1, "serie")
	gi_numero 								= tab_crematorio.tabpage_1.dw_ficha.GetItemNumber(1, "numero")
	gi_rut 									= tab_crematorio.tabpage_1.dw_ficha.GetItemNumber(1, "rut_titular")
	gs_apellido_paterno					= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "apellido_paterno")
	gs_apellido_materno					= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "apellido_materno")
	gs_nombres								= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "nombres")
	gs_dv										= tab_crematorio.tabpage_3.dw_titular.GetItemString(1, "dv_titular")
	gs_estado								= tab_crematorio.tabpage_1.dw_ficha.GetItemString(1, "estado_contrato")
	gl_cod_parque_cta					= tab_crematorio.tabpage_1.dw_ficha.GetItemNumber(1, "cod_parque_origen")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				Open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type cb_ficga_traslado from commandbutton within w_ficha_crematorio_2
integer x = 1778
integer y = 1936
integer width = 389
integer height = 96
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ficha Traslado"
end type

event clicked;String		ls_string
Double	ll_rut_titular,ll_rut_fallecido
Long		ll_folio_fc,ll_destino_cuerpo,ll_numero_f

if isvalid(w_fc_ficha_traslado) then close(w_fc_ficha_traslado)
ll_rut_titular			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
ll_folio_fc			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
ll_rut_fallecido		= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
ll_destino_cuerpo	=  tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'destino_cuerpo')
SELECT	MIN("CD_FOLIO"."NUMERO")
INTO 		:ll_numero_f
FROM 	"CD_FOLIO"
WHERE 	"CD_FOLIO"."BASE" = 'F' AND	"CD_FOLIO"."SERIE" = 'F' AND
		  ( "CD_FOLIO"."ULT_ESTADO" = 2 OR "CD_FOLIO"."ULT_ESTADO" = 3 OR "CD_FOLIO"."ULT_ESTADO" = 14)
USING sqlca;
if isnull(ll_numero_f) then ll_numero_f = 0
if ll_numero_f > 0 then
	if ll_rut_titular > 0 then
		if isnull(ll_rut_titular) then
			messagebox("Advertencia","Debe Ingresar Rut Titular")
		elseif isnull(ll_folio_fc) then
			messagebox("Advertencia","Debe Grabar Ficha Cremación antes de Generar Ficha Traslado")
		elseif isnull(ll_rut_fallecido) then
			messagebox("Advertencia","Debe Ingresar Rut Fallecido")
		elseif isnull(ll_destino_cuerpo) then
			messagebox("Advertencia","Debe Ingresar Destino Cuerpo")
		else
			ls_string 			= string(ll_rut_titular)+'~t'+string(ll_folio_fc)+'~t'+string(ll_rut_fallecido)+'~t'+'N'
			OpenWithParm(w_fc_ficha_traslado,ls_string)
		end if
	end if
else
	messagebox("Advertencia","Folio Contrato Funerario, NO Existe Folios Disponibles en Control Documentario es Obligatorio Asignar Contratos")
end if
end event

type dw_etiqueta_qr from datawindow within w_ficha_crematorio_2
integer x = 41
integer y = 2092
integer width = 2098
integer height = 648
string title = "none"
string dataobject = "dw_fc_imprimir_qr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_qr_etiqueta from commandbutton within w_ficha_crematorio_2
integer x = 1472
integer y = 1936
integer width = 302
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "QR Etiqueta"
end type

event clicked;String		ls_string,ls_nombre,ls_ap_pat,ls_ap_mat,ls_base,ls_serie,ls_dv_fall,ls_cod_otro,ls_descrip,ls_cbb_code,ls_file_cbb,ls_nom_archivo,ls_categoria,&
			ls_dir,ls_tipo_origen,ls_print='S'
Double	ll_numero
Long		ll_folio,ll_rut_fall,ll_hora_ingreso,ll_minuto_ingreso,ll_hora_recep,ll_minuto_recep,ll_cod_dcto,ll_res
date		ldt_fec_def,ldt_fecha_ingreso,ldt_fecha_recep
Blob		lbl_qr

ls_tipo_origen							= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen')
ll_folio									= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'folio_crematorio')
ls_base									= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'base')
ls_serie									= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'serie')
ll_numero								= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'numero')
ll_rut_fall									= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
ls_dv_fall									= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
ls_cod_otro								= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'codigo_otro')
ldt_fec_def								= date(tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion'))
SELECT DISTINCT "CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
INTO 		:ls_descrip  
FROM 	"CUENTA_CONTABLE_OTROS"  
WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_cod_otro   ;

SELECT 	"FC_CARTA_REGISTRO_FALLECIDO"."FECHA_INGRESO_CINERARIO", 	"FC_CARTA_REGISTRO_FALLECIDO"."HORA_INGRESO_CINERARIO", 		"FC_CARTA_REGISTRO_FALLECIDO"."MINUTO_INGRESO_CINERARIO"  
INTO 		:ldt_fecha_ingreso,   																	:ll_hora_ingreso,   																	:ll_minuto_ingreso  
FROM 	"FC_CARTA_REGISTRO_FALLECIDO"  
WHERE 	"FC_CARTA_REGISTRO_FALLECIDO"."FOLIO_CREMATORIO" = :ll_folio
USING	sqlca;

ls_nombre								= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres')
ls_ap_pat								= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno')
ls_ap_mat								= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno')
if ls_tipo_origen='SV' then
	ldt_fecha_recep					= Date(tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion'))
	ll_hora_recep						= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_cineracion')
	ll_minuto_recep					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_cineracion')
else
	ldt_fecha_recep					= Date(tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla'))
	ll_hora_recep						= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_capilla')
	ll_minuto_recep					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minutos_uso_capilla')
end if
ls_categoria								= 'FA'
ll_cod_dcto								= 12
//VALIDAR DATOS A CONCATENAR - AVISO
ls_file_cbb 								= 'C:\mod_cp\consulta\QR_'+string(ll_rut_fall)+'.jpg'		//'C:\BlueLight\Test\QRDEMO_v2.bmp'	
if isnull(ls_nombre) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Nombre Fallecido")
	tab_crematorio.SelectedTab	= 2
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('nombres')
elseif isnull(ls_ap_pat) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Apellido Paterno Fallecido")
	tab_crematorio.SelectedTab	= 2
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_paterno')
elseif isnull(ls_ap_mat) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Apellido Materno Fallecido")
	tab_crematorio.SelectedTab	= 2
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_materno')
elseif isnull(ll_rut_fall) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Rut Fallecido")
	tab_crematorio.SelectedTab	= 2
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('rut_fallecido')
elseif isnull(ls_dv_fall) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Digito Verificador Fallecido")
	tab_crematorio.SelectedTab	= 2
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('dv_fallecido')
elseif isnull(ldt_fec_def) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Fecha Defunción Fallecido")
	tab_crematorio.SelectedTab	= 2
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
elseif isnull(ls_descrip) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Pago")
	tab_crematorio.SelectedTab	= 6
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('codigo_otro')
elseif isnull(ldt_fecha_recep) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Fecha Ingreso Parque")
	if ls_tipo_origen='SV' then
		tab_crematorio.SelectedTab	= 1
		tab_crematorio.tabpage_1.dw_ficha.setfocus()
		tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
	else
		tab_crematorio.SelectedTab	= 8
		tab_crematorio.tabpage_8.dw_cenizas.setfocus()
		tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_uso_capilla')
	end if
elseif isnull(ll_hora_recep) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar Hora Ingreso Parque")
	if ls_tipo_origen='SV' then
		tab_crematorio.SelectedTab	= 1
		tab_crematorio.tabpage_1.dw_ficha.setfocus()
		tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_cineracion')
	else
		tab_crematorio.SelectedTab	= 8
		tab_crematorio.tabpage_8.dw_cenizas.setfocus()
		tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_capilla')
	end if
elseif isnull(ll_minuto_recep) then
	messagebox("Advertencia","Paga Generar QR, debe Ingresar minuto Inreso Parque")
	if ls_tipo_origen='SV' then
		tab_crematorio.SelectedTab	= 1
		tab_crematorio.tabpage_1.dw_ficha.setfocus()
		tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_cineracion')
	else
		tab_crematorio.SelectedTab	= 8
		tab_crematorio.tabpage_8.dw_cenizas.setfocus()
		tab_crematorio.tabpage_8.dw_cenizas.setcolumn('minutos_uso_capilla')
	end if
else
	ls_dir 									= 'C:\mod_cp\consulta\'
	If Not DirectoryExists ( ls_dir ) Then
		CreateDirectory ( ls_dir )
	End If
	ls_cbb_code 						= 'Folio: '+string(ll_folio) +' | '+ 'Nombre Fallecido: '+ls_nombre+' | '+'Apellido Paterno: '+ls_ap_pat+' | '+'Apellido Materno: '+ls_ap_mat+' | '+'Rut Fallecido: '+string(ll_rut_fall)+'-'+ls_dv_fall+' | '+'Fecha Defuncion: '+string(ldt_fec_def)+' | '+'Tipo Servicio: '+ls_descrip+' | '+'Fecha Recepcion: '+string(ldt_fecha_recep)+' | '+'Hora Recepcion: '+string(ll_hora_recep,'00')+':'+string(ll_minuto_recep,'00')
	QRC_FastQRCode(ls_cbb_code, ls_file_cbb)
	ls_nom_archivo						=  'QR_'+string(ll_rut_fall)+'.jpg'
	f_nom_adjuntardoc( 'GUARDAR', 'FICHA',ls_nom_archivo, ls_file_cbb,ls_categoria, ll_cod_dcto, ll_rut_fall,il_folio,'','',0 )
	if dw_etiqueta_qr.retrieve(il_folio) > 0 then
		SELECTBLOB	"FC_ARCHIVO_IMAGEN"."IMAGEN"  
		INTO 			:lbl_qr
		FROM 		"FC_ARCHIVO_IMAGEN"  
		WHERE 		( "FC_ARCHIVO_IMAGEN"."FOLIO_CREMACION" = :il_folio ) AND  
						( "FC_ARCHIVO_IMAGEN"."CATEGORIA" = :ls_categoria ) AND  
						( "FC_ARCHIVO_IMAGEN"."CODIGO_DOCUMENTO" = :ll_cod_dcto ) AND  
						( "FC_ARCHIVO_IMAGEN"."RUT" = :ll_rut_fall )  
		USING	sqlca;
		if sqlca.sqlcode=1 then
			ls_file_cbb 					= ls_dir + 'QR_' + string(ll_rut_fall)+'.jpg'
			f_blobaarchivo( lbl_qr, ls_file_cbb )
			dw_etiqueta_qr.Modify("p_1.Filename='"+ls_file_cbb+"'")
			f_printdlg(dw_etiqueta_qr,gstr_print,w_ficha_crematorio)
			do while ls_print = 'S'
				ll_res						= messagebox("Advertencia","Imprimio Correctamente",Exclamation!,YesNo!,2)
				if ll_res<>1 then
					dw_etiqueta_qr.print()
				else
					FileDelete ( ls_file_cbb )
					ls_print 				= 'N'
				end if
			loop
		else
			ls_dir 				= 'C:\mod_cp\consulta\'
			If Not DirectoryExists ( ls_dir ) Then
				CreateDirectory ( ls_dir )
			End If
			ls_file_cbb 					= ls_dir + 'QR_' + string(ll_rut_fall)+'.jpg'
			dw_etiqueta_qr.Modify("p_1.Filename='"+ls_file_cbb+"'")
			f_printdlg(dw_etiqueta_qr,gstr_print,w_ficha_crematorio)
			do while ls_print = 'S'
				ll_res						= messagebox("Advertencia","Imprimio Correctamente",Exclamation!,YesNo!,2)
				if ll_res<>1 then
					dw_etiqueta_qr.print()
				else
					FileDelete ( ls_file_cbb )
					ls_print 				= 'N'
				end if
			loop
		end if
	
//		if sqlca.sqlcode=0 then
//			ls_file_cbb 					= ls_dir + 'QR_' + string(ll_rut_fall)+'.jpg'
//			f_blobaarchivo( lbl_qr, ls_file_cbb )
//			dw_etiqueta_qr.Modify("p_1.Filename='"+ls_file_cbb+"'")
//			f_printdlg(dw_etiqueta_qr,gstr_print,w_ficha_crematorio)
//			do while ls_print = 'S'
//				ll_res						= messagebox("Advertencia","Imprimio Correctamente",Exclamation!,YesNo!,2)
//				if ll_res<>1 then
//					dw_etiqueta_qr.print()
//				else
//					FileDelete ( ls_file_cbb )
//					ls_print 				= 'N'
//				end if
//			loop
//		end if
	end if
end if

end event

type cb_imprimir_carta from commandbutton within w_ficha_crematorio_2
boolean visible = false
integer x = 2830
integer y = 2352
integer width = 343
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Carta"
end type

event clicked;//String		ls_categoria,ls_string,ls_string_carta
//Long		ll_codigo_doc,ll_folio
//Double	ll_rut
//
//if tab_crematorio.tabpage_6.dw_archivos.rowcount() > 0 then
//	ls_categoria		= tab_crematorio.tabpage_6.dw_archivos.getitemstring(il_row_archivo,'categoria')
//	ll_codigo_doc	= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(il_row_archivo,'codigo_documento')
//	ll_rut				= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(il_row_archivo,'rut_tercero')
//	ll_folio			= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(il_row_archivo,'folio_crematorio')
//	SELECT 	"FC_TIPO_DOCUMENTOS"."NOMBRE_CARTA"  
//	INTO 		:ls_string_carta  
//	FROM 	"FC_TIPO_DOCUMENTOS"  
//	WHERE 	( "FC_TIPO_DOCUMENTOS"."CATEGORIA" = :ls_categoria ) AND  
//				( "FC_TIPO_DOCUMENTOS"."CODIGO_DOCUMENTO" = :ll_codigo_doc )
//	USING	sqlca;
//	if sqlca.sqlcode=0 then
//		if not isnull(ls_string_carta) and ls_string_carta<>'' then
//			if isvalid(w_imprimir_cartas) then close(w_imprimir_cartas)
//			ls_string = ls_string_carta+'~t'+string(ll_folio)+'~t'+string(ll_rut)
//			OpenWithParm(w_imprimir_cartas,ls_string)
//		else
//			messagebox("Advertencia","No Tiene Documento Asociado a Imprimir")
//		end if
//	else
//		messagebox("Advertencia","No Tiene Documento Asociado a Imprimir")
//	end if
//
//end if
////w_imprimir_cartas
end event

type cb_1 from commandbutton within w_ficha_crematorio_2
boolean visible = false
integer x = 2670
integer y = 2052
integer width = 343
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "prueba2"
end type

event clicked;String		ls_string
if isvalid(w_prueba2) then close(w_prueba2)
ls_string        = 'EIE'+'~t'+string(1)
OpenWithParm(w_prueba2,ls_string)

end event

type st_2 from statictext within w_ficha_crematorio_2
integer x = 82
integer y = 20
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Venta"
boolean focusrectangle = false
end type

type ddplb_tipo_venta from dropdownpicturelistbox within w_ficha_crematorio_2
integer x = 69
integer y = 84
integer width = 626
integer height = 352
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string item[] = {"CV - Con Venta","SV - Sin Venta"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2}
long picturemaskcolor = 536870912
end type

event selectionchanged;is_tipo_venta		= mid(this.text,1,2)
if not isnull(is_tipo_venta) then 
	if is_tipo_venta='CV' then
		tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio'
		tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido'
		tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular'
		tab_crematorio.tabpage_7.visible							= true
	elseif is_tipo_venta='SV' then
		tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio_sv'
		tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido_sv'
		tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular_sv'
		tab_crematorio.tabpage_7.visible							= false
	end if
	tab_crematorio.tabpage_1.dw_ficha.settransobject(sqlca)
	tab_crematorio.tabpage_2.dw_fallecido.settransobject(sqlca)
	tab_crematorio.tabpage_3.dw_titular.settransobject(sqlca)
	cb_limpiar.triggerevent(clicked!)
//	tab_crematorio.tabpage_1.dw_ficha.reset()
//	tab_crematorio.tabpage_2.dw_fallecido.reset()
//	tab_crematorio.tabpage_3.dw_titular.reset()
//	tab_crematorio.tabpage_4.dw_prelacion.reset()
//	tab_crematorio.tabpage_5.dw_aranceles.reset()
//	tab_crematorio.tabpage_6.dw_archivos.reset()
//	tab_crematorio.tabpage_7.dw_ceremonia.reset()
//	tab_crematorio.tabpage_8.dw_cenizas.reset()
	if rb_buscar_ctto.checked=true then
		rb_buscar_ctto.triggerevent(clicked!)
	elseif rb_buscar_folio.checked=true then
		rb_buscar_folio.triggerevent(clicked!)
	end if
end if
end event

type cb_crear_prelacion from commandbutton within w_ficha_crematorio_2
boolean visible = false
integer x = 2309
integer y = 2064
integer width = 261
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Crear Doc Asoc"
end type

event clicked;Double		ll_rut_titular,ll_rut_fallecido,ll_numero,ll_folio,ll_rut_pre
String			ls_categoria, ls_obligatorio, ls_si_aplica,ls_base,ls_serie,ls_estado_reg,ls_string
Long			ll_tipo_doc,ll_new,ll_count_pre,ll_indi,ll_count_doc_g,ll_count_doc,ll_fila,ll_fila_doc

if tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 then
	if il_mod_archivo > 0 then
//		ll_tot_reg		= tab_crematorio.tabpage_6.dw_archivos.rowcount()
//		for ll_indi=1 to ll_tot_reg
//			tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'folio_crematorio',ll_max_folio)
//			tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'base',is_base)
//			tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'serie',is_serie)
//			tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'numero',ll_max_contrato)
//		next
		if tab_crematorio.tabpage_6.dw_archivos.update()=1 then
			commit;
		else
			rollback;
		end if
	else
		SELECT sysdate INTO :gdt_fec_sistema FROM Dual;
		ll_rut_titular		= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
		ls_base			= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
		ls_serie			= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
		ll_numero		= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
		ll_folio			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
		ls_estado_reg	= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'estado_reg')
		ll_rut_fallecido	= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
		SELECT 	count("FC_DOCUMENTOS_DETALLE"."BASE") 
		INTO 		:ll_count_doc 
		FROM 	"FC_DOCUMENTOS_DETALLE" 
		WHERE 	"FC_DOCUMENTOS_DETALLE"."FOLIO_CREMATORIO" = :ll_folio   ;
		if ll_count_doc > 0 then
			SELECT 	count("FC_DOCUMENTOS_DETALLE"."BASE") 
			INTO 		:ll_count_doc_g 
			FROM 	"FC_DOCUMENTOS_DETALLE" 
			WHERE 	"FC_DOCUMENTOS_DETALLE"."FOLIO_CREMATORIO" = :ll_folio AND 
						("FC_DOCUMENTOS_DETALLE"."ESTADO_FICHA" = 'G' OR "FC_DOCUMENTOS_DETALLE"."ESTADO_CARGA"='S');
			if ll_count_doc_g > 0 then
		//		messagebox("Advertencia","No es Posible Modificar Lista, existe(n) Archivo(s) Cargado(s)")
			else
				ll_count_doc		= 0
				DELETE FROM "FC_DOCUMENTOS_DETALLE"  
				WHERE 	"FC_DOCUMENTOS_DETALLE"."FOLIO_CREMATORIO" = :ll_folio   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					tab_crematorio.tabpage_6.dw_archivos.reset()
				else
					rollback;
				end if
			end if
		else
			tab_crematorio.tabpage_6.dw_archivos.reset()
		end if
		if ll_count_doc = 0 then
			if ll_rut_titular > 0 and ll_folio > 0 then
				DECLARE x1 CURSOR FOR  
				SELECT 	"FC_VALIDA_DCTOS_ASOC"."CATEGORIA",   
							"FC_VALIDA_DCTOS_ASOC"."TIPO_DOCUMENTO",   
							"FC_VALIDA_DCTOS_ASOC"."OBLIGATORIO",   
							"FC_VALIDA_DCTOS_ASOC"."SI_APLICA"
				FROM 	"FC_VALIDA_DCTOS_ASOC",   "FC_CABECERA"  
				WHERE 	( "FC_VALIDA_DCTOS_ASOC"."TIPO_ORIGEN" = "FC_CABECERA"."TIPO_ORIGEN" ) and  
							( "FC_VALIDA_DCTOS_ASOC"."ORIGEN_CONTRATO" = "FC_CABECERA"."ORIGEN_CONTRATO" ) and  
							( "FC_VALIDA_DCTOS_ASOC"."TIPO_SOLICITUD" = "FC_CABECERA"."TIPO_SOLICITUD_ORIGEN" ) and  
							( ( "FC_VALIDA_DCTOS_ASOC"."DESCRIP_PARENTESCO" = 'titular' ) AND  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio ) )   
				ORDER BY 	"FC_VALIDA_DCTOS_ASOC"."CATEGORIA" ASC,   
								"FC_VALIDA_DCTOS_ASOC"."TIPO_DOCUMENTO" ASC  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					open x1;
					DO WHILE sqlca.sqlcode=0
						fetch x1 into :ls_categoria, :ll_tipo_doc, :ls_obligatorio, :ls_si_aplica ;
						if not isnull(ls_categoria) and ll_tipo_doc>0 then
							ll_new		= tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'categoria',ls_categoria)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'codigo_documento',ll_tipo_doc)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'rut_tercero',ll_rut_titular)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_carga','N')
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'usuario_crea',gs_user)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'folio_crematorio',ll_folio)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'base',ls_base)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'serie',ls_serie)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'numero',ll_numero)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_reg','A')
		//					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'fecha_sistema',gdt_fec_sistema)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_ficha',ls_estado_reg)
							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'autoriza_seremi','N')
						end if
						setnull(ls_categoria);setnull(ll_tipo_doc)
					LOOP
					tab_crematorio.tabpage_6.dw_archivos.accepttext()
					close x1;
				end if
				
				if ll_rut_fallecido > 0 and ll_folio > 0 then
					DECLARE x2 CURSOR FOR  
					SELECT 	"FC_VALIDA_DCTOS_ASOC"."CATEGORIA",   
								"FC_VALIDA_DCTOS_ASOC"."TIPO_DOCUMENTO",   
								"FC_VALIDA_DCTOS_ASOC"."OBLIGATORIO",   
								"FC_VALIDA_DCTOS_ASOC"."SI_APLICA"
					FROM 	"FC_VALIDA_DCTOS_ASOC",   "FC_CABECERA"  
					WHERE 	( "FC_VALIDA_DCTOS_ASOC"."TIPO_ORIGEN" = "FC_CABECERA"."TIPO_ORIGEN" ) and  
								( "FC_VALIDA_DCTOS_ASOC"."ORIGEN_CONTRATO" = "FC_CABECERA"."ORIGEN_CONTRATO" ) and  
								( "FC_VALIDA_DCTOS_ASOC"."TIPO_SOLICITUD" = "FC_CABECERA"."TIPO_SOLICITUD_ORIGEN" ) and  
								( ( "FC_VALIDA_DCTOS_ASOC"."DESCRIP_PARENTESCO" = 'fallecido' ) AND  
								( "FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio ) )   
					ORDER BY 	"FC_VALIDA_DCTOS_ASOC"."CATEGORIA" ASC,   
									"FC_VALIDA_DCTOS_ASOC"."TIPO_DOCUMENTO" ASC  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						open x2;
						DO WHILE sqlca.sqlcode=0
							fetch x2 into :ls_categoria, :ll_tipo_doc, :ls_obligatorio, :ls_si_aplica ;
							if not isnull(ls_categoria) and ll_tipo_doc>0 then
								ls_string		= "categoria='"+ls_categoria+"' and codigo_documento= "+string(ll_tipo_doc)+" and rut_tercero="+string(ll_rut_fallecido)+ " and estado_reg='A'"
								ll_fila_doc	= tab_crematorio.tabpage_6.dw_archivos.Find( ls_string, 1, tab_crematorio.tabpage_6.dw_archivos.RowCount())
								if ll_fila_doc = 0 then
									ll_new		= tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'categoria',ls_categoria)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'codigo_documento',ll_tipo_doc)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'rut_tercero',ll_rut_fallecido)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_carga','N')
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'usuario_crea',gs_user)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'folio_crematorio',ll_folio)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'base',ls_base)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'serie',ls_serie)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'numero',ll_numero)
		//							tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'fecha_sistema',gdt_fec_sistema)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_reg','A')
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_ficha',ls_estado_reg)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'autoriza_seremi','N')
								end if
							end if
							setnull(ls_categoria);setnull(ll_tipo_doc)
						LOOP
						tab_crematorio.tabpage_6.dw_archivos.accepttext()
						close x2;
					end if
				end if
				ll_count_pre			= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
				if ll_count_pre > 0 then
					for ll_indi=1 to ll_count_pre
						ll_rut_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'rut')
						ll_fila	 		= tab_crematorio.tabpage_6.dw_archivos.Find("rut_tercero = "+string(ll_rut_pre), 1, tab_crematorio.tabpage_6.dw_archivos.rowcount())
						if ll_fila > 0 then
			//				messagebox("Advertencia","Ya Existe Rut "+string(ll_rut_pre) + " En Lista de Documentos")
						else
							if ll_rut_pre > 0 and ll_folio > 0 then
								DECLARE x3 CURSOR FOR  
								SELECT 		"FC_VALIDA_DCTOS_ASOC"."CATEGORIA",   
												"FC_VALIDA_DCTOS_ASOC"."TIPO_DOCUMENTO" ,
												"FC_VALIDA_DCTOS_ASOC"."OBLIGATORIO",   
												"FC_VALIDA_DCTOS_ASOC"."SI_APLICA"
								FROM 		"FC_CABECERA",   "FC_PRELACION",		"FC_VALIDA_DCTOS_ASOC"  
								WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_PRELACION"."FOLIO_CREMATORIO" ) and  
											( "FC_CABECERA"."TIPO_ORIGEN" = "FC_VALIDA_DCTOS_ASOC"."TIPO_ORIGEN" ) and  
											( "FC_CABECERA"."TIPO_SOLICITUD_ORIGEN" = "FC_VALIDA_DCTOS_ASOC"."TIPO_SOLICITUD" ) and  
											( "FC_CABECERA"."ORIGEN_CONTRATO" = "FC_VALIDA_DCTOS_ASOC"."ORIGEN_CONTRATO" ) and  
											( "FC_PRELACION"."PARENTESCO" = "FC_VALIDA_DCTOS_ASOC"."CODIGO_PARENTESCO" ) and  
											( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio ) )  
								ORDER BY 	"FC_VALIDA_DCTOS_ASOC"."CATEGORIA" ASC,   
												"FC_VALIDA_DCTOS_ASOC"."TIPO_DOCUMENTO" ASC  
								USING	sqlca;
								if sqlca.sqlcode=0 then
									open x3;
									DO WHILE sqlca.sqlcode=0
										fetch x3 into :ls_categoria, :ll_tipo_doc, :ls_obligatorio, :ls_si_aplica ;
										if not isnull(ls_categoria) and ll_tipo_doc>0 then
											ls_string		= "categoria='"+ls_categoria+"' and codigo_documento= "+string(ll_tipo_doc)+" and rut_tercero="+string(ll_rut_pre)+ " and estado_reg='A'"
											ll_fila_doc	= tab_crematorio.tabpage_6.dw_archivos.Find( ls_string, 1, tab_crematorio.tabpage_6.dw_archivos.RowCount())
											if ll_fila_doc = 0 then
												ll_new		= tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'categoria',ls_categoria)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'codigo_documento',ll_tipo_doc)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'rut_tercero',ll_rut_pre)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_carga','N')
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'usuario_crea',gs_user)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'folio_crematorio',ll_folio)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'base',ls_base)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'serie',ls_serie)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'numero',ll_numero)
		//										tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'fecha_sistema',gdt_fec_sistema)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_reg','A')
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_ficha',ls_estado_reg)
												tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'autoriza_seremi','N')
											end if
										end if
										setnull(ls_categoria);setnull(ll_tipo_doc)
									LOOP
									tab_crematorio.tabpage_6.dw_archivos.accepttext()
									close x3;
								end if
							end if
						end if
					next
				end if
			end if
		end if
		tab_crematorio.tabpage_6.dw_archivos.SORT()
	end if
else
	DELETE FROM "FC_DOCUMENTOS_DETALLE"  
	WHERE 	"FC_DOCUMENTOS_DETALLE"."FOLIO_CREMATORIO" = :ll_folio   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
		tab_crematorio.tabpage_6.dw_archivos.reset()
	else
		rollback;
	end if
end if
end event

type dw_print from datawindow within w_ficha_crematorio_2
boolean visible = false
integer x = 2331
integer y = 2112
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_imprimir_ficha_cremacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_ficha_crematorio_2
integer x = 974
integer y = 1936
integer width = 233
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;//Long		ll_folio_fc
//
//ll_folio_fc		= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
//if ll_folio_fc > 0 then
//	if dw_print.retrieve(ll_folio_fc) > 0 then
//		f_printdlg(dw_print,gstr_print,w_ficha_crematorio)
//	else
//		messagebox("Advertencia","Debe Grabar Antes de Imprimir Ficha")
//	end if
//end if


Long 		ll_folio_fc
String		ls_tiene_marcapasos

ll_folio_fc 	= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
if ll_folio_fc > 0 then
	if dw_print.retrieve(ll_folio_fc) > 0 then
//		ls_tiene_marcapasos = dw_print.getItemString(1,'fc_carta_declaracion_marcapaso_sw_tiene_marcapaso')
//		if isNull(ls_tiene_marcapasos) then
//			dw_print.setItem(1,'fc_carta_declaracion_marcapaso_sw_tiene_marcapaso','N')
//			dw_print.acceptText()
//		end if
		f_printdlg(dw_print,gstr_print,w_ficha_crematorio)
	else
		messagebox("Advertencia","Debe Grabar Antes de Imprimir Ficha")
	end if
end if


end event

type sle_1 from uo_convierte_numero within w_ficha_crematorio_2
boolean visible = false
integer x = 3054
integer y = 2176
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type cb_inactivar from commandbutton within w_ficha_crematorio_2
integer x = 690
integer y = 1936
integer width = 238
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Inactivar"
end type

event clicked;Long		ll_folio,ll_res,ll_tot_reg,ll_indi,ll_sw_ficha,ll_sw_fallecido,ll_sw_titular,ll_sw_prelacion,ll_sw_arancel,ll_sw_archivo,ll_sw_ceremonia,ll_sw_cenizas
String		ls_estado_reg

ll_sw_ficha=0;ll_sw_fallecido=0;ll_sw_titular=0;ll_sw_prelacion=0;ll_sw_arancel=0;ll_sw_archivo=0;ll_sw_ceremonia=0;ll_sw_cenizas=0
ll_folio				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
if ll_folio > 0 then
	ls_estado_reg	= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'estado_reg')
	if ls_estado_reg='P' then
		ll_res			= messagebox("Advertencia","Está seguro Inactivar Ficha N° "+string(ll_folio,'###,###,###,##0'),Exclamation!,YesNo!,2)
		if ll_res=1 then
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_reg','A')
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_inactivacion',gdt_fec_sistema)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'usuario_inactiva',gs_user)
			
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_reg','A')
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'estado_reg','A')
			
			ll_tot_reg		= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_reg','I')
				next
			end if

			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'estado_reg','A')
			
			ll_tot_reg		= tab_crematorio.tabpage_6.dw_archivos.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'estado_reg','I')
				next
			end if
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'estado_reg','A')
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'estado_reg','A')
		end if
		if tab_crematorio.tabpage_1.dw_ficha.update() = 1 then ll_sw_ficha ++
		if tab_crematorio.tabpage_2.dw_fallecido.update() = 1 then ll_sw_fallecido ++
		if tab_crematorio.tabpage_3.dw_titular.update() = 1 then ll_sw_titular ++
		if tab_crematorio.tabpage_4.dw_prelacion.update() = 1 then ll_sw_prelacion ++
		if tab_crematorio.tabpage_5.dw_aranceles.update() = 1 then ll_sw_arancel ++
		if tab_crematorio.tabpage_6.dw_archivos.update() = 1 then ll_sw_archivo ++
		if tab_crematorio.tabpage_7.dw_ceremonia.update() = 1 then ll_sw_ceremonia ++
		if tab_crematorio.tabpage_8.dw_cenizas.update() = 1 then ll_sw_cenizas ++
		if ll_sw_ficha>0 and ll_sw_fallecido>0 and ll_sw_titular>0 and ll_sw_prelacion>0 and ll_sw_arancel>0 and ll_sw_archivo>0 and ll_sw_ceremonia > 0 and ll_sw_cenizas > 0 then
			commit;
			messagebox("Inactivar","Inactivación Exitosa")
		else
			rollback;
			messagebox("Error al Inactivar","Error al Inactivar SQL "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","Solo es posible Inactivar Ficha Crematorio en Estado ACTIVO")
	end if
end if

end event

type cb_nuevo from commandbutton within w_ficha_crematorio_2
integer x = 32
integer y = 1936
integer width = 215
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new_ficha,ll_new_fallecido,ll_new_titular,ll_new_aranceles,ll_new_ceremonia,ll_new_cenizas,ll_count_admin

is_base				= 'G'
is_serie				= 'I'
il_count_titular		= 0
tab_crematorio.tabpage_1.dw_ficha.reset()
tab_crematorio.tabpage_2.dw_fallecido.reset()
tab_crematorio.tabpage_3.dw_titular.reset()
tab_crematorio.tabpage_4.dw_prelacion.reset()
tab_crematorio.tabpage_5.dw_aranceles.reset()
tab_crematorio.tabpage_6.dw_archivos.reset()
tab_crematorio.tabpage_7.dw_ceremonia.reset()
tab_crematorio.tabpage_8.dw_cenizas.reset()
ll_new_ficha			= tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'nuevo','S')
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_pago','N')
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'sw_pregrabar',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'cod_parque_destino',142)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'usuario_crea',gs_user)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_reg','P')
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'fecha_crea',gdt_fec_sistema)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_gestion',0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'hora_cineracion',0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'minuto_cineracion',0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'tipo_origen',is_tipo_venta)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'sw_covid_19',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'sw_protocolo_covid',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'autoriza_admin_agenda','N')
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'hora_ingreso_cinerario',0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'minuto_ingreso_cinerario',0)
SELECT 	Count("FC_RESPONSABLE_PARQUE"."USUARIO")  
INTO 		:ll_count_admin  
FROM 	"FC_RESPONSABLE_PARQUE"  
WHERE 	"FC_RESPONSABLE_PARQUE"."USUARIO" = :gs_user   ;
if ll_count_admin > 0 then
	tab_crematorio.tabpage_1.dw_ficha.object.autoriza_admin_agenda.protect		= 0
else
	tab_crematorio.tabpage_1.dw_ficha.object.autoriza_admin_agenda.protect		= 1
end if
idw_detalle2.retrieve(is_tipo_venta)
idw_detalle3.retrieve(is_tipo_venta)
idw_detalle4.insertrow(0)
idw_detalle12.insertrow(0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'solicitud_cineracion_seremi',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'prelacion',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'documentos',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'recepcion_cuerpo',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'recepcion_servicio',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'agenda_visualizacion',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'agenda_entrega_ceniza',1)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'cierre_ficha_creamacion',1)

ll_new_fallecido			= tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
tab_crematorio.tabpage_2.dw_fallecido.setitem(ll_new_fallecido,'nuevo','S')
tab_crematorio.tabpage_2.dw_fallecido.setitem(ll_new_fallecido,'estado_reg','P')
tab_crematorio.tabpage_2.dw_fallecido.setitem(ll_new_fallecido,'hora_defuncion',0)
tab_crematorio.tabpage_2.dw_fallecido.setitem(ll_new_fallecido,'minuto_defuncion',0)
tab_crematorio.tabpage_2.dw_fallecido.setitem(ll_new_fallecido,'nacionalidad',45)

ll_new_titular				= tab_crematorio.tabpage_3.dw_titular.insertrow(0)
tab_crematorio.tabpage_3.dw_titular.setitem(ll_new_titular,'nuevo','S')
tab_crematorio.tabpage_3.dw_titular.setitem(ll_new_titular,'estado_reg','P')
//tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
ll_new_aranceles			= tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
tab_crematorio.tabpage_5.dw_aranceles.setitem(ll_new_aranceles,'nuevo','S')
tab_crematorio.tabpage_5.dw_aranceles.setitem(ll_new_aranceles,'estado_reg','P')

ll_new_ceremonia			= tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'nuevo','S')
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'estado_reg','P')
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'sw_orador',1)
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'sw1',1)

ll_new_cenizas				= tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
if is_tipo_venta='SV' then
	tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'rut_responsable',0)
	tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'dv_responsable','0')
	tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'destino_cuerpo',3)
	tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'sw_ingreso_parque','S')
	tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'destino_cuerpo',3)
	tab_crematorio.tabpage_5.dw_aranceles.setitem(ll_new_aranceles,'codigo_otro','350')
elseif is_tipo_venta='CV' then
	tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'rut_responsable',0)
	tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'dv_responsable','0')
//	tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'sw_ingreso_parque','N')
end if
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'nuevo','S')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'estado_reg','P')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'visualizar_servicio','N')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'sw_participa_cremacion','N')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'hora_retiro_ceniza',0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'minuto_retiro_ceniza',0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'hora_uso_capilla',0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'minutos_uso_capilla',0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'hora_uso_pergola',0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'minuto_uso_pergola',0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'uso_capilla','N')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'uso_pergola','N')

tab_crematorio.tabpage_1.dw_ficha.enabled		= true
tab_crematorio.tabpage_2.dw_fallecido.enabled	= true
tab_crematorio.tabpage_3.dw_titular.enabled		= true
tab_crematorio.tabpage_4.dw_prelacion.enabled	= true
tab_crematorio.tabpage_5.dw_aranceles.enabled	= true
tab_crematorio.tabpage_6.dw_archivos.enabled	= true
tab_crematorio.tabpage_7.dw_ceremonia.enabled= true
tab_crematorio.tabpage_8.dw_cenizas.enabled	= true

tab_crematorio.tabpage_1.dw_ficha.accepttext()
tab_crematorio.tabpage_2.dw_fallecido.accepttext()
tab_crematorio.tabpage_3.dw_titular.accepttext()
tab_crematorio.tabpage_4.dw_prelacion.accepttext()
tab_crematorio.tabpage_5.dw_aranceles.accepttext()
tab_crematorio.tabpage_6.dw_archivos.accepttext()
tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
tab_crematorio.tabpage_8.dw_cenizas.accepttext()
tab_crematorio.SelectedTab	= 1
tab_crematorio.tabpage_1.dw_ficha.setfocus()
tab_crematorio.tabpage_1.dw_ficha.setcolumn('rut_titular')
cb_nuevo.enabled					= false
end event

type cb_limpiar from commandbutton within w_ficha_crematorio_2
integer x = 1211
integer y = 1936
integer width = 215
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_new

tab_crematorio.tabpage_1.dw_ficha.reset()
tab_crematorio.tabpage_2.dw_fallecido.reset()
tab_crematorio.tabpage_3.dw_titular.reset()
tab_crematorio.tabpage_4.dw_prelacion.reset()
tab_crematorio.tabpage_5.dw_aranceles.reset()
tab_crematorio.tabpage_6.dw_archivos.reset()
tab_crematorio.tabpage_7.dw_ceremonia.reset()
tab_crematorio.tabpage_8.dw_cenizas.reset()
tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve(is_tipo_venta)=0 then
	idw_detalle2.insertrow(0)
end if

tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(is_tipo_venta)=0 then
	idw_detalle3.insertrow(0)
end if

tab_crematorio.tabpage_2.dw_fallecido.getchild('rut_fallecido',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.insertrow(0)

tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
idw_detalle12.settransobject(sqlca)
idw_detalle12.insertrow(0)

tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
idw_detalle13.settransobject(sqlca)
idw_detalle13.insertrow(0)

tab_crematorio.tabpage_1.dw_ficha.getchild('rut_fallecido',idw_detalle14)
idw_detalle14.settransobject(sqlca)
idw_detalle14.insertrow(0)

tab_crematorio.tabpage_6.dw_archivos.getchild('codigo_documento',idw_detalle15)
idw_detalle15.settransobject(sqlca)
//if idw_detalle15.retrieve('PR')=0 then idw_detalle15.insertrow(0)
if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
tab_crematorio.tabpage_6.dw_archivos.getchild('rut_tercero',idw_detalle16)
idw_detalle16.settransobject(sqlca)
idw_detalle16.insertrow(0)

idw_detalle.retrieve(is_base)
idw_detalle2.retrieve(is_tipo_venta)
idw_detalle3.retrieve(is_tipo_venta)
idw_detalle4.insertrow(0)
idw_detalle12.insertrow(0)
idw_detalle13.insertrow(0)
idw_detalle14.insertrow(0)
//idw_detalle15.retrieve('PR')
idw_detalle15.retrieve()
idw_detalle16.reset()
idw_detalle16.insertrow(0)
tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
tab_crematorio.tabpage_3.dw_titular.insertrow(0)
tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
if rb_buscar_ctto.checked=true then
	dw_ctto.reset()
	ll_new				= dw_ctto.insertrow(0)
	dw_ctto.enabled	= true
	em_folio.text		= ''
	em_folio.enabled	= false
	dw_ctto.setfocus()
elseif rb_buscar_folio.checked=true then
	dw_ctto.reset()
	ll_new				= dw_ctto.insertrow(0)
	dw_ctto.enabled	= false
	em_folio.text		= ''
	em_folio.enabled	= true
	em_folio.setfocus()
end if
tab_crematorio.tabpage_1.dw_ficha.enabled			= false
tab_crematorio.tabpage_2.dw_fallecido.enabled		= false
tab_crematorio.tabpage_3.dw_titular.enabled			= false
tab_crematorio.tabpage_4.dw_prelacion.enabled		= false
tab_crematorio.tabpage_5.dw_aranceles.enabled		= false
tab_crematorio.tabpage_6.dw_archivos.enabled		= false
tab_crematorio.tabpage_7.dw_ceremonia.enabled	= false
tab_crematorio.tabpage_8.dw_cenizas.enabled		= false
cb_nuevo.enabled												= true
end event

type em_folio from editmask within w_ficha_crematorio_2
integer x = 2501
integer y = 88
integer width = 512
integer height = 80
integer taborder = 50
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

event modified;Long		ll_folio,ll_new

ll_folio	= long(this.text)
if ll_folio > 0 then
	tab_crematorio.tabpage_1.dw_ficha.reset()
	tab_crematorio.tabpage_2.dw_fallecido.reset()
	tab_crematorio.tabpage_3.dw_titular.reset()
	tab_crematorio.tabpage_4.dw_prelacion.reset()
	tab_crematorio.tabpage_5.dw_aranceles.reset()
	tab_crematorio.tabpage_6.dw_archivos.reset()
	tab_crematorio.tabpage_7.dw_ceremonia.reset()
	tab_crematorio.tabpage_8.dw_cenizas.reset()
	tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(is_tipo_venta)=0 then
		idw_detalle2.insertrow(0)
	end if
	
	tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(is_tipo_venta)=0 then
		idw_detalle3.insertrow(0)
	end if
	
	tab_crematorio.tabpage_2.dw_fallecido.getchild('rut_fallecido',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.insertrow(0)
	
	tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
	idw_detalle12.settransobject(sqlca)
	idw_detalle12.insertrow(0)
	
	tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
	idw_detalle13.settransobject(sqlca)
	idw_detalle13.insertrow(0)
	
	tab_crematorio.tabpage_1.dw_ficha.getchild('rut_fallecido',idw_detalle14)
	idw_detalle14.settransobject(sqlca)
	idw_detalle14.insertrow(0)
	
	tab_crematorio.tabpage_6.dw_archivos.getchild('codigo_documento',idw_detalle15)
	idw_detalle15.settransobject(sqlca)
	//if idw_detalle15.retrieve('PR')=0 then idw_detalle15.insertrow(0)
	if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
	tab_crematorio.tabpage_6.dw_archivos.getchild('rut_tercero',idw_detalle16)
	idw_detalle16.settransobject(sqlca)
	idw_detalle16.insertrow(0)
	
	idw_detalle.retrieve(is_base)
	idw_detalle2.retrieve(is_tipo_venta)
	idw_detalle3.retrieve(is_tipo_venta)
	idw_detalle4.insertrow(0)
	idw_detalle12.insertrow(0)
	idw_detalle13.insertrow(0)
	idw_detalle14.insertrow(0)
	idw_detalle15.retrieve()
	idw_detalle16.reset()
	idw_detalle16.insertrow(0)
	tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
	tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
	tab_crematorio.tabpage_3.dw_titular.insertrow(0)
	tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
	tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
	tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
	tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
	tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
	tab_crematorio.tabpage_1.dw_ficha.enabled			= false
	tab_crematorio.tabpage_2.dw_fallecido.enabled		= false
	tab_crematorio.tabpage_3.dw_titular.enabled			= false
	tab_crematorio.tabpage_4.dw_prelacion.enabled		= false
	tab_crematorio.tabpage_5.dw_aranceles.enabled		= false
	tab_crematorio.tabpage_6.dw_archivos.enabled		= false
	tab_crematorio.tabpage_7.dw_ceremonia.enabled	= false
	tab_crematorio.tabpage_8.dw_cenizas.enabled		= false
	cb_nuevo.enabled												= true
	pb_aceptar.triggerevent(clicked!)
end if
end event

event losefocus;pb_aceptar.setfocus()
end event

type st_1 from statictext within w_ficha_crematorio_2
integer x = 2258
integer y = 96
integer width = 215
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Ficha"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_buscar_folio from radiobutton within w_ficha_crematorio_2
integer x = 2240
integer y = 8
integer width = 503
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Folio Ficha"
end type

event clicked;if rb_buscar_folio.checked=true then
	Long		ll_new
	dw_ctto.reset()
	idw_detalle.retrieve(is_base)
	ll_new				= dw_ctto.insertrow(0)
	dw_ctto.enabled	= false
	em_folio.text		= ''
	em_folio.enabled	= true
	cb_limpiar.triggerevent(clicked!)
	//tab_crematorio.tabpage_1.dw_ficha.reset()
	//tab_crematorio.tabpage_2.dw_fallecido.reset()
	//tab_crematorio.tabpage_3.dw_titular.reset()
	//tab_crematorio.tabpage_4.dw_prelacion.reset()
	//tab_crematorio.tabpage_5.dw_aranceles.reset()
	//tab_crematorio.tabpage_6.dw_archivos.reset()
	//tab_crematorio.tabpage_7.dw_ceremonia.reset()
	//tab_crematorio.tabpage_8.dw_cenizas.reset()
	em_folio.setfocus()
end if
end event

type rb_buscar_ctto from radiobutton within w_ficha_crematorio_2
integer x = 777
integer y = 8
integer width = 521
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bucar por Contrato"
boolean checked = true
end type

event clicked;Long		ll_new
dw_ctto.reset()
idw_detalle.retrieve(is_base)
ll_new				= dw_ctto.insertrow(0)
dw_ctto.enabled	= true
em_folio.text		= ''
em_folio.enabled	= false
cb_limpiar.triggerevent(clicked!)
//tab_crematorio.tabpage_1.dw_ficha.reset()
//tab_crematorio.tabpage_2.dw_fallecido.reset()
//tab_crematorio.tabpage_3.dw_titular.reset()
//tab_crematorio.tabpage_4.dw_prelacion.reset()
//tab_crematorio.tabpage_5.dw_aranceles.reset()
//tab_crematorio.tabpage_6.dw_archivos.reset()
//tab_crematorio.tabpage_7.dw_ceremonia.reset()
//tab_crematorio.tabpage_8.dw_cenizas.reset()
dw_ctto.setfocus()
end event

type cb_buscar from commandbutton within w_ficha_crematorio_2
integer x = 471
integer y = 1936
integer width = 215
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;if isvalid(w_buscar_ficha_crematorio) then close(w_buscar_ficha_crematorio)
open(w_buscar_ficha_crematorio)
end event

type pb_aceptar from picturebutton within w_ficha_crematorio_2
integer x = 3095
integer y = 40
integer width = 169
integer height = 152
integer taborder = 60
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

event clicked;Long		ll_folio, ll_numero,ll_count_fc,ll_rut,ll_count_ag
String		ls_base,ls_serie,ls_ciudad,ls_tipo_solicitud_origen,ls_ciu_fall
Datetime	ldt_nulo

Setnull(ldt_nulo)
is_ag_crem				= 'N'
is_ag_capi				= 'N'
is_ag_pergo				= 'N'
is_ag_ing				= 'N'
il_sw_rut_fall			= 0
il_grabar					= 0
il_carga_archivo		= 0
if rb_buscar_folio.checked=true then
	ll_folio				= Long(em_folio.text)
	il_folio				= ll_folio
	SELECT 	"FC_CABECERA"."TIPO_ORIGEN",	"FC_CABECERA"."RUT_TITULAR",	COUNT("FC_CABECERA"."BASE") 	 
	INTO 		:is_tipo_venta,							:ll_rut,									:ll_count_fc 							
	FROM 	"FC_CABECERA"  
	WHERE 	"FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio 
	GROUP BY	"FC_CABECERA"."TIPO_ORIGEN",
					"FC_CABECERA"."RUT_TITULAR";
	if ll_count_fc > 0 then
		if is_tipo_venta='CV' then
			w_ficha_crematorio.ddplb_tipo_venta.text	= 'CV - Con Venta'
			tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio'
			tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido'
			tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular'
			tab_crematorio.tabpage_7.visible							= true
		elseif is_tipo_venta='SV' then
			w_ficha_crematorio.ddplb_tipo_venta.text	= 'SV - Sin Venta'
			tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio_sv'
			tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido_sv'
			tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular_sv'
			tab_crematorio.tabpage_7.visible							= false
		end if
		tab_crematorio.tabpage_1.dw_ficha.settransobject(sqlca)
		tab_crematorio.tabpage_2.dw_fallecido.settransobject(sqlca)
		tab_crematorio.tabpage_3.dw_titular.settransobject(sqlca)
		tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(is_tipo_venta)=0 then
			idw_detalle2.insertrow(0)
		end if
		
		tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
		idw_detalle3.settransobject(sqlca)
		if idw_detalle3.retrieve(is_tipo_venta)=0 then
			idw_detalle3.insertrow(0)
		end if
		
		tab_crematorio.tabpage_2.dw_fallecido.getchild('rut_fallecido',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		idw_detalle4.insertrow(0)
		
		tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
		idw_detalle12.settransobject(sqlca)
		idw_detalle12.insertrow(0)
		
		tab_crematorio.tabpage_1.dw_ficha.getchild('rut_fallecido',idw_detalle14)
		idw_detalle14.settransobject(sqlca)
		idw_detalle14.insertrow(0)
		if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
		if tab_crematorio.tabpage_1.dw_ficha.retrieve(ll_folio)=0 then
			if idw_detalle2.retrieve(is_tipo_venta)=0 then idw_detalle2.insertrow(0)
			if idw_detalle3.retrieve(is_tipo_venta)=0 then idw_detalle3.insertrow(0)
			idw_detalle14.reset()
			idw_detalle14.insertrow(0)
			tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
			tab_crematorio.tabpage_1.dw_ficha.enabled		= false
			tab_crematorio.tabpage_2.dw_fallecido.enabled	= false
			tab_crematorio.tabpage_3.dw_titular.enabled		= false
			tab_crematorio.tabpage_4.dw_prelacion.enabled	= false
			tab_crematorio.tabpage_5.dw_aranceles.enabled	= false
			tab_crematorio.tabpage_6.dw_archivos.enabled	= false
			tab_crematorio.tabpage_7.dw_ceremonia.enabled= false
			tab_crematorio.tabpage_8.dw_cenizas.enabled	= false
		else
			is_base														= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
			is_serie														= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
			il_numero													= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
			is_tipo_venta												= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen')
			ll_rut															= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
			ls_tipo_solicitud_origen									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
			if is_tipo_venta='CV' then
				if ls_tipo_solicitud_origen='VE' then
					cb_ficga_traslado.enabled						= true
				else
					cb_ficga_traslado.enabled						= false
				end if
			end if
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'nuevo','N')
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
			tab_crematorio.tabpage_1.dw_ficha.enabled		= true
			tab_crematorio.tabpage_2.dw_fallecido.enabled	= true
			tab_crematorio.tabpage_3.dw_titular.enabled		= true
			tab_crematorio.tabpage_4.dw_prelacion.enabled	= true
			tab_crematorio.tabpage_5.dw_aranceles.enabled	= true
			tab_crematorio.tabpage_6.dw_archivos.enabled	= true
			tab_crematorio.tabpage_7.dw_ceremonia.enabled= true
			tab_crematorio.tabpage_8.dw_cenizas.enabled	= true
			
			SELECT 	COUNT("FC_AGENDA_CREMATORIO"."NOMBRE_FALLECIDO")	 
			INTO 		:ll_count_ag  
			FROM 	"FC_AGENDA_CREMATORIO"  
			WHERE ( "FC_AGENDA_CREMATORIO"."FOLIO_CREMATORIO" = :ll_folio ) AND  
					   ( "FC_AGENDA_CREMATORIO"."ESTADO_REG" = 'P' )   ;
			if ll_count_ag > 0 then
				is_ag_crem																							= 'S'
				tab_crematorio.tabpage_1.dw_ficha.object.t_10.font.italic 								= 1
				tab_crematorio.tabpage_1.dw_ficha.object.fecha_ingreso_cinerario.font.italic		= 1
				tab_crematorio.tabpage_1.dw_ficha.object.t_11.font.italic								= 1
				tab_crematorio.tabpage_1.dw_ficha.object.hora_ingreso_cinerario.font.italic		= 1
				tab_crematorio.tabpage_1.dw_ficha.object.minuto_ingreso_cinerario.font.italic	= 1
			else
				tab_crematorio.tabpage_1.dw_ficha.object.t_10.font.italic 								= 0
				tab_crematorio.tabpage_1.dw_ficha.object.fecha_ingreso_cinerario.font.italic		= 0
				tab_crematorio.tabpage_1.dw_ficha.object.t_11.font.italic								= 0
				tab_crematorio.tabpage_1.dw_ficha.object.hora_ingreso_cinerario.font.italic		= 0
				tab_crematorio.tabpage_1.dw_ficha.object.minuto_ingreso_cinerario.font.italic	= 0
			end if	
			
			SELECT 	COUNT("FC_AGENDA_CAPILLA"."NOMBRE_FALLECIDO")	 
			INTO 		:ll_count_ag  
			FROM 	"FC_AGENDA_CAPILLA"  
			WHERE ( "FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :ll_folio ) AND  
					   ( "FC_AGENDA_CAPILLA"."ESTADO_REG" = 'P' ) ;
			if ll_count_ag > 0 then
				is_ag_capi																							= 'S'
				tab_crematorio.tabpage_8.dw_cenizas.object.t_12.font.italic 							= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.t_13.font.italic							= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.font.italic			= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.t_14.font.italic							= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.font.italic			= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.font.italic		= 1
			else
				tab_crematorio.tabpage_8.dw_cenizas.object.t_12.font.italic 							= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.t_13.font.italic							= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.font.italic			= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.t_14.font.italic							= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.font.italic			= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.font.italic		= 0
			end if
			
			SELECT 	COUNT("FC_AGENDA_PERGOLA"."NOMBRE_FALLECIDO")	 
			INTO 		:ll_count_ag  
			FROM 	"FC_AGENDA_PERGOLA"  
			WHERE ( "FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :ll_folio ) AND  
					   ( "FC_AGENDA_PERGOLA"."ESTADO_REG" = 'P' )   ;
			if ll_count_ag > 0 then
				is_ag_pergo																							= 'S'
				tab_crematorio.tabpage_8.dw_cenizas.object.t_17.font.italic 							= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.t_18.font.italic							= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.font.italic			= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.t_19.font.italic							= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.font.italic			= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.font.italic		= 1
			else
				tab_crematorio.tabpage_8.dw_cenizas.object.t_17.font.italic 							= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.t_18.font.italic							= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.font.italic			= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.t_19.font.italic							= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.font.italic			= 0
				tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.font.italic		= 0
			end if
			
			SELECT 	COUNT("FC_AGENDA_ING_PARQUE"."NOMBRE_FALLECIDO")	 
			INTO 		:ll_count_ag  
			FROM 	"FC_AGENDA_ING_PARQUE"  
			WHERE ( "FC_AGENDA_ING_PARQUE"."FOLIO_CREMATORIO" = :ll_folio ) AND  
					   ( "FC_AGENDA_ING_PARQUE"."ESTADO_REG" = 'P' ) 	;
			if ll_count_ag > 0 then
				is_ag_ing																							= 'S'
				tab_crematorio.tabpage_1.dw_ficha.object.t_6.font.italic 								= 1
				tab_crematorio.tabpage_1.dw_ficha.object.fecha_cineracion.font.italic				= 1
				tab_crematorio.tabpage_1.dw_ficha.object.t_7.font.italic									= 1
				tab_crematorio.tabpage_1.dw_ficha.object.hora_cineracion.font.italic				= 1
				tab_crematorio.tabpage_1.dw_ficha.object.minuto_cineracion.font.italic				= 1
			else
				tab_crematorio.tabpage_1.dw_ficha.object.t_6.font.italic 								= 0
				tab_crematorio.tabpage_1.dw_ficha.object.fecha_cineracion.font.italic				= 0
				tab_crematorio.tabpage_1.dw_ficha.object.t_7.font.italic									= 0
				tab_crematorio.tabpage_1.dw_ficha.object.hora_cineracion.font.italic				= 0
				tab_crematorio.tabpage_1.dw_ficha.object.minuto_cineracion.font.italic				= 0
			end if	
			
		end if
		
//tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
//idw_detalle12.settransobject(sqlca)
//idw_detalle12.insertrow(0)
//
//tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
//idw_detalle13.settransobject(sqlca)
//idw_detalle13.insertrow(0)
		ll_rut															= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
		il_rut_titular													= ll_rut
		if idw_detalle12.retrieve('150')=0 then idw_detalle12.insertrow(0)
		if idw_detalle4.retrieve(ll_rut)=0 then idw_detalle4.insertrow(0)
		if idw_detalle14.retrieve(ll_rut)=0 then idw_detalle14.insertrow(0)
		if tab_crematorio.tabpage_2.dw_fallecido.retrieve(ll_folio)=0 then 
			tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
		else
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nuevo','N')
			if tab_crematorio.tabpage_2.dw_fallecido.dataobject = 'dw_fc_ingreso_fallecido' then
				ls_ciu_fall		= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'ciudad_fallecimiento')
				if idw_detalle12.retrieve(ls_ciu_fall)=0 then idw_detalle12.insertrow(0)
			end if
		end if
		if tab_crematorio.tabpage_3.dw_titular.retrieve(ll_folio)=0 then
			tab_crematorio.tabpage_3.dw_titular.insertrow(0)
		else
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'nuevo','N')
		end if
		if idw_detalle13.retrieve('150')=0 then idw_detalle13.insertrow(0)
		if idw_detalle15.retrieve() = 0 then idw_detalle15.insertrow(0)
		
		if tab_crematorio.tabpage_4.dw_prelacion.retrieve(ll_folio)=0 then 
//			tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
		else
			ls_ciudad			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'ciudad')
			if idw_detalle13.retrieve(ls_ciudad)=0 then idw_detalle13.insertrow(0)
		end if
		if tab_crematorio.tabpage_5.dw_aranceles.retrieve(ll_folio)=0 then 
			tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
		else
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'nuevo','N')
		end if
		if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
//		tab_crematorio.tabpage_6.dw_archivos.getchild('rut_tercero',idw_detalle16)
//		idw_detalle16.settransobject(sqlca)
		if idw_detalle16.retrieve(ll_folio)=0 then idw_detalle16.insertrow(0)
		if tab_crematorio.tabpage_6.dw_archivos.retrieve(ll_folio)=0 then 
//			tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
		end if
		if tab_crematorio.tabpage_7.dw_ceremonia.retrieve(ll_folio)=0 then 
			tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw1',1)
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw_orador',1)
		else
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'nuevo','N')
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw1', tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'sw_orador'))
		end if
		if tab_crematorio.tabpage_8.dw_cenizas.retrieve(ll_folio)=0 then 
			tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
		else
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'nuevo','N')
			if is_tipo_venta='SV' then
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_nulo)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_nulo)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'visualizar_servicio','N')
				tab_crematorio.tabpage_8.dw_cenizas.object.uso_capilla.protect				= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.protect		= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.protect		= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.protect	= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.uso_pergola.protect			= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.protect	= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.protect		= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.protect	= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.visualizar_servicio.protect		= 1
			end if
		end if
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		tab_crematorio.tabpage_3.dw_titular.accepttext()
		tab_crematorio.tabpage_4.dw_prelacion.accepttext()
		tab_crematorio.tabpage_5.dw_aranceles.accepttext()
		tab_crematorio.tabpage_6.dw_archivos.accepttext()
		tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		if ll_folio > 0 then 
			 tab_crematorio.SelectedTab		= 1
			tab_crematorio.tabpage_1.dw_ficha.setfocus()
		end if
	else
		messagebox("Advertencia","No Existe Ficha Crematorio N° "+string(ll_folio,'###,###,###,##0'))
		cb_limpiar.triggerevent(clicked!)
		em_folio.setfocus()
	end if

elseif rb_buscar_ctto.checked=true then
	dw_ctto.accepttext()
	ls_base		= dw_ctto.getitemstring(1,'base')
	ls_serie		= dw_ctto.getitemstring(1,'serie')
	ll_numero	= dw_ctto.getitemnumber(1,'numero')
	is_base		= ls_base
	is_serie		= ls_serie
	il_numero	= ll_numero
	if not isnull(is_base) and not isnull(is_serie) and il_numero > 0 then
		SELECT 	"FC_CABECERA"."FOLIO_CREMATORIO",		"FC_CABECERA"."TIPO_ORIGEN",	"FC_CABECERA"."RUT_TITULAR"
		INTO 		:ll_folio  ,											:is_tipo_venta,							:ll_rut
		FROM 	"FC_CABECERA"  
		WHERE ( "FC_CABECERA"."BASE" = :is_base ) AND  
				  ( "FC_CABECERA"."SERIE" = :is_serie ) AND  
				  ( "FC_CABECERA"."NUMERO" = :il_numero )  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ll_folio > 0 then	
				il_folio																= ll_folio
				if is_tipo_venta='CV' then
					w_ficha_crematorio.ddplb_tipo_venta.text	= 'CV - Con Venta'
					tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio'
					tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido'
					tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular'
					tab_crematorio.tabpage_7.visible							= true
				elseif is_tipo_venta='SV' then
					w_ficha_crematorio.ddplb_tipo_venta.text	= 'SV - Sin Venta'
					tab_crematorio.tabpage_1.dw_ficha.dataobject		= 'dw_ingreso_cabecera_crematorio_sv'
					tab_crematorio.tabpage_2.dw_fallecido.dataobject	= 'dw_fc_ingreso_fallecido_sv'
					tab_crematorio.tabpage_3.dw_titular.dataobject		= 'dw_fc_titular_sv'
					tab_crematorio.tabpage_7.visible							= false
				end if
				tab_crematorio.tabpage_1.dw_ficha.settransobject(sqlca)
				tab_crematorio.tabpage_2.dw_fallecido.settransobject(sqlca)
				tab_crematorio.tabpage_3.dw_titular.settransobject(sqlca)
				tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
				idw_detalle2.settransobject(sqlca)
				if idw_detalle2.retrieve(is_tipo_venta)=0 then
					idw_detalle2.insertrow(0)
				end if
				
				tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
				idw_detalle3.settransobject(sqlca)
				if idw_detalle3.retrieve(is_tipo_venta)=0 then
					idw_detalle3.insertrow(0)
				end if
				
				tab_crematorio.tabpage_2.dw_fallecido.getchild('rut_fallecido',idw_detalle4)
				idw_detalle4.settransobject(sqlca)
				idw_detalle4.insertrow(0)
				
				tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
				idw_detalle12.settransobject(sqlca)
				idw_detalle12.insertrow(0)
				
				tab_crematorio.tabpage_1.dw_ficha.getchild('rut_fallecido',idw_detalle14)
				idw_detalle14.settransobject(sqlca)
				idw_detalle14.insertrow(0)
				if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
				if tab_crematorio.tabpage_1.dw_ficha.retrieve(ll_folio)=0 then
					if idw_detalle2.retrieve(is_tipo_venta)=0 then idw_detalle2.insertrow(0)
					if idw_detalle3.retrieve(is_tipo_venta)=0 then idw_detalle3.insertrow(0)
					idw_detalle14.reset()
					idw_detalle14.insertrow(0)
					tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
					tab_crematorio.tabpage_1.dw_ficha.enabled		= false
					tab_crematorio.tabpage_2.dw_fallecido.enabled	= false
					tab_crematorio.tabpage_3.dw_titular.enabled		= false
					tab_crematorio.tabpage_4.dw_prelacion.enabled	= false
					tab_crematorio.tabpage_5.dw_aranceles.enabled	= false
					tab_crematorio.tabpage_6.dw_archivos.enabled	= false
					tab_crematorio.tabpage_7.dw_ceremonia.enabled= false
					tab_crematorio.tabpage_8.dw_cenizas.enabled	= false
				else
					is_base														= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
					is_serie														= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
					il_numero													= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
					is_tipo_venta												= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen')
					ll_rut															= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
					ls_tipo_solicitud_origen									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
					if is_tipo_venta='CV' then
						if ls_tipo_solicitud_origen='VE' then
							cb_ficga_traslado.enabled						= true
						else
							cb_ficga_traslado.enabled						= false
						end if
					end if
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'nuevo','N')
					tab_crematorio.tabpage_1.dw_ficha.accepttext()
					tab_crematorio.tabpage_1.dw_ficha.enabled		= true
					tab_crematorio.tabpage_2.dw_fallecido.enabled	= true
					tab_crematorio.tabpage_3.dw_titular.enabled		= true
					tab_crematorio.tabpage_4.dw_prelacion.enabled	= true
					tab_crematorio.tabpage_5.dw_aranceles.enabled	= true
					tab_crematorio.tabpage_6.dw_archivos.enabled	= true
					tab_crematorio.tabpage_7.dw_ceremonia.enabled= true
					tab_crematorio.tabpage_8.dw_cenizas.enabled	= true
					
					SELECT 	COUNT("FC_AGENDA_CREMATORIO"."NOMBRE_FALLECIDO")	 
					INTO 		:ll_count_ag  
					FROM 	"FC_AGENDA_CREMATORIO"  
					WHERE ( "FC_AGENDA_CREMATORIO"."FOLIO_CREMATORIO" = :ll_folio ) AND  
								( "FC_AGENDA_CREMATORIO"."ESTADO_REG" = 'P' )   ;
					if ll_count_ag > 0 then
						is_ag_crem																							= 'S'
						tab_crematorio.tabpage_1.dw_ficha.object.t_10.font.italic 								= 1
						tab_crematorio.tabpage_1.dw_ficha.object.fecha_ingreso_cinerario.font.italic		= 1
						tab_crematorio.tabpage_1.dw_ficha.object.t_11.font.italic								= 1
						tab_crematorio.tabpage_1.dw_ficha.object.hora_ingreso_cinerario.font.italic		= 1
						tab_crematorio.tabpage_1.dw_ficha.object.minuto_ingreso_cinerario.font.italic	= 1
					else
						tab_crematorio.tabpage_1.dw_ficha.object.t_10.font.italic 								= 0
						tab_crematorio.tabpage_1.dw_ficha.object.fecha_ingreso_cinerario.font.italic		= 0
						tab_crematorio.tabpage_1.dw_ficha.object.t_11.font.italic								= 0
						tab_crematorio.tabpage_1.dw_ficha.object.hora_ingreso_cinerario.font.italic		= 0
						tab_crematorio.tabpage_1.dw_ficha.object.minuto_ingreso_cinerario.font.italic	= 0
					end if	
					
					SELECT 	COUNT("FC_AGENDA_CAPILLA"."NOMBRE_FALLECIDO")	 
					INTO 		:ll_count_ag  
					FROM 	"FC_AGENDA_CAPILLA"  
					WHERE ( "FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :ll_folio ) AND  
								( "FC_AGENDA_CAPILLA"."ESTADO_REG" = 'P' ) 	;
					if ll_count_ag > 0 then
						is_ag_capi																							= 'S'
						tab_crematorio.tabpage_8.dw_cenizas.object.t_12.font.italic 							= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.t_13.font.italic							= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.font.italic			= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.t_14.font.italic							= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.font.italic			= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.font.italic		= 1
					else
						tab_crematorio.tabpage_8.dw_cenizas.object.t_12.font.italic 							= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.t_13.font.italic							= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.font.italic			= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.t_14.font.italic							= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.font.italic			= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.font.italic		= 0
					end if
					
					SELECT 	COUNT("FC_AGENDA_PERGOLA"."NOMBRE_FALLECIDO")	 
					INTO 		:ll_count_ag  
					FROM 	"FC_AGENDA_PERGOLA"  
					WHERE ( "FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :ll_folio ) AND  
								( "FC_AGENDA_PERGOLA"."ESTADO_REG" = 'P' )   ;
					if ll_count_ag > 0 then
						is_ag_pergo																							= 'S'
						tab_crematorio.tabpage_8.dw_cenizas.object.t_17.font.italic 							= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.t_18.font.italic							= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.font.italic			= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.t_19.font.italic							= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.font.italic			= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.font.italic		= 1
					else
						tab_crematorio.tabpage_8.dw_cenizas.object.t_17.font.italic 							= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.t_18.font.italic							= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.font.italic			= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.t_19.font.italic							= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.font.italic			= 0
						tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.font.italic		= 0
					end if
					
					SELECT 	COUNT("FC_AGENDA_ING_PARQUE"."NOMBRE_FALLECIDO")	 
					INTO 		:ll_count_ag  
					FROM 	"FC_AGENDA_ING_PARQUE"  
					WHERE ( "FC_AGENDA_ING_PARQUE"."FOLIO_CREMATORIO" = :ll_folio ) AND  
								( "FC_AGENDA_ING_PARQUE"."ESTADO_REG" = 'P' ) 	;
					if ll_count_ag > 0 then
						is_ag_ing																							= 'S'
						tab_crematorio.tabpage_1.dw_ficha.object.t_6.font.italic 								= 1
						tab_crematorio.tabpage_1.dw_ficha.object.fecha_cineracion.font.italic				= 1
						tab_crematorio.tabpage_1.dw_ficha.object.t_7.font.italic									= 1
						tab_crematorio.tabpage_1.dw_ficha.object.hora_cineracion.font.italic				= 1
						tab_crematorio.tabpage_1.dw_ficha.object.minuto_cineracion.font.italic				= 1
					else
						tab_crematorio.tabpage_1.dw_ficha.object.t_6.font.italic 								= 0
						tab_crematorio.tabpage_1.dw_ficha.object.fecha_cineracion.font.italic				= 0
						tab_crematorio.tabpage_1.dw_ficha.object.t_7.font.italic									= 0
						tab_crematorio.tabpage_1.dw_ficha.object.hora_cineracion.font.italic				= 0
						tab_crematorio.tabpage_1.dw_ficha.object.minuto_cineracion.font.italic				= 0
					end if
					
					
				end if
				ll_rut															= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
				il_rut_titular													= ll_rut
				if idw_detalle12.retrieve('150')=0 then idw_detalle12.insertrow(0)
				if idw_detalle4.retrieve(ll_rut)=0 then idw_detalle4.insertrow(0)
				if idw_detalle14.retrieve(ll_rut)=0 then idw_detalle14.insertrow(0)
				if tab_crematorio.tabpage_2.dw_fallecido.retrieve(ll_folio)=0 then 
					tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
				else
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nuevo','N')
				end if
				if tab_crematorio.tabpage_3.dw_titular.retrieve(ll_folio)=0 then
					tab_crematorio.tabpage_3.dw_titular.insertrow(0)
				else
					tab_crematorio.tabpage_3.dw_titular.setitem(1,'nuevo','N')
				end if
				if idw_detalle13.retrieve('150')=0 then idw_detalle13.insertrow(0)
				if idw_detalle15.retrieve() = 0 then idw_detalle15.insertrow(0)
				
				if tab_crematorio.tabpage_4.dw_prelacion.retrieve(ll_folio)=0 then 
		//			tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
				else
					ls_ciudad			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'ciudad')
					if idw_detalle13.retrieve(ls_ciudad)=0 then idw_detalle13.insertrow(0)
				end if
				if tab_crematorio.tabpage_5.dw_aranceles.retrieve(ll_folio)=0 then 
					tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
				else
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'nuevo','N')
				end if
				if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
		//		tab_crematorio.tabpage_6.dw_archivos.getchild('rut_tercero',idw_detalle16)
		//		idw_detalle16.settransobject(sqlca)
				if idw_detalle16.retrieve(ll_folio)=0 then idw_detalle16.insertrow(0)
				if tab_crematorio.tabpage_6.dw_archivos.retrieve(ll_folio)=0 then 
//					tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
				end if
				if tab_crematorio.tabpage_7.dw_ceremonia.retrieve(ll_folio)=0 then 
					tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
					tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw1',1)
					tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw_orador',1)
				else
					tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'nuevo','N')
					tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw1', tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'sw_orador'))
				end if
				if tab_crematorio.tabpage_8.dw_cenizas.retrieve(ll_folio)=0 then 
					tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
				else
					tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'nuevo','N')
					if is_tipo_venta='SV' then
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_nulo)
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_nulo)
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
						tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'visualizar_servicio','N')
						tab_crematorio.tabpage_8.dw_cenizas.object.uso_capilla.protect				= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.protect		= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.protect		= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.protect	= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.uso_pergola.protect			= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.protect	= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.protect		= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.protect	= 1
						tab_crematorio.tabpage_8.dw_cenizas.object.visualizar_servicio.protect		= 1
					end if
				end if
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
				tab_crematorio.tabpage_2.dw_fallecido.accepttext()
				tab_crematorio.tabpage_3.dw_titular.accepttext()
				tab_crematorio.tabpage_4.dw_prelacion.accepttext()
				tab_crematorio.tabpage_5.dw_aranceles.accepttext()
				tab_crematorio.tabpage_6.dw_archivos.accepttext()
				tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
				tab_crematorio.tabpage_8.dw_cenizas.accepttext()
				if ll_folio > 0 then 
					 tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
				end if
			else
				messagebox("Advertencia","No Existe Ficha Crematorio N° "+string(ll_folio,'###,###,###,##0'))
				cb_limpiar.triggerevent(clicked!)
				dw_ctto.setfocus()
			end if
		else
			messagebox("Advertencia","No Existe Ficha Contrato N° "+string(ll_numero,'###,###,###,##0'))
			cb_limpiar.triggerevent(clicked!)
		end if
	end if
end if

end event

type dw_ctto from datawindow within w_ficha_crematorio_2
integer x = 782
integer y = 88
integer width = 1349
integer height = 96
integer taborder = 30
string title = "none"
string dataobject = "dwe_ingreso_por_contrato"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_base,ls_serie
Long		ll_numero, ll_new

this.accepttext()
ls_columna	= dwo.name
if ls_columna='base' then
	ls_base	= data
	if idw_detalle.retrieve(ls_base)=0 then
		idw_detalle.insertrow(0)
	end if
end if
ls_base		= this.getitemstring(1,'base')
ls_serie		= this.getitemstring(1,'serie')
ll_numero	= this.getitemnumber(1,'numero')
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero> 0 then  

	tab_crematorio.tabpage_1.dw_ficha.reset()
	tab_crematorio.tabpage_2.dw_fallecido.reset()
	tab_crematorio.tabpage_3.dw_titular.reset()
	tab_crematorio.tabpage_4.dw_prelacion.reset()
	tab_crematorio.tabpage_5.dw_aranceles.reset()
	tab_crematorio.tabpage_6.dw_archivos.reset()
	tab_crematorio.tabpage_7.dw_ceremonia.reset()
	tab_crematorio.tabpage_8.dw_cenizas.reset()
	tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(is_tipo_venta)=0 then
		idw_detalle2.insertrow(0)
	end if
	
	tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.retrieve(is_tipo_venta)=0 then
		idw_detalle3.insertrow(0)
	end if
	
	tab_crematorio.tabpage_2.dw_fallecido.getchild('rut_fallecido',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	idw_detalle4.insertrow(0)
	
	tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
	idw_detalle12.settransobject(sqlca)
	idw_detalle12.insertrow(0)
	
	tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
	idw_detalle13.settransobject(sqlca)
	idw_detalle13.insertrow(0)
	
	tab_crematorio.tabpage_1.dw_ficha.getchild('rut_fallecido',idw_detalle14)
	idw_detalle14.settransobject(sqlca)
	idw_detalle14.insertrow(0)
	
	tab_crematorio.tabpage_6.dw_archivos.getchild('codigo_documento',idw_detalle15)
	idw_detalle15.settransobject(sqlca)
	//if idw_detalle15.retrieve('PR')=0 then idw_detalle15.insertrow(0)
	if idw_detalle15.retrieve()=0 then idw_detalle15.insertrow(0)
	tab_crematorio.tabpage_6.dw_archivos.getchild('rut_tercero',idw_detalle16)
	idw_detalle16.settransobject(sqlca)
	idw_detalle16.insertrow(0)
	
	idw_detalle.retrieve(is_base)
	idw_detalle2.retrieve(is_tipo_venta)
	idw_detalle3.retrieve(is_tipo_venta)
	idw_detalle4.insertrow(0)
	idw_detalle12.insertrow(0)
	idw_detalle13.insertrow(0)
	idw_detalle14.insertrow(0)
	//idw_detalle15.retrieve('PR')
	idw_detalle15.retrieve()
	idw_detalle16.reset()
	idw_detalle16.insertrow(0)
	tab_crematorio.tabpage_1.dw_ficha.insertrow(0)
	tab_crematorio.tabpage_2.dw_fallecido.insertrow(0)
	tab_crematorio.tabpage_3.dw_titular.insertrow(0)
	tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
	tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
	tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
	tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
	tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
	//if rb_buscar_ctto.checked=true then
	//	dw_ctto.reset()
	//	ll_new				= dw_ctto.insertrow(0)
	//	dw_ctto.enabled	= true
	//	em_folio.text		= ''
	//	em_folio.enabled	= false
	//	dw_ctto.setfocus()
	//elseif rb_buscar_folio.checked=true then
	//	dw_ctto.reset()
	//	ll_new				= dw_ctto.insertrow(0)
	//	dw_ctto.enabled	= false
	//	em_folio.text		= ''
	//	em_folio.enabled	= true
	//	em_folio.setfocus()
	//end if
	tab_crematorio.tabpage_1.dw_ficha.enabled			= false
	tab_crematorio.tabpage_2.dw_fallecido.enabled		= false
	tab_crematorio.tabpage_3.dw_titular.enabled			= false
	tab_crematorio.tabpage_4.dw_prelacion.enabled		= false
	tab_crematorio.tabpage_5.dw_aranceles.enabled		= false
	tab_crematorio.tabpage_6.dw_archivos.enabled		= false
	tab_crematorio.tabpage_7.dw_ceremonia.enabled	= false
	tab_crematorio.tabpage_8.dw_cenizas.enabled		= false
	cb_nuevo.enabled												= true
		
		
		
	//	cb_limpiar.triggerevent(clicked!)
	//	pb_aceptar.setfocus()
		pb_aceptar.triggerevent(clicked!)
end if

end event

event losefocus;//pb_aceptar.setfocus()
end event

type cb_grabar from commandbutton within w_ficha_crematorio_2
integer x = 251
integer y = 1936
integer width = 215
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_sw_ficha,ll_sw_fallecido,ll_sw_titular,ll_sw_prelacion,ll_sw_arancel,ll_sw_archivo,ll_tot_reg,ll_indi,ll_res_limpiar,ll_folio_fc,ll_sw_ceremonia,&
			ll_sw_cenizas,ll_cod_servicio,ll_return,ll_numero_ori,ll_count,ll_estado_gestion_fun,ll_sw_pregrabar,ll_res,ll_numero,ll_hora_fijada,ll_minuto_fijada,&
			ll_count_cd,ll_count_ag,ll_res_correo,ll_hora_cine,ll_minuto_cine,ll_cod_parque_des,ll_count_crema,ll_cod_parque,ll_cod_religion,ll_estado_gestion,&
			ll_sw_covid19,ll_protocolo_covid,ll_sw_orador,ll_hora_cineracion_fin,ll_min_cineracion_fin,ll_hora_ini_visualiza,ll_min_ini_visualiza,ll_hora_fin_visualiza,&
			ll_min_fin_visualiza
Double	ll_max_folio,ll_max_contrato,ll_monto_uf,ll_rut_prela,ll_rut_fallecido_fall,ll_rut_tit,ll_rut_titular
String		ls_valido,ls_estado_reg,ls_estado_reg_fall,ls_moneda,ls_cod_otro,ls_base_ori,ls_serie_ori,ls_base,ls_serie,ls_uso,ls_parentesco_prela,ls_dv_prela,&
			ls_nombre_prela,ls_ap_pat_prela,ls_ap_mat_prela,ls_tipo_via_prela,ls_tipo_solicitud,ls_nulo,ls_tipo_origen,ls_tipo_sol_origen,ls_descrip_origen,email_de,&
			ls_email_para,ls_asunto,ls_texto,ls_res,ls_nombres_fall,ls_apellido_paterno_fall,ls_apellido_materno_fall,ls_dv_fallecido,ls_desc_parque_des,ls_dv_tit,&
			ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,ls_horas,ls_descrip_tiporigen,ls_autoriza,ls_nombre_fall,ls_pat_fall,ls_mat_fall,ls_agenda_visualiza,ls_estado_reg_ficha
date		ldt_fecha_pago
datetime	ldt_fecha_cremacion,ldt_nulo,ldt_fecha_cine,ldt_fecha_defuncion_fall,ldt_fecha_valida,ldt_fecha_defuncion,ldt_fecha_visualiza

String		base_s,serie_s,ls_sector_s,ls_sepultura_s,	ls_nombre_s,ls_ap_pat_s,ls_ap_mat_s,ls_est_s,ls_op_s,ls_dv_s,ls_sexo_s,ls_periodo_s,ls_inscrip_pase_s,ls_otorgado_por_s,&
			ls_causa_fall_s,ls_enf_obl_s,ls_funeraria_s,ls_boleta_s,ls_carta_aut_s,ls_n_tec_s,ls_nivel_s,ls_vta_s,ls_observaciones_s,ls_estado_contrato_s,ls_registro_pase_s,ls_cementerio_origen_s,&
			ls_nro_sarcofago_s,ls_cod_usuario_s,ls_usuario_ult_mod,ls_estado_exhum_s,ls_estado_inhuma_s,ls_estado_ti_s,ls_estado_te_s,ls_estado_re_s,ls_estado_tr_s,ls_pase_s,&
			ls_estado_crem_s,ls_estado_reg_s,ls_estado_fall_s,ls_base_dest_s,ls_serie_dest_s,ls_usuario_crea_s,ls_destino_par,ls_tipo_ficha_s,ls_nuevo,ls_periodo_nacimiento,ls_cod_regis,&
			ls_otorgado_por,ls_funeraria,ls_inscripcion_pase,ls_resol_traslado_nro_s,ls_estado_tit,ls_estado_ctto,ls_pase_sepult,ls_causa_fall,ls_sexo_fall,ls_obs_sep_comp,&
			ls_descrip_parque,ls_auto_admin,ls_ejecutivo,ls_obs,ls_uso_visualiza,ls_uso_capilla,ls_uso_pergola,ls_nombre,ls_ap_pat,ls_ap_mat,ls_obs_ceremonia
Datetime	ldt_fec_sepult_s,ldt_fec_nac_s,ldt_fec_fall_s,ldt_fecha_ult_mod_s,ldt_fecha_exhum_s,ldt_fecha_inhuma_s,	ldt_fecha_ti_s,ldt_fecha_te_s,ldt_fecha_re_s,ldt_fecha_tr_s,ldt_fecha_crem_s,&
			ldt_fecha_crea_s,ldt_fec_nac
Double	ll_rut_s,ll_numero_dest_s,ll_rut,ll_rut_fall
Long		ll_count_parque_s,ll_n_l_s,ll_n_m_s,numero_s,ll_edad_s,ll_corr_hist_reg_s,ll_cod_parque_s,ll_llave_anterior_s,ll_folio_encuesta_s,	ll_covid_s,ll_ubicacion_cuerpo_s,ll_nl,ll_nm,ll_llave_s,&
			ll_folio,ll_llave,ll_funeraria,ll_parque,ll_edad_fall,ll_count_pago

SELECT 	"FC_ENVIO_EMAIL"."CORREO_ADMIN",	 "FC_ENVIO_EMAIL"."CORREO_DE"
INTO 		:ls_email_para,									:email_de
FROM 	"FC_ENVIO_EMAIL"  
WHERE 	"FC_ENVIO_EMAIL"."COD_FUNERARIA_PARQUE" = 142   ;

Setnull(ldt_nulo);Setnull(ls_nulo)
ll_sw_ficha=0;ll_sw_fallecido=0;ll_sw_titular=0;ll_sw_prelacion=0;ll_sw_arancel=0;ll_sw_archivo=0;ll_sw_ceremonia=0;ll_sw_cenizas=0;ll_res=1
il_sw_pregrabar		= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'sw_pregrabar')
ll_folio_fc				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
ls_base					= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
ls_serie					= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
ll_numero				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
ls_estado_reg_ficha	= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'estado_reg')
is_tipo_venta			= mid(ddplb_tipo_venta.text,1,2)
if il_sw_pregrabar = 0 then
	ll_res					= messagebox("Grabar","Se realizara PRE-GRABADO a Ficha Crematorio, desea continuar",Exclamation!,YesNo!,2)
end if
if ll_res=1 then
	ls_valido				= wf_validar_datos()
	if isnull(ll_folio_fc) then ll_folio_fc=0
	if ls_valido = 'S' and ll_folio_fc = 0 then
		SELECT 	MAX("FC_CABECERA"."FOLIO_CREMATORIO" ) 
		INTO 		:ll_max_folio  
		FROM 	"FC_CABECERA"  ;
		if isnull(ll_max_folio) then ll_max_folio=0
		ll_max_folio ++
		if is_tipo_venta='SV' then
			is_base_g			= 'G'
			is_serie_g			= 'I'
			
			SELECT 	MIN("CD_FOLIO"."NUMERO" ) 
			INTO 		:ll_max_contrato  
			FROM 	"CD_FOLIO"  
			WHERE 	( "CD_FOLIO"."BASE" = :is_base_g ) AND  
						( "CD_FOLIO"."SERIE" = :is_serie_g ) AND  
						("CD_FOLIO"."ULT_ESTADO" = 2 OR "CD_FOLIO"."ULT_ESTADO" = 3 OR "CD_FOLIO"."ULT_ESTADO" = 14)  
			USING	sqlca;
			if sqlca.sqlcode<>0 then
				Setnull(ll_max_contrato)
			end if			
			il_numero_g			= ll_max_contrato
			il_cod_parque		= 142
		elseif is_tipo_venta='CV' then
			if isnull(ls_base) then
				SELECT 	"REVISION_CONTRATOS"."BASE",   	"REVISION_CONTRATOS"."SERIE",  	"REVISION_CONTRATOS"."NUMERO"  
				INTO 		:is_base_g,   								:is_serie_g,   								:il_numero_g  
				FROM 	"REVISION_CONTRATOS"  
				WHERE 	( "REVISION_CONTRATOS"."RUT" = :il_rut_titular ) AND  
							( "REVISION_CONTRATOS"."BASE" = 'G' ) AND  
							( "REVISION_CONTRATOS"."NUMERO" = ( 	SELECT MAX("REVISION_CONTRATOS"."NUMERO") 
																					FROM "REVISION_CONTRATOS" 
																					WHERE ( "REVISION_CONTRATOS"."BASE" = 'G' ) AND ( "REVISION_CONTRATOS"."RUT" = :il_rut_titular ) ) )   ;

			end if
		end if
		if not isnull(is_base_g) and not isnull(is_serie_g) and not isnull(il_numero_g) and il_numero_g > 0 then
			is_base					= is_base_g
			is_serie					= is_serie_g
			ll_max_contrato		= il_numero_g
			ldt_fecha_pago			= date(tab_crematorio.tabpage_5.dw_aranceles.getitemdatetime(1,'fecha_pago'))
			ls_moneda				= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'tipo_moneda')
			ll_monto_uf				= tab_crematorio.tabpage_5.dw_aranceles.getitemnumber(1,'monto_contrato')
			ls_cod_otro				= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'codigo_otro')
	
			ls_base_ori				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base_origen')
			ls_serie_ori				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie_origen')
			ll_numero_ori			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero_origen')
			ls_tipo_solicitud		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
			ldt_fecha_cremacion	= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla')
			if is_tipo_venta='CV' and ls_tipo_solicitud='NI' and isnull(ldt_fecha_cremacion) then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque','S')
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
			elseif is_tipo_venta='CV' and ls_tipo_solicitud<>'NI' then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque',ls_nulo)
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
			end if
			//il_cod_parque
			SELECT 	DISTINCT "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO"  
			INTO 		:ll_cod_servicio  
			FROM 	"PRODUCTO_TIPO_SERVICIO"  
	//		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque ) AND  
	//		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = 142 ) AND  
			WHERE	( "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO" = :ls_cod_otro )  
			USING	sqlca;
			
			SELECT 	Count("CADENA"."CODIGO")  
			INTO 		:ll_count  
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :is_base_g ) AND  
						( "CADENA"."SERIE" = :is_serie_g ) AND  
						( "CADENA"."NUMERO" = :il_numero_g )   ;
	
			SELECT sysdate INTO :gdt_fec_sistema FROM dual;
			if ll_count = 0 then
				SELECT 	Count("CD_FOLIO"."BASE")  
				INTO 		:ll_count_cd  
				FROM 	"CD_FOLIO"  
				WHERE 	( "CD_FOLIO"."BASE" = :is_base_g ) AND  
							( "CD_FOLIO"."SERIE" = :is_serie_g ) AND  
							( "CD_FOLIO"."NUMERO" = :il_numero_g )   ;
				if ll_count_cd > 0 then
					if is_tipo_venta='SV' then
						DECLARE sp_crear_cineracion PROCEDURE FOR F_CREA_CTTO_NUEVOS (:is_base, :is_serie, :ll_max_contrato, 96844000, :ll_monto_uf, 1, :ls_moneda, :ldt_fecha_pago, :ldt_fecha_pago, 0.0001, 1, :ll_cod_servicio, :il_cod_parque, :gs_user, :ls_base_ori, :ls_serie_ori, :ll_numero_ori, :gdt_fec_sistema );
						EXECUTE sp_crear_cineracion;
						if sqlca.sqlcode=0 then
							fetch sp_crear_cineracion into :ll_return;
							close sp_crear_cineracion;						
						end if
					else
						messagebox("Advertencia","No Existe Contrato Crematorio, debe Generarlo antes de Crear Ficha")
						ll_max_contrato				= 0
					end if
				else
					messagebox("Advertencia","Folio Contrato Crematorio, NO Existe en Control Documentario es Obligatorio Generar N° "+is_base_g+'-'+is_serie_g+'-'+string(il_numero_g,'###,###,###,###'))
					ll_max_contrato		= 0	
				end if
			end if
			//ORIGINAL
			//F_CREA_CTTO_NUEVOS (as_base VARCHAR2, as_serie VARCHAR2, adb_numero NUMBER, al_rut NUMBER, adb_precio NUMBER, al_plazo NUMBER,  as_moneda VARCHAR2, adt_fec_prim DATE, adt_fec_ult DATE, adb_tasa NUMBER, al_cap NUMBER, al_cod_servicio NUMBER, al_cod_parque NUMBER, as_user VARCHAR2)
		else
			messagebox("Advertencia","No Existe Contrato Crematorio, debe Generarlo antes de Crear Ficha")
			ll_max_contrato				= 0
//			SELECT 	MAX("FC_CABECERA"."NUMERO" ) 
//			INTO 		:ll_max_contrato  
//			FROM 	"FC_CABECERA"  ;
//			if isnull(ll_max_contrato) then ll_max_contrato=0
//			ll_max_contrato ++
//			SELECT 	Count("CD_FOLIO"."BASE")  
//			INTO 		:ll_count_cd  
//			FROM 	"CD_FOLIO"  
//			WHERE 	( "CD_FOLIO"."BASE" = :is_base_g ) AND  
//						( "CD_FOLIO"."SERIE" = :is_serie_g ) AND  
//						( "CD_FOLIO"."NUMERO" = :ll_max_contrato )   ;
//			if ll_count_cd = 0 then
//				messagebox("Advertencia","Folio Contrato Crematorio, NO Existe en Control Documentario es Obligatorio Generar N° "+is_base_g+'-'+is_serie_g+'-'+string(ll_max_contrato,'###,###,###,###'))
//				ll_max_contrato		= 0
//			end if
		end if
		
		if ll_max_contrato > 0 and il_rut_titular > 0  then
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'folio_crematorio',ll_max_folio)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base',is_base)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie',is_serie)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero',ll_max_contrato)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_gestion',1)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'folio_crematorio',ll_max_folio)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'base',is_base)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'serie',is_serie)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'numero',ll_max_contrato)
			ls_estado_reg_fall		= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'estado_reg')
			if isnull(ls_estado_reg_fall) then tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_reg','P')
			
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'folio_crematorio',ll_max_folio)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'base',is_base)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'serie',is_serie)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'numero',ll_max_contrato)
			
			ll_tot_reg		= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ls_parentesco_prela	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'parentesco')
					ll_rut_prela				= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'rut')
					ls_dv_prela				= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'dv')
					ls_nombre_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'nombres')
					ls_ap_pat_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_paterno')
					ls_ap_mat_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_materno')
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'folio_crematorio',ll_max_folio)
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'base',is_base)
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'serie',is_serie)
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'numero',ll_max_contrato)
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_ficha',ls_estado_reg_ficha)
					ls_estado_reg			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'estado_reg')
					if isnull(ls_estado_reg) then tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_reg','A')
//					ls_tipo_via_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'tipo_via')
					if isnull(ls_parentesco_prela) or isnull(ll_rut_prela) or isnull(ls_dv_prela) or isnull(ls_nombre_prela) or isnull(ls_ap_pat_prela) or isnull(ls_ap_mat_prela) then
						tab_crematorio.tabpage_4.dw_prelacion.deleterow(ll_indi)
						ll_tot_reg			= ll_tot_reg - 1
						if ll_indi > ll_tot_reg then exit
					end if
				next
			end if
			tab_crematorio.tabpage_4.dw_prelacion.accepttext()
			
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'folio_crematorio',ll_max_folio)
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'base',is_base)
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'serie',is_serie)
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'numero',ll_max_contrato)
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'rut_titular',il_rut_titular)
			
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'folio_crematorio',ll_max_folio)
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'base',is_base)
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'serie',is_serie)
			tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'numero',ll_max_contrato)
			ls_estado_reg_fall		= tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'estado_reg')
			if isnull(ls_estado_reg_fall) then tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'estado_reg','P')
			
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'folio_crematorio',ll_max_folio)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'base',is_base)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'serie',is_serie)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'numero',ll_max_contrato)
			
			if isnull(tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')) then tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'visualizar_servicio','N')
			if isnull(tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')) then tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
			if isnull(tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')) then tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
			
			ls_estado_reg_fall		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'estado_reg')
			if isnull(ls_estado_reg_fall) then tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'estado_reg','P')
			
			ll_tot_reg				= tab_crematorio.tabpage_6.dw_archivos.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'folio_crematorio',ll_max_folio)
					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'base',is_base)
					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'serie',is_serie)
					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'numero',ll_max_contrato)
				next
				if tab_crematorio.tabpage_6.dw_archivos.update()=1 then
					commit;
				else
					rollback;
				end if
			end if
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
			tab_crematorio.tabpage_2.dw_fallecido.accepttext()
			tab_crematorio.tabpage_3.dw_titular.accepttext()
			tab_crematorio.tabpage_4.dw_prelacion.accepttext()
			tab_crematorio.tabpage_5.dw_aranceles.accepttext()
			tab_crematorio.tabpage_6.dw_archivos.accepttext()
			tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
			tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		
			if tab_crematorio.tabpage_1.dw_ficha.update() = 1 then 
				ll_sw_ficha ++
				commit;
			else
				rollback;
			end if
			if tab_crematorio.tabpage_2.dw_fallecido.update() = 1 then 
				ll_sw_fallecido ++
				commit;
			else
				rollback;
			end if
			if tab_crematorio.tabpage_3.dw_titular.update() = 1 then 
				ll_sw_titular ++
				commit;
			else
				rollback;
			end if
			
			if tab_crematorio.tabpage_4.dw_prelacion.update() = 1 then 
				ll_sw_prelacion ++
				commit;
			else
				rollback;
			end if
			if tab_crematorio.tabpage_5.dw_aranceles.update() = 1 then 
				ll_sw_arancel ++
				commit;
			else
				rollback;
			end if
//			if tab_crematorio.tabpage_6.dw_archivos.update() = 1 then ll_sw_archivo ++
			if tab_crematorio.tabpage_7.dw_ceremonia.update() = 1 then 
				ll_sw_ceremonia ++
				commit;
			else
				rollback;
			end if
			if tab_crematorio.tabpage_8.dw_cenizas.update() = 1 then 
				ll_sw_cenizas ++
				commit;
			else
				rollback;
			end if
			if ll_sw_ficha>0 and ll_sw_fallecido>0 and ll_sw_titular>0 and ll_sw_prelacion>0 and ll_sw_arancel>0 and ll_sw_ceremonia > 0 and ll_sw_cenizas > 0 then
//				commit;
				ll_res_correo				= messagebox("Envio Email","Desea Enviar Correo de Aviso Administrador Crematorio",Exclamation!,YesNo!,2)
				if ll_res_correo=1 then
					ls_tipo_origen				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen')
					ls_tipo_sol_origen			= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
					ldt_fecha_cine				= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
					ll_hora_cine					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_cineracion')
					ll_minuto_cine				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_cineracion')
					ll_rut_fallecido_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
					ls_dv_fallecido				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
					ls_nombres_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres')
					ls_apellido_paterno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno')
					ls_apellido_materno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno')
					ldt_fecha_defuncion_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
					ll_cod_parque_des			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_destino')
					if date(ldt_fecha_cine) = date('01/01/1900') then setnull(ldt_fecha_cine)
					if date(ldt_fecha_defuncion_fall) = date('01/01/1900') then setnull(ldt_fecha_defuncion_fall)
					
					SELECT 	"COD_PARQ"."NOMBRE"  
					INTO 		:ls_desc_parque_des  
					FROM 	"COD_PARQ"  
					WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque_des  ;
					ll_rut_tit						= tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular')
					ls_dv_tit						= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'dv_titular')
					ls_nombre_tit				= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'nombres')
					ls_ap_pat_tit				= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_paterno')
					ls_ap_mat_tit				= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_materno')
					SELECT 	"FC_TIPO_SOLICITUD_ORIGEN"."DESCRIPCION"  
					INTO 		:ls_descrip_origen  
					FROM 	"FC_TIPO_SOLICITUD_ORIGEN"  
					WHERE ( "FC_TIPO_SOLICITUD_ORIGEN"."TIPO_ORIGEN" = :ls_tipo_origen ) AND  
							  ( "FC_TIPO_SOLICITUD_ORIGEN"."TIPO_SOLICITUD_ORIGEN" = :ls_tipo_sol_origen )   ;
					if isnull(ls_tipo_origen) then
						messagebox("Advertencia","Debe Ingresar Tipo Origen")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_origen')
					elseif isnull(ls_tipo_sol_origen) then
						messagebox("Advertencia","Debe Ingresar Tipo Solicitud Origen")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_solicitud_origen')
					elseif isnull(ldt_fecha_cine) then
						messagebox("Advertencia","Debe Ingresar Fecha Recepción")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
					elseif isnull(ll_hora_cine) then
						messagebox("Advertencia","Debe Ingresar Hora Recepción")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_cineracion')
					elseif isnull(ll_minuto_cine) then
						messagebox("Advertencia","Debe Ingresar Minuto Recepción")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_cineracion')
					elseif isnull(ll_rut_fallecido_fall) then
						messagebox("Advertencia","Debe Ingresar Rut Fallecido")
						tab_crematorio.SelectedTab		= 2
						tab_crematorio.tabpage_2.dw_fallecido.setfocus()
						tab_crematorio.tabpage_2.dw_fallecido.setcolumn('rut_fallecido')
					elseif isnull(ls_dv_fallecido) then
						messagebox("Advertencia","Debe Ingresar Digito Verificador Fallecido")
						tab_crematorio.SelectedTab		= 2
						tab_crematorio.tabpage_2.dw_fallecido.setfocus()
						tab_crematorio.tabpage_2.dw_fallecido.setcolumn('dv_fallecido')
					elseif isnull(ls_nombres_fall) then
						messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
						tab_crematorio.SelectedTab		= 2
						tab_crematorio.tabpage_2.dw_fallecido.setfocus()
						tab_crematorio.tabpage_2.dw_fallecido.setcolumn('nombres')
					elseif isnull(ls_apellido_paterno_fall) then
						messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
						tab_crematorio.SelectedTab		= 2
						tab_crematorio.tabpage_2.dw_fallecido.setfocus()
						tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_paterno')
					elseif isnull(ls_apellido_materno_fall) then
						messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
						tab_crematorio.SelectedTab		= 2
						tab_crematorio.tabpage_2.dw_fallecido.setfocus()
						tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_materno')
					elseif isnull(ldt_fecha_defuncion_fall) then
						messagebox("Advertencia","Debe Ingresar Fecha Defunción")
						tab_crematorio.SelectedTab		= 2
						tab_crematorio.tabpage_2.dw_fallecido.setfocus()
						tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
					
					elseif isnull(ls_desc_parque_des) then
						messagebox("Advertencia","Debe Ingresar Parque Destino")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
						
					elseif isnull(ll_rut_tit) then	
						messagebox("Advertencia","Debe Ingresar Rut Titular")
						tab_crematorio.SelectedTab		= 3
						tab_crematorio.tabpage_3.dw_titular.setfocus()
						tab_crematorio.tabpage_3.dw_titular.setcolumn('rut_titular')
					elseif isnull(ls_dv_tit) then
						messagebox("Advertencia","Debe Ingresar Digito Verificador Titular")
						tab_crematorio.SelectedTab		= 3
						tab_crematorio.tabpage_3.dw_titular.setfocus()
						tab_crematorio.tabpage_3.dw_titular.setcolumn('dv_titular')
					elseif isnull(ls_nombre_tit) then
						messagebox("Advertencia","Debe Ingresar Nombre Titular")
						tab_crematorio.SelectedTab		= 3
						tab_crematorio.tabpage_3.dw_titular.setfocus()
						tab_crematorio.tabpage_3.dw_titular.setcolumn('nombres')
					elseif isnull(ls_ap_pat_tit) then
						messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
						tab_crematorio.SelectedTab		= 3
						tab_crematorio.tabpage_3.dw_titular.setfocus()
						tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_paterno')
					elseif isnull(ls_ap_mat_tit) then
						messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
						tab_crematorio.SelectedTab		= 3
						tab_crematorio.tabpage_3.dw_titular.setfocus()
						tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_materno')
					elseif isnull(ls_descrip_origen) then
						messagebox("Advertencia","Debe Ingresar Tipo Solicitud Origen")
						tab_crematorio.SelectedTab		= 1
						tab_crematorio.tabpage_1.dw_ficha.setfocus()
						tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_solicitud_origen')
					else
						if ll_hora_cine < 12 then
							ls_horas					= 'AM'
						else
							ls_horas					= 'PM'
						end if
						SELECT 	"FC_TIPO_ORIGEN"."DESCRIPCION"  
						INTO 		:ls_descrip_tiporigen 
						FROM 	"FC_TIPO_ORIGEN"  
						WHERE 	"FC_TIPO_ORIGEN"."TIPO_ORIGEN" = :ls_tipo_origen   ;
//						email_de						= 'gnpnotifica@gmail.com'
//						ls_email_para				= 'mirkom@nuestrosparques.cl'		//'lvasquez@nuestrosparques.cl'		//'Crematoriomanantial@nuestrosparques.cl'
						ls_asunto					= '<< PRUEBA >> Se ha Creado Ficha de Cremación N° '+string(ll_max_folio)+' Contrato N° '+is_base+'-'+is_serie+'-'+string(ll_max_contrato)
						ls_texto						= 'Se Genera Ficha de Cremación Número: '+string(ll_max_folio)+'~r'+&
															'Tipo Origen: '+ls_tipo_origen+'-'+ls_descrip_tiporigen+'~r'+&
															'Tipo Solicitud: '+ls_tipo_sol_origen+'-'+ls_descrip_origen+'~r'+'~r'+&
															'Se adjunta Antecedentes'+'~r'+&
															'----------------------------'+'~r'+&
															'Fecha y hora de Recepción del Fallecido: '+string(ldt_fecha_cine,'dd/mm/yyyy')+'   '+string(ll_hora_cine,'00')+':'+string(ll_minuto_cine,'00')+' '+ls_horas+'~r'+&
															'Lugar Recepción: '+ls_desc_parque_des+'~r'+'~r'+&
															'Rut y Nombre Fallecido: '+string(ll_rut_fallecido_fall)+'-'+ls_dv_fallecido+'    '+ls_nombres_fall+' '+ls_apellido_paterno_fall+' '+ls_apellido_materno_fall+'~r'+&
															'Fecha Defunción: '+string(ldt_fecha_defuncion_fall,'dd/mm/yyyy')+'~r'+'~r'+&
															'Rut y Nombre Titular: '+string(ll_rut_tit)+'-'+ls_dv_tit+'    '+ls_nombre_tit+' '+ls_ap_pat_tit+' '+ls_ap_mat_tit
						select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
						INTO 		:ls_res
						from 		DUAL;
						if ls_res='OK' then
							messagebox("Envio Email","Envio Email Exitoso")
						else
							messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
						end if
					end if
				
				end if
				SELECT 	"CADENA"."ESTADO_GESTION_CREMATORIO"  
				INTO 		:ll_estado_gestion_fun  
				FROM 	"CADENA"  
				WHERE	( "CADENA"."CODIGO" = :is_base ) AND  
							( "CADENA"."SERIE" = :is_serie ) AND  
							( "CADENA"."NUMERO" = :ll_max_contrato )  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ll_estado_gestion_fun=0 then
						UPDATE 	"CADENA"  
						SET 		"ESTADO_GESTION_CREMATORIO" = 1  
						WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
									( "CADENA"."SERIE" = :is_serie ) AND  
									( "CADENA"."NUMERO" = :ll_max_contrato ) 
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				end if
				
				ll_tot_reg		= tab_crematorio.tabpage_6.dw_archivos.rowcount()
				if tab_crematorio.tabpage_6.dw_archivos.rowcount() > 0 and tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 then 
					cb_crear_prelacion.triggerevent(clicked!)
//				else
//					tab_crematorio.tabpage_6.dw_archivos.reset()
//					if tab_crematorio.tabpage_6.dw_archivos.update()=1 then
//						commit;
//					else
//						rollback;
//					end if
				end if
				ll_tot_reg		= tab_crematorio.tabpage_6.dw_archivos.rowcount()
				if ll_tot_reg > 0 then
					for ll_indi=1 to ll_tot_reg
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'folio_crematorio',ll_max_folio)
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'base',is_base)
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'serie',is_serie)
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'numero',ll_max_contrato)
					next
					if tab_crematorio.tabpage_6.dw_archivos.update()=1 then
						commit;
					else
						rollback;
					end if
				end if
				il_folio						= ll_max_folio
				il_grabar						= 0
				// Insertar Fallecido - Mirko 12/06/2022
				ll_nm							= 0	//tab_crematorio.tabpage_1.dw_ficha.getitemnumber(ll_indi,'correlativo_mensual')
				ll_nl							= 0	//tab_crematorio.tabpage_1.dw_ficha.getitemnumber(ll_indi,'correlativo_anual')
				ls_cod_regis					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'cod_registro_pase')
				ls_estado_ctto				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'estado_contrato')
				ls_inscripcion_pase		= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'inscripcion_pase')
				ls_pase_sepult				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'registro_pase')
				ll_funeraria					= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'codigo_funeraria')
				ls_causa_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'causa_fallecimiento')
				ls_sexo_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'sexo')
				ll_edad_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'edad_numero')
				ldt_fec_nac					= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
				ls_obs_sep_comp			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
				ll_rut_fallecido_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
				ls_dv_fallecido				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
				ls_nombres_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres')
				ls_apellido_paterno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno')
				ls_apellido_materno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno')
				ldt_fecha_defuncion_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
				ll_cod_parque_des			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_destino')
				ldt_fecha_cine				= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
//				if isnull(ldt_fecha_cine) or date(ldt_fecha_cine) = date('01/01/1900') then 
					ldt_fecha_cine			= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
//				end if
				if isnull(ldt_fecha_cine) or date(ldt_fecha_cine) = date('01/01/1900') then
//					messagebox("Advertencia","No es posible Ingresar Fallecido, NO tiene Fecha Cremación")
				else
					ll_parque						= 142
					SELECT	"COD_PARQ"."NOMBRE"  
					INTO 		:ls_descrip_parque  
					FROM 	"COD_PARQ"  
					WHERE 	"COD_PARQ"."CODIGO" = :ll_parque
					USING	sqlca;
					SELECT	"FUNERARIA"."NOMBRE"  
					INTO 		:ls_funeraria  
					FROM 	"FUNERARIA"  
					WHERE 	"FUNERARIA"."RUT" = :ll_funeraria   ;
					
					if isnull(ls_funeraria) or ls_funeraria='' then ls_funeraria='-'
					
					SELECT	"COMUNA"."COMUNA"  
					INTO 		:ls_otorgado_por  
					FROM 	"COMUNA"  
					WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_cod_regis   
					USING	sqlca;
					
					SELECT   	 "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
					INTO 			:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
					FROM		  	"FALLECIDOS"
					WHERE		//"FALLECIDOS"."NOMBRES" = :ls_nombres_fall AND
									//"FALLECIDOS"."AP_PATERNO" = :ls_apellido_paterno_fall AND
									//"FALLECIDOS"."AP_MATERNO" = :ls_apellido_materno_fall AND
									"FALLECIDOS"."RUT" = :ll_rut_fallecido_fall AND
									"FALLECIDOS"."DV" = :ls_dv_fallecido AND
									"FALLECIDOS"."ESTADO_REG" = 'A'
					USING		Trans_1;
					if Trans_1.sqlcode=0 then
						if ldt_fec_sepult_s = ldt_fecha_cine and ls_tipo_ficha_s = 'FC' then
							ls_nuevo		= 'N'
						else
							ls_nuevo		= 'S'
						end if
					else
						ls_nuevo			= 'S'
					end if
					if isnull(ldt_fec_sepult_s) or date(ldt_fec_sepult_s) = date('01/01/1900') then setnull(ldt_fec_sepult_s)
					if isnull(ldt_fec_nac_s) or date(ldt_fec_nac_s) = date('01/01/1900') then setnull(ldt_fec_nac_s)
					if isnull(ldt_fec_fall_s) or date(ldt_fec_fall_s) = date('01/01/1900') then setnull(ldt_fec_fall_s)
					if isnull(ldt_fecha_ult_mod_s) or date(ldt_fecha_ult_mod_s) = date('01/01/1900') then setnull(ldt_fecha_ult_mod_s)
					if isnull(ldt_fecha_exhum_s) or date(ldt_fecha_exhum_s) = date('01/01/1900') then setnull(ldt_fecha_exhum_s)
					if isnull(ldt_fecha_inhuma_s) or date(ldt_fecha_inhuma_s) = date('01/01/1900') then setnull(ldt_fecha_inhuma_s)
					if isnull(ldt_fecha_ti_s) or date(ldt_fecha_ti_s) = date('01/01/1900') then setnull(ldt_fecha_ti_s)
					if isnull(ldt_fecha_te_s) or date(ldt_fecha_te_s) = date('01/01/1900') then setnull(ldt_fecha_te_s)
					if isnull(ldt_fecha_re_s) or date(ldt_fecha_re_s) = date('01/01/1900') then setnull(ldt_fecha_re_s)
					if isnull(ldt_fecha_tr_s) or date(ldt_fecha_tr_s) = date('01/01/1900') then setnull(ldt_fecha_tr_s)
					if isnull(ldt_fecha_crem_s) or date(ldt_fecha_crem_s) = date('01/01/1900') then setnull(ldt_fecha_crem_s)
					if isnull(ldt_fecha_crea_s) or date(ldt_fecha_crea_s) = date('01/01/1900') then setnull(ldt_fecha_crea_s)
					if ls_nuevo='S' then
						if ll_rut_fallecido_fall = ll_rut_tit then
							SELECT	"CLIENTE"."ESTADO_TITULAR"  
							INTO 		:ls_estado_tit  
							FROM 	"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
							USING	sqlca;
							if sqlca.sqlcode=0 then
								UPDATE	"CLIENTE"  
								SET 		"ESTADO_TITULAR" = '1'  
								WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									commit;
								else
									rollback;
								end if
							end if
						end if
					else
						if   ll_n_l_s<>ll_nl or ll_n_m_s<>ll_nm or base_s<>ls_base or serie_s<>ls_serie or numero_s<>ll_numero or &
							ls_nombre_s<>ls_nombres_fall or ls_ap_pat_s<>ls_apellido_paterno_fall or ls_ap_mat_s<>ls_apellido_materno_fall or ldt_fec_sepult_s<>ldt_fecha_cine or ls_est_s<>'AN' or &
							ll_rut_s<>ll_rut_fallecido_fall or ls_dv_s<>ls_dv_fallecido or ls_sexo_s<>ls_sexo_fall or ll_edad_s<>ll_edad_fall or ls_periodo_s<>ls_periodo_nacimiento or ldt_fec_nac_s<>ldt_fec_nac or &
							ldt_fec_fall_s<>ldt_fecha_defuncion_fall or ls_pase_s<>ls_pase_sepult or ls_otorgado_por_s<>ls_otorgado_por or ls_causa_fall_s<>ls_causa_fall or ls_funeraria_s<>ls_funeraria or &
							ls_observaciones_s<>ls_obs_sep_comp or ls_estado_contrato_s<>ls_estado_ctto or ls_resol_traslado_nro_s<>ls_inscripcion_pase or &
							ls_cementerio_origen_s<>ls_descrip_parque or ll_cod_parque_s<>ll_parque then
								
							UPDATE 	"FALLECIDOS"  
							SET 		"BASE" = :ls_base,   
										"SS" = :ls_serie,   
										"CONTRATO" = :ll_numero,   
										"SECTOR" = :ls_sector_s,   
										"N_SEP" = :ls_sepultura_s,   
										"NOMBRES" = :ls_nombres_fall,   
										"AP_PATERNO" = :ls_apellido_paterno_fall,   
										"AP_MATERNO" = :ls_apellido_materno_fall,   
										"FEC_SEP" = :ldt_fecha_cine,   
										"EST" = 'AN',   
										"RUT" = :ll_rut_fallecido_fall,   
										"DV" = :ls_dv_fallecido,   
										"SEXO" = :ls_sexo_fall,   
										"EDAD" = :ll_edad_fall,   
										"PERIODO" = :ls_periodo_nacimiento,   
										"FEC_NAC" = :ldt_fec_nac,   
										"FEC_FALL" = :ldt_fecha_defuncion_fall,   
										"PASE" = :ls_inscripcion_pase,   
										"REG_CIVIL" = :ls_otorgado_por,   
										"CAUSA_FALL" = :ls_causa_fall,   
										"FUNERARIA" = :ls_funeraria,   
										"N_TEC" = :ls_n_tec_s,   
										"NIVEL" = :ls_nivel_s,   
										"OBSERVACIONES" = :ls_obs_sep_comp,   
										"ESTADO_CONTRATO" = :ls_estado_ctto,   
										"RESOLUCION_TRASLADO_NRO" = :ls_pase_sepult,   
										"OTORGADO_POR" = :ls_otorgado_por,   
										"CEMENTERIO_ORIGEN" = :ls_descrip_parque,   
										"COD_PARQUE" = :ll_parque,   
										"LLAVE_ANTERIOR" = :ll_llave_anterior_s,   
										"NRO_SARCOFAGO" = :ls_nro_sarcofago_s,   
										"USUARIO_ULT_MOD" = :gs_user,   
										"FECHA_ULT_MOD" = :gdt_fec_sistema   
							WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave_s  
							USING	Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
								INSERT INTO "LOG_FALLECIDOS"  
											( "LLAVE",  		"FOLIO",   				"N_L",   		"N_M",   		"BASE",   		"SS",   		"CONTRATO",   		"SECTOR",   	"N_SEP",   			"NOMBRES",   		"AP_PATERNO",   	"AP_MATERNO",   		"FEC_SEP",   			"EST",   		"OP",   		"RUT",   		"DV",   		"SEXO",   		"EDAD",   		"PERIODO",   		"FEC_NAC",   		"FEC_FALL",   		"PASE",   		"REG_CIVIL",   				"CAUSA_FALL",   	"ENF_OBL",   		"FUNERARIA",   		"BOLETA",   		"CARTA_AUT",   	"RG_EST",   			"N_TEC",   		"NIVEL",   		"VTA",   		"OBSERVACIONES",   		"ESTADO_CONTRATO",   		"RESOLUCION_TRASLADO_NRO",   	"OTORGADO_POR",   		"CEMENTERIO_ORIGEN",   	"COD_PARQUE",   		"USUARIO_CREA",   	"MOTIVO_CREA" )  
								VALUES 	( :ll_llave_s,  	:ll_count_parque_s,   	:ll_n_l_s,   	:ll_n_m_s,   :base_s,   		:serie_s,   	:numero_s,  	 		:ls_sector_s,   	:ls_sepultura_s,   	:ls_nombre_s,   	:ls_ap_pat_s,   		:ls_ap_mat_s,   		:ldt_fec_sepult_s,   	:ls_est_s,  	:ls_op_s,   	:ll_rut_s,   	:ls_dv_s,   	:ls_sexo_s,   	:ll_edad_s,   	:ls_periodo_s,   	:ldt_fec_nac_s,   	:ldt_fec_fall_s,   	:ls_pase_s,   	:ls_otorgado_por_s,   	:ls_causa_fall_s,   	:ls_enf_obl_s,   	:ls_funeraria_s,   		:ls_boleta_s, 	:ls_carta_aut_s,   	:ll_corr_hist_reg_s,   	:ls_n_tec_s,   	:ls_nivel_s,   	:ls_vta_s, 	:ls_observaciones_s,  	:ls_estado_contrato_s,   			:ls_resol_traslado_nro_s,   				:ls_otorgado_por_s,   	:ls_cementerio_origen_s,   	:ll_cod_parque_s,   	:gs_user,   				'FC' ) 
								USING	Trans_1;
								if Trans_1.sqlcode=0 then
									commit using Trans_1;
								else
									rollback using Trans_1;
								end if
							else
								rollback using Trans_1;
							end if
						end if
						
					end if
				end if
				//Fin Codigo Falecido - Mirko 
				ll_res_limpiar		= messagebox("Grabar","Grabación Exitosa Ficha Crematorio N° "+string(ll_max_folio,'###,###,###,###,##0')+" Contrato N° "+is_base+'-'+is_serie+'-'+string(ll_max_contrato,'###,###,###,###')+", desea Limpiar Ventana",Exclamation!,YesNo!,2)
				if ll_res_limpiar=1 then cb_limpiar.triggerevent(clicked!)
			else
				rollback;
				messagebox("Error al Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
			end if
		end if
	//elseif ls_valido = 'S' and ll_folio_fc > 0 then
	elseif ll_folio_fc > 0 then
		ll_max_folio		= ll_folio_fc
		ll_tot_reg		= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ls_parentesco_prela	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'parentesco')
				ll_rut_prela				= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'rut')
				ls_dv_prela				= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'dv')
				ls_nombre_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'nombres')
				ls_ap_pat_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_paterno')
				ls_ap_mat_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_materno')
				ls_tipo_via_prela		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'tipo_via')
				if isnull(ls_parentesco_prela) or isnull(ll_rut_prela) or isnull(ls_dv_prela) or isnull(ls_nombre_prela) or isnull(ls_ap_pat_prela) or &
					isnull(ls_ap_mat_prela) or isnull(ls_tipo_via_prela) then
					tab_crematorio.tabpage_4.dw_prelacion.deleterow(ll_indi)
					ll_tot_reg			= ll_tot_reg - 1
				end if
				if ll_indi > ll_tot_reg then exit
			next
		end if
		tab_crematorio.tabpage_4.dw_prelacion.accepttext()
		ll_tot_reg		= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'folio_crematorio',ll_max_folio)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'base',ls_base)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'serie',ls_serie)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'numero',ll_numero)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_ficha',ls_estado_reg_ficha)
				ls_estado_reg	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'estado_reg')
				if isnull(ls_estado_reg) then tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_reg','A')
			next
		end if
		if tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 and tab_crematorio.tabpage_6.dw_archivos.rowcount() = 0 then 
			cb_crear_prelacion.triggerevent(clicked!)
//		else
//			tab_crematorio.tabpage_6.dw_archivos.reset()
//			if tab_crematorio.tabpage_6.dw_archivos.update()=1 then
//				commit;
//			else
//				rollback;
//			end if
		end if
		ll_tot_reg		= tab_crematorio.tabpage_6.dw_archivos.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'folio_crematorio',ll_folio_fc)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'base',ls_base)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'serie',ls_serie)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'numero',ll_numero)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'estado_reg','A')
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'fecha_crea',gdt_fec_sistema)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'usuario_crea',gs_user)
				if isnull(tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'estado_carga')) then
					tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'estado_carga','N')
				end if
			next
		end if
		tab_crematorio.tabpage_6.dw_archivos.accepttext()
		ll_tot_reg		= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'folio_crematorio',ll_folio_fc)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'base',ls_base)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'serie',ls_serie)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'numero',ll_numero)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_ficha',ls_estado_reg_ficha)
				if isnull(tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'estado_reg')) then
					tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_reg','A')
				end if
			next
		end if
		tab_crematorio.tabpage_4.dw_prelacion.accepttext()
		if is_ag_crem = 'S' then
			ldt_fecha_cremacion			= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
			ll_hora_fijada					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
			ll_minuto_fijada				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
			if ll_hora_fijada > 0 then
				UPDATE 	"FC_AGENDA_CREMATORIO"  
				SET 		"FECHA_CREMACION" = :ldt_fecha_cremacion,   
							"HORA_CINERACION" = :ll_hora_fijada,   
							"MINUTO_CINERACION" = :ll_minuto_fijada  
				WHERE 	"FC_AGENDA_CREMATORIO"."FOLIO_CREMATORIO" = :ll_folio_fc  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

			end if
		end if
		if is_ag_capi = 'S' and is_tipo_venta='CV' then
			ls_uso							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
			ldt_fecha_cremacion			= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla')
			ll_hora_fijada					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_capilla')
			ll_minuto_fijada				= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minutos_uso_capilla')
			if ll_hora_fijada > 0 then
				UPDATE 	"FC_AGENDA_CAPILLA"  
				SET 		"FECHA_CREMACION" = :ldt_fecha_cremacion,   
							"HORA_CINERACION" = :ll_hora_fijada,   
							"MINUTO_CINERACION" = :ll_minuto_fijada  
				WHERE 	"FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :ll_folio_fc  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM "FC_AGENDA_PERGOLA"  
					WHERE 		"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :ll_folio_fc
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
		end if
		if is_ag_pergo='S' and is_tipo_venta='CV' then
			ls_uso							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
			ldt_fecha_cremacion			= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_pergola')
			ll_hora_fijada					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_pergola')
			ll_minuto_fijada				= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_uso_pergola')
			if ll_hora_fijada > 0 then
				UPDATE 	"FC_AGENDA_PERGOLA"  
				SET 		"FECHA_CREMACION" = :ldt_fecha_cremacion,   
							"HORA_CINERACION" = :ll_hora_fijada,   
							"MINUTO_CINERACION" = :ll_minuto_fijada  
				WHERE 	"FC_AGENDA_PERGOLA"."FOLIO_CREMATORIO" = :ll_folio_fc  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
					DELETE FROM "FC_AGENDA_CAPILLA"  
					WHERE 		"FC_AGENDA_CAPILLA"."FOLIO_CREMATORIO" = :ll_folio_fc
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
		end if
		if is_ag_ing = 'S' then
			ldt_fecha_cremacion			= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
			ll_hora_fijada					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_cineracion')
			ll_minuto_fijada				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_cineracion')
			if ll_hora_fijada > 0 then
				UPDATE 	"FC_AGENDA_ING_PARQUE"  
				SET 		"FECHA_CREMACION" = :ldt_fecha_cremacion,   
							"HORA_CINERACION" = :ll_hora_fijada,   
							"MINUTO_CINERACION" = :ll_minuto_fijada  
				WHERE 	"FC_AGENDA_ING_PARQUE"."FOLIO_CREMATORIO" = :ll_folio_fc  
				USING	sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if

			end if
		end if
		ldt_fecha_cremacion	= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
		ls_tipo_solicitud		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
		ldt_fecha_cremacion	= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla')
		if is_tipo_venta='CV' and ls_tipo_solicitud='NI' and isnull(ldt_fecha_cremacion) then
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque','S')
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		elseif is_tipo_venta='CV' and ls_tipo_solicitud<>'NI' then
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque',ls_nulo)
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		end if
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		tab_crematorio.tabpage_3.dw_titular.accepttext()
		tab_crematorio.tabpage_4.dw_prelacion.accepttext()
		tab_crematorio.tabpage_5.dw_aranceles.accepttext()
		tab_crematorio.tabpage_6.dw_archivos.accepttext()
		tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		if tab_crematorio.tabpage_1.dw_ficha.update() = 1 then 
			ll_sw_ficha ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_2.dw_fallecido.update() = 1 then 
			ll_sw_fallecido ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_3.dw_titular.update() = 1 then 
			ll_sw_titular ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_4.dw_prelacion.update() = 1 then 
			ll_sw_prelacion ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_5.dw_aranceles.update() = 1 then 
			ll_sw_arancel ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_6.dw_archivos.update() = 1 then 
			ll_sw_archivo ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_7.dw_ceremonia.update() = 1 then 
			ll_sw_ceremonia ++
			commit;
		else
			rollback;
		end if
		if tab_crematorio.tabpage_8.dw_cenizas.update() = 1 then 
			ll_sw_cenizas ++
			commit;
		else
			rollback;
		end if
		if ll_sw_ficha>0 and ll_sw_fallecido>0 and ll_sw_titular>0 and ll_sw_prelacion>0 and ll_sw_arancel>0 and ll_sw_ceremonia > 0 and ll_sw_cenizas > 0 then
//			commit;
			SELECT 	"CADENA"."ESTADO_GESTION_CREMATORIO"  
			INTO 		:ll_estado_gestion_fun  
			FROM 	"CADENA"  
			WHERE	( "CADENA"."CODIGO" = :is_base ) AND  
						( "CADENA"."SERIE" = :is_serie ) AND  
						( "CADENA"."NUMERO" = :il_numero_g )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if ll_estado_gestion_fun=0 then		// VALIDAR NO CAMBIA
					UPDATE 	"CADENA"  
					SET 		"ESTADO_GESTION_CREMATORIO" = 1  
					WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
								( "CADENA"."SERIE" = :is_serie ) AND  
								( "CADENA"."NUMERO" = :il_numero_g ) 
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
			end if
			il_folio							= ll_folio_fc
			il_grabar							= 0
			// Insertar Fallecido - Mirko 12/06/2022
			ll_nm							= 0	//tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'correlativo_mensual')
			ll_nl							= 0	//tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'correlativo_anual')
			ls_cod_regis					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'cod_registro_pase')
			ls_estado_ctto				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'estado_contrato')
			ls_inscripcion_pase		= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'inscripcion_pase')
			ls_pase_sepult				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'registro_pase')
			ll_funeraria					= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'codigo_funeraria')
			ls_causa_fall				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'causa_fallecimiento')
			ls_sexo_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'sexo')
			ll_edad_fall					= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'edad_numero')
			ldt_fec_nac					= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_nacimiento')
			ls_obs_sep_comp			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
			ll_rut_fallecido_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
			ls_dv_fallecido				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
			ls_nombres_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres')
			ls_apellido_paterno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno')
			ls_apellido_materno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno')
			ldt_fecha_defuncion_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
			ll_cod_parque_des			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_destino')
			ldt_fecha_cine				= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
			
			if isnull(ldt_fecha_cine) or date(ldt_fecha_cine) = date('01/01/1900') then 
				ldt_fecha_cine			= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
			end if

			ll_parque						= 142

			SELECT	"COD_PARQ"."NOMBRE"  
			INTO 		:ls_descrip_parque  
			FROM 	"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :ll_parque
			USING	sqlca;
			SELECT	"FUNERARIA"."NOMBRE"  
			INTO 		:ls_funeraria  
			FROM 	"FUNERARIA"  
			WHERE 	"FUNERARIA"."RUT" = :ll_funeraria   ;
			if isnull(ls_funeraria) or ls_funeraria='' then ls_funeraria='-'

			SELECT	"COMUNA"."COMUNA"  
			INTO 		:ls_otorgado_por  
			FROM 	"COMUNA"  
			WHERE 	"COMUNA"."CODIGO_COMUNA" = :ls_cod_regis   
			USING	sqlca;

			SELECT   	 "LLAVE",		"FOLIO",					"N_L",		"N_M",		"BASE",		"SS",			"CONTRATO",		"SECTOR",	"N_SEP",				"NOMBRES",		"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",			"EST",		"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",			"PASE",		"REG_CIVIL",			"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",		"BOLETA",		"CARTA_AUT",		"RG_EST",				"N_TEC",		"NIVEL",			"VTA",		"OBSERVACIONES",		"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",		"COD_PARQUE",		"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",	"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",	"FECHA_EXHUMACION",		"ESTADO_INHUMACION",	"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",	"FECHA_CREMATORIO",	"ESTADO_REG",	"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"USUARIO_CREA",		"FECHA_CREA",		"TIPO_FICHA",		"RESOLUCION_TRASLADO_NRO"
			INTO 			:ll_llave_s,	:ll_count_parque_s,	:ll_n_l_s,	:ll_n_m_s,	:base_s,		:serie_s,		:numero_s,		:ls_sector_s,	:ls_sepultura_s,	:ls_nombre_s,	:ls_ap_pat_s,		:ls_ap_mat_s,		:ldt_fec_sepult_s,	:ls_est_s,	:ls_op_s,	:ll_rut_s,	:ls_dv_s,	:ls_sexo_s,	:ll_edad_s,	:ls_periodo_s,	:ldt_fec_nac_s,	:ldt_fec_fall_s,		:ls_pase_s,	:ls_otorgado_por_s,	:ls_causa_fall_s,	:ls_enf_obl_s,	:ls_funeraria_s,	:ls_boleta_s,	:ls_carta_aut_s,	:ll_corr_hist_reg_s,	:ls_n_tec_s,	:ls_nivel_s,		:ls_vta_s,	:ls_observaciones_s,   	:ls_estado_contrato_s,	:ls_registro_pase_s,					:ls_otorgado_por_s,	:ls_cementerio_origen_s,	:ll_cod_parque_s,		:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,	:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,			:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,			:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,			:ldt_fecha_crem_s,		:ls_estado_reg_s,	:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ls_usuario_crea_s,	:ldt_fecha_crea_s,		:ls_tipo_ficha_s,	:ls_resol_traslado_nro_s
			FROM		  	"FALLECIDOS"
			WHERE		//"FALLECIDOS"."NOMBRES" = :ls_nombres_fall AND
							//"FALLECIDOS"."AP_PATERNO" = :ls_apellido_paterno_fall AND
							//"FALLECIDOS"."AP_MATERNO" = :ls_apellido_materno_fall AND
							"FALLECIDOS"."RUT" = :ll_rut_fallecido_fall AND
							"FALLECIDOS"."DV" = :ls_dv_fallecido AND
							"FALLECIDOS"."ESTADO_REG" = 'A'
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				if ldt_fec_sepult_s = ldt_fecha_cine and ls_tipo_ficha_s = 'FC' then
					ls_nuevo		= 'N'
				else
					ls_nuevo		= 'S'
				end if
			else
				ls_nuevo			= 'S'
			end if
			if isnull(ldt_fec_sepult_s) or date(ldt_fec_sepult_s) = date('01/01/1900') then setnull(ldt_fec_sepult_s)
			if isnull(ldt_fec_nac_s) or date(ldt_fec_nac_s) = date('01/01/1900') then setnull(ldt_fec_nac_s)
			if isnull(ldt_fec_fall_s) or date(ldt_fec_fall_s) = date('01/01/1900') then setnull(ldt_fec_fall_s)
			if isnull(ldt_fecha_ult_mod_s) or date(ldt_fecha_ult_mod_s) = date('01/01/1900') then setnull(ldt_fecha_ult_mod_s)
			if isnull(ldt_fecha_exhum_s) or date(ldt_fecha_exhum_s) = date('01/01/1900') then setnull(ldt_fecha_exhum_s)
			if isnull(ldt_fecha_inhuma_s) or date(ldt_fecha_inhuma_s) = date('01/01/1900') then setnull(ldt_fecha_inhuma_s)
			if isnull(ldt_fecha_ti_s) or date(ldt_fecha_ti_s) = date('01/01/1900') then setnull(ldt_fecha_ti_s)
			if isnull(ldt_fecha_te_s) or date(ldt_fecha_te_s) = date('01/01/1900') then setnull(ldt_fecha_te_s)
			if isnull(ldt_fecha_re_s) or date(ldt_fecha_re_s) = date('01/01/1900') then setnull(ldt_fecha_re_s)
			if isnull(ldt_fecha_tr_s) or date(ldt_fecha_tr_s) = date('01/01/1900') then setnull(ldt_fecha_tr_s)
			if isnull(ldt_fecha_crem_s) or date(ldt_fecha_crem_s) = date('01/01/1900') then setnull(ldt_fecha_crem_s)
			if isnull(ldt_fecha_crea_s) or date(ldt_fecha_crea_s) = date('01/01/1900') then setnull(ldt_fecha_crea_s)
			if ls_nuevo='S' then
				if ll_rut_fallecido_fall = ll_rut_tit then
					SELECT	"CLIENTE"."ESTADO_TITULAR"  
					INTO 		:ls_estado_tit  
					FROM 	"CLIENTE"  
					WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						UPDATE	"CLIENTE"  
						SET 		"ESTADO_TITULAR" = '1'  
						WHERE 	"CLIENTE"."RUT" = :ll_rut_tit   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					end if
				end if
			else
				if   ll_n_l_s<>ll_nl or ll_n_m_s<>ll_nm or base_s<>ls_base or serie_s<>ls_serie or numero_s<>ll_numero or &
					ls_nombre_s<>ls_nombres_fall or ls_ap_pat_s<>ls_apellido_paterno_fall or ls_ap_mat_s<>ls_apellido_materno_fall or ldt_fec_sepult_s<>ldt_fecha_cine or ls_est_s<>'AN' or &
					ll_rut_s<>ll_rut_fallecido_fall or ls_dv_s<>ls_dv_fallecido or ls_sexo_s<>ls_sexo_fall or ll_edad_s<>ll_edad_fall or ls_periodo_s<>ls_periodo_nacimiento or ldt_fec_nac_s<>ldt_fec_nac or &
					ldt_fec_fall_s<>ldt_fecha_defuncion_fall or ls_pase_s<>ls_pase_sepult or ls_otorgado_por_s<>ls_otorgado_por or ls_causa_fall_s<>ls_causa_fall or ls_funeraria_s<>ls_funeraria or &
					ls_observaciones_s<>ls_obs_sep_comp or ls_estado_contrato_s<>ls_estado_ctto or ls_resol_traslado_nro_s<>ls_inscripcion_pase or &
					ls_cementerio_origen_s<>ls_descrip_parque or ll_cod_parque_s<>ll_parque then
						
					UPDATE 	"FALLECIDOS"  
					SET 		"BASE" = :ls_base,   
								"SS" = :ls_serie,   
								"CONTRATO" = :ll_numero,   
								"SECTOR" = :ls_sector_s,   
								"N_SEP" = :ls_sepultura_s,   
								"NOMBRES" = :ls_nombres_fall,   
								"AP_PATERNO" = :ls_apellido_paterno_fall,   
								"AP_MATERNO" = :ls_apellido_materno_fall,   
								"FEC_SEP" = :ldt_fecha_cine,   
								"EST" = 'AN',   
								"RUT" = :ll_rut_fallecido_fall,   
								"DV" = :ls_dv_fallecido,   
								"SEXO" = :ls_sexo_fall,   
								"EDAD" = :ll_edad_fall,   
								"PERIODO" = :ls_periodo_nacimiento,   
								"FEC_NAC" = :ldt_fec_nac,   
								"FEC_FALL" = :ldt_fecha_defuncion_fall,   
								"PASE" = :ls_inscripcion_pase,   
								"REG_CIVIL" = :ls_otorgado_por,   
								"CAUSA_FALL" = :ls_causa_fall,   
								"FUNERARIA" = :ls_funeraria,   
								"N_TEC" = :ls_n_tec_s,   
								"NIVEL" = :ls_nivel_s,   
								"OBSERVACIONES" = :ls_obs_sep_comp,   
								"ESTADO_CONTRATO" = :ls_estado_ctto,   
								"RESOLUCION_TRASLADO_NRO" = :ls_pase_sepult,   
								"OTORGADO_POR" = :ls_otorgado_por,   
								"CEMENTERIO_ORIGEN" = :ls_descrip_parque,   
								"COD_PARQUE" = :ll_parque,   
								"LLAVE_ANTERIOR" = :ll_llave_anterior_s,   
								"NRO_SARCOFAGO" = :ls_nro_sarcofago_s,   
								"USUARIO_ULT_MOD" = :gs_user,   
								"FECHA_ULT_MOD" = :gdt_fec_sistema   
					WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave_s  
					USING	Trans_1;
					if Trans_1.sqlcode=0 then
						commit using Trans_1;
						INSERT INTO "LOG_FALLECIDOS"  
									( "LLAVE",  		"FOLIO",   				"N_L",   		"N_M",   		"BASE",   		"SS",   		"CONTRATO",   		"SECTOR",   	"N_SEP",   			"NOMBRES",   		"AP_PATERNO",   	"AP_MATERNO",   		"FEC_SEP",   			"EST",   		"OP",   		"RUT",   		"DV",   		"SEXO",   		"EDAD",   		"PERIODO",   		"FEC_NAC",   		"FEC_FALL",   		"PASE",   		"REG_CIVIL",   				"CAUSA_FALL",   	"ENF_OBL",   		"FUNERARIA",   		"BOLETA",   		"CARTA_AUT",   	"RG_EST",   			"N_TEC",   		"NIVEL",   		"VTA",   		"OBSERVACIONES",   		"ESTADO_CONTRATO",   		"RESOLUCION_TRASLADO_NRO",   	"OTORGADO_POR",   		"CEMENTERIO_ORIGEN",   	"COD_PARQUE",   		"USUARIO_CREA",   	"MOTIVO_CREA" )  
						VALUES 	( :ll_llave_s,  	:ll_count_parque_s,   	:ll_n_l_s,   	:ll_n_m_s,   :base_s,   		:serie_s,   	:numero_s,  	 		:ls_sector_s,   	:ls_sepultura_s,   	:ls_nombre_s,   	:ls_ap_pat_s,   		:ls_ap_mat_s,   		:ldt_fec_sepult_s,   	:ls_est_s,  	:ls_op_s,   	:ll_rut_s,   	:ls_dv_s,   	:ls_sexo_s,   	:ll_edad_s,   	:ls_periodo_s,   	:ldt_fec_nac_s,   	:ldt_fec_fall_s,   	:ls_pase_s,   	:ls_otorgado_por_s,   	:ls_causa_fall_s,   	:ls_enf_obl_s,   	:ls_funeraria_s,   		:ls_boleta_s, 	:ls_carta_aut_s,   	:ll_corr_hist_reg_s,   	:ls_n_tec_s,   	:ls_nivel_s,   	:ls_vta_s, 	:ls_observaciones_s,  	:ls_estado_contrato_s,   			:ls_resol_traslado_nro_s,   				:ls_otorgado_por_s,   	:ls_cementerio_origen_s,   	:ll_cod_parque_s,   	:gs_user,   				'FC' ) 
						USING	Trans_1;
						if Trans_1.sqlcode=0 then
							commit using Trans_1;
						else
							rollback using Trans_1;
						end if
					else
						rollback using Trans_1;
					end if
				end if
				
			end if
			//Codigo Fallecido - Mirko 
			
			ll_res_limpiar					= messagebox("Grabar","Grabación Exitosa Ficha Crematorio N° "+string(ll_folio_fc,'###,###,###,###,##0')+" Contrato N° "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+", desea Limpiar Ventana",Exclamation!,YesNo!,2)
			
			ll_res_correo					= messagebox("Envio Email","Desea Enviar Correo de Aviso Administrador Crematorio",Exclamation!,YesNo!,2)
			if ll_res_correo=1 then
				ls_tipo_origen				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_origen')
				ls_tipo_sol_origen			= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'tipo_solicitud_origen')
				ldt_fecha_cine				= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
				ll_hora_cine					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_cineracion')
				ll_minuto_cine				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_cineracion')
				ll_rut_fallecido_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
				ls_dv_fallecido				= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
				ls_nombres_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres')
				ls_apellido_paterno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno')
				ls_apellido_materno_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno')
				ldt_fecha_defuncion_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
				ll_cod_parque_des			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_destino')
				if date(ldt_fecha_cine) = date('01/01/1900') then setnull(ldt_fecha_cine)
				if date(ldt_fecha_defuncion_fall) = date('01/01/1900') then setnull(ldt_fecha_defuncion_fall)
				SELECT 	"COD_PARQ"."NOMBRE"  
				INTO 		:ls_desc_parque_des  
				FROM 	"COD_PARQ"  
				WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque_des  ;
				ll_rut_tit						= tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular')
				ls_dv_tit						= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'dv_titular')
				ls_nombre_tit				= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'nombres')
				ls_ap_pat_tit				= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_paterno')
				ls_ap_mat_tit				= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_materno')
				SELECT 	"FC_TIPO_SOLICITUD_ORIGEN"."DESCRIPCION"  
				INTO 		:ls_descrip_origen  
				FROM 	"FC_TIPO_SOLICITUD_ORIGEN"  
				WHERE ( "FC_TIPO_SOLICITUD_ORIGEN"."TIPO_ORIGEN" = :ls_tipo_origen ) AND  
						  ( "FC_TIPO_SOLICITUD_ORIGEN"."TIPO_SOLICITUD_ORIGEN" = :ls_tipo_sol_origen )   ;
						  
				SELECT 	"FC_TIPO_ORIGEN"."DESCRIPCION"  
				INTO 		:ls_descrip_tiporigen 
				FROM 	"FC_TIPO_ORIGEN"  
				WHERE 	"FC_TIPO_ORIGEN"."TIPO_ORIGEN" = :ls_tipo_origen   ;

				if isnull(ls_tipo_origen) then
					messagebox("Advertencia","Debe Ingresar Tipo Origen")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_origen')
				elseif isnull(ls_tipo_sol_origen) then
					messagebox("Advertencia","Debe Ingresar Tipo Solicitud Origen")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_solicitud_origen')
				elseif isnull(ldt_fecha_cine) then
					messagebox("Advertencia","Debe Ingresar Fecha Recepción")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
				elseif isnull(ll_hora_cine) then
					messagebox("Advertencia","Debe Ingresar Hora Recepción")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_cineracion')
				elseif isnull(ll_minuto_cine) then
					messagebox("Advertencia","Debe Ingresar Minuto Recepción")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_cineracion')
				elseif isnull(ll_rut_fallecido_fall) then
					messagebox("Advertencia","Debe Ingresar Rut Fallecido")
					tab_crematorio.SelectedTab		= 2
					tab_crematorio.tabpage_2.dw_fallecido.setfocus()
					tab_crematorio.tabpage_2.dw_fallecido.setcolumn('rut_fallecido')
				elseif isnull(ls_dv_fallecido) then
					messagebox("Advertencia","Debe Ingresar Digito Verificador Fallecido")
					tab_crematorio.SelectedTab		= 2
					tab_crematorio.tabpage_2.dw_fallecido.setfocus()
					tab_crematorio.tabpage_2.dw_fallecido.setcolumn('dv_fallecido')
				elseif isnull(ls_nombres_fall) then
					messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
					tab_crematorio.SelectedTab		= 2
					tab_crematorio.tabpage_2.dw_fallecido.setfocus()
					tab_crematorio.tabpage_2.dw_fallecido.setcolumn('nombres')
				elseif isnull(ls_apellido_paterno_fall) then
					messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
					tab_crematorio.SelectedTab		= 2
					tab_crematorio.tabpage_2.dw_fallecido.setfocus()
					tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_paterno')
				elseif isnull(ls_apellido_materno_fall) then
					messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
					tab_crematorio.SelectedTab		= 2
					tab_crematorio.tabpage_2.dw_fallecido.setfocus()
					tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_materno')
				elseif isnull(ldt_fecha_defuncion_fall) then
					messagebox("Advertencia","Debe Ingresar Fecha Defunción")
					tab_crematorio.SelectedTab		= 2
					tab_crematorio.tabpage_2.dw_fallecido.setfocus()
					tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
				
				elseif isnull(ls_desc_parque_des) then
					messagebox("Advertencia","Debe Ingresar Parque Destino")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
					
				elseif isnull(ll_rut_tit) then	
					messagebox("Advertencia","Debe Ingresar Rut Titular")
					tab_crematorio.SelectedTab		= 3
					tab_crematorio.tabpage_3.dw_titular.setfocus()
					tab_crematorio.tabpage_3.dw_titular.setcolumn('rut_titular')
				elseif isnull(ls_dv_tit) then
					messagebox("Advertencia","Debe Ingresar Digito Verificador Titular")
					tab_crematorio.SelectedTab		= 3
					tab_crematorio.tabpage_3.dw_titular.setfocus()
					tab_crematorio.tabpage_3.dw_titular.setcolumn('dv_titular')
				elseif isnull(ls_nombre_tit) then
					messagebox("Advertencia","Debe Ingresar Nombre Titular")
					tab_crematorio.SelectedTab		= 3
					tab_crematorio.tabpage_3.dw_titular.setfocus()
					tab_crematorio.tabpage_3.dw_titular.setcolumn('nombres')
				elseif isnull(ls_ap_pat_tit) then
					messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
					tab_crematorio.SelectedTab		= 3
					tab_crematorio.tabpage_3.dw_titular.setfocus()
					tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_paterno')
				elseif isnull(ls_ap_mat_tit) then
					messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
					tab_crematorio.SelectedTab		= 3
					tab_crematorio.tabpage_3.dw_titular.setfocus()
					tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_materno')
				elseif isnull(ls_descrip_origen) then
					messagebox("Advertencia","Debe Ingresar Tipo Solicitud Origen")
					tab_crematorio.SelectedTab		= 1
					tab_crematorio.tabpage_1.dw_ficha.setfocus()
					tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_solicitud_origen')
				else
					
					if ll_hora_cine < 12 then
						ls_horas					= 'AM'
					else
						ls_horas					= 'PM'
					end if
					ls_asunto					= '<< PRUEBA >> Se Reenvia Antecedentes Ficha de Cremación N° '+string(ll_max_folio)+' Contrato N° '+ls_base+'-'+ls_serie+'-'+string(ll_numero)
					ls_texto						= 'Ficha de Cremación Número:  '+string(ll_folio_fc)+'~r' +&
														'Tipo Origen:  '+ls_tipo_origen+'-'+ls_descrip_tiporigen+'~r'+&
														'Tipo Solicitud:  '+ls_tipo_sol_origen+'-'+ls_descrip_origen+'~r'+'~r' +&
														'Se adjunta Antecedentes'+'~r'+&
														'----------------------------'+'~r'+'~r'+&
														'Fecha y hora de Recepción del Fallecido:  '+string(ldt_fecha_cine,'dd/mm/yyyy')+'   '+string(ll_hora_cine,'00')+':'+string(ll_minuto_cine,'00')+' '+ls_horas+'~r'+&
														'Lugar Recepción:  '+ls_desc_parque_des+'~r'+'~r'+&
														'Rut y Nombre Fallecido:  '+string(ll_rut_fallecido_fall,'###,###,###,###')+'-'+ls_dv_fallecido+'    '+ls_nombres_fall+' '+ls_apellido_paterno_fall+' '+ls_apellido_materno_fall+'~r'+&
														'Fecha Defunción:  '+string(ldt_fecha_defuncion_fall,'dd/mm/yyyy')+'~r'+'~r'+&
														'Rut y Nombre Titular:  '+string(ll_rut_tit,'###,###,###,###')+'-'+ls_dv_tit+'    '+ls_nombre_tit+' '+ls_ap_pat_tit+' '+ls_ap_mat_tit+'~r'+'~r'+'~r'+&
														'Favor Agradecemos No Contestar a esta Casilla.'+'~r'+&
														'Si requiere efectuar consultas, solicitudes, corregir errores en el envío de datos contáctenos directamente Área Crematorio Manantial.'
					select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
					INTO 		:ls_res
					from 		DUAL;
					if ls_res='OK' then
						messagebox("Envio Email","Envio Email Exitoso")
					else
						messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
					end if
				end if
			end if
			if ll_res_limpiar=1 then cb_limpiar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error al Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type tab_crematorio from tab within w_ficha_crematorio_2
integer x = 32
integer y = 236
integer width = 3255
integer height = 1668
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_6 tabpage_6
tabpage_5 tabpage_5
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type

on tab_crematorio.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_6=create tabpage_6
this.tabpage_5=create tabpage_5
this.tabpage_7=create tabpage_7
this.tabpage_8=create tabpage_8
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_6,&
this.tabpage_5,&
this.tabpage_7,&
this.tabpage_8}
end on

on tab_crematorio.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_6)
destroy(this.tabpage_5)
destroy(this.tabpage_7)
destroy(this.tabpage_8)
end on

event selectionchanged;il_mod_archivo						= 0
if tab_crematorio.tabpage_4.dw_prelacion.rowcount() = 0 and tab_crematorio.SelectedTab = 4 then
	if is_tipo_venta <> 'SV' then messagebox("Advertencia","Recuerde en caso de ser Prelación el Titular, dar Click en Opción COPIAR TITULAR")
end if
if tab_crematorio.SelectedTab=8 then
	if tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 and ( isnull(tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'rut_responsable')) or tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'rut_responsable')=0) then
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'responsable_retiro',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'parentesco'))
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'responsable_retiro',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'parentesco'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'rut_responsable',tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(1,'rut'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'dv_responsable',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'dv'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'nombre',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'nombres'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'apellido_paterno',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'apellido_paterno'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'apellido_materno',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'apellido_materno'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fono_1',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'celular'))
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fono_2',tab_crematorio.tabpage_4.dw_prelacion.getitemstring(1,'telefono_particular'))
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
end if
end event

type tabpage_1 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Ficha"
long tabtextcolor = 33554432
string picturename = "Application!"
long picturemaskcolor = 536870912
st_agenda_ingreso st_agenda_ingreso
st_rut_dv st_rut_dv
dw_ficha dw_ficha
end type

on tabpage_1.create
this.st_agenda_ingreso=create st_agenda_ingreso
this.st_rut_dv=create st_rut_dv
this.dw_ficha=create dw_ficha
this.Control[]={this.st_agenda_ingreso,&
this.st_rut_dv,&
this.dw_ficha}
end on

on tabpage_1.destroy
destroy(this.st_agenda_ingreso)
destroy(this.st_rut_dv)
destroy(this.dw_ficha)
end on

type st_agenda_ingreso from statictext within tabpage_1
boolean visible = false
integer x = 14
integer y = 340
integer width = 626
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Ver Agenda Ingreso Parque"
boolean border = true
boolean focusrectangle = false
end type

type st_rut_dv from statictext within tabpage_1
boolean visible = false
integer x = 329
integer y = 172
integer width = 731
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Digitar Rut sin Digito Verificador"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_ficha from datawindow within tabpage_1
event ue_mousemove pbm_dwnmousemove
integer x = 18
integer y = 16
integer width = 3177
integer height = 1508
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_cabecera_crematorio_sv"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;string	ls_columna
ls_columna									= dwo.name
if ls_columna='rut_titular' then
	st_rut_dv.visible	= true
else
	st_rut_dv.visible	= false
end if
if ls_columna='t_6' then
	st_agenda_ingreso.visible	= true
else
	st_agenda_ingreso.visible	= false
end if
end event

event itemchanged;String		ls_columna,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_celular,ls_correo,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,&
			ls_cod_estado_fall,ls_causa_fall,ls_estado_ctto,ls_periodo,ls_est,ls_obs_fall,ls_op,ls_sexo,ls_reg_civil,ls_enf_obl,ls_funeraria,ls_base_ori,ls_serie_ori,ls_tipo_cob_pago,&
			ls_caja,ls_dato_ref,ls_nulo,ls_monto_total_palabra,ls_estado_ctto_actual,ls_serie_g,ls_base_g,ls_desc_ctto,ls_hora,ls_autoriza,ls_tipo_solicitud_origen
Double	ll_rut,ldb_valor
long		ll_cod_funeraria,ll_edad,ll_hora,ll_minutos,ll_numero_ori,ll_cod_parque_ori,ll_folio_pago,ll_monto_pago,ll_numero_ref,ll_nulo,ll_anno_fall,ll_contrato_g,&
			ll_hora_ingreso_cinerario,ll_minuto_ingreso_cinerario,ll_hora_cineracion,ll_minuto_cineracion,ll_count_crematorio,ll_hora_cineracin_fin,ll_min_cineracion_fin,&
			ll_res,ll_hora_actual,ll_minuto_actual
datetime	ldt_fec_sep,ldt_fec_fall,ldt_fec_nac,ldt_fecha_pago,ldt_fecha_ingreso,ldt_fecha_cineracion,ldt_nulo

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
ls_hora							= string(gdt_fec_sistema,"hh:mm")
ll_hora_actual					= long(mid(ls_hora,1,2))
ll_minuto_actual				= long(mid(ls_hora,4,2))
Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
this.accepttext()
ls_columna			= dwo.name
is_tipo_venta		= mid(ddplb_tipo_venta.text,1,2)
il_grabar ++
if ls_columna='rut_titular' then
	setnull(is_base_g);Setnull(is_serie_g);Setnull(il_numero_g)
	ll_rut				= Double(data)
	if ll_rut > 0 then
		il_count_titular ++
		if is_tipo_venta='SV' then
			SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",	"CADENA"."NUMERO",		"CADENA"."ESTADO",		  	"CADENA"."COD_PARQUE",		"ESTADO"."NOMBRE_ESTADO"   
			INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori,   			:ls_estado_ctto_actual  ,		:ll_cod_parque_ori,				:ls_desc_ctto
			FROM 	"CADENA"   ,	"ESTADO" 
			WHERE 	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
						( "CADENA"."RUT" = :ll_rut ) AND  
					  	( "CADENA"."ESTADO" = 'F' OR  "CADENA"."ESTADO" = 'B')  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_nulo)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_nulo)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'visualizar_servicio','N')
				tab_crematorio.tabpage_8.dw_cenizas.object.uso_capilla.protect				= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.protect		= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.protect		= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.protect	= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.uso_pergola.protect			= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.protect	= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.protect		= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.protect	= 1
				tab_crematorio.tabpage_8.dw_cenizas.object.visualizar_servicio.protect		= 1
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
				tab_crematorio.tabpage_8.dw_cenizas.accepttext()
			end if
		elseif is_tipo_venta='CV' then
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'origen_contrato','CV')
			SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO",   	"CADENA"."ESTADO",		  	"CADENA"."COD_PARQUE",   	"ESTADO"."NOMBRE_ESTADO"  
			INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori,   			:ls_estado_ctto_actual  ,		:ll_cod_parque_ori,				:ls_desc_ctto
			FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
			WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
						( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
						( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
						( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
						( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
						( ( "CADENA"."RUT" = :ll_rut ) AND  
						( "CADENA"."CODIGO" = 'G' ) AND  
						( "CADENA"."NUMERO" = ( 	SELECT 	MAX("CADENA"."NUMERO") 
															FROM 	"CADENA", "REVISION_CONTRATOS" 
															WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and 
																		( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and 
																		( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and 
																		( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
																		( ( "CADENA"."CODIGO" = 'G' ) AND ( "CADENA"."RUT" = :ll_rut ) ) ) ) )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
			end if
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		end if
		SELECT 	"CLIENTE"."DV", 	"CLIENTE"."NOMBRE",  	"CLIENTE"."A_PATERNO",  	"CLIENTE"."A_MATERNO",  	"CLIENTE"."CELULAR",  	"CLIENTE"."EMAIL"  
		INTO 		:ls_dv,   				:ls_nombre,   				:ls_ap_pat,   					:ls_ap_mat,   					:ls_celular,   				:ls_correo  
		FROM 	"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   ;
		if sqlca.sqlcode=0 then
			idw_detalle4.retrieve(ll_rut)
			idw_detalle14.retrieve(ll_rut)
			il_rut_titular	= ll_rut
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'rut_titular',ll_rut)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'dv_titular',ls_dv)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'nombres',ls_nombre)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'apellido_paterno',ls_ap_pat)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'apellido_materno',ls_ap_mat)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'celular',ls_celular)
			tab_crematorio.tabpage_3.dw_titular.setitem(1,'email',ls_correo)
			tab_crematorio.tabpage_3.dw_titular.accepttext()
			
			SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO",   	"CADENA"."ESTADO",		  	"CADENA"."COD_PARQUE",   	"ESTADO"."NOMBRE_ESTADO"  
			INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori,   			:ls_estado_ctto_actual  ,		:ll_cod_parque_ori,				:ls_desc_ctto
			FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
			WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
						( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
						( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
						( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
						( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
						( ( "CADENA"."RUT" = :ll_rut ) AND  
						( "CADENA"."CODIGO" = 'G' ) AND  
						( "CADENA"."NUMERO" = ( 	SELECT 	MAX("CADENA"."NUMERO") 
															FROM 	"CADENA", "REVISION_CONTRATOS" 
															WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and 
																		( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and 
																		( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and 
																		( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
																		( ( "CADENA"."CODIGO" = 'G' ) AND ( "CADENA"."RUT" = :ll_rut ) ) ) ) )  
			USING	sqlca;		

			SELECT 	"INGRESO"."TIPO_COB",  	"INGRESO"."FOLIO",	"INGRESO"."FECHA_PAGO",	"INGRESO"."COD_CAJA",		"INGRESO"."CONTRATO",		"INGRESO"."SERIE",		"INGRESO"."BASE",		sum("INGRESO"."MONTO" ) as MONTO_PAGADO  
			INTO 		:ls_tipo_cob_pago,			:ll_folio_pago,			:ldt_fecha_pago,				:ls_caja,							:ll_contrato_g,						:ls_serie_g,					:ls_base_g,					:ll_monto_pago  
			FROM 	"INGRESO"  
			WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
						( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori )  AND ( "INGRESO"."CONTRATO" = :ll_numero_ori ) AND
						( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA') AND 
						( "INGRESO"."FOLIO" = ( SELECT DISTINCT MAX("INGRESO"."FOLIO")
																FROM 	"INGRESO"  
																WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
																			( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori )  AND ( "INGRESO"."CONTRATO" = :ll_numero_ori )  AND
																			( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA')  )     )  ) )      
			GROUP BY 	"INGRESO"."TIPO_COB",   
							"INGRESO"."FOLIO",   
							"INGRESO"."FECHA_PAGO",
							"INGRESO"."COD_CAJA",
							"INGRESO"."CONTRATO",
							"INGRESO"."SERIE",
							"INGRESO"."BASE"
			USING	sqlca;
			if sqlca.sqlcode=0 then
				if ll_contrato_g = 0 or isnull(ll_contrato_g) then
					SELECT 	"CLIENTE_REZAGO"."BASE",   
								"CLIENTE_REZAGO"."SERIE",   
								"CLIENTE_REZAGO"."NUMERO"  
					INTO 		:is_base_g,   
								:is_serie_g,   
								:il_numero_g  
					FROM 	"CLIENTE_REZAGO"  
					WHERE ( "CLIENTE_REZAGO"."COD_PAGO" = :ls_tipo_cob_pago ) AND  
							( "CLIENTE_REZAGO"."FOLIO" = :ll_folio_pago ) AND  
							( "CLIENTE_REZAGO"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
							( "CLIENTE_REZAGO"."CAJA" = :ls_caja )   ;
				else
					is_base_g		= ls_base_g
					is_serie_g		= ls_serie_g
					il_numero_g		= ll_contrato_g
				end if			
				SELECT 	"INGRESO"."MONEDA_SAP", 	"INGRESO"."MONTO_UF",	"INGRESO"."CODIGO_OTRO",	"INGRESO"."COD_PARQUE"
				INTO 		:is_moneda_g,						:il_monto_g,					:is_cod_otro_g,						:il_cod_parque  
				FROM 	"INGRESO"  
				WHERE ( "INGRESO"."FOLIO" = :ll_folio_pago ) AND  
						( "INGRESO"."TIPO_COB" = :ls_tipo_cob_pago ) AND  
						( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago ) AND  
						( "INGRESO"."COD_CAJA" = :ls_caja ) AND  
						( "INGRESO"."PAGO_HIST" = 'A' ) AND  
						( "INGRESO"."MONTO" = 	(SELECT 	MAX("INGRESO"."MONTO") 
																	FROM 	"INGRESO" 
																	WHERE 	( "INGRESO"."FOLIO" = :ll_folio_pago ) AND 
																				( "INGRESO"."TIPO_COB" = :ls_tipo_cob_pago ) AND 
																				( "INGRESO"."FECHA_PAGO" = :ldt_fecha_pago ) AND 
																				( "INGRESO"."COD_CAJA" = :ls_caja ) AND 
																				( "INGRESO"."PAGO_HIST" = 'A' ))  )   ;

				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'rut_titular',ll_rut)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_cob',ls_tipo_cob_pago)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'folio_pago',ll_folio_pago)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_mov','L')
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'monto_pago',ll_monto_pago)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_moneda',is_moneda_g)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'fecha_pago',ldt_fecha_pago)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'codigo_otro',is_cod_otro_g)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'cod_caja',ls_caja)
				il_monto_g		= round(il_monto_g,4)
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'monto_contrato',il_monto_g)
				tab_crematorio.tabpage_5.dw_aranceles.accepttext()
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_pago','S')
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
			else
				if is_tipo_venta = 'CV' then		//Dejar Valido para Produccion
				//	messagebox("Advertencia","Debe Existir Pago Asociado, Antes de Generar Ficha Cremación")
					ll_res					= messagebox("Advertencia","Debe Existir Pago Asociado, desea continuar la Grabación",Exclamation!,YesNo!,2)
					if ll_res=1 then
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'rut_titular',ll_rut)
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_cob','0')
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'folio_pago',0)
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_mov','L')
						
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_moneda','2')
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'fecha_pago',date(gdt_fec_sistema))
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'codigo_otro','350')
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'cod_caja','0')
						SELECT DISTINCT "CUENTA_CONTABLE_OTROS"."VALOR"  
						INTO 		:ldb_valor  
						FROM 	"CUENTA_CONTABLE_OTROS"  
						WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '350'  
						USING	sqlca;
						if sqlca.sqlcode=0 then
							tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'monto_pago',ldb_valor)
							tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'monto_contrato',ldb_valor)
						end if
				
						tab_crematorio.tabpage_5.dw_aranceles.accepttext()
					else
						this.setitem(1,'rut_titular',ll_nulo)
						il_count_titular 		= 0
					end if
				else
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'rut_titular',ll_rut)
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_cob','0')
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'folio_pago',0)
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_mov','L')
					
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'tipo_moneda','2')
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'fecha_pago',date(gdt_fec_sistema))
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'codigo_otro','350')
					tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'cod_caja','0')
					SELECT DISTINCT "CUENTA_CONTABLE_OTROS"."VALOR"  
					INTO 		:ldb_valor  
					FROM 	"CUENTA_CONTABLE_OTROS"  
					WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = '350'  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'monto_pago',ldb_valor)
						tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'monto_contrato',ldb_valor)
					end if
					tab_crematorio.tabpage_5.dw_aranceles.accepttext()
				end if
			end if
		else
			messagebox("Advertencia","No Exite Rut Cliente")
			this.setitem(1,'rut_titular',0)
		end if
	end if
	this.accepttext()
elseif ls_columna='tipo_solicitud_origen' then
	ls_tipo_solicitud_origen	= data
	if is_tipo_venta='CV' then
		if ls_tipo_solicitud_origen='VE' then 
			cb_ficga_traslado.enabled		= true
		else
			cb_ficga_traslado.enabled		= false
		end if
	end if
	
elseif ls_columna='rut_fallecido' then
	ll_rut			= Double(data)
	if ll_rut > 0 then
		SELECT 	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",		"FICHA_SEPULTACION"."TIPO_VIA_FALLECIDO", 	"FICHA_SEPULTACION"."DIRECCION_FALL", 	"FICHA_SEPULTACION"."NUMERO_DIRECCION_FALL",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_FALL",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_FALL",	"FICHA_SEPULTACION"."CODIGO_COMUNA_FALL",	"FICHA_SEPULTACION"."CODIGO_CIUDAD_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",		"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."COD_ESTADO_FALL",	"FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO", 	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."COD_ESTADO_CONTRATO",		"FICHA_SEPULTACION"."PERIODO_NACIMIENTO",		"FICHA_SEPULTACION"."COD_TAMANO_CUERPO",	"FICHA_SEPULTACION"."OBSERVACION_FALLECIDO",		"FICHA_SEPULTACION"."COD_OBS_CUERPO",	"FICHA_SEPULTACION"."EDAD_FALLECIDO",	"FICHA_SEPULTACION"."SEXO_FALLECIDO",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."COD_PARQUE"
		INTO 		:ldt_fec_sep,   												:ls_nombre_fall,   											:ls_ap_pat_fall,   										:ls_ap_mat_fall,   											:ls_tipo_via,   												:ls_direc,   												:ls_nro,   															:ls_depto,   														:ls_block,   														:ls_comuna,   													:ls_ciudad,   												:ldt_fec_fall,   											:ldt_fec_nac,   														:ls_dv,   												:ls_cod_estado_fall,   								:ls_causa_fall,   												:ll_cod_funeraria,   										:ls_estado_ctto,   													:ls_periodo,  	 												:ls_est,   														:ls_obs_fall,   														:ls_op,													:ll_edad,													:ls_sexo,													:ll_hora,									:ll_minutos,									:ls_base_ori,							:ls_serie_ori,							:ll_numero_ori,								:ll_cod_parque_ori
		FROM 	"FICHA_SEPULTACION"  
		WHERE 	( "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut ) AND  
					("FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR  "FICHA_SEPULTACION"."ESTADO_REG" = 'G')   ;
		if sqlca.sqlcode=0 then
			ls_estado_ctto					= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'estado_contrato')
			ls_base_ori						= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base_origen')
			ls_serie_ori						= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie_origen')
			ll_numero_ori					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero_origen')
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_rut)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nombres',ls_nombre_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_paterno',ls_ap_pat_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_materno',ls_ap_mat_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'tipo_via_fallecido',ls_tipo_via)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'direccion_fallecido',ls_direc)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'numero_fallecido',ls_nro)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'depto_fallecido',ls_depto)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'block_fallecido',ls_block)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'comuna_fallecimiento',ls_comuna)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'ciudad_fallecimiento',ls_ciudad)
			idw_detalle12.retrieve(ls_ciudad)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_defuncion',ldt_fec_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_nacimiento',ldt_fec_nac)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_dv)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_cuerpo',ls_cod_estado_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'tamano_cuerpo',ls_est)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'causa_fallecimiento',ls_causa_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'codigo_funeraria',ll_cod_funeraria)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_contrato_sepultura',ls_estado_ctto)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'hora_defuncion',ll_hora)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'minuto_defuncion',ll_minutos)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'cod_parque',ll_cod_parque_ori)
			
			ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(long(ll_edad)))
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_texto',ls_monto_total_palabra)
			ll_anno_fall			= year(today()) - year(date(ldt_fec_fall))
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'annos_difunto',ll_anno_fall)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'sexo',ls_sexo)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_ori)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_ori)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_ori)
			SELECT 	"CADENA"."ESTADO",		"ESTADO"."NOMBRE_ESTADO" 
			INTO 		:ls_estado_ctto_actual,	:ls_desc_ctto
			FROM 	"CADENA" ,	"ESTADO" 
			WHERE 	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
						( "CADENA"."CODIGO" = :ls_base_ori ) AND  
						( "CADENA"."SERIE" = :ls_serie_ori ) AND  
						( "CADENA"."NUMERO" = :ll_numero_ori )   ;
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
			if is_tipo_venta='SV' then
				if ls_estado_ctto_actual='F' then
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'tipo_solicitud_origen','SF')
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'forma_venta','01')
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'origen_contrato','CI')
				elseif ls_estado_ctto_actual='B' then
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'tipo_solicitud_origen','SS')
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'forma_venta','02')
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'origen_contrato','CI')
				else
					messagebox("Advertencia","Estado Contrato Actual es "+ls_desc_ctto+", debe estar EN SENTENCIA o FOSA COMUN")
					cb_limpiar.triggerevent(clicked!)
				end if
			end if
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		else
			SELECT 	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO",	"FALLECIDOS"."FEC_SEP",	"FALLECIDOS"."EST",	"FALLECIDOS"."OP",	"FALLECIDOS"."DV",	"FALLECIDOS"."SEXO",	"FALLECIDOS"."FEC_NAC",	"FALLECIDOS"."FEC_FALL", 	"FALLECIDOS"."EDAD", 	"FALLECIDOS"."PERIODO", 	"FALLECIDOS"."REG_CIVIL", 	"FALLECIDOS"."CAUSA_FALL",	"FALLECIDOS"."ENF_OBL" ,	"FALLECIDOS"."FUNERARIA",	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS" ,	"FALLECIDOS"."CONTRATO" ,	"FALLECIDOS"."COD_PARQUE" 
			INTO 		:ls_nombre_fall,   				:ls_ap_pat_fall,   					:ls_ap_mat_fall,					:ldt_fec_sep,					:ls_cod_estado_fall,	:ls_op,					:ls_dv,					:ls_sexo,						:ldt_fec_nac,					:ldt_fec_fall,						:ll_edad,						:ls_periodo,						:ls_reg_civil,						:ls_causa_fall,						:ls_enf_obl  ,					:ls_funeraria,						:ls_base_ori,				:ls_serie_ori,			:ll_numero_ori,						:ll_cod_parque_ori
			FROM 	"FALLECIDOS"  
			WHERE 	"FALLECIDOS"."RUT" = :ll_rut  AND
						"FALLECIDOS"."ESTADO_REG" = 'A'  ;
			if sqlca.sqlcode=0 then
				SELECT 	"FUNERARIA"."RUT"  
				INTO 		:ll_cod_funeraria  
				FROM 	"FUNERARIA"  
				WHERE 	"FUNERARIA"."NOMBRE" = :ls_funeraria   ;
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_rut)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nombres',ls_nombre_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_paterno',ls_ap_pat_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_materno',ls_ap_mat_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_defuncion',ldt_fec_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_nacimiento',ldt_fec_nac)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_dv)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_cuerpo',ls_cod_estado_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'causa_fallecimiento',ls_causa_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'codigo_funeraria',ll_cod_funeraria)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
				ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(long(ll_edad)))
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_texto',ls_monto_total_palabra)
				ll_anno_fall			= year(today()) - year(date(ldt_fec_fall))
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'annos_difunto',ll_anno_fall)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'sexo',ls_sexo)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'enfermedad_obligatoria',ls_enf_obl)
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'cod_parque',ll_cod_parque_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_ori)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_ori)
				SELECT 	"CADENA"."ESTADO",		"ESTADO"."NOMBRE_ESTADO" 
				INTO 		:ls_estado_ctto_actual,	:ls_desc_ctto
				FROM 	"CADENA" ,	"ESTADO" 
				WHERE 	( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
							( "CADENA"."CODIGO" = :ls_base_ori ) AND  
							( "CADENA"."SERIE" = :ls_serie_ori ) AND  
							( "CADENA"."NUMERO" = :ll_numero_ori )   ;
				
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
				if is_tipo_venta='SV' then
					if ls_estado_ctto_actual='F' then
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'tipo_solicitud_origen','SF')
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'forma_venta','01')
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'origen_contrato','CI')
					elseif ls_estado_ctto_actual='B' then
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'tipo_solicitud_origen','SS')
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'forma_venta','02')
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'origen_contrato','CI')
					else
						messagebox("Advertencia","Estado Contrato Actual es "+ls_desc_ctto+", debe estar EN SENTENCIA o FOSA COMUN")
						cb_limpiar.triggerevent(clicked!)
					end if
				end if
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
			end if
		end if
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
elseif ls_columna='fecha_ingreso_cinerario' or ls_columna='fecha_cineracion' then
	ldt_fecha_ingreso				= dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
	ldt_fecha_cineracion			= dw_ficha.getitemdatetime(1,'fecha_cineracion')
	ll_hora_ingreso_cinerario	= dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
	ll_minuto_ingreso_cinerario	= dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
	ll_hora_cineracion				= dw_ficha.getitemnumber(1,'hora_cineracion')
	ll_minuto_cineracion			= dw_ficha.getitemnumber(1,'minuto_cineracion')
	if ls_columna='fecha_ingreso_cinerario' then
		ll_hora_cineracin_fin			= ll_hora_ingreso_cinerario + 1
		ll_min_cineracion_fin			= ll_minuto_ingreso_cinerario + 30
		if ll_min_cineracion_fin >= 60 then
			ll_min_cineracion_fin 		= 0
			ll_hora_cineracin_fin		= ll_hora_cineracin_fin + 1
		end if
	end if
	if ls_columna='fecha_cineracion' then
		ll_hora_cineracin_fin			= ll_hora_cineracion
		ll_min_cineracion_fin			= ll_minuto_cineracion + 30
		if ll_min_cineracion_fin >= 60 then
			ll_min_cineracion_fin 		= 0
			ll_hora_cineracin_fin		= ll_hora_cineracin_fin + 1
		end if
	end if
	if not isnull(ldt_fecha_ingreso) and not isnull(ldt_fecha_cineracion) then
//		if ldt_fecha_ingreso > ldt_fecha_cineracion then
//			messagebox("Advertencia","Fecha Ingreso Parque, NO puede ser Menor a Fecha Ingreso Parque")
//			dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
//			dw_ficha.accepttext()
//			dw_ficha.setcolumn('fecha_ingreso_cinerario')
//		else
		if date(ldt_fecha_ingreso) < date(gdt_fec_sistema) then
			messagebox("Advertencia","Fecha Ingreso Parque, NO puede ser Menor a Fecha Actual")
			dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('fecha_ingreso_cinerario')
		elseif ldt_fecha_ingreso < ldt_fecha_cineracion then
			messagebox("Advertencia","Fecha Cremación, NO puede ser Menor a Fecha Ingreso Parque")
			dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('fecha_ingreso_cinerario')
		elseif ldt_fecha_ingreso = ldt_fecha_cineracion then
			if ll_hora_ingreso_cinerario > ll_hora_cineracion then
				messagebox("Advertencia","Hora Cremación, NO puede ser Menor a Hora Ingreso Parque")
				dw_ficha.setitem(1,'hora_ingreso_cinerario',ll_nulo)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('hora_ingreso_cinerario')
			elseif ll_hora_ingreso_cinerario = ll_hora_cineracion and ll_minuto_ingreso_cinerario > ll_minuto_cineracion then
				messagebox("Advertencia","Minutos Cremación, NO puede ser Menor a Minutos Ingreso Parque")
				dw_ficha.setitem(1,'hora_ingreso_cinerario',ll_nulo)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('hora_ingreso_cinerario')
			end if
		elseif not isnull(ldt_fecha_ingreso) and ll_hora_ingreso_cinerario > 0 and not isnull(ll_minuto_ingreso_cinerario) then
			SELECT 	COUNT("FC_AGENDA_CREMATORIO"."EJECUTIVO")  
			INTO 		:ll_count_crematorio  
			FROM 	"FC_AGENDA_CREMATORIO" 
			WHERE ( "FC_AGENDA_CREMATORIO"."FECHA_CREMACION" = :ldt_fecha_ingreso ) AND  
					  ( "FC_AGENDA_CREMATORIO"."HORA_CINERACION" >= :ll_hora_ingreso_cinerario ) AND  
					  ( "FC_AGENDA_CREMATORIO"."MINUTO_CINERACION" >= :ll_minuto_ingreso_cinerario ) AND  
					  ( "FC_AGENDA_CREMATORIO"."HORA_CINERACION_FIN" <= :ll_hora_cineracin_fin ) AND  
					  ( "FC_AGENDA_CREMATORIO"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin )  AND
					  ( "FC_AGENDA_CREMATORIO"."NUMERO" <> :il_numero)
			USING	sqlca;
			if ll_count_crematorio > 0 then
				messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
				dw_ficha.setitem(1,'hora_ingreso_cinerario',0)
				dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('hora_ingreso_cinerario')
			end if
		
		
		elseif not isnull(ldt_fecha_cineracion) and ll_hora_cineracion > 0 and not isnull(ll_minuto_cineracion) then
			SELECT 	COUNT("FC_AGENDA_ING_PARQUE"."EJECUTIVO")  
			INTO 		:ll_count_crematorio  
			FROM 	"FC_AGENDA_ING_PARQUE" 
			WHERE ( "FC_AGENDA_ING_PARQUE"."FECHA_CREMACION" = :ldt_fecha_cineracion ) AND  
					  ( "FC_AGENDA_ING_PARQUE"."HORA_CINERACION" >= :ll_hora_cineracion ) AND  
					  ( "FC_AGENDA_ING_PARQUE"."MINUTO_CINERACION" >= :ll_minuto_cineracion ) AND  
					  ( "FC_AGENDA_ING_PARQUE"."HORA_CINERACION_FIN" <= :ll_hora_cineracin_fin ) AND  
					  ( "FC_AGENDA_ING_PARQUE"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin )  AND
					  ( "FC_AGENDA_ING_PARQUE"."NUMERO" <> :il_numero)
			USING	sqlca;
			if ll_count_crematorio > 0 then
				messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
				dw_ficha.setitem(1,'hora_cineracion',0)
				dw_ficha.setitem(1,'minuto_cineracion',0)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('hora_cineracion')
			end if
		end if
	elseif not isnull(ldt_fecha_ingreso) then
		if date(ldt_fecha_ingreso) < date(gdt_fec_sistema) then
			messagebox("Advertencia","Fecha Ingreso Parque, NO puede ser Menor a Fecha Actual")
			dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('fecha_ingreso_cinerario')
		end if
	end if
	
elseif ls_columna='base_origen' or ls_columna='serie_origen' or ls_columna='numero_origen' then
	ls_base_ori		= this.getitemstring(1,'base_origen')
	ls_serie_ori		= this.getitemstring(1,'serie_origen')
	ll_numero_ori	= this.getitemnumber(1,'numero_origen')
	SELECT 	"TIPO_CONTRATO"."DESCRIPCION"  
	INTO 		:ls_dato_ref  
	FROM 	"TIPO_CONTRATO"  
	WHERE 	"TIPO_CONTRATO"."CODIGO" = :ls_base_ori  
	USING	sqlca;
	if sqlca.sqlcode <> 0 then
		messagebox("Advertencia","No Existe Base Ingresada")
		this.setitem(1,'base_origen',ls_nulo)
	else
		SELECT 	"TABLA_SERIES"."SERIE"  
		INTO 		:ls_dato_ref  
		FROM 	"TABLA_SERIES"  
		WHERE 	"TABLA_SERIES"."BASE" = :ls_base_ori AND "TABLA_SERIES"."SERIE" = :ls_serie_ori 
		USING	sqlca;
		if sqlca.sqlcode <> 0 then
			messagebox("Advertencia","No Existe Serie Ingresada")
			this.setitem(1,'serie_origen',ls_nulo)
		else
			SELECT 	"CADENA"."NUMERO"  
			INTO 		:ll_numero_ref  
			FROM 	"CADENA"  
			WHERE ( "CADENA"."CODIGO" = :ls_base_ori ) AND  
					  ( "CADENA"."SERIE" = :ls_serie_ori ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero_ori )  
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
				messagebox("Advertencia","No Existe Numero Contrato Ingresado")
				this.setitem(1,'numero_origen',ll_nulo)
			end if
		end if
		if not isnull(ls_base_ori) and not isnull(ls_serie_ori) and ll_numero_ori > 0 then
			SELECT 	"CADENA"."ESTADO"  
			INTO 		:ls_estado_ctto_actual  
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :ls_base_ori ) AND  
						( "CADENA"."SERIE" = :ls_serie_ori ) AND  
						( "CADENA"."NUMERO" = :ll_numero_ori )   ;
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)	
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		end if
	end if
	
elseif ls_columna='hora_ingreso_cinerario' or ls_columna='minuto_ingreso_cinerario' then
	ldt_fecha_ingreso				= dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
	ll_hora_ingreso_cinerario	= dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
	ll_minuto_ingreso_cinerario	= dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
	if date(ldt_fecha_ingreso) = date(gdt_fec_sistema) then
		if ll_hora_ingreso_cinerario < ll_hora_actual then
			messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
			dw_ficha.setitem(1,'hora_ingreso_cinerario',0)
		elseif ll_hora_ingreso_cinerario = ll_hora_actual and ll_minuto_ingreso_cinerario < ll_minuto_actual then
			messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
			dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
		end if
		dw_ficha.accepttext()
	end if
elseif ls_columna='autoriza_admin_agenda' then
	//	identificar que documento es necesario
end if
if ls_columna='fecha_ingreso_cinerario' then
	ll_rut								= dw_ficha.getitemnumber(1,'rut_titular')
	ls_autoriza						= dw_ficha.getitemstring(1,'autoriza_admin_agenda')
	ll_hora_ingreso_cinerario	= dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
	ll_minuto_ingreso_cinerario	= dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
	if is_tipo_venta='CV' then
		SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO",   	"CADENA"."ESTADO",		  	"CADENA"."COD_PARQUE",   	"ESTADO"."NOMBRE_ESTADO"  
		INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori,   			:ls_estado_ctto_actual  ,		:ll_cod_parque_ori,				:ls_desc_ctto
		FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
		WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
					( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
					( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
					( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
					( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
					( ( "CADENA"."RUT" = :ll_rut ) AND  
					( "CADENA"."CODIGO" = 'G' ) AND  
					( "CADENA"."NUMERO" = ( 	SELECT 	MAX("CADENA"."NUMERO") 
														FROM 	"CADENA", "REVISION_CONTRATOS" 
														WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and 
																	( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and 
																	( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and 
																	( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
																	( ( "CADENA"."CODIGO" = 'G' ) AND ( "CADENA"."RUT" = :ll_rut ) ) ) ) )  
		USING	sqlca;		
		
		SELECT 	"INGRESO"."TIPO_COB",  	"INGRESO"."FOLIO",	"INGRESO"."FECHA_PAGO",	"INGRESO"."COD_CAJA",		"INGRESO"."CONTRATO",		"INGRESO"."SERIE",		"INGRESO"."BASE",		sum("INGRESO"."MONTO" ) as MONTO_PAGADO  
		INTO 		:ls_tipo_cob_pago,			:ll_folio_pago,			:ldt_fecha_pago,				:ls_caja,							:ll_contrato_g,						:ls_serie_g,					:ls_base_g,					:ll_monto_pago  
		FROM 	"INGRESO"  
		WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
					( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori ) AND ( "INGRESO"."CONTRATO" = :ll_numero_ori )  AND
					( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA') AND 
					( "INGRESO"."FOLIO" = ( SELECT DISTINCT MAX("INGRESO"."FOLIO")
															FROM 	"INGRESO"  
															WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
																		( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori ) AND ( "INGRESO"."CONTRATO" = :ll_numero_ori )  AND
																		( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA')  )     )  ) )     
		GROUP BY 	"INGRESO"."TIPO_COB",   
						"INGRESO"."FOLIO",   
						"INGRESO"."FECHA_PAGO",
						"INGRESO"."COD_CAJA",
						"INGRESO"."CONTRATO",
						"INGRESO"."SERIE",
						"INGRESO"."BASE"
		USING	sqlca;
		if sqlca.sqlcode<>0 then
			 dw_ficha.setitem(1,'autoriza_admin_agenda','N')
			 dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			 dw_ficha.setitem(1,'hora_ingreso_cinerario',0)
			 dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
			 messagebox("Advertencia","No es Posible Agendar, debe Existir Pago Asociado")
			 dw_ficha.accepttext()
		else
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_pago','S')
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		end if 
		
	end if
end if
this.accepttext()
end event

event itemfocuschanged;Double	ll_rut,ll_nulo
String		ls_dv,ls_base_ori,ls_serie_ori,ls_dato_ref,ls_nulo,ls_nuevo,ls_hora,ls_autoriza
Long		ll_numero_ori,ll_numero_ref,ll_count,ll_hora_ingreso_cinerario,ll_minuto_ingreso_cinerario,ll_hora_cineracion,ll_minuto_cineracion,ll_count_crematorio,&
			ll_hora_cineracin_fin,ll_min_cineracion_fin,ll_hora_actual,ll_minuto_actual,ll_count_pago,ll_folio_reg
datetime	ldt_fecha_ingreso,ldt_fecha_cineracion,ldt_nulo

Setnull(ll_nulo);Setnull(ls_nulo);Setnull(ldt_nulo)
this.accepttext()
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
ls_hora				= string(gdt_fec_sistema,"hh:mm")
ll_hora_actual		= long(mid(ls_hora,1,2))
ll_minuto_actual	= long(mid(ls_hora,4,2))
ll_rut					= this.getitemnumber(1,'rut_titular')
ls_nuevo				= this.getitemstring(1,'nuevo')
if ll_rut > 0 then
	ll_folio_reg		= this.getitemnumber(1,'folio_crematorio') 
	if ll_folio_reg > 0 then
		ls_nuevo		= 'N'
		this.setitem(1,'nuevo',ls_nuevo)
	else
		ls_nuevo		= 'S'
		this.setitem(1,'nuevo',ls_nuevo)
	end if
	this.accepttext()
	if ll_rut > 0 and il_count_titular = 0 and ls_nuevo='S' and is_tipo_venta='CV' then
		SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO"
		INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori
		FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
		WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
					( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
					( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
					( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
					( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
					( ( "CADENA"."RUT" = :ll_rut ) AND  
					( "CADENA"."CODIGO" = 'G' ) AND  
					( "CADENA"."NUMERO" = ( 	SELECT 	MAX("CADENA"."NUMERO") 
														FROM 	"CADENA", "REVISION_CONTRATOS" 
														WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and 
																	( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and 
																	( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and 
																	( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
																	( ( "CADENA"."CODIGO" = 'G' ) AND ( "CADENA"."RUT" = :ll_rut ) ) ) ) )  
		USING	sqlca;		
		SELECT 	count("INGRESO"."TIPO_COB")
		INTO 		:ll_count
		FROM 	"INGRESO"  
		WHERE 	(( "INGRESO"."RUT" = :ll_rut ) AND  ("INGRESO"."FECHA_PAGO" >= To_date(:gdt_fec_sistema) - 90) AND
					( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori )  AND ( "INGRESO"."CONTRATO" = :ll_numero_ori ) AND
					( "INGRESO"."PAGO_HIST" = 'A')) 
		GROUP BY 	"INGRESO"."TIPO_COB",   
						"INGRESO"."FOLIO",   
						"INGRESO"."FECHA_PAGO",
						"INGRESO"."COD_CAJA",
						"INGRESO"."CONTRATO"
		USING	sqlca;
		if sqlca.sqlcode<>0 then
	//		this.setitem(1,'rut_titular',ll_nulo)
	//		ll_rut		= 0
			this.setfocus()
			this.setcolumn('rut_titular')
		end if
	end if
	if ll_count > 0 then	//ll_rut > 0 then
		SELECT 	"CLIENTE"."DV"
		INTO 		:ls_dv
		FROM 	"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   ;
		if sqlca.sqlcode <> 0 then
			this.setitem(1,'rut_titular',ll_nulo)
			this.accepttext()
			this.setfocus()
			this.setcolumn('rut_titular')
		end if
		ls_base_ori		= this.getitemstring(1,'base_origen')
		ls_serie_ori		= this.getitemstring(1,'serie_origen')
		ll_numero_ori	= this.getitemnumber(1,'numero_origen')
		if not isnull(ls_base_ori) then
			SELECT 	"TIPO_CONTRATO"."DESCRIPCION"  
			INTO 		:ls_dato_ref  
			FROM 	"TIPO_CONTRATO"  
			WHERE 	"TIPO_CONTRATO"."CODIGO" = :ls_base_ori  
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
		//		messagebox("Advertencia","No Existe Base Ingresada")
				this.setitem(1,'base_origen',ls_nulo)
			end if
		end if
		if not isnull(ls_serie_ori) then
			SELECT 	"TABLA_SERIES"."SERIE"  
			INTO 		:ls_dato_ref  
			FROM 	"TABLA_SERIES"  
			WHERE 	"TABLA_SERIES"."BASE" = :ls_base_ori  AND "TABLA_SERIES"."SERIE" = :ls_serie_ori 
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
	//			messagebox("Advertencia","No Existe Serie Ingresada")
				this.setitem(1,'serie_origen',ls_nulo)
			end if
		end if
		if not isnull(ll_numero_ori) then
			SELECT 	"CADENA"."NUMERO"  
			INTO 		:ll_numero_ref  
			FROM 	"CADENA"  
			WHERE ( "CADENA"."CODIGO" = :ls_base_ori ) AND  
					  ( "CADENA"."SERIE" = :ls_serie_ori ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero_ori )  
			USING	sqlca;
			if sqlca.sqlcode <> 0 then
	//				messagebox("Advertencia","No Existe Numero Contrato Ingresado")
				this.setitem(1,'numero_origen',ll_nulo)
			end if
		end if
	end if
	
	ldt_fecha_ingreso				= dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
	ldt_fecha_cineracion			= dw_ficha.getitemdatetime(1,'fecha_cineracion')
	ll_hora_ingreso_cinerario	= dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
	ll_minuto_ingreso_cinerario	= dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
	ll_hora_cineracion				= dw_ficha.getitemnumber(1,'hora_cineracion')
	ll_minuto_cineracion			= dw_ficha.getitemnumber(1,'minuto_cineracion')
	
	if not isnull(ldt_fecha_cineracion) and ll_hora_cineracion>0 and not isnull(ll_minuto_cineracion) then
		ll_hora_cineracin_fin			= ll_hora_cineracion
		ll_min_cineracion_fin			= ll_minuto_cineracion + 30
		if ll_min_cineracion_fin >= 60 then
			ll_min_cineracion_fin 		= 0
			ll_hora_cineracin_fin		= ll_hora_cineracin_fin + 1
		end if
		SELECT 	COUNT("FC_AGENDA_ING_PARQUE"."EJECUTIVO")  
		INTO 		:ll_count_crematorio  
		FROM 	"FC_AGENDA_ING_PARQUE" 
		WHERE ( "FC_AGENDA_ING_PARQUE"."FECHA_CREMACION" = :ldt_fecha_cineracion ) AND  
				  ( "FC_AGENDA_ING_PARQUE"."HORA_CINERACION" >= :ll_hora_cineracion ) AND  
				  ( "FC_AGENDA_ING_PARQUE"."MINUTO_CINERACION" >= :ll_minuto_cineracion ) AND  
				  ( "FC_AGENDA_ING_PARQUE"."HORA_CINERACION_FIN" <= :ll_hora_cineracin_fin ) AND  
				  ( "FC_AGENDA_ING_PARQUE"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin )  AND
				  ( "FC_AGENDA_ING_PARQUE"."NUMERO" <> :il_numero)
		USING	sqlca;
		if ll_count_crematorio > 0 then
//			messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
//			dw_ficha.setitem(1,'hora_cineracion',0)
//			dw_ficha.setitem(1,'minuto_cineracion',0)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('hora_cineracion')
		end if
	end if
	
	
	if not isnull(ldt_fecha_ingreso) and ll_hora_ingreso_cinerario > 0 and not isnull(ll_minuto_ingreso_cinerario) then
		ll_hora_cineracin_fin			= ll_hora_ingreso_cinerario + 1
		ll_min_cineracion_fin			= ll_minuto_ingreso_cinerario + 30
		if ll_min_cineracion_fin >= 60 then
			ll_min_cineracion_fin 		= 0
			ll_hora_cineracin_fin		= ll_hora_cineracin_fin + 1
		end if
		SELECT 	COUNT("FC_AGENDA_CREMATORIO"."EJECUTIVO")  
		INTO 		:ll_count_crematorio  
		FROM 	"FC_AGENDA_CREMATORIO" 
		WHERE ( "FC_AGENDA_CREMATORIO"."FECHA_CREMACION" = :ldt_fecha_ingreso ) AND  
				  ( "FC_AGENDA_CREMATORIO"."HORA_CINERACION" >= :ll_hora_ingreso_cinerario ) AND  
				  ( "FC_AGENDA_CREMATORIO"."MINUTO_CINERACION" >= :ll_minuto_ingreso_cinerario ) AND  
				  ( "FC_AGENDA_CREMATORIO"."HORA_CINERACION_FIN" <= :ll_hora_cineracin_fin ) AND  
				  ( "FC_AGENDA_CREMATORIO"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin )  AND
				  ( "FC_AGENDA_CREMATORIO"."NUMERO" <> :il_numero)
		USING	sqlca;
		if ll_count_crematorio > 0 then
//			messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
//			dw_ficha.setitem(1,'hora_ingreso_cinerario',0)
//			dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('hora_ingreso_cinerario')
		end if
	end if
	
	if not isnull(ldt_fecha_ingreso) and not isnull(ldt_fecha_cineracion) and ls_nuevo='S' then
	//	if ldt_fecha_ingreso > ldt_fecha_cineracion then
	////		messagebox("Advertencia","Fecha Ingreso Parque, NO puede ser Menor a Fecha Ingreso Parque")
	//		dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
	//		dw_ficha.accepttext()
	//		dw_ficha.setcolumn('fecha_ingreso_cinerario')
	//	else
		if date(ldt_fecha_ingreso) < date(gdt_fec_sistema) then
	//		messagebox("Advertencia","Fecha Ingreso Parque, NO puede ser Menor a Fecha Actual")
			dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('fecha_ingreso_cinerario')
		elseif ldt_fecha_ingreso < ldt_fecha_cineracion then
	//			messagebox("Advertencia","Fecha Cremación, NO puede ser Menor a Fecha Ingreso Parque")
				dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('fecha_ingreso_cinerario')
		elseif ldt_fecha_ingreso = ldt_fecha_cineracion then
			if ll_hora_ingreso_cinerario > ll_hora_cineracion then
	//			messagebox("Advertencia","Hora Cremación, NO puede ser Menor a Hora Ingreso Parque")
				dw_ficha.setitem(1,'hora_cineracion',ll_nulo)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('hora_cineracion')
			elseif ll_hora_ingreso_cinerario = ll_hora_cineracion and ll_minuto_ingreso_cinerario > ll_minuto_cineracion then
	//			messagebox("Advertencia","Minutos Cremación, NO puede ser Menor a Minutos Ingreso Parque")
				dw_ficha.setitem(1,'hora_cineracion',ll_nulo)
				dw_ficha.accepttext()
				dw_ficha.setcolumn('minuto_cineracion')
			end if
	//	elseif not isnull(ldt_fecha_cineracion) then
	//		SELECT 	COUNT("FC_AGENDA_CREMATORIO"."EJECUTIVO")  
	//		INTO 		:ll_count_crematorio  
	//		FROM 	"FC_AGENDA_CREMATORIO" 
	//		WHERE ( "FC_AGENDA_CREMATORIO"."FECHA_CREMACION" = :ldt_fecha_cineracion ) AND  
	//				  ( "FC_AGENDA_CREMATORIO"."HORA_CINERACION" >= :ll_hora_cineracion ) AND  
	//				  ( "FC_AGENDA_CREMATORIO"."MINUTO_CINERACION" >= :ll_minuto_cineracion ) AND  
	//				  ( "FC_AGENDA_CREMATORIO"."HORA_CINERACION_FIN" <= :ll_hora_cineracin_fin ) AND  
	//				  ( "FC_AGENDA_CREMATORIO"."MINUTO_CINERACION_FIN" <= :ll_min_cineracion_fin )  AND
	//				  ( "FC_AGENDA_CREMATORIO"."NUMERO" <> :il_numero)
	//		USING	sqlca;
	//		if ll_count_crematorio > 0 then
	////			messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
	//			dw_ficha.setitem(1,'hora_cineracion',0)
	//			dw_ficha.setitem(1,'minuto_cineracion',0)
	//			dw_ficha.accepttext()
	//			dw_ficha.setcolumn('hora_cineracion')
	//		end if
		end if
	elseif not isnull(ldt_fecha_ingreso) and ls_nuevo='S' then
		if date(ldt_fecha_ingreso) < date(gdt_fec_sistema) then
	//		messagebox("Advertencia","Fecha Ingreso Parque, NO puede ser Menor a Fecha Actual")
			dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('fecha_ingreso_cinerario')
		end if
	end if
	if date(ldt_fecha_ingreso) = date(gdt_fec_sistema) and ls_nuevo='S' then
		if ll_hora_ingreso_cinerario < ll_hora_actual then
	//		messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
			dw_ficha.setitem(1,'hora_ingreso_cinerario',0)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('hora_ingreso_cinerario')
		elseif ll_hora_ingreso_cinerario = ll_hora_actual and ll_minuto_ingreso_cinerario < ll_minuto_actual then
	//		messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
			dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
			dw_ficha.accepttext()
			dw_ficha.setcolumn('minuto_ingreso_cinerario')
		end if
		dw_ficha.accepttext()
	end if
	
	ll_rut				= dw_ficha.getitemnumber(1,'rut_titular')
	ls_autoriza		= dw_ficha.getitemstring(1,'autoriza_admin_agenda')
	if is_tipo_venta='CV' and ll_rut > 0 and ls_autoriza='S' then
		SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO"
		INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori
		FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
		WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
					( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
					( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
					( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
					( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
					( ( "CADENA"."RUT" = :ll_rut ) AND  
					( "CADENA"."CODIGO" = 'G' ) AND  
					( "CADENA"."NUMERO" = ( 	SELECT 	MAX("CADENA"."NUMERO") 
														FROM 	"CADENA", "REVISION_CONTRATOS" 
														WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and 
																	( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and 
																	( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and 
																	( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
																	( ( "CADENA"."CODIGO" = 'G' ) AND ( "CADENA"."RUT" = :ll_rut ) ) ) ) )  
		USING	sqlca;
		SELECT 	Count("INGRESO"."TIPO_COB")
		INTO 		:ll_count_pago
		FROM 	"INGRESO"  
		WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
					( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori ) AND ( "INGRESO"."CONTRATO" = :ll_numero_ori ) AND
					( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA') AND 
					( "INGRESO"."FECHA_PAGO" = ( SELECT  MAX("INGRESO"."FECHA_PAGO")
															FROM 	"INGRESO"  
															WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
																		( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori ) AND ( "INGRESO"."CONTRATO" = :ll_numero_ori ) AND
																		( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA')  )     )  ) )     
		USING	sqlca;
		if sqlca.sqlcode<>0 then
			 dw_ficha.setitem(1,'autoriza_admin_agenda','N')
			 dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_nulo)
			 dw_ficha.setitem(1,'hora_ingreso_cinerario',0)
			 dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
	//		 messagebox("Advertencia","No es Posible Agendar, debe Existir Pago Asociado")
			 dw_ficha.accepttext()
		end if 
	end if
end if	


this.accepttext()
end event

event clicked;String		ls_columna,ls_auto_admin,ls_ejecutivo,ls_obs,ls_base,ls_serie,ls_nombre,ls_ap_pat,ls_ap_mat,ls_string,ls_obs_ceremonia,ls_uso_visualiza,&
			ls_uso_capilla,ls_uso_pergola,ls_nulo,ls_base_ori,ls_serie_ori,ls_horno
Long		ll_cod_parque,ll_hora_fijada,ll_minuto_fijada,ll_cod_religion,ll_hora_agenda,ll_minuto_agenda,ll_count_pago,ll_res,ll_nulo,ll_numero_ori,ll_horno
datetime	ldt_fecha_cremacion,ldt_fecha_agenda,ldt_fecha_valida,ldt_nulo
Double	ll_numero,ll_rut,ldt_rut_falle_ficha,ldt_rut_falle

Setnull(ll_nulo);Setnull(ls_nulo);Setnull(ldt_nulo)
this.accepttext()
ls_columna													= dwo.name
if il_folio > 0 then
	if ls_columna='p_1' then	//Agenda Crematorio
//		messagebox("Advertencia","Si realiza Cambios, Recuerde Grabar cambios antes de Generar Agendamiento")
//		if is_tipo_venta='SV' then 
//			messagebox("Advertencia","Agenda solo Ficha con Venta")
//		else
		ls_auto_admin									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
		if ls_auto_admin='S' or is_tipo_venta='SV' then
			SELECT 	"FC_CABECERA"."FECHA_INGRESO_CINERARIO"
			INTO 		:ldt_fecha_valida  
			FROM 	"FC_CABECERA"  
			WHERE 	"FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio   ;
			if isnull(ldt_fecha_valida) then
				messagebox("Advertencia","Debe Grabar Fecha Cremación antes de Agendar")
			else
				ll_cod_parque								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber( 1,'cod_parque_destino')
				SELECT 	"FC_HORAS_CREMATORIO"."HORA_INICIO",  	"FC_HORAS_CREMATORIO"."MINUTO_INICIO",  	"FC_HORAS_CREMATORIO"."HORA_FINAL",  	"FC_HORAS_CREMATORIO"."MINUTO_FINAL", 		"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO", 		"FC_HORAS_CREMATORIO"."VECES_USO"  
				INTO		:il_hora_ini,  											:il_min_ini,   												:il_hora_fin,   											:il_min_fin,   												:il_intervalo,   														:il_veces 
				FROM 	"FC_HORAS_CREMATORIO"  
				WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :ll_cod_parque   ;
				ldt_fecha_agenda							= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
				ll_hora_agenda								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_cineracion')
				ll_minuto_agenda							= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_cineracion')
				ldt_fecha_cremacion						= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
				ls_ejecutivo									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'usuario_crea')
				ls_obs										= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
				ll_hora_fijada								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
				ll_minuto_fijada							= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
				ls_base										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
				ls_serie										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
				ll_numero									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
				ll_horno										= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'horno')
				if ll_horno > 0 then
					SELECT 	"FC_HORNO"."DESCRIPCION"  
					INTO 		:ls_horno  
					FROM 	"FC_HORNO"  
					WHERE 	"FC_HORNO"."HORNO" = :ll_horno   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						ls_obs								= ls_obs + ' - '+ls_horno
					end if
				end if
				ls_uso_visualiza							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
				ls_uso_capilla								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
				ls_uso_pergola								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
				
				if isnull(ll_minuto_fijada) then 
					ll_minuto_fijada						= 0
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
					tab_crematorio.tabpage_1.dw_ficha.accepttext()
				end if
				ls_nombre									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres'))
				ls_ap_pat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno'))
				ls_ap_mat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno'))
				ls_obs_ceremonia							= trim(tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion'))
				ll_cod_religion								= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
				ll_rut											= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
				SELECT 	"CADENA"."CODIGO",  	"CADENA"."SERIE",   	"CADENA"."NUMERO"
				INTO 		:ls_base_ori,   				:ls_serie_ori,			:ll_numero_ori
				FROM 	"CADENA",   	"REVISION_CONTRATOS",   	"ESTADO"  
				WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and  
							( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and  
							( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and  
							( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and  
							( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
							( ( "CADENA"."RUT" = :ll_rut ) AND  
							( "CADENA"."CODIGO" = 'G' ) AND  
							( "CADENA"."NUMERO" = ( 	SELECT 	MAX("CADENA"."NUMERO") 
																FROM 	"CADENA", "REVISION_CONTRATOS" 
																WHERE 	( "CADENA"."RUT" = "REVISION_CONTRATOS"."RUT" ) and 
																			( "CADENA"."CODIGO" = "REVISION_CONTRATOS"."BASE" ) and 
																			( "CADENA"."SERIE" = "REVISION_CONTRATOS"."SERIE" ) and 
																			( "CADENA"."NUMERO" = "REVISION_CONTRATOS"."NUMERO" ) and 
																			( ( "CADENA"."CODIGO" = 'G' ) AND ( "CADENA"."RUT" = :ll_rut ) ) ) ) )  
				USING	sqlca;		
				SELECT 	Count("INGRESO"."TIPO_COB")
				INTO 		:ll_count_pago
				FROM 	"INGRESO"  
				WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
							( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori ) AND ( "INGRESO"."CONTRATO" = :ll_numero_ori )   AND
							( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA') AND 
							( "INGRESO"."FECHA_PAGO" = ( SELECT  MAX("INGRESO"."FECHA_PAGO")
																	FROM 	"INGRESO"  
																	WHERE 	( ( "INGRESO"."RUT" = :ll_rut ) AND  
																				( "INGRESO"."BASE" = :ls_base_ori ) AND ( "INGRESO"."SERIE" = :ls_serie_ori ) AND ( "INGRESO"."CONTRATO" = :ll_numero_ori )   AND
																				( "INGRESO"."PAGO_HIST" = 'A') AND ("INGRESO"."TIPO_COB" = 'FE' or "INGRESO"."TIPO_COB" = 'FA')  )     )  ) )   
				GROUP BY 	"INGRESO"."TIPO_COB",   
								"INGRESO"."FOLIO",   
								"INGRESO"."FECHA_PAGO",
								"INGRESO"."COD_CAJA",
								"INGRESO"."CONTRATO",
								"INGRESO"."SERIE",
								"INGRESO"."BASE"
				USING	sqlca;
				if ll_count_pago > 0 or is_tipo_venta='SV' then
					if is_tipo_venta='SV' then 
						ls_obs_ceremonia						= 'SIN VENTA'		//'SIN OBSERVACION'
						ll_cod_religion							= 0
					end if
					
					if isnull(ll_cod_parque) or isnull(ldt_fecha_cremacion) or isnull(ls_ejecutivo) or isnull(ls_obs) or isnull(ls_obs_ceremonia) or isnull(ll_cod_religion) or isnull(ll_hora_fijada) or isnull(ls_nombre) or isnull(ls_ap_pat) or isnull(ls_ap_mat) or isnull(ls_uso_visualiza) or isnull(ls_uso_capilla) or isnull(ls_uso_pergola) then
						if isnull(ldt_fecha_cremacion) then
							messagebox("Advertencia","Debe Seleccionar Fecha Cremación")
							tab_crematorio.SelectedTab	= 1
							tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_ingreso_cinerario')
						elseif isnull(ll_hora_fijada) then
							messagebox("Advertencia","Debe Ingresar Hora Agenda Cremación")
							tab_crematorio.SelectedTab	= 1
							tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_ingreso_cinerario')
						elseif isnull(ll_minuto_fijada) then
							messagebox("Advertencia","Debe Ingresar Minutos Agenda Cremación")
							tab_crematorio.SelectedTab	= 1
							tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_ingreso_cinerario')
						elseif isnull(ll_cod_parque) then
							messagebox("Advertencia","Debe Seleccionar Parque")
							tab_crematorio.SelectedTab	= 1
							tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
						elseif isnull(ls_ejecutivo) then
							messagebox("Advertencia","Debe Seleccionar Ejecutivo")
							tab_crematorio.SelectedTab	= 1
							tab_crematorio.tabpage_1.dw_ficha.setcolumn('usuario_crea')
						elseif isnull(ls_obs) then
							messagebox("Advertencia","Debe Ingresar Observación Fallecido")
							tab_crematorio.SelectedTab	= 2
							tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
						elseif isnull(ls_obs_ceremonia) then
							messagebox("Advertencia","Debe Ingresar Observación Ceremonia")
							tab_crematorio.SelectedTab	= 7
							tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
						elseif isnull(ll_cod_religion) then
							messagebox("Advertencia","Debe Ingresar Religión")
							tab_crematorio.SelectedTab	= 7
							tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
						elseif isnull(ls_nombre) then
							messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
							tab_crematorio.SelectedTab	= 2
							tab_crematorio.tabpage_2.dw_fallecido.setcolumn('nombres')
						elseif isnull(ls_ap_pat) then
							messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
							tab_crematorio.SelectedTab	= 2
							tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_paterno')
						elseif isnull(ls_ap_mat) then
							messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
							tab_crematorio.SelectedTab	= 2
							tab_crematorio.tabpage_2.dw_fallecido.setcolumn('apellido_materno')
						elseif isnull(ls_uso_visualiza) then
							messagebox("Advertencia","Debe Seleccionar Uso Sala Visualización")
							tab_crematorio.SelectedTab	= 8
							tab_crematorio.tabpage_8.dw_cenizas.setcolumn('visualizar_servicio')
						elseif isnull(ls_uso_capilla) then
							messagebox("Advertencia","Debe Seleccionar Uso Capilla")
							tab_crematorio.SelectedTab	= 8
							tab_crematorio.tabpage_8.dw_cenizas.setcolumn('uso_capilla')
						elseif isnull(ls_uso_pergola) then
							messagebox("Advertencia","Debe Seleccionar Uso Pergola")
							tab_crematorio.SelectedTab	= 8
							tab_crematorio.tabpage_8.dw_cenizas.setcolumn('uso_pergola')
						end if
					else
						if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
							ls_string								= string(ll_cod_parque)+'~t'+string(ldt_fecha_cremacion)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijada)+'~t'+string(il_folio)+'~t'+'C'+'~t'+ls_uso_visualiza+'~t'+ls_uso_capilla+'~t'+ls_uso_pergola
							if isvalid(w_lista_crematorio) then close(w_lista_crematorio)
							OpenWithParm(w_lista_crematorio, ls_string)
						else
							messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
							tab_crematorio.SelectedTab	= 2
						end if
					end if
				else
					messagebox("Advertencia","Para Agendar, Debe Existir Pago")
				end if
			end if
		else
			messagebox("Advertencia","Debe Autorizar Administrador AGENDA")
		end if
//		end if
	elseif ls_columna='p_2' then	//Agenda Ingreso Parque
//		messagebox("Advertencia","Si realiza Cambios, Recuerde Grabar cambios antes de Generar Agendamiento")
		SELECT 	"FC_AGENDA_ING_PARQUE"."FECHA_CREMACION"  
		INTO 		:ldt_fecha_valida  
		FROM 	"FC_AGENDA_ING_PARQUE"  
		WHERE 	"FC_AGENDA_ING_PARQUE"."FOLIO_CREMATORIO" = :il_folio   ;
		if isnull(ldt_fecha_valida) then
			messagebox("Advertencia","Debe Grabar Fecha antes de Agendar")
		else
			ls_uso_capilla		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
			ls_auto_admin		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
			if is_tipo_venta='SV' or is_tipo_venta='CV' then 
				if il_grabar > 0 then
					ll_res				= messagebox("Advertencia","En Caso de haber Realizado Cambios, debe Grabar Ficha antes de Agendar... Desea Continuar",Exclamation!,yesNo!,2)
				else
					ll_res				= 1
				end if
				if ll_res=1 then
					ls_auto_admin		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
			//		ls_uso_capilla		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
//					if ls_auto_admin='S' then	//and ls_auto_admin='S'
						this.accepttext()
			//			if ls_auto_admin='S' then
							ll_cod_parque								=  tab_crematorio.tabpage_1.dw_ficha.getitemnumber( 1,'cod_parque_destino')
							
							SELECT 	"FC_HORAS_CREMATORIO"."HORA_INICIO",  	"FC_HORAS_CREMATORIO"."MINUTO_INICIO",  	"FC_HORAS_CREMATORIO"."HORA_FINAL",  	"FC_HORAS_CREMATORIO"."MINUTO_FINAL", 		"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO", 		"FC_HORAS_CREMATORIO"."VECES_USO"  
							INTO		:il_hora_ini,  											:il_min_ini,   												:il_hora_fin,   											:il_min_fin,   												:il_intervalo,   														:il_veces 
							FROM 	"FC_HORAS_CREMATORIO"  
							WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :ll_cod_parque   ;
							ldt_fecha_cremacion						= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_cineracion')
							ls_ejecutivo									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'usuario_crea')
							ls_obs										= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
							ll_horno										= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'horno')
							if ll_horno > 0 then
								SELECT 	"FC_HORNO"."DESCRIPCION"  
								INTO 		:ls_horno  
								FROM 	"FC_HORNO"  
								WHERE 	"FC_HORNO"."HORNO" = :ll_horno   
								USING	sqlca;
								if sqlca.sqlcode=0 then
									ls_obs								= ls_obs + ' - '+ls_horno
								end if
							end if
							ll_hora_fijada								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_cineracion')
							ll_minuto_fijada							= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_cineracion')
							ls_base										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
							ls_serie										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
							ll_numero									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
							
							ls_uso_visualiza							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
							ls_uso_capilla								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
							ls_uso_pergola								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
							
							if isnull(ll_minuto_fijada) then 
								ll_minuto_fijada						= 0
								tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
								tab_crematorio.tabpage_1.dw_ficha.accepttext()
							end if
							ls_nombre									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres'))
							ls_ap_pat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno'))
							ls_ap_mat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno'))
							ls_obs_ceremonia							= trim(tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion'))
							ll_cod_religion								= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
							if is_tipo_venta='SV' then 
								ls_obs_ceremonia						= 'SIN VENTA'		//'SIN OBSERVACION'
								ll_cod_religion							= 0
							end if
							if isnull(ll_cod_parque) or isnull(ldt_fecha_cremacion) or isnull(ls_ejecutivo) or isnull(ls_obs) or isnull(ls_obs_ceremonia) or isnull(ll_cod_religion) or isnull(ll_hora_fijada) then
				//				if isnull(ldt_fecha_cremacion) then
				//					messagebox("Advertencia","Debe Seleccionar Fecha Agenda Cremación")
				//					tab_crematorio.SelectedTab	= 1
				//					tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
				
								if isnull(ldt_fecha_cremacion) then
									messagebox("Advertencia","Debe Seleccionar Fecha Ingreso Parque")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
								elseif isnull(ll_hora_fijada) then
									messagebox("Advertencia","Debe Ingresar Hora Ingreso Parque")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_cineracion')
								elseif isnull(ll_minuto_fijada) then
									messagebox("Advertencia","Debe Ingresar Minutos Ingreso Parque")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_cineracion')
								elseif isnull(ll_cod_parque) then
									messagebox("Advertencia","Debe Seleccionar Parque")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
								
								elseif isnull(ls_ejecutivo) then
									messagebox("Advertencia","Debe Seleccionar Ejecutivo")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('usuario_crea')
								elseif isnull(ls_obs) then
									messagebox("Advertencia","Debe Ingresar Observación Fallecido")
									tab_crematorio.SelectedTab	= 2
									tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
								elseif isnull(ls_obs_ceremonia) then
									messagebox("Advertencia","Debe Ingresar Observación Ceremonia")
									tab_crematorio.SelectedTab	= 7
									tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
								elseif isnull(ll_cod_religion) then
									messagebox("Advertencia","Debe Ingresar Religión")
									tab_crematorio.SelectedTab	= 7
									tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
								end if
							else
								if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
									ls_string								= string(ll_cod_parque)+'~t'+string(ldt_fecha_cremacion)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijada)+'~t'+string(il_folio)+'~t'+'C'+'~t'+ls_uso_visualiza+'~t'+ls_uso_capilla+'~t'+ls_uso_pergola
									if isvalid(w_lista_ingreso_parque) then close(w_lista_ingreso_parque)
									OpenWithParm(w_lista_ingreso_parque, ls_string)
								else
									messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
									tab_crematorio.SelectedTab	= 2
								end if
							end if
			//			else
			//				messagebox("Advertencia","Debe Autorizar Administrador AGENDA")
			//			end if
//					end if
				end if
			end if
		end if
	end if
end if
if ls_columna='t_ver_agenda' and il_rut_titular > 0 then
	ldt_fecha_cremacion				= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
	if isnull(ldt_fecha_cremacion) then
		ls_string							= string(142)+'~t'+string(date(gdt_fec_sistema))+'~t'+''+'~t'+''+'~t'+''+'~t'+''+'~t'+string(0)+'~t'+string(0)+'~t'+string(0)+'~t'+'C'+'~t'+'N'+'~t'+'N'+'~t'+'N'
	else
		ls_string							= string(142)+'~t'+string(date(ldt_fecha_cremacion))+'~t'+''+'~t'+''+'~t'+''+'~t'+''+'~t'+string(0)+'~t'+string(0)+'~t'+string(0)+'~t'+'C'+'~t'+'N'+'~t'+'N'+'~t'+'N'
	end if
	if isvalid(w_lista_crematorio) then close(w_lista_crematorio)
	OpenWithParm(w_lista_crematorio, ls_string)
elseif ls_columna='t_6' and il_rut_titular > 0 then
	ls_string								= string(142)+'~t'+string(date(gdt_fec_sistema))+'~t'+''+'~t'+''+'~t'+''+'~t'+''+'~t'+string(0)+'~t'+string(0)+'~t'+string(0)+'~t'+'C'+'~t'+'N'+'~t'+'N'+'~t'+'N'+'~t'
	if isvalid(w_lista_ingreso_parque) then close(w_lista_ingreso_parque)
	OpenWithParm(w_lista_ingreso_parque, ls_string)
elseif ls_columna='p_3' then
	ldt_rut_falle_ficha				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_fallecido')
	ldt_rut_falle						= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
	ll_res								= messagebox("Advertencia","Está Seguro Borrar Rut Fallecido y Antecedentes",Exclamation!,YesNo!,2)
	if ll_res=1 then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'rut_fallecido',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nombres',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_paterno',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_materno',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_nacimiento',ldt_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'sexo',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_defuncion',ldt_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'hora_defuncion',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'minuto_defuncion',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_civil',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_cuerpo',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'tamano_cuerpo',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'causa_fallecimiento',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'cod_parque',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'ciudad_fallecimiento',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'comuna_fallecimiento',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'codigo_origen_cuerpo',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'tipo_via_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'direccion_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'numero_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'depto_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'block_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'codigo_funeraria',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'existencia_elementos',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_contrato_sepultura',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'observaciones',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'enfermedad_obligatoria',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_texto',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nacionalidad',ll_nulo)
	end if
	tab_crematorio.tabpage_1.dw_ficha.accepttext()
end if
end event

type tabpage_2 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Fallecido"
long tabtextcolor = 33554432
string picturename = "Custom027!"
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
integer x = 18
integer y = 44
integer width = 3177
integer height = 1468
integer taborder = 20
string title = "none"
string dataobject = "dw_fc_ingreso_fallecido"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_est,ls_op,ls_sexo,ls_periodo,ls_reg_civil,ls_causa_fall,ls_enf_obl,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,&
			ls_comuna,ls_ciudad,ls_cod_estado_fall,ls_estado_ctto,ls_obs_fall,ls_funeraria,ls_nulo,ls_base_ori,ls_serie_ori,ls_monto_total_palabra
Double	ll_rut,ll_rut_tit,ldt_rut_falle_ficha,ldt_rut_falle
Long		ll_edad,ll_cod_funeraria,ll_hora,ll_minutos,ll_numero_ori,ll_cod_parque_ori,ll_anno_fall,ll_count_fall,ll_nulo,ll_cod_parque_150
datetime	ldt_fec_sep,ldt_fec_nac,ldt_fec_fall,ldt_fec_nac_fall,ldt_fec_def_fall,ldt_nulo,ldt_fec_pase,ldt_fec_def

this.accepttext()
il_grabar ++
ll_rut_tit			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	Setnull(ls_nulo);Setnull(ldt_nulo);setnull(ll_nulo)
	ls_columna		= dwo.name
	if ls_columna='rut_fallecido' or ls_columna='dv_fallecido' then
		ll_rut			= double(tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido'))
		ls_dv			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
		if ll_rut > 0 and not isnull(ls_dv) then
			if f_valida_rut(string(ll_rut)) <> ls_dv then
				messagebox("Advertencia","Rut Inválido")
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_nulo)
			end if
		end if
	end if
	if ls_columna='rut_fallecido' then
		ll_rut			= Double(data)
		if ll_rut > 0 then
			if this.dataobject='dw_fc_ingreso_fallecido' then
				ll_cod_parque_150	= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'cod_parque')
				if isnull(ll_cod_parque_150) then tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'cod_parque',150)
			end if
			SELECT 	Count("FC_FALLECIDO"."BASE")
			INTO 		:ll_count_fall  
			FROM 	"FC_FALLECIDO"  
			WHERE 	( "FC_FALLECIDO"."RUT_FALLECIDO" = :ll_rut ) AND  
						( "FC_FALLECIDO"."ESTADO_REG" <> 'A' )   ;
			if ll_count_fall > 0 then
				messagebox("Advertencia","Rut fallecido Duplicado, Existe Ficha Asociada a Fallecido")
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_nulo)
			else
				il_sw_rut_fall ++
				SELECT 	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",		"FICHA_SEPULTACION"."TIPO_VIA_FALLECIDO", 	"FICHA_SEPULTACION"."DIRECCION_FALL", 	"FICHA_SEPULTACION"."NUMERO_DIRECCION_FALL",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_FALL",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_FALL",	"FICHA_SEPULTACION"."CODIGO_COMUNA_FALL",	"FICHA_SEPULTACION"."CODIGO_CIUDAD_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",		"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."COD_ESTADO_FALL",	"FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO", 	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."COD_ESTADO_CONTRATO",		"FICHA_SEPULTACION"."PERIODO_NACIMIENTO",		"FICHA_SEPULTACION"."COD_TAMANO_CUERPO",	"FICHA_SEPULTACION"."OBSERVACION_FALLECIDO",		"FICHA_SEPULTACION"."COD_OBS_CUERPO",	"FICHA_SEPULTACION"."EDAD_FALLECIDO",	"FICHA_SEPULTACION"."SEXO_FALLECIDO",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."COD_PARQUE"
				INTO 		:ldt_fec_sep,   												:ls_nombre,   												:ls_ap_pat,   											:ls_ap_mat,   												:ls_tipo_via,   												:ls_direc,   												:ls_nro,   															:ls_depto,   														:ls_block,   														:ls_comuna,   													:ls_ciudad,   												:ldt_fec_fall,   											:ldt_fec_nac,   														:ls_dv,   												:ls_cod_estado_fall,   								:ls_causa_fall,   												:ll_cod_funeraria,   										:ls_estado_ctto,   													:ls_periodo,  	 												:ls_est,   														:ls_obs_fall,   														:ls_op,													:ll_edad,													:ls_sexo,													:ll_hora,									:ll_minutos,									:ls_base_ori,							:ls_serie_ori,							:ll_numero_ori,								:ll_cod_parque_ori
				FROM 	"FICHA_SEPULTACION"  
				WHERE 	( "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut ) AND  
							("FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR  "FICHA_SEPULTACION"."ESTADO_REG" = 'G')   ;
				if sqlca.sqlcode=0 then
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_rut)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nombres',ls_nombre)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_paterno',ls_ap_pat)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_materno',ls_ap_mat)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'tipo_via_fallecido',ls_tipo_via)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'direccion_fallecido',ls_direc)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'numero_fallecido',ls_nro)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'depto_fallecido',ls_depto)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'block_fallecido',ls_block)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'comuna_fallecimiento',ls_comuna)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'ciudad_fallecimiento',ls_ciudad)
					idw_detalle12.retrieve(ls_ciudad)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_defuncion',ldt_fec_fall)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_nacimiento',ldt_fec_nac)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_dv)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_cuerpo',ls_cod_estado_fall)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'tamano_cuerpo',ls_est)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'causa_fallecimiento',ls_causa_fall)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'codigo_funeraria',ll_cod_funeraria)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_contrato_sepultura',ls_estado_ctto)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'hora_defuncion',ll_hora)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'minuto_defuncion',ll_minutos)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
					tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'sexo',ls_sexo)
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_ori)
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_ori)
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_ori)
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'rut_fallecido',ll_rut)
				else
					SELECT 	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO",	"FALLECIDOS"."FEC_SEP",	"FALLECIDOS"."EST",	"FALLECIDOS"."OP",	"FALLECIDOS"."DV",	"FALLECIDOS"."SEXO",	"FALLECIDOS"."FEC_NAC",	"FALLECIDOS"."FEC_FALL", 	"FALLECIDOS"."EDAD", 	"FALLECIDOS"."PERIODO", 	"FALLECIDOS"."REG_CIVIL", 	"FALLECIDOS"."CAUSA_FALL",	"FALLECIDOS"."ENF_OBL" ,	"FALLECIDOS"."FUNERARIA" ,	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS" ,	"FALLECIDOS"."CONTRATO" ,	"FALLECIDOS"."COD_PARQUE" 
					INTO 		:ls_nombre,   					:ls_ap_pat,   						:ls_ap_mat,							:ldt_fec_sep,					:ls_cod_estado_fall,	:ls_op,					:ls_dv,					:ls_sexo,						:ldt_fec_nac,					:ldt_fec_fall,						:ll_edad,						:ls_periodo,						:ls_reg_civil,						:ls_causa_fall,						:ls_enf_obl  ,					:ls_funeraria,						:ls_base_ori,				:ls_serie_ori,			:ll_numero_ori,						:ll_cod_parque_ori
					FROM 	"FALLECIDOS"  
					WHERE 	"FALLECIDOS"."RUT" = :ll_rut  AND
								"FALLECIDOS"."ESTADO_REG" = 'A'  ;
					if sqlca.sqlcode=0 then
						SELECT 	"FUNERARIA"."RUT"  
						INTO 		:ll_cod_funeraria  
						FROM 	"FUNERARIA"  
						WHERE 	"FUNERARIA"."NOMBRE" = :ls_funeraria   ;
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_rut)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'nombres',ls_nombre)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_paterno',ls_ap_pat)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'apellido_materno',ls_ap_mat)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_defuncion',ldt_fec_fall)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'fecha_nacimiento',ldt_fec_nac)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_dv)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'estado_cuerpo',ls_cod_estado_fall)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'causa_fallecimiento',ls_causa_fall)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'codigo_funeraria',ll_cod_funeraria)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'sexo',ls_sexo)
						tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'enfermedad_obligatoria',ls_enf_obl)
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base_origen',ls_base_ori)
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie_origen',ls_serie_ori)
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero_origen',ll_numero_ori)
						tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
					end if
					tab_crematorio.tabpage_1.dw_ficha.setitem(1,'rut_fallecido',ll_rut)
				end if
			end if
			ldt_rut_falle_ficha				= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_fallecido')
			ldt_rut_falle						= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
			if ldt_rut_falle_ficha <> ldt_rut_falle then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'rut_fallecido',ldt_rut_falle)
			end if
			tab_crematorio.tabpage_2.dw_fallecido.accepttext()
			tab_crematorio.tabpage_1.dw_ficha.accepttext()
		end if
	elseif ls_columna='ciudad_fallecimiento' then
		ls_ciudad								= data
		idw_detalle12.retrieve(ls_ciudad)
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'comuna_fallecimiento',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
	elseif ls_columna='fecha_nacimiento' or ls_columna='fecha_defuncion' then
		ldt_fec_nac_fall						= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(this.getrow(),'fecha_nacimiento')
		ldt_fec_def_fall						= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(this.getrow(),'fecha_defuncion')
		ll_cod_parque_ori					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'cod_parque_origen')
		if ldt_fec_nac_fall > ldt_fec_def_fall and not isnull(ldt_fec_nac_fall) and not isnull(ldt_fec_def_fall) and ldt_fec_nac_fall > gdt_fec_sistema then
			messagebox("Advertencia","Fecha Defunción NO puede ser Menor a Fecha Nacimiento o Fecha Inválida")
			this.setitem(1,'fecha_defuncion',ldt_nulo)
		elseif not isnull(ldt_fec_nac_fall) and not isnull(ldt_fec_def_fall) then
			ll_edad							= year(date(ldt_fec_def_fall)) - year(date(ldt_fec_nac_fall))
			ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(long(ll_edad)))
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_texto',ls_monto_total_palabra)
//			ll_anno_fall						= ll_edad	//year(ldt_fec_nac_fall) - year(date(ldt_fec_def_fall))
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'annos_difunto',ll_edad)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
			tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'cod_parque',ll_cod_parque_ori)
		end if
	elseif ls_columna='fecha_pase' then
		ldt_fec_pase		= this.getitemdatetime(this.getrow(),'fecha_pase')
		ldt_fec_def			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
		if ldt_fec_pase < ldt_fec_def and not isnull(ldt_fec_pase) and not isnull(ldt_fec_def)  then
			messagebox("Advertencia","Fecha Pase NO puede ser Menor a Fecha Defunción o Fecha Inválida")
			this.setitem(1,'fecha_pase',ldt_nulo)
		end if
	end if
end if
this.accepttext()
end event

event clicked;String		ls_columna,ls_estado_reg,ls_fecha,ls_dv,ls_monto_total_palabra
Long		ll_rut_fallecido,ll_edad,ll_anno_fall
datetime	ldt_fec_nac,ldt_fec_def,ldt_nulo,ldt_fec_pase
Double	ll_rut

Setnull(ldt_nulo)
this.accepttext()
ls_columna						= dwo.name
ls_estado_reg					= this.getitemstring(this.getrow(),'estado_reg')
ll_rut								= double(tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido'))
ls_dv								= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
if ll_rut > 0 and not isnull(ls_dv) then
	if (ls_estado_reg<>'G' and ls_estado_reg<>'A') or isnull(ls_estado_reg) then
		CHOOSE CASE ls_columna
			CASE 'p_fec_nac'
				ll_rut_fallecido      	= this.getitemnumber(this.getrow(),'rut_fallecido')
				ldt_fec_nac			= this.getitemdatetime(this.getrow(),'fecha_nacimiento')
				ldt_fec_def			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
				if not isnull(ll_rut_fallecido) and ll_rut_fallecido > 0 then
					ls_fecha			= string(date(this.getitemdatetime(this.getrow(),'fecha_nacimiento')))
					if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						this.setitem(this.getrow(),'fecha_nacimiento',datetime(string(today(),gs_formato_fecha)))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						if ldt_fec_nac > ldt_fec_def and not isnull(ldt_fec_nac) and not isnull(ldt_fec_def) and ldt_fec_nac > gdt_fec_sistema then
							messagebox("dvertencia","Fecha Nacimiento NO puede ser Mayor a Fecha Defunción o Fecha Inválida")
							this.setitem(1,'fecha_nacimiento',ldt_nulo)
						else
							ls_fecha		= trim(Message.StringParm)
							ldt_fec_nac	= datetime(date(ls_fecha),time('00:00:00'))
							this.setitem(this.getrow(),'fecha_nacimiento',date(ls_fecha))
							
							ll_edad		= year(date(ldt_fec_def)) - year(date(ldt_fec_nac))
							tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
							ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(long(ll_edad)))
							tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_texto',ls_monto_total_palabra)
							ll_anno_fall						= ll_edad
							tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'annos_difunto',ll_anno_fall)
						end if
					END IF
				end if
			CASE 'p_fec_def'
				ll_rut_fallecido      	= this.getitemnumber(this.getrow(),'rut_fallecido')
				ldt_fec_nac			= this.getitemdatetime(this.getrow(),'fecha_nacimiento')
				ldt_fec_def			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
				if not isnull(ll_rut_fallecido) and ll_rut_fallecido > 0 then
					ls_fecha			= string(date(this.getitemdatetime(this.getrow(),'fecha_defuncion')))
					if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						this.setitem(this.getrow(),'fecha_defuncion',datetime(string(today(),gs_formato_fecha)))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						if ldt_fec_nac > ldt_fec_def and not isnull(ldt_fec_nac) and not isnull(ldt_fec_def) and ldt_fec_nac > gdt_fec_sistema then
							messagebox("dvertencia","Fecha Defunción NO puede ser Menor a Fecha Nacimiento o Fecha Inválida")
							this.setitem(1,'fecha_defuncion',ldt_nulo)
						else
							ls_fecha		= trim(Message.StringParm)
							ldt_fec_def	= datetime(date(ls_fecha),time('00:00:00'))
							this.setitem(this.getrow(),'fecha_defuncion',date(ls_fecha))
							
							ll_edad		= year(date(ldt_fec_def)) - year(date(ldt_fec_nac))
							tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_numero',ll_edad)
							ls_monto_total_palabra		= sle_1.uo_convertir_numero(string(long(ll_edad)))
							tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'edad_texto',ls_monto_total_palabra)
							ll_anno_fall						= ll_edad
							tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'annos_difunto',ll_anno_fall)
						end if
					END IF
				end if
			CASE 'p_fec_pase'
				ll_rut_fallecido      	= this.getitemnumber(this.getrow(),'rut_fallecido')
				ldt_fec_pase		= this.getitemdatetime(this.getrow(),'fecha_pase')
				ldt_fec_def			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
				if not isnull(ll_rut_fallecido) and ll_rut_fallecido > 0 then
					ls_fecha			= string(date(this.getitemdatetime(this.getrow(),'fecha_pase')))
					if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
					if f_valida_fecha(ls_fecha)=-1 then 
						this.setitem(this.getrow(),'fecha_pase',datetime(string(today(),gs_formato_fecha)))
						return
					end if
					OpenWithParm(w_calendar,ls_fecha)
					IF not isnull(Message.StringParm) THEN
						if ldt_fec_pase < ldt_fec_def and not isnull(ldt_fec_pase) and not isnull(ldt_fec_def)  then
							messagebox("dvertencia","Fecha Pase NO puede ser Menor a Fecha Defunción o Fecha Inválida")
							this.setitem(1,'fecha_pase',ldt_nulo)
						else
							ls_fecha		= trim(Message.StringParm)
							this.setitem(this.getrow(),'fecha_pase',date(ls_fecha))
						end if
					END IF
				end if
		END CHOOSE
	 end if
end if
end event

event itemfocuschanged;datetime		ldt_fec_nac_fall,ldt_fec_def_fall,ldt_fec_pase,ldt_fec_def,ldt_nulo
Double		ll_rut
String			ls_estado,ls_dv,ls_nulo
Long			ll_count_fall,ll_nulo

Setnull(ldt_nulo);Setnull(ll_nulo);Setnull(ls_nulo)
ldt_fec_nac_fall		= this.getitemdatetime(this.getrow(),'fecha_nacimiento')
ldt_fec_def_fall		= this.getitemdatetime(this.getrow(),'fecha_defuncion')
if ldt_fec_nac_fall > ldt_fec_def_fall and not isnull(ldt_fec_nac_fall) and not isnull(ldt_fec_def_fall) and ldt_fec_nac_fall > gdt_fec_sistema then
	this.setitem(1,'fecha_defuncion',ldt_nulo)
	this.accepttext()
	this.setcolumn('fecha_defuncion')
end if
ldt_fec_pase		= this.getitemdatetime(this.getrow(),'fecha_pase')
ldt_fec_def			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
if ldt_fec_pase < ldt_fec_def and not isnull(ldt_fec_pase) and not isnull(ldt_fec_def)  then
	this.setitem(1,'fecha_pase',ldt_nulo)
	this.accepttext()
	this.setcolumn('fecha_pase')
end if

ll_rut					= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
ls_estado			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nuevo')
if ll_rut > 0 and ls_estado='S' and il_sw_rut_fall > 0 then
	SELECT 	Count("FC_FALLECIDO"."BASE")
	INTO 		:ll_count_fall  
	FROM 	"FC_FALLECIDO"  
	WHERE 	( "FC_FALLECIDO"."RUT_FALLECIDO" = :ll_rut ) AND  
				( "FC_FALLECIDO"."ESTADO_REG" <> 'A' )   ;
	if ll_count_fall > 0 then
//		messagebox("Advertencia","Rut fallecido Duplicado, Existe Ficha Asociada a Fallecido")
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'rut_fallecido',ll_nulo)
	end if
end if
ll_rut					= double(tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido'))
ls_dv					= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
if ll_rut > 0 and not isnull(ls_dv) then
	if f_valida_rut(string(ll_rut)) <> ls_dv then
//		messagebox("Advertencia","Rut Inválido")
		tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_fallecido',ls_nulo)
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		tab_crematorio.tabpage_2.dw_fallecido.setcolumn('dv_fallecido')
	end if
end if
end event

type tabpage_3 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Titular"
long tabtextcolor = 33554432
string picturename = "Custom076!"
long picturemaskcolor = 536870912
dw_titular dw_titular
end type

on tabpage_3.create
this.dw_titular=create dw_titular
this.Control[]={this.dw_titular}
end on

on tabpage_3.destroy
destroy(this.dw_titular)
end on

type dw_titular from datawindow within tabpage_3
integer x = 18
integer y = 44
integer width = 3177
integer height = 1396
integer taborder = 20
string title = "none"
string dataobject = "dw_fc_titular_sv"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_dv,ls_nulo,ls_celular,ls_pasa_p,ls_pasa_letras,ls_email
Double	ll_rut,ll_rut_tit
Long		ll_new,ll_fono_p_largo

Setnull(ls_nulo)
this.accepttext()
il_grabar ++
ll_rut_tit			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	ls_columna		= dwo.name
	if ls_columna='rut_titular' or ls_columna='dv_titular' then
		ll_rut			= double(tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular'))
		ls_dv			= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'dv_titular')
		if ll_rut > 0 and not isnull(ls_dv) then
			if f_valida_rut(string(ll_rut)) <> ls_dv then
				messagebox("Advertencia","Rut Inválido")
				tab_crematorio.tabpage_3.dw_titular.setitem(1,'dv_titular',ls_nulo)
			end if
		end if
	elseif ls_columna='celular' then
		ll_new					= this.getrow()
		ls_celular				= this.getitemstring(ll_new,'celular')
		is_celular				= ls_celular
		ll_fono_p_largo			= len(ls_celular)
		if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
			if ls_celular <> '' and ls_celular <> '-' then
				ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')
				if ls_pasa_p='N' then
					this.scrolltorow(ll_new)
					messagebox('Advertencia','Celular de Titular debe tener 9 Digitos',stopsign!)
					this.setitem(ll_new,'celular','')
					this.setfocus()
					this.setcolumn('celular')
				else
					ls_pasa_letras 		= wf_validar_letras(ls_celular,'celular')
					if ls_pasa_letras = 'N' then
						this.scrolltorow(ll_new)
						messagebox('Advertencia','Ingrese solo números',stopsign!)
						this.setitem(ll_new,'celular','')
						this.accepttext()
						this.setfocus()
						this.setcolumn('celular')
					end if	
				end if
			end if
		end if
	elseif ls_columna = 'email' then
		ll_new				= this.getrow()
		ls_email				= this.getitemstring(this.getrow(),'email')
//		if ls_email <> '' and ls_email <> '-' then
			if Match(ls_email, "@") then
			else
				messagebox('Advertencia','El E-Mail no es Válido',stopsign!)
				this.scrolltorow(ll_new)
				this.setitem(ll_new,'email',ls_nulo)
				this.accepttext()
				this.setfocus()
				this.setcolumn('email')
			end if	
//		end if	
	end if
end if
this.accepttext()
end event

event itemfocuschanged;Long		ll_new,ll_fono_p_largo
String		ls_celular,ls_pasa_p,ls_pasa_letras,ls_email,ls_nulo,ls_dv
Double	ll_rut

Setnull(ls_nulo)
ll_new					= this.getrow()
ls_celular				= this.getitemstring(ll_new,'celular')
is_celular				= ls_celular
ll_fono_p_largo			= len(ls_celular)
if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
	if ls_celular <> '' and ls_celular <> '-' then
		ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')
		if ls_pasa_p='N' then
			this.scrolltorow(ll_new)
//			messagebox('Advertencia','Celular de Titular debe tener 9 Digitos',stopsign!)
			this.setitem(ll_new,'celular','')
			this.setfocus()
			this.setcolumn('celular')
		else
			ls_pasa_letras 		= wf_validar_letras(ls_celular,'celular')
			if ls_pasa_letras = 'N' then
				this.scrolltorow(ll_new)
//				messagebox('Advertencia','Ingrese solo números',stopsign!)
				this.setitem(ll_new,'celular','')
				this.accepttext()
				this.setfocus()
				this.setcolumn('celular')
			end if	
		end if
	end if
end if
ls_email				= this.getitemstring(this.getrow(),'email')
if ls_email <> '' and ls_email <> '-' then
	if Match(ls_email, "@") then
	else
//		messagebox('Advertencia','El E-Mail no es Válido',stopsign!)
		this.scrolltorow(ll_new)
		this.setitem(ll_new,'email',ls_nulo)
		this.accepttext()
		this.setfocus()
		this.setcolumn('email')
	end if	
end if	
ll_rut			= double(tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular'))
ls_dv			= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'dv_titular')
if ll_rut > 0 and not isnull(ls_dv) then
	if f_valida_rut(string(ll_rut)) <> ls_dv then
//		messagebox("Advertencia","Rut Inválido")
		tab_crematorio.tabpage_3.dw_titular.setitem(1,'dv_titular',ls_nulo)
		tab_crematorio.tabpage_3.dw_titular.accepttext()
		tab_crematorio.tabpage_3.dw_titular.setcolumn('dv_titular')
	end if
end if
end event

type tabpage_4 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Prelación"
long tabtextcolor = 33554432
string picturename = "UserObject!"
long picturemaskcolor = 536870912
dw_prelacion dw_prelacion
end type

on tabpage_4.create
this.dw_prelacion=create dw_prelacion
this.Control[]={this.dw_prelacion}
end on

on tabpage_4.destroy
destroy(this.dw_prelacion)
end on

type dw_prelacion from datawindow within tabpage_4
integer x = 18
integer y = 44
integer width = 3177
integer height = 1468
integer taborder = 30
string title = "none"
string dataobject = "dw_fc_ingreso_prelacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
end type

event clicked;String		ls_columna,ls_pasa,ls_parentesco_pre,ls_dv_pre,ls_nombres_pre,ls_ap_pat_pre,ls_ap_mat_pre,ls_tipo_via_pre,ls_dire_pre,ls_num_pre,ls_depto_pre,&
			ls_block_pre,ls_ciudad_pre,ls_comuna_pre,ls_fono_part_pre,ls_fono_com_pre,ls_celular_pre,ls_correo_pre,ls_obs_pre,ls_estado_civil,ls_dv_titular,ls_nom_titular,&
			ls_pat_titular,ls_mat_titular,ls_celular,ls_email,ls_tipo_via,ls_direc,ls_nro_part,ls_depto_part,ls_block_part,ls_ciudad,ls_comuna,ls_fono_p,ls_fono_c,ls_estado_civil_c 
Long		ll_fila,ll_new,ll_tot_reg,ll_indi,ll_res,ll_nacionalidad
Double	ll_rut_pre,ll_rut_tit,ll_rut_titular

ls_pasa 								= 'S'
ls_columna							= dwo.name
ll_rut_tit								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	if row = 0 then
		if is_tipo_venta <> 'SV' then 
			CHOOSE CASE ls_columna
				CASE 't_nuevo'
					ll_tot_reg				= tab_crematorio.tabpage_4.dw_prelacion.rowcount()
					for ll_indi= 1 to ll_tot_reg
						ls_parentesco_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'parentesco')
						ll_rut_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'rut')
						ls_dv_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'dv')
						ls_nombres_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'nombres')
						ls_ap_pat_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_paterno')
						ls_ap_mat_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'apellido_materno')
						ls_tipo_via_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'tipo_via')
						ls_dire_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'direccion')
						ls_num_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'numero_direc')
						ls_depto_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'depto_direc')
						ls_block_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'block_direc')
						ls_ciudad_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'ciudad')
						ls_comuna_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'comuna')
						ls_fono_part_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'telefono_particular')
						ls_fono_com_pre	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'telefono_comercial')
						ls_celular_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'celular')
						ls_correo_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'correo_electronico')
						ls_obs_pre			= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'observacion')
						ls_estado_civil		= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'estado_civil')
						ll_nacionalidad		= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(ll_indi,'nacionalidad')
						if isnull(ls_parentesco_pre) or ls_parentesco_pre=''  then
							messagebox("Advertencia","Debe Ingresar Parentesco en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('parentesco')
							ls_pasa		= 'N'
							exit
						elseif isnull(ll_rut_pre) or ll_rut_pre=0 then
							messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('rut')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_dv_pre) or ls_dv_pre = '' then
							messagebox("Advertencia","Debe Ingresar Digito Verificador en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('dv')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_nombres_pre) or ls_nombres_pre='' then
							messagebox("Advertencia","Debe Ingresar Nombre Prelación en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('nombres')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_ap_pat_pre) or ls_ap_pat_pre='' then
							messagebox("Advertencia","Debe Ingresar Apellido Paterno en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('apellido_paterno')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_ap_mat_pre) or ls_ap_mat_pre='' then
							messagebox("Advertencia","Debe Ingresar Apellido Materno en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('apellido_materno')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_tipo_via_pre) or ls_tipo_via_pre='' then
							messagebox("Advertencia","Debe Ingresar Tipo Via en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('tipo_via')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_dire_pre) or ls_dire_pre='' then
							messagebox("Advertencia","Debe Ingresar Dirección en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('direccion')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_num_pre) or ls_num_pre='' then
							messagebox("Advertencia","Debe Ingresar Número Dirección en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('numero_direc')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_depto_pre) or ls_depto_pre='' then
							messagebox("Advertencia","Debe Ingresar Depto Dirección en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('depto_direc')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_block_pre) or ls_block_pre='' then
							messagebox("Advertencia","Debe Ingresar Block Dirección en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('block_direc')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_ciudad_pre) or ls_ciudad_pre='' then
							messagebox("Advertencia","Debe Ingresar Ciudad en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('ciudad')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_comuna_pre) or ls_comuna_pre='' then
							messagebox("Advertencia","Debe Ingresar Comuna en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('comuna')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_fono_part_pre) or ls_fono_part_pre='' then
							messagebox("Advertencia","Debe Ingresar Telefono Particular en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_particular')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_fono_com_pre) or ls_fono_com_pre='' then
							messagebox("Advertencia","Debe Ingresar Telefono Comercial en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('telefono_comercial')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_celular_pre) or ls_celular_pre='' then
							messagebox("Advertencia","Debe Ingresar Celular en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('celular')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_correo_pre) or ls_correo_pre='' then
							messagebox("Advertencia","Debe Ingresar Correo Electronico en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('correo_electronico')
							ls_pasa		= 'N'
							exit
						elseif isnull(ls_obs_pre) or ls_obs_pre='' then
							messagebox("Advertencia","Debe Ingresar Observaciones en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('observacion')
							ls_pasa		= 'N'
							exit
							
						elseif isnull(ls_estado_civil) or ls_estado_civil='' then
							messagebox("Advertencia","Debe Ingresar Estado Civil en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('estado_civil')
							ls_pasa		= 'N'
							exit
						elseif isnull(ll_nacionalidad) then
							messagebox("Advertencia","Debe Ingresar Nacionalidad en Fila "+string(ll_indi))
							tab_crematorio.tabpage_4.dw_prelacion.scrolltorow(ll_indi)
							tab_crematorio.tabpage_4.dw_prelacion.setcolumn('nacionalidad')
							ls_pasa		= 'N'
							exit
						end if
					next
					if ls_pasa = 'S' then
						ll_new		= dw_prelacion.insertrow(0)
						dw_prelacion.setitem(ll_new,'folio_crematorio',il_folio)
						dw_prelacion.setitem(ll_new,'base',is_base)
						dw_prelacion.setitem(ll_new,'serie',is_serie)
						dw_prelacion.setitem(ll_new,'numero',il_numero)
						dw_prelacion.setitem(ll_new,'estado_reg','A')
						dw_prelacion.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
						dw_prelacion.setitem(ll_new,'usuario_crea',gs_user)
						dw_prelacion.setitem(ll_new,'nacionalidad',45)
						dw_prelacion.setfocus()
						dw_prelacion.scrolltorow(ll_new)
					end if
					dw_prelacion.accepttext()
				CASE 't_eliminar'
					ll_fila		= dw_prelacion.getrow()
					if ll_fila > 0 then
						ll_res		= messagebox("Eliminar","Está Seguro de Eliminar Fila N° "+string(ll_fila),Exclamation!,YesNo!,2)
						if ll_res=1 then
							dw_prelacion.setitem(ll_fila,'estado_reg','I')
							dw_prelacion.setitem(ll_fila,'fecha_crea',gdt_fec_sistema)
							dw_prelacion.setitem(ll_fila,'usuario_crea',gs_user)
		//					dw_prelacion.deleterow(ll_fila)
							messagebox("Eliminar","Eliminación Exitosa, recuerde Grabar los Cambios")
						end if
					end if
					
				CASE 't_copiar'
					ll_rut_titular		= tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular')
					ls_dv_titular		= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'dv_titular')
					ls_nom_titular	= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'nombres')
					ls_pat_titular	= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_paterno')
					ls_mat_titular	= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'apellido_materno')
					ls_celular		= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'celular')
					ls_email			= tab_crematorio.tabpage_3.dw_titular.getitemstring(1,'email')
					
					if ll_rut_titular > 0 then
						ll_fila			= dw_prelacion.Find("rut = "+string(ll_rut_titular), 1, dw_prelacion.RowCount())
						if ll_fila=0 then
							ll_new	= dw_prelacion.insertrow(0)
							dw_prelacion.setitem(1,'parentesco','4')
							dw_prelacion.setitem(1,'rut',ll_rut_titular)
							dw_prelacion.setitem(1,'dv',ls_dv_titular)
							dw_prelacion.setitem(1,'nombres',ls_nom_titular)
							dw_prelacion.setitem(1,'apellido_paterno',ls_pat_titular)
							dw_prelacion.setitem(1,'apellido_materno',ls_mat_titular)
							dw_prelacion.setitem(1,'celular',ls_celular)
							dw_prelacion.setitem(1,'correo_electronico',ls_email)
							dw_prelacion.setitem(1,'nacionalidad',45)
							SELECT 	"CLIENTE"."TIPO_VIA",  	"CLIENTE"."DIRECCION_P",   	"CLIENTE"."NUMERO_PARTICULAR",   	"CLIENTE"."DEPTO_PARTICULAR",   	"CLIENTE"."BLOCK_PARTICULAR",   	"CLIENTE"."CIUDAD",   	"CLIENTE"."COMUNA",   	"CLIENTE"."FONO_P",   	"CLIENTE"."FONO_C",   	"CLIENTE"."ESTA_CIVIL"  
							INTO 		:ls_tipo_via,   				:ls_direc,   							:ls_nro_part,   									:ls_depto_part,   							:ls_block_part,   							:ls_ciudad,   				:ls_comuna,   				:ls_fono_p,   				:ls_fono_c,   				:ls_estado_civil_c
							FROM 	"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut_titular  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								dw_prelacion.setitem(1,'tipo_via',ls_tipo_via)
								dw_prelacion.setitem(1,'direccion',ls_direc)
								dw_prelacion.setitem(1,'numero_direc',ls_nro_part)
								dw_prelacion.setitem(1,'depto_direc',ls_depto_part)
								dw_prelacion.setitem(1,'block_direc',ls_block_part)
								dw_prelacion.setitem(1,'ciudad',ls_ciudad)
								idw_detalle13.retrieve(ls_ciudad)
								dw_prelacion.setitem(1,'comuna',ls_comuna)
								dw_prelacion.setitem(1,'telefono_particular',ls_fono_p)
								dw_prelacion.setitem(1,'telefono_comercial',ls_fono_c)
								dw_prelacion.setitem(1,'estado_civil',ls_estado_civil_c)
							end if
							dw_prelacion.accepttext()
						else
							messagebox("Advertencia","Rut Ya Existe en Lista Prelación Fila N° "+string(ll_fila))
						end if
					end if
			END CHOOSE
		end if
	end if
end if
this.accepttext()
end event

event itemchanged;String		ls_columna,ls_dv,ls_nulo,ls_ciudad,ls_celular,ls_pasa_p,ls_pasa_letras,ls_email
Long		ll_rut,ll_new,ll_fono_p_largo,ll_rut_tit

this.accepttext()
Setnull(ls_nulo)
il_grabar ++
ll_rut_tit			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	ls_columna			= dwo.name
	if row > 0 then
		if ls_columna='rut' or ls_columna='dv' then
			ll_rut			= this.getitemnumber(this.getrow(),'rut')
			ls_dv			= this.getitemstring(this.getrow(),'dv')
			if ll_rut > 0 and not isnull(ls_dv) then
				if f_valida_rut(string(ll_rut)) <> ls_dv then
					messagebox("Advertencia","Rut Inválido")
					this.setitem(this.getrow(),'dv',ls_nulo)
				end if
			end if
		elseif ls_columna='ciudad' then
			ls_ciudad		= this.getitemstring(this.getrow(),'ciudad')
			if not isnull(ls_ciudad) then
				idw_detalle13.retrieve(ls_ciudad)
			end if
		elseif ls_columna='telefono_particular' then
			ll_new					= this.getrow()
			ls_celular				= this.getitemstring(ll_new,'telefono_particular')
			is_celular				= ls_celular
			ll_fono_p_largo			= len(ls_celular)
			if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
				if ls_celular <> '' and ls_celular <> '-' then
					ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'telefono_particular')
					if ls_pasa_p='N' then
						this.scrolltorow(ll_new)
						messagebox('Advertencia','Telefono Particular debe tener 9 Digitos',stopsign!)
						this.setitem(ll_new,'telefono_particular','')
						this.setfocus()
						this.setcolumn('telefono_particular')
					else
						ls_pasa_letras 		= wf_validar_letras(ls_celular,'telefono_particular')
						if ls_pasa_letras = 'N' then
							this.scrolltorow(ll_new)
							messagebox('Advertencia','Ingrese solo números',stopsign!)
							this.setitem(ll_new,'telefono_particular','')
							this.accepttext()
							this.setfocus()
							this.setcolumn('telefono_particular')
						end if	
					end if
				end if
			end if
		elseif ls_columna='telefono_comercial' then
			ll_new					= this.getrow()
			ls_celular				= this.getitemstring(ll_new,'telefono_comercial')
			is_celular				= ls_celular
			ll_fono_p_largo			= len(ls_celular)
			if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
				if ls_celular <> '' and ls_celular <> '-' then
					ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'telefono_comercial')
					if ls_pasa_p='N' then
						this.scrolltorow(ll_new)
						messagebox('Advertencia','Telefono Comercial debe tener 9 Digitos',stopsign!)
						this.setitem(ll_new,'telefono_comercial','')
						this.setfocus()
						this.setcolumn('telefono_comercial')
					else
						ls_pasa_letras 		= wf_validar_letras(ls_celular,'telefono_comercial')
						if ls_pasa_letras = 'N' then
							this.scrolltorow(ll_new)
							messagebox('Advertencia','Ingrese solo números',stopsign!)
							this.setitem(ll_new,'telefono_comercial','')
							this.accepttext()
							this.setfocus()
							this.setcolumn('telefono_comercial')
						end if	
					end if
				end if
			end if
		elseif ls_columna='celular' then
			ll_new					= this.getrow()
			ls_celular				= this.getitemstring(ll_new,'celular')
			is_celular				= ls_celular
			ll_fono_p_largo			= len(ls_celular)
			if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
				if ls_celular <> '' and ls_celular <> '-' then
					ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')
					if ls_pasa_p='N' then
						this.scrolltorow(ll_new)
						messagebox('Advertencia','Celular debe tener 9 Digitos',stopsign!)
						this.setitem(ll_new,'celular','')
						this.setfocus()
						this.setcolumn('celular')
					else
						ls_pasa_letras 		= wf_validar_letras(ls_celular,'celular')
						if ls_pasa_letras = 'N' then
							this.scrolltorow(ll_new)
							messagebox('Advertencia','Ingrese solo números',stopsign!)
							this.setitem(ll_new,'celular','')
							this.accepttext()
							this.setfocus()
							this.setcolumn('celular')
						end if	
					end if
				end if
			end if
		elseif ls_columna = 'correo_electronico' then
			ll_new				= this.getrow()
			ls_email				= this.getitemstring(this.getrow(),'correo_electronico')
			if ls_email <> '' and ls_email <> '-' then
				if Match(ls_email, "@") then
				else
					messagebox('Advertencia','Correo Electrónico no es Válido',stopsign!)
					this.scrolltorow(ll_new)
					this.setitem(ll_new,'correo_electronico',ls_nulo)
					this.accepttext()
					this.setfocus()
					this.setcolumn('correo_electronico')
				end if	
			end if	
		end if
	end if
end if
this.accepttext()
end event

event itemfocuschanged;Long		ll_new,ll_fono_p_largo
String		ls_celular,ls_pasa_p,ls_pasa_letras,ls_email,ls_nulo

Setnull(ls_nulo)
ll_new						= this.getrow()
if il_grabar > 0 then
	ls_celular				= this.getitemstring(ll_new,'telefono_particular')
	is_celular				= ls_celular
	ll_fono_p_largo			= len(ls_celular)
	if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
		if ls_celular <> '' and ls_celular <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'telefono_particular')
			if ls_pasa_p='N' then
				this.scrolltorow(ll_new)
	//			messagebox('Advertencia','Telefono Particular debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'telefono_particular','')
				this.setfocus()
				this.setcolumn('telefono_particular')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_celular,'telefono_particular')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
	//				messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'telefono_particular','')
					this.accepttext()
					this.setfocus()
					this.setcolumn('telefono_particular')
				end if	
			end if
		end if
	end if
	
	ls_celular				= this.getitemstring(ll_new,'telefono_comercial')
	is_celular				= ls_celular
	ll_fono_p_largo			= len(ls_celular)
	if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
		if ls_celular <> '' and ls_celular <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'telefono_comercial')
			if ls_pasa_p='N' then
				this.scrolltorow(ll_new)
	//			messagebox('Advertencia','Telefono Comercial debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'telefono_comercial','')
				this.setfocus()
				this.setcolumn('telefono_comercial')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_celular,'telefono_comercial')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
	//				messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'telefono_comercial','')
					this.accepttext()
					this.setfocus()
					this.setcolumn('telefono_comercial')
				end if	
			end if
		end if
	end if
	
	ls_celular				= this.getitemstring(ll_new,'celular')
	is_celular				= ls_celular
	ll_fono_p_largo			= len(ls_celular)
	if ll_fono_p_largo > 0 and ls_celular <> '-' and ls_celular <>'' and not isnull(ls_celular) then 
		if ls_celular <> '' and ls_celular <> '-' then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')
			if ls_pasa_p='N' then
				this.scrolltorow(ll_new)
	//			messagebox('Advertencia','Celular debe tener 9 Digitos',stopsign!)
				this.setitem(ll_new,'celular','')
				this.setfocus()
				this.setcolumn('celular')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_celular,'celular')
				if ls_pasa_letras = 'N' then
					this.scrolltorow(ll_new)
	//				messagebox('Advertencia','Ingrese solo números',stopsign!)
					this.setitem(ll_new,'celular','')
					this.accepttext()
					this.setfocus()
					this.setcolumn('celular')
				end if	
			end if
		end if
	end if
	
	ls_email				= this.getitemstring(this.getrow(),'correo_electronico')
	if ls_email <> '' and ls_email <> '-' then
		if Match(ls_email, "@") then
		else
	//		messagebox('Advertencia','Correo Electrónico no es Válido',stopsign!)
			this.scrolltorow(ll_new)
			this.setitem(ll_new,'correo_electronico',ls_nulo)
			this.accepttext()
			this.setfocus()
			this.setcolumn('correo_electronico')
		end if	
	end if
end if
end event

type tabpage_6 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Documentos"
long tabtextcolor = 33554432
string picturename = "Cascade1!"
long picturemaskcolor = 536870912
dw_archivos dw_archivos
end type

on tabpage_6.create
this.dw_archivos=create dw_archivos
this.Control[]={this.dw_archivos}
end on

on tabpage_6.destroy
destroy(this.dw_archivos)
end on

type dw_archivos from datawindow within tabpage_6
event ex_mousemove pbm_dwnmousemove
event ue_graba_autoriza_seremi ( )
integer x = 18
integer y = 44
integer width = 3177
integer height = 1468
integer taborder = 30
string title = "none"
string dataobject = "dw_fc_detalle_documento_por_ficha"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ex_mousemove;//if il_carga_archivo > 0 then
//	cb_act_doc.triggerevent(clicked!)
//end if
end event

event itemchanged;String		ls_columna,ls_categoria,ls_nulo,ls_val_categoria,ls_val_estado_reg,ls_fila_categoria,ls_fila_estado_reg,ls_autoriza,ls_codigo_otro,ls_base,ls_serie,ls_dv_tit,ls_nombre_tit,ls_ap_pat_tit,ls_ap_mat_tit,&
			ls_tipo_origen,ls_tipo_sol_origen,ls_dv_fall,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_visual_serv,ls_dv_respon,ls_nom_respon,ls_ap_pat_respon,ls_ap_mat_respon,ls_responzable_retiro,ls_fono1,ls_fono2,&
			ls_descrip_origen,ls_descrip_otro,email_de,ls_email_para,ls_asunto,ls_texto,ls_res,ls_horas,ls_usuario_valida
Long		ll_new,ll_fono_p_largo,ll_cod_doc,ll_folio_fc,ll_val_documento,ll_tot_reg,ll_indi,ll_fila_documento,ll_nulo,ll_numero,ll_hora_cine,ll_minuto_cine,ll_hora_retiro_ceniza,ll_minuto_retiro_ceniza,ll_sw_participa,&
			ll_destino_cuerpo,ll_res_correo
Double	ll_rut_pre,ll_rut,ll_rut_fall,ll_rut_tit,ll_val_rut3,ll_fila_rut3,ll_rut_respon
datetime	ldt_fecha_cine,ldt_fec_def,ldt_fecha_retiro_ceniza

Setnull(ls_nulo);setnull(ll_nulo)
this.accepttext()
SELECT sysdate INTO :gdt_fec_sistema  FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

il_mod_archivo ++
il_fila_arc					= 0
il_count_arc					= 0

ls_columna					= dwo.name
ll_rut_tit						= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
ll_folio_fc					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
if ls_columna='url' or ls_columna='observacion_valida' or ls_columna='usuario_valida' or ls_columna='autoriza_seremi' then
	il_grabar ++
end if
if ll_rut_tit > 0 then
	if row > 0 then
		this.setitem(this.getrow(),'estado_carga','S')
		if ls_columna='categoria' then
			ls_categoria			= this.getitemstring(this.getrow(),'categoria')
			ll_cod_doc			= long(this.getitemnumber(this.getrow(),'codigo_documento'))
			if not isnull(ls_categoria) and not isnull(ll_cod_doc) then
				idw_detalle16.retrieve(ll_folio_fc)
			end if
			if not isnull(ls_categoria) then
				//idw_detalle15.retrieve(ls_categoria)
				idw_detalle15.retrieve()
			end if
		elseif ls_columna='codigo_documento' then
			ls_categoria			= this.getitemstring(this.getrow(),'categoria')
			ll_cod_doc			= long(this.getitemnumber(this.getrow(),'codigo_documento'))
			if not isnull(ls_categoria) and not isnull(ll_cod_doc) then
				idw_detalle16.retrieve(ll_folio_fc)
			end if
			if ls_categoria='FA' then 			//Fallecido
				ll_rut_fall			= tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido')
				this.setitem(this.getrow(),'rut_tercero',ll_rut_fall)
				this.accepttext()
			elseif ls_categoria='PR' then 	//Prelacion
				ll_rut_pre		= tab_crematorio.tabpage_4.dw_prelacion.getitemnumber(tab_crematorio.tabpage_4.dw_prelacion.getrow(),'rut')
				this.setitem(this.getrow(),'rut_tercero',ll_rut_pre)
				this.accepttext()
			elseif ls_categoria='TI' then 	//Titular
				ll_rut_tit			= tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular')
				this.setitem(this.getrow(),'rut_tercero',ll_rut_tit)
				this.accepttext()
			elseif ls_categoria='VA' then	// Venta
				ll_rut_tit			= tab_crematorio.tabpage_3.dw_titular.getitemnumber(1,'rut_titular')
				this.setitem(this.getrow(),'rut_tercero',ll_rut_tit)
				this.accepttext()
			end if
		elseif ls_columna='usuario_valida' then
			ls_usuario_valida	= data
			if not isnull(ls_usuario_valida) then
				this.setitem(this.getrow(),'fecha_valida',gdt_fec_sistema)
			end if
			
		elseif ls_columna='autoriza_seremi' then
			ls_autoriza			= string(data)
//			ls_autoriza			= this.getitemstring(this.getrow(),'autoriza_seremi')
			if ls_autoriza='S' then
				SELECT 	"FC_ENVIO_EMAIL"."CORREO_ADMIN",	 "FC_ENVIO_EMAIL"."CORREO_DE"
				INTO 		:ls_email_para,									:email_de
				FROM 	"FC_ENVIO_EMAIL"  
				WHERE 	"FC_ENVIO_EMAIL"."COD_FUNERARIA_PARQUE" = 142   ;
				
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'solicitud_cineracion_seremi',2)
				tab_crematorio.tabpage_1.dw_ficha.accepttext()
				SELECT 		"FC_ARANCEL"."CODIGO_OTRO",	"FC_CABECERA"."BASE",	"FC_CABECERA"."SERIE",	"FC_CABECERA"."NUMERO",	"FC_TITULAR"."RUT_TITULAR",	"FC_TITULAR"."DV_TITULAR",		"FC_TITULAR"."NOMBRES",	"FC_TITULAR"."APELLIDO_PATERNO",	"FC_TITULAR"."APELLIDO_MATERNO",	"FC_CABECERA"."FECHA_CINERACION",	"FC_CABECERA"."HORA_CINERACION",	"FC_CABECERA"."MINUTO_CINERACION",	"FC_CABECERA"."TIPO_ORIGEN",	"FC_CABECERA"."TIPO_SOLICITUD_ORIGEN",	"FC_FALLECIDO"."RUT_FALLECIDO",	"FC_FALLECIDO"."DV_FALLECIDO",	"FC_FALLECIDO"."NOMBRES",	"FC_FALLECIDO"."APELLIDO_PATERNO",	"FC_FALLECIDO"."APELLIDO_MATERNO",		"FC_FALLECIDO"."FECHA_DEFUNCION"
				INTO 			:ls_codigo_otro,						:ls_base,						:ls_serie,							:ll_numero,						:ll_rut_tit,								:ls_dv_tit,								:ls_nombre_tit,					:ls_ap_pat_tit,									:ls_ap_mat_tit,									:ldt_fecha_cine,								:ll_hora_cine,									:ll_minuto_cine,									:ls_tipo_origen,							:ls_tipo_sol_origen,									:ll_rut_fall,									:ls_dv_fall,   								:ls_nom_fall,						:ls_ap_pat_fall,									:ls_ap_mat_fall,									:ldt_fec_def
				FROM			"FC_CABECERA",	"FC_FALLECIDO",	"FC_TITULAR" ,	"FC_ARANCEL" 
				WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_ARANCEL"."FOLIO_CREMATORIO" ) and  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_TITULAR"."FOLIO_CREMATORIO" ) and  
							( "FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio_fc )  
				USING	Trans_1;
							
				ll_res_correo				= messagebox("Envio Email","Se Autoriza Antecedentes Cremación por parte SEREMI, desea Enviar Correo de Aviso Administrador Crematorio",Exclamation!,YesNo!,2)
				if ll_res_correo=1 then
					SELECT 	"FC_TIPO_SOLICITUD_ORIGEN"."DESCRIPCION"  
					INTO 		:ls_descrip_origen  
					FROM 	"FC_TIPO_SOLICITUD_ORIGEN"  
					WHERE ( "FC_TIPO_SOLICITUD_ORIGEN"."TIPO_ORIGEN" = :ls_tipo_origen ) AND  
							  ( "FC_TIPO_SOLICITUD_ORIGEN"."TIPO_SOLICITUD_ORIGEN" = :ls_tipo_sol_origen )   ;
							  
					SELECT DISTINCT "CUENTA_CONTABLE_OTROS"."DESCRIPCION"  
					INTO 		:ls_descrip_otro  
					FROM 	"CUENTA_CONTABLE_OTROS"  
					WHERE 	"CUENTA_CONTABLE_OTROS"."CODIGO_OTROS" = :ls_codigo_otro   ;
					
					if date(ldt_fecha_cine) = date('01/01/1900') then setnull(ldt_fecha_cine)
					if date(ldt_fec_def) = date('01/01/1900') then setnull(ldt_fec_def)
					
					if isnull(ldt_fecha_cine) then
						messagebox("Advertencia","Debe Ingresar Fecha Recepción")
					elseif isnull(ll_rut_fall) then
						messagebox("Advertencia","Debe Ingresar Rut Fallecido")
					elseif isnull(ls_dv_fall) then
						messagebox("Advertencia","Debe Ingresar Digito Verificador Fallecido")
					elseif isnull(ls_nom_fall) then
						messagebox("Advertencia","Debe Ingresar Nombre Fallecido")
					elseif isnull(ls_ap_pat_fall) then
						messagebox("Advertencia","Debe Ingresar Apellido Paterno Fallecido")
					elseif isnull(ls_ap_mat_fall) then
						messagebox("Advertencia","Debe Ingresar Apellido Materno Fallecido")
					elseif isnull(ldt_fec_def) then
						messagebox("Advertencia","Debe Ingresar Fecha Defunción")
					elseif isnull(ll_rut_tit) then
						messagebox("Advertencia","Debe Ingresar Rut Titular")
					elseif isnull(ls_dv_tit) then
						messagebox("Advertencia","Debe Ingresar Digito Verificador Titular")
					elseif isnull(ls_nombre_tit) then
						messagebox("Advertencia","Debe Ingresar Nombre Titular")
					elseif isnull(ls_ap_pat_tit) then
						messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
					elseif isnull(ls_ap_mat_tit) then
						messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
					elseif isnull(ls_base) then
						messagebox("Advertencia","Debe Ingresar Base Contrato")
					elseif isnull(ls_serie) then
						messagebox("Advertencia","Debe Ingresar Serie Contrato")
					elseif isnull(ll_numero) then
						messagebox("Advertencia","Debe Ingresar Numero Contrato")
					elseif isnull(ls_codigo_otro) then
						messagebox("Advertencia","Debe Ingresar Codigo Servicio Crematorio")
					elseif isnull(ls_descrip_otro) then
						messagebox("Advertencia","Debe Ingresar Servicio Crematorio")
					else
	//					email_de						= 'consulta@nuestrosparques.cl'
	//					ls_email_para				= 'mirkom@nuestrosparques.cl'		//'lvasquez@nuestrosparques.cl'		//'CoordinadorClientescrematorio@nuestrosparques.cl'
						if ll_hora_cine < 12 then
							ls_horas					= 'AM'
						else
							ls_horas					= 'PM'
						end if
						ls_asunto					= 	'<< PRUEBA >> Se Autoriza Cremación por parte SEREMI Ficha N° '+string(ll_folio_fc)+' Contrato N° '+ls_base+'-'+ls_serie+'-'+string(ll_numero)
						ls_texto						= 	'Se Autoriza Cremación por parte SEREMI Servicio Ficha Número: '+string(ll_folio_fc)+'~r'+&
															'Tipo Origen: '+ls_tipo_origen+'~r'+&
															'Tipo Solicitud: '+ls_tipo_sol_origen+'-'+ls_descrip_origen+'~r'+'~r'+&
															'Se adjunta Antecedentes'+'~r'+&
															'----------------------------'+'~r'+'~r'+&
															'Fecha y hora de Recepción del Fallecido: '+string(ldt_fecha_cine,'dd/mm/yyyy')+'   '+string(ll_hora_cine,'00')+':'+string(ll_minuto_cine,'00')+' '+ls_horas+'~r'+&
															'Rut y Nombre Fallecido: '+string(ll_rut_fall)+'-'+ls_dv_fall+'    '+ls_nom_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall+'~r'+&
															'Fecha Defunción: '+string(ldt_fec_def,'dd/mm/yyyy')+'~r'+'~r'+&
															'Rut y Nombre Titular: '+string(ll_rut_tit)+'-'+ls_dv_tit+'    '+ls_nombre_tit+' '+ls_ap_pat_tit+' '+ls_ap_mat_tit+'~r'+'~r'+&
															'Contrato N°: '+ls_base+'-'+ls_serie+string(ll_numero)+'~r'+'~r'+&
															'Tipo Servicio: '+ls_codigo_otro+'-'+ls_descrip_otro
						select		EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
						INTO 		:ls_res
						from 		DUAL;
						if ls_res='OK' then
							messagebox("Envio Email","Envio Email Exitoso")
						else
							messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
						end if
					end if
				end if
			end if
		end if
		il_fila_arc				= this.getrow()
		ls_val_categoria		= this.getitemstring(il_fila_arc,'categoria')
		ll_val_documento		= this.getitemnumber(il_fila_arc,'codigo_documento')
		ll_val_rut3				= this.getitemnumber(il_fila_arc,'rut_tercero')
		ls_val_estado_reg		= this.getitemstring(il_fila_arc,'estado_reg')
		ll_tot_reg				= this.rowcount()
		if ll_tot_reg > 1 and not isnull(ls_val_categoria) and ll_val_documento>0 and ll_val_rut3>0 and not isnull(ls_val_estado_reg) then
			for ll_indi=1 to ll_tot_reg
				ls_fila_categoria		= this.getitemstring(ll_indi,'categoria')
				ll_fila_documento		= this.getitemnumber(ll_indi,'codigo_documento')
				ll_fila_rut3				= this.getitemnumber(ll_indi,'rut_tercero')
				ls_fila_estado_reg		= this.getitemstring(ll_indi,'estado_reg')
				if ls_val_categoria = ls_fila_categoria and ll_val_documento=ll_fila_documento and ll_val_rut3=ll_fila_rut3 and ls_val_estado_reg=ls_fila_estado_reg then
					il_count_arc++
				end if
			next
			if il_count_arc > 1 then
				messagebox("Advertencia","Item Duplicado")
				this.setitem(il_fila_arc,'codigo_documento',ll_nulo)
				this.setitem(il_fila_arc,'rut_tercero',ll_nulo)
				this.accepttext()
			end if
		end if
		
	end if
end if

dw_archivos.accepttext()

end event

event clicked;String		ls_columna,ls_categoria,ls_url,ls_estado,ls_autoriza,ls_string,ls_estado_carga,ls_pasa='S'
Long		ll_new,ll_tot_reg,ll_indi,ll_codigo,ll_rut,ll_res,ll_folio_crem,ret,ls_nulo
Double	ll_rut_tit
Inet		iinet_base2

this.accepttext()
Setnull(ls_nulo)
ls_columna							= dwo.name
ll_rut_tit								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
	il_row_archivo					= row
	this.scrolltorow(il_row_archivo)
end if
if ll_rut_tit > 0 then
	ll_folio_crem					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
	ret									= GetContextService("Internet", iinet_base2)
	if row > 0 then
		if isnull(ll_folio_crem) then ll_folio_crem=0
		if ll_folio_crem > 0 then
			if ls_columna='b_archivo' then
				ls_categoria			= this.getitemstring(il_row_archivo,'categoria') 
				ll_codigo				= this.getitemnumber(il_row_archivo,'codigo_documento')
				ll_rut					= this.getitemnumber(il_row_archivo,'rut_tercero')
				ls_estado_carga	= this.getitemstring(il_row_archivo,'estado_carga') 
				il_carga_archivo ++
				if ls_estado_carga='S' then
					ls_url				= this.getitemstring(il_row_archivo,'url')
					if not isnull(ls_url) then
						ret				= iinet_base2.HyperlinkToURL(ls_url)
					end if
				else
					if not isnull(ls_categoria) and not isnull(ll_codigo) and not isnull(ll_rut) then
						il_mod_archivo ++
						this.scrolltorow(il_row_archivo)
						ls_string		= "https://www.nuestrosparques.cl/c_docs/?ficha="+string(ll_folio_crem)+"&doc="+string(ll_codigo)+"&cat="+string(ls_categoria)+"&"+"rut3="+string(ll_rut)+"&"+"usuario="+string(gs_user) 
	//					messagebox("string",ls_string)
						ret				= iinet_base2.HyperlinkToURL(ls_string)
						//abrir ventana
						this.scrolltorow(il_row_archivo)
					else
						if isnull(ls_categoria) then
							messagebox("Advertencia","Debe Ingresar Categoria en Fila "+string(il_row_archivo))
							this.setfocus()
							this.setcolumn('categoria')
						elseif isnull(ll_codigo) then
							messagebox("Advertencia","Debe Ingresar Codigo Documento en Fila "+string(il_row_archivo))
							this.setfocus()
							this.setcolumn('codigo_documento')
						elseif isnull(ll_rut) then
							messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(il_row_archivo))
							this.setfocus()
							this.setcolumn('rut_tercero')
						end if
						this.scrolltorow(il_row_archivo)
					end if
				end if
			end if
		else
			messagebox("Advertencia","Recuerde para registrar Archivos, debe estar Grabada Ficha Crematorio")
		end if
	else
		if ls_columna='t_nuevo' then
			ll_tot_reg	= this.rowcount()
			if ll_tot_reg > 0 then
				ls_pasa			= 'S'
//				for ll_indi=1 to ll_tot_reg
//					ls_categoria		= this.getitemstring(ll_indi,'categoria')
//					ll_codigo			= this.getitemnumber(ll_indi,'codigo_documento')
//					ll_rut				= this.getitemnumber(ll_indi,'rut_tercero')
//					ls_url				= this.getitemstring(ll_indi,'url')
//					ls_estado		= this.getitemstring(ll_indi,'estado_carga')
//					ls_autoriza		= this.getitemstring(ll_indi,'autoriza_seremi')
//					ls_pasa			= 'S'
//					if isnull(ls_categoria) then
//						messagebox("Advertencia","Debe Ingresar Categoria en Fila "+string(ll_indi))
//						this.scrolltorow(ll_indi)
//						this.setcolumn('categoria')
//						ls_pasa		= 'N'
//						exit
//					elseif isnull(ll_codigo) then
//						messagebox("Advertencia","Debe Ingresar Codigo Documento en Fila "+string(ll_indi))
//						this.scrolltorow(ll_indi)
//						this.setcolumn('codigo_documento')
//						ls_pasa		= 'N'
//						exit
//					elseif isnull(ll_rut) then
//						messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(ll_indi))
//						this.scrolltorow(ll_indi)
//						this.setcolumn('rut_tercero')
//						ls_pasa		= 'N'
//						exit
//					elseif isnull(ls_url) then
//						messagebox("Advertencia","Debe Realizar Carga URL en Fila "+string(ll_indi))
//						this.scrolltorow(ll_indi)
//						this.setcolumn('url')
//						ls_pasa		= 'N'
//						exit
//					elseif isnull(ls_estado) then	// or ls_estado <> 'S'
//						messagebox("Advertencia","No esta Correctamente Cargado Archivo en Fila "+string(ll_indi))
//						this.scrolltorow(ll_indi)
//						ls_pasa		= 'N'
//						exit
//					elseif (isnull(ls_autoriza) or ls_autoriza <> '') and ls_categoria='FA' and ll_codigo=8 then
//						messagebox("Advertencia","Debe Seleccionar Autorización Seremi S/N en Fila "+string(ll_indi))
//						this.scrolltorow(ll_indi)
//						ls_pasa		= 'N'
//						exit
//					end if
//				next
			end if
			if ls_pasa='S' then
				ll_new		= this.insertrow(0)
				this.scrolltorow(ll_new)
				this.setitem(ll_new,'estado_carga','N')
				this.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
				this.setitem(ll_new,'usuario_crea',gs_user)
				this.setitem(ll_new,'folio_crematorio',il_folio)
				this.setitem(ll_new,'estado_reg','A')
				this.setitem(ll_new,'base',is_base)
				this.setitem(ll_new,'serie',is_serie)
				this.setitem(ll_new,'numero',il_numero)
			end if
			
		elseif ls_columna='t_eliminar' then
			ll_res			= messagebox("Eliminar","Está Seguro Eliminar Fila N° "+string(il_row_archivo,'###,###,###,##0'),Exclamation!,YesNo!,2)
			if ll_res=1 then
				this.setitem(il_row_archivo,'estado_reg','I')
//				dw_archivos.deleterow(il_row_archivo)
				this.accepttext()
				if dw_archivos.update()=1 then
					if dw_archivos.rowcount() > 0 then dw_archivos.scrolltorow(1)
					commit;
				else
					rollback;
					messagebox("Error Eliminar","Error al Eliminar Registro SQL: "+sqlca.sqlerrtext)
				end if
			end if
		elseif ls_columna='t_actualizar' then
			if il_folio > 0 then
				if dw_archivos.update()=1 then
					commit;
				else
					rollback;
				end if
				dw_archivos.retrieve(ll_folio_crem)
				dw_archivos.sort()
			end if
//		elseif ls_columna='t_limpiar' then
//			ll_res			= messagebox("Eliminar","Está Seguro Limpiar Archivo Fila N° "+string(il_row_archivo,'###,###,###,##0'),Exclamation!,YesNo!,2)
//			if ll_res=1 then
//				dw_archivos.setitem(il_row_archivo,'url','')
//				dw_archivos.setitem(il_row_archivo,'estado_carga','N')
//				dw_archivos.accepttext()
//				if dw_archivos.update()=1 then
//					commit;
//					if dw_archivos.rowcount() > 0 then dw_archivos.scrolltorow(il_row_archivo)
//				else
//					rollback;
//					messagebox("Error Eliminar","Error al Eliminar Registro SQL: "+sqlca.sqlerrtext)
//				end if
//			end if
		end if
	end if
end if
this.accepttext()
end event

event rowfocuschanged;Long		ll_folio_fc

if this.getrow() > 0 then
	il_row_archivo				= this.getrow()
	This.SelectRow(0, false)
	This.SelectRow(this.getrow(), true)
	this.scrolltorow(il_row_archivo)
end if
end event

event itemfocuschanged;Long		ll_nulo,ll_folio_fc
String		ls_columna
Setnull(ll_nulo)

ls_columna		= dwo.name
if il_count_arc > 1 then
	this.setitem(il_fila_arc,'codigo_documento',ll_nulo)
	this.setitem(il_fila_arc,'rut_tercero',ll_nulo)
	this.accepttext()
	il_count_arc		= 0
end if

end event

type tabpage_5 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Dcto Pago"
long tabtextcolor = 33554432
string picturename = "Custom048!"
long picturemaskcolor = 536870912
dw_aranceles dw_aranceles
end type

on tabpage_5.create
this.dw_aranceles=create dw_aranceles
this.Control[]={this.dw_aranceles}
end on

on tabpage_5.destroy
destroy(this.dw_aranceles)
end on

type dw_aranceles from datawindow within tabpage_5
integer x = 18
integer y = 44
integer width = 3177
integer height = 1396
integer taborder = 30
string title = "none"
string dataobject = "dw_fc_aranceles"
boolean border = false
boolean livescroll = true
end type

event clicked;String		ls_columna,ls_estado_reg,ls_fecha,ls_tipo_cob
Long		ll_folio_pago
datetime	ldt_fec_pago,ldt_nulo
Double	ll_rut_tit

Setnull(ldt_nulo)
ls_columna							= dwo.name
il_grabar ++
ll_rut_tit								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	ls_estado_reg					= this.getitemstring(this.getrow(),'estado_reg')
	ll_folio_pago      				= this.getitemnumber(this.getrow(),'folio_pago')
	ls_tipo_cob				      	= this.getitemstring(this.getrow(),'tipo_cob')
	if ll_folio_pago > 0 and not isnull(ls_tipo_cob) then
		if (ls_estado_reg<>'G' and ls_estado_reg<>'A') or isnull(ls_estado_reg) then
			CHOOSE CASE ls_columna
				CASE 'p_fec_pago'
					ll_folio_pago      	= this.getitemnumber(this.getrow(),'folio_pago')
					ldt_fec_pago		= this.getitemdatetime(this.getrow(),'fecha_pago')
					if not isnull(ll_folio_pago) and ll_folio_pago > 0 then
						ls_fecha			= string(date(this.getitemdatetime(this.getrow(),'fecha_pago')))
						if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
						if f_valida_fecha(ls_fecha)=-1 then 
							this.setitem(this.getrow(),'fecha_pago',datetime(string(today(),gs_formato_fecha)))
							return
						end if
						OpenWithParm(w_calendar,ls_fecha)
						IF not isnull(Message.StringParm) THEN
							if date(ldt_fec_pago) > today() and not isnull(ldt_fec_pago) then
								messagebox("Advertencia","Fecha Pago NO puede ser Mayor a Fecha deHoy")
								this.setitem(1,'fecha_pago',ldt_nulo)
							else
								ls_fecha		= trim(Message.StringParm)
								this.setitem(this.getrow(),'fecha_pago',date(ls_fecha))
							end if
						END IF
					end if
			END CHOOSE
		 end if
	end if
end if
end event

event itemchanged;String		ls_columna
Long		ll_folio_pago
datetime	ldt_fec_pago,ldt_nulo
Double	ll_rut_tit

this.accepttext()
Setnull(ldt_nulo)
ll_rut_tit						= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	ls_columna				= dwo.name
	if ls_columna='fecha_pago' then
		ldt_fec_pago		= this.getitemdatetime(this.getrow(),'fecha_pago')
		ll_folio_pago		= this.getitemnumber(this.getrow(),'folio_pago')
		if date(ldt_fec_pago) > today() and not isnull(ldt_fec_pago) and ll_folio_pago > 0 then
			messagebox("Advertencia","Fecha Pago NO puede ser Mayor a la Fecha de Hoy o Fecha Inválida")
			this.setitem(1,'fecha_pago',ldt_nulo)
		end if
	end if
end if
this.accepttext()
end event

type tabpage_7 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Ceremonia"
long tabtextcolor = 33554432
string picturename = "Custom083!"
long picturemaskcolor = 536870912
dw_ceremonia dw_ceremonia
end type

on tabpage_7.create
this.dw_ceremonia=create dw_ceremonia
this.Control[]={this.dw_ceremonia}
end on

on tabpage_7.destroy
destroy(this.dw_ceremonia)
end on

type dw_ceremonia from datawindow within tabpage_7
integer x = 18
integer y = 44
integer width = 3177
integer height = 1396
integer taborder = 30
string title = "none"
string dataobject = "dw_fc_ceremonia"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_nulo
Long		ll_sw_orador,ll_nulo

Setnull(ls_nulo);Setnull(ll_nulo)
this.accepttext()
il_grabar ++
ls_columna			= dwo.name
if ls_columna='sw_orador' or ls_columna='sw1' then
	ll_sw_orador	= long(data)
	this.setitem(1,'sw_orador',ll_sw_orador)
	if ll_sw_orador=1 then
		this.setitem(1,'codigo_diacono',ll_nulo)
		this.setitem(1,'codigo_maestro',ls_nulo)
//		this.setitem(1,'observacion',ls_nulo)
	elseif ll_sw_orador=2 then
		this.setitem(1,'codigo_maestro',ls_nulo)
//		this.setitem(1,'observacion',ls_nulo)
	elseif ll_sw_orador=3 then
		this.setitem(1,'codigo_diacono',ll_nulo)
//		this.setitem(1,'observacion',ls_nulo)
	elseif ll_sw_orador=4 then
		this.setitem(1,'codigo_diacono',ll_nulo)
		this.setitem(1,'codigo_maestro',ls_nulo)
	end if
	this.accepttext()
end if
end event

type tabpage_8 from userobject within tab_crematorio
integer x = 18
integer y = 112
integer width = 3218
integer height = 1540
long backcolor = 67108864
string text = "Destino Cenizas"
long tabtextcolor = 33554432
string picturename = "PasteSQL3!"
long picturemaskcolor = 536870912
st_ag_pergola st_ag_pergola
st_ag_capilla st_ag_capilla
dw_cenizas dw_cenizas
end type

on tabpage_8.create
this.st_ag_pergola=create st_ag_pergola
this.st_ag_capilla=create st_ag_capilla
this.dw_cenizas=create dw_cenizas
this.Control[]={this.st_ag_pergola,&
this.st_ag_capilla,&
this.dw_cenizas}
end on

on tabpage_8.destroy
destroy(this.st_ag_pergola)
destroy(this.st_ag_capilla)
destroy(this.dw_cenizas)
end on

type st_ag_pergola from statictext within tabpage_8
integer x = 14
integer y = 508
integer width = 480
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Ver Agenda Pergola"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_ag_capilla from statictext within tabpage_8
integer x = 27
integer y = 380
integer width = 462
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Ver Agenda Capilla"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_cenizas from datawindow within tabpage_8
event ue_mousemove pbm_dwnmousemove
integer x = 18
integer y = 44
integer width = 3177
integer height = 1488
integer taborder = 10
string title = "none"
string dataobject = "dw_fc_destino_responsable_cuerpo"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;string	ls_columna

ls_columna						= dwo.name
if ls_columna = 't_12' then
	st_ag_capilla.visible		= true
else
	st_ag_capilla.visible		= false
end if

if ls_columna = 't_19' then
	st_ag_pergola.visible		= true
else
	st_ag_pergola.visible		= false
end if
end event

event itemchanged;String		ls_responsable_retiro,ls_columna,ls_uso_capilla,ls_uso_pergola,ls_auto_admin,ls_hora
Long		ll_destino_cuerpo,ll_hora_capilla,ll_hora_pergola,ll_min_capilla,ll_min_pergola,ll_hora_actual,ll_minuto_actual,ll_hora_visual,ll_min_visual,ll_hora_capilla_fin,ll_min_capilla_fin,ll_count_capilla,&
			ll_hora_pergola_fin,ll_min_pergola_fin,ll_count_pergola,ll_hora_cine_setear,ll_min_cine_setear
datetime	ldt_fecha_retiro,ldt_fecha_crea,ldt_fecha_def,ldt_nulo,ldt_fecha_capilla,ldt_fecha_pergola,ldt_fecha_visual

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
ls_hora							= string(gdt_fec_sistema,"hh:mm")
ll_hora_actual					= long(mid(ls_hora,1,2))
ll_minuto_actual				= long(mid(ls_hora,4,2))
tab_crematorio.tabpage_8.dw_cenizas.accepttext()
tab_crematorio.tabpage_1.dw_ficha.accepttext()
ls_columna						= dwo.name
Setnull(ldt_nulo)
if ls_columna='responsable_retiro' then
	ls_responsable_retiro		= this.getitemstring(1,'responsable_retiro')
	if not isnull(ls_responsable_retiro) then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'responsable_retiro',ls_responsable_retiro)
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
elseif ls_columna='uso_capilla' then
	ls_uso_capilla				= data		//tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
	ls_uso_pergola				= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
	ls_auto_admin				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
//	if ls_auto_admin='N' then
//		messagebox("Advertencia","Debe Estar Autorizado por Administrador")
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
//		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
//	else
		if ls_uso_capilla='S' and ls_uso_pergola='S' then
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_nulo)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
			tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		elseif ls_uso_capilla='N' then
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_nulo)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
			tab_crematorio.tabpage_8.dw_cenizas.object.t_12.font.italic 							= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.t_13.font.italic							= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_capilla.font.italic			= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.t_14.font.italic							= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_capilla.font.italic			= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.minutos_uso_capilla.font.italic		= 0
		elseif ls_uso_capilla='S' then
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
			tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_uso_capilla')
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque','N')
		end if
//	end if
	tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	tab_crematorio.tabpage_1.dw_ficha.accepttext()
elseif ls_columna='uso_pergola' then
	ls_uso_pergola				= data		//tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
	ls_uso_capilla				= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
	ls_auto_admin				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
//	if ls_auto_admin='N' then
//		messagebox("Advertencia","Debe Estar Autorizado por Administrador")
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
//		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
//	else
		if ls_uso_capilla='S' and ls_uso_pergola='S' then
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_nulo)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
			tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		elseif ls_uso_pergola='N' then
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_nulo)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
			tab_crematorio.tabpage_8.dw_cenizas.object.t_17.font.italic 							= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.t_18.font.italic							= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.fecha_uso_pergola.font.italic			= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.t_19.font.italic							= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.hora_uso_pergola.font.italic			= 0
			tab_crematorio.tabpage_8.dw_cenizas.object.minuto_uso_pergola.font.italic		= 0
		elseif ls_uso_pergola='S' then
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
			tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_uso_pergola')
			tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		end if
//	end if
	tab_crematorio.tabpage_8.dw_cenizas.accepttext()
elseif ls_columna='destino_cuerpo' then
	ll_destino_cuerpo			= this.getitemnumber(1,'destino_cuerpo')
	if not isnull(ll_destino_cuerpo) then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'destino_cuerpo',ll_destino_cuerpo)
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
	tab_crematorio.tabpage_8.dw_cenizas.accepttext()
elseif ls_columna='fecha_retiro_ceniza' then
	ldt_fecha_retiro	= this.getitemdatetime(1,'fecha_retiro_ceniza')
	if not isnull(ldt_fecha_retiro) then
		ldt_fecha_crea	= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_crea')
		ldt_fecha_def	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
		if not isnull(ldt_fecha_crea) and not isnull(ldt_fecha_retiro) and ldt_fecha_retiro < ldt_fecha_crea then
			messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha de Solcitud Cremación")
			this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
			this.accepttext()
		elseif not isnull(ldt_fecha_crea) and not isnull(ldt_fecha_retiro) and ldt_fecha_retiro < ldt_fecha_def then
			messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha Defunción")
			this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
			this.accepttext()
		end if
	end if
elseif ls_columna='fecha_uso_capilla' or ls_columna='hora_uso_capilla' or ls_columna='minutos_uso_capilla' then
	ldt_fecha_capilla				= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla')
	ll_hora_capilla					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_capilla')
	ll_min_capilla					= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minutos_uso_capilla')
	ll_hora_capilla_fin				= ll_hora_capilla + 1
	ll_min_capilla_fin				= ll_min_capilla + 30
	if ll_min_capilla_fin >= 60 then
		ll_min_capilla_fin 			= 0
		ll_hora_capilla_fin			= ll_hora_capilla_fin + 1
	end if
	ll_hora_cine_setear			= ll_hora_capilla
	ll_min_cine_setear				= ll_min_capilla - 30
	if ll_min_cine_setear < 0 then
		ll_min_cine_setear 		= 30
		ll_hora_cine_setear		= ll_hora_cine_setear - 1
	end if 
	
	if not isnull(ldt_fecha_capilla) then
		if date(ldt_fecha_capilla) < date(gdt_fec_sistema) then
			messagebox("Advertencia","Fecha Uso Capilla Inválida, No debe ser menor a la fecha de Hoy")
			
		elseif ll_hora_capilla > 0 and not isnull(ll_min_capilla) then
			if is_tipo_venta='CV' then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_cineracion',ll_hora_cine_setear)	//ll_hora_capilla)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_cineracion',ll_min_cine_setear)	//ll_min_capilla)
			else
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_ingreso_cinerario',ll_hora_capilla)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',ll_min_capilla)
			end if
		elseif date(ldt_fecha_capilla) = date(gdt_fec_sistema) then
			if ll_hora_capilla < ll_hora_actual then
				messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
			elseif ll_hora_capilla = ll_hora_actual and ll_min_capilla < ll_minuto_actual then
				messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
			end if
			tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		else
			if is_tipo_venta='CV' then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_cineracion',ldt_fecha_capilla)
			else
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_fecha_capilla)
			end if
			if not isnull(ldt_fecha_capilla) and ll_hora_capilla > 0 and not isnull(ll_min_capilla) then
				SELECT 	COUNT("FC_AGENDA_CAPILLA"."EJECUTIVO")  
				INTO 		:ll_count_capilla 
				FROM 	"FC_AGENDA_CAPILLA" 
				WHERE ( "FC_AGENDA_CAPILLA"."FECHA_CREMACION" = :ldt_fecha_capilla ) AND  
						  ( "FC_AGENDA_CAPILLA"."HORA_CINERACION" >= :ll_hora_capilla ) AND  
						  ( "FC_AGENDA_CAPILLA"."MINUTO_CINERACION" >= :ll_min_capilla ) AND  
						  ( "FC_AGENDA_CAPILLA"."HORA_CINERACION_FIN" <= :ll_hora_capilla_fin ) AND  
						  ( "FC_AGENDA_CAPILLA"."MINUTO_CINERACION_FIN" <= :ll_min_capilla_fin )  AND
						  ( "FC_AGENDA_CAPILLA"."NUMERO" <> :il_numero)
				USING	sqlca;
				if ll_count_capilla > 0 then
					messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
					tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
					tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
					tab_crematorio.tabpage_8.dw_cenizas.accepttext()
					tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_capilla')
				end if
			end if
		end if
	end if
	
elseif ls_columna='fecha_uso_pergola' or  ls_columna='hora_uso_pergola' or ls_columna='minuto_uso_pergola' then
	ll_hora_pergola			=  tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_pergola')
	ll_min_pergola			= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_uso_pergola')
	ldt_fecha_pergola		= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_pergola')
	ll_hora_pergola_fin	= ll_hora_pergola + 1
	ll_min_pergola_fin		= ll_min_pergola + 30
	if ll_min_pergola_fin >= 60 then
		ll_min_pergola_fin	= 0
		ll_hora_pergola_fin= ll_hora_pergola_fin + 1
	end if
	ll_hora_cine_setear			= ll_hora_pergola
	ll_min_cine_setear				= ll_min_pergola - 30
	if ll_min_cine_setear < 0 then
		ll_min_cine_setear 		= 30
		ll_hora_cine_setear		= ll_hora_cine_setear - 1
	end if 
	if not isnull(ldt_fecha_pergola) then
		if date(ldt_fecha_pergola) < date(gdt_fec_sistema) then
			messagebox("Advertencia","Fecha Uso Pergola Inválida, No debe ser menor a la fecha de Hoy")
		elseif ll_hora_pergola > 0 and not isnull(ll_min_pergola) then
			if is_tipo_venta='CV' then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_cineracion',ll_hora_cine_setear)	//ll_hora_pergola)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_cineracion',ll_min_cine_setear)	//ll_min_pergola)
			else
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_ingreso_cinerario',ll_hora_pergola)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',ll_min_pergola)
			end if
		elseif date(ldt_fecha_pergola) = date(gdt_fec_sistema) then
			if ll_hora_pergola < ll_hora_actual then
				messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
			elseif ll_hora_pergola = ll_hora_actual and ll_min_pergola < ll_minuto_actual then
				messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
			end if
			tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		else
			if is_tipo_venta='CV' then
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_cineracion',ldt_fecha_pergola)
			else
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'fecha_ingreso_cinerario',ldt_fecha_pergola)
			end if
			if not isnull(ldt_fecha_pergola) and ll_hora_pergola > 0 and not isnull(ll_min_pergola) then
				SELECT 	COUNT("FC_AGENDA_PERGOLA"."EJECUTIVO")  
				INTO 		:ll_count_pergola 
				FROM 	"FC_AGENDA_PERGOLA" 
				WHERE ( "FC_AGENDA_PERGOLA"."FECHA_CREMACION" = :ldt_fecha_pergola ) AND  
						  ( "FC_AGENDA_PERGOLA"."HORA_CINERACION" >= :ll_hora_pergola ) AND  
						  ( "FC_AGENDA_PERGOLA"."MINUTO_CINERACION" >= :ll_min_pergola ) AND  
						  ( "FC_AGENDA_PERGOLA"."HORA_CINERACION_FIN" <= :ll_hora_pergola_fin ) AND  
						  ( "FC_AGENDA_PERGOLA"."MINUTO_CINERACION_FIN" <= :ll_min_pergola_fin )  AND
						  ( "FC_AGENDA_PERGOLA"."NUMERO" <> :il_numero)
				USING	sqlca;
				if ll_count_capilla > 0 then
					messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
					tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
					tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_pergola',0)
					tab_crematorio.tabpage_8.dw_cenizas.accepttext()
					tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_pergola')
				end if
			end if
			
			
		end if
	end if
elseif ls_columna='hora_retiro_ceniza' or ls_columna='minuto_retiro_ceniza' then
	ll_hora_visual		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_retiro_ceniza')
	ll_min_visual		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_retiro_ceniza')
	ldt_fecha_visual	= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_retiro_ceniza')
	if ll_hora_visual > 0 and not isnull(ll_min_visual) then
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_retiro_ceniza',ll_hora_capilla)
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_retiro_ceniza',ll_min_capilla)
	elseif date(ldt_fecha_visual) = date(gdt_fec_sistema) then
		if ll_hora_visual < ll_hora_actual then
			messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_retiro_ceniza',0)
		elseif ll_hora_visual = ll_hora_actual and ll_min_visual < ll_minuto_actual then
			messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_retiro_ceniza',0)
		end if
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	end if
end if
tab_crematorio.tabpage_8.dw_cenizas.accepttext()
tab_crematorio.tabpage_1.dw_ficha.accepttext()
end event

event itemfocuschanged;datetime	ldt_fecha_retiro,ldt_fecha_crea,ldt_fecha_def,ldt_nulo,ldt_fecha_capilla,ldt_fecha_pergola,ldt_fecha_visual
String		ls_uso_capilla,ls_uso_pergola,ls_auto_admin,ls_hora
Long		ll_hora_capilla,ll_min_capilla,ll_hora_actual,ll_minuto_actual,ll_hora_pergola,ll_min_pergola,ll_hora_visual,ll_min_visual,ll_hora_capilla_fin,ll_min_capilla_fin,ll_hora_cine_setear,&
			ll_min_cine_setear,ll_count_capilla,ll_hora_pergola_fin,ll_min_pergola_fin,ll_count_pergola

Setnull(ldt_nulo)
This.accepttext()
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
ls_hora							= string(gdt_fec_sistema,"hh:mm")
ll_hora_actual					= long(mid(ls_hora,1,2))
ll_minuto_actual				= long(mid(ls_hora,4,2))
ldt_fecha_retiro				= this.getitemdatetime(1,'fecha_retiro_ceniza')
if not isnull(ldt_fecha_retiro) then
	ldt_fecha_crea				= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_crea')
	ldt_fecha_def				= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
	if not isnull(ldt_fecha_crea) and not isnull(ldt_fecha_retiro) and ldt_fecha_retiro < ldt_fecha_crea then
//		messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha de Solcitud Cremación")
		this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
		this.accepttext()
		This.setcolumn('fecha_retiro_ceniza')
	elseif not isnull(ldt_fecha_crea) and not isnull(ldt_fecha_retiro) and ldt_fecha_retiro < ldt_fecha_def then
//		messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha Defunción")
		this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
		this.accepttext()
		This.setcolumn('fecha_retiro_ceniza')
	end if
end if
ls_uso_capilla				= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
ls_uso_pergola				= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
ls_auto_admin				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
//	if ls_auto_admin='N' then
//		messagebox("Advertencia","Debe Estar Autorizado por Administrador")
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
//		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
//	else
	if ls_uso_capilla='S' and ls_uso_pergola='S' then
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	elseif ls_uso_capilla='N' then
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_capilla',ldt_nulo)
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
	elseif ls_uso_capilla='S' then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque','N')
	end if
//	end if
tab_crematorio.tabpage_8.dw_cenizas.accepttext()
//elseif ls_columna='uso_pergola' then
ls_uso_pergola				= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
ls_uso_capilla				= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
ls_auto_admin				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
//	if ls_auto_admin='N' then
//		messagebox("Advertencia","Debe Estar Autorizado por Administrador")
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_pergola','N')
//		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
//	else
	if ls_uso_capilla='S' and ls_uso_pergola='S' then
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'uso_capilla','N')
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	elseif ls_uso_pergola='N' then
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'fecha_uso_pergola',ldt_nulo)
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
	elseif ls_uso_capilla='S' then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'sw_ingreso_parque','N')
	end if
//	end if
ll_hora_capilla		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_capilla')
ll_min_capilla		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minutos_uso_capilla')
ldt_fecha_capilla	= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla')
if not isnull(ldt_fecha_capilla) then
	if ll_hora_capilla > 0 and not isnull(ll_min_capilla) then
//			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_ingreso_cinerario',ll_hora_capilla)
//			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',ll_min_capilla)
	elseif date(ldt_fecha_capilla) = date(gdt_fec_sistema) then
		if ll_hora_capilla < ll_hora_actual then
//				messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
		elseif ll_hora_capilla = ll_hora_actual and ll_min_capilla < ll_minuto_actual then
//				messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
		end if
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	end if
end if

if not isnull(ldt_fecha_capilla) and ll_hora_capilla>0 and not isnull(ll_min_capilla) then
	ll_hora_capilla_fin				= ll_hora_capilla + 1
	ll_min_capilla_fin				= ll_min_capilla + 30
	if ll_min_capilla_fin >= 60 then
		ll_min_capilla_fin 			= 0
		ll_hora_capilla_fin			= ll_hora_capilla_fin + 1
	end if
	ll_hora_cine_setear			= ll_hora_capilla
	ll_min_cine_setear				= ll_min_capilla - 30
	if ll_min_cine_setear < 0 then
		ll_min_cine_setear 		= 30
		ll_hora_cine_setear		= ll_hora_cine_setear - 1
	end if
	SELECT 	COUNT("FC_AGENDA_CAPILLA"."EJECUTIVO")  
	INTO 		:ll_count_capilla 
	FROM 	"FC_AGENDA_CAPILLA" 
	WHERE ( "FC_AGENDA_CAPILLA"."FECHA_CREMACION" = :ldt_fecha_capilla ) AND  
			  ( "FC_AGENDA_CAPILLA"."HORA_CINERACION" >= :ll_hora_capilla ) AND  
			  ( "FC_AGENDA_CAPILLA"."MINUTO_CINERACION" >= :ll_min_capilla ) AND  
			  ( "FC_AGENDA_CAPILLA"."HORA_CINERACION_FIN" <= :ll_hora_capilla_fin ) AND  
			  ( "FC_AGENDA_CAPILLA"."MINUTO_CINERACION_FIN" <= :ll_min_capilla_fin )  AND
			  ( "FC_AGENDA_CAPILLA"."NUMERO" <> :il_numero)
	USING	sqlca;
	if ll_count_capilla > 0 then
//		messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_capilla',0)
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_capilla',0)
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_capilla')
	end if
end if

ll_hora_pergola		=  tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_pergola')
ll_min_pergola		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_uso_pergola')
ldt_fecha_pergola	= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_pergola')
if not isnull(ldt_fecha_pergola) then
	if ll_hora_pergola > 0 and not isnull(ll_min_pergola) then
//			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'hora_ingreso_cinerario',ll_hora_pergola)
//			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',ll_min_pergola)
	elseif date(ldt_fecha_pergola) = date(gdt_fec_sistema) then
		if ll_hora_pergola < ll_hora_actual then
//				messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
		elseif ll_hora_pergola = ll_hora_actual and ll_min_pergola < ll_minuto_actual then
//				messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_uso_pergola',0)
		end if
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	end if
end if
if not isnull(ldt_fecha_pergola) and ll_hora_pergola>0 and not isnull(ll_min_pergola) then
	ll_hora_pergola_fin	= ll_hora_pergola + 1
	ll_min_pergola_fin		= ll_min_pergola + 30
	if ll_min_pergola_fin >= 60 then
		ll_min_pergola_fin	= 0
		ll_hora_pergola_fin= ll_hora_pergola_fin + 1
	end if
	ll_hora_cine_setear			= ll_hora_pergola
	ll_min_cine_setear				= ll_min_pergola - 30
	if ll_min_cine_setear < 0 then
		ll_min_cine_setear 		= 30
		ll_hora_cine_setear		= ll_hora_cine_setear - 1
	end if 
	SELECT 	COUNT("FC_AGENDA_PERGOLA"."EJECUTIVO")  
	INTO 		:ll_count_pergola 
	FROM 	"FC_AGENDA_PERGOLA" 
	WHERE ( "FC_AGENDA_PERGOLA"."FECHA_CREMACION" = :ldt_fecha_pergola ) AND  
			  ( "FC_AGENDA_PERGOLA"."HORA_CINERACION" >= :ll_hora_pergola ) AND  
			  ( "FC_AGENDA_PERGOLA"."MINUTO_CINERACION" >= :ll_min_pergola ) AND  
			  ( "FC_AGENDA_PERGOLA"."HORA_CINERACION_FIN" <= :ll_hora_pergola_fin ) AND  
			  ( "FC_AGENDA_PERGOLA"."MINUTO_CINERACION_FIN" <= :ll_min_pergola_fin )  AND
			  ( "FC_AGENDA_PERGOLA"."NUMERO" <> :il_numero)
	USING	sqlca;
	if ll_count_capilla > 0 then
//		messagebox("Advertencia","No es Posible Utilizar Horario Seleccionado, Ya existe Agendamiento")
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_uso_pergola',0)
		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minutos_uso_pergola',0)
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
		tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_pergola')
	end if
end if

ll_hora_visual		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_retiro_ceniza')
ll_min_visual		= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_retiro_ceniza')
ldt_fecha_visual	= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_retiro_ceniza')
if not isnull(ldt_fecha_visual) then
	if ll_hora_visual > 0 and not isnull(ll_min_visual) then
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_retiro_ceniza',ll_hora_capilla)
//		tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_retiro_ceniza',ll_min_capilla)
	elseif date(ldt_fecha_visual) = date(gdt_fec_sistema) then
		if ll_hora_visual < ll_hora_actual then
//				messagebox("Advertencia","Hora Inválida, No debe ser Menor a Hora Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'hora_retiro_ceniza',0)
		elseif ll_hora_visual = ll_hora_actual and ll_min_visual < ll_minuto_actual then
//				messagebox("Advertencia","Minuto Inválido, No debe ser Menor a Minuto Actual")
			tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'minuto_retiro_ceniza',0)
		end if
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
	end if
end if
tab_crematorio.tabpage_8.dw_cenizas.accepttext()
tab_crematorio.tabpage_1.dw_ficha.accepttext()
end event

event clicked;String		ls_columna,ls_auto_admin,ls_ejecutivo,ls_obs,ls_base,ls_serie,ls_nombre,ls_ap_pat,ls_ap_mat,ls_string,ls_obs_ceremonia,ls_uso_visualiza,&
			ls_uso_capilla,ls_uso_pergola,ls_ag_visual
Long		ll_cod_parque,ll_hora_fijada,ll_minuto_fijada,ll_cod_religion,ll_hora_agenda,ll_minuto_agenda,ll_hora_ini_visual,ll_min_ini_visual,ll_hora_fin_visual,&
			ll_min_fin_visual
datetime	ldt_fecha_cremacion,ldt_fecha_agenda,ldt_fecha_visual
Double	ll_numero
Long		ll_res,ll_res_ag

ls_columna						= dwo.name
this.accepttext()
if il_folio > 0 then
	if ls_columna='p_1' then	//Capilla
//		ll_res_ag					= messagebox("Advertencia","recuerde Antes de Agendar debe Grabar Cambios, desea continuar",Exclamation!,yesNo!,2)
//		if ll_res_ag=1 then
			ls_uso_capilla		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
			if ls_uso_capilla='S' then
				if is_tipo_venta='SV' then 
					messagebox("Advertencia","Agenda Capilla solo Habilitado para Ficha Con Venta")
				else
					if il_grabar > 0 then
						ll_res				= messagebox("Advertencia","En Caso de haber Realizado Cambios, debe Grabar Ficha antes de Agendar... Desea Continuar",Exclamation!,yesNo!,2)
					else
						ll_res				= 1
					end if
					if ll_res=1 then
				//		ls_auto_admin		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
						ls_uso_capilla		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
						if ls_uso_capilla='S' then	//and ls_auto_admin='S'
							this.accepttext()
				//			if ls_auto_admin='S' then
								ll_cod_parque								=  tab_crematorio.tabpage_1.dw_ficha.getitemnumber( 1,'cod_parque_destino')
								
								SELECT 	"FC_HORAS_CREMATORIO"."HORA_INICIO",  	"FC_HORAS_CREMATORIO"."MINUTO_INICIO",  	"FC_HORAS_CREMATORIO"."HORA_FINAL",  	"FC_HORAS_CREMATORIO"."MINUTO_FINAL", 		"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO", 		"FC_HORAS_CREMATORIO"."VECES_USO"  
								INTO		:il_hora_ini,  											:il_min_ini,   												:il_hora_fin,   											:il_min_fin,   												:il_intervalo,   														:il_veces 
								FROM 	"FC_HORAS_CREMATORIO"  
								WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :ll_cod_parque   ;
								ldt_fecha_cremacion						= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_capilla')
								ls_ejecutivo									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'usuario_crea')
								ls_obs										= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
								ll_hora_fijada								= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_capilla')
								ll_minuto_fijada							= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minutos_uso_capilla')
								ls_base										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
								ls_serie										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
								ll_numero									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
								
								ls_uso_visualiza							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
								ls_uso_capilla								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
								ls_uso_pergola								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
								
								if isnull(ll_minuto_fijada) then 
									ll_minuto_fijada						= 0
									tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
									tab_crematorio.tabpage_1.dw_ficha.accepttext()
								end if
								ls_nombre									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres'))
								ls_ap_pat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno'))
								ls_ap_mat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno'))
								ls_obs_ceremonia							= trim(tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion'))
								ll_cod_religion								= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
								if is_tipo_venta='SV' then 
									ls_obs_ceremonia						= 'SIN VENTA'		//'SIN OBSERVACION'
									ll_cod_religion							= 0
								end if
								if isnull(ll_cod_parque) or isnull(ldt_fecha_cremacion) or isnull(ls_ejecutivo) or isnull(ls_obs) or isnull(ls_obs_ceremonia) or isnull(ll_cod_religion) or isnull(ll_hora_fijada) then
					//				if isnull(ldt_fecha_cremacion) then
					//					messagebox("Advertencia","Debe Seleccionar Fecha Agenda Cremación")
					//					tab_crematorio.SelectedTab	= 1
					//					tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
					
									if isnull(ldt_fecha_cremacion) then
										messagebox("Advertencia","Debe Seleccionar Fecha Capilla")
										tab_crematorio.SelectedTab	= 8
										tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_uso_capilla')
									elseif isnull(ll_hora_fijada) then
										messagebox("Advertencia","Debe Ingresar Hora Agenda Capilla")
										tab_crematorio.SelectedTab	= 8
										tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_capilla')
									elseif isnull(ll_minuto_fijada) then
										messagebox("Advertencia","Debe Ingresar Minutos Agenda Capilla")
										tab_crematorio.SelectedTab	= 8
										tab_crematorio.tabpage_8.dw_cenizas.setcolumn('minutos_uso_capilla')
									elseif isnull(ll_cod_parque) then
										messagebox("Advertencia","Debe Seleccionar Parque")
										tab_crematorio.SelectedTab	= 1
										tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
									
									elseif isnull(ls_ejecutivo) then
										messagebox("Advertencia","Debe Seleccionar Ejecutivo")
										tab_crematorio.SelectedTab	= 1
										tab_crematorio.tabpage_1.dw_ficha.setcolumn('usuario_crea')
									elseif isnull(ls_obs) then
										messagebox("Advertencia","Debe Ingresar Observación Fallecido")
										tab_crematorio.SelectedTab	= 2
										tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
									elseif isnull(ls_obs_ceremonia) then
										messagebox("Advertencia","Debe Ingresar Observación Ceremonia")
										tab_crematorio.SelectedTab	= 7
										tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
									elseif isnull(ll_cod_religion) then
										messagebox("Advertencia","Debe Ingresar Religión")
										tab_crematorio.SelectedTab	= 7
										tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
									end if
								else
									if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
										ls_string								= string(ll_cod_parque)+'~t'+string(ldt_fecha_cremacion)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijada)+'~t'+string(il_folio)+'~t'+'C'+'~t'+ls_uso_visualiza+'~t'+ls_uso_capilla+'~t'+ls_uso_pergola
										if isvalid(w_lista_capilla) then close(w_lista_capilla)
										OpenWithParm(w_lista_capilla, ls_string)
									else
										messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
										tab_crematorio.SelectedTab	= 2
									end if
								end if
				//			else
				//				messagebox("Advertencia","Debe Autorizar Administrador AGENDA")
				//			end if
						end if
					end if
				end if
			end if
//		end if
	elseif ls_columna='p_2' then	//Pergola
		ls_uso_pergola		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
		if ls_uso_pergola='S' then
			if is_tipo_venta='SV' then 
				messagebox("Advertencia","Agenda Pergola solo Habilitado para Ficha Con Venta")
			else
				if il_grabar > 0 then
					ll_res				= messagebox("Advertencia","En Caso de haber Realizado Cambios, debe Grabar Ficha antes de Agendar... Desea Continuar",Exclamation!,yesNo!,2)
				else
					ll_res				= 1
				end if
				if ll_res=1 then
			//		ls_auto_admin		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
					ls_uso_pergola		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
					if ls_uso_pergola='S' then
						this.accepttext()
			//			if ls_auto_admin='S' then
							ll_cod_parque								=  tab_crematorio.tabpage_1.dw_ficha.getitemnumber( 1,'cod_parque_destino')
							
							SELECT 	"FC_HORAS_CREMATORIO"."HORA_INICIO",  	"FC_HORAS_CREMATORIO"."MINUTO_INICIO",  	"FC_HORAS_CREMATORIO"."HORA_FINAL",  	"FC_HORAS_CREMATORIO"."MINUTO_FINAL", 		"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO", 		"FC_HORAS_CREMATORIO"."VECES_USO"  
							INTO		:il_hora_ini,  											:il_min_ini,   												:il_hora_fin,   											:il_min_fin,   												:il_intervalo,   														:il_veces 
							FROM 	"FC_HORAS_CREMATORIO"  
							WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :ll_cod_parque   ;
							ldt_fecha_cremacion						= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_uso_pergola')
							ls_ejecutivo									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'usuario_crea')
							ls_obs										= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
							ll_hora_fijada								= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_uso_pergola')
							ll_minuto_fijada							= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_uso_pergola')
							ls_base										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
							ls_serie										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
							ll_numero									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
							
							ls_uso_visualiza							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
							ls_uso_capilla								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
							ls_uso_pergola								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
							
							if isnull(ll_minuto_fijada) then 
								ll_minuto_fijada						= 0
								tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
								tab_crematorio.tabpage_1.dw_ficha.accepttext()
							end if
							ls_nombre									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres'))
							ls_ap_pat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno'))
							ls_ap_mat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno'))
							ls_obs_ceremonia							= trim(tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion'))
							ll_cod_religion								= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
							if is_tipo_venta='SV' then 
								ls_obs_ceremonia						= 'SIN VENTA'		//'SIN OBSERVACION'
								ll_cod_religion							= 0
							end if
							if isnull(ll_cod_parque) or isnull(ldt_fecha_cremacion) or isnull(ls_ejecutivo) or isnull(ls_obs) or isnull(ls_obs_ceremonia) or isnull(ll_cod_religion) or isnull(ll_hora_fijada) then
				//				if isnull(ldt_fecha_cremacion) then
				//					messagebox("Advertencia","Debe Seleccionar Fecha Agenda Cremación")
				//					tab_crematorio.SelectedTab	= 1
				//					tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
				
								if isnull(ldt_fecha_cremacion) then
									messagebox("Advertencia","Debe Seleccionar Fecha Pergola")
									tab_crematorio.SelectedTab	= 8
									tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_uso_pergola')
								elseif isnull(ll_hora_fijada) then
									messagebox("Advertencia","Debe Ingresar Hora Agenda Pergola")
									tab_crematorio.SelectedTab	= 8
									tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_uso_pergola')
								elseif isnull(ll_minuto_fijada) then
									messagebox("Advertencia","Debe Ingresar Minutos Agenda Pergola")
									tab_crematorio.SelectedTab	= 8
									tab_crematorio.tabpage_8.dw_cenizas.setcolumn('minuto_uso_pergola')
								elseif isnull(ll_cod_parque) then
									messagebox("Advertencia","Debe Seleccionar Parque")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
								
								elseif isnull(ls_ejecutivo) then
									messagebox("Advertencia","Debe Seleccionar Ejecutivo")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('usuario_crea')
								elseif isnull(ls_obs) then
									messagebox("Advertencia","Debe Ingresar Observación Fallecido")
									tab_crematorio.SelectedTab	= 2
									tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
								elseif isnull(ls_obs_ceremonia) then
									messagebox("Advertencia","Debe Ingresar Observación Ceremonia")
									tab_crematorio.SelectedTab	= 7
									tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
								elseif isnull(ll_cod_religion) then
									messagebox("Advertencia","Debe Ingresar Religión")
									tab_crematorio.SelectedTab	= 7
									tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
								end if
							else
								if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
									ls_string								= string(ll_cod_parque)+'~t'+string(ldt_fecha_cremacion)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijada)+'~t'+string(il_folio)+'~t'+'C'+'~t'+ls_uso_visualiza+'~t'+ls_uso_capilla+'~t'+ls_uso_pergola
									if isvalid(w_lista_pergola) then close(w_lista_pergola)
									OpenWithParm(w_lista_pergola, ls_string)
								else
									messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
									tab_crematorio.SelectedTab	= 2
								end if
							end if
			//			else
			//				messagebox("Advertencia","Debe Autorizar Administrador AGENDA")
			//			end if
					end if
				end if
			end if
		end if
	elseif ls_columna='p_3' then	//Agenda Visualizacion
		ls_uso_visualiza	= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
		if ls_uso_visualiza='S' then
			if is_tipo_venta='SV' then 
				messagebox("Advertencia","Agenda Sala Visualización solo Habilitado para Ficha con Venta")
			else
				if il_grabar > 0 then
					ll_res				= messagebox("Advertencia","En Caso de haber Realizado Cambios, debe Grabar Ficha antes de Agendar... Desea Continuar",Exclamation!,yesNo!,2)
				else
					ll_res				= 1
				end if
				if ll_res=1 then
					ls_auto_admin		= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
					ls_uso_visualiza	= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
					if ls_uso_visualiza='S' then
						this.accepttext()
						if ls_auto_admin='S' then
							ll_cod_parque								=  tab_crematorio.tabpage_1.dw_ficha.getitemnumber( 1,'cod_parque_destino')
							
							SELECT 	"FC_HORAS_CREMATORIO"."HORA_INICIO",  	"FC_HORAS_CREMATORIO"."MINUTO_INICIO",  	"FC_HORAS_CREMATORIO"."HORA_FINAL",  	"FC_HORAS_CREMATORIO"."MINUTO_FINAL", 		"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO", 		"FC_HORAS_CREMATORIO"."VECES_USO"  
							INTO		:il_hora_ini,  											:il_min_ini,   												:il_hora_fin,   											:il_min_fin,   												:il_intervalo,   														:il_veces 
							FROM 	"FC_HORAS_CREMATORIO"  
							WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :ll_cod_parque   ;
							ldt_fecha_cremacion						= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_ingreso_cinerario')
							ls_ejecutivo									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'usuario_crea')
							ls_obs										= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
							ll_hora_fijada								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'hora_ingreso_cinerario')
							ll_minuto_fijada							= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'minuto_ingreso_cinerario')
							ls_base										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
							ls_serie										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
							ll_numero									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
							
							ls_uso_visualiza							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
							ls_uso_capilla								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
							ls_uso_pergola								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
			
							SELECT	"FC_AGENDA_VISUALIZA"."AGENDA_VISUALIZA", 	"FC_AGENDA_VISUALIZA"."FECHA_VISUALIZA", 	"FC_AGENDA_VISUALIZA"."HORA_INI_VISUALIZA",	"FC_AGENDA_VISUALIZA"."MINUTO_INI_VISUALIZA",	"FC_AGENDA_VISUALIZA"."HORA_FIN_VISUALIZA", 	"FC_AGENDA_VISUALIZA"."MINUTO_FIN_VISUALIZA"  
							INTO 		:ls_ag_visual,   											:ldt_fecha_visual,   										:ll_hora_ini_visual,   											:ll_min_ini_visual,   											:ll_hora_fin_visual,   											:ll_min_fin_visual  
							FROM 	"FC_AGENDA_VISUALIZA"  
							WHERE ( "FC_AGENDA_VISUALIZA"."FOLIO_CREMATORIO" = :il_folio ) AND  
									  ( "FC_AGENDA_VISUALIZA"."ESTADO_REG" <> 'I' )  
							USING	sqlca;
							if sqlca.sqlcode=0 then
								ldt_fecha_cremacion					= ldt_fecha_visual
								ll_hora_fijada							= ll_hora_ini_visual
								ll_minuto_fijada						= ll_min_ini_visual
							else
								//Hora visualizacion
								ll_hora_ini_visual						= ll_hora_fijada
								ll_min_ini_visual						= ll_minuto_fijada
								
								ll_min_fin_visual						= ll_min_ini_visual + 30
								if ll_min_fin_visual >= 60 then
									ll_hora_fin_visual					= ll_hora_ini_visual + 1
									ll_min_fin_visual					= 0
								end if
							end if
			
							if isnull(ll_minuto_fijada) then 
								ll_minuto_fijada						= 0
								tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
								tab_crematorio.tabpage_1.dw_ficha.accepttext()
							end if
							ls_nombre									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres'))
							ls_ap_pat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno'))
							ls_ap_mat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno'))
							ls_obs_ceremonia							= trim(tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion'))
							ll_cod_religion								= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
							if is_tipo_venta='SV' then 
								ls_obs_ceremonia						= 'SIN VENTA'		//'SIN OBSERVACION'
								ll_cod_religion							= 0
							end if
							if isnull(ll_cod_parque) or isnull(ldt_fecha_cremacion) or isnull(ls_ejecutivo) or isnull(ls_obs) or isnull(ls_obs_ceremonia) or isnull(ll_cod_religion) or isnull(ll_hora_fijada) then
				//				if isnull(ldt_fecha_cremacion) then
				//					messagebox("Advertencia","Debe Seleccionar Fecha Agenda Cremación")
				//					tab_crematorio.SelectedTab	= 1
				//					tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
				
								if isnull(ldt_fecha_cremacion) then
									messagebox("Advertencia","Debe Seleccionar Fecha Crematorio")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_ingreso_cinerario')
								elseif isnull(ll_hora_fijada) then
									messagebox("Advertencia","Debe Ingresar Hora Agenda Crematorio")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_ingreso_cinerario')
								elseif isnull(ll_minuto_fijada) then
									messagebox("Advertencia","Debe Ingresar Minutos Agenda Crematorio")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_ingreso_cinerario')
								elseif isnull(ll_cod_parque) then
									messagebox("Advertencia","Debe Seleccionar Parque")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
								
								elseif isnull(ls_ejecutivo) then
									messagebox("Advertencia","Debe Seleccionar Ejecutivo")
									tab_crematorio.SelectedTab	= 1
									tab_crematorio.tabpage_1.dw_ficha.setcolumn('usuario_crea')
								elseif isnull(ls_obs) then
									messagebox("Advertencia","Debe Ingresar Observación Fallecido")
									tab_crematorio.SelectedTab	= 2
									tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
								elseif isnull(ls_obs_ceremonia) then
									messagebox("Advertencia","Debe Ingresar Observación Ceremonia")
									tab_crematorio.SelectedTab	= 7
									tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
								elseif isnull(ll_cod_religion) then
									messagebox("Advertencia","Debe Ingresar Religión")
									tab_crematorio.SelectedTab	= 7
									tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
								end if
							else
								if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
									ls_string								= string(ll_cod_parque)+'~t'+string(ldt_fecha_cremacion)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijada)+'~t'+string(il_folio)+'~t'+'V'+'~t'+ls_uso_visualiza+'~t'+ls_uso_capilla+'~t'+ls_uso_pergola
									if isvalid(w_lista_visualiza) then close(w_lista_visualiza)
									OpenWithParm(w_lista_visualiza, ls_string)
								else
									messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
									tab_crematorio.SelectedTab	= 2
								end if
							end if
						else
							messagebox("Advertencia","Debe Autorizar Administrador AGENDA")
						end if
					end if
				end if
			end if
		end if
	elseif ls_columna='p_4' then	//Agenda Retiro Cenizas
		ls_uso_visualiza	= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
		if ls_uso_visualiza='S' then
			if il_grabar > 0 then
				ll_res				= messagebox("Advertencia","En Caso de haber Realizado Cambios, debe Grabar Ficha antes de Agendar... Desea Continuar",Exclamation!,yesNo!,2)
			else
				ll_res				= 1
			end if
			if ll_res=1 then
				ls_auto_admin				= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'autoriza_admin_agenda')
				ldt_fecha_cremacion		= tab_crematorio.tabpage_8.dw_cenizas.getitemdatetime(1,'fecha_retiro_ceniza')
				if not isnull(ldt_fecha_cremacion) then
					ls_uso_visualiza		= 'S'
				else
					ls_uso_visualiza		= 'N'
				end if
				if ls_uso_visualiza='S' and ls_auto_admin='S' then
					this.accepttext()
					if ls_auto_admin='S' then
						ll_cod_parque								=  tab_crematorio.tabpage_1.dw_ficha.getitemnumber( 1,'cod_parque_destino')
						
						SELECT 	"FC_HORAS_CREMATORIO"."HORA_INICIO",  	"FC_HORAS_CREMATORIO"."MINUTO_INICIO",  	"FC_HORAS_CREMATORIO"."HORA_FINAL",  	"FC_HORAS_CREMATORIO"."MINUTO_FINAL", 		"FC_HORAS_CREMATORIO"."INTERVALO_MINUTO", 		"FC_HORAS_CREMATORIO"."VECES_USO"  
						INTO		:il_hora_ini,  											:il_min_ini,   												:il_hora_fin,   											:il_min_fin,   												:il_intervalo,   														:il_veces 
						FROM 	"FC_HORAS_CREMATORIO"  
						WHERE 	"FC_HORAS_CREMATORIO"."COD_PARQUE" = :ll_cod_parque   ;
						
						ls_ejecutivo									= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'usuario_crea')
						ls_obs										= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'observaciones')
						ll_hora_fijada								= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'hora_retiro_ceniza')
						ll_minuto_fijada							= tab_crematorio.tabpage_8.dw_cenizas.getitemnumber(1,'minuto_retiro_ceniza')
						ls_base										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base')
						ls_serie										= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie')
						ll_numero									= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero')
						
						ls_uso_visualiza							= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'visualizar_servicio')
						ls_uso_capilla								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_capilla')
						ls_uso_pergola								= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'uso_pergola')
		
						SELECT	"FC_AGENDA_VISUALIZA"."AGENDA_VISUALIZA", 	"FC_AGENDA_VISUALIZA"."FECHA_VISUALIZA", 	"FC_AGENDA_VISUALIZA"."HORA_INI_VISUALIZA",	"FC_AGENDA_VISUALIZA"."MINUTO_INI_VISUALIZA",	"FC_AGENDA_VISUALIZA"."HORA_FIN_VISUALIZA", 	"FC_AGENDA_VISUALIZA"."MINUTO_FIN_VISUALIZA"  
						INTO 		:ls_ag_visual,   											:ldt_fecha_visual,   										:ll_hora_ini_visual,   											:ll_min_ini_visual,   											:ll_hora_fin_visual,   											:ll_min_fin_visual  
						FROM 	"FC_AGENDA_VISUALIZA"  
						WHERE ( "FC_AGENDA_VISUALIZA"."FOLIO_CREMATORIO" = :il_folio ) AND  
								  ( "FC_AGENDA_VISUALIZA"."ESTADO_REG" <> 'I' )  
						USING	sqlca;
						if sqlca.sqlcode=0 then
		//					ldt_fecha_cremacion					= ldt_fecha_visual
		//					ll_hora_fijada							= ll_hora_ini_visual
		//					ll_minuto_fijada						= ll_min_ini_visual
						else
							//Hora visualizacion
							ll_hora_ini_visual						= ll_hora_fijada
							ll_min_ini_visual						= ll_minuto_fijada
							
							ll_min_fin_visual						= ll_min_ini_visual + 30
							if ll_min_fin_visual >= 60 then
								ll_hora_fin_visual					= ll_hora_ini_visual + 1
								ll_min_fin_visual					= 0
							end if
						end if
		
						if isnull(ll_minuto_fijada) then 
							ll_minuto_fijada						= 0
							tab_crematorio.tabpage_1.dw_ficha.setitem(1,'minuto_ingreso_cinerario',0)
							tab_crematorio.tabpage_1.dw_ficha.accepttext()
						end if
						ls_nombre									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'nombres'))
						ls_ap_pat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_paterno'))
						ls_ap_mat									= trim(tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'apellido_materno'))
						ls_obs_ceremonia							= trim(tab_crematorio.tabpage_7.dw_ceremonia.getitemstring(1,'observacion'))
						ll_cod_religion								= tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'codigo_religion')
						if is_tipo_venta='SV' then 
							ls_obs_ceremonia						= 'SIN VENTA'		//'SIN OBSERVACION'
							ll_cod_religion							= 0
						end if
						if isnull(ll_cod_parque) or isnull(ldt_fecha_cremacion) or isnull(ls_ejecutivo) or isnull(ls_obs) or isnull(ls_obs_ceremonia) or isnull(ll_cod_religion) or isnull(ll_hora_fijada) then
			//				if isnull(ldt_fecha_cremacion) then
			//					messagebox("Advertencia","Debe Seleccionar Fecha Agenda Cremación")
			//					tab_crematorio.SelectedTab	= 1
			//					tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_cineracion')
			
							if isnull(ldt_fecha_cremacion) then
								messagebox("Advertencia","Debe Seleccionar Fecha Crematorio")
								tab_crematorio.SelectedTab	= 1
								tab_crematorio.tabpage_1.dw_ficha.setcolumn('fecha_ingreso_cinerario')
							elseif isnull(ll_hora_fijada) then
								messagebox("Advertencia","Debe Ingresar Hora Agenda Crematorio")
								tab_crematorio.SelectedTab	= 1
								tab_crematorio.tabpage_1.dw_ficha.setcolumn('hora_ingreso_cinerario')
							elseif isnull(ll_minuto_fijada) then
								messagebox("Advertencia","Debe Ingresar Minutos Agenda Crematorio")
								tab_crematorio.SelectedTab	= 1
								tab_crematorio.tabpage_1.dw_ficha.setcolumn('minuto_ingreso_cinerario')
							elseif isnull(ll_cod_parque) then
								messagebox("Advertencia","Debe Seleccionar Parque")
								tab_crematorio.SelectedTab	= 1
								tab_crematorio.tabpage_1.dw_ficha.setcolumn('cod_parque_destino')
							
							elseif isnull(ls_ejecutivo) then
								messagebox("Advertencia","Debe Seleccionar Ejecutivo")
								tab_crematorio.SelectedTab	= 1
								tab_crematorio.tabpage_1.dw_ficha.setcolumn('usuario_crea')
							elseif isnull(ls_obs) then
								messagebox("Advertencia","Debe Ingresar Observación Fallecido")
								tab_crematorio.SelectedTab	= 2
								tab_crematorio.tabpage_2.dw_fallecido.setcolumn('observaciones')
							elseif isnull(ls_obs_ceremonia) then
								messagebox("Advertencia","Debe Ingresar Observación Ceremonia")
								tab_crematorio.SelectedTab	= 7
								tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
							elseif isnull(ll_cod_religion) then
								messagebox("Advertencia","Debe Ingresar Religión")
								tab_crematorio.SelectedTab	= 7
								tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
							end if
						else
							if not isnull(ls_nombre) and not isnull(ls_ap_pat) and not isnull(ls_ap_mat) then
								ls_string								= string(ll_cod_parque)+'~t'+string(ldt_fecha_cremacion)+'~t'+ls_nombre+'~t'+ls_ap_pat+'~t'+ls_ap_mat+'~t'+ls_obs+'~t'+string(ll_hora_fijada)+'~t'+string(ll_minuto_fijada)+'~t'+string(il_folio)+'~t'+'R'+'~t'+ls_uso_visualiza+'~t'+ls_uso_capilla+'~t'+ls_uso_pergola
								if isvalid(w_lista_visualiza) then close(w_lista_visualiza)
								OpenWithParm(w_lista_visualiza, ls_string)
							else
								messagebox("Advertencia","Debe Ingresar Antecedente Fallecido")
								tab_crematorio.SelectedTab	= 2
							end if
						end if
					else
						messagebox("Advertencia","Debe Autorizar Administrador AGENDA")
					end if
				end if
			end if
		end if
	end if
end if
if il_rut_titular > 0 then
	if ls_columna='t_12' then	// ver agenda capilla
		ls_string								= string(142)+'~t'+string(date(gdt_fec_sistema))+'~t'+''+'~t'+''+'~t'+''+'~t'+''+'~t'+string(0)+'~t'+string(0)+'~t'+string(0)+'~t'+'C'+'~t'+'N'+'~t'+'N'+'~t'+'N'
		if isvalid(w_lista_capilla) then close(w_lista_capilla)
		OpenWithParm(w_lista_capilla, ls_string)

	elseif ls_columna='t_19' then	// ver agenda pergola
		ls_string								= string(142)+'~t'+string(date(gdt_fec_sistema))+'~t'+''+'~t'+''+'~t'+''+'~t'+''+'~t'+string(0)+'~t'+string(0)+'~t'+string(0)+'~t'+'C'+'~t'+'N'+'~t'+'N'+'~t'+'N'
		if isvalid(w_lista_pergola) then close(w_lista_pergola)
		OpenWithParm(w_lista_pergola, ls_string)
		
	elseif ls_columna='visualizar_servicio_t' then
		ls_string								= string(142)+'~t'+string(date(gdt_fec_sistema))+'~t'+''+'~t'+''+'~t'+''+'~t'+''+'~t'+string(0)+'~t'+string(0)+'~t'+string(0)+'~t'+'V'+'~t'+'N'+'~t'+'N'+'~t'+'N'
		if isvalid(w_lista_visualiza) then close(w_lista_visualiza)
		OpenWithParm(w_lista_visualiza, ls_string)
	end if
end if
end event

type cb_cerrar from commandbutton within w_ficha_crematorio_2
integer x = 3058
integer y = 1936
integer width = 224
integer height = 96
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ficha_crematorio)
end event

type gb_1 from groupbox within w_ficha_crematorio_2
integer x = 741
integer y = 12
integer width = 1413
integer height = 196
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_ficha_crematorio_2
integer x = 2203
integer y = 12
integer width = 855
integer height = 196
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

