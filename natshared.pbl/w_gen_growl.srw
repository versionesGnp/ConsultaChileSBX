//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Muestra Alerta Growl - f_growl~r~n    Recomendación: NIVEL EXPERTO~r~n*/
forward
global type w_gen_growl from wa_response
end type
end forward

global type w_gen_growl from wa_response
integer width = 1861
integer height = 512
windowtype windowtype = popup!
long backcolor = 15780518
string icon = "none"
boolean palettewindow = true
boolean center = false
integer transparency = 99
windowanimationstyle openanimation = rightslide!
integer animationtime = 250
integer ii_headerheight = 0
end type
global w_gen_growl w_gen_growl

type variables

Boolean	ib_timer
Integer	ii_timer = 0
end variables

on w_gen_growl.create
call super::create
end on

on w_gen_growl.destroy
call super::destroy
end on

event open;call super::open;Double ld_timer
istr_parm = Message.PowerObjectParm

//This.Title = istr_parm.s_cad[ 1]
dw_1.InsertRow(0) 
dw_1.Object.v_title[ 1] = istr_parm.s_cad[ 1]
dw_1.Object.v_message[ 1] = istr_parm.s_cad[ 2]


Choose Case istr_parm.s_cad[ 3]
	Case 'Exclamation'
		dw_1.Object.v_icon[ 1] = 'Images\mgExclamation.png'
		This.Backcolor = f_Gen_Color( 'st' )
		
	Case 'Question'
		dw_1.Object.v_icon[ 1] = 'Images\mgQuestion.png'
		This.Backcolor = f_Gen_Color( 'ba' )
		
	Case 'Success'
		dw_1.Object.v_icon[ 1] = 'Images\mgSuccess.png'
		This.Backcolor = f_Gen_Color( 'ba' )
		
	Case 'StopSign'
		dw_1.Object.v_icon[ 1] = 'Images\mgStopSign.png'
		This.Backcolor = f_Gen_Color( 'erojo' )
		
	Case Else
		dw_1.Object.v_icon[ 1] = 'Images\mg' + istr_parm.s_cad[ 3] + '.png'
		This.Backcolor = f_Gen_Color( 'o' )
		
End Choose

//Position
Choose Case istr_parm.s_cad[ 4]
	Case 'Bottom'
		Y = gw_Frame.Height - This.Height - 200
		
	Case 'Top'
		Y = 400

	Case 'Center'
		If istr_parm.s_cad[ 5] = 'Center' Then This.center = True
End Choose

Choose Case istr_parm.s_cad[ 5]
	Case 'Left'
		X = 100
		This.OpenAnimation = LeftSlide!
		
	Case 'Right'
		X = gw_frame.width - This.width - 200
End Choose


dw_1.Event SetObjectColorA( { 'v_title', 'v_message' }, 'White' )

This.Transparency = 25

dw_1.AcceptText( )
dw_1.Object.icon.FileName = dw_1.Object.v_icon[ 1]


If istr_parm.s_cad[ 6] = '0' Then istr_parm.s_cad[ 6] = '1.5'

ld_timer = Double( istr_parm.s_cad[ 6] )
ib_timer = ( ld_timer > 0 )
If ld_timer > 0 Then
	Timer( ld_timer )	
End If

dw_1.AcceptText( )


end event

event timer;call super::timer;
If Not ib_timer Then Return

ii_timer ++

If ii_timer = 5 Then Close( This )
end event

type dw_list from wa_response`dw_list within w_gen_growl
boolean visible = false
boolean enabled = false
end type

type dw_1 from wa_response`dw_1 within w_gen_growl
integer width = 2126
integer height = 416
string dataobject = "d_gen_growl"
end type

type cb_cancelar from wa_response`cb_cancelar within w_gen_growl
integer x = 1627
integer y = 516
end type

event cb_cancelar::clicked;
CloseWithReturn( Parent, 2 )

end event

type cb_aceptar from wa_response`cb_aceptar within w_gen_growl
integer x = 1243
integer y = 516
boolean enabled = true
boolean cancel = true
boolean default = false
end type

event cb_aceptar::clicked;call super::clicked;
Close( Parent )

end event

