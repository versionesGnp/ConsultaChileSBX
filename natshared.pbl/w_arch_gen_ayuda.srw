//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Muestra ayuda de las opciones del sistema~r~n    Recomendación: Nivel Experto~r~n*/
forward
global type w_arch_gen_ayuda from w_gen_document_doc
end type
end forward

global type w_arch_gen_ayuda from w_gen_document_doc
integer width = 4631
integer height = 2228
string title = "Ayuda"
boolean ib_fulllist = true
boolean ib_permitemod = true
event postopen ( )
end type
global w_arch_gen_ayuda w_arch_gen_ayuda

forward prototypes
public function integer wf_new ()
public function boolean wf_readyforadd ()
public subroutine wf_add ()
end prototypes

public function integer wf_new ();DataWindowChild	ldwc_x
DateTime	ld_doc
String	ls_doc, ls_tem


If Not wf_SaveChanges( ) Then
	Return 0
End If

ib_new = True
ib_saved = True

ld_doc = DateTime( Today( ) )

dw_1.Reset( )
dw_list.Reset( )
dw_1.SetTransObject( SqlCa )
dw_1.InsertRow(0)

dw_1.SetFocus( )


Return 1
end function

public function boolean wf_readyforadd ();/* wf_ReadyForAdd( ) */

Boolean	lb_ready

lb_ready = ( dw_1.GetColumnName( ) = 'v_texto' )

If lb_ready Then
	wf_Add( )
End If

Return lb_ready

end function

public subroutine wf_add ();/* Se usará para consultar */
String	ls_txt


dw_1.AcceptText( )

ls_txt = f_Trim( dw_1.Object.v_texto[ 1] )

dw_list.Retrieve( ls_txt )

Return

end subroutine

on w_arch_gen_ayuda.create
call super::create
end on

on w_arch_gen_ayuda.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_gen_ayuda
integer width = 4334
integer height = 540
string dataobject = "d_arch_gen_ayuda"
end type

event dw_1::buttonclicked;call super::buttonclicked;

Choose Case dwo.Name
		
	Case 'cb_consultar'
		wf_Add( )
		
End Choose
end event

event dw_1::key;call super::key;String	ls_cod


If Not KeyDown( KeyF3! ) Then Return

Choose Case GetColumnName( )
	Case 'c_codigo_pro' 
		f_GenBuscar( '', GetColumnName( ), 'PRO', This )
		
	Case 'c_codigo_dep'
		f_GenBuscar( '', GetColumnName( ), 'DEP', This )
		
	Case 'c_codigo_prv'
		f_GenBuscar( '', GetColumnName( ), 'PRV', This )
		
End Choose


end event

event dw_1::itemchanged;call super::itemchanged;String	ls_nom


Choose Case dwo.Name
	Case 'c_codigo_pro'
		data = f_Trim( data )
		If data = '' Then Return
		
		ls_nom = f_Trim( This.Object.v_nombre_pro[ 1] )
		If Not data = '' And ls_nom = '' Then
			f_GenBuscar( '@' + data, 'c_codigo_pro', 'PRO', This )
			AcceptText( )
		End If
		
		Return 2

End Choose
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_gen_ayuda
string dataobject = "d_gen_menu_toolbar_return"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_gen_ayuda
boolean visible = true
integer x = 165
integer y = 580
integer width = 4261
integer height = 1352
string dataobject = "d_arch_gen_ayuda_det"
boolean border = false
end type

event dw_list::constructor;call super::constructor;
This.Object.DataWindow.Detail.Height = 130
end event

event dw_list::rowfocuschanged;//
end event

event dw_list::retrieveend;call super::retrieveend;SelectRow( 0, False )
end event

event dw_list::itemchanged;call super::itemchanged;DateTime	ld_sur, ld_rec
Dec		ldc_sur


ib_saved = False

dw_1.AcceptText( )

ld_rec = dw_1.Object.d_recepcion_ord[ 1]

Choose Case dwo.Name
	Case 'n_cantsurtida_ord'
		ldc_sur = f_Zero( Dec( data ) )
		ld_sur = This.Object.d_surtida_ord[ row]

		If ldc_sur <= 0 Then
			SetNull( ld_sur )
		Else
			If Not f_IsDate( ld_sur ) Then
				ld_sur = ld_rec
			End If
		End If
		This.Object.d_surtida_ord[ row] = ld_sur
	
	Case 'd_surtida_ord'
		ldc_sur = f_Zero( dw_list.Object.n_cantsurtida_ord[ row] )
		ld_sur = DateTime( Date( data ) )
		
		If ld_sur < ld_rec Then
			MessageBox( Parent.Title, 'La fecha de surtido de producto no puede ser menor a la recepción.' )
			SetNull( ld_sur )
			This.Object.d_surtida_ord[ row] = ld_sur
			AcceptText( )
			Return 2
		End If

End Choose

end event

event dw_list::buttonclicked;call super::buttonclicked;DateTime	ld_sur
Dec		ldc_sur


This.AcceptText( )
dw_1.AcceptText( )

Choose Case dwo.Name
	Case 'cb_igual'
		ldc_sur = This.Object.n_cantidad_ord[ row]
		ld_sur = dw_1.Object.d_recepcion_ord[ 1]
		This.SetColumn( 'n_cantsurtida_ord' )
		This.Object.n_cantsurtida_ord[ row] = ldc_sur
		This.Object.d_surtida_ord[ row] = ld_sur
		ib_saved = False
		
End Choose		
end event

event dw_list::editchanged;call super::editchanged;ib_saved = False
end event

