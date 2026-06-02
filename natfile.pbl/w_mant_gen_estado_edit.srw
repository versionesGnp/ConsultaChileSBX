//objectcomments /* Autor: César Vilela */
forward
global type w_mant_gen_estado_edit from w_gen_document_mant_edit
end type
end forward

global type w_mant_gen_estado_edit from w_gen_document_mant_edit
string title = "Estados (Entidades)"
end type
global w_mant_gen_estado_edit w_mant_gen_estado_edit

type variables


end variables

forward prototypes
public function boolean wf_gencod (boolean ab_valida)
public function boolean wf_validareg ()
public function boolean wf_checkactioni ()
public function boolean wf_checkactionm ()
public function integer wf_postupdate ()
end prototypes

public function boolean wf_gencod (boolean ab_valida);/* wf_GenCod( ab_valida ) */
String	ls_cod, ls_new, ls_pai


dw_1.AcceptText( )

ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] )

Select	Max( c_codigo_edo )
Into 		:ls_new
From		genestado 
Where		c_codigo_pai = :ls_pai 
Using		SqlCa ;

If f_SqlError( SqlCa, 'No se pudo obtener información de la tabla genestado (Max)' ) =-1 Then
	Return False
End If

ls_new = f_Trim( ls_new )
ls_new = String( Integer( ls_new ) + 1, '00' )	

dw_1.Object.c_codigo_edo[ 1] = ls_new 

Return True
end function

public function boolean wf_validareg ();String	ls_cod, ls_new, ls_nom, ls_pai, ls_edo


dw_1.AcceptText( )
ls_cod = f_Trim( dw_1.Object.c_codigo_edo[ 1] )

/* Validamos que campos mandatorios esten ingresados */

ls_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] )
If ls_pai = '' Then
	MessageBox( Title, 'Debe seleccionar el País.', Exclamation! )
	Return False
End If

/* Nombre */
ls_nom = f_Trim( dw_1.Object.v_nombre[ 1] ) 
If ls_nom = '' Then
	MessageBox( Title, 'Debe ingresar nombre/descripción.', Exclamation! )
	Return False
End If

Select	c_codigo_edo
Into		:ls_edo
From		genEstado
Where		c_codigo_pai = :ls_pai
And		Not c_codigo_edo = :ls_cod
And		v_nombre_edo = :ls_nom
Using		SqlCa ;

ls_edo = f_Trim( ls_edo )

If Not ls_edo = '' Then
	MessageBox( Title, 'Nombre de Estado ya existe para el código ' + ls_edo + '.', Exclamation! )
	Return False
End If

If istr_parm.s_cad[ 1] = 'I' Then	/* insertar */
	/* validamos que el codigo ingresado no exista */
	If Not wf_GenCod( True ) Then
		Return False
	End If
	
	dw_1.AcceptText( )
	ls_new = dw_1.Object.c_codigo_pai[ 1] + &
				dw_1.Object.c_codigo_edo[ 1] 
	dw_1.Object.c_codigo[ 1] = ls_new
	
End If

Return True
end function

public function boolean wf_checkactioni ();
String	ls_pai


If is_pai = '' Then
	ls_pai = f_GenPais( gs_emp )
Else
	ls_pai = is_pai
End If

dw_1.Object.c_codigo_pai[ dw_1.GetRow()] = ls_pai

f_ColEnabled( dw_1, 'c_codigo_pai', True )
f_ColEnabled( dw_1, 'c_codigo_edo', False )

Super::wf_CheckActionI()

Return True
end function

public function boolean wf_checkactionm ();
f_ColEnabled( dw_1, 'c_codigo_pai', False )
f_ColEnabled( dw_1, 'c_codigo_edo', False )

Return True
end function

public function integer wf_postupdate ();
is_pai = f_Trim( dw_1.Object.c_codigo_pai[ 1] )

Return 1
end function

on w_mant_gen_estado_edit.create
call super::create
end on

on w_mant_gen_estado_edit.destroy
call super::destroy
end on

type dw_1 from w_gen_document_mant_edit`dw_1 within w_mant_gen_estado_edit
string dataobject = "d_mant_gen_estado_edit"
end type

event dw_1::itemchanged;call super::itemchanged;
Choose Case dwo.Name
	Case 'c_codigo_pai'
		wf_GenCod( True )
		
End Choose
end event

type dw_menu from w_gen_document_mant_edit`dw_menu within w_mant_gen_estado_edit
end type

