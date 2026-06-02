//objectcomments /* Autor: César Vilela ~r~n    Función: cuenta de usuario~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario_cta from w_gen_document_doc
end type
end forward

global type w_arch_ecli_configura_usuario_cta from w_gen_document_doc
integer height = 2588
string title = "Configurar Cuenta de Usuario"
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_ecli_configura_usuario_cta w_arch_ecli_configura_usuario_cta

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


Return 1
end function

public function boolean wf_savedocument ();String	ls_nom, ls_email


dw_1.AcceptText( )

ls_nom = f_Trim( dw_1.Object.v_nombre_usu[ 1] )
ls_email = f_Trim( dw_1.Object.v_email_usu[ 1] )

If ls_nom = '' Then
	MessageBox( Title, 'Debe ingresar su nombre completo (Nombre y Apellidos).', Exclamation! )
	Return False
End If

If ls_email = '' Then
	MessageBox( Title, 'Debe ingresar su correo electrónico.', Exclamation! )
	Return False
End If

If Not Pos( ls_email, '@' ) > 0 Or Not Pos( ls_email, '.' ) > 0 Or Pos( ls_email, ' ' ) > 0 Then 
	MessageBox( Title, 'Debe ingresar un correo electrónico válido.', Exclamation! )
	Return False
End If

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

on w_arch_ecli_configura_usuario_cta.create
call super::create
end on

on w_arch_ecli_configura_usuario_cta.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura_usuario_cta
integer width = 3456
integer height = 2224
string dataobject = "d_arch_ecli_configura_usuario_cta"
boolean vscrollbar = true
end type

event dw_1::itemchanged;call super::itemchanged;ib_saved = False
end event

event dw_1::editchanged;call super::editchanged;ib_saved = False
end event

event dw_1::buttonclicked;call super::buttonclicked;
String	ls_usu 


Choose Case dwo.Name
	Case 'cb_crd'
		ls_usu = f_Trim( This.Object.c_codigo_usu[ row] )
		OpenWithParm(  w_arch_ecli_configura_usuario_crd, ls_usu )
		
End Choose
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura_usuario_cta
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura_usuario_cta
integer x = 3502
integer y = 1648
integer width = 297
integer height = 220
boolean enabled = false
boolean border = false
end type

