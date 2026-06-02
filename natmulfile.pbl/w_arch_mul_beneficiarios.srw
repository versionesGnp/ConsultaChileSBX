//objectcomments Autor: César Vilela R.~r~nFunción: consulta de contratos MultiProducto listos para Revisión
forward
global type w_arch_mul_beneficiarios from wa_response
end type
type cb_ingresar from uo_cbother within w_arch_mul_beneficiarios
end type
type cb_eliminar from uo_cbother within w_arch_mul_beneficiarios
end type
type cbx_serv from checkbox within w_arch_mul_beneficiarios
end type
end forward

global type w_arch_mul_beneficiarios from wa_response
integer width = 2930
integer height = 2740
string title = "Beneficiarios"
windowanimationstyle closeanimation = noanimation!
cb_ingresar cb_ingresar
cb_eliminar cb_eliminar
cbx_serv cbx_serv
end type
global w_arch_mul_beneficiarios w_arch_mul_beneficiarios

type variables

MP MP
String		is_base,is_serie,is_tipo_via,is_direccion,is_nro_part,is_depto_part,&
			is_block_part,is_comuna,is_ciudad,is_pob,is_sector,is_fono,is_limpiar,is_dw
Long		il_tipo_benef,il_row_eli,il_cod_parque,il_cantidad
date		idt_fecha_hoy
Double	il_numero
DataWindowChild	idw_com, idw_vel, idw_ret, idw_com4


Long	il_WidthMax = 4330
Long	il_WidthMin = 2990

end variables

forward prototypes
public function integer wf_open ()
public function boolean wf_savedocument ()
end prototypes

public function integer wf_open ();
Int		li_nil, li_cmp
String	ls_db, ls_nil, ls_cto, ls_bas, ls_ser
Long		ln_rut, ln_nro

dw_1.AcceptText( )

li_cmp = f_Zero( dw_1.Object.CodigoMP[ 1] )
ls_cto = f_Trim( dw_1.Object.Barra[ 1] )
ls_bas = f_Trim( dw_1.Object.Base[ 1] )
ls_ser = f_Trim( dw_1.Object.Serie[ 1] )
ln_nro = f_Zero( dw_1.Object.Numero[ 1] )
//ln_rut = f_Zero( dw_1.Object.rut[ 1] )
ls_DB = UpperTrim( dw_1.Object.DB[ 1] )

SetNull( li_nil ) ; SetNull( ls_nil ) ;

If li_cmp = 0 Then
	dw_1.Setfocus( 'CodigoMP' )
	blEclipse.Messagebox( Title, 'Debe Seleccionar MultiProducto para continuar.', Exclamation! )
	Return 0
End If

If ls_DB = '' Then
	blEclipse.Messagebox( Title, 'Debe Seleccionar DB para continuar.', Exclamation! )
	Return 0
End If

Long		rows
String	ls_ref

ls_ref = ls_nil
//rows = dw_1.Retrieve( ls_bas, ls_ser, ln_nro, ls_ref, 'CAB', ls_DB )


dw_list.SetRedraw( False )
long	ll_tot_reg,ll_indi,ll_res,ll_estado_activa

//if gs_user = 'MARCOS' then dw_list.object.version.visible = true

il_tipo_benef							= mp.tipoBeneficiarios
il_cod_parque							= mp.codParque
is_base									= mp.Base
is_serie									= mp.Serie
il_numero								= mp.Numero
il_cantidad								= mp.Capacidad
idt_fecha_hoy							= Date( f_ServerDate( ))

is_limpiar								= 'N'
This.width	= il_WidthMin
cbx_serv.checked						= false

if gs_depto='R' or gs_depto='B' then
	close(This)
else
	
	select	tipo_via,		direccion_p,	numero_particular,	depto_particular,	block_particular,	comuna,		ciudad,		poblacion,	sector,		fono_p  
	into 		:is_tipo_via,	:is_direccion,	:is_nro_part,			:is_depto_part,	:is_block_part,	:is_comuna,	:is_ciudad,	:is_pob,		:is_sector,	:is_fono  
	from		cliente 
	where 	Rut = :MP.rut
	using	sqlca ;
	
	ll_tot_reg	= dw_list.Retrieve(is_base,is_serie,il_numero)
	
	if Ll_tot_reg>0 Then
		il_tipo_benef = f_Zero( dw_list.Object.tipo_beneficiario[ 1] )
		If il_tipo_benef > 0 Then
			mp.tipoBeneficiarios = il_tipo_benef
		End If
		
		select	sw_activa_servicio
		into		:ll_estado_activa
		from		revision_contratos  
		where	base = :is_base And  
					serie = :is_serie And  
					numero = :il_numero 
		using	sqlca;
		if isnull(ll_estado_activa) then ll_estado_activa=1
		
		
		if gs_depto='O' or gs_depto='V' or gs_depto='I' or gs_depto='N' or gs_depto='H' then
			if ll_estado_activa=0 Then //and gl_proceso=1 then
				cb_aceptar.enabled			= false
			else
				cb_aceptar.enabled			= true
			end if
			cb_ingresar.enabled			= true
			cb_eliminar.enabled			= true
			dw_list.enabled				= true
			is_dw								= 'S'
		else
			cb_aceptar.enabled				= false
			cb_ingresar.enabled			= false
			cb_eliminar.enabled			= false
			dw_list.enabled				= false
			is_dw								= 'N'
		end if
	else
		if gs_depto='O' or  gs_depto='V' or gs_depto='I' or gs_depto='N' or gs_depto='H' then
			cb_aceptar.enabled				= true
			cb_ingresar.enabled			= false
			cb_eliminar.enabled			= true
			dw_list.enabled				= true
			is_dw								= 'S'
			if isvalid( w_Arch_Mul_Revision_Info ) then
				ll_res							= 1
			else
				ll_res							= blEclipse.MessageBox( Title, '¿Desea Ingresar Beneficiarios de Servicio Funerario?', Question!, YesNo!, 2)
			end if
			if ll_res=1 then
				cb_ingresar.TriggerEvent(Clicked!)
			else
				close( This )
			end if
		else
			blEclipse.MessageBox( Title, 'Usuario No Autorizado para ingresar Beneficiarios de Servicio Funerario.', Exclamation! )
			close( This )
		end if
	end if
end if
dw_list.SetRedraw( True )
dw_list.SetFocus( )

Return 1
end function

public function boolean wf_savedocument ();Long	row

DateTime &
   ldFecha_salida_velatorio, &
   ldFecha_sepultacion     , &
   ldFecha_nac             , &
   ldFecha_crea            , &
   ldFec_elimina           , &
   ldFecha_modif           , &
   ldFecha_cineracion      
   
Dec &
   lnTipo_beneficiario    , & 
   lnRut                  , &
   lnFolio                , &
   lnCementerio           , &
   lnPeso                 , &
   lnEstatura             , &
   lnViaje_traslado       , &
   lnTanatopraxia         , &
   lnVehiculo_adicional   , &
   lnUrna_largo           , &
   lnUrna_ancho           , &
   lnUrna_alto            , &
   lnRegistro_civil_tram  , &
   lnCertificado_medico   , &
   lnCap_cirios_natural   , &
   lnCap_cirios_electricos, &
   lnCap_libro_condolencia, &
   lnCap_cruz             , &
   lnCap_rozas_urna       , &
   lnCap_cinta_identifica , &
   lnServ_adiciona_01     , &
   lnServ_adiciona_02     , &
   lnServ_adiciona_03     , &
   lnMarcapaso            , &
   lnRut_retira_cineracion, &
   lnValor_cta_mortuoria  , &
   lnUf_pago_cta_mortuoria 

  String &
   lsNombre                    , &
   lsA_paterno                 , &
   lsA_materno                 , &
   lsDv                        , &
   lsDireccion_p               , &
   lsPoblacion                 , &
   lsTipo_via                  , &
   lsComuna                    , &
   lsCiudad                    , &
   lsNumero_p                  , &
   lsDepto_p                   , &
   lsBlock_p                   , &
   lsFono_p                    , &
   lsSexo                      , &
   lsEstado_reg                , &
   lsParentesco                , &
   lsUsuario_crea              , &
   lsUsuario_elimina           , &
   lsEstado_civil              , &
   lsContacto_nombre           , &
   lsDireccion_retiro          , &
   lsNumero_retiro             , &
   lsComuna_retiro             , &
   lsCiudad_retiro             , &
   lsDireccion_velatorio       , &
   lsNumero_velatorio          , &
   lsComuna_velatorio          , &
   lsCiudad_velatorio          , &
   lsContacto_fono_part        , &
   lsContacto_fono_celular     , &
   lsEstado_cuerpo             , &
   lsNacionalidad              , &
   lsUrna_color                , &
   lsObservacion               , &
   lsUsuario_modif             , &
   lsNombre_retira_cineracion  , &
   lsA_pater_retira_cineracion , &
   lsA_mater_retira_cineracion , &
   lsParen_retira_cineracion   , &
   lsDv_retira_cineracion      , &
   lsMoneda_cta_mortuoria      

Integer	li_ret
String	lsBase, lsSerie, &
			ls_gen, ls_edo, ls_msg
Long		lnNumero

uo_DataStore	lds_ben
f_CreateDS( lds_ben, 'd_arch_mul_beneficiarios_save', SqlCa )

SetMicrohelp( 'Guardando Beneficiarios...')

For row = 1 To dw_list.RowCount( )   
   
	lsBase   = UpperTrim( dw_list.Object.Base  [ row] )
	lsSerie  = UpperTrim( dw_list.Object.Serie [ row] )
	lnNumero = f_Zero( dw_list.Object.Numero [ row] )
	
   ldFecha_salida_velatorio = dw_list.Object.Fecha_salida_velatorio [ row] 
   ldFecha_sepultacion      = dw_list.Object.Fecha_sepultacion      [ row] 
   ldFecha_nac              = dw_list.Object.Fecha_nac              [ row] 
   ldFecha_crea             = dw_list.Object.Fecha_crea             [ row] 
   ldFec_elimina            = dw_list.Object.Fec_elimina            [ row] 
   ldFecha_modif            = dw_list.Object.Fecha_modif            [ row] 
   ldFecha_cineracion       = dw_list.Object.Fecha_cineracion       [ row] 

   lnTipo_beneficiario         = dw_list.Object.Tipo_beneficiario     [ row] 
   lnRut                       = dw_list.Object.Rut                   [ row] 
   lnFolio                     = dw_list.Object.Folio                 [ row] 
   lnCementerio                = dw_list.Object.Cementerio            [ row] 
   lnPeso                      = dw_list.Object.Peso                  [ row] 
   lnEstatura                  = dw_list.Object.Estatura              [ row] 
   lnViaje_traslado            = dw_list.Object.Viaje_traslado        [ row] 
   lnTanatopraxia              = dw_list.Object.Tanatopraxia          [ row] 
   lnVehiculo_adicional        = dw_list.Object.Vehiculo_adicional    [ row] 
   lnUrna_largo                = dw_list.Object.Urna_largo            [ row] 
   lnUrna_ancho                = dw_list.Object.Urna_ancho            [ row] 
   lnUrna_alto                 = dw_list.Object.Urna_alto             [ row] 
   lnRegistro_civil_tram       = dw_list.Object.Registro_civil_tram   [ row] 
   lnCertificado_medico        = dw_list.Object.Certificado_medico    [ row] 
   lnCap_cirios_natural        = dw_list.Object.Cap_cirios_natural    [ row] 
   lnCap_cirios_electricos     = dw_list.Object.Cap_cirios_electricos [ row] 
   lnCap_libro_condolencia     = dw_list.Object.Cap_libro_condolencia [ row] 
   lnCap_cruz                  = dw_list.Object.Cap_cruz              [ row] 
   lnCap_rozas_urna            = dw_list.Object.Cap_rozas_urna        [ row] 
   lnCap_cinta_identifica      = dw_list.Object.Cap_cinta_identifica  [ row] 
   lnServ_adiciona_01          = dw_list.Object.Serv_adiciona_01      [ row] 
   lnServ_adiciona_02          = dw_list.Object.Serv_adiciona_02      [ row] 
   lnServ_adiciona_03          = dw_list.Object.Serv_adiciona_03      [ row] 
   lnMarcapaso                 = dw_list.Object.Marcapaso             [ row] 
   lnRut_retira_cineracion     = dw_list.Object.Rut_retira_cineracion [ row] 
   lnValor_cta_mortuoria       = dw_list.Object.Valor_cta_mortuoria   [ row] 
   lnUf_pago_cta_mortuoria     = dw_list.Object.Uf_pago_cta_mortuoria [ row] 

   lsNombre                    = UpperTrim( dw_list.Object.Nombre                   [ row] )
   lsA_paterno                 = UpperTrim( dw_list.Object.A_paterno                [ row] )
   lsA_materno                 = UpperTrim( dw_list.Object.A_materno                [ row] )
   lsDv                        = UpperTrim( dw_list.Object.Dv                       [ row] )
   lsDireccion_p               = UpperTrim( dw_list.Object.Direccion_p              [ row] )
   lsPoblacion                 = UpperTrim( dw_list.Object.Poblacion                [ row] )
   lsTipo_via                  = UpperTrim( dw_list.Object.Tipo_via                 [ row] )
   lsComuna                    = UpperTrim( dw_list.Object.Comuna                   [ row] )
   lsCiudad                    = UpperTrim( dw_list.Object.Ciudad                   [ row] )
   lsNumero_p                  = UpperTrim( dw_list.Object.Numero_p                 [ row] )
   lsDepto_p                   = UpperTrim( dw_list.Object.Depto_p                  [ row] )
   lsBlock_p                   = UpperTrim( dw_list.Object.Block_p                  [ row] )
   lsFono_p                    = UpperTrim( dw_list.Object.Fono_p                   [ row] )
   lsSexo                      = UpperTrim( dw_list.Object.Sexo                     [ row] )
   lsEstado_reg                = UpperTrim( dw_list.Object.Estado_reg               [ row] )
   lsParentesco                = UpperTrim( dw_list.Object.Parentesco               [ row] )
   lsUsuario_crea              = UpperTrim( dw_list.Object.Usuario_crea             [ row] )
   lsUsuario_elimina           = UpperTrim( dw_list.Object.Usuario_elimina          [ row] )
   lsEstado_civil              = UpperTrim( dw_list.Object.Estado_civil             [ row] )
   lsContacto_nombre           = UpperTrim( dw_list.Object.Contacto_nombre          [ row] )
   lsDireccion_retiro          = UpperTrim( dw_list.Object.Direccion_retiro         [ row] )
   lsNumero_retiro             = UpperTrim( dw_list.Object.Numero_retiro            [ row] )
   lsComuna_retiro             = UpperTrim( dw_list.Object.Comuna_retiro            [ row] )
   lsCiudad_retiro             = UpperTrim( dw_list.Object.Ciudad_retiro            [ row] )
   lsDireccion_velatorio       = UpperTrim( dw_list.Object.Direccion_velatorio      [ row] )
   lsNumero_velatorio          = UpperTrim( dw_list.Object.Numero_velatorio         [ row] )
   lsComuna_velatorio          = UpperTrim( dw_list.Object.Comuna_velatorio         [ row] )
   lsCiudad_velatorio          = UpperTrim( dw_list.Object.Ciudad_velatorio         [ row] )
   lsContacto_fono_part        = UpperTrim( dw_list.Object.Contacto_fono_part       [ row] )
   lsContacto_fono_celular     = UpperTrim( dw_list.Object.Contacto_fono_celular    [ row] )
   lsEstado_cuerpo             = UpperTrim( dw_list.Object.Estado_cuerpo            [ row] )
   lsNacionalidad              = UpperTrim( dw_list.Object.Nacionalidad             [ row] )
   lsUrna_color                = UpperTrim( dw_list.Object.Urna_color               [ row] )
   lsObservacion               = UpperTrim( dw_list.Object.Observacion              [ row] )
   lsUsuario_modif             = UpperTrim( dw_list.Object.Usuario_modif            [ row] )
   lsNombre_retira_cineracion  = UpperTrim( dw_list.Object.Nombre_retira_cineracion [ row] )
   lsA_pater_retira_cineracion = UpperTrim( dw_list.Object.A_pater_retira_cineracion[ row] )
   lsA_mater_retira_cineracion = UpperTrim( dw_list.Object.A_mater_retira_cineracion[ row] )
   lsParen_retira_cineracion   = UpperTrim( dw_list.Object.Paren_retira_cineracion  [ row] )
   lsDv_retira_cineracion      = UpperTrim( dw_list.Object.Dv_retira_cineracion     [ row] )
   lsMoneda_cta_mortuoria      = UpperTrim( dw_list.Object.Moneda_cta_mortuoria     [ row] )
	
	li_ret = lds_ben.Retrieve( &
   lsBase                      , &
   lsSerie                     , &
   lnNumero                    , &
   lnTipo_beneficiario         , &
   lsNombre                    , &
   lsA_paterno                 , &
   lsA_materno                 , &
   lnRut                       , &
   lsDv                        , &
   lsDireccion_p               , &
   lsPoblacion                 , &
   lsTipo_via                  , &
   lsComuna                    , &
   lsCiudad                    , &
   lsNumero_p                  , &
   lsDepto_p                   , &
   lsBlock_p                   , &
   lsFono_p                    , &
   lsSexo                      , &
   ldFecha_nac                 , &
   ldFecha_crea                , &
   lsEstado_reg                , &
   lnFolio                     , &
   lsParentesco                , &
   ldFec_elimina               , &
   lsUsuario_crea              , &
   lsUsuario_elimina           , &
   lsEstado_civil              , &
   lsContacto_nombre           , &
   lsDireccion_retiro          , &
   lsNumero_retiro             , &
   lsComuna_retiro             , &
   lsCiudad_retiro             , &
   lsDireccion_velatorio       , &
   lsNumero_velatorio          , &
   lsComuna_velatorio          , &
   lsCiudad_velatorio          , &
   lnCementerio                , &
   lsContacto_fono_part        , &
   lsContacto_fono_celular     , &
   ldFecha_salida_velatorio    , &
   ldFecha_sepultacion         , &
   lnPeso                      , &
   lnEstatura                  , &
   lsEstado_cuerpo             , &
   lsNacionalidad              , &
   lnViaje_traslado            , &
   lnTanatopraxia              , &
   lnVehiculo_adicional        , &
   lnUrna_largo                , &
   lnUrna_ancho                , &
   lnUrna_alto                 , &
   lsUrna_color                , &
   lnRegistro_civil_tram       , &
   lnCertificado_medico        , &
   lnCap_cirios_natural        , &
   lnCap_cirios_electricos     , &
   lnCap_libro_condolencia     , &
   lnCap_cruz                  , &
   lnCap_rozas_urna            , &
   lnCap_cinta_identifica      , &
   lsObservacion               , &
   lsUsuario_modif             , &
   ldFecha_modif               , &
   lnServ_adiciona_01          , &
   lnServ_adiciona_02          , &
   lnServ_adiciona_03          , &
   lnMarcapaso                 , &
   ldFecha_cineracion          , &
   lsNombre_retira_cineracion  , &
   lsA_pater_retira_cineracion , &
   lsA_mater_retira_cineracion , &
   lnRut_retira_cineracion     , &
   lsParen_retira_cineracion   , &
   lsDv_retira_cineracion      , &
   lnValor_cta_mortuoria       , &
   lsMoneda_cta_mortuoria      , &
   lnUf_pago_cta_mortuoria     )

	If li_ret > 0 Then
		ls_gen = f_Trim( lds_ben.Object.CodigoGenerado[ 1] )
		ls_edo = f_Trim( lds_ben.Object.Estado[ 1] )
		ls_msg = f_Trim( lds_ben.Object.MensajeResultado[ 1] )
	Else
		ls_gen = '-2'
		ls_edo = 'ERR'
		ls_msg = lds_ben.is_ErrText
		If ls_msg = '' Then ls_msg = 'Se ha producido un error indeterminado en la transacción, es posible que existe un problema de la definición del objeto DS y el Procedure.' 
	End If
		
	If f_In (ls_edo, {'ERR', 'ERC', 'IER'}) Then
		RollBack Using SqlCa ;
		blEclipse.MessageBox( Title, ls_msg, StopSign! )
		Return False
	End If
Next


If Not ls_gen = '' Then
	Commit Using SqlCa ;
End If


Return True
end function

on w_arch_mul_beneficiarios.create
int iCurrent
call super::create
this.cb_ingresar=create cb_ingresar
this.cb_eliminar=create cb_eliminar
this.cbx_serv=create cbx_serv
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ingresar
this.Control[iCurrent+2]=this.cb_eliminar
this.Control[iCurrent+3]=this.cbx_serv
end on

on w_arch_mul_beneficiarios.destroy
call super::destroy
destroy(this.cb_ingresar)
destroy(this.cb_eliminar)
destroy(this.cbx_serv)
end on

event open;call super::open;

MP = Message.PowerObjectParm

dw_1.InsertRow( 1 )
dw_1.Object.CodigoMP[ 1] = MP.Codigomp
dw_1.Object.Barra[ 1] = MP.Barra
dw_1.Object.Base[ 1] = MP.Base
dw_1.Object.Serie[ 1] = MP.Serie
dw_1.Object.Numero[ 1] = MP.Numero
dw_1.Object.Cod_Parque[ 1] = MP.CodParque
//dw_1.Object.RUT[ 1] = MP.RUT
//dw_1.Object.DV[ 1] = MP.DV
dw_1.Object.DB[ 1] = MP.Db
dw_1.Accepttext( )

dw_list.Title = This.Title

dw_1.ColEnabled( False )
dw_list.ColEnabled( {'folio', 'co_cm', 'co_kg'}, False )
//dw_list.Object.DataWindow.ReadOnly = True
dw_list.SetObjectcolor( 'Estado_reg', 'UpperTrim( Estado_reg ) = "V"', {'ba', 'bx'} )

dw_list.getchild('comuna',idw_com)
idw_com.settransobject(sqlca)
idw_com.insertrow(0)

dw_list.getchild('comuna_velatorio',idw_vel)
idw_vel.settransobject(sqlca)
idw_vel.insertrow(0)

dw_list.getchild('comuna_retiro',idw_ret)
idw_ret.settransobject(sqlca)
idw_ret.insertrow(0)

wf_Open( )
end event

type dw_list from wa_response`dw_list within w_arch_mul_beneficiarios
event check ( )
integer x = 110
integer y = 304
integer width = 4151
integer height = 2172
string dataobject = "d_arch_mul_beneficiarios_Det"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detheight = false
boolean ib_exportxls = false
integer ii_detheight = 100
integer ii_headheight = 5
end type

event dw_list::check();
Long		row
String	ls_chk
		
This.AcceptText( )

row = This.GetRow( )
ls_chk = f_Trim( This.Object.c_check[ row] )
If ls_chk = '1' Then
	This.Object.Estado[ row] = 'P'
	This.SetFocus( 'Observacion' )
End If

If Not ls_chk = '1' Then
	This.Object.Estado[ row] = ''
	This.Object.Observacion[ row] = ''
End If

end event

event dw_list::itemchanged;call super::itemchanged;
string	ls_dv,ls_ciudad,ls_nulo,ls_columna,ls_ciudad_vel,ls_ciudad_ret,ls_dw
long	ll_rut,ll_cta_rut,ll_nulo


ls_dw = is_dw

if Not row>0 then Return

setnull(ls_nulo);setnull(ll_nulo)
this.accepttext()

cb_aceptar.Enabled = True

Choose Case dwo.Name
	Case 'tipo_beneficiario'
		il_tipo_benef = Long( f_Trim( data ) )
	
End Choose

	il_row_eli		= row
	ls_columna		= dwo.name
	if ls_columna = 'rut' or ls_columna = 'dv' then
		String		ls_rut
		ll_rut		= f_Zero( dw_list.getitemnumber(row, 'rut') )
		ls_dv			= UpperTrim( dw_list.getitemstring(row, 'dv') )
		if ll_rut > 0 And Not ls_dv = '' Then
			ls_rut = String( ll_rut ) + ls_dv
			If Not f_genValidaRut( ls_rut ) Then
				blEclipse.Messagebox( Title,'El Rut no es Válido',stopsign!)
				dw_list.setitem(row,'rut',ll_rut)
				cb_aceptar.enabled					= false
				dw_list.setitem(row,"estado_rut",0)
				dw_list.setitem(row,'dv',ls_nulo)
				dw_list.setfocus()
				dw_list.setcolumn('dv')
			else
				cb_aceptar.enabled					= true
				dw_list.setitem(row,"estado_rut",1)
				dw_list.setfocus()
				dw_list.setcolumn('nombre')	
			end if 
		end if
		SELECT	count("RUT")  
		INTO 		:ll_cta_rut  
		FROM 	"PRODUCTO_BENEFICIARIO"  
		WHERE	"BASE" = :is_base AND
					"SERIE" = :is_serie AND
					"NUMERO" = :il_numero AND
					"RUT" = :ll_rut AND
					"ESTADO_REG" = 'V'
		USING	sqlca;
		if isnull(ll_cta_rut) or ll_cta_rut=0 then ll_cta_rut=0
		if ll_cta_rut>0 then
			messagebox("Advertencia","Existe Beneficiario Vigente RUT: "+string(ll_rut,'###,###,###')+" Asociado al Contrato: "+is_base+"-"+is_serie+"-"+string(il_numero,'###,###,###'))
			cb_aceptar.enabled						= false
			dw_list.setitem(row,"estado_rut",0)
			is_limpiar								= 'S'
			dw_list.setitem(row,"rut",ll_nulo)
			dw_list.setitem(row,'dv',ls_nulo)
			dw_list.setfocus()
			dw_list.setcolumn('rut')
		end if
	elseif ls_columna='ciudad' then
		ls_ciudad								= dw_list.getitemstring(row,'ciudad')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_com.retrieve(ls_ciudad)
		end if
		if ls_ciudad='999' then
			dw_list.setitem(row,'comuna','999')
		end if
		if ls_ciudad='0' then
			dw_list.setitem(row,'comuna','0')
		end if
	elseif ls_columna='ciudad_velatorio' then
		ls_ciudad_vel						= dw_list.getitemstring(row,'ciudad_velatorio')
		if not isnull(ls_ciudad_vel) and ls_ciudad_vel<>'' then
			idw_vel.retrieve(ls_ciudad_vel)
		end if
		if ls_ciudad_vel='999' then
			dw_list.setitem(row,'comuna_velatorio','999')
		end if
		if ls_ciudad_vel='0' then
			dw_list.setitem(row,'comuna_velatorio','0')
		end if
		
	elseif ls_columna='ciudad_retiro' then
		ls_ciudad_ret					= dw_list.getitemstring(row,'ciudad_retiro')
		if not isnull(ls_ciudad_ret) and ls_ciudad_ret<>'' then
			idw_ret.retrieve(ls_ciudad_ret)
		end if
		if ls_ciudad_ret='999' then
			dw_list.setitem(row,'comuna_retiro','999')
		end if
		if ls_ciudad_ret='0' then
			dw_list.setitem(row,'comuna_retiro','0')
		end if
	end if

dw_list.accepttext()
end event

event dw_list::itemfocuschanged;call super::itemfocuschanged;

If ib_ind Then
	Object.r_ind.x = Long( dwo.x ) - 4
	Object.r_ind.y = Long( dwo.y ) - 4
	Object.r_ind.width = Long( dwo.width ) + 8
	Object.r_ind.Height = Long( dwo.Height ) + 8
End If
end event

event dw_list::constructor;call super::constructor;ib_ind = True
If ib_ind Then f_CreateColumnIndicator( This, 'r_ind' )
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;string	ls_ciudad,ls_ciudad_vel,ls_ciudad_ret,ls_dw
long	ll_opc_01


ls_dw	=	is_dw

this.accepttext()
if currentRow <= 0 then Return

Int	li_rows
	il_row_eli			=  currentRow
	ls_ciudad				= This.getitemstring(il_row_eli,'ciudad')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		li_rows = idw_com.retrieve(ls_ciudad)
	end if
	if ls_ciudad='999' then
		This.setitem(il_row_eli,'comuna','999')
	end if
	if ls_ciudad='0' then
		This.setitem(il_row_eli,'comuna','0')
	end if
	
	ls_ciudad_vel			= This.getitemstring(il_row_eli,'ciudad_velatorio')
	if not isnull(ls_ciudad_vel) and ls_ciudad_vel<>'' then
		li_rows = idw_vel.retrieve(ls_ciudad_vel)
	end if
	if ls_ciudad_vel='999' then
		This.setitem(il_row_eli,'comuna_velatorio','999')
	end if
	if ls_ciudad_vel='0' then
		This.setitem(il_row_eli,'comuna_velatorio','0')
	end if
	
	ls_ciudad_ret					= This.getitemstring(il_row_eli,'ciudad_retiro')
	if not isnull(ls_ciudad_ret) and ls_ciudad_ret<>'' then
		li_rows = idw_ret.retrieve(ls_ciudad_ret)
	end if
	if ls_ciudad_ret='999' then
		This.setitem(il_row_eli,'comuna_retiro','999')
	end if
	if ls_ciudad_ret='0' then
		This.setitem(il_row_eli,'comuna_retiro','0')
	end if

end event

event dw_list::itemerror;call super::itemerror;
Return 1
end event

type dw_1 from wa_response`dw_1 within w_arch_mul_beneficiarios
integer width = 4430
integer height = 2504
string dataobject = "d_arch_mul_beneficiarios"
boolean ib_ind = false
end type

event dw_1::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_open'
		wf_Open( )
		
End Choose
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_beneficiarios
integer x = 2491
integer y = 2532
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_beneficiarios
integer x = 2121
integer y = 2532
boolean enabled = true
end type

event cb_aceptar::clicked;call super::clicked;
Datetime	ldt_fec_nac, ld_hoy
Long		ll_tot_reg,ll_indi,ll_rut,ll_existe,ll_estado_activa
String	ls_pasa='N',ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_parent,ls_direc,&
			ls_nro_part,ls_ciudad,ls_comuna,ls_sexo,ls_fono,ls_depto_p,ls_block_p,ls_poblac,ls_contacto,ls_celular

String	ls_msg, ls_col

dw_list.accepttext()
ll_tot_reg	= dw_list.rowcount()
ld_hoy		= f_ServerDate()

if Not ll_tot_reg>0 then Return

	if ll_tot_reg<=il_cantidad then
		ls_pasa						= 'S'
	else
		ls_pasa						= 'N'
		blEclipse.MessageBox( Title, 'No puede Ingresar más de ' + String(il_cantidad) + ' Beneficiarios.', Exclamation! )
		Return
	end if
	
	if ls_pasa='S' then
		for ll_indi=1 to ll_tot_reg
			ll_rut			= f_Zero( dw_list.getitemnumber(ll_indi,'rut') )
			ls_dv				= UpperTrim( dw_list.getitemstring(ll_indi,'dv') )
			ls_nombre		= UpperTrim( dw_list.getitemstring(ll_indi,'nombre') )
			ls_ap_pat		= UpperTrim( dw_list.getitemstring(ll_indi,'a_paterno') )
			ls_ap_mat		= UpperTrim( dw_list.getitemstring(ll_indi,'a_materno') )
			ls_parent		= UpperTrim( dw_list.getitemstring(ll_indi,'parentesco') )
			ldt_fec_nac		= dw_list.getitemdatetime(ll_indi,'fecha_nac')
			ls_tipo_via		= UpperTrim( dw_list.getitemstring(ll_indi,'tipo_via') )
			ls_direc			= UpperTrim( dw_list.getitemstring(ll_indi,'direccion_p') )
			ls_nro_part		= UpperTrim( dw_list.getitemstring(ll_indi,'numero_p') )
			ls_depto_p		= UpperTrim( dw_list.getitemstring(ll_indi,'depto_p') )
			ls_block_p		= UpperTrim( dw_list.getitemstring(ll_indi,'block_p') )
			ls_ciudad		= UpperTrim( dw_list.getitemstring(ll_indi,'ciudad') )
			ls_comuna		= UpperTrim( dw_list.getitemstring(ll_indi,'comuna') )
			ls_poblac		= UpperTrim( dw_list.getitemstring(ll_indi,'poblacion') )
			ls_sexo			= UpperTrim( dw_list.getitemstring(ll_indi,'sexo') )
			
			ls_contacto		= UpperTrim( dw_list.getitemstring(ll_indi,'contacto_nombre') )
			ls_fono			= UpperTrim( dw_list.getitemstring(ll_indi,'fono_p') )
			ls_celular		= UpperTrim( dw_list.getitemstring(ll_indi,'contacto_fono_celular') )
			
			If ls_msg = '' And ll_rut = 0 Then
				ls_msg = 'Debe Ingresar Rut Beneficiario   Reg Nº: ' +string(ll_indi)
				ls_col = 'rut'
			End If
			If ls_msg = '' And ls_dv = '' then
				ls_msg = 'Debe Ingresar Digito Verificador Beneficiario   Reg Nº: ' +string(ll_indi)
				ls_col = 'dv'
			End If
			If ls_msg = '' And ls_nombre = '' then
				ls_msg = 'Debe Ingresar Nombre Beneficiario Fila   Reg Nº: ' +string(ll_indi)
				ls_col = 'nombre'
			End If
			If ls_msg = '' And ls_ap_pat = '' then
				ls_msg = 'Debe Ingresar Apellido Paterno Beneficiario   Reg Nº: ' +string(ll_indi)
				ls_col = 'a_paterno'
			End If
			If ls_msg = '' And ls_ap_mat = '' then
				ls_msg = 'Debe Ingresar Apellido Materno Beneficiario   Reg Nº: '+string(ll_indi)
				ls_col = 'a_materno'
			End If
		/*	
		elseif isnull(il_tipo_benef) or il_tipo_benef=0 then
				blEclipse.MessageBox( Title, 'Debe Ingresar Tipo Seguro del Beneficiario   Reg Nº: ' +string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('tipo_beneficiario')
				exit
				*/
			If ls_msg = '' And ls_parent = '' then
				ls_msg = 'Debe Ingresar Parentesco Beneficiario   Reg Nº: ' +string(ll_indi)
				ls_col = 'parentesco'
			End If
			If ls_msg = '' And Not f_IsDate(ldt_fec_nac) then
				ls_msg = 'Debe Ingresar Fecha Nacimiento Beneficiario   Reg Nº: ' +string(ll_indi)
				ls_col = 'fecha_nac'
			End If
			If ls_msg = '' And ls_sexo = '' then
				ls_msg = 'Debe Ingresar Sexo   Reg Nº: ' +string(ll_indi)
				ls_col = 'sexo'
			End If
			If ls_msg = '' And ls_tipo_via = '' then
				ls_msg = 'Debe Ingresar Tipo Vía   Reg Nº: '+string(ll_indi)
				ls_col = 'tipo_via'
			End If
			If ls_msg = '' And ls_direc = '' then
				ls_msg = 'Debe Ingresar Dirección   Reg Nº: '+string(ll_indi)
				ls_col = 'direccion_p'
			End If
			If ls_msg = '' And ls_nro_part = '' then
				ls_msg = 'Debe Ingresar Número Dirección   Reg Nº: ' +string(ll_indi)
				ls_col = 'numero_p'
			End If
			If ls_msg = '' And ls_comuna = '' then
				ls_msg = 'Debe Ingresar Comuna   Reg Nº: ' +string(ll_indi)
				ls_col = 'comuna'
			End If
			If ls_msg = '' And ls_ciudad = '' then
				ls_msg = 'Debe Ingresar Ciudad   Reg Nº: ' +string(ll_indi)
				ls_col = 'ciudad'
			End If
			
			If ls_msg = '' And ls_contacto='' then
				ls_msg = 'Debe Ingresar Nombre Encargado Servicio   Reg Nº: ' + string(ll_indi)
				ls_col = 'contacto_nombre'
			End If
			If ls_msg = '' And ls_fono = '' then
				ls_msg = 'Debe Ingresar Fono Particular   Reg Nº: ' + string(ll_indi)
				ls_col = 'fono_p'
			End If
			If ls_msg = '' And ls_celular='' then
				ls_msg = 'Debe Ingresar Fono Particular   Reg Nº: ' + string(ll_indi)
				ls_col = 'contacto_fono_celular'
			End If
			
			If ls_depto_p = '' then
				dw_list.setitem(ll_indi, 'depto_p', '-')
			Elseif ls_block_p = '' then
				dw_list.setitem(ll_indi,'block_p','-')
			Elseif ls_poblac = '' then
				dw_list.setitem(ll_indi,'poblacion','-')
			End If
			
			If Not ls_msg = '' Then
				dw_list.SetFocus( ll_indi, ls_col )
				blEclipse.MessageBox( Title, ls_msg )
				Return
			End If
			dw_list.accepttext()
		Next
		
		dw_list.SetTransObject( SqlCa )
		
		Boolean	lb_OK
		
		lb_OK = wf_SaveDocument( )
		
		If lb_OK Then
			blEclipse.MessageBox( Title, 'Información de Beneficiarios ha sido guardada correctamente.')
			cb_cancelar.TriggerEvent(clicked!)
			Return
		End If

		/*
		String	ls_err
		if ls_pasa='S' then
			if dw_list.update()=1 then
				commit;
				UPDATE	PRODUCTO_BENEFICIARIO 
				SET 		USUARIO_MODIF = :gs_usuario,   
							FECHA_MODIF = :ld_hoy  
				WHERE	( BASE = :is_base ) AND  
							( SERIE = :is_serie ) AND  
							( NUMERO = :il_numero ) AND  
							( RUT = :ll_rut )
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
				else
					rollback using sqlca;
				end if
				blEclipse.MessageBox( Title, 'Información ha sido guardada correctamente.')
				cb_cancelar.TriggerEvent(clicked!)
			else
				ls_err = sqlca.sqlerrtext
				rollback;
				blEclipse.MessageBox( Title, 'Error al Guardar' + Char(13) + Char(13) + 'SQL: ' + ls_err, Exclamation!  )
			end if
		end if
		*/
	end if

end event

type cb_ingresar from uo_cbother within w_arch_mul_beneficiarios
integer x = 1298
integer y = 2532
integer taborder = 40
boolean bringtotop = true
string text = "Agregar"
end type

event clicked;call super::clicked;string		ls_pasa='N',ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_parent,ls_direc,&
			ls_nro_part,ls_ciudad,ls_comuna,ls_sexo,ls_fono,ls_depto_p,ls_block_p,ls_poblac,ls_nulo
long		ll_tot_reg,ll_indi,ll_rut,ll_new,ll_nulo,ll_folio
datetime	ldt_fec_nac,ldt_nulo

setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
dw_list.accepttext()
ll_tot_reg						= dw_list.rowcount()
if ll_tot_reg=0 then
	ll_folio						= 1	
	ll_new						= dw_list.insertrow(0)
	dw_list.scrolltorow(ll_new)
	dw_list.setitem(ll_new,'folio',ll_folio)
	dw_list.setitem(ll_new,'base',is_base)
	dw_list.setitem(ll_new,'serie',is_serie)
	dw_list.setitem(ll_new,'numero',il_numero)
	dw_list.setitem(ll_new,'tipo_beneficiario',il_tipo_benef)
	dw_list.setitem(ll_new,'fono_p',is_fono)
	dw_list.setitem(ll_new,'tipo_via',is_tipo_via)
	dw_list.setitem(ll_new,'direccion_p',is_direccion)
	dw_list.setitem(ll_new,'numero_p',is_nro_part)
	dw_list.setitem(ll_new,'depto_p',is_depto_part)
	dw_list.setitem(ll_new,'block_p',is_block_part)
	dw_list.setitem(ll_new,'ciudad',is_ciudad)
	idw_com.retrieve(is_ciudad)
	dw_list.setitem(ll_new,'comuna',is_comuna)
	dw_list.setitem(ll_new,'poblacion',is_pob)
	dw_list.setitem(ll_new,'estado_reg','V')
	dw_list.setitem(ll_new,'fecha_crea', TodayDT())
	dw_list.setitem(ll_new,'usuario_crea',gs_user)
	
	dw_list.setitem(ll_new,'rut',ll_nulo)
	dw_list.setitem(ll_new,'dv',ls_nulo)
	dw_list.setitem(ll_new,'nombre',ls_nulo)
	dw_list.setitem(ll_new,'a_paterno',ls_nulo)
	dw_list.setitem(ll_new,'a_materno',ls_nulo)
	dw_list.setitem(ll_new,'parentesco',ls_nulo)
	dw_list.setitem(ll_new,'fecha_nac',ldt_nulo)
	dw_list.setitem(ll_new,'sexo',ls_nulo)
	dw_list.setfocus()
	dw_list.setcolumn('rut')
else
	if ll_tot_reg < il_cantidad then
		ls_pasa						='S'
		for ll_indi=1 to ll_tot_reg
			ll_folio					= dw_list.getitemnumber(ll_indi,'folio')
			ll_rut						= dw_list.getitemnumber(ll_indi,'rut')
			ls_dv						= dw_list.getitemstring(ll_indi,'dv')
			ls_nombre				= dw_list.getitemstring(ll_indi,'nombre')
			ls_ap_pat				= dw_list.getitemstring(ll_indi,'a_paterno')
			ls_ap_mat				= dw_list.getitemstring(ll_indi,'a_materno')
			ls_parent					= dw_list.getitemstring(ll_indi,'parentesco')
			ldt_fec_nac				= dw_list.getitemdatetime(ll_indi,'fecha_nac')
			ls_fono					= dw_list.getitemstring(ll_indi,'fono_p')
			ls_tipo_via				= dw_list.getitemstring(ll_indi,'tipo_via')
			ls_direc					= dw_list.getitemstring(ll_indi,'direccion_p')
			ls_nro_part				= dw_list.getitemstring(ll_indi,'numero_p')
			ls_depto_p				= dw_list.getitemstring(ll_indi,'depto_p')
			ls_block_p				= dw_list.getitemstring(ll_indi,'block_p')
			ls_ciudad					= dw_list.getitemstring(ll_indi,'ciudad')
			ls_comuna				= dw_list.getitemstring(ll_indi,'comuna')
			ls_poblac					= dw_list.getitemstring(ll_indi,'poblacion')
			ls_sexo					= dw_list.getitemstring(ll_indi,'sexo')
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('rut')
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('dv')
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('nombre')
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('a_paterno')
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('a_materno')
				exit
			elseif isnull(il_tipo_benef) or il_tipo_benef=0 then
				messagebox("Advertencia","Debe Ingresar Tipo Seguro del Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('tipo_beneficiario')
				exit
			elseif isnull(ls_parent) or ls_parent='' then
				messagebox("Advertencia","Debe Ingresar Parentesco Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('parentesco')
				exit	
			elseif isnull(ldt_fec_nac) then
				messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('fecha_nac')
				exit	
			elseif isnull(ls_fono) or ls_fono='' then
				messagebox("Advertencia","Debe Ingresar Fono Particular   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('fono_p')
				exit	
			elseif isnull(ls_tipo_via) or ls_tipo_via='' then
				messagebox("Advertencia","Debe Ingresar Tipo Via   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('tipo_via')
				exit
			elseif isnull(ls_direc) or ls_direc='' then
				messagebox("Advertencia","Debe Ingresar Dirección   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('direccion_p')
				exit
			elseif isnull(ls_nro_part) or ls_nro_part='' then
				messagebox("Advertencia","Debe Ingresar Número Dirección   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('numero_p')
				exit
			elseif isnull(ls_depto_p) or ls_depto_p='' then
				messagebox("Advertencia","Debe Ingresar Departamento   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('depto_p')
				exit	
			elseif isnull(ls_block_p) or ls_block_p='' then
				messagebox("Advertencia","Debe Ingresar Block   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('block_p')
				exit	
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('ciudad')
				exit
			elseif isnull(ls_comuna) or ls_comuna='' then
				messagebox("Advertencia","Debe Ingresar Comuna   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('comuna')
				exit
			elseif isnull(ls_poblac) or ls_poblac='' then
				messagebox("Advertencia","Debe Ingresar Villa o Población   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('poblacion')
				exit	
			elseif isnull(ls_sexo) or ls_sexo='' then
				messagebox("Advertencia","Debe Ingresar Sexo   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_list.setfocus()
				dw_list.scrolltorow(ll_indi)
				dw_list.setcolumn('sexo')
				exit
			end if
		next
		
		if ls_pasa='S' then
//			SELECT	max("FOLIO")  
//    			INTO		:ll_folio  
//    			FROM		"PRODUCTO_BENEFICIARIO"  
//  			WHERE 	( "PRODUCTO_BENEFICIARIO"."BASE" = :is_base ) AND  
//         				( "PRODUCTO_BENEFICIARIO"."SERIE" = :is_serie ) AND  
//         				( "PRODUCTO_BENEFICIARIO"."NUMERO" = :il_numero ) AND  
//         				( "PRODUCTO_BENEFICIARIO"."ESTADO_REG" = 'V' )
//			USING	sqlca;
//			if isnull(ll_folio) or ll_folio=0 then ll_folio=0
			ll_folio					= ll_folio + 1	
			ll_new					= dw_list.insertrow(0)
			dw_list.scrolltorow(ll_new)
			dw_list.setitem(ll_new,'folio',ll_folio)
			dw_list.setitem(ll_new,'base',is_base)
			dw_list.setitem(ll_new,'serie',is_serie)
			dw_list.setitem(ll_new,'numero',il_numero)
			dw_list.setitem(ll_new,'tipo_beneficiario',il_tipo_benef)
			dw_list.setitem(ll_new,'fono_p',is_fono)
			dw_list.setitem(ll_new,'tipo_via',is_tipo_via)
			dw_list.setitem(ll_new,'direccion_p',is_direccion)
			dw_list.setitem(ll_new,'numero_p',is_nro_part)
			dw_list.setitem(ll_new,'depto_p',is_depto_part)
			dw_list.setitem(ll_new,'block_p',is_block_part)
			dw_list.setitem(ll_new,'ciudad',is_ciudad)
			idw_com.retrieve(is_ciudad)
			dw_list.setitem(ll_new,'comuna',is_comuna)
			dw_list.setitem(ll_new,'poblacion',is_pob)
			dw_list.setitem(ll_new,'estado_reg','V')
			dw_list.setitem(ll_new,'fecha_crea', TodayDT())
			dw_list.setitem(ll_new,'usuario_crea',gs_user)
			
			dw_list.setitem(ll_new,'rut',ll_nulo)
			dw_list.setitem(ll_new,'dv',ls_nulo)
			dw_list.setitem(ll_new,'nombre',ls_nulo)
			dw_list.setitem(ll_new,'a_paterno',ls_nulo)
			dw_list.setitem(ll_new,'a_materno',ls_nulo)
			dw_list.setitem(ll_new,'parentesco',ls_nulo)
			dw_list.setitem(ll_new,'fecha_nac',ldt_nulo)
			dw_list.setitem(ll_new,'sexo',ls_nulo)
			dw_list.setfocus()
			dw_list.setcolumn('rut')
		end if
	else
		messagebox("Advertencia","No puede Ingresar más de "+string(il_cantidad)+' Beneficiarios')
	end if
end if
end event

type cb_eliminar from uo_cbother within w_arch_mul_beneficiarios
integer x = 1669
integer y = 2532
integer taborder = 50
boolean bringtotop = true
string text = "Eliminar"
end type

event clicked;call super::clicked;
long		ll_resp,ll_tot_reg,ll_indi,ll_folio
string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_nom_comp


dw_list.accepttext()
if Not ( il_row_eli > 0 and dw_list.rowcount()>0 ) then
	Return
End If

ls_nombre						= dw_list.getitemstring(il_row_eli,'nombre')
ls_ap_pat						= dw_list.getitemstring(il_row_eli,'a_paterno')
ls_ap_mat						= dw_list.getitemstring(il_row_eli,'a_materno')
ls_nom_comp					= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
ll_resp							= blEclipse.MessageBox( Title, "¿Está Seguro Eliminar Beneficiario Nº "+string(il_row_eli)+ ' ' +ls_nom_comp+"?" + Char(13) + &
															"(Recuerde Guardar antes de cerrar esta ventana)", Question!, YesNo!, 2)
if ll_resp = 1 then
	dw_list.setitem(il_row_eli,'estado_reg','A')
	dw_list.setitem(il_row_eli,'fec_elimina', TodayDT())
	dw_list.setitem(il_row_eli,'usuario_elimina',gs_usuario)
	dw_list.accepttext()
	if dw_list.update()=1 then
		commit;
		ll_tot_reg				= dw_list.retrieve( mp.Base, mp.Serie, mp.Numero )
		for ll_indi=1 to ll_tot_reg
			ll_folio				= dw_list.getitemnumber(ll_indi,'folio')
			dw_list.setitem(ll_indi,'folio',ll_indi)
			dw_list.accepttext()
		next
		if dw_list.update()=1 then
			commit;
			blEclipse.Messagebox( Title, "Registro Eliminado")
		else
			rollback;
		end if
	else
		rollback;
		blEclipse.Messagebox( Title,"Error al guardar SQL: "+sqlca.sqlerrtext)
	end if
end if

end event

type cbx_serv from checkbox within w_arch_mul_beneficiarios
integer x = 114
integer y = 2540
integer width = 443
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Detallar Servicios"
end type

event clicked;

If Checked Then Parent.Width = il_WidthMax
If Not Checked Then Parent.Width = il_WidthMin

end event

