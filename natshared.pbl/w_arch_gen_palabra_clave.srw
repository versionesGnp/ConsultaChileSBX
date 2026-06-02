//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Solicita palabra clave para acceder a transacción~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_arch_gen_palabra_clave from wa_response
end type
end forward

global type w_arch_gen_palabra_clave from wa_response
integer width = 1778
integer height = 1040
string title = "Confirmación por Palabra Clave"
end type
global w_arch_gen_palabra_clave w_arch_gen_palabra_clave

on w_arch_gen_palabra_clave.create
call super::create
end on

on w_arch_gen_palabra_clave.destroy
call super::destroy
end on

event open;call super::open;String	ls_1, ls_2, ls_3, ls_4, ls_5


dw_1.InsertRow(0)

Randomize(0)

ls_1 = String( Char( 64 + Rand(25)) )
ls_2 = String( Char( 64 + Rand(25)) )
ls_3 = String( Char( 64 + Rand(25)) )
ls_4 = String( Char( 64 + Rand(25)) )
ls_5 = String( Char( 64 + Rand(25)) )

dw_1.Object.v_clave[ 1] = ls_1 + ls_2 + ls_3 + ls_4 + ls_5
dw_1.AcceptText( )
end event

type dw_list from wa_response`dw_list within w_arch_gen_palabra_clave
boolean visible = false
integer x = 37
integer y = 444
integer width = 178
integer height = 108
integer taborder = 0
boolean enabled = false
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type dw_1 from wa_response`dw_1 within w_arch_gen_palabra_clave
integer width = 1897
integer height = 800
string dataobject = "d_arch_gen_palabra_clave"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_palabra_clave
integer x = 1225
integer y = 828
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_palabra_clave
integer x = 846
integer y = 828
boolean enabled = true
end type

event cb_aceptar::clicked;String	ls_clave, ls_text


dw_1.AcceptText( )
ls_clave = Upper( f_Trim( dw_1.Object.v_clave[ 1] ) )
ls_text = Upper( f_Trim( dw_1.Object.v_texto[ 1] ) )

If ls_text = '' Then 
	dw_1.SetFocus( )
	Return
End If

If Not ls_clave = ls_text Then
	dw_1.SetFocus( )
	MessageBox( Title, 'Palabra Clave Incorrecta', Exclamation! )
	Return
End If

CloseWithReturn( Parent, 'OK' )
end event

