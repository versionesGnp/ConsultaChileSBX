//objectcomments /* Autor: César Vilela ~r~n    Función: Edición datos de expresa~r~n    Recomendación: No Modificarr - Consultar Experto~r~n*/
forward
global type w_arch_ecli_configura_empresa_edit from w_gen_document_mant_edit
end type
end forward

global type w_arch_ecli_configura_empresa_edit from w_gen_document_mant_edit
integer width = 3259
integer height = 3084
string title = "Empresa"
boolean center = false
event postopen ( )
end type
global w_arch_ecli_configura_empresa_edit w_arch_ecli_configura_empresa_edit

type variables
String	is_rfcText
end variables

forward prototypes
public function boolean wf_gencod (boolean ab_valida)
public function boolean wf_validareg ()
public function boolean wf_checkactionm ()
public subroutine wf_configuraxpais (string as_pai)
public function boolean wf_postopen ()
end prototypes

event postopen;call super::postopen;
DataWindowChild	ldwc_x
String	ls_emp, ls_pai, ls_rub, ls_gir

dw_1.SetRedraw( False )
If dw_1.GetRow() > 0 Then
	ls_emp = f_Trim( dw_1.Object.c_codigo[ dw_1.GetRow()] )
	ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ dw_1.GetRow()] )
	is_pai = ls_pai
	ls_rub = f_Trim( dw_1.Object.c_depende_gir[ dw_1.GetRow()] )
	ls_gir = f_Trim( dw_1.Object.c_codigo_gir[ dw_1.GetRow()] )
End If
is_rfcText = 'RFC'

wf_ConfiguraxPais( ls_pai )

dw_1.GetChild( 'c_codigo_pai', ldwc_x ) 
ldwc_x.InsertRow( 1 )
ldwc_x.SetItem( 1, 'c_codigo_pai', '' )
ldwc_x.SetItem( 1, 'v_nombre_pai', '- Seleccionar País -' )

f_GenGetChildFilter( dw_1, 'c_codigo_tem', ls_emp, 'TEM', '- Seleccionar Temporada -' )

dw_1.GetChild( 'c_depende_gir', ldwc_x )
ldwc_x.SetTransObject( SqlCa )
ldwc_x.Retrieve( ls_pai )

ldwc_x.InsertRow( 1 )
ldwc_x.SetItem( 1, 'c_codigo_gir', '' )
ldwc_x.SetItem( 1, 'c_codigo_pai', ls_pai )
ldwc_x.SetItem( 1, 'v_nombre_gir', '- Seleccionar Giro/Rubro -' )

dw_1.Event ItemChanged ( dw_1.GetRow(), dw_1.Object.c_depende_gir, ls_rub )
dw_1.Object.c_codigo_gir[ dw_1.GetRow()] = ls_gir 
dw_1.AcceptText( )
dw_1.SetRedraw( True )

Return
end event

public function boolean wf_gencod (boolean ab_valida);/* wf_GenCod( ab_valida ) */
Integer	li_limit
String	ls_cod, ls_new


dw_1.AcceptText( )

ls_cod = f_Trim( dw_1.Object.c_codigo[ 1])
li_limit = Integer( dw_1.Object.c_codigo.edit.limit )

/* validamos que el codigo ingresado no exista */
If ls_cod <> '' Then
	ls_cod = f_Trim( ls_cod )
	ls_cod = Right( Fill( '0', li_limit) + f_Trim( ls_cod ), li_limit )
	dw_1.Object.c_codigo[ 1] = ls_cod 
	Select	v_nombre_emp
	Into 		:ls_new
	From		genempresa
	Where		c_codigo_emp = :ls_cod ;
	If f_SqlError( SqlCa, 'No se pudo obtener información de la tabla genempresa (Where)' ) =-1 Then
		Return False
	End If
	If f_Trim( ls_new ) <> '' Then
		ls_cod = ''
		MessageBox( Title, 'Código ingresado ya existe.~n~rPertenece a ' + ls_new + &
								'~r~n~r~nEl sistema generará el código.', Exclamation!)
	End If
Else
	If ab_valida Then
		/* El mensaje sólo debe mostrarse cuando está en modo validación */
		MessageBox( Title, 'Debe ingresar el código.' + '~r~n~r~nEl sistema generará el código.', Exclamation!)
	End If
End If
If ls_cod = '' Then
	ls_new = ''
	Select	Convert( Varchar(3), Max( Convert( numeric, c_codigo_emp ) ) )
	Into 		:ls_new
	From		genempresa ;
	If f_SqlError( SqlCa, 'No se pudo obtener información de la tabla genempresa (Max)' ) =-1 Then
		Return False
	End If
	ls_new = f_Trim( ls_new )
	ls_new = Right( Fill( '0', li_limit) + f_Trim( String( Integer( ls_new ) + 1 )), li_limit )
	dw_1.Object.c_codigo[ 1] = ls_new 
	Return False
End If

Return True
end function

public function boolean wf_validareg ();
Integer	li_exi
String	ls_cod, ls_newcod, ls_nom, ls_rfc, ls_pai, ls_edo, ls_loc, &
			ls_dom, ls_rub, ls_gir, &
			ls_msg, ls_col

dw_1.AcceptText( )
ls_cod = f_trim( dw_1.Object.c_codigo[ 1])

If istr_parm.s_cad[ 1] = 'I' Then	/* insertar */
	/* validamos que el codigo ingresado no exista */
	If Not wf_GenCod( True) Then
		Return False
	End If
End If

/* Validamos que campos mandatorios esten ingresados */
/* Descripcion */
ls_nom = f_Trim( dw_1.Object.v_nombre[ 1] ) 
ls_rfc = f_Trim( dw_1.Object.c_rfc_emp[ 1] ) 
ls_dom = f_Trim( dw_1.Object.v_calle_emp[ 1] )
ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] ) 
ls_edo = f_Trim( dw_1.Object.c_codigo_edo[ 1] )
ls_loc = f_Trim( dw_1.Object.c_codigo_loc[ 1] )
ls_rub = f_Trim( dw_1.Object.c_depende_gir[ 1] )
ls_gir = f_Trim( dw_1.Object.c_codigo_gir[ 1] )

If ls_nom = '' Then
	ls_msg = 'Debe ingresar el nombre de la Empresa.'
	ls_col = 'v_nombre'
ElseIf ls_pai = '' Then
	ls_msg = 'Debe seleccionar el País.'
	ls_col = 'c_codigo_pai'
ElseIf ls_edo = '' Then
	ls_msg = 'Debe seleccionar el Estado del País.'
	ls_col = 'c_codigo_edo'
ElseIf ls_loc = '' Then
	ls_msg = 'Debe seleccionar ls Ciudad del País.'
	ls_col = 'c_codigo_loc'
ElseIf ls_pai = 'CL' Then
	If ls_rub = '' Then
		ls_msg = 'Debe seleccionar el Rubro de la Actividad Económica.'
		ls_col = 'c_depende_gir'
	ElseIf ls_gir = '' Then
		ls_msg = 'Debe seleccionar el Giro de la Actividad Económica.'
		ls_col = 'c_codigo_gir'
	End If
End If

If Not ls_msg = '' Then
	MessageBox( Title, ls_msg, Exclamation!)
	dw_1.SetColumn( ls_col )
	Return False
End If


If ls_rfc = '' Then
	dw_1.SetColumn( 'c_rfc_emp' )
	MessageBox( Title, 'Debe ingresar el ' + is_rfcText + ' de la Empresa.', Exclamation!)
	Return False
End If

If Not ls_rfc = '' Then
	Choose Case ls_pai
		Case 'CL' 
			If Not f_GenValidaRut( ls_rfc ) Then
				dw_1.SetColumn( 'c_rfc_emp' )
				MessageBox( Title, 'Debe ingresar un ' + is_rfcText + ' válido para la Empresa.', Exclamation!)
				Return False
			End If
	End Choose
End If

Select	Top 1 1
Into		:li_exi
From		genTemporada
Where		c_codigo_emp = :ls_cod
using		SqlCa ;

li_exi = f_Zero( li_exi )

If li_exi > 0 Then
	If f_Trim( dw_1.Object.c_codigo_tem[ 1] ) = '' Then
		dw_1.SetColumn( 'c_codigo_tem' )
		MessageBox( Title, 'Debe seleccionar la Temporada para la Empresa.', Exclamation!)
		Return False
	End If
Else
	MessageBox( Title, 'Después de configurar la Empresa deberá crear la Temporada para la Empresa y continuar configurando.', Exclamation!)
End If

If f_Trim( dw_1.Object.v_etiquetaclase_emp[ 1] ) = '' Then
	dw_1.SetColumn( 'v_etiquetaclase_emp' )
	MessageBox( Title, 'Debe ingresar la Etiqueta Clase Principal (Producción) para Centros de Costo.', Exclamation!)
	Return False
End If

Return True
end function

public function boolean wf_checkactionm ();
f_ColEnabled( dw_1, 'c_codigo', False )

Return True
end function

public subroutine wf_configuraxpais (string as_pai);/* wf_ConfiguraxPais( as_pai ) 
	Muestra las etiquetas y otras configuraciones según el país activo o seleccionado
*/

Choose Case as_pai
	Case 'CL' 
		is_rfcText = 'RUT'
		dw_1.Object.c_rfc_emp_t.Text = is_rfcText
		dw_1.Object.v_estado_emp_t.Text = 'Región'
		dw_1.Object.v_municipio_emp_t.Text = 'Ciudad'
		dw_1.Object.v_colonia_emp_t.Text = 'Comuna'
		f_genEditMask( dw_1, 'c_rfc_emp', as_pai, 'ID' )
		
	Case 'MEX' 
		is_rfcText = 'RFC'
		dw_1.Object.c_rfc_emp_t.Text = is_rfcText
		dw_1.Object.v_estado_emp_t.Text = 'Estado'
		dw_1.Object.v_municipio_emp_t.Text = 'Municipio'
		dw_1.Object.v_colonia_emp_t.Text = 'Colonia'
		f_genEditMask( dw_1, 'c_rfc_emp', as_pai, 'ID' )
		
End Choose
end subroutine

public function boolean wf_postopen ();
DataWindowChild	ldwc_x
Integer	li_exi
String	ls_pai, ls_edo, ls_rub

ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] )


f_genEditMask( dw_1, 'c_rfc_emp', ls_pai, 'ID' )

dw_1.Object.c_rfc_emp_t.Text = f_GenConfiguraxPais( ls_pai, 'ID' ) + ':'

If Not istr_parm.s_cad[ 1] = 'I' Then	/* insertar */
	dw_1.GetChild( 'c_depende_gir', ldwc_x ) 
	ldwc_x.SetTransObject( SqlCa )
	ldwc_x.Retrieve( ls_pai )

	ls_rub = f_Trim( dw_1.Object.c_depende_gir[ 1] )
	dw_1.GetChild( 'c_codigo_gir', ldwc_x ) 
	ldwc_x.SetTransObject( SqlCa )
	ldwc_x.Retrieve( ls_pai, ls_rub )

	ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] )
	ls_edo = f_Trim( dw_1.Object.c_codigo_edo[ 1] )
	
	dw_1.GetChild( 'c_codigo_edo', ldwc_x )
	ldwc_x.SetTransObject( SqlCa )
	ldwc_x.Retrieve( ls_pai )
	
	dw_1.GetChild( 'c_codigo_loc', ldwc_x )
	ldwc_x.SetTransObject( SqlCa )
	ldwc_x.Retrieve( ls_pai, ls_edo )

End If

Return True
end function

on w_arch_ecli_configura_empresa_edit.create
call super::create
end on

on w_arch_ecli_configura_empresa_edit.destroy
call super::destroy
end on

event open;call super::open;
//PostEvent( 'PostOpen' )
//Return

end event

type dw_1 from w_gen_document_mant_edit`dw_1 within w_arch_ecli_configura_empresa_edit
integer width = 2405
integer height = 2732
string dataobject = "d_arch_ecli_configura_empresa_edit"
boolean vscrollbar = true
end type

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
String	ls_pai, ls_edo, ls_rub


ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ dw_1.GetRow()] )
ls_edo = f_Trim( dw_1.Object.c_codigo_edo[ dw_1.GetRow()] )
ls_rub = f_Trim( dw_1.Object.c_depende_gir[ dw_1.GetRow()] )

Choose Case dwo.Name
	Case 'c_codigo_pai'
		ls_pai = f_Trim( data )

		This.Object.c_depende_gir[ row] = '' 
		This.Object.c_codigo_gir[ row] = '' 
		
		This.GetChild( 'c_depende_gir', ldwc_x ) 
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Retrieve( ls_pai )
		
		ldwc_x.InsertRow( 1 )
		ldwc_x.SetItem( 1, 'c_codigo_gir', '' )
		ldwc_x.SetItem( 1, 'c_codigo_pai', ls_pai )
		ldwc_x.SetItem( 1, 'v_nombre_gir', '- Seleccionar Giro/Rubro -' )
		
		f_ColEnabled( This, 'c_codigo_gir', False )
		This.Event ItemChanged ( row, This.Object.c_depende_gir, '' )
		
		wf_ConfiguraxPais( ls_pai ) 
		
		This.GetChild( 'c_codigo_edo', ldwc_x )
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Retrieve( data )
		ldwc_x.InsertRow(1)
		ldwc_x.SetItem( 1, 'c_codigo_pai', ls_pai )
		ldwc_x.SetItem( 1, 'c_codigo_edo', '' )
		ldwc_x.SetItem( 1, 'v_nombre_edo', '- Seleccione Estado -' )		
		
		This.Object.c_codigo_edo[ 1] = '' 
		This.Event ItemChanged( row, This.Object.c_codigo_edo, '' )
		
	Case 'c_codigo_edo'
		This.Object.c_codigo_loc[ 1] = '' 
		This.GetChild( 'c_codigo_loc', ldwc_x )
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Retrieve( ls_pai, data )
		ldwc_x.InsertRow(1)
		ldwc_x.SetItem( 1, 'c_codigo_pai', ls_pai )
		ldwc_x.SetItem( 1, 'c_codigo_edo', ls_edo )
		ldwc_x.SetItem( 1, 'c_codigo_loc', '' )
		ldwc_x.SetItem( 1, 'v_nombre_loc', '- Seleccione Ciudad -' )

	Case 'c_depende_gir'
		ls_rub = f_Trim( data )
		f_ColEnabled( This, 'c_codigo_gir', ( Not ls_rub = '' ) )
		This.Object.c_codigo_gir[ row] = '' 
		This.GetChild( 'c_codigo_gir', ldwc_x ) 
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Retrieve( ls_pai, ls_rub )
		
		ldwc_x.InsertRow( 1 )
		ldwc_x.SetItem( 1, 'c_codigo_gir', '' )
		ldwc_x.SetItem( 1, 'c_codigo_pai', ls_pai )
		ldwc_x.SetItem( 1, 'c_depende_gir', ls_rub )
		ldwc_x.SetItem( 1, 'v_nombre_gir', '- Seleccionar Giro/Actividad -' )
		
End Choose
end event

type dw_menu from w_gen_document_mant_edit`dw_menu within w_arch_ecli_configura_empresa_edit
end type

