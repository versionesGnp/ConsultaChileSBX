//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Ventana Principal de Eclipse, contenedora de todos los objetos~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_gen_principal from window
end type
type mdi_1 from mdiclient within w_gen_principal
end type
type mditbb_1 from tabbedbar within w_gen_principal
end type
type mdirbb_1 from ribbonbar within w_gen_principal
end type
type dw_menu from datawindow within w_gen_principal
end type
type dw_cab from datawindow within w_gen_principal
end type
end forward

global type w_gen_principal from window
integer width = 3168
integer height = 1700
boolean titlebar = true
string title = "Natural SD "
string menuname = "m_gen_principal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
mditbb_1 mditbb_1
mdirbb_1 mdirbb_1
dw_menu dw_menu
dw_cab dw_cab
end type
global w_gen_principal w_gen_principal

type variables
Integer	ii_menu
uo_gen_menu	iuo_menu

Boolean	ib_click = False, ib_move = False
Long		il_pos = 0
String	is_resizemenu = '1'
end variables

forward prototypes
public subroutine wf_setworkspace ()
public function integer wf_showmenu ()
public subroutine wf_close ()
public function integer wf_resizemenu ()
public function integer wf_menustd (string as_act)
public function integer wf_dock (string as_act)
public function integer wf_cfguser ()
public function integer wf_fb ()
public function integer wf_home ()
public function integer wf_notify ()
public subroutine wf_haltclose ()
end prototypes

public subroutine wf_setworkspace ();/* wf_SetWorkSpace( ) 
	Autor: César Vilela R. */

Long	ll_nwidth, ll_nheight

ll_nwidth  = This.WorkSpaceWidth( )

If gb_connect Then
	ll_nwidth  = ll_nwidth - dw_menu.width
Else
	dw_menu.Visible = False
End If

//If ib_sbar Then ll_nwidth = ll_nwidth - dw_sbar.Width
ll_nheight = This.WorkSpaceHeight( ) - dw_cab.height

ll_nheight = ll_nheight - mdi_1.MicroHelpHeight

mdi_1.SetRedraw( False )
If Not gb_connect Then
	mdi_1.Move ( 0, dw_cab.height)
Else
	mdi_1.Move (dw_menu.width, dw_cab.height)
End If

mdi_1.Resize (ll_nwidth -0, ll_nheight )

mdi_1.SetRedraw( True )

end subroutine

public function integer wf_showmenu ();/* wf_ShowMenu( ) */
Integer	li_ret
String	ls_std, ls_dock, ls_tem, ls_ntem, ls_mUF, ls_nUsu


Select	c_menustd_usu
Into		:ls_std
From		genlogin
Where		c_codigo_usu = :gs_usuario
Using		SqlCa ;


Select	c_dock_usu, v_nombre_usu
Into		:ls_dock, :ls_nUsu
From		genlogin
Where		c_codigo_usu = :gs_usuario
Using		SqlCa ;


Select	c_mostrarUF_emp
Into		:ls_mUF
From		genEmpresa
Where		c_codigo_emp = :gs_emp
Using		SqlCa ;

ls_mUF = f_Trim( ls_mUF )
If Not ls_mUF = '1' Then ls_mUF = '0'

If ls_mUF = '1' Then
	//Muestra Unidad de Fomento
	Dec	ldc_uf
	ldc_uf =  f_GenTipoCambioMda( DateTime( Today() ), 'UF' )
	
	ls_tem = 'UF'
	If Not ldc_uf = 0 Then 
		ls_ntem = String( ldc_uf )
	Else
		ls_ntem = '- Sin Asignar -'
	End If
	
Else
	//Muestra Temporada
	//ls_tem = f_GenTemporadaxEmp( gs_emp )
	//ls_ntem = f_GetGenericaxEmp( gs_emp, ls_tem, 'TEM' )
End If

If ls_tem = '' Then
	ls_tem = '-'
	ls_ntem = '- Sin Asignar -'
End If

If Not ls_mUF = '1' Then ls_tem = 'TEMP: ' + ls_tem

ls_std = f_Trim( ls_std )
If Not ls_std = '1' Then ls_std = '0'

ls_dock = f_Trim( ls_dock )
If Not ls_dock = '1' Then ls_dock = '0'

This.SetRedraw( False )
If ls_std = '1' Then 
	dw_menu.DataObject = 'd_gen_menu_principal_tree'
End If
If Not ls_std = '1' Then 
	dw_menu.DataObject = 'd_gen_principal_menu'
End If

dw_menu.TriggerEvent( Constructor! )
dw_menu.SetTransObject( SqlCa )

dw_menu.SetRedraw( False )
li_ret = dw_menu.Retrieve( gs_emp, gs_usuario, '0' )
Commit Using SqlCa ;

dw_cab.Object.c_codigo_emp[ 1] = gs_emp
dw_cab.Object.c_codigo_usu[ 1] = gs_usuario
dw_cab.Object.v_nombre_usu[ 1] = ls_nUsu
dw_cab.Object.c_codigo_tem[ 1] = ls_tem
dw_cab.Object.v_nombre_tem[ 1] = ls_ntem
dw_cab.Object.v_nombre_cnx[ 1] = gs_iniProfile
dw_cab.AcceptText( )

If ls_std = '1' And li_ret > 0 Then 
	dw_menu.Object.c_menu[ 1] = '1'
	dw_menu.AcceptText( )
End If

dw_menu.SetRedraw( True )
dw_menu.Visible = True
This.SetRedraw( True )

If ls_std = '1' Then
	If Not IsValid( w_arch_gen_pagina_inicio ) Then
		OpenSheet( w_arch_gen_pagina_inicio, This, 1, Original! )
	End If
End If


wf_Dock( ls_dock )
Return li_ret
end function

public subroutine wf_close ();w_gen_document	lw_win


lw_win = gw_frame.GetActiveSheet( )

If IsValid( lw_win ) Then
	If Not MessageBox( Title, '¿Confirma cerrar sesión y todas las ventanas abiertas?', Question!, YesNo! ) = 1 Then
		Return
	End If
End If
Do While IsValid( lw_win )
	//lw_win.ib_saved = False
	Close( lw_win )
	lw_win = gw_frame.GetActiveSheet( )
Loop

gb_connect = False

If IsValid( w_arch_gen_dock ) Then
	Close( w_arch_gen_dock ) 
End If

OpenSheet( w_arch_gen_acceso, gw_frame )
wf_SetWorkspace( )

end subroutine

public function integer wf_resizemenu ();/* wf_ResizeMenu( ) */
Integer	li_width, li_mostrar = 0
String	ls_menu


dw_menu.AcceptText( )

ls_menu = f_Trim( dw_menu.Object.c_menu[ 1] )

If ls_menu = '1' Then
	ls_menu = '0'
	li_width = 150
	li_mostrar = 1
Else
	ls_menu = '1'
	li_width = ii_menu
End If

is_resizemenu = ls_menu
dw_menu.Width = li_width
dw_menu.Object.c_menu[ 1] = ls_menu
dw_menu.AcceptText( )
dw_menu.vscrollbar = ( ls_menu = '1' )

dw_cab.Object.c_codigo_usu[ 1] = gs_usuario
dw_cab.Object.n_mostrar[ 1] = li_mostrar
dw_cab.AcceptText( )

wf_SetWorkSpace( ) 

Return 1
end function

public function integer wf_menustd (string as_act);
dw_menu.Object.c_activo[ 1] = as_act
dw_menu.AcceptText( )

Update	genlogin
Set		c_menustd_usu = :as_act
Where		c_codigo_usu = :gs_usuario
Using		SqlCa ;

Commit Using SqlCa ;

MessageBox( Title, 'Para ver los cambios aplicados debe de reinciar el sistema' )

Return 1
end function

public function integer wf_dock (string as_act);
dw_menu.Object.c_dock[ 1] = as_act
dw_menu.AcceptText( )

Update	genlogin
Set		c_dock_usu = :as_act
Where		c_codigo_usu = :gs_usuario
Using		SqlCa ;

Commit Using SqlCa ;

If as_act = '1' Then Open( w_arch_gen_dock, gw_frameNat )
If as_act = '0' Then 
	If IsValid( w_arch_gen_dock ) Then Close( w_arch_gen_dock )
End If

Return 1
end function

public function integer wf_cfguser ();Integer	li_opc


li_opc = f_GenMenuPopup( gs_usuario, { 'Modificar mi cuenta', &
									 'Cambiar contraseña', &
									 '-', &
									 'Seleccionar Tema', &
									 '-', &
									 'BL-Dock On/off', &
									 'Actualizar Menú', &
									 '-', &
									 'Cerrar Sesión' } ) 
									 

Choose Case li_opc
	Case 1
		OpenSheet( w_arch_ecli_configura_usuario_cta, gw_frame, 0, Original! )
	
	Case 2
		OpenSheet( w_arch_ecli_configura_usuario_pass, gw_frame, 0, Original! )
		
	Case 4
		OpenSheet( w_arch_ecli_configura_usuario_tema, gw_frame, 0, Original! )
		
	Case 6
		If IsValid( w_arch_gen_dock ) Then
			wf_Dock( '0' )
		Else
			wf_Dock( '1' )
		End If

	Case 7
		gw_frameNat.wf_ShowMenu( )
		
	Case 9
		wf_Close( )
		
End Choose

Return li_opc
end function

public function integer wf_fb ();
Return 1
f_Run( 'https://www.facebook.com/groups/989928484395080', True )

Return 1
end function

public function integer wf_home ();
Return 1
f_Run( 'http://bl-eclipse.com/', True ) 

Return 1
end function

public function integer wf_notify ();Integer	li_opc, li_notify, i
uo_DataStore	lds_noti
String	ls_menu[], ls_opc[], ls_exe


Return 0

If gs_usuario = '' Then li_notify = 0

lds_noti = Create uo_DataStore

lds_noti.DataObject = 'd_arch_gen_notificacion'
lds_noti.SetTransObject( SqlCa )
li_notify = f_Zero( lds_noti.Retrieve( gs_emp, gs_usuario ) )

If li_notify <= 0 Then
	Destroy lds_noti
	Return li_notify
End If

For i = 1 To li_notify
	ls_menu[ i] = f_Trim( lds_noti.Object.v_nombre_ori[ i] )
	ls_opc[ i] = f_Trim( lds_noti.Object.c_codigo_ori[ i] )
	If i > 15 Then
		Exit
	End If
Next

li_opc = f_GenMenuPopup( 'Notificaciones', ls_menu[ ] ) 

If li_opc <= 0 Then
	Destroy lds_noti
	Return li_notify
End If

ls_exe = ls_opc[ li_opc]

Choose Case ls_exe
	Case 'TIC'
		OpenSheet( w_arch_ecli_tipo_cambio, gw_frame, 1, Original! )
	
		
End Choose

Destroy lds_noti

Return li_opc
end function

public subroutine wf_haltclose ();w_gen_document	lw_win


lw_win = gw_frame.GetActiveSheet( )

MessageBox( Title, gs_sys + ' cerrará sesión y todas las ventanas abiertas.', Exclamation! ) 

Do While IsValid( lw_win )
	lw_win.ib_saved = True
	Close( lw_win )
	lw_win = gw_frame.GetActiveSheet( )
Loop

gb_connect = False

If IsValid( w_arch_gen_dock ) Then
	Close( w_arch_gen_dock ) 
End If

Disconnect Using SqlCa ;
OpenSheet( w_arch_gen_acceso, gw_frame )
wf_SetWorkspace( )

end subroutine

on w_gen_principal.create
if this.MenuName = "m_gen_principal" then this.MenuID = create m_gen_principal
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.dw_menu=create dw_menu
this.dw_cab=create dw_cab
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1,&
this.dw_menu,&
this.dw_cab}
end on

on w_gen_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.mdirbb_1)
destroy(this.dw_menu)
destroy(this.dw_cab)
end on

event open;gw_frameNat = This


This.Title = gs_aplicacion

wf_SetWorkSpace( ) 

/* Si hay scheme entonces recuperar valores */
f_GetRegistry( 'ColorScheme', gs_tma )
If Not gs_tma = '' Then
	f_GenColorScheme( gs_tma, False )
End If
OpenSheet( w_arch_gen_acceso, This, 0, Original! )
end event

event resize;dw_cab.width = newwidth

dw_cab.Object.co_cianame.X = newwidth - 1650
dw_cab.Object.co_usuname.X = newwidth - 1650
dw_cab.Object.co_notify.X = newwidth - 300
//dw_cab.Object.p_config.X = newwidth - 200
dw_cab.Object.cb_config.X = newwidth - 260

//dw_cab.Object.p_fb.X = newwidth - 100
dw_cab.Object.cb_fb.X = newwidth - 160

dw_menu.Y = dw_cab.Height
dw_menu.Height =  newheight - dw_menu.Y - mdi_1.MicroHelpHeight//dw_cab.Height -

wf_SetWorkSpace( )

end event

type mdi_1 from mdiclient within w_gen_principal
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_gen_principal
int X=0
int Y=0
int Width=0
int Height=104
end type

type mdirbb_1 from ribbonbar within w_gen_principal
int X=0
int Y=0
int Width=0
int Height=596
end type

type dw_menu from datawindow within w_gen_principal
event mousemove pbm_dwnmousemove
event lbuttonup pbm_dwnlbuttonup
integer y = 156
integer width = 1079
integer height = 1292
integer taborder = 20
string dataobject = "d_gen_principal_menu"
boolean vscrollbar = true
boolean livescroll = true
end type

event mousemove;Return
If ib_click Then
	ib_move = True
	gw_frame.SetMicrohelp( 'move up' )	//ib_click = False
Else
	ib_move = False
		gw_frame.SetMicrohelp( 'move X ' + String( xpos ) + '   Y ' + String( ypos ) )
End If


end event

event lbuttonup;String	ls_act

Return 
gw_frame.SetMicrohelp( 'up' )

If ib_click And ib_move Then	
	gw_frame.SetMicrohelp( 'beep(1)' )
	xpos = f_Zero( xpos )
	If ( xpos > il_pos ) Then
		If is_resizemenu = '0' Then
			wf_ResizeMenu( )
		End If
	ElseIf xpos > 0 And xpos < il_pos Then
		If is_resizemenu = '1' Then
			wf_ResizeMenu( )
		End If
	End If
End If

ib_click = False
ib_move = False
il_pos = 0
end event

event constructor;
If DataObject = 'd_gen_principal_menu' Then This.Object.DataWindow.Color = f_Gen_Color( 'm' )
ii_menu = This.Width

This.Object.DataWindow.ShowBackColorOnXP = 'yes'
end event

event buttonclicked;
If dwo.Name = 'cb_inicio' Then
	OpenSheetWithParm( w_arch_gen_pagina_inicio, 'TS', gw_frame, 1, Original! )
End If

If dwo.Name = 'cb_close' Or dwo.Name = 'cb_closex' Then
	wf_Close( )
End If
end event

event clicked;Boolean	lb_expanded
Long		ll_row, ll_error
String	ls_opc, ls_band, ls_row


ls_band = This.GetBandAtPointer( )

Choose Case dwo.Name
		
	Case 'cb_menu' 
		wf_ResizeMenu( )
		
	Case 'cb_on'
		wf_MenuStd( '1' )
		
	Case 'cb_off'
		wf_MenuStd( '0' )
		
	Case 'cb_ondock'
		wf_Dock( '1' )
		
	Case 'cb_offdock'
		wf_Dock( '0' )
		
	Case 'v_nombre_mod'
		/* Nivel 1 - Módulo */
		ls_row = Mid( ls_band, Pos( ls_band, '	', 1 ) + 1 )
		row = Long( ls_row )
		
		If f_Zero( row ) > 0 Then
			lb_expanded = This.IsExpanded( row, 1 )
			If lb_expanded Then
				ll_error = This.Collapse( row, 1 )
			Else
				ll_error = This.Expand( row, 1 )
			End If
		End If
		Return
	
	Case 'v_nombre_sub'
		/* Nivel 2 - Submódulo */
		ls_row = Mid( ls_band, Pos( ls_band, '	', 1 ) + 1 )
		row = Long( ls_row )
		
		If f_Zero( row ) > 0 Then
			lb_expanded = This.IsExpanded( row, 2 )
			If lb_expanded Then
				ll_error = This.Collapse( row, 2 )
			Else
				ll_error = This.Expand( row, 2 )
			End If
		End If
		Return
				
	Case 'v_nombre_opc'
		ls_opc = f_Trim( This.Object.c_codigo_opc[ row] )
		iuo_menu.of_Exec( ls_opc )

	Case 'datawindow'
		ib_move = False
		ib_click = True
		il_pos = xpos
		gw_frame.SetMicrohelp( 'down' )

End Choose
end event

event rbuttondown;String	ls_cod, ls_nom


Choose Case dwo.Name
		
	Case 'v_nombre_opc'

		ls_cod = f_Trim( This.Object.c_codigo_opc[ row] )
		ls_nom = f_Trim( This.Object.v_nombre_opc[ row] )
		
		iuo_menu.of_QAccess( ls_cod, True )
		If IsValid( w_arch_gen_pagina_inicio ) Then
			w_arch_gen_pagina_inicio.wf_New( )
		End If
		
End Choose
end event

type dw_cab from datawindow within w_gen_principal
integer width = 2514
integer height = 156
integer taborder = 10
string dataobject = "d_gen_principal_cab"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;

Choose Case dwo.Name
	Case 'p_config', 'cb_config'
		
		wf_CfgUser( )

	Case 'p_fb', 'cb_fb'
		
		wf_FB( )
		
	Case 'p_logo'
		
		wf_Home( )
		
	Case 'co_notify'
		
		wf_Notify( )
		
End Choose
end event

