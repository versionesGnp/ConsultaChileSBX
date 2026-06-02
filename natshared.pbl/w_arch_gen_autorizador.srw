//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Solicita autorizador de transacciones~r~n    Recomendación: NO MODIFICAR - Experto~r~n*/
forward
global type w_arch_gen_autorizador from wa_response
end type
end forward

global type w_arch_gen_autorizador from wa_response
integer width = 1778
integer height = 1040
string title = "Autorización de Operación"
end type
global w_arch_gen_autorizador w_arch_gen_autorizador

type variables

Boolean ib_ora
end variables

on w_arch_gen_autorizador.create
call super::create
end on

on w_arch_gen_autorizador.destroy
call super::destroy
end on

event open;call super::open;String	ls_ope


ls_ope = Message.StringParm


ib_ora = f_IsOracle( )


dw_1.InsertRow(0)

dw_1.SetFocus( )
end event

type dw_list from wa_response`dw_list within w_arch_gen_autorizador
boolean visible = false
integer x = 37
integer y = 444
integer width = 178
integer height = 108
integer taborder = 0
boolean enabled = false
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_1 from wa_response`dw_1 within w_arch_gen_autorizador
integer width = 1897
integer height = 800
string dataobject = "d_arch_gen_autorizador"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_autorizador
integer x = 1225
integer y = 828
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_autorizador
integer x = 846
integer y = 828
boolean enabled = true
end type

event cb_aceptar::clicked;String	ls_usu, ls_pas, ls_msg, ls_col, ls_pass, ls_act


dw_1.AcceptText( )

ls_usu = f_Trim( dw_1.Object.c_codigo_usu[ 1] )
ls_pas = f_Trim( dw_1.Object.v_password_usu[ 1] )

ls_usu = Upper( ls_usu )

If ls_usu = '' Then
	ls_msg = 'Debe seleccionar el usuario Autorizador.'
	ls_col = 'c_codigo_usu'
End If

If ls_pas = '' And ls_msg = '' Then
	ls_msg = 'Debe ingresar la Contraseña del Autorizador.'
	ls_col = 'v_password_usu'
End If

If ls_msg = '' Then
	Select	v_password_usu,
				c_activo_usu
	Into 		:ls_pass,
				:ls_act
	From		genlogin
	Where		c_codigo_usu = :ls_usu ;

	If Not SqlCa.SqlCode = 0 Then
		ls_msg = 'Identificador de usuario o contraseña incorrectos.'
		ls_col = 'c_codigo_usu' 
	End If
End If
	
ls_act = f_Trim( ls_act )

If ib_ora And ls_msg = '' Then
	If Not Lower( f_DesEncripta( ls_pass ) ) = Lower( ls_pas ) Then
		ls_msg = 'Identificador de usuario o contraseña incorrectos.'
		ls_col = 'c_codigo_usu' 
	End If
End If

If Not ib_ora And ls_msg = '' Then
	If Not Lower( ls_pass ) = Lower( f_Encripta( ls_pas ) ) Then
		ls_msg = 'Identificador de usuario o contraseña incorrectos.'
		ls_col = 'c_codigo_usu' 
	End If
End If

If ls_msg = '' And ls_act = '0' Then
	ls_msg = 'Cuenta de Usuario temporalmente bloqueada.~r' + &
							'No se puede continuar.' + Char(13) + &
							'[Bold]Dar Aviso al departamento de Informática.'
	ls_col = 'c_codigo_usu' 
End If

If Not ls_msg = '' Then
	blEclipse.MessageBox( Title, ls_msg, Exclamation!)
	dw_1.SetColumn( ls_col )
	dw_1.SetFocus( )
	Return 
End If

CloseWithReturn( Parent, ls_usu )
end event

