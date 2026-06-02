//objectcomments /* Autor: César Vilela~r~n    Función: BLClass BLObjets y BLScripts para presentación y ejecución de info.~r~n    Recomendación: NO MODIFICAR - AFECTA TODO ECLIPSE~r~n*/
forward
global type uo_eclipse from nonvisualobject
end type
end forward

global type uo_eclipse from nonvisualobject autoinstantiate
end type

type variables

Integer	msgRet
Icon Success
end variables

forward prototypes
public function integer messagebox (string as_title, string as_message, icon ai_icon, button ai_button)
public function integer messagebox (string as_title, string as_message, icon ai_icon)
public function integer messagebox (string as_title, string as_message)
public function integer messagebox (string as_title, string as_message, icon ai_icon, button ai_button, integer ai_default)
public function integer growl (string as_title, string as_message, icon ai_icon, vtextalign position, alignment alignment)
public function integer growl (string as_title, string as_message, icon ai_icon, vtextalign position)
public function integer growl (string as_title, string as_message, icon ai_icon)
public function integer growl (string as_title, string as_message)
public function integer growl (string as_title, string as_message, icon ai_icon, vtextalign position, alignment alignment, decimal seconds)
public function integer growl (string as_title, string as_message, icon ai_icon, decimal seconds)
end prototypes

public function integer messagebox (string as_title, string as_message, icon ai_icon, button ai_button);

Integer	li_ret

li_ret = This.MessageBox( as_title, as_message, ai_icon, ai_button, 1 )

Return li_ret
/*

Integer	li_ret
s_parm	lstr_parm

msgRet = 0
lstr_parm.s_cad[ 1] = as_title
lstr_parm.s_cad[ 2] = as_message

Choose Case ai_icon
	Case Exclamation!
		lstr_parm.s_cad[ 3] = 'Exclamation'
		
	Case StopSign!
		lstr_parm.s_cad[ 3] = 'StopSign'
		
	Case Question!
		lstr_parm.s_cad[ 3] = 'Question'
		
	Case Else
		lstr_parm.s_cad[ 3] = 'Information'
		
End Choose

Choose Case ai_button
	Case YesNo!
		lstr_parm.s_cad[ 4] = 'YesNo'
		
	Case OkCancel!
		lstr_parm.s_cad[ 4] = 'OkCancel'
		
	Case RetryCancel!
		lstr_parm.s_cad[ 4] = 'RetryCancel'
		
	Case YesNoCancel!
		lstr_parm.s_cad[ 4] = 'YesNoCancel'
		
	Case Else
		lstr_parm.s_cad[ 4] = 'Ok'
				
End Choose

OpenWithParm( w_gen_MessageBox, lstr_parm )
li_ret = f_Zero( Message.DoubleParm )
msgRet = li_ret

Return li_ret
*/
end function

public function integer messagebox (string as_title, string as_message, icon ai_icon);
Integer	li_ret

li_ret = This.MessageBox( as_title, as_message, ai_icon, Ok!, 1 )

Return li_ret
end function

public function integer messagebox (string as_title, string as_message);
Integer	li_ret

li_ret = This.MessageBox( as_title, as_message, Information!, Ok!, 1 )

Return li_ret
end function

public function integer messagebox (string as_title, string as_message, icon ai_icon, button ai_button, integer ai_default);//CVilela Nov-2021

Integer	li_ret, li_pos
s_parm	lstr_parm


msgRet = 0
lstr_parm.s_cad[ 1] = as_title
lstr_parm.s_cad[ 2] = as_message

Choose Case ai_icon
	Case Exclamation!
		lstr_parm.s_cad[ 3] = 'Exclamation'
		
	Case StopSign!
		lstr_parm.s_cad[ 3] = 'StopSign'
		
	Case Question!
		lstr_parm.s_cad[ 3] = 'Question'
		
	Case Else
		lstr_parm.s_cad[ 3] = 'Information'
		
End Choose

Choose Case ai_button
	Case YesNo!
		lstr_parm.s_cad[ 4] = 'YesNo'
		If ai_default < 1 Or ai_default > 2 Then ai_default = 1
		
	Case OkCancel!
		lstr_parm.s_cad[ 4] = 'OkCancel'
		If ai_default < 1 Or ai_default > 2 Then ai_default = 1
		
	Case RetryCancel!
		lstr_parm.s_cad[ 4] = 'RetryCancel'
		If ai_default < 1 Or ai_default > 2 Then ai_default = 1
		
	Case YesNoCancel!
		lstr_parm.s_cad[ 4] = 'YesNoCancel'
		If ai_default < 1 Or ai_default > 3 Then ai_default = 1
		
	Case Else
		lstr_parm.s_cad[ 4] = 'Ok'
		ai_default = 1
				
End Choose

lstr_parm.s_cad[ 5] = String( ai_default )

// Preguntar Si Contiene Negritas
lstr_parm.s_cad[ 6] = ''
li_pos = Pos( Upper( as_message ), '[BOLD]' ) 
If li_pos > 0 Then
	lstr_parm.s_cad[ 6] = Mid( as_message, li_pos + 6 )
	lstr_parm.s_cad[ 2] = Left( as_message, li_pos - 1 )
End If

OpenWithParm( w_gen_MessageBox, lstr_parm )
li_ret = f_Zero( Message.DoubleParm )
msgRet = li_ret

Return li_ret
end function

public function integer growl (string as_title, string as_message, icon ai_icon, vtextalign position, alignment alignment);//CVilela 12-Ene-2022

Integer	li_ret 

li_ret = Growl( as_Title, as_message, ai_icon, position, alignment, 0 )

Return li_ret
end function

public function integer growl (string as_title, string as_message, icon ai_icon, vtextalign position);//CVilela 12-Ene-2022

Integer	li_ret

li_ret = Growl( as_Title, as_message, ai_icon, position, Right!, 0 )

Return li_ret
end function

public function integer growl (string as_title, string as_message, icon ai_icon);//CVilela 12-Ene-2022

Integer	li_ret

li_ret = Growl( as_Title, as_message, ai_icon, Top!, Right!, 0 )

Return li_ret
end function

public function integer growl (string as_title, string as_message);//CVilela 12-Ene-2022

Integer	li_ret

li_ret = Growl( as_Title, as_message, Success, Top!, Right!, 0 )

Return li_ret
end function

public function integer growl (string as_title, string as_message, icon ai_icon, vtextalign position, alignment alignment, decimal seconds);//CVilela 12-Ene-2022

//Growl( as_Title, as_message, ai_icon=Success, position=Top!, alignment=Right!, seconds = 2  )

Integer	li_ret, li_pos
s_parm	lstr_parm


msgRet = 0
lstr_parm.s_cad[ 1] = as_title
lstr_parm.s_cad[ 2] = as_message


Choose Case ai_icon
	Case Exclamation!
		lstr_parm.s_cad[ 3] = 'Exclamation'
		
	Case StopSign!
		lstr_parm.s_cad[ 3] = 'StopSign'
		
	Case Question!
		lstr_parm.s_cad[ 3] = 'Question'
		
	Case Information!
		lstr_parm.s_cad[ 3] = 'Information'
		
	Case Else//Success//Else
		lstr_parm.s_cad[ 3] = 'Success'
End Choose


Choose Case Position
	Case VCenter!
		lstr_parm.s_cad[ 4] = 'Center'
		
	Case Bottom!
		lstr_parm.s_cad[ 4] = 'Bottom'
		
	Case Top!
		lstr_parm.s_cad[ 4] = 'Top'
		
	Case Else
		lstr_parm.s_cad[ 4] = 'Top'
		
End Choose

Choose Case alignment
	Case Center!
		lstr_parm.s_cad[ 5] = 'Center'
		
	Case Left!
		lstr_parm.s_cad[ 5] = 'Left'
		
	Case Right!
		lstr_parm.s_cad[ 5] = 'Right'
		
	Case Else
		lstr_parm.s_cad[ 5] = 'Right'
		
End Choose

lstr_parm.s_cad[ 6] = String( seconds )

If IsValid( w_gen_Growl ) Then Close( w_gen_Growl )
If as_message = '' Then Return li_ret

If seconds < 0 Then
	OpenWithParm( w_gen_Growl, lstr_parm )
	li_ret = f_Zero( Message.DoubleParm )
	msgRet = li_ret
	
	Return li_ret
End If

w_gen_Growl	lw_growl
OpenWithParm( lw_growl, lstr_parm )
li_ret = f_Zero( Message.DoubleParm )
msgRet = li_ret

Return li_ret
end function

public function integer growl (string as_title, string as_message, icon ai_icon, decimal seconds);//CVilela 12-Ene-2022

Integer	li_ret

li_ret = Growl( as_Title, as_message, ai_icon, Top!, Right!, seconds )

Return li_ret
end function

on uo_eclipse.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_eclipse.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

