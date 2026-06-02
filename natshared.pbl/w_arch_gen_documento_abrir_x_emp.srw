//objectcomments Autor: César Vilela~r~nnueva versión para abrir documentos x empresa
forward
global type w_arch_gen_documento_abrir_x_emp from w_arch_gen_documento_abrir
end type
end forward

global type w_arch_gen_documento_abrir_x_emp from w_arch_gen_documento_abrir
windowanimationstyle openanimation = centeranimation!
boolean ib_ind = true
boolean ib_inherited = true
boolean ib_retxemp = true
end type
global w_arch_gen_documento_abrir_x_emp w_arch_gen_documento_abrir_x_emp

type variables

end variables

forward prototypes
public function integer wf_inasignadw ()
public function integer wf_inclose ()
public subroutine wf_ultimo ()
end prototypes

public function integer wf_inasignadw ();
/* Se toma empresa si esta es enviada con PIPE | */
If Pos( is_doc, '|' ) > 0 Then
	is_emp = Left( is_doc, 2 )
	is_doc = Mid( is_doc, 4 )
End If

ib_ultimodoc = True
	
Choose Case is_doc
	Case 'CNT'
		dw_list.DataObject = 'd_arch_rhu_contract_abrir'

	Case 'CIT'
		dw_list.DataObject = 'd_arch_med_cita_abrir'
		ib_ultimodoc = False
			
	Case 'ATN'
		dw_list.DataObject = 'd_arch_med_atencion_abrir'
		//ib_ultimodoc = False
			
End Choose

Return 1

end function

public function integer wf_inclose ();Long		ll_row
String	ls_tbl
s_parm	lstr_parm


If dw_list.RowCount ( ) <= 0  Then 
	MessageBox( Title, 'No existen documentos para continuar.', Exclamation! )
	Return 0
End If

ll_row = dw_list.GetRow( )
ls_tbl = Lower( is_tbl )

lstr_parm.s_cad[ 1] = dw_list.Object.c_codigo_emp[ ll_row]
lstr_parm.s_cad[ 2] = dw_list.GetItemString( ll_row, 'c_codigo_' + ls_tbl )
 
CloseWithReturn( This, lstr_parm )


Return 1
end function

public subroutine wf_ultimo ();DateTime	ld_null
String	ls_doc, ls_emp, ls_tem, ls_max


Choose Case is_doc
	Case 'CNT'
		
		ls_emp = gs_emp
		
		Select	Max( c_codigo_cnt )
		Into		:ls_doc
		From		rhucontract
		Where		c_codigo_emp = :ls_emp  
		Using		SqlCa ;
		
		ls_doc = f_Trim(  ls_doc )

		
	Case 'ATN'
		
		ls_emp = gs_emp
		
		Select	Max( c_codigo_atn )
		Into		:ls_doc
		From		rhuMedCare
		Where		c_codigo_emp = :ls_emp  
		Using		SqlCa ;
		
		ls_doc = f_Trim(  ls_doc )

		
End Choose


SetNull( ld_null )
dw_list.Retrieve( ld_null, ld_null, ls_doc, gs_emp ) 
dw_list.SetFocus( )	

end subroutine

on w_arch_gen_documento_abrir_x_emp.create
call super::create
end on

on w_arch_gen_documento_abrir_x_emp.destroy
call super::destroy
end on

event open;
s_parm	lstr_parm
DateTime	ld_ini, ld_fin
String	ls_dw, ls_fil

lstr_parm = Message.PowerObjectParm

is_emp = f_Trim( lstr_parm.s_cad[ 1] )
is_doc = f_Trim( lstr_parm.s_cad[ 2] )
is_tbl = f_Trim( lstr_parm.s_cad[ 3] )
ls_dw  = f_Trim( lstr_parm.s_cad[ 4] )
is_ult = f_Trim( lstr_parm.s_cad[ 5] )

If UpperBound( lstr_parm.s_cad[ ] ) > 5 Then
	ls_fil = lstr_parm.s_cad[ 6]
End If

is_ult = f_Trim( lstr_parm.s_cad[ 5] )

ib_ultimodoc = ( Not is_ult = '' )
/*
If UpperBound( lstr_parm.s_cad[ ] ) > 5 Then 
	ib_retxEmp = ( f_Trim( lstr_parm.s_cad[ 6] ) = '1' )
End If
*/
dw_1.InsertRow( 1)

dw_list.DataObject = ls_dw

ld_ini = DateTime( Today( ) )
ld_fin = DateTime( Today( ) )

dw_1.Object.cb_ultimo.Visible = ib_ultimodoc

dw_1.Object.d_ini[ 1] = ld_ini 
dw_1.Object.d_fin[ 1] = ld_fin 
dw_1.AcceptText( )

dw_list.TriggerEvent( Constructor! )

If Not ls_fil = '' Then 
	dw_list.SetFilter( ls_fil )
	dw_list.Filter( ) 
End If
wf_Activo( )

PostEvent( 'ue_winopendoc' )
end event

type dw_list from w_arch_gen_documento_abrir`dw_list within w_arch_gen_documento_abrir_x_emp
end type

type dw_1 from w_arch_gen_documento_abrir`dw_1 within w_arch_gen_documento_abrir_x_emp
end type

type cb_cancelar from w_arch_gen_documento_abrir`cb_cancelar within w_arch_gen_documento_abrir_x_emp
end type

type cb_aceptar from w_arch_gen_documento_abrir`cb_aceptar within w_arch_gen_documento_abrir_x_emp
end type

type cb_nuevo from w_arch_gen_documento_abrir`cb_nuevo within w_arch_gen_documento_abrir_x_emp
end type

type cb_xls from w_arch_gen_documento_abrir`cb_xls within w_arch_gen_documento_abrir_x_emp
end type

