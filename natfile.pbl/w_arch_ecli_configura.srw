//objectcomments /* Autor: César Vilela ~r~n    Función: Conguración de bl-Eclipse~r~n    Recomendación: No Modificar - Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura from w_gen_document_doc
end type
end forward

global type w_arch_ecli_configura from w_gen_document_doc
integer height = 1904
string title = "Configuración"
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_ecli_configura w_arch_ecli_configura

type variables
String	is_tem, is_sem
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_savedocument ()
public subroutine wf_xls ()
end prototypes

public function integer wf_new ();
String	ls_adm

ib_new = True
ib_saved = True

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )


If f_Zero( dw_1.Retrieve( gs_emp ) ) <=0 Then
	dw_1.InsertRow(0)
	dw_1.Object.c_codigo_usu[ 1] = gs_usuario
	dw_1.Object.d_creacion_cfg[ 1] = Today( )
	dw_1.Object.c_activo_cfg[ 1] = '1'
Else
	dw_1.Object.c_usumod_cfg[ 1] = gs_usuario
	dw_1.Object.d_modifi_cfg[ 1] = Today( )
End If

ls_adm = f_Trim( dw_1.Object.c_editaadmin_cfg[ 1] )
If Not ls_adm = '0' Then ls_adm = '1'

dw_1.Object.c_editaadmin_cfg[ 1] = ls_adm

/* No podrá cambiar nada si no es Administrador, si así se especificó o es default */
If ls_adm = '1' Then
	If Not f_IsAdmin( gs_usuario ) Then
		ib_cbsave = False
		dw_menu.TriggerEvent( Constructor! )
		dw_1.Object.c_editaadmin_cfg.Color = f_Gen_Color( 'erojo' )
		dw_1.Object.cb_pcs.Enabled = False
		dw_1.Object.cb_emp.Enabled = False
		dw_1.Object.cb_usu.Enabled = False
		dw_1.Object.DataWindow.ReadOnly = True
	End If
End If

If ls_adm = '0' Then
	dw_1.Object.c_editaadmin_cfg.Color = f_Gen_Color( 'erojo' )
End If

dw_1.SetFocus( )

Return 1
end function

public function boolean wf_savedocument ();

dw_1.AcceptText( )

f_GenProcesando( Title + '~r~nGuardando Información' )

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

gw_frame.SetMicroHelp( 'Listo' )

Return True

 
end function

public subroutine wf_xls ();
w_gen_document::wf_XLS( )


end subroutine

on w_arch_ecli_configura.create
call super::create
end on

on w_arch_ecli_configura.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura
integer width = 3456
integer height = 1560
string dataobject = "d_arch_ecli_configura"
boolean vscrollbar = true
end type

event dw_1::editchanged;call super::editchanged;ib_saved = False

end event

event dw_1::buttonclicked;call super::buttonclicked;

Choose Case dwo.Name

	Case 'cb_pcs' 
				
	Case 'cb_emp'
		OpenSheet( w_arch_ecli_configura_empresa, gw_frame, 1, Original! )
				
	Case 'cb_usu'
		OpenSheet( w_arch_ecli_configura_usuario, gw_frame, 1, Original! )
				
End Choose
end event

event dw_1::itemchanged;call super::itemchanged;
ib_saved = False

Choose Case dwo.Name
		
	Case 'c_editaadmin_cfg'
		If data = '1' Then
			This.Object.c_editaadmin_cfg.Color = f_Gen_Color( 't' )
		Else
			This.Object.c_editaadmin_cfg.Color = f_Gen_Color( 'erojo' )
		End If
		
	Case 'c_passblanco_cfg'
		If data = '1' Then
			This.Object.c_passforzarnum_cfg[ row] = '0'
			This.Object.n_passminimo_cfg[ row] = 0
		End If
		
	Case 'c_notificarord_cfg'
		If data = '1' Then
			This.Object.c_autorizacionorden_cfg[ row] = data
		End If
		
End Choose
end event

event dw_1::key;call super::key;String	ls_cod


If Not KeyDown( KeyF3! ) Then Return

Choose Case GetColumnName( )
	Case 'c_codproductolibre_cfg' 
		f_GenBuscar( '', GetColumnName( ), 'PRO', This )
		
	Case 'c_codigo_prv'
		f_GenBuscar( '', GetColumnName( ), 'PRV', This )
		
End Choose

ib_saved = False
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura
integer x = 0
integer y = 1608
integer width = 297
integer height = 220
boolean enabled = false
boolean border = false
end type

