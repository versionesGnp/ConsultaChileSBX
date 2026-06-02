//objectcomments /* Autor: César Vilela ~r~n    Función: usuario opciones~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_usuario_opcion from w_gen_document_doc
end type
type r_1 from rectangle within w_arch_ecli_configura_usuario_opcion
end type
type r_2 from rectangle within w_arch_ecli_configura_usuario_opcion
end type
end forward

global type w_arch_ecli_configura_usuario_opcion from w_gen_document_doc
integer height = 1972
string title = "Opciones por Usuario"
boolean ib_fulledit = false
boolean ib_cbtask = true
r_1 r_1
r_2 r_2
end type
global w_arch_ecli_configura_usuario_opcion w_arch_ecli_configura_usuario_opcion

type variables

String is_SetFilter
end variables

forward prototypes
public function integer wf_new ()
public function integer wf_task ()
public subroutine wf_filter (string as_filter)
public subroutine wf_menu (string as_obj)
public function boolean wf_actualizaloginopc (string as_usu, string as_opc, string as_sel, integer ai_dock)
end prototypes

public function integer wf_new ();dw_1.Retrieve( )
//dw_list.Retrieve( )

Return 1
end function

public function integer wf_task ();
String	ls_msg

Open( w_arch_ecli_configura_usuario_opcion_dup )
ls_msg = f_Trim( Message.StringParm )

If ls_msg = 'OK' Then dw_1.Event RowFocusChanged( dw_1.GetRow( ) )

Return 1
end function

public subroutine wf_filter (string as_filter);Long		ll_find, ll_row
String	ls_find, ls_cod


as_filter = f_Trim( lower( as_filter ) )

ll_row = f_Zero( dw_1.GetRow( ) )

If ll_row > 0 Then ls_cod = f_Trim( dw_1.Object.c_codigo_usu[ ll_row] )

If is_SetFilter = '' Then
	ls_find = '(( Lower( v_nombre_usu ) Like "%' + as_filter + '%" ) ' 
	ls_find = ls_find + ' Or ( Lower( c_codigo_usu ) Like "%' + as_filter + '%" ))' 
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

ll_row = f_Zero( dw_1.GetRow( ) )

If ll_row > 0 Then 
	If Not ls_cod = f_Trim( dw_1.Object.c_codigo_usu[ ll_row] ) Then
		ls_cod = f_Trim( dw_1.Object.c_codigo_usu[ ll_row] )
		dw_list.Retrieve( ls_cod )
		dw_menu.SetFocus( )
	End If
Else
	dw_list.Reset(  )
	dw_menu.SetFocus( )
End If

gw_frame.SetMicroHelp( String( dw_1.GetRow( )) + '/' + String( dw_1.RowCount( ) ) )
//st_sincontenido.Visible = ( dw_1.RowCount( ) = 0 )

Return

end subroutine

public subroutine wf_menu (string as_obj);/* Debe estar activo el extend */


Choose Case as_obj
	Case 'p_logo'
		//OpenSheet( w_gen_pagina_web, gw_frame )
	Case 'cb_new'
		wf_New( )
	Case 'cb_open'
		wf_Open( )
	Case 'cb_save'
		wf_Save( )
	Case 'cb_delete'
		wf_Delete( )
	Case 'cb_print'
		wf_Print( )
	Case 'cb_task'
		wf_Task( )
	Case 'cb_add'
		wf_add( )
	Case 'cb_xls'
		wf_xls( )

	Case 'cb_tile' 
		gw_frame.ArrangeSheets( Tile! )
		
		If KeyDown( KeyShift! ) Then
			gw_frame.ArrangeSheets( TileHorizontal! )
		End If
		
	Case 'cb_home'
		OpenSheet( w_arch_gen_pagina_inicio, gw_frame, 1, Original! )
		
	Case 'cb_return'
		Close( This )
End Choose

end subroutine

public function boolean wf_actualizaloginopc (string as_usu, string as_opc, string as_sel, integer ai_dock);
/* wf_ActualizaLoginOpc( as_usu, as_opc, as_sel ) */
String	ls_rol


Select	c_rol_usu
Into		:ls_rol
From		genlogin 
Where		c_codigo_usu = :as_usu
Using		SqlCa ;

ls_rol = f_Trim( ls_rol )

Delete	genloginopc 
Where		c_codigo_usu = :as_usu
And		c_codigo_opc = :as_opc
Using		SqlCa ;

If f_SqlError( SqlCa, 'No se pudo actualizar las opciones del usuario (Delete).' ) = -1 Then
	RollBack Using SqlCa ;
	Return False
End If

If ls_rol = '1' Then 
	Delete	genloginopc 
	Where		c_codigo_opc = :as_opc
	And 		c_codigo_usu In ( Select c_codigo_usu From genLogin Where c_codrol_usu = :as_usu )
	Using		SqlCa ;

	If f_SqlError( SqlCa, 'No se pudo actualizar las opciones del usuario (1. x Rol).' ) = -1 Then
		RollBack Using SqlCa ;
		Return False
	End If	
End If

If as_sel = '1' Then
	Insert Into genloginopc 
		( c_codigo_usu, c_codigo_opc, c_favorito_opc, n_dock_opc ) 
	Values
		( :as_usu, :as_opc, '0', :ai_dock )
	Using SqlCa ;
End If

If f_SqlError( SqlCa, 'No se pudo actualizar las opciones del usuario.' ) = -1 Then
	RollBack Using SqlCa ;
	Return False
End If

If as_sel = '1' And ls_rol = '1' Then 
	Insert Into genLoginOpc 
		( c_codigo_usu, c_codigo_opc, c_favorito_opc ) 
	Select c_codigo_usu, :as_opc As c_codigo_opc, '0' As c_favorito_opc 
	From   genLogin 
	Where  c_codrol_usu = :as_usu 
	Using SqlCa ;
		
	If f_SqlError( SqlCa, 'No se pudo actualizar las opciones del usuario (2. x Rol).' ) = -1 Then
		RollBack Using SqlCa ;
		Return False
	End If	
End If

end function

on w_arch_ecli_configura_usuario_opcion.create
int iCurrent
call super::create
this.r_1=create r_1
this.r_2=create r_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_1
this.Control[iCurrent+2]=this.r_2
end on

on w_arch_ecli_configura_usuario_opcion.destroy
call super::destroy
destroy(this.r_1)
destroy(this.r_2)
end on

event resize;call super::resize;dw_1.Height = NewHeight - dw_menu.Height - ( dw_1.X * 2 )
r_1.Height =  dw_1.Height + 35
r_2.Height =  dw_1.Height + 35

end event

type dw_1 from w_gen_document_doc`dw_1 within w_arch_ecli_configura_usuario_opcion
integer x = 50
integer y = 184
integer width = 1696
integer height = 1636
string dataobject = "d_arch_ecli_configura_usuario_opcion"
boolean vscrollbar = true
end type

event dw_1::constructor;call super::constructor;String	ls_c1, ls_c2


	This.Object.DataWindow.Header.Color = f_Gen_Color( 'm' )
	
	ls_c1 = String( f_Gen_Color( 'l' ) )
	ls_c2 = String( f_Gen_Color( 'blanco' ) )
	
	This.Object.DataWindow.detail.color=ls_c2 + "~tIf ( Mod( GetRow( ), 2) = 0, "+ls_c1+ ", "+ ls_c2 + " )"

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;String	ls_usu

currentrow = f_Zero( currentrow )

If currentrow > 0 Then
	ls_usu = f_Trim( This.Object.c_codigo_usu[ currentrow] )
	dw_list.Retrieve( ls_usu )
Else
	dw_list.Reset( )
End If


end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_ecli_configura_usuario_opcion
string dataobject = "d_gen_menu_toolbar_opcion_find"
end type

event dw_menu::editchanged;call super::editchanged;Long		ll_find
String	ls_find


data = f_Trim( lower( data ) )

wf_Filter( data )

Return

end event

event dw_menu::clicked;// No Ancester
Choose Case dwo.Name
	Case 'cb_filteroff'
		wf_Filter( '' )
		
	Case Else
		wf_Menu( dwo.Name )
		
End Choose

end event

type dw_list from w_gen_document_doc`dw_list within w_arch_ecli_configura_usuario_opcion
boolean visible = true
integer x = 1897
integer y = 184
integer width = 1696
integer height = 1636
string dataobject = "d_arch_ecli_configura_usuario_opcion_det"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
end type

event dw_list::itemchanged;call super::itemchanged;
Integer	li_dock
Long		i, ll_sel, ll_sub
String	ls_usu, ls_opc, ls_sub, ls_xsub, ls_sel, ls_rol


dw_1.AcceptText( )
dw_list.AcceptText( )

ls_usu = f_Trim( dw_1.Object.c_codigo_usu[ dw_1.GetRow() ] )
ls_opc = f_Trim( dw_list.Object.c_codigo_opc[ row ] )
ls_sub = f_Trim( dw_list.Object.c_codigo_sub[ row ] )
li_dock = f_Zero( dw_list.Object.n_dock_opc[ row ] )
ls_sel = data

If Not wf_ActualizaLoginOpc( ls_usu, ls_opc, ls_sel, li_dock ) Then
	Return
End If

Commit Using SqlCa ;

If Not data = '1' Then
	dw_list.Object.c_sub[ row ] = data
End If

dw_list.AcceptText( )

ll_sel = f_Zero( dw_list.Object.n_sel[ row ] )
ll_sub = f_Zero( dw_list.Object.n_sub[ row ] )

If Not data = '1' Then
	ll_sel = ll_sel - 1
Else
	ll_sel = ll_sel + 1
End If

If ll_sel > 0 And ll_sel = ll_sub Then
	ls_sel = '1'
Else
	ls_sel = '0'
End If

For i = 1 To dw_list.RowCount( )
	
	ls_xsub = f_Trim( dw_list.Object.c_codigo_sub[ i ] )
	
	If Not ls_sub = ls_xsub Then Continue

	dw_list.Object.c_sub[ i ] = ls_sel
Next

dw_list.AcceptText( )
end event

event dw_list::rowfocuschanged;call super::rowfocuschanged;SelectRow( 0, False )
end event

event dw_list::clicked;call super::clicked;Long		i, li_dock
String	ls_usu, ls_opc, ls_sub, ls_sel, ls_xsub, ls_band, ls_row


dw_1.AcceptText( )
dw_list.AcceptText( )

If Not dwo.Name = 'c_sub' Then Return

/* Determina Posición */
ls_band = This.GetBandAtPointer( )

ls_row = Mid( ls_band, Pos( ls_band, '	', 1 ) + 1 )
row = Long( ls_row )

ls_usu = f_Trim( dw_1.Object.c_codigo_usu[ dw_1.GetRow( ) ] )
ls_sub = f_Trim( dw_list.Object.c_codigo_sub[ row ] )
ls_sel = f_Trim( dw_list.Object.c_sub[ row ] )

If ls_sel = '1' Then ls_sel = '0' Else ls_sel = '1'
dw_list.Object.c_sub[ row ] = ls_sel

For i = 1 To dw_list.RowCount( )
	
	ls_xsub = f_Trim( dw_list.Object.c_codigo_sub[ i ] )
	
	If Not ls_sub = ls_xsub Then Continue

	ls_opc = f_Trim( dw_list.Object.c_codigo_opc[ i ] )
	li_dock = dw_list.Object.n_dock_opc[ i ]
	dw_list.Object.c_sub[ i ] = ls_sel
	dw_list.Object.c_asignado[ i ] = ls_sel

	If Not wf_ActualizaLoginOpc( ls_usu, ls_opc, ls_sel, li_dock ) Then
		Return
	End If
Next

Commit Using SqlCa ;

dw_list.AcceptText( )
end event

type r_1 from rectangle within w_arch_ecli_configura_usuario_opcion
long linecolor = 12632256
integer linethickness = 3
long fillcolor = 1073741824
integer x = 32
integer y = 168
integer width = 1728
integer height = 1680
end type

type r_2 from rectangle within w_arch_ecli_configura_usuario_opcion
long linecolor = 12632256
integer linethickness = 3
long fillcolor = 1073741824
integer x = 1883
integer y = 168
integer width = 1728
integer height = 1680
end type

