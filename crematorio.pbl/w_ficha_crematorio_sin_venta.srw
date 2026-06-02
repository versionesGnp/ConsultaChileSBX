forward
global type w_ficha_crematorio_sin_venta from window
end type
type cb_crear_prelacion from commandbutton within w_ficha_crematorio_sin_venta
end type
type dw_print from datawindow within w_ficha_crematorio_sin_venta
end type
type cb_print from commandbutton within w_ficha_crematorio_sin_venta
end type
type sle_1 from uo_convierte_numero within w_ficha_crematorio_sin_venta
end type
type cb_inactivar from commandbutton within w_ficha_crematorio_sin_venta
end type
type cb_nuevo from commandbutton within w_ficha_crematorio_sin_venta
end type
type cb_limpiar from commandbutton within w_ficha_crematorio_sin_venta
end type
type em_folio from editmask within w_ficha_crematorio_sin_venta
end type
type st_1 from statictext within w_ficha_crematorio_sin_venta
end type
type rb_buscar_folio from radiobutton within w_ficha_crematorio_sin_venta
end type
type rb_buscar_ctto from radiobutton within w_ficha_crematorio_sin_venta
end type
type cb_buscar from commandbutton within w_ficha_crematorio_sin_venta
end type
type pb_aceptar from picturebutton within w_ficha_crematorio_sin_venta
end type
type dw_ctto from datawindow within w_ficha_crematorio_sin_venta
end type
type cb_grabar from commandbutton within w_ficha_crematorio_sin_venta
end type
type tab_crematorio from tab within w_ficha_crematorio_sin_venta
end type
type tabpage_1 from userobject within tab_crematorio
end type
type dw_ficha from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_crematorio
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
type dw_cenizas from datawindow within tabpage_8
end type
type tabpage_8 from userobject within tab_crematorio
dw_cenizas dw_cenizas
end type
type tab_crematorio from tab within w_ficha_crematorio_sin_venta
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_6 tabpage_6
tabpage_5 tabpage_5
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type
type cb_cerrar from commandbutton within w_ficha_crematorio_sin_venta
end type
type gb_1 from groupbox within w_ficha_crematorio_sin_venta
end type
type gb_2 from groupbox within w_ficha_crematorio_sin_venta
end type
end forward

global type w_ficha_crematorio_sin_venta from window
integer width = 3378
integer height = 2180
boolean titlebar = true
string title = "Ficha Crematorio (Sin Venta)"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
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
global w_ficha_crematorio_sin_venta w_ficha_crematorio_sin_venta

type variables
Double	il_rut_titular,il_rut_fallecido,il_monto_g
String		is_celular,is_base='G',is_serie='E',is_base_g,is_serie_g,is_moneda_g,is_cod_otro_g
Long		il_sw,il_numero,il_folio,il_row_archivo,il_fila_arc,il_count_arc,il_numero_g,il_cod_parque,il_count_titular
datawindowchild	idw_detalle16
end variables

forward prototypes
public function string wf_valida_largo (long al_largo, string as_columna)
public function string wf_validar_letras (string as_letras, string as_columna)
public function string wf_validar_datos ()
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
			ll_nacionalidad,ll_codigo_religion,ll_sw_orador,ll_codigo_diacono,ll_destino_cuerpo_resp,ll_hora_retiro_resp,ll_minuto_retiro_resp

ll_rut_titular								= Double(tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular'))
ll_rut_fallecido							= Double(tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_fallecido'))
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
ls_estado_contrato_sepultura_fall	= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'estado_contrato_sepultura')
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
elseif isnull(ls_tipo_origen) or ls_tipo_origen='' then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Tipo Origen")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_origen')
	ls_return					= 'N'
elseif isnull(ls_tipo_solicitud_origen) or ls_tipo_solicitud_origen='' then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Tipo Solicitud Origen")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('tipo_solicitud_origen')
	ls_return					= 'N'
elseif isnull(ls_forma_venta) or ls_forma_venta='' then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Forma Venta")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('forma_venta')
	ls_return					= 'N'
elseif isnull(ls_origen_contrato) or ls_origen_contrato='' then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Origen Contrato")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('origen_contrato')
	ls_return					= 'N'
elseif isnull(ll_destino_cuerpo) then
	tab_crematorio.SelectedTab		= 1
	messagebox("Advertencia","Debe Ingresar Destino Cuerpo")
	tab_crematorio.tabpage_1.dw_ficha.setfocus()
	tab_crematorio.tabpage_1.dw_ficha.setcolumn('destino_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_responsable_retiro) or ls_responsable_retiro='' then
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
elseif isnull(ls_dv_fallecido) or ls_dv_fallecido='' then
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
elseif isnull(ldt_fecha_nacimiento_fall) then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_nacimiento')
	ls_return					= 'N'
elseif isnull(ls_sexo_fall) or ls_sexo_fall = '' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Sexo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('sexo')
	ls_return					= 'N'
elseif isnull(ldt_fecha_defuncion_fall) then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Fecha Defunción Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
	ls_return					= 'N'
elseif ldt_fecha_defuncion_fall < ldt_fecha_nacimiento_fall then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Fecha Defunción No puede ser Menor a Fecha Nacimiento")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('fecha_defuncion')
	ls_return					= 'N'
elseif isnull(ll_hora_defuncion_fall) then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Hora Defunción")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('hora_defuncion')
	ls_return					= 'N'
elseif isnull(ll_minuto_defuncion_fall) then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Minutos Defunción")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('minuto_defuncion')
	ls_return					= 'N'
elseif isnull(ls_estado_civil_fall) or ls_estado_civil_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Estado Civil Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('estado_civil')
	ls_return					= 'N'
elseif isnull(ls_estado_cuerpo_fall) or ls_estado_cuerpo_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Estado Cuerpo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('estado_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_tamano_cuerpo_fall) or ls_tamano_cuerpo_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Tamaño Cuerpo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('tamano_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_causa_fallecimiento_fall) or ls_causa_fallecimiento_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Causa Fallecimiento")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('causa_fallecimiento')
	ls_return					= 'N'
elseif isnull(ll_cod_parque_fall) or ll_cod_parque_fall=0 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Parque Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('cod_parque')
	ls_return					= 'N'
elseif isnull(ls_ciudad_fallecimiento) or ls_ciudad_fallecimiento='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Ciudad Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('ciudad_fallecimiento')
	ls_return					= 'N'
elseif isnull(ls_comuna_fallecimiento) or ls_comuna_fallecimiento='' then
	messagebox("Advertencia","Debe Ingresar Comuna Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('comuna_fallecimiento')
	ls_return					= 'N'
elseif isnull(ll_codigo_origen_cuerpo_fall) then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Origen Cuerpo Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('codigo_origen_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_tipo_via_fallecido) or ls_tipo_via_fallecido='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Tipo Via Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('tipo_via_fallecido')
	ls_return					= 'N'
elseif isnull(ls_direccion_fallecido) or ls_direccion_fallecido='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Dirección Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('direccion_fallecido')
	ls_return					= 'N'
elseif isnull(ls_numero_fallecido) or ls_numero_fallecido='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Rut Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('numero_fallecido')
	ls_return					= 'N'
elseif isnull(ls_depto_fallecido) or ls_depto_fallecido='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Depto. Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('depto_fallecido')
	ls_return					= 'N'
elseif isnull(ls_block_fallecido) or ls_block_fallecido='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Block Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('block_fallecido')
	ls_return					= 'N'
elseif isnull(ll_codigo_funeraria_fall) or ll_codigo_funeraria_fall=0 then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Funeraria")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('codigo_funeraria')
	ls_return					= 'N'
elseif isnull(ls_existencia_elementos_fall) or ls_existencia_elementos_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Si tiene Existencia de Elementos Fallecido")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('existencia_elementos')
	ls_return					= 'N'
elseif isnull(ls_estado_contrato_sepultura_fall) or ls_estado_contrato_sepultura_fall='' then
	tab_crematorio.SelectedTab		= 2
	messagebox("Advertencia","Debe Ingresar Estado Contrato")
	tab_crematorio.tabpage_2.dw_fallecido.setfocus()
	tab_crematorio.tabpage_2.dw_fallecido.setcolumn('estado_contrato_sepultura')
	ls_return					= 'N'
elseif isnull(ls_observaciones_fall) or ls_observaciones_fall='' then
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
elseif isnull(ls_nombre_tit) or ls_nombre_tit='' then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Nombre Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('nombres')
	ls_return					= 'N'
elseif isnull(ls_ap_pat_tit) or ls_ap_pat_tit='' then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_paterno')
	ls_return					= 'N'
elseif isnull(ls_ap_mat_tit) or ls_ap_mat_tit='' then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Apellido Materno Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('apellido_materno')
	ls_return					= 'N'
elseif isnull(ls_celular_tit) or ls_celular_tit='' then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Celular Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('celular')
	ls_return					= 'N'
elseif isnull(ls_email_tit) or ls_email_tit='' then
	tab_crematorio.SelectedTab		= 3
	messagebox("Advertencia","Debe Ingresar Correo Electrónico Titular")
	tab_crematorio.tabpage_3.dw_titular.setfocus()
	tab_crematorio.tabpage_3.dw_titular.setcolumn('email')
	ls_return					= 'N'

//Aranceles
elseif isnull(ls_tipo_cob_ara) or ls_tipo_cob_ara='' then
	tab_crematorio.SelectedTab		= 5
	messagebox("Advertencia","Debe Ingresar Tipo Cobro Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('tipo_cob')
	ls_return					= 'N'
elseif isnull(ll_folio_ara) or ll_folio_ara=0 then
	tab_crematorio.SelectedTab		= 5
	messagebox("Advertencia","Debe Ingresar Folio Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('folio_pago')
	ls_return					= 'N'
//elseif isnull(ls_tipo_mov_ara) or ls_tipo_mov_ara='' then
//	tab_crematorio.SelectedTab		= 5
//	messagebox("Advertencia","Debe Ingresar Tipo Movimiento Pago Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('tipo_mov')
//	ls_return					= 'N'
elseif isnull(ll_monto_paga_ara) or ll_monto_paga_ara=0 then
	tab_crematorio.SelectedTab		= 5
	messagebox("Advertencia","Debe Ingresar Monto Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('monto_pago')
	ls_return					= 'N'
//elseif isnull(ls_tipo_moneda_ara) or ls_tipo_moneda_ara='' then
//	tab_crematorio.SelectedTab		= 5
//	messagebox("Advertencia","Debe Ingresar Moneda Pago Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('tipo_moneda')
//	ls_return					= 'N'
//elseif isnull(ll_monto_ctto_ara) or ll_monto_ctto_ara=0 then
//	tab_crematorio.SelectedTab		= 5
//	messagebox("Advertencia","Debe Ingresar Monto Contrato Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('monto_contrato')
//	ls_return					= 'N'
elseif isnull(ldt_fecha_pago_ara)  then
	tab_crematorio.SelectedTab		= 5
	messagebox("Advertencia","Debe Ingresar Fecha Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('fecha_pago')
	ls_return					= 'N'
//elseif isnull(ls_codigo_otro_ara) or ls_codigo_otro_ara='' then
//	tab_crematorio.SelectedTab		= 5
//	messagebox("Advertencia","Debe Ingresar Codigo Otro Pago Servicio")
//	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
//	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('codigo_otro')
//	ls_return					= 'N'
elseif isnull(ls_caja_ara) or ls_caja_ara='' then
	tab_crematorio.SelectedTab		= 5
	messagebox("Advertencia","Debe Ingresar Caja Pago Servicio")
	tab_crematorio.tabpage_5.dw_aranceles.setfocus()
	tab_crematorio.tabpage_5.dw_aranceles.setcolumn('cod_caja')
	ls_return					= 'N'
	
//Prelación
elseif tab_crematorio.tabpage_4.dw_prelacion.rowcount() > 0 then
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
elseif tab_crematorio.tabpage_6.dw_archivos.rowcount() > 0 then
	for ll_indi=1 to ll_tot_reg
		ls_categoria		= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'categoria')
		ll_codigo			= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(ll_indi,'codigo_documento')
		ll_rut_archivo	= tab_crematorio.tabpage_6.dw_archivos.getitemnumber(ll_indi,'rut_tercero')
		ls_url				= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'url')
		ls_estado		= tab_crematorio.tabpage_6.dw_archivos.getitemstring(ll_indi,'estado_carga')
		ls_return			= 'S'
		if isnull(ls_categoria) then
			tab_crematorio.SelectedTab		= 6
			messagebox("Advertencia","Debe Ingresar Categoria en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('categoria')
			ls_return					= 'N'
			exit
		elseif isnull(ll_codigo) then
			tab_crematorio.SelectedTab		= 6
			messagebox("Advertencia","Debe Ingresar Codigo Documento en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('codigo_documento')
			ls_return					= 'N'
			exit
		elseif isnull(ll_rut_archivo) then
			tab_crematorio.SelectedTab		= 6
			messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('rut_tercero')
			ls_return					= 'N'
			exit
		elseif isnull(ls_url) then
			tab_crematorio.SelectedTab		= 6
			messagebox("Advertencia","Debe Realizar Carga Archivo en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			tab_crematorio.tabpage_6.dw_archivos.setcolumn('url')
			ls_return					= 'N'
			exit
		elseif isnull(ls_estado) or ls_estado <> 'S' then
			tab_crematorio.SelectedTab		= 6
			messagebox("Advertencia","No esta Correctamente Cargado Archivo en Fila "+string(ll_indi))
			tab_crematorio.tabpage_6.dw_archivos.scrolltorow(ll_indi)
			ls_return					= 'N'
			exit
		end if
	next
//////Ceremonia
elseif isnull(ll_codigo_religion) or ll_codigo_religion=0 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Religion Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_religion')
	ls_return					= 'N'
elseif isnull(ll_sw_orador) then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Estado Orador Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('sw_orador')
	ls_return					= 'N'
elseif (isnull(ll_codigo_diacono) or ll_codigo_diacono=0) and ll_sw_orador=1 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Diacono Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_diacono')
	ls_return					= 'N'
elseif (isnull(ls_codigo_maestro) or ls_codigo_maestro='') and ll_sw_orador=2 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Maestro Condolencia Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('codigo_maestro')
	ls_return					= 'N'
elseif (isnull(ls_obs_ceremonia) or ls_obs_ceremonia='') and ll_sw_orador=2 then
	tab_crematorio.SelectedTab		= 7
	messagebox("Advertencia","Debe Ingresar Otros Ceremonia")
	tab_crematorio.tabpage_7.dw_ceremonia.setfocus()
	tab_crematorio.tabpage_7.dw_ceremonia.setcolumn('observacion')
	ls_return					= 'N'
	
//////Cenizas
elseif isnull(ll_destino_cuerpo_resp) or ll_destino_cuerpo_resp=0 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Destino Cuerpo Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('destino_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_responsable_retiro_resp) then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar responsable Retiro Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('destino_cuerpo')
	ls_return					= 'N'
elseif isnull(ls_visualizar_servicio) or ls_visualizar_servicio='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Visualizar Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('visualizar_servicio')
	ls_return					= 'N'
elseif isnull(ll_rut_responsable) or ll_rut_responsable=0 then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Rut Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('rut_responsable')
	ls_return					= 'N'
elseif isnull(ls_dv_responsable) or ls_dv_responsable='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Digito Verificador Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('dv_responsable')
	ls_return					= 'N'
elseif isnull(ls_nombre_resp) or ls_nombre_resp='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Nombre Responsable Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('nombre')
	ls_return					= 'N'
elseif isnull(ls_ap_pat_resp) or ls_ap_pat_resp='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Apellido Paterno Responsable Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('apellido_paterno')
	ls_return					= 'N'
elseif isnull(ls_ap_mat_resp) or ls_ap_mat_resp='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Apellido Materno Responsable Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('apellido_materno')
	ls_return					= 'N'
elseif isnull(ls_fono1_resp) or ls_fono1_resp='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Telefono 1 Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fono_1')
	ls_return					= 'N'
elseif isnull(ls_fono2_resp) or ls_fono2_resp='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Telefono 2 Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fono_2')
	ls_return					= 'N'
elseif isnull(ls_participa_resp) or ls_participa_resp='' then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Participa Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('sw_participa_cremacion')
	ls_return					= 'N'
elseif isnull(ldt_fecha_retiro_resp) then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Fecha Retito Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('fecha_retiro_ceniza')
	ls_return					= 'N'
elseif not isnull(ldt_fecha_retiro_resp) and isnull(ll_hora_retiro_resp) then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Hora Retito Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('hora_retiro_ceniza')
	ls_return					= 'N'
elseif not isnull(ldt_fecha_retiro_resp) and not isnull(ll_hora_retiro_resp) and isnull(ll_minuto_retiro_resp) then
	tab_crematorio.SelectedTab		= 8
	messagebox("Advertencia","Debe Ingresar Minuto Retito Destino Cenizas")
	tab_crematorio.tabpage_8.dw_cenizas.setfocus()
	tab_crematorio.tabpage_8.dw_cenizas.setcolumn('minuto_retiro_ceniza')
	ls_return					= 'N'
end if 

Return ls_return
end function

on w_ficha_crematorio_sin_venta.create
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
this.Control[]={this.cb_crear_prelacion,&
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

on w_ficha_crematorio_sin_venta.destroy
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

event open;gf_centrar(w_ficha_crematorio_sin_venta)
dw_ctto.settransobject(sqlca)
dw_ctto.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(is_base)
dw_ctto.insertrow(0)

tab_crematorio.tabpage_1.dw_ficha.settransobject(sqlca)
tab_crematorio.tabpage_2.dw_fallecido.settransobject(sqlca)
tab_crematorio.tabpage_3.dw_titular.settransobject(sqlca)
tab_crematorio.tabpage_4.dw_prelacion.settransobject(sqlca)
tab_crematorio.tabpage_5.dw_aranceles.settransobject(sqlca)
tab_crematorio.tabpage_6.dw_archivos.settransobject(sqlca)
tab_crematorio.tabpage_7.dw_ceremonia.settransobject(sqlca)
tab_crematorio.tabpage_8.dw_cenizas.settransobject(sqlca)

tab_crematorio.tabpage_1.dw_ficha.getchild('tipo_solicitud_origen',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.retrieve('SV')=0 then
	idw_detalle2.insertrow(0)
end if

tab_crematorio.tabpage_1.dw_ficha.getchild('forma_venta',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve('SV')=0 then
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
if idw_detalle15.retrieve('PR')=0 then idw_detalle15.insertrow(0)

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
rb_buscar_ctto.triggerevent(clicked!)
end event

type cb_crear_prelacion from commandbutton within w_ficha_crematorio_sin_venta
boolean visible = false
integer x = 2350
integer y = 1936
integer width = 421
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Crear Prelacion"
end type

event clicked;Double		ll_rut_titular,ll_rut_fallecido,ll_numero,ll_folio,ll_rut_pre
String			ls_categoria, ls_obligatorio, ls_si_aplica,ls_base,ls_serie,ls_estado_reg
Long			ll_tipo_doc,ll_new,ll_count_pre,ll_indi,ll_count_doc_g,ll_count_doc,ll_fila

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
				"FC_DOCUMENTOS_DETALLE"."ESTADO_FICHA" = 'G';
	if ll_count_doc_g > 0 then
		messagebox("Advertencia","No es Posible Modificar Lista, existe(n) Registro(s) Gestionado(s)")
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
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_reg','A')
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_ficha',ls_estado_reg)
						tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'autoriza_seremi','N')
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
					messagebox("Advertencia","Ya Existe Rut "+string(ll_rut_pre) + " En Lista de Documentos")
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
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_reg','A')
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'estado_ficha',ls_estado_reg)
									tab_crematorio.tabpage_6.dw_archivos.setitem(ll_new,'autoriza_seremi','N')
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
end event

type dw_print from datawindow within w_ficha_crematorio_sin_venta
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

type cb_print from commandbutton within w_ficha_crematorio_sin_venta
integer x = 1399
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

type sle_1 from uo_convierte_numero within w_ficha_crematorio_sin_venta
boolean visible = false
integer x = 1719
integer y = 2112
integer width = 494
integer taborder = 0
boolean hideselection = false
end type

type cb_inactivar from commandbutton within w_ficha_crematorio_sin_venta
integer x = 1061
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 110
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

type cb_nuevo from commandbutton within w_ficha_crematorio_sin_venta
integer x = 46
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new_ficha,ll_new_fallecido,ll_new_titular,ll_new_aranceles,ll_new_ceremonia,ll_new_cenizas

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
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_reg','P')
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'fecha_crea',gdt_fec_sistema)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'estado_gestion',0)
tab_crematorio.tabpage_1.dw_ficha.setitem(ll_new_ficha,'tipo_origen','SV')
idw_detalle2.retrieve('SV')
idw_detalle3.retrieve('SV')
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
ll_new_titular				= tab_crematorio.tabpage_3.dw_titular.insertrow(0)
tab_crematorio.tabpage_3.dw_titular.setitem(ll_new_titular,'nuevo','S')
tab_crematorio.tabpage_3.dw_titular.setitem(ll_new_titular,'estado_reg','P')
tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
ll_new_aranceles			= tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
tab_crematorio.tabpage_5.dw_aranceles.setitem(ll_new_aranceles,'nuevo','S')
tab_crematorio.tabpage_5.dw_aranceles.setitem(ll_new_aranceles,'estado_reg','P')

ll_new_ceremonia			= tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'nuevo','S')
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'estado_reg','P')
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'sw_orador',1)
tab_crematorio.tabpage_7.dw_ceremonia.setitem(ll_new_ceremonia,'sw1',1)

ll_new_cenizas				= tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'nuevo','S')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'estado_reg','P')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'visualizar_servicio','N')
tab_crematorio.tabpage_8.dw_cenizas.setitem(ll_new_cenizas,'sw_participa_cremacion',1)

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
end event

type cb_limpiar from commandbutton within w_ficha_crematorio_sin_venta
integer x = 1906
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 120
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
idw_detalle.retrieve(is_base)
idw_detalle2.retrieve('SV')
idw_detalle3.retrieve('SV')
idw_detalle4.insertrow(0)
idw_detalle12.insertrow(0)
idw_detalle13.insertrow(0)
idw_detalle14.insertrow(0)
idw_detalle15.retrieve('PR')
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
end event

type em_folio from editmask within w_ficha_crematorio_sin_venta
integer x = 1787
integer y = 88
integer width = 512
integer height = 80
integer taborder = 40
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
	pb_aceptar.triggerevent(clicked!)
//	tab_crematorio.tabpage_1.dw_ficha.reset()
//	tab_crematorio.tabpage_2.dw_fallecido.reset()
//	tab_crematorio.tabpage_3.dw_titular.reset()
//	tab_crematorio.tabpage_4.dw_prelacion.reset()
//	tab_crematorio.tabpage_5.dw_aranceles.reset()
//	tab_crematorio.tabpage_6.dw_archivos.reset()
//	tab_crematorio.tabpage_7.dw_ceremonia.reset()
//	tab_crematorio.tabpage_8.dw_cenizas.reset()
//	idw_detalle.retrieve(is_base)
//	idw_detalle2.retrieve('SV')
//	idw_detalle3.retrieve('SV')
//	idw_detalle4.insertrow(0)
//	idw_detalle12.insertrow(0)
//	idw_detalle13.insertrow(0)
//	idw_detalle14.insertrow(0)
//	idw_detalle15.retrieve('PR')
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

type st_1 from statictext within w_ficha_crematorio_sin_venta
integer x = 1545
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

type rb_buscar_folio from radiobutton within w_ficha_crematorio_sin_venta
integer x = 1527
integer y = 8
integer width = 475
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
string text = "Buscar Folio Ficha"
end type

event clicked;Long		ll_new
dw_ctto.reset()
idw_detalle.retrieve(is_base)
ll_new				= dw_ctto.insertrow(0)
dw_ctto.enabled	= false
em_folio.text		= ''
em_folio.enabled	= true
cb_limpiar.triggerevent(clicked!)
em_folio.setfocus()
end event

type rb_buscar_ctto from radiobutton within w_ficha_crematorio_sin_venta
integer x = 64
integer y = 8
integer width = 521
integer height = 72
integer taborder = 10
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
dw_ctto.setfocus()
end event

type cb_buscar from commandbutton within w_ficha_crematorio_sin_venta
integer x = 722
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 90
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

type pb_aceptar from picturebutton within w_ficha_crematorio_sin_venta
integer x = 2382
integer y = 40
integer width = 169
integer height = 152
integer taborder = 50
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

event clicked;Long		ll_folio, ll_numero,ll_count_fc
String		ls_base,ls_serie

if rb_buscar_folio.checked=true then
	ll_folio				= Long(em_folio.text)
	il_folio				= ll_folio
	SELECT 	COUNT("FC_CABECERA"."BASE")  
	INTO 		:ll_count_fc  
	FROM 	"FC_CABECERA"  
	WHERE 	"FC_CABECERA"."FOLIO_CREMATORIO" = :ll_folio   ;
	if ll_count_fc > 0 then
		idw_detalle15.retrieve('PR')
		if tab_crematorio.tabpage_1.dw_ficha.retrieve(ll_folio)=0 then
			idw_detalle2.retrieve('SV')
			idw_detalle3.retrieve('SV')
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
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'nuevo','N')
			tab_crematorio.tabpage_1.dw_ficha.enabled		= true
			tab_crematorio.tabpage_2.dw_fallecido.enabled	= true
			tab_crematorio.tabpage_3.dw_titular.enabled		= true
			tab_crematorio.tabpage_4.dw_prelacion.enabled	= true
			tab_crematorio.tabpage_5.dw_aranceles.enabled	= true
			tab_crematorio.tabpage_6.dw_archivos.enabled	= true
			tab_crematorio.tabpage_7.dw_ceremonia.enabled= true
			tab_crematorio.tabpage_8.dw_cenizas.enabled	= true
		end if
		
//tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
//idw_detalle12.settransobject(sqlca)
//idw_detalle12.insertrow(0)
//
//tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
//idw_detalle13.settransobject(sqlca)
//idw_detalle13.insertrow(0)
		
		idw_detalle12.retrieve('150')
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
		idw_detalle13.retrieve('150')
		idw_detalle15.retrieve('PR')
		idw_detalle16.retrieve(ll_folio)
		if tab_crematorio.tabpage_4.dw_prelacion.retrieve(ll_folio)=0 then tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
		if tab_crematorio.tabpage_5.dw_aranceles.retrieve(ll_folio)=0 then 
			tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
		else
			tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'nuevo','N')
		end if
		if tab_crematorio.tabpage_6.dw_archivos.retrieve(ll_folio)=0 then tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
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
	SELECT 	"FC_CABECERA"."FOLIO_CREMATORIO"  
	INTO 		:ll_folio  
	FROM 	"FC_CABECERA"  
	WHERE ( "FC_CABECERA"."BASE" = :is_base ) AND  
			  ( "FC_CABECERA"."SERIE" = :is_serie ) AND  
			  ( "FC_CABECERA"."NUMERO" = :il_numero )  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if ll_folio >  0 then
			il_folio				= ll_folio
			idw_detalle15.retrieve('PR')
			if tab_crematorio.tabpage_1.dw_ficha.retrieve(ll_folio)=0 then
				idw_detalle2.retrieve('SV')
				idw_detalle3.retrieve('SV')
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
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'nuevo','N')
				tab_crematorio.tabpage_1.dw_ficha.enabled		= true
				tab_crematorio.tabpage_2.dw_fallecido.enabled	= true
				tab_crematorio.tabpage_3.dw_titular.enabled		= true
				tab_crematorio.tabpage_4.dw_prelacion.enabled	= true
				tab_crematorio.tabpage_5.dw_aranceles.enabled	= true
				tab_crematorio.tabpage_6.dw_archivos.enabled	= true
				tab_crematorio.tabpage_7.dw_ceremonia.enabled= true
				tab_crematorio.tabpage_8.dw_cenizas.enabled	= true
			end if
			
	//tab_crematorio.tabpage_2.dw_fallecido.getchild('comuna_fallecimiento',idw_detalle12)
	//idw_detalle12.settransobject(sqlca)
	//idw_detalle12.insertrow(0)
	//
	//tab_crematorio.tabpage_4.dw_prelacion.getchild('comuna',idw_detalle13)
	//idw_detalle13.settransobject(sqlca)
	//idw_detalle13.insertrow(0)
			
			idw_detalle12.retrieve('150')
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
			idw_detalle13.retrieve('150')
			idw_detalle15.retrieve('PR')
			idw_detalle16.retrieve(ll_folio)
			if tab_crematorio.tabpage_4.dw_prelacion.retrieve(ll_folio)=0 then tab_crematorio.tabpage_4.dw_prelacion.insertrow(0)
			if tab_crematorio.tabpage_5.dw_aranceles.retrieve(ll_folio)=0 then 
				tab_crematorio.tabpage_5.dw_aranceles.insertrow(0)
			else
				tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'nuevo','N')
			end if
			if tab_crematorio.tabpage_6.dw_archivos.retrieve(ll_folio)=0 then tab_crematorio.tabpage_6.dw_archivos.insertrow(0)
			if tab_crematorio.tabpage_7.dw_ceremonia.retrieve(ll_folio)=0 then 
				tab_crematorio.tabpage_7.dw_ceremonia.insertrow(0)
				tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw_orador', 1)
				tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw1', 1)
			else
				tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'nuevo','N')
				tab_crematorio.tabpage_7.dw_ceremonia.setitem(1,'sw1', tab_crematorio.tabpage_7.dw_ceremonia.getitemnumber(1,'sw_orador'))
			end if
			if tab_crematorio.tabpage_8.dw_cenizas.retrieve(ll_folio)=0 then 
				tab_crematorio.tabpage_8.dw_cenizas.insertrow(0)
			else
				tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'nuevo','N')
			end if
		else
			messagebox("Advertencia","No Existe Ficha Contrato N° "+string(ll_numero,'###,###,###,##0'))
		end if
	else
		messagebox("Advertencia","No Existe Ficha Contrato N° "+string(ll_numero,'###,###,###,##0'))
		cb_limpiar.triggerevent(clicked!)
	end if
	dw_ctto.setfocus()
end if
tab_crematorio.tabpage_1.dw_ficha.accepttext()
tab_crematorio.tabpage_2.dw_fallecido.accepttext()
tab_crematorio.tabpage_3.dw_titular.accepttext()
tab_crematorio.tabpage_4.dw_prelacion.accepttext()
tab_crematorio.tabpage_5.dw_aranceles.accepttext()
tab_crematorio.tabpage_6.dw_archivos.accepttext()
tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
tab_crematorio.tabpage_8.dw_cenizas.accepttext()
end event

type dw_ctto from datawindow within w_ficha_crematorio_sin_venta
integer x = 69
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
Long		ll_numero

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
if not isnull(ls_base) and not isnull(ls_serie) and ll_numero> 0 then pb_aceptar.triggerevent(clicked!)

end event

type cb_grabar from commandbutton within w_ficha_crematorio_sin_venta
integer x = 384
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_sw_ficha,ll_sw_fallecido,ll_sw_titular,ll_sw_prelacion,ll_sw_arancel,ll_sw_archivo,ll_tot_reg,ll_indi,ll_res_limpiar,ll_folio_fc,ll_sw_ceremonia,&
			ll_sw_cenizas,ll_cod_servicio,ll_return,ll_numero_ori,ll_count
Double	ll_max_folio,ll_max_contrato,ll_monto_uf
String		ls_valido,ls_estado_reg,ls_estado_reg_fall,ls_moneda,ls_cod_otro,ls_base_ori,ls_serie_ori
date		ldt_fecha_pago

ll_sw_ficha=0;ll_sw_fallecido=0;ll_sw_titular=0;ll_sw_prelacion=0;ll_sw_arancel=0;ll_sw_archivo=0;ll_sw_ceremonia=0;ll_sw_cenizas=0
ls_valido			= wf_validar_datos()
ll_folio_fc		= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
if isnull(ll_folio_fc) then ll_folio_fc=0
if ls_valido = 'S' and ll_folio_fc = 0 then
	SELECT 	MAX("FC_CABECERA"."FOLIO_CREMATORIO" ) 
	INTO 		:ll_max_folio  
	FROM 	"FC_CABECERA"  ;
	if isnull(ll_max_folio) then ll_max_folio=0
	ll_max_folio ++
	if not isnull(is_base_g) and not isnull(is_serie_g) and not isnull(il_numero_g) then
		is_base				= is_base_g
		is_serie				= is_serie_g
		ll_max_contrato	= il_numero_g
		ldt_fecha_pago		= date(tab_crematorio.tabpage_5.dw_aranceles.getitemdatetime(1,'fecha_pago'))
		ls_moneda			= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'tipo_moneda')
		ll_monto_uf			= tab_crematorio.tabpage_5.dw_aranceles.getitemnumber(1,'monto_contrato')
		ls_cod_otro			= tab_crematorio.tabpage_5.dw_aranceles.getitemstring(1,'codigo_otro')

		ls_base_ori			= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'base_origen')
		ls_serie_ori			= tab_crematorio.tabpage_1.dw_ficha.getitemstring(1,'serie_origen')
		ll_numero_ori		= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero_origen')
		//il_cod_parque
		SELECT 	"PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO"  
		INTO 		:ll_cod_servicio  
		FROM 	"PRODUCTO_TIPO_SERVICIO"  
//		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = :il_cod_parque ) AND  
		WHERE 	( "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" = 142 ) AND  
					( "PRODUCTO_TIPO_SERVICIO"."CODIGO_OTRO" = :ls_cod_otro )  
		USING	sqlca;
		
		SELECT 	Count("CADENA"."CODIGO")  
		INTO 		:ll_count  
		FROM 	"CADENA"  
		WHERE 	( "CADENA"."CODIGO" = :is_base_g ) AND  
					( "CADENA"."SERIE" = :is_serie_g ) AND  
					( "CADENA"."NUMERO" = :il_numero_g )   ;

		SELECT sysdate INTO :gdt_fec_sistema FROM dual;
		if ll_count = 0 then
			DECLARE sp_crear_cineracion PROCEDURE FOR F_CREA_CTTO_NUEVOS (:is_base, :is_serie, :ll_max_contrato, :il_rut_titular, :ll_monto_uf, 1, :ls_moneda, :ldt_fecha_pago, :ldt_fecha_pago, 0.0001, 1, :ll_cod_servicio, :il_cod_parque, :gs_user, :ls_base_ori, :ls_serie_ori, :ll_numero_ori, :gdt_fec_sistema );
			EXECUTE sp_crear_cineracion;
			if sqlca.sqlcode=0 then
				fetch sp_crear_cineracion into :ll_return;
				close sp_crear_cineracion;						
			end if
		end if
		//ORIGINAL
		//F_CREA_CTTO_NUEVOS (as_base VARCHAR2, as_serie VARCHAR2, adb_numero NUMBER, al_rut NUMBER, adb_precio NUMBER, al_plazo NUMBER,  as_moneda VARCHAR2, adt_fec_prim DATE, adt_fec_ult DATE, adb_tasa NUMBER, al_cap NUMBER, al_cod_servicio NUMBER, al_cod_parque NUMBER, as_user VARCHAR2)
	else
		SELECT 	MAX("FC_CABECERA"."NUMERO" ) 
		INTO 		:ll_max_contrato  
		FROM 	"FC_CABECERA"  ;
		if isnull(ll_max_contrato) then ll_max_contrato=0
		ll_max_contrato ++
	end if
	
	if ll_max_contrato > 0 and il_rut_titular > 0  then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'folio_crematorio',ll_max_folio)
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'base',is_base)
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'serie',is_serie)
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'numero',ll_max_contrato)
		
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
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'folio_crematorio',ll_max_folio)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'base',is_base)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'serie',is_serie)
				tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'numero',ll_max_contrato)
				ls_estado_reg	= tab_crematorio.tabpage_4.dw_prelacion.getitemstring(ll_indi,'estado_reg')
				if isnull(ls_estado_reg) then tab_crematorio.tabpage_4.dw_prelacion.setitem(ll_indi,'estado_reg','A')
			next
		end if
		tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'folio_crematorio',ll_max_folio)
		tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'base',is_base)
		tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'serie',is_serie)
		tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'numero',ll_max_contrato)
		tab_crematorio.tabpage_5.dw_aranceles.setitem(1,'rut_titular',il_rut_titular)
		ll_tot_reg		= tab_crematorio.tabpage_6.dw_archivos.rowcount()
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'folio_crematorio',ll_max_folio)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'base',is_base)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'serie',is_serie)
				tab_crematorio.tabpage_6.dw_archivos.setitem(ll_indi,'numero',ll_max_contrato)
			next
		end if
		
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
		ls_estado_reg_fall		= tab_crematorio.tabpage_8.dw_cenizas.getitemstring(1,'estado_reg')
		if isnull(ls_estado_reg_fall) then tab_crematorio.tabpage_8.dw_cenizas.setitem(1,'estado_reg','P')
		
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		tab_crematorio.tabpage_3.dw_titular.accepttext()
		tab_crematorio.tabpage_4.dw_prelacion.accepttext()
		tab_crematorio.tabpage_5.dw_aranceles.accepttext()
		tab_crematorio.tabpage_6.dw_archivos.accepttext()
		tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
		tab_crematorio.tabpage_8.dw_cenizas.accepttext()
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
			ll_res_limpiar		= messagebox("Grabar","Grabación Exitosa Ficha Crematorio N° "+string(ll_max_folio,'###,###,###,###,##0')+", desea Limpiar Ventana",Exclamation!,YesNo!,2)
			if ll_res_limpiar=1 then cb_limpiar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error al Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
		end if
	end if
elseif ls_valido = 'S' and ll_folio_fc > 0 then
	tab_crematorio.tabpage_1.dw_ficha.accepttext()
	tab_crematorio.tabpage_2.dw_fallecido.accepttext()
	tab_crematorio.tabpage_3.dw_titular.accepttext()
	tab_crematorio.tabpage_4.dw_prelacion.accepttext()
	tab_crematorio.tabpage_5.dw_aranceles.accepttext()
	tab_crematorio.tabpage_6.dw_archivos.accepttext()
	tab_crematorio.tabpage_7.dw_ceremonia.accepttext()
	tab_crematorio.tabpage_8.dw_cenizas.accepttext()
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
		cb_crear_prelacion.triggerevent(clicked!)
		ll_res_limpiar		= messagebox("Grabar","Grabación Exitosa Ficha Crematorio N° "+string(ll_folio_fc,'###,###,###,###,##0')+", desea Limpiar Ventana",Exclamation!,YesNo!,2)
		if ll_res_limpiar=1 then cb_limpiar.triggerevent(clicked!)
	else
		rollback;
		messagebox("Error al Grabar","Error al Grabar SQL "+sqlca.sqlerrtext)
	end if
end if
end event

type tab_crematorio from tab within w_ficha_crematorio_sin_venta
integer x = 32
integer y = 236
integer width = 3255
integer height = 1668
integer taborder = 60
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

event selectionchanged;if tab_crematorio.SelectedTab=8 then
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
dw_ficha dw_ficha
end type

on tabpage_1.create
this.dw_ficha=create dw_ficha
this.Control[]={this.dw_ficha}
end on

on tabpage_1.destroy
destroy(this.dw_ficha)
end on

type dw_ficha from datawindow within tabpage_1
integer x = 18
integer y = 44
integer width = 3177
integer height = 1396
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_cabecera_crematorio_sv"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_celular,ls_correo,ls_nombre_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,ls_comuna,ls_ciudad,&
			ls_cod_estado_fall,ls_causa_fall,ls_estado_ctto,ls_periodo,ls_est,ls_obs_fall,ls_op,ls_sexo,ls_reg_civil,ls_enf_obl,ls_funeraria,ls_base_ori,ls_serie_ori,ls_tipo_cob_pago,&
			ls_caja,ls_dato_ref,ls_nulo,ls_monto_total_palabra,ls_estado_ctto_actual,ls_serie_g,ls_base_g
Double	ll_rut
long		ll_cod_funeraria,ll_edad,ll_hora,ll_minutos,ll_numero_ori,ll_cod_parque_ori,ll_folio_pago,ll_monto_pago,ll_numero_ref,ll_nulo,ll_anno_fall,ll_contrato_g
datetime	ldt_fec_sep,ldt_fec_fall,ldt_fec_nac,ldt_fecha_pago

Setnull(ls_nulo);Setnull(ll_nulo)
this.accepttext()
ls_columna			= dwo.name
if ls_columna='rut_titular' then
	setnull(is_base_g);Setnull(is_serie_g);Setnull(il_numero_g)
	ll_rut				= Double(data)
	if ll_rut > 0 then
		il_count_titular ++
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
		
			SELECT 	"INGRESO"."TIPO_COB",  	"INGRESO"."FOLIO",	"INGRESO"."FECHA_PAGO",	"INGRESO"."COD_CAJA",		"INGRESO"."CONTRATO",		"INGRESO"."SERIE",		"INGRESO"."BASE",		sum("INGRESO"."MONTO" ) as MONTO_PAGADO  
			INTO 		:ls_tipo_cob_pago,			:ll_folio_pago,			:ldt_fecha_pago,				:ls_caja,							:ll_contrato_g,						:ls_serie_g,					:ls_base_g,					:ll_monto_pago  
			FROM 	"INGRESO"  
			WHERE 	(( "INGRESO"."RUT" = :ll_rut ) AND  
						( "INGRESO"."BASE" = 'G' ) AND ( "INGRESO"."SERIE" = 'I' )   AND
						( "INGRESO"."PAGO_HIST" = 'A')) OR
						(( "INGRESO"."RUT" = :ll_rut ) AND  
						( "INGRESO"."BASE" = 'G' ) AND ( "INGRESO"."SERIE" = 'E' )   AND
						( "INGRESO"."PAGO_HIST" = 'A'))
			GROUP BY 	"INGRESO"."TIPO_COB",   
							"INGRESO"."FOLIO",   
							"INGRESO"."FECHA_PAGO",
							"INGRESO"."COD_CAJA",
							"INGRESO"."CONTRATO",
							"INGRESO"."SERIE",
							"INGRESO"."BASE";
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
			else
				messagebox("Advertencia","Debe Existir Pago Asociado, Antes de Generar Ficha Cremación")
				this.setitem(1,'rut_titular',ll_nulo)
				il_count_titular 		= 0
			end if
		else
			messagebox("Advertencia","No Exite Rut Cliente")
			this.setitem(1,'rut_titular',0)
		end if
	end if
	this.accepttext()
elseif ls_columna='rut_fallecido' then
	ll_rut			= Double(data)
	if ll_rut > 0 then
		SELECT 	"FICHA_SEPULTACION"."FECHA_SEPULTACION",	"FICHA_SEPULTACION"."NOMBRE_FALLECIDO",	"FICHA_SEPULTACION"."AP_PATERNO_FALL",	"FICHA_SEPULTACION"."AP_MATERNO_FALL",		"FICHA_SEPULTACION"."TIPO_VIA_FALLECIDO", 	"FICHA_SEPULTACION"."DIRECCION_FALL", 	"FICHA_SEPULTACION"."NUMERO_DIRECCION_FALL",	"FICHA_SEPULTACION"."DEPTO_DIRECCION_FALL",	"FICHA_SEPULTACION"."BLOCK_DIRECCION_FALL",	"FICHA_SEPULTACION"."CODIGO_COMUNA_FALL",	"FICHA_SEPULTACION"."CODIGO_CIUDAD_FALL",	"FICHA_SEPULTACION"."FECHA_DEFUNCION",	"FICHA_SEPULTACION"."FECHA_NACIMIENTO_FALL",		"FICHA_SEPULTACION"."DV_FALLECIDO",	"FICHA_SEPULTACION"."COD_ESTADO_FALL",	"FICHA_SEPULTACION"."CAUSA_FALLECIMIENTO", 	"FICHA_SEPULTACION"."CODIGO_FUNERARIA",	"FICHA_SEPULTACION"."COD_ESTADO_CONTRATO",		"FICHA_SEPULTACION"."PERIODO_NACIMIENTO",		"FICHA_SEPULTACION"."COD_TAMANO_CUERPO",	"FICHA_SEPULTACION"."OBSERVACION_FALLECIDO",		"FICHA_SEPULTACION"."COD_OBS_CUERPO",	"FICHA_SEPULTACION"."EDAD_FALLECIDO",	"FICHA_SEPULTACION"."SEXO_FALLECIDO",	"FICHA_SEPULTACION"."HORA",	"FICHA_SEPULTACION"."MINUTOS",	"FICHA_SEPULTACION"."BASE",	"FICHA_SEPULTACION"."SERIE",	"FICHA_SEPULTACION"."NUMERO",	"FICHA_SEPULTACION"."COD_PARQUE"
		INTO 		:ldt_fec_sep,   												:ls_nombre_fall,   											:ls_ap_pat_fall,   										:ls_ap_mat_fall,   											:ls_tipo_via,   												:ls_direc,   												:ls_nro,   															:ls_depto,   														:ls_block,   														:ls_comuna,   													:ls_ciudad,   												:ldt_fec_fall,   											:ldt_fec_nac,   														:ls_dv,   												:ls_cod_estado_fall,   								:ls_causa_fall,   												:ll_cod_funeraria,   										:ls_estado_ctto,   													:ls_periodo,  	 												:ls_est,   														:ls_obs_fall,   														:ls_op,													:ll_edad,													:ls_sexo,													:ll_hora,									:ll_minutos,									:ls_base_ori,							:ls_serie_ori,							:ll_numero_ori,								:ll_cod_parque_ori
		FROM 	"FICHA_SEPULTACION"  
		WHERE 	( "FICHA_SEPULTACION"."RUT_FALLECIDO" = :ll_rut ) AND  
					("FICHA_SEPULTACION"."ESTADO_REG" = 'P' OR  "FICHA_SEPULTACION"."ESTADO_REG" = 'G')   ;
		if sqlca.sqlcode=0 then
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
			SELECT 	"CADENA"."ESTADO"  
			INTO 		:ls_estado_ctto_actual  
			FROM 	"CADENA"  
			WHERE 	( "CADENA"."CODIGO" = :ls_base_ori ) AND  
						( "CADENA"."SERIE" = :ls_serie_ori ) AND  
						( "CADENA"."NUMERO" = :ll_numero_ori )   ;
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
			tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
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
				SELECT 	"CADENA"."ESTADO"  
				INTO 		:ls_estado_ctto_actual  
				FROM 	"CADENA"  
				WHERE 	( "CADENA"."CODIGO" = :ls_base_ori ) AND  
							( "CADENA"."SERIE" = :ls_serie_ori ) AND  
							( "CADENA"."NUMERO" = :ll_numero_ori )   ;
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'estado_contrato',ls_estado_ctto_actual)
				tab_crematorio.tabpage_1.dw_ficha.setitem(1,'cod_parque_origen',ll_cod_parque_ori)
			end if
		end if
		tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
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
end if
this.accepttext()
end event

event itemfocuschanged;Double	ll_rut,ll_nulo
String		ls_dv,ls_base_ori,ls_serie_ori,ls_dato_ref,ls_nulo
Long		ll_numero_ori,ll_numero_ref,ll_count

Setnull(ll_nulo);Setnull(ls_nulo)
this.accepttext()
ll_rut					= this.getitemnumber(1,'rut_titular')
if ll_rut > 0 and il_count_titular = 0 then
	SELECT 	count("INGRESO"."TIPO_COB")
	INTO 		:ll_count
	FROM 	"INGRESO"  
	WHERE 	(( "INGRESO"."RUT" = :ll_rut ) AND  
				( "INGRESO"."BASE" = 'G' ) AND ( "INGRESO"."SERIE" = 'I' )   AND
				( "INGRESO"."PAGO_HIST" = 'A')) OR
				(( "INGRESO"."RUT" = :ll_rut ) AND  
				( "INGRESO"."BASE" = 'G' ) AND ( "INGRESO"."SERIE" = 'E' )   AND
				( "INGRESO"."PAGO_HIST" = 'A'))
	GROUP BY 	"INGRESO"."TIPO_COB",   
					"INGRESO"."FOLIO",   
					"INGRESO"."FECHA_PAGO",
					"INGRESO"."COD_CAJA",
					"INGRESO"."CONTRATO"
	USING	sqlca;
	if sqlca.sqlcode<>0 then
		this.setitem(1,'rut_titular',ll_nulo)
		ll_rut		= 0
		this.setfocus()
		this.setcolumn('rut_titular')
	end if
end if
if ll_rut > 0 then
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
this.accepttext()
end event

event clicked;String		ls_columna

ls_columna		= dwo.name
if row <= 0 then
	if ls_columna='p_1' then
		messagebox("Advertencia","En Desarrollo")
	end if
	
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
string dataobject = "dw_fc_ingreso_fallecido_sv"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_columna,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_est,ls_op,ls_sexo,ls_periodo,ls_reg_civil,ls_causa_fall,ls_enf_obl,ls_tipo_via,ls_direc,ls_nro,ls_depto,ls_block,&
			ls_comuna,ls_ciudad,ls_cod_estado_fall,ls_estado_ctto,ls_obs_fall,ls_funeraria,ls_nulo,ls_base_ori,ls_serie_ori
Double	ll_rut,ll_rut_tit
Long		ll_edad,ll_cod_funeraria,ll_hora,ll_minutos,ll_numero_ori,ll_cod_parque_ori
datetime	ldt_fec_sep,ldt_fec_nac,ldt_fec_fall,ldt_fec_nac_fall,ldt_fec_def_fall,ldt_nulo,ldt_fec_pase,ldt_fec_def

this.accepttext()
ll_rut_tit			= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	Setnull(ls_nulo);Setnull(ldt_nulo)
	ls_columna		= dwo.name
	if ls_columna='rut_fallecido' or ls_columna='dv_fallecido' then
		ll_rut			= double(tab_crematorio.tabpage_2.dw_fallecido.getitemnumber(1,'rut_fallecido'))
		ls_dv			= tab_crematorio.tabpage_2.dw_fallecido.getitemstring(1,'dv_fallecido')
		if ll_rut > 0 and not isnull(ls_dv) then
			if f_valida_rut(string(ll_rut)) <> ls_dv then
				messagebox("Advertencia","Rut Inválido")
				tab_crematorio.tabpage_2.dw_fallecido.setitem(1,'dv_titular',ls_nulo)
			end if
		end if
	end if
	if ls_columna='rut_fallecido' then
		ll_rut			= Double(data)
		if ll_rut > 0 then
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
			end if
			tab_crematorio.tabpage_2.dw_fallecido.accepttext()
		end if
	elseif ls_columna='ciudad_fallecimiento' then
		ls_ciudad					= data
		idw_detalle12.retrieve(ls_ciudad)
	elseif ls_columna='fecha_nacimiento' or ls_columna='fecha_defuncion' then
		ldt_fec_nac_fall			= this.getitemdatetime(this.getrow(),'fecha_nacimiento')
		ldt_fec_def_fall			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
		if ldt_fec_nac_fall > ldt_fec_def_fall and not isnull(ldt_fec_nac_fall) and not isnull(ldt_fec_def_fall) and ldt_fec_nac_fall > gdt_fec_sistema then
			messagebox("Advertencia","Fecha Defunción NO puede ser Menor a Fecha Nacimiento o Fecha Inválida")
			this.setitem(1,'fecha_defuncion',ldt_nulo)
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

event clicked;String		ls_columna,ls_estado_reg,ls_fecha,ls_dv
Long		ll_rut_fallecido
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
							this.setitem(this.getrow(),'fecha_nacimiento',date(ls_fecha))
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
							this.setitem(this.getrow(),'fecha_defuncion',date(ls_fecha))
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

Setnull(ldt_nulo)
ldt_fec_nac_fall			= this.getitemdatetime(this.getrow(),'fecha_nacimiento')
ldt_fec_def_fall			= this.getitemdatetime(this.getrow(),'fecha_defuncion')
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
		if ls_email <> '' and ls_email <> '-' then
			if Match(ls_email, "@") then
			else
				messagebox('Advertencia','El E-Mail no es Válido',stopsign!)
				this.scrolltorow(ll_new)
				this.setitem(ll_new,'email',ls_nulo)
				this.accepttext()
				this.setfocus()
				this.setcolumn('email')
			end if	
		end if	
	end if
end if
this.accepttext()
end event

event itemfocuschanged;Long		ll_new,ll_fono_p_largo
String		ls_celular,ls_pasa_p,ls_pasa_letras,ls_email,ls_nulo

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
			ls_block_pre,ls_ciudad_pre,ls_comuna_pre,ls_fono_part_pre,ls_fono_com_pre,ls_celular_pre,ls_correo_pre,ls_obs_pre,ls_estado_civil
Long		ll_fila,ll_new,ll_tot_reg,ll_indi,ll_res,ll_nacionalidad
Double	ll_rut_pre,ll_rut_tit

ls_pasa 								= 'S'
ls_columna							= dwo.name
ll_rut_tit								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	if row = 0 then
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
		END CHOOSE
	end if
end if
this.accepttext()
end event

event itemchanged;String		ls_columna,ls_dv,ls_nulo,ls_ciudad,ls_celular,ls_pasa_p,ls_pasa_letras,ls_email
Long		ll_rut,ll_new,ll_fono_p_largo,ll_rut_tit

this.accepttext()
Setnull(ls_nulo)
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
ll_new					= this.getrow()
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
integer x = 18
integer y = 44
integer width = 3177
integer height = 1468
integer taborder = 30
string title = "none"
string dataobject = "dw_fc_detalle_documento_por_ficha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_categoria,ls_nulo,ls_val_categoria,ls_val_estado_reg,ls_fila_categoria,ls_fila_estado_reg
Long		ll_new,ll_fono_p_largo,ll_cod_doc,ll_folio_fc,ll_val_documento,ll_tot_reg,ll_indi,ll_fila_documento,ll_nulo
Double	ll_rut_pre,ll_rut,ll_rut_fall,ll_rut_tit,ll_val_rut3,ll_fila_rut3

Setnull(ls_nulo);setnull(ll_nulo)
this.accepttext()
il_fila_arc					= 0
il_count_arc					= 0
ls_columna					= dwo.name
ll_rut_tit						= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
ll_folio_fc					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
if ll_rut_tit > 0 then
	if row > 0 then
		if ls_columna='categoria' then
			ls_categoria			= this.getitemstring(this.getrow(),'categoria')
			ll_cod_doc			= long(this.getitemnumber(this.getrow(),'codigo_documento'))
			if not isnull(ls_categoria) and not isnull(ll_cod_doc) then
				idw_detalle16.retrieve(ll_folio_fc)
			end if
			if not isnull(ls_categoria) then
				idw_detalle15.retrieve(ls_categoria)
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
this.accepttext()
end event

event clicked;String		ls_columna,ls_categoria,ls_url,ls_estado,ls_autoriza,ls_string,ls_estado_carga,ls_pasa='S'
Long		ll_new,ll_tot_reg,ll_indi,ll_codigo,ll_rut,ll_res,ll_folio_crem,ret
Double	ll_rut_tit
Inet		iinet_base2

this.accepttext()
ls_columna							= dwo.name
ll_rut_tit								= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'rut_titular')
if ll_rut_tit > 0 then
	ll_folio_crem					= tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'folio_crematorio')
	ret									= GetContextService("Internet", iinet_base2)
	if row > 0 then
		This.SelectRow(0, false)
		This.SelectRow(row, true)
		il_row_archivo				= row
		if isnull(ll_folio_crem) then ll_folio_crem=0
		if ll_folio_crem > 0 then
			if ls_columna='b_archivo' then
				ls_categoria			= this.getitemstring(this.getrow(),'categoria') 
				ll_codigo				= this.getitemnumber(this.getrow(),'codigo_documento')
				ll_rut					= this.getitemnumber(this.getrow(),'rut_tercero')
				ls_estado_carga	= this.getitemstring(this.getrow(),'estado_carga') 
				if ls_estado_carga='S' then
					ls_url				= this.getitemstring(this.getrow(),'url')
					if not isnull(ls_url) then
						ret				= iinet_base2.HyperlinkToURL(ls_url)
					end if
				else
					if not isnull(ls_categoria) and not isnull(ll_codigo) and not isnull(ll_rut) then
						ls_string		= "https://www.nuestrosparques.cl/c_docs/?ficha="+string(ll_folio_crem)+"&doc="+string(ll_codigo)+"&cat="+string(ls_categoria)+"&"+"rut3="+string(ll_rut)+"&"+"usuario="+string(gs_user) 
	//					messagebox("string",ls_string)
						ret				= iinet_base2.HyperlinkToURL(ls_string)
						//abrir ventana
						
					else
						if isnull(ls_categoria) then
							messagebox("Advertencia","Debe Ingresar Categoria en Fila "+string(this.getrow()))
							this.setfocus()
							this.setcolumn('categoria')
						elseif isnull(ll_codigo) then
							messagebox("Advertencia","Debe Ingresar Codigo Documento en Fila "+string(this.getrow()))
							this.setfocus()
							this.setcolumn('codigo_documento')
						elseif isnull(ll_rut) then
							messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(this.getrow()))
							this.setfocus()
							this.setcolumn('rut_tercero')
						end if
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
				for ll_indi=1 to ll_tot_reg
					ls_categoria		= this.getitemstring(ll_indi,'categoria')
					ll_codigo			= this.getitemnumber(ll_indi,'codigo_documento')
					ll_rut				= this.getitemnumber(ll_indi,'rut_tercero')
					ls_url				= this.getitemstring(ll_indi,'url')
					ls_estado		= this.getitemstring(ll_indi,'estado_carga')
					ls_autoriza		= this.getitemstring(ll_indi,'autoriza_seremi')
					ls_pasa			= 'S'
					if isnull(ls_categoria) then
						messagebox("Advertencia","Debe Ingresar Categoria en Fila "+string(ll_indi))
						this.scrolltorow(ll_indi)
						this.setcolumn('categoria')
						ls_pasa		= 'N'
						exit
					elseif isnull(ll_codigo) then
						messagebox("Advertencia","Debe Ingresar Codigo Documento en Fila "+string(ll_indi))
						this.scrolltorow(ll_indi)
						this.setcolumn('codigo_documento')
						ls_pasa		= 'N'
						exit
					elseif isnull(ll_rut) then
						messagebox("Advertencia","Debe Ingresar Rut Prelación en Fila "+string(ll_indi))
						this.scrolltorow(ll_indi)
						this.setcolumn('rut_tercero')
						ls_pasa		= 'N'
						exit
					elseif isnull(ls_url) then
						messagebox("Advertencia","Debe Realizar Carga Archivo en Fila "+string(ll_indi))
						this.scrolltorow(ll_indi)
						this.setcolumn('url')
						ls_pasa		= 'N'
						exit
					elseif isnull(ls_estado) then	// or ls_estado <> 'S'
						messagebox("Advertencia","No esta Correctamente Cargado Archivo en Fila "+string(ll_indi))
						this.scrolltorow(ll_indi)
						ls_pasa		= 'N'
						exit
					elseif (isnull(ls_autoriza) or ls_autoriza <> '') and ls_categoria='FA' and ll_codigo=8 then
						messagebox("Advertencia","Debe Seleccionar Autorización Seremi S/N en Fila "+string(ll_indi))
						this.scrolltorow(ll_indi)
						ls_pasa		= 'N'
						exit
					end if
				next
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
				this.accepttext()
	//			dw_archivos.deleterow(il_row_archivo)
				if dw_archivos.update()=1 then
					if dw_archivos.rowcount() > 0 then dw_archivos.scrolltorow(1)
					commit;
				else
					rollback;
					messagebox("Error Eliminar","Error al Eliminar Registro SQL: "+sqlca.sqlerrtext)
				end if
			end if
		elseif ls_columna='t_actualizar' then
			dw_archivos.retrieve(ll_folio_crem)
		end if
	end if
end if
this.accepttext()
end event

event rowfocuschanged;if this.getrow() > 0 then
	il_row_archivo				= this.getrow()
	This.SelectRow(0, false)
	This.SelectRow(this.getrow(), true)
end if
end event

event itemfocuschanged;Long		ll_nulo

Setnull(ll_nulo)
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
ls_columna			= dwo.name
if ls_columna='sw_orador' or ls_columna='sw1' then
	ll_sw_orador	= long(data)
	this.setitem(1,'sw_orador',ll_sw_orador)
	if ll_sw_orador=1 then
		this.setitem(1,'codigo_diacono',ll_nulo)
		this.setitem(1,'codigo_maestro',ls_nulo)
		this.setitem(1,'observacion',ls_nulo)
	elseif ll_sw_orador=2 then
		this.setitem(1,'codigo_maestro',ls_nulo)
		this.setitem(1,'observacion',ls_nulo)
	elseif ll_sw_orador=3 then
		this.setitem(1,'codigo_diacono',ll_nulo)
		this.setitem(1,'observacion',ls_nulo)
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
dw_cenizas dw_cenizas
end type

on tabpage_8.create
this.dw_cenizas=create dw_cenizas
this.Control[]={this.dw_cenizas}
end on

on tabpage_8.destroy
destroy(this.dw_cenizas)
end on

type dw_cenizas from datawindow within tabpage_8
integer x = 18
integer y = 44
integer width = 3177
integer height = 1396
integer taborder = 10
string title = "none"
string dataobject = "dw_fc_destino_responsable_cuerpo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_responsable_retiro,ls_columna
Long		ll_destino_cuerpo
datetime	ldt_fecha_retiro,ldt_fecha_crea,ldt_fecha_def,ldt_nulo

Setnull(ldt_nulo)
this.accepttext()
ls_columna						= dwo.name
if ls_columna='responsable_retiro' then
	ls_responsable_retiro		= this.getitemstring(1,'responsable_retiro')
	if not isnull(ls_responsable_retiro) then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'responsable_retiro',ls_responsable_retiro)
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
elseif ls_columna='destino_cuerpo' then
	ll_destino_cuerpo			= this.getitemnumber(1,'destino_cuerpo')
	if not isnull(ll_destino_cuerpo) then
		tab_crematorio.tabpage_1.dw_ficha.setitem(1,'destino_cuerpo',ll_destino_cuerpo)
		tab_crematorio.tabpage_1.dw_ficha.accepttext()
	end if
elseif ls_columna='fecha_retiro_ceniza' then
	ldt_fecha_retiro	= this.getitemdatetime(1,'fecha_retiro_ceniza')
	if not isnull(ldt_fecha_retiro) then
		ldt_fecha_crea	= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_crea')
		ldt_fecha_def	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
		if not isnull(ldt_fecha_crea) and ldt_fecha_retiro > ldt_fecha_crea then
			messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha de Solcitud Cremación")
			this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
			this.accepttext()
		elseif not isnull(ldt_fecha_def) and ldt_fecha_retiro > ldt_fecha_def then
			messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha Defunción")
			this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
			this.accepttext()
		end if
	end if
	
end if
this.accepttext()
end event

event itemfocuschanged;datetime	ldt_fecha_retiro,ldt_fecha_crea,ldt_fecha_def,ldt_nulo

Setnull(ldt_nulo)
This.accepttext()
ldt_fecha_retiro	= this.getitemdatetime(1,'fecha_retiro_ceniza')
if not isnull(ldt_fecha_retiro) then
	ldt_fecha_crea	= tab_crematorio.tabpage_1.dw_ficha.getitemdatetime(1,'fecha_crea')
	ldt_fecha_def	= tab_crematorio.tabpage_2.dw_fallecido.getitemdatetime(1,'fecha_defuncion')
	if not isnull(ldt_fecha_crea) and ldt_fecha_retiro > ldt_fecha_crea then
//		messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha de Solcitud Cremación")
		this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
		this.accepttext()
		This.setcolumn('fecha_retiro_ceniza')
	elseif not isnull(ldt_fecha_def) and ldt_fecha_retiro > ldt_fecha_def then
//		messagebox("Advertencia","Fecha Retiro Cenizas No puede ser Menor a Fecha Defunción")
		this.setitem(1,'fecha_retiro_ceniza',ldt_nulo)
		this.accepttext()
		This.setcolumn('fecha_retiro_ceniza')
	end if
end if
This.accepttext()
end event

type cb_cerrar from commandbutton within w_ficha_crematorio_sin_venta
integer x = 3026
integer y = 1936
integer width = 261
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ficha_crematorio_sin_venta)
end event

type gb_1 from groupbox within w_ficha_crematorio_sin_venta
integer x = 27
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

type gb_2 from groupbox within w_ficha_crematorio_sin_venta
integer x = 1490
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

