//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Página de inicio~r~n    Recomendación: NO MODIFICAR - ~r~n*/
forward
global type w_arch_gen_pagina_inicio from w_gen_document_doc
end type
type sle_opc from singlelineedit within w_arch_gen_pagina_inicio
end type
type dw_opc from uo_dw_list within w_arch_gen_pagina_inicio
end type
type dw_not from uo_dw_list within w_arch_gen_pagina_inicio
end type
end forward

global type w_arch_gen_pagina_inicio from w_gen_document_doc
integer width = 5440
integer height = 1916
string title = "Página de Inicio"
boolean controlmenu = false
boolean minbox = false
boolean center = false
event postopen ( )
sle_opc sle_opc
dw_opc dw_opc
dw_not dw_not
end type
global w_arch_gen_pagina_inicio w_arch_gen_pagina_inicio

type variables

uo_gen_menu	iuo_menu
Boolean	ib_refresh = False
end variables

forward prototypes
public subroutine wf_loginopc ()
public function integer wf_new ()
public function integer wf_menustd (string as_act)
public subroutine wf_filter (string as_filter)
public subroutine wf_menu (string as_obj)
public function integer wf_config ()
public function long wf_notificaciones ()
end prototypes

event postopen();
dw_1.Retrieve( gs_emp, gs_usuario )
dw_opc.SetRedraw( False )
dw_opc.Retrieve( gs_emp, gs_usuario, '0' ) // 0 <- Versión Escritorio
wf_LoginOpc( )
dw_opc.SetRedraw( True )

end event

public subroutine wf_loginopc ();

DataStore	lds_1
Integer	i, j, k, c, li_row, li_grupo
String	ls_col = '2', ls_niv, ls_xniv1, ls_niv1, ls_cod, ls_nom, ls_nn1


Destroy	lds_1
lds_1 = Create DataStore

dw_list.SetRedraw( False )
dw_list.Reset( )

lds_1.DataObject = 'd_arch_gen_pagina_inicio_det_aux'
lds_1.SetTransObject( SqlCa )
lds_1.Retrieve( gs_emp, gs_usuario, 'WKS' )

For c = 1 To 2
	For i = 1 To lds_1.RowCount( )
		
		ls_niv = f_Trim( lds_1.Object.c_nivel[ i] )
		ls_xniv1 = f_Trim( lds_1.Object.c_nivel1_opc[ i] )
		ls_nn1 = f_Trim( lds_1.Object.v_nomniv1_opc[ i] )
		ls_cod = f_Trim( lds_1.Object.c_codigo_opc[ i] )
		ls_nom = lds_1.Object.v_nombre_opc[ i]
		
		If c = 1 Then
			If Not ls_niv1 = ls_xniv1 Then
				ls_niv1 = ls_xniv1 
				If ls_col = '2' Then
					ls_col = '1' 					
					li_grupo ++
					j = dw_list.RowCount( )
					If Not j = 0 Then 
						dw_list.InsertRow( 0 )
						j ++
					End If
					k = j
					j ++
				Else 
					ls_col = '2'
				End If
			Else
				j ++
			End If
		
			If ls_col = '1' Then
				li_row = dw_list.InsertRow( j )
			Else
				Continue
			End If
		End If
		
		If c = 2 Then
			If Not ls_niv1 = ls_xniv1 Then
				ls_niv1 = ls_xniv1 
				If ls_col = '2' Then
					ls_col = '1' 					
				Else 
					ls_col = '2'
					If k > 0 Then
						k ++
					End If
				End If
			End If
		
			If ls_col = '1' Then
				Continue
			Else
				k ++
				If k > dw_list.RowCount( ) Then
					li_row = dw_list.InsertRow( k )
				Else
					li_row = k
				End If
			End If
		End If
		
		dw_list.SetItem( li_row, 'n_grupo' , li_grupo )
		dw_list.SetItem( li_row, 'c_nivel' + ls_col, ls_niv )
		dw_list.SetItem( li_row, 'v_nomniv1_opc' + ls_col, ls_nom )
		dw_list.SetItem( li_row, 'c_codigo_opc' + ls_col, ls_cod )
		dw_list.SetItem( li_row, 'v_nombre_opc' + ls_col, ls_nom )
		
	Next
	ls_niv1 = ''
	ls_col = '2'
	k = 0
Next

Destroy	lds_1
dw_list.SetRedraw( True )

return
end subroutine

public function integer wf_new ();
ib_saved = True

sle_opc.Visible = False
dw_opc.Visible = False

If ib_refresh Then
	dw_opc.Retrieve( gs_emp, gs_usuario, '0' ) // 0 <- Versión Escritorio
	wf_LoginOpc( )
End If

ib_refresh = True

Return 1
end function

public function integer wf_menustd (string as_act);/* wf_MenuStd( as_act ) */

dw_1.Object.c_activo[ 1] = as_act
dw_1.AcceptText( )

Update	genlogin
Set		c_menustd_usu = :as_act
Where		c_codigo_usu = :gs_usuario
Using		SqlCa ;

Commit Using SqlCa ;

MessageBox( Title, 'Para ver los cambios aplicados debe de reinciar el sistema' )

Return 1
end function

public subroutine wf_filter (string as_filter);
/* wf_Filter( as_filter ) */

Long		ll_find, ll_filt, ll_height
String	ls_find


as_filter = f_Trim( lower( as_filter ) )

ls_find = '(( Lower( v_nombre_opc ) Like "%' + as_filter + '%" ) ' 
ls_find = ls_find + ' Or ( Lower( c_codigo_opc ) Like "%' + as_filter + '%" ))' 

// Ejm: (( Lower( v_nombre ) Like "%fon%" ) or ( Lower( c_codigo ) Like "%" ) )

sle_opc.Visible = ( Not as_filter = '' )
dw_opc.Visible = ( Not as_filter = '' )
dw_opc.SelectRow( 0, False )
If Not as_filter = '' Then
	dw_opc.SetFilter( ls_find )
Else
	dw_menu.Object.v_buscar[ 1] = ' '
	dw_opc.SetFilter( '' )
End If

dw_opc.Filter( )
ll_filt = dw_opc.RowCount( )


If ll_filt > 8 Then ll_filt = 8 
ll_height = 115 * ll_filt
sle_opc.Height = ll_height + 5
dw_opc.Height = ll_height
gw_frame.SetMicroHelp( String( dw_opc.GetRow( )) + '/' + String( dw_opc.RowCount( ) ) )

Return

end subroutine

public subroutine wf_menu (string as_obj);/* Debe estar activo el extend */


Choose Case as_obj

	Case 'cb_acceso'
		OpenSheet( w_arch_gen_asignar_acceso_rapido, gw_frame, 1, Original! )
		
	Case 'cb_hlp'
		OpenSheet( w_arch_gen_ayuda, gw_frame, 1, Original! )
		
	Case 'cb_filteroff'
		wf_Filter( '' )
		
	Case 'cb_ref'
		wf_Config( )
		wf_New( )
		
	Case 'cb_return'
		Close( This )
End Choose

end subroutine

public function integer wf_config ();
dw_1.event setobjectcolor( 'v_card1', 'st' )
dw_1.event setobjectcolor( 'v_card2', 'bx' )
dw_1.event setobjectcolor( 'v_card3', 'o' )
dw_1.event setobjectcolor( 'v_card4', 'ba' )



Return 1

Boolean	lb_full = False


ib_saved = True

dw_1.SetRedraw( False )
If lb_full Then
	dw_1.Retrieve( gs_emp, gs_usuario )
Else
dw_1.SetRedraw( True )
	dw_1.insertrow( 0 )
	Return -1
End If



/* CVILELA: 28/Oct/2021 - Funciones Automáticas cambian a Select por Oracle */
DateTime	ld_hoy
Dec		ldc_UF, ldc_USD
Integer	li_ntf
Long	ll_ret

ll_ret = dw_not.Retrieve( gs_emp, gs_usuario )

dw_not.Visible = ( ll_ret > 0 )

ld_hoy = f_ServerDate( ) ;

ldc_UF  = f_GenTipoCambioMda( ld_hoy, 'UF' )
ldc_USD = f_GenTipoCambioMda( ld_hoy, 'USD' )
li_ntf  = f_GenDocsNotify( '', ld_hoy ) 

dw_1.Object.n_uf[ 1] = ldc_UF 
dw_1.Object.n_tipcam[ 1] = ldc_USD
dw_1.Object.n_notify[ 1] = li_ntf
dw_1.AcceptText( )
dw_1.SetRedraw( True )


Return 1
end function

public function long wf_notificaciones ();
Long	ll_ret


ll_ret = dw_not.Retrieve( gs_emp, gs_usuario )

//dw_not.Visible = ( ll_ret > 0 )
dw_1.Object.v_card2[ 1] = '(' + String( ll_ret ) + ') Notificaciones'

Return ll_ret


end function

on w_arch_gen_pagina_inicio.create
int iCurrent
call super::create
this.sle_opc=create sle_opc
this.dw_opc=create dw_opc
this.dw_not=create dw_not
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_opc
this.Control[iCurrent+2]=this.dw_opc
this.Control[iCurrent+3]=this.dw_not
end on

on w_arch_gen_pagina_inicio.destroy
call super::destroy
destroy(this.sle_opc)
destroy(this.dw_opc)
destroy(this.dw_not)
end on

event open;call super::open;String	ls_msg


ls_msg = Message.StringParm

ls_msg = f_Trim( ls_msg )

dw_menu.Object.cb_return.Visible = ( ls_msg = 'TS' )

PostEvent( 'PostOpen' )
end event

event resize;call super::resize;dw_list.height = newheight - (dw_list.y ) - 150
dw_not.height = dw_list.height 
end event

event closequery;ib_saved = True

end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_gen_pagina_inicio
integer width = 5349
integer height = 1180
string dataobject = "d_arch_gen_pagina_inicio"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_ind = false
end type

event dw_1::clicked;call super::clicked;

Choose Case dwo.Name
	Case 'cb_out', 'p_out'
		wf_loginOpc( )
		
	Case 'cb_on'
		wf_MenuStd( '1' )
		
	Case 'cb_off'
		wf_MenuStd( '0' )
		
	Case 'cb_acceso'
		OpenSheet( w_arch_gen_asignar_acceso_rapido, gw_frame, 1, Original! )
		
	Case 'cb_hlp'
		OpenSheet( w_arch_gen_ayuda, gw_frame, 1, Original! )
		
	Case 'cb_ref' 
		wf_New( )
		
End Choose
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_gen_pagina_inicio
event key pbm_dwnkey
integer width = 4055
integer taborder = 30
string dataobject = "d_gen_menu_toolbar_pagina_inicio"
end type

event dw_menu::key;
If Not KeyDown( KeyDownArrow! ) Then Return

If dw_opc.RowCount( ) > 0 Then dw_opc.SetFocus( )
end event

event dw_menu::editchanged;call super::editchanged;Long		ll_find
String	ls_find


data = f_Trim( lower( data ) )

wf_Filter( data )

Return

end event

type dw_list from w_gen_document_doc`dw_list within w_arch_gen_pagina_inicio
boolean visible = true
integer x = 242
integer y = 656
integer width = 3502
integer height = 556
integer taborder = 20
string dataobject = "d_arch_gen_pagina_inicio_det"
boolean border = false
boolean ib_exportxls = false
end type

event dw_list::constructor;call super::constructor;

This.Object.DataWindow.Detail.Color = String( f_Gen_Color( 'blanco' ) )
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;SelectRow( 0, False )
end event

event dw_list::retrieveend;call super::retrieveend;SelectRow( 0, False )
end event

event dw_list::clicked;call super::clicked;String	ls_cod


SelectRow( 0, False )

Choose Case dwo.Name
	Case 'v_xnombre_opc1'
		ls_cod = f_Trim( This.Object.c_codigo_opc1[ row] )
		If ls_cod = '' Then Return
		iuo_menu.of_Exec( ls_cod )
		
	Case 'v_xnombre_opc2'
		ls_cod = f_Trim( This.Object.c_codigo_opc2[ row] )
		If ls_cod = '' Then Return
		iuo_menu.of_Exec( ls_cod )

End Choose
end event

event dw_list::rbuttondown;call super::rbuttondown;String	ls_cod, ls_nom


Choose Case dwo.Name
		
	Case 'v_xnombre_opc1'

		ls_cod = f_Trim( This.Object.c_codigo_opc1[ row] )
		iuo_menu.of_QAccess( ls_cod, False )

		wf_New( )
		
	Case 'v_xnombre_opc2'

		ls_cod = f_Trim( This.Object.c_codigo_opc2[ row] )
		iuo_menu.of_QAccess( ls_cod, False )

		wf_New( )
		
End Choose
end event

type sle_opc from singlelineedit within w_arch_gen_pagina_inicio
integer x = 750
integer y = 120
integer width = 1376
integer height = 864
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type dw_opc from uo_dw_list within w_arch_gen_pagina_inicio
integer x = 750
integer y = 120
integer width = 1367
integer height = 860
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_arch_gen_pagina_inicio_opc"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
borderstyle borderstyle = styleshadowbox!
end type

event constructor;call super::constructor;String	ls_c1, ls_c2


This.Object.DataWindow.Header.Height = 0
This.Object.DataWindow.Detail.Height = 110

ls_c1 = String( f_Gen_Color( 'o' ) )
ls_c2 = String( f_Gen_Color( 'blanco' ) )
This.Object.DataWindow.detail.color = ls_c2 
This.Object.v_nombre_mod.color = ls_c1

end event

event clicked;call super::clicked;
String	ls_cod


If row <= 0 Then Return

ls_cod = f_Trim( This.Object.c_codigo_opc[ row] )
If ls_cod = '' Then Return
iuo_menu.of_Exec( ls_cod )
wf_Filter( '' )
end event

event nkey;call super::nkey;
If Not KeyDown( KeyEnter! ) Then Return

This.Event Clicked ( 0, 0, This.GetRow( ), This.Object.c_codigo_opc )

end event

type dw_not from uo_dw_list within w_arch_gen_pagina_inicio
integer x = 3813
integer y = 656
integer width = 1271
integer height = 860
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_arch_gen_notificacion"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
borderstyle borderstyle = styleshadowbox!
boolean ib_detzebra = false
boolean ib_selectrow = false
end type

event rowfocuschanged;call super::rowfocuschanged;SelectRow( 0, False )
end event

event retrieveend;call super::retrieveend;SelectRow( 0, False )
end event

event clicked;call super::clicked;
If Not dwo.Name = 'i_go' Then Return
This.Event DoubleClicked( xpos, ypos, row, This.Object.c_codigo_ori )

end event

event buttonclicked;call super::buttonclicked;

Choose Case dwo.Name
	Case 'cb_ver'
		wf_Notificaciones( )
		
	Case 'cb_actualizar'
		wf_Notificaciones( )
		
	Case 'cb_notificar', 'cb_noti'
		Open( w_arch_gen_notificar )
		wf_Notificaciones( )
		
End Choose

end event

event doubleclicked;call super::doubleclicked;String	ls_exe

If row <= 0 Then Return

ls_exe = f_Trim( This.Object.c_codigo_ori[ row] )

Open( w_arch_gen_notificacion )

wf_Notificaciones( )

end event

