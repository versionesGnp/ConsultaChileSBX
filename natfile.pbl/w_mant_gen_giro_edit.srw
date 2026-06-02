//objectcomments Autor: César Vilela~r~nGiro y Actividad Económica
forward
global type w_mant_gen_giro_edit from w_gen_document_mant_edit
end type
end forward

global type w_mant_gen_giro_edit from w_gen_document_mant_edit
integer height = 1840
string title = "Giro y Actividad Económica"
boolean ib_retxemp = true
end type
global w_mant_gen_giro_edit w_mant_gen_giro_edit

type variables

String is_niv = '1', is_dep

end variables

forward prototypes
public function boolean wf_gencod (boolean ab_valida)
public function boolean wf_validareg ()
public function boolean wf_checkactioni ()
public function boolean wf_postopen ()
public function integer wf_postupdate ()
public function boolean wf_checkactionm ()
end prototypes

public function boolean wf_gencod (boolean ab_valida);/* wf_GenCod( ab_valida ) */

Return True

end function

public function boolean wf_validareg ();String	ls_cod, ls_newcod, ls_msg, ls_niv, ls_dep, ls_nom, ls_gir, ls_pai


dw_1.AcceptText( )
ls_cod = f_trim( dw_1.Object.c_codigo[ 1])

If istr_parm.s_cad[ 1] = 'I' Then	/* insertar */
	/* validamos que el codigo ingresado no exista */
	If Not wf_GenCod( True ) Then
		Return False
	End If
End If

/* Validamos que campos mandatorios esten ingresados */
ls_nom = f_Trim( dw_1.Object.v_nombre[ 1] ) 
If ls_nom = '' Then
	dw_1.SetColumn( 'v_nombre' )
	MessageBox( Title, 'Debe ingresar nombre/descripción.', Exclamation!)
	Return False
End If

ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] ) 

If ls_pai = '' Then
	dw_1.SetColumn( 'c_codigo_pai' )
	MessageBox( Title, 'Debe seleccionar el País.', Exclamation!)
	Return False
End If

ls_niv = f_Trim( dw_1.Object.c_nivel_gir[ 1] ) 
ls_dep = f_Trim( dw_1.Object.c_depende_gir[ 1] ) 

If ls_niv = '' Then
	dw_1.SetColumn( 'c_nivel_gir' )
	MessageBox( Title, 'Debe seleccionar el Nivel Giro o Actividad Económica.', Exclamation!)
	Return False
End If

If ls_niv = '2' And ls_dep = '' Then
	dw_1.SetColumn( 'c_depende_gir' )
	MessageBox( Title, 'Debe ingresar o seleccionar la dependecia (Clasificación) para el Nivel 2.', Exclamation!)
	Return False
End If

ls_nom = Upper( ls_nom )

If ls_niv = '2' Then
	Select c_codigo_gir
	Into	:ls_gir
	From	genGiro
	Where c_codigo_pai = :ls_pai
	And   Upper( v_nombre_gir ) = :ls_nom
	And	Not c_codigo_gir = :ls_cod
	And	c_depende_gir = :ls_dep
	And	c_nivel_gir = '2'
	Using SqlCa ;
Else
	Select c_codigo_gir
	Into	:ls_gir
	From	genGiro
	Where c_codigo_pai = :ls_pai
	And   Upper( v_nombre_gir ) = :ls_nom
	And	Not c_codigo_gir = :ls_cod
	And	c_nivel_gir = '1'
	Using SqlCa ;
End If

ls_gir = f_Trim( ls_gir )
If Not ls_gir = '' And ls_niv = '1' Then
	dw_1.SetColumn( 'v_nombre' )
	MessageBox( Title, 'Nombre del Giro/Rubro ya existe para el código ' + ls_gir + '.', Exclamation!)
	Return False
End If

If Not ls_gir = '' And ls_niv = '2' Then
	dw_1.SetColumn( 'v_nombre' )
	MessageBox( Title, 'Nombre del Giro/Actividad ya existe para el código ' + ls_gir + '.', Exclamation!)
	Return False
End If

ls_nom = f_WordCap( f_Trim( dw_1.Object.v_nombre[ 1] ) )
dw_1.Object.v_nombre[ 1] = ls_nom  

Return True
end function

public function boolean wf_checkactioni ();
String	ls_pai

ls_pai = f_GenPais( gs_emp )

dw_1.Object.c_codigo_emp[ dw_1.GetRow()] = gs_emp
dw_1.Object.c_codigo_pai[ dw_1.GetRow()] = ls_pai
dw_1.Object.c_nivel_gir[ dw_1.GetRow()] = is_niv
dw_1.Object.c_depende_gir[ dw_1.GetRow()] = is_dep

f_ColEnabled( dw_1, 'c_depende_gir', ( is_niv = '2' ) )

Super :: wf_CheckActionI( )

dw_1.SetColumn( 'c_codigo' )

Return True
end function

public function boolean wf_postopen ();
DataWindowChild ldwc_x
String	ls_pai, ls_niv


f_ColEnabled( dw_1, 'c_codigo_pai', False )
f_ColEnabled( dw_1, 'v_depende', False )

ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ dw_1.GetRow( )] )
ls_niv = f_Trim( dw_1.Object.c_nivel_gir[ dw_1.GetRow( )] )

dw_1.GetChild( 'c_depende_gir', ldwc_x )
ldwc_x.SetTransObject( SqlCa )
ldwc_x.Retrieve( ls_pai )

ldwc_x.InsertRow( 1 )
ldwc_x.SetItem( 1, 'c_codigo_gir', '' )
ldwc_x.SetItem( 1, 'c_codigo_pai', ls_pai )
If ls_niv = '1' Then
	ldwc_x.SetItem( 1, 'v_nombre_gir', '' )
Else
	ldwc_x.SetItem( 1, 'v_nombre_gir', '- Seleccionar Giro/Rubro (Depende)-' )
End If

Return True
end function

public function integer wf_postupdate ();
If is_niv = '1' Then is_niv = '2'

If is_niv = '1' Then
	is_dep = dw_1.Object.c_codigo[ dw_1.GetRow()] 
Else
	is_dep = dw_1.Object.c_depende_gir[ dw_1.GetRow()] 
End If

Return 1
end function

public function boolean wf_checkactionm ();
String ls_niv

ls_niv = f_Trim( dw_1.Object.c_nivel_gir[ dw_1.GetRow()] )

f_ColEnabled( dw_1, 'c_codigo', False )
f_ColEnabled( dw_1, 'c_depende_gir', ( ls_niv = '2' ) )

Return True

end function

on w_mant_gen_giro_edit.create
call super::create
end on

on w_mant_gen_giro_edit.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant_edit`dw_1 within w_mant_gen_giro_edit
integer height = 1384
string dataobject = "d_mant_gen_giro_edit"
end type

event dw_1::itemchanged;call super::itemchanged;
DataWindowChild	ldwc_x
String ls_null, ls_nom, ls_pai


SetNull( ls_null )

ls_pai = f_Trim( This.Object.c_codigo_pai[ row] )

Choose Case dwo.Name
	Case 'c_codigo'
		ls_nom = f_GetGenericaxEmp( gs_emp, data, 'GIR'  )
		
		If Not ls_nom = '' Then
			MessageBox( Parent.Title, 'Código ya existe para el Giro ' + ls_nom + '.', Exclamation! )
			This.Object.c_codigo[ row] = '' 
			Return 1
		End If
		
	Case 'c_codigo_pai'
		ls_pai = f_Trim( data )

		This.Object.c_depende_gir[ row] = '' 
		This.GetChild( 'c_depende_gir', ldwc_x ) 
		ldwc_x.SetTransObject( SqlCa )
		ldwc_x.Retrieve( ls_pai )
		
	Case 'c_nivel_gir'
		dw_1.GetChild( 'c_depende_gir', ldwc_x )
		
		If data = '1' Then
			This.Object.c_depende_gir[ row] = ls_null
			ldwc_x.SetItem( 1, 'v_nombre_gir', '' )
		Else
			This.Object.c_depende_gir[ row] = is_dep
			ldwc_x.SetItem( 1, 'v_nombre_gir', '- Seleccionar Giro/Rubro (Depende)-' )
		End If
		f_ColEnabled( This, 'c_depende_gir', ( data='2' ) )
		
	Case 'c_depende_gir'
		
		data = f_Trim( data )
		If data = '' Then Return 0
		
		ls_nom = f_GetGenericaxEmp( gs_emp, data, 'GIR' )
		
		If ls_nom = '' Then
			MessageBox( Parent.Title, 'Código de Dependencia no existe.', Exclamation! )
			Return 1
		End If
		
		is_dep = data
		
End Choose
end event

event dw_1::itemerror;call super::itemerror;
Return 1
end event

type dw_menu from w_gen_document_mant_edit`dw_menu within w_mant_gen_giro_edit
end type

