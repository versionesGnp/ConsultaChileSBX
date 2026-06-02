//objectcomments /* Autor: César Vilela ~r~n    Función: PWD del login~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario_pass from w_gen_document_doc
end type
end forward

global type w_arch_ecli_configura_usuario_pass from w_gen_document_doc
integer height = 2588
string title = "Cambiar Contraseña"
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_ecli_configura_usuario_pass w_arch_ecli_configura_usuario_pass

type variables
String	is_tem, is_sem
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_savedocument ()
public function boolean wf_save ()
end prototypes

public function integer wf_new ();

ib_new = True
ib_saved = True

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )


If f_Zero( dw_1.Retrieve( gs_usuario ) ) <=0 Then
	MessageBox( Title, 'Se produjo un error al intentar recuperar información', Exclamation! )
	Close( This )
	Return -1
End If

dw_1.Object.v_password_ori[ 1] = ''
dw_1.Object.v_password_usu[ 1] = ''
dw_1.Object.v_confirma[ 1] = ''

Return 1
end function

public function boolean wf_savedocument ();String	ls_xpas, ls_pori, ls_pass, ls_conf


dw_1.AcceptText( )

ls_xpas = f_Trim( dw_1.Object.v_xpassword[ 1] )		//Password Actual temporalmente
ls_pori = f_Trim( dw_1.Object.v_password_ori[ 1] )	//Password que se compara con el actual
ls_pass = f_Trim( dw_1.Object.v_password_usu[ 1] )	//Password nuevo
ls_conf = f_Trim( dw_1.Object.v_confirma[ 1] )		//Password de confirmación para el nuevo
	
If ls_pori = '' Then
	MessageBox( Title, 'Debe ingresar su contraseña actual.', Exclamation!)
	Return False
End If

f_GenProcesando( Title + '~r~Validando Información' )
ls_pori = f_Encripta( ls_pori )
If Not ls_xpas = ls_pori Then
	f_GenProcesando( '' )
	MessageBox( Title, 'La contraseña actual es incorrecta, no se puede continuar.', Exclamation!)
	Return False
End If

If ls_pass = '' Then
	f_GenProcesando( '' )
	MessageBox( Title, 'Debe ingresar una contraseña para el usuario.', Exclamation!)
	Return False
End If

If Not ls_pass = ls_conf Then
	f_GenProcesando( '' )
	MessageBox( Title, 'La confirmación de la contraseña no es correcta.', Exclamation!)
	Return False
End If

ls_pass = f_Encripta( ls_pass )
dw_1.Object.v_password_usu[ 1] = ls_pass
	
f_GenProcesando( Title + '~r~Guardando Información' )

If Not dw_1.Update( True ) = 1 Then
	RollBack Using SqlCa ;
	f_GenProcesando( '' )
	dw_1.SetTransObject( SqlCa )
	Return False
End If

Commit Using SqlCa;

ib_saved = True
ib_new = False

f_GenProcesando( '' )

MessageBox( Title, 'Información ha sido guardada correctamente.' )

Close( This )

Return True
 
end function

public function boolean wf_save ();dw_1.SetFocus( )

If Not wf_SaveDocument( ) Then Return False

gw_frame.SetMicroHelp( 'Listo' )

Return True
end function

on w_arch_ecli_configura_usuario_pass.create
call super::create
end on

on w_arch_ecli_configura_usuario_pass.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura_usuario_pass
integer width = 3456
integer height = 2224
string dataobject = "d_arch_ecli_configura_usuario_pass"
boolean vscrollbar = true
end type

event dw_1::itemchanged;call super::itemchanged;ib_saved = False
end event

event dw_1::editchanged;call super::editchanged;ib_saved = False
AcceptText( )
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura_usuario_pass
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura_usuario_pass
integer x = 3502
integer y = 1648
integer width = 297
integer height = 220
boolean enabled = false
boolean border = false
end type

