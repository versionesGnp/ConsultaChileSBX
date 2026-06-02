forward
global type w_arch_gen_notificacion from wa_response
end type
end forward

global type w_arch_gen_notificacion from wa_response
integer width = 3616
integer height = 1024
string title = "Notificaciones"
boolean controlmenu = false
boolean ib_posy = true
boolean ib_fadeeffect = true
end type
global w_arch_gen_notificacion w_arch_gen_notificacion

on w_arch_gen_notificacion.create
call super::create
end on

on w_arch_gen_notificacion.destroy
call super::destroy
end on

event open;call super::open;
Title = 'Notificaciones para ' + gs_usuario

dw_list.Retrieve( gs_usuario )

dw_list.SetObjectColor( 'c_usucrea', 'c_activo = "1"', {'o', 't'} )
dw_list.SetObjectColor( 'leida_t', 'c_activo = "1"', {'o', 't'} )

cb_aceptar.Visible = ( dw_list.Rowcount( ) > 0 )
If ( dw_list.Rowcount( ) = 0 ) Then 
	cb_cancelar.Text = 'Cerrar'
End If

end event

type dw_list from wa_response`dw_list within w_arch_gen_notificacion
integer x = 50
integer y = 60
integer width = 3520
integer height = 704
string dataobject = "d_arch_gen_notificacion_det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
boolean ib_detselect = true
end type

event dw_list::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_leida'
		ScrollToRow( row )
		This.Object.c_activo[ row] = '0'
		This.Object.d_modifi[ row] = TodayDT( )
		
		cb_aceptar.Visible = True
		cb_aceptar.Enabled = True
		
End Choose
end event

type dw_1 from wa_response`dw_1 within w_arch_gen_notificacion
integer width = 3817
integer height = 780
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_notificacion
integer x = 3177
integer y = 824
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_notificacion
integer x = 2798
integer y = 824
end type

event cb_aceptar::clicked;call super::clicked;
dw_list.AcceptText( )
dw_list.Update( )

Commit Using SqlCa ;

CloseWithReturn( Parent, 'OK' )
end event

