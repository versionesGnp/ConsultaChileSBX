//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Ancestra de Documentos con header y detail (uo_dw_list)~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_gen_document_doc from w_gen_document
end type
type dw_list from uo_dw_list within w_gen_document_doc
end type
end forward

global type w_gen_document_doc from w_gen_document
integer height = 1924
boolean ib_fulledit = true
boolean ib_saved = true
dw_list dw_list
end type
global w_gen_document_doc w_gen_document_doc

type variables

Boolean   ib_crearnuevo
Boolean   ib_permitemod
Boolean   ib_new
Boolean   ib_task = False
Boolean   ib_posY = True

end variables

forward prototypes
public function long wf_print ()
public function integer wf_delete ()
public function integer wf_deleterow ()
public function integer wf_open ()
public function boolean wf_save ()
public function integer wf_new ()
public function boolean wf_savechanges ()
public function boolean wf_savedocument ()
public function boolean wf_savebefore ()
public subroutine wf_xls ()
public subroutine wf_menu (string as_obj)
public subroutine wf_add ()
public function string wf_gencod (string as_parm)
public function integer wf_opendoc (string as_doc, string as_parm, w_gen_document_doc aw_doc)
public function boolean wf_readyforadd ()
public function integer wf_opendoc (s_parm astr_parm, w_gen_document_doc aw_doc)
end prototypes

public function long wf_print ();/* Programar en las Windows descendientes */

Return 1

// El código deberá ser similar al de abajo, indicando N° Doc y Preview
DataWindow	ldw_1
Long			ll_rows
String		ls_doc


//ls_doc = f_Trim( dw_1.Object.c_codigo[ 1] )
If Not ib_saved Then
	MessageBox( Title, 'El documento ' + ls_doc + &
								' no ha sido guardado.~r~nPara poder imprimir, revise/complete' + &
								' el documento y haga clic en guardar y reintente.', Exclamation! )
	Return -1
End If

//ldw_1 = f_PrintPreview( 'DataWindow', 'Nombre del Reporte' )
ll_rows = ldw_1.Retrieve( ls_doc, ls_doc ) 

Return ll_rows

end function

public function integer wf_delete ();Return 1
end function

public function integer wf_deleterow ();Return 1
end function

public function integer wf_open ();Return 1
end function

public function boolean wf_save ();
dw_1.SetFocus( )

If Not wf_SaveBefore( ) Then Return False

If Not wf_SaveDocument( ) Then Return False

ib_saved = True
If ib_crearnuevo Then
	ib_new = True
	wf_New( )
End If

gw_frame.SetMicroHelp( 'Listo' )

Return True

end function

public function integer wf_new ();Return 1
end function

public function boolean wf_savechanges ();Integer	li_opc
String	ls_doc


If Not ib_saved Then 

	li_opc = MessageBox( Title, '¿Desea guardar los cambios efectuados en el ' + &
								'Documento ' + ls_doc + '?', Question!, YesNoCancel! )
	Choose Case	li_opc
		Case 1
			If wf_Save( ) Then
				Return True
			Else
				Return False
			End If
		Case 2
			Return True
		Case Else
			Return False
	End Choose
End If

Return True
end function

public function boolean wf_savedocument ();
Return True
end function

public function boolean wf_savebefore ();If ib_saved Then 
	gw_frame.SetMicroHelp( 'Documento no ha sido modificado.' )
	Return False
End If

If Not ib_new Then
	If Not ib_permitemod Then
		ib_saved = True
		MessageBox( Title, 'Documento ha sido guardado anteriormente.' )
		Return False
	End If
End If

Return True

end function

public subroutine wf_xls ();
dw_list.ExportExcel( )


end subroutine

public subroutine wf_menu (string as_obj);/* Debe estar activo el extend */


Choose Case as_obj
	Case 'p_logo'
		//OpenSheet( w_gen_pagina_web, gw_frame )
	Case 'cb_new'
		wf_New( )
	Case 'cb_open'
		wf_Open( )
	Case 'cb_save'
		wf_Save( )
	Case 'cb_delete'
		wf_Delete( )
	Case 'cb_print'
		wf_Print( )
	Case 'cb_task'
		wf_Task( )
	Case 'cb_add'
		wf_add( )
	Case 'cb_xls'
		wf_xls( )
	Case 'cb_refresh'
		wf_Refresh( )
	Case 'cb_return'
		Close( This )
End Choose

end subroutine

public subroutine wf_add ();
Return
end subroutine

public function string wf_gencod (string as_parm);

Return ''
end function

public function integer wf_opendoc (string as_doc, string as_parm, w_gen_document_doc aw_doc);
/* OpenDoc( as_doc, as_parm, aw_doc ) */

Return 1
end function

public function boolean wf_readyforadd ();/* wf_ReadyForAdd( )
	Aquí se debe agregar en las ventanas heredadas la validación de la columna
	Si se está en la última conlumna GetColumnName( ) entonces retornar true */

Return False
end function

public function integer wf_opendoc (s_parm astr_parm, w_gen_document_doc aw_doc);
/* OpenDoc( astr__parm, aw_doc ) */

Return 1
end function

on w_gen_document_doc.create
int iCurrent
call super::create
this.dw_list=create dw_list
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_list
end on

on w_gen_document_doc.destroy
call super::destroy
destroy(this.dw_list)
end on

event resize;call super::resize;
//dw_1.Width = Newwidth - ( dw_1.X * 2 )

dw_list.height = newheight - (dw_list.y ) - 70

Int	li_new, li_max

li_max = dw_list.ii_MaxWidth
If ib_fulllist Then
	If li_max = 0 Then
		dw_list.Width = Newwidth - ( dw_list.X * 2 )
	End If	
End If

If ib_fulllist And li_max > 0 Then
	li_new = Newwidth - ( dw_list.X * 2 )
	If li_new > li_max Then
		li_new = li_max 
	End If
	dw_list.Width = li_new
End If
end event

event open;call super::open;If ib_task Then
	dw_menu.Object.cb_task.color = f_Gen_Color( 'white' )
End If

wf_New( )
end event

event closequery;call super::closequery;If Not ib_saved Then
	If Not MessageBox( Title, 'Las modificaciones realizadas no han sido guardadas.~r~n' + &
								'¿Confirma cerrar y perder los cambios?', Question!, YesNo! ) = 1 Then
		Return 1
	End If
End If
end event

type dw_1 from w_gen_document`dw_1 within w_gen_document_doc
event processenter pbm_dwnprocessenter
integer x = 41
integer y = 156
end type

event dw_1::processenter;If wf_ReadyForAdd( ) Then
	Return
Else
	Send(Handle(this),256,9,Long(0,0))
End If

end event

event dw_1::constructor;call super::constructor;
f_SetDWColor( This )
If Not This.DataObject = '' Then
	This.Object.DataWindow.Header.Color = f_Gen_Color( 'titwin' )
	This.Object.st_title.Color = f_Gen_Color( 'b' )
	This.Object.DataWindow.ShowBackColorOnXP = 'yes'
End If


end event

type dw_menu from w_gen_document`dw_menu within w_gen_document_doc
string dataobject = "d_gen_menu_toolbar_doc"
end type

event dw_menu::clicked;call super::clicked;
wf_Menu( dwo.Name )
end event

type dw_list from uo_dw_list within w_gen_document_doc
boolean visible = false
integer x = 37
integer y = 1088
integer width = 3200
integer taborder = 11
boolean bringtotop = true
end type

event constructor;call super::constructor;
If ib_posY Then f_SetDWPositionY( This, ii_PosDetY )
end event

