//objectcomments Autor: César Vilela R.~r~nFunción: consulta y edición de facores para cálculo de cuotas MultiProducto
forward
global type w_arch_mul_factor from w_gen_document_doc
end type
end forward

global type w_arch_mul_factor from w_gen_document_doc
integer width = 4777
integer height = 1900
string title = "Lista de Factores"
boolean ib_fulllist = true
boolean ib_cbnew = false
boolean ib_cbopen = false
boolean ib_cbdelete = false
boolean ib_cbprint = false
boolean ib_cbadd = false
boolean ib_cbshare = false
boolean ib_permitemod = true
boolean ib_new = true
end type
global w_arch_mul_factor w_arch_mul_factor

type variables

String	is_doc, is_dir
Dec		ii_IVA = 19
DataWindowChild	idwc_are

Boolean	ib_edit = True
end variables

forward prototypes
public function integer wf_new ()
public function boolean wf_readyforadd ()
public function integer wf_open ()
public function integer wf_config ()
public subroutine wf_add ()
public function boolean wf_savedocument ()
end prototypes

public function integer wf_new ();
ib_new = True
ib_saved = True

is_emp = gs_emp

dw_1.Reset( )
dw_list.Reset( )
dw_1.SetTransObject( SqlCa )
idwc_are.SetTransObject( Sqlca )

dw_1.InsertRow(0)
If Not is_DB = '' Then dw_1.Object.DB[ 1] = is_DB

DataWindowChild	ldwc_x


dw_1.GetChild( 'Base', ldwc_x )
ldwc_x.SetFilter( 'Base = "M"' )
dw_1.Object.Base[ 1] = 'M'

dw_1.SetFocus( )


Return 1


end function

public function boolean wf_readyforadd ();/* wf_ReadyForAdd( ) */

Boolean	lb_ready

lb_ready = ( dw_1.GetColumnName( ) = 'db' )

If lb_ready Then
	wf_Open( )
End If

Return lb_ready

end function

public function integer wf_open ();
String	ls_Base, ls_Moneda, ls_db, ls_nil


dw_1.AcceptText( )

ls_Base = UpperTrim( dw_1.Object.Base[ 1] )
ls_Moneda = UpperTrim( dw_1.Object.Moneda[ 1] )
ls_DB = UpperTrim( dw_1.Object.DB[ 1] )

SetNull( ls_nil ) ;

If ls_DB = '' Then
	blEclipse.Messagebox( Title, 'Debe Seleccionar DB para continuar.', Exclamation! )
	Return 0
End If

If ls_Base = '' Then ls_Base = ls_nil
If ls_Moneda = '' Then ls_Moneda = ls_nil


dw_list.SetRedraw( False )
dw_list.Retrieve( ls_Base, ls_Moneda, ls_DB )
dw_list.SetRedraw( True )
dw_list.SetFocus( )


Return 1
end function

public function integer wf_config ();
dw_list.GetChild( 'Area', idwc_are )
idwc_are.SetTransObject( Sqlca )

dw_list.SetObjectColor( 'Base', 'st')
dw_list.SetObjectColor( 'Moneda', 'Moneda = "1"', {'o', 'ba'})
dw_list.SetObjectColor( 'Estado_Vigencia', 'Estado_Vigencia = "V"', {'o', 't'})


dw_1.Object.l_separator.Visible = Ib_Edit
dw_1.Object.cb_add.Visible = Ib_Edit
This.dw_list.ib_ExportXLS = Ib_Edit

If Not Ib_Edit Then
	dw_list.Object.DataWindow.ReadOnly = True
	dw_list.Object.cb_add.Visible = False
	This.ib_cbExcel = False
	This.ib_cbSave = False
	dw_menu.Event Constructor()
End If

Return 1
end function

public subroutine wf_add ();
Long		row, rows
String	ls_DB, ls_base, ls_moneda


If Not Ib_Edit Then Return

dw_1.AcceptText( )

ls_DB = UpperTrim( dw_1.Object.DB[ 1] )
ls_Base = UpperTrim( dw_1.Object.Base[ 1] )
ls_Moneda = UpperTrim( dw_1.Object.Moneda[ 1] )

If dw_list.RowCount( ) <= 0 Then 
	wf_Open( )
End If

rows = dw_list.RowCount( )
If rows > 0 Then 
	ls_Base = UpperTrim( dw_list.Object.Base[ rows] )
	ls_Moneda = UpperTrim( dw_list.Object.Moneda[ rows] )
End If

row = dw_list.InsertRow( 0 )
dw_list.Object.Base[ row] = ls_Base
dw_list.Object.Moneda[ row] = ls_Moneda
dw_list.Object.estado_vigencia[ row] = 'V'
dw_list.Object.fecha_vigencia[ row] = TodayDT( )
dw_list.AcceptText( )
 

dw_list.SetFocus( row, 'Moneda' )



end subroutine

public function boolean wf_savedocument ();
DateTime	ld_fecha_vigencia
Dec	ln_nro_cuotas_inicial, ln_nro_cuotas_final, ln_dias_inicial, ln_dias_final, ln_factor, ln_factor_gasto_adm
Int	i
String	ls_DB, ls_base, ls_moneda, ls_estado_vigencia, &
			ls_col, ls_gen, ls_edo, ls_msg
			
dw_1.AcceptText( )
dw_list.AcceptText( )

ls_DB = dw_1.Object.DB[ 1]

If ls_DB = '' Then
	blEClipse.MessageBox( Title, 'Debe seleccionar la DB antes de continuar.', Exclamation! )
	Return False
End If

For i = 1 To dw_list.RowCount( )
	ls_base = UpperTrim( dw_list.Object.Base[ i] )
	If ls_base = '' Then Continue
	
	ls_Moneda = UpperTrim( dw_list.Object.Moneda[ i] )
	ls_estado_vigencia = UpperTrim( dw_list.Object.estado_vigencia[ i] )
	ld_fecha_vigencia = dw_list.Object.fecha_vigencia[ i] 
	
	ln_nro_cuotas_inicial	= f_Zero( dw_list.Object.nro_cuotas_inicial[ i] )
	ln_nro_cuotas_final		= f_Zero( dw_list.Object.nro_cuotas_final[ i] )
	ln_dias_inicial			= f_Zero( dw_list.Object.dias_inicial[ i] )
	ln_dias_final				= f_Zero( dw_list.Object.dias_final[ i] )
	ln_factor					= f_Zero( dw_list.Object.factor[ i] )
	ln_factor_gasto_adm		= f_Zero( dw_list.Object.factor_gasto_adm[ i] )
	
	If ls_msg = '' And ls_Base = '' Then
		ls_msg = 'Debe seleccionar Base.'
		ls_col = 'Base'
	End If
	If ls_msg = '' And ls_Moneda = '' Then
		ls_msg = 'Debe seleccionar Moneda.'
		ls_col = 'Moneda'
	End If
	If ls_msg = '' And ln_nro_cuotas_inicial <= 0 Then
		ls_msg = 'Debe ingresar Nro. Cuotas Inicial.'
		ls_col = 'nro_cuotas_inicial'
	End If
	If ls_msg = '' And ln_nro_cuotas_final <= 0 Then
		ls_msg = 'Debe ingresar Nro. Cuotas Final.'
		ls_col = 'nro_cuotas_final'
	End If
	If ls_msg = '' And ln_dias_inicial <= 0 Then
		ls_msg = 'Debe ingresar Días Inicial.'
		ls_col = 'dias_inicial'
	End If
	If ls_msg = '' And ln_dias_final <= 0 Then
		ls_msg = 'Debe ingresar Días Final.'
		ls_col = 'dias_final'
	End If
	If ls_msg = '' And Not f_IsDate( ld_fecha_vigencia ) Then
		ls_msg = 'Debe ingresar Fecha Vigencia'
		ls_col = 'fecha_vigencia'
	End If
	If ls_msg = '' And ls_estado_vigencia = '' Then
		ls_msg = 'Debe seleccionar Estado Vigencia.'
		ls_col = 'Estado_vigencia'
	End If
	
	If Not ls_msg = '' Then
		blEclipse.MessageBox( Title, ls_msg, Exclamation! )
		dw_list.SetFocus( i, ls_col )
		Return False
	End If
Next
	
If Not dw_list.Update( True ) = 1 Then
	RollBack Using SqlCa ;
	blEclipse.MessageBox( Title, 'Se presentó un error al guardar Lista de Factores.', Exclamation! )
	Return False
End If
	
Commit Using SqlCa ;
blEclipse.MessageBox( Title, 'Lista de Factores Guardada correctamente.' )
ib_saved = True

Return True

end function

on w_arch_mul_factor.create
call super::create
end on

on w_arch_mul_factor.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_factor
integer width = 5061
integer height = 652
string title = ""
string dataobject = "d_arch_mul_factor"
end type

event dw_1::buttonclicked;call super::buttonclicked;String	ls_cod

Choose Case dwo.Name	
	Case 'cb_consultar'
		wf_Open( )
				
	Case 'cb_add'
		wf_Add( )			
		
End Choose

end event

event dw_1::itemchanged;call super::itemchanged;
String	ls_emp, ls_cod, ls_nom


ib_saved = True
ls_emp = gs_emp

dw_list.Reset( )

Choose Case dwo.Name
		
	Case 'c_codigo_prv'
		
		data = f_Trim( data )
		If data = '' Then Return
		/*
		ls_cod = f_GenFormatPrv( ls_emp, data )
		ls_nom = f_GetGenerica( ls_cod, 'PRV' )
		If Not data = '' And ls_nom = '' Then
			data = f_GenBuscar( '@' + data, 'c_codigo_prv', 'PRV', This )
		Else
			data = ls_cod
		End If
		*/
		SetText( data )
		AcceptText( )
		
		If data = '' Then Return 1
		
		Return 2	
		
End Choose
end event

event dw_1::key;call super::key;String	ls_cod


If Not KeyDown( KeyF3! ) Then Return

Choose Case GetColumnName( )
	Case 'c_codigo_prv' 
		ls_cod = f_GenBuscar( '', GetColumnName( ), 'PRV', This )
		
		
End Choose

end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_factor
integer width = 5061
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_factor
boolean visible = true
integer x = 169
integer y = 628
integer width = 4462
integer height = 1072
string dataobject = "d_arch_mul_factor_Det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_filter = false
boolean ib_detselect = true
integer ii_detheight = 110
end type

event dw_list::rowfocuschanged;call super::rowfocuschanged;Return

Integer	li_par, row
String	ls_pro

row = CurrentRow

	li_par = Integer( This.Object.Cod_Parque[ row] )
	ls_pro = UpperTrim( This.Object.Cod_Producto[ row] )
		
	idwc_are.Retrieve( li_Par, ls_pro )
	
	If idwc_are.Rowcount( ) = 0 Then
		idwc_are.Insertrow( 0 )
	End If

	AcceptText( )
		

end event

event dw_list::buttonclicked;call super::buttonclicked;
Choose Case dwo.Name
	Case 'cb_add'

End Choose
end event

event dw_list::itemchanged;call super::itemchanged;
Integer	li_nil
String	ls_moneda, ls_base


SetNull( li_nil )

ib_saved = False

ls_base = UpperTrim( dw_list.Object.base[ row] )
ls_Moneda = UpperTrim( dw_list.Object.Moneda[ row] )
	
	
Choose Case dwo.Name
	Case 'nro_cuotas_inicial'
		This.Object.nro_cuotas_final[ row] = li_nil
		
	Case 'dias_inicial'
		This.Object.dias_final[ row] = li_nil
		
	Case 'dias_final'
		data = f_Trim( data )
		If data = '' Then Return

		Dec		ln_nro_cuotas_inicial, ln_nro_cuotas_final, ln_dias_inicial, ln_dias_final
		Long		ll_fnd
		String	ls_fnd
		
		ln_dias_final = Long( data )
		If ln_dias_final = 0 Then Return
		
		ln_nro_cuotas_inicial	= f_Zero( This.Object.nro_cuotas_inicial[ row] )
		ln_nro_cuotas_final		= f_Zero( This.Object.nro_cuotas_final[ row] )
		ln_dias_inicial			= f_Zero( This.Object.dias_inicial[ row] )
		
		ls_fnd = ' Base = "' + ls_base + '" And Moneda = "' + ls_Moneda + '" And ' + &
					' nro_cuotas_inicial = ' + String( ln_nro_cuotas_inicial ) + ' And nro_cuotas_final = ' + String( ln_nro_cuotas_final ) + ' And ' + &
					' dias_inicial = ' + String( ln_dias_inicial ) + ' And dias_final = ' + String( ln_dias_final ) + &
					' And Not GetRow() = ' + String( row )
					
		ll_fnd = This.Find( ls_fnd )
		If ll_fnd > 0 Then
			This.SelectRow( ll_fnd, True )
			blEclipse.Messagebox( Title, 'Rango de Cuotas y de días ya ha sido especificado para la moneda seleccionada.', Exclamation! )
			This.SelectRow( ll_fnd, False )
			This.Object.dias_final[ row] = li_nil
			Return 1
		End If
		
End Choose
end event

event dw_list::error;call super::error;
Return 
end event

event dw_list::itemerror;call super::itemerror;
Return 1
end event

event dw_list::constructor;call super::constructor;
This.Title = Parent.Title
This.ii_Maxwidth = This.Width
end event

