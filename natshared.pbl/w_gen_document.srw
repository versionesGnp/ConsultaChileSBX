//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Ancestra de Documentos~r~n    Recomendación: NO MODIFICAR - AFECTA TODO EL SISTEMA~r~n*/
forward
global type w_gen_document from window
end type
type dw_1 from uo_dw_edit within w_gen_document
end type
type dw_menu from datawindow within w_gen_document
end type
end forward

global type w_gen_document from window
integer width = 4087
integer height = 1320
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
dw_menu dw_menu
end type
global w_gen_document w_gen_document

type variables
s_parm istr_parm

Boolean ib_fulledit, ib_fulllist = False
Boolean ib_saved

/* Para el toolbar */
Boolean ib_cbnew = True, ib_cbopen = True, ib_cbexcel = True, ib_cbdelete = True, ib_cbprint = True
Boolean ib_cbsave = True, ib_cbtask = False, ib_cbadd  = True, ib_cbshare  = True, ib_cbRefresh = False

/* Create Column Indicator */
Boolean ib_ind 

/* Para usar en multiempresa */
String	is_emp, is_pai

String	is_tab /* Determina el BL-TabPage Activo */


Boolean	ib_ora = False, ib_readonly = False
Integer	ii_PosDetY = 20, ii_buttonhomepos=750

Boolean  ib_UpdateByProc = False

String	is_DB

end variables

forward prototypes
public function integer wf_task ()
public subroutine wf_xls ()
public function integer wf_menupopup (string as_title, string as_menu[])
public function integer wf_new ()
public function integer wf_open ()
public function long wf_print ()
public function boolean wf_save ()
public subroutine wf_tab (string as_tab)
public subroutine wf_tabpage (string as_tab)
public function string wf_rutmask (string as_col)
public function integer wf_config ()
public function boolean columnindicator (boolean bshow)
public function integer wf_refresh ()
public function integer wf_update ()
public function boolean wf_lostchanges ()
end prototypes

public function integer wf_task ();Return 1
end function

public subroutine wf_xls ();
Integer	li_ret


li_ret = f_GenMenuVisualPopup( '', {'Excel Visual', 'Excel Básico', 'Hybrid' }, {'DataManipulationTabular!', 'DataManipulationGrid!', 'DataWindowIcon!'} )

If li_ret <= 0 Then Return 

Choose Case li_ret
		
	Case 1
		f_DWToExcelCSS( dw_1 )
		//f_DWToExcel( dw_1 )
		
	Case 2
		f_DWToExcelClassic( dw_1 )
		
	Case 3
		f_DWToExcelHybrid( dw_1 )
End Choose


end subroutine

public function integer wf_menupopup (string as_title, string as_menu[]);Integer	li_ret

li_ret = f_GenMenuPopup( as_title, as_menu[] )

Return li_ret
end function

public function integer wf_new ();/* Programar en las Windows descendientes */

Return 1
end function

public function integer wf_open ();/* Programar en las Windows descendientes */

Return 1
end function

public function long wf_print ();/* Programar en las Windows descendientes */

Return 1
end function

public function boolean wf_save ();
Return True
end function

public subroutine wf_tab (string as_tab);dw_1.Object.c_tab[ 1] = as_tab

wf_TabPage( as_tab )
dw_1.AcceptText( )
is_tab = as_tab

Return

end subroutine

public subroutine wf_tabpage (string as_tab);

Return
end subroutine

public function string wf_rutmask (string as_col);
String	ls_fmt

ls_fmt = f_GenRUTMask( dw_1, as_col )

Return ls_fmt
end function

public function integer wf_config ();

Return 1
end function

public function boolean columnindicator (boolean bshow);

dw_1.Object.r_ind.Visible = bShow

Return True
end function

public function integer wf_refresh ();/* Programar en las Windows descendientes */

Return 1
end function

public function integer wf_update ();
Return 1
end function

public function boolean wf_lostchanges ();
String	ls_msg


If ib_saved Then Return True

ls_msg = 'Existe información sin guardar.' + Char(13) + Char(13) + &
			'¿Desea perder las modificaciones y Continuar?'
If Not blEclipse.MessageBox( Title, ls_msg, Question!, YesNo! ) = 1 Then
	Return False
End If

ib_saved = True

Return True
end function

on w_gen_document.create
this.dw_1=create dw_1
this.dw_menu=create dw_menu
this.Control[]={this.dw_1,&
this.dw_menu}
end on

on w_gen_document.destroy
destroy(this.dw_1)
destroy(this.dw_menu)
end on

event open;
// CVilela: 27/Feb/2025 - Uso de Empresa
String	ls_emp

ls_emp = UpperTrim( gs_empresa )
If Pos( ls_emp, 'PRADO' ) > 0 Then
	is_DB = 'PRADO' 
End If

If Pos( ls_emp, 'FORESTA' ) > 0 Then
	is_DB = 'FORESTA' 
End If
//


dw_menu.InsertRow(0)

//This.BackColor = f_Gen_Color( 'menu' )
This.BackColor = f_Gen_Color( 'wind' )

WindowState = Maximized!
ib_ora = f_isOracle( ) 

dw_menu.width = Width

wf_Config( )

f_SetMHStatus( 1, ClassName( ) )
end event

event resize;dw_menu.Width = Newwidth

If ib_fulledit Then
	dw_1.Width = Newwidth - ( dw_1.X * 2 )
	dw_1.Height = NewHeight - dw_menu.Height - ( dw_1.X * 2 )
End If


end event

event activate;f_SetMHStatus( 1, ClassName( ) )
end event

type dw_1 from uo_dw_edit within w_gen_document
event key pbm_dwnkey
event setobjectcolor ( string as_obj,  string as_clr )
event setobjectcolora ( string as_obj[],  string as_clr )
integer x = 37
integer y = 160
integer width = 3278
integer height = 856
integer taborder = 10
boolean border = false
end type

event setobjectcolor(string as_obj, string as_clr);
// CVILELA 02-Sep-2021

f_SetObjectColor( This, as_obj, '', String( f_Gen_Color( as_clr ) ) )



end event

event setobjectcolora(string as_obj[], string as_clr);
// CVILELA 02-Sep-2021

Integer	i

For i = 1 To UpperBound( as_obj[] )
	f_SetObjectColor( This, as_obj[ i], '', String( f_Gen_Color( as_clr ) ) )
Next


end event

event constructor;SetTransObject( SqlCa )

If This.DataObject = '' Then Return

If ib_ind Then f_CreateColumnIndicator( This, 'r_ind' )
end event

event itemfocuschanged;

If ib_ind Then
	Object.r_ind.x = Long( dwo.x ) - 4
	Object.r_ind.y = Long( dwo.y ) - 4
	Object.r_ind.width = Long( dwo.width ) + 8
	Object.r_ind.Height = Long( dwo.Height ) + 8
End If
end event

type dw_menu from datawindow within w_gen_document
event reorderbuttons ( long initialpos,  string buttons[] )
integer width = 3291
integer height = 132
integer taborder = 20
string dataobject = "d_gen_menu_toolbar_mant"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event reorderbuttons(long initialpos, string buttons[]);
// Reorganiza los Visibles
// Event ReorderButtons( InitialPos, Buttons[] )
Integer	li_space = 50, li_x, i
String	ls_visible

li_x = InitialPos
For i = 1 To UpperBound( Buttons[] )
	ls_visible = Describe( Buttons[ i] + '.Visible' ) 
	If Not ls_visible = '1' Then Continue
	li_x = li_x + li_space
	This.Modify( Buttons[ i] + '.X = ' + String( li_x ) )
	li_x = li_x + Long( Describe( Buttons[ i] + '.Width' ) )
Next
end event

event clicked;Choose Case dwo.Name 
		
	Case 'cb_tile' 
		gw_frame.ArrangeSheets( Tile! )
		
		If KeyDown( KeyShift! ) Then
			gw_frame.ArrangeSheets( TileHorizontal! )
		End If
		
	Case 'cb_home'
		OpenSheet( w_arch_gen_pagina_inicio, gw_frame, 1, Original! )
		
End Choose

end event

event constructor;String	ls_dis, ls_ena, ls_col

/* César Vilela R. - 09/Ago/2017 */
ls_dis = String( f_Gen_Color( 'cromado' ) )
ls_ena = String( f_Gen_Color( 'textbar' ) )

ls_col = ls_ena
If Not ib_cbnew Then ls_col = ls_dis
This.Modify( 'cb_new.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbopen Then ls_col = ls_dis
This.Modify( 'cb_open.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbexcel Then ls_col = ls_dis
This.Modify( 'cb_xls.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbdelete Then ls_col = ls_dis
This.Modify( 'cb_delete.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbprint Then ls_col = ls_dis
This.Modify( 'cb_print.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbsave Then ls_col = ls_dis
This.Modify( 'cb_save.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbadd Then ls_col = ls_dis
This.Modify( 'cb_add.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbtask Then ls_col = ls_dis
This.Modify( 'cb_task.Color = ' + ls_col )

ls_col = ls_ena
If Not ib_cbshare Then ls_col = ls_dis
This.Modify( 'cb_share.Color = ' + ls_col )


end event

