//objectcomments Autor: César Vilela R.~r~nFunción: Edición de contratos MultiProducto etapa Digitacion
forward
global type w_arch_mul_digitacion_info from w_gen_document_doc
end type
type tab_1 from tab within w_arch_mul_digitacion_info
end type
type tabpage_cto from userobject within tab_1
end type
type dw_cto from uo_dw_edit within tabpage_cto
end type
type tabpage_cto from userobject within tab_1
dw_cto dw_cto
end type
type tabpage_cli from userobject within tab_1
end type
type dw_cli from uo_dw_edit within tabpage_cli
end type
type tabpage_cli from userobject within tab_1
dw_cli dw_cli
end type
type tabpage_lab from userobject within tab_1
end type
type dw_lab from uo_dw_edit within tabpage_lab
end type
type tabpage_lab from userobject within tab_1
dw_lab dw_lab
end type
type tabpage_pie from userobject within tab_1
end type
type dw_pac from uo_dw_edit within tabpage_pie
end type
type dw_pie from uo_dw_list within tabpage_pie
end type
type tabpage_pie from userobject within tab_1
dw_pac dw_pac
dw_pie dw_pie
end type
type tab_1 from tab within w_arch_mul_digitacion_info
tabpage_cto tabpage_cto
tabpage_cli tabpage_cli
tabpage_lab tabpage_lab
tabpage_pie tabpage_pie
end type
end forward

global type w_arch_mul_digitacion_info from w_gen_document_doc
integer width = 4421
integer height = 2800
string title = "Digitación del Contrato"
boolean ib_cbnew = false
boolean ib_cbopen = false
boolean ib_cbexcel = false
boolean ib_cbdelete = false
boolean ib_cbprint = false
boolean ib_cbshare = false
boolean ib_permitemod = true
boolean ib_new = true
event postopen ( )
tab_1 tab_1
end type
global w_arch_mul_digitacion_info w_arch_mul_digitacion_info

type variables

Boolean	ib_det = False
Integer	ii_idx = 0
Long		il_y, il_H, il_yAmp, il_HAmp, il_YCon, il_HCon
DateTime	id_ini, id_fin, id_hoy , id_Min, id_Max

String	is_doc, is_dir, &
			is_cli, is_cto 
Dec	in_dias_inicio_repacta, in_dias_tope_repacta, in_PorcIVA 


uo_DataStore	ids_back[]
uo_dw_edit		idw_cto, idw_cli, idw_lab, idw_pac
uo_dw_list		idw_pie
end variables

forward prototypes
public function integer wf_new ()
public function integer wf_config ()
public function integer wf_opendoc (string as_cto, double an_rut, integer an_par, string as_db)
public function boolean wf_savedocument ()
public subroutine wf_gastosadm ()
public function datetime wf_vencimientomant (integer al_ctas, datetime ad_vcto)
public function integer wf_estatus_comision ()
public function datetime wf_vencimientoprim (integer al_ctas, datetime ad_vcto)
public function boolean wf_saveseg ()
public function decimal wf_tasabase ()
public function decimal wf_tasainteres ()
public function decimal wf_importeiva ()
public function decimal wf_totalseguros ()
public function boolean wf_save ()
public function integer wf_total ()
public function boolean wf_savepiepactado ()
end prototypes

public function integer wf_new ();
ib_new = True
ib_saved = True

is_emp = gs_emp

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )

dw_list.Reset( )
dw_list.SetTransObject( SqlCa )

dw_1.InsertRow(0)
dw_1.SetFocus( )
idw_cto.InsertRow(0)
idw_cli.InsertRow(0)
idw_lab.InsertRow(0)

Return 1
end function

public function integer wf_config ();
Dec	nIVA


Select dias_inicio_repacta, dias_tope_repacta, IVA Into :in_dias_inicio_repacta, :in_dias_tope_repacta, :nIVA 
From Tasa ;


id_hoy	= f_ServerDate( )
id_Min	= DateTime( RelativeDate( Date(id_hoy), (in_dias_inicio_repacta * -1)) )
id_Max	= DateTime( RelativeDate( Date(id_hoy), in_dias_tope_repacta ) )
in_PorcIVA = (nIVA - 1) * (100)


dw_1.SetObjectcolor( { 'barra','rut', 'nombrecliente', 'dv', 'CodigoMP' }, 'o' )
dw_1.SetObjectColor( 'cod_parque', 'ba' )
dw_1.SetObjectColor( 'nro_cuotas', 'st' )
idw_cto.SetObjectcolor( { 'area','tipo_cons', 'capacidad', 'tipo_sepult' }, 'o' )
idw_pac.SetObjectcolor( { 'Cuotas' }, 'eVerde' )
idw_pie.SetObjectcolor( 'Estado', 'Estado = "C"', {'eVerde', 't'} )


dw_1.SetObjectcolor( { 'Forma_pago', 'Moneda', 'SaldoFinanciar', 'Valor_cuota', 'uf_dia', 'tasa_interes_cuota' }, 'o' )
dw_1.SetObjectcolor( { 'PorcentajePie', 'pie', 'valor_cuota', 'precio', 'tasa_base', 'anios_liberar' }, 'eVerde' )

dw_1.ColEnabled( {'Barra', 'DV', 'NomCliente', 'CodigoMP', 'Cod_Parque', 'anexo_dacion', 'tasa_interes_cuota', 'total_valor_cuota', 'valor_cuota_iva', 'pie' }, False ) 
dw_1.ColEnabled( {'SaldoFinanciar', 'ImporteIVA', 'Pie_IVA', 'anios_liberar', 'uf_dia', 'valor_cuota' }, False ) 


idw_cli.ColEnabled( { 'nombre', 'a_paterno', 'a_materno', 'tipo_via', 'direccion_p', 'numero_particular', 'block_particular', 'depto_particular' }, False ) 
idw_lab.ColEnabled( { 'domicilio_c', 'ciudad', 'comuna', 'fono_p', 'celular', 'numero_comercial', 'ciudad_comercial', 'comuna_comercial' }, False ) 
idw_lab.ColEnabled( { 'actividad', 'fono_c', 'grupo_f', 'fecha_ingreso_trabajo', 'dicom_score' }, False )
dw_list.Title = This.Title
dw_list.Bringtotop = True

Return 1
end function

public function integer wf_opendoc (string as_cto, double an_rut, integer an_par, string as_db);
DataWindowChild	ldwc_x
Int li_ret
Long		ll_nro
String	ls_nil, ls_pro, ls_bas, ls_ser


//an_Rut = 11948769
dw_1.SetRedraw( False )
dw_1.SetTransObject( Sqlca )

ls_bas = Left( as_cto, 1 )
ls_ser = Mid( as_cto, 2, 1 )
ll_nro = Long( Mid( as_cto, 3 ) )
SetNull( ls_nil )

String	ls_sector

li_ret = dw_1.Retrieve( ls_nil, ls_bas, ls_ser, ll_nro, an_rut, an_Par, 'CAB', as_DB )

If li_ret > 0 Then
	ls_pro		= f_Trim( dw_1.Object.Cod_Producto[ 1] )
	ls_sector   = f_Trim( dw_1.Object.Sector      [ 1] )

Else
	dw_1.InsertRow( 1 )
End If

li_ret = idw_pac.Retrieve( ls_nil, ls_bas, ls_ser, ll_nro, an_rut, an_Par, 'PAC', as_DB )
If Not li_ret > 0 Then
	idw_pac.InsertRow( 1 )
End If
If f_Zero( idw_pac.Object.chDias[ 1] ) = 0 Then
	idw_pac.Object.chDias[ 1] = 1
End If


Dec	lnTotPeso, lnTotUF
li_ret = idw_pie.Retrieve( ls_nil, ls_bas, ls_ser, ll_nro, an_rut, an_Par, 'PIE', as_DB )
If li_ret > 0 Then
	lnTotPeso	= f_Zero( idw_pie.Object.TotPagadoPeso[ li_ret] )
	lnTotUF		= f_Zero( idw_pie.Object.TotPagadoUF[ li_ret] )
End If
If Not lnTotPeso = 0 Or Not lnTotUF = 0 Then
	idw_pac.ColEnabled( False )
End If



dw_1.GetChild( 'codigo_tipo_seguro', ldwc_x )
ldwc_x.SetTransObject( Sqlca )
li_ret = ldwc_x.Retrieve( an_Par, ls_bas )
If ldwc_x.Rowcount( ) = 0 Then
	ldwc_x.Insertrow( 0 )
End If

idw_cto.SetTransObject( SqlCa )
dw_1.ColumnsCopy( 1, {'Area', 'Sector', 'Sepultura', 'Capacidad', 'Tipo_Sepult', 'Tipo_Cons', 'n_Reduccion', 'Uso', 'Moneda', 'Tipo_Producto'}, idw_cto, 1 ) 

li_ret = idw_cli.Retrieve( an_rut, ls_nil, 'EDIT', as_DB )
li_ret = idw_lab.Retrieve( an_rut, ls_nil, 'EDIT', as_DB )

dw_1.GetChild( 'beneficio_complementario', ldwc_x )
ldwc_x.SetTransObject( Sqlca )
ldwc_x.Retrieve( an_Par )

idw_cto.GetChild( 'tipo_producto', ldwc_x )
ldwc_x.SetTransObject( Sqlca )
ldwc_x.SetFilter( 'Cod_Producto = "' + ls_pro + '"')
ldwc_x.Filter( )
If ldwc_x.Rowcount( ) = 0 Then
	ldwc_x.Insertrow( 0 )
End If

idw_cto.GetChild( 'area', ldwc_x )
ldwc_x.SetTransObject( Sqlca )
ldwc_x.Retrieve( an_Par, ls_pro )
If ldwc_x.Rowcount( ) = 0 Then
	ldwc_x.Insertrow( 0 )
End If

If f_Zero( dw_1.Object.Tasa[ 1] ) = 0 Then
	wf_TasaInteres( )
End If 

idw_cto.Event ItemChanged( 1, idw_cto.Object.Area, dw_1.Object.Area[ 1] )
idw_cto.Object.Sector      [ 1] = ls_sector


li_ret = dw_list.Retrieve( as_Cto, an_rut, an_Par, 'SEG', as_DB )

dw_1.SetRedraw( True )
dw_1.SetFocus( 'Fecha' )


String	ls_rch

Select	Rechazado
Into		:ls_rch
From		MPContrato
Where		Base = :ls_bas
And		Serie = :ls_ser
And		Numero = :ll_nro 
Using		SqlCa ;

ls_rch = UpperTrim( ls_rch )
If ls_rch = '1' Then
	blEClipse.Messagebox( Title, 'Contrato ' + as_Cto + ' se encuentra Rechazado.' + Char(13) + Char(13)+ &
								'No se puede modificar.', Exclamation!)
	dw_1.ColEnabled( False )
	dw_list.ReadOnlyDW( True )
End If



ib_saved = True

Return 1

end function

public function boolean wf_savedocument ();
Integer	li_par, li_eda, li_nil, li_CMP, row
Long		ll_nro, ll_rut
DateTime	ld_cto, ld_max, ld_min, ld_hoy
String	ls_bar, ls_bas, ls_ser, ls_Dv, &
			ls_col, ls_msg


dw_1.Accepttext( )

SetNull( li_nil )
row = 1


idw_cto.AcceptText( )
idw_cto.ColumnsCopy( 1, {'Area', 'Sector', 'Sepultura', 'Capacidad', 'Tipo_Sepult', 'Tipo_Cons', 'n_Reduccion', 'Uso', 'Moneda', 'Tipo_Producto'}, dw_1, 1 ) 
dw_1.AcceptText( )
idw_pac.AcceptText( )

ls_bar = UpperTrim( dw_1.Object.Barra[ row] )
ls_bas = UpperTrim( dw_1.Object.Base[ row] )
ls_ser = UpperTrim( dw_1.Object.Serie[ row] )
ll_nro = f_Zero( dw_1.Object.nro_oferta[ row] )
li_par = f_Zero( dw_1.Object.Cod_Parque[ row] )
ll_rut = f_Zero( dw_1.Object.Rut[ row] )
ls_DV  = UpperTrim( dw_1.Object.DV[ row] )
ld_cto = dw_1.Object.Fecha[ row]
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

If ls_msg = '' And Not f_IsDate( ld_cto ) Then
	ls_col = 'Fecha'
	ls_msg = 'Fecha de Contrato es inválida.'
End If


Dec	ln_dias_inicio_repacta, ln_dias_tope_repacta 

Select dias_inicio_repacta, dias_tope_repacta Into :ln_dias_inicio_repacta, :ln_dias_tope_repacta 
From Tasa ;


ld_hoy	= f_ServerDate( )
ld_Min	= DateTime( RelativeDate( Date(ld_hoy), (ln_dias_inicio_repacta * -1)) )
ld_Max	= DateTime( RelativeDate( Date(ld_hoy), ln_dias_tope_repacta ) )

If ls_msg = '' And f_IsDate( ld_cto ) Then
	If ld_cto < ld_Min Or ld_cto > ld_Max Then
		ls_col = 'Fecha'
		//ls_msg = 'Fecha de Contrato es inválida.'
	End If
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If


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


Dec		ln_Capacidad
String	ls_area, ls_sector, ls_Sepultura, ls_tipo_sepult, ls_tipo_cons, ls_n_Reduccion, ls_uso, ls_moneda, ls_tipo_producto

ls_area		 = UpperTrim( dw_1.Object.Area[ row] )
ls_sector	 = UpperTrim( dw_1.Object.Sector[ row] )
ls_Sepultura = UpperTrim( dw_1.Object.Sepultura[ row] )
ln_Capacidad = f_Zero( dw_1.Object.Capacidad[ row] )
ls_tipo_sepult = UpperTrim( dw_1.Object.Tipo_sepult[ row] )
ls_tipo_cons = UpperTrim( dw_1.Object.Tipo_cons[ row] )
ls_n_Reduccion = UpperTrim( dw_1.Object.n_Reduccion[ row] )
ls_uso		 = UpperTrim( dw_1.Object.Uso[ row] )
ls_moneda	 = UpperTrim( dw_1.Object.Moneda[ row] )
ls_tipo_producto = UpperTrim( dw_1.Object.Tipo_producto[ row] )

If ls_msg = '' And ls_area = '' Then
	ls_col = 'Area'
	ls_msg = 'Debe seleccionar Área.'
End If

If ls_msg = '' And ls_sector = '' Then
	ls_col = 'Sector'
	//ls_msg = 'Debe seleccionar Sector.'
End If

If ls_msg = '' And ls_Sepultura = '' Then
	ls_col = 'Sepultura'
	//ls_msg = 'Debe ingresar Sepultura.'
End If

If ls_msg = '' And ln_Capacidad <= 0 Then
	ls_col = 'Capacidad'
	ls_msg = 'Debe ingresar Capacidad.'
End If

If ls_msg = '' And ls_tipo_sepult = '' Then
	ls_col = 'Tipo_sepult'
	ls_msg = 'Debe seleccionar Tipo Sepultura.'
End If

If ls_msg = '' And ls_tipo_cons = '' Then
	ls_col = 'Tipo_cons'
	ls_msg = 'Debe seleccionar Tipo Construcción.'
End If

If ls_msg = '' And ls_n_Reduccion = '' Then
	ls_col = 'n_Reduccion'
	ls_msg = 'Debe ingresar Nº Reducción.'
End If

If ls_msg = '' And ls_uso = '' Then
	ls_col = 'Uso'
	ls_msg = 'Debe seleccionar Uso.'
End If

If ls_msg = '' And ls_moneda = '' Then
	ls_col = 'Moneda'
	ls_msg = 'Debe seleccionar Moneda.'
End If

If ls_msg = '' And ls_tipo_producto = '' Then
	ls_col = 'Tipo_producto'
	ls_msg = 'Debe seleccionar Tipo de Producto.'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	idw_cto.SetFocus( ls_col )
	Return False
End If


String	ls_lugar_v, ls_tipo_mant, ls_Tipo_venta, ls_forma_pago, ls_canal_venta, ls_dscto_planilla, ls_anexo_dacion

ls_lugar_v = UpperTrim( dw_1.Object.Lugar_v[ row] )
ls_tipo_mant = UpperTrim( dw_1.Object.Tipo_mant[ row] )
ls_tipo_venta = UpperTrim( dw_1.Object.Tipo_venta[ row] )
ls_forma_pago = UpperTrim( dw_1.Object.Forma_pago[ row] )
ls_canal_venta = UpperTrim( dw_1.Object.Canal_venta[ row] )
ls_dscto_planilla = UpperTrim( dw_1.Object.Dscto_planilla[ row] )
ls_anexo_dacion = UpperTrim( dw_1.Object.Anexo_dacion[ row] )

If ls_msg = '' And ls_forma_pago = '' Then
	ls_col = 'Forma_pago'
	ls_msg = 'Debe seleccionar Forma de Pago.'
End If

If ls_msg = '' And ls_Tipo_mant = '' Then
	ls_col = 'Tipo_mant'
	ls_msg = 'Debe seleccionar Tipo mantención.'
End If

If ls_msg = '' And ls_Tipo_venta = '' Then
	ls_col = 'Tipo_venta'
	ls_msg = 'Debe seleccionar Tipo Venta.'
End If

If ls_msg = '' And ls_canal_venta = '' Then
	ls_col = 'Canal_venta'
	ls_msg = 'Debe seleccionar Canal venta.'
End If

If ls_msg = '' And ls_Dscto_planilla = '' Then
	ls_col = 'Dscto_planilla'
	ls_msg = 'Debe seleccionar Dscto. Planilla.'
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If

Dec	ln_porce_venta, ln_porce_sup, ln_porce_jefe

Select	fn_mpAgenteComision( 'AGE', :ls_cod_Age, :ls_tipo_venta, :ls_Tipo_sepult, :ls_Area, :ln_Capacidad, :ls_Uso ) 
			Into :ln_porce_venta From Dual ;
Select	fn_mpAgenteComision( 'SUP', :ls_cod_Sup, :ls_tipo_venta, :ls_Tipo_sepult, :ls_Area, :ln_Capacidad, :ls_Uso ) 
			Into :ln_porce_sup From Dual ;
Select	fn_mpAgenteComision( 'JEF', :ls_cod_Jef, :ls_tipo_venta, :ls_Tipo_sepult, :ls_Area, :ln_Capacidad, :ls_Uso ) 
			Into :ln_porce_jefe From Dual ;


DateTime	ld_fecha_pie, ld_fecha_m, ld_fecha_prim, ld_fecha_ult, ld_fecha_entre

ld_fecha_pie	= dw_1.Object.Fecha_pie[ row] 
ld_fecha_m		= dw_1.Object.Fecha_m[ row] 
ld_fecha_prim	= dw_1.Object.Fecha_prim[ row] 
ld_fecha_ult	= dw_1.Object.Fecha_ult[ row] 
ld_fecha_entre	= dw_1.Object.Fecha_entre[ row] 

If ls_msg = '' And f_IsDate( ld_fecha_pie ) Then
	If ld_fecha_pie < ld_Min Or ld_fecha_pie > ld_Max Then
		ls_col = 'Fecha_pie'
		ls_msg = 'Fecha pie es inválida.'
	End If
End If

If ls_msg = '' And Not f_IsDate( ld_fecha_m ) Then
	ls_col = 'Fecha_m'
	ls_msg = 'Fecha Mantención es inválida.'
End If

If ls_msg = '' And f_IsDate( ld_fecha_m ) Then
	If ld_fecha_m < ld_Min Or ld_fecha_m > ld_Max Then
		ls_col = 'Fecha_m'
		//ls_msg = 'Fecha Mantención es inválida.'
	End If
End If

If ls_msg = '' And Not f_IsDate( ld_fecha_prim ) Then
	//If ld_fecha_prim < ld_Min Or ld_fecha_prim > ld_Max Then
		ls_col = 'Fecha_prim'
		ls_msg = 'Fecha Primer Vencimiento es inválida.'
	//End If
End If

If ls_msg = '' And Not f_IsDate( ld_fecha_ult ) Then
	//If ld_fecha_ult < ld_Min Or ld_fecha_ult > ld_Max Then
		ls_col = 'Fecha_ult'
		ls_msg = 'Fecha Último Vencimiento es inválida.'
	//End If
End If

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If


Dec	ln_des_esp, ln_pie, ln_tasa, ln_beneficio_complementario, ln_promocion, ln_cod_convenio, ln_valor_cuota, ln_tipo_descuento, &
		ln_rut_institucional, ln_precio, ln_precioCto, ln_valor_cuota_m, ln_tasa_base, ln_rut_aval, ln_descuento_por, ln_nro_cuotas, &
		ln_gastos_adm, ln_derecho_lib, ln_saldo_financiar, ln_rut_funeraria, ln_uf_dia

ln_des_esp	= f_Zero( dw_1.Object.Des_esp[ row] )
ln_pie	= f_Zero( dw_1.Object.Pie[ row] )
ln_tasa	= f_Zero( dw_1.Object.Tasa[ row] )
ln_beneficio_complementario	= f_Zero( dw_1.Object.Beneficio_complementario[ row] )
ln_promocion	= f_Zero( dw_1.Object.Promocion[ row] )
ln_cod_convenio	= f_Zero( dw_1.Object.Cod_convenio[ row] )
ln_valor_cuota	= f_Zero( dw_1.Object.Valor_cuota[ row] )
ln_tipo_descuento	= f_Zero( dw_1.Object.Tipo_descuento[ row] )
ln_rut_institucional	= f_Zero( dw_1.Object.Rut_institucional[ row] )
ln_precioCto	= f_Zero( dw_1.Object.Precio[ row] )
ln_precio	= f_Zero( dw_1.Object.PrecioOrigen[ row] )
ln_valor_cuota_m	= f_Zero( dw_1.Object.Valor_cuota_m[ row] )
ln_tasa_base	= f_Zero( dw_1.Object.Tasa_base[ row] )
ln_rut_aval	= f_Zero( dw_1.Object.Rut_aval[ row] )
ln_descuento_por	= f_Zero( dw_1.Object.Descuento_por[ row] )
ln_nro_cuotas	= f_Zero( dw_1.Object.Nro_cuotas[ row] )
ln_gastos_adm	= f_Zero( dw_1.Object.Gastos_adm[ row] )
ln_derecho_lib	= f_Zero( dw_1.Object.Derecho_lib[ row] )
ln_saldo_financiar	= f_Zero( dw_1.Object.SaldoFinanciar[ row] )
dw_1.Object.saldo_financiar[ row] = ln_saldo_financiar
ln_rut_funeraria	= f_Zero( dw_1.Object.Rut_funeraria[ row] )
ln_uf_dia	= f_Zero( dw_1.Object.UF_dia[ row] )

Dec	ln_SumPie, ln_Plazo

ln_Plazo = ln_nro_cuotas

If ls_msg = '' Then
	If ln_pie > 0 Then
		Select	Sum( Monto_cuota )
		Into 		:ln_SumPie  
		From		detalle_pago_pie  
		Where		Base = :ls_bas
		And		Serie = :ls_ser
		And		Numero = :ll_nro  
		Using		Sqlca ;
		
		ln_SumPie = f_Zero( ln_SumPie )
		If ln_SumPie > 0 And ( Not Round(ln_pie, 4) = Round(ln_SumPie, 4) ) Then
			ls_col = 'Pie'
			ls_msg = 'No coincide Valor Pie con las cuotas pactadas. ' + Char(13) + 'La suma Pactada es: ' + String(ln_SumPie, '#,###0.0###' )
		End If
	End If
End If

If ls_msg = '' And ls_Tipo_venta = '6' And ln_Rut_Institucional = 0 Then
	ls_col = 'Rut_Institucional'
	ls_msg = 'Debe Ingresar Rut institucional.'
End If

Dec	ln_ComparaCuota
Choose Case ls_Moneda
	Case '1' // Pesos
		If ls_msg = '' And ln_des_esp >= 500 then
			ls_msg = 'Valor Derecho Especial se debe Ingresar en UF'
			ls_col = 'des_esp'
		End If
		If ls_msg = '' And ln_precio < 3000 then
			ls_msg = 'Valor Precio se debe Ingresar en Pesos.'
			ls_col = 'Precio'
		End If
		If ls_msg = '' And ln_Pie < 500 And Not ln_Pie = 0 Then
			ls_msg = 'Valor Pie se debe Ingresar en Pesos'
			ls_col = 'Pie'
		End If
		If ls_msg = '' And ln_gastos_adm < 500 And Not ln_gastos_adm = 0 And Not li_par = 103 Then
			If ( ls_forma_pago = '2' And ln_nro_cuotas > 17 ) Or ( ls_forma_pago = '4' And ln_nro_cuotas > 24 ) Then
				ls_msg = 'Valor Gasto Administrativo se debe Ingresar en Pesos.'
				ls_col = 'Gastos_adm'
			End If
		End If
		If ls_msg = '' And ln_valor_cuota < 500 Then
			ls_msg = 'Valor Cuota se debe Ingresar en Pesos.'
			ls_col = 'Valor_cuota'
		End If
		ln_ComparaCuota	= ( ln_pie + ( ln_plazo * ln_valor_cuota ) )
		If ls_msg = '' And ln_precio > ln_ComparaCuota + 1000 Then
			ls_msg = 'Valor Cuota Inválida, debe revisar Plazo, Valor Cuota, Valor Pie o Precio.'
			ls_col = 'Valor_cuota'
		End If
		
		If Not ls_msg = '' And ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then 
			ls_msg = ''
			ls_col = ''
		End If
	
	Case '2' //UF
		If ls_msg = '' And ln_des_esp >= 500 then
			ls_msg = 'Valor Derecho Especial se debe Ingresar en UF'
			ls_col = 'des_esp'
		End If
		If ls_msg = '' And ln_precio >= 3000 then
			ls_msg = 'Valor Precio se debe Ingresar en UF.'
			ls_col = 'Precio'
		End If
		If ls_msg = '' And ln_Pie >= 500 And Not ln_Pie = 0 Then
			ls_msg = 'Valor Pie se debe Ingresar en UF'
			ls_col = 'Pie'
		End If
		If ls_msg = '' And ln_gastos_adm >= 500 And Not ln_gastos_adm = 0 And Not li_par = 103 Then
			If ( ls_forma_pago = '2' And ln_nro_cuotas > 17 ) Or ( ls_forma_pago = '4' And ln_nro_cuotas > 24 ) Then
				ls_msg = 'Valor Gasto Administrativo se debe Ingresar en UF.'
				ls_col = 'Gastos_adm'
			End If
		End If
		If ls_msg = '' And ln_valor_cuota >= 500 Then
			ls_msg = 'Valor Cuota se debe Ingresar en UF.'
			ls_col = 'Valor_cuota'
		End If
		ln_ComparaCuota	= ( ln_pie + ( ln_plazo * ln_valor_cuota ) )
		If ls_msg = '' And (ln_precio + 0.2) > (ln_ComparaCuota + ln_Descuento_Por ) Then
			ls_msg = 'Valor Cuota Inválida, debe revisar Plazo, Valor Cuota, Valor Pie o Precio.'
			ls_col = 'Valor_cuota'
		End If
		
		If Not ls_msg = '' And ( ls_forma_pago = '1' Or ls_forma_pago='3' ) Then 
			ls_msg = ''
			ls_col = ''
		End If
End Choose

If Not ls_msg = '' Then
	blEclipse.Messagebox( Title, ls_msg, Exclamation! )
	dw_1.SetFocus( ls_col )
	Return False
End If


DateTime	ld_fecha
String	ls_base, ls_serie
Long		ln_nro_oferta, ln_rut


ls_base                     = UpperTrim( dw_1.Object.base  [ 1] )
ls_serie                    = UpperTrim( dw_1.Object.serie [ 1] )
ln_nro_oferta               = f_Zero( dw_1.Object.nro_oferta  [ 1] )
ln_rut                      = f_Zero( dw_1.Object.rut         [ 1] )
ld_fecha                    = NullIfInvalid( dw_1.Object.fecha       [ 1] )


String 	ls_cod_age_ant, ls_cod_emp, ls_contacto, ls_age_ant, ls_titulo, ls_estado_comi, ls_estado_premio, ls_usuario, &
			ls_nro_resc, ls_origen, ls_estado, ls_estado_seguro, ls_anexo_lib, ls_estatus_comision, ls_estado_comi_sup, &
			ls_anexo_repacta, ls_anexo_aumento, ls_estado_seguro_rent, ls_estado_comi_at, ls_estado_comi_jv, ls_clasifica_venta, &
			ls_unidad_costo, ls_estado_bono_jef, ls_estado_persist_age, ls_estado_persist_sup, ls_estado_persist_jef, &
			ls_clasifica_venta_hist, ls_anexo_crematorio   
 

ls_cod_age_ant              = UpperTrim( dw_1.Object.cod_age_ant [ 1] )
ls_cod_age                  = UpperTrim( dw_1.Object.cod_age     [ 1] )
ls_cod_sup                  = UpperTrim( dw_1.Object.cod_sup     [ 1] )
ls_cod_emp                  = UpperTrim( dw_1.Object.cod_emp     [ 1] )
ls_contacto                 = UpperTrim( dw_1.Object.contacto   [ 1] )
ls_age_ant                  = UpperTrim( dw_1.Object.age_ant    [ 1] )
ls_tipo_sepult              = UpperTrim( dw_1.Object.tipo_sepult[ 1] )
ls_tipo_cons                = UpperTrim( dw_1.Object.tipo_cons  [ 1] )
ls_tipo_venta               = UpperTrim( dw_1.Object.tipo_venta [ 1] )
ls_uso                      = UpperTrim( dw_1.Object.uso        [ 1] )
ls_lugar_v                  = UpperTrim( dw_1.Object.lugar_v      [ 1] )
ls_titulo                   = UpperTrim( dw_1.Object.titulo       [ 1] )
ls_estado_comi              = UpperTrim( dw_1.Object.estado_comi  [ 1] )
ls_estado_premio            = UpperTrim( dw_1.Object.estado_premio[ 1] )
ls_usuario                  = UpperTrim( dw_1.Object.usuario      [ 1] )
ls_forma_pago               = UpperTrim( dw_1.Object.forma_pago   [ 1] )
ls_tipo_mant                = UpperTrim( dw_1.Object.tipo_mant    [ 1] )
ls_nro_resc                 = UpperTrim( dw_1.Object.nro_resc     [ 1] )
ls_origen                   = UpperTrim( dw_1.Object.origen       [ 1] )
ls_estado                   = UpperTrim( dw_1.Object.estado       [ 1] )
ls_estado_seguro            = UpperTrim( dw_1.Object.estado_seguro    [ 1] )
ls_anexo_lib                = UpperTrim( dw_1.Object.anexo_lib        [ 1] )
ls_cod_jef                  = UpperTrim( dw_1.Object.cod_jef          [ 1] )
ls_estatus_comision         = UpperTrim( dw_1.Object.estatus_comision    [ 1] )
ls_estado_comi_sup          = UpperTrim( dw_1.Object.estado_comi_sup     [ 1] )
ls_anexo_repacta            = UpperTrim( dw_1.Object.anexo_repacta       [ 1] )
ls_anexo_aumento            = UpperTrim( dw_1.Object.anexo_aumento       [ 1] )
ls_anexo_dacion             = UpperTrim( dw_1.Object.anexo_dacion       [ 1] )
ls_sepultura                = UpperTrim( dw_1.Object.sepultura          [ 1] )
ls_estado_seguro_rent       = '' //UpperTrim( dw_1.Object.estado_seguro_rent [ 1] )
ls_estado_comi_at           = '' //UpperTrim( dw_1.Object.estado_comi_at      [ 1] )
ls_estado_comi_jv           = '' //UpperTrim( dw_1.Object.estado_comi_jv      [ 1] )
ls_clasifica_venta          = '' //UpperTrim( dw_1.Object.clasifica_venta     [ 1] )
ls_unidad_costo             = '' //UpperTrim( dw_1.Object.unidad_costo        [ 1] )
ls_estado_bono_jef          = '' //UpperTrim( dw_1.Object.estado_bono_jef     [ 1] )
ls_estado_persist_age       = '' //UpperTrim( dw_1.Object.estado_persist_age  [ 1] )
ls_estado_persist_sup       = '' //UpperTrim( dw_1.Object.estado_persist_sup  [ 1] )
ls_estado_persist_jef       = '' //UpperTrim( dw_1.Object.estado_persist_jef  [ 1] )
ls_dscto_planilla           = UpperTrim( dw_1.Object.dscto_planilla      [ 1] )
ls_canal_venta              = UpperTrim( dw_1.Object.canal_venta         [ 1] )
ls_clasifica_venta_hist     = '' //UpperTrim( dw_1.Object.clasifica_venta_hist[ 1] )
ls_anexo_crematorio         = '' //UpperTrim( dw_1.Object.anexo_crematorio    [ 1] )

If ls_estatus_comision   = '' Then ls_estatus_comision   = '0'
If ls_estado_comi_sup    = '' Then ls_estado_comi_sup    = 'N'
If ls_sepultura          = '' Then ls_sepultura          = '0'
If ls_estado_seguro_rent = '' Then ls_estado_seguro_rent = 'N'
If ls_estado_comi_at     = '' Then ls_estado_comi_at     = 'N'
If ls_estado_comi_jv     = '' Then ls_estado_comi_jv     = 'N'
If ls_estado_bono_jef    = '' Then ls_estado_bono_jef    = 'N'
If ls_estado_persist_age = '' Then ls_estado_persist_age = 'N'
If ls_estado_persist_sup = '' Then ls_estado_persist_sup = 'N'
If ls_estado_persist_jef = '' Then ls_estado_persist_jef = 'N'
If ls_dscto_planilla     = '' Then ls_dscto_planilla     = 'N'
If ls_usuario            = '' Then ls_usuario            = gs_usuario

///*
Decimal ln_ult_folio, ln_Cod_Parque, ln_tot_pagado, ln_cta_pag_s, ln_cta_pag_m, ln_abono_c, ln_abono_m, ln_tot_pagado_m, ln_abono_d, &
		ln_uf_cierre, ln_total_com, ln_por_ingre, ln_porce_ing, ln_porce_ubicacion, ln_porce_adicional, ln_porce_manperpe, ln_u_folio, &
		ln_aval, ln_cta_repacta, ln_cta_aumento, ln_total_pagado_repact, ln_reserva, ln_nro_reprog_mant, ln_porce_ing_cierre, &
		ln_costo_venta, ln_estado_beneficio, ln_porc_ing_caja_sup, ln_tipo_producto


ln_ult_folio                = f_Zero( dw_1.Object.ult_folio    [ 1] )
ln_Cod_Parque               = f_Zero( dw_1.Object.Cod_Parque   [ 1] )
ln_tot_pagado               = f_Zero( dw_1.Object.tot_pagado   [ 1] )
ln_cta_pag_s                = f_Zero( dw_1.Object.cta_pag_s    [ 1] )
ln_cta_pag_m                = f_Zero( dw_1.Object.cta_pag_m    [ 1] )
ln_valor_cuota_m            = f_Zero( dw_1.Object.valor_cuota_m[ 1] )
ln_abono_c                  = f_Zero( dw_1.Object.abono_c      [ 1] )
ln_abono_m                  = f_Zero( dw_1.Object.abono_m      [ 1] )
ln_tot_pagado_m             = f_Zero( dw_1.Object.tot_pagado_m [ 1] )
ln_abono_d                  = f_Zero( dw_1.Object.abono_d      [ 1] )
ln_uf_cierre                = f_Zero( dw_1.Object.uf_cierre    [ 1] )
ln_total_com                = f_Zero( dw_1.Object.total_com    [ 1] )
ln_por_ingre                = f_Zero( dw_1.Object.por_ingre    [ 1] )
ln_porce_ing                = f_Zero( dw_1.Object.porce_ing    [ 1] )
ln_porce_venta              = f_Zero( dw_1.Object.porce_venta      [ 1] )
ln_porce_ubicacion          = f_Zero( dw_1.Object.porce_ubicacion  [ 1] )
ln_porce_adicional          = f_Zero( dw_1.Object.porce_adicional  [ 1] )
ln_porce_manperpe           = f_Zero( dw_1.Object.porce_manperpe   [ 1] )
ln_porce_sup                = f_Zero( dw_1.Object.porce_sup        [ 1] )
ln_u_folio                  = f_Zero( dw_1.Object.u_folio          [ 1] )
ln_rut_institucional        = f_Zero( dw_1.Object.rut_institucional[ 1] )
ln_rut_aval                 = f_Zero( dw_1.Object.rut_aval            [ 1] )
ln_aval                     = f_Zero( dw_1.Object.aval                [ 1] )
ln_rut_funeraria            = f_Zero( dw_1.Object.rut_funeraria       [ 1] )
ln_cta_repacta              = f_Zero( dw_1.Object.cta_repacta         [ 1] )
ln_saldo_financiar          = f_Zero( dw_1.Object.saldo_financiar     [ 1] )
ln_porce_jefe               = f_Zero( dw_1.Object.porce_jefe          [ 1] )
ln_cta_aumento              = f_Zero( dw_1.Object.cta_aumento        [ 1] )
ln_descuento_por            = f_Zero( dw_1.Object.descuento_por      [ 1] )
ln_tipo_descuento           = f_Zero( dw_1.Object.tipo_descuento     [ 1] )
ln_promocion                = f_Zero( dw_1.Object.promocion          [ 1] )
ln_total_pagado_repact      = 0 //f_Zero( dw_1.Object.total_pagado_repact[ 1] )
ln_reserva                  = 0 //f_Zero( dw_1.Object.reserva            [ 1] )
ln_nro_reprog_mant          = 0 //f_Zero( dw_1.Object.nro_reprog_mant    [ 1] )
ln_beneficio_complementario = f_Zero( dw_1.Object.beneficio_complementario[ 1] )
ln_porce_ing_cierre         = 0 //f_Zero( dw_1.Object.porce_ing_cierre    [ 1] )
ln_cod_convenio             = f_Zero( dw_1.Object.cod_convenio        [ 1] )
ln_costo_venta              = 0 //f_Zero( dw_1.Object.costo_venta         [ 1] )
ln_estado_beneficio         = 0 //f_Zero( dw_1.Object.estado_beneficio    [ 1] )
ln_porc_ing_caja_sup        = 0 //f_Zero( dw_1.Object.porc_ing_caja_sup   [ 1] )
ln_tipo_producto            = f_Zero( dw_1.Object.tipo_producto       [ 1] )
//*/

// IVA y Liberador
Dec	ln_ImporteIVA, ln_PorcImpConIVA, ln_TasaIVA
Int	li_anios_liberar

ln_ImporteIVA		= f_Zero( dw_1.Object.ImporteIVA[ 1] )
ln_PorcImpConIVA	= f_Zero( dw_1.Object.PorcImpConIVA[ 1] ) 
ln_TasaIVA			= f_Zero( dw_1.Object.TasaIVA[ 1] )
li_anios_liberar	= f_Zero( dw_1.Object.Anios_liberar[ 1] )



DateTime  ld_nil, ld_fecha_ingreso, ld_fecha_cierre, ld_fecha_com, ld_u_fecha, ld_ult_fecha_seg, ld_cierre_venta, &
			ld_cierre_venta_semanal, ld_fecha_fin_pagos, ld_ingreso_sistema, ld_fecha_reserva, ld_u_fecha_sem, &
			ld_fecha_seguro_rent, ld_fecha_reprog_mant, ld_fecha_producc, ld_fecha_bono_jef, ld_fec_ing_caja_sup

SetNull( ld_nil  )
ld_fecha_m                  = dw_1.Object.fecha_m[ 1] 
ld_fecha_com                = dw_1.Object.fecha_com[ 1]
ld_u_fecha                  = dw_1.Object.u_fecha[ 1] 
ld_ult_fecha_seg            = dw_1.Object.ult_fecha_seg[ 1] 
ld_cierre_venta             = dw_1.Object.cierre_venta[ 1] 
ld_cierre_venta_semanal     = dw_1.Object.cierre_venta_semanal[ 1] 
ld_fecha_fin_pagos          = dw_1.Object.fecha_fin_pagos[ 1] 
//ld_ingreso_sistema          = dw_1.Object.ingreso_sistema[ 1] 
ld_fecha_ingreso            = dw_1.Object.fecha_ingreso[ 1] 
ld_fecha_cierre             = dw_1.Object.fecha_cierre[ 1]
ld_fecha_reserva            = ld_nil //NullIfInvalid( dw_1.Object.fecha_reserva      [ 1] )
ld_u_fecha_sem              = ld_nil //NullIfInvalid( dw_1.Object.u_fecha_sem        [ 1] )
ld_fecha_seguro_rent        = ld_nil //NullIfInvalid( dw_1.Object.fecha_seguro_rent  [ 1] )
ld_fecha_reprog_mant        = ld_nil //NullIfInvalid( dw_1.Object.fecha_reprog_mant  [ 1] )
ld_fecha_producc            = ld_nil //NullIfInvalid( dw_1.Object.fecha_producc       [ 1] )
ld_fecha_bono_jef           = ld_nil //NullIfInvalid( dw_1.Object.fecha_bono_jef      [ 1] )
ld_fec_ing_caja_sup         = ld_nil //NullIfInvalid( dw_1.Object.fec_ing_caja_sup    [ 1] )

If Not f_IsDate( ld_ingreso_sistema ) Then ld_ingreso_sistema = TodayDT()
If Not f_IsDate( ld_fecha_com ) Then SetNull( ld_fecha_com )
If Not f_IsDate( ld_u_fecha ) Then SetNull( ld_u_fecha )
If Not f_IsDate( ld_ult_fecha_seg ) Then SetNull( ld_ult_fecha_seg )
If Not f_IsDate( ld_cierre_venta ) Then SetNull( ld_cierre_venta )
If Not f_IsDate( ld_cierre_venta_semanal ) Then SetNull( ld_cierre_venta_semanal )
If Not f_IsDate( ld_fecha_fin_pagos ) Then SetNull( ld_fecha_fin_pagos )
If Not f_IsDate( ld_fecha_ingreso ) Then SetNull( ld_fecha_ingreso )
If Not f_IsDate( ld_fecha_cierre ) Then SetNull( ld_fecha_cierre )



String	ls_modificado, ls_carta_bienv, ls_nro_tecnico, ls_obs_sepultura, ls_dicom

ls_base               = UpperTrim( dw_1.Object.base          [ 1] )
ls_serie              = UpperTrim( dw_1.Object.serie         [ 1] )
ls_n_reduccion        = f_Trim( dw_1.Object.n_reduccion   [ 1] )
ls_moneda             = f_Trim( dw_1.Object.moneda        [ 1] )
ls_modificado         = UpperTrim( dw_1.Object.modificado    [ 1] )
ls_area               = UpperTrim( dw_1.Object.area          [ 1] )
ls_sector             = UpperTrim( dw_1.Object.sector        [ 1] )
ls_sepultura          = UpperTrim( dw_1.Object.sepultura     [ 1] )
ls_carta_bienv        = UpperTrim( dw_1.Object.carta_bienv   [ 1] )
ls_nro_tecnico        = UpperTrim( dw_1.Object.nro_tecnico   [ 1] )
ls_obs_sepultura      = '' //f_Trim( dw_1.Object.obs_sepultura [ 1] )
ls_dicom              = f_Trim( dw_1.Object.dicom             [ 1] )

If ls_modificado = '' Then ls_modificado = gs_usuario

DateTime	ld_fecha_prim_pie, ld_fecha_fact, ld_fecha_mod

ld_fecha              = dw_1.Object.fecha         [ 1]
ld_fecha_prim         = dw_1.Object.fecha_prim    [ 1]
ld_fecha_ult          = dw_1.Object.fecha_ult     [ 1]
ld_fecha_entre        = dw_1.Object.fecha_entre   [ 1]
ld_fecha_pie          = dw_1.Object.fecha_pie     [ 1]
ld_fecha_prim_pie     = ld_nil//dw_1.Object.fecha_prim_pie[ 1]
ld_fecha_fact         = dw_1.Object.fecha_fact    [ 1]
ld_fecha_mod          = dw_1.Object.fecha_mod     [ 1]

If Not f_IsDate( ld_fecha_prim ) Then SetNull( ld_fecha_prim )
If Not f_IsDate( ld_fecha_ult ) Then SetNull( ld_fecha_ult )
If Not f_IsDate( ld_fecha_entre ) Then SetNull( ld_fecha_entre )
If Not f_IsDate( ld_fecha_pie ) Then SetNull( ld_fecha_pie )
If Not f_IsDate( ld_fecha_prim_pie ) Then SetNull( ld_fecha_prim_pie )
If Not f_IsDate( ld_fecha_fact ) Then SetNull( ld_fecha_fact )
If Not f_IsDate( ld_fecha_mod ) Then ld_fecha_mod = TodayDT()


Dec	ln_folio, ln_parque, ln_factura, ln_total_fact, ln_pie_pagado, ln_tasa_interes_cuota, &
		ln_codigo_tipo_seguro, ln_ctas_pactadas_pie, ln_ctas_pagadas_pie, ln_pie_iva, ln_valor_cuota_iva

ln_nro_oferta         = f_Zero( dw_1.Object.nro_oferta        [ 1] )
ln_folio              = f_Zero( dw_1.Object.folio             [ 1] )
ln_Cod_Parque         = f_Zero( dw_1.Object.Cod_Parque        [ 1] )
ln_precioCto          = f_Zero( dw_1.Object.precio            [ 1] )
ln_pie                = f_Zero( dw_1.Object.pie               [ 1] )
ln_pie_iva            = f_Zero( dw_1.Object.pie_iva           [ 1] )
ln_tasa               = f_Zero( dw_1.Object.tasa              [ 1] )
ln_capacidad          = f_Zero( dw_1.Object.capacidad         [ 1] )
ln_valor_cuota        = f_Zero( dw_1.Object.valor_cuota       [ 1] )
ln_valor_cuota_iva    = f_Zero( dw_1.Object.valor_cuota_iva   [ 1] )
ln_des_esp            = f_Zero( dw_1.Object.des_esp           [ 1] )
ln_nro_cuotas         = f_Zero( dw_1.Object.nro_cuotas        [ 1] )
ln_uf_dia             = f_Zero( dw_1.Object.uf_dia            [ 1] )
ln_parque             = f_Zero( dw_1.Object.parque            [ 1] )
ln_derecho_lib        = f_Zero( dw_1.Object.derecho_lib       [ 1] )
ln_gastos_adm         = f_Zero( dw_1.Object.gastos_adm        [ 1] )
ln_factura            = f_Zero( dw_1.Object.factura           [ 1] )
ln_total_fact         = f_Zero( dw_1.Object.total_fact        [ 1] )
ln_pie_pagado         = f_Zero( dw_1.Object.pie_pagado        [ 1] )
ln_tasa_base          = f_Zero( dw_1.Object.tasa_base         [ 1] )
ln_codigo_tipo_seguro = f_Zero( dw_1.Object.codigo_tipo_seguro[ 1] )
ln_ctas_pactadas_pie  = 0 //f_Zero( dw_1.Object.ctas_pactadas_pie [ 1] )
ln_ctas_pagadas_pie   = 0 //f_Zero( dw_1.Object.ctas_pagadas_pie  [ 1] )
ln_tasa_interes_cuota = f_Zero( dw_1.Object.tasa_interes_cuota[ 1] )

If ln_parque = 0 Then
	ln_parque = ln_Cod_Parque
End If

If ls_dicom = '' Then
	ls_dicom = String( f_Zero( idw_cli.Object.dicom_score[ 1] ) )
End If


Boolean	lb_seg

lb_seg = wf_SaveSeg( )

If Not lb_seg Then
	RollBack Using SqlCa ;
	Return False
End If


Boolean	lb_pie

lb_pie = wf_SavePiePactado( )

If Not lb_pie Then
	RollBack Using SqlCa ;
	Return False
End If


uo_DataStore	lds_gen
Integer	li_ret

f_CreateDS( lds_gen, 'd_arch_mul_digitacion_info_save', SqlCa )

String	ls_gen, ls_edo

SetMicrohelp( 'Guardando Digitación  del Contrato ' + ls_Bar )
li_ret = lds_gen.Retrieve( ls_base, ls_serie, ln_nro_oferta, &
									ln_ult_folio, &
									ln_Cod_Parque, &
									ld_fecha, &
									ln_rut, &
									ls_cod_age_ant, &
									ls_cod_age, &
									ls_cod_sup, &
									ls_cod_emp, &
									ls_contacto, &
									ls_age_ant, &
									ls_tipo_sepult, &
									ls_tipo_cons, &
									ls_tipo_venta, &
									ls_uso, &
									ln_tot_pagado, &
									ln_cta_pag_s, &
									ln_cta_pag_m, &
									ln_valor_cuota_m, &
									ld_fecha_m, &
									ln_abono_c, &
									ln_abono_m, &
									ln_tot_pagado_m, &
									ln_abono_d, &
									ls_lugar_v, &
									ls_titulo, &
									ls_estado_comi, &
									ls_estado_premio, &
									ls_usuario, &
									ld_fecha_ingreso, &
									ls_forma_pago, &
									ld_fecha_cierre, &
									ln_uf_cierre, &
									ld_fecha_com, &
									ln_total_com, &
									ln_por_ingre, &
									ln_porce_ing, &
									ls_tipo_mant, &
									ls_nro_resc, &
									ls_origen, &
									ls_estado, &
									ln_porce_venta, &
									ln_porce_ubicacion, &
									ln_porce_adicional, &
									ln_porce_manperpe, &
									ln_porce_sup, &
									ln_u_folio, &
									ld_u_fecha, &
									ls_estado_seguro, &
									ld_ult_fecha_seg, &
									ls_anexo_lib, &
									ls_cod_jef, &
									ln_rut_institucional, &
									ln_rut_aval, &
									ln_aval, &
									ln_rut_funeraria, &
									ls_estatus_comision, &
									ls_estado_comi_sup, &
									ld_cierre_venta, &
									ld_cierre_venta_semanal, &
									ls_anexo_repacta, &
									ln_cta_repacta, &
									ld_fecha_fin_pagos, &
									ld_ingreso_sistema, &
									ln_saldo_financiar, &
									ln_porce_jefe, &
									ls_anexo_aumento, &
									ln_cta_aumento, &
									ln_descuento_por, &
									ln_tipo_descuento, &
									ln_promocion, &
									ls_anexo_dacion, &
									ln_total_pagado_repact, &
									ln_reserva, &
									ld_fecha_reserva, &
									ls_sepultura, &
									ld_u_fecha_sem, &
									ls_estado_seguro_rent, &
									ld_fecha_seguro_rent, &
									ln_nro_reprog_mant, &
									ld_fecha_reprog_mant, &
									ln_beneficio_complementario, &
									ln_porce_ing_cierre, &
									ls_estado_comi_at, &
									ls_estado_comi_jv, &
									ln_cod_convenio, &
									ls_clasifica_venta, &
									ld_fecha_producc, &
									ln_costo_venta, &
									ls_unidad_costo, &
									ls_estado_bono_jef, &
									ls_estado_persist_age, &
									ls_estado_persist_sup, &
									ls_estado_persist_jef, &
									ld_fecha_bono_jef, &
									ln_estado_beneficio, &
									ln_porc_ing_caja_sup, &
									ld_fec_ing_caja_sup, &
									ls_dscto_planilla, &
									ls_canal_venta, &
									ls_clasifica_venta_hist, &
									ls_anexo_crematorio, &
									ln_tipo_producto, &
									ln_ImporteIVA, &
									ln_PorcImpConIVA, &
									ln_TasaIVA, &
									li_anios_liberar, &
									ln_valor_cuota_iva, &
									ln_pie_iva )

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
	If ls_msg = '' Then
		ls_msg = 'Se he producido un error no determinado en el proceso de guardar (1)'
	End If
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If

If ls_gen = '' Then
	ls_msg = 'Se he producido un error no determinado en el proceso de guardar (1)'
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If
Destroy lds_gen

uo_DataStore	lds_pag

f_CreateDS( lds_pag, 'd_arch_mul_digitacion_info_pagoOferta_save', SqlCa )

ls_gen = ''
ls_edo = ''
li_ret = 0

SetMicrohelp( 'Guardando Digitación del Contrato ' + ls_Bar )
li_ret = lds_pag.Retrieve( ls_base, ls_serie, ln_nro_oferta, &
									ln_folio             , &
									ln_Cod_Parque        , &
									ld_fecha             , &
									ln_precioCto         , &
									ln_pie               , &
									ln_tasa              , &
									ln_capacidad         , &
									ls_n_reduccion       , &
									ln_valor_cuota       , &
									ln_des_esp           , &
									ln_nro_cuotas        , &
									ln_uf_dia            , &
									ls_moneda            , &
									ld_fecha_prim        , &
									ld_fecha_ult         , &
									ld_fecha_entre       , &
									ld_fecha_pie         , &
									ls_modificado        , &
									ld_fecha_mod         , &
									ls_area              , &
									ln_parque            , &
									ls_sector            , &
									ls_sepultura         , &
									ln_derecho_lib       , &
									ln_gastos_adm        , &
									ln_factura           , &
									ld_fecha_fact        , &
									ln_total_fact        , &
									ls_carta_bienv       , &
									ln_pie_pagado        , &
									ls_nro_tecnico       , &
									ls_obs_sepultura     , &
									ln_tasa_base         , &
									ln_codigo_tipo_seguro, &
									ls_dicom             , &
									ln_ctas_pactadas_pie , &
									ln_ctas_pagadas_pie  , &
									ld_fecha_prim_pie    , &
									ln_tasa_interes_cuota )
	
If li_ret > 0 Then
	ls_gen = f_Trim( lds_pag.Object.CodigoGenerado[ 1] )
	ls_edo = f_Trim( lds_pag.Object.Estado[ 1] )
	ls_msg = f_Trim( lds_pag.Object.MensajeResultado[ 1] )
Else
	ls_gen = '-2'
	ls_edo = 'ERR'
	ls_msg = lds_pag.is_ErrText
End If
	
If ls_edo = 'ERR' Or ls_edo = 'ERC' Then
	If ls_msg = '' Then
		ls_msg = 'Se he producido un error no determinado en el proceso de guardar (2)'
	End If
	RollBack Using SqlCa ;
	Destroy lds_pag
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If

If ls_gen = '' Then
	ls_msg = 'Se he producido un error no determinado en el proceso de guardar (2)'
	RollBack Using SqlCa ;
	Destroy lds_pag
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If
Destroy lds_pag


uo_DataStore	lds_cad

f_CreateDS( lds_cad, 'd_arch_mul_digitacion_info_cadena_save', SqlCa )

ls_gen = ''
ls_edo = ''
li_ret = 0

SetMicrohelp( 'Generando Contrato ' + ls_Bar + ' y cuponera...' )
li_ret = lds_cad.Retrieve( ln_Cod_Parque, ls_base, ls_serie, ln_nro_oferta, ln_rut, gs_usuario )
	
If li_ret > 0 Then
	ls_gen = f_Trim( lds_cad.Object.CodigoGenerado[ 1] )
	ls_edo = f_Trim( lds_cad.Object.Estado[ 1] )
	ls_msg = f_Trim( lds_cad.Object.MensajeResultado[ 1] )
Else
	ls_gen = '-2'
	ls_edo = 'ERR'
	ls_msg = lds_cad.is_ErrText
End If
	
If ls_edo = 'ERR' Or ls_edo = 'ERC' Or ls_edo = 'IER' Then
	If ls_msg = '' Then
		ls_msg = 'Se he producido un error no determinado en el proceso de guardar (3)'
	End If
	RollBack Using SqlCa ;
	Destroy lds_cad
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If

If ls_gen = '' Then
	ls_msg = 'Se he producido un error no determinado en el proceso de guardar (3)'
	RollBack Using SqlCa ;
	Destroy lds_cad
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If
Destroy lds_cad

Commit Using SqlCa ;
SetMicrohelp( 'Listo' )
dw_1.AcceptText( )
ib_saved = True
blEclipse.Messagebox( Title, 'Digitación de Contrato guardado Correctamente.' , Information! )

dw_1.Event ButtonClicked( row, 1, dw_1.Object.cb_hijos )


Return True
end function

public subroutine wf_gastosadm ();
Dec		ll_nro_cuotas, ll_cod_seguro, ln_gastos_adm, ln_tasa_base, ln_tasaGasto, ln_factor_seguro
Long		row, ll_numero
String	ls_barra, ls_moneda, ls_forma_pago, ls_base, ls_serie


dw_1.AcceptText( )
row = 1
ls_barra				= f_Trim( dw_1.Object.Barra[ row] )
ll_nro_cuotas		= f_Zero( dw_1.Object.nro_cuotas[ row] )
ls_moneda			= f_Trim( dw_1.Object.Moneda[ row] )
ls_forma_pago		= f_Trim( dw_1.Object.Forma_pago[ row] )
ll_cod_seguro		= f_Zero( dw_1.Object.codigo_tipo_seguro[ row] )
ln_tasa_base = 0

ls_base	= Left( ls_barra, 1 )
ls_serie = Mid( ls_barra, 2, 1 )
ll_numero = Long( Mid( ls_barra, 3 ) )

dw_1.Object.Gastos_adm[ 1] = ln_gastos_adm
dw_1.Object.Tasa_base[ 1] = ln_tasa_base

If Not ( Ll_nro_cuotas > 0 And Not ls_moneda = '' ) Then Return

Select	Gasto_adm
Into 		:ln_gastos_adm  
From 		Revision_contratos
Where  ( base = :ls_base ) And  
		 ( serie = :ls_serie ) And  
		 ( numero = :ll_numero ) And
		 ( estado_revision = 'A')
Using		sqlca;

ln_gastos_adm = f_Zero(ln_gastos_adm)
If Not ln_gastos_adm =0 Then 
	dw_1.Object.Gastos_adm[ row] = ln_gastos_adm
	If Not ( ls_forma_pago = '1' Or ls_forma_pago = '3' ) Then
		Select 	Case When :ls_moneda = '1' Then Interes_pesos Else Interes_UF End
		Into 		:ln_tasa_base
		From 		interes_cuotas
		Where 	nro_cuotas = :ll_nro_cuotas
		Using		sqlca;
		
		ln_tasa_base = f_Zero( ln_tasa_base )
	End If
	dw_1.Object.tasa_base[ row] = ln_tasa_base
End If

If ln_gastos_adm = 0 Then 
	Select	Case When :ls_moneda = '1' Then tasa_peso Else tasa_uf End					
	Into 		:ln_tasaGasto
	From 		Tasa_gastos_adm
	Where 	Codigo = 1
	Using		sqlca;
	
	If ll_cod_seguro = 1 Then
		Select	Case When :ls_moneda = '1' Then Factor_peso Else Factor End
		Into 		:ln_factor_seguro
		From 		Tipo_seguro
		Where 	Codigo = :ll_cod_seguro
		And		Rownum = 1
		Using		sqlca;
	End If
					
	Select	Case When :ls_moneda = '1' Then interes_pesos Else interes_uf End
	Into 		:ln_tasa_base  
	From 		interes_cuotas
	Where 	nro_cuotas = :ll_nro_cuotas   
	Using		sqlca;
				
	If Ll_cod_seguro = 1 Then
		ln_tasaGasto	= ln_tasaGasto + ln_factor_seguro
	End If
	ln_gastos_adm		= Ll_nro_cuotas * ln_tasaGasto
	
	If ls_forma_pago = '1' Or ls_forma_pago = '3' Then
		ln_gastos_adm	= 0
		ln_tasa_base	= 0
	End If
	
	If ls_moneda = '1' Then ln_gastos_adm = Long(ln_gastos_adm)
	dw_1.Object.Gastos_adm[ 1] = ln_gastos_adm
	dw_1.Object.Tasa_base[ 1] = ln_tasa_base	
End If

end subroutine

public function datetime wf_vencimientomant (integer al_ctas, datetime ad_vcto);
/* wf_VencimientoMan( al_ctas, ad_vcto ) */
DateTime	ld_ret
String	lsVenc
Int	liCuotas

If al_ctas > 0 Then 
	liCuotas = al_ctas - 1
End If
liCuotas = f_Zero( liCuotas )

SetNull( ld_ret )
If liCuotas > 0 And f_IsDate( ad_vcto )Then 
	lsVenc = String( ad_vcto, 'yyyymmdd' )
	Select Last_Day(Add_Months(:ad_Vcto, :liCuotas))
	Into	:ld_ret
	From dual;
End If

If liCuotas = 0 And f_IsDate( ad_vcto )Then 
	lsVenc = String( ad_vcto, 'yyyymmdd' )
	Select Last_Day( To_Date( :lsVenc, 'yyyymmdd' ) )
	Into	:ld_ret
	From dual;
End If

Return ld_ret
end function

public function integer wf_estatus_comision ();
DateTime	ld_pie, ld_prim, ld_entre
String	ls_uso, ls_agente, ls_canal


dw_1.AcceptText( )

ls_uso	= UpperTrim( dw_1.Object.Uso[ 1])
ld_pie	= dw_1.Object.fecha_pie[ 1]
ld_prim	= dw_1.Object.fecha_prim[ 1]
Choose Case  ls_uso
	Case 'NF' 
		dw_1.Object.estatus_comision[ 1] = '1'
		If f_IsDate( ld_pie ) Then
			ld_entre = wf_VencimientoPrim( 7, ld_pie )
		Else
			ld_entre = wf_VencimientoPrim( 7, ld_prim )
		End If
		dw_1.Object.fecha_entre[ 1] = ld_entre
		
	Case 'NI' 
		ls_agente = UpperTrim( dw_1.object.Agente[ 1] )
		
		Select	canal
		Into 		:ls_canal  
		From	 	Agentes  
		Where 	cod_age = :ls_agente   
		Using		sqlca;
		
		If ls_canal='NF' Then
			dw_1.object.estatus_comision[ 1] = '1'
		Else
			dw_1.object.estatus_comision[ 1] = '0'
		End If
		dw_1.object.fecha_entre[ 1] = dw_1.object.fecha[ 1] 
		
End Choose

Return 1
end function

public function datetime wf_vencimientoprim (integer al_ctas, datetime ad_vcto);
/* wf_VencimientoPrim( al_ctas, ad_vcto ) */
DateTime	ld_ret
Int	liCuotas

liCuotas = al_ctas - 1
liCuotas = f_Zero( liCuotas )

If liCuotas > 0 And f_IsDate( ad_vcto )Then 
	Select To_Date( To_Char(LAST_DAY(Add_Months(:ad_Vcto, :liCuotas)), 'yyyymmdd'), 'yyyymmdd' ) 
	Into	:ld_ret
	From dual;
Else
	SetNull( ld_ret )
End If

Return ld_ret
end function

public function boolean wf_saveseg ();
Long		ll_nro, row
String	ls_bar, ls_bas, ls_ser, ls_moneda, ls_forma_pago, &
			ls_gen, ls_edo, ls_msg


dw_1.AcceptText( )
dw_list.AcceptText( )

row  = 1
ls_bar = UpperTrim( dw_1.Object.Barra[ row] )
ls_bas = UpperTrim( dw_1.Object.Base[ row] )
ls_ser = UpperTrim( dw_1.Object.Serie[ row] )
ll_nro = f_Zero( dw_1.Object.nro_oferta[ row] )
ls_moneda = UpperTrim( dw_1.Object.Moneda[ row] )
ls_forma_pago = UpperTrim( dw_1.Object.Forma_pago[ row] )


uo_DataStore	lds_seg
f_CreateDS( lds_seg, 'd_arch_mul_revision_info_save_seg', SqlCa )

SetMicrohelp( 'Guardando Seguros del Contrato ' + ls_Bar )

Integer	i, li_seg, li_reg, li_ret
Dec		ln_factorseg, ln_Folio_Seguro
String	ls_Estado_Seguro
DateTime	ld_fecha_crea

dw_list.AcceptText( )
ld_fecha_crea = TodayDT( )

For i = 1 To dw_list.RowCount( )
	li_seg = f_Zero( dw_list.Object.cod_seguro[ i] )
	li_reg = f_Zero( dw_list.Object.estado_reg[ i] )
	If li_reg = 1 Then li_reg = 0 Else li_reg = 1
	
	If ls_Moneda = '1' Then
		ln_factorSeg = f_Zero( dw_list.Object.factor_peso[ i] )
	Else
		ln_factorSeg = f_Zero( dw_list.Object.factor_prima[ i] )
	End If

	ln_Folio_Seguro = f_Zero( dw_list.Object.Folio_Seguro[ i] )
	ls_Estado_Seguro = UpperTrim( dw_list.Object.Estado_Seguro[ i] )
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

Return True
end function

public function decimal wf_tasabase ();
/* wf_TasaBase( ) */
Dec		ln_tasa_base, ln_nro_cuotas
String	ls_Moneda, ls_FormaPago


dw_1.Accepttext( )
		
ln_nro_cuotas = dw_1.Object.nro_cuotas[ 1]
ls_Moneda = dw_1.Object.Moneda[ 1]
ls_FormaPago = dw_1.Object.Forma_Pago[ 1]

If Not ls_FormaPago = '1' And Not ls_FormaPago = '3' Then
	Select	Case :ls_Moneda When '1' Then interes_pesos Else interes_uf End As tasa_base
	Into		:ln_tasa_base
	From		Interes_Cuotas 
	Where		nro_cuotas = :ln_nro_cuotas ;
End If

dw_1.Object.tasa_base[ 1] = ln_tasa_base

Return ln_tasa_base
end function

public function decimal wf_tasainteres ();
/* wf_TasaInteres( ) */
Dec		ln_ValorCuota, ln_SaldoFinanciar
Dec{4}	ln_tasa, ln_tasaInteres
Integer	li_Plazo
String	ls_Moneda, ls_FormaPago


dw_1.Accepttext( )
		
ls_Moneda = dw_1.Object.Moneda[ 1]
ls_FormaPago = dw_1.Object.Forma_Pago[ 1]

li_Plazo = f_Zero( dw_1.Object.nro_cuotas[ 1] )
ln_ValorCuota = f_Zero( dw_1.Object.valor_cuota[ 1] )
ln_SaldoFinanciar = f_Zero( dw_1.Object.SaldoFinanciar[ 1] )

If ls_Moneda = '1' Then
	ln_ValorCuota = Long( ln_ValorCuota )
	ln_SaldoFinanciar = Long( ln_SaldoFinanciar )
End If

If Not ls_FormaPago = '1' And Not ls_FormaPago = '3' Then
	ln_ValorCuota = 0 - ln_ValorCuota
	ln_tasa = Rate( li_Plazo, ln_ValorCuota, ln_SaldoFinanciar )
	
	If ln_tasa <= 0.0001 Then
		ln_tasa = 0.0001 
		ln_tasaInteres = 0.0001 
	Else
		ln_tasaInteres = ln_tasa / 100 
	End If

	If Not (ln_tasa > 0 And ln_tasa < 10) Then
		ln_tasa = 0.0001 
		ln_tasaInteres = 0.0001 
	End If

End If

dw_1.Object.Tasa[ 1] = ln_tasa
dw_1.Object.Tasa_interes_cuota[ 1] = ln_tasaInteres

Return ln_tasa
end function

public function decimal wf_importeiva ();
/* wf_ImporteIVA( ) */
Dec		ln_PorcImpConIVA, ln_ImporteIVA, ln_Precio_contrato, ln_Pie 
Dec{4}	ln_PorcIVA
Integer	li_CodigoMP


dw_1.Accepttext( )
		
li_CodigoMP				= f_Zero( dw_1.Object.CodigoMP[ 1] )
ln_PorcIVA				= f_Zero( dw_1.Object.TasaIVA[ 1] )
ln_PorcImpConIVA		= f_Zero( dw_1.Object.PorcImpConIVA[ 1] )
ln_Precio_contrato	= f_Zero( dw_1.Object.Precio[ 1] )
ln_Pie					= f_Zero( dw_1.Object.Pie[ 1] )

// ln_PorcIVA := 19 ;
If ln_PorcImpConIVA = 0 Then
	Select PorcImpConIVA
   Into   :ln_PorcImpConIVA
   From   MPProducto 
   Where  codigomp = :li_CodigoMP ;

	ln_PorcImpConIVA = f_Zero( ln_PorcImpConIVA ) ;
End If

If ln_PorcImpConIVA > 0 Then
	ln_ImporteIVA = ( ( ln_Precio_contrato - ln_Pie ) * ( ln_PorcImpConIVA / 100 ) ) * ( ln_PorcIVA / 100 ) 
End If

dw_1.Object.PorcImpConIVA[ 1] = ln_PorcImpConIVA
dw_1.Object.ImporteIVA[ 1] = ln_ImporteIVA

Return ln_ImporteIVA
end function

public function decimal wf_totalseguros ();
Dec		ln_totseg
Long		rows 
String	ls_moneda

dw_1.Accepttext( )
dw_list.Accepttext( )
ls_moneda = f_Trim( dw_1.Object.Moneda[ 1] )

rows = dw_list.RowCount( )
If rows > 0 Then
	Choose Case ls_moneda
		Case '1' //Pesos
			ln_totseg = f_Zero( dw_list.Object.total_SegPesos[ rows] )
			
		Case '2' //UF
			ln_totseg = f_Zero( dw_list.Object.total_SegUF[ rows] )
	End Choose
End If

dw_1.Object.total_seguros[ 1] = ln_totseg
dw_1.AcceptText( )

Return ln_totseg
end function

public function boolean wf_save ();
dw_1.SetFocus( )

If Not wf_SaveBefore( ) Then Return False

If Not wf_SaveDocument( ) Then Return False

ib_saved = True
gw_frame.SetMicroHelp( 'Listo' )
Close( This )

Return True

end function

public function integer wf_total ();
DateTime	ld_prim, ld_vigencia, ld_contrato
Dec		ln_factor, ln_factor_gasto_adm, ln_pie, ln_gasto_adm, ln_precio_contrato, ln_saldo_financiar, ln_valor_cuota, ln_factor_cuota
Int		li_plazo, li_diasvcto, li_DiasMin
String	ls_moneda, ls_base, ls_forma_pago


dw_1.AcceptText( )

ls_base			= Left( UpperTrim( dw_1.Object.Barra[ 1] ), 1 )
ls_moneda		= f_Trim( dw_1.Object.Moneda[ 1] )
ls_forma_pago	= f_Trim( dw_1.Object.Forma_pago[ 1] )

ld_prim = dw_1.Object.fecha_prim[ 1]
ld_contrato = dw_1.Object.fecha[ 1] //fecha_ctto

If Not f_IsDate( ld_contrato ) Then
	blEclipse.Messagebox( Title, 'Para poder continuar debe ingresar la fecha de contrato.', Exclamation! )
	Return -1
End If

li_DiasVcto = f_Zero( DaysAfter( Date(ld_contrato), Date(ld_prim) ) )
ld_vigencia = dw_1.Object.fecha_factor_vigente[ 1]

li_plazo = f_Zero( dw_1.Object.Nro_Cuotas[ 1] ) //Plazo
ln_pie = f_Zero( dw_1.Object.Pie[ 1] )
ln_precio_contrato = f_Zero( dw_1.Object.Precio[ 1] ) //Precio_contrato
//ln_precio_contrato = f_Zero( dw_1.Object.Precio_contrato[ 1] ) //
//dw_1.Object.dias_vencimiento_prim[ 1] = li_diasvcto


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

Dec{4}	lnPorc, lnValor_cuotaIVA, lnPieIVA, lnIVACuota, lnIVAPie, lnImporteIVA, lnIVAImporte
Int	lnCodigoMP

lnCodigoMP = f_Zero( dw_1.Object.CodigoMP[ 1] )

// Obtener la Proporción del IVA
Select Sum(porcSubtotalimp) Into :lnPorc 
From   mpProductoDet 
Where  CodigoMP = :lnCodigoMP 
And    IVA > 0 ;

lnIVACuota = ( ln_valor_cuota * ( in_PorcIVA / 100 ) ) ;
lnIVACuota = lnIVACuota * ( lnPorc / 100 ) ;
lnValor_cuotaIVA = ln_valor_cuota + lnIVACuota ;

lnIVAPie = ( ln_pie * ( in_PorcIVA / 100 ) ) ;
lnIVAPie = lnIVAPie * ( lnPorc / 100 ) ;
lnPieIVA = ln_pie + lnIVAPie ;

lnIVAImporte = ( ln_precio_contrato * ( in_PorcIVA / 100 ) ) ;
lnIVAImporte = lnIVAImporte * ( lnPorc / 100 ) ;


If ls_moneda = '1' Then
	ln_gasto_adm = Long( Round( ln_gasto_adm, 0 ) )
	ln_saldo_financiar = Long( Round( ln_saldo_financiar, 0 ) )
	ln_valor_cuota = Long( Round( ln_valor_cuota, 0 ) )
	lnValor_cuotaIVA = Long( Round( lnValor_cuotaIVA, 0 ) )
	ln_pie = Long( Round( ln_pie, 0 ) )
	lnPieIVA = Long( Round( lnPieIVA, 0 ) )
	lnIVAImporte = Long( Round( lnIVAImporte, 0 ) )
	//ln_factor_cuota = Long( Round( ln_factor_cuota, 0 ) )
End If

dw_1.Object.Gastos_adm[ 1] = ln_gasto_adm
dw_1.Object.Saldo_financiar[ 1] = ln_saldo_financiar
dw_1.Object.Valor_cuota[ 1] = ln_valor_cuota
dw_1.Object.Factor_cuota[ 1] = ln_factor_cuota
dw_1.Object.Valor_cuota_IVA[ 1] = lnValor_cuotaIVA
dw_1.Object.Pie_IVA[ 1] = lnPieIVA
dw_1.Object.ImporteIVA[ 1] = lnIVAImporte
dw_1.Object.PorcImpConIVA[ 1] = lnPorc

dw_1.Accepttext( )

Return ln_saldo_financiar
end function

public function boolean wf_savepiepactado ();
Long		ll_nro, row
String	ls_bar, ls_bas, ls_ser, ls_moneda, ls_forma_pago, &
			ls_gen, ls_edo, ls_msg


dw_1.AcceptText( )
dw_list.AcceptText( )

row  = 1
ls_bar = UpperTrim( dw_1.Object.Barra[ row] )
ls_bas = UpperTrim( dw_1.Object.Base[ row] )
ls_ser = UpperTrim( dw_1.Object.Serie[ row] )
ll_nro = f_Zero( dw_1.Object.nro_oferta[ row] )


uo_DataStore	lds_pie
f_CreateDS( lds_pie, 'd_arch_mul_digitacion_info_pie_save', SqlCa )

SetMicrohelp( 'Guardando Pie Pactado del Contrato ' + ls_Bar )

Integer	i, li_seg, li_reg, li_ret
Dec		ln_factorseg, ln_Folio_Seguro
DateTime	ld_fecha_crea

ld_fecha_crea = TodayDT( )

DateTime	ldCrea, ldVence, ldPago
Dec		lnMonto, lnPie, lnPagPeso, lnPagUF
Integer	lnCuotas, lnDias, lnNroCta, lnChDias
Long		lnFolio
String	lsEstado, lsUsuario, lsCanal, lsTipo_cob, lsCaja, lsMoneda

lsMoneda = UpperTrim( dw_1.Object.Moneda[ row] )

dw_1.AcceptText( )
lnPie		= f_Zero( dw_1.Object.Pie[ 1] ) 
lnDias	= f_Zero( idw_pac.Object.Dias[ 1] ) 
lnChDias	= f_Zero( idw_pac.Object.chDias[ 1] ) 
lnCuotas	= f_Zero( idw_pac.Object.Cuotas[ 1] )

idw_pie.AcceptText( )


Dec	lnTotPagPesos, lnTotPagUF

If idw_pie.RowCount( ) > 0 Then
	lnTotPagPesos	= f_Zero( idw_pie.Object.TotPagadoPeso[ 1] )
	lnTotPagUF		= f_Zero( idw_pie.Object.TotPagadoUF[ 1] )
End If

// No se puede modificar nada porque ya hay pagos
If lnTotPagPesos > 0 Or lnTotPagUF > 0 Then
	Return True
End If

// Limpiar referencia anterior
li_ret = lds_pie.Retrieve( ls_bas, ls_ser, ll_nro, lsEstado, ldCrea, ldVence, &
										0, 0, '', 0, '', &
										'', ldPago, '', '', 0, 0 ) 
	
If li_ret > 0 Then
	ls_gen = f_Trim( lds_pie.Object.CodigoGenerado[ 1] )
	ls_edo = f_Trim( lds_pie.Object.Estado[ 1] )
	ls_msg = f_Trim( lds_pie.Object.MensajeResultado[ 1] )
Else
	ls_gen = '-2'
	ls_edo = 'ERR'
	ls_msg = lds_pie.is_ErrText
	If ls_msg = '' Then ls_msg = 'Se ha producido un error indeterminado en la transacción, ' + &
											'es posible que existe un problema de la definición del objeto DS y el Procedure.' 
End If
	
If f_In (ls_edo, {'ERR', 'ERC', 'IER'}) Then
	RollBack Using SqlCa ;
	Destroy lds_pie
	blEclipse.MessageBox( Title, ls_msg, StopSign! )
	Return False
End If

lnCuotas = 0

// Guardar Detalle del Pie
For i = 1 To idw_pie.RowCount( )
	lsEstado = idw_pie.Object.Estado[ i] 
	ldCrea = idw_pie.Object.Fecha_Crea[ i]
	ldVence = idw_pie.Object.Fecha_venc_cta[ i] 
	lnNroCta = idw_pie.Object.Numero_Cuota[ i] 
	lnMonto = Round( idw_pie.Object.Monto_Cuota[ i] , 4 )
	lsTipo_cob = idw_pie.Object.Tipo_cob[ i] 
	lnFolio = idw_pie.Object.Folio[ i] 
	lsCaja = idw_pie.Object.Caja[ i] 
	lsUsuario = idw_pie.Object.Usuario[ i] 
	ldPago = idw_pie.Object.Fecha_Pago[ i]
	lsCanal = idw_pie.Object.Canal[ i] 
	lnPagPeso = idw_pie.Object.Monto_pie_pagado_peso[ i] 
	lnPagUF   = idw_pie.Object.Monto_pie_pagado_uf[ i] 
	
	li_ret = lds_pie.Retrieve( ls_bas, ls_ser, ll_nro, lsEstado, ldCrea, ldVence, &
										lnNroCta, lnMonto, lsTipo_cob, lnFolio, lsCaja, &
										lsUsuario, ldPago, lsCanal, lsMoneda, lnPagPeso, lnPagUF ) 
	
	If li_ret > 0 Then
		ls_gen = f_Trim( lds_pie.Object.CodigoGenerado[ 1] )
		ls_edo = f_Trim( lds_pie.Object.Estado[ 1] )
		ls_msg = f_Trim( lds_pie.Object.MensajeResultado[ 1] )
	Else
		ls_gen = '-2'
		ls_edo = 'ERR'
		ls_msg = lds_pie.is_ErrText
		If ls_msg = '' Then ls_msg = 'Se ha producido un error indeterminado en la transacción, ' + &
												'es posible que existe un problema de la definición del objeto DS y el Procedure.' 
	End If
		
	If f_In (ls_edo, {'ERR', 'ERC', 'IER'}) Then
		RollBack Using SqlCa ;
		Destroy lds_pie
		blEclipse.MessageBox( Title, ls_msg, StopSign! )
		Return False
	End If
	
	lnCuotas = lnCuotas + 1 ;
Next

Update mpcontrato
Set    pie_cuotas = :lnCuotas,
       pie_chdias = :lnChDias,
       pie_dias   = :lnDias
Where base   = :ls_bas   
And   serie  = :ls_ser 
And   numero = :ll_nro  
;			
Destroy lds_pie

Return True
end function

on w_arch_mul_digitacion_info.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_arch_mul_digitacion_info.destroy
call super::destroy
destroy(this.tab_1)
end on

event open;call super::open;
PostEvent( 'PostOpen' )
end event

event resize;
Call w_gen_Document::Resize ;

end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_digitacion_info
integer width = 4114
integer height = 2464
string title = ""
string dataobject = "d_arch_mul_digitacion_info"
end type

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
Dec		ln_nro_cuotas, ln_pie, ln_precio
DateTime	ld_ult

Integer	li_nil, li_par, li_mp
String	ls_DB, ls_nil


//dw_list.Reset( )
ib_saved = False
SetNull( li_nil )
AcceptText( )

Long	ll_nro
String ls_bar, ls_bas, ls_ser

ls_Bar = This.Object.Barra[ row]
ls_bas = Left( ls_Bar, 1 )
ls_ser = Mid( ls_Bar, 2, 1 )
ll_nro = Long( Mid( ls_Bar, 3 ) )

MP			mp

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
		wf_OpenDoc( ls_Cto, ll_rut, li_Par, ls_DB )
		
		This.Object.NomCliente[ row] = ''
		
		If data = ''  Or ll_rut = 0 Then
			Return
		End If
		
		Select	DV, NVL( cli.a_paterno, '' ) || ' ' || NVL( cli.a_materno, '') || ' ' || Nvl( cli.Nombre, '')
		Into		:ls_dv, :ls_nom
		From		cliente cli
		Where		cli.rut = :ll_rut
		Using		SqlCa ;
		
		li_rpta = 1 
		If SqlCa.SqlCode = 100 Then
			li_rpta = blEclipse.Messagebox( Title, 'RUT de Cliente no encontrado.' + Char(13) + Char(13) + &
							'¿Confirma que desea agregarlo como nuevo cliente?', Question!, YesNo! )
							
			If Not li_rpta = 1 Then
				Close( Parent )
				Return
			End If
		
			lstr_parm.n_num[ 1] = ll_rut
			lstr_parm.s_cad[ 1] = ls_DB
			
			FadeEffect( True )
			OpenWithParm( w_arch_mul_cliente_edit, lstr_parm )
			FadeEffect( False )
			
		End If
		
		Object.DV[ row] = ls_dv
		Object.NomCliente[ row] = ls_nom
		Object.Rut[ row] = ll_rut
		
		//wf_RutMask( dwo.Name )
		Return 
		
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
		
		AcceptText( )
		
	Case 'fecha'
		DateTime	ld_prim
		This.Object.UF_dia[ row] = f_GenTipoCambioMda( DateTime( data ), 'UF' )
		This.Event ItemChanged( row, This.Object.Moneda, This.Object.Moneda[ row] )
		
		//No será a un año, sino el último día del mes
		ld_prim = wf_VencimientoMant( 13, DateTime( data ) )
		//ld_prim = wf_VencimientoMant( 1, DateTime( data ) )
		If f_IsDate( ld_prim ) Then
			This.Object.Fecha_m[ row] = ld_prim
		End If
		wf_Total( )

	Case 'fecha_prim'
		ld_Prim = DateTime( data )
		If ld_Prim < id_Min or ld_Prim > id_Max Then
			blEclipse.MessageBox( Title, 'Fecha Primer Vencimiento Inválida.', Exclamation! )
			This.Object.fecha_prim[ row] = id_hoy
			Return 1
		End If
		
		ln_nro_cuotas = f_Zero(This.Object.nro_cuotas[ row])
		ld_ult = wf_VencimientoPrim( ln_nro_cuotas, ld_Prim )
		If f_IsDate( ld_ult ) Then
			This.Object.Fecha_Ult[ row] = ld_ult
		End If
		wf_Total( )
		
	Case 'cod_parque'
		String	ls_pro
		
		li_par = Integer( data )
		ls_pro = This.Object.Cod_Producto[ row]
		
		This.Object.Area[ row] = ''
		This.Object.Sector[ Row] = ''

		This.GetChild( 'Area', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_Par, ls_pro )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If

		This.GetChild( 'beneficio_complementario', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_Par )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If

		AcceptText( )
		This.Event ItemChanged( 1, This.Object.Area, This.Object.Area[ 1] )
		
		idw_cto.Object.Area[ row] = ''
		idw_cto.Object.Sector[ Row] = ''

		idw_cto.GetChild( 'Area', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_Par, ls_pro )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If

		AcceptText( )
		idw_cto.Event ItemChanged( 1, idw_cto.Object.Area, idw_cto.Object.Area[ 1] )
		
	Case 'area'
		li_par = This.Object.Cod_Parque[ row]
		This.Object.Sector[ Row] = ''
		
		dw_1.GetChild( 'sector', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_par, data )
		
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
		lds_mp.ColumnsCopy( 1, {'precio', 'cod_producto', 'uso', 'tipo_producto', 'area', 'capacidad', 'tipo_sepult', 'pie' }, This, row )
		ls_pro = UpperTrim( lds_mp.Object.cod_producto[ 1] )
		
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
		
		wf_ImporteIVA( )
		wf_Total( )
		
	Case 'tipo_venta'
		This.ColEnabled( {'rut_institucional'}, (data = '6') )
		
	Case 'pie'
		wf_Total( )
		wf_ImporteIVA( )
		
	Case 'precio'
		wf_Total( )
		wf_ImporteIVA( )
		
	Case 'valor_cuota'
		This.Object.valor_cuota_iva[ row] = Dec( f_Trim(data) ) + (Dec( f_Trim(data) ) * in_PorcIVA )/ 100
		
	Case 'moneda'
		String	ls_moneda
		Dec ln_valor_cuota, ln_descuento_por, ln_gastos_adm, ln_UF_Dia
		
		ls_moneda			= data
		ln_valor_cuota		= f_Zero( This.Object.Valor_cuota[ row] )
		ln_pie				= f_Zero( This.Object.Pie[ row] ) 
		ln_descuento_por	= f_Zero( This.Object.Descuento_por[ row] )
		ln_precio			= f_Zero( This.Object.Precio[ row] )
		ln_gastos_adm		= f_Zero( This.Object.Gastos_adm[ row] )
		ln_UF_Dia			= f_Zero( This.Object.UF_Dia[ row] )
		
		Choose Case ls_moneda
			Case '1'
				If ln_valor_cuota < 500 Then &
					This.Object.Valor_cuota[ row] = Long( Round((ln_valor_cuota * ln_UF_Dia), 2))				
				
				If ln_gastos_adm < 500 Then &
					This.Object.Gastos_adm[ row] = Long( Round((ln_gastos_adm * ln_UF_Dia), 2))
				
				If ln_precio < 500 Then &
					This.Object.Precio[ row] = Long( Round((ln_Precio * ln_UF_Dia), 2))
				
				If ln_pie < 500 Then &
					This.Object.Pie[ row] = Long( Round((ln_Pie * ln_UF_Dia), 2))
				
				If ln_descuento_por < 500 Then &
					This.Object.Descuento_por[ row] = Long( Round((ln_descuento_por * ln_UF_Dia), 2))
				
				
			Case '2' //UF
				If ln_valor_cuota >= 500 Then &
					This.Object.Valor_cuota[ row] = (ln_valor_cuota / ln_UF_Dia)	
					
				If ln_gastos_adm >= 500 Then &
					This.Object.Gastos_adm[ row] = (ln_gastos_adm / ln_UF_Dia)	
					
				If ln_precio >= 500 Then &
					This.Object.Precio[ row] = (ln_precio / ln_UF_Dia)	
					
				If ln_pie >= 500 Then &
					This.Object.Pie[ row] = (ln_pie / ln_UF_Dia)	
					
				If ln_descuento_por >= 500 Then &
					This.Object.Descuento_por[ row] = (ln_descuento_por / ln_UF_Dia)	
					
		End Choose
				
		wf_TasaBase( )
		wf_TasaInteres( )
		wf_ImporteIVA( )
		wf_GastosAdm( ) 
		wf_Total( )
		
	Case 'nro_cuotas'
		ln_nro_cuotas = f_Zero( Integer( f_Trim( data )) )
		ld_ult = wf_VencimientoMant( ln_nro_cuotas, This.Object.Fecha_Prim[ row] )
		If f_IsDate( ld_ult ) Then
			This.Object.Fecha_Ult[ row] = ld_ult
		End If
					
		wf_TasaBase( )
		wf_TasaInteres( )
		wf_GastosAdm( ) 
		wf_Total( )
		
	Case 'forma_pago'
		Dec	ln_min
		String	ls_forma_pago 
		
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
			This.Object.nro_cuotas[ row] = 0
		End If		
		
		wf_TasaBase( )
		wf_TasaInteres( )
		wf_ImporteIVA( )
		wf_GastosAdm( ) 
		wf_Total( )
		
	Case 'porcentajepie'
		Dec		ln_por 
		String	ls_msg, ls_col	
		
		ls_forma_pago = Trim( This.Object.forma_pago[ row] )
		li_mp = f_Zero( This.Object.CodigoMP[ row] )
		
		data = f_Trim( data )		
		ln_por = f_Zero( Dec( data ) )
		
		ln_min = mp.PorcentajePie( li_mp )
		
		If ( ls_forma_pago = '1' Or ls_forma_pago = '3' ) Then
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
		
		wf_TasaBase( )
		wf_TasaInteres( )
		wf_ImporteIVA( )
		wf_GastosAdm( ) 
		wf_Total( )
		
	Case 'fecha_pie'
		Dec	ln_SumMontoCuota
		/*
		Select Sum( monto_cuota )
		Into :ln_SumMontoCuota
		From	Detalle_Pago_pie
		Where base = :ls_bas
		And   serie = :ls_ser
		And   numero = :ll_nro ;
		
		ln_SumMontoCuota = f_Zero( ln_SumMontoCuota )
		This.Object.Pie[ row] = ln_SumMontoCuota
		*/
	Case 'tipo_mant'
		Integer	li_year
		String	ls_fecmant
		DateTime	ld_contrato, ld_mant
		
		data = UpperTrim( data )
		
		ld_contrato = Object.fecha[ row]
		ls_fecmant = String( ld_contrato, 'mm/dd' )
		li_year = Year( Date( ld_contrato ) )
		li_year = li_year + 1
		ls_fecmant = String(li_year) + '/' + ls_fecmant
		ld_mant = DateTime( Date( ls_FecMant) )
		
		If f_IsDate( ld_contrato ) Then
			ld_mant = wf_VencimientoMant( 13, ld_contrato )
		End If
		
		If Not data = 'S' Then
			Object.fecha_m[ row] = ld_mant			
		End If
		
	Case 'codigo_tipo_seguro' 
		Int		li_edad, ll_tipo_seguro
		DateTime	ld_fecha_nac, ld_vigencia
		Dec		ll_cantidad, ln_factor_seg_comp
		
		data = f_Trim( data )
		ll_tipo_seguro	= Long( data )	
		
		If ll_tipo_seguro = 0 Then
			Return
		End If
		
		If Not dw_list.Find( 'cod_seguro = ' + data ) > 0 then
			blEclipse.MessageBox( Parent.Title, 'Seguro Complementario seleccionado no se encuentra Vigente', Exclamation! )
			Object.Codigo_tipo_seguro[ row] = li_nil
			Return 1
		End If
		
		ld_fecha_nac	= idw_cli.Object.fecha_nac[ row]
		li_edad = f_GetEdad( ld_fecha_nac )
		select	cantidad_beneficiario,   
					factor,
					fecha_duracion_vigencia
		into 		:ll_cantidad,   
					:ln_factor_seg_comp,
					:ld_vigencia
		from 		tipo_seguro 
		where 	codigo = :ll_tipo_seguro   
		using		sqlca;
		
		if Not sqlca.sqlcode = 0 then Return
		
		If ll_tipo_seguro = 2 Then
			if li_edad<=65 then
				//ls_string		= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(ln_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
				//openwithparm(w_ingreso_seguro_complementario,ls_string)
			Else
				blEclipse.Messagebox( Parent.Title, 'No es posible Ingresar Beneficiarios, Titular debe tener Menos de 65 Años.', Exclamation! )
			End If
		Elseif ll_tipo_seguro > 0 then
			If ld_vigencia > id_hoy then
				//ls_string	= gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(ll_cantidad)+'~t'+string(ln_factor_seg_comp)+'~t'+string(ll_tipo_seguro)
				//openwithparm(w_ingreso_seguro_complementario,ls_string)
			Else
				blEclipse.Messagebox( Parent.Title, 'Seguro seleccionado No Vigente', Exclamation! )
				This.Object.codigo_tipo_seguro[ row] = li_nil
				Return 1
			End If
		End If

End Choose
end event

event dw_1::key;call super::key;
String	ls_cod, ls_nil, ls_ok


If Not Key = KeyF3! Then Return


SetNull( ls_nil )

Choose Case GetColumnName( )
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
MP mp

Choose Case dwo.Name
	Case 'cb_age'
		This.SetColumn( 'Cod_Age' )
		This.Event Key( KeyF3!, 0 )
		
	Case 'cb_mp'
		MP.CodigoMP = dw_1.Object.CodigoMP[ 1] 
		MP.DB = UpperTrim( dw_1.Object.DB[ 1] )
		OpenWithParm( w_arch_mul_consultaPrecio, MP )

	Case 'cb_hijos'
		MP.CodigoMP = dw_1.Object.CodigoMP[ 1] 
		MP.Barra = dw_1.Object.Barra[ 1] 
		MP.RUT = dw_1.Object.RUT[ 1] 
		MP.DV  = UpperTrim( dw_1.Object.DV[ 1] )
		MP.DB  = UpperTrim( dw_1.Object.DB[ 1] )
		
		OpenWithParm( w_arch_mul_consultaHijos, MP )

	Case 'cb_ben'
		MP.CodigoMP		= dw_1.Object.CodigoMP[ 1] 
		MP.Barra			= dw_1.Object.Barra[ 1] 
		MP.RUT			= dw_1.Object.RUT[ 1] 
		MP.DV				= UpperTrim( dw_1.Object.DV[ 1] )
		MP.DB				= UpperTrim( dw_1.Object.DB[ 1] )
		MP.Base			= dw_1.Object.Base[ 1] 
		MP.Serie			= dw_1.Object.Serie[ 1] 
		MP.Numero		= dw_1.Object.Numero[ 1] 
		MP.CodParque	= dw_1.Object.Cod_Parque[ 1] 
		MP.Capacidad	= f_Zero( dw_1.Object.Capacidad_cre[ 1] )
		MP.TipoBeneficiarios = f_Zero( dw_1.Object.Tipo_Beneficiarios[ 1] )
		
		OpenWithParm( w_arch_mul_Beneficiarios, MP )
End Choose
end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;
Choose Case dwo.Name
	Case 'porcentajepie'
		SelectText( 1, 100 )
End Choose
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_digitacion_info
integer width = 4393
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_digitacion_info
event total ( )
boolean visible = true
integer x = 2693
integer y = 352
integer width = 1454
integer height = 460
string dataobject = "d_arch_mul_revision_info_seg"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_detselect = true
boolean ib_exportxls = false
integer ii_detheight = 90
integer ii_posdety = 15
integer ii_maxwidth = 4820
end type

event dw_list::total();
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
//wf_Total( )
end event

event dw_list::itemchanged;call super::itemchanged;

ib_saved = False
PostEvent( 'Total' )

end event

type tab_1 from tab within w_arch_mul_digitacion_info
integer x = 192
integer y = 840
integer width = 3968
integer height = 624
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_cto tabpage_cto
tabpage_cli tabpage_cli
tabpage_lab tabpage_lab
tabpage_pie tabpage_pie
end type

on tab_1.create
this.tabpage_cto=create tabpage_cto
this.tabpage_cli=create tabpage_cli
this.tabpage_lab=create tabpage_lab
this.tabpage_pie=create tabpage_pie
this.Control[]={this.tabpage_cto,&
this.tabpage_cli,&
this.tabpage_lab,&
this.tabpage_pie}
end on

on tab_1.destroy
destroy(this.tabpage_cto)
destroy(this.tabpage_cli)
destroy(this.tabpage_lab)
destroy(this.tabpage_pie)
end on

event selectionchanged;tab_1.tabpage_cto.tabtextcolor = f_Gen_Color( 't' )
tab_1.tabpage_cli.tabtextcolor = f_Gen_Color( 't' )
tab_1.tabpage_lab.tabtextcolor = f_Gen_Color( 't' )
tab_1.tabpage_pie.tabtextcolor = f_Gen_Color( 't' )

Choose Case newIndex
	Case 1
		tab_1.tabpage_cto.tabtextcolor = f_Gen_Color( 'st' )
	Case 2
		tab_1.tabpage_cli.tabtextcolor = f_Gen_Color( 'st' )
	Case 3
		tab_1.tabpage_lab.tabtextcolor = f_Gen_Color( 'st' )
	Case 4
		tab_1.tabpage_pie.tabtextcolor = f_Gen_Color( 'st' )
End Choose


end event

type tabpage_cto from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3931
integer height = 508
string text = "Datos del Contrato"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_cto dw_cto
end type

on tabpage_cto.create
this.dw_cto=create dw_cto
this.Control[]={this.dw_cto}
end on

on tabpage_cto.destroy
destroy(this.dw_cto)
end on

type dw_cto from uo_dw_edit within tabpage_cto
integer width = 3941
integer height = 524
integer taborder = 10
string dataobject = "d_arch_mul_digitacion_info_cto"
boolean border = false
boolean ib_ind = false
end type

event constructor;call super::constructor;
idw_cto = This
end event

event itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
Integer	li_par


Choose Case dwo.Name

	Case 'area'
		li_par = dw_1.Object.Cod_Parque[ row]
		This.Object.Sector[ Row] = ''
		
		This.GetChild( 'sector', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_par, data )
		
	Case 'moneda'
		dw_1.Event ItemChanged( row, dw_1.Object.Moneda, data )
		
End Choose

This.AcceptText( )
This.ColumnsCopy( 1, {'Area', 'Sector', 'Sepultura', 'Capacidad', 'Tipo_Sepult', 'Tipo_Cons', 'n_Reduccion', 'Uso', 'Moneda', 'Tipo_Producto'}, dw_1, 1 ) 
dw_1.AcceptText( )
ib_saved = False

end event

event editchanged;call super::editchanged;
ib_saved = False
end event

type tabpage_cli from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3931
integer height = 508
string text = "Información del Cliente"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_cli dw_cli
end type

on tabpage_cli.create
this.dw_cli=create dw_cli
this.Control[]={this.dw_cli}
end on

on tabpage_cli.destroy
destroy(this.dw_cli)
end on

type dw_cli from uo_dw_edit within tabpage_cli
integer width = 3941
integer height = 524
integer taborder = 30
string dataobject = "d_arch_mul_digitacion_info_cli"
boolean border = false
boolean ib_ind = false
end type

event constructor;call super::constructor;
idw_cli = This
end event

type tabpage_lab from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3931
integer height = 508
string text = "Información Laboral"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_lab dw_lab
end type

on tabpage_lab.create
this.dw_lab=create dw_lab
this.Control[]={this.dw_lab}
end on

on tabpage_lab.destroy
destroy(this.dw_lab)
end on

type dw_lab from uo_dw_edit within tabpage_lab
integer width = 4009
integer height = 560
integer taborder = 30
string dataobject = "d_arch_mul_digitacion_info_lab"
boolean border = false
boolean ib_ind = false
end type

event constructor;call super::constructor;
idw_lab = This
end event

type tabpage_pie from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3931
integer height = 508
string text = "Detalle Pie"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_pac dw_pac
dw_pie dw_pie
end type

on tabpage_pie.create
this.dw_pac=create dw_pac
this.dw_pie=create dw_pie
this.Control[]={this.dw_pac,&
this.dw_pie}
end on

on tabpage_pie.destroy
destroy(this.dw_pac)
destroy(this.dw_pie)
end on

type dw_pac from uo_dw_edit within tabpage_pie
integer width = 3895
integer height = 492
integer taborder = 10
string title = ""
string dataobject = "d_arch_mul_digitacion_info_pac"
boolean border = false
end type

event constructor;call super::constructor;
idw_pac = This
end event

event editchanged;call super::editchanged;
ib_saved = False
end event

event itemchanged;call super::itemchanged;
Int	lnChDias

Choose Case dwo.Name
	Case 'chdias'
		Int	lnNil
		
		SetNull( lnNil )
		lnChDias = f_Zero( Integer ( f_Trim( data ) ) )
		This.Object.Dias[ 1] = lnNil 
		
		This.ColEnabled( 'Dias', ( lnChDias = 3 ) )
		Goto Cuotas
		
	Case 'cuotas'
		Goto Cuotas
		
	Case 'dias'
		Goto Cuotas
		
	Case 'monto_primcuota'
		Goto Cuotas
		
End Choose

ib_saved = False
Return

Cuotas:
DateTime	ldVence
Dec		lnMonto, lnPie, lnMontoUlt, lnPrimCuota, lnPiePrimCuota
Integer	lnCuotas, lnDias, i

This.AcceptText( )
lnPie		= Round( f_Zero( dw_1.Object.Pie[ 1] ), 4 ) 
lnDias	= f_Zero( This.Object.Dias[ 1] ) 
lnChDias	= f_Zero( This.Object.chDias[ 1] ) 
lnCuotas	= f_Zero( This.Object.Cuotas[ 1] )
lnPrimCuota	= f_Zero( This.Object.monto_PrimCuota[ 1] )

If lnCuotas > 0 Then
	lnMonto = Round( lnPie / lnCuotas, 4 )
End If
If lnCuotas > 1 And lnPrimCuota > 0 Then
	lnPiePrimCuota = lnPie - lnPrimCuota
	lnMonto = Round( ( lnPiePrimCuota / ( lnCuotas - 1 ) ), 4 )
End If


Choose Case lnChDias
	Case 1
		ldVence = f_ServerDate( )
		
	Case 2
		ldVence = f_ServerDate( )
		ldVence = AddMonth( ldVence, 1 )
		
	Case 3
		ldVence = f_ServerDate( )
		ldVence = DateTime( RelativeDate( Date( ldVence ), lnDias ) )
End Choose

idw_pie.Reset( )
lnMontoUlt = lnPie 

For i = 1 To lnCuotas
	idw_pie.InsertRow( i )
	idw_pie.Object.Numero_Cuota[ i] = i
	idw_pie.Object.Monto_Cuota[ i] = lnMonto
	If i = 1 And lnCuotas > 1 And lnPrimCuota > 0 Then
		idw_pie.Object.Monto_Cuota[ i] = lnPrimCuota
	End If
	idw_pie.Object.Estado[ i] = 'P'
	dw_1.ColumnsCopy( 1, { 'Base', 'Serie', 'Moneda' }, idw_pie, i )
	idw_pie.Object.Fecha_Crea[ i] = f_ServerDate( )
	idw_pie.Object.Fecha_venc_cta[ i] = ldVence
	idw_pie.Object.Usuario[ i] = gs_Usuario
	idw_pie.Object.Canal[ i] = idw_cto.Object.Uso[ 1]
	idw_pie.Object.Numero[ i] = dw_1.Object.nro_oferta[ 1]
	ldVence = AddMonth( ldVence, 1 )
	idw_pie.AcceptText( )
	
	If i = 1 And lnCuotas > 1 And lnPrimCuota > 0 Then
		lnMontoUlt = lnMontoUlt - lnPrimCuota
	Else
		lnMontoUlt = lnMontoUlt - lnMonto
	End If
	If i = lnCuotas And lnCuotas > 1 Then
		lnMonto = lnMonto + lnMontoUlt
		idw_pie.Object.Monto_Cuota[ i] = lnMonto
	End If
	
Next


idw_pie.AcceptText( )



end event

type dw_pie from uo_dw_list within tabpage_pie
integer x = 869
integer y = 36
integer width = 2994
integer height = 444
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_arch_mul_digitacion_info_pie"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_detselect = true
integer ii_detheight = 80
integer ii_posdety = 10
integer ii_headheight = 80
end type

event constructor;call super::constructor;

idw_pie = This
end event

event clicked;call super::clicked;

If row > 0 Then 
	This.SetRow( row )
	This.ScrollToRow( row )
End If
end event

event itemchanged;call super::itemchanged;
Choose Case dwo.Name
	Case 'monto_cuota'
		idw_pac.Object.monto_PrimCuota[ 1] = f_Zero( Dec( data ) )
		idw_pac.Event ItemChanged( 1, idw_pac.Object.monto_PrimCuota, data )
		
		ib_saved = False
End Choose
end event

event editchanged;call super::editchanged;
ib_saved = False

end event

