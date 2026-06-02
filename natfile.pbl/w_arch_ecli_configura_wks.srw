//objectcomments /* Autor: César Vilela ~r~n    Función: WKS~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_wks from w_gen_document_doc
end type
end forward

global type w_arch_ecli_configura_wks from w_gen_document_doc
integer height = 1904
string title = "Cfg. Estación de Trabajo"
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_ecli_configura_wks w_arch_ecli_configura_wks

type variables
String	is_tem, is_epq
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_savedocument ()
public subroutine wf_add ()
public function integer wf_deleterow ()
public subroutine wf_activar (string as_act, long al_row)
public subroutine wf_xls ()
end prototypes

public function integer wf_new ();

ib_new = True
ib_saved = True

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )

/*
Select	Min( c_codigo_epq )
Into		:is_epq
From		eyeempaque ;
*/
is_epq = f_Trim( is_epq )

If is_epq = '' Then
	//MessageBox( Title, 'Es Necesario configurar el archivo de Empaques para poder continuar', Exclamation! )	
End If

If dw_1.Retrieve( gs_emp )  <= 0 Then // , f_EyeTemporada( gs_emp ) )
	wf_Add( )
End If

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

dw_list.Retrieve( gs_emp ) //, f_EyeTemporada( gs_emp ) )
f_GenProcesando( '' )
MessageBox( Title, 'Información ha sido guardada correctamente.' )

gw_frame.SetMicroHelp( 'Listo' )

Return True

 
end function

public subroutine wf_add ();Long	i, j, ll_cod
String	ls_cod, ls_wks

If is_epq = '' Then
	//MessageBox( Title, 'Es Necesario configurar el archivo de Empaques para poder continuar', Exclamation! )	
	//Return
End If

dw_1.SetRedraw( False )
dw_1.Update( True )
dw_1.Retrieve( )
Commit Using SqlCa ;
dw_1.Sort( )

j = dw_1.RowCount( )

ls_wks = f_GetPCName( )

Select	c_codigo_wks
Into		:ls_cod
From		genWorkstation
Where		c_codigo_wks = :ls_wks ;

ls_cod = f_Trim( ls_cod )

If ls_cod = '' Then
	ls_cod = ls_wks
Else
	ls_cod = '*ESTACION*'
End If

i = dw_1.InsertRow(0)

dw_1.Object.c_codigo_wks[ i] = ls_cod
dw_1.Object.c_codigo_epq[ i] = is_epq

wf_Activar( '1', i )

dw_1.SetRow( i )
dw_1.ScrollToRow( i )
dw_1.SetFocus( )

dw_1.SetRedraw( True )

ib_saved = False


end subroutine

public function integer wf_deleterow ();Long	i, j, ll_cod
String	ls_cod


i = dw_1.RowCount( )

If i <= 0 Then Return i

i = dw_1.GetRow( )
ls_cod = f_Trim( dw_1.Object.c_codigo_wks[ i] )

Select	Count(*)
Into		:ll_cod
From		genWorkstation
Where		c_codigo_wks = :ls_cod ;

ll_cod = f_Zero( ll_cod )

If ll_cod = 0 Then
	dw_1.DeleteRow( i )
Else
	wf_Activar( '0', i )
End If

dw_1.SetFocus( )
ib_saved = False

Return 1
end function

public subroutine wf_activar (string as_act, long al_row);
If al_row <= 0 Then Return


If as_act = '1' Then
	dw_1.Object.c_codigo_usu[ al_row] = gs_usuario
	dw_1.Object.d_creacion[ al_row] = Today( )
	dw_1.Object.c_activo[ al_row] = as_act
Else
	dw_1.Object.c_usumod[ al_row] = gs_usuario
	dw_1.Object.d_modifi[ al_row] = Today( )
	dw_1.Object.c_activo[ al_row] = as_act
End If

dw_1.SetRow( al_row )
dw_1.ScrollToRow( al_row )

ib_saved = False
dw_1.AcceptText( )
end subroutine

public subroutine wf_xls ();
Integer	li_ret


li_ret = f_GenMenuVisualPopup( '', {'Excel Visual', 'Excel Básico', 'Hybrid' }, {'DataManipulationTabular!', 'DataManipulationGrid!', 'DataWindowIcon!'} )

If li_ret <= 0 Then Return 

Choose Case li_ret
		
	Case 1
		f_DWToExcelCSS( dw_1 )
		//f_DWToExcel( dw_1 )
		
	Case 2
		f_DWToExcelClassic( dw_1 )
		
	Case 3
		f_DWToExcelHybrid( dw_1 )
End Choose


end subroutine

on w_arch_ecli_configura_wks.create
call super::create
end on

on w_arch_ecli_configura_wks.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura_wks
integer width = 3456
integer height = 1084
string dataobject = "d_arch_ecli_configura_wks"
end type

event dw_1::buttonclicked;call super::buttonclicked;
s_parm	lstr_parm, lstr_msg
String	ls_url

Choose Case dwo.Name
	Case 'cb_add'
		wf_Add( )
		
	Case 'cb_del'
		wf_DeleteRow( )
		
	Case 'cb_url'
		ScrollToRow( row )
		lstr_parm.dw_dat[ 1] = This
		
		OpenWithParm( w_arch_ecli_configura_wks_url, lstr_parm )
		lstr_msg = Message.PowerObjectParm
		
		If lstr_msg.s_cad[ 1] = '|@' Then Return
		ib_saved = False
				
		This.AcceptText( )
		
		wf_SaveDocument( )
		
End Choose
end event

event dw_1::constructor;call super::constructor;String	ls_c1, ls_c2, ls_c3



ls_c1 = String( f_Gen_Color( 'l' ) )
ls_c2 = String( f_Gen_Color( 'blanco' ) )
ls_c3 = String( f_Gen_Color( 'selected' ) )

This.Object.DataWindow.detail.color=ls_c2 + "~tIf ( Mod( GetRow( ), 2) = 0, "+ls_c1+ ", "+ ls_c2 + " )"
	
end event

event dw_1::clicked;call super::clicked;

Choose Case dwo.Name
	Case 'cb_on'
		wf_Activar( '1', row )
		
	Case 'cb_off'
		wf_Activar( '0', row )
		
End Choose
end event

event dw_1::itemchanged;call super::itemchanged;ib_saved = False
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura_wks
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura_wks
integer x = 32
integer y = 1328
integer width = 507
integer height = 284
boolean enabled = false
boolean border = false
end type

event dw_list::itemchanged;call super::itemchanged;
ib_saved = False

This.Object.c_usumod[ row] = gs_usuario
This.Object.d_modifi[ row] = Today( )
		
end event

event dw_list::editchanged;call super::editchanged;ib_saved = False
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;This.SelectRow( 0, False )
end event

event dw_list::retrieveend;call super::retrieveend;This.SelectRow( 0, False )
end event

event dw_list::clicked;call super::clicked;

Choose Case dwo.Name
	Case 'cb_off'
		wf_DeleteRow( )
		
	Case 'cb_on'
		This.Object.c_activo[ row] = '1'
		This.Object.c_usumod[ row] = gs_usuario
		This.Object.d_modifi[ row] = Today( )
		
End Choose
end event

