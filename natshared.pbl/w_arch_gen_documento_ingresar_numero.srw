//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Solicita número de documento en buscador de documentos~r~n    Recomendación: Nivel Experto~r~n*/
forward
global type w_arch_gen_documento_ingresar_numero from wa_response
end type
end forward

global type w_arch_gen_documento_ingresar_numero from wa_response
integer width = 1865
integer height = 696
string title = "Buscar Documento"
integer ii_headerheight = 0
end type
global w_arch_gen_documento_ingresar_numero w_arch_gen_documento_ingresar_numero

on w_arch_gen_documento_ingresar_numero.create
call super::create
end on

on w_arch_gen_documento_ingresar_numero.destroy
call super::destroy
end on

event open;call super::open;dw_1.InsertRow(0)


end event

type dw_list from wa_response`dw_list within w_arch_gen_documento_ingresar_numero
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

type dw_1 from wa_response`dw_1 within w_arch_gen_documento_ingresar_numero
integer width = 1897
integer height = 420
string dataobject = "d_arch_gen_documento_ingresar_numero"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_documento_ingresar_numero
integer x = 1367
integer y = 472
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_documento_ingresar_numero
integer x = 987
integer y = 472
boolean enabled = true
end type

event cb_aceptar::clicked;String	ls_text


dw_1.AcceptText( )
ls_text = f_Trim( dw_1.Object.v_texto[ 1] )
If ls_text = '' Then 
	dw_1.SetFocus( )
	Return
End If
CloseWithReturn( Parent, ls_text )
end event

