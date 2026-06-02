//objectcomments Autor: César Vilela~r~nFunción: Giro y Actividad Económica
forward
global type w_mant_gen_giro_list from w_gen_document_mant
end type
end forward

global type w_mant_gen_giro_list from w_gen_document_mant
string title = "Giro y Actividad Económica"
boolean ib_retxemp = true
string is_rpt = "d_rpt_rhu_mutualycaja_list"
end type
global w_mant_gen_giro_list w_mant_gen_giro_list

type variables
w_mant_gen_giro_edit  iw_edit

end variables

forward prototypes
public function boolean wf_mant ()
public function boolean wf_eliminarverificar ()
public function boolean wf_printretrieve (datawindow adw_rpt)
end prototypes

public function boolean wf_mant ();
OpenSheetWithParm( iw_edit, istr_parm, gw_frame, 0, Original! )
Return True
end function

public function boolean wf_eliminarverificar ();
Integer	li_existe
String	ls_sis, ls_emp, ls_gir


If dw_1.RowCount( ) <= 0 Then Return False

ls_emp = f_Trim( dw_1.Object.c_codigo_emp[ dw_1.GetRow() ] )
ls_gir = f_Trim( dw_1.Object.c_codigo[ dw_1.GetRow() ] )
ls_sis = f_Trim( dw_1.Object.c_sistema[ dw_1.GetRow() ] )

If ls_sis = '1' Then
	MessageBox( Title, 'Registro de Sistema.' + Char(13) + 'No se puede eliminar.', Exclamation! )
End If
/*
If Not ls_sis = '1' Then
	Select Top 1 1
	Into	:li_existe
	From	comProveedor
	Where	c_codigo_emp = :ls_emp
	And	c_codigo_gir = :ls_gir
	Using SqlCa ;
	
	li_existe = f_Zero( li_existe )
	
	If li_existe > 0 Then
		ls_sis = '1' 
		MessageBox( Title, 'Giro relacionado con Cliente o Proveedor.' + Char(13) + 'No se puede eliminar.', Exclamation! )
	End If	
End If
*/
Return ( Not ls_sis = '1')

end function

public function boolean wf_printretrieve (datawindow adw_rpt);
adw_rpt.Retrieve( is_arg1, is_arg2 )

Return True

end function

on w_mant_gen_giro_list.create
call super::create
end on

on w_mant_gen_giro_list.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant`dw_1 within w_mant_gen_giro_list
string dataobject = "d_mant_gen_giro_list"
end type

event dw_1::constructor;call super::constructor;
String ls_y

ls_y = String( This.Object.c_nivel_gir.Y )
This.Object.co_codigo.Y = ls_y
This.Object.co_nombre.Y = ls_y

end event

type dw_menu from w_gen_document_mant`dw_menu within w_mant_gen_giro_list
end type

type st_sincontenido from w_gen_document_mant`st_sincontenido within w_mant_gen_giro_list
end type

