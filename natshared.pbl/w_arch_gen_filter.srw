//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Popup de filtros para uo_dw_list class~r~n    Recomendación: Nivel Experto~r~n*/
forward
global type w_arch_gen_filter from wa_response
end type
type cb_quitar from uo_cbother within w_arch_gen_filter
end type
end forward

global type w_arch_gen_filter from wa_response
integer width = 1481
integer height = 1312
windowanimationstyle openanimation = centeranimation!
cb_quitar cb_quitar
end type
global w_arch_gen_filter w_arch_gen_filter

on w_arch_gen_filter.create
int iCurrent
call super::create
this.cb_quitar=create cb_quitar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_quitar
end on

on w_arch_gen_filter.destroy
call super::destroy
destroy(this.cb_quitar)
end on

event open;call super::open;
uo_DW_list		ldw_this
uo_DataStore	ldw_buffer
Boolean	lb_null = False
Long		i, j, ll_fnd, ll_fil
String	ls_dwoType, ls_name, ls_col, ls_colType, ls_val, ls_colAux, ls_valAux, ls_find, ls_text, ls_format


istr_parm = Message.PowerObjectparm

ls_dwoType	= istr_parm.s_cad[ 1]
ls_name		= istr_parm.s_cad[ 2]
ldw_this		= istr_parm.dw_dat[ 1]

If Not ls_dwoType = 'text' Then Return
If Not Right(ls_name, 2) = '_t' Then Return

ls_text = ldw_this.Describe( ls_name + '.Text' ) 
ls_col = Left( ls_name, ( Len( ls_name ) - 2 ) )
ls_colType = Lower( ldw_this.Describe( ls_col + '.ColType' ) )
ls_Format = ldw_this.Describe( ls_col + '.Format' )
ls_colAux = Left( ls_colType, 4)

This.Title = 'Filtro: ' + ls_text

dw_list.Modify( ls_col + '.Format = ' + ls_Format )

ll_fil = ldw_this.FilteredCount( )

ldw_buffer = Create uo_DataStore
ldw_buffer.DataObject = ldw_this.DataObject
If ll_fil > 0 Then
	ldw_this.RowsCopy( 1, ll_fil, Filter!, ldw_buffer, 1, Primary!)
End If

cb_quitar.Enabled = ( ll_fil > 0 )
lb_null = False

For i = 1 To ldw_this.RowCount( )
	
	Choose Case ls_colType
		Case 'char'
			ls_val = String( ldw_this.GetItemString( i, ls_col ))
		Case 'date'
			ls_val = String( ldw_this.GetItemDate( i, ls_col ))
		Case 'datetime'
			ls_val = String( ldw_this.GetItemDateTime( i, ls_col ))
		Case 'long', 'number', 'ulong'
			ls_val = String( ldw_this.GetItemNumber( i, ls_col ))
		Case 'decimal'
			ls_val = String( ldw_this.GetItemDecimal( i, ls_col ))
		Case Else
			Choose Case ls_colAux
				Case 'char'
					ls_val = String( ldw_this.GetItemString( i, ls_col ))
				Case 'deci' 
					ls_val = String( ldw_this.GetItemDecimal( i, ls_col ))
			End Choose
	End Choose
	
	If lb_null And IsNull( ls_val ) Then Continue
	
	ll_fnd = dw_list.Find( 'v_value_col = "' + ls_val + '"' )
	If ll_fnd > 0 Then Continue
	
	j = dw_list.InsertRow( 0 )
	
	dw_list.Object.c_check[ j] = f_If( ll_fil > 0, '1', '0' )
	dw_list.Object.v_value_col[ j] = ls_val
	dw_list.Object.v_nombre_col[ j] = ls_col
	dw_list.Object.v_text_col[ j] = ls_text
	
	If IsNull( ls_val ) Then lb_null = True
Next

dw_list.AcceptText( )

lb_null = False

For i = 1 To ldw_buffer.RowCount( )
	
	Choose Case ls_colType
		Case 'char'
			ls_val = String( ldw_buffer.GetItemString( i, ls_col ))
		Case 'date'
			ls_val = String( ldw_buffer.GetItemDate( i, ls_col ))
		Case 'datetime'
			ls_val = String( ldw_buffer.GetItemDateTime( i, ls_col ))
		Case 'long', 'number', 'ulong'
			ls_val = String( ldw_buffer.GetItemNumber( i, ls_col ))
		Case 'decimal'
			ls_val = String( ldw_buffer.GetItemDecimal( i, ls_col ))
		Case Else
			Choose Case ls_colAux
				Case 'char'
					ls_val = String( ldw_buffer.GetItemString( i, ls_col ))
				Case 'deci' 
					ls_val = String( ldw_buffer.GetItemDecimal( i, ls_col ))
			End Choose
	End Choose
	
	If lb_null And IsNull( ls_val ) Then Continue
	
	ll_fnd = dw_list.Find( 'v_value_col = "' + ls_val + '"' )
	If ll_fnd > 0 Then Continue
	
	j = dw_list.InsertRow( 0 )
	
	dw_list.Object.c_check[ j] = '0'
	dw_list.Object.v_value_col[ j] = ls_val
	dw_list.Object.v_nombre_col[ j] = ls_col
	dw_list.Object.v_text_col[ j] = ls_text
	
	If IsNull( ls_val ) Then lb_null = True
Next

dw_list.AcceptText( )

dw_list.SetSort( 'v_value_col Asc' )
dw_list.Sort( )

end event

type dw_list from wa_response`dw_list within w_arch_gen_filter
integer x = 41
integer y = 44
integer width = 1394
integer height = 976
string dataobject = "d_arch_gen_filter"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_selectrow = false
boolean ib_filter = false
end type

event dw_list::itemchanged;call super::itemchanged;
cb_aceptar.Enabled = True
end event

event dw_list::doubleclicked;call super::doubleclicked;
String	ls_chk


If row <= 0 Then Return

Choose Case dwo.Name
	Case 'v_value_col'
		cb_aceptar.Enabled = True
		
		ls_chk = f_Trim( This.Object.c_check[ row] )
		ls_chk = f_If( ls_chk = '1', '0', '1' )
		This.Object.c_check[ row] = ls_chk
		This.AcceptText( )
End Choose
end event

type dw_1 from wa_response`dw_1 within w_arch_gen_filter
integer height = 1056
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_filter
integer x = 1051
integer y = 1100
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_filter
integer x = 672
integer y = 1100
end type

event cb_aceptar::clicked;call super::clicked;
Boolean	lb_null = False
Long		i, ll_fnd
String	ls_val, ls_fil, ls_col
uo_DW_list		ldw_this


dw_list.AcceptText( )
ll_fnd = dw_list.Find( 'c_check = "1"' )

If Not ll_fnd > 0 Then Return
	
ls_col = dw_list.Object.v_nombre_col[ 1] 


For i = 1 To dw_list.RowCount( )
	
	If Not f_Trim( dw_list.Object.c_check[ i] ) = '1' Then Continue

	ls_val = dw_list.Object.v_value_col[ i] 
	If IsNull( ls_val ) Then 
		lb_null = True
		ls_val = ''
	Else
		ls_val = f_Trim( ls_val )
	End If
	ls_fil = ls_fil + '"' + ls_val + '", '
	
Next

ls_fil = Left( ls_fil, Len( ls_fil ) - 2 )
ls_fil = 'f_Trim( String( ' + ls_col + ' ) ) In ( ' + ls_fil + ' )'
//If lb_null Then ls_fil = ls_fil + ' Or ' + ls_col + ' Is Null '

ldw_this = istr_parm.dw_dat[ 1]


Boolean	lb_add = True
Int		li_ub
String	ls_header, ls_filS

li_ub = UpperBound( ldw_this.is_colfilter[] )

// Verificar Si ya existe en uso el filtro
For i = 1 To li_ub
	ls_header = ldw_this.is_colfilter[ i] 
	If ls_col = ls_header Then
		lb_add = False
		li_ub = i
		Exit
	End If
Next

// Agregar la columna si no existe para filtrar
If lb_add Then
	li_ub ++
	ldw_this.is_colfilter[ li_ub] = ls_col
End If
ldw_this.is_colfilterS[ li_ub] = ls_fil

// Acumular String de Filtros para luego Filtrar
li_ub = UpperBound( ldw_this.is_colfilter[] )

For i = 1 To li_ub
	ls_fil = ldw_this.is_colfilterS[ i] 
	ls_filS = ls_filS + ls_fil + f_If( Not i = li_ub, ' And ', '' )
Next

ldw_this.Filter( ls_filS )


ldw_this.SetFocus( )
ldw_this.SetColumn( ls_col )

If ldw_this.RowCount( ) > 0 Then
	ldw_this.SetRow( 1 )
	ldw_this.ScrollToRow( 1 )
End If

ls_header = ls_col + '_t'
f_SetObjectColor( ldw_this, ls_header, 'text', String( f_Gen_Color( 'blue' ) ) )

Close( Parent )

end event

type cb_quitar from uo_cbother within w_arch_gen_filter
integer x = 41
integer y = 1100
integer width = 425
integer taborder = 20
boolean bringtotop = true
string text = "Quitar Filtro"
end type

event clicked;call super::clicked;
Integer	i, li_ub
String	ls_header, ls_fil[]
uo_dw_List	ldw_this


ldw_this = istr_parm.dw_dat[ 1]
ldw_this.Filter( '' )

//ls_header = istr_parm.s_cad[ 2]
li_ub = UpperBound( ldw_this.is_colfilter[ ] )
For i = 1 To li_ub
	ls_header = ldw_this.is_colfilter[ i] + '_t'
	f_SetObjectColor( ldw_this, ls_header, 'text', String( f_Gen_Color( 't' ) ) )
Next

ldw_this.is_colfilter[ ] = ls_fil[]
ldw_this.is_colfilterS[ ] = ls_fil[]


Close( Parent )


end event

