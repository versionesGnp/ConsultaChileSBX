//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Contiene el Dock de opciones~r~n    Recomendación: Nivel Experto~r~n*/
forward
global type w_arch_gen_dock from window
end type
type dw_1 from datawindow within w_arch_gen_dock
end type
end forward

global type w_arch_gen_dock from window
integer width = 3246
integer height = 280
boolean border = false
windowtype windowtype = child!
long backcolor = 553648127
string icon = "AppIcon!"
integer transparency = 100
windowanimationstyle openanimation = bottomslide!
windowanimationstyle closeanimation = topslide!
dw_1 dw_1
end type
global w_arch_gen_dock w_arch_gen_dock

type variables
uo_gen_menu	iuo_menu
end variables

forward prototypes
public function integer wf_retrieve ()
end prototypes

public function integer wf_retrieve ();
dw_1.SetTransObject( SqlCa )
dw_1.Retrieve( '3', '%', gs_usuario )

Return dw_1.RowCount( )

end function

on w_arch_gen_dock.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_arch_gen_dock.destroy
destroy(this.dw_1)
end on

event open;f_CenterWindow( This )
This.Y = gw_frame.Height - ( This.Height * 2 ) - 50
//This.BackColor = f_Gen_Color( 'm' )
end event

type dw_1 from datawindow within w_arch_gen_dock
integer width = 3282
integer height = 344
integer taborder = 10
string dataobject = "d_arch_gen_dock"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = StyleBox!
end type

event constructor;
wf_Retrieve( )
end event

event clicked;String	ls_opc, ls_dwo
		

row = f_Zero( row )
If row <= 0 Then Return

ls_dwo = dwo.Name

If Not Left( ls_dwo, 12 ) = 'c_codigo_opc' Then Return

ls_opc = f_Trim( This.Object.c_codigo_opc[ row] )
If ls_opc = '' Then Return

iuo_menu.of_Exec( ls_opc )

end event

