//objectcomments Autor: César Vilela R.~r~nFunción: Edición de Datos del Cliente desde Caja
forward
global type w_arch_mul_cliente_edit from wa_response
end type
end forward

global type w_arch_mul_cliente_edit from wa_response
integer width = 3497
integer height = 2664
string title = "Actualizar Datos del Cliente"
boolean ib_posy = true
boolean ib_ind = true
end type
global w_arch_mul_cliente_edit w_arch_mul_cliente_edit

type variables

Boolean	ib_cli = False
String	is_aut


Cliente iCliente 
end variables

forward prototypes
public function integer wf_clientedatos ()
end prototypes

public function integer wf_clientedatos ();
uo_DataStore	lds_1 
LongLong	ll_rut, ll_xrut
String	ls_dv, ls_pat, ls_mat, ls_nom, ls_dir, ls_ciu, ls_com, ls_tel


dw_1.AcceptText( )
ll_rut = f_Zero( dw_1.Object.rut[ 1] )

If ll_rut = 0 Then 
	dw_1.Reset( )
	dw_1.InsertRow(0)
	Return 0
End If

/* Buscar en la Temporal de Rezago */
lds_1 = Create uo_DataStore
lds_1.dataObject = 'd_arch_caj_cliente_rezago'
lds_1.SetTransObject( SqlCa )

If lds_1.Retrieve( ll_rut ) > 0 Then 
	ls_dv  = lds_1.Object.dv[ 1 ]
	ls_pat = f_WordCap( f_Trim( lds_1.Object.ap_paterno[ 1 ] ) )
	ls_mat = f_WordCap( f_Trim( lds_1.Object.ap_materno[ 1 ] ) )
	ls_nom = f_WordCap( f_Trim( lds_1.Object.nombre[ 1 ] ) )
	ls_dir = Upper( f_Trim( lds_1.Object.direccion_part[ 1 ] ) )
	ls_ciu = f_Trim( lds_1.Object.c_codigo_ciu[ 1 ] )
	ls_com = f_Trim( lds_1.Object.c_codigo_com[ 1 ] )
	//ls_caj = f_Trim( lds_1.Object.c_codigo_caj[ 1 ] )
	//ls_mda = f_Trim( lds_1.Object.c_codigo_mda[ 1 ] )
	ls_tel = f_Trim( lds_1.Object.telefono_part[ 1 ] )
	ll_xrut = ll_rut
End If

/* Buscar en tabla Real de Clientes */
If lds_1.RowCount( ) <= 0 Then 
	Select	rut,
				dv,
				a_paterno, 
				a_materno, 
				Nombre,
				Direccion_p,
				comuna,
				ciudad,
				fono_p
	Into		:ll_xrut,
				:ls_dv, :ls_pat, :ls_mat, :ls_nom, :ls_dir, :ls_com, :ls_ciu, :ls_tel
	
	From		Cliente 
	Where		rut = :ll_rut ;

	ll_xrut = f_Zero( ll_xrut )
End If

/* Buscar en tabla de Clientes Rezago */
If ll_xrut = 0 Then
	Select	rut, dv,   
				ap_paterno, ap_materno, nombre,   
				direccion_part, comuna_part, ciudad_part,   
				telefono_part  
	Into		:ll_xrut,
				:ls_dv, :ls_pat, :ls_mat, :ls_nom, 
				:ls_dir, :ls_com, :ls_ciu, 
				:ls_tel
	From  cliente_rezago   
	Where rut = :ll_rut
	And   rownum = 1 ;
End If

dw_1.Object.dv[ 1 ] = ls_dv
dw_1.Object.ap_paterno[ 1 ] = ls_pat
dw_1.Object.ap_materno[ 1 ] = ls_mat
dw_1.Object.nombre[ 1 ] = ls_nom
dw_1.Object.direccion_part[ 1 ] = ls_dir
dw_1.Object.c_codigo_ciu[ 1 ] = ls_ciu
dw_1.Object.c_codigo_com[ 1 ] = ls_com
dw_1.Object.telefono_part[ 1 ] = ls_tel

Return 1

end function

on w_arch_mul_cliente_edit.create
call super::create
end on

on w_arch_mul_cliente_edit.destroy
call super::destroy
end on

event open;call super::open;
Long		ll_rut, ll_ret
String	ls_DB, ls_nil

iCliente = Message.PowerObjectParm
SetNull( Message.PowerObjectParm )

ll_rut = LongLong( iCliente.Rut )
ls_DB = UpperTrim( iCliente.DB )

SetNull( ls_nil )
ll_ret = dw_1.Retrieve( ll_rut, ls_nil, 'EDIT', ls_DB )
If ll_ret <= 0 Then
	dw_1.InsertRow( 1)
	dw_1.Object.Rut[ 1] = ll_rut
	dw_1.SetFocus( 'DV' )
End If

String	ls_tit

ls_tit = f_Trim( dw_1.Object.estado_titular[  1] )

dw_1.SetObjectColor( { 'rut', 'dv', 'a_paterno', 'a_materno', 'nombre' }, 'o' )
dw_1.SetObjectColor( 'estado_titular', 'estado_titular = "0"', {'o', 'eRojo' } )
dw_1.Event SetObjectColorA( { 'v_nombre_inu' }, 'bx' )

f_SetMHStatus( 1, 'Listo' )
Return

/*
ll_dem = f_Zero( dw_1.Object.n_demanda[ 1] )
If ll_dem > 0 Then 
	blEclipse.growl( Title, 'Estado de Demanda está Activo' + Char(13) + Char(13) + 'No se puede continuar.' )
	Close	( This )
End If
*/
Return

end event

type dw_list from wa_response`dw_list within w_arch_mul_cliente_edit
event ue_checkall ( )
boolean visible = false
integer y = 2444
integer width = 439
integer height = 140
integer taborder = 0
boolean enabled = false
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_list::ue_checkall();
Long		i, ll_sel, ll_cnt
String	ls_sel


AcceptText( )
ll_sel = This.Object.n_sel[ This.GetRow( )]
ll_cnt = This.RowCount( )


If ll_sel = ll_cnt Then ls_sel = '1' Else ls_sel = '0'

For i = 1 To This.RowCount( )
	This.Object.c_all[ i] = ls_sel 
Next
		
Return
end event

event dw_list::clicked;call super::clicked;
Long		ll_sel, ll_cnt, i
String	ls_sel


Choose Case dwo.Name
	Case 'c_all'
		
		ll_sel = This.Object.n_sel[ This.RowCount( )]
		ll_cnt = This.RowCount( )
		
		ls_sel = This.Object.c_sel[ This.RowCount( )] 
		If ls_sel = '1' Then ls_sel = '0' Else ls_sel = '1'
		
		For i = 1 To This.RowCount( )
			This.Object.c_all[ i] = ls_sel 
			This.Object.c_sel[ i] = ls_sel 
		Next
			
End Choose
end event

event dw_list::itemchanged;call super::itemchanged;
String	ls_sel


Choose Case dwo.Name
	Case 'c_sel'
		
		ls_sel = data
		If ls_sel = '0' Then 
			This.Object.c_all[ row] = ls_sel 
		End If
		
		PostEvent( 'ue_checkall' )
		
End Choose
			
end event

type dw_1 from wa_response`dw_1 within w_arch_mul_cliente_edit
integer width = 3963
integer height = 2428
string dataobject = "d_arch_mul_cliente_edit"
end type

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
String	ls_ciu


This.AcceptText( )

Choose Case dwo.Name
		
	Case 'rut'
		data = f_Trim( data )
		If data = '' Then Return
		
		Long		ll_rut, ll_ret
		String	ls_dv, ls_nil
		
		ll_rut = Long( data )
		
		Select	DV
		Into		:ls_dv
		From		cliente cli
		Where		cli.rut = :ll_rut
		Using		SqlCa ;
		
		ls_dv = f_Trim( ls_DV )
		SetNull( ls_nil )
		If Not ls_dv = '' Then			
			ll_ret = dw_1.Retrieve( ll_rut, ls_nil, 'EDIT', iCliente.DB )
			If ll_ret <= 0 Then
				dw_1.InsertRow( 1)
			End If
		End If

	Case 'ciudad'
		This.GetChild( 'comuna', ldwc_x )
		ldwc_x.SetFilter( 'c_codigo_ciu = "' + data + '"' ) 
		ldwc_x.Filter( )
		ldwc_x.Sort( )
		This.Object.comuna[ 1] = '' 
		
		If data = '0' Or data = '999' Then
			This.Object.comuna[ 1] = data
		End If
		
	Case 'comuna'
		This.GetChild( 'comuna', ldwc_x )
		ls_ciu = ldwc_x.GetItemString( ldwc_x.GetRow( ), 'c_codigo_ciu' )
		This.Object.ciudad[ 1] = ls_ciu 

	Case 'ciudad_comercial'
		This.GetChild( 'comuna_comercial', ldwc_x )
		ldwc_x.SetFilter( 'c_codigo_ciu = "' + data + '"' ) 
		ldwc_x.Filter( )
		ldwc_x.Sort( )
		This.Object.comuna_comercial[ 1] = '' 
		
		If data = '0' Or data = '999' Then
			This.Object.comuna[ 1] = data
		End If
		
	Case 'comuna_comercial'
		This.GetChild( 'comuna_comercial', ldwc_x )
		ls_ciu = ldwc_x.GetItemString( ldwc_x.GetRow( ), 'c_codigo_ciu' )
		This.Object.ciudad_comercial[ 1] = ls_ciu 

	Case 'fono_c'
		If f_GenValidaNroTelefono( data ) Then
			Return
		End If
		
		blEclipse.Messagebox( Parent.Title, 'El número telefónico debe constar de 9 dígitos (Solo números).', Exclamation! )
		This.Object.fono_c[ row] = ''
		Return 1

	Case 'fono_p'
		If f_GenValidaNroTelefono( data ) Then
			Return
		End If
		
		blEclipse.Messagebox( Parent.Title, 'El número telefónico debe constar de 9 dígitos (Solo números).', Exclamation! )
		This.Object.fono_c[ row] = ''
		Return 1

	Case 'celular'
		If f_GenValidaNroTelefono( data ) Then
			Return
		End If
		
		blEclipse.Messagebox( Parent.Title, 'El número telefónico debe constar de 9 dígitos (Solo números).', Exclamation! )
		This.Object.fono_c[ row] = ''
		Return 1
	
	Case 'auto_propio'
		This.ColEnabled( 'avaluo_auto', ( data = 'S' ))
		This.Object.avaluo_auto[ row] = 0
		If ( data = 'S' ) Then
			This.SetFocus( 'avaluo_auto' )
		End If
		
	Case 'casa_propia'
		This.ColEnabled( 'avaluo_casa', ( data = 'S' ))
		This.Object.avaluo_casa[ row] = 0
		If ( data = 'S' ) Then
			This.SetFocus( 'avaluo_casa' )
		End If
		
	Case 'email'
		data = f_Trim( data )
		If data = '' Then Return
		If f_GenValidaFormatoemail( data ) Then Return
		
		blEclipse.Messagebox( Parent.Title, 'Formato de correo electrónico no es válido.', Exclamation! )
		This.Object.email[ row] = ''
		Return 1
		
End Choose

end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_mul_cliente_edit
integer x = 2994
integer y = 2460
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_mul_cliente_edit
integer x = 2615
integer y = 2460
boolean enabled = true
boolean default = false
end type

event cb_aceptar::clicked;
DateTime	ld_tra, ld_hoy
Integer	li_cor
LongLong	ll_rut, ll_nro, ll_xrut, ll_par, ll_ret, ll_cto
String	ls_emp, ls_rut, ls_dv, ls_num, ls_pat, ls_mat, ls_nom, &
			ls_via, ls_dir, ls_blo, ls_dto, ls_pob, ls_sec, ls_val, &
			ls_ciu, ls_com, ls_te1, ls_te2, ls_cel, ls_ema, ls_teo, &
			ls_obs, ls_ame, ls_Bas, ls_ser, &
			ls_msg, ls_col, ls_edo, ls_gen
s_parm	lstr_parm


dw_1.AcceptText( )
dw_1.SetFocus( )

//ls_ame = UpperTrim( dw_1.Object.c_codigo_ame[ 1 ] ) 
/* Si no hubo ninguna gestión, debe cerrar sin guardar */
If ls_ame = '99' Then
	CloseWithReturn( Parent, '' )
	Return
End If

If Not blEclipse.MessageBox( Title, '¿Confirma guardar Datos del Cliente y Continuar?', Question!, YesNo! ) = 1 Then
	Return
End If

ls_emp = gs_emp
ll_rut = f_Zero( dw_1.Object.rut[ 1 ] )
ls_dv = f_Trim( dw_1.Object.dv[ 1 ] )
ls_pat = UpperTrim( dw_1.Object.a_Paterno[ 1 ] ) 
ls_mat = UpperTrim( dw_1.Object.a_Materno[ 1 ] ) 
ls_nom = UpperTrim( dw_1.Object.nombre[ 1 ] ) 

//ls_bas = istr_parm.s_cad[ 2]
//ls_ser = istr_parm.s_cad[ 3]
//ll_cto = LongLong( istr_parm.s_cad[ 4] )


If ll_rut <= 0 Then 
	ls_msg = 'Debe ingresar un Número de RUT Válido'
	ls_col = 'rut'
End If

If ls_dv = '' And ls_msg = '' Then 
	ls_msg = 'Debe ingresar el Dígito Verificador'
	ls_col = 'dv'
End If

If ls_msg = '' Then
	ls_rut = String( ll_rut ) + ls_dv
	If Not f_genValidaRut( ls_rut ) Then
		ls_msg = 'El RUT Nº ' + String( ll_rut ) + '-' + ls_dv + ' del Cliente No es válido o Dígito incorrecto'
		ls_col = 'rut'
	End If
End If

If ls_nom = '' And ls_msg = '' Then 
	ls_msg = 'Debe ingresar el Nombre(s)'
	ls_col = 'nombre'
End If

If ls_pat = '' And ls_msg = '' Then 
	ls_msg = 'Debe ingresar el Apellido Paterno'
	ls_col = 'a_Paterno'
End If

If ls_pat = '' And ls_msg = '' Then 
	ls_msg = 'Debe ingresar el Apellido Materno'
	ls_col = 'a_Materno'
End If


ls_via = f_Trim( dw_1.Object.tipo_via[ 1 ] )
If ls_via = '' And ls_msg = '' Then 
	ls_msg = 'Debe seleccionar Vía del Domicilio'
	ls_col = 'tipo_via'
End If

ls_dir = Upper( f_Trim( dw_1.Object.Direccion_P[ 1 ] ) )
If ls_dir = '' And ls_msg = '' Then 
	ls_msg = 'Debe ingresar Dirección Particular'
	ls_col = 'Direccion_P'
End If

ls_num = Upper( f_Trim( dw_1.Object.numero_particular[ 1 ] ) )
If ls_num = '' And ls_msg = '' Then 
	ls_msg = 'Debe ingresar Número de Dirección Particular'
	ls_col = 'numero_particular'
End If

ls_blo = Coalesce( UpperTrim( dw_1.Object.block_particular[ 1 ] ), '-' )
ls_dto = Coalesce( UpperTrim( dw_1.Object.depto_particular[ 1 ] ), '-' )
ls_pob = Coalesce( UpperTrim( dw_1.Object.poblacion[ 1 ] ), '-' )
ls_sec = Coalesce( UpperTrim( dw_1.Object.sector[ 1 ] ), '-' )

ls_ciu = f_Trim( dw_1.Object.Ciudad[ 1 ] )
If ls_ciu = '' And ls_msg = '' Then 
	ls_msg = 'Debe seleccionar Ciudad'
	ls_col = 'Ciudad'
End If

ls_com = f_Trim( dw_1.Object.Comuna[ 1 ] )
If ls_com = '' And ls_msg = '' Then 
	ls_msg = 'Debe seleccionar Comuna'
	ls_col = 'Comuna'
End If


DateTime	ld_nac, ld_ing
String	ls_sex, ls_civ

ld_nac = dw_1.Object.fecha_nac[ 1 ]
ls_sex = UpperTrim( dw_1.Object.sexo[ 1 ] )
ls_civ = UpperTrim( dw_1.Object.esta_civil[ 1 ] )
ld_ing = dw_1.Object.fecha_ingr[ 1 ]

If Not f_isdate( ld_nac ) And ls_msg = '' Then 
	ls_msg = 'Debe ingresar Fecha de Nacimiento'
	ls_col = 'fecha_nac'
End If

If Not f_GetEdad( ld_nac ) >= 18 And ls_msg = '' Then 
	ls_msg = 'Fecha de Nacimiento debe corresponder a un mayor de edad.'
	ls_col = 'fecha_nac'
End If

If ls_sex = '' And ls_msg = '' Then 
	ls_msg = 'Debe seleccionar sexo'
	ls_col = 'Sexo'
End If

If ls_civ = '' And ls_msg = '' Then 
	ls_msg = 'Debe seleccionar Estado Civil'
	ls_col = 'esta_civil'
End If

If Not f_isdate( ld_ing ) And ls_msg = '' Then 
	ls_msg = 'Debe completar Fecha de Ingreso'
	ls_col = 'fecha_ingr'
End If

// Validar Teléfonos
ls_te1 = Coalesce( f_Trim( dw_1.Object.fono_p[ 1 ] ), '-' )
If ls_te1 = '' Then ls_te1 = '-'  //'0'

If ls_msg = '' Then
	//Select fn_ValPhone( 'PAR', :ls_te1 ) Into :ls_val From Dual ;
	//If Not f_In( ls_val, {'OK', 'MTY'} ) Then 
	If Not f_GenValidaNroTelefono( ls_te1 ) Then 
		ls_msg = 'Número de teléfono incorrecto' 
		ls_col = 'fono_p'
	End If
End If

ls_te2 = f_Trim( dw_1.Object.Fono_c[ 1 ] )
ls_cel = f_Trim( dw_1.Object.Celular[ 1 ] )
If ls_cel = '' Then ls_cel = '-'
If ls_msg = '' Then
	//Select fn_ValPhone( 'CEL', :ls_cel ) Into :ls_val From Dual ;
	//If Not f_In( ls_val, {'OK', 'MTY'} ) Then 
	//	ls_msg = ls_val 
	If Not f_GenValidaNroTelefono( ls_cel ) Then 
		ls_msg = 'Número de teléfono incorrecto' 
		ls_col = 'Celular'
	End If
End If

ls_ema = Coalesce( dw_1.Object.Email[ 1 ], '-' )
If ls_ema = '' Then ls_ema = '-'
If Not ls_ema = '-' And ( Not f_GenValidaFormatoemail( ls_ema ) ) And ls_msg = '' Then 
	ls_col = 'Email'
End If

ls_teo = f_Trim( dw_1.Object.observacion_telefonos[ 1 ] )

dw_1.Object.Actividad[ 1 ] = Coalesce( dw_1.Object.Actividad[ 1 ], '-' )
dw_1.Object.Empleador[ 1 ] = Coalesce( dw_1.Object.Empleador[ 1 ], '-' )
dw_1.Object.numero_comercial[ 1 ] = Coalesce( dw_1.Object.numero_comercial[ 1 ], '-' )

//ls_obs = f_Trim( dw_1.Object.v_observa_edo[ 1 ] )
ld_hoy = f_ServerDate() //dw_1.Object.d_creacion_cli[ 1]


If Not ls_msg  = '' Then 
	blEclipse.MessageBox( Title, ls_msg + ' para Crear o Actualizar datos del Cliente.', Exclamation! )
	dw_1.SetFocus( ls_col )
	Return
End If

dw_1.AcceptText( )


/* Registro del Cliente */
ls_gen = '' ; ls_edo = '' ; ls_msg = '' 

uo_DataStore	lds_1

Destroy	lds_1
lds_1 = Create uo_DataStore
lds_1.DataObject = 'd_arch_mul_cliente_save'
lds_1.SetTransObject( SqlCa )

Dec		lnTipo_Cliente
String	lsEstado_titular, lsActividad, lsEmpleador

lnTipo_Cliente = dw_1.Object.Tipo_Cliente[ 1] 
lsEstado_titular = dw_1.Object.Estado_titular[ 1] 
lsActividad = dw_1.Object.Actividad[ 1 ]
lsEmpleador = dw_1.Object.Empleador[ 1 ]


ll_ret = lds_1.Retrieve( ll_rut, ls_dv, &
								 lnTipo_Cliente, lsEstado_titular, &
								 ls_nom, ls_pat, ls_mat, &
								 ls_via, ls_dir, ls_num, ls_blo, ls_dto, ls_pob, ls_sec, ls_ciu, ls_com, &
								 ld_nac, ls_sex, ls_civ, ld_ing, &
								 ls_te1, ls_cel, ls_ema, ls_teo, &
								 lsActividad, lsEmpleador, &
								 UpperTrim( dw_1.Object.Domicilio_c[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Numero_comercial[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Ciudad_comercial[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Comuna_comercial[ 1 ] ), & 
								 dw_1.Object.Fecha_ingreso_trabajo[ 1 ], & 
								 UpperTrim( dw_1.Object.Fono_c[ 1 ] ), & 
								 f_Zero( dw_1.Object.Dicom_score[ 1 ] ), & 
								 f_Zero( dw_1.Object.Grupo_f[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Tipo_renta[ 1 ] ), & 
								 f_Zero( dw_1.Object.Tipo_clasifica_renta[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Tipo_venta[ 1 ] ), & 
								 f_Zero( dw_1.Object.Ano_renta[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Uso[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Auto_propio[ 1 ] ), & 
								 f_Zero( dw_1.Object.Avaluo_auto[ 1 ] ), & 
								 UpperTrim( dw_1.Object.Casa_propia[ 1 ] ), & 
								 f_Zero( dw_1.Object.Avaluo_casa[ 1 ] ), & 
								 f_Zero( dw_1.Object.Total_rent[ 1 ] ), & 
								 f_Zero( dw_1.Object.Otras_rentas[ 1 ] ) & 
								 )
/*  anumero_comercial      Varchar2,
  aciudad_comercial      Varchar2,
  acomuna_comercial      Varchar2,
  afecha_ingreso_trabajo Date,
  afono_c                Varchar2,
  adicom_score           Number,
  agrupo_f               Number,
  atipo_renta            Varchar2,
  atipo_clasifica_renta  Number,
  atipo_venta            Varchar2,
  aano_renta             Number,
  auso                   Varchar2,
  aauto_propio           Varchar2,
  aavaluo_auto           Number,
  acasa_propia           Varchar2,
  aavaluo_casa           Number,
  atotal_rent            Number,
  aotras_rentas          Number
  ) */

If ll_ret > 0 Then
	ls_gen = f_Trim( lds_1.Object.CodigoGenerado[ 1] )
	ls_edo = f_Trim( lds_1.Object.Estado[ 1] )
	ls_msg = f_Trim( lds_1.Object.MensajeResultado[ 1] )
Else
	ls_gen = '-2'
	ls_edo = 'ERR'
	ls_msg = lds_1.is_ErrText
End If


If Not ls_edo  = 'OK' Then 
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, 'No se pudo registrar Cliente.' + Char(13) + ls_msg, Exclamation! )
	dw_1.SetFocus( )
	Return
End If

If Not ib_cli Then blEclipse.MessageBox( Title, ls_msg )

If ib_cli Then
	blEclipse.MessageBox( Title, 'Cliente ha sido Actualizado.' )
End If

Commit ;
Cliente Cliente
Cliente.RUT = ll_rut
Cliente.dv = ls_dv
Cliente.a_paterno = ls_pat
Cliente.a_materno = ls_mat
Cliente.nombre = ls_nom
Cliente.nomCliente = ls_pat + ' ' + ls_mat + ' ' + ls_nom
Cliente.Fecha_nac = ld_nac
Cliente.RentaLiquida = dw_1.Object.total_rent[ 1 ]
Message.StringParm = 'OK'
CloseWithReturn( Parent, Cliente )

Return


end event

