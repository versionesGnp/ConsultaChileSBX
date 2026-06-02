//objectcomments Autor: César Vilela R.~r~nFunción: consulta y edición de la lista de precios MultiProducto
forward
global type w_arch_mul_preciolista from w_gen_document_doc
end type
end forward

global type w_arch_mul_preciolista from w_gen_document_doc
integer width = 6656
integer height = 1900
string title = "Lista de Precios"
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
global w_arch_mul_preciolista w_arch_mul_preciolista

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
public function integer wf_calcmp (integer row)
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
Int		li_nil, li_cmp
String	ls_db, ls_nil


dw_1.AcceptText( )

ls_DB = UpperTrim( dw_1.Object.DB[ 1] )
li_cmp = f_Zero( dw_1.Object.CodigoMP[ 1] )

SetNull( li_nil ) ; SetNull( ls_nil ) ;

If ls_DB = '' Then
	blEclipse.Messagebox( Title, 'Debe Seleccionar DB para continuar.', Exclamation! )
	Return 0
End If

If li_cmp = 0 Then li_cmp = li_nil

f_GenProcesando( 'Generando Consulta, Espere...' )

dw_list.SetRedraw( False )

dw_list.Retrieve( li_cmp, ls_nil, 'LIST', ls_DB )

dw_list.SetRedraw( True )
dw_list.SetFocus( )
f_GenProcesando( '' )

Return 1
end function

public function integer wf_config ();
DataWindowChild	ldwc_x

dw_1.GetChild( 'CodigoMP', ldwc_x )

ldwc_x.SetTransObject( SqlCa )
ldwc_x.Retrieve( )
ldwc_x.InsertRow( 1 )
ldwc_x.SetItem( 1, 'NombreMP', ' - Todos -')
ldwc_x.AcceptText( )

dw_list.GetChild( 'Area', idwc_are )
idwc_are.SetTransObject( Sqlca )

dw_list.SetObjectColor( 'Codigo', 'Grupo = 1', {'o', 't'})
dw_list.SetObjectColor( 'Descripcion', 'Grupo = 1', {'o', 't'})
dw_list.SetObjectColor( 'Total', 'Grupo = 1', {'o', 't'})
dw_list.SetObjectColor( 'Tipo_Producto', 'Grupo = 1', {'st', 't'})
dw_list.SetObjectColor( 'del_t', 'bx' )


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
Boolean	lb_gencod
Integer	li_gru, li_cod
Long		row
String	ls_DB


If Not Ib_Edit Then Return

dw_1.AcceptText( )

ls_DB = UpperTrim( dw_1.Object.DB[ 1] )
li_gru = 1
SetNull( li_cod )

If dw_list.RowCount( ) <= 0 Then 
	wf_Open( )
End If

If dw_list.RowCount( ) > 0 Then 
	li_cod = f_Zero( dw_list.Object.NewCod[ dw_list.RowCount( )])
Else
	li_cod = 1
End If

lb_gencod = True

row = dw_list.InsertRow( 0 )
dw_list.Object.DB[ row] = ls_DB
dw_list.Object.CodigoMP[ row] = li_cod
dw_list.Object.Codigo[ row] = String( li_cod )
dw_list.Object.Descripcion[ row] = 'MP ' + String( li_cod )
dw_list.Object.estadoReg[ row] = '1'
dw_list.Object.usuCreacion[ row] = gs_usuario
dw_list.Object.fCreacion[ row] = TodayDT( )
dw_list.AcceptText( )
 

dw_list.SetFocus( row, 'Codigo' )



end subroutine

public function integer wf_calcmp (integer row);
Dec	ldc_pre, ldc_iva, ldc_pie, ldc_tot
Int	li_cod, li_cMP, i, li_gru, j

dw_list.AcceptText( )
li_cod = dw_list.Object.CodigoMP[ row]
		
For i = 1 To dw_list.RowCount( )
	li_cMP = dw_list.Object.CodigoMP[ i]
	li_gru = dw_list.Object.Grupo[ i]
	If Not ( li_cMP = li_cod And li_Gru = 2 ) Then
		Continue
	End If
	
	ldc_pre = f_Zero( dw_list.Object.Precio[ i] ) + ldc_pre
	ldc_iva = f_Zero( dw_list.Object.IVA[ i] ) + ldc_iva
	ldc_pie = f_Zero( dw_list.Object.Pie[ i] ) + ldc_pie
	dw_list.Object.Total[ i] = f_Zero( dw_list.Object.Precio[ i] ) + &
										f_Zero( dw_list.Object.IVA[ i] )
	dw_list.AcceptText( )
	ldc_tot = f_Zero( dw_list.Object.Total[ i] ) + ldc_tot
Next

Integer	li_fnd
String	ls_fnd

ls_fnd = 'CodigoMP = ' + String( li_cod ) + ' And Grupo = 1 '
li_fnd = dw_list.Find( ls_fnd )

If Not li_fnd > 0 Then
	Return li_fnd
End If

ldc_tot = ldc_pre + ldc_iva
dw_list.Object.Precio[ li_fnd] = ldc_pre
dw_list.Object.IVA[ li_fnd] = ldc_iva
dw_list.Object.Pie[ li_fnd] = ldc_pie
dw_list.Object.Total[ li_fnd] = ldc_tot
dw_list.AcceptText( )


// PorcentajePie
Dec		ldc_por, ldc_precio 
Integer	li_mp

li_mp = f_Zero( dw_list.Object.CodigoMP[ row] )
ls_fnd = 'CodigoMP = ' + String( li_cod ) + ' And Grupo = 1 '
li_fnd = dw_list.Find( ls_fnd )
		
If Not li_fnd > 0 Then
	Return li_fnd
End If
ldc_por = f_Zero( Dec(dw_list.Object.PorcentajePie[ li_fnd]) )

For i = 1 To dw_list.RowCount( )
	If Not li_mp = f_Zero( dw_list.Object.CodigoMP[ i] ) Then Continue
	
	ldc_precio = f_Zero( dw_list.Object.Precio[ i] )
	dw_list.Object.PorcentajePie[ i] = ldc_por
	dw_list.Object.Pie[ i] = ldc_precio * ( ldc_por / 100 )
	//wf_CalcMP( row )
Next
		
dw_list.AcceptText( )

Return li_fnd

end function

public function boolean wf_savedocument ();

Dec	ldc_pre, ldc_iva, ldc_pie, ldc_tot, ldc_cap, ldc_lib, ldc_rdc, ldc_vcm, ldc_der, ldc_por
Int	li_cod, li_cMP, i, li_gru, li_pro, li_par, li_ret
String	ls_DB, ls_cod, ls_des, ls_pro, ls_are, ls_uso, ls_sep, ls_con, ls_reg, ls_opc, ls_srv, &
			ls_col, ls_gen, ls_edo, ls_msg
			
dw_1.AcceptText( )
dw_list.AcceptText( )

ls_DB = dw_1.Object.DB[ 1]

For i = 1 To dw_list.RowCount( )
	ls_cod = UpperTrim( dw_list.Object.Codigo[ i] )
	If ls_cod = '' Then Continue
	
	li_cMP = dw_list.Object.CodigoMP[ i]
	li_gru = dw_list.Object.Grupo[ i]
	ls_des = UpperTrim( dw_list.Object.Descripcion[ i] )
	If li_gru = 1 Then ls_opc = 'CAB'
	If li_gru = 2 Then ls_opc = 'DET'
	
	ldc_pre = f_Zero( dw_list.Object.Precio[ i] ) 
	ldc_iva = f_Zero( dw_list.Object.IVA[ i] ) 
	ldc_por = f_Zero( dw_list.Object.PorcentajePie[ i] )
	ldc_pie = f_Zero( dw_list.Object.Pie[ i] )
	ldc_tot = ldc_pre + ldc_iva

	li_par = f_Zero( dw_list.Object.Cod_Parque[ i] ) 
	ls_pro = f_Trim( dw_list.Object.Cod_Producto[ i] ) 
	ls_uso = f_Trim( dw_list.Object.Uso[ i] ) 
	li_pro = f_Zero( dw_list.Object.tipo_producto[ i] ) 
	ls_Are = f_Trim( dw_list.Object.Area[ i] ) 
	ldc_cap = f_Zero( dw_list.Object.Capacidad[ i] ) 
	ls_sep = f_Trim( dw_list.Object.tipo_sepult[ i] ) 
	ls_con = f_Trim( dw_list.Object.tipo_construccion[ i] ) 
	ls_reg = f_Trim( dw_list.Object.estadoReg[ i] ) 
	ls_srv = f_Trim( dw_list.Object.SerieServicio[ i] ) 
	
	ldc_lib = f_Zero( dw_list.Object.Anios_liberar[ i] ) 
	ldc_rdc = f_Zero( dw_list.Object.Reduccion[ i] ) 
	ldc_vcm = f_Zero( dw_list.Object.Valor_cuota_mant[ i] ) 
	
	Choose Case ls_opc
		Case 'CAB'
			If ls_msg = '' And ls_des = '' Then
				ls_msg = 'Debe ingresar el nombre del MultiProducto.'
				ls_col = 'Descripcion'
			End If
			If ls_msg = '' And ( ldc_por < 0 Or ldc_por > 100 ) Then
				ls_msg = 'Debe ingresar una cantidad correcta para Porcentaje Pie.'
				ls_col = 'PorcentajePie'
			End If
			If ls_msg = '' And li_par = 0 Then
				ls_msg = 'Debe seleccionar el Parque.'
				ls_col = 'Cod_Parque'
			End If
			If ls_msg = '' And ls_pro = '' Then
				ls_msg = 'Debe seleccionar Producto.'
				ls_col = 'Uso'
			End If
			If ls_msg = '' And ls_uso = '' Then
				ls_msg = 'Debe seleccionar el Uso.'
				ls_col = 'Uso'
			End If
			If ls_msg = '' And li_pro = 0 Then
				ls_msg = 'Debe seleccionar el Iipo Producto.'
				ls_col = 'tipo_producto'
			End If
			If ls_msg = '' And ls_are = '' Then
				//ls_msg = 'Debe seleccionar el Área.'
				ls_col = 'Area'
			End If
			If ls_msg = '' And li_pro = 0 Then
				ls_msg = 'Debe ingresar la Capacidad.'
				ls_col = 'Capacidad'
			End If
			If ls_msg = '' And ls_sep = '' Then
				ls_msg = 'Debe seleccionar el Tipo de Sepultura.'
				ls_col = 'tipo_sepult'
			End If
			If ls_msg = '' And ls_sep = '' Then
				ls_msg = 'Debe seleccionar el Tipo de Construcción.'
				ls_col = 'tipo_construccion'
			End If

			If Not ls_msg = '' Then
				blEclipse.MessageBox( Title, ls_msg, Exclamation! )
				dw_list.SetFocus( i, ls_col )
				Return False
			End If

		Case 'DET'
			If ls_msg = '' And ( ls_cod = '' Or ls_des = '' ) Then
				ls_msg = 'Debe ingresar o Seleccionar un Código Base válido para Contrato hijo del MultiProducto.'
				ls_col = 'Descripcion'
			End If
			If ls_msg = '' And ldc_pre <= 0 Then
				ls_msg = 'Debe ingresar el precio correctamente.'
				ls_col = 'Precio'
			End If
			If ls_msg = '' And ldc_iva < 0 Then
				ls_msg = 'Debe ingresar el IVA correctamente.'
				ls_col = 'IVA'
			End If
			If ls_msg = '' And ldc_Pie < 0 Then
				ls_msg = 'Debe ingresar el Pie correctamente.'
				ls_col = 'Pie'
			End If
			If ls_msg = '' And ldc_tot <= 0 Then
				ls_msg = 'El total para este producto debe ser mayor a cero.'
				ls_col = 'Total'
			End If
			
			If ls_reg = '0' Then ls_msg = '' 
			
			If Not ls_msg = '' Then
				blEclipse.MessageBox( Title, ls_msg, Exclamation! )
				dw_list.SetFocus( i, ls_col )
				Return False
			End If

	End Choose
Next
	

For i = 1 To dw_list.RowCount( )
	ls_cod = UpperTrim( dw_list.Object.Codigo[ i] )
	If ls_cod = '' Then Continue
	
	li_cMP = dw_list.Object.CodigoMP[ i]
	li_gru = dw_list.Object.Grupo[ i]
	ls_des = UpperTrim( dw_list.Object.Descripcion[ i] )
	If li_gru = 1 Then ls_opc = 'CAB'
	If li_gru = 2 Then ls_opc = 'DET'
	
	ldc_pre = f_Zero( dw_list.Object.Precio[ i] ) 
	ldc_iva = f_Zero( dw_list.Object.IVA[ i] )	
	ldc_por = f_Zero( dw_list.Object.PorcentajePie[ i] )
	ldc_pie = f_Zero( dw_list.Object.Pie[ i] )
	ldc_tot = ldc_pre + ldc_iva

	li_par = f_Zero( dw_list.Object.Cod_Parque[ i] ) 
	ls_pro = f_Trim( dw_list.Object.Cod_Producto[ i] ) 
	ls_uso = f_Trim( dw_list.Object.Uso[ i] ) 
	li_pro = f_Zero( dw_list.Object.tipo_producto[ i] ) 
	ls_Are = f_Trim( dw_list.Object.Area[ i] ) 
	ldc_cap = f_Zero( dw_list.Object.Capacidad[ i] ) 
	ls_sep = f_Trim( dw_list.Object.tipo_sepult[ i] ) 
	ls_con = f_Trim( dw_list.Object.tipo_construccion[ i] ) 
	ls_reg = f_Trim( dw_list.Object.estadoReg[ i] ) 
	
	ldc_lib = f_Zero( dw_list.Object.Anios_liberar[ i] ) 
	ldc_rdc = f_Zero( dw_list.Object.Reduccion[ i] ) 
	ldc_vcm = f_Zero( dw_list.Object.Valor_cuota_mant[ i] ) 
	ldc_der = f_Zero( dw_list.Object.Derecho[ i] ) 
	
	ls_srv = dw_list.Object.SerieServicio[ i] 
	
	Choose Case ls_DB
		Case 'PRADO'
			uo_DataStore lds_gen
			
			Destroy	lds_gen
			lds_gen = Create uo_DataStore
			lds_gen.DataObject = 'd_arch_mul_preciolista_Save'
			lds_gen.SetTransObject( SqlCa )
						
			li_ret = lds_gen.Retrieve( li_cMP, ls_des, ls_cod, ldc_pre, ldc_iva, ldc_por, ldc_pie, ldc_tot, &
												li_par, ls_pro, ls_uso, li_pro, ls_are, ldc_cap, ls_sep, ls_con, ldc_lib, ldc_rdc, ldc_vcm, ldc_der, &
												ls_reg, ls_srv, gs_usuario, ls_opc, ls_DB )
			If li_ret > 0 Then
				ls_gen = f_Trim( lds_gen.Object.CodigoGenerado[ 1] )
				ls_edo = f_Trim( lds_gen.Object.Estado[ 1] )
				ls_msg = f_Trim( lds_gen.Object.MensajeResultado[ 1] )
			Else
				ls_gen = '-2'
				ls_edo = 'ERR'
				ls_msg = lds_gen.is_ErrText
				If ls_msg = '' Then
					ls_msg = 'Error no determinado, es posible una incompatibilidad entre lo enviado y recibido por el servidor.'
				End If
			End If
			
			If ls_edo = 'ERR' Or ls_edo = 'ERC' Then
				//dw_list.Object.Estado[ i] = ls_edo
				//dw_list.Object.MensajeResultado[ i] = ls_msg
				RollBack Using SqlCa ;
				blEclipse.MessageBox( Title, ls_msg, StopSign! )
				Return False
			End If
			
			If Not ls_gen = '' Then
				Commit Using SqlCa ;
			End If
	End Choose
Next

If ls_edo = 'OK' Then
	wf_Open( )
	blEclipse.MessageBox( Title, 'Lista de Precios Guardada correctamente.' )
End If
ib_saved = True

Return True

end function

on w_arch_mul_preciolista.create
call super::create
end on

on w_arch_mul_preciolista.destroy
call super::destroy
end on

type dw_1 from w_gen_document_doc`dw_1 within w_arch_mul_preciolista
integer width = 5061
integer height = 652
string title = ""
string dataobject = "d_arch_mul_preciolista"
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

type dw_menu from w_gen_document_doc`dw_menu within w_arch_mul_preciolista
integer width = 5061
string dataobject = "d_gen_menu_toolbar_save"
end type

type dw_list from w_gen_document_doc`dw_list within w_arch_mul_preciolista
boolean visible = true
integer x = 169
integer y = 628
integer width = 6405
integer height = 1072
string dataobject = "d_arch_mul_preciolista_Det"
boolean border = false
boolean ib_detzebra = false
boolean ib_selectrow = false
boolean ib_filter = false
boolean ib_detselect = true
integer ii_detheight = 110
end type

event dw_list::rowfocuschanged;call super::rowfocuschanged;

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
		Integer	li_cod, i, li_cMP, j
		String	ls_nom
		
		This.AcceptText( )
		ScrollToRow( row )
		ls_nom = This.Object.Descripcion[ row]
		li_cod = This.Object.CodigoMP[ row]
		
		For i = row To dw_list.RowCount( )
			li_cMP = This.Object.CodigoMP[ i]
			If li_cMP = li_cod Then
				j ++
			End If
		Next
		i = This.InsertRow(row + j)
		This.Object.Grupo[ i] = 2
		This.Object.CodigoMP[ i] = li_cod
		This.Object.NombreMP[ i] = ls_nom
		This.Object.PorcentajePie[ i] = This.Object.PorcentajePie[ row] 
		This.SetFocus( i, 'Codigo' )

	Case 'cb_del'
		This.AcceptText( )
		ScrollToRow( row )
		This.Object.EstadoReg[ row] = '0'
		ib_saved = False
End Choose
end event

event dw_list::itemchanged;call super::itemchanged;
Int	li_nil, li_mp

SetNull( li_nil )

li_mp = f_Zero( This.Object.CodigoMP[ row] )
ib_saved = False

Choose Case dwo.Name
	Case 'codigo'
		
		String	ls_des, ls_cod, ls_nil, ls_fnd
		
		ls_cod = UpperTrim( data )
		This.Object.Descripcion[ row] = ''
		
		If ls_cod = '' Then
			Return
		End If
		
		ls_fnd = 'CodigoMP = ' + String( li_mp ) + ' And f_Trim( Codigo ) = "' + ls_cod + '" And Not GetRow() = ' + String( row )
		If dw_list.Find( ls_fnd ) > 0 Then
			blEclipse.Messagebox( Parent.Title, 'Código (Base) de Tipo de Contrato ya está ingresado para el Producto M' + String( li_mp )+ '.', Exclamation! )
			This.Object.Codigo[ row] = ls_nil
			Return 1
		End If
		
		SetNull( ls_nil )
		Select	Descripcion
		Into		:ls_des
		From		tipo_contrato tco
		Where		tco.codigo = :ls_cod ;
		
		ls_des = f_WordCap( f_Trim( ls_des ) )
		
		If ls_des = '' Then
			blEclipse.Messagebox( Parent.Title, 'Código (Base) de Tipo de Contrato no encontrado.', Exclamation! )
			This.Object.Codigo[ row] = ls_nil
			Return 1
		End If
		
		This.Object.Descripcion[ row] = ls_des
		This.AcceptText( )
		
	Case 'cod_parque', 'cod_producto'
		DataWindowChild	ldwc_x
		Integer	li_par
		String	ls_pro
		
		Choose Case dwo.Name
			Case 'cod_parque'
				li_par = Integer( data )
				ls_pro = This.Object.Cod_Producto[ row]
			Case 'cod_producto'
				li_par = Integer(This.Object.Cod_Parque[ row])
				ls_pro = UpperTrim( data )
		End Choose
		
		This.GetChild( 'Area', ldwc_x )
		ldwc_x.SetTransObject( Sqlca )
		ldwc_x.Retrieve( li_Par, ls_pro )
		If ldwc_x.Rowcount( ) = 0 Then
			ldwc_x.Insertrow( 0 )
		End If

		AcceptText( )
		
	Case 'precio'
		Dec	ldc_pre, ldc_iva
		String	ls_bas
		
		ls_bas = UpperTrim( This.Object.Codigo[ row] )
		ldc_pre = Dec( data )
		SetNull( li_nil )
		
		Choose Case ls_bas
			Case 'A', 'O', 'U'
					ldc_iva = 0
			Case 'L', 'F', 'G'
			ldc_iva = ldc_pre * ii_IVA / 100
		End Choose
		
		This.Object.IVA[ row] = ldc_iva
		If ldc_pre = 0 Then
			This.Object.PorcentajePie[ row] = li_nil
			This.Object.Pie[ row] = li_nil
			This.Object.IVA[ row] = li_nil
			This.Object.Total[ row] = li_nil
		End If
		wf_CalcMP( row )
		
	Case 'iva'
		wf_CalcMP( row )
		
	Case 'total'
		wf_CalcMP( row )
		
	Case 'porcentajepie'
		Dec		ldc_por, ldc_precio 
		Integer	i
		
		ldc_por = f_Zero( Dec( f_Trim( data ) ) )
		li_mp = f_Zero( This.Object.CodigoMP[ row] )
		
		For i = 1 To RowCount( )
			If Not li_mp = f_Zero( This.Object.CodigoMP[ i] ) Then Continue
			
			ldc_precio = f_Zero( This.Object.Precio[ i] )
			This.Object.PorcentajePie[ i] = ldc_por
			This.Object.Pie[ i] = ldc_precio * ( ldc_por / 100 )
			wf_CalcMP( row )
		
		Next
		
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

event dw_list::editchanged;call super::editchanged;
ib_saved = False
end event

