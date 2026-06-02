//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLVisual Object  - Primera intección del user, recepciona login, valida y abre principal - ver ini files~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_arch_gen_acceso from w_gen_document_doc
end type
end forward

global type w_arch_gen_acceso from w_gen_document_doc
integer height = 2396
string title = "Acceder al Sistema"
boolean controlmenu = false
boolean ib_fulledit = false
boolean ib_fulllist = true
end type
global w_arch_gen_acceso w_arch_gen_acceso

type prototypes
function ulong capCreateCaptureWindowA(string lpszWindowName,ulong dwStyle,long li_x ,long li_y ,long nWidth ,long nHeight ,ulong ParentWin ,long nId ) LIBRARY 'AVICAP32.DLL' 

function long SendMessage (long hwnd, long wMsg, long wParam, long lParam) Library "user32.dll" 


end prototypes

type variables
//Instance Variables 
Uint lhand 
Constant long GET_FRAME = 1084 
Constant long COPY = 1054 
Constant long WM_USER = 1024 
Constant long WM_CAP_START = WM_USER 
Constant long WM_CAP_STOP = WM_CAP_START + 68 
Constant long WM_CAP_DRIVER_CONNECT = WM_CAP_START + 10 
Constant long WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + 11 
Constant long WM_CAP_SAVEDIB = WM_CAP_START + 25 
Constant long WM_CAP_GRAB_FRAME = WM_CAP_START + 60 
Constant long WM_CAP_SEQUENCE = WM_CAP_START + 62 
Constant long WM_CAP_FILE_SET_CAPTURE_FILEA = WM_CAP_START + 20 
Constant long WM_CAP_SEQUENCE_NOFILE =WM_CAP_START+ 63 
Constant long WM_CAP_SET_OVERLAY =WM_CAP_START+ 51 
Constant long WM_CAP_SET_PREVIEW =WM_CAP_START+ 50 
Constant long WM_CAP_SET_CALLBACK_VIDEOSTREAM = WM_CAP_START +6 
Constant long WM_CAP_SET_CALLBACK_ERROR=WM_CAP_START +2 
Constant long WM_CAP_SET_CALLBACK_STATUSA= WM_CAP_START +3 
Constant long WM_CAP_SET_CALLBACK_FRAME= WM_CAP_START +5 
Constant long WM_CAP_SET_SCALE=WM_CAP_START+ 53 
Constant long WM_CAP_SET_PREVIEWRATE=WM_CAP_START+ 52 

Long wm_cap_savedatdib = 1049 
Long wm_cap_dlg_videoformat = 1065 
Long wm_cap_dlg_videosource = 1066 
Long wm_cap_dlg_videodisplay = 1067 
Long wm_cap_get_videoformat = 1068 
Long wm_cap_set_videoformat = 1069 
Long wm_cap_dlg_videocompression = 1070 
Long cf_bitmap = 2 
Long wm_close = 16 
Ulong scrcopy = 32 
string gs_pic_path 
string gs_cd_path 
string gs_path 
string gs_ds_pic 
string gs_ds_cd 
string gs_cd_rq 
long gl_pic_sj = 0 

end variables

forward prototypes
public function integer wf_new ()
public subroutine wf_iniciar ()
public function boolean wf_readyforadd ()
end prototypes

public function integer wf_new ();Integer	i, li_cantprof
String	ls_last, ls_ruser, ls_rpass, ls_checkkey, ls_rprofile, ls_profile, &
			ls_profilelist, ls_xprof, ls_img, ls_ts


//dw_1.Object.DataWindow.Color = f_Gen_Color( 'azul7' )

dw_1.Reset( )
dw_1.InsertRow(0)
dw_1.SetFocus( )

/* No debe mostrar ningún usuario en cabecera */
gw_frameNAT.dw_cab.Object.c_codigo_usu[ 1] = ''


f_GetRegistry( 'RememberUser', ls_ruser )
f_GetRegistry( 'RememberPass', ls_rpass )
f_GetRegistry( 'CheckKey', ls_checkkey )
f_GetRegistry( 'LastUser', ls_last )
f_GetRegistry( 'RememberSQLCA', ls_rprofile )
f_GetRegistry( 'LastSQLCA', ls_profile )


If Not ls_ruser = '1' Then ls_ruser = '0'
dw_1.Object.c_recordarcod_usu[ 1] = ls_ruser

If Not ls_rpass = '1' Then ls_rpass = '0'
dw_1.Object.c_recordarpass_usu[ 1] = ls_rpass

If ls_rprofile = '' Then ls_rprofile = '1'
If Not ls_rprofile = '1' Then ls_rprofile = '0'

dw_1.Object.c_recodarprof_usu[ 1] = ls_rprofile

If ls_profile = '' Then ls_profile = 'Database'
dw_1.Object.v_profile_usu[ 1] = ls_profile

li_cantprof = f_Zero( Integer( ProfileString( gs_ini, 'Profile', 'Profile', '' ) ) )

For i =1 To li_cantprof
	ls_xprof = ProfileString( gs_ini, 'Profile', 'Prof' + String( i, '00'), '' ) 
	ls_xprof = ls_xprof + '~t' + ls_xprof + '/'	// <--- Sirve para generar elementos
	ls_profilelist = ls_profilelist + ls_xprof
Next

If i <= 1 Then
	ls_profilelist = ls_profile + '~t' + ls_profile + '/'
End If

dw_1.Object.v_profile_usu.Values = ls_profilelist // <--- Asigna los elementos generados

If ls_ruser = '1' Then
	dw_1.Object.c_codigo_usu[ 1] = ls_last
	If Not ls_last = '' Then
		dw_1.SetColumn( 'v_password_usu' )
	End If
	If ls_rpass = '1' Then
		If Not ls_last = '' Then dw_1.Object.v_password_usu[ 1] = ls_checkkey
	End If
End If

dw_1.AcceptText( )
dw_1.SetColumn( 'c_codigo_usu' )

dw_1.Object.gs_version[ 1] = gs_version 

Return 1
end function

public subroutine wf_iniciar ();DateTime	ld_hoy
Integer	li_rpta, li_dias, li_dia
Long		ll_count, ll_min
String	ls_ruser, ls_rpass, ls_pass, ls_error, ls_pcname, &
			ls_admin, ls_usu, ls_pasx, ls_profile, ls_rprofile, &
			ls_sbar, ls_msg, ls_min, ls_act, ls_ts, ls_tipusu, &
			ls_lun, ls_mar, ls_mie, ls_jue, ls_vie, ls_sab, &
			ls_diabk, ls_std 


dw_1.AcceptText( )
dw_1.SetFocus( )

ls_ruser = f_Trim( dw_1.Object.c_recordarcod_usu[ 1] )
ls_rpass = f_Trim( dw_1.Object.c_recordarpass_usu[ 1] )
ls_usu = f_Trim( dw_1.Object.c_codigo_usu[ 1] )
ls_pasx = dw_1.Object.v_password_usu[ 1]
ls_rprofile = f_Trim( dw_1.Object.c_recodarprof_usu[ 1] )
ls_profile = f_Trim( dw_1.Object.v_profile_usu[ 1] )

gs_usuario = Upper( ls_usu )
gs_iniProfile = ''

If f_Trim( gs_usuario ) = '' Then
	MessageBox( Title, 'Debe ingresar el identificador del usuario.', Exclamation!)
	Return 
End If

f_GenProcesando( 'Conectando con el Servidor' )

/* Nueva Forma de conectarse al servidor d DB */
Disconnect ;
gb_connect = False
If ls_profile = '' Then ls_profile = 'Database'
If f_SQLConnect( SqlCa, ls_profile ) < 0 Then
	dw_1.SetFocus( )
	f_GenProcesando( '' )
	dw_1.SetColumn( 'v_profile_usu' )
	li_rpta = MessageBox( Title, '¿Desea reintentar con una diferente conexión?.', Question!, YesNo! )
	If Not li_rpta = 1 Then
		Halt Close
	End If
	Return
End If

dw_1.SetColumn( 'c_codigo_usu' )

Select	v_password_usu,
			c_activo_usu
Into 		:ls_pass,
			:ls_act
From		genlogin
Where		c_codigo_usu = :gs_usuario ;

If SqlCa.SqlCode <> 0 Then
	gs_usuario = ''
	f_GenProcesando( '' )
	MessageBox( Title, 'Identificador de usuario o contraseña incorrectos.', Exclamation!)
	Return
End If
	
ls_act = f_Trim( ls_act )

String	ls_ipf

ls_ipf = gs_iniProfile
gs_iniProfile = ls_profile

ib_ora = f_IsOracle( )

If ib_ora Then
	If Not Lower( f_DesEncripta( ls_pass ) ) = Lower( ls_pasx ) Then
		gs_usuario = ''
		f_GenProcesando( '' )
		MessageBox( Title, 'Identificador de usuario o contraseña incorrectos.', Exclamation!)
		Return
	End If
End If

If Not ib_ora Then
	If Not Lower( ls_pass ) = Lower( f_Encripta( ls_pasx ) ) Then
		gs_usuario = ''
		f_GenProcesando( '' )
		MessageBox( Title, 'Identificador de usuario o contraseña incorrectos.', Exclamation!)
		Return
	End If
End If

gs_iniProfile = ls_ipf 

If ls_act = '0' Then
	gs_usuario = ''
	MessageBox( Title, 'Cuenta de Usuario temporalmente bloqueada.~r' + &
							'No se puede continuar con el sistema y se cerrará.', Exclamation!)
	Halt Close
End If


f_SetRegistry( 'RememberUser', ls_ruser )
f_SetRegistry( 'RememberPass', ls_rpass )
f_SetRegistry( 'CheckKey', ls_pasx )
f_SetRegistry( 'LastUser', gs_usuario )
f_SetRegistry( 'RememberSQLCA', ls_rprofile )
f_SetRegistry( 'LastSQLCA', ls_profile )

gb_connect = True

f_GenProcesando( 'Configurando Entorno...' )

Select	c_codigo_tma
Into 		:gs_tma
From		genlogin
Where		c_codigo_usu = :gs_usuario ;

gs_tma = f_Trim( gs_tma )
If Not gs_tma = '' Then
	/* Si tema, obtenemos el tema, y luego guardamos como Scheme */
	f_GenColorTema( gs_tma )
	f_GenColorScheme( gs_tma, True )
End If

Select	c_menustd_usu
Into		:ls_std
From		genlogin
Where		c_codigo_usu = :gs_usuario
Using		SqlCa ;


Open( w_arch_gen_selecciona_empresa )

If gs_emp = '' Then
	f_GenProcesando( '' )
	gb_connect = True
	Return
End If

f_GenProcesando( 'Configurando Inicio...' )

/* CVilela 11/Dic/2019 */
gs_iniProfile = ls_profile
gw_frameNat.wf_SetWorkSpace( )
gw_frameNat.wf_ShowMenu( )
//gw_frame = gw_frameNat
ls_std = f_Trim( ls_std )
If Not ls_std = '1' Then ls_std = '0'

ls_std = '1' 

If ls_std = '1' Then
	OpenSheet( w_arch_gen_pagina_inicio, gw_frame, 1, Original! )
End If

/* CVilela 25/Nov/2024 */
String	ls_iDB

ls_iDB = ProfileString( gs_ini, gs_iniProfile, 'InstanceDB', '' ) 
If Not ls_iDB = '' Then
	sap.s_db = ls_iDB
	sap.b_SelectDB = False
Else
	sap.s_db = ''
	sap.b_SelectDB = True
End If
/////////////////////////


Close ( This )
f_GenProcesando( '' )


end subroutine

public function boolean wf_readyforadd ();If dw_1.GetColumnName( ) = 'c_recodarprof_usu' Then
	wf_Iniciar( )
	Return True
Else
	Return False
End If
	
end function

on w_arch_gen_acceso.create
call super::create
end on

on w_arch_gen_acceso.destroy
call super::destroy
end on

event resize;call super::resize;dw_1.X = ( newWidth - dw_1.Width ) / 2
end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_gen_acceso
integer x = 293
integer width = 3739
integer height = 1784
string dataobject = "d_arch_gen_acceso"
end type

event dw_1::buttonclicked;call super::buttonclicked;

wf_Iniciar( )
end event

event dw_1::itemchanged;call super::itemchanged;

Choose Case dwo.Name
	Case 'c_codigo_usu'
		This.Object.v_password_usu[ 1] = ''
		
End Choose
end event

event dw_1::itemfocuschanged;call super::itemfocuschanged;
String	ls_col1, ls_col2


dw_1.SetRedraw( False )
ls_col2 = String( f_Gen_Color( 'toolbar' ) )
ls_col1 = String( f_Gen_Color( 'cromado2' ) )
f_SetDWColor( dw_1 )

f_SetObjectColor( This, 'r_1', 'rectangle', ls_col1 )
f_SetObjectColor( This, 'r_2', 'rectangle', ls_col1 )
f_SetObjectColor( This, 'r_3', 'rectangle', ls_col1 )
/*
This.Modify( 'r_1.Brush.Color = ' + ls_col1 )
This.Modify( 'r_1.Pen.Color = ' + ls_col1 )
This.Modify( 'r_2.Brush.Color = ' + ls_col1 )
This.Modify( 'r_2.Pen.Color = ' + ls_col1 )
This.Modify( 'r_3.Brush.Color = ' + ls_col1 )
This.Modify( 'r_3.Pen.Color = ' + ls_col1 )
*/
Choose Case dwo.Name
	Case 'c_codigo_usu'
		f_SetObjectColor( This, 'r_1', 'rectangle', ls_col2 )
		
	Case 'v_password_usu'
		f_SetObjectColor( This, 'r_2', 'rectangle', ls_col2 )
		
	Case 'v_profile_usu'
		f_SetObjectColor( This, 'r_3', 'rectangle', ls_col2 )
		
End Choose

dw_1.SetRedraw( True )

end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_gen_acceso
string dataobject = "d_gen_menu_toolbar_inicio"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_gen_acceso
boolean visible = true
integer y = 156
integer width = 265
integer height = 2084
boolean enabled = false
string dataobject = "d_arch_gen_acceso_det"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
end type

event dw_list::constructor;
This.BringToTop = False
end event

