//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Muestra mensaje para f_Gen_Procesando~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_arch_gen_procesando from wa_response
end type
end forward

global type w_arch_gen_procesando from wa_response
integer width = 1563
integer height = 232
boolean titlebar = false
boolean controlmenu = false
windowtype windowtype = popup!
long backcolor = 553648127
string icon = "AppIcon!"
boolean palettewindow = true
integer transparency = 99
windowanimationstyle openanimation = centeranimation!
integer animationtime = 250
integer ii_headerheight = 0
end type
global w_arch_gen_procesando w_arch_gen_procesando

type variables

Integer	ii_timer = 0
end variables

forward prototypes
public subroutine settext (string as_msg)
end prototypes

public subroutine settext (string as_msg);
/* SetText( text ) */
//mle_1.Text = as_msg
//Return

dw_1.SetRedraw( False )
dw_1.Reset( )
dw_1.InsertRow( 1 )
dw_1.Object.v_mensaje[ 1] = as_msg
dw_1.AcceptText( )
dw_1.SetRedraw( True )

end subroutine

on w_arch_gen_procesando.create
call super::create
end on

on w_arch_gen_procesando.destroy
call super::destroy
end on

event open;call super::open;String	ls_msg


SetPointer( HourGlass! )

ls_msg = f_Trim( Message.StringParm )

SetText( ls_msg )

This.Transparency = 25
This.Backcolor = f_Gen_Color( 'white' )

end event

event timer;call super::timer;
ii_timer ++

If ii_timer = 5 Then Close( This )
end event

type dw_list from wa_response`dw_list within w_arch_gen_procesando
boolean visible = false
integer taborder = 0
boolean enabled = false
end type

type dw_1 from wa_response`dw_1 within w_arch_gen_procesando
integer width = 2126
integer height = 236
integer taborder = 0
string dataobject = "d_arch_gen_procesando"
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_procesando
integer x = 1627
integer y = 516
integer taborder = 0
end type

event cb_cancelar::clicked;
CloseWithReturn( Parent, 2 )

end event

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_procesando
integer x = 1243
integer y = 516
integer taborder = 0
boolean enabled = true
boolean cancel = true
boolean default = false
end type

event cb_aceptar::clicked;call super::clicked;
Close( Parent )

end event

