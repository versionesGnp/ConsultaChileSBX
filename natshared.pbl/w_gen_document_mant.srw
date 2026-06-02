//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Ancestra de Mantenedores/catálogos~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_gen_document_mant from w_gen_document
end type
type st_sincontenido from statictext within w_gen_document_mant
end type
end forward

global type w_gen_document_mant from w_gen_document
boolean ib_fulledit = true
event type boolean ue_recuperar ( )
st_sincontenido st_sincontenido
end type
global w_gen_document_mant w_gen_document_mant

type variables
Boolean	ib_posY = True, ib_share = False, ib_retxemp = False, ib_retxpai = False, &
			ib_retAuto = True

String	is_rpt, is_FnSqlRef, is_setfilter, is_buscar
String	is_arg1, is_arg2, is_arg3, is_arg4, is_arg5

// Para DW que contiene el Listado
Boolean	ib_detzebra = True, ib_selectrow = True, ib_order = True, ib_filter = True, ib_search = False, &
			ib_detselect = False, &
			ib_detHeight = True, ib_exportxls = True
Integer	ii_detheight = 115, ii_HeadHeight = 90
String	is_columna = '', is_order, is_colant = '', is_ordant, is_headercolor = 'm', &
			is_TextBar = 't', & 
			is_colfilter[], is_colfilterS[], &
			is_colSearch[], is_colSearchS[], is_colSExact = '0'
			//* 'textbar', & * /


end variables

forward prototypes
public subroutine wf_activoonoff ()
public function long wf_retrieve ()
public function boolean wf_eliminar ()
public function boolean wf_insertar ()
public function boolean wf_mant ()
public function boolean wf_modificar ()
public function long wf_print ()
public function boolean wf_recuperar ()
public subroutine wf_menu (string as_obj)
public function integer wf_preretrieve ()
public subroutine wf_filter (string as_filter)
public function boolean wf_eliminarpermanente ()
public function integer wf_new ()
public function integer wf_open ()
public subroutine wf_setdwpositiony (datawindow adw_1)
public function boolean wf_verificaintegridad (string as_all)
public function boolean wf_allowedit ()
public function boolean wf_modocompartir (string as_emp, ref string as_tab)
public function string wf_getfilter (string as_emp)
public function boolean wf_eliminarverificar ()
public function boolean wf_printretrieve (datawindow adw_rpt)
end prototypes

event type boolean ue_recuperar();
Boolean	lb_ret

lb_ret = wf_Recuperar( )

Return lb_ret
end event

public subroutine wf_activoonoff ();/* wf_ActivoOnOff( ) */
Long		ll_row
String	ls_data, ls_eli = 'Eliminado'


ll_row = f_Zero( dw_1.GetRow( ) )

If ll_row <= 0 Then Return

ls_data = f_Trim( dw_1.Object.c_activo[ ll_row] )

If ls_data = '0' Then ls_eli = 'Recuperado' 

If ls_data = '1' Then
	If Not wf_EliminarVerificar( ) Then
		Return
	End If
End If

If Not wf_AllowEdit( ) Then
	If Not f_IsAdmin( gs_usuario ) Then
		gw_frame.SetMicroHelp( 'El Registro no puede ser ' + ls_eli + ' por ser de origen Compartido.' )
		Return 
	End If
End If

	
If ls_data = '1' Then ls_data = '0' Else ls_data = '1'

dw_1.Object.c_activo[ ll_row] = ls_data
//dw_1.Object.c_usumod[ ll_row] = ls_data
dw_1.AcceptText( )

If dw_1.Update( True ) = 1 Then
	Commit Using SqlCa ;
	gw_frame.SetMicroHelp( 'El Registro ' + ls_eli + '.' )
Else
	RollBack Using SqlCa ;
	MessageBox( Title, 'No se pudo actualizar la información.', StopSign! )
	
	If ls_data = '1' Then ls_data = '0' Else ls_data = '1'
	
	dw_1.Object.c_activo[ ll_row] = ls_data
	dw_1.AcceptText( )
	//wf_Retrieve( )
End If

Return

end subroutine

public function long wf_retrieve ();s_parm lstr_parm


wf_PreRetrieve( )
dw_1.Retrieve( is_arg1, is_arg2, is_arg3, is_arg4, is_arg5 )

istr_parm = lstr_parm
istr_parm.dw_dat[1] = dw_1
istr_parm.w_win[1] = This

st_sincontenido.Visible = ( dw_1.RowCount( ) = 0 )
	
wf_GetFilter( gs_emp )

Return dw_1.RowCount( )
end function

public function boolean wf_eliminar ();/* wf_Eliminar( ) */
Long		ll_row
String	ls_acc


ll_row = dw_1.GetRow( )

If dw_1.RowCount( ) <= 0 Then
	MessageBox( Title, 'No existen registros para eliminar.' , Exclamation! )
	Return False
End If

If Not wf_EliminarVerificar( ) Then
	Return False
End If

istr_parm.s_cad[ 1] = 'E'
istr_parm.s_cad[ 2] = dw_1.Object.c_codigo[ll_row]
istr_parm.n_num[ 1] = ll_row

/* Control de la accion previa */
ls_acc = f_Trim( dw_1.Object.c_activo[ll_row] ) 

If ls_acc <> '1' Then
	MessageBox( Title, 'Registro ya se encuentra eliminado.', Exclamation! )
	Return False
End If


If Not wf_AllowEdit( ) Then
	If Not f_IsAdmin( gs_usuario ) Then
		MessageBox( Title, 'El Registro seleccionado No puede ser Eliminado,' + &
								Char(13) + ' por ser de origen Compartido.', Exclamation! )
		Return False
	End If
End If

Return True
end function

public function boolean wf_insertar ();
istr_parm.s_cad[1] = 'I'
istr_parm.s_cad[2] = ''
istr_parm.n_num[1] = dw_1.RowCount() + 1


Return True
end function

public function boolean wf_mant ();Return True
end function

public function boolean wf_modificar ();Long		ll_row
String	ls_acc


ll_row = dw_1.GetRow( )

If dw_1.RowCount( ) <= 0 Then
	MessageBox( Title, 'No existen registros para modificar.' , Exclamation! )
	Return False
End If

istr_parm.s_cad[1] = 'M'
istr_parm.s_cad[2] = dw_1.Object.c_codigo[ll_row]
istr_parm.n_num[1] = ll_row

/* Control de la accion previa */
ls_acc = f_Trim( dw_1.Object.c_activo[ll_row] ) 

If Not wf_AllowEdit( ) Then
	If Not f_IsAdmin( gs_usuario ) Then
		If Not ls_acc = '1' Then
			MessageBox( Title, 'El Registro seleccionado sólo puede ser Consultado,' + &
									Char(13) + ' por ser de origen Compartido.', Exclamation! )
		End If
		Return True
	End If
End If

If Not ls_acc = '1' Then
	If Not MessageBox( Title, 'Registro se encuentra eliminado.~r~r¿' + &
					'Desea consultarlo para recuperarlo?', Question!, YesNo! ) = 1 Then
		Return False
	Else
		//TriggerEvent( 'ue_recuperar' )
		//Return True
		Return wf_Recuperar( )
	End If
End If

//Enabled = False
Return True
end function

public function long wf_print ();DataWindow	ldw_1
Long		ll_rows


If is_rpt = '' Then
	is_rpt = dw_1.DataObject	
End If

ldw_1 = f_PrintPreview( is_rpt, Title )

If Not wf_PrintRetrieve( ldw_1 ) Then
	ll_rows = ldw_1.Retrieve( gs_emp )
End If

ll_rows = ldw_1.RowCount( )

Return ll_rows

end function

public function boolean wf_recuperar ();Long		ll_row
String	ls_acc, ls_msg


ll_row = dw_1.GetRow( )

If dw_1.RowCount( ) <= 0 Then
	MessageBox( Title, 'No existen registros para recuperar.' , Exclamation! )
	Return False
End If

istr_parm.s_cad[1] = 'R'
istr_parm.s_cad[2] = dw_1.Object.c_codigo[ll_row]
istr_parm.n_num[1] = ll_row

/* Control de la accion previa */
ls_acc = f_Trim( dw_1.Object.c_activo[ll_row] ) 
If ls_acc = '1' Then
	MessageBox( Title, 'Registro no se encuentra eliminado.', Exclamation! )
	Return False
End If

If Not wf_AllowEdit( ) Then
	ib_share = wf_ModoCompartir( gs_emp, is_tab )
	If Not ib_share  Then
		MessageBox( Title, 'La empresa activa no está configurada para Compartir ' + is_tab + '.' + &
								Char(13) + 'No se puede continuar con Recuperar por ser de origen Compartido.', Exclamation! )
		Return False
	End If
	If Not f_IsAdmin( gs_usuario ) Then
		MessageBox( Title, 'El Registro seleccionado No puede ser Recuperado,' + &
								Char(13) + ' por ser de origen Compartido.', Exclamation! )
		Return False
	End If
End If


Return True
end function

public subroutine wf_menu (string as_obj);
istr_parm.w_win[ 1] = This

Choose Case as_obj
	Case 'p_logo'
		//OpenSheet( w_gen_pagina_web, gw_frame )
		
	Case 'cb_new'
		If wf_Insertar( ) Then
			wf_Mant( )
		End If
		
	Case 'cb_open'
		If wf_Modificar( ) Then
			wf_Mant( )
		End If
		
	Case 'cb_delete'
		If wf_Eliminar( ) Then
			wf_Mant( )
		End If
		
	Case 'cb_recuperar'
		If wf_Recuperar( ) Then
			wf_Mant( )
		End If
		
	Case 'cb_filteroff'
		wf_Filter( '' )
		
	Case 'cb_erase'
		wf_EliminarPermanente( )
		
	Case 'cb_xls'
		wf_xls( )
		
	Case 'cb_refrescar'
		wf_Retrieve( )
		
	Case 'cb_print'
		wf_Print( )
		
	Case 'cb_task'
		wf_Task( )
		
	Case 'cb_return'
		Close( This )
		Return
End Choose

end subroutine

public function integer wf_preretrieve ();/* wf_PreRetrieve( ) */

If ib_retxemp Then
	is_arg1 = gs_emp
End If

If ib_retxpai Then
	is_arg1 = f_GenPais( gs_emp )
End If

Return 1
end function

public subroutine wf_filter (string as_filter);Long		ll_find
String	ls_find


as_filter = f_Trim( lower( as_filter ) )

If is_SetFilter = '' Then
	ls_find = '(( Lower( v_nombre ) Like "%' + as_filter + '%" ) ' 
	ls_find = ls_find + ' Or ( Lower( c_codigo ) Like "%' + as_filter + '%" ))' 
Else
	ls_find = f_GlobalReplace( is_SetFilter, '%%', '%' + as_filter + '%' )
End If

// Ejm: (( Lower( v_nombre ) Like "%fon%" ) or ( Lower( c_codigo ) Like "%" ) )

If Not as_filter = '' Then
	dw_1.SetFilter( ls_find )
Else
	dw_menu.Object.v_buscar[ 1] = ' '
	dw_1.SetFilter( '' )
End If

dw_1.Filter( )
gw_frame.SetMicroHelp( String( dw_1.GetRow( )) + '/' + String( dw_1.RowCount( ) ) )
st_sincontenido.Visible = ( dw_1.RowCount( ) = 0 )

Return

end subroutine

public function boolean wf_eliminarpermanente ();/* wf_EliminarPermanente( ) */
Long		ll_row
String	ls_acc


ll_row = dw_1.GetRow( )

If dw_1.RowCount( ) <= 0 Then
	MessageBox( Title, 'No existen registros para eliminar.' , Exclamation! )
	Return False
End If

If Not wf_EliminarVerificar( ) Then
	Return False
End If

istr_parm.s_cad[2] = dw_1.Object.c_codigo[ll_row]
ls_acc = f_Trim( dw_1.Object.c_activo[ll_row] ) 

dw_1.SelectRow( 0, False )
dw_1.SelectRow( ll_row, True )

/* Sólo si es original puede ser eliminado */
If Not wf_AllowEdit( ) Then
	MessageBox( Title, 'El Registro seleccionado no puede ser Eliminado permanentemente,' + &
							Char(13) + 'por ser de origen Compartido.', Exclamation! )
	Return False
End If

/* Control de la accion previa */
If ls_acc = '1' Then
	If Not MessageBox( Title, '¿Confirma Eliminar Permanentemente el Registro Seleccionado?', Question!, YesNo! ) = 1 Then
		Return False
	End If
End If

If Not wf_VerificaIntegridad( '0' ) Then
	Return False		
End If

dw_1.DeleteRow( ll_row )
If dw_1.Update( True ) = 1 Then
	Commit Using SqlCa ;
Else
	RollBack Using SqlCa ;
	dw_1.SetTransObject( SqlCa )
	wf_Retrieve( )
	Return False
End If

If ( dw_1.RowCount( ) = 0 ) Then
	wf_Retrieve( )
Else
	dw_1.SelectRow( 0, False )
	dw_1.SelectRow( dw_1.GetRow( ), True )
End If

Return True
end function

public function integer wf_new ();
If wf_Insertar( ) Then
	wf_Mant( )
End If

Return 1
end function

public function integer wf_open ();
If wf_Modificar( ) Then
	wf_Mant( )
End If

Return 1
end function

public subroutine wf_setdwpositiony (datawindow adw_1);/* wf_SetDWPositionY( adw_1 )
	Autor: César Vilela Requena
	Cambia la posición Y de los objetos del DW */

f_SetDWPositionY( adw_1, ii_PosDetY )

Return  
end subroutine

public function boolean wf_verificaintegridad (string as_all);
/* wf_VerificaIntegridad( ) */
s_parm	lstr_parm
Integer	li_cols, i 
String	ls_col, ls_emp, ls_cod, ls_ok, ls_nom, ls_tab


If is_FnSqlRef = '' Then Return True

li_cols = Integer( dw_1.Object.Datawindow.Column.Count )

For i = 1 To li_cols 
	ls_col = dw_1.Describe( '#' + String( i ) + '.name' ) 
	
	Choose Case ls_col
		Case 'c_codigo_emp'
			ls_emp = dw_1.Object.c_codigo_emp[ dw_1.GetRow( )]
			
		Case 'v_nombre'
			ls_nom = dw_1.Object.v_nombre[ dw_1.GetRow( )]
			
		Case 'c_codigo'
			ls_cod = dw_1.Object.c_codigo[ dw_1.GetRow( )]
	End Choose

Next

ls_tab = Title
/* Si mostrará o no todas las relaciones incluyendo las que no se tengan */
If Not as_all = '1' Then as_all = '0'

lstr_parm.s_cad[ ] = { ls_emp, ls_tab, ls_cod, ls_nom, as_all, is_FnSqlRef } 

//OpenWithParm( w_mant_gen_tabla_integridad, lstr_parm )

//ls_ok = f_Trim( Message.StringParm )
ls_ok = 'OK'
If ls_ok = 'OK' Then
	Return True
End If

Return False
end function

public function boolean wf_allowedit ();
/* wf_AllowEdit */
Integer	li_cols, i
String	ls_col, ls_emp, ls_cod, &
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

Return False


end function

public function boolean wf_modocompartir (string as_emp, ref string as_tab);
/* ib_share = wf_ModoCompartir( as_emp, as_tab )
	Return Boolean */	

Boolean	lb_ret = False
String	ls_shr


/* Si no se indicó manualmente el nombre de la tabla que se actualiza, la clase debe obtenerlo */
If as_tab = '' Then	
	as_tab = f_Trim( dw_1.Describe( 'DataWindow.Table.UpdateTable' ) )
End If

Select	c_compartir_mod
Into		:ls_shr
From		genblmodulotabla
Where		c_codigo_emp = :as_emp
And		v_tabla_mod = :as_tab
Using		SqlCa ;

ls_shr = f_Trim( ls_shr ) 

//ib_share
lb_ret = ( ls_shr = '1' )

Return lb_ret


end function

public function string wf_getfilter (string as_emp);/* wf_GetFilter( as_emp ) */
String	ls_tab


ls_tab = is_tab
If ls_tab = '' Then	
	ls_tab = f_Trim( dw_1.Describe( 'DataWindow.Table.UpdateTable' ) )
End If

Select	v_setfilter_blt
Into		:is_SetFilter
From		genbltabla
Where		c_codigo_emp = :as_emp
And		v_tabla_blt = :ls_tab
Using		SqlCa ;

is_SetFilter = f_Trim( is_SetFilter ) 

Return is_SetFilter
end function

public function boolean wf_eliminarverificar ();
Return True
end function

public function boolean wf_printretrieve (datawindow adw_rpt);/* wf_PrintRetrieve(adw_rpt) */

Return False
end function

on w_gen_document_mant.create
int iCurrent
call super::create
this.st_sincontenido=create st_sincontenido
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_sincontenido
end on

on w_gen_document_mant.destroy
call super::destroy
destroy(this.st_sincontenido)
end on

event open;call super::open;

If ib_retAuto Then wf_Retrieve( )
end event

event resize;call super::resize;st_sincontenido.x = ( newWidth - st_sincontenido.Width ) / 2 
st_sincontenido.y = ( newheight - st_sincontenido.height ) / 2 

end event

type dw_1 from w_gen_document`dw_1 within w_gen_document_mant
event buttondown pbm_dwnrbuttondown
event ue_recuperar ( )
boolean hscrollbar = true
boolean vscrollbar = true
end type

event dw_1::ue_recuperar();
wf_Recuperar( )

Return
end event

event dw_1::constructor;call super::constructor;String	ls_c1, ls_c2, ls_zebra, ls_select, &
			ls_docName


If This.Dataobject = '' Then Return

SetTransObject( SqlCa )

f_SetDWColor( This )

//This.Object.DataWindow.Header.Color = f_Gen_Color( 'tb' )
If Not is_HeaderColor = '' Then This.Object.DataWindow.Header.Color = f_Gen_Color( is_HeaderColor )

ls_c1 = String( f_Gen_Color( 'l' ) )
ls_c2 = String( f_Gen_Color( 'blanco' ) )

If ib_detzebra Then 
	ls_zebra = "~tIf ( Mod( GetRow( ), 2) = 0, "+ls_c1+ ", "+ ls_c2 + " )"
	This.Object.DataWindow.detail.color=ls_c2 + ls_zebra
End If

If ib_detSelect Then
	ls_select = "536870912~tf_Gen_Color( If(  getRow( ) = currentRow( ), 'm', 'transparent' ) )"
	This.Object.DataWindow.Detail.Color= ls_select
	This.Object.DataWindow.Detail.Transparency="70"
End If

This.Object.DataWindow.Header.Height = ii_HeadHeight
If ib_detHeight Then This.Object.DataWindow.Detail.Height = ii_detheight
This.Object.DataWindow.ShowBackColorOnXP = 'yes'

If Not is_TextBar = '' Then f_SetObjectColor( This, '', 'text', String( f_Gen_Color( is_TextBar ) ) )

If ib_posY Then wf_SetDWPositionY( This )

ls_docName = f_Trim( This.Object.DataWindow.Print.DocumentName )
If ls_docName = '' Then 
	ls_docName = Parent.Title 
	This.Object.DataWindow.Print.DocumentName = ls_docName
End If

end event

event dw_1::retrieveend;call super::retrieveend;// No hacer nada
If rowcount >0 Then 
	SelectRow( 0, False)
	SelectRow( 1, ib_selectrow )
	SetFocus( )
End If

f_SetMHStatus( 1, "Filas Recuperadas: " + String(rowcount))
st_sincontenido.Visible = ( RowCount( ) = 0 )
end event

event dw_1::doubleclicked;call super::doubleclicked;
If Not RowCount( ) > 0 Then Return
	
row = f_Zero( row )
If row > 0 Then This.SetRow( row )

Choose Case dwo.name
	 Case 'c_activo'
		wf_ActivoOnOff( )
		
	Case Else				
		If wf_Modificar( ) Then
			wf_Mant( )
		End If
End Choose


		
end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;Long		ll_row, ll_filas

ll_filas = This.RowCount()

If ll_filas > 0 then
	This.SelectRow( 0, False )
	This.SelectRow( currentrow, ib_selectrow )
End If

If ib_detselect Then
	SetRedraw( True )
End If
//If currentrow > 0 Then SetRow( currentrow )
f_SetMHStatus( 1, "Fila: " + String(currentrow) + "/" + String(RowCount()))

end event

event dw_1::clicked;call super::clicked;

row = f_Zero( row )

If row > 0 Then
	SetRow( row )
	This.SelectRow( row, ib_SelectRow )
	gw_frame.SetMicroHelp( "Fila: " + String(row) + "/" + String(RowCount()))
End If


end event

event dw_1::rbuttondown;call super::rbuttondown;Integer	li_opc
String	ls_menu[]


ls_menu = { 'Nuevo', 'Abrir', 'Eliminar', '-', 'Actualizar Listado', 'Exportar a Excel' }

row = f_Zero( row )
If row > 0 Then SetRow( row )
li_opc = wf_MenuPopup( Parent.Title, ls_menu[] )

Choose Case li_opc
	Case 1
		If wf_Insertar( ) Then
			wf_Mant( )
		End If
		
	Case 2
		If wf_Modificar( ) Then
			wf_Mant( )
		End If
		
	Case 3
		If wf_Eliminar( ) Then
			wf_Mant( )
		End If
		
	Case 5
		wf_Retrieve( )
		
	Case 6
		wf_xls( )
End Choose
end event

event dw_1::key;call super::key;Choose Case Key
	Case KeyF5!
		wf_Retrieve( )
		
	Case KeyF3!
		dw_menu.SetFocus( )
		
	Case KeyDelete!
		If KeyDown( KeyShift! ) Then
			wf_EliminarPermanente( )
			
		ElseIf KeyDown( KeyControl! ) Then
			wf_ActivoOnOff( )
			
		Else
			If wf_Eliminar( ) Then
				wf_Mant( )
			End If
		End If
		
	Case KeyN!
		If KeyDown( KeyControl! ) Then
			If wf_Insertar( ) Then
				wf_Mant( )
			End If
		End If
		
End Choose
		
end event

event dw_1::retrievestart;call super::retrievestart;
f_SetMHStatus( 1, "Espere un momento...")
end event

type dw_menu from w_gen_document`dw_menu within w_gen_document_mant
integer width = 4018
end type

event dw_menu::clicked;call super::clicked;wf_Menu( dwo.Name )
end event

event dw_menu::editchanged;call super::editchanged;Long		ll_find
String	ls_find

If Not ib_RetAuto Then Return
data = f_Trim( lower( data ) )

is_buscar = data
wf_Filter( data )

Return

end event

event dw_menu::itemchanged;call super::itemchanged;
Long	ll_ret

If ib_RetAuto Then Return

is_buscar = f_Trim( data )
ll_ret = wf_Retrieve( )

end event

type st_sincontenido from statictext within w_gen_document_mant
boolean visible = false
integer x = 274
integer y = 516
integer width = 2519
integer height = 308
boolean bringtotop = true
integer textsize = -48
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 12632256
long backcolor = 16777215
boolean enabled = false
string text = "SIN CONTENIDO"
alignment alignment = center!
long bordercolor = 10789024
boolean focusrectangle = false
end type

