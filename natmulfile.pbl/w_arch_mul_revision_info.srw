//objectcomments Autor: César Vilela R.~r~nFunción: Edición de contratos MultiProducto
forward
global type w_arch_mul_revision_info from w_gen_document_doc
end type
type dw_obs from uo_dw_list within w_arch_mul_revision_info
end type
type dw_seg from uo_dw_list within w_arch_mul_revision_info
end type
type dw_rez from uo_dw_list within w_arch_mul_revision_info
end type
end forward

global type w_arch_mul_revision_info from w_gen_document_doc
integer width = 5202
integer height = 2680
string title = "Revisión del Contrato"
boolean ib_fulllist = true
boolean ib_cbexcel = false
boolean ib_cbdelete = false
boolean ib_cbprint = false
boolean ib_cbadd = false
boolean ib_cbshare = false
boolean ib_cbrefresh = true
boolean ib_permitemod = true
boolean ib_new = true
event postopen ( )
dw_obs dw_obs
dw_seg dw_seg
dw_rez dw_rez
end type
global w_arch_mul_revision_info w_arch_mul_revision_info

type variables

Boolean	ib_det = False
Integer	ii_idx = 0
Long		il_y, il_H, il_yAmp, il_HAmp, il_YCon, il_HCon
DateTime	id_ini, id_fin 

String	is_doc, is_dir, &
			is_cli, is_cto 

DataWindowChild	idwc_ser
MP	mp
end variables

forward prototypes
public function integer wf_new ()
public function integer wf_config ()
public function integer wf_opendoc (string as_cto, double an_rut, integer an_par, string as_db)
public function boolean wf_savedocument ()
public function decimal wf_total ()
public function decimal wf_totalseguros ()
public function decimal wf_actualizaxmoneda (string as_mdaori, string as_mdanew)
end prototypes

public function integer wf_new ();
ib_new = True
ib_saved = True

is_emp = gs_emp

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )

idwc_ser.Reset( )

dw_list.Reset( )
dw_list.SetTransObject( SqlCa )

dw_1.InsertRow(0)
dw_1.SetFocus( )
/*
dw_1.Object.c_codigo_cli[ 1] = ' '
dw_1.Object.v_nombre_cli[ 1] = ' '
dw_1.Object.c_codigo_cto[ 1] = ' '

//wf_RutMask( 'c_codigo_cli' )

dw_1.AcceptText( )
dw_1.SetColumn( 'c_codigo_cli' ) 
*/
Return 1
end function

public function integer wf_config ();


dw_1.SetObjectcolor( {'barra','rut', 'nombrecliente', 'dv'}, 'o' )
dw_1.SetObjectColor( 'cod_parque', 'ba' )

dw_1.SetObjectcolor( { 'Forma_pago', 'Moneda', 'liberador_annos' }, 'eVerde' )

dw_1.SetObjectcolor( { 'saldo_financiar', 'valor_cuota', 'pie'}, 'o' )

dw_1.ColEnabled( {'Barra', 'Edad', 'DV', 'NomCliente'}, False ) 


dw_1.ColEnabled( { 'estado_revision', 'valor_cuota', 'factor_cuota', 'valor_cuota_mant', 'derecho_especial', 'reduccion', &
						'pie', 'pie_minimo', 'precio', 'total_valor_cuota', 'liberador_annos', 'saldo_financiar', 'importeiva', 'capacidad_cre' }, False )

dw_seg.Title = This.Title


dw_1.GetChild( 'codigo_servicio', idwc_ser )
idwc_ser.SetTransObject( SqlCa )

Return 1
end function

public function integer wf_opendoc (string as_cto, double an_rut, integer an_par, string as_db);
DataWindowChild	ldwc_x
Int		li_ret, li_edo
String	ls_pro


//an_Rut = 11948769

dw_1.SetRedraw( False )
dw_1.SetTransObject( Sqlca )
li_ret = dw_1.Retrieve( as_Cto, an_rut, an_Par, 'REV', as_DB )

If li_ret > 0 Then
	ls_pro = f_Trim(dw_1.Object.Cod_Producto[ 1])
Else
	dw_1.InsertRow( 1 )
End If

dw_1.GetChild( 'tipo_producto', ldwc_x )
ldwc_x.SetTransObject( Sqlca )
ldwc_x.SetFilter( 'Cod_Producto = "' + ls_pro + '"')
ldwc_x.Filter( )
If ldwc_x.Rowcount( ) = 0 Then
	ldwc_x.Insertrow( 0 )
End If

dw_1.GetChild( 'area', ldwc_x )
ldwc_x.SetTransObject( Sqlca )
ldwc_x.Retrieve( an_Par, ls_pro )
If ldwc_x.Rowcount( ) = 0 Then
	ldwc_x.Insertrow( 0 )
End If

li_edo = f_Zero( dw_1.Object.ult_estado[ 1] )
If li_edo = 11 Then
	blEClipse.Messagebox( Title, 'Contrato ' + as_Cto + ' se encuentra Digitado.' + Char(13) + Char(13)+ &
								'No se puede modificar.', Exclamation!)
	dw_1.ColEnabled( False )
	dw_seg.ReadOnlyDW( True )
End If

Long		ll_nro
String	ls_rev, ls_rch, ls_bas, ls_ser

ls_bas = UpperTrim( dw_1.Object.Base[ 1] )
ls_ser = UpperTrim( dw_1.Object.Serie[ 1] )
ll_nro = f_Zero( dw_1.Object.Numero[ 1] )
ls_rev = UpperTrim( dw_1.Object.Estado_revision[ 1] )

Select	Rechazado
Into		:ls_rch
From		MPContrato
Where		Base = :ls_bas
And		Serie = :ls_ser
And		Numero = :ll_nro 
Using		SqlCa ;

ls_rch = UpperTrim( ls_rch )
If ls_rch = '1' Or ls_rev = 'R' Then
	blEClipse.Messagebox( Title, 'Contrato ' + as_Cto + ' se encuentra Rechazado.' + Char(13) + Char(13)+ &
								'No se puede modificar.', Exclamation!)
	//dw_1.ColEnabled( False )
	dw_seg.ReadOnlyDW( True )
End If


li_ret = dw_obs.Retrieve( as_Cto, an_rut, an_Par, 'OBS', as_DB )
li_ret = dw_seg.Retrieve( as_Cto, an_rut, an_Par, 'SEG', as_DB )
li_ret = dw_rez.Retrieve( as_Cto, an_rut, an_Par, 'REZ', as_DB )
li_ret = dw_list.Retrieve( as_Cto, an_rut, an_Par, 'CAD', as_DB )


// CVilela: 07/Jun/2025 - Actualiza DDDW Servicio
Integer	li_CMP, li_cap
String	ls_uso, ls_mda, ls_SSrv

li_CMP = dw_1.Object.codigoMP[ 1] 
ls_uso = dw_1.Object.Uso[ 1]
ls_mda = dw_1.Object.Moneda[ 1]
li_cap = dw_1.Object.Capacidad_Cre[ 1]

/* Buscar la Serie de Serivicio del MultiProducto para Cremación (Base G en Hijo)si es el caso */
	Select Max( det.serieServicio )
	Into   :ls_ssrv
	From   MPproducto    Cab
	Left Join MPproductoDet det
	On     Cab.codigoMP = det.codigoMP
	Where  cab.codigoMP = :li_CMP
	And    det.Base = 'G' ;

dw_1.GetChild( 'codigo_servicio', idwc_ser )
idwc_ser.SetTransObject( Sqlca )
li_ret = idwc_ser.Retrieve( an_Par, ls_Uso, ls_SSrv, ls_Mda, li_cap )



// CVilela: 07/Jun/2025 - Configura Seguro en caso de Mostrar Servicio
Int	li_mserv, li_Height

li_mserv = f_Zero( dw_1.Object.MostrarServicio[ 1] )
dw_1.ColEnabled( 'codigo_servicio', ( li_mserv = 1 ) )	
dw_1.ColEnabled( 'Capacidad_Cre', False )
li_Height = Integer( dw_1.Object.gb_seg.Height )
li_Height = f_Zero( li_Height )

If li_mserv = 1 Then
	dw_seg.Height = li_Height - Integer( dw_1.Object.gb_srv.Height ) - 25
End If
If Not li_mserv = 1 Then
	dw_seg.Height = li_Height - 25
End If



dw_1.SetRedraw( True )
dw_1.SetFocus( 'Rut' )

Return 1

end function

public function boolean wf_savedocument ();
Integer	li_par, li_eda, li_nil, li_CMP, row
Long		ll_nro, ll_rut
DateTime	ld_nac
String	ls_bar, ls_bas, ls_ser, ls_Dv, &
			ls_col, ls_msg


dw_1.Accepttext( )

SetNull( li_nil )
row = 1

ls_bar = UpperTrim( dw_1.Object.Barra[ row] )
ls_bas = UpperTrim( dw_1.Object.Base[ row] )
ls_ser = UpperTrim( dw_1.Object.Serie[ row] )
ll_nro = f_Zero( dw_1.Object.Numero[ row] )
li_par = f_Zero( dw_1.Object.Cod_Parque[ row] )
ll_rut = f_Zero( dw_1.Object.Rut[ row] )
ls_DV  = UpperTrim( dw_1.Object.DV[ row] )
ld_nac = dw_1.Object.Fecha_nac[ row]
li_eda = f_Zero( dw_1.Object.Edad[ row] )
li_CMP = f_Zero( dw_1.Object.CodigoMP[ row] )

If ls_msg = '' And ls_bar = '' Then
	ls_col = 'Barra'
	ls_msg = 'Debe seleccionar nuevo Contrato a Revisión.'
End If

If ls_msg = '' And li_par = 0 Then
	ls_col = 'Cod_Parque'
	ls_msg = 'Debe seleccionar Parque.'
End If

If ls_msg = '' And li_CMP = 0 Then
	ls_col = 'CodigoMP'
	ls_msg = 'Debe seleccionar MultiProducto.'
End If

If ls_msg = '' And ll_rut = 0 Then
	ls_col = 'Rut'
	ls_msg = 'Debe ingresar el RUT del cliente.'
End If

If ls_msg = '' And ls_DV = '' Then
	ls_col = 'Rut'
	ls_msg = 'Dígito verificador del RUT no es válido.'
End If

If ls_msg = '' And Not f_IsDate( ld_nac ) Then
	ls_col = 'Fecha_nac'
	ls_msg = 'Fecha de nacimiento es inválida.'
End If

If ls_msg = '' And li_eda < 18 Then
	ls_col = 'Fecha_nac'
	ls_msg = 'No se puede establecer contrato con menor de edad.' + Char(13) + 'Debe ingresar Fecha de nacimiento válida.'
End If


DateTime	ld_Fecha_Ctto

ld_Fecha_Ctto  = dw_1.Object.Fecha_Ctto[ row]  

If ls_msg = '' And Not f_IsDate( ld_Fecha_Ctto ) Then
	ls_col = 'Fecha_Ctto'
	ls_msg = 'Para poder continuar debe ingresar la fecha de contrato.'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If



Dec		ln_Renta_Liquida, ln_UF_Fecha_Ctto, ln_Capacidad, ln_Pie, ln_Plazo, ln_Gasto_Adm, ln_Precio, ln_Derecho_Especial, ln_Valor_Cuota_Mant, &
			ln_Saldo_Financiar, ln_Valor_Cuota, ln_Precio_Contrato, ln_Factor_Cuota, ln_Dias_Vencimiento_Prim, ln_Pie_Minimo, ln_Reduccion, &
			ln_Numero_Asoc, ln_Codigo_Servicio, ln_Tipo_Beneficiarios, ln_Liberador_Annos, ln_Descto_Liber, ln_Nueva_Capac, ln_Periodo_Mant, &
			ln_SW_Activa_Servicio, ln_Folio_FA, ln_Tipo_Producto, ln_ImporteIVA 
DateTime  ld_Fecha_Prim, ld_Fecha_Crea, ld_Fecha_Factor_Vigente, ld_Fecha_Activacion           
String    ls_Moneda,   ls_Forma_Pago, ls_Area, ls_Tipo_Sepult, ls_Uso, ls_Observacion, ls_Estado_Revision, ls_Usuario_Crea, ls_Base_Asoc, ls_Serie_Asoc, & 
			ls_Comprobante_Titular, ls_Origen_Venta, ls_Canal_Venta, ls_Seguros, ls_Observaciones

ln_Renta_Liquida          = f_Zero( dw_1.Object.Renta_Liquida        [ row] )
ln_UF_Fecha_Ctto          = dw_1.Object.UF_Fecha_Ctto        [ row]  
ls_Moneda                 = dw_1.Object.Moneda               [ row]  
ls_Forma_Pago             = UpperTrim( dw_1.Object.Forma_Pago           [ row] )
ls_Area                   = dw_1.Object.Area                 [ row]  
ls_Tipo_Sepult            = dw_1.Object.Tipo_Sepult          [ row]  
ln_Capacidad              = dw_1.Object.Capacidad            [ row]  
ls_Uso                    = dw_1.Object.Uso                  [ row]  
ln_Pie                    = dw_1.Object.Pie                  [ row]  
ln_Plazo                  = f_Zero( dw_1.Object.Plazo                [ row] ) 
ld_Fecha_Prim             = dw_1.Object.Fecha_Prim           [ row]  
ln_Gasto_Adm              = dw_1.Object.Gasto_Adm            [ row]  
ln_Precio                 = dw_1.Object.Precio               [ row]  
ln_Derecho_Especial       = dw_1.Object.Derecho_Especial     [ row]  
ln_Valor_Cuota_Mant       = dw_1.Object.Valor_Cuota_Mant     [ row]  
ln_Saldo_Financiar        = dw_1.Object.Saldo_Financiar      [ row]  
ln_Valor_Cuota            = dw_1.Object.Valor_Cuota          [ row]  
ls_Observacion            = dw_1.Object.Observacion          [ row]  
ls_Estado_Revision        = dw_1.Object.Estado_Revision      [ row]  
ls_Usuario_Crea           = UpperTrim( dw_1.Object.Usuario_Crea         [ row])
ld_Fecha_Crea             = dw_1.Object.Fecha_Crea           [ row]  
If ls_Usuario_Crea = '' Then
	ls_Usuario_Crea = gs_usuario
	ld_Fecha_Crea = TodayDT()
	dw_1.Object.Usuario_Crea         [ row] = ls_Usuario_Crea
	dw_1.Object.Fecha_Crea         [ row] = ld_Fecha_Crea
End If

ln_Precio_Contrato        = dw_1.Object.Precio_Contrato      [ row]  
ln_Factor_Cuota           = dw_1.Object.Factor_Cuota         [ row]  
ln_Dias_Vencimiento_Prim  = dw_1.Object.Dias_Vencimiento_Prim[ row]  
ln_Pie_Minimo             = dw_1.Object.Pie_Minimo           [ row]  
ln_ImporteIVA             = dw_1.Object.ImporteIVA           [ row]  
ld_Fecha_Factor_Vigente   = dw_1.Object.Fecha_Factor_Vigente [ row]  
ln_Reduccion              = dw_1.Object.Reduccion            [ row]  
ls_Base_Asoc              = dw_1.Object.Base_Asoc            [ row]  
ls_Serie_Asoc             = dw_1.Object.Serie_Asoc           [ row]  
ln_Numero_Asoc            = dw_1.Object.Numero_Asoc          [ row]  
ls_Comprobante_Titular    = dw_1.Object.Comprobante_Titular  [ row]  
ls_Origen_Venta           = UpperTrim( dw_1.Object.Origen_Venta      [ row] ) 

Integer	li_MServ

li_MServ                  = f_Zero( dw_1.Object.MostrarServicio      [ row] ) 
ln_Codigo_Servicio        = f_Zero( dw_1.Object.Codigo_Servicio      [ row] ) 
ln_Tipo_Beneficiarios     = f_Zero( dw_1.Object.Tipo_Beneficiarios   [ row] )
ln_Liberador_Annos        = dw_1.Object.Liberador_Annos      [ row]  
//ln_Descto_Liber           = dw_1.Object.Descto_Liber         [ row]  
//ln_Nueva_Capac            = dw_1.Object.Nueva_Capac          [ row]  
//ln_Periodo_Mant           = dw_1.Object.Periodo_Mant         [ row]  
ls_Canal_Venta            = UpperTrim( dw_1.Object.Canal_Venta          [ row] ) 

ln_SW_Activa_Servicio     = dw_1.Object.SW_Activa_Servicio   [ row] 
ln_Folio_FA               = dw_1.Object.Folio_FA             [ row]  
ld_Fecha_Activacion       = dw_1.Object.Fecha_Activacion     [ row]  

ln_Tipo_Producto          = dw_1.Object.Tipo_Producto        [ row]  
ls_Seguros                = ''//dw_1.Object.Seguros              [ row]  
ls_Observaciones          = ''//dw_1.Object.Observaciones        [ row]  


If ls_msg = '' And ln_Renta_Liquida <= 0 Then
	ls_col = 'Renta_Liquida'
	ls_msg = 'Debe ingresar Renta Líquida.'
End If

If ls_msg = '' And ln_uf_fecha_ctto <= 0 Then
	ls_col = 'uf_fecha_ctto'
	ls_msg = 'Debe ingresar UF de la fecha del contrato.'
End If

If ls_msg = '' And ls_estado_revision = '' Then
	ls_col = 'Estado_revision'
	ls_msg = 'Debe seleccionar Estado Revisión del contrato.'
End If

If ls_msg = '' And ls_Moneda = '' Then
	ls_col = 'Moneda'
	ls_msg = 'Debe seleccionar Moneda del contrato.'
End If

If ls_msg = '' And ls_Forma_Pago = '' Then
	ls_col = 'Forma_Pago'
	ls_msg = 'Debe seleccionar Forma de Pago del contrato.'
End If


If ls_msg = '' And li_MServ = 1 Then
	If ls_msg = '' And ln_Tipo_Beneficiarios = 0 Then
		ls_col = 'Tipo_Beneficiarios'
		ls_msg = 'Debe seleccionar Tipo Beneficiarios.'
	End If
	If ls_msg = '' And ln_Codigo_Servicio = 0 Then
		ls_col = 'Codigo_Servicio'
		ls_msg = 'Debe seleccionar Servicio.'
	End If
End If

If ls_msg = '' And ln_capacidad <= 0 Then
	ls_col = 'Capacidad'
	ls_msg = 'Debe Ingresar Capacidad.'
End If

If ls_msg = '' And ls_canal_venta = '' Then
	ls_col = 'Canal_venta'
	ls_msg = 'Debe seleccionar Canal venta.'
End If

If ls_msg = '' And ls_origen_venta = '' Then
	ls_col = 'Origen_venta'
	ls_msg = 'Debe seleccionar Origen venta.'
End If

If ls_msg = '' And ln_Plazo <= 0 Then
	If Not ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
		ls_col = 'Plazo'
		ls_msg = 'Debe Ingresar Plazo.'
	End If
	If ln_Plazo < 0 And ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
		ln_Plazo = 0
	End If
End If

If ls_msg = '' And ln_Plazo > 0 And Not ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
	If Not f_IsDate( ld_Fecha_Prim ) Then
		ls_col = 'Fecha_Prim'
		ls_msg = 'Debe Ingresar Fecha Primer Vencimiento.'
	End If
	If f_IsDate( ld_Fecha_Prim ) And ld_Fecha_Prim < ld_Fecha_Ctto Then
		ls_col = 'Fecha_Prim'
		ls_msg = 'Fecha Primer Vencimiento debe ser mayor a Fecha de Contrato.'
	End If
End If

If ls_msg = '' And ln_Precio <= 0 Then
	ls_col = 'Precio'
	ls_msg = 'Debe Ingresar Precio.'
End If

If ls_msg = '' And ln_Precio_Contrato <= 0 Then
	ls_col = 'Precio_Contrato'
	ls_msg = 'Debe Ingresar Precio Contrato.'
End If

If ls_msg = '' And ln_Valor_Cuota <= 0 Then
	ls_col = 'Valor_Cuota'
	ls_msg = 'Debe Ingresar Valor Cuota.'
End If


Dec	ln_PorcentajePie, ln_min
ln_PorcentajePie          = f_Zero( dw_1.Object.PorcentajePie        [ row] )

If ls_msg = '' Then
	Select	PorcentajePie
	Into		:ln_min
	From		mpProducto
	Where		CodigoMP = :li_cmp
	Using		SqlCa ;
	
	ln_min = f_Zero( ln_min )
	If ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
		If ln_PorcentajePie > 0 And ln_PorcentajePie < ln_min Then
			ls_msg = 'Porcentaje Pie ingresado es menor al Porcentaje Pié mínimo de ' + String( ln_min, '##0.00' ) + '%.'
			ls_col = ''
		End If
		If ln_PorcentajePie > 100 Then
			ls_msg = 'Porcentaje Pie ingresado no puede ser mayor al 100%.'
			ls_col = 'PorcentajePie'
		End If
	End If
	If Not ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
		If ln_PorcentajePie < ln_min Or ln_PorcentajePie > 100 Then
			ls_msg = 'Porcentaje Pie ingresado no puede ser menor al Porcentaje Pié mínimo de ' + String( ln_min, '##0.00' ) + '% ni mayor al 100%.'
			ls_col = 'PorcentajePie'
		End If
	End If
End If

If ls_msg = '' And li_MServ = 1 Then
	If IsNull( ln_SW_Activa_Servicio ) Then
		ln_SW_Activa_Servicio = 1
		SetNull( ld_Fecha_Activacion )
	Else
		If ln_SW_Activa_Servicio = 0 And Not f_IsDate( ld_Fecha_Activacion ) Then
			ls_col = 'Fecha_Activacion'
			ls_msg = 'Debe ingresar le fecha de Activación de Servicio'	
		End If
	End If
End If


If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	If Not ls_col = '' Then
		dw_1.SetFocus( ls_col )
		Return False
	End If
End If

ls_msg = '' 



String	ls_cod_age, ls_cod_sup, ls_cod_jef

ls_cod_age = UpperTrim( dw_1.Object.Cod_Age[ row] )
ls_cod_sup = UpperTrim( dw_1.Object.Cod_Sup[ row] )
ls_cod_jef = UpperTrim( dw_1.Object.Cod_Jef[ row] )

If ls_msg = '' And ls_cod_age = '' Then
	ls_col = 'Cod_Age'
	ls_msg = 'Debe ingresar Código de Agente.'
End If

If ls_msg = '' And ls_cod_sup = '' Then
	ls_col = 'Cod_Sup'
	ls_msg = 'Debe ingresar Código de Supervisor.'
End If

If ls_msg = '' And ls_cod_jef = '' Then
	ls_col = 'Cod_Jef'
	ls_msg = 'Debe ingresar Código de Jefe de Venta.'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If


Integer	li_ret
String	ls_gen, ls_edo


uo_DataStore	lds_gen
f_CreateDS( lds_gen, 'd_arch_mul_revision_info_save', SqlCa )

SetMicrohelp( 'Guardando Revisión del Contrato ' + ls_Bar )
li_ret = lds_gen.Retrieve( li_par, ls_bas, ls_ser, ll_nro, ll_rut, ls_DV, ld_nac, li_eda, &
				ln_Renta_Liquida, ld_Fecha_Ctto &       
				, ln_UF_Fecha_Ctto, ls_Moneda, ls_Forma_Pago, ls_Area, ls_Tipo_Sepult, ln_Capacidad, ls_Uso, ln_Pie, ln_Plazo, ld_Fecha_Prim, ln_Gasto_Adm &
				, ln_Precio, ln_Derecho_Especial, ln_Valor_Cuota_Mant, ln_Saldo_Financiar, ln_Valor_Cuota, ls_Observacion, ls_Estado_Revision, ls_Usuario_Crea &
				, ld_Fecha_Crea, ln_Precio_Contrato, ln_Factor_Cuota, ln_Dias_Vencimiento_Prim, ln_Pie_Minimo, ld_Fecha_Factor_Vigente, ln_Reduccion &
				, ls_Base_Asoc, ls_Serie_Asoc, ln_Numero_Asoc, ls_Comprobante_Titular, ls_Origen_Venta, ln_Codigo_Servicio, ln_Tipo_Beneficiarios &
				, ln_Liberador_Annos, ln_Descto_Liber, ln_Nueva_Capac, ln_Periodo_Mant, ls_Canal_Venta, ln_SW_Activa_Servicio, ln_Folio_FA, ld_Fecha_Activacion &    
				, ln_Tipo_Producto, ls_Seguros, ls_Observaciones, li_CMP, ls_cod_age, ls_cod_sup, ls_cod_jef, ln_PorcentajePie, ln_ImporteIVA )

If li_ret > 0 Then
	ls_gen = f_Trim( lds_gen.Object.CodigoGenerado[ 1] )
	ls_edo = f_Trim( lds_gen.Object.Estado[ 1] )
	ls_msg = f_Trim( lds_gen.Object.MensajeResultado[ 1] )
Else
	ls_gen = '-2'
	ls_edo = 'ERR'
	ls_msg = lds_gen.is_ErrText
End If
	
If ls_edo = 'ERR' Or ls_edo = 'ERC' Then
//	dw_1.Object.Estado[ i] = ls_edo
//	dw_1.Object.MensajeResultado[ i] = ls_msg
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If


uo_DataStore	lds_seg
f_CreateDS( lds_seg, 'd_arch_mul_revision_info_save_seg', SqlCa )

SetMicrohelp( 'Guardando Seguros de Revisión del Contrato ' + ls_Bar )
Integer	i, li_seg, li_reg
Dec		ln_factorseg, ln_Folio_Seguro
String	ls_Estado_Seguro
dw_seg.AcceptText( )

For i = 1 To dw_seg.RowCount( )
	li_seg = f_Zero( dw_seg.Object.cod_seguro[ i] )
	li_reg = f_Zero( dw_seg.Object.estado_reg[ i] )
	If li_reg = 1 Then li_reg = 0 Else li_reg = 1
	
	If ls_Moneda = '1' Then
		ln_factorSeg = f_Zero( dw_seg.Object.factor_peso[ i] )
	Else
		ln_factorSeg = f_Zero( dw_seg.Object.factor_prima[ i] )
	End If

	ln_Folio_Seguro = f_Zero( dw_seg.Object.Folio_Seguro[ i] )
	ls_Estado_Seguro = UpperTrim( dw_seg.Object.Estado_Seguro[ i] )
	If ls_Estado_Seguro = '' Then ls_Estado_Seguro = 'A'
	
	li_ret = lds_seg.Retrieve( ls_bas, ls_ser, ll_nro, li_seg, ln_factorSeg, li_reg, ln_Folio_Seguro, ls_Estado_Seguro, ls_Moneda, ls_Forma_Pago, &
										gs_usuario, ld_Fecha_Crea )
	
	If li_ret > 0 Then
		ls_gen = f_Trim( lds_seg.Object.CodigoGenerado[ 1] )
		ls_edo = f_Trim( lds_seg.Object.Estado[ 1] )
		ls_msg = f_Trim( lds_seg.Object.MensajeResultado[ 1] )
	Else
		ls_gen = '-2'
		ls_edo = 'ERR'
		ls_msg = lds_seg.is_ErrText
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
	//dw_1.Object.CodigoGenerado[ i] = ls_gen
	//dw_1.Object.Estado[ i] = ls_edo
	//dw_1.Object.MensajeResultado[ i] = ls_msg
End If

SetMicrohelp( 'Listo' )
dw_1.AcceptText( )
ib_saved = True

Long	ll_fnd
If IsValid( w_arch_mul_revision ) Then
	ll_fnd = w_arch_mul_revision.dw_list.Find( 'Barra = "' + ls_bar + '"' )
	If ll_fnd > 0 Then
		w_arch_mul_revision.wf_Open( )
	End If
	ll_fnd = w_arch_mul_revision.dw_list.Find( 'Barra = "' + ls_bar + '"' )
	If ll_fnd > 0 Then
		w_arch_mul_revision.dw_list.ScrollToRow( ll_fnd )
	End If
	/*
	w_arch_mul_revision.dw_list.Object.Moneda[ ll_fnd] = ls_Moneda 
	w_arch_mul_revision.dw_list.Object.Cod_Age[ row] = ls_cod_age
	w_arch_mul_revision.dw_list.Object.Cod_Sup[ row] = ls_cod_sup
	w_arch_mul_revision.dw_list.Object.Cod_Jef[ row] = ls_cod_jef
	*/
End If


blEclipse.Messagebox( Title, 'Revisión de Contrato guardado Correctamente.' , Information! )

Return True
end function

public function decimal wf_total ();
DateTime	ld_prim, ld_vigencia, ld_contrato
Dec		ln_factor, ln_factor_gasto_adm, ln_pie, ln_gasto_adm, ln_precio_contrato, ln_saldo_financiar, ln_valor_cuota, ln_factor_cuota
Int		li_plazo, li_diasvcto, li_DiasMin
String	ls_moneda, ls_base, ls_forma_pago


dw_1.AcceptText( )

ls_base			= Left( UpperTrim( dw_1.Object.Barra[ 1] ), 1 )
ls_moneda		= f_Trim( dw_1.Object.Moneda[ 1] )
ls_forma_pago	= f_Trim( dw_1.Object.Forma_pago[ 1] )

ld_prim = dw_1.Object.fecha_prim[ 1]
ld_contrato = dw_1.Object.fecha_ctto[ 1]

If Not f_IsDate( ld_contrato ) Then
	blEclipse.Messagebox( Title, 'Para poder continuar debe ingresar la fecha de contrato.', Exclamation! )
	Return -1
End If

li_DiasVcto = f_Zero( DaysAfter( Date(ld_contrato), Date(ld_prim) ) )
ld_vigencia = dw_1.Object.fecha_factor_vigente[ 1]

li_plazo = f_Zero( dw_1.Object.Plazo[ 1] )
ln_pie = f_Zero( dw_1.Object.Pie[ 1] )
// cvilela: Se sustituye el precio_contrato por el precio antes de otros càlculos e iva
 ln_precio_contrato = f_Zero( dw_1.Object.Precio_contrato[ 1] )
//ln_precio_contrato = f_Zero( dw_1.Object.Precio[ 1] )
dw_1.Object.dias_vencimiento_prim[ 1] = li_diasvcto


Select	factor,
			factor_gasto_adm
Into 		:ln_factor,
			:ln_factor_gasto_adm
From 		Factores  
Where  	Base = :ls_base 
And		Moneda = :ls_moneda 
And		fecha_vigencia = :ld_vigencia
And		:li_plazo Between nro_cuotas_inicial And nro_cuotas_final 
And  		:li_diasvcto Between dias_inicial And dias_final 
Using		SqlCa ;

If SqlCa.SqlCode = 100 Then
	Select	Dias_inicial
	Into 		:li_DiasMin
	From 		Factores  
	Where  	Base = :ls_base 
	And		Moneda = :ls_moneda 
	And		fecha_vigencia = :ld_vigencia
	And Not	Factor = 0
	And		:li_plazo Between nro_cuotas_inicial And nro_cuotas_final 
	Using		SqlCa ;
	
	Select	factor,
				factor_gasto_adm
	Into 		:ln_factor,
				:ln_factor_gasto_adm
	From 		Factores  
	Where  	Base = :ls_base 
	And		Moneda = :ls_moneda 
	And		fecha_vigencia = :ld_vigencia
	And		:li_plazo Between nro_cuotas_inicial And nro_cuotas_final 
	And  		dias_inicial = :li_DiasMin 
	Using		SqlCa ;
End If

ln_factor_cuota = ln_factor
ln_gasto_adm = ln_factor_gasto_adm * li_plazo
ln_saldo_financiar = ( ln_precio_contrato - ln_pie + ln_gasto_adm ) //* ln_factor_cuota
ln_valor_cuota = ln_saldo_financiar 
If li_plazo = 1 Then
	ln_valor_cuota = ln_saldo_financiar 
End If

If li_plazo > 1 Then
	If ( li_plazo > 1 And li_plazo <= 11 ) Or ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Or ( ln_factor_cuota = 0 ) Then 
		ln_valor_cuota = ln_valor_cuota / li_plazo
	Else
		If ln_factor_cuota > 0 Then
			ln_valor_cuota = ln_valor_cuota * ln_factor_cuota
		End If
	End If

End If

If ls_moneda = '1' Then
	ln_gasto_adm = Long( Round( ln_gasto_adm, 0 ) )
	ln_saldo_financiar = Long( Round( ln_saldo_financiar, 0 ) )
	ln_valor_cuota = Long( Round( ln_valor_cuota, 0 ) )
	//ln_factor_cuota = Long( Round( ln_factor_cuota, 0 ) )
End If

dw_1.Object.Gasto_adm[ 1] = ln_gasto_adm
dw_1.Object.Saldo_financiar[ 1] = ln_saldo_financiar
dw_1.Object.Valor_cuota[ 1] = ln_valor_cuota
dw_1.Object.Factor_cuota[ 1] = ln_factor_cuota

dw_1.Accepttext( )

Return ln_saldo_financiar
end function

public function decimal wf_totalseguros ();
Dec		ln_totseg
Long		rows 
String	ls_moneda

dw_1.Accepttext( )
dw_seg.Accepttext( )
ls_moneda = f_Trim( dw_1.Object.Moneda[ 1] )

rows = dw_seg.RowCount( )
If rows > 0 Then
	Choose Case ls_moneda
		Case '1' //Pesos
			ln_totseg = f_Zero( dw_seg.Object.total_SegPesos[ rows] )
			
		Case '2' //UF
			ln_totseg = f_Zero( dw_seg.Object.total_SegUF[ rows] )
	End Choose
End If

dw_1.Object.total_seguros[ 1] = ln_totseg
dw_1.AcceptText( )

Return ln_totseg
end function

public function decimal wf_actualizaxmoneda (string as_mdaori, string as_mdanew);
Dec		ln_UF, ln_valor_cuota, ln_Derecho, ln_pie, ln_pieMinimo, ln_precio, ln_precioCto, ln_ImporteIVA
Int		li_plazo, li_diasvcto
String	ls_moneda, ls_base


dw_1.Accepttext( )
ls_moneda = as_MdaNew
ln_UF = f_Zero( dw_1.Object.UF_fecha_ctto[ 1] )

If ln_UF = 0 Then Return 0

ln_pie			= f_Zero( dw_1.Object.Pie[ 1] )
ln_valor_cuota	= f_Zero( dw_1.Object.Valor_cuota_mant[ 1] )
ln_Derecho		= f_Zero( dw_1.Object.Derecho_Especial[ 1] )
ln_pieMinimo	= f_Zero( dw_1.Object.Pie_Minimo [ 1] )
ln_precio		= f_Zero( dw_1.Object.Precio[ 1] )
ln_precioCto	= f_Zero( dw_1.Object.Precio_Contrato[ 1] )
ln_ImporteIVA	= f_Zero( dw_1.Object.ImporteIVA[ 1] )

If As_MdaOri = '2' And ls_moneda = '1' Then
	ln_pie			= ln_pie * ln_UF
	ln_valor_cuota	= ln_valor_cuota * ln_UF
	ln_Derecho		= ln_Derecho * ln_UF
	ln_pieMinimo	= ln_pieMinimo * ln_UF
	ln_precio		= ln_precio * ln_UF
	ln_precioCto	= ln_precioCto * ln_UF
	ln_ImporteIVA	= ln_ImporteIVA * ln_UF
End If


If As_MdaOri = '1' And ls_moneda = '2' Then
	ln_pie			= ln_pie / ln_UF
	ln_valor_cuota	= ln_valor_cuota / ln_UF
	ln_Derecho		= ln_Derecho / ln_UF
	ln_pieMinimo	= ln_pieMinimo / ln_UF
	ln_precio		= ln_precio / ln_UF
	ln_precioCto	= ln_precioCto / ln_UF
	ln_ImporteIVA	= ln_ImporteIVA / ln_UF
End If

If ls_moneda = '1' Then
	ln_pie			= Long( Round( ln_pie, 0 ) )
	ln_valor_cuota	= Long( Round( ln_valor_cuota, 0 ) )
	ln_Derecho		= Long( Round( ln_Derecho, 0 ) )
	ln_pieMinimo	= Long( Round( ln_pieMinimo, 0 ) )
	ln_precio		= Long( Round( ln_precio, 0 ) )
	ln_precioCto	= Long( Round( ln_precioCto, 0 ) )
	ln_ImporteIVA	= Long( Round( ln_ImporteIVA, 0 ) )
End If

dw_1.Object.Pie[ 1] = ln_pie
dw_1.Object.Valor_cuota_mant[ 1] = ln_Valor_cuota
dw_1.Object.Derecho_Especial[ 1] = ln_Derecho
dw_1.Object.Pie_Minimo[ 1] = ln_pieMinimo
dw_1.Object.Precio[ 1] = ln_precio
dw_1.Object.Precio_Contrato[ 1] = ln_precioCto
dw_1.Object.ImporteIVA[ 1] = ln_ImporteIVA


dw_1.Accepttext( )

Return ln_precioCto
end function

on w_arch_mul_revision_info.create
int iCurrent
call super::create
this.dw_obs=create dw_obs
this.dw_seg=create dw_seg
this.dw_rez=create dw_rez
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_obs
this.Control[iCurrent+2]=this.dw_seg
this.Control[iCurrent+3]=this.dw_rez
end on

on w_arch_mul_revision_info.destroy
call super::destroy
destroy(this.dw_obs)
destroy(this.dw_seg)
destroy(this.dw_rez)
end on

event open;call super::open;
PostEvent( 'PostOpen' )
end event

event resize;call super::resize;

dw_rez.Width = dw_list.Width
end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_revision_info
integer width = 5001
integer height = 2320
string title = ""
string dataobject = "d_arch_mul_revision_info"
end type

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
DateTime	ld_nac
Integer	li_par, li_nil
String	ls_DB, ls_nil, ls_forma_pago
Dec		ln_pie, ln_precio, ln_min, ln_por, ln_precio_contrato, ln_pie_minimo
Integer	li_mp
			


SetNull( li_nil )

Choose Case dwo.Name
		
	Case 'rut'
		Integer	li_rpta
		Long		ll_rut
		String	ls_dv, ls_nom, ls_Cto
		s_parm	lstr_parm
		
		data = f_Trim( data )		
		ll_rut = Long( data )
		
		ls_Cto = This.Object.Barra[ row]
		li_par = This.Object.Cod_Parque[ row]
		ls_DB = This.Object.DB[ row]
		dw_list.Reset( )
		wf_OpenDoc( ls_Cto, ll_rut, li_Par, ls_DB )
		
		This.Object.NomCliente[ row] = ''
		
		If data = ''  Or ll_rut = 0 Then
			Return
		End If
		
		li_rpta = 1 
		Cliente Cliente
		
		Cliente.Info( ll_rut )
		
		If Not Cliente.Existe Then
			li_rpta = blEclipse.Messagebox( Parent.Title, 'RUT de Cliente no encontrado.' + Char(13) + Char(13) + &
							'¿Confirma que desea agregarlo como nuevo cliente?', Question!, YesNo! )
							
			If Not li_rpta = 1 Then
				Close( Parent )
				Return
			End If
			
			String	ls_ok			
			
			Cliente.rut = ll_rut
			Cliente.db = ls_DB
			
			FadeEffect( True )
			OpenWithParm( w_arch_mul_cliente_edit, Cliente )
			Cliente = Message.PowerObjectParm
			FadeEffect( False )
			If Not IsValid( Cliente ) Then Return
			
		End If
		
		ll_rut = Cliente.RUT
		ls_dv = Cliente.DV
		ls_nom = Cliente.nomCliente
		ld_nac = Cliente.fecha_nac
		
		Object.DV[ row] = ls_dv
		Object.NomCliente[ row] = ls_nom
		Object.Rut[ row] = ll_rut
		Object.Fecha_Nac[ row] = ld_nac		
		Object.Renta_Liquida[ row] = Cliente.RentaLiquida		
		This.Object.Edad[ row] = f_GetEdad( ld_nac )
		
		//wf_RutMask( dwo.Name )
		Return 
		
	Case 'cod_parque'
		String	ls_pro
		
		li_par = Integer( data )
		ls_pro = This.Object.Cod_Producto[ row]

		This.GetChild( 'Area', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_Par, ls_pro )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If

		AcceptText( )
		
		GoTo Servicio
		
	Case 'uso'
		
		This.Object.Canal_venta[ row] = data
		GoTo Servicio
		
	Case 'codigomp'
		uo_DataStore lds_mp
		Long		ll_ret
		
		li_par = This.Object.Cod_Parque[ row]
		ls_DB = This.Object.DB[ row]
		SetNull( ls_nil )
		f_CreateDS( lds_mp, 'd_arch_mul_preciolista_cab', SqlCa )
		ll_ret = lds_mp.Retrieve( Integer( data ), ls_nil, 'CAB', ls_DB )
		If Not ll_ret > 0 Then
			lds_mp.InsertRow( 0 )
		End If
		lds_mp.ColumnsCopy( 1, { 'cod_producto', 'uso', 'tipo_producto', 'area', 'capacidad', 'tipo_sepult', 'pie', 'reduccion', &
										'valor_cuota_mant', 'derecho_especial', 'moneda', 'porcentajepie', &
										'MostrarServicio', 'Capacidad_Cre', 'Capacidad_Fun' }, This, row )
		ls_pro = UpperTrim( lds_mp.Object.cod_producto[ 1] )
		//This.Object.Precio[ row] = lds_mp.Object.Total[ row]
		This.Object.Precio[ row] = lds_mp.Object.Precio[ row]
		This.Object.Precio_Contrato[ row] = lds_mp.Object.Precio[ row] //Total
		This.Object.Pie_minimo[ row] = lds_mp.Object.Pie[ row]
		This.Object.PorcentajePie[ row] = lds_mp.Object.PorcentajePie[ row]
		This.Object.ImporteIVA[ row] = lds_mp.Object.IVA[ row]
		This.Object.MostrarServicio[ row] = lds_mp.Object.MostrarServicio[ row]
		This.Object.liberador_annos[ row] = lds_mp.Object.Anios_liberar[ row]
		This.Object.Canal_venta[ row] = lds_mp.Object.Uso[ row]
		
		Int	li_mserv
		
		li_mserv = f_Zero( lds_mp.Object.MostrarServicio[ row] )
		If li_mserv = 1 Then
			dw_seg.Height = Integer( dw_1.Object.gb_seg.Height ) - Integer( dw_1.Object.gb_srv.Height ) - 5
		End If
		If Not li_mserv = 1 Then
			dw_seg.Height = Integer( dw_1.Object.gb_seg.Height )- 25
		End If
		
		dw_1.GetChild( 'tipo_producto', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.SetFilter( 'Cod_Producto = "' + ls_pro + '"')
		ldwc_x.Filter( )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If
	
		This.GetChild( 'Area', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_Par, ls_pro )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If
		Destroy	lds_mp
		
		DateTime	ld_contrato
		ld_contrato = dw_1.Object.fecha_ctto[ 1]

		If f_IsDate( ld_contrato ) Then
			wf_Total( )
		End If		
		ib_saved = False
		GoTo Servicio
		
	Case 'fecha_nac'
		Integer	li_edad
		
		ld_nac = DateTime( data )
		li_edad = f_GetEdad( ld_nac )
		This.Object.Edad[ row] = li_edad
		ib_saved = False
		
	Case 'fecha_ctto'
		Dec	ldc_UF
		
		ldc_UF  = f_GenTipoCambioMda( DateTime( data ), 'UF' )
		This.Object.UF_Fecha_ctto[ row] = ldc_UF
		wf_Total( )
		
	Case 'moneda'
		Integer	li_codigoMP
		String	ls_moneda, ls_xmoneda, ls_mda
		
		ls_mda = f_Trim( This.Object.Moneda.Primary[ row] )
		li_codigoMP = f_Zero( This.Object.codigoMP[ row] )
		
		ls_moneda = MP.Moneda( li_codigoMP );
		ls_xmoneda = f_Trim( data )
		
		If ls_mda = '1' And ls_xmoneda = '2' Then // Se fuerza el cambio de moneda
			ls_moneda = ls_mda
		End If
		If Not ls_moneda = ls_xmoneda Then
			wf_ActualizaxMoneda( ls_moneda, ls_xmoneda )
		End If

		wf_TotalSeguros( )
		wf_Total( )
		
		GoTo Servicio
						
	Case 'cod_age'
		String	ls_age, ls_sup, ls_jef, ls_can
		
		Object.cod_sup[ row] = ''
		Object.cod_jef[ row] = ''
		
		data = UpperTrim( data ) 
		If data = '' Then Return
		
		li_par = This.Object.Cod_Parque[ row]
		ls_age = data
		
		Select 
          age.cod_sup,
          age.canal,
          sup.cod_jefe
		Into
			 :ls_sup,
			 :ls_can,
			 :ls_jef
		From  agentes    age
		Join  supervisor sup 
		On    age.cod_sup = sup.cod_sup
		Where age.estado = 'A'
		And   age.cod_parque = :li_par
		And   age.cod_age = :ls_age ;
		
		ls_sup = UpperTrim( ls_sup )
		
		Object.cod_sup[ row] = ls_sup
		Object.cod_jef[ row] = ls_jef
		
		If ls_sup = '' Then
			blEclipse.MessageBox( Parent.Title, 'Código de Agente no encontrado para el parque ' + String( li_par ), Exclamation! )
			Object.cod_age[ row] = ''
			Return 1
		End If
		
		ib_saved = False
		AcceptText( )
		
	Case 'forma_pago'		
		li_MP = f_Zero( This.Object.codigoMP[ row] )
		ls_forma_pago = f_Trim( data )
		ln_precio = f_Zero( This.Object.Precio[ row] )
		ib_saved = False
		
		If ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
			ln_min = 0
			ln_pie = 0
		End If		
		If Not ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
			ln_min = mp.PorcentajePie( li_mp )
			ln_pie = ln_precio * ( ln_min / 100 )
		End If		
		
		This.Object.PorcentajePie[ row] = ln_min
		This.Object.Pie[ row] = ln_pie
		If ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
			This.Object.Plazo[ row] = 0
		End If		
		wf_Total( )
				
	Case 'pie'
		
		ls_forma_pago = Trim( dw_1.Object.forma_pago[ 1] )
		data = f_Trim( data )
		
		If data = '' Then
			wf_Total( )
			Return
		End If
		
		ln_pie = Dec( data )
		
		If Not ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
			ln_pie_minimo = f_Zero( dw_1.Object.Pie_minimo[ 1] )
			ln_precio_contrato = f_Zero( dw_1.Object.Precio_contrato[ 1] )
			If ln_pie < ln_pie_minimo Or ln_pie > ln_precio_contrato Then
				blEclipse.MessageBox( Parent.Title, 'Pie ingresado no puede ser menor al Pié mínimo ni mayor al precio del contrato.', Exclamation! )
				Object.Pie[ row] = li_nil
				Return 1
			End If
		End If		
			
		ib_saved = False
		wf_Total( )
				
	Case 'plazo'
		ib_saved = False
		wf_Total( )
				
	Case 'fecha_prim'
		ib_saved = False
		wf_Total( )
				
	Case 'fecha_factor_vigente'
		ib_saved = False
		wf_Total( )
				
	Case 'precio_contrato'
		ib_saved = False
		wf_Total( )
				
	Case 'porcentajepie'
		String	ls_msg, ls_col		
		ls_forma_pago = Trim( This.Object.forma_pago[ row] )
		li_mp = f_Zero( This.Object.CodigoMP[ row] )
		
		data = f_Trim( data )		
		ln_por = f_Zero( Dec( data ) )
		
		ln_min = mp.PorcentajePie( li_mp )
		
		If ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
			If ln_por < ln_min Then
				ls_msg = 'Porcentaje Pie ingresado es menor al Porcentaje Pié mínimo de ' + String( ln_min, '##0.00' ) + '%.'
				ls_col = ''
			End If
			If ln_por > 100 Then
				ls_msg = 'Porcentaje Pie ingresado no puede ser mayor al 100%.'
				ls_col = 'PorcentajePie'
			End If
		End If
		If Not ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then
			If ln_por < ln_min Or ln_por > 100 Then
				ls_msg = 'Porcentaje Pie ingresado no puede ser menor al Porcentaje Pié mínimo de ' + String( ln_min, '##0.00' ) + '% ni mayor al 100%.'
				ls_col = 'PorcentajePie'
			End If
		End If
			
		ln_precio = f_Zero( This.Object.Precio[ row] )
		This.Object.Pie[ row] = ln_precio * ( ln_por / 100 )
		wf_Total( )
		ib_saved = False
				
		If Not ls_msg = '' Then		
			If ln_por < ln_min Or ln_por > 100 Then
				blEclipse.MessageBox( Parent.Title, ls_msg, Exclamation! )
			End If
		End If
		If Not ls_col = '' Then		
			Object.PorcentajePie[ row] = li_nil
			Return 1
		End If
		
	Case 'capacidad'
		
		GoTo Servicio
		Return
			
	Case Else
		
		ib_saved = False
		
End Choose

Return


Servicio:
DateTime	ld_nil
Integer	li_CMP, li_cap, li_msrv, li_ret, li_srv
String	ls_uso, ls_ser

This.AcceptText( )
li_CMP = f_Zero( This.Object.codigoMP[ row] )
li_par = This.Object.Cod_Parque[ row]
ls_uso = This.Object.Uso[ row]
//ls_ser = This.Object.Serie[ row]
ls_Moneda = This.Object.Moneda[ row]
li_cap = This.Object.Capacidad_Cre[ row]
li_msrv = f_Zero( This.Object.MostrarServicio[ row] )
li_srv = li_nil
SetNull( ld_nil )

/* Buscar la Serie de Serivicio del MultiProducto para Cremación si es el caso */
	Select Max( det.serieServicio )
	Into   :ls_ser
	From   MPproducto    Cab
	Left Join MPproductoDet det
	On     Cab.codigoMP = det.codigoMP
	Where  cab.codigoMP = :li_CMP
	And    det.Base = 'G' ;


This.GetChild( 'codigo_servicio', idwc_ser )
idwc_ser.SetTransObject( Sqlca )
idwc_ser.Reset( )
If li_msrv = 1 Then
	li_ret = idwc_ser.Retrieve( li_Par, ls_Uso, ls_Ser, ls_Moneda, li_cap )
End If
If li_ret = 1 Then
	li_srv = idwc_ser.GetItemNumber( 1, 'codigo_servicio' )
End If


This.ColEnabled( 'Codigo_Servicio', ( li_msrv = 1 ) )
If ( li_msrv = 1 ) Then
	This.Object.Codigo_Servicio.Background.Transparency = 80
	This.Object.Codigo_Servicio.Background.Color = f_Gen_Color( 'Alegria9' )
End If
If Not ( li_msrv = 1 ) Then
	This.Object.Codigo_Servicio.Background.Transparency = 0
End If

This.ColEnabled( 'Capacidad_Cre', False ) //( f_Zero( li_cap ) > 0 ) )

This.Object.codigo_servicio[ row] = li_srv
This.Object.codigo_servicio[ row] = li_srv
This.Object.sw_activa_servicio[ row] = li_nil
If ( li_msrv = 1 ) Then This.Object.sw_activa_servicio[ row] = 1
This.Object.fecha_activacion[ row] = ld_nil
ib_saved = False

Return
end event

event dw_1::key;call super::key;
Long		ll_nil
String	ls_cod, ls_nil, ls_ok


If Not Key = KeyF3! Then Return


SetNull( ll_nil )

Choose Case GetColumnName( )
	Case 'rut' 
		Cliente Cliente
		
		Cliente.RUT = ll_nil
		Cliente.DB = This.Object.DB[ 1]
		OpenWithParm( w_mant_mul_buscar_x_nombre_cliente, Cliente )
		ls_ok = UpperTrim( Message.StringParm )
		If Not ls_ok = 'OK' Then Return
		Cliente = Message.PowerObjectParm
		dw_1.Object.RUT[ 1] = Cliente.RUT
		
		This.Event ItemChanged( 1, This.Object.RUT, String( Cliente.RUT ) )
		ib_saved = False
		
	Case 'cod_age' 
		Agente	Agente
		
		Agente.cod_age = ls_nil
		Agente.Cod_Parque = This.Object.Cod_Parque[ 1]
		Agente.DB = This.Object.DB[ 1]
		Agente.DataObject = 'd_arch_mul_agente_basica'
		Message.Stringparm = ''
		OpenWithParm( w_mant_mul_buscar_x_nombre, Agente )
		ls_ok = UpperTrim( Message.StringParm )
		If Not ls_ok = 'OK' Then Return
		Agente = Message.PowerObjectParm
		dw_1.Object.cod_age[ 1] = Agente.cod_age 
		dw_1.Object.cod_sup[ 1] = Agente.cod_sup 
		dw_1.Object.cod_Jef[ 1] = Agente.cod_Jef
		ib_saved = False
End Choose

end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

event dw_1::error;call super::error;
Return 
end event

event dw_1::dberror;call super::dberror;
Return 3
end event

event dw_1::buttonclicked;call super::buttonclicked;
//MP mp
dw_1.AcceptText( )

MP.CodigoMP	 = dw_1.Object.CodigoMP[ 1] 
MP.Barra  	 = dw_1.Object.Barra[ 1] 
MP.Base   	 = dw_1.Object.Base[ 1] 
MP.Serie  	 = dw_1.Object.Serie[ 1] 
MP.Numero	 = dw_1.Object.Numero[ 1] 
MP.RUT		 = dw_1.Object.RUT[ 1] 
MP.CodParque = dw_1.Object.Cod_Parque[ 1] 
MP.DV  	 	 = UpperTrim( dw_1.Object.DV[ 1] )
MP.DB  		 = UpperTrim( dw_1.Object.DB[ 1] )

Choose Case dwo.Name
	Case 'cb_cli'
		This.SetColumn( 'RUT' )
		This.Event Key( KeyF3!, 0 )
		
	Case 'cb_age'
		This.SetColumn( 'Cod_Age' )
		This.Event Key( KeyF3!, 0 )
		
	Case 'cb_rechazar'
		String	ls_msg
		SetNull( Message.StringParm )
		
		OpenWithParm( w_arch_mul_rechazo, mp )
		ls_msg = f_Trim( Message.StringParm )
		
		If ls_msg = 'OK' Then
			Close( Parent )
		End If
		
		
	Case 'cb_ben'
		
		MP.TipoBeneficiarios = f_Zero( dw_1.Object.Tipo_Beneficiarios[ 1] )
		MP.Capacidad = f_Zero( dw_1.Object.Capacidad_cre[ 1] )
		
		OpenWithParm( w_arch_mul_beneficiarios, mp )

	Case 'cb_pie'
		
		If f_Zero( MP.CodigoMP ) = 0 Then
			blEclipse.Messagebox( Parent.Title, 'Debe seleccionar MultiProducto para continuar.', Exclamation! )
			SetFocus( 'CodigoMP' )
			Return
		End If
		
		If Not f_IsDate( dw_1.Object.fecha_ctto[ row] ) Then
			blEclipse.Messagebox( Parent.Title, 'Debe seleccionar fecha de contrato para continuar.', Exclamation! )
			SetFocus( 'Fecha_ctto' )
			Return
		End If
		
		MP.Moneda = dw_1.Object.Moneda[ 1]
		MP.Precio = dw_1.Object.Precio[ 1]	
		MP.PorcentajePie = dw_1.Object.PorcentajePie[ 1] 
		MP.Pie = dw_1.Object.Pie[ 1]
		MP.PieMinimo = dw_1.Object.Pie_Minimo[ 1]
		MP.UF = dw_1.Object.uf_fecha_ctto[ 1]
		MP.PiePesos = MP.Pie
		If MP.Moneda = '2' Then
			MP.PiePesos = MP.Pie * MP.UF
		End If
		
		MP mpx
		OpenWithParm( w_arch_mul_revision_info_pie, mp )
		mpx = Message.PowerObjectParm
		
		If IsNull( MPx ) Then Return
		If Not IsValid( MPx ) Then Return
		
		MP = mpx
		dw_1.Object.PorcentajePie[ 1] = MP.PorcentajePie
		dw_1.Object.Pie[ 1]		= MP.Pie
		ib_saved = False
		wf_Total( )

End Choose


end event

event dw_1::editchanged;call super::editchanged;
ib_saved = False

end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_revision_info
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_revision_info
boolean visible = true
integer x = 151
integer y = 2280
integer width = 4681
integer height = 492
string dataobject = "d_arch_mul_revision_info_cad"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 90
integer ii_posdety = 15
integer ii_maxwidth = 4820
end type

event dw_list::buttonclicked;call super::buttonclicked;
Long		ll_error
String	ls_row, ls_band, ls_gru, ls_ngru, ls_ret
s_parm	lstr_parm	


Choose Case dwo.Name
		
	Case 'cb_ampliar'
		

		
	Case 'cb_cob'
		/* Nivel 1 - Grupo */
		ls_band = This.GetBandAtPointer( )
		ls_row = Mid( ls_band, Pos( ls_band, '	', 1 ) + 1 )
		row = Long( ls_row )
		
		If Not f_Zero( row ) > 0 Then Return
		
		ls_gru = UpperTrim( This.Object.c_codigo_gru[ row] )
		ls_ngru = f_Trim( This.Object.v_nombre_gru[ row] )
		
		lstr_parm.s_cad[ 1] = UpperTrim( dw_1.Object.c_codigo_emp[ 1] )
		lstr_parm.s_cad[ 2] = UpperTrim( dw_1.Object.c_codigo_cto[ 1] )
		lstr_parm.s_cad[ 3] = UpperTrim( dw_1.Object.c_codigo_cli[ 1] )
		lstr_parm.s_cad[ 4] = ls_gru
		lstr_parm.s_cad[ 5] = ls_ngru
		
		//OpenWithParm( w_arch_cto_cobranza_hist_edit, lstr_parm )
		ls_ret = f_Trim( Message.StringParm )
		
		If ls_ret = '' Then Return
		
		wf_Refresh( )
		
		This.Find( 'c_codigo_gru = "' + ls_gru + '"', True )
		
		Return
		
End Choose

Return
end event

event dw_list::clicked;call super::clicked;
If row <= 0 Then Return

s_parm	lstr_parm

Choose Case dwo.Name
	Case 'cb_det'
		lstr_parm.s_cad[ 1] = This.Object.tipo_cob[ row]
		lstr_parm.s_cad[ 2] = String( LongLong( This.Object.folio[ row] ) )
		lstr_parm.s_cad[ 3] = This.Object.DB[ row]
		
		//OpenWithParm( w_arch_caj_docingreso_consulta, lstr_parm )

End Choose
end event

event dw_list::rbuttondown;call super::rbuttondown;
wf_Task( )
end event

type dw_obs from uo_dw_list within w_arch_mul_revision_info
boolean visible = false
integer x = 4882
integer y = 1180
integer height = 272
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_arch_mul_revision_info_obs"
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
end type

event constructor;call super::constructor;
If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

type dw_seg from uo_dw_list within w_arch_mul_revision_info
event total ( )
integer x = 3214
integer y = 896
integer width = 1623
integer height = 620
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_arch_mul_revision_info_seg"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 90
integer ii_posdety = 15
end type

event total();
Integer	li_estado_reg, li_cod_seguro
Long		row, ll_fnd
String	ls_fnd


row = GetRow( )

li_estado_reg = f_Zero( This.Object.estado_reg[ row] )
li_cod_seguro = f_Zero( This.Object.cod_seguro[ row] )

If li_estado_reg = 1 Then
	Choose Case li_cod_seguro
		Case 10
			ls_fnd = 'cod_seguro In (11, 12) And Estado_reg = 1'
		Case 11
			ls_fnd = 'cod_seguro In (10, 12) And Estado_reg = 1'
		Case 12
			ls_fnd = 'cod_seguro In (10, 11) And Estado_reg = 1'
	End Choose
End If

If Not ls_fnd = '' Then
	ll_fnd =	This.Find( ls_fnd )
	If ll_fnd > 0 Then
		blEclipse.Messagebox( Title, 'No se puede seleccionar al mismo tiempo los seguros con códigos 10, 11, o 12', Exclamation! )
		This.Object.estado_reg[ row] = 0
	End If		
End If


wf_TotalSeguros( )
wf_Total( )
end event

event constructor;call super::constructor;
If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

event itemchanged;call super::itemchanged;
ib_saved = False
PostEvent( 'Total' )

end event

type dw_rez from uo_dw_list within w_arch_mul_revision_info
integer x = 151
integer y = 1800
integer width = 4681
integer height = 396
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_arch_mul_revision_info_rez"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 90
integer ii_posdety = 15
integer ii_maxwidth = 4820
end type

event constructor;call super::constructor;
If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

