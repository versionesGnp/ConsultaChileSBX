forward
global type w_gen_fade_background from window
end type
end forward

global type w_gen_fade_background from window
integer width = 3538
integer height = 1624
boolean titlebar = true
windowstate windowstate = maximized!
long backcolor = 268435456
string icon = "AppIcon!"
integer transparency = 50
windowanimationstyle closeanimation = fadeanimation!
end type
global w_gen_fade_background w_gen_fade_background

on w_gen_fade_background.create
end on

on w_gen_fade_background.destroy
end on

event resize;
If IsValid( gw_frame ) Then
	
	This.move( gw_frame.x, gw_frame.y )
	newheight = gw_frame.Height
	newWidth = gw_frame.Width
	
	This.Height = newHeight
	This.Width = newWidth
End If
end event

