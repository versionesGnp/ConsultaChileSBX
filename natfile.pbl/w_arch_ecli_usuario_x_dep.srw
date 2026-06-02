//objectcomments /* Autor: César Vilela ~r~n    Función: Usuarios x depto~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_usuario_x_dep from w_gen_document_mant
end type
end forward

global type w_arch_ecli_usuario_x_dep from w_gen_document_mant
string title = "Usuarios x Departamento"
boolean ib_cbnew = false
boolean ib_cbopen = false
boolean ib_cbexcel = false
boolean ib_cbdelete = false
boolean ib_cbsave = false
string is_fnsqlref = "fn_gen_blintegridadref_emp"
string is_setfilter = "(( Lower( v_nombre_usu ) Like ~"%%~" ) Or ( Lower( v_nombre_dep ) Like ~"%%~" ) Or ( Lower( c_codigo_usu ) Like ~"%%~" ) )"
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_detselect = true
string is_textbar = "t"
end type
global w_arch_ecli_usuario_x_dep w_arch_ecli_usuario_x_dep

type variables
w_arch_ecli_configura_empresa_edit  iw_edit
end variables

forward prototypes
public function boolean wf_mant ()
public function integer wf_config ()
public function boolean wf_printretrieve (datawindow adw_rpt)
end prototypes

public function boolean wf_mant ();OpenSheetWithParm( iw_edit, istr_parm, gw_frame )
Return True
end function

public function integer wf_config ();dw_menu.Object.cb_new.Visible = f_If( ib_cbnew, 'yes', 'no' )
dw_menu.Object.cb_open.Visible =  f_If( ib_cbopen, 'yes', 'no' )
dw_menu.Object.cb_xls.Visible =  f_If( ib_cbexcel, 'yes', 'no' )
dw_menu.Object.cb_delete.Visible =  f_If( ib_cbdelete, 'yes', 'no' )
dw_menu.Object.cb_print.Visible =  f_If( ib_cbprint, 'yes', 'no' )
dw_menu.Object.cb_erase.Visible =  f_If( ib_cbdelete, 'yes', 'no' )

Return 1
end function

public function boolean wf_printretrieve (datawindow adw_rpt);
dw_1.RowsCopy( 1, dw_1.RowCount(), Primary!, adw_rpt, 1, Primary! )

Return True
end function

on w_arch_ecli_usuario_x_dep.create
call super::create
end on

on w_arch_ecli_usuario_x_dep.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant`dw_1 within w_arch_ecli_usuario_x_dep
string dataobject = "d_arch_ecli_usuario_x_dep"
end type

event dw_1::constructor;call super::constructor;
f_SetObjectColor( This, 'c_codigo_dep', '', String( f_Gen_Color('o') ))
f_SetObjectColor( This, 'v_nombre_dep', '', String( f_Gen_Color('o') ))

end event

event dw_1::retrieveend;call super::retrieveend;SelectRow( 0, False )
end event

event dw_1::rowfocuschanged;SelectRow( 0, False )
end event

event dw_1::itemchanged;call super::itemchanged;
Long		ll_can
String	ls_cod


ls_cod = This.Object.c_codigo_usu[ row]

Choose Case dwo.Name
	Case 'c_autorizafrm_usu'
			Update genLogin Set c_autorizafrm_usu = :data Where c_codigo_usu = :ls_cod ;		
						
End Choose
	
If f_SqlError( SQlCa, 'No se pudo actualizar GenLogin.' ) = -1 Then
	RollBack Using SqlCa ;
	Return
End If

Commit Using SqlCa ;
	
		
end event

type dw_menu from w_gen_document_mant`dw_menu within w_arch_ecli_usuario_x_dep
end type

type st_sincontenido from w_gen_document_mant`st_sincontenido within w_arch_ecli_usuario_x_dep
end type

