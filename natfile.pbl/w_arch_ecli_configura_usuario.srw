//objectcomments /* Autor: César Vilela ~r~n    Función: Edición de Usuario~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario from w_gen_document_mant
end type
end forward

global type w_arch_ecli_configura_usuario from w_gen_document_mant
string title = "Administrar y Configurar Usuarios"
boolean ib_posy = false
end type
global w_arch_ecli_configura_usuario w_arch_ecli_configura_usuario

type variables
w_arch_ecli_configura_usuario_edit  iw_edit
end variables

forward prototypes
public function boolean wf_mant ()
public function boolean wf_eliminarverificar ()
end prototypes

public function boolean wf_mant ();OpenSheetWithParm( iw_edit, istr_parm, gw_frame )
Return True
end function

public function boolean wf_eliminarverificar ();/* wf_EliminarVerificar( ) */
Long		ll_row
String	ls_adm, ls_rol


/* Control de la acción previa en caso de ser Administrador el Login a Eliminar*/
ll_row = dw_1.GetRow( )
ls_adm = f_Trim( dw_1.Object.c_admin_usu[ll_row] ) 
ls_rol = f_Trim( dw_1.Object.c_rol_usu[ll_row] ) 

If ls_adm = '1' Or ls_rol = '1' Then
	MessageBox( Title, 'Registro No puede ser eliminado.' + Char(13) + 'Usuario Tipo Administrador o Tipo Rol.', Exclamation! )
	Return False
End If

Return True
end function

on w_arch_ecli_configura_usuario.create
call super::create
end on

on w_arch_ecli_configura_usuario.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant`dw_1 within w_arch_ecli_configura_usuario
string dataobject = "d_arch_ecli_configura_usuario"
end type

event dw_1::constructor;call super::constructor;
This.Object.DataWindow.Detail.Height = 300
end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;
SelectRow( 0, False )
end event

event dw_1::retrieveend;call super::retrieveend;
SelectRow( 0, False )
end event

event dw_1::buttonclicked;call super::buttonclicked;
DataWindow	ldw_1, ldw_list
String		ls_cod


ls_cod = This.Object.c_codigo[ row]

If Not f_IsAdmin( gs_usuario ) Then
	If f_IsAdmin( ls_cod ) Then
		MessageBox( Parent.Title, 'Usuario ' + gs_usuario + ' No es cuenta Administrador.' + Char(13) + &
								'No se puede continuar.', Exclamation! )
		Return
	End If
End If

Choose Case dwo.Name
	Case 'cb_opc'
		
		OpenSheet( w_arch_ecli_configura_usuario_opcion, gw_frame, 1, Original! )
		ldw_1 = w_arch_ecli_configura_usuario_opcion.dw_1
		ldw_list = w_arch_ecli_configura_usuario_opcion.dw_list
		ldw_1.SetFilter( 'c_codigo_usu = "' + ls_cod + '"'  )
		ldw_1.Filter( )
		ldw_1.Object.st_title.Text = 'Usuarios del Sistema (Filtro Activo)' 
		ldw_list.Retrieve( ls_cod )
		ldw_list.ExpandAll( )

	Case 'cb_emp'
		
		OpenSheet( w_arch_ecli_configura_usuario_empresa, gw_frame, 1, Original! )
		ldw_1 = w_arch_ecli_configura_usuario_empresa.dw_1
		ldw_list = w_arch_ecli_configura_usuario_empresa.dw_list
		ldw_1.SetFilter( 'c_codigo_usu = "' + ls_cod + '"'  )
		ldw_1.Filter( )
		ldw_1.Object.st_title.Text = 'Usuarios del Sistema (Filtro Activo)' 
		ldw_list.Retrieve( ls_cod )
		ldw_list.ExpandAll( )

End Choose
end event

type dw_menu from w_gen_document_mant`dw_menu within w_arch_ecli_configura_usuario
end type

type st_sincontenido from w_gen_document_mant`st_sincontenido within w_arch_ecli_configura_usuario
end type

