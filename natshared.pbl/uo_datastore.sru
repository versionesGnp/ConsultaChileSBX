//objectcomments /* Autor: César Vilela~r~n    Función: BLClass DataStore para Eclipse~r~n    Recomendación: NO MODIFICAR - EXPERTO~r~n*/
forward
global type uo_datastore from datastore
end type
end forward

global type uo_datastore from datastore
end type
global uo_datastore uo_datastore

type variables
s_parm	istr_parm
Boolean	ib_mod = False, ib_PDF = False
String	is_sql, is_errText
end variables

forward prototypes
public function integer filter (string asfilter)
public function long find (string asfind)
public function long rowscopy (datastore targetds)
public function long rowscopy (datawindow targetdw)
public function integer sort (string assort)
public function integer columnscopy (long row, string columns[], datawindow dwtarget, long rowtarget)
public function integer columnscopy (long row, string columns[], datastore dstarget, long rowtarget)
end prototypes

public function integer filter (string asfilter);
Integer	li_ret

li_ret = SetFilter( asFilter )
li_ret = Filter( )

Return li_ret

end function

public function long find (string asfind);
Long	ll_ret

ll_ret = Find( asFind, 1, RowCount( ) )

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

public function long rowscopy (datawindow targetdw);

Long		ll_ret
String	ls_class

ls_class = Lower( ClassName( targetDW ) )
ll_ret = This.RowCount( )

This.RowsCopy( 1, ll_ret, Primary!, targetDW, 1, Primary! )
ll_ret = targetDW.RowCount( )	

Return ll_ret
end function

public function integer sort (string assort);
Integer	li_ret

SetSort( asSort )
li_ret = Sort( )

Return li_ret

end function

public function integer columnscopy (long row, string columns[], datawindow dwtarget, long rowtarget);DateTime	ld_data
Double	ln_data
Integer	i
String	ls_colType, ls_colAux, ls_col, ls_data

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
			ld_data = This.GetItemDateTime( row, ls_col )
			dwTarget.SetItem( rowTarget, ls_col, ld_data )
			
		Case 'long', 'number', 'ulong'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemNumber( row, ls_col ) )
			
		Case 'decimal'
			dwTarget.SetItem( rowTarget, ls_col, This.GetItemDecimal( row, ls_col ) )
			
		Case Else
			Choose Case ls_colAux
				Case 'char'
					ls_data = This.GetItemString( row, ls_col )
					dwTarget.SetItem( rowTarget, ls_col, ls_data )
				Case 'deci' 
					ln_data = This.GetItemDecimal( row, ls_col )
					dwTarget.SetItem( rowTarget, ls_col, ln_data )
			End Choose
	End Choose

Next

Return i
end function

public function integer columnscopy (long row, string columns[], datastore dstarget, long rowtarget);DateTime	ld_data
Double	ln_data
Integer	i
String	ls_colType, ls_colAux, ls_col, ls_data

For i = 1 To UpperBound( columns[] )
	ls_col = Columns[ i]
	ls_colType 	= f_Trim( This.Describe( ls_col + '.ColType' ) )	//Tipo de Columna
	ls_colAux = Left( ls_colType, 4)

	Choose Case ls_colType
		Case 'char'
			dsTarget.SetItem( rowTarget, ls_col, This.GetItemString( row, ls_col ) )
			
		Case 'date'
			dsTarget.SetItem( rowTarget, ls_col, This.GetItemDate( row, ls_col ) )
			
		Case 'datetime'
			ld_data = This.GetItemDateTime( row, ls_col )
			dsTarget.SetItem( rowTarget, ls_col, ld_data )
			
		Case 'long', 'number', 'ulong'
			dsTarget.SetItem( rowTarget, ls_col, This.GetItemNumber( row, ls_col ) )
			
		Case 'decimal'
			dsTarget.SetItem( rowTarget, ls_col, This.GetItemDecimal( row, ls_col ) )
			
		Case Else
			Choose Case ls_colAux
				Case 'char'
					ls_data = This.GetItemString( row, ls_col )
					dsTarget.SetItem( rowTarget, ls_col, ls_data )
				Case 'deci' 
					ln_data = This.GetItemDecimal( row, ls_col )
					dsTarget.SetItem( rowTarget, ls_col, ln_data )
			End Choose
	End Choose

Next

Return i
end function

event dberror;s_parm	lstr_parm


lstr_parm.s_cad[1] = SqlCa.DataBase
lstr_parm.s_cad[2] = DataObject
lstr_parm.s_cad[3] = String( SqlDBCode )
lstr_parm.s_cad[4] = SqlErrText + '~r~n~r~nSQL Syntax: ' + sqlsyntax
is_errText = lstr_parm.s_cad[4]
istr_parm = lstr_parm

RollBack ;
//OpenWithParm( w_sqlerror, lstr_parm )

end event

on uo_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;

istr_parm.s_cad[1] = ''
istr_parm.s_cad[2] = ''
istr_parm.s_cad[3] = ''
istr_parm.s_cad[4] = ''
end event

event sqlpreview;
If ib_mod Then
	is_sql = sqlSyntax
	SetSqlPreview( is_sql )
End If
end event

event error;
is_errText = f_Trim( is_errText )
If Not is_errText = '' Then is_errText = is_errText + Char(13)

is_errText = is_errText + errorText 
is_errText = is_errText + f_If( errorObject = '', '', Char(13) + errorObject ) + f_If( errorScript = '', '', Char(13) + errorScript ) 
end event

event itemerror;
is_errtext = dwo.Name + ' Data: ' + String( data )
end event

event retrieveend;
Int		li_rc
String	ls_File, ls_path

If Not ib_pdf Then Return

ls_file = This.Describe( 'DataWindow.Print.DocumentName' ) + '.PDF'
ls_path = ls_File
li_rc = GetFileSaveName ( 'Selección de Archivo', ls_path, ls_file, "PDF", &
		   "Archivos (*.PDF),*.PDF" , "Documentos", 32770)
 
If Not li_rc = 1 Then Return 

Long		ll_zoom
String	ls_pag

ls_pag = f_Trim( String( This.Describe("Evaluate('PageCountAcross( )', 1)") ) )

f_GenProcesando( 'Ajustando Página...' )

Do While Integer( ls_pag ) > 1 
	ll_zoom = Long( This.Object.Datawindow.Zoom )
	This.object.Datawindow.Zoom = ll_zoom - 1

	ls_pag = f_Trim( String( This.Describe("Evaluate('PageCountAcross( )', 1)") ) )
	gw_frame.SetMicroHelp( 'Reducción: ' + String( ll_zoom ) )

Loop 

f_GenProcesando( 'Generando Archivo...' )
SaveAs( ls_Path, PDF!, False )
f_GenProcesando( '' )
gw_frame.SetMicroHelp( 'Listo' )

Return rowcount
end event

