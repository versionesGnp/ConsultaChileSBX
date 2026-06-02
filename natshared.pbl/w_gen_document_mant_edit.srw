//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Ancestra de Edición de registro por tabla/mantenedor y catálogo.~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_gen_document_mant_edit from w_gen_document
end type
end forward

global type w_gen_document_mant_edit from w_gen_document
boolean ib_fulledit = true
event postopen ( )
end type
global w_gen_document_mant_edit w_gen_document_mant_edit

type variables
String	is_rpt

Boolean	ib_close, ib_multi, ib_continue = False, ib_public = False, ib_share = False, ib_sharealways = False
Boolean  ib_retxemp = False, ib_retxpai = False
Boolean  ib_updateStd = True 
/* Instancias para compartir registros de una tabla */
String	is_col, is_cod, is_shr, is_colpub
Any		ia_dat
s_parm	istr_share
end variables

forward prototypes
public function long wf_print ()
public function boolean wf_checkactioni ()
public function boolean wf_checkactionm ()
public function boolean wf_checkactionr ()
public function boolean wf_gencod (boolean ab_valida)
public function boolean wf_checkactione ()
public function boolean wf_checkaction ()
public function boolean wf_postopen ()
public function integer wf_postupdate ()
public function long wf_retrievelist ()
public function long wf_scroll (string as_scroll)
public function boolean wf_validareg ()
public function integer wf_aceptar ()
public subroutine wf_menu (string as_obj)
public function boolean wf_save ()
public function integer wf_new ()
public function boolean wf_allowedit ()
public function boolean wf_share ()
public function boolean wf_saveandshare ()
public function boolean wf_reloadrecord (string as_arg1, string as_arg2, string as_arg3, string as_arg4, string as_arg5)
public function boolean wf_espublico (datawindow adw_1, long al_row, ref string as_col)
public function boolean wf_precheckaction ()
public function integer wf_update ()
end prototypes

event postopen();String	ls_title, ls_shr, ls_alw 

		
is_pai = f_GenPais( gs_emp )
This.Show( )
dw_1.SetRedraw( False )

Choose Case istr_parm.s_cad[1] 
	Case 'I' /* Inserta */
		dw_1.InsertRow( 0 )
		ls_title = 'Adicionar'
		//cbx_multiple.Visible = True
		
	Case 'M' /* Modifica */
		ls_title = 'Modificar'
		
	Case 'E' /* Elimina */
		dw_1.Enabled = False
		ls_title = 'Eliminar'
		
	Case 'R' /* Recupera */
		dw_1.Enabled = False
		ls_title = 'Recuperar'
		
	Case 'A' /* Autorizar */
		dw_1.Enabled = False
		ls_title = 'Autorizar'
		
	Case Else
		MessageBox( Title, 'Valor del parámetro desconocido.', StopSign!)
		Close( This )
		Return
End Choose

If Not istr_parm.s_cad[ 1] = 'I' Then 
	If ib_retxemp Then
		dw_1.Retrieve( gs_emp, istr_parm.s_cad[ 2] )
	ElseIf ib_retxpai Then
		dw_1.Retrieve( is_pai, istr_parm.s_cad[ 2] )
	Else
		dw_1.Retrieve( istr_parm.s_cad[ 2] )
	End If
End If


Title = Title + ' ' + ls_title

dw_1.Modify( 'st_title.Text = "' + Title + '"')


dw_1.Object.DataWindow.Header.Color = f_Gen_Color( 'titwin' )
dw_1.Object.st_title.Color = f_Gen_Color( 'b' )
dw_1.Object.st_title.font.face='Verdana'
dw_1.Object.st_title.font.height='-14'
dw_1.Object.st_title.font.weight='400'
dw_1.Object.st_title.x="151" 
dw_1.Object.st_title.y="36"

dw_1.SetRedraw( True )

/* Si no se indicó manualmente el nombre de la tabla que se actualiza, la clase debe obtenerlo */
If is_tab = '' Then	
	is_tab = dw_1.Describe( 'DataWindow.Table.UpdateTable' )
End If

/* Activar o no la opción de compartir */
Select	c_compartir_mod
Into		:ls_shr
From		genblmodulotabla
Where		c_codigo_emp = :gs_emp
And		v_tabla_mod = :is_tab
Using		SqlCa ;

ls_shr = f_Trim( ls_shr ) 

ib_share = ( ls_shr = '1' )

If ib_share Then
	Select	c_compartirsiempre_mod
	Into		:ls_alw
	From		genblmodulotabla
	Where		c_codigo_emp = :gs_emp
	And		v_tabla_mod = :is_tab
	Using		SqlCa ;
	
	ls_alw = f_Trim( ls_alw ) 
	
	ib_sharealways = ( ls_alw = '1' )

End If

If dw_1.RowCount() = 0 Then
	MessageBox( Title, 'No se pudo recuperar o crear el registro.', Exclamation!)
	Close( This )
	Return
End If

wf_EsPublico( dw_1, dw_1.GetRow( ), is_colpub )

wf_PreCheckAction( ) 

wf_CheckAction( )


Return
end event

public function long wf_print ();DataWindow	ldw_1
Long		ll_rows
String	ls_obj


ls_obj = is_rpt

If is_rpt = '' Then
	ls_obj = dw_1.DataObject
	
	ldw_1 = f_PrintPreview( ls_obj, Title )
	If istr_parm.s_cad[ 1] = 'I' Then 
		dw_1.RowsCopy( 1, dw_1.RowCount( ), Primary!, ldw_1, 1, Primary!)
	Else
		If ib_retxemp Then
			ldw_1.Retrieve( gs_emp, istr_parm.s_cad[ 2] )
		ElseIf ib_retxpai Then
			ldw_1.Retrieve( is_pai, istr_parm.s_cad[ 2] )
		Else
			ldw_1.Retrieve( istr_parm.s_cad[ 2] )
		End If
	End If
Else
	ldw_1 = f_PrintPreview( ls_obj, Title )
	ldw_1.Retrieve( )
End If

Return ll_rows
end function

public function boolean wf_checkactioni ();

wf_GenCod( False )
dw_1.SetColumn( 'v_nombre' )

Return True
end function

public function boolean wf_checkactionm ();Return True
end function

public function boolean wf_checkactionr ();Return True
end function

public function boolean wf_gencod (boolean ab_valida);Return True
end function

public function boolean wf_checkactione ();Return True
end function

public function boolean wf_checkaction ();/* wf_CheckAction( ) */
Boolean lb_ret, lb_edit
Boolean	lb_pub = False
String	ls_title, ls_shr, ls_col


dw_menu.Object.cb_share.Visible = ib_share	 
dw_menu.Object.cb_delete.Visible = False	 
dw_menu.Object.cb_save.Expression = "'Guardar'"
dw_menu.Object.cb_save.tooltip.tip= 'Guarda la información actual'

/* Si se permite compartir, se puede activar también checkbox de hacer público si existe la columna */
wf_EsPublico( dw_1, dw_1.GetRow( ), ls_col )
ib_cbshare = False
is_shr = ''

Choose Case istr_parm.s_cad[1] 
	Case 'I' /* Inserta */
		f_DWEnabled( dw_1, True )
		lb_ret = wf_CheckActionI( )
		ib_cbsave = True
		ib_cbdelete = True
		
		If Not ls_col = '' And lb_ret Then
			f_ColEnabled( dw_1, ls_col, ib_share )
		End If
		ib_cbshare = ib_share
		
	Case 'M' /* Modifica */
		lb_edit = wf_AllowEdit( ) 
		If lb_edit Then
			f_DWEnabled( dw_1, True )
		End If
		lb_ret = wf_CheckActionM( )
		If Not lb_edit Then f_DWEnabled( dw_1, False )
		ib_cbsave = lb_edit
		ib_cbdelete = lb_edit
		
		If Not ls_col = ''  Then
			If lb_edit Then
				f_ColEnabled( dw_1, ls_col, ib_share )
				ib_cbshare = ib_share
			Else
				f_ColEnabled( dw_1, ls_col, False )
			End If
		End If
		
	Case 'E' /* Elimina */
		lb_edit = wf_AllowEdit( ) 
		f_DWEnabled( dw_1, False )
		lb_ret = wf_CheckActionE( )
		ib_cbsave = False
		ib_cbdelete = lb_edit
		dw_menu.Object.cb_delete.Visible = ib_cbdelete	 
		
	Case 'R' /* Recupera */
		lb_edit = wf_AllowEdit( ) 
		f_DWEnabled( dw_1, False )
		lb_ret = wf_CheckActionR( )
		ib_cbsave = lb_edit
		ib_cbdelete = lb_edit
		dw_menu.Object.cb_save.Expression = "'Recuperar'"
		dw_menu.Object.cb_save.tooltip.tip= 'Recupera (Reactiva) el Registro Actual'
		
	Case 'A' /* Autorizar */
		//lb_ret = wf_CheckActionA( )
End Choose

dw_menu.TriggerEvent( Constructor! )
dw_1.SetFocus( )

If lb_ret Then
	lb_ret = wf_PostOpen( )
End If

Return lb_ret
end function

public function boolean wf_postopen ();Return True
end function

public function integer wf_postupdate ();/* wf_PostUpdate( ) */

Return 1
end function

public function long wf_retrievelist ();w_gen_document_mant	lw_win 

If UpperBound( istr_parm.dw_dat[ ] ) > 0 Then
	
	If IsValid( istr_parm.w_win[ 1] ) Then
		lw_win = istr_parm.w_win[ 1]
		
		Return lw_win.wf_Retrieve( )
	End If
	
	If IsValid( istr_parm.dw_dat[ 1] ) Then
		Return istr_parm.dw_dat[ 1].Retrieve( )
	End If
End If

Return 0



end function

public function long wf_scroll (string as_scroll);Long		ll_find, ll_row
String	ls_tit, ls_cod, ls_find


If istr_parm.dw_dat[1].RowCount( ) = 0 Then
	MessageBox( title, 'La tabla de búsqueda se encuentra vacía actualmente.', Exclamation! )
	Return 0
End If

ll_row = dw_1.GetRow( )
ls_cod = f_Trim( dw_1.Object.c_codigo[ll_row] )
ls_find = 'c_codigo = "' + ls_cod + '"'
ll_find = istr_parm.dw_dat[1].Find( ls_find, 1, istr_parm.dw_dat[1].RowCount( ) )

If as_scroll = 'ADELANTE' Or as_scroll = 'NEXT' Then
	If ll_find < istr_parm.dw_dat[1].RowCount( ) Then
		ll_find = ll_find + 1
	Else
		MessageBox( title, 'Se ha llegado al final de la tabla de búsqueda.', Exclamation! )
		Return 0
	End If
Else
	If ll_find > 1 Then
		ll_find = ll_find - 1
	Else
		MessageBox( title, 'Se ha llegado al inicio de la tabla de búsqueda.', Exclamation! )
		Return 0
	End If
End If


ls_cod = istr_parm.dw_dat[1].GetItemString( ll_find, 'c_codigo' )

istr_parm.s_cad[2] = ls_cod
istr_parm.dw_dat[1].ScrollToRow( ll_find )
If istr_parm.s_cad[1] = 'I' Or istr_parm.s_cad[1] = 'R' Then
	istr_parm.s_cad[1] = 'M' /* Modifica */
End If

istr_parm.s_cad[1] = 'M' /* Modifica */

dw_1.Retrieve( ls_cod )
//f_ColEnabled( dw_1, 'codigo', False )
ls_tit = 'Modificar'

dw_1.Modify( 'st_title.Text = "' + Title + '"')

wf_CheckAction( )
Return 1
end function

public function boolean wf_validareg ();Return True
end function

public function integer wf_aceptar ();Boolean	lb_shared = False, lb_sharedE = False
Long		ll_row, ll_find
String	ls_msg, ls_cod, ls_find, ls_msgbox, ls_col

ll_row = dw_1.GetRow( )
If ll_row = 0 Then ll_row = dw_1.RowCount( )

dw_1.AcceptText( )

ls_cod = dw_1.Object.c_codigo[ll_row]

If istr_parm.s_cad[1] = 'I' Or istr_parm.s_cad[1] = 'M' Then
	If KeyDown( KeyEnter! ) Then
		/*If Not wf_ValKeyEnter( ) Then
			dw_1.SetFocus( )
			Return 0
		End If*/
	End If
End If

dw_1.SetFocus( )
If Not wf_ValidaReg( ) Then
	Return 0
End If

If ib_UpdateSTD Then
	If istr_parm.s_cad[1] = 'I' Then
		dw_1.Object.c_codigo_usu[ll_row] = gs_usuario
		dw_1.Object.d_creacion[ll_row] = DateTime(Today( ))
		dw_1.Object.c_activo[ll_row] = '1'
	Else
		dw_1.Object.c_usumod[ll_row] = gs_usuario
		dw_1.Object.d_modifi[ll_row] = DateTime(Today( ))
		If istr_parm.s_cad[1] = 'E' Then
			dw_1.Object.c_activo[ll_row] = '0'
		ElseIf istr_parm.s_cad[1] = 'R' Then
			dw_1.Object.c_activo[ll_row] = '1'
		End If	
	End If	
End If	

dw_1.AcceptText( )

If ib_sharealways And Not is_shr = 'OK' Then
	If istr_parm.s_cad[ 1] = 'I' Or istr_parm.s_cad[ 1] = 'M' Then
		If wf_EsPublico( dw_1, dw_1.GetRow( ), ls_col ) Then
			lb_shared = True
		Else
			lb_shared = wf_Share( ) 
		End If
		
		If Not lb_shared Then 
			Return 0
		End If
	End If
End If
	

//If dw_1.Update( ) = 1 Then Original
If wf_Update( ) = 1 Then // Ver 2022
	Choose Case istr_parm.s_cad[ 1]
		Case 'A' 
			ls_msg = 'autorizado'
		Case 'I'
			ls_msg = 'insertado'
		Case 'M'
			ls_msg = 'modificado'
		Case 'E'
			ls_msg = 'eliminado'
		Case 'R'
			ls_msg = 'recuperado'
	End Choose
	
	If Not is_tab = '' And Not is_col = '' Then
	 	lb_sharedE = ( istr_parm.s_cad[ 1] = 'E' )//Or istr_parm.s_cad[ 1] = 'E'
	End If
	/* Si est'a configurado para compartir o bien se asign'o manulmente para compartir */
	//If ib_share Or is_shr = 'OK' Or lb_sharedE Then
		lb_shared = wf_SaveAndShare( ) 
		If Not lb_shared Then 
			RollBack Using SqlCa ;
			MessageBox( Title, 'wf_SaveAndShare: El registro no ha sido guardado.', StopSign! )
		End If
	//Else
	//	lb_shared = True
	//End If
	
	If lb_shared Then
		If wf_PostUpdate( ) = 1 Then
			Commit Using SqlCa ;
			//wf_Print( )
			If wf_RetrieveList( ) > 0 Then
				ls_cod = dw_1.Object.c_codigo[ll_row]
				ls_find = 'c_codigo = "' + ls_cod + '"'
				ll_find = istr_parm.dw_dat[1].Find( ls_find, 1, istr_parm.dw_dat[1].RowCount( ) )
				istr_parm.dw_dat[1].ScrollToRow( ll_find )
			End If
			
			ls_msgbox = 'El registro ha sido ' + ls_msg + '.' 
			/*If cbx_multiple.Checked Then
				gw_frame.SetMicroHelp( ls_msgbox )
			Else
				MessageBox( Title, ls_msgbox )
			End If*/
		Else
			RollBack Using SqlCa ;
			MessageBox( Title, 'wf_PostUpdate: El registro no ha sido guardado.', StopSign! )
		End If
	End If
Else
	RollBack Using SqlCa ;
	MessageBox( Title, 'El registro no ha sido guardado.', StopSign! )
End If

If istr_parm.s_cad[ 1] = 'I' Then
	If ib_continue Then
		istr_parm.s_cad[ 1] = 'M'
		istr_parm.s_cad[ 2] = ls_cod
		ib_close = False
		ib_continue = False
		wf_CheckAction( )
	Else
		dw_1.Reset( )
		dw_1.SetTransObject( SqlCa )
		dw_1.InsertRow(0)
		istr_parm.s_cad[ 1] = 'I'
		istr_parm.s_cad[ 2] = ''
		istr_parm.n_num[ 1] = 1
		
		wf_CheckAction( )
		ib_close = False
		dw_1.SetFocus( )
		ib_multi = True
	End If
Else
	ib_multi = False
	ib_close = True
End If

If ib_close Then
	If Not ib_continue Then
		If gw_frame.GetActiveSheet( ) = This Then
			Close( This )
		Else
			CloseWithReturn( This, ls_cod )
			Return 1
		End If
	End If
Else
	ib_close = True
End If

Return 1

end function

public subroutine wf_menu (string as_obj);

Choose Case as_obj
		
	Case 'cb_add'
		istr_parm.s_cad[ 1] = 'I'
		//cbx_multiple.Visible = True
		dw_1.Reset( )
		dw_1.InsertRow( 0 )
		wf_CheckAction( )
		
	Case 'cb_save'
		If ib_cbsave Then wf_Aceptar( )
		
	Case 'cb_delete'
		If ib_cbdelete Then wf_Aceptar( )
		
	Case 'cb_print'
		wf_Print( )
		
	Case 'cb_share'
		If Not ib_cbshare Then Return
		wf_Share( )
		
	Case 'cb_return'
		Close( This )
		
End Choose
end subroutine

public function boolean wf_save ();
Return ( wf_Aceptar( ) = 1 )
end function

public function integer wf_new ();
		istr_parm.s_cad[ 1] = 'I'
		//cbx_multiple.Visible = True
		dw_1.Reset( )
		dw_1.InsertRow( 0 )
		wf_CheckAction( )
		
		Return 1
end function

public function boolean wf_allowedit ();
/* wf_AllowEdit */
Integer	li_cols, i, li_opc 
String	ls_col, ls_emp, ls_cod, ls_ok, ls_nom, ls_tab, &
			ls_adm, ls_allow = '1' 


If Not dw_1.GetRow( ) > 0 Then Return False


li_cols = Integer( dw_1.Object.Datawindow.Column.Count )

For i = 1 To li_cols 
	ls_col = dw_1.Describe( '#' + String( i ) + '.name' ) 
	
	Choose Case ls_col
		Case 'c_editable'
			ls_allow = dw_1.Object.c_editable[ dw_1.GetRow( )]
			
		Case 'c_codori_emp'
			ls_emp = dw_1.Object.c_codori_emp[ dw_1.GetRow( )]
			If Not ls_emp = gs_emp Then ls_allow = '0' 
			
	End Choose

Next

// wf_AllowEdit
If ls_allow = '1' Then
	Return True
End If

/* Si el registro es público, se debe verificar si es editable por su creador o administrador */
Select	IsNull( c_admin_usu, '0' ) 
Into		:ls_adm
From		genlogin
Where		c_codigo_usu = :gs_usuario 
Using		SqlCa ;

ls_adm = f_Trim( ls_adm )

If Not ls_adm = '1' Then Return False

li_opc = MessageBox( Title, 'La informaciòn que desea editar no es propietaria;' + Char(13) + &
							'Para poder editar, deberá acceder al registro original.' + Char(13) + &
							'¿Confirma abrir el registro original?', Question!, YesNo! )


If Not li_opc = 1 Then Return False

ls_cod = f_Trim( dw_1.Object.c_codigo[ dw_1.GetRow( )] )
If wf_ReloadRecord( ls_emp, ls_cod, '', '', '' ) Then
	Return True
End If

Return False


end function

public function boolean wf_share ();
/* wf_Share( ) */
s_parm	lstr_share
Any		la_dat
String	ls_emp, ls_tab, ls_col, ls_cod, ls_usu, ls_wks, ls_pub = '0', ls_xcol


dw_1.AcceptText( )

If is_emp = '' Then
	ls_emp = f_Trim( dw_1.Object.c_codigo_emp[ dw_1.GetRow( )] )
Else
	ls_emp = is_emp
End If

/* Si no se indicó manualmente el nombre de la tabla que se actualiza, la clase debe obtenerlo */
If is_tab = '' Then	
	is_tab = dw_1.Describe( 'DataWindow.Table.UpdateTable' )
End If

is_tab = Lower( is_tab )

/* Si no se obtuvo de ningún modo el nombre de la tabla, entonces debe alertarse */
If is_tab = '' And ib_share Then	
	MessageBox( Title, 'No se ha definido la tabla fuente para compartir datos.' + Char(13) + &
							'Contacte con el personal de Informática.')
	Return False
End If

ls_tab = is_tab //'comproveedoremp'
ls_col = is_col //'c_codigo_prv'
If is_cod = '' Then
	ls_cod = f_Trim( dw_1.Object.c_codigo[ dw_1.GetRow( )] )
Else
	ls_cod = is_cod
End If

ls_usu = gs_usuario
ls_wks = f_GetPCName( )

//dwcontrol.Object.Data
If is_shr = 'OK' Then
	la_dat = ia_dat 
End If

If wf_EsPublico( dw_1, dw_1.GetRow( ), ls_xcol ) Then ls_pub = '1'
lstr_share = f_GenShared( ls_emp, ls_tab, ls_col, ls_cod, ls_usu, ls_wks, is_shr, ls_pub, la_dat )

If IsValid( lstr_share ) Then
	istr_share = lstr_share
	is_shr = lstr_share.s_cad[ 7]
	la_dat = lstr_share.a_any[ 1]
	If is_shr = 'OK' Then
		ia_dat = la_dat 
	End If
Else
	//istr_share = lstr_share
End If

Return True
end function

public function boolean wf_saveandshare ();
/* wf_SaveAndShare( ) */
// Autor: César Vilela R.

Any			la_shr
DataStore	lds_share
Long			i
String		ls_shr, ls_ori, ls_emp, ls_cod, ls_atv, ls_sql, ls_exe, &
				ls_usp, ls_wks, ls_usu, ls_pub, ls_xcol


dw_1.AcceptText( )

If is_tab = '' Then	
	is_tab = dw_1.Describe( 'DataWindow.Table.UpdateTable' )
End If

If is_tab = '' Or Not ib_share Then	
	Return True
End If

/* Se debe verificar si se puede o no compartir la tabla de forma automática */

/* Si registro es público, entonces ATV (activo) debe ser siempre según el registro master */
If wf_EsPublico( dw_1, dw_1.GetRow( ), ls_xcol ) Then ls_pub = '1'

/* Si se está creando un nuevo registro y no se comparte */
If istr_parm.s_cad[ 1] = 'I' And Not is_shr = 'OK' Then
	If Not ls_pub = '1' Then Return True
End If

/* Datos básicos para compartir */
ls_emp = f_Trim( dw_1.Object.c_codigo_emp[ dw_1.GetRow()] )
ls_cod = f_Trim( dw_1.Object.c_codigo[ dw_1.GetRow()] )
ls_usp = 'usp_gen_bltabla_compartida_upd'
ls_wks = f_GetPCName( )
ls_usu = gs_usuario

Destroy lds_share

/*Se crea DS y se transfiere la informaci'on contenidos en datos ANY */
lds_share = Create DataStore
lds_share.DataObject = 'd_mant_gen_tabla_compartida_det'
lds_share.SetTransObject( SqlCa )

If Not istr_parm.s_cad[ 1] = 'I' Then
	ls_ori = f_Trim( dw_1.Object.c_codori_emp[ dw_1.GetRow()] )
Else
	ls_ori = gs_emp
End If

If ( istr_parm.s_cad[ 1] = 'E' Or istr_parm.s_cad[ 1] = 'R' ) Or ( ls_pub = '1' ) Or &
	( istr_parm.s_cad[ 1] = 'M' And Not is_shr = 'OK' ) Then
	lds_share.Retrieve( ls_emp, is_tab, is_col, ls_cod, ls_usu, ls_wks )
Else
	la_shr = ia_dat
	If Not IsNull( la_shr ) Then //And IsValid( la_shr ) 
		lds_share.Object.Data = la_shr 
	End If
End If

For i = 1 To lds_share.RowCount( )
	ls_emp = f_Trim( lds_share.Object.c_codigo_emp[ i] )
	ls_atv = f_Trim( lds_share.Object.c_activo[ i] )
	
	/* Cuando sea eliminar siempre quedará todo inactivo */
	If istr_parm.s_cad[ 1] = 'E' Then ls_atv = '0'
	If istr_parm.s_cad[ 1] = 'R' Then ls_atv = '1'
	
	If ( ls_pub = '1' ) Then
		ls_atv = f_Trim( dw_1.Object.c_activo[ dw_1.GetRow( )] )
	End If
	
	ls_sql = 'Execute ' + ls_usp + ' '
	ls_exe = ls_sql + '@as_ori = "' + ls_ori + '", ' + &
						 + '@as_emp = "' + ls_emp + '", ' + &
						'@as_tab = "' + is_tab + '", @as_col = "' + is_col + '", ' + &
						'@as_cod = "' + ls_cod + '", ' + &
						'@as_wks = "' + ls_wks + '", ' + &
						'@as_usu = "' + ls_usu + '", ' + &  
						'@as_atv = "' + ls_atv + '" ' 
	
	Execute Immediate :ls_exe Using SqlCa ;
		
	If f_SqlError (SqlCa, 'Error al ejecutar el "Execute ' + ls_usp + '".') = - 1 Then
		RollBack Using SqlCa ;
		Destroy lds_share
		f_GenProcesando( '' )
		SetPointer( Arrow! )
		Return False
	End If
Next
//Commit Using SqlCa ;

Destroy lds_share

Return True
end function

public function boolean wf_reloadrecord (string as_arg1, string as_arg2, string as_arg3, string as_arg4, string as_arg5);/* wf_ReloadRecord( as_arg1, as_arg2, as_arg3, as_arg4, as_arg5 )*/
	
If ib_retxemp Then
	dw_1.Retrieve( as_arg1, as_arg2 )
Else
	dw_1.Retrieve( as_arg2 )
End If


If dw_1.RowCount() = 0 Then
	MessageBox( Title, 'No se pudo recuperar el registro.', Exclamation!)
	Return False
End If

Return True

end function

public function boolean wf_espublico (datawindow adw_1, long al_row, ref string as_col);

/* wf_EsPublico( dw_1, al_row, Ref as_col ) */

Integer		li_cols, i
String		ls_pub, ls_col, ls_xcol


li_cols = Integer( adw_1.Object.Datawindow.Column.Count )

For i = 1 To li_cols 
	ls_col = adw_1.Describe( '#' + String( i ) + '.name' ) 
	ls_xcol = Left( ls_col, 9 )
	
	Choose Case ls_xcol
			   
		Case 'c_publico' /* Se toma este dato si existe la columna */
			ls_pub = f_Trim( adw_1.GetItemString( al_row, ls_col ) )
			as_col = ls_col
			Exit
	End Choose

Next


Return ( ls_pub = '1' )

end function

public function boolean wf_precheckaction ();/* wf_PreCheckAction( ) */

Return True
end function

public function integer wf_update ();
Int	li_ret

// Si el valor li_ret = 1 Entonces guardó correctamente
If Not ib_UpdateByProc Then
	li_ret = dw_1.Update( )
End If

Return li_ret
end function

on w_gen_document_mant_edit.create
call super::create
end on

on w_gen_document_mant_edit.destroy
call super::destroy
end on

event open;call super::open;String	ls_title, ls_shr, ls_alw 

		
istr_parm = Message.PowerObjectParm
PostEvent( 'PostOpen')

Return

is_pai = f_GenPais( gs_emp )
This.Show( )

Choose Case istr_parm.s_cad[1] 
	Case 'I' /* Inserta */
		dw_1.InsertRow( 0 )
		ls_title = 'Adicionar'
		//cbx_multiple.Visible = True
		
	Case 'M' /* Modifica */
		ls_title = 'Modificar'
		
	Case 'E' /* Elimina */
		dw_1.Enabled = False
		ls_title = 'Eliminar'
		
	Case 'R' /* Recupera */
		dw_1.Enabled = False
		ls_title = 'Recuperar'
		
	Case 'A' /* Autorizar */
		dw_1.Enabled = False
		ls_title = 'Autorizar'
		
	Case Else
		MessageBox( Title, 'Valor del parámetro desconocido.', StopSign!)
		Close( This )
		Return
End Choose

dw_1.SetRedraw( False )
If Not istr_parm.s_cad[ 1] = 'I' Then 
	If ib_retxemp Then
		dw_1.Retrieve( gs_emp, istr_parm.s_cad[ 2] )
	ElseIf ib_retxpai Then
		dw_1.Retrieve( is_pai, istr_parm.s_cad[ 2] )
	Else
		dw_1.Retrieve( istr_parm.s_cad[ 2] )
	End If
End If
dw_1.SetRedraw( True )


Title = Title + ' ' + ls_title

dw_1.Modify( 'st_title.Text = "' + Title + '"')


dw_1.Object.DataWindow.Header.Color = f_Gen_Color( 'titwin' )
dw_1.Object.st_title.Color = f_Gen_Color( 'b' )
dw_1.Object.st_title.font.face='Verdana'
dw_1.Object.st_title.font.height='-14'
dw_1.Object.st_title.font.weight='400'
dw_1.Object.st_title.x="151" 
dw_1.Object.st_title.y="36"


/* Si no se indicó manualmente el nombre de la tabla que se actualiza, la clase debe obtenerlo */
If is_tab = '' Then	
	is_tab = dw_1.Describe( 'DataWindow.Table.UpdateTable' )
End If

/* Activar o no la opción de compartir */
Select	c_compartir_mod
Into		:ls_shr
From		genblmodulotabla
Where		c_codigo_emp = :gs_emp
And		v_tabla_mod = :is_tab
Using		SqlCa ;

ls_shr = f_Trim( ls_shr ) 

ib_share = ( ls_shr = '1' )

If ib_share Then
	Select	c_compartirsiempre_mod
	Into		:ls_alw
	From		genblmodulotabla
	Where		c_codigo_emp = :gs_emp
	And		v_tabla_mod = :is_tab
	Using		SqlCa ;
	
	ls_alw = f_Trim( ls_alw ) 
	
	ib_sharealways = ( ls_alw = '1' )

End If

If dw_1.RowCount() = 0 Then
	MessageBox( Title, 'No se pudo recuperar o crear el registro.', Exclamation!)
	Close( This )
	Return
End If

wf_EsPublico( dw_1, dw_1.GetRow( ), is_colpub )

wf_PreCheckAction( ) 

wf_CheckAction( )

end event

type dw_1 from w_gen_document`dw_1 within w_gen_document_mant_edit
event key pbm_dwnkey
event processenter pbm_dwnprocessenter
integer width = 3159
end type

event dw_1::key;
If KeyDown( KeyF5! ) Or &
	( KeyDown( KeyControl! ) And ( KeyDown( Asc('G') ) Or KeyDown( Asc('g') ) ) ) Then 
	wf_Aceptar( )
End If


end event

event dw_1::processenter;
Send(Handle(this),256,9,Long(0,0))

end event

event dw_1::constructor;call super::constructor;String ls_c1, ls_c2, ls_fmt


If Dataobject = '' Then Return

SetTransObject( SqlCa )

f_SetDWColor( This )

This.Object.DataWindow.ShowBackColorOnXP = 'yes'


end event

event dw_1::retrieveend;call super::retrieveend;// No hacer nada

end event

event dw_1::buttonclicked;call super::buttonclicked;

If dwo.Name = 'cb_save' Then
	wf_Aceptar( )
End If
end event

event dw_1::itemchanged;call super::itemchanged;

Choose Case dwo.Name
	Case is_colpub
		data = f_Trim( data )
		If data = '1' Then Return
		is_shr = 'NOT'
End Choose
end event

type dw_menu from w_gen_document`dw_menu within w_gen_document_mant_edit
string dataobject = "d_gen_menu_toolbar_mant_edit"
end type

event dw_menu::clicked;call super::clicked;wf_Menu( dwo.Name )
end event

