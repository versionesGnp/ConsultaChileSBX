forward
global type uo_dw_list from datawindow
end type
end forward

global type uo_dw_list from datawindow
integer width = 1856
integer height = 704
integer taborder = 1
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event nkey pbm_dwnkey
end type
global uo_dw_list uo_dw_list

type variables
Boolean	ib_detzebra = True, ib_selectrow = True, ib_order = True, ib_filter = True, ib_search = False, &
			ib_detselect = False, &
			ib_detHeight = True, ib_exportxls = True, ib_ind = False
Integer	ii_detheight = 115, ii_posDetY = 20, ii_HeadHeight = 90, ii_MaxWidth = 0
String	is_columna = '', is_order, is_colant = '', is_ordant, is_headercolor = 'm', &
			is_colfilter[], is_colfilterS[], is_colfilterList[], &
			is_colSearch[], is_colSearchS[], is_colSExact = '0'

end variables

forward prototypes
public subroutine setobjectcolor (string as_obj, string as_clr)
public function long find (string asfind)
public function integer filter (string asfilter)
public function integer sort (string assort)
public function long rowscopy (datawindow targetdw)
public function long rowscopy (datastore targetds)
public subroutine moveindicator (dwobject dwo)
public subroutine colsearchreset (boolean abresetfilter)
public function string createbuttonsearch ()
public subroutine colsearch (string ascol[])
public function integer setfocus (string ascol)
public function integer setfocus (long alrow, string ascol)
public function long find (string asfind, boolean abscroll)
public function integer exportexcel ()
public subroutine setobjectcolor (string as_obj[], string as_clr)
public function integer columnscopy (long row, string columns[], datawindow dwtarget, long rowtarget)
public subroutine setobjectcolor (string as_obj, string as_con, string as_clr[])
public subroutine colenabled (string as_col, boolean ab_enabled)
public subroutine colenabled (string as_col[], boolean ab_enabled)
public subroutine colenabled (string as_col[], string as_enabled)
public subroutine setdwpositiony (string as_obj[], integer ai_posy)
public subroutine setdwpositiony (integer ai_posy)
public subroutine setdwpositiony (integer ai_posy, string as_band)
public subroutine colfilter (string as_col[])
public subroutine colfilterreset ()
public function boolean readonlydw (boolean abreadonly)
end prototypes

public subroutine setobjectcolor (string as_obj, string as_clr);
// CVILELA 26-Ago-2021
f_SetObjectColor( This, as_obj, '', String( f_Gen_Color( as_clr ) ) )
end subroutine

public function long find (string asfind);
Long	ll_ret

ll_ret = Find( asFind, 1, RowCount( ) )

Return ll_ret
end function

public function integer filter (string asfilter);
Integer	li_ret

SetRedraw( False )
li_ret = SetFilter( asFilter )
li_ret = Filter( )
SetRedraw( True )

Return li_ret

end function

public function integer sort (string assort);
Integer	li_ret

SetSort( asSort )
li_ret = Sort( )

Return li_ret

end function

public function long rowscopy (datawindow targetdw);

Long		ll_ret
String	ls_class

ls_class = Lower( ClassName( Targetdw ) )
ll_ret = This.RowCount( )

This.RowsCopy( 1, ll_ret, Primary!, Targetdw, 1, Primary! )
ll_ret = Targetdw.RowCount( )	

Return ll_ret
end function

public function long rowscopy (datastore targetds);

Long		ll_ret
String	ls_class

ls_class = Lower( ClassName( targetDS ) )
ll_ret = This.RowCount( )

This.RowsCopy( 1, ll_ret, Primary!, TargetDS, 1, Primary! )
ll_ret = TargetDS.RowCount( )	

Return ll_ret
end function

public subroutine moveindicator (dwobject dwo);// MoveIndicator
	Object.r_ind.x = Long( dwo.x ) - 4
	Object.r_ind.y = Long( dwo.y ) - 4
	Object.r_ind.width = Long( dwo.width ) + 8
	Object.r_ind.Height = Long( dwo.Height ) + 8
	
end subroutine

public subroutine colsearchreset (boolean abresetfilter);
Integer	i, li_ub
String	ls_void[], ls_header


li_ub = UpperBound( is_colSearch[ ] )

For i = 1 To li_ub
	ls_header = This.is_colSearch[ i] + '_t'
	SetObjectColor( ls_header, 't' )
Next

is_colSearch[] = ls_void[]
is_colSearchS[] = ls_void[]
is_colSExact = '0'

If abResetFilter Then This.Filter( '' )

end subroutine

public function string createbuttonsearch ();
String ls_err

ls_err = f_CreateButtonSearch( This )

Return ls_err
end function

public subroutine colsearch (string ascol[]);
/* ColSearch( asCol[] ) */

s_parm	lstr_parm


lstr_parm.s_cad[] = asCol[]
lstr_parm.dw_dat[ 1] = This

OpenWithParm( w_arch_gen_filter_search, lstr_parm )

end subroutine

public function integer setfocus (string ascol);
Integer	li_ret

SetColumn( asCol )
li_ret = SetFocus( )

Return li_ret
end function

public function integer setfocus (long alrow, string ascol);
Integer	li_ret

alRow = f_Zero( alrow )
If alRow = 0 Then alrow = This.RowCount( )

If alRow > 0 Then 
	ScrollToRow( alRow )
	SetRow( alRow )
End If

SetColumn( asCol )
li_ret = SetFocus( )

Return li_ret
end function

public function long find (string asfind, boolean abscroll);
Long	ll_ret

ll_ret = Find( asFind, 1, RowCount( ) )

If ll_ret > 0 And abScroll Then ScrollToRow( ll_ret )

Return ll_ret
end function

public function integer exportexcel ();
//
Integer	li_ret


li_ret = f_GenMenuVisualPopup( '', {'Excel Visual', 'Excel Básico', 'Hybrid' }, {'DataManipulationTabular!', 'DataManipulationGrid!', 'DataWindowIcon!'} )

If li_ret <= 0 Then Return 0

Choose Case li_ret
		
	Case 1
		f_DWToExcelCSS( This )
		//f_DWToExcel( This )
		
	Case 2
		f_DWToExcelClassic( This )
		
	Case 3
		f_DWToExcelHybrid( This )
End Choose

Return li_ret
end function

public subroutine setobjectcolor (string as_obj[], string as_clr);
// CVILELA 26-Ago-2021
f_SetObjectColorA( This, as_obj[], '', as_clr )
end subroutine

public function integer columnscopy (long row, string columns[], datawindow dwtarget, long rowtarget);
Integer	i
String	ls_colType, ls_colAux, ls_col

For i = 1 To UpperBound( columns[] )
	ls_col = Columns[ i]
	ls_colType 	= f_Trim( This.Describe( ls_col + '.ColType' ) )	//Tipo de Columna
	ls_colAux = Left( ls_colType, 4)

	Choose Case ls_colType
		Case 'char'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemString( row, ls_col ) )
			
		Case 'date'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemDate( row, ls_col ) )
			
		Case 'datetime'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemDateTime( row, ls_col ) )
			
		Case 'long', 'number', 'ulong'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemNumber( row, ls_col ) )
			
		Case 'decimal'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemDecimal( row, ls_col ) )
			
		Case Else
			Choose Case ls_colAux
				Case 'char'
					dwTarget.SetItem( rowTarget, ls_col, This.GetItemString( row, ls_col ) )
				Case 'deci' 
					dwTarget.SetItem( rowTarget, ls_col, This.GetItemDecimal( row, ls_col ) )
			End Choose
	End Choose

Next

Return i
end function

public subroutine setobjectcolor (string as_obj, string as_con, string as_clr[]);
// CVILELA 05-May-2023
/*
as_obj = Objeto a cambiar de color
as_con = Condición IF para cambio de color
as_clr = Colores que se tendrá {'color_1', 'color_2'} según as_con
*/
f_SetobjectColorS( This, as_obj, as_con, as_clr[] )
end subroutine

public subroutine colenabled (string as_col, boolean ab_enabled);
f_ColEnabled( This, as_col, ab_enabled )
end subroutine

public subroutine colenabled (string as_col[], boolean ab_enabled);
f_ColEnabledA( This, as_col[], ab_enabled )
end subroutine

public subroutine colenabled (string as_col[], string as_enabled);
f_ColEnabledC( This, as_col[], as_enabled )
end subroutine

public subroutine setdwpositiony (string as_obj[], integer ai_posy);
f_SetdwPositionYA( This, as_obj[], ai_posY )

end subroutine

public subroutine setdwpositiony (integer ai_posy);

f_SetDWPositionY( This, ai_posY )

end subroutine

public subroutine setdwpositiony (integer ai_posy, string as_band);

f_SetDWPositionYBand( This, ai_posY, as_Band )

end subroutine

public subroutine colfilter (string as_col[]);
Int		i, li_ub
String	ls_header, ls_newfil, ls_x, ls_y, ls_w, ls_mod, ls_err

li_ub = UpperBound( as_col[ ] )

For i = 1 To li_ub
	ls_header = as_col[ i] + '_t'
	ls_newfil = as_col[ i] + '_filter' //Nuevo nombre
	
	ls_mod = 'Destroy ' + ls_newfil
	ls_err = This.Modify( ls_mod )

	ls_x = This.Describe( ls_header + '.x'  )
	If ls_x = '!' Then 
		ls_header = as_col[ i]
		ls_x = This.Describe( ls_header + '.x'  )
	End If
	
	ls_y = String( Long( This.Describe( ls_header + '.y'  ) ) + 5 )
	ls_w = This.Describe( ls_header + '.width'  )
	ls_x = String( ( Long( ls_x ) + Long( ls_w ) ) - 50 - 10 ) // Nueva Posición 
	ls_mod = 'create text(band=foreground alignment="2" text="f" border="0" color="33554432" x="' + ls_x + '" y="'+ ls_y +'" height="60" width="55" name=' + ls_newfil + ' pointer="HyperLink!" visible="1"  font.face="bl-eclipseimg" font.height="-5" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" )' 
	ls_err = This.Modify( ls_mod )

	SetObjectColor( ls_newFil, 't' )
Next

is_ColFilterList[] = as_col[]
end subroutine

public subroutine colfilterreset ();/* colFilterReset() */

Integer	i, li_ub
String	ls_header, ls_fil[], ls_col
uo_dw_List	ldw_this


this.Filter( '' )

li_ub = UpperBound( this.is_colfilter[ ] )
For i = 1 To li_ub
	ls_col = this.is_colfilter[ i]
	ls_header = ls_col + '_t'
	This.SetObjectColor( { ls_header, ls_col + '_filter' }, 't' )
Next

this.is_colfilter[ ] = ls_fil[]
this.is_colfilterS[ ] = ls_fil[]

end subroutine

public function boolean readonlydw (boolean abreadonly);
//CVilela Abril/2025

Boolean	lbReadOnly
String	lsReadOnly

lsReadOnly = LowerTrim( String( This.Object.DataWindow.ReadOnly ) )
This.Object.DataWindow.ReadOnly = abReadOnly

lbReadOnly = ( lsReadOnly = 'yes' )

Return lbReadOnly 


end function

event rowfocuschanged;Long		ll_row, ll_filas

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

event clicked;/*	Autor		: César Vilela Requena
	Fecha		: 01/Agosto/1997
	Objetivo	: Ordenar una lista con la cabecera de la misma
	
	27/Feb/2024 Filter
*/
String	ls_name, ls_sort, ls_sortant
String	ls_r2, ls_r7


// Si Se busca Filtrar
If ib_filter Then
	If KeyDown( KeySpaceBar! ) Then Return
	ls_name = dwo.Name
	If Not dwo.Type = 'text' Then Return
	ls_r2 = Right(ls_name, 2)
	ls_r7 = Right(ls_name, 7)
	If Not ls_r2 = '_t' And Not ls_r7 = '_filter' Then Return
End If

If ( ib_filter And KeyDown( KeyAlt! ) ) Or ls_r7 = '_filter' Then
	If KeyDown( KeySpaceBar! ) Then Return
	ls_name = dwo.Name
	If Not dwo.Type = 'text' Then Return
	ls_r2 = Right(ls_name, 2)
	ls_r7 = Right(ls_name, 7)
	If Not ls_r2 = '_t' And Not ls_r7 = '_filter' Then Return
	If ls_r7 = '_filter' Then
		ls_name = Left(ls_name, Len(ls_name)- 7 ) + '_t'
		f_SetFilter( dwo.Type, ls_Name, This )
		Return
	End If
	
	f_SetFilter( dwo.Type, dwo.Name, This )
	Return
End If

// Si click en header para Ordenar por columnas
If ib_order Then
	If Not KeyDown( KeySpaceBar! ) Then
		If dwo.Type = "text" Then
			ls_name = dwo.Name
			If Right(ls_name, 2) <> '_t' Then 
				Return
			End If
						
			dwo.Border = '5'
			ls_name = Left(ls_name, Len(ls_name) - 2)
			If ls_name <> is_columna Then
				If is_colant <> is_columna And is_columna <> "" Then 
					is_colant = is_columna
					is_ordant = is_order
					ls_sortant = ", " + is_colant + is_ordant
				End If
				is_order		= ' A '
				is_columna	= ls_name 
			Else
				If is_order	= ' D ' Then
					is_order	= ' A '
				Else
					is_order	= ' D ' 
				End If
			End If
			ls_sort = is_columna + is_order + ls_sortant 
			This.SetSort( ls_sort )
			This.Sort()
			dwo.Border = '0'
			is_columna = ls_name
		End If
	End If
End If

If row > 0 Then 
	This.SetRow( row )
	This.ScrollToRow( row )
	gw_frame.SetMicroHelp( "Fila: " + String(row) + "/" + String(RowCount()))
End If

end event

event retrieveend;If rowcount >0 Then 
	SelectRow( 0, False)
	SelectRow( 1, ib_selectrow )
	SetFocus( )
End If

f_SetMHStatus( 1, "Filas Recuperadas: " + String(rowcount))
end event

event retrievestart;
f_SetMHStatus( 1, "Espere un momento...")
end event

event destructor;f_SetMHStatus( 1, "Listo")
end event

event constructor;String	ls_c1, ls_c2, ls_zebra, ls_select


If This.DataObject = '' Then Return

SetTransObject( SqlCa )

f_SetDWColor( This )
//is_HeaderColor Default 'm'
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
	This.Object.DataWindow.Detail.Transparency="40"
End If


This.Object.DataWindow.Header.Height = ii_HeadHeight
If ib_detHeight Then This.Object.DataWindow.Detail.Height = ii_detheight
This.Object.DataWindow.ShowBackColorOnXP = 'yes'

//CVilela 23/Feb/2024 - De imagen se pasa a text
If ib_search Then 
	CreateButtonSearch( ) 
	This.SetObjectColor( 'cb_search', '(RowCount() > 0)', {'o', 't'} )					
End If

If ib_ind Then f_CreateColumnIndicator( This, 'r_ind' )

end event

on uo_dw_list.create
end on

on uo_dw_list.destroy
end on

event rbuttondown;
If ib_ExportXls Then ExportExcel( )
end event

