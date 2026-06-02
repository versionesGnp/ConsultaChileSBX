//objectcomments /* Autor: César Vilela ~r~n    Función: Temas front end para usuario~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario_tema from w_gen_document_doc
end type
end forward

global type w_arch_ecli_configura_usuario_tema from w_gen_document_doc
integer height = 1848
string title = "Cambiar Tema"
boolean ib_cbexcel = false
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_ecli_configura_usuario_tema w_arch_ecli_configura_usuario_tema

type variables
String	is_tem, is_sem
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_savedocument ()
public function boolean wf_savechanges ()
public function boolean wf_savebefore ()
end prototypes

public function integer wf_new ();Long		ll_find
String	ls_tma


ib_new = True
ib_saved = True

dw_1.Reset( )
dw_1.SetTransObject( SqlCa )

If f_Zero( dw_1.Retrieve( gs_usuario ) ) <=0 Then
	MessageBox( Title, 'Se produjo un error al intentar recuperar información', Exclamation! )
	Close( This )
	Return -1
End If

ls_tma = f_Trim( dw_1.Object.c_codigo_tma[ 1] )

dw_list.Retrieve( )
ll_find = f_Zero( dw_list.Find( 'c_codigo_tma = "' + ls_tma + '"', 1, dw_list.RowCount( ) ) )

If ll_find > 0 Then
	dw_list.ScrollToRow( ll_find )
End If

Return 1
end function

public function boolean wf_savedocument ();String	ls_tma


If dw_list.GetRow( ) <= 0 Then
	MessageBox( Title, 'No existen temas para seleccionar y guardar.', Exclamation! )
	Return False
End If

ls_tma = f_Trim( dw_list.Object.c_codigo_tma[ dw_list.GetRow( )] )
	
dw_1.Object.c_codigo_tma[ 1] = ls_tma
dw_1.AcceptText( )

If Not dw_1.Update( True ) = 1 Then
	RollBack Using SqlCa ;
	f_GenProcesando( '' )
	dw_1.SetTransObject( SqlCa )
	Return False
End If

Commit Using SqlCa;

ib_saved = True

wf_New( )
ib_saved = True
MessageBox( Title, 'Información ha sido guardada correctamente.' + Char( 13) + &
							'Será necesario cerrar ' + gs_aplicacion + ' y volver a iniciarlo para terminar de efectuar los cambios.')


Return True
 
end function

public function boolean wf_savechanges ();Return True

end function

public function boolean wf_savebefore ();Return True
end function

on w_arch_ecli_configura_usuario_tema.create
call super::create
end on

on w_arch_ecli_configura_usuario_tema.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura_usuario_tema
integer width = 3666
integer height = 1484
string dataobject = "d_arch_ecli_configura_usuario_tema"
boolean vscrollbar = true
end type

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura_usuario_tema
integer width = 3497
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura_usuario_tema
boolean visible = true
integer x = 1202
integer y = 764
integer width = 2400
integer height = 776
string dataobject = "d_arch_ecli_configura_usuario_tema_det"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
end type

event dw_list::constructor;call super::constructor;This.Object.DataWindow.Detail.Height = 175
end event

event dw_list::rowfocuschanged;This.SelectRow( 0, False )


end event

event dw_list::retrieveend;call super::retrieveend;This.SelectRow( 0, False )
end event

event dw_list::doubleclicked;call super::doubleclicked;wf_SaveDocument( )
end event

