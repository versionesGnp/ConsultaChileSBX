//objectcomments /* Autor: César Vilela ~r~n    Función: Editar datos del usuario(login)~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario_edit from w_gen_document_mant_edit
end type
end forward

global type w_arch_ecli_configura_usuario_edit from w_gen_document_mant_edit
integer height = 2656
string title = "Cuenta de Usuario"
end type
global w_arch_ecli_configura_usuario_edit w_arch_ecli_configura_usuario_edit

type variables
Boolean	ib_modpass = False
String	is_rol, is_esRol
end variables

forward prototypes
public function boolean wf_gencod (boolean ab_valida)
public function boolean wf_validareg ()
public function boolean wf_checkactioni ()
public function boolean wf_checkactionm ()
public function boolean wf_postopen ()
public function integer wf_postupdate ()
end prototypes

public function boolean wf_gencod (boolean ab_valida);/* wf_GenCod( ab_valida ) */
Integer	li_limit
String	ls_cod, ls_new


dw_1.AcceptText( )

ls_cod = f_Trim( dw_1.Object.c_codigo[ 1])

/* validamos que el codigo ingresado no exista */
If ls_cod <> '' Then
	
	Select	v_nombre_usu
	Into 		:ls_new
	From		genlogin
	Where		c_codigo_usu = :ls_cod ;
	If f_SqlError( SqlCa, 'No se pudo obtener información de la tabla UsuariosLog (Where)' ) =-1 Then
		Return False
	End If
	If f_Trim( ls_new ) <> '' Then
		ls_cod = ''
		MessageBox( Title, 'Identificador ingresado ya existe.~n~rPertenece a ' + ls_new + &
								'~r~n~r~nDeberá ingresar otro Identificador del usuario para el Sistema.', Exclamation!)
		Return False
	End If
Else
	If ab_valida Then
		MessageBox( Title, 'Debe ingresar el Identificador del Usuario.', Exclamation!)
		Return False
	End If
End If

Return True
end function

public function boolean wf_validareg ();Integer	li_count
String	ls_codigo, ls_newcod, ls_pass, ls_xpass, ls_conf, ls_rol


dw_1.AcceptText( )
ls_codigo = f_trim( dw_1.Object.c_codigo[ 1])

If istr_parm.s_cad[ 1] = 'I' Then	/* insertar */
	/* validamos que el codigo ingresado no exista */
	If Not wf_GenCod( True) Then
		Return False
	End If
End If

/* Validamos que campos mandatorios esten ingresados */
/* Descripcion */
If f_Trim( dw_1.Object.v_nombre[ 1] ) = '' Then
	MessageBox( Title, 'Debe ingresar nombre/descripción.', Exclamation!)
	Return False
End If

/* Validación del Password */
If istr_parm.s_cad[ 1] = 'I' Or ib_modpass Then	
	ls_pass = f_Trim( dw_1.Object.v_password_usu[ 1] )
	ls_conf = f_Trim( dw_1.Object.v_confirma[ 1] )
	
	If ls_pass = '' Then
		MessageBox( Title, 'Debe ingresar una contraseña para el usuario.', Exclamation!)
		Return False
	End If
	
	If Not ls_pass = ls_conf Then
		MessageBox( Title, 'La confirmación de la contraseña no es correcta.', Exclamation!)
		Return False
	End If
	ls_pass = f_Encripta( ls_pass )
	dw_1.Object.v_password_usu[ 1] = ls_pass
End If

If f_Trim( dw_1.Object.c_codigo_tma[ 1] ) = '' Then
	MessageBox( Title, 'Debe seleccionar el Tema.', Exclamation!)
	Return False
End If

ls_rol = f_Trim( dw_1.Object.c_rol_usu[ 1] )

If is_EsRol = '1' And Not ls_rol = '1' Then
	Select Count(*)
	Into   :li_count
	From   genLogin
	Where  c_codrol_usu = :ls_codigo ;
	
	li_count = f_Zero( li_count )
	
	If li_count > 0 Then
		MessageBox( Title, 'Este usuario tiene usuarios asignados como rol.' + Char(13) + &
									'No se puede modificar esta propiedad', Exclamation!)
		dw_1.Object.c_rol_usu[ 1] = is_EsRol
		dw_1.Event ItemChanged( 1, dw_1.Object.c_rol_usu, is_EsRol ) 
		Return False
	End If	
End If

Return True
end function

public function boolean wf_checkactioni ();
dw_1.Object.c_codigo_emp[ 1] = gs_emp
dw_1.Object.c_codigo[ 1] = ''
dw_1.Object.v_nombre[ 1] = ''
dw_1.Object.v_email_usu[ 1] = ''
dw_1.Object.v_password_usu[ 1] = ''
dw_1.Object.v_confirma[ 1] = ''
dw_1.Object.c_codigo_wks[ 1] = ''

dw_1.SetColumn( 'c_codigo' )

Return True
end function

public function boolean wf_checkactionm ();
dw_1.Object.cb_cambiar.Enabled = True

Return True
end function

public function boolean wf_postopen ();
DataWindowChild ldwc_x
Long		ll_row, ll_fnd 
String	ls_rol, ls_cod


SetNull( ls_cod )

ll_row = dw_1.GetRow( )
ls_rol = f_Trim( dw_1.Object.c_rol_usu[ ll_row] )

f_ColEnabled( dw_1, 'c_codrol_usu', (Not ls_rol = '1') )

dw_1.GetChild( 'c_codrol_usu', ldwc_x )
//ldwc_x.SetTransObject( SqlCa )
//ldwc_x.Retrieve( )

If ldwc_x.RowCount( ) > 0 Then
	ll_fnd = ldwc_x.Find( "v_nombre_usu = '- Sin Rol Asignado -'", 1, ldwc_x.RowCount( )  )
End If
If ll_fnd = 0 Then
	ldwc_x.InsertRow( 1 )
	ldwc_x.SetItem( 1, 'c_codigo_usu', ls_cod )
	ldwc_x.SetItem( 1, 'v_nombre_usu', '- Sin Rol Asignado -' )
End If

//Asigna valores a las var. instancias
is_rol = f_Trim( dw_1.Object.c_codrol_usu[ ll_row] )
is_esRol = f_Trim( dw_1.Object.c_rol_usu[ ll_row] )

Return True
end function

public function integer wf_postupdate ();
String	ls_ori, ls_des, ls_usp, ls_sql, ls_add, ls_tma, ls_exe

/* Se debe actualizar en caso de asignar o cambiar Rol Asignado */
dw_1.AcceptText( )
ls_ori = f_Trim( dw_1.Object.c_codrol_usu[ dw_1.GetRow( )] )
ls_des = f_Trim( dw_1.Object.c_codigo[ dw_1.GetRow( )] )
ls_add = '0'
ls_tma = '0'

If istr_parm.s_cad[ 1] = 'I' Then
	Delete genLoginEmp
	Where  c_codigo_usu = :ls_des 
	Using SqlCa ;
	
	Insert Into genLoginEmp
	( c_codigo_emp, c_codigo_usu )
	Values
	( :gs_emp, :ls_des )
	Using SqlCa ;
	
	
	Commit Using SqlCa ;
End If

If is_rol = ls_ori Then
	Return 1
End If


If f_IsOracle( ) Then
	ls_usp = 'usp_gen_opciones_x_usu_copiar'
	ls_sql = 'Execute ' + ls_usp + '( '
	ls_sql = ls_sql +	"as_emp => '" + gs_emp + "', " + &
							"as_ori => '" + ls_ori + "', " + &
							"as_des => '" + ls_des + "', " + &
							"as_add => '" + ls_add + "', " + &
							"as_tma => '" + ls_tma + "'  ) " 
Else
	ls_usp = 'usp_gen_opciones_x_usu_duplicar'
	ls_sql = 'Execute ' + ls_usp + ' '
	ls_sql = ls_sql +	'@as_emp = "' + gs_emp + '", ' + &
							'@as_ori = "' + ls_ori + '", ' + &
							'@as_des = "' + ls_des + '", ' + &
							'@as_add = "' + ls_add + '", ' + &
							'@as_tma = "' + ls_tma + '" ' 
End If
ls_exe = ls_sql 
	
SetPointer( HourGlass! )
Execute Immediate :ls_exe Using SqlCa ;
		
If f_SqlError (SqlCa, 'Error al ejecutar el "Execute ' + ls_usp + '".') = - 1 Then
	RollBack Using SqlCa ;
	SetPointer( Arrow! )
	Return -1
End If

Commit Using SqlCa ;


Return 1

end function

on w_arch_ecli_configura_usuario_edit.create
call super::create
end on

on w_arch_ecli_configura_usuario_edit.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant_edit`dw_1 within w_arch_ecli_configura_usuario_edit
integer width = 3049
integer height = 2272
string dataobject = "d_arch_ecli_configura_usuario_edit"
end type

event dw_1::buttonclicked;call super::buttonclicked;
String	ls_cod, ls_dom, ls_ema

If is_emp = '' Then is_emp = gs_emp 

This.AcceptText( )

Choose Case dwo.Name
	Case 'cb_domain' 
		ls_cod = f_Trim( This.Object.c_codigo[ row] )
		ls_ema = f_Trim( This.Object.v_email_usu[ row] )
		
		Select	v_dominio_emp
		Into		:ls_dom		
		From		genEmpresa 
		Where		c_codigo_emp = :is_emp ;

		ls_dom = f_Trim( ls_dom ) 
		If ls_dom = '' Then
			MessageBox( Parent.Title, 'No se ha configurado Dominio para el Empresa.', Exclamation! )
			Return
		End If
		
		If Pos( ls_ema, '@') > 0 Then
			If Right( ls_ema, 1 ) = '@' Then
				ls_ema = Left( ls_ema, Len(ls_ema) - 1 )
			Else
				If Not MessageBox( Parent.Title, 'Correo electrónico ya ingresado ' + ls_ema + Char(13) + &
												'¿Desea actualizar con Completar @?', Question!, YesNo! ) = 1 Then
					Return
				End If
				ls_ema = '' 
			End If	
		End If
		
		If Not Left( ls_dom, 1 ) = '@' Then ls_dom = '@' + ls_dom
		
		If ls_ema = '' Then ls_ema = ls_cod
		ls_ema = Lower( ls_ema + ls_dom )					
		This.Object.v_email_usu[ row] = ls_ema 
		
	Case 'cb_cambiar' 
		dw_1.Object.v_password_usu[ row] = '' 
		dw_1.Object.v_confirma[ row] = ''
		ib_modpass = True

End Choose
end event

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild ldwc_x
String	ls_cod, ls_tma


Choose Case dwo.Name
	Case 'c_codrol_usu'
		Select	c_codigo_tma
		Into		:ls_tma
		From		genLogin
		Where		c_codigo_usu = :data ;
		This.Object.c_codigo_tma[ row] = ls_tma
		
	Case 'c_rol_usu'
		ls_cod = f_Trim( This.Object.c_codigo[ row] )
		f_ColEnabled( This, 'c_codrol_usu', (Not data = '1') )
		This.GetChild( 'c_codrol_usu', ldwc_x )
		ldwc_x.SetFilter( 'Not c_codigo_usu = "' + ls_cod + '"' )
		ldwc_x.Filter( )
		SetNull( ls_cod )
		This.Object.c_codrol_usu[ row] = ls_cod

End Choose


end event

type dw_menu from w_gen_document_mant_edit`dw_menu within w_arch_ecli_configura_usuario_edit
end type

