//objectcomments Autor: César Vilela~r~nFunción: Actualiza URL asignada a WKS~r~nRecomendación: Nivel Experto
forward
global type w_arch_ecli_configura_wks_url from wa_response
end type
end forward

global type w_arch_ecli_configura_wks_url from wa_response
integer width = 3058
integer height = 1432
string title = "URL POS Service"
boolean controlmenu = false
windowanimationstyle openanimation = centeranimation!
boolean ib_posy = true
boolean ib_ind = true
end type
global w_arch_ecli_configura_wks_url w_arch_ecli_configura_wks_url

type variables

DataWindow	idw_wks
DateTime	id_ser
String	is_wks
end variables

on w_arch_ecli_configura_wks_url.create
call super::create
end on

on w_arch_ecli_configura_wks_url.destroy
call super::destroy
end on

event open;call super::open;
Long			ll_row

istr_parm = Message.PowerObjectParm

dw_1.Event SetObjectColor( 'c_codigo_wks', 'o' )
dw_1.Event SetObjectColor( 'n_possecuencia_wks', 'o' )
dw_1.Event SetObjectColor( 'c_prefijopalet_wks', 'ba' )

f_ColEnabled( dw_1, 'n_possecuencia_wks', False )  
dw_1.InsertRow(0)

idw_wks = istr_parm.dw_dat[ 1]
ll_row = idw_wks.GetRow( )

dw_1.Object.c_codigo_wks[ 1]			= idw_wks.Object.c_codigo_wks[ ll_row]
dw_1.Object.c_prefijopalet_wks[ 1]	= idw_wks.Object.c_prefijopalet_wks[ ll_row]
dw_1.Object.v_urlservice_wks[ 1]		= idw_wks.Object.v_urlservice_wks[ ll_row]
dw_1.Object.v_urlheader_wks[ 1]		= idw_wks.Object.v_urlheader_wks[ ll_row]
dw_1.Object.v_urlvalue_wks[ 1]		= idw_wks.Object.v_urlvalue_wks[ ll_row]
dw_1.Object.n_timeoutseconds_wks[ 1]= idw_wks.Object.n_timeoutseconds_wks[ ll_row]
dw_1.Object.n_possecuencia_wks[ 1]	= idw_wks.Object.n_possecuencia_wks[ ll_row]
		
dw_1.AcceptText( )
dw_1.SetColumn( 'v_urlservice_wks' )
dw_1.SetFocus( )
end event

type dw_list from wa_response`dw_list within w_arch_ecli_configura_wks_url
event ue_checkall ( )
boolean visible = false
integer x = 946
integer y = 1224
integer width = 242
integer height = 104
integer taborder = 10
boolean enabled = false
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
integer ii_detheight = 90
integer ii_posdety = 15
end type

type dw_1 from wa_response`dw_1 within w_arch_ecli_configura_wks_url
integer width = 3127
integer height = 1188
integer taborder = 0
string dataobject = "d_arch_ecli_configura_wks_url"
end type

event dw_1::doubleclicked;call super::doubleclicked;

Choose Case dwo.Name
	Case 'n_possecuencia_wks'
		f_ColEnabled( dw_1, 'n_possecuencia_wks', True )  
		
End Choose

end event

type cb_cancelar from wa_response`cb_cancelar within w_arch_ecli_configura_wks_url
integer x = 2597
integer y = 1224
end type

event cb_cancelar::clicked;
s_parm		lstr_parm


lstr_parm.s_cad[ 1] = '|@'

CloseWithReturn( Parent, lstr_parm )

end event

type cb_aceptar from wa_response`cb_aceptar within w_arch_ecli_configura_wks_url
integer x = 2217
integer y = 1224
boolean enabled = true
boolean default = false
end type

event cb_aceptar::clicked;
s_parm	lstr_parm
Long		ll_row
String	ls_url, ls_msg, ls_col


dw_1.AcceptText( )

ls_url = f_Trim( dw_1.Object.v_urlservice_wks[ 1] )

If ls_url = '' And ls_msg = '' Then
	ls_msg = 'URL POS Service quedará vacía.' + Char(13) + '¿Confirma Continuar?'
	ls_col = 'v_urlservice_wks'
End If

If Not ls_msg = '' Then
	If Not blEclipse.MessageBox( Title, ls_msg, Question!, YesNo! ) = 1 Then
		dw_1.SetColumn( ls_col )
		dw_1.SetFocus( )
	End If
End If


lstr_parm.s_cad[ 1] = ls_url
ll_row = idw_wks.GetRow( )

idw_wks.Object.c_codigo_wks[ ll_row]			= dw_1.Object.c_codigo_wks[ 1]
idw_wks.Object.c_prefijopalet_wks[ ll_row]	= dw_1.Object.c_prefijopalet_wks[ 1]
idw_wks.Object.v_urlservice_wks[ ll_row]		= dw_1.Object.v_urlservice_wks[ 1]
idw_wks.Object.v_urlheader_wks[ ll_row]		= dw_1.Object.v_urlheader_wks[ 1]
idw_wks.Object.v_urlvalue_wks[ ll_row]			= dw_1.Object.v_urlvalue_wks[ 1]
idw_wks.Object.n_timeoutseconds_wks[ ll_row]= dw_1.Object.n_timeoutseconds_wks[ 1]
idw_wks.Object.n_possecuencia_wks[ ll_row]	= dw_1.Object.n_possecuencia_wks[ 1]

idw_wks.Accepttext( )

CloseWithReturn( Parent, lstr_parm )

end event

