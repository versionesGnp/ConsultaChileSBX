//objectcomments /* Autor: César Vilela~r~n    Función: BLClass Visual Edit -*/
forward
global type uo_dw_edit from datawindow
end type
end forward

global type uo_dw_edit from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event key pbm_dwnkey
event processenter pbm_dwnprocessenter
event setobjectcolor ( string as_obj,  string as_clr )
event adjust ( )
end type
global uo_dw_edit uo_dw_edit

type variables

Boolean ib_procenter = True, ib_ind = True


end variables

forward prototypes
public function integer columnscopy (long row, string columns[], datawindow dwtarget, long rowtarget)
public function integer setfocus (string ascol)
public subroutine setobjectcolor (string as_obj, string as_clr)
public subroutine setobjectcolora (string as_obj[], string as_clr)
public subroutine setobjectcolors (string as_obj, string as_condition, string as_clr[])
public subroutine setobjectcolor (string as_obj, string as_con, string as_clr[])
public subroutine colenabled (string as_col, boolean ab_enabled)
public subroutine colenabled (string as_col[], boolean ab_enabled)
public subroutine colenabled (string as_col[], string as_enabled)
public function integer previewadjust ()
public subroutine setdwpositiony (string as_obj[], integer ai_posy)
public subroutine setdwpositiony (integer ai_posy)
public subroutine setdwpositiony (integer ai_posy, string as_band)
public subroutine setobjectcolor (string as_obj[], string as_clr)
public function boolean readyforadd ()
public subroutine colenabled (boolean ab_enabled)
end prototypes

event processenter;

If ib_procenter Then 
	//If Not ReadyForAdd( ) Then 
	Send(Handle(this),256,9,Long(0,0))
End If
end event

event setobjectcolor(string as_obj, string as_clr);
// CVILELA 15-Dic-2022

This.SetObjectColor( as_obj, as_clr )




end event

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

public function integer setfocus (string ascol);
Integer	li_ret

SetColumn( asCol )
li_ret = SetFocus( )

Return li_ret
end function

public subroutine setobjectcolor (string as_obj, string as_clr);
// CVILELA 02-Sep-2021

f_SetObjectColor( This, as_obj, '', String( f_Gen_Color( as_clr ) ) )



end subroutine

public subroutine setobjectcolora (string as_obj[], string as_clr);
// CVILELA 15-Dic-2022

Integer	i

For i = 1 To UpperBound( as_obj[] )
	f_SetObjectColor( This, as_obj[ i], '', String( f_Gen_Color( as_clr ) ) )
Next


end subroutine

public subroutine setobjectcolors (string as_obj, string as_condition, string as_clr[]);
// CVILELA 06-Feb-2023

f_SetObjectColorS( This, as_obj, as_Condition, as_clr[] )



end subroutine

public subroutine setobjectcolor (string as_obj, string as_con, string as_clr[]);
// CVILELA 09-May-2023
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

public function integer previewadjust ();
Return 1
end function

public subroutine setdwpositiony (string as_obj[], integer ai_posy);
f_SetdwPositionYA( This, as_obj[], ai_posY )

end subroutine

public subroutine setdwpositiony (integer ai_posy);

f_SetDWPositionY( This, ai_posY )

end subroutine

public subroutine setdwpositiony (integer ai_posy, string as_band);

f_SetDWPositionYBand( This, ai_posY, as_Band )

end subroutine

public subroutine setobjectcolor (string as_obj[], string as_clr);
// CVILELA 19-Ene-2024

Integer	i

For i = 1 To UpperBound( as_obj[] )
	f_SetObjectColor( This, as_obj[ i], '', String( f_Gen_Color( as_clr ) ) )
Next


end subroutine

public function boolean readyforadd ();
Return False
end function

public subroutine colenabled (boolean ab_enabled);
f_DWEnabled( This, ab_enabled )
end subroutine

on uo_dw_edit.create
end on

on uo_dw_edit.destroy
end on

event constructor;
If This.DataObject = '' Then Return

SetTransObject( SqlCa )

f_SetDWColor( This )

This.Object.DataWindow.ShowBackColorOnXP = 'yes'
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

event itemerror;
Return 1
end event

