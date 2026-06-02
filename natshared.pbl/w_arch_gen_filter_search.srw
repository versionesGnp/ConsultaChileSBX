//objectcomments /* Autor: Cesar Vilela ~r~n    Función: BLClass Visual - Filtro y buscares para uo_dw_list class~r~n    Recomendación: Consultar Experto~r~n*/
forward
global type w_arch_gen_filter_search from wa_response
end type
type cb_quitar from uo_cbother within w_arch_gen_filter_search
end type
end forward

global type w_arch_gen_filter_search from wa_response
integer width = 2377
integer height = 1312
windowanimationstyle openanimation = centeranimation!
boolean ib_posy = true
boolean ib_ind = true
cb_quitar cb_quitar
end type
global w_arch_gen_filter_search w_arch_gen_filter_search

on w_arch_gen_filter_search.create
int iCurrent
call super::create
this.cb_quitar=create cb_quitar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_quitar
end on

on w_arch_gen_filter_search.destroy
call super::destroy
destroy(this.cb_quitar)
end on

event open;call super::open;
uo_DW_list		ldw_this
uo_DataStore	ldw_buffer
Boolean	lb_null = False
Long		i, j, ll_fnd, ll_fil
String	ls_dwoType, ls_name, ls_col, ls_colType, ls_val, ls_exa, ls_colAux, ls_valAux, ls_find, ls_text, ls_format


istr_parm = Message.PowerObjectparm

ldw_this	= istr_parm.dw_dat[ 1]
ls_exa	= ldw_this.is_colSExact

This.Title = 'Filtro y Búsqueda ' 
dw_list.SetObjectColor( 'v_value_col', 'o' )
dw_list.SetObjectColor( 'c_exact', f_If( ls_exa = '1', 'o', 'ba' ) )

For i = 1 To UpperBound( istr_parm.s_cad[ ] )
	ls_col  = istr_parm.s_cad[ i]
	ls_name = ls_col + '_t' 
	ls_text = ldw_this.Describe( ls_name + '.Text' ) 
	ls_colType = Lower( ldw_this.Describe( ls_col + '.ColType' ) )
	ls_Format = ldw_this.Describe( ls_col + '.Format' )
	ls_colAux = Left( ls_colType, 4)

	j = dw_list.InsertRow(0)
	dw_list.Object.v_nombre_col[ j] = ls_col
	dw_list.Object.v_text_col[ j] = ls_text
	dw_list.Object.v_colType_col[ j] = ls_colType
	dw_list.Object.c_exact[ j] = ls_exa
	
	For j = 1 To UpperBound( ldw_this.is_colSearch[ ] )
		If Not ls_col = ldw_this.is_colSearch[ j] Then Continue
		dw_list.Object.c_check[ i] = '1'
		dw_list.Object.v_value_col[ i] = ldw_this.is_colSearchS[ j] 
	Next
	
Next


end event

type dw_list from wa_response`dw_list within w_arch_gen_filter_search
integer x = 41
integer y = 44
integer width = 2258
integer height = 976
string dataobject = "d_arch_gen_filter_search"
boolean hscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_order = false
boolean ib_filter = false
integer ii_detheight = 110
end type

event dw_list::itemchanged;call super::itemchanged;
dw_list.Object.c_check[ row] = f_If( f_Trim( data ) = '', '0', '1' )

cb_aceptar.Enabled = True
end event

event dw_list::constructor;call super::constructor;f_CreateColumnIndicator( This, '' )

end event

event dw_list::itemfocuschanged;call super::itemfocuschanged;
MoveIndicator( dwo )
end event

event dw_list::editchanged;call super::editchanged;
dw_list.Object.c_check[ row] = f_If( f_Trim( data ) = '', '0', '1' )

If Not cb_aceptar.Enabled Then cb_aceptar.Enabled = True
end event

event dw_list::clicked;call super::clicked;
Long		ll_rows, i
String	ls_exa


ll_rows = RowCount( )

Choose Case dwo.Name
	Case 'c_exact'
		ls_exa = This.Object.c_exact[ ll_rows]
		
		ls_exa = f_If( ls_exa = '1', '0', '1' )
		dw_list.SetObjectColor( 'c_exact', f_If( ls_exa = '1', 'o', 'ba' ) )
		
		For i = 1 To ll_rows
			This.Object.c_exact[ i] = ls_exa
		Next
		
		This.AcceptText( )
		cb_aceptar.Enabled = True
End Choose
end event

type dw_1 from wa_response`dw_1 within w_arch_gen_filter_search
integer height = 1056
end type

type cb_cancelar from wa_response`cb_cancelar within w_arch_gen_filter_search
integer x = 1911
integer y = 1100
end type

type cb_aceptar from wa_response`cb_aceptar within w_arch_gen_filter_search
integer x = 1531
integer y = 1100
end type

event cb_aceptar::clicked;call super::clicked;
Boolean	lb_null = False
Long		i, ll_fnd, ll_rows, j
String	ls_val, ls_fil, ls_col, ls_exa, ls_aux
uo_DW_list		ldw_this


dw_list.AcceptText( )
ll_fnd = dw_list.Find( 'c_check = "1"' )

If Not ll_fnd > 0 Then Return

ll_rows = dw_list.RowCount( )
ls_exa = dw_list.Object.c_exact[ ll_rows]

ldw_this = istr_parm.dw_dat[ 1]
ldw_this.ColSearchReset( False )
		
For i = 1 To ll_rows
	
	If Not f_Trim( dw_list.Object.c_check[ i] ) = '1' Then Continue

	ls_col = dw_list.Object.v_nombre_col[ i] 
	ls_val = dw_list.Object.v_value_col[ i] 
	If IsNull( ls_val ) Then 
		lb_null = True
		ls_val = ''
	Else
		ls_val = UpperTrim( ls_val ) 
	End If
	ls_aux = ' ' + f_If( ls_exa = '1', ' = "' + ls_val + '"', ' Like "%' + ls_val + '%"' )
	ls_fil = ls_fil + '( UpperTrim( ' + ls_col + ' ) ' + ls_aux + ' ) And '
	j ++
	ldw_this.is_colSearch[ j] = ls_col
	ldw_this.is_colSearchS[ j] = ls_val
Next

ls_fil = Left( ls_fil, Len( ls_fil ) - 4 )

String	ls_header

For i = 1 To UpperBound( ldw_this.is_colSearch[ ] ) 
	ls_header = ldw_this.is_colSearch[ i] + '_t'
	ldw_this.SetObjectColor( ls_header, 'blue' )
Next

ldw_this.Filter( ls_fil )
ldw_this.is_colsexact = ls_exa

Close( Parent )

end event

type cb_quitar from uo_cbother within w_arch_gen_filter_search
integer x = 41
integer y = 1100
integer width = 425
integer taborder = 20
boolean bringtotop = true
string text = "Quitar Filtro"
end type

event clicked;call super::clicked;
uo_DW_list		ldw_this

ldw_this = istr_parm.dw_dat[ 1]
ldw_this.ColSearchReset( True )

Close( Parent )


end event

