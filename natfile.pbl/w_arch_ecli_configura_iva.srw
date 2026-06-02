//objectcomments /* Autor: César Vilela ~r~n    Función: edición de IVA~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_iva from w_gen_document_doc
end type
end forward

global type w_arch_ecli_configura_iva from w_gen_document_doc
integer width = 4457
integer height = 1904
string title = "Configurar IVA"
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_ecli_configura_iva w_arch_ecli_configura_iva

type variables
String	is_tem, is_epq
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_savedocument ()
public subroutine wf_add ()
public function integer wf_deleterow ()
public subroutine wf_activar (string as_act, long al_row)
end prototypes

public function integer wf_new ();

ib_new = True
ib_saved = True

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )


If dw_1.Retrieve( gs_emp ) <= 0 Then 
	wf_Add( )
End If

Return 1
end function

public function boolean wf_savedocument ();Long		i
String	ls_cod


dw_1.AcceptText( )

For i = 1 To dw_1.RowCount( )
	ls_cod = f_Trim( dw_1.Object.c_codigo_iva[ i] )
	
	dw_1.ScrollToRow( i )	
	
Next

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

dw_1.Retrieve( gs_emp )
f_GenProcesando( '' )
MessageBox( Title, 'Información ha sido guardada correctamente.' )

gw_frame.SetMicroHelp( 'Listo' )

Return True

 
end function

public subroutine wf_add ();Long	i, j, ll_cod
String	ls_cod, ls_wks


dw_1.SetRedraw( False )
dw_1.Update( True )
dw_1.Retrieve( gs_emp )
Commit Using SqlCa ;


j = dw_1.RowCount( )


Select	Max( c_codigo_iva )
Into		:ls_cod
From		geniva 
Using		SqlCa ;

ls_cod = f_Trim( ls_cod )

ll_cod = Long( ls_cod ) + 1
ls_cod = String( ll_cod, '00' )

i = dw_1.InsertRow(0)

dw_1.Object.c_codigo_iva[ i] = ls_cod

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
ls_cod = f_Trim( dw_1.Object.c_codigo_iva[ i] )

Select	Count(*)
Into		:ll_cod
From		geniva
Where		c_codigo_iva = :ls_cod ;

ll_cod = f_Zero( ll_cod )

If ll_cod = 0 And dw_1.RowCount( ) > 1 Then
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
	dw_1.Object.c_codigo_emp[ al_row] = gs_emp
	dw_1.Object.c_codigo_usu[ al_row] = gs_usuario
	dw_1.Object.d_creacion_iva[ al_row] = Today( )
	dw_1.Object.c_activo_iva[ al_row] = as_act
Else
	dw_1.Object.c_usumod_iva[ al_row] = gs_usuario
	dw_1.Object.d_modifi_iva[ al_row] = Today( )
	dw_1.Object.c_activo_iva[ al_row] = as_act
End If

dw_1.SetRow( al_row )
dw_1.ScrollToRow( al_row )

ib_saved = False
dw_1.AcceptText( )
end subroutine

on w_arch_ecli_configura_iva.create
call super::create
end on

on w_arch_ecli_configura_iva.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura_iva
integer width = 4306
integer height = 1084
string dataobject = "d_arch_ecli_configura_iva"
end type

event dw_1::buttonclicked;call super::buttonclicked;

Choose Case dwo.Name
	Case 'cb_add'
		wf_Add( )
		
	Case 'cb_del'
		wf_DeleteRow( )
		
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

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura_iva
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura_iva
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

