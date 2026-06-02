//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Diálogo selección de empresas asignadas a login - uo_dw_list~r~n    Recomendación: NO MODIFICAR~r~n*/
forward
global type w_arch_gen_selecciona_empresa from wa_response
end type
end forward

global type w_arch_gen_selecciona_empresa from wa_response
integer width = 2245
integer height = 1428
string title = "Selección de Empresa"
end type
global w_arch_gen_selecciona_empresa w_arch_gen_selecciona_empresa

on w_arch_gen_selecciona_empresa.create
call super::create
end on

on w_arch_gen_selecciona_empresa.destroy
call super::destroy
end on

event open;call super::open;
Long		ll_rows, ll_find
String	ls_emp, ls_exc


gs_emp = ''

Select	c_codigo_emp
Into		:ls_emp
From		genlogin 
Where		c_codigo_usu = :gs_usuario ;

ls_emp = f_Trim( ls_emp )
ls_exc = f_Trim( ls_exc )

dw_1.Retrieve( gs_usuario )
ll_rows = dw_1.RowCount( )

If ll_rows > 1 Then
	ll_find = f_Zero( dw_1.Find( 'c_codigo_emp = "' + ls_emp + '"', 1, ll_rows ) )
	If ll_find > 0 Then
		dw_1.ScrollToRow( ll_find )
		//If ls_exc = '1' Then
		//	cb_aceptar.TriggerEvent( Clicked! )
		//End If			
	End If
ElseIf ll_rows = 0 Then
	MessageBox( Title, 'Aun no se ha asignado ninguna empresa al usuario ' + gs_usuario + '.', Exclamation! )
	cb_cancelar.TriggerEvent( Clicked! )
Else
	cb_aceptar.TriggerEvent( Clicked! )
End If


end event

type dw_list from wa_response`dw_list within w_arch_gen_selecciona_empresa
boolean visible = false
integer y = 1104
boolean border = false
end type

type dw_1 from wa_response`dw_1 within w_arch_gen_selecciona_empresa
integer width = 2715
integer height = 1176
string dataobject = "d_arch_gen_selecciona_empresa"
boolean vscrollbar = true
end type

event dw_1::doubleclicked;call super::doubleclicked;
cb_aceptar.TriggerEvent( Clicked! )
end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_selecciona_empresa
integer x = 1710
integer y = 1216
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_selecciona_empresa
integer x = 1344
integer y = 1216
boolean enabled = true
end type

event cb_aceptar::clicked;call super::clicked;

dw_1.AcceptText( )

gs_emp = f_Trim( dw_1.Object.c_codigo_emp[ dw_1.GetRow( )] )

CloseWithReturn( Parent, gs_emp )

end event

